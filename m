Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB292CD4F25
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 21:49:30 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22381.1778795365067665925
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2026 14:49:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=mQ4xVLTE;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E82A24E42CA0
	for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 21:49:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A88295FE74
	for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 21:49:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8F7D911AF8483;
	Thu, 14 May 2026 23:49:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778795361; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=kPpehR6SSeffZZnDuHQl2g1eqEqNI9e+4U0HWYlEyUE=;
	b=mQ4xVLTEFanXS3M8XxIoLZVu7qVX3sKIz26VwlhA/FzHWjyBe2swB7yy0mMWLcnA1cE8o3
	wv7qa/HK16qLQekOOVd3i51yz1yw/NLVXOGPXW0zdD9kO1jkN8/8SRYEjflq2+sFOeKOpG
	mxAN+ICvxi/HJ3iCO87CDJwJTrSkiLEs3466T/Wn6AwfY2ciOiD15gy8Ndu213jTTJzq9n
	8q6zTsh3QryT8Nd1hOV3TYPeYgNHtSNjw5SQZvfkpV9AL3Sr+xkzr/VnXLYP6zwygKTgnp
	4bvN7WV4E3NsC/iLS//TuN+xY0PeQSzQQ7S6nzwKNdgSC+mPyN6gjuXKspVFhA==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH] nativesdk.bbclass: remove obsolete comment
Date: Thu, 14 May 2026 23:48:50 +0200
Message-ID: <20260514214850.276243-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 21:49:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237060

Instead of removing it, one could just uncomment the line. However,
the final value of HOST_SYS would then be the very same of HOST_SYS as
currently defined in bitbake.conf:

- bitbake.conf:
"${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}" -> HOST_SYS=3D"x86_64-oesdk-linux=
"

- nativesdk.bbclass:
"${HOST_ARCH}${TARGET_VENDOR}-${HOST_OS}" -> HOST_SYS=3D"x86_64-oesdk-lin=
ux"

That is because both TARGET_VENDOR and HOST_VENDOR equals SDK_VENDOR
in nativesdk.bbclass.

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta/classes-recipe/nativesdk.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes-recipe/nativesdk.bbclass b/meta/classes-recipe/=
nativesdk.bbclass
index 5b49affd53..68c492f8cb 100644
--- a/meta/classes-recipe/nativesdk.bbclass
+++ b/meta/classes-recipe/nativesdk.bbclass
@@ -48,7 +48,6 @@ HOST_PREFIX =3D "${SDK_PREFIX}"
 HOST_CC_ARCH =3D "${SDK_CC_ARCH}"
 HOST_LD_ARCH =3D "${SDK_LD_ARCH}"
 HOST_AS_ARCH =3D "${SDK_AS_ARCH}"
-#HOST_SYS =3D "${HOST_ARCH}${TARGET_VENDOR}-${HOST_OS}"
=20
 TARGET_ARCH =3D "${SDK_ARCH}"
 TARGET_VENDOR =3D "${SDK_VENDOR}"
--=20
2.47.0


