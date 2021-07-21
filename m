Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.4246.1626898154895396094
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jul 2021 13:09:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: uol@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1m6IWn-0000jA-9Y; Wed, 21 Jul 2021 22:09:13 +0200
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1m6IWm-0007tO-DG; Wed, 21 Jul 2021 22:09:12 +0200
From: =?UTF-8?B?VWxyaWNoIMOWbG1hbm4=?= <u.oelmann@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [PATCH] initramfs-framework/setup-live: fix shebang
Date: Wed, 21 Jul 2021 22:09:11 +0200
Message-Id: <20210721200911.30295-1-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 meta/recipes-core/initrdscripts/initramfs-framework/setup-live | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/setup-live b/meta/recipes-core/initrdscripts/initramfs-framework/setup-live
index 4c79f412857c..7e92f93322b2 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/setup-live
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/setup-live
@@ -1,4 +1,4 @@
-#/bin/sh
+#!/bin/sh
 # Copyright (C) 2011 O.S. Systems Software LTDA.
 # Licensed on MIT
 
-- 
2.30.2

