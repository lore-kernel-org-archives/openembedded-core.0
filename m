Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DA40CD4F39
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 19:14:47 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19366.1778786080276390565
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2026 12:14:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=vbCkExo4;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 22B541A35CE
	for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 19:14:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ECC4E5FE74
	for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 19:14:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D828B11AF8483;
	Thu, 14 May 2026 21:14:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778786077; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Ji+Hubs0P6CoDgVOL/tidERpJm/NqX1gF7lzE3Jf0f4=;
	b=vbCkExo4LqvFEp1HMyOhRccSYDIc/JxS8K+1R6Z/X53sHPnuORvya0BxE3EqGo+ZC3qAjJ
	kWMgFe0/Z3+mw+Efr20SDZck04bup/uab0u9v1ifUSaKKZ9NuRngugLgKA13pqxE/2Nukm
	EajNuMQ7Q45oyU+RzL8YCJrtTcrpeyKUnQL6iZq6tBUCtLa/Opwggha4YHJj+SkJ8wXggd
	hNzSw7qoYXxxSlbxUqpOy4oWv+6epBicWBC9gAcuHCS8Q3sSMP0eWTwA+ZcLzJKu+xrH6q
	CVVInTjenAp3EJtegbgY6NfWf53EgNLYd2S7i9xobYZqHfoQprdpgyLC4S81+w==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH] default-distrovars.inc: add missing spaces in append overrides
Date: Thu, 14 May 2026 21:14:28 +0200
Message-ID: <20260514191428.259746-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 19:14:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237046

DISTRO_FEATURES_OPTED_OUT is a space-separated list, so the missing
space leads to:

$ bitbake-getvar DISTRO_FEATURES_OPTED_OUT
(...)
   set /src/build/conf/local.conf:277
     "x11"
(...)
   :append[loongarch64] /src/openembedded-core/meta/conf/distro/include/d=
efault-distrovars.inc:26
     "seccomp"
(...)
DISTRO_FEATURES_OPTED_OUT=3D"x11seccomp"

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta/conf/distro/include/default-distrovars.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/=
distro/include/default-distrovars.inc
index 4bfe2469e2..69c6db589b 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -14,16 +14,16 @@ LOCALE_UTF8_IS_DEFAULT ?=3D "1"
 LOCALE_UTF8_IS_DEFAULT:class-nativesdk =3D "0"
=20
 # seccomp is not yet ported to rv32
-DISTRO_FEATURES_OPTED_OUT:append:riscv32 =3D "seccomp"
+DISTRO_FEATURES_OPTED_OUT:append:riscv32 =3D " seccomp"
=20
 # seccomp is not yet ported to ARC
-DISTRO_FEATURES_OPTED_OUT:append:arc =3D "seccomp"
+DISTRO_FEATURES_OPTED_OUT:append:arc =3D " seccomp"
=20
 # seccomp is not yet ported to microblaze
-DISTRO_FEATURES_OPTED_OUT:append:microblaze =3D "seccomp"
+DISTRO_FEATURES_OPTED_OUT:append:microblaze =3D " seccomp"
=20
 # seccomp is not yet ported to loongarch64
-DISTRO_FEATURES_OPTED_OUT:append:loongarch64 =3D "seccomp"
+DISTRO_FEATURES_OPTED_OUT:append:loongarch64 =3D " seccomp"
=20
 DISTRO_FEATURES_DEFAULTS ?=3D " \
     acl alsa bluetooth debuginfod ext2 ipv4 ipv6 \
--=20
2.47.0


