Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19B43C5478C
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 19:38:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2384.1708976330979209110
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 11:38:51 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F2CE0DA7
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 11:39:28 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 062373F762
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 11:38:49 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] core-image-initramfs-boot: install all kernel modules
Date: Mon, 26 Feb 2024 19:38:48 +0000
Message-Id: <20240226193848.3763932-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 19:38:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196217

From: Ross Burton <ross.burton@arm.com>

The point of a "just boot" initramfs is to contain the kernel modules so
that the kernel can find the real root filesystem, so explicitly add them=
.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/images/core-image-initramfs-boot.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/core-image-initramfs-boot.bb b/meta=
/recipes-core/images/core-image-initramfs-boot.bb
index 72589447513..cb6837a43d6 100644
--- a/meta/recipes-core/images/core-image-initramfs-boot.bb
+++ b/meta/recipes-core/images/core-image-initramfs-boot.bb
@@ -4,7 +4,7 @@ LICENSE =3D "MIT"
=20
 INITRAMFS_SCRIPTS ?=3D "initramfs-framework-base initramfs-module-udev"
=20
-PACKAGE_INSTALL =3D "${INITRAMFS_SCRIPTS} ${VIRTUAL-RUNTIME_base-utils} =
base-passwd"
+PACKAGE_INSTALL =3D "${INITRAMFS_SCRIPTS} ${VIRTUAL-RUNTIME_base-utils} =
base-passwd kernel-modules"
=20
 # Ensure the initramfs only contains the bare minimum
 IMAGE_FEATURES =3D ""
--=20
2.34.1


