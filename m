Return-Path: <georgex.l.musat@intel.com>
Received: from mga01.intel.com (unknown [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 38D1466069
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 08:46:42 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 16 May 2014 01:46:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1065,1389772800"; d="scan'208";a="540122207"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 16 May 2014 01:46:42 -0700
Received: from localhost.localdomain (unknown [10.237.112.174])
	by linux.intel.com (Postfix) with ESMTP id B83136A4083;
	Fri, 16 May 2014 01:46:18 -0700 (PDT)
From: Lucian Musat <georgex.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 May 2014 11:44:51 +0300
Message-Id: <1400229891-5302-1-git-send-email-georgex.l.musat@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PTACH V2] oeqa/runtime: Update test names with testopia tc numbers.
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
X-List-Received-Date: Fri, 16 May 2014 08:46:45 -0000

Signed-off-by: Lucian Musat <georgex.l.musat@intel.com>
---
 meta/lib/oeqa/runtime/buildcvs.py      |  4 ++--
 meta/lib/oeqa/runtime/buildiptables.py |  4 ++--
 meta/lib/oeqa/runtime/buildsudoku.py   |  4 ++--
 meta/lib/oeqa/runtime/connman.py       |  8 +++----
 meta/lib/oeqa/runtime/date.py          |  4 ++--
 meta/lib/oeqa/runtime/df.py            |  4 ++--
 meta/lib/oeqa/runtime/dmesg.py         |  4 ++--
 meta/lib/oeqa/runtime/gcc.py           |  6 ++---
 meta/lib/oeqa/runtime/ldd.py           |  8 +++----
 meta/lib/oeqa/runtime/logrotate.py     |  8 +++----
 meta/lib/oeqa/runtime/multilib.py      |  4 ++--
 meta/lib/oeqa/runtime/pam.py           |  4 ++--
 meta/lib/oeqa/runtime/perl.py          |  4 ++--
 meta/lib/oeqa/runtime/ping.py          |  2 +-
 meta/lib/oeqa/runtime/python.py        |  6 ++---
 meta/lib/oeqa/runtime/rpm.py           | 16 ++++++-------
 meta/lib/oeqa/runtime/scanelf.py       |  8 +++----
 meta/lib/oeqa/runtime/scp.py           |  4 ++--
 meta/lib/oeqa/runtime/skeletoninit.py  |  8 +++----
 meta/lib/oeqa/runtime/smart.py         | 42 ++++++++++++++++++----------------
 meta/lib/oeqa/runtime/ssh.py           |  4 ++--
 meta/lib/oeqa/runtime/syslog.py        | 26 ++++++++++-----------
 meta/lib/oeqa/runtime/systemd.py       |  2 +-
 meta/lib/oeqa/runtime/vnc.py           |  4 ++--
 meta/lib/oeqa/runtime/x32lib.py        |  2 +-
 meta/lib/oeqa/runtime/xorg.py          |  8 +++----
 26 files changed, 100 insertions(+), 98 deletions(-)

diff --git a/meta/lib/oeqa/runtime/buildcvs.py b/meta/lib/oeqa/runtime/buildcvs.py
index f1fbf19..6acd283 100644
--- a/meta/lib/oeqa/runtime/buildcvs.py
+++ b/meta/lib/oeqa/runtime/buildcvs.py
@@ -14,8 +14,8 @@ class BuildCvsTest(oeRuntimeTest):
                         "http://ftp.gnu.org/non-gnu/cvs/source/feature/1.12.13/cvs-1.12.13.tar.bz2")
         self.project.download_archive()
 
-    @skipUnlessPassed("test_ssh")
-    def test_cvs(self):
+    @skipUnlessPassed("test_ssh_tc_224")
+    def test_cvs_tc_205(self):
         self.assertEqual(self.project.run_configure(), 0,
                         msg="Running configure failed")
 
diff --git a/meta/lib/oeqa/runtime/buildiptables.py b/meta/lib/oeqa/runtime/buildiptables.py
index f6061a7..a265d1b 100644
--- a/meta/lib/oeqa/runtime/buildiptables.py
+++ b/meta/lib/oeqa/runtime/buildiptables.py
@@ -14,8 +14,8 @@ class BuildIptablesTest(oeRuntimeTest):
                         "http://netfilter.org/projects/iptables/files/iptables-1.4.13.tar.bz2")
         self.project.download_archive()
 
-    @skipUnlessPassed("test_ssh")
-    def test_iptables(self):
+    @skipUnlessPassed("test_ssh_tc_224")
+    def test_iptables_tc_206(self):
         self.assertEqual(self.project.run_configure(), 0,
                         msg="Running configure failed")
 
