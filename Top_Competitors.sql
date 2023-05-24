SELECT
	hacker_id,
	name
FROM
	(SELECT
		s.hacker_id,
		h.name,
		COUNT(s.challenge_id)
	FROM
		submissions s
		JOIN challenges c ON s.challenge_id = c.challenge_id
		JOIN difficulty d ON c.difficulty_level = d.difficulty_level
		JOIN hackers h ON s.hacker_id = h.hacker_id
	WHERE s.score = d.score
	GROUP BY 1, 2
	HAVING COUNT(s.challenge_id) > 1
	ORDER BY 3 DESC, 1) temp
;