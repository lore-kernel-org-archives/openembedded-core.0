Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9E72B605D2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 20:49:11 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 23 Apr 2015 13:49:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,634,1422950400"; d="scan'208";a="684737933"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 23 Apr 2015 13:49:12 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 3D7896A408F;
	Thu, 23 Apr 2015 13:48:46 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Apr 2015 23:49:07 +0300
Message-Id: <1429822147-5967-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH] wic tests: Add docstrings to test methods
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
X-List-Received-Date: Thu, 23 Apr 2015 20:49:13 -0000

Docstrings make nosetests output more clear:

Test wic create --help ... ok
Test wic --help ... ok
Test wic list --help ... ok
Test wic create directdisk providing all artifacts. ... ok
Test wic create directdisk --image-name core-image-minimal ... ok

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/tests/01_wic_test_help.py       | 4 ++++
 scripts/tests/02_wic_test_directdisk.py | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/scripts/tests/01_wic_test_help.py b/scripts/tests/01_wic_test_help.py
index a64cf2f..4aaa66f 100644
--- a/scripts/tests/01_wic_test_help.py
+++ b/scripts/tests/01_wic_test_help.py
@@ -28,13 +28,17 @@ class TestWicHelp(unittest.TestCase):
     """Test help output of wic (sub)commands"""
 
     def setUp(self):
+        """This code is executed before each test method."""
         self.main = imp.load_source("wic", "wic").main
 
     def testhelp(self):
+        """Test wic --help"""
         self.assertRaises(SystemExit, self.main, ['--help'])
 
     def testcreatehelp(self):
+        """Test wic create --help"""
         self.assertRaises(SystemExit, self.main, ['create', '--help'])
 
     def testlisthelp(self):
+        """Test wic list --help"""
         self.assertRaises(SystemExit, self.main, ['list', '--help'])
diff --git a/scripts/tests/02_wic_test_directdisk.py b/scripts/tests/02_wic_test_directdisk.py
index 9108621..6beff71 100644
--- a/scripts/tests/02_wic_test_directdisk.py
+++ b/scripts/tests/02_wic_test_directdisk.py
@@ -48,10 +48,12 @@ class TestWicDirectdisk(unittest.TestCase):
                                 "directdisk-*.direct")))
 
     def testbuild_image_name(self):
+        """Test wic create directdisk --image-name core-image-minimal"""
         self._build(["create", "directdisk",
                      "--image-name", "core-image-minimal"])
 
     def testbuild_artifacts(self):
+        """Test wic create directdisk providing all artifacts."""
         self._build(["create", "directdisk",
                      "-b", "tmp/sysroots/qemux86/usr/share",
                      "-k", "tmp/deploy/images/qemux86",
-- 
2.1.4