diff --git a/meta/lib/oeqa/runtime/buildsudoku.py b/meta/lib/oeqa/runtime/buildsudoku.py
index a754f1d..1b16eed 100644
--- a/meta/lib/oeqa/runtime/buildsudoku.py
+++ b/meta/lib/oeqa/runtime/buildsudoku.py
@@ -14,8 +14,8 @@ class SudokuTest(oeRuntimeTest):
                         "http://downloads.sourceforge.net/project/sudoku-savant/sudoku-savant/sudoku-savant-1.3/sudoku-savant-1.3.tar.bz2")
         self.project.download_archive()
 
-    @skipUnlessPassed("test_ssh")
-    def test_sudoku(self):
+    @skipUnlessPassed("test_ssh_tc_224")
+    def test_sudoku_tc_207(self):
         self.assertEqual(self.project.run_configure(), 0,
                         msg="Running configure failed")
 
diff --git a/meta/lib/oeqa/runtime/connman.py b/meta/lib/oeqa/runtime/connman.py
index c036882..bb8f84e 100644
--- a/meta/lib/oeqa/runtime/connman.py
+++ b/meta/lib/oeqa/runtime/connman.py
@@ -16,14 +16,14 @@ class ConnmanTest(oeRuntimeTest):
         else:
             return "Unable to get status or logs for %s" % service
 
-    @skipUnlessPassed('test_ssh')
-    def test_connmand_help(self):
+    @skipUnlessPassed('test_ssh_tc_224')
+    def test_connmand_help_tc_961(self):
         (status, output) = self.target.run('/usr/sbin/connmand --help')
         self.assertEqual(status, 0, msg="status and output: %s and %s" % (status,output))
 
 
-    @skipUnlessPassed('test_connmand_help')
-    def test_connmand_running(self):
+    @skipUnlessPassed('test_connmand_help_tc_961')
+    def test_connmand_running_tc_221(self):
         (status, output) = self.target.run(oeRuntimeTest.pscmd + ' | grep [c]onnmand')
         if status != 0:
             print self.service_status("connman")
diff --git a/meta/lib/oeqa/runtime/date.py b/meta/lib/oeqa/runtime/date.py
index a208e29..a7cf556 100644
--- a/meta/lib/oeqa/runtime/date.py
+++ b/meta/lib/oeqa/runtime/date.py
@@ -4,8 +4,8 @@ import re
 
 class DateTest(oeRuntimeTest):
 
-    @skipUnlessPassed("test_ssh")
-    def test_date(self):
+    @skipUnlessPassed("test_ssh_tc_224")
+    def test_date_tc_211(self):
         (status, output) = self.target.run('date +"%Y-%m-%d %T"')
         self.assertEqual(status, 0, msg="Failed to get initial date, output: %s" % output)
         oldDate = output
diff --git a/meta/lib/oeqa/runtime/df.py b/meta/lib/oeqa/runtime/df.py
index b6da350..78c9e10 100644
--- a/meta/lib/oeqa/runtime/df.py
+++ b/meta/lib/oeqa/runtime/df.py
@@ -5,7 +5,7 @@ from oeqa.utils.decorators import *
 
 class DfTest(oeRuntimeTest):
 
-    @skipUnlessPassed("test_ssh")
-    def test_df(self):
+    @skipUnlessPassed("test_ssh_tc_224")
+    def test_df_tc_234(self):
         (status,output) = self.target.run("df / | sed -n '2p' | awk '{print $4}'")
         self.assertTrue(int(output)>5120, msg="Not enough space on image. Current size is %s" % output)
diff --git a/meta/lib/oeqa/runtime/dmesg.py b/meta/lib/oeqa/runtime/dmesg.py
index 64247ea..0fb6bd5 100644
--- a/meta/lib/oeqa/runtime/dmesg.py
+++ b/meta/lib/oeqa/runtime/dmesg.py
@@ -5,7 +5,7 @@ from oeqa.utils.decorators import *
 
 class DmesgTest(oeRuntimeTest):
 
-    @skipUnlessPassed('test_ssh')
-    def test_dmesg(self):
+    @skipUnlessPassed('test_ssh_tc_224')
+    def test_dmesg_tc_215(self):
         (status, output) = self.target.run('dmesg | grep -v mmci-pl18x | grep -v "error changing net interface name" | grep -iv "dma timeout" | grep -i error')
         self.assertEqual(status, 1, msg = "Error messages in dmesg log: %s" % output)
