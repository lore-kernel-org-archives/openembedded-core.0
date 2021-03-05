Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.380.1614971169464226660
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 11:06:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: uol@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1lIFm2-0005DO-Hf; Fri, 05 Mar 2021 20:06:06 +0100
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1lIFm1-0000NT-N9; Fri, 05 Mar 2021 20:06:05 +0100
From: =?UTF-8?B?VWxyaWNoIMOWbG1hbm4=?= <u.oelmann@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [PATCH] local.conf.sample: fix typo
Date: Fri,  5 Mar 2021 20:06:04 +0100
Message-Id: <20210305190604.1297-1-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 meta/conf/local.conf.sample | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 3318e983a78f..870509cf1ff8 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -185,7 +185,7 @@ BB_DISKMON_DIRS ??= "\
 #
 # Shared-state files from other locations
 #
-# As mentioned above, shared state files are prebuilt cache data objects which can
+# As mentioned above, shared state files are prebuilt cache data objects which can be
 # used to accelerate build time. This variable can be used to configure the system
 # to search other mirror locations for these objects before it builds the data itself.
 #
-- 
2.29.2

