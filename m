Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web09.7877.1620830192655070778
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 07:36:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: uol@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1lgpyP-00070M-Qm; Wed, 12 May 2021 16:36:29 +0200
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1lgpyP-0001CW-In; Wed, 12 May 2021 16:36:29 +0200
From: =?UTF-8?B?VWxyaWNoIMOWbG1hbm4=?= <u.oelmann@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [PATCH] local.conf.sample: fix typo
Date: Wed, 12 May 2021 16:36:22 +0200
Message-Id: <20210512143622.4168-1-u.oelmann@pengutronix.de>
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
index 870509cf1ff8..652bd477339e 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -167,7 +167,7 @@ PATCHRESOLVE = "noop"
 #
 # Monitor the disk space during the build. If there is less that 1GB of space or less
 # than 100K inodes in any key build location (TMPDIR, DL_DIR, SSTATE_DIR), gracefully
-# shutdown the build. If there is less that 100MB or 1K inodes, perform a hard abort
+# shutdown the build. If there is less than 100MB or 1K inodes, perform a hard abort
 # of the build. The reason for this is that running completely out of space can corrupt
 # files and damages the build in ways which may not be easily recoverable.
 # It's necessary to monitor /tmp, if there is no space left the build will fail
-- 
2.29.2

