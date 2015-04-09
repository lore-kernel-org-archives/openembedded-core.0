Return-Path: <george.l.musat@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 34F0373D25
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Apr 2015 08:10:45 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Apr 2015 01:10:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,548,1422950400"; d="scan'208";a="706054639"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 09 Apr 2015 01:10:47 -0700
Received: from localhost.localdomain (unknown [10.237.112.173])
	by linux.intel.com (Postfix) with ESMTP id 2865D6A408F;
	Thu,  9 Apr 2015 01:10:23 -0700 (PDT)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Apr 2015 11:08:12 +0300
Message-Id: <1428566892-30526-3-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1428566892-30526-1-git-send-email-george.l.musat@intel.com>
References: <1428566892-30526-1-git-send-email-george.l.musat@intel.com>
Subject: [PATCH 3/3] oeqa/runtime: Boot test for poky-tiny.
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
X-List-Received-Date: Thu, 09 Apr 2015 08:10:49 -0000

Bug 6705.

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/lib/oeqa/runtime/_qemutiny.py | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/_qemutiny.py

diff --git a/meta/lib/oeqa/runtime/_qemutiny.py b/meta/lib/oeqa/runtime/_qemutiny.py
new file mode 100644
index 0000000..a3c29f3
--- /dev/null
+++ b/meta/lib/oeqa/runtime/_qemutiny.py
@@ -0,0 +1,9 @@
+import unittest
+from oeqa.oetest import oeRuntimeTest
+from oeqa.utils.qemutinyrunner import *
+
+class QemuTinyTest(oeRuntimeTest):
+
+    def test_boot_tiny(self):
+        (status, output) = self.target.run_serial('uname -a')
+        self.assertTrue("yocto-tiny" in output, msg="Cannot detect poky tiny boot!")
\ No newline at end of file
-- 
2.1.0


