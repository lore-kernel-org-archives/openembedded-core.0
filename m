Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4B93E608B7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Feb 2017 08:27:09 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP; 03 Feb 2017 00:27:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,328,1477983600"; d="scan'208";a="61388916"
Received: from moslizlo-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.3.80])
	by fmsmga006.fm.intel.com with ESMTP; 03 Feb 2017 00:27:09 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Feb 2017 10:27:07 +0200
Message-Id: <1486110427-3575-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH] oeqa.buildperf: reword test descriptions
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
X-List-Received-Date: Fri, 03 Feb 2017 08:27:10 -0000

In an attempt to make them more compact and coherent.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/test_basic.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/buildperf/test_basic.py b/meta/lib/oeqa/buildperf/test_basic.py
index 7a48c1e..4711830 100644
--- a/meta/lib/oeqa/buildperf/test_basic.py
+++ b/meta/lib/oeqa/buildperf/test_basic.py
@@ -22,7 +22,7 @@ class Test1P1(BuildPerfTestCase):
     build_target = 'core-image-sato'
 
     def test1(self):
-        """Measure wall clock of bitbake core-image-sato and size of tmp dir"""
+        """Build core-image-sato"""
         self.rm_tmp()
         self.rm_sstate()
         self.rm_cache()
@@ -36,7 +36,7 @@ class Test1P2(BuildPerfTestCase):
     build_target = 'virtual/kernel'
 
     def test12(self):
-        """Measure bitbake virtual/kernel"""
+        """Build virtual/kernel"""
         # Build and cleans state in order to get all dependencies pre-built
         self.log_cmd_output(['bitbake', self.build_target])
         self.log_cmd_output(['bitbake', self.build_target, '-c', 'cleansstate'])
@@ -72,7 +72,7 @@ class Test2(BuildPerfTestCase):
     build_target = 'core-image-sato'
 
     def test2(self):
-        """Measure bitbake core-image-sato -c rootfs with sstate"""
+        """Run core-image-sato do_rootfs with sstate"""
         # Build once in order to populate sstate cache
         self.log_cmd_output(['bitbake', self.build_target])
 
@@ -86,7 +86,7 @@ class Test2(BuildPerfTestCase):
 class Test3(BuildPerfTestCase):
 
     def test3(self):
-        """Parsing time metrics (bitbake -p)"""
+        """Bitbake parsing (bitbake -p)"""
         # Drop all caches and parse
         self.rm_cache()
         oe.path.remove(os.path.join(self.bb_vars['TMPDIR'], 'cache'), True)
-- 
2.6.6