diff --git a/meta/lib/oeqa/runtime/gcc.py b/meta/lib/oeqa/runtime/gcc.py
index b63badd..0372a55 100644
--- a/meta/lib/oeqa/runtime/gcc.py
+++ b/meta/lib/oeqa/runtime/gcc.py
@@ -15,19 +15,19 @@ class GccCompileTest(oeRuntimeTest):
         oeRuntimeTest.tc.target.copy_to(os.path.join(oeRuntimeTest.tc.filesdir, "test.c"), "/tmp/test.c")
         oeRuntimeTest.tc.target.copy_to(os.path.join(oeRuntimeTest.tc.filesdir, "testmakefile"), "/tmp/testmakefile")
 
-    def test_gcc_compile(self):
+    def test_gcc_compile_tc_203(self):
         (status, output) = self.target.run('gcc /tmp/test.c -o /tmp/test -lm')
         self.assertEqual(status, 0, msg="gcc compile failed, output: %s" % output)
         (status, output) = self.target.run('/tmp/test')
         self.assertEqual(status, 0, msg="running compiled file failed, output %s" % output)
 
-    def test_gpp_compile(self):
+    def test_gpp_compile_tc_200(self):
         (status, output) = self.target.run('g++ /tmp/test.c -o /tmp/test -lm')
         self.assertEqual(status, 0, msg="g++ compile failed, output: %s" % output)
         (status, output) = self.target.run('/tmp/test')
         self.assertEqual(status, 0, msg="running compiled file failed, output %s" % output)
 
-    def test_make(self):
+    def test_make_tc_204(self):
         (status, output) = self.target.run('cd /tmp; make -f testmakefile')
         self.assertEqual(status, 0, msg="running make failed, output %s" % output)
 
diff --git a/meta/lib/oeqa/runtime/ldd.py b/meta/lib/oeqa/runtime/ldd.py
index 4374530..cd5bda2 100644
--- a/meta/lib/oeqa/runtime/ldd.py
+++ b/meta/lib/oeqa/runtime/ldd.py
@@ -8,12 +8,12 @@ def setUpModule():
 
 class LddTest(oeRuntimeTest):
 
-    @skipUnlessPassed('test_ssh')
-    def test_ldd_exists(self):
+    @skipUnlessPassed('test_ssh_tc_224')
+    def test_ldd_exists_tc_962(self):
         (status, output) = self.target.run('which ldd')
         self.assertEqual(status, 0, msg = "ldd does not exist in PATH: which ldd: %s" % output)
 
-    @skipUnlessPassed('test_ldd_exists')
-    def test_ldd_rtldlist_check(self):
+    @skipUnlessPassed('test_ldd_exists_tc_962')
+    def test_ldd_rtldlist_check_tc_239(self):
         (status, output) = self.target.run('for i in $(which ldd | xargs cat | grep "^RTLDLIST"|cut -d\'=\' -f2|tr -d \'"\'); do test -f $i && echo $i && break; done')
         self.assertEqual(status, 0, msg = "ldd path not correct or RTLDLIST files don't exist. ")
diff --git a/meta/lib/oeqa/runtime/logrotate.py b/meta/lib/oeqa/runtime/logrotate.py
index 80489a3..8203fbf 100644
--- a/meta/lib/oeqa/runtime/logrotate.py
+++ b/meta/lib/oeqa/runtime/logrotate.py
@@ -12,15 +12,15 @@ def setUpModule():
 
 class LogrotateTest(oeRuntimeTest):
 
-    @skipUnlessPassed("test_ssh")
-    def test_1_logrotate_setup(self):
+    @skipUnlessPassed("test_ssh_tc_224")
+    def test_1_logrotate_setup_tc_289(self):
         (status, output) = self.target.run('mkdir /home/root/logrotate_dir')
         self.assertEqual(status, 0, msg = "Could not create logrotate_dir. Output: %s" % output)
         (status, output) = self.target.run("sed -i 's#wtmp {#wtmp {\\n    olddir /home/root/logrotate_dir#' /etc/logrotate.conf")
         self.assertEqual(status, 0, msg = "Could not write to logrotate.conf file. Status and output: %s and %s)" % (status, output))
 
-    @skipUnlessPassed("test_1_logrotate_setup")
-    def test_2_logrotate(self):
+    @skipUnlessPassed("test_1_logrotate_setup_tc_289")
+    def test_2_logrotate_tc_289(self):
         (status, output) = self.target.run('logrotate -f /etc/logrotate.conf')
         self.assertEqual(status, 0, msg = "logrotate service could not be reloaded. Status and output: %s and %s" % (status, output))
         output = self.target.run('ls -la /home/root/logrotate_dir/ | wc -l')[1]
