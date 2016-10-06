Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 90499606BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 12:18:44 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga105.jf.intel.com with ESMTP; 06 Oct 2016 05:18:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,453,1473145200"; d="scan'208";a="177007214"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 06 Oct 2016 05:18:47 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id CA00E6A4006
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 05:18:16 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Oct 2016 14:53:17 +0300
Message-Id: <077a71ad641f7032eb49cb6eed44da550f6306e6.1475754658.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1475754658.git.ed.bartosh@linux.intel.com>
References: <cover.1475754658.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1475754658.git.ed.bartosh@linux.intel.com>
References: <cover.1475754658.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 2/2] wic: selftest: add test for sdimage-bootpart
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
X-List-Received-Date: Thu, 06 Oct 2016 12:18:44 -0000

Test creation of sdimage-bootpart image

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index bf1a860..faac11e 100644
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


