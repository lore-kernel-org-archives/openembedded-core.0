Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73226C282D2
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 16:15:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.57600.1741018539750818675
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Mar 2025 08:15:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2CB20106F
	for <openembedded-core@lists.openembedded.org>; Mon,  3 Mar 2025 08:15:53 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B8FF93F673
	for <openembedded-core@lists.openembedded.org>; Mon,  3 Mar 2025 08:15:38 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] systemd-serialgetty: don't set a default SERIAL_CONSOLES
Date: Mon,  3 Mar 2025 16:15:25 +0000
Message-ID: <20250303161527.602462-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 16:15:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212215

bitbake.conf defines a default value, so there's no value in setting
another default here that doesn't match the rest of the system.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/systemd/systemd-serialgetty.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/reci=
pes-core/systemd/systemd-serialgetty.bb
index 7b525b10f0c..daac7f41986 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty.bb
+++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/commo=
n-licenses/GPL-2.0-only;m
 # required.  This recipe (enabled via disabling serial-getty-generator i=
n systemd)
 # should only be used if the generator is not appropriate.
=20
-SERIAL_CONSOLES ?=3D "115200;ttyS0"
 SERIAL_TERM ?=3D "linux"
=20
 SRC_URI =3D "file://serial-getty@.service"
--=20
2.43.0


