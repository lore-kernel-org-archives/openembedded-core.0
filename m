Return-Path: <juro.bystricky@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 85AD271957
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 17:31:16 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 06 Feb 2017 09:31:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,342,1477983600"; d="scan'208";a="40498034"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.149])
	by orsmga002.jf.intel.com with ESMTP; 06 Feb 2017 09:31:15 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Feb 2017 09:27:22 -0800
Message-Id: <1486402042-26608-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH] loader.py: avoid error in TypeError exception.
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
X-List-Received-Date: Mon, 06 Feb 2017 17:31:17 -0000

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/lib/oeqa/core/loader.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
index c73ef9a..a380325 100644
--- a/meta/lib/oeqa/core/loader.py
+++ b/meta/lib/oeqa/core/loader.py
@@ -174,7 +174,7 @@ class OETestLoader(unittest.TestLoader):
                                 " Maybe you meant to derive from TestCase?")
         if not issubclass(testCaseClass, self.caseClass):
             raise TypeError("Test cases need to be derived from %s" % \
-                    caseClass.__name__)
+                    self.caseClass.__name__)
 
 
         testCaseNames = self.getTestCaseNames(testCaseClass)
-- 
2.7.4


