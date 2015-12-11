Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6362465CBF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 09:54:09 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Dec 2015 01:54:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,412,1444719600"; d="scan'208";a="839121303"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 11 Dec 2015 01:54:10 -0800
Received: from localhost.localdomain (unknown [10.237.112.239])
	by linux.intel.com (Postfix) with ESMTP id 134936A4087;
	Fri, 11 Dec 2015 02:42:11 -0800 (PST)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Dec 2015 11:58:15 +0200
Message-Id: <1449827895-5899-1-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/selftest: Added testcase decorators for 2 testcases
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
X-List-Received-Date: Fri, 11 Dec 2015 09:54:10 -0000

bblayers: test_bitbakelayers_showrecipes    1384
wic:      test_directdisk_bootloader_config 1385

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 meta/lib/oeqa/selftest/bblayers.py | 1 +
 meta/lib/oeqa/selftest/wic.py      | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/bblayers.py b/meta/lib/oeqa/selftest/bblayers.py
index 5452925..b88c25e 100644
--- a/meta/lib/oeqa/selftest/bblayers.py
+++ b/meta/lib/oeqa/selftest/bblayers.py
@@ -61,6 +61,7 @@ class BitbakeLayers(oeSelfTest):
         result = runCmd('bitbake-layers show-layers')
         self.assertNotIn('meta-skeleton', result.output, msg = "meta-skeleton should have been removed at this step.  bitbake-layers show-layers output: %s" % result.output)
 
+    @testcase(1384)
     def test_bitbakelayers_showrecipes(self):
         result = runCmd('bitbake-layers show-recipes')
         self.assertIn('aspell:', result.output)
diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index f4404bf..55f6f82 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -257,7 +257,7 @@ class Wic(oeSelfTest):
                                    % image).status)
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
 
-    #@testcase()
+    @testcase(1385)
     def test_directdisk_bootloader_config(self):
         """Test creation of directdisk-bootloader-config image"""
         image = "directdisk-bootloader-config"
-- 
2.1.4