diff --git a/meta/lib/oeqa/runtime/multilib.py b/meta/lib/oeqa/runtime/multilib.py
index 13a3b54..e07f885 100644
--- a/meta/lib/oeqa/runtime/multilib.py
+++ b/meta/lib/oeqa/runtime/multilib.py
@@ -10,8 +10,8 @@ def setUpModule():
 
 class MultilibTest(oeRuntimeTest):
 
-    @skipUnlessPassed('test_ssh')
-    def test_file_connman(self):
+    @skipUnlessPassed('test_ssh_tc_224')
+    def test_file_connman_tc_963(self):
         self.assertTrue(oeRuntimeTest.hasPackage('connman-gnome'), msg="This test assumes connman-gnome is installed")
         (status, output) = self.target.run("readelf -h /usr/bin/connman-applet | sed -n '3p' | awk '{print $2}'")
         self.assertEqual(output, "ELF32", msg="connman-applet isn't an ELF32 binary. readelf says: %s" % self.target.run("readelf -h /usr/bin/connman-applet")[1])
diff --git a/meta/lib/oeqa/runtime/pam.py b/meta/lib/oeqa/runtime/pam.py
index 52e1eb8..b5fb851 100644
--- a/meta/lib/oeqa/runtime/pam.py
+++ b/meta/lib/oeqa/runtime/pam.py
@@ -12,8 +12,8 @@ def setUpModule():
 
 class PamBasicTest(oeRuntimeTest):
 
-    @skipUnlessPassed('test_ssh')
-    def test_pam(self):
+    @skipUnlessPassed('test_ssh_tc_224')
+    def test_pam_tc_287(self):
         (status, output) = self.target.run('login --help')
         self.assertEqual(status, 1, msg = "login command does not work as expected. Status and output:%s and %s" %(status, output))
         (status, output) = self.target.run('passwd --help')
diff --git a/meta/lib/oeqa/runtime/perl.py b/meta/lib/oeqa/runtime/perl.py
index c9bb684..647f2a0 100644
--- a/meta/lib/oeqa/runtime/perl.py
+++ b/meta/lib/oeqa/runtime/perl.py
@@ -14,11 +14,11 @@ class PerlTest(oeRuntimeTest):
     def setUpClass(self):
         oeRuntimeTest.tc.target.copy_to(os.path.join(oeRuntimeTest.tc.filesdir, "test.pl"), "/tmp/test.pl")
 
-    def test_perl_exists(self):
+    def test_perl_exists_tc_208(self):
         (status, output) = self.target.run('which perl')
         self.assertEqual(status, 0, msg="Perl binary not in PATH or not on target.")
 
-    def test_perl_works(self):
+    def test_perl_works_tc_208(self):
         (status, output) = self.target.run('perl /tmp/test.pl')
         self.assertEqual(status, 0, msg="Exit status was not 0. Output: %s" % output)
         self.assertEqual(output, "the value of a is 0.01", msg="Incorrect output: %s" % output)
diff --git a/meta/lib/oeqa/runtime/ping.py b/meta/lib/oeqa/runtime/ping.py
index a73c724..fc7720f 100644
--- a/meta/lib/oeqa/runtime/ping.py
+++ b/meta/lib/oeqa/runtime/ping.py
@@ -6,7 +6,7 @@ from oeqa.oetest import oeRuntimeTest
 
 class PingTest(oeRuntimeTest):
 
-    def test_ping(self):
+    def test_ping_tc_964(self):
         output = ''
         count = 0
         endtime = time.time() + 60
diff --git a/meta/lib/oeqa/runtime/python.py b/meta/lib/oeqa/runtime/python.py
index c037ab2..32bac69 100644
--- a/meta/lib/oeqa/runtime/python.py
+++ b/meta/lib/oeqa/runtime/python.py
@@ -14,16 +14,16 @@ class PythonTest(oeRuntimeTest):
     def setUpClass(self):
         oeRuntimeTest.tc.target.copy_to(os.path.join(oeRuntimeTest.tc.filesdir, "test.py"), "/tmp/test.py")
 
-    def test_python_exists(self):
+    def test_python_exists_tc_965(self):
         (status, output) = self.target.run('which python')
         self.assertEqual(status, 0, msg="Python binary not in PATH or not on target.")
 
-    def test_python_stdout(self):
+    def test_python_stdout_tc_965(self):
         (status, output) = self.target.run('python /tmp/test.py')
         self.assertEqual(status, 0, msg="Exit status was not 0. Output: %s" % output)
         self.assertEqual(output, "the value of a is 0.01", msg="Incorrect output: %s" % output)
 
-    def test_python_testfile(self):
+    def test_python_testfile_tc_965(self):
         (status, output) = self.target.run('ls /tmp/testfile.python')
         self.assertEqual(status, 0, msg="Python test file generate failed.")
         
