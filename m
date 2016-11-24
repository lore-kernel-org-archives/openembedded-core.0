Return-Path: <jose.perez.carranza@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3A24E71A5E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 17:12:16 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 24 Nov 2016 09:12:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,543,1473145200"; d="scan'208";a="195327126"
Received: from jgperezc.zpn.intel.com ([10.219.5.150])
	by fmsmga004.fm.intel.com with ESMTP; 24 Nov 2016 09:12:14 -0800
From: jose.perez.carranza@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Nov 2016 11:22:32 -0600
Message-Id: <1480008152-31351-1-git-send-email-jose.perez.carranza@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] runtime: Update test cases numbers for runtime tests
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
X-List-Received-Date: Thu, 24 Nov 2016 17:12:17 -0000

From: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>

Update test case numbers on runtime tests to do match
with templates defined on Testopia for 2.3 release

Signed-off-by: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
---
 meta/lib/oeqa/runtime/buildgalculator.py | 1 +
 meta/lib/oeqa/runtime/kernelmodule.py    | 2 +-
 meta/lib/oeqa/runtime/logrotate.py       | 3 ++-
 meta/lib/oeqa/runtime/pam.py             | 2 +-
 4 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/runtime/buildgalculator.py b/meta/lib/oeqa/runtime/buildgalculator.py
index 28ba29e..220101d 100644
--- a/meta/lib/oeqa/runtime/buildgalculator.py
+++ b/meta/lib/oeqa/runtime/buildgalculator.py
@@ -7,6 +7,7 @@ def setUpModule():
         skipModule("Image doesn't have tools-sdk in IMAGE_FEATURES")
 
 class GalculatorTest(oeRuntimeTest):
+    @testcase(1526)
     @skipUnlessPassed("test_ssh")
     def test_galculator(self):
         try:
diff --git a/meta/lib/oeqa/runtime/kernelmodule.py b/meta/lib/oeqa/runtime/kernelmodule.py
index 38ca184..2ac1bc9 100644
--- a/meta/lib/oeqa/runtime/kernelmodule.py
+++ b/meta/lib/oeqa/runtime/kernelmodule.py
@@ -14,7 +14,7 @@ class KernelModuleTest(oeRuntimeTest):
         self.target.copy_to(os.path.join(oeRuntimeTest.tc.filesdir, "hellomod.c"), "/tmp/hellomod.c")
         self.target.copy_to(os.path.join(oeRuntimeTest.tc.filesdir, "hellomod_makefile"), "/tmp/Makefile")
 
-    @testcase('316')
+    @testcase('1541')
     @skipUnlessPassed('test_ssh')
     @skipUnlessPassed('test_gcc_compile')
     def test_kernel_module(self):
diff --git a/meta/lib/oeqa/runtime/logrotate.py b/meta/lib/oeqa/runtime/logrotate.py
index de300bf..cf88c54 100644
--- a/meta/lib/oeqa/runtime/logrotate.py
+++ b/meta/lib/oeqa/runtime/logrotate.py
@@ -12,6 +12,7 @@ def setUpModule():
 
 class LogrotateTest(oeRuntimeTest):
 
+    @testcase(1544)
     @skipUnlessPassed("test_ssh")
     def test_1_logrotate_setup(self):
         (status, output) = self.target.run('mkdir $HOME/logrotate_dir')
@@ -19,7 +20,7 @@ class LogrotateTest(oeRuntimeTest):
         (status, output) = self.target.run("sed -i \"s#wtmp {#wtmp {\\n    olddir $HOME/logrotate_dir#\" /etc/logrotate.conf")
         self.assertEqual(status, 0, msg = "Could not write to logrotate.conf file. Status and output: %s and %s)" % (status, output))
 
-    @testcase(289)
+    @testcase(1542)
     @skipUnlessPassed("test_1_logrotate_setup")
     def test_2_logrotate(self):
         (status, output) = self.target.run('logrotate -f /etc/logrotate.conf')
diff --git a/meta/lib/oeqa/runtime/pam.py b/meta/lib/oeqa/runtime/pam.py
index c8205c9..b7f2dfa 100644
--- a/meta/lib/oeqa/runtime/pam.py
+++ b/meta/lib/oeqa/runtime/pam.py
@@ -12,7 +12,7 @@ def setUpModule():
 
 class PamBasicTest(oeRuntimeTest):
 
-    @testcase(287)
+    @testcase(1543)
     @skipUnlessPassed('test_ssh')
     def test_pam(self):
         (status, output) = self.target.run('login --help')
-- 
2.1.4


