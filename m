Return-Path: <george.l.musat@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6127D76E04
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Oct 2015 14:50:11 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 28 Oct 2015 07:50:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,210,1444719600"; d="scan'208";a="805564868"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 28 Oct 2015 07:50:10 -0700
Received: from localhost.localdomain (unknown [10.237.112.173])
	by linux.intel.com (Postfix) with ESMTP id 2F29A6A4083;
	Wed, 28 Oct 2015 07:49:06 -0700 (PDT)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Oct 2015 16:48:23 +0200
Message-Id: <1446043703-2497-1-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] oeqa/runtime: Removed obsolete testcase dmesg.
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
X-List-Received-Date: Wed, 28 Oct 2015 14:50:13 -0000

The dmesg parser test was made obsolete by the parselogs testcase,
that searches in all the logs, including dmesg.
---
 meta/lib/oeqa/runtime/dmesg.py | 12 ------------
 1 file changed, 12 deletions(-)
 delete mode 100644 meta/lib/oeqa/runtime/dmesg.py

diff --git a/meta/lib/oeqa/runtime/dmesg.py b/meta/lib/oeqa/runtime/dmesg.py
deleted file mode 100644
index 5831471..0000000
--- a/meta/lib/oeqa/runtime/dmesg.py
+++ /dev/null
@@ -1,12 +0,0 @@
-import unittest
-from oeqa.oetest import oeRuntimeTest
-from oeqa.utils.decorators import *
-
-
-class DmesgTest(oeRuntimeTest):
-
-    @testcase(215)
-    @skipUnlessPassed('test_ssh')
-    def test_dmesg(self):
-        (status, output) = self.target.run('dmesg | grep -v mmci-pl18x | grep -v "error changing net interface name" | grep -iv "dma timeout" | grep -v usbhid | grep -i error')
-        self.assertEqual(status, 1, msg = "Error messages in dmesg log: %s" % output)
-- 
2.5.0


