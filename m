Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 071496C99C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2013 09:28:09 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 20 Sep 2013 02:28:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,943,1371106800"; d="scan'208";a="363220964"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.234])
	by azsmga001.ch.intel.com with ESMTP; 20 Sep 2013 02:28:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Sep 2013 10:27:53 +0100
Message-Id: <eeb53fbd958c9d911de7da7e3ceb41518e99820b.1379669217.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1379669217.git.paul.eggleton@linux.intel.com>
References: <cover.1379669217.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1379669217.git.paul.eggleton@linux.intel.com>
References: <cover.1379669217.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/5] classes/imagetest-qemu: remove old image testing class
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
X-List-Received-Date: Fri, 20 Sep 2013 09:28:10 -0000

This has now been superseded by testimage.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/imagetest-qemu.bbclass                | 238 -------
 meta/classes/populate_sdk_base.bbclass             |   3 -
 meta/conf/layer.conf                               |   3 -
 scripts/qemuimage-testlib                          | 760 ---------------------
 scripts/qemuimage-testlib-pythonhelper             |  66 --
 scripts/qemuimage-tests/sanity/boot                |  29 -
 scripts/qemuimage-tests/sanity/compiler            |  52 --
 scripts/qemuimage-tests/sanity/connman             |  53 --
 scripts/qemuimage-tests/sanity/dmesg               |  52 --
 scripts/qemuimage-tests/sanity/rpm_query           |  52 --
 scripts/qemuimage-tests/sanity/scp                 |  71 --
 scripts/qemuimage-tests/sanity/shutdown            |  76 ---
 scripts/qemuimage-tests/sanity/smart_help          |  52 --
 scripts/qemuimage-tests/sanity/smart_query         |  52 --
 scripts/qemuimage-tests/sanity/ssh                 |  39 --
 .../scenario/qemuarm/core-image-lsb                |   7 -
 .../scenario/qemuarm/core-image-minimal            |   1 -
 .../scenario/qemuarm/core-image-sato               |  11 -
 .../scenario/qemuarm/core-image-sato-sdk           |  12 -
 .../scenario/qemuarm/meta-toolchain-gmae           |   3 -
 .../scenario/qemumips/core-image-lsb               |   7 -
 .../scenario/qemumips/core-image-minimal           |   1 -
 .../scenario/qemumips/core-image-sato              |  11 -
 .../scenario/qemumips/core-image-sato-sdk          |  12 -
 .../scenario/qemumips/meta-toolchain-gmae          |   3 -
 .../scenario/qemuppc/core-image-lsb                |   7 -
 .../scenario/qemuppc/core-image-minimal            |   1 -
 .../scenario/qemuppc/core-image-sato               |  11 -
 .../scenario/qemuppc/core-image-sato-sdk           |  12 -
 .../scenario/qemuppc/meta-toolchain-gmae           |   3 -
 .../scenario/qemux86-64/core-image-lsb             |   7 -
 .../scenario/qemux86-64/core-image-minimal         |   1 -
 .../scenario/qemux86-64/core-image-sato            |  11 -
 .../scenario/qemux86-64/core-image-sato-sdk        |  12 -
 .../scenario/qemux86-64/meta-toolchain-gmae        |   3 -
 .../scenario/qemux86/core-image-lsb                |   7 -
 .../scenario/qemux86/core-image-minimal            |   1 -
 .../scenario/qemux86/core-image-sato               |  11 -
 .../scenario/qemux86/core-image-sato-sdk           |  12 -
 .../scenario/qemux86/meta-toolchain-gmae           |   3 -
 scripts/qemuimage-tests/systemusage/bash           |  53 --
 scripts/qemuimage-tests/systemusage/df             |  54 --
 scripts/qemuimage-tests/systemusage/syslog         |  54 --
 scripts/qemuimage-tests/toolchain/cvs              |  31 -
 scripts/qemuimage-tests/toolchain/iptables         |  31 -
 scripts/qemuimage-tests/toolchain/sudoku-savant    |  31 -
 scripts/qemuimage-tests/tools/bash.sh              |  17 -
 scripts/qemuimage-tests/tools/compiler_test.sh     | 137 ----
 scripts/qemuimage-tests/tools/connman_test.sh      |  75 --
 scripts/qemuimage-tests/tools/df.sh                |  25 -
 scripts/qemuimage-tests/tools/dmesg.sh             |  28 -
 scripts/qemuimage-tests/tools/rpm_test.sh          |  45 --
 scripts/qemuimage-tests/tools/smart_test.sh        |  45 --
 scripts/qemuimage-tests/tools/syslog.sh            |  17 -
 54 files changed, 2411 deletions(-)
 delete mode 100644 meta/classes/imagetest-qemu.bbclass
 delete mode 100755 scripts/qemuimage-testlib
 delete mode 100755 scripts/qemuimage-testlib-pythonhelper
 delete mode 100755 scripts/qemuimage-tests/sanity/boot
 delete mode 100755 scripts/qemuimage-tests/sanity/compiler
 delete mode 100755 scripts/qemuimage-tests/sanity/connman
 delete mode 100755 scripts/qemuimage-tests/sanity/dmesg
 delete mode 100755 scripts/qemuimage-tests/sanity/rpm_query
 delete mode 100755 scripts/qemuimage-tests/sanity/scp
 delete mode 100755 scripts/qemuimage-tests/sanity/shutdown
 delete mode 100755 scripts/qemuimage-tests/sanity/smart_help
 delete mode 100755 scripts/qemuimage-tests/sanity/smart_query
 delete mode 100755 scripts/qemuimage-tests/sanity/ssh
 delete mode 100644 scripts/qemuimage-tests/scenario/qemuarm/core-image-lsb
 delete mode 100644 scripts/qemuimage-tests/scenario/qemuarm/core-image-minimal
 delete mode 100644 scripts/qemuimage-tests/scenario/qemuarm/core-image-sato
 delete mode 100644 scripts/qemuimage-tests/scenario/qemuarm/core-image-sato-sdk
 delete mode 100644 scripts/qemuimage-tests/scenario/qemuarm/meta-toolchain-gmae
 delete mode 100644 scripts/qemuimage-tests/scenario/qemumips/core-image-lsb
 delete mode 100644 scripts/qemuimage-tests/scenario/qemumips/core-image-minimal
 delete mode 100644 scripts/qemuimage-tests/scenario/qemumips/core-image-sato
 delete mode 100644 scripts/qemuimage-tests/scenario/qemumips/core-image-sato-sdk
 delete mode 100644 scripts/qemuimage-tests/scenario/qemumips/meta-toolchain-gmae
 delete mode 100644 scripts/qemuimage-tests/scenario/qemuppc/core-image-lsb
 delete mode 100644 scripts/qemuimage-tests/scenario/qemuppc/core-image-minimal
 delete mode 100644 scripts/qemuimage-tests/scenario/qemuppc/core-image-sato
 delete mode 100644 scripts/qemuimage-tests/scenario/qemuppc/core-image-sato-sdk
 delete mode 100644 scripts/qemuimage-tests/scenario/qemuppc/meta-toolchain-gmae
 delete mode 100644 scripts/qemuimage-tests/scenario/qemux86-64/core-image-lsb
 delete mode 100644 scripts/qemuimage-tests/scenario/qemux86-64/core-image-minimal
 delete mode 100644 scripts/qemuimage-tests/scenario/qemux86-64/core-image-sato
 delete mode 100644 scripts/qemuimage-tests/scenario/qemux86-64/core-image-sato-sdk
 delete mode 100644 scripts/qemuimage-tests/scenario/qemux86-64/meta-toolchain-gmae
 delete mode 100644 scripts/qemuimage-tests/scenario/qemux86/core-image-lsb
 delete mode 100644 scripts/qemuimage-tests/scenario/qemux86/core-image-minimal
 delete mode 100644 scripts/qemuimage-tests/scenario/qemux86/core-image-sato
 delete mode 100644 scripts/qemuimage-tests/scenario/qemux86/core-image-sato-sdk
 delete mode 100644 scripts/qemuimage-tests/scenario/qemux86/meta-toolchain-gmae
 delete mode 100755 scripts/qemuimage-tests/systemusage/bash
 delete mode 100755 scripts/qemuimage-tests/systemusage/df
 delete mode 100755 scripts/qemuimage-tests/systemusage/syslog
 delete mode 100755 scripts/qemuimage-tests/toolchain/cvs
 delete mode 100755 scripts/qemuimage-tests/toolchain/iptables
 delete mode 100755 scripts/qemuimage-tests/toolchain/sudoku-savant
 delete mode 100644 scripts/qemuimage-tests/tools/bash.sh
 delete mode 100644 scripts/qemuimage-tests/tools/compiler_test.sh
 delete mode 100644 scripts/qemuimage-tests/tools/connman_test.sh
 delete mode 100644 scripts/qemuimage-tests/tools/df.sh
 delete mode 100644 scripts/qemuimage-tests/tools/dmesg.sh
 delete mode 100644 scripts/qemuimage-tests/tools/rpm_test.sh
 delete mode 100644 scripts/qemuimage-tests/tools/smart_test.sh
 delete mode 100644 scripts/qemuimage-tests/tools/syslog.sh

