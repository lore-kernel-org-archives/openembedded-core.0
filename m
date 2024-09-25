Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC39C369CC
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 10:53:56 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.12833.1727261628049536074
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Sep 2024 03:53:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: uol@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1stPeT-0001hw-UN; Wed, 25 Sep 2024 12:53:45 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1stPeS-001QhK-NJ; Wed, 25 Sep 2024 12:53:44 +0200
Received: from uol by dude03.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <uol@pengutronix.de>)
	id 1stPeS-009BlZ-26;
	Wed, 25 Sep 2024 12:53:44 +0200
From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
To: OpenEmbedded Core Developers <openembedded-core@lists.openembedded.org>
Cc: yocto@pengutronix.de,
	=?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [PATCH] initramfs-framework: init: fix typo
Date: Wed, 25 Sep 2024 12:53:34 +0200
Message-Id: <20240925105334.2190168-1-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.39.5
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
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 10:53:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204946

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 meta/recipes-core/initrdscripts/initramfs-framework/init | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b/meta/recipes-core/initrdscripts/initramfs-framework/init
index 716a156f8237..a48b77e95ebc 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/init
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/init
@@ -70,7 +70,7 @@ fatal() {
 	fi
 }
 
-# Variables shared amoung modules
+# Variables shared among modules
 ROOTFS_DIR="/rootfs" # where to do the switch root
 MODULE_PRE_HOOKS=""  # functions to call before running each module
 MODULE_POST_HOOKS="" # functions to call after running each module
-- 
2.39.5


