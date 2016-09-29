Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E103260191
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 08:49:58 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP; 29 Sep 2016 01:50:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,414,1470726000"; d="scan'208";a="14447678"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 29 Sep 2016 01:50:00 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id 44C876A4080;
	Thu, 29 Sep 2016 01:49:32 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Sep 2016 11:38:52 +0300
Message-Id: <1475138332-514-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH] wic: selftest: add test for mksystemd-bootdisk
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
X-List-Received-Date: Thu, 29 Sep 2016 08:50:01 -0000

Test creation of mksystemd-bootdisk image.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index e550785..6012abc 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -284,3 +284,10 @@ class Wic(oeSelfTest):
         self.assertEqual(0, status)
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct.bmap" % image)))
+
+    def test_mksystemd_bootdisk(self):
+        """Test creation of mksystemd-bootdisk image"""
+        image = "mksystemd-bootdisk"
+        self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
+                                   % image).status)
+        self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
-- 
2.1.4