diff --git a/meta/lib/oeqa/runtime/rpm.py b/meta/lib/oeqa/runtime/rpm.py
index 084d22f..51d8428 100644
--- a/meta/lib/oeqa/runtime/rpm.py
+++ b/meta/lib/oeqa/runtime/rpm.py
@@ -13,13 +13,13 @@ def setUpModule():
 
 class RpmBasicTest(oeRuntimeTest):
 
-    @skipUnlessPassed('test_ssh')
-    def test_rpm_help(self):
+    @skipUnlessPassed('test_ssh_tc_224')
+    def test_rpm_help_tc_960(self):
         (status, output) = self.target.run('rpm --help')
         self.assertEqual(status, 0, msg="status and output: %s and %s" % (status,output))
 
-    @skipUnlessPassed('test_rpm_help')
-    def test_rpm_query(self):
+    @skipUnlessPassed('test_rpm_help_tc_960')
+    def test_rpm_query_tc_191(self):
         (status, output) = self.target.run('rpm -q rpm')
         self.assertEqual(status, 0, msg="status and output: %s and %s" % (status,output))
 
@@ -34,13 +34,13 @@ class RpmInstallRemoveTest(oeRuntimeTest):
             testrpmfile = f
         oeRuntimeTest.tc.target.copy_to(os.path.join(rpmdir,testrpmfile), "/tmp/rpm-doc.rpm")
 
-    @skipUnlessPassed('test_rpm_help')
-    def test_rpm_install(self):
+    @skipUnlessPassed('test_rpm_help_tc_960')
+    def test_rpm_install_tc_192(self):
         (status, output) = self.target.run('rpm -ivh /tmp/rpm-doc.rpm')
         self.assertEqual(status, 0, msg="Failed to install rpm-doc package: %s" % output)
 
-    @skipUnlessPassed('test_rpm_install')
-    def test_rpm_remove(self):
+    @skipUnlessPassed('test_rpm_install_tc_192')
+    def test_rpm_remove_tc_194(self):
         (status,output) = self.target.run('rpm -e rpm-doc')
         self.assertEqual(status, 0, msg="Failed to remove rpm-doc package: %s" % output)
 
diff --git a/meta/lib/oeqa/runtime/scanelf.py b/meta/lib/oeqa/runtime/scanelf.py
index b9abf24..0d8c423 100644
--- a/meta/lib/oeqa/runtime/scanelf.py
+++ b/meta/lib/oeqa/runtime/scanelf.py
@@ -11,15 +11,15 @@ class ScanelfTest(oeRuntimeTest):
     def setUp(self):
         self.scancmd = 'scanelf --quiet --recursive --mount --ldpath --path'
 
-    @skipUnlessPassed('test_ssh')
-    def test_scanelf_textrel(self):
+    @skipUnlessPassed('test_ssh_tc_224')
+    def test_scanelf_textrel_tc_966(self):
         # print TEXTREL information
         self.scancmd += " --textrel"
         (status, output) = self.target.run(self.scancmd)
         self.assertEqual(output.strip(), "", "\n".join([self.scancmd, output]))
 
-    @skipUnlessPassed('test_ssh')
-    def test_scanelf_rpath(self):
+    @skipUnlessPassed('test_ssh_tc_224')
+    def test_scanelf_rpath_967(self):
         # print RPATH information
         self.scancmd += " --rpath"
         (status, output) = self.target.run(self.scancmd)
diff --git a/meta/lib/oeqa/runtime/scp.py b/meta/lib/oeqa/runtime/scp.py
index 03095bf..d0db3c2 100644
--- a/meta/lib/oeqa/runtime/scp.py
+++ b/meta/lib/oeqa/runtime/scp.py
@@ -8,8 +8,8 @@ def setUpModule():
 
 class ScpTest(oeRuntimeTest):
 
-    @skipUnlessPassed('test_ssh')
-    def test_scp_file(self):
+    @skipUnlessPassed('test_ssh_tc_224')
+    def test_scp_file_tc_220(self):
         test_log_dir = oeRuntimeTest.tc.d.getVar("TEST_LOG_DIR", True)
         test_file_path = os.path.join(test_log_dir, 'test_scp_file')
         with open(test_file_path, 'w') as test_scp_file:
diff --git a/meta/lib/oeqa/runtime/skeletoninit.py b/meta/lib/oeqa/runtime/skeletoninit.py
index 557e715..8d752e7 100644
--- a/meta/lib/oeqa/runtime/skeletoninit.py
+++ b/meta/lib/oeqa/runtime/skeletoninit.py
@@ -12,17 +12,17 @@ def setUpModule():
 
 class SkeletonBasicTest(oeRuntimeTest):
 