diff --git a/meta/classes/imagetest-qemu.bbclass b/meta/classes/imagetest-qemu.bbclass
deleted file mode 100644
index 7083a99..0000000
--- a/meta/classes/imagetest-qemu.bbclass
+++ /dev/null
@@ -1,238 +0,0 @@
-# Test related variables
-# By default, TEST_DIR is created under WORKDIR
-TEST_DIR ?= "${WORKDIR}/qemuimagetest"
-TEST_LOG ?= "${LOG_DIR}/qemuimagetests"
-TEST_RESULT ?= "${TEST_DIR}/result"
-TEST_TMP ?= "${TEST_DIR}/tmp"
-TEST_SCEN ?= "sanity"
-TEST_STATUS ?= "${TEST_TMP}/status"
-TARGET_IPSAVE ?= "${TEST_TMP}/target_ip"
-TEST_SERIALIZE ?= "1"
-
-python do_qemuimagetest() {
-    qemuimagetest_main(d)
-}
-addtask qemuimagetest before do_build after do_rootfs
-do_qemuimagetest[nostamp] = "1"
-do_qemuimagetest[depends] += "qemu-native:do_populate_sysroot"
-
-python do_qemuimagetest_standalone() {
-    qemuimagetest_main(d)
-}
-addtask qemuimagetest_standalone
-do_qemuimagetest_standalone[nostamp] = "1"
-do_qemuimagetest_standalone[depends] += "qemu-native:do_populate_sysroot"
-
-def qemuimagetest_main(d):
-    import sys
-    import re
-    import shutil
-    import subprocess
-    
-    """
-    Test Controller for automated testing.
-    """
-    
-    casestr = re.compile(r'(?P<scen>\w+\b):(?P<case>\S+$)')
-    resultstr = re.compile(r'\s*(?P<case>\w+)\s*(?P<pass>\d+)\s*(?P<fail>\d+)\s*(?P<noresult>\d+)')
-    machine = d.getVar('MACHINE', True)
-    pname = d.getVar('PN', True)
-    allfstypes = d.getVar("IMAGE_FSTYPES", True).split()
-    testfstypes = [ "ext2", "ext3", "ext4", "jffs2", "btrfs" ]
-    
-    """function to save test cases running status"""
-    def teststatus(test, status, index, length):
-        test_status = d.getVar('TEST_STATUS', True)
-        if not os.path.exists(test_status):
-            raise bb.build.FuncFailed("No test status file existing under TEST_TMP")
-
-        f = open(test_status, "w")
-        f.write("\t%-15s%-15s%-15s%-15s\n" % ("Case", "Status", "Number", "Total"))
-        f.write("\t%-15s%-15s%-15s%-15s\n" % (case, status, index, length))
-        f.close()
-
-    """funtion to run each case under scenario"""
-    def runtest(scen, case, fulltestpath, fstype):
-        resultpath = d.getVar('TEST_RESULT', True)
-        tmppath = d.getVar('TEST_TMP', True)
-
-        """initialize log file for testcase"""
-        logpath = d.getVar('TEST_LOG', True)
-        bb.utils.mkdirhier("%s/%s" % (logpath, scen))
-        caselog = os.path.join(logpath, "%s/log_%s.%s" % (scen, case, d.getVar('DATETIME', True)))
-        subprocess.call("touch %s" % caselog, shell=True)
-        
-        """export TEST_TMP, TEST_RESULT, DEPLOY_DIR and QEMUARCH"""
-        os.environ["PATH"] = d.getVar("PATH", True)
-        os.environ["TEST_TMP"] = tmppath
-        os.environ["TEST_RESULT"] = resultpath
-        os.environ["DEPLOY_DIR"] = d.getVar("DEPLOY_DIR", True)
-        os.environ["QEMUARCH"] = machine
-        os.environ["QEMUTARGET"] = pname
-        os.environ["COREBASE"] = d.getVar("COREBASE", True)
-        os.environ["TOPDIR"] = d.getVar("TOPDIR", True)
-        os.environ["OE_TMPDIR"] = d.getVar("TMPDIR", True)
-        os.environ["TEST_STATUS"] = d.getVar("TEST_STATUS", True)
-        os.environ["TARGET_IPSAVE"] = d.getVar("TARGET_IPSAVE", True)
-        os.environ["TEST_SERIALIZE"] = d.getVar("TEST_SERIALIZE", True)
-        os.environ["SDK_NAME"] = d.getVar("SDK_NAME", True)
-        os.environ["RUNQEMU_LOGFILE"] = d.expand("${T}/log.runqemutest.%s" % os.getpid())
-        os.environ["ROOTFS_EXT"] = fstype
-
-        # Add in all variables from the user's original environment which
-        # haven't subsequntly been set/changed
-        origbbenv = d.getVar("BB_ORIGENV", False) or {}
-        for key in origbbenv:
-            if key in os.environ:
-                continue
-            value = origbbenv.getVar(key, True)
-            if value is not None:
-                os.environ[key] = str(value)
-
-        """run Test Case"""
-        bb.note("Run %s test in scenario %s" % (case, scen))
-        subprocess.call("%s" % fulltestpath, shell=True)
-    
-    """function to check testcase list and remove inappropriate cases"""
-    def check_list(list):
-        final_list = []
-        for test in list:
-            (scen, case, fullpath) = test
-
-            """Skip rpm/smart if package_rpm not set for PACKAGE_CLASSES"""
-            if case.find("smart") != -1 or case.find("rpm") != -1:
-                if d.getVar("PACKAGE_CLASSES", True).find("rpm", 0, 11) == -1:
-                    bb.note("skip rpm/smart cases since package_rpm not set in PACKAGE_CLASSES")
-                    continue
-                else:
-                    final_list.append((scen, case, fullpath))
-            else:
-                    final_list.append((scen, case, fullpath))
-
-        if not final_list:
-            raise bb.build.FuncFailed("There is no suitable testcase for this target")
-
-        return final_list
-
-    """Generate testcase list in runtime"""
-    def generate_list(testlist):
-        list = []
-        final_list = []
-        if len(testlist) == 0:
-            raise bb.build.FuncFailed("No testcase defined in TEST_SCEN")
-
-        """check testcase folder and add case list according to TEST_SCEN"""
-        for item in testlist.split(" "):
-            n = casestr.match(item)
-            if n:
-                item = n.group('scen')
-                casefile = n.group('case')
-                for dir in d.getVar("QEMUIMAGETESTS", True).split():
-                    fulltestcase = os.path.join(dir, item, casefile)
-                    if not os.path.isfile(fulltestcase):
-                        raise bb.build.FuncFailed("Testcase %s not found" % fulltestcase)
-                    list.append((item, casefile, fulltestcase))
-            else:
-                for dir in d.getVar("QEMUIMAGETESTS", True).split():
-                    scenlist = os.path.join(dir, "scenario", machine, pname)
-                    if not os.path.isfile(scenlist):
-                        raise bb.build.FuncFailed("No scenario list file named %s found" % scenlist)
-
-                    f = open(scenlist, "r")
-                    for line in f:
-                        if item != line.split()[0]:
-                            continue
-                        else:
-                            casefile = line.split()[1]
-
-                        fulltestcase = os.path.join(dir, item, casefile)
-                        if not os.path.isfile(fulltestcase):
-                            raise bb.build.FuncFailed("Testcase %s not found" % fulltestcase)
-                        list.append((item, casefile, fulltestcase))
-                    f.close()
-        final_list = check_list(list)
-        return final_list
-
-    """Clean tmp folder for testing"""
-    def clean_tmp():
-        tmppath = d.getVar('TEST_TMP', True)
-
-        if os.path.isdir(tmppath):
-            for f in os.listdir(tmppath):
-                tmpfile = os.path.join(tmppath, f)
-                if os.path.isfile(tmpfile):
-                    os.remove(tmpfile)
-                elif os.path.isdir(tmpfile):
-                    shutil.rmtree(tmpfile, True)
-
-    """Before running testing, clean temp folder first"""
-    clean_tmp()
-
-    """check testcase folder and create test log folder"""
-    testpath = d.getVar('TEST_DIR', True)
-    bb.utils.mkdirhier(testpath)
-    
-    logpath = d.getVar('TEST_LOG', True)
-    bb.utils.mkdirhier(logpath)
-
-    tmppath = d.getVar('TEST_TMP', True)
-    bb.utils.mkdirhier(tmppath)
-
-    """initialize test status file"""
-    test_status = d.getVar('TEST_STATUS', True)
-    if os.path.exists(test_status):
-        os.remove(test_status)
-    subprocess.call("touch %s" % test_status, shell=True)
-
-    """initialize result file"""
-    resultpath = d.getVar('TEST_RESULT', True)
-    bb.utils.mkdirhier(resultpath)
-    resultfile = os.path.join(resultpath, "testresult.%s" % d.getVar('DATETIME', True))
-    sresultfile = os.path.join(resultpath, "testresult.log")
-
-    machine = d.getVar('MACHINE', True)
-
-    if os.path.exists(sresultfile):
-        os.remove(sresultfile)
-    subprocess.call("touch %s" % resultfile, shell=True)
-    os.symlink(resultfile, sresultfile)
-    
-    """generate pre-defined testcase list"""
-    testlist = d.getVar('TEST_SCEN', True)
-    fulllist = generate_list(testlist)
-
-    """Begin testing"""
-    for fstype in allfstypes:
-        if fstype in testfstypes:
-            with open(sresultfile, "a") as f:
-                f.write("\tTest Result for %s %s %s\n" % (machine, pname, fstype))
-                f.write("\t%-15s%-15s%-15s%-15s\n" % ("Testcase", "PASS", "FAIL", "NORESULT"))
-            for index,test in enumerate(fulllist):
-                (scen, case, fullpath) = test
-                teststatus(case, "running", index, (len(fulllist) - 1))
-                runtest(scen, case, fullpath, fstype)
-                teststatus(case, "finished", index, (len(fulllist) - 1))
-    
-    """Print Test Result"""
-    ret = 0
-    f = open(sresultfile, "r")
-    for line in f:
-        m = resultstr.match(line)
-        if m:
-            if m.group('fail') == "1":
-                ret = 1
-            elif m.group('noresult') == "1":
-                ret = 2
-            line = line.strip('\n')
-            bb.note(line)
-        else:
-            line = line.strip('\n')
-            bb.note(line)
-    f.close()
-
-    """Clean temp files for testing"""
-    clean_tmp()
-
-    if ret != 0:
-        raise bb.build.FuncFailed("Some tests failed. Please check the results file: %s and the log files found in: %s." % (resultfile, d.getVar('TEST_LOG', True)))
-
diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index bddcf62..b7ea851 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -1,9 +1,6 @@
 inherit meta toolchain-scripts
 inherit populate_sdk_${IMAGE_PKGTYPE}
 
-IMAGETESTCLASS = "${@oe.utils.ifelse(d.getVar('IMAGETEST'),'imagetest-' + (d.getVar('IMAGETEST') or ""),'')}"
-inherit ${IMAGETESTCLASS}
-
 SDK_DIR = "${WORKDIR}/sdk"
 SDK_OUTPUT = "${SDK_DIR}/image"
 SDK_DEPLOY = "${TMPDIR}/deploy/sdk"
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 31c095c..e249a6a 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -14,9 +14,6 @@ LAYERVERSION_core = "3"
 # Set a variable to get to the top of the metadata location
 COREBASE = '${@os.path.normpath("${LAYERDIR}/../")}'
 
-# Set path to qemu image tests included in this layer
-QEMUIMAGETESTS = "${COREBASE}/scripts/qemuimage-tests"
-
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   sysvinit-inittab \
   shadow-securetty \
