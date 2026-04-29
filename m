Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ACFCCD13DF
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 16:48:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.929.1777481308864796555
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 09:48:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=vVFXnKw6;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 01F34344A
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 09:48:23 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 12BFC3F62B
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 09:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777481308; bh=m5sSoruH2eEy2REkhqfcmdnpUSFs7VgpIQMsP8FfDWg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=vVFXnKw6a4t6n+ZWbQceTChHciEovBTJWXOx+IKMRrStUJI01hcMKgnngFDb1BQoB
	 CEPbg/vXDORLheD/2kPL2v5QhedYerz4zhF+DwocSrWRL96TSZqz1Gv6V15jO4bXY9
	 /oS0wyDMhUWIRsn1294Y1NL4IUPpSYWHpvXURGGA=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/10] bluez5: use ${firmwaredir} instead of ${nonarch_base_libdir}/firmware
Date: Wed, 29 Apr 2026 17:48:14 +0100
Message-ID: <20260429164821.3425757-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429164821.3425757-1-ross.burton@arm.com>
References: <20260429164821.3425757-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 16:48:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236115

Now that firmwaredir has been defined, use it instead of explicitly using
${nonarch_base_libdir}/firmware.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-c=
onnectivity/bluez5/bluez5.inc
index 843e36b78de..676d2c58eb9 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -85,7 +85,7 @@ EXTRA_OECONF =3D "\
   --without-zsh-completion-dir \
 "
=20
-CFLAGS +=3D "-DFIRMWARE_DIR=3D'"${nonarch_base_libdir}/firmware"'"
+CFLAGS +=3D "-DFIRMWARE_DIR=3D'"${firmwaredir}"'"
=20
 # bluez5 builds a large number of useful utilities but does not
 # install them.  Specify which ones we want put into ${PN}-noinst-tools.
--=20
2.43.0