-    @skipUnlessPassed('test_ssh')
+    @skipUnlessPassed('test_ssh_tc_224')
     @unittest.skipIf("systemd" == oeRuntimeTest.tc.d.getVar("VIRTUAL-RUNTIME_init_manager"), "Not appropiate for systemd image")
-    def test_skeleton_availability(self):
+    def test_skeleton_availability_tc_284(self):
         (status, output) = self.target.run('ls /etc/init.d/skeleton')
         self.assertEqual(status, 0, msg = "skeleton init script not found. Output:\n%s " % output)
         (status, output) =  self.target.run('ls /usr/sbin/skeleton-test')
         self.assertEqual(status, 0, msg = "skeleton-test not found. Output:\n%s" % output)
 
-    @skipUnlessPassed('test_skeleton_availability')
+    @skipUnlessPassed('test_skeleton_availability_tc_284')
     @unittest.skipIf("systemd" == oeRuntimeTest.tc.d.getVar("VIRTUAL-RUNTIME_init_manager"), "Not appropiate for systemd image")
-    def test_skeleton_script(self):
+    def test_skeleton_script_tc_284(self):
         output1 = self.target.run("/etc/init.d/skeleton start")[1]
         (status, output2) = self.target.run(oeRuntimeTest.pscmd + ' | grep [s]keleton-test')
         self.assertEqual(status, 0, msg = "Skeleton script could not be started:\n%s\n%s" % (output1, output2))
diff --git a/meta/lib/oeqa/runtime/smart.py b/meta/lib/oeqa/runtime/smart.py
index 195f117..a2666bd 100644
--- a/meta/lib/oeqa/runtime/smart.py
+++ b/meta/lib/oeqa/runtime/smart.py
@@ -14,7 +14,7 @@ def setUpModule():
 
 class SmartTest(oeRuntimeTest):
 
-    @skipUnlessPassed('test_smart_help')
+    @skipUnlessPassed('test_smart_help_tc_716')
     def smart(self, command, expected = 0):
         command = 'smart %s' % command
         status, output = self.target.run(command, 1500)
@@ -25,23 +25,23 @@ class SmartTest(oeRuntimeTest):
 
 class SmartBasicTest(SmartTest):
 
-    @skipUnlessPassed('test_ssh')
-    def test_smart_help(self):
+    @skipUnlessPassed('test_ssh_tc_224')
+    def test_smart_help_tc_716(self):
         self.smart('--help')
 
-    def test_smart_version(self):
+    def test_smart_version_tc_715(self):
         self.smart('--version')
 
-    def test_smart_info(self):
+    def test_smart_info_tc_721(self):
         self.smart('info python-smartpm')
 
-    def test_smart_query(self):
+    def test_smart_query_tc_421(self):
         self.smart('query python-smartpm')
 
-    def test_smart_search(self):
+    def test_smart_search_tc_720(self):
         self.smart('search python-smartpm')
 
-    def test_smart_stats(self):
+    def test_smart_stats_tc_722(self):
         self.smart('stats')
 
 class SmartRepoTest(SmartTest):
@@ -54,11 +54,12 @@ class SmartRepoTest(SmartTest):
     @classmethod
     def tearDownClass(self):
         self.repo_server.stop()
+	smartsRepo = SmartRepoTest	
 
     def test_smart_channel(self):
         self.smart('channel', 1)
 
-    def test_smart_channel_add(self):
+    def test_smart_channel_add_tc_719(self):
         image_pkgtype = self.tc.d.getVar('IMAGE_PKGTYPE', True)
         deploy_url = 'http://%s:%s/%s' %(self.target.server_ip, self.repo_server.port, image_pkgtype)
         pkgarchs = self.tc.d.getVar('PACKAGE_ARCHS', True).replace("-","_").split()
@@ -67,38 +68,38 @@ class SmartRepoTest(SmartTest):
                 self.smart('channel -y --add {a} type=rpm-md baseurl={u}/{a}'.format(a=arch, u=deploy_url))
         self.smart('update')
 
-    def test_smart_channel_help(self):
+    def test_smart_channel_help_tc_969(self):
         self.smart('channel --help')
 
-    def test_smart_channel_list(self):
+    def test_smart_channel_list_tc_970(self):
         self.smart('channel --list')
 
-    def test_smart_channel_show(self):
+    def test_smart_channel_show_tc_971(self):
         self.smart('channel --show')
 
-    def test_smart_channel_rpmsys(self):
+    def test_smart_channel_rpmsys_tc_717(self):
         self.smart('channel --show rpmsys')
         self.smart('channel --disable rpmsys')
         self.smart('channel --enable rpmsys')
 
