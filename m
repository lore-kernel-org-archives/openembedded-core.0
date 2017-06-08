Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1D90378285
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 16:32:08 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Jun 2017 09:32:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,315,1493708400"; d="scan'208";a="271875695"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.117])
	by fmsmga004.fm.intel.com with ESMTP; 08 Jun 2017 09:32:07 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jun 2017 11:32:06 -0500
Message-Id: <cb7f0a9dcd9d5038ec5f41755f8fac5347f1355c.1496939387.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1496939387.git.anibal.limon@linux.intel.com>
References: <cover.1496939387.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1496939387.git.anibal.limon@linux.intel.com>
References: <cover.1496939387.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 6/7] oeqa/cases/oelib: Change default case class to unittest.case.TestCase
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
X-List-Received-Date: Thu, 08 Jun 2017 16:32:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some tests doesn't need call bitbake so it is better to use the
basic unittest case class.

[YOCTO #10828]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/oelib/elf.py     | 4 ++--
 meta/lib/oeqa/selftest/cases/oelib/license.py | 6 +++---
 meta/lib/oeqa/selftest/cases/oelib/path.py    | 4 ++--
 meta/lib/oeqa/selftest/cases/oelib/types.py   | 6 +++---
 meta/lib/oeqa/selftest/cases/oelib/utils.py   | 6 +++---
 5 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/oelib/elf.py b/meta/lib/oeqa/selftest/cases/oelib/elf.py
index 0451eba..74ee6a1 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/elf.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/elf.py
@@ -1,7 +1,7 @@
-from oeqa.selftest.case import OESelftestTestCase
+from unittest.case import TestCase
 import oe.qa
 
-class TestElf(OESelftestTestCase):
+class TestElf(TestCase):
     def test_machine_name(self):
         """
         Test elf_machine_to_string()
diff --git a/meta/lib/oeqa/selftest/cases/oelib/license.py b/meta/lib/oeqa/selftest/cases/oelib/license.py
index a6d9c9a..bfd9ed9 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/license.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/license.py
@@ -1,4 +1,4 @@
-from oeqa.selftest.case import OESelftestTestCase
+from unittest.case import TestCase
 import oe.license
 
 class SeenVisitor(oe.license.LicenseVisitor):
@@ -9,7 +9,7 @@ class SeenVisitor(oe.license.LicenseVisitor):
     def visit_Str(self, node):
         self.seen.append(node.s)
 
-class TestSingleLicense(OESelftestTestCase):
+class TestSingleLicense(TestCase):
     licenses = [
         "GPLv2",
         "LGPL-2.0",
@@ -37,7 +37,7 @@ class TestSingleLicense(OESelftestTestCase):
                 self.parse(license)
             self.assertEqual(cm.exception.license, license)
 
-class TestSimpleCombinations(OESelftestTestCase):
+class TestSimpleCombinations(TestCase):
     tests = {
         "FOO&BAR": ["FOO", "BAR"],
         "BAZ & MOO": ["BAZ", "MOO"],
diff --git a/meta/lib/oeqa/selftest/cases/oelib/path.py b/meta/lib/oeqa/selftest/cases/oelib/path.py
index 2ae5eaf..75a27c0 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/path.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/path.py
@@ -1,11 +1,11 @@
-from oeqa.selftest.case import OESelftestTestCase
+from unittest.case import TestCase
 import oe, oe.path
 import tempfile
 import os
 import errno
 import shutil
 
-class TestRealPath(OESelftestTestCase):
+class TestRealPath(TestCase):
     DIRS = [ "a", "b", "etc", "sbin", "usr", "usr/bin", "usr/binX", "usr/sbin", "usr/include", "usr/include/gdbm" ]
     FILES = [ "etc/passwd", "b/file" ]
     LINKS = [
diff --git a/meta/lib/oeqa/selftest/cases/oelib/types.py b/meta/lib/oeqa/selftest/cases/oelib/types.py
index 99c8404..6b53aa6 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/types.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/types.py
@@ -1,7 +1,7 @@
-from oeqa.selftest.case import OESelftestTestCase
+from unittest.case import TestCase
 from oe.maketype import create
 
-class TestBooleanType(OESelftestTestCase):
+class TestBooleanType(TestCase):
     def test_invalid(self):
         self.assertRaises(ValueError, create, '', 'boolean')
         self.assertRaises(ValueError, create, 'foo', 'boolean')
@@ -31,7 +31,7 @@ class TestBooleanType(OESelftestTestCase):
         self.assertEqual(create('y', 'boolean'), True)
         self.assertNotEqual(create('y', 'boolean'), False)
 
-class TestList(OESelftestTestCase):
+class TestList(TestCase):
     def assertListEqual(self, value, valid, sep=None):
         obj = create(value, 'list', separator=sep)
         self.assertEqual(obj, valid)
diff --git a/meta/lib/oeqa/selftest/cases/oelib/utils.py b/meta/lib/oeqa/selftest/cases/oelib/utils.py
index 5bc5fff..9fb6c15 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/utils.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/utils.py
@@ -1,7 +1,7 @@
-from oeqa.selftest.case import OESelftestTestCase
+from unittest.case import TestCase
 from oe.utils import packages_filter_out_system, trim_version
 
-class TestPackagesFilterOutSystem(OESelftestTestCase):
+class TestPackagesFilterOutSystem(TestCase):
     def test_filter(self):
         """
         Test that oe.utils.packages_filter_out_system works.
@@ -31,7 +31,7 @@ class TestPackagesFilterOutSystem(OESelftestTestCase):
         self.assertEqual(pkgs, ["foo-data"])
 
 
-class TestTrimVersion(OESelftestTestCase):
+class TestTrimVersion(TestCase):
     def test_version_exception(self):
         with self.assertRaises(TypeError):
             trim_version(None, 2)
-- 
2.1.4


