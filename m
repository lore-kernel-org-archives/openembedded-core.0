Return-Path: <jose.perez.carranza@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 16ED0719B1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Apr 2017 15:00:30 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga104.jf.intel.com with ESMTP; 04 Apr 2017 08:00:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,275,1486454400"; d="scan'208";a="84177618"
Received: from jgperezc-mobl1.zpn.intel.com ([10.219.4.33])
	by fmsmga005.fm.intel.com with ESMTP; 04 Apr 2017 08:00:31 -0700
From: jose.perez.carranza@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Apr 2017 10:02:10 -0500
Message-Id: <20170404150210.3500-1-jose.perez.carranza@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] runtime/dnf : Add ID to the dnf test cases
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
X-List-Received-Date: Tue, 04 Apr 2017 15:00:31 -0000

From: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>

Add the corresponding Testopia ID to the test cases for dnf

Signed-off-by: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
---
 meta/lib/oeqa/runtime/cases/dnf.py | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/dnf.py b/meta/lib/oeqa/runtime/cases/dnf.py
index eb3af07f0f..2f87296b4e 100644
--- a/meta/lib/oeqa/runtime/cases/dnf.py
+++ b/meta/lib/oeqa/runtime/cases/dnf.py
@@ -26,22 +26,27 @@ class DnfBasicTest(DnfTest):
                       'RPM is not the primary package manager')
     @OEHasPackage(['dnf'])
     @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OETestID(1735)
     def test_dnf_help(self):
         self.dnf('--help')
 
     @OETestDepends(['dnf.DnfBasicTest.test_dnf_help'])
+    @OETestID(1739)
     def test_dnf_version(self):
         self.dnf('--version')
 
     @OETestDepends(['dnf.DnfBasicTest.test_dnf_help'])
+    @OETestID(1737)
     def test_dnf_info(self):
         self.dnf('info dnf')
 
     @OETestDepends(['dnf.DnfBasicTest.test_dnf_help'])
+    @OETestID(1738)
     def test_dnf_search(self):
         self.dnf('search dnf')
 
     @OETestDepends(['dnf.DnfBasicTest.test_dnf_help'])
+    @OETestID(1736)
     def test_dnf_history(self):
         self.dnf('history')
 
@@ -65,6 +70,7 @@ class DnfRepoTest(DnfTest):
         self.dnf(" ".join(cmdlinerepoopts) + " --nogpgcheck " + command)
 
     @OETestDepends(['dnf.DnfBasicTest.test_dnf_help'])
+    @OETestID(1744)
     def test_dnf_makecache(self):
         self.dnf_with_repo('makecache')
 
@@ -75,19 +81,23 @@ class DnfRepoTest(DnfTest):
 #        self.dnf_with_repo('repolist')
 
     @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
+    @OETestID(1746)
     def test_dnf_repoinfo(self):
         self.dnf_with_repo('repoinfo')
 
     @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
+    @OETestID(1740)
     def test_dnf_install(self):
         self.dnf_with_repo('install -y run-postinsts-dev')
 
     @OETestDepends(['dnf.DnfRepoTest.test_dnf_install'])
+    @OETestID(1741)
     def test_dnf_install_dependency(self):
         self.dnf_with_repo('remove -y run-postinsts')
         self.dnf_with_repo('install -y run-postinsts-dev')
 
     @OETestDepends(['dnf.DnfRepoTest.test_dnf_install_dependency'])
+    @OETestID(1742)
     def test_dnf_install_from_disk(self):
         self.dnf_with_repo('remove -y run-postinsts-dev')
         self.dnf_with_repo('install -y --downloadonly run-postinsts-dev')
@@ -96,6 +106,7 @@ class DnfRepoTest(DnfTest):
         self.dnf_with_repo('install -y %s' % output)
 
     @OETestDepends(['dnf.DnfRepoTest.test_dnf_install_from_disk'])
+    @OETestID(1743)
     def test_dnf_install_from_http(self):
         output = subprocess.check_output('%s %s -name run-postinsts-dev*' % (bb.utils.which(os.getenv('PATH'), "find"),
                                                                            os.path.join(self.tc.td['WORKDIR'], 'oe-testimage-repo')), shell=True).decode("utf-8")
@@ -105,6 +116,7 @@ class DnfRepoTest(DnfTest):
         self.dnf_with_repo('install -y %s' % url)
 
     @OETestDepends(['dnf.DnfRepoTest.test_dnf_install'])
+    @OETestID(1745)
     def test_dnf_reinstall(self):
         self.dnf_with_repo('reinstall -y run-postinsts-dev')
 
-- 
2.11.0


