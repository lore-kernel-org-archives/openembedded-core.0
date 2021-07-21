Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web12.3479.1626895089573199628
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jul 2021 12:18:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: uol@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1m6HjL-0004cH-4N; Wed, 21 Jul 2021 21:18:07 +0200
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1m6HjH-0003DR-PS; Wed, 21 Jul 2021 21:18:03 +0200
From: =?UTF-8?B?VWxyaWNoIMOWbG1hbm4=?= <u.oelmann@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [PATCH] initramfs-framework: fix whitespace issue
Date: Wed, 21 Jul 2021 21:18:00 +0200
Message-Id: <20210721191800.12318-1-u.oelmann@pengutronix.de>
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
 meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index c53a0c03ae6c..fe24215b465d 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -31,7 +31,7 @@ do_install() {
     install -m 0755 ${WORKDIR}/rootfs ${D}/init.d/90-rootfs
     install -m 0755 ${WORKDIR}/finish ${D}/init.d/99-finish
 
-	# exec
+    # exec
     install -m 0755 ${WORKDIR}/exec ${D}/init.d/89-exec
 
     # mdev
-- 
2.30.2