diff --git a/scripts/qemuimage-testlib b/scripts/qemuimage-testlib
deleted file mode 100755
index adcdf6b..0000000
--- a/scripts/qemuimage-testlib
+++ /dev/null
@@ -1,760 +0,0 @@
-#!/bin/bash
-# Common function for test
-# Expect should be installed for SSH Testing
-# To execute `runqemu`, NOPASSWD needs to be set in /etc/sudoers for user
-# For example, for user "builder", /etc/sudoers can be like following:
-# #########
-# #Members of the admin group may gain root privileges
-# %builder ALL=(ALL) NOPASSWD: NOPASSWD: ALL
-# #########
-#
-# Author: Jiajun Xu <jiajun.xu@intel.com>
-#
-# This file is licensed under the GNU General Public License,
-# Version 2.
-#
-
-# The folder to hold all scripts running on targets
-TOOLS="$COREBASE/scripts/qemuimage-tests/tools"
-
-# The folder to hold all projects for toolchain testing
-TOOLCHAIN_PROJECTS="$COREBASE/scripts/qemuimage-tests/toolchain_projects"
-
-# Test Directory on target for testing
-TARGET_TEST_DIR="/tmp/test"
-
-# Global variables for process id
-XTERMPID=0
-QEMUPID=0
-
-# Global variable for target ip address
-TARGET_IPADDR=0
-
-# Global variable for test project version during toolchain test
-# Version of cvs is 1.12.13
-# Version of iptables is 1.4.11
-# Version of sudoku-savant is 1.3
-PROJECT_PV=0
-
-# Global variable for test project download URL during toolchain test
-# URL of cvs is http://ftp.gnu.org/non-gnu/cvs/source/feature/1.12.13/cvs-1.12.13.tar.bz2
-# URL of iptables is http://netfilter.org/projects/iptables/files/iptables-1.4.11.tar.bz2
-# URL of sudoku-savant is http://downloads.sourceforge.net/project/sudoku-savant/sudoku-savant/sudoku-savant-1.3/sudoku-savant-1.3.tar.bz2
-PROJECT_DOWNLOAD_URL=0
-
-# SDK folder to hold toolchain tarball
-TOOLCHAIN_DIR="${DEPLOY_DIR}/sdk"
-
-# Toolchain test folder to hold extracted toolchain tarball
-TOOLCHAIN_TEST="/opt"
-
-# common function for information print
-Test_Error()
-{
-	echo -e "\tTest_Error: $*"
-}
-
-Test_Info()
-{
-	echo -e "\tTest_Info: $*"
-}
-
-# function to update target ip address
-# $1 is the process id of the process, which starts the qemu target
-# $2 is the ip address of the target
-Test_Update_IPSAVE()
-{
-	local pid=$1
-	local ip_addr=$2
-
-	if [ "$TEST_SERIALIZE" -eq 1 -a "$pid" != "0" -a "$pid" != "" -a "$ip_addr" != "" -a "$ip_addr" != "" ]; then
-		echo "Saving $pid $ip_addr to $TARGET_IPSAVE"
-		echo "$pid $ip_addr" > $TARGET_IPSAVE
-	fi
-}
-
-# function to copy files from host into target
-# $1 is the ip address of target
-# $2 is the files, which need to be copied into target
-# $3 is the path on target, where files are copied into
-Test_SCP()
-{
-	local ip_addr=$1
-	local src=$2
-	local des=$3
-	local time_out=60
-	local ret=0
-
-	# We use expect to interactive with target by ssh
-	local exp_cmd=`cat << EOF
-eval spawn scp -o UserKnownHostsFile=/dev/null  -o StrictHostKeyChecking=no "$src" root@$ip_addr:"$des"
-set timeout $time_out
-expect {
-    "*assword:" { send "\r"; exp_continue}
-    "*(yes/no)?" { send "yes\r"; exp_continue }
-    eof          { exit [ lindex [wait] 3 ] }
-}
-EOF`
-
-	expect=`which expect`
-	if [ ! -x "$expect" ]; then
-		Test_Error "ERROR: Please install expect"
-		return 1
-	fi
-
-	expect -c "$exp_cmd"
-	ret=$?
-	return $ret
-}
-
-# function to copy files from target to host
-# $1 is the ip address of target
-# $2 is the files, which need to be copied into target
-# $3 is the path on target, where files are copied into
-Test_SCP_From()
-{
-	local ip_addr=$1
-	local src=$2
-	local des=$3
-	local time_out=60
-	local ret=0
-
-	# We use expect to interactive with target by ssh
-	local exp_cmd=`cat << EOF
-eval spawn scp -o UserKnownHostsFile=/dev/null  -o StrictHostKeyChecking=no root@$ip_addr:"$src" "$des"
-set timeout $time_out
-expect {
-    "*assword:" { send "\r"; exp_continue}
-    "*(yes/no)?" { send "yes\r"; exp_continue }
-    eof          { exit [ lindex [wait] 3 ] }
-}
-EOF`
-
-	expect=`which expect`
-	if [ ! -x "$expect" ]; then
-		Test_Error "ERROR: Please install expect"
-		return 1
-	fi
-
-	expect -c "$exp_cmd"
-	ret=$?
-	return $ret
-}
-
-# function to run command in $ip_addr via ssh
-Test_SSH()
-{
-	local ip_addr="$1"
-	local command="$2"
-
-	if [ $# -eq 3 ]; then
-	    local time_out=$3
-	else
-	    local time_out=60
-	fi
-
-	local ret=0
-	local exp_cmd=`cat << EOF
-eval spawn ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no root@$ip_addr "$command"
-set timeout $time_out
-expect {
-    "*assword:" { send "\r"; exp_continue}
-    "*(yes/no)?" { send "yes\r"; exp_continue }
-    eof          { exit [ lindex [wait] 3 ] }
-}
-EOF`
-
-	expect=`which expect`
-	if [ ! -x "$expect" ]; then
-		Test_Error "ERROR: Please install expect"
-		return 1
-	fi
-
-	expect -c "$exp_cmd"
-	ret=$?
-	return $ret
-}
-
-# function to check if ssh is up in $ip_addr
-Test_SSH_UP()
-{
-	local ip_addr=$1
-	local timeout=$2
-	local interval=0
-
-	# If TEST_SERIALIZE is set, use existing running qemu for testing
-	if [ ${TEST_SERIALIZE} -eq 1 -a -e ${TARGET_IPSAVE} ]; then
-		timeout=50
-	fi
-
-	while [ ${interval} -lt ${timeout} ]
-	do
-		Test_SSH ${ip_addr} "hostname"
-		if [ $? -ne 0 ]; then
-			interval=`expr $interval + 10`
-			sleep 10
-		else
-			Test_Info "We can ssh on ${ip_addr} within ${interval} seconds"
-			return 0
-		fi
-
-	done
-
-	Test_Info "We can not ssh on ${ip_addr} in ${timeout} seconds"
-	return 1
-}
-
-# function to prepare target test environment
-# $1 is the ip address of target system
-# $2 is the files, which needs to be copied into target
-Test_Target_Pre()
-{
-	local ip_addr=$1
-	local testscript=$2
-
-	# Create a pre-defined folder for test scripts
-	Test_SSH $ip_addr "mkdir -p $TARGET_TEST_DIR"
-	if [ $? -eq 0 ]; then
-		# Copy test scripts into target
-		Test_SCP $ip_addr $testscript $TARGET_TEST_DIR && return 0
-	else
-		Test_Error "Fail to create $TARGET_TEST_DIR on target"
-		return 1
-	fi
-
-	return 1
-}
-
-# function to record test result in $TEST_RESULT/testresult.log
-Test_Print_Result()
-{
-	local PASS=0
-	local FAIL=0
-	local NORESULT=0
-	if [ $2 -eq 0 ]; then
-		PASS=1
-	elif [ $2 -eq 1 ]; then
-		FAIL=1
-	else
-		NORESULT=1
-	fi
-
-	# Format the output of the test result
-	echo -e "$1 $PASS $FAIL $NORESULT" | awk '{printf("\t"); for(i=1;i<=NF;i++) printf("%-15s",$i); printf("\n");}' >> $TEST_RESULT/testresult.log
-}
-
-# Test_Kill_Qemu to kill child pid with parent pid given
-# $1 is qemu process id, which needs to be killed
-Test_Kill_Qemu()
-{
-	local index=0
-	local total=0
-	local k=0
-
-	# When TEST_SERIALIZE is set, qemu process will not be
-	# killed until all the cases are finished
-	if [ ${TEST_SERIALIZE} -eq 1 -a -e ${TEST_STATUS} ]; then
-		index=`sed -n 2p ${TEST_STATUS} | awk '{print $3}'`
-		total=`sed -n 2p ${TEST_STATUS} | awk '{print $4}'`
-		if [ ${index} != ${total} ]; then
-			Test_Info "Do not kill the qemu process and use it for later testing (step $index of $total)"
-			Test_Update_IPSAVE $XTERMPID $TARGET_IPADDR
-		else
-			k=1
-		fi
-	else
-		k=1
-	fi
-
-	if [ $k -eq 1 ]; then
-		if [ "$QEMUPID" != "0" -a "$QEMUPID" != "" ]; then
-			running=`ps -wwfp $QEMUPID`
-			if [ $? -eq 0 ]; then
-				echo "killing $QEMUPID"
-				kill $QEMUPID
-			fi
-		fi
-		if [ "$XTERMPID" != "0" -a "$XTERMPID" != "" ]; then
-			running=`ps -wwfp $XTERMPID`
-			if [ $? -eq 0 ]; then
-				echo "killing $XTERMPID"
-				kill $XTERMPID
-			fi
-		fi
-	fi
-
-	return
-}
-
-# function to check if network is up
-Test_Check_IP_UP()
-{
-	ping -c1 $1 1> /dev/null
-	if [ $? -ne 0 ]; then
-		Test_Info "IP $1 is not up"
-		return 1
-	else
-		Test_Info "IP $1 is up"
-		return 0
-	fi
-}
-
-# function to find kernel/rootfs image
-Test_Find_Image()
-{
-	where=""
-	kernel=""
-	arch=""
-	target=""
-	extension=""
-	rootfs=""
-
-	while getopts "l:k:a:t:e:" Option
-	do
-		case $Option in
-			l) where="$OPTARG"
-			   ;;
-			k) kernel="$OPTARG"
-			   ;;
-			a) arch="$OPTARG"
-			   ;;
-			t) target="$OPTARG"
-			   ;;
-			e) extension="$OPTARG"
-			   ;;
-			*) echo "invalid option: -$Option" && return 1
-			   ;;
-		 esac
-	done
-
-	if [ ! -z $kernel ]; then
-		if [ -L ${where}/${kernel}-${arch}.${extension} ]; then
-			echo ${where}/${kernel}-${arch}.${extension}
-			return 0
-		else
-			for i in `dir ${where}`
-			do
-				# Exclude qemux86-64 when target is qemux86
-				echo $i | grep "${kernel}.*${arch}.*\.${extension}" | grep -qv "${kernel}.*${arch}-64.*\.${extension}"
-				if [ $? -eq 0 ]; then
-					echo ${where}/${i}
-					return 0
-				fi
-			done
-			return 1
-		fi
-	fi
-
-	if [ ! -z $target ]; then
-		if [ -L ${where}/${target}-${arch}.${extension} ]; then
-			rootfs=`readlink -f ${where}/${target}-${arch}.${extension}`
-			echo ${rootfs}
-			return 0
-		else
-			for i in `dir ${where}`
-			do
-				# Exclude qemux86-64 when target is qemux86
-				echo $i | grep "${target}-${arch}.*\.${extension}" | grep -qv "${target}-${arch}-64.*\.${extension}"
-				if [ $? -eq 0 ]; then
-					echo ${where}/${i}
-					return 0
-				fi
-			done
-			return 1
-		fi
-	fi
-	return 1
-}
-
-# function to parse IP address of target
-# $1 is the pid of qemu startup process
-Test_Fetch_Target_IP()
-{
-	local opid=$1
-	local ip_addr=0
-
-	if [ "$opid" = "0" -o "$opid" = "" ]; then
-		echo ""
-		return
-	fi
-
-	# Check if $1 pid exists and contains ipaddr of target
-	ip_addr=`ps -wwfp $opid | grep -o "192\.168\.7\.[0-9]*::" | awk -F":" '{print $1}'`
-
-	echo $ip_addr
-
-	return
-}
-
-# function to check if qemu and its network
-Test_Create_Qemu()
-{
-	local timeout=$1
-	shift
-	local extraargs="$@"
-	local up_time=0
-
-	RUNQEMU=`which runqemu`
-	if [ $? -ne 0 ]; then
-		Test_Error "Can not find runqemu in \$PATH, return fail"
-		return 1
-	fi
-	
-	if [ "$QEMUARCH" = "qemux86" -o "$QEMUARCH" = "qemux86-64" ]; then
-		KERNEL=$(Test_Find_Image -l ${DEPLOY_DIR}/images -k bzImage -a ${QEMUARCH} -e "bin")
-	elif [ "$QEMUARCH" = "qemuarm" -o "$QEMUARCH" = "spitz" -o "$QEMUARCH" = "borzoi" -o "$QEMUARCH" = "akita" -o "$QEMUARCH" = "nokia800" ]; then
-		KERNEL=$(Test_Find_Image -l ${DEPLOY_DIR}/images -k zImage -a ${QEMUARCH})
-	elif [ "$QEMUARCH" = "qemumips" -o "$QEMUARCH" = "qemuppc" ]; then
-		KERNEL=$(Test_Find_Image -l ${DEPLOY_DIR}/images -k vmlinux -a ${QEMUARCH} -e "bin")
-	fi
-
-	# If there is no kernel image found, return failed directly
-	if [ $? -eq 1 ]; then
-		Test_Info "No kernel image file found under ${DEPLOY_DIR}/images for ${QEMUARCH}, pls. have a check"
-		return 1
-	fi
-	
-	Test_Info "rootfs image extension selected: $ROOTFS_EXT"
-	ROOTFS_IMAGE=$(Test_Find_Image -l ${DEPLOY_DIR}/images -t ${QEMUTARGET} -a ${QEMUARCH} -e "$ROOTFS_EXT")
-
-	# If there is no rootfs image found, return failed directly
-	if [ $? -eq 1 ]; then
-		Test_Info "No ${QEMUTARGET} rootfs image file found under ${DEPLOY_DIR}/images for ${QEMUARCH}, pls. have a check"
-		return 1
-	fi
-
-	TEST_ROOTFS_IMAGE="${TEST_TMP}/${QEMUTARGET}-${QEMUARCH}-test.${ROOTFS_EXT}"
-	
-	CP=`which cp`
-
-	# When TEST_SERIALIZE is set, we use the existing image under tmp folder
-	if [ ${TEST_SERIALIZE} -eq 1 -a -e "$TARGET_IPSAVE" ]; then
-		# If TARGET_IPSAVE exists, check PID of the qemu process from it
-		XTERMPID=`awk '{print $1}' $TARGET_IPSAVE`
-		timeout=50
-	else
-		rm -rf $TEST_ROOTFS_IMAGE
-		echo "Copying rootfs $ROOTFS_IMAGE to $TEST_ROOTFS_IMAGE"
-		$CP $ROOTFS_IMAGE $TEST_ROOTFS_IMAGE
-		if [ $? -ne 0 ]; then
-			Test_Info "Image ${ROOTFS_IMAGE} copy to ${TEST_ROOTFS_IMAGE} failed, return fail"
-			return 1
-		fi
-
-		export MACHINE=$QEMUARCH
-
-		# Create Qemu in localhost VNC Port 1
-		echo "Running xterm -display ${DISPLAY} -e 'OE_TMPDIR=${OE_TMPDIR} ${RUNQEMU} ${KERNEL} ${TEST_ROOTFS_IMAGE} ${extraargs} 2>&1 | tee ${RUNQEMU_LOGFILE} || /bin/sleep 60' &"
-		xterm -display ${DISPLAY} -e "OE_TMPDIR=${OE_TMPDIR} ${RUNQEMU} ${KERNEL} ${TEST_ROOTFS_IMAGE} ${extraargs} 2>&1 | tee ${RUNQEMU_LOGFILE} || /bin/sleep 60" &
-	
-		# Get the pid of the xterm processor, which will be used in Test_Kill_Qemu
-		XTERMPID=$!
-		echo "XTERMPID is $XTERMPID"
-		# When starting, qemu can reexecute itself and change PID so wait a short while for things to settle
-		sleep 5
-	fi
-
-	while [ ${up_time} -lt 30 ]
-	do
-		QEMUPID=`qemuimage-testlib-pythonhelper --findqemu $XTERMPID 2>/dev/null`
-		if [ $? -ne 0 ]; then
-			Test_Info "Wait for qemu up..."
-			up_time=`expr $up_time + 5`
-			sleep 5
-		else
-			Test_Info "Begin to check if qemu network is up"
-			echo "QEMUPID is $QEMUPID"
-			break
-		fi
-	done
-
-	if [ ${up_time} == 30 ]; then
-		Test_Info "No qemu process appeared to start, exiting"
-		ps axww -O ppid
-		Test_Info "Process list dumped for debugging purposes"
-		Test_Info "runqemu output log:"
-		cat ${RUNQEMU_LOGFILE}
-		echo
-		return 1
-	fi
-
-	up_time=0
-	# Parse IP address of target from the qemu command line
-	TARGET_IPADDR=`Test_Fetch_Target_IP $QEMUPID`
-	echo "Target IP is ${TARGET_IPADDR}"
-	if [ "${TARGET_IPADDR}" = "" -o "${TARGET_IPADDR}" = "0" ]; then
-		Test_Info "There is no qemu process or qemu ip address found, return failed"
-		ps -wwf
-		ps axww -O ppid
-		Test_Info "runqemu output log:"
-		cat ${RUNQEMU_LOGFILE}
-		echo
-		return 1
-	fi
-
-	while [ ${up_time} -lt ${timeout} ]
-	do
-		Test_Check_IP_UP ${TARGET_IPADDR}
-		if [ $? -eq 0 ]; then
-			Test_Info "Qemu Network is up, ping with ${TARGET_IPADDR} is OK within ${up_time} seconds"
-			return 0
-		else
-			Test_Info "Wait for Qemu Network up"
-			up_time=`expr $up_time + 5`
-			sleep 5
-		fi
-	done
-
-	Test_Info "Process list dumped for debugging purposes:"
-	ps axww -O ppid
-	Test_Info "runqemu output log:"
-	cat ${RUNQEMU_LOGFILE}
-	Test_Info "Qemu or its network is not up in ${timeout} seconds"
-	Test_Update_IPSAVE $XTERMPID $TARGET_IPADDR
-	return 1
-}
-
-# Function to prepare test project for toolchain test
-# $1 is the folder holding test project file
-# $2 is the test project name
-Test_Project_Prepare()
-{
-	local toolchain_dir=$1
-
-	if [ ! -d ${toolchain_dir} ]; then
-		mkdir -p ${toolchain_dir}
-		if [ $? -ne 0 ]; then
-			ret=$?
-			Test_Info "Create ${toolchain_dir} fail, return"
-			return $ret
-		fi
-	fi
-
-	# Download test project tarball if it does not exist
-	if [ ! -f ${toolchain_dir}/${2}-${PROJECT_PV}.${suffix} ]; then
-		wget -c -t 5 $PROJECT_DOWNLOAD_URL -O ${toolchain_dir}/${2}-${PROJECT_PV}.${suffix}
-		if [ $? -ne 0 ]; then
-			ret=$?
-			Test_Info "Fail to download ${2}-${PROJECT_PV}.${suffix} from $PROJECT_DOWNLOAD_URL"
-			rm -rf ${toolchain_dir}/${2}-${PROJECT_PV}.${suffix}
-			return $ret
-		fi
-	fi
-
-	# Extract the test project into ${TEST_TMP}
-	tar jxf ${toolchain_dir}/${2}-${PROJECT_PV}.${suffix} -C ${TEST_TMP}
-	if [ $? -ne 0 ]; then
-		ret=$?
-		Test_Info "Fail to extract ${2}-${PROJECT_PV}.${suffix} into ${TEST_TMP}"
-		return $ret
-	fi
-	Test_Info "Extract ${2}-${PROJECT_PV}.${suffix} into ${TEST_TMP} successfully"
-	return 0
-}
-
-# Function to prepare toolchain environment
-# $1 is toolchain directory to hold toolchain tarball
-# $2 is prefix name for toolchain tarball
-Test_Toolchain_Prepare()
-{
-	local toolchain_dir=$1
-	local sdk_name=$2
-	local ret=1
-
-	if [ ! -d ${toolchain_dir} ]; then
-		Test_Info "No directory ${toolchain_dir}, which holds toolchain tarballs"
-		return 1
-	fi
-
-	# Check if there is any toolchain tarball under $toolchain_dir with prefix $sdk_name
-	for i in `dir ${toolchain_dir}`
-	do
-		echo $i | grep "${sdk_name}-toolchain-gmae"
-		if [ $? -eq 0 ]; then
-			rm -rf ${TEST_TMP}/opt
-			tar jxf ${toolchain_dir}/${i} -C ${TEST_TMP}
-			ret=$?
-			break
-		fi
-	done
-
-	if [ $ret -eq 0 ]; then
-		Test_Info "Check if /opt is accessible for non-root user"
-
-		# Check if the non-root test user has write access of $TOOLCHAIN_TEST
-		if [ -d ${TOOLCHAIN_TEST} ]; then
-			touch ${TOOLCHAIN_TEST}
-			if [ $? -ne 0 ]; then
-				Test_Info "Has no right to modify folder $TOOLCHAIN_TEST, pls. chown it to test user"
-				return 2
-			fi
-		else
-			mkdir -p ${TOOLCHAIN_TEST}
-			if [ $? -ne 0 ]; then
-				Test_Info "Has no right to create folder $TOOLCHAIN_TEST, pls. create it and chown it to test user"
-				return 2
-			fi
-		fi
-
-		# If there is a toolchain folder under $TOOLCHAIN_TEST, let's remove it
-		if [ -d ${TOOLCHAIN_TEST}/poky ]; then
-			rm -rf ${TOOLCHAIN_TEST}/poky
-		fi
-
-		# Copy toolchain into $TOOLCHAIN_TEST
-		cp -r ${TEST_TMP}/opt/poky ${TOOLCHAIN_TEST}
-		ret=$?
-
-		if [ $ret -eq 0 ]; then
-			Test_Info "Successfully copy toolchain into $TOOLCHAIN_TEST"
-			return $ret
-		else
-			Test_Info "Meet error when copy toolchain into $TOOLCHAIN_TEST"
-			return $ret
-		fi
-	else
-		Test_Info "No tarball named ${sdk_name}-toolchain-gmae under ${toolchain_dir}"
-		return $ret
-	fi
-}
-
-# Function to execute command and exit if run out of time
-# $1 is timeout value
-# $2 is the command to be executed
-Test_Time_Out()
-{
-	local timeout=$1
-	shift
-	local command=$*
-	local date=0
-	local tmp=`mktemp`
-	local ret=1
-	local pid=0
-	local ppid=0
-	local i=0
-	declare local pid_l
-
-	# Run command in background
-	($command; echo $? > $tmp) &
-	pid=$!
-	while ps -e -o pid | grep -qw $pid; do
-		if [ $date -ge $timeout ]; then
-			Test_Info "$timeout Timeout when running command $command"
-			rm -rf $tmp
-
-			# Find all child processes of pid and kill them
-			ppid=$pid
-			ps -f --ppid $ppid
-			ret=$?
-	
-			while [ $ret -eq 0 ]
-			do
-				# If yes, get the child pid and check if the child pid has other child pid
-				# Continue the while loop until there is no child pid found
-				pid_l[$i]=`ps -f --ppid $ppid | awk '{if ($2 != "PID") print $2}'`
-				ppid=${pid_l[$i]}
-				i=$((i+1))
-				ps -f --ppid $ppid
-				ret=$?
-			done
-	
-				# Kill these children pids from the last one
-				while [ $i -ne 0 ]
-				do
-					i=$((i-1))
-					kill ${pid_l[$i]}
-					sleep 2
-				done
-	
-				# Kill the parent id
-				kill $pid
-				return 1
-		fi
-		sleep 5
-		date=`expr $date + 5`
-	done
-	ret=`cat $tmp`
-	rm -rf $tmp
-	return $ret
-}
-
-# Function to test toolchain
-# $1 is test project name
-# $2 is the timeout value
-Test_Toolchain()
-{
-	local test_project=$1
-	local timeout=$2
-	local ret=1
-	local suffix="tar.bz2"
-	local env_setup=""
-	local pro_install="${TEST_TMP}/pro_install"
-
-	# Set value for PROJECT_PV and PROJECT_DOWNLOAD_URL accordingly
-	if [ $test_project == "cvs" ]; then
-		PROJECT_PV=1.12.13
-		PROJECT_DOWNLOAD_URL="http://ftp.gnu.org/non-gnu/cvs/source/feature/1.12.13/cvs-1.12.13.tar.bz2"
-	elif [ $test_project == "iptables" ]; then
-		PROJECT_PV=1.4.11
-		PROJECT_DOWNLOAD_URL="http://netfilter.org/projects/iptables/files/iptables-1.4.11.tar.bz2"
-	elif [ $test_project == "sudoku-savant" ]; then
-		PROJECT_PV=1.3
-		PROJECT_DOWNLOAD_URL="http://downloads.sourceforge.net/project/sudoku-savant/sudoku-savant/sudoku-savant-1.3/sudoku-savant-1.3.tar.bz2"
-	else
-		Test_Info "Unknown test project name $test_project"
-		return 1
-	fi
-
-	# Download test project and extract it
-	Test_Project_Prepare $TOOLCHAIN_PROJECTS $test_project
-	if [ $? -ne 0 ]; then
-		Test_Info "Prepare test project file failed"
-		return 1
-	fi
-
-	# Extract toolchain tarball into ${TEST_TMP}
-	Test_Toolchain_Prepare $TOOLCHAIN_DIR $SDK_NAME
-	ret=$?
-	if [ $ret -ne 0 ]; then
-		Test_Info "Prepare toolchain test environment failed"
-		return $ret
-	fi
-
-	if [ ! -d ${pro_install} ]; then
-		mkdir -p ${pro_install}
-	fi
-
-	# Begin to build test project in toolchain environment
-	env_setup=`find ${TOOLCHAIN_TEST}/poky -name "environment-setup*"`
-
-	source $env_setup
-
-	if [ $test_project == "cvs" -o $test_project == "iptables" ]; then
-		cd ${TEST_TMP}/${test_project}-${PROJECT_PV}
-		Test_Time_Out $timeout ./configure ${CONFIGURE_FLAGS} || { Test_Info "configure failed with $test_project"; return 1; }
-		Test_Time_Out $timeout make -j4 || { Test_Info "make failed with $test_project"; return 1; }
-		Test_Time_Out $timeout make install DESTDIR=${pro_install} || { Test_Info "make failed with $test_project"; return 1; }
-		cd -
-		ret=0
-	elif [ $test_project == "sudoku-savant" ]; then
-		cd ${TEST_TMP}/${test_project}-${PROJECT_PV}
-		Test_Time_Out $timeout ./configure ${CONFIGURE_FLAGS} || { Test_Info "configure failed with $test_project"; return 1; }
-		Test_Time_Out $timeout make -j4 || { Test_Info "make failed with $test_project"; return 1; }
-		cd -
-		ret=0
-	else
-		Test_Info "Unknown test project $test_project"
-		ret=1
-	fi
-
-	return $ret
-}
-
-Test_Display_Syslog()
-{
-	local tmplog=`mktemp`
-        Test_SCP_From ${TARGET_IPADDR} /var/log/messages $tmplog
-        echo "System logs:"
-        cat $tmplog
-        rm -f $tmplog
-}
diff --git a/scripts/qemuimage-testlib-pythonhelper b/scripts/qemuimage-testlib-pythonhelper
deleted file mode 100755
index 6435dd8..0000000
--- a/scripts/qemuimage-testlib-pythonhelper
+++ /dev/null
@@ -1,66 +0,0 @@
-#!/usr/bin/env python
-
-import optparse
-import subprocess
-import sys
-import os
-
-parser = optparse.OptionParser(
-    usage = """
-  %prog [options]
-""")
-
-parser.add_option("-q", "--findqemu",
-        help = "find a qemu beneath the process <pid>",
-        action="store", dest="findqemu")
-
-options, args = parser.parse_args(sys.argv)
-
-if options.findqemu:
-    #
-    # Walk the process tree from the process specified looking for a qemu-system. Return its pid.
-    #
-    ps = subprocess.Popen(['ps', 'axww', '-o', 'pid,ppid,command'], stdout=subprocess.PIPE).communicate()[0]
-    processes = ps.split('\n')
-    nfields = len(processes[0].split()) - 1
-    pids = {}
-    commands = {}
-    for row in processes[1:]:
-        data = row.split(None, nfields)
-        if len(data) != 3:
-            continue
-        if data[1] not in pids:
-            pids[data[1]] = []
-        pids[data[1]].append(data[0])
-        commands[data[0]] = data[2]
-
-    if options.findqemu not in pids:
-        sys.stderr.write("No children found matching %s" % options.findqemu)
-        sys.exit(1)
-
-    parents = []
-    newparents = pids[options.findqemu]
-    while newparents:
-        next = []
-        for p in newparents:
-            if p in pids:
-                for n in pids[p]:
-                    if n not in parents and n not in next:
-                        next.append(n)
-
-            if p not in parents:
-                parents.append(p)
-        newparents = next
-    #print "Children matching %s:" % str(parents)
-    for p in parents:
-        # Need to be careful here since runqemu-internal runs "ldd qemu-system-xxxx"
-        # Also, old versions of ldd (2.11) run "LD_XXXX qemu-system-xxxx"
-        basecmd = commands[p].split()[0]
-        basecmd = os.path.basename(basecmd)
-        if "qemu-system" in basecmd and "192.168" in commands[p]:
-            print p
-            sys.exit(0)
-    sys.exit(1)
-else:
-    parser.print_help()
-
diff --git a/scripts/qemuimage-tests/sanity/boot b/scripts/qemuimage-tests/sanity/boot
deleted file mode 100755
index 5a8c01c..0000000
--- a/scripts/qemuimage-tests/sanity/boot
+++ /dev/null
@@ -1,29 +0,0 @@
-#!/bin/bash
-#
-# Boot Test Case for Sanity Test
-# The case boot up the Qemu target with `runqemu qemuxxx`.
-# Then check if qemu and qemu network is up.
-#
-# Author: Jiajun Xu <jiajun.xu@intel.com>
-#
-# This file is licensed under the GNU General Public License,
-# Version 2.
-#
-. $COREBASE/scripts/qemuimage-testlib
-
-TIMEOUT=400
-
-# Start qemu and check its network
-Test_Create_Qemu ${TIMEOUT}
-
-if [ $? -eq 0 ]; then
-	Test_Info "Boot Test PASS"
-	Test_Kill_Qemu
-	Test_Print_Result "Boot" 0
-	exit 0
-else
-	Test_Info "Boot Test FAIL"
-	Test_Kill_Qemu
-	Test_Print_Result "Boot" 1
-	exit 1
-fi
diff --git a/scripts/qemuimage-tests/sanity/compiler b/scripts/qemuimage-tests/sanity/compiler
deleted file mode 100755
index ef07007..0000000
--- a/scripts/qemuimage-tests/sanity/compiler
+++ /dev/null
@@ -1,52 +0,0 @@
-#!/bin/bash
-# Compiler Test Case for Sanity Test
-# The case boot up the Qemu target with `runqemu qemuxxx`.
-# Then check if gcc/g++/make command can work in target.
-#
-# Author: Jiajun Xu <jiajun.xu@intel.com>
-#
-# This file is licensed under the GNU General Public License,
-# Version 2.
-#
-
-. $COREBASE/scripts/qemuimage-testlib
-
-TIMEOUT=400
-RET=1
-
-# Start qemu and check its network
-Test_Create_Qemu ${TIMEOUT}
-
-# If qemu network is up, check ssh service in qemu
-if [ $? -eq 0 ]; then
-	Test_Info "Begin to Test SSH Service in Qemu"
-	Test_SSH_UP ${TARGET_IPADDR} ${TIMEOUT}
-	RET=$?
-else
-	RET=1
-fi
-
-# Check if gcc/g++/make can work in target
-if [ $RET -eq 0 -a -f $TOOLS/compiler_test.sh ]; then
-	# Copy compiler_test.sh into target
-	Test_Target_Pre ${TARGET_IPADDR} $TOOLS/compiler_test.sh
-	if [ $? -eq 0 ]; then
-		# Run compiler_test.sh to check if gcc/g++/make can work in target
-		Test_SSH ${TARGET_IPADDR} "sh $TARGET_TEST_DIR/compiler_test.sh"
-		RET=$?
-	else
-		RET=1
-	fi
-fi
-
-if [ ${RET} -eq 0 ]; then
-	Test_Info "Compiler Test PASS"
-	Test_Kill_Qemu
-	Test_Print_Result "compiler" 0
-	exit 0
-else
-	Test_Info "Compiler FAIL, Pls. check above error log"
-	Test_Kill_Qemu
-	Test_Print_Result "compiler" 1
-	exit 1
-fi
diff --git a/scripts/qemuimage-tests/sanity/connman b/scripts/qemuimage-tests/sanity/connman
deleted file mode 100755
index b333201..0000000
--- a/scripts/qemuimage-tests/sanity/connman
+++ /dev/null
@@ -1,53 +0,0 @@
-#!/bin/bash
-# Conmman Check Test Case for Sanity Test
-# The case boot up the Qemu target with `runqemu qemuxxx`.
-# Then check if connman can work in target.
-#
-# Author: Jiajun Xu <jiajun.xu@intel.com>
-#
-# This file is licensed under the GNU General Public License,
-# Version 2.
-#
-
-. $COREBASE/scripts/qemuimage-testlib
-
-TIMEOUT=400
-RET=1
-
-# Start qemu and check its network
-Test_Create_Qemu ${TIMEOUT}
-
-# If qemu network is up, check ssh service in qemu
-if [ $? -eq 0 ]; then
-	Test_Info "Begin to Test SSH Service in Qemu"
-	Test_SSH_UP ${TARGET_IPADDR} ${TIMEOUT}
-	RET=$?
-else
-	RET=1
-fi
-
-# Check if connman can work in target
-if [ $RET -eq 0 -a -f $TOOLS/connman_test.sh ]; then
-	# Copy connman_test.sh into target
-	Test_Target_Pre ${TARGET_IPADDR} $TOOLS/connman_test.sh
-	if [ $? -eq 0 ]; then
-		# Run connman_test.sh to check if connman can work in target
-		Test_SSH ${TARGET_IPADDR} "sh $TARGET_TEST_DIR/connman_test.sh"
-		RET=$?
-	else
-		RET=1
-	fi
-fi
-
-if [ ${RET} -eq 0 ]; then
-	Test_Info "Connman Test PASS"
-	Test_Kill_Qemu
-	Test_Print_Result "connman" 0
-	exit 0
-else
-	Test_Info "Connman Test FAIL, Pls. check above error log"
-        Test_Display_Syslog
-	Test_Kill_Qemu
-	Test_Print_Result "connman" 1
-	exit 1
-fi
diff --git a/scripts/qemuimage-tests/sanity/dmesg b/scripts/qemuimage-tests/sanity/dmesg
deleted file mode 100755
index aed29e0..0000000
--- a/scripts/qemuimage-tests/sanity/dmesg
+++ /dev/null
@@ -1,52 +0,0 @@
-#!/bin/bash
-# Dmesg Check Test Case for Sanity Test
-# The case boot up the Qemu target with `runqemu qemuxxx`.
-# Then check if there is any error log in dmesg.
-#
-# Author: Jiajun Xu <jiajun.xu@intel.com>
-#
-# This file is licensed under the GNU General Public License,
-# Version 2.
-#
-
-. $COREBASE/scripts/qemuimage-testlib
-
-TIMEOUT=400
-RET=1
-
-# Start qemu and check its network
-Test_Create_Qemu ${TIMEOUT}
-
-# If qemu network is up, check ssh service in qemu
-if [ $? -eq 0 ]; then
-	Test_Info "Begin to Test SSH Service in Qemu"
-	Test_SSH_UP ${TARGET_IPADDR} ${TIMEOUT}
-	RET=$?
-else
-	RET=1
-fi
-
-# Check if there is any error log in dmesg
-if [ $RET -eq 0 -a -f $TOOLS/dmesg.sh ]; then
-	# Copy dmesg.sh into target
-	Test_Target_Pre ${TARGET_IPADDR} $TOOLS/dmesg.sh
-	if [ $? -eq 0 ]; then
-		# Run dmesg.sh to check if there is any error message with command dmesg
-		Test_SSH ${TARGET_IPADDR} "sh $TARGET_TEST_DIR/dmesg.sh"
-		RET=$?
-	else
-		RET=1
-	fi
-fi
-
-if [ ${RET} -eq 0 ]; then
-	Test_Info "Dmesg Test PASS"
-	Test_Kill_Qemu
-	Test_Print_Result "dmesg" 0
-	exit 0
-else
-	Test_Info "Dmesg Test FAIL, Pls. check above error log"
-	Test_Kill_Qemu
-	Test_Print_Result "dmesg" 1
-	exit 1
-fi
diff --git a/scripts/qemuimage-tests/sanity/rpm_query b/scripts/qemuimage-tests/sanity/rpm_query
deleted file mode 100755
index dd652bd..0000000
--- a/scripts/qemuimage-tests/sanity/rpm_query
+++ /dev/null
@@ -1,52 +0,0 @@
-#!/bin/bash
-# RPM Check Test Case for Sanity Test
-# The case boot up the Qemu target with `runqemu qemuxxx`.
-# Then check if rpm command can work in target.
-#
-# Author: Jiajun Xu <jiajun.xu@intel.com>
-#
-# This file is licensed under the GNU General Public License,
-# Version 2.
-#
-
-. $COREBASE/scripts/qemuimage-testlib
-
-TIMEOUT=400
-RET=1
-
-# Start qemu and check its network
-Test_Create_Qemu ${TIMEOUT}
-
-# If qemu network is up, check ssh service in qemu
-if [ $? -eq 0 ]; then
-	Test_Info "Begin to Test SSH Service in Qemu"
-	Test_SSH_UP ${TARGET_IPADDR} ${TIMEOUT}
-	RET=$?
-else
-	RET=1
-fi
-
-# Check if rpm query can work in target
-if [ $RET -eq 0 -a -f $TOOLS/rpm_test.sh ]; then
-	# Copy rpm_test.sh into target
-	Test_Target_Pre ${TARGET_IPADDR} $TOOLS/rpm_test.sh
-	if [ $? -eq 0 ]; then
-		# Run rpm_test.sh to check if rpm query can work in target
-		Test_SSH ${TARGET_IPADDR} "sh $TARGET_TEST_DIR/rpm_test.sh -qa"
-		RET=$?
-	else
-		RET=1
-	fi
-fi
-
-if [ ${RET} -eq 0 ]; then
-	Test_Info "rpm query Test PASS"
-	Test_Kill_Qemu
-	Test_Print_Result "rpm_query" 0
-	exit 0
-else
-	Test_Info "rpm query FAIL, Pls. check above error log"
-	Test_Kill_Qemu
-	Test_Print_Result "rpm_query" 1
-	exit 1
-fi
diff --git a/scripts/qemuimage-tests/sanity/scp b/scripts/qemuimage-tests/sanity/scp
deleted file mode 100755
index b0b693d..0000000
--- a/scripts/qemuimage-tests/sanity/scp
+++ /dev/null
@@ -1,71 +0,0 @@
-#!/bin/bash
-# SCP Test Case for Sanity Test
-# The case boot up the Qemu target with `runqemu qemuxxx`.
-# Then check if file can be copied into target with scp command.
-#
-# Author: Jiajun Xu <jiajun.xu@intel.com>
-#
-# This file is licensed under the GNU General Public License,
-# Version 2.
-#
-
-. $COREBASE/scripts/qemuimage-testlib
-
-TIMEOUT=400
-RET=1
-SPID=0
-i=0
-
-# Start qemu and check its network
-Test_Create_Qemu ${TIMEOUT}
-
-# If qemu network is up, check ssh service in qemu
-if [ $? -eq 0 ]; then
-	Test_Info "Begin to Test SSH Service in Qemu"
-	Test_SSH_UP ${TARGET_IPADDR} ${TIMEOUT}
-	RET=$?
-else
-	RET=1
-fi
-
-# Check if file can be copied from host into target
-# For qemu target, the file is 5M
-if [ $RET -eq 0 ]; then
-	echo $QEMUARCH | grep -q "qemu"
-	
-	if [ $? -eq 0 ]; then
-		dd if=/dev/zero of=${TEST_TMP}/scp_test_file bs=512k count=10
-		Test_SCP ${TARGET_IPADDR} ${TEST_TMP}/scp_test_file /home/root &
-		SPID=$!
-	fi
-	
-	# Check if scp finished or not
-	while [ $i -lt $TIMEOUT ]
-	do
-		ps -fp $SPID > /dev/null
-		if [ $? -ne 0 ]; then
-			RET=0
-			break
-		fi
-		i=$((i+5))
-		sleep 5
-	done
-
-	# Kill scp process if scp is not finished in time
-	if [ $i -ge $TIMEOUT ]; then
-		RET=1
-		kill $SPID
-	fi
-fi
-
-if [ ${RET} -eq 0 ]; then
-	Test_Info "SCP Test PASS"
-	Test_Kill_Qemu
-	Test_Print_Result "SCP" 0
-	exit 0
-else
-	Test_Info "SCP Test FAIL"
-	Test_Kill_Qemu
-	Test_Print_Result "SCP" 1
-	exit 1
-fi
diff --git a/scripts/qemuimage-tests/sanity/shutdown b/scripts/qemuimage-tests/sanity/shutdown
deleted file mode 100755
index c9e931c..0000000
--- a/scripts/qemuimage-tests/sanity/shutdown
+++ /dev/null
@@ -1,76 +0,0 @@
-#!/bin/bash
-# Shutdown Test Case for Sanity Test
-# The case boot up the Qemu target with `runqemu qemuxxx`.
-# Then check if target can shutdown
-# For qemux86/x86-64, we use command "poweroff" for target shutdown
-# For non-x86 targets, we use command "reboot" for target shutdown
-#
-# Author: Jiajun Xu <jiajun.xu@intel.com>
-#
-# This file is licensed under the GNU General Public License,
-# Version 2.
-#
-
-. $COREBASE/scripts/qemuimage-testlib
-
-TIMEOUT=400
-
-RET=1
-i=0
-
-# Start qemu and check its network
-Test_Create_Qemu ${TIMEOUT}
-
-# If qemu network is up, check ssh service in qemu
-if [ $? -eq 0 ]; then
-	Test_Info "Begin to Test SSH Service in Qemu"
-	Test_SSH_UP ${TARGET_IPADDR} ${TIMEOUT}
-	RET=$?
-else
-	RET=1
-fi
-
-# Check if target can shutdown
-if [ $RET -eq 0 ]; then
-	echo $QEMUARCH | grep -q "qemux86"
-
-	# For qemux86/x86-64, command "poweroff" is used
-	# For non x86 qemu targets, command "reboot" is used because of BUG #100
-	if [ $? -eq 0 ]; then
-		Test_SSH ${TARGET_IPADDR} "/sbin/poweroff"
-	else
-		Test_SSH ${TARGET_IPADDR} "/sbin/reboot"
-	fi
-
-	# If qemu start up process ends up, it means shutdown completes
-	while [ $i -lt $TIMEOUT ]
-	do
-		ps -fp $QEMUPID > /dev/null 2> /dev/null
-		if [ $? -ne 0 ]; then
-			RET=0
-			break
-		fi
-		i=$((i+5))
-		sleep 5
-	done
-
-	if [ $i -ge $TIMEOUT ]; then
-		RET=1
-	fi
-fi
-
-if [ ${RET} -eq 0 ]; then
-	Test_Info "Shutdown Test PASS"
-	Test_Print_Result "shutdown" 0
-	
-	# Remove TARGET_IPSAVE since no existing qemu running now
-	if [ -e ${TARGET_IPSAVE} ]; then
-		rm -rf ${TARGET_IPSAVE}
-	fi
-	exit 0
-else
-	Test_Info "Shutdown Test FAIL"
-	Test_Kill_Qemu
-	Test_Print_Result "shutdown" 1
-	exit 1
-fi
diff --git a/scripts/qemuimage-tests/sanity/smart_help b/scripts/qemuimage-tests/sanity/smart_help
deleted file mode 100755
index 0eeac26..0000000
--- a/scripts/qemuimage-tests/sanity/smart_help
+++ /dev/null
@@ -1,52 +0,0 @@
-#!/bin/bash
-# Smart Check Test Case for Sanity Test
-# The case boot up the Qemu target with `runqemu qemuxxx`.
-# Then check if smart command can work in target.
-#
-# Author: Jiajun Xu <jiajun.xu@intel.com>
-#
-# This file is licensed under the GNU General Public License,
-# Version 2.
-#
-
-. $COREBASE/scripts/qemuimage-testlib
-
-TIMEOUT=400
-RET=1
-
-# Start qemu and check its network
-Test_Create_Qemu ${TIMEOUT}
-
-# If qemu network is up, check ssh service in qemu
-if [ $? -eq 0 ]; then
-	Test_Info "Begin to Test SSH Service in Qemu"
-	Test_SSH_UP ${TARGET_IPADDR} ${TIMEOUT}
-	RET=$?
-else
-	RET=1
-fi
-
-# Check if smart --help can work in target
-if [ $RET -eq 0 -a -f $TOOLS/smart_test.sh ]; then
-	# Copy smart_test.sh into target
-	Test_Target_Pre ${TARGET_IPADDR} $TOOLS/smart_test.sh
-	if [ $? -eq 0 ]; then
-		# Run smart_test.sh to check if smart --help can work in target
-		Test_SSH ${TARGET_IPADDR} "sh $TARGET_TEST_DIR/smart_test.sh --help"
-		RET=$?
-	else
-		RET=1
-	fi
-fi
-
-if [ ${RET} -eq 0 ]; then
-	Test_Info "smart --help Test PASS"
-	Test_Kill_Qemu
-	Test_Print_Result "smart_help" 0
-	exit 0
-else
-	Test_Info "smart --help FAIL, Pls. check above error log"
-	Test_Kill_Qemu
-	Test_Print_Result "smart_help" 1
-	exit 1
-fi
diff --git a/scripts/qemuimage-tests/sanity/smart_query b/scripts/qemuimage-tests/sanity/smart_query
deleted file mode 100755
index 779ee63..0000000
--- a/scripts/qemuimage-tests/sanity/smart_query
+++ /dev/null
@@ -1,52 +0,0 @@
-#!/bin/bash
-# Smart Check Test Case for Sanity Test
-# The case boot up the Qemu target with `runqemu qemuxxx`.
-# Then check if smart command can work in target.
-#
-# Author: Jiajun Xu <jiajun.xu@intel.com>
-#
-# This file is licensed under the GNU General Public License,
-# Version 2.
-#
-
-. $COREBASE/scripts/qemuimage-testlib
-
-TIMEOUT=400
-RET=1
-
-# Start qemu and check its network
-Test_Create_Qemu ${TIMEOUT}
-
-# If qemu network is up, check ssh service in qemu
-if [ $? -eq 0 ]; then
-	Test_Info "Begin to Test SSH Service in Qemu"
-	Test_SSH_UP ${TARGET_IPADDR} ${TIMEOUT}
-	RET=$?
-else
-	RET=1
-fi
-
-# Check if smart query can work in target
-if [ $RET -eq 0 -a -f $TOOLS/smart_test.sh ]; then
-	# Copy smart_test.sh into target
-	Test_Target_Pre ${TARGET_IPADDR} $TOOLS/smart_test.sh
-	if [ $? -eq 0 ]; then
-		# Run smart_test.sh to check if smart query can work in target
-		Test_SSH ${TARGET_IPADDR} "sh $TARGET_TEST_DIR/smart_test.sh query avahi*"
-		RET=$?
-	else
-		RET=1
-	fi
-fi
-
-if [ ${RET} -eq 0 ]; then
-	Test_Info "smart query package avahi Test PASS"
-	Test_Kill_Qemu
-	Test_Print_Result "smart_query" 0
-	exit 0
-else
-	Test_Info "smart query package avahi FAIL, Pls. check above error log"
-	Test_Kill_Qemu
-	Test_Print_Result "smart_query" 1
-	exit 1
-fi
diff --git a/scripts/qemuimage-tests/sanity/ssh b/scripts/qemuimage-tests/sanity/ssh
deleted file mode 100755
index 181296b..0000000
--- a/scripts/qemuimage-tests/sanity/ssh
+++ /dev/null
@@ -1,39 +0,0 @@
-#!/bin/bash
-# SSH Test Case for Sanity Test
-# The case boot up the Qemu target with `runqemu qemuxxx`.
-# Then check if ssh service in qemu is up.
-#
-# Author: Jiajun Xu <jiajun.xu@intel.com>
-#
-# This file is licensed under the GNU General Public License,
-# Version 2.
-#
-
-. $COREBASE/scripts/qemuimage-testlib
-
-TIMEOUT=400
-RET=1
-
-# Start qemu and check its network
-Test_Create_Qemu ${TIMEOUT}
-
-# If qemu network is up, check ssh service in qemu
-if [ $? -eq 0 ]; then
-	Test_Info "Begin to Test SSH Service in Qemu"
-	Test_SSH_UP ${TARGET_IPADDR} ${TIMEOUT}
-	RET=$?
-else
-	RET=1
-fi
-
-if [ ${RET} -eq 0 ]; then
-	Test_Info "SSH Test PASS"
-	Test_Kill_Qemu
-	Test_Print_Result "SSH" 0
-	exit 0
-else
-	Test_Info "SSH Test FAIL"
-	Test_Kill_Qemu
-	Test_Print_Result "SSH" 1
-	exit 1
-fi
diff --git a/scripts/qemuimage-tests/scenario/qemuarm/core-image-lsb b/scripts/qemuimage-tests/scenario/qemuarm/core-image-lsb
deleted file mode 100644
index b2977f1..0000000
--- a/scripts/qemuimage-tests/scenario/qemuarm/core-image-lsb
+++ /dev/null
@@ -1,7 +0,0 @@
-sanity ssh
-sanity scp
-sanity smart_help
-sanity smart_query
-sanity rpm_query
-sanity dmesg
-sanity shutdown
diff --git a/scripts/qemuimage-tests/scenario/qemuarm/core-image-minimal b/scripts/qemuimage-tests/scenario/qemuarm/core-image-minimal
deleted file mode 100644
index 0fcc7bb..0000000
--- a/scripts/qemuimage-tests/scenario/qemuarm/core-image-minimal
+++ /dev/null
@@ -1 +0,0 @@
-sanity boot
diff --git a/scripts/qemuimage-tests/scenario/qemuarm/core-image-sato b/scripts/qemuimage-tests/scenario/qemuarm/core-image-sato
deleted file mode 100644
index bef33e8..0000000
--- a/scripts/qemuimage-tests/scenario/qemuarm/core-image-sato
+++ /dev/null
@@ -1,11 +0,0 @@
-sanity ssh
-sanity scp
-sanity smart_help
-sanity smart_query
-sanity rpm_query
-sanity connman
-sanity dmesg
-sanity shutdown
-systemusage bash
-systemusage df
-systemusage syslog
diff --git a/scripts/qemuimage-tests/scenario/qemuarm/core-image-sato-sdk b/scripts/qemuimage-tests/scenario/qemuarm/core-image-sato-sdk
deleted file mode 100644
index 505b0a2..0000000
--- a/scripts/qemuimage-tests/scenario/qemuarm/core-image-sato-sdk
+++ /dev/null
@@ -1,12 +0,0 @@
-sanity ssh
-sanity scp
-sanity smart_help
-sanity smart_query
-sanity rpm_query
-sanity compiler
-sanity connman
-sanity dmesg
-sanity shutdown
-systemusage bash
-systemusage df
-systemusage syslog
diff --git a/scripts/qemuimage-tests/scenario/qemuarm/meta-toolchain-gmae b/scripts/qemuimage-tests/scenario/qemuarm/meta-toolchain-gmae
deleted file mode 100644
index 199176e..0000000
--- a/scripts/qemuimage-tests/scenario/qemuarm/meta-toolchain-gmae
+++ /dev/null
@@ -1,3 +0,0 @@
-toolchain cvs
-toolchain iptables
-toolchain sudoku-savant
diff --git a/scripts/qemuimage-tests/scenario/qemumips/core-image-lsb b/scripts/qemuimage-tests/scenario/qemumips/core-image-lsb
deleted file mode 100644
index b2977f1..0000000
--- a/scripts/qemuimage-tests/scenario/qemumips/core-image-lsb
+++ /dev/null
@@ -1,7 +0,0 @@
-sanity ssh
-sanity scp
-sanity smart_help
-sanity smart_query
-sanity rpm_query
-sanity dmesg
-sanity shutdown
diff --git a/scripts/qemuimage-tests/scenario/qemumips/core-image-minimal b/scripts/qemuimage-tests/scenario/qemumips/core-image-minimal
deleted file mode 100644
index 0fcc7bb..0000000
--- a/scripts/qemuimage-tests/scenario/qemumips/core-image-minimal
+++ /dev/null
@@ -1 +0,0 @@
-sanity boot
diff --git a/scripts/qemuimage-tests/scenario/qemumips/core-image-sato b/scripts/qemuimage-tests/scenario/qemumips/core-image-sato
deleted file mode 100644
index bef33e8..0000000
--- a/scripts/qemuimage-tests/scenario/qemumips/core-image-sato
+++ /dev/null
@@ -1,11 +0,0 @@
-sanity ssh
-sanity scp
-sanity smart_help
-sanity smart_query
-sanity rpm_query
-sanity connman
-sanity dmesg
-sanity shutdown
-systemusage bash
-systemusage df
-systemusage syslog
diff --git a/scripts/qemuimage-tests/scenario/qemumips/core-image-sato-sdk b/scripts/qemuimage-tests/scenario/qemumips/core-image-sato-sdk
deleted file mode 100644
index 505b0a2..0000000
--- a/scripts/qemuimage-tests/scenario/qemumips/core-image-sato-sdk
+++ /dev/null
@@ -1,12 +0,0 @@
-sanity ssh
-sanity scp
-sanity smart_help
-sanity smart_query
-sanity rpm_query
-sanity compiler
-sanity connman
-sanity dmesg
-sanity shutdown
-systemusage bash
-systemusage df
-systemusage syslog
diff --git a/scripts/qemuimage-tests/scenario/qemumips/meta-toolchain-gmae b/scripts/qemuimage-tests/scenario/qemumips/meta-toolchain-gmae
deleted file mode 100644
index 199176e..0000000
--- a/scripts/qemuimage-tests/scenario/qemumips/meta-toolchain-gmae
+++ /dev/null
@@ -1,3 +0,0 @@
-toolchain cvs
-toolchain iptables
-toolchain sudoku-savant
diff --git a/scripts/qemuimage-tests/scenario/qemuppc/core-image-lsb b/scripts/qemuimage-tests/scenario/qemuppc/core-image-lsb
deleted file mode 100644
index b2977f1..0000000
--- a/scripts/qemuimage-tests/scenario/qemuppc/core-image-lsb
+++ /dev/null
@@ -1,7 +0,0 @@
-sanity ssh
-sanity scp
-sanity smart_help
-sanity smart_query
-sanity rpm_query
-sanity dmesg
-sanity shutdown
diff --git a/scripts/qemuimage-tests/scenario/qemuppc/core-image-minimal b/scripts/qemuimage-tests/scenario/qemuppc/core-image-minimal
deleted file mode 100644
index 0fcc7bb..0000000
--- a/scripts/qemuimage-tests/scenario/qemuppc/core-image-minimal
+++ /dev/null
@@ -1 +0,0 @@
-sanity boot
diff --git a/scripts/qemuimage-tests/scenario/qemuppc/core-image-sato b/scripts/qemuimage-tests/scenario/qemuppc/core-image-sato
deleted file mode 100644
index bef33e8..0000000
--- a/scripts/qemuimage-tests/scenario/qemuppc/core-image-sato
+++ /dev/null
@@ -1,11 +0,0 @@
-sanity ssh
-sanity scp
-sanity smart_help
-sanity smart_query
-sanity rpm_query
-sanity connman
-sanity dmesg
-sanity shutdown
-systemusage bash
-systemusage df
-systemusage syslog
diff --git a/scripts/qemuimage-tests/scenario/qemuppc/core-image-sato-sdk b/scripts/qemuimage-tests/scenario/qemuppc/core-image-sato-sdk
deleted file mode 100644
index 505b0a2..0000000
--- a/scripts/qemuimage-tests/scenario/qemuppc/core-image-sato-sdk
+++ /dev/null
@@ -1,12 +0,0 @@
-sanity ssh
-sanity scp
-sanity smart_help
-sanity smart_query
-sanity rpm_query
-sanity compiler
-sanity connman
-sanity dmesg
-sanity shutdown
-systemusage bash
-systemusage df
-systemusage syslog
diff --git a/scripts/qemuimage-tests/scenario/qemuppc/meta-toolchain-gmae b/scripts/qemuimage-tests/scenario/qemuppc/meta-toolchain-gmae
deleted file mode 100644
index 199176e..0000000
--- a/scripts/qemuimage-tests/scenario/qemuppc/meta-toolchain-gmae
+++ /dev/null
@@ -1,3 +0,0 @@
-toolchain cvs
-toolchain iptables
-toolchain sudoku-savant
diff --git a/scripts/qemuimage-tests/scenario/qemux86-64/core-image-lsb b/scripts/qemuimage-tests/scenario/qemux86-64/core-image-lsb
deleted file mode 100644
index b2977f1..0000000
--- a/scripts/qemuimage-tests/scenario/qemux86-64/core-image-lsb
+++ /dev/null
@@ -1,7 +0,0 @@
-sanity ssh
-sanity scp
-sanity smart_help
-sanity smart_query
-sanity rpm_query
-sanity dmesg
-sanity shutdown
diff --git a/scripts/qemuimage-tests/scenario/qemux86-64/core-image-minimal b/scripts/qemuimage-tests/scenario/qemux86-64/core-image-minimal
deleted file mode 100644
index 0fcc7bb..0000000
--- a/scripts/qemuimage-tests/scenario/qemux86-64/core-image-minimal
+++ /dev/null
@@ -1 +0,0 @@
-sanity boot
diff --git a/scripts/qemuimage-tests/scenario/qemux86-64/core-image-sato b/scripts/qemuimage-tests/scenario/qemux86-64/core-image-sato
deleted file mode 100644
index bef33e8..0000000
--- a/scripts/qemuimage-tests/scenario/qemux86-64/core-image-sato
+++ /dev/null
@@ -1,11 +0,0 @@
-sanity ssh
-sanity scp
-sanity smart_help
-sanity smart_query
-sanity rpm_query
-sanity connman
-sanity dmesg
-sanity shutdown
-systemusage bash
-systemusage df
-systemusage syslog
diff --git a/scripts/qemuimage-tests/scenario/qemux86-64/core-image-sato-sdk b/scripts/qemuimage-tests/scenario/qemux86-64/core-image-sato-sdk
deleted file mode 100644
index 505b0a2..0000000
--- a/scripts/qemuimage-tests/scenario/qemux86-64/core-image-sato-sdk
+++ /dev/null
@@ -1,12 +0,0 @@
-sanity ssh
-sanity scp
-sanity smart_help
-sanity smart_query
-sanity rpm_query
-sanity compiler
-sanity connman
-sanity dmesg
-sanity shutdown
-systemusage bash
-systemusage df
-systemusage syslog
diff --git a/scripts/qemuimage-tests/scenario/qemux86-64/meta-toolchain-gmae b/scripts/qemuimage-tests/scenario/qemux86-64/meta-toolchain-gmae
deleted file mode 100644
index 199176e..0000000
--- a/scripts/qemuimage-tests/scenario/qemux86-64/meta-toolchain-gmae
+++ /dev/null
@@ -1,3 +0,0 @@
-toolchain cvs
-toolchain iptables
-toolchain sudoku-savant
diff --git a/scripts/qemuimage-tests/scenario/qemux86/core-image-lsb b/scripts/qemuimage-tests/scenario/qemux86/core-image-lsb
deleted file mode 100644
index b2977f1..0000000
--- a/scripts/qemuimage-tests/scenario/qemux86/core-image-lsb
+++ /dev/null
@@ -1,7 +0,0 @@
-sanity ssh
-sanity scp
-sanity smart_help
-sanity smart_query
-sanity rpm_query
-sanity dmesg
-sanity shutdown
diff --git a/scripts/qemuimage-tests/scenario/qemux86/core-image-minimal b/scripts/qemuimage-tests/scenario/qemux86/core-image-minimal
deleted file mode 100644
index 0fcc7bb..0000000
--- a/scripts/qemuimage-tests/scenario/qemux86/core-image-minimal
+++ /dev/null
@@ -1 +0,0 @@
-sanity boot
diff --git a/scripts/qemuimage-tests/scenario/qemux86/core-image-sato b/scripts/qemuimage-tests/scenario/qemux86/core-image-sato
deleted file mode 100644
index bef33e8..0000000
--- a/scripts/qemuimage-tests/scenario/qemux86/core-image-sato
+++ /dev/null
@@ -1,11 +0,0 @@
-sanity ssh
-sanity scp
-sanity smart_help
-sanity smart_query
-sanity rpm_query
-sanity connman
-sanity dmesg
-sanity shutdown
-systemusage bash
-systemusage df
-systemusage syslog
diff --git a/scripts/qemuimage-tests/scenario/qemux86/core-image-sato-sdk b/scripts/qemuimage-tests/scenario/qemux86/core-image-sato-sdk
deleted file mode 100644
index 505b0a2..0000000
--- a/scripts/qemuimage-tests/scenario/qemux86/core-image-sato-sdk
+++ /dev/null
@@ -1,12 +0,0 @@
-sanity ssh
-sanity scp
-sanity smart_help
-sanity smart_query
-sanity rpm_query
-sanity compiler
-sanity connman
-sanity dmesg
-sanity shutdown
-systemusage bash
-systemusage df
-systemusage syslog
diff --git a/scripts/qemuimage-tests/scenario/qemux86/meta-toolchain-gmae b/scripts/qemuimage-tests/scenario/qemux86/meta-toolchain-gmae
deleted file mode 100644
index 199176e..0000000
--- a/scripts/qemuimage-tests/scenario/qemux86/meta-toolchain-gmae
+++ /dev/null
@@ -1,3 +0,0 @@
-toolchain cvs
-toolchain iptables
-toolchain sudoku-savant
diff --git a/scripts/qemuimage-tests/systemusage/bash b/scripts/qemuimage-tests/systemusage/bash
deleted file mode 100755
index fb9bb5c..0000000
--- a/scripts/qemuimage-tests/systemusage/bash
+++ /dev/null
@@ -1,53 +0,0 @@
-#!/bin/bash
-# on the target, check bash prompt is available or not
-# boot up the qemu target with `runqemu qemuxxx`,
-# then check  bash.
-#
-# Author: veera <veerabrahmamvr@huawei.com>
-#
-# This file is licensed under the GNU General Public License,
-# Version 2.
-#
-
-. $COREBASE/scripts/qemuimage-testlib
-
-TIMEOUT=400
-RET=1
-# Start qemu and check its network
-Test_Create_Qemu ${TIMEOUT}
-
-
-
-# If qemu network is up, check ssh service in qemu
-if [ $? -eq 0 ];then
- Test_Info "Begin to Test SSH Service in Qemu"
- Test_SSH_UP ${TARGET_IPADDR} ${TIMEOUT}
- RET=$?
-else
- RET=1
-fi
-
-# Check bash is working fine or not
-if [ $RET -eq 0 -a -f $TOOLS/bash.sh ]; then
- # Copy bash.sh into target
- Test_Target_Pre ${TARGET_IPADDR} $TOOLS/bash.sh
- if [ $? -eq 0 ]; then
-  # Run bash.sh to check if bash command available or not on the qemuxxx target
-  Test_SSH ${TARGET_IPADDR} "sh $TARGET_TEST_DIR/bash.sh"
-  RET=$?
- else
-  RET=1
- fi
-fi
-
-if [ ${RET} -eq 0 ]; then
- Test_Info "bash Test PASS"
- Test_Kill_Qemu
- Test_Print_Result "bash" 0
- exit 0
-else
- Test_Info "bash Test FAIL, Pls. check above bash"
- Test_Kill_Qemu
- Test_Print_Result "bash" 1
- exit 1
-fi
diff --git a/scripts/qemuimage-tests/systemusage/df b/scripts/qemuimage-tests/systemusage/df
deleted file mode 100755
index 9657b73..0000000
--- a/scripts/qemuimage-tests/systemusage/df
+++ /dev/null
@@ -1,54 +0,0 @@
-#!/bin/bash
-# df -h check test case for function test
-# boot up the qemu target with `runqemu qemuxxx`,
-# then check if df space is fine or not target.
-#
-# Author: veera <veerabrahmamvr@huawei.com>
-#
-# This file is licensed under the GNU General Public License,
-# Version 2.
-#
-
-. $COREBASE/scripts/qemuimage-testlib
-
-TIMEOUT=400
-RET=1
-
-# Start qemu and check its network
-Test_Create_Qemu ${TIMEOUT}
-
-
-
-#If qemu network is up, check ssh service in qemu
-if [ $? -eq 0 ];then
- Test_Info "Begin to Test SSH Service in Qemu"
- Test_SSH_UP ${TARGET_IPADDR} ${TIMEOUT}
- RET=$?
-else
- RET=1
-fi
-
-# Check if disk spcae  space is enough or not(using df command)
-if [ $RET -eq 0 -a -f $TOOLS/df.sh ]; then
- # Copy df.sh into target
- Test_Target_Pre ${TARGET_IPADDR} $TOOLS/df.sh
- if [ $? -eq 0 ]; then
-  # Run df.sh to check if df space is fine or not on the qemuxxx target
-  Test_SSH ${TARGET_IPADDR} "sh $TARGET_TEST_DIR/df.sh"
-  RET=$?
- else
-  RET=1
- fi
-fi
-
-if [ ${RET} -eq 0 ]; then
- Test_Info "df Test PASS"
- Test_Kill_Qemu
- Test_Print_Result "df" 0
- exit 0
-else
- Test_Info "df Test FAIL, Pls. check above df"
- Test_Kill_Qemu
- Test_Print_Result "df" 1
- exit 1
-fi
diff --git a/scripts/qemuimage-tests/systemusage/syslog b/scripts/qemuimage-tests/systemusage/syslog
deleted file mode 100755
index 559f7c1..0000000
--- a/scripts/qemuimage-tests/systemusage/syslog
+++ /dev/null
@@ -1,54 +0,0 @@
-#!/bin/bash
-# syslog Check test Case for function test
-# boot up the Qemu target with `runqemu qemuxxx`.
-# then check if syslog service is working fine or not target.
-#
-# Author: veera <veerabrahmamvr@huawei.com>
-#
-# This file is licensed under the GNU General Public License,
-# Version 2.
-#
-
-. $COREBASE/scripts/qemuimage-testlib
-
-TIMEOUT=400
-RET=1
-
-# Start qemu and check its network
-Test_Create_Qemu ${TIMEOUT}
-
-
-
-# If qemu network is up, check ssh service in qemu
-if [ $? -eq 0 ];then
- Test_Info "Begin to Test SSH Service in Qemu"
- Test_SSH_UP ${TARGET_IPADDR} ${TIMEOUT}
- RET=$?
-else
- RET=1
-fi
-
-# Check if syslog is working fine or not
-if [ $RET -eq 0 -a -f $TOOLS/syslog.sh ]; then
- # Copy syslog.sh into target
- Test_Target_Pre ${TARGET_IPADDR} $TOOLS/syslog.sh
- if [ $? -eq 0 ]; then
-  # Run syslog.sh to check if syslog service is working fine or not on the qemuxxx target
-  Test_SSH ${TARGET_IPADDR} "sh $TARGET_TEST_DIR/syslog.sh"
-  RET=$?
- else
-  RET=1
- fi
-fi
-
-if [ ${RET} -eq 0 ]; then
- Test_Info "syslog Test PASS"
- Test_Kill_Qemu
- Test_Print_Result "syslog" 0
- exit 0
-else
- Test_Info "syslog Test FAIL, Pls. check above syslog"
- Test_Kill_Qemu
- Test_Print_Result "syslog" 1
- exit 1
-fi
diff --git a/scripts/qemuimage-tests/toolchain/cvs b/scripts/qemuimage-tests/toolchain/cvs
deleted file mode 100755
index 871d991..0000000
--- a/scripts/qemuimage-tests/toolchain/cvs
+++ /dev/null
@@ -1,31 +0,0 @@
-#!/bin/bash
-#
-# CVS compile Test for toolchain test
-# The case extract toolchain tarball into temp folder
-# Then compile CVS with the toolchain environment
-#
-# Author: Jiajun Xu <jiajun.xu@intel.com>
-#
-# This file is licensed under the GNU General Public License,
-# Version 2.
-#
-. $COREBASE/scripts/qemuimage-testlib
-
-TIMEOUT=120
-
-# Extract and test toolchain tarball
-Test_Toolchain cvs ${TIMEOUT}
-
-if [ $? -eq 0 ]; then
-	Test_Info "CVS Test PASS"
-	Test_Print_Result "CVS" 0
-	exit 0
-elif [ $? -eq 1 ]; then
-	Test_Info "CVS Test FAIL"
-	Test_Print_Result "CVS" 1
-	exit 1
-else
-	Test_Info "Skip CVS Test due to some configuration problem"
-	Test_Print_Result "CVS" 2
-	exit 2
-fi
diff --git a/scripts/qemuimage-tests/toolchain/iptables b/scripts/qemuimage-tests/toolchain/iptables
deleted file mode 100755
index af89bbe..0000000
--- a/scripts/qemuimage-tests/toolchain/iptables
+++ /dev/null
@@ -1,31 +0,0 @@
-#!/bin/bash
-#
-# iptables compile Test for toolchain test
-# The case extract toolchain tarball into temp folder
-# Then compile iptables with the toolchain environment
-#
-# Author: Jiajun Xu <jiajun.xu@intel.com>
-#
-# This file is licensed under the GNU General Public License,
-# Version 2.
-#
-. $COREBASE/scripts/qemuimage-testlib
-
-TIMEOUT=120
-
-# Extract and test toolchain tarball
-Test_Toolchain iptables ${TIMEOUT}
-
-if [ $? -eq 0 ]; then
-	Test_Info "iptables Test PASS"
-	Test_Print_Result "iptables" 0
-	exit 0
-elif [ $? -eq 1 ]; then
-	Test_Info "iptables Test FAIL"
-	Test_Print_Result "iptables" 1
-	exit 1
-else
-	Test_Info "Skip iptables Test due to some configuration problem"
-	Test_Print_Result "iptables" 2
-	exit 2
-fi
diff --git a/scripts/qemuimage-tests/toolchain/sudoku-savant b/scripts/qemuimage-tests/toolchain/sudoku-savant
deleted file mode 100755
index 3d149de..0000000
--- a/scripts/qemuimage-tests/toolchain/sudoku-savant
+++ /dev/null
@@ -1,31 +0,0 @@
-#!/bin/bash
-#
-# sudoku-savant compile Test for toolchain test
-# The case extract toolchain tarball into temp folder
-# Then compile sudoku-savant with the toolchain environment
-#
-# Author: Jiajun Xu <jiajun.xu@intel.com>
-#
-# This file is licensed under the GNU General Public License,
-# Version 2.
-#
-. $COREBASE/scripts/qemuimage-testlib
-
-TIMEOUT=240
-
-# Extract and test toolchain tarball
-Test_Toolchain sudoku-savant ${TIMEOUT}
-
-if [ $? -eq 0 ]; then
-	Test_Info "sudoku-savant Test PASS"
-	Test_Print_Result "sudoku-savant" 0
-	exit 0
-elif [ $? -eq 1 ]; then
-	Test_Info "sudoku-savant Test FAIL"
-	Test_Print_Result "sudoku-savant" 1
-	exit 1
-else
-	Test_Info "Skip sudoku-savant Test due to some configuration problem"
-	Test_Print_Result "sudoku-savant" 2
-	exit 2
-fi
diff --git a/scripts/qemuimage-tests/tools/bash.sh b/scripts/qemuimage-tests/tools/bash.sh
deleted file mode 100644
index f6958f0..0000000
--- a/scripts/qemuimage-tests/tools/bash.sh
+++ /dev/null
@@ -1,17 +0,0 @@
-#!/bin/sh
-# bash test script running in qemu 
-#
-# Author: veera <veerabrahmamvr@huawei.com>
-#
-# This file is licensed under the GNU General Public License,
-# Version 2.
-#
-
-which bash
-if [ $? -eq 0 ]; then
- echo "QEMU: bash is exist in the target by default"
- exit 0 
-else
- echo "QEMU: No bash command in the qemu target"
- exit 1
-fi
diff --git a/scripts/qemuimage-tests/tools/compiler_test.sh b/scripts/qemuimage-tests/tools/compiler_test.sh
deleted file mode 100644
index 9c30d6d..0000000
--- a/scripts/qemuimage-tests/tools/compiler_test.sh
+++ /dev/null
@@ -1,137 +0,0 @@
-#!/bin/bash
-# compiler test script running in target
-#
-# Author: Jiajun Xu <jiajun.xu@intel.com>
-#
-# This file is licensed under the GNU General Public License,
-# Version 2.
-#
-
-# Prepare test folder for compiler test
-COMPILE_FOLDER="/opt/test/compile_test"
-TEST_FILE="$COMPILE_FOLDER/compile_test.c"
-EXECUTE_FILE="$COMPILE_FOLDER/compile_test"
-TEST_MAKEFILE="$COMPILE_FOLDER/makefile"
-TEST_LIST="gcc g++ make"
-
-if [ ! -d $COMPILE_FOLDER ]; then
-	mkdir -p $COMPILE_FOLDER
-fi
-
-Target_Info()
-{
-	echo -e "\tTARGET: $*"
-}
-
-Target_Err()
-{
-	echo -e "\tTARGET: ##### Error Log #####"
-	$@
-	echo -e "\tTARGET: #####    End    #####"
-}
-
-# Function to generate a c test file for compiler testing
-Gen_File()
-{
-	temp=`mktemp`
-
-	# Generate c/c++ test file for compiler testing
-	echo "#include <stdio.h>" >> $temp
-	echo "#include <math.h>" >> $temp
-	echo "" >> $temp
-	echo "double" >> $temp
-	echo "convert(long long l)" >> $temp
-	echo "{" >> $temp
-	echo "    return (double)l;    // or double(l)" >> $temp
-	echo "}" >> $temp
-	echo "" >> $temp
-	echo "int" >> $temp
-	echo "main(int argc, char * argv[])" >> $temp
-	echo "{" >> $temp
-	echo "    long long l = 10;" >> $temp
-	echo "    double f;" >> $temp
-	echo "" >> $temp
-	echo "    f = convert(l);" >> $temp
-	echo "    printf(\"convert: %lld => %f\n\", l, f);" >> $temp
-	echo "" >> $temp
-	echo "    f = 1234.67;" >> $temp
-	echo "    printf(\"floorf(%f) = %f\n\", f, floorf(f));" >> $temp
-	echo "    return 0;" >> $temp
-	echo "}" >> $temp
-	echo $temp
-}
-
-# Function to generate a makefile for compiler testing
-Gen_Makefile()
-{
-	temp=`mktemp`
-	basename=`basename $EXECUTE_FILE`
-
-	echo -e "$basename: $basename.o" >> $temp
-	echo -e "\tgcc -o $basename $basename.o -lm" >> $temp
-	echo -e "$basename.o: $basename.c" >> $temp
-	echo -e "\tgcc -c $basename.c" >> $temp
-
-	echo $temp
-}
-
-# Generate a c test file for compiler testing
-test_file=`Gen_File`
-
-MOVE=`which mv`
-$MOVE $test_file $TEST_FILE
-
-# Begin compiler test in target
-for cmd in $TEST_LIST
-do
-	which $cmd
-	if [ $? -ne 0 ]; then
-		Target_Info "No $cmd command found"
-		exit 1
-	fi
-
-	if [ "$cmd" == "make" ]; then
-		rm -rf $EXECUTE_FILE
-
-		# For makefile test, we need to generate a makefile and run with a c file
-		makefile=`Gen_Makefile`
-		$MOVE $makefile $TEST_MAKEFILE
-
-		cd `dirname $TEST_MAKEFILE`
-		make
-
-		if [ $? -ne 0 ]; then
-			Target_Info "$cmd running with error, Pls. check error in following"
-			Target_Err make
-			exit 1
-		fi
-	else
-		rm -rf $EXECUTE_FILE
-
-		# For gcc/g++, we compile a c test file and check the output
-		$cmd $TEST_FILE -o $EXECUTE_FILE -lm
-
-		if [ $? -ne 0 ]; then
-			Target_Info "$cmd running with error, Pls. check error in following"
-			Target_Err $cmd $TEST_FILE -o $EXECUTE_FILE -lm
-			exit 1
-		fi
-	fi
-
-		# Check if the binary file generated by $cmd can work without error
-		if [ -f $EXECUTE_FILE ]; then
-			$EXECUTE_FILE
-			if [ $? -ne 0 ]; then
-				Target_Info "$EXECUTE_FILE running with error, Pls. check error in following"
-				Target_Err $EXECUTE_FILE
-				exit 1
-			else
-				Target_Info "$cmd can work without problem in target"
-			fi
-		else
-			Target_Info "No executalbe file $EXECUTE_FILE found, Pls. check the error log"
-			exit 1
-		fi
-done
-
-exit 0
diff --git a/scripts/qemuimage-tests/tools/connman_test.sh b/scripts/qemuimage-tests/tools/connman_test.sh
deleted file mode 100644
index 4c1e2f5..0000000
--- a/scripts/qemuimage-tests/tools/connman_test.sh
+++ /dev/null
@@ -1,75 +0,0 @@
-#!/bin/bash
-# connman test script running in target
-#
-# Author: Jiajun Xu <jiajun.xu@intel.com>
-#
-# This file is licensed under the GNU General Public License,
-# Version 2.
-#
-
-Target_Info()
-{
-	echo -e "\tTARGET: $*"
-}
-
-Target_Err()
-{
-	echo -e "\tTARGET: connman has issue when running, Pls. check the error log"
-	echo -e "\tTARGET: ##### Error Log #####"
-	$1
-	echo -e "\tTARGET: #####    End    #####"
-}
-
-# Check if ps comes from Procps or busybox first
-ls -l `which ps` | grep -q "busybox"
-RET=$?
-
-if [ $RET -eq 0 ]; then
-	PS="ps"
-else
-	PS="ps -ef"
-fi
-
-# Check if connmand is in target
-if [ ! -f /usr/sbin/connmand ]; then
-	Target_Info "No connmand command found"
-	exit 1
-fi
-
-# Check if connmand is running in background
-if [ $RET -eq 0 ]; then
-	count=`ps | awk '{print $5}' | grep -c connmand`
-else
-	count=`ps -eo comm | cut -d " " -f 1 | grep -c connmand`
-fi
-
-if [ $count -ne 1 ]; then
-	Target_Info "connmand has issue when running in background, Pls, check the output of ps"
-	${PS}
-	exit 1
-fi
-
-# Check if there is always only one connmand running in background
-if [ connmand > /dev/null 2>&1 ]; then
-	Target_Info "connmand command run without problem"
-
-	if [ $RET -eq 0 ]; then
-		count=`ps | awk '{print $5}' | grep -c connmand`
-	else
-		count=`ps -eo comm | cut -d " " -f 1 | grep -c connmand`
-	fi
-
-	if [ $count -ne 1 ]; then
-		Target_Info "There are more than one connmand running in background, Pls, check the output of ps"
-		${PS} | grep connmand
-		exit 1
-	else
-		Target_Info "There is always one connmand running in background, test pass"
-		exit 0
-	fi
-else
-	Target_Err connmand
-	exit 1
-fi
-
-exit 0
diff --git a/scripts/qemuimage-tests/tools/df.sh b/scripts/qemuimage-tests/tools/df.sh
deleted file mode 100644
index 280c08e..0000000
--- a/scripts/qemuimage-tests/tools/df.sh
+++ /dev/null
@@ -1,25 +0,0 @@
-#!/bin/bash
-# df test script to check enough disk space for qemu target
-#
-# Author: veera <veerabrahmamvr@huawei.com>
-#
-# This file is licensed under the GNU General Public License,
-# Version 2.
-#taking the size of the each partition
-array_list=(`df -P | tr -s " " | cut -d " " -f4`)
-#Total size of the array
-array_size=`echo ${#array_list[@]}`
-loop_val=1
-#while loop to check the size of partitions are less than 5MB
-while [ $loop_val -lt  $array_size ]
-do 
- #taking each value from the array to check the size 
- value=`echo ${array_list[$loop_val]}`
- if [[ $value -gt 5120 ]];then
-  loop_val=`expr $loop_val + 1`
- else
-  echo "QEMU: df : disk space is not enough"
-  exit 1
- fi 
-done
-exit 0
diff --git a/scripts/qemuimage-tests/tools/dmesg.sh b/scripts/qemuimage-tests/tools/dmesg.sh
deleted file mode 100644
index f0c9318..0000000
--- a/scripts/qemuimage-tests/tools/dmesg.sh
+++ /dev/null
@@ -1,28 +0,0 @@
-#!/bin/bash
-# Dmesg test script running in QEMU
-#
-# Author: Jiajun Xu <jiajun.xu@intel.com>
-#
-# This file is licensed under the GNU General Public License,
-# Version 2.
-#
-
-which dmesg
-if [ $? -ne 0 ]; then
-	echo "QEMU: No dmesg command found"
-	exit 1
-fi
-
-# For now, ignore mmci-pl18x errors on qemuarm which appeared
-# from the 3.8 kernel and are harmless
-dmesg | grep -v mmci-pl18x | grep -iq "error"
-if [ $? -eq 0 ]; then
-	echo "QEMU: There is some error log in dmesg:"
-	echo "QEMU: ##### Error Log ######"
-	dmesg | grep -i "error"
-	echo "QEMU: #####    End     ######"
-	exit 1
-else
-	echo "QEMU: No error log in dmesg"
-	exit 0
-fi
diff --git a/scripts/qemuimage-tests/tools/rpm_test.sh b/scripts/qemuimage-tests/tools/rpm_test.sh
deleted file mode 100644
index 6e6f911..0000000
--- a/scripts/qemuimage-tests/tools/rpm_test.sh
+++ /dev/null
@@ -1,45 +0,0 @@
-#!/bin/bash
-# rpm test script running in target
-#
-# Author: Jiajun Xu <jiajun.xu@intel.com>
-#
-# This file is licensed under the GNU General Public License,
-# Version 2.
-#
-
-Target_Info()
-{
-	echo -e "\tTARGET: $*"
-}
-
-Target_Err()
-{
-	echo -e "\tTARGET: rpm command has issue when running, Pls. check the error log"
-	echo -e "\tTARGET: ##### Error Log #####"
-	$1
-	echo -e "\tTARGET: #####    End    #####"
-}
-
-which rpm
-if [ $? -ne 0 ]; then
-	Target_Info "No rpm command found"
-	exit 1
-fi
-
-if [ rpm > /dev/null 2>&1 ]; then
-	Target_Info "rpm command run without problem"
-else
-	Target_Err rpm
-	exit 1
-fi
-
-# run rpm with specific command parsed to rpm_test.sh
-rpm $* > /dev/null 2>&1
-
-if [ $? -eq 0 ]; then
-	Target_Info "rpm $* work without problem"
-	exit 0
-else
-	Target_Err rpm $*
-	exit 1
-fi
diff --git a/scripts/qemuimage-tests/tools/smart_test.sh b/scripts/qemuimage-tests/tools/smart_test.sh
deleted file mode 100644
index f278a25..0000000
--- a/scripts/qemuimage-tests/tools/smart_test.sh
+++ /dev/null
@@ -1,45 +0,0 @@
-#!/bin/bash
-# smart test script running in target
-#
-# Author: Jiajun Xu <jiajun.xu@intel.com>
-#
-# This file is licensed under the GNU General Public License,
-# Version 2.
-#
-
-Target_Info()
-{
-	echo -e "\tTARGET: $*"
-}
-
-Target_Err()
-{
-	echo -e "\tTARGET: smart command has issue when running, Pls. check the error log"
-	echo -e "\tTARGET: ##### Error Log #####"
-	$1
-	echo -e "\tTARGET: #####    End    #####"
-}
-
-which smart
-if [ $? -ne 0 ]; then
-	Target_Info "No smart command found"
-	exit 1
-fi
-
-if [ smart > /dev/null 2>&1 ]; then
-	Target_Info "smart command run without problem"
-else
-	Target_Err smart
-	exit 1
-fi
-
-# run smart with specific command parsed to smart_test.sh
-smart $* > /dev/null 2>&1
-
-if [ $? -eq 0 ]; then
-	Target_Info "smart $* work without problem"
-	exit 0
-else
-	Target_Err "smart $*"
-	exit 1
-fi
diff --git a/scripts/qemuimage-tests/tools/syslog.sh b/scripts/qemuimage-tests/tools/syslog.sh
deleted file mode 100644
index 9154da3..0000000
--- a/scripts/qemuimage-tests/tools/syslog.sh
+++ /dev/null
@@ -1,17 +0,0 @@
-#!/bin/bash
-# syslog test script running in qemu 
-#
-# Author: veera <veerabrahmamvr@huawei.com>
-#
-# This file is licensed under the GNU General Public License,
-# Version 2.
-#
-
-ps aux | grep -w syslogd | grep -v grep
-if [ $? -eq 0 ]; then
- echo "QEMU: syslogd is running by default"
- exit 0 
-else
- echo "QEMU: syslogd is not running"
- exit 1
-fi
-- 
1.8.1.2