-    @skipUnlessPassed('test_smart_channel_add')
+    @skipUnlessPassed('test_smart_channel_add_tc_719')
     def test_smart_install(self):
         self.smart('remove -y psplash-default')
         self.smart('install -y psplash-default')
 
     @skipUnlessPassed('test_smart_install')
-    def test_smart_install_dependency(self):
+    def test_smart_install_dependency_tc_728(self):
         self.smart('remove -y psplash')
         self.smart('install -y psplash-default')
 
-    @skipUnlessPassed('test_smart_channel_add')
-    def test_smart_install_from_disk(self):
+    @skipUnlessPassed('test_smart_channel_add_tc_719')
+    def test_smart_install_from_disk_tc_723(self):
         self.smart('remove -y psplash-default')
         self.smart('download psplash-default')
         self.smart('install -y ./psplash-default*')
 
-    @skipUnlessPassed('test_smart_channel_add')
-    def test_smart_install_from_http(self):
+    @skipUnlessPassed('test_smart_channel_add_tc_719')
+    def test_smart_install_from_http_tc_725(self):
         output = self.smart('download --urls psplash-default')
         url = re.search('(http://.*/psplash-default.*\.rpm)', output)
         self.assertTrue(url, msg="Couln't find download url in %s" % output)
@@ -106,5 +107,6 @@ class SmartRepoTest(SmartTest):
         self.smart('install -y %s' % url.group(0))
 
     @skipUnlessPassed('test_smart_install')
-    def test_smart_reinstall(self):
+    def test_smart_reinstall_tc_729(self):
         self.smart('reinstall -y psplash-default')
+
diff --git a/meta/lib/oeqa/runtime/ssh.py b/meta/lib/oeqa/runtime/ssh.py
index e648660..ea6bea2 100644
--- a/meta/lib/oeqa/runtime/ssh.py
+++ b/meta/lib/oeqa/runtime/ssh.py
@@ -10,8 +10,8 @@ def setUpModule():
 
 class SshTest(oeRuntimeTest):
 
-    @skipUnlessPassed('test_ping')
-    def test_ssh(self):
+    @skipUnlessPassed('test_ping_tc_964')
+    def test_ssh_tc_224(self):
         (status, output) = self.target.run('uname -a')
         self.assertEqual(status, 0, msg="SSH Test failed: %s" % output)
         (status, output) = self.target.run('cat /etc/masterimage')
diff --git a/meta/lib/oeqa/runtime/syslog.py b/meta/lib/oeqa/runtime/syslog.py
index b95b361..6408d8d 100644
--- a/meta/lib/oeqa/runtime/syslog.py
+++ b/meta/lib/oeqa/runtime/syslog.py
@@ -8,35 +8,35 @@ def setUpModule():
 
 class SyslogTest(oeRuntimeTest):
 
-    @skipUnlessPassed("test_ssh")
-    def test_syslog_help(self):
-        (status,output) = self.target.run('/sbin/syslogd --help')
-        self.assertEqual(status, 0, msg="status and output: %s and %s" % (status,output))
+    @skipUnlessPassed("test_ssh_tc_224")
+    def test_syslog_help_tc_202(self):
+       	(status,output) = self.target.run('/sbin/syslogd --help')
+       	self.assertEqual(status, 0, msg="status and output: %s and %s" % (status,output))
 
-    @skipUnlessPassed("test_syslog_help")
-    def test_syslog_running(self):
+    @skipUnlessPassed("test_syslog_help_tc_202")
+    def test_syslog_running_tc_201(self):
         (status,output) = self.target.run(oeRuntimeTest.pscmd + ' | grep -i [s]yslogd')
         self.assertEqual(status, 0, msg="no syslogd process, ps output: %s" % self.target.run(oeRuntimeTest.pscmd)[1])
 
 
 class SyslogTestConfig(oeRuntimeTest):
 
-    @skipUnlessPassed("test_syslog_running")
-    def test_syslog_logger(self):
+    @skipUnlessPassed("test_syslog_running_tc_201")
+    def test_syslog_logger_tc_202(self):
         (status,output) = self.target.run('logger foobar && test -e /var/log/messages && grep foobar /var/log/messages || logread | grep foobar')
         self.assertEqual(status, 0, msg="Test log string not found in /var/log/messages. Output: %s " % output)
 
-    @skipUnlessPassed("test_syslog_running")
-    def test_syslog_restart(self):
+    @skipUnlessPassed("test_syslog_running_tc_201")
+    def test_syslog_restart_tc_202(self):
         if "systemd" != oeRuntimeTest.tc.d.getVar("VIRTUAL-RUNTIME_init_manager"):
             (status,output) = self.target.run('/etc/init.d/syslog restart')
         else:
             (status,output) = self.target.run('systemctl restart syslog.service')
 
