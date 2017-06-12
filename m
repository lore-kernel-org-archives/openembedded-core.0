Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7C5E57821B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 21:41:16 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jun 2017 14:41:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,335,1493708400"; d="scan'208";a="867194785"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.117])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Jun 2017 14:41:14 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Jun 2017 16:41:17 -0500
Message-Id: <1497303678-20255-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH 1/2] oeqa/core/runner: Don't log details twice if test fails
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
X-List-Received-Date: Mon, 12 Jun 2017 21:41:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The details of a test failure is upper on the unittest output
so don't log twice the actual failure.

[YOCTO #11622]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/core/runner.py | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index 532b25b..8a55c24 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -129,8 +129,6 @@ class OETestResult(_TestResult):
             if fail:
                 self.tc.logger.info("RESULTS - %s - Testcase %s: %s" % (case.id(),
                     oeid, desc))
-                if msg:
-                    self.tc.logger.info(msg)
             else:
                 self.tc.logger.info("RESULTS - %s - Testcase %s: %s" % (case.id(),
                     oeid, 'PASSED'))
-- 
2.1.4


