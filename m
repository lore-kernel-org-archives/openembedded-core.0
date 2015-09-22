Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 260EA76FFA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 16:56:22 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 22 Sep 2015 09:56:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,574,1437462000"; d="scan'208";a="566366102"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.166])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Sep 2015 09:56:21 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Sep 2015 11:56:23 -0500
Message-Id: <1442940983-5475-2-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1442940983-5475-1-git-send-email-anibal.limon@linux.intel.com>
References: <1442940983-5475-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] oeqa/utils/qemurunner.py: Remove duplicate message on LoggingThread start
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Sep 2015 16:56:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Starting logging thread message is also executed on run() inside
LoggingThread class.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 6edd374..0357f99 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -186,7 +186,6 @@ class QemuRunner:
             logger.info("Target IP: %s" % self.ip)
             logger.info("Server IP: %s" % self.server_ip)
 
-            logger.info("Starting logging thread")
             self.thread = LoggingThread(self.log, threadsock, logger)
             self.thread.start()
             if not self.thread.connection_established.wait(self.boottime):
-- 
1.9.1


