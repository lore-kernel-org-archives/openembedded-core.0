Return-Path: <bst@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B6DC369B8
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:06:23 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.19588.1744722374958580337
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 06:06:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: bst@pengutronix.de)
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <bst@pengutronix.de>)
	id 1u4fzR-0008VJ-Dr; Tue, 15 Apr 2025 15:06:13 +0200
From: Bastian Krause <bst@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Bastian Krause <bst@pengutronix.de>
Subject: [RFC PATCH oe-core 4/4] core-image-minimal-initramfs: drop explicit udev from PACKAGE_INSTALL
Date: Tue, 15 Apr 2025 15:06:08 +0200
Message-Id: <20250415130608.1804620-4-bst@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250415130608.1804620-1-bst@pengutronix.de>
References: <20250415130608.1804620-1-bst@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: bst@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:06:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214850

initramfs-module-udev pulls in the udev dependency. There is no reason in
core-image-minimal-initramfs to add udev explicitly. So drop it here.

Signed-off-by: Bastian Krause <bst@pengutronix.de>
---
 meta/recipes-core/images/core-image-minimal-initramfs.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb b/meta/recipes-core/images/core-image-minimal-initramfs.bb
index fb629f1034..0c760b63bf 100644
--- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
+++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
@@ -12,7 +12,7 @@ INITRAMFS_SCRIPTS ?= "\
                       initramfs-module-install-efi \
                      "
 
-PACKAGE_INSTALL = "${INITRAMFS_SCRIPTS} udev base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}"
+PACKAGE_INSTALL = "${INITRAMFS_SCRIPTS} base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}"
 
 # Do not pollute the initrd image with rootfs features
 IMAGE_FEATURES = ""
-- 
2.39.5


