Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2F7856057A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 12:23:01 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP; 29 Sep 2016 05:23:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,414,1470726000"; d="scan'208";a="14503569"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 29 Sep 2016 05:23:03 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id 6AB7B6A4080;
	Thu, 29 Sep 2016 05:22:35 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Sep 2016 15:12:11 +0300
Message-Id: <1475151131-9215-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] wic: selftest: add test for sdimage-bootpart
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
X-List-Received-Date: Thu, 29 Sep 2016 12:23:03 -0000

Test image creation using mksystemd-bootdisk.wks

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 6012abc..b05300c 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -291,3 +291,11 @@ class Wic(oeSelfTest):
         self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
                                    % image).status)
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
+
+    def test_sdimage_bootpart(self):
+        """Test creation of sdimage-bootpart image"""
+        image = "sdimage-bootpart"
+        self.write_config('IMAGE_BOOT_FILES = "bzImage"\n')
+        self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
+                                   % image).status)
+        self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
-- 
2.1.4


