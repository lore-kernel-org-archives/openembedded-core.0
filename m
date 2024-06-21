Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 637B1C27C4F
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 06:11:17 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.66783.1718950273479774876
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 23:11:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: uol@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1sKXUN-00048j-EX; Fri, 21 Jun 2024 08:11:11 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1sKXUM-003sJL-8n; Fri, 21 Jun 2024 08:11:10 +0200
Received: from uol by dude03.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <uol@pengutronix.de>)
	id 1sKXUM-002NqB-0Q;
	Fri, 21 Jun 2024 08:11:10 +0200
From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
To: OpenEmbedded Core Developers <openembedded-core@lists.openembedded.org>
Cc: yocto@pengutronix.de,
	=?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [PATCH] initramfs-framework: fix typos
Date: Fri, 21 Jun 2024 08:11:08 +0200
Message-Id: <20240621061108.568290-1-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 06:11:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200993

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 meta/recipes-core/initrdscripts/initramfs-framework/init   | 2 +-
 meta/recipes-core/initrdscripts/initramfs-framework/rootfs | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b/meta/recipes-core/initrdscripts/initramfs-framework/init
index e3d8caa0e189..716a156f8237 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/init
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/init
@@ -120,7 +120,7 @@ if grep -q devtmpfs /proc/filesystems; then
 	mount -t devtmpfs devtmpfs /dev
 else
 	if [ ! -d /dev ]; then
-		fatal "ERROR: /dev doesn't exist and kernel doesn't has devtmpfs enabled."
+		fatal "ERROR: /dev doesn't exist and kernel doesn't have devtmpfs enabled."
 	fi
 fi
 
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/rootfs b/meta/recipes-core/initrdscripts/initramfs-framework/rootfs
index e0efbe6ebe98..38e138f618e6 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/rootfs
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/rootfs
@@ -59,7 +59,7 @@ rootfs_run() {
 				fi
 			fi
 		fi
-		debug "Sleeping for $delay second(s) to wait root to settle..."
+		debug "Sleeping for $delay second(s) to wait for root to settle..."
 		sleep $delay
 		C=$(( $C + 1 ))
 	done
-- 
2.39.2


