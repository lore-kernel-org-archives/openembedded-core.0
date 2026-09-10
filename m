Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE13DC88E42
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 11:04:31 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11272.1789038268620216678
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 04:04:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=rsDADbIC;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4663DC2C672
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 11:05:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F2602602B8
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 11:04:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0E97E11C7942F;
	Thu, 10 Sep 2026 13:04:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789038262; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iAuV27v0qwkYGhyoP05pDeWAksZt/UxRC/kL4Zd18Q8=;
	b=rsDADbICZ6UoSLuf9YpKGscGwst3GTe0N9807Nt5fvXLuWJqXwlbIC7IHp6EmKrWKolMjF
	wLgJMqT5s9cdhNHptBhmas1bVaSpJQy/81qpXToN02IzYbm77ogxGyu8iYtsrt3l0ECq+F
	mX7lIFVRdfeZmZNeqrd3qhsfp1xsjfK3oPVQk08LZeCBo0uBiHbai8yn4dfkmW/b68qEj0
	MlUC5aN6bWw9RB5lJfF2mogDNjy8QSsJdP3kKkQWpiGg6zfwPPQPU6XZrZFyA4iYy6szKR
	dSW3e55tac7wUCKXe9EtzwkDgOGyfzIu1tRMppCzzCisCtBk9vCXZMztIq18Tw==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Thu, 10 Sep 2026 13:03:57 +0200
Subject: [PATCH 4/7] python3-hypothesis: upgrade 6.167.0 -> 6.168.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20260910-mathieu-updates-2026-09-10-v1-4-da1b555eace9@bootlin.com>
References: <20260910-mathieu-updates-2026-09-10-v1-0-da1b555eace9@bootlin.com>
In-Reply-To: <20260910-mathieu-updates-2026-09-10-v1-0-da1b555eace9@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789038241; l=1625;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=pk68c11ejw4ux2xUADqPxOxHqVcMHWW9upMvNJVRD+w=;
 b=ksqKeBvgRg5rx7EMorRI28Al3c4kxENJ4x7EQY22dW0rZaBng9ck/xqUnV3JHjK0/pqNlipDf
 164b86rLWUxA7T1jMvRK8WoXk3oY0gfR3SFNAJu+4qg7m1eMQTQZxpg
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 11:04:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245554

Changelog:
- datetimes() now generates =E2=80=9Ctricky=E2=80=9D datetimes more often=
: values on or
  near daylight-saving and other utc-offset transitions of the drawn
  timezone - including imaginary wall times, and ambiguous ones with
  each value of fold - as well as times adjacent to leap seconds and to
  well-known datetimes like the millennium and the end of the signed
  32-bit Unix epoch.
- This release also fixes some rare internal errors, where an error
  raised partway through updating an internal cache - for example by a
  deeply recursive strategy raising RecursionError - could leave that
  cache corrupted.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../{python3-hypothesis_6.167.0.bb =3D> python3-hypothesis_6.168.0.bb}  =
  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.167.0.bb b=
/meta/recipes-devtools/python/python3-hypothesis_6.168.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.167.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.168.0.bb
index 075a6edca451..ec75251e705f 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.167.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.168.0.bb
@@ -16,7 +16,7 @@ SRC_URI +=3D " \
     file://test_rle.py \
     "
=20
-SRC_URI[sha256sum] =3D "23a60707a2bc5e0c59ef95e94264c4e8fd1c54b4ca1b95cb=
de74fb68b9c2eeef"
+SRC_URI[sha256sum] =3D "72af51087b7b5ab21c49f0d502f803c20897678652835596=
bd2a8b169a39135e"
=20
 RDEPENDS:${PN} +=3D " \
     python3-attrs \

--=20
2.47.3