-    @skipUnlessPassed("test_syslog_restart")
-    @skipUnlessPassed("test_syslog_logger")
+    @skipUnlessPassed("test_syslog_restart_tc_202")
+    @skipUnlessPassed("test_syslog_logger_tc_202")
     @unittest.skipIf("systemd" == oeRuntimeTest.tc.d.getVar("VIRTUAL-RUNTIME_init_manager"), "Not appropiate for systemd image")
-    def test_syslog_startup_config(self):
+    def test_syslog_startup_config_tc_202(self):
         self.target.run('echo "LOGFILE=/var/log/test" >> /etc/syslog-startup.conf')
         (status,output) = self.target.run('/etc/init.d/syslog restart')
         self.assertEqual(status, 0, msg="Could not restart syslog service. Status and output: %s and %s" % (status,output))
diff --git a/meta/lib/oeqa/runtime/systemd.py b/meta/lib/oeqa/runtime/systemd.py
index 6de84f8..d308a9b 100644
--- a/meta/lib/oeqa/runtime/systemd.py
+++ b/meta/lib/oeqa/runtime/systemd.py
@@ -24,7 +24,7 @@ class SystemdTest(oeRuntimeTest):
 
 class SystemdBasicTests(SystemdTest):
 
-    @skipUnlessPassed('test_ssh')
+    @skipUnlessPassed('test_ssh_tc_224')
     def test_systemd_basic(self):
         self.systemctl('--version')
 
diff --git a/meta/lib/oeqa/runtime/vnc.py b/meta/lib/oeqa/runtime/vnc.py
index 5ed1072..b224990 100644
--- a/meta/lib/oeqa/runtime/vnc.py
+++ b/meta/lib/oeqa/runtime/vnc.py
@@ -7,8 +7,8 @@ def setUpModule():
 
 class VNCTest(oeRuntimeTest):
 
-    @skipUnlessPassed('test_ssh')
-    def test_vnc(self):
+    @skipUnlessPassed('test_ssh_tc_224')
+    def test_vnc_tc_213(self):
         (status, output) = self.target.run('x11vnc -display :0 -bg -o x11vnc.log')
         self.assertEqual(status, 0, msg="x11vnc server failed to start: %s" % output)
         port = re.search('PORT=[0-9]*', output)
diff --git a/meta/lib/oeqa/runtime/x32lib.py b/meta/lib/oeqa/runtime/x32lib.py
index 6bad201..5195502 100644
--- a/meta/lib/oeqa/runtime/x32lib.py
+++ b/meta/lib/oeqa/runtime/x32lib.py
@@ -10,7 +10,7 @@ def setUpModule():
 
 class X32libTest(oeRuntimeTest):
 
-    @skipUnlessPassed("test_ssh")
+    @skipUnlessPassed("test_ssh_tc_224")
     def test_x32_file(self):
         status1 = self.target.run("readelf -h /bin/ls | grep Class | grep ELF32")[0]
         status2 = self.target.run("readelf -h /bin/ls | grep Machine | grep X86-64")[0]
diff --git a/meta/lib/oeqa/runtime/xorg.py b/meta/lib/oeqa/runtime/xorg.py
index 12dccd8..cc14905 100644
--- a/meta/lib/oeqa/runtime/xorg.py
+++ b/meta/lib/oeqa/runtime/xorg.py
@@ -9,13 +9,13 @@ def setUpModule():
 
 class XorgTest(oeRuntimeTest):
 
-    @skipUnlessPassed('test_ssh')
-    def test_xorg_running(self):
+    @skipUnlessPassed('test_ssh_tc_224')
+    def test_xorg_running_tc_972(self):
         (status, output) = self.target.run(oeRuntimeTest.pscmd + ' |  grep -v xinit | grep [X]org')
         self.assertEqual(status, 0, msg="Xorg does not appear to be running %s" % self.target.run(oeRuntimeTest.pscmd)[1])
 
-    @skipUnlessPassed('test_ssh')
-    def test_xorg_error(self):
+    @skipUnlessPassed('test_ssh_tc_224')
+    def test_xorg_error_tc_972(self):
         (status, output) = self.target.run('cat /var/log/Xorg.0.log | grep -v "(EE) error," | grep -v "PreInit" | grep -v "evdev:" | grep -v "glx" | grep "(EE)"')
         self.assertEqual(status, 1, msg="Errors in Xorg log: %s" % output)
 
-- 
1.9.1


