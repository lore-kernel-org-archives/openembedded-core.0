Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8F38A731A5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 17:07:59 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 20 Jan 2017 09:07:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,259,1477983600"; d="scan'208";a="1115567529"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.143])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2017 09:07:59 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 11:10:21 -0600
Message-Id: <3a7153b6abf648746e0f5ab2a0460b1be89c3491.1484929088.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484929088.git.anibal.limon@linux.intel.com>
References: <cover.1484929088.git.anibal.limon@linux.intel.com>
Subject: [PATCH 50/55] oeqa/core/utils/test.py: Add functions to get module path
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
X-List-Received-Date: Fri, 20 Jan 2017 17:07:59 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This will add functions to get module file path from a test
case or a complete suite.

[YOCTO #10234]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/core/utils/test.py | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/lib/oeqa/core/utils/test.py b/meta/lib/oeqa/core/utils/test.py
index 820b997..88d1765 100644
--- a/meta/lib/oeqa/core/utils/test.py
+++ b/meta/lib/oeqa/core/utils/test.py
@@ -2,6 +2,7 @@
 # Released under the MIT license (see COPYING.MIT)
 
 import os
+import inspect
 import unittest
 
 def getSuiteCases(suite):
@@ -46,6 +47,12 @@ def getSuiteCasesIDs(suite):
     """
     return getSuiteCasesInfo(suite, getCaseID)
 
+def getSuiteCasesFiles(suite):
+    """
+        Returns test case files paths from suite.
+    """
+    return getSuiteCasesInfo(suite, getCaseFile)
+
 def getCaseModule(test_case):
     """
         Returns test case module name.
@@ -64,6 +71,12 @@ def getCaseID(test_case):
     """
     return test_case.id()
 
+def getCaseFile(test_case):
+    """
+        Returns test case file path.
+    """
+    return inspect.getsourcefile(test_case.__class__)
+
 def getCaseMethod(test_case):
     """
         Returns test case method name.
-- 
2.1.4


