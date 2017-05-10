Return-Path: <anibal.limon@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 573BA71AD4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 19:47:42 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 10 May 2017 12:47:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,320,1491289200"; d="scan'208";a="1128735086"
Received: from rnpawar-mobl3.amr.corp.intel.com (HELO
	alimonb-mobl1.zpn.intel.com) ([10.254.59.138])
	by orsmga001.jf.intel.com with ESMTP; 10 May 2017 12:47:41 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 May 2017 14:47:05 -0500
Message-Id: <2d266b986bb65a558c6f5d57ae3051ac93180423.1494445222.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1494445222.git.anibal.limon@linux.intel.com>
References: <cover.1494445222.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1494445222.git.anibal.limon@linux.intel.com>
References: <cover.1494445222.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, juan.m.cruz.alcaraz@intel.com
Subject: [PATCH 05/17] oeqa/core/runner: OETestResult remove unneeded override of startTest
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
X-List-Received-Date: Wed, 10 May 2017 19:47:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I override this method before for keep track of results and forget
to remove it, now isn't need.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/core/runner.py | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index 40fbf3b..0b04e8d 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -44,9 +44,6 @@ class OETestResult(_TestResult):
         self.tc._results['skipped'] = self.skipped
         self.tc._results['expectedFailures'] = self.expectedFailures
 
-    def startTest(self, test):
-        super(OETestResult, self).startTest(test)
-
 class OETestRunner(_TestRunner):
     streamLoggerClass = OEStreamLogger
 
-- 
2.1.4


