Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30992.1794845354804845014
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 08:09:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=x62nqn6N;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 28EF21A169F
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:09:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EAC1D6023F
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:09:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 375C211BC146D;
	Mon, 16 Nov 2026 17:09:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794845352; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ryEfwLen0B/rVC6M1HewAeLDnPzdGYMrzQRUfP4UTIs=;
	b=x62nqn6N9z6tNmJ70wBOwsHGfZM4omQyq0fTfOwJbycyycM8GdwbR1GoBNXU9fWfKAAgvj
	UaIq+p5FM9IP9mvFFKxM45g1T2t1W/ZS8vHW0zMRuzBxsqhqjwGxADe7cVaTP7Wv6uIStJ
	goLZhF5Y+S/vz9BFzNjvRIUHIQEOiw9loENAhKXV5218pE90rULxwvGirsxeAPLwy7G8uc
	V9TkabVsbZwbQLotZVYV/jdgk88Dh1aAL2dfcbS8z+gR/wWWqy1h1Xp3Jdn0vSQqM5G/uy
	yGuA7Jgs4c8Mwh2TzFQfci0E9qHaBdgqXc0+Dyc5U51L4UxRRH2tOVCAPLWnvg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 16 Nov 2026 17:09:01 +0100
Subject: [PATCH 03/13] lib/oe/utils: simplify str_filter*() signatures
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-oe-lib-docstrings-v1-3-0c894f6a1064@bootlin.com>
References: <20261116-oe-lib-docstrings-v1-0-0c894f6a1064@bootlin.com>
In-Reply-To: <20261116-oe-lib-docstrings-v1-0-0c894f6a1064@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Antonin Godard <antonin.godard@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=800;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=/ZSj1SvhnKiO8WCpuTuwHTmmhLETnM5GIMmCoRXN01U=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq+yqew7sqb1Lx1gVXVoeHgcVscwslWxaehTEpk
 LGOrpa4p2iJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCavsqngAKCRDRgEFAKaOo
 No77EACPe/ky9gDPrbLlJ21iAEsG1jYVrx8uvJ0WGPPnBcQ4pTYgCyoRNvmRwmvZvS8ZBAvqbHN
 UE1XIE0Kqb2KeaJc9Eg/xZGdJ4HJBwO206TBrwN8KOhYat17aIe2o7hkq3acYJUPzaCgwvbhgPW
 TOJ3mswZB2cj5MTAKVu1B9+pSNAeBt420v/e26tt6FN5KLK3fPy9X9rrvj8y8KIpyrmXLOUVdCI
 sYbAANQ5cVNG/VA4WC7QKvqp8663sN7TZ75ndMhmk1ZOpoORXK4gGX8DFiDyVjLwBfLm5ARmYAK
 0O+u1P0Ag0D9DaLuRWMwIBcoqeoBNqAJaVcfYVPVti3QEHHJiHLxdrb4ECpbuA85Zq5QWqAIcLN
 +f0inPEDyL3Sk3y9rpUdqFc3pvMSNJxtxxPL9n59jT3OhipJmeGDK2UAf9WHW0CkS5E2ovCDZKp
 x0JFeQ7PIv0l0sO8TFhmN6yOKzfMd+73OQFNI/fg39mp8TV29txqOR/tIAkT4CElbHosUMUu0NR
 2yEwOeyDvbR/K8MiPW9Lo1uhd8uQ7tIZGX/4leRK4KJpisQDWtZVfcjrnO5zQ47AgnN5AwVOmXP
 Ht0VhZEEgbpKMCkONZhB5Z3PDMAhYWjB0f3NmT3E8Qy7kZGlqGIVcoJRpjUObQVQ5N7AjmUFtut
 ffMafiq3pohjSrw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:09:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250353

In the str_filter*() functions, the datastore (d) argument is never
used. Remove it.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 meta/lib/oe/utils.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 66f6323add..5d4f4056f7 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -132,11 +132,11 @@ def prune_suffix(var, suffixes, d):
 
     return var
 
-def str_filter(f, str, d):
+def str_filter(f, str):
     from re import match
     return " ".join([x for x in str.split() if match(f, x, 0)])
 
-def str_filter_out(f, str, d):
+def str_filter_out(f, str):
     from re import match
     return " ".join([x for x in str.split() if not match(f, x, 0)])
 

-- 
2.56.0

