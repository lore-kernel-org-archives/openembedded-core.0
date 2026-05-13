Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 309D0CD37B6
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 08:58:30 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3317.1778662701398923059
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 01:58:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=ayf4flFu;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: thomas.perrot@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B4F8CC5DC4B
	for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 08:59:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3F464606CE
	for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 08:58:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 59EC411AF874F;
	Wed, 13 May 2026 10:58:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778662698; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=7KojBrvoBnshh3jHo7M2KdT8ZP/Zi03VZOtbvW5nPeY=;
	b=ayf4flFuUsgTpWt3Fvll5s+kmkEZQuj+v8tcvbmSZNTGrmyC65t4ssgMpNQR0xYMR94sB3
	UE+C2cNeUWxYna0DJPWW9stD+BY5AhtVhqfEKfDEmaP3E3OQwLC5L4gaNejri/47DpdGSc
	bcp5SgMpxRlxDeIKKeKp5nhSR74wCcITtQ9wIlBOvL66pCFxG8kyp14K9NXeH33oL1rvhR
	46ZUmWT+LYkYSjIOLcqjL2xdQ2BojFwMgdaFSbbVaH3zJCkP6gRtfs8va5eimmrXqnmV91
	o1x/zih1edzJjP/NunVg/Pgwjhu5BiM1PlXJ/FJnrSp65XYwE6dCDJf8TrUVXA==
From: thomas.perrot@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH] cve-check-map.conf: fix typo in comment
Date: Wed, 13 May 2026 10:55:59 +0200
Message-ID: <20260513085559.768118-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 08:58:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236950

From: Thomas Perrot <thomas.perrot@bootlin.com>

Fix a typo in the comment for the fixed-version status: "verion" -> "vers=
ion".

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 meta/conf/cve-check-map.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/cve-check-map.conf b/meta/conf/cve-check-map.conf
index fc49fe0a500c..2068c67caec4 100644
--- a/meta/conf/cve-check-map.conf
+++ b/meta/conf/cve-check-map.conf
@@ -6,7 +6,7 @@ CVE_CHECK_STATUSMAP[patched] =3D "Patched"
 CVE_CHECK_STATUSMAP[backported-patch] =3D "Patched"
 # use when NVD DB does not mention patched versions of stable/LTS branch=
es which have upstream CVE backports
 CVE_CHECK_STATUSMAP[cpe-stable-backport] =3D "Patched"
-# use when NVD DB does not mention correct version or does not mention a=
ny verion at all
+# use when NVD DB does not mention correct version or does not mention a=
ny version at all
 CVE_CHECK_STATUSMAP[fixed-version] =3D "Patched"
 # use when a fix file has been included (set automatically)
 CVE_CHECK_STATUSMAP[fix-file-included] =3D "Patched"
--=20
2.54.0


