Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD86CF07BA
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 07:14:07 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.37787.1728544445761586369
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 00:14:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: uol@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1synN6-0000XL-9U; Thu, 10 Oct 2024 09:14:04 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1synN5-000mrd-F4; Thu, 10 Oct 2024 09:14:03 +0200
Received: from uol by dude03.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <uol@pengutronix.de>)
	id 1synN5-001iYR-13;
	Thu, 10 Oct 2024 09:14:03 +0200
From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
To: OpenEmbedded Core Developers <openembedded-core@lists.openembedded.org>
Cc: yocto@pengutronix.de,
	=?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [PATCH] volatile-binds: mount-copybind: fix typo
Date: Thu, 10 Oct 2024 09:14:01 +0200
Message-Id: <20241010071401.409586-1-u.oelmann@pengutronix.de>
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
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 07:14:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205385

Amend a small typing error.

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 meta/recipes-core/volatile-binds/files/mount-copybind | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/volatile-binds/files/mount-copybind b/meta/recipes-core/volatile-binds/files/mount-copybind
index 4f373412be6f..58858805343c 100755
--- a/meta/recipes-core/volatile-binds/files/mount-copybind
+++ b/meta/recipes-core/volatile-binds/files/mount-copybind
@@ -49,7 +49,7 @@ if [ -d "$mountpoint" ]; then
         mkdir "${overlay_workdir}"
     fi
 
-    # Try to mount using overlay, which is must faster than copying files.
+    # Try to mount using overlay, which is much faster than copying files.
     # If that fails, fall back to slower copy.
     if command -v selinuxenabled > /dev/null 2>&1; then
         if selinuxenabled; then
-- 
2.39.5


