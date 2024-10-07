Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EF4DCFB446
	for <webhook@archiver.kernel.org>; Mon,  7 Oct 2024 12:10:03 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.51402.1728303001950721404
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Oct 2024 05:10:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1sxmYq-0004Z1-4i; Mon, 07 Oct 2024 14:10:00 +0200
Received: from [2a0a:edc0:0:1101:1d::5c] (helo=dude06.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1sxmYp-0007YI-Ef; Mon, 07 Oct 2024 14:09:59 +0200
Received: from ejo by dude06.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1sxmYp-0047Om-1G;
	Mon, 07 Oct 2024 14:09:59 +0200
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de
Subject: [PATCH 9/9] busybox: disable defconfig options from mount-via-label.cfg
Date: Mon,  7 Oct 2024 14:09:50 +0200
Message-Id: <20241007120950.975803-10-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241007120950.975803-1-ejo@pengutronix.de>
References: <20241007120950.975803-1-ejo@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Oct 2024 12:10:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205267

Accidentally enabled in
6a6c6442 ("busybox: refresh the defconfig from 1.33.0").

Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
---
 meta/recipes-core/busybox/busybox/defconfig | 24 +++++++++------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index 25dfbe5c97..35e1e33c12 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -604,8 +604,8 @@ CONFIG_DEFAULT_DEPMOD_FILE="modules.dep"
 # CONFIG_ACPID is not set
 # CONFIG_FEATURE_ACPID_COMPAT is not set
 # CONFIG_BLKDISCARD is not set
-CONFIG_BLKID=y
-CONFIG_FEATURE_BLKID_TYPE=y
+# CONFIG_BLKID is not set
+# CONFIG_FEATURE_BLKID_TYPE is not set
 # CONFIG_BLOCKDEV is not set
 # CONFIG_CAL is not set
 # CONFIG_CHRT is not set
@@ -673,7 +673,7 @@ CONFIG_MOUNT=y
 # CONFIG_FEATURE_MOUNT_FAKE is not set
 # CONFIG_FEATURE_MOUNT_VERBOSE is not set
 # CONFIG_FEATURE_MOUNT_HELPERS is not set
-CONFIG_FEATURE_MOUNT_LABEL=y
+# CONFIG_FEATURE_MOUNT_LABEL is not set
 # CONFIG_FEATURE_MOUNT_NFS is not set
 # CONFIG_FEATURE_MOUNT_CIFS is not set
 CONFIG_FEATURE_MOUNT_FLAGS=y
@@ -721,19 +721,15 @@ CONFIG_FEATURE_UMOUNT_ALL=y
 CONFIG_FEATURE_MOUNT_LOOP=y
 CONFIG_FEATURE_MOUNT_LOOP_CREATE=y
 # CONFIG_FEATURE_MTAB_SUPPORT is not set
-CONFIG_VOLUMEID=y
-
-#
-# Filesystem/Volume identification
-#
+# CONFIG_VOLUMEID is not set
 # CONFIG_FEATURE_VOLUMEID_BCACHE is not set
-CONFIG_FEATURE_VOLUMEID_BTRFS=y
+# CONFIG_FEATURE_VOLUMEID_BTRFS is not set
 # CONFIG_FEATURE_VOLUMEID_CRAMFS is not set
-CONFIG_FEATURE_VOLUMEID_EROFS=y
+# CONFIG_FEATURE_VOLUMEID_EROFS is not set
 # CONFIG_FEATURE_VOLUMEID_EXFAT is not set
-CONFIG_FEATURE_VOLUMEID_EXT=y
-CONFIG_FEATURE_VOLUMEID_F2FS=y
-CONFIG_FEATURE_VOLUMEID_FAT=y
+# CONFIG_FEATURE_VOLUMEID_EXT is not set
+# CONFIG_FEATURE_VOLUMEID_F2FS is not set
+# CONFIG_FEATURE_VOLUMEID_FAT is not set
 # CONFIG_FEATURE_VOLUMEID_HFS is not set
 # CONFIG_FEATURE_VOLUMEID_ISO9660 is not set
 # CONFIG_FEATURE_VOLUMEID_JFS is not set
@@ -747,7 +743,7 @@ CONFIG_FEATURE_VOLUMEID_FAT=y
 # CONFIG_FEATURE_VOLUMEID_OCFS2 is not set
 # CONFIG_FEATURE_VOLUMEID_REISERFS is not set
 # CONFIG_FEATURE_VOLUMEID_ROMFS is not set
-CONFIG_FEATURE_VOLUMEID_SQUASHFS=y
+# CONFIG_FEATURE_VOLUMEID_SQUASHFS is not set
 # CONFIG_FEATURE_VOLUMEID_SYSV is not set
 # CONFIG_FEATURE_VOLUMEID_UBIFS is not set
 # CONFIG_FEATURE_VOLUMEID_UDF is not set
-- 
2.39.5


