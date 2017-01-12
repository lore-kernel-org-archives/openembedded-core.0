Return-Path: <jose.perez.carranza@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 4CE276FF9F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 21:45:35 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP; 12 Jan 2017 13:45:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,220,1477983600"; d="scan'208";a="1093389749"
Received: from yctb06.ostc.intel.com ([10.54.69.60])
	by fmsmga001.fm.intel.com with ESMTP; 12 Jan 2017 13:45:35 -0800
From: jose.perez.carranza@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jan 2017 13:39:32 +0000
Message-Id: <1484228372-31795-1-git-send-email-jose.perez.carranza@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Cc: paul.eggleton@intel.com
Subject: [PATCH] Tinfoil: Add test IDs to tinfoil test cases
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
X-List-Received-Date: Thu, 12 Jan 2017 21:45:36 -0000

From: Jose Perez Carranza <jose.perez.carranza@intel.com>

Testopia entrances were created and the IDs retrieved are
added to their corresponding test case on tinfoil script.

Signed-off-by: Jose Perez Carranza <jose.perez.carranza@intel.com>
---
 meta/lib/oeqa/selftest/tinfoil.py | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/lib/oeqa/selftest/tinfoil.py b/meta/lib/oeqa/selftest/tinfoil.py
index c8d635c..6ad106c 100644
--- a/meta/lib/oeqa/selftest/tinfoil.py
+++ b/meta/lib/oeqa/selftest/tinfoil.py
@@ -10,6 +10,7 @@ from oeqa.utils.decorators import testcase
 class TinfoilTests(oeSelfTest):
     """ Basic tests for the tinfoil API """
 
+    @testcase(1568)
     def test_getvar(self):
         with bb.tinfoil.Tinfoil() as tinfoil:
             tinfoil.prepare(True)
@@ -17,6 +18,7 @@ class TinfoilTests(oeSelfTest):
             if not machine:
                 self.fail('Unable to get MACHINE value - returned %s' % machine)
 
+    @testcase(1569)
     def test_expand(self):
         with bb.tinfoil.Tinfoil() as tinfoil:
             tinfoil.prepare(True)
@@ -25,6 +27,7 @@ class TinfoilTests(oeSelfTest):
             if not pid:
                 self.fail('Unable to expand "%s" - returned %s' % (expr, pid))
 
+    @testcase(1570)
     def test_getvar_bb_origenv(self):
         with bb.tinfoil.Tinfoil() as tinfoil:
             tinfoil.prepare(True)
@@ -33,6 +36,7 @@ class TinfoilTests(oeSelfTest):
                 self.fail('Unable to get BB_ORIGENV value - returned %s' % origenv)
             self.assertEqual(origenv.getVar('HOME', False), os.environ['HOME'])
 
+    @testcase(1571)
     def test_parse_recipe(self):
         with bb.tinfoil.Tinfoil() as tinfoil:
             tinfoil.prepare(config_only=False, quiet=2)
@@ -43,6 +47,7 @@ class TinfoilTests(oeSelfTest):
             rd = tinfoil.parse_recipe_file(best[3])
             self.assertEqual(testrecipe, rd.getVar('PN'))
 
+    @testcase(1572)
     def test_parse_recipe_copy_expand(self):
         with bb.tinfoil.Tinfoil() as tinfoil:
             tinfoil.prepare(config_only=False, quiet=2)
@@ -61,6 +66,7 @@ class TinfoilTests(oeSelfTest):
             localdata.setVar('PN', 'hello')
             self.assertEqual('hello', localdata.getVar('BPN'))
 
+    @testcase(1573)
     def test_parse_recipe_initial_datastore(self):
         with bb.tinfoil.Tinfoil() as tinfoil:
             tinfoil.prepare(config_only=False, quiet=2)
@@ -74,6 +80,7 @@ class TinfoilTests(oeSelfTest):
             # Check we can get variable values
             self.assertEqual('somevalue', rd.getVar('MYVARIABLE'))
 
+    @testcase(1574)
     def test_list_recipes(self):
         with bb.tinfoil.Tinfoil() as tinfoil:
             tinfoil.prepare(config_only=False, quiet=2)
@@ -92,6 +99,7 @@ class TinfoilTests(oeSelfTest):
             if checkpns:
                 self.fail('Unable to find pkg_fn entries for: %s' % ', '.join(checkpns))
 
+    @testcase(1575)
     def test_wait_event(self):
         with bb.tinfoil.Tinfoil() as tinfoil:
             tinfoil.prepare(config_only=True)
@@ -122,6 +130,7 @@ class TinfoilTests(oeSelfTest):
             self.assertNotEqual(waitcount, 0, 'Timed out waiting for CommandCompleted event from bitbake server')
             self.assertTrue(eventreceived, 'Did not receive FilesMatchingFound event from bitbake server')
 
+    @testcase(1576)
     def test_setvariable_clean(self):
         # First check that setVariable affects the datastore
         with bb.tinfoil.Tinfoil() as tinfoil:
-- 
2.6.6


