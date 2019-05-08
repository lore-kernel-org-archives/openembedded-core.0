Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id 118507DDC4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 17:47:11 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id y2so4327839wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2019 10:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VXjrzSZHS22YVgdWT9EagyfM7QxpPssSxaw05Lb04Og=;
	b=W/W0qg+R6kWGVfJfyB6QRQjt2r/KSnHySA3/jiL/wt8qPVvl97RbR8LP+rzNDNgyjA
	+O68fHREGyIK2fyNVAhOV/2G5qQiOYKhgwDP1j2tTd4jndcwxr5OlI5zXI7SxzRxfsD9
	bm++LM1h6rkWIC4h+uMjjdehOvctCKcCP8PG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VXjrzSZHS22YVgdWT9EagyfM7QxpPssSxaw05Lb04Og=;
	b=EL4kepsZcJtyoMSTCW34rWM4D2hnDhPj2UywakZQfVr56LkjqBnuKIYnSjOoN7kBzP
	dh3vVucFJUic3CLjBnL/vlmSbXv1MeLhyIkmu6IOKxOiGjzOAWmi0uq8KEHASDjo1pd3
	b49cAfm/qJ21Pmncn0/7VL7LuQMimLgEAgnDtBIRLfTjLy2BrOML52Agt4szlI6N9T/7
	aE99FH7yerR7Fu1KLdWYFuGu2tMoEkWRy9Q4Nrgpq5393dE9F9HcuvJyfAZnj9tv1NcZ
	ltNU6QdeHAFBizvz5wjzXe4KUeav1q0vjic0OzuIqwQ5NV3LrvB1q73Dun9cpeyPUl2+
	JwPA==
X-Gm-Message-State: APjAAAW1iXRtnrhyQwRNWMO8f42qjKJqqa1mz2qIMOCmaphKSGXtiGNz
	RjkwxzT2YsnsudPu+WltrqEFd1/OCkM=
X-Google-Smtp-Source: APXvYqxN/tao0c5OtKgdz53FFMf7s8jo37aWICGWLI8e53z9zHOMtLpMxnUb0p67iCFDOmIJUTHuTA==
X-Received: by 2002:a1c:2d0e:: with SMTP id t14mr3989548wmt.33.1557337630299; 
	Wed, 08 May 2019 10:47:10 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	g10sm4429732wrw.80.2019.05.08.10.47.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 10:47:09 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2019 18:47:04 +0100
Message-Id: <20190508174705.5353-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] oeqa: Drop OETestID
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
X-List-Received-Date: Wed, 08 May 2019 17:47:12 -0000
Content-Transfer-Encoding: 8bit

These IDs refer to testopia which we're no longer using. We would now use the test
names to definitively reference tests and the IDs can be dropped, along with their
supporting code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/decorator/oeid.py          | 23 --------
 meta/lib/oeqa/core/runner.py                  | 31 +---------
 .../core/tests/cases/loader/invalid/oeid.py   | 15 -----
 meta/lib/oeqa/core/tests/cases/oeid.py        | 18 ------
 meta/lib/oeqa/core/tests/test_decorators.py   | 23 --------
 meta/lib/oeqa/core/tests/test_loader.py       | 11 ++--
 meta/lib/oeqa/runtime/cases/buildcpio.py      |  2 -
 .../lib/oeqa/runtime/cases/buildgalculator.py |  2 -
 meta/lib/oeqa/runtime/cases/buildlzip.py      |  2 -
 meta/lib/oeqa/runtime/cases/connman.py        |  3 -
 meta/lib/oeqa/runtime/cases/date.py           |  2 -
 meta/lib/oeqa/runtime/cases/df.py             |  2 -
 meta/lib/oeqa/runtime/cases/dnf.py            | 15 -----
 meta/lib/oeqa/runtime/cases/gcc.py            |  5 --
 meta/lib/oeqa/runtime/cases/kernelmodule.py   |  2 -
 meta/lib/oeqa/runtime/cases/ksample.py        |  1 -
 meta/lib/oeqa/runtime/cases/ldd.py            |  2 -
 meta/lib/oeqa/runtime/cases/logrotate.py      |  3 -
 meta/lib/oeqa/runtime/cases/multilib.py       |  3 -
 meta/lib/oeqa/runtime/cases/oe_syslog.py      |  5 --
 meta/lib/oeqa/runtime/cases/pam.py            |  2 -
 meta/lib/oeqa/runtime/cases/parselogs.py      |  2 -
 meta/lib/oeqa/runtime/cases/perl.py           |  2 -
 meta/lib/oeqa/runtime/cases/ping.py           |  2 -
 meta/lib/oeqa/runtime/cases/ptest.py          |  2 -
 meta/lib/oeqa/runtime/cases/python.py         |  2 -
 meta/lib/oeqa/runtime/cases/rpm.py            |  7 ---
 meta/lib/oeqa/runtime/cases/scp.py            |  2 -
 meta/lib/oeqa/runtime/cases/skeletoninit.py   |  2 -
 meta/lib/oeqa/runtime/cases/ssh.py            |  2 -
 meta/lib/oeqa/runtime/cases/stap.py           |  2 -
 meta/lib/oeqa/runtime/cases/systemd.py        |  5 --
 meta/lib/oeqa/runtime/cases/x32lib.py         |  2 -
 meta/lib/oeqa/runtime/cases/xorg.py           |  2 -
 meta/lib/oeqa/sdkext/cases/devtool.py         |  7 ---
 meta/lib/oeqa/selftest/cases/archiver.py      |  4 --
 meta/lib/oeqa/selftest/cases/bblayers.py      |  8 ---
 meta/lib/oeqa/selftest/cases/bbtests.py       | 26 --------
 meta/lib/oeqa/selftest/cases/buildoptions.py  | 10 ----
 .../lib/oeqa/selftest/cases/containerimage.py |  2 -
 meta/lib/oeqa/selftest/cases/devtool.py       | 39 ------------
 meta/lib/oeqa/selftest/cases/distrodata.py    |  2 -
 meta/lib/oeqa/selftest/cases/eSDK.py          |  3 -
 meta/lib/oeqa/selftest/cases/fetch.py         |  2 -
 meta/lib/oeqa/selftest/cases/image_typedep.py |  2 -
 meta/lib/oeqa/selftest/cases/imagefeatures.py |  9 ---
 meta/lib/oeqa/selftest/cases/layerappend.py   |  2 -
 meta/lib/oeqa/selftest/cases/liboe.py         |  4 --
 meta/lib/oeqa/selftest/cases/lic_checksum.py  |  2 -
 meta/lib/oeqa/selftest/cases/manifest.py      |  3 -
 meta/lib/oeqa/selftest/cases/meta_ide.py      |  4 --
 .../oeqa/selftest/cases/oelib/buildhistory.py |  4 --
 meta/lib/oeqa/selftest/cases/oescripts.py     |  2 -
 meta/lib/oeqa/selftest/cases/package.py       |  4 --
 meta/lib/oeqa/selftest/cases/pkgdata.py       |  9 ---
 meta/lib/oeqa/selftest/cases/prservice.py     | 10 ----
 meta/lib/oeqa/selftest/cases/recipetool.py    | 39 ------------
 meta/lib/oeqa/selftest/cases/recipeutils.py   |  1 -
 meta/lib/oeqa/selftest/cases/runcmd.py        | 17 ------
 meta/lib/oeqa/selftest/cases/runqemu.py       | 13 ----
 meta/lib/oeqa/selftest/cases/runtime_test.py  |  9 ---
 meta/lib/oeqa/selftest/cases/selftest.py      |  2 -
 meta/lib/oeqa/selftest/cases/signing.py       |  4 --
 meta/lib/oeqa/selftest/cases/sstatetests.py   | 21 -------
 meta/lib/oeqa/selftest/cases/tinfoil.py       | 11 ----
 meta/lib/oeqa/selftest/cases/wic.py           | 59 -------------------
 66 files changed, 8 insertions(+), 532 deletions(-)
 delete mode 100644 meta/lib/oeqa/core/decorator/oeid.py
 delete mode 100644 meta/lib/oeqa/core/tests/cases/loader/invalid/oeid.py
 delete mode 100644 meta/lib/oeqa/core/tests/cases/oeid.py

diff --git a/meta/lib/oeqa/core/decorator/oeid.py b/meta/lib/oeqa/core/decorator/oeid.py
deleted file mode 100644
index ea8017a55a1..00000000000
--- a/meta/lib/oeqa/core/decorator/oeid.py
+++ /dev/null
@@ -1,23 +0,0 @@
-# Copyright (C) 2016 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
-
-from . import OETestFilter, registerDecorator
-from oeqa.core.utils.misc import intToList
-
-def _idFilter(oeid, filters):
-     return False if oeid in filters else True
-
-@registerDecorator
-class OETestID(OETestFilter):
-    attrs = ('oeid',)
-
-    def bind(self, registry, case):
-        super(OETestID, self).bind(registry, case)
-
-    def filtrate(self, filters):
-        if filters.get('oeid'):
-            filterx = intToList(filters['oeid'], 'oeid')
-            del filters['oeid']
-            if _idFilter(self.oeid, filterx):
-                return True
-        return False
diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index 478b7b6683a..ee1fb430283 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -139,19 +139,13 @@ class OETestResult(_TestResult):
 
             (status, log) = self._getTestResultDetails(case)
 
-            oeid = -1
-            if hasattr(case, 'decorators'):
-                for d in case.decorators:
-                    if hasattr(d, 'oeid'):
-                        oeid = d.oeid
-
             t = ""
             if case.id() in self.starttime and case.id() in self.endtime:
                 t = " (" + "{0:.2f}".format(self.endtime[case.id()] - self.starttime[case.id()]) + "s)"
 
             if status not in logs:
                 logs[status] = []
-            logs[status].append("RESULTS - %s - Testcase %s: %s%s" % (case.id(), oeid, status, t))
+            logs[status].append("RESULTS - %s: %s%s" % (case.id(), status, t))
             report = {'status': status}
             if log:
                 report['log'] = log
@@ -202,38 +196,19 @@ class OETestRunner(_TestRunner):
                 self._walked_cases = self._walked_cases + 1
 
     def _list_tests_name(self, suite):
-        from oeqa.core.decorator.oeid import OETestID
         from oeqa.core.decorator.oetag import OETestTag
 
         self._walked_cases = 0
 
-        def _list_cases_without_id(logger, case):
-
-            found_id = False
-            if hasattr(case, 'decorators'):
-                for d in case.decorators:
-                    if isinstance(d, OETestID):
-                        found_id = True
-
-            if not found_id:
-                logger.info('oeid missing for %s' % case.id())
-
         def _list_cases(logger, case):
-            oeid = None
             oetag = None
 
             if hasattr(case, 'decorators'):
                 for d in case.decorators:
-                    if isinstance(d, OETestID):
-                        oeid = d.oeid
-                    elif isinstance(d, OETestTag):
+                    if isinstance(d, OETestTag):
                         oetag = d.oetag
 
-            logger.info("%s\t%s\t\t%s" % (oeid, oetag, case.id()))
-
-        self.tc.logger.info("Listing test cases that don't have oeid ...")
-        self._walk_suite(suite, _list_cases_without_id)
-        self.tc.logger.info("-" * 80)
+            logger.info("%s\t\t%s" % (oetag, case.id()))
 
         self.tc.logger.info("Listing all available tests:")
         self._walked_cases = 0
diff --git a/meta/lib/oeqa/core/tests/cases/loader/invalid/oeid.py b/meta/lib/oeqa/core/tests/cases/loader/invalid/oeid.py
deleted file mode 100644
index 038d445931f..00000000000
--- a/meta/lib/oeqa/core/tests/cases/loader/invalid/oeid.py
+++ /dev/null
@@ -1,15 +0,0 @@
-# Copyright (C) 2016 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
-
-from oeqa.core.case import OETestCase
-
-class AnotherIDTest(OETestCase):
-
-    def testAnotherIdGood(self):
-        self.assertTrue(True, msg='How is this possible?')
-
-    def testAnotherIdOther(self):
-        self.assertTrue(True, msg='How is this possible?')
-
-    def testAnotherIdNone(self):
-        self.assertTrue(True, msg='How is this possible?')
diff --git a/meta/lib/oeqa/core/tests/cases/oeid.py b/meta/lib/oeqa/core/tests/cases/oeid.py
deleted file mode 100644
index c2d3d32f2db..00000000000
--- a/meta/lib/oeqa/core/tests/cases/oeid.py
+++ /dev/null
@@ -1,18 +0,0 @@
-# Copyright (C) 2016 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
-
-from oeqa.core.case import OETestCase
-from oeqa.core.decorator.oeid import OETestID
-
-class IDTest(OETestCase):
-
-    @OETestID(101)
-    def testIdGood(self):
-        self.assertTrue(True, msg='How is this possible?')
-
-    @OETestID(102)
-    def testIdOther(self):
-        self.assertTrue(True, msg='How is this possible?')
-
-    def testIdNone(self):
-        self.assertTrue(True, msg='How is this possible?')
diff --git a/meta/lib/oeqa/core/tests/test_decorators.py b/meta/lib/oeqa/core/tests/test_decorators.py
index f7d11e885a4..67dce773bd0 100755
--- a/meta/lib/oeqa/core/tests/test_decorators.py
+++ b/meta/lib/oeqa/core/tests/test_decorators.py
@@ -42,29 +42,6 @@ class TestFilterDecorator(TestBase):
         for test in tests:
             self._runFilterTest(['oetag'], test[0], test[1], test[2])
 
-    def test_oeid(self):
-        # Get all cases without filtering.
-        filter_all = {}
-        test_all = {'testIdGood', 'testIdOther', 'testIdNone'}
-        msg_all = 'Failed to get all oeid cases without filtering.'
-
-        # Get cases with '101' oeid.
-        filter_good = {'oeid': 101}
-        test_good = {'testIdGood'}
-        msg_good = 'Failed to get just one tes filtering with "101" oeid.'
-
-        # Get cases with an invalid id.
-        filter_invalid = {'oeid':999}
-        test_invalid = set()
-        msg_invalid = 'Failed to filter all test using an invalid oeid.'
-
-        tests = ((filter_all, test_all, msg_all),
-                 (filter_good, test_good, msg_good),
-                 (filter_invalid, test_invalid, msg_invalid))
-
-        for test in tests:
-            self._runFilterTest(['oeid'], test[0], test[1], test[2])
-
 class TestDependsDecorator(TestBase):
     modules = ['depends']
 
diff --git a/meta/lib/oeqa/core/tests/test_loader.py b/meta/lib/oeqa/core/tests/test_loader.py
index b79b8bad4da..39f2d6e2a7a 100755
--- a/meta/lib/oeqa/core/tests/test_loader.py
+++ b/meta/lib/oeqa/core/tests/test_loader.py
@@ -42,7 +42,7 @@ class TestLoader(TestBase):
         cases_path = self.cases_path
         invalid_path = os.path.join(cases_path, 'loader', 'invalid')
         self.cases_path = [self.cases_path, invalid_path]
-        expect = 'Duplicated oeid module found in'
+        expect = 'Duplicated oetag module found in'
         msg = 'Expected ImportError exception for having duplicated module'
         try:
             # Must throw ImportEror because duplicated module
@@ -55,17 +55,16 @@ class TestLoader(TestBase):
             self.cases_path = cases_path
 
     def test_filter_modules(self):
-        expected_modules = {'oeid', 'oetag'}
+        expected_modules = {'oetag'}
         tc = self._testLoader(modules=expected_modules)
         modules = getSuiteModules(tc.suites)
         msg = 'Expected just %s modules' % ', '.join(expected_modules)
         self.assertEqual(modules, expected_modules, msg=msg)
 
     def test_filter_cases(self):
-        modules = ['oeid', 'oetag', 'data']
+        modules = ['oetag', 'data']
         expected_cases = {'data.DataTest.testDataOk',
-                          'oetag.TagTest.testTagGood',
-                          'oeid.IDTest.testIdGood'}
+                          'oetag.TagTest.testTagGood'}
         tc = self._testLoader(modules=modules, tests=expected_cases)
         cases = set(getSuiteCasesIDs(tc.suites))
         msg = 'Expected just %s cases' % ', '.join(expected_cases)
@@ -74,7 +73,7 @@ class TestLoader(TestBase):
     def test_import_from_paths(self):
         cases_path = self.cases_path
         cases2_path = os.path.join(cases_path, 'loader', 'valid')
-        expected_modules = {'oeid', 'another'}
+        expected_modules = {'another'}
         self.cases_path = [self.cases_path, cases2_path]
         tc = self._testLoader(modules=expected_modules)
         modules = getSuiteModules(tc.suites)
diff --git a/meta/lib/oeqa/runtime/cases/buildcpio.py b/meta/lib/oeqa/runtime/cases/buildcpio.py
index a61d1e03043..6a9a408ebea 100644
--- a/meta/lib/oeqa/runtime/cases/buildcpio.py
+++ b/meta/lib/oeqa/runtime/cases/buildcpio.py
@@ -1,6 +1,5 @@
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
-from oeqa.core.decorator.oeid import OETestID
 from oeqa.runtime.decorator.package import OEHasPackage
 
 from oeqa.runtime.utils.targetbuildproject import TargetBuildProject
@@ -18,7 +17,6 @@ class BuildCpioTest(OERuntimeTestCase):
     def tearDownClass(cls):
         cls.project.clean()
 
-    @OETestID(205)
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['gcc'])
     @OEHasPackage(['make'])
diff --git a/meta/lib/oeqa/runtime/cases/buildgalculator.py b/meta/lib/oeqa/runtime/cases/buildgalculator.py
index a0a00320835..4ec5fc707bf 100644
--- a/meta/lib/oeqa/runtime/cases/buildgalculator.py
+++ b/meta/lib/oeqa/runtime/cases/buildgalculator.py
@@ -1,6 +1,5 @@
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
-from oeqa.core.decorator.oeid import OETestID
 from oeqa.runtime.decorator.package import OEHasPackage
 
 from oeqa.runtime.utils.targetbuildproject import TargetBuildProject
@@ -18,7 +17,6 @@ class GalculatorTest(OERuntimeTestCase):
     def tearDownClass(cls):
         cls.project.clean()
 
-    @OETestID(1526)
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['gcc'])
     @OEHasPackage(['make'])
diff --git a/meta/lib/oeqa/runtime/cases/buildlzip.py b/meta/lib/oeqa/runtime/cases/buildlzip.py
index 5b455a07906..b737ca601b6 100644
--- a/meta/lib/oeqa/runtime/cases/buildlzip.py
+++ b/meta/lib/oeqa/runtime/cases/buildlzip.py
@@ -1,6 +1,5 @@
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
-from oeqa.core.decorator.oeid import OETestID
 from oeqa.runtime.decorator.package import OEHasPackage
 
 from oeqa.runtime.utils.targetbuildproject import TargetBuildProject
@@ -19,7 +18,6 @@ class BuildLzipTest(OERuntimeTestCase):
     def tearDownClass(cls):
         cls.project.clean()
 
-    @OETestID(206)
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['gcc'])
     @OEHasPackage(['make'])
diff --git a/meta/lib/oeqa/runtime/cases/connman.py b/meta/lib/oeqa/runtime/cases/connman.py
index 12456b41725..55a252ab01d 100644
--- a/meta/lib/oeqa/runtime/cases/connman.py
+++ b/meta/lib/oeqa/runtime/cases/connman.py
@@ -1,6 +1,5 @@
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
-from oeqa.core.decorator.oeid import OETestID
 from oeqa.runtime.decorator.package import OEHasPackage
 
 class ConnmanTest(OERuntimeTestCase):
@@ -12,7 +11,6 @@ class ConnmanTest(OERuntimeTestCase):
         else:
             return "Unable to get status or logs for %s" % service
 
-    @OETestID(961)
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(["connman"])
     def test_connmand_help(self):
@@ -20,7 +18,6 @@ class ConnmanTest(OERuntimeTestCase):
         msg = 'Failed to get connman help. Output: %s' % output
         self.assertEqual(status, 0, msg=msg)
 
-    @OETestID(221)
     @OETestDepends(['connman.ConnmanTest.test_connmand_help'])
     def test_connmand_running(self):
         cmd = '%s | grep [c]onnmand' % self.tc.target_cmds['ps']
diff --git a/meta/lib/oeqa/runtime/cases/date.py b/meta/lib/oeqa/runtime/cases/date.py
index 0887b831f42..d31d1b2730b 100644
--- a/meta/lib/oeqa/runtime/cases/date.py
+++ b/meta/lib/oeqa/runtime/cases/date.py
@@ -2,7 +2,6 @@ import re
 
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
-from oeqa.core.decorator.oeid import OETestID
 from oeqa.runtime.decorator.package import OEHasPackage
 
 class DateTest(OERuntimeTestCase):
@@ -17,7 +16,6 @@ class DateTest(OERuntimeTestCase):
             self.logger.debug('Starting systemd-timesyncd daemon')
             self.target.run('systemctl start systemd-timesyncd')
 
-    @OETestID(211)
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['coreutils', 'busybox'])
     def test_date(self):
diff --git a/meta/lib/oeqa/runtime/cases/df.py b/meta/lib/oeqa/runtime/cases/df.py
index e0b6bb839d1..2d1ca2a9495 100644
--- a/meta/lib/oeqa/runtime/cases/df.py
+++ b/meta/lib/oeqa/runtime/cases/df.py
@@ -1,11 +1,9 @@
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
-from oeqa.core.decorator.oeid import OETestID
 from oeqa.runtime.decorator.package import OEHasPackage
 
 class DfTest(OERuntimeTestCase):
 
-    @OETestID(234)
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['coreutils', 'busybox'])
     def test_df(self):
diff --git a/meta/lib/oeqa/runtime/cases/dnf.py b/meta/lib/oeqa/runtime/cases/dnf.py
index c1ed39d7765..f235bdd58ae 100644
--- a/meta/lib/oeqa/runtime/cases/dnf.py
+++ b/meta/lib/oeqa/runtime/cases/dnf.py
@@ -5,7 +5,6 @@ from oeqa.utils.httpserver import HTTPService
 
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
-from oeqa.core.decorator.oeid import OETestID
 from oeqa.core.decorator.data import skipIfNotDataVar, skipIfNotFeature
 from oeqa.runtime.decorator.package import OEHasPackage
 
@@ -26,27 +25,22 @@ class DnfBasicTest(DnfTest):
                       'RPM is not the primary package manager')
     @OEHasPackage(['dnf'])
     @OETestDepends(['ssh.SSHTest.test_ssh'])
-    @OETestID(1735)
     def test_dnf_help(self):
         self.dnf('--help')
 
     @OETestDepends(['dnf.DnfBasicTest.test_dnf_help'])
-    @OETestID(1739)
     def test_dnf_version(self):
         self.dnf('--version')
 
     @OETestDepends(['dnf.DnfBasicTest.test_dnf_help'])
-    @OETestID(1737)
     def test_dnf_info(self):
         self.dnf('info dnf')
 
     @OETestDepends(['dnf.DnfBasicTest.test_dnf_help'])
-    @OETestID(1738)
     def test_dnf_search(self):
         self.dnf('search dnf')
 
     @OETestDepends(['dnf.DnfBasicTest.test_dnf_help'])
-    @OETestID(1736)
     def test_dnf_history(self):
         self.dnf('history')
 
@@ -71,7 +65,6 @@ class DnfRepoTest(DnfTest):
         return output
 
     @OETestDepends(['dnf.DnfBasicTest.test_dnf_help'])
-    @OETestID(1744)
     def test_dnf_makecache(self):
         self.dnf_with_repo('makecache')
 
@@ -82,12 +75,10 @@ class DnfRepoTest(DnfTest):
 #        self.dnf_with_repo('repolist')
 
     @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
-    @OETestID(1746)
     def test_dnf_repoinfo(self):
         self.dnf_with_repo('repoinfo')
 
     @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
-    @OETestID(1740)
     def test_dnf_install(self):
         output = self.dnf_with_repo('list run-postinsts-dev')
         if 'Installed Packages' in output:
@@ -95,13 +86,11 @@ class DnfRepoTest(DnfTest):
         self.dnf_with_repo('install -y run-postinsts-dev')
 
     @OETestDepends(['dnf.DnfRepoTest.test_dnf_install'])
-    @OETestID(1741)
     def test_dnf_install_dependency(self):
         self.dnf_with_repo('remove -y run-postinsts')
         self.dnf_with_repo('install -y run-postinsts-dev')
 
     @OETestDepends(['dnf.DnfRepoTest.test_dnf_install_dependency'])
-    @OETestID(1742)
     def test_dnf_install_from_disk(self):
         self.dnf_with_repo('remove -y run-postinsts-dev')
         self.dnf_with_repo('install -y --downloadonly run-postinsts-dev')
@@ -110,7 +99,6 @@ class DnfRepoTest(DnfTest):
         self.dnf_with_repo('install -y %s' % output)
 
     @OETestDepends(['dnf.DnfRepoTest.test_dnf_install_from_disk'])
-    @OETestID(1743)
     def test_dnf_install_from_http(self):
         output = subprocess.check_output('%s %s -name run-postinsts-dev*' % (bb.utils.which(os.getenv('PATH'), "find"),
                                                                            os.path.join(self.tc.td['WORKDIR'], 'oe-testimage-repo')), shell=True).decode("utf-8")
@@ -120,12 +108,10 @@ class DnfRepoTest(DnfTest):
         self.dnf_with_repo('install -y %s' % url)
 
     @OETestDepends(['dnf.DnfRepoTest.test_dnf_install'])
-    @OETestID(1745)
     def test_dnf_reinstall(self):
         self.dnf_with_repo('reinstall -y run-postinsts-dev')
 
     @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
-    @OETestID(1771)
     def test_dnf_installroot(self):
         rootpath = '/home/root/chroot/test'
         #Copy necessary files to avoid errors with not yet installed tools on
@@ -151,7 +137,6 @@ class DnfRepoTest(DnfTest):
         self.assertEqual(0, status, output)
 
     @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
-    @OETestID(1772)
     def test_dnf_exclude(self):
         excludepkg = 'curl-dev'
         self.dnf_with_repo('install -y curl*')
diff --git a/meta/lib/oeqa/runtime/cases/gcc.py b/meta/lib/oeqa/runtime/cases/gcc.py
index 8265c59f239..e55eb560d0f 100644
--- a/meta/lib/oeqa/runtime/cases/gcc.py
+++ b/meta/lib/oeqa/runtime/cases/gcc.py
@@ -2,7 +2,6 @@ import os
 
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
-from oeqa.core.decorator.oeid import OETestID
 from oeqa.runtime.decorator.package import OEHasPackage
 
 class GccCompileTest(OERuntimeTestCase):
@@ -24,7 +23,6 @@ class GccCompileTest(OERuntimeTestCase):
         files = '/tmp/test.c /tmp/test.o /tmp/test /tmp/testmakefile'
         cls.tc.target.run('rm %s' % files)
 
-    @OETestID(203)
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['gcc'])
     def test_gcc_compile(self):
@@ -36,7 +34,6 @@ class GccCompileTest(OERuntimeTestCase):
         msg = 'running compiled file failed, output: %s' % output
         self.assertEqual(status, 0, msg=msg)
 
-    @OETestID(200)
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['g++'])
     def test_gpp_compile(self):
@@ -48,7 +45,6 @@ class GccCompileTest(OERuntimeTestCase):
         msg = 'running compiled file failed, output: %s' % output
         self.assertEqual(status, 0, msg=msg)
 
-    @OETestID(1142)
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['g++'])
     def test_gpp2_compile(self):
@@ -60,7 +56,6 @@ class GccCompileTest(OERuntimeTestCase):
         msg = 'running compiled file failed, output: %s' % output
         self.assertEqual(status, 0, msg=msg)
 
-    @OETestID(204)
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['gcc'])
     @OEHasPackage(['make'])
diff --git a/meta/lib/oeqa/runtime/cases/kernelmodule.py b/meta/lib/oeqa/runtime/cases/kernelmodule.py
index 27a2c35b711..36805be302a 100644
--- a/meta/lib/oeqa/runtime/cases/kernelmodule.py
+++ b/meta/lib/oeqa/runtime/cases/kernelmodule.py
@@ -2,7 +2,6 @@ import os
 
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
-from oeqa.core.decorator.oeid import OETestID
 from oeqa.core.decorator.data import skipIfNotFeature
 from oeqa.runtime.decorator.package import OEHasPackage
 
@@ -23,7 +22,6 @@ class KernelModuleTest(OERuntimeTestCase):
         files = '/tmp/Makefile /tmp/hellomod.c'
         cls.tc.target.run('rm %s' % files)
 
-    @OETestID(1541)
     @skipIfNotFeature('tools-sdk',
                       'Test requires tools-sdk to be in IMAGE_FEATURES')
     @OETestDepends(['gcc.GccCompileTest.test_gcc_compile'])
diff --git a/meta/lib/oeqa/runtime/cases/ksample.py b/meta/lib/oeqa/runtime/cases/ksample.py
index de2366a7939..45b926bec8f 100644
--- a/meta/lib/oeqa/runtime/cases/ksample.py
+++ b/meta/lib/oeqa/runtime/cases/ksample.py
@@ -3,7 +3,6 @@ import time
 
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
-from oeqa.core.decorator.oeid import OETestID
 from oeqa.core.decorator.data import skipIfNotFeature
 
 # need some kernel fragments
diff --git a/meta/lib/oeqa/runtime/cases/ldd.py b/meta/lib/oeqa/runtime/cases/ldd.py
index 5bde1845d9c..39c47f380bb 100644
--- a/meta/lib/oeqa/runtime/cases/ldd.py
+++ b/meta/lib/oeqa/runtime/cases/ldd.py
@@ -1,12 +1,10 @@
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
-from oeqa.core.decorator.oeid import OETestID
 from oeqa.core.decorator.data import skipIfNotFeature
 from oeqa.runtime.decorator.package import OEHasPackage
 
 class LddTest(OERuntimeTestCase):
 
-    @OETestID(962)
     @OEHasPackage(["ldd"])
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     def test_ldd(self):
diff --git a/meta/lib/oeqa/runtime/cases/logrotate.py b/meta/lib/oeqa/runtime/cases/logrotate.py
index d2666444e96..dc3b271445a 100644
--- a/meta/lib/oeqa/runtime/cases/logrotate.py
+++ b/meta/lib/oeqa/runtime/cases/logrotate.py
@@ -3,7 +3,6 @@
 
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
-from oeqa.core.decorator.oeid import OETestID
 from oeqa.runtime.decorator.package import OEHasPackage
 
 class LogrotateTest(OERuntimeTestCase):
@@ -16,7 +15,6 @@ class LogrotateTest(OERuntimeTestCase):
     def tearDownClass(cls):
         cls.tc.target.run('mv -f $HOME/wtmp.oeqabak /etc/logrotate.d/wtmp && rm -rf $HOME/logrotate_dir')
 
-    @OETestID(1544)
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['logrotate'])
     def test_1_logrotate_setup(self):
@@ -31,7 +29,6 @@ class LogrotateTest(OERuntimeTestCase):
                ' %s and %s' % (status, output))
         self.assertEqual(status, 0, msg = msg)
 
-    @OETestID(1542)
     @OETestDepends(['logrotate.LogrotateTest.test_1_logrotate_setup'])
     def test_2_logrotate(self):
         status, output = self.target.run('logrotate -f /etc/logrotate.conf')
diff --git a/meta/lib/oeqa/runtime/cases/multilib.py b/meta/lib/oeqa/runtime/cases/multilib.py
index 89020386b18..2cf87618f95 100644
--- a/meta/lib/oeqa/runtime/cases/multilib.py
+++ b/meta/lib/oeqa/runtime/cases/multilib.py
@@ -1,6 +1,5 @@
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
-from oeqa.core.decorator.oeid import OETestID
 from oeqa.core.decorator.data import skipIfNotInDataVar
 from oeqa.runtime.decorator.package import OEHasPackage
 
@@ -23,7 +22,6 @@ class MultilibTest(OERuntimeTestCase):
         msg = "%s isn't %s (is %s)" % (binary, arch, theclass)
         self.assertEqual(theclass, arch, msg=msg)
 
-    @OETestID(1593)
     @skipIfNotInDataVar('MULTILIBS', 'multilib:lib32',
                         "This isn't a multilib:lib32 image")
     @OETestDepends(['ssh.SSHTest.test_ssh'])
@@ -36,7 +34,6 @@ class MultilibTest(OERuntimeTestCase):
         self.archtest("/lib/libc.so.6", "ELF32")
         self.archtest("/lib64/libc.so.6", "ELF64")
 
-    @OETestID(279)
     @OETestDepends(['multilib.MultilibTest.test_check_multilib_libc'])
     @OEHasPackage(['lib32-connman', '!connman'])
     def test_file_connman(self):
diff --git a/meta/lib/oeqa/runtime/cases/oe_syslog.py b/meta/lib/oeqa/runtime/cases/oe_syslog.py
index a92a1f2bcb3..100d026391e 100644
--- a/meta/lib/oeqa/runtime/cases/oe_syslog.py
+++ b/meta/lib/oeqa/runtime/cases/oe_syslog.py
@@ -1,12 +1,10 @@
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
-from oeqa.core.decorator.oeid import OETestID
 from oeqa.core.decorator.data import skipIfDataVar
 from oeqa.runtime.decorator.package import OEHasPackage
 
 class SyslogTest(OERuntimeTestCase):
 
-    @OETestID(201)
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(["busybox-syslog", "sysklogd", "rsyslog", "syslog-ng"])
     def test_syslog_running(self):
@@ -19,7 +17,6 @@ class SyslogTest(OERuntimeTestCase):
 
 class SyslogTestConfig(OERuntimeTestCase):
 
-    @OETestID(1149)
     @OETestDepends(['oe_syslog.SyslogTest.test_syslog_running'])
     def test_syslog_logger(self):
         status, output = self.target.run('logger foobar')
@@ -36,7 +33,6 @@ class SyslogTestConfig(OERuntimeTestCase):
                ' Output: %s ' % output)
         self.assertEqual(status, 0, msg=msg)
 
-    @OETestID(1150)
     @OETestDepends(['oe_syslog.SyslogTest.test_syslog_running'])
     def test_syslog_restart(self):
         if "systemd" != self.tc.td.get("VIRTUAL-RUNTIME_init_manager", ""):
@@ -45,7 +41,6 @@ class SyslogTestConfig(OERuntimeTestCase):
             (_, _) = self.target.run('systemctl restart syslog.service')
 
 
-    @OETestID(202)
     @OETestDepends(['oe_syslog.SyslogTestConfig.test_syslog_logger'])
     @OEHasPackage(["busybox-syslog"])
     @skipIfDataVar('VIRTUAL-RUNTIME_init_manager', 'systemd',
diff --git a/meta/lib/oeqa/runtime/cases/pam.py b/meta/lib/oeqa/runtime/cases/pam.py
index 3654cdc946e..49ae1f48812 100644
--- a/meta/lib/oeqa/runtime/cases/pam.py
+++ b/meta/lib/oeqa/runtime/cases/pam.py
@@ -3,12 +3,10 @@
 
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
-from oeqa.core.decorator.oeid import OETestID
 from oeqa.core.decorator.data import skipIfNotFeature
 
 class PamBasicTest(OERuntimeTestCase):
 
-    @OETestID(1543)
     @skipIfNotFeature('pam', 'Test requires pam to be in DISTRO_FEATURES')
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     def test_pam(self):
diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index bed4a022cd0..41857f5373d 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -4,7 +4,6 @@ from subprocess import check_output
 from shutil import rmtree
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
-from oeqa.core.decorator.oeid import OETestID
 from oeqa.core.decorator.data import skipIfDataVar
 from oeqa.runtime.decorator.package import OEHasPackage
 
@@ -351,7 +350,6 @@ class ParseLogsTest(OERuntimeTestCase):
     def write_dmesg(self):
         (status, dmesg) = self.target.run('dmesg > /tmp/dmesg_output.log')
 
-    @OETestID(1059)
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     def test_parselogs(self):
         self.write_dmesg()
diff --git a/meta/lib/oeqa/runtime/cases/perl.py b/meta/lib/oeqa/runtime/cases/perl.py
index be3287f2269..de1d8d090cc 100644
--- a/meta/lib/oeqa/runtime/cases/perl.py
+++ b/meta/lib/oeqa/runtime/cases/perl.py
@@ -2,11 +2,9 @@ import os
 
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
-from oeqa.core.decorator.oeid import OETestID
 from oeqa.runtime.decorator.package import OEHasPackage
 
 class PerlTest(OERuntimeTestCase):
-    @OETestID(208)
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['perl'])
     def test_perl_works(self):
diff --git a/meta/lib/oeqa/runtime/cases/ping.py b/meta/lib/oeqa/runtime/cases/ping.py
index 02f580abeed..c32f2159a41 100644
--- a/meta/lib/oeqa/runtime/cases/ping.py
+++ b/meta/lib/oeqa/runtime/cases/ping.py
@@ -1,13 +1,11 @@
 from subprocess import Popen, PIPE
 
 from oeqa.runtime.case import OERuntimeTestCase
-from oeqa.core.decorator.oeid import OETestID
 from oeqa.core.decorator.oetimeout import OETimeout
 
 class PingTest(OERuntimeTestCase):
 
     @OETimeout(30)
-    @OETestID(964)
     def test_ping(self):
         output = ''
         count = 0
diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
index 2a28ca59a8e..e210099d48a 100644
--- a/meta/lib/oeqa/runtime/cases/ptest.py
+++ b/meta/lib/oeqa/runtime/cases/ptest.py
@@ -4,14 +4,12 @@ import datetime
 
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
-from oeqa.core.decorator.oeid import OETestID
 from oeqa.core.decorator.data import skipIfNotFeature
 from oeqa.runtime.decorator.package import OEHasPackage
 from oeqa.utils.logparser import PtestParser
 
 class PtestRunnerTest(OERuntimeTestCase):
 
-    @OETestID(1600)
     @skipIfNotFeature('ptest', 'Test requires ptest to be in DISTRO_FEATURES')
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['ptest-runner'])
diff --git a/meta/lib/oeqa/runtime/cases/python.py b/meta/lib/oeqa/runtime/cases/python.py
index 66ab4d25f37..f03e33daa19 100644
--- a/meta/lib/oeqa/runtime/cases/python.py
+++ b/meta/lib/oeqa/runtime/cases/python.py
@@ -1,10 +1,8 @@
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
-from oeqa.core.decorator.oeid import OETestID
 from oeqa.runtime.decorator.package import OEHasPackage
 
 class PythonTest(OERuntimeTestCase):
-    @OETestID(965)
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['python3-core'])
     def test_python3(self):
diff --git a/meta/lib/oeqa/runtime/cases/rpm.py b/meta/lib/oeqa/runtime/cases/rpm.py
index de92157c52c..76176e632eb 100644
--- a/meta/lib/oeqa/runtime/cases/rpm.py
+++ b/meta/lib/oeqa/runtime/cases/rpm.py
@@ -3,14 +3,12 @@ import fnmatch
 
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
-from oeqa.core.decorator.oeid import OETestID
 from oeqa.core.decorator.data import skipIfDataVar
 from oeqa.runtime.decorator.package import OEHasPackage
 from oeqa.core.utils.path import findFile
 
 class RpmBasicTest(OERuntimeTestCase):
 
-    @OETestID(960)
     @OEHasPackage(['rpm'])
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     def test_rpm_help(self):
@@ -18,7 +16,6 @@ class RpmBasicTest(OERuntimeTestCase):
         msg = 'status and output: %s and %s' % (status, output)
         self.assertEqual(status, 0, msg=msg)
 
-    @OETestID(191)
     @OETestDepends(['rpm.RpmBasicTest.test_rpm_help'])
     def test_rpm_query(self):
         status, output = self.target.run('ls /var/lib/rpm/')
@@ -43,7 +40,6 @@ class RpmInstallRemoveTest(OERuntimeTestCase):
             cls.test_file = os.path.join(rpmdir, f)
         cls.dst = '/tmp/base-passwd-doc.rpm'
 
-    @OETestID(192)
     @OETestDepends(['rpm.RpmBasicTest.test_rpm_query'])
     def test_rpm_install(self):
         self.tc.target.copyTo(self.test_file, self.dst)
@@ -52,14 +48,12 @@ class RpmInstallRemoveTest(OERuntimeTestCase):
         self.assertEqual(status, 0, msg=msg)
         self.tc.target.run('rm -f %s' % self.dst)
 
-    @OETestID(194)
     @OETestDepends(['rpm.RpmInstallRemoveTest.test_rpm_install'])
     def test_rpm_remove(self):
         status,output = self.target.run('rpm -e base-passwd-doc')
         msg = 'Failed to remove base-passwd-doc package: %s' % output
         self.assertEqual(status, 0, msg=msg)
 
-    @OETestID(1096)
     @OETestDepends(['rpm.RpmBasicTest.test_rpm_query'])
     def test_rpm_query_nonroot(self):
 
@@ -92,7 +86,6 @@ class RpmInstallRemoveTest(OERuntimeTestCase):
         finally:
             unset_up_test_user(tuser)
 
-    @OETestID(195)
     @OETestDepends(['rpm.RpmInstallRemoveTest.test_rpm_remove'])
     def test_check_rpm_install_removal_log_file_size(self):
         """
diff --git a/meta/lib/oeqa/runtime/cases/scp.py b/meta/lib/oeqa/runtime/cases/scp.py
index 8f895da95a2..43dd7167fad 100644
--- a/meta/lib/oeqa/runtime/cases/scp.py
+++ b/meta/lib/oeqa/runtime/cases/scp.py
@@ -3,7 +3,6 @@ from tempfile import mkstemp
 
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
-from oeqa.core.decorator.oeid import OETestID
 from oeqa.runtime.decorator.package import OEHasPackage
 
 class ScpTest(OERuntimeTestCase):
@@ -19,7 +18,6 @@ class ScpTest(OERuntimeTestCase):
     def tearDownClass(cls):
         os.remove(cls.tmp_path)
 
-    @OETestID(220)
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['openssh-scp', 'dropbear'])
     def test_scp_file(self):
diff --git a/meta/lib/oeqa/runtime/cases/skeletoninit.py b/meta/lib/oeqa/runtime/cases/skeletoninit.py
index 4fdcf033a3d..4fad7947208 100644
--- a/meta/lib/oeqa/runtime/cases/skeletoninit.py
+++ b/meta/lib/oeqa/runtime/cases/skeletoninit.py
@@ -3,7 +3,6 @@
 # IMAGE_INSTALL_append = " service" in local.conf
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
-from oeqa.core.decorator.oeid import OETestID
 from oeqa.core.decorator.data import skipIfDataVar
 from oeqa.runtime.decorator.package import OEHasPackage
 
@@ -22,7 +21,6 @@ class SkeletonBasicTest(OERuntimeTestCase):
         msg = 'skeleton-test not found. Output:\n%s' % output
         self.assertEqual(status, 0, msg=msg)
 
-    @OETestID(284)
     @OETestDepends(['skeletoninit.SkeletonBasicTest.test_skeleton_availability'])
     def test_skeleton_script(self):
         output1 = self.target.run("/etc/init.d/skeleton start")[1]
diff --git a/meta/lib/oeqa/runtime/cases/ssh.py b/meta/lib/oeqa/runtime/cases/ssh.py
index 0b1ea7bcc25..26ced881453 100644
--- a/meta/lib/oeqa/runtime/cases/ssh.py
+++ b/meta/lib/oeqa/runtime/cases/ssh.py
@@ -1,11 +1,9 @@
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
-from oeqa.core.decorator.oeid import OETestID
 from oeqa.runtime.decorator.package import OEHasPackage
 
 class SSHTest(OERuntimeTestCase):
 
-    @OETestID(224)
     @OETestDepends(['ping.PingTest.test_ping'])
     @OEHasPackage(['dropbear', 'openssh-sshd'])
     def test_ssh(self):
diff --git a/meta/lib/oeqa/runtime/cases/stap.py b/meta/lib/oeqa/runtime/cases/stap.py
index c492caffd67..c149e56f7d5 100644
--- a/meta/lib/oeqa/runtime/cases/stap.py
+++ b/meta/lib/oeqa/runtime/cases/stap.py
@@ -2,7 +2,6 @@ import os
 
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
-from oeqa.core.decorator.oeid import OETestID
 from oeqa.core.decorator.data import skipIfNotFeature
 from oeqa.runtime.decorator.package import OEHasPackage
 
@@ -19,7 +18,6 @@ class StapTest(OERuntimeTestCase):
         files = '/tmp/hello.stp'
         cls.tc.target.run('rm %s' % files)
 
-    @OETestID(1652)
     @skipIfNotFeature('tools-profile',
                       'Test requires tools-profile to be in IMAGE_FEATURES')
     @OETestDepends(['kernelmodule.KernelModuleTest.test_kernel_module'])
diff --git a/meta/lib/oeqa/runtime/cases/systemd.py b/meta/lib/oeqa/runtime/cases/systemd.py
index 460b8fc3a10..db9da465ee5 100644
--- a/meta/lib/oeqa/runtime/cases/systemd.py
+++ b/meta/lib/oeqa/runtime/cases/systemd.py
@@ -3,7 +3,6 @@ import time
 
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
-from oeqa.core.decorator.oeid import OETestID
 from oeqa.core.decorator.data import skipIfDataVar, skipIfNotDataVar
 from oeqa.runtime.decorator.package import OEHasPackage
 from oeqa.core.decorator.data import skipIfNotFeature
@@ -78,12 +77,10 @@ class SystemdBasicTests(SystemdTest):
     def test_systemd_basic(self):
         self.systemctl('--version')
 
-    @OETestID(551)
     @OETestDepends(['systemd.SystemdBasicTests.test_systemd_basic'])
     def test_systemd_list(self):
         self.systemctl('list-unit-files')
 
-    @OETestID(550)
     @OETestDepends(['systemd.SystemdBasicTests.test_systemd_basic'])
     def test_systemd_failed(self):
         settled, output = self.settle()
@@ -104,7 +101,6 @@ class SystemdServiceTests(SystemdTest):
     def test_systemd_status(self):
         self.systemctl('status --full', 'avahi-daemon.service')
 
-    @OETestID(695)
     @OETestDepends(['systemd.SystemdServiceTests.test_systemd_status'])
     def test_systemd_stop_start(self):
         self.systemctl('stop', 'avahi-daemon.service')
@@ -113,7 +109,6 @@ class SystemdServiceTests(SystemdTest):
         self.systemctl('start','avahi-daemon.service')
         self.systemctl('is-active', 'avahi-daemon.service', verbose=True)
 
-    @OETestID(696)
     @OETestDepends(['systemd.SystemdServiceTests.test_systemd_status'])
     def test_systemd_disable_enable(self):
         self.systemctl('disable', 'avahi-daemon.service')
diff --git a/meta/lib/oeqa/runtime/cases/x32lib.py b/meta/lib/oeqa/runtime/cases/x32lib.py
index 8da0154e7b8..809dfdf9f4f 100644
--- a/meta/lib/oeqa/runtime/cases/x32lib.py
+++ b/meta/lib/oeqa/runtime/cases/x32lib.py
@@ -1,13 +1,11 @@
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
-from oeqa.core.decorator.oeid import OETestID
 from oeqa.core.decorator.data import skipIfNotInDataVar
 
 class X32libTest(OERuntimeTestCase):
 
     @skipIfNotInDataVar('DEFAULTTUNE', 'x86-64-x32',
                         'DEFAULTTUNE is not set to x86-64-x32')
-    @OETestID(281)
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     def test_x32_file(self):
         cmd = 'readelf -h /bin/ls | grep Class | grep ELF32'
diff --git a/meta/lib/oeqa/runtime/cases/xorg.py b/meta/lib/oeqa/runtime/cases/xorg.py
index 82521c69ac2..421ae565602 100644
--- a/meta/lib/oeqa/runtime/cases/xorg.py
+++ b/meta/lib/oeqa/runtime/cases/xorg.py
@@ -1,12 +1,10 @@
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
-from oeqa.core.decorator.oeid import OETestID
 from oeqa.core.decorator.data import skipIfNotFeature
 from oeqa.runtime.decorator.package import OEHasPackage
 
 class XorgTest(OERuntimeTestCase):
 
-    @OETestID(1151)
     @skipIfNotFeature('x11-base',
                       'Test requires x11 to be in IMAGE_FEATURES')
     @OETestDepends(['ssh.SSHTest.test_ssh'])
diff --git a/meta/lib/oeqa/sdkext/cases/devtool.py b/meta/lib/oeqa/sdkext/cases/devtool.py
index d322f86c73e..ab11b2b93a0 100644
--- a/meta/lib/oeqa/sdkext/cases/devtool.py
+++ b/meta/lib/oeqa/sdkext/cases/devtool.py
@@ -6,7 +6,6 @@ import shutil
 import subprocess
 
 from oeqa.sdkext.case import OESDKExtTestCase
-from oeqa.core.decorator.oeid import OETestID
 from oeqa.utils.httpserver import HTTPService
 
 from oeqa.utils.subprocesstweak import errors_have_output
@@ -51,19 +50,15 @@ class DevtoolTest(OESDKExtTestCase):
         self._run('devtool add myapp %s' % self.myapp_dst)
         self._run('devtool reset myapp')
 
-    @OETestID(1605)
     def test_devtool_build_make(self):
         self._test_devtool_build(self.myapp_dst)
 
-    @OETestID(1606)
     def test_devtool_build_esdk_package(self):
         self._test_devtool_build_package(self.myapp_dst)
 
-    @OETestID(1607)
     def test_devtool_build_cmake(self):
         self._test_devtool_build(self.myapp_cmake_dst)
 
-    @OETestID(1608)
     def test_extend_autotools_recipe_creation(self):
         req = 'https://github.com/rdfa/librdfa'
         recipe = "librdfa"
@@ -74,7 +69,6 @@ class DevtoolTest(OESDKExtTestCase):
         finally:
             self._run('devtool reset %s' % recipe)
 
-    @OETestID(1609)
     def test_devtool_kernelmodule(self):
         docfile = 'https://github.com/umlaeute/v4l2loopback.git'
         recipe = 'v4l2loopback-driver'
@@ -84,7 +78,6 @@ class DevtoolTest(OESDKExtTestCase):
         finally:
             self._run('devtool reset %s' % recipe)
 
-    @OETestID(1610)
     def test_recipes_for_nodejs(self):
         package_nodejs = "npm://registry.npmjs.org;name=winston;version=2.2.0"
         self._run('devtool add %s ' % package_nodejs)
diff --git a/meta/lib/oeqa/selftest/cases/archiver.py b/meta/lib/oeqa/selftest/cases/archiver.py
index 0a6d4e325fb..f450777c8d3 100644
--- a/meta/lib/oeqa/selftest/cases/archiver.py
+++ b/meta/lib/oeqa/selftest/cases/archiver.py
@@ -2,11 +2,9 @@ import os
 import glob
 from oeqa.utils.commands import bitbake, get_bb_vars
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.core.decorator.oeid import OETestID
 
 class Archiver(OESelftestTestCase):
 
-    @OETestID(1345)
     def test_archiver_allows_to_filter_on_recipe_name(self):
         """
         Summary:     The archiver should offer the possibility to filter on the recipe. (#6929)
@@ -40,7 +38,6 @@ class Archiver(OESelftestTestCase):
         excluded_present = len(glob.glob(src_path + '/%s-*' % exclude_recipe))
         self.assertFalse(excluded_present, 'Recipe %s was not excluded.' % exclude_recipe)
 
-    @OETestID(1900)
     def test_archiver_filters_by_type(self):
         """
         Summary:     The archiver is documented to filter on the recipe type.
@@ -73,7 +70,6 @@ class Archiver(OESelftestTestCase):
         excluded_present = len(glob.glob(src_path_native + '/%s-*' % native_recipe))
         self.assertFalse(excluded_present, 'Recipe %s was not excluded.' % native_recipe)
 
-    @OETestID(1901)
     def test_archiver_filters_by_type_and_name(self):
         """
         Summary:     Test that the archiver archives by recipe type, taking the
diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index 447c54b7e60..6ec5fb819e1 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -5,33 +5,27 @@ import oeqa.utils.ftools as ftools
 from oeqa.utils.commands import runCmd, get_bb_var, get_bb_vars
 
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.core.decorator.oeid import OETestID
 
 class BitbakeLayers(OESelftestTestCase):
 
-    @OETestID(756)
     def test_bitbakelayers_showcrossdepends(self):
         result = runCmd('bitbake-layers show-cross-depends')
         self.assertTrue('aspell' in result.output, msg = "No dependencies were shown. bitbake-layers show-cross-depends output: %s" % result.output)
 
-    @OETestID(83)
     def test_bitbakelayers_showlayers(self):
         result = runCmd('bitbake-layers show-layers')
         self.assertTrue('meta-selftest' in result.output, msg = "No layers were shown. bitbake-layers show-layers output: %s" % result.output)
 
-    @OETestID(93)
     def test_bitbakelayers_showappends(self):
         recipe = "xcursor-transparent-theme"
         bb_file = self.get_recipe_basename(recipe)
         result = runCmd('bitbake-layers show-appends')
         self.assertTrue(bb_file in result.output, msg="%s file was not recognised. bitbake-layers show-appends output: %s" % (bb_file, result.output))
 
-    @OETestID(90)
     def test_bitbakelayers_showoverlayed(self):
         result = runCmd('bitbake-layers show-overlayed')
         self.assertTrue('aspell' in result.output, msg="aspell overlayed recipe was not recognised bitbake-layers show-overlayed %s" % result.output)
 
-    @OETestID(95)
     def test_bitbakelayers_flatten(self):
         recipe = "xcursor-transparent-theme"
         recipe_path = "recipes-graphics/xcursor-transparent-theme"
@@ -46,7 +40,6 @@ class BitbakeLayers(OESelftestTestCase):
         find_in_contents = re.search("##### bbappended from meta-selftest #####\n(.*\n)*include test_recipe.inc", contents)
         self.assertTrue(find_in_contents, msg = "Flattening layers did not work. bitbake-layers flatten output: %s" % result.output)
 
-    @OETestID(1195)
     def test_bitbakelayers_add_remove(self):
         test_layer = os.path.join(get_bb_var('COREBASE'), 'meta-skeleton')
         result = runCmd('bitbake-layers show-layers')
@@ -64,7 +57,6 @@ class BitbakeLayers(OESelftestTestCase):
         result = runCmd('bitbake-layers show-layers')
         self.assertNotIn('meta-skeleton', result.output, msg = "meta-skeleton should have been removed at this step.  bitbake-layers show-layers output: %s" % result.output)
 
-    @OETestID(1384)
     def test_bitbakelayers_showrecipes(self):
         result = runCmd('bitbake-layers show-recipes')
         self.assertIn('aspell:', result.output)
diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index c503e4eedda..1b837419743 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -5,7 +5,6 @@ import oeqa.utils.ftools as ftools
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
 
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.core.decorator.oeid import OETestID
 
 class BitbakeTests(OESelftestTestCase):
 
@@ -14,13 +13,11 @@ class BitbakeTests(OESelftestTestCase):
             if line in l:
                 return l
 
-    @OETestID(789)
     # Test bitbake can run from the <builddir>/conf directory
     def test_run_bitbake_from_dir_1(self):
         os.chdir(os.path.join(self.builddir, 'conf'))
         self.assertEqual(bitbake('-e').status, 0, msg = "bitbake couldn't run from \"conf\" dir")
 
-    @OETestID(790)
     # Test bitbake can run from the <builddir>'s parent directory
     def test_run_bitbake_from_dir_2(self):
         my_env = os.environ.copy()
@@ -36,7 +33,6 @@ class BitbakeTests(OESelftestTestCase):
         self.assertEqual(bitbake('-e', env=my_env).status, 0, msg = "bitbake couldn't run from /tmp/")
 
 
-    @OETestID(806)
     def test_event_handler(self):
         self.write_config("INHERIT += \"test_events\"")
         result = bitbake('m4-native')
@@ -46,7 +42,6 @@ class BitbakeTests(OESelftestTestCase):
         self.assertTrue(find_build_completed, msg = "Match failed in:\n%s" % result.output)
         self.assertFalse('Test for bb.event.InvalidEvent' in result.output, msg = "\"Test for bb.event.InvalidEvent\" message found during bitbake process. bitbake output: %s" % result.output)
 
-    @OETestID(103)
     def test_local_sstate(self):
         bitbake('m4-native')
         bitbake('m4-native -cclean')
@@ -54,17 +49,14 @@ class BitbakeTests(OESelftestTestCase):
         find_setscene = re.search("m4-native.*do_.*_setscene", result.output)
         self.assertTrue(find_setscene, msg = "No \"m4-native.*do_.*_setscene\" message found during bitbake m4-native. bitbake output: %s" % result.output )
 
-    @OETestID(105)
     def test_bitbake_invalid_recipe(self):
         result = bitbake('-b asdf', ignore_status=True)
         self.assertTrue("ERROR: Unable to find any recipe file matching 'asdf'" in result.output, msg = "Though asdf recipe doesn't exist, bitbake didn't output any err. message. bitbake output: %s" % result.output)
 
-    @OETestID(107)
     def test_bitbake_invalid_target(self):
         result = bitbake('asdf', ignore_status=True)
         self.assertTrue("ERROR: Nothing PROVIDES 'asdf'" in result.output, msg = "Though no 'asdf' target exists, bitbake didn't output any err. message. bitbake output: %s" % result.output)
 
-    @OETestID(106)
     def test_warnings_errors(self):
         result = bitbake('-b asdf', ignore_status=True)
         find_warnings = re.search("Summary: There w.{2,3}? [1-9][0-9]* WARNING messages* shown", result.output)
@@ -72,7 +64,6 @@ class BitbakeTests(OESelftestTestCase):
         self.assertTrue(find_warnings, msg="Did not find the mumber of warnings at the end of the build:\n" + result.output)
         self.assertTrue(find_errors, msg="Did not find the mumber of errors at the end of the build:\n" + result.output)
 
-    @OETestID(108)
     def test_invalid_patch(self):
         # This patch should fail to apply.
         self.write_recipeinc('man-db', 'FILESEXTRAPATHS_prepend := "${THISDIR}/files:"\nSRC_URI += "file://0001-Test-patch-here.patch"')
@@ -83,7 +74,6 @@ class BitbakeTests(OESelftestTestCase):
         line = self.getline(result, "Function failed: patch_do_patch")
         self.assertTrue(line and line.startswith("ERROR:"), msg = "Incorrectly formed patch application didn't fail. bitbake output: %s" % result.output)
 
-    @OETestID(1354)
     def test_force_task_1(self):
         # test 1 from bug 5875
         test_recipe = 'zlib'
@@ -108,7 +98,6 @@ class BitbakeTests(OESelftestTestCase):
         ret = bitbake(test_recipe)
         self.assertIn('task do_package_write_rpm:', ret.output, 'Task do_package_write_rpm did not re-executed.')
 
-    @OETestID(163)
     def test_force_task_2(self):
         # test 2 from bug 5875
         test_recipe = 'zlib'
@@ -121,7 +110,6 @@ class BitbakeTests(OESelftestTestCase):
         for task in look_for_tasks:
             self.assertIn(task, result.output, msg="Couldn't find %s task.")
 
-    @OETestID(167)
     def test_bitbake_g(self):
         result = bitbake('-g core-image-minimal')
         for f in ['pn-buildlist', 'recipe-depends.dot', 'task-depends.dot']:
@@ -129,7 +117,6 @@ class BitbakeTests(OESelftestTestCase):
         self.assertTrue('Task dependencies saved to \'task-depends.dot\'' in result.output, msg = "No task dependency \"task-depends.dot\" file was generated for the given task target. bitbake output: %s" % result.output)
         self.assertTrue('busybox' in ftools.read_file(os.path.join(self.builddir, 'task-depends.dot')), msg = "No \"busybox\" dependency found in task-depends.dot file.")
 
-    @OETestID(899)
     def test_image_manifest(self):
         bitbake('core-image-minimal')
         bb_vars = get_bb_vars(["DEPLOY_DIR_IMAGE", "IMAGE_LINK_NAME"], "core-image-minimal")
@@ -138,7 +125,6 @@ class BitbakeTests(OESelftestTestCase):
         manifest = os.path.join(deploydir, imagename + ".manifest")
         self.assertTrue(os.path.islink(manifest), msg="No manifest file created for image. It should have been created in %s" % manifest)
 
-    @OETestID(168)
     def test_invalid_recipe_src_uri(self):
         data = 'SRC_URI = "file://invalid"'
         self.write_recipeinc('man-db', data)
@@ -159,7 +145,6 @@ doesn't exist, yet no error message encountered. bitbake output: %s" % result.ou
         self.assertTrue(line and line.startswith("ERROR:"), msg = "\"invalid\" file \
 doesn't exist, yet fetcher didn't report any error. bitbake output: %s" % result.output)
 
-    @OETestID(171)
     def test_rename_downloaded_file(self):
         # TODO unique dldir instead of using cleanall
         # TODO: need to set sstatedir?
@@ -177,29 +162,24 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
         self.assertTrue(os.path.isfile(os.path.join(dl_dir, 'test-aspell.tar.gz')), msg = "File rename failed. No corresponding test-aspell.tar.gz file found under %s" % dl_dir)
         self.assertTrue(os.path.isfile(os.path.join(dl_dir, 'test-aspell.tar.gz.done')), "File rename failed. No corresponding test-aspell.tar.gz.done file found under %s" % dl_dir)
 
-    @OETestID(1028)
     def test_environment(self):
         self.write_config("TEST_ENV=\"localconf\"")
         result = runCmd('bitbake -e | grep TEST_ENV=')
         self.assertTrue('localconf' in result.output, msg = "bitbake didn't report any value for TEST_ENV variable. To test, run 'bitbake -e | grep TEST_ENV='")
 
-    @OETestID(1029)
     def test_dry_run(self):
         result = runCmd('bitbake -n m4-native')
         self.assertEqual(0, result.status, "bitbake dry run didn't run as expected. %s" % result.output)
 
-    @OETestID(1030)
     def test_just_parse(self):
         result = runCmd('bitbake -p')
         self.assertEqual(0, result.status, "errors encountered when parsing recipes. %s" % result.output)
 
-    @OETestID(1031)
     def test_version(self):
         result = runCmd('bitbake -s | grep wget')
         find = re.search(r"wget *:([0-9a-zA-Z\.\-]+)", result.output)
         self.assertTrue(find, "No version returned for searched recipe. bitbake output: %s" % result.output)
 
-    @OETestID(1032)
     def test_prefile(self):
         preconf = os.path.join(self.builddir, 'conf/prefile.conf')
         self.track_for_cleanup(preconf)
@@ -210,7 +190,6 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
         result = runCmd('bitbake -r conf/prefile.conf -e | grep TEST_PREFILE=')
         self.assertTrue('localconf' in result.output, "Preconfigure file \"prefile.conf\"was not taken into consideration.")
 
-    @OETestID(1033)
     def test_postfile(self):
         postconf = os.path.join(self.builddir, 'conf/postfile.conf')
         self.track_for_cleanup(postconf)
@@ -219,12 +198,10 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
         result = runCmd('bitbake -R conf/postfile.conf -e | grep TEST_POSTFILE=')
         self.assertTrue('postfile' in result.output, "Postconfigure file \"postfile.conf\"was not taken into consideration.")
 
-    @OETestID(1034)
     def test_checkuri(self):
         result = runCmd('bitbake -c checkuri m4')
         self.assertEqual(0, result.status, msg = "\"checkuri\" task was not executed. bitbake output: %s" % result.output)
 
-    @OETestID(1035)
     def test_continue(self):
         self.write_config("""DL_DIR = \"${TOPDIR}/download-selftest\"
 SSTATE_DIR = \"${TOPDIR}/download-selftest\"
@@ -239,7 +216,6 @@ INHERIT_remove = \"report-error\"
         continuepos = result.output.find('NOTE: recipe xcursor-transparent-theme-%s: task do_unpack: Started' % manver.group(1))
         self.assertLess(errorpos,continuepos, msg = "bitbake didn't pass do_fail_task. bitbake output: %s" % result.output)
 
-    @OETestID(1119)
     def test_non_gplv3(self):
         self.write_config('INCOMPATIBLE_LICENSE = "GPLv3"')
         result = bitbake('selftest-ed', ignore_status=True)
@@ -248,7 +224,6 @@ INHERIT_remove = \"report-error\"
         self.assertFalse(os.path.isfile(os.path.join(lic_dir, 'selftest-ed/generic_GPLv3')))
         self.assertTrue(os.path.isfile(os.path.join(lic_dir, 'selftest-ed/generic_GPLv2')))
 
-    @OETestID(1422)
     def test_setscene_only(self):
         """ Bitbake option to restore from sstate only within a build (i.e. execute no real tasks, only setscene)"""
         test_recipe = 'ed'
@@ -263,7 +238,6 @@ INHERIT_remove = \"report-error\"
             self.assertIn('_setscene', task, 'A task different from _setscene ran: %s.\n'
                                              'Executed tasks were: %s' % (task, str(tasks)))
 
-    @OETestID(1425)
     def test_bbappend_order(self):
         """ Bitbake should bbappend to recipe in a predictable order """
         test_recipe = 'ed'
diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
index 6a18eb83665..953c6e468df 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -7,11 +7,9 @@ from oeqa.selftest.case import OESelftestTestCase
 from oeqa.selftest.cases.buildhistory import BuildhistoryBase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
 import oeqa.utils.ftools as ftools
-from oeqa.core.decorator.oeid import OETestID
 
 class ImageOptionsTests(OESelftestTestCase):
 
-    @OETestID(761)
     def test_incremental_image_generation(self):
         image_pkgtype = get_bb_var("IMAGE_PKGTYPE")
         if image_pkgtype != 'rpm':
@@ -30,7 +28,6 @@ class ImageOptionsTests(OESelftestTestCase):
         incremental_removed = re.search(r"Erasing\s*:\s*packagegroup-core-ssh-openssh", log_data_removed)
         self.assertTrue(incremental_removed, msg = "Match failed in:\n%s" % log_data_removed)
 
-    @OETestID(286)
     def test_ccache_tool(self):
         bitbake("ccache-native")
         bb_vars = get_bb_vars(['SYSROOT_DESTDIR', 'bindir'], 'ccache-native')
@@ -45,7 +42,6 @@ class ImageOptionsTests(OESelftestTestCase):
             loglines = "".join(f.readlines())
         self.assertIn("ccache", loglines, msg="No match for ccache in m4-native log.do_compile. For further details: %s" % log_compile)
 
-    @OETestID(1435)
     def test_read_only_image(self):
         distro_features = get_bb_var('DISTRO_FEATURES')
         if not ('x11' in distro_features and 'opengl' in distro_features):
@@ -56,7 +52,6 @@ class ImageOptionsTests(OESelftestTestCase):
 
 class DiskMonTest(OESelftestTestCase):
 
-    @OETestID(277)
     def test_stoptask_behavior(self):
         self.write_config('BB_DISKMON_DIRS = "STOPTASKS,${TMPDIR},100000G,100K"')
         res = bitbake("delay -c delay", ignore_status = True)
@@ -76,7 +71,6 @@ class SanityOptionsTest(OESelftestTestCase):
             if line in l:
                 return l
 
-    @OETestID(927)
     def test_options_warnqa_errorqa_switch(self):
 
         self.write_config("INHERIT_remove = \"report-error\"")
@@ -98,7 +92,6 @@ class SanityOptionsTest(OESelftestTestCase):
         line = self.getline(res, "QA Issue: xcursor-transparent-theme-dbg is listed in PACKAGES multiple times, this leads to packaging errors.")
         self.assertTrue(line and line.startswith("WARNING:"), msg=res.output)
 
-    @OETestID(1421)
     def test_layer_without_git_dir(self):
         """
         Summary:     Test that layer git revisions are displayed and do not fail without git repository
@@ -140,12 +133,10 @@ class SanityOptionsTest(OESelftestTestCase):
 
 class BuildhistoryTests(BuildhistoryBase):
 
-    @OETestID(293)
     def test_buildhistory_basic(self):
         self.run_buildhistory_operation('xcursor-transparent-theme')
         self.assertTrue(os.path.isdir(get_bb_var('BUILDHISTORY_DIR')), "buildhistory dir was not created.")
 
-    @OETestID(294)
     def test_buildhistory_buildtime_pr_backwards(self):
         target = 'xcursor-transparent-theme'
         error = "ERROR:.*QA Issue: Package version for package %s went backwards which would break package feeds from (.*-r1.* to .*-r0.*)" % target
@@ -153,7 +144,6 @@ class BuildhistoryTests(BuildhistoryBase):
         self.run_buildhistory_operation(target, target_config="PR = \"r0\"", change_bh_location=False, expect_error=True, error_regex=error)
 
 class ArchiverTest(OESelftestTestCase):
-    @OETestID(926)
     def test_arch_work_dir_and_export_source(self):
         """
         Test for archiving the work directory and exporting the source files.
diff --git a/meta/lib/oeqa/selftest/cases/containerimage.py b/meta/lib/oeqa/selftest/cases/containerimage.py
index 8deaae75d8a..47d97b75412 100644
--- a/meta/lib/oeqa/selftest/cases/containerimage.py
+++ b/meta/lib/oeqa/selftest/cases/containerimage.py
@@ -2,7 +2,6 @@ import os
 
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake, get_bb_vars, runCmd
-from oeqa.core.decorator.oeid import OETestID
 
 # This test builds an image with using the "container" IMAGE_FSTYPE, and
 # ensures that then files in the image are only the ones expected.
@@ -21,7 +20,6 @@ class ContainerImageTests(OESelftestTestCase):
 
     # Verify that when specifying a IMAGE_TYPEDEP_ of the form "foo.bar" that
     # the conversion type bar gets added as a dep as well
-    @OETestID(1619)
     def test_expected_files(self):
 
         def get_each_path_part(path):
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 58f3e58461a..48fc042904d 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -9,7 +9,6 @@ import oeqa.utils.ftools as ftools
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_layer
 from oeqa.utils.commands import get_bb_vars, runqemu, get_test_layer
-from oeqa.core.decorator.oeid import OETestID
 
 oldmetapath = None
 
@@ -233,7 +232,6 @@ class DevtoolBase(OESelftestTestCase):
 
 class DevtoolTests(DevtoolBase):
 
-    @OETestID(1158)
     def test_create_workspace(self):
         # Check preconditions
         result = runCmd('bitbake-layers show-layers')
@@ -256,7 +254,6 @@ class DevtoolTests(DevtoolBase):
 
 class DevtoolAddTests(DevtoolBase):
 
-    @OETestID(1159)
     def test_devtool_add(self):
         # Fetch source
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
@@ -298,7 +295,6 @@ class DevtoolAddTests(DevtoolBase):
             bindir = bindir[1:]
         self.assertTrue(os.path.isfile(os.path.join(installdir, bindir, 'pv')), 'pv binary not found in D')
 
-    @OETestID(1423)
     def test_devtool_add_git_local(self):
         # We need dbus built so that DEPENDS recognition works
         bitbake('dbus')
@@ -340,7 +336,6 @@ class DevtoolAddTests(DevtoolBase):
         checkvars['DEPENDS'] = set(['dbus'])
         self._test_recipe_contents(recipefile, checkvars, [])
 
-    @OETestID(1162)
     def test_devtool_add_library(self):
         # Fetch source
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
@@ -389,7 +384,6 @@ class DevtoolAddTests(DevtoolBase):
         self.assertFalse(matches, 'Stamp files exist for recipe libftdi that should have been cleaned')
         self.assertFalse(os.path.isfile(os.path.join(staging_libdir, 'libftdi1.so.2.1.0')), 'libftdi binary still found in STAGING_LIBDIR after cleaning')
 
-    @OETestID(1160)
     def test_devtool_add_fetch(self):
         # Fetch source
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
@@ -435,7 +429,6 @@ class DevtoolAddTests(DevtoolBase):
         checkvars['SRC_URI'] = url
         self._test_recipe_contents(recipefile, checkvars, [])
 
-    @OETestID(1161)
     def test_devtool_add_fetch_git(self):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
@@ -483,7 +476,6 @@ class DevtoolAddTests(DevtoolBase):
         checkvars['SRCREV'] = checkrev
         self._test_recipe_contents(recipefile, checkvars, [])
 
-    @OETestID(1391)
     def test_devtool_add_fetch_simple(self):
         # Fetch source from a remote URL, auto-detecting name
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
@@ -513,7 +505,6 @@ class DevtoolAddTests(DevtoolBase):
 
 class DevtoolModifyTests(DevtoolBase):
 
-    @OETestID(1164)
     def test_devtool_modify(self):
         import oe.path
 
@@ -571,7 +562,6 @@ class DevtoolModifyTests(DevtoolBase):
         result = runCmd('devtool status')
         self.assertNotIn('mdadm', result.output)
 
-    @OETestID(1620)
     def test_devtool_buildclean(self):
         def assertFile(path, *paths):
             f = os.path.join(path, *paths)
@@ -618,7 +608,6 @@ class DevtoolModifyTests(DevtoolBase):
         finally:
             self.delete_recipeinc('m4')
 
-    @OETestID(1166)
     def test_devtool_modify_invalid(self):
         # Try modifying some recipes
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
@@ -647,7 +636,6 @@ class DevtoolModifyTests(DevtoolBase):
             self.assertNotEqual(result.status, 0, 'devtool modify on %s should have failed. devtool output: %s' %  (testrecipe, result.output))
             self.assertIn('ERROR: ', result.output, 'devtool modify on %s should have given an ERROR' % testrecipe)
 
-    @OETestID(1365)
     def test_devtool_modify_native(self):
         # Check preconditions
         self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
@@ -677,7 +665,6 @@ class DevtoolModifyTests(DevtoolBase):
         self.assertTrue(inheritnative, 'None of these recipes do "inherit native" - need to adjust testrecipes list: %s' % ', '.join(testrecipes))
 
 
-    @OETestID(1165)
     def test_devtool_modify_git(self):
         # Check preconditions
         testrecipe = 'psplash'
@@ -705,7 +692,6 @@ class DevtoolModifyTests(DevtoolBase):
         # Try building
         bitbake(testrecipe)
 
-    @OETestID(1167)
     def test_devtool_modify_localfiles(self):
         # Check preconditions
         testrecipe = 'lighttpd'
@@ -736,7 +722,6 @@ class DevtoolModifyTests(DevtoolBase):
         # Try building
         bitbake(testrecipe)
 
-    @OETestID(1378)
     def test_devtool_modify_virtual(self):
         # Try modifying a virtual recipe
         virtrecipe = 'virtual/make'
@@ -760,7 +745,6 @@ class DevtoolModifyTests(DevtoolBase):
 
 class DevtoolUpdateTests(DevtoolBase):
 
-    @OETestID(1169)
     def test_devtool_update_recipe(self):
         # Check preconditions
         testrecipe = 'minicom'
@@ -793,7 +777,6 @@ class DevtoolUpdateTests(DevtoolBase):
                            ('??', '.*/0002-Add-a-new-file.patch$')]
         self._check_repo_status(os.path.dirname(recipefile), expected_status)
 
-    @OETestID(1172)
     def test_devtool_update_recipe_git(self):
         # Check preconditions
         testrecipe = 'mtd-utils'
@@ -863,7 +846,6 @@ class DevtoolUpdateTests(DevtoolBase):
                            ('??', '%s/0002-Add-a-new-file.patch' % relpatchpath)]
         self._check_repo_status(os.path.dirname(recipefile), expected_status)
 
-    @OETestID(1170)
     def test_devtool_update_recipe_append(self):
         # Check preconditions
         testrecipe = 'mdadm'
@@ -932,7 +914,6 @@ class DevtoolUpdateTests(DevtoolBase):
             self.assertEqual(expectedlines, f.readlines())
         # Deleting isn't expected to work under these circumstances
 
-    @OETestID(1171)
     def test_devtool_update_recipe_append_git(self):
         # Check preconditions
         testrecipe = 'mtd-utils'
@@ -1023,7 +1004,6 @@ class DevtoolUpdateTests(DevtoolBase):
             self.assertEqual(expectedlines, set(f.readlines()))
         # Deleting isn't expected to work under these circumstances
 
-    @OETestID(1370)
     def test_devtool_update_recipe_local_files(self):
         """Check that local source files are copied over instead of patched"""
         testrecipe = 'makedevs'
@@ -1055,7 +1035,6 @@ class DevtoolUpdateTests(DevtoolBase):
                            ('??', '.*/makedevs/0001-Add-new-file.patch$')]
         self._check_repo_status(os.path.dirname(recipefile), expected_status)
 
-    @OETestID(1371)
     def test_devtool_update_recipe_local_files_2(self):
         """Check local source files support when oe-local-files is in Git"""
         testrecipe = 'devtool-test-local'
@@ -1100,7 +1079,6 @@ class DevtoolUpdateTests(DevtoolBase):
                            ('??', '.*/0001-Add-new-file.patch$')]
         self._check_repo_status(os.path.dirname(recipefile), expected_status)
 
-    @OETestID(1627)
     def test_devtool_update_recipe_local_files_3(self):
         # First, modify the recipe
         testrecipe = 'devtool-test-localonly'
@@ -1120,7 +1098,6 @@ class DevtoolUpdateTests(DevtoolBase):
         expected_status = [(' M', '.*/%s/file2$' % testrecipe)]
         self._check_repo_status(os.path.dirname(recipefile), expected_status)
 
-    @OETestID(1629)
     def test_devtool_update_recipe_local_patch_gz(self):
         # First, modify the recipe
         testrecipe = 'devtool-test-patch-gz'
@@ -1148,7 +1125,6 @@ class DevtoolUpdateTests(DevtoolBase):
         if 'gzip compressed data' not in result.output:
             self.fail('New patch file is not gzipped - file reports:\n%s' % result.output)
 
-    @OETestID(1628)
     def test_devtool_update_recipe_local_files_subdir(self):
         # Try devtool update-recipe on a recipe that has a file with subdir= set in
         # SRC_URI such that it overwrites a file that was in an archive that
@@ -1177,7 +1153,6 @@ class DevtoolUpdateTests(DevtoolBase):
 
 class DevtoolExtractTests(DevtoolBase):
 
-    @OETestID(1163)
     def test_devtool_extract(self):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         # Try devtool extract
@@ -1188,7 +1163,6 @@ class DevtoolExtractTests(DevtoolBase):
         self.assertExists(os.path.join(tempdir, 'Makefile.am'), 'Extracted source could not be found')
         self._check_src_repo(tempdir)
 
-    @OETestID(1379)
     def test_devtool_extract_virtual(self):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         # Try devtool extract
@@ -1199,7 +1173,6 @@ class DevtoolExtractTests(DevtoolBase):
         self.assertExists(os.path.join(tempdir, 'Makefile.am'), 'Extracted source could not be found')
         self._check_src_repo(tempdir)
 
-    @OETestID(1168)
     def test_devtool_reset_all(self):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
@@ -1226,7 +1199,6 @@ class DevtoolExtractTests(DevtoolBase):
         matches2 = glob.glob(stampprefix2 + '*')
         self.assertFalse(matches2, 'Stamp files exist for recipe %s that should have been cleaned' % testrecipe2)
 
-    @OETestID(1272)
     def test_devtool_deploy_target(self):
         # NOTE: Whilst this test would seemingly be better placed as a runtime test,
         # unfortunately the runtime tests run under bitbake and you can't run
@@ -1312,7 +1284,6 @@ class DevtoolExtractTests(DevtoolBase):
             result = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, testcommand), ignore_status=True)
             self.assertNotEqual(result, 0, 'undeploy-target did not remove command as it should have')
 
-    @OETestID(1366)
     def test_devtool_build_image(self):
         """Test devtool build-image plugin"""
         # Check preconditions
@@ -1348,7 +1319,6 @@ class DevtoolExtractTests(DevtoolBase):
 
 class DevtoolUpgradeTests(DevtoolBase):
 
-    @OETestID(1367)
     def test_devtool_upgrade(self):
         # Check preconditions
         self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
@@ -1393,7 +1363,6 @@ class DevtoolUpgradeTests(DevtoolBase):
         self.assertNotIn(recipe, result.output)
         self.assertNotExists(os.path.join(self.workspacedir, 'recipes', recipe), 'Recipe directory should not exist after resetting')
 
-    @OETestID(1433)
     def test_devtool_upgrade_git(self):
         # Check preconditions
         self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
@@ -1430,7 +1399,6 @@ class DevtoolUpgradeTests(DevtoolBase):
         self.assertNotIn(recipe, result.output)
         self.assertNotExists(os.path.join(self.workspacedir, 'recipes', recipe), 'Recipe directory should not exist after resetting')
 
-    @OETestID(1352)
     def test_devtool_layer_plugins(self):
         """Test that devtool can use plugins from other layers.
 
@@ -1456,7 +1424,6 @@ class DevtoolUpgradeTests(DevtoolBase):
             shutil.copy(srcfile, dstfile)
             self.track_for_cleanup(dstfile)
 
-    @OETestID(1625)
     def test_devtool_load_plugin(self):
         """Test that devtool loads only the first found plugin in BBPATH."""
 
@@ -1524,7 +1491,6 @@ class DevtoolUpgradeTests(DevtoolBase):
         self.assertExists(os.path.join(olddir, patchfn), 'Original patch file does not exist')
         return recipe, oldrecipefile, recipedir, olddir, newversion, patchfn
 
-    @OETestID(1623)
     def test_devtool_finish_upgrade_origlayer(self):
         recipe, oldrecipefile, recipedir, olddir, newversion, patchfn = self._setup_test_devtool_finish_upgrade()
         # Ensure the recipe is where we think it should be (so that cleanup doesn't trash things)
@@ -1543,7 +1509,6 @@ class DevtoolUpgradeTests(DevtoolBase):
         self.assertExists(os.path.join(newdir, patchfn), 'Patch file should have been copied into new directory but wasn\'t')
         self.assertExists(os.path.join(newdir, '0002-Add-a-comment-to-the-code.patch'), 'New patch file should have been created but wasn\'t')
 
-    @OETestID(1624)
     def test_devtool_finish_upgrade_otherlayer(self):
         recipe, oldrecipefile, recipedir, olddir, newversion, patchfn = self._setup_test_devtool_finish_upgrade()
         # Ensure the recipe is where we think it should be (so that cleanup doesn't trash things)
@@ -1599,7 +1564,6 @@ class DevtoolUpgradeTests(DevtoolBase):
             self.fail('Unable to find recipe files directory for %s' % recipe)
         return recipe, oldrecipefile, recipedir, filesdir
 
-    @OETestID(1621)
     def test_devtool_finish_modify_origlayer(self):
         recipe, oldrecipefile, recipedir, filesdir = self._setup_test_devtool_finish_modify()
         # Ensure the recipe is where we think it should be (so that cleanup doesn't trash things)
@@ -1614,7 +1578,6 @@ class DevtoolUpgradeTests(DevtoolBase):
                            ('??', '.*/.*-Add-a-comment-to-the-code.patch$')]
         self._check_repo_status(recipedir, expected_status)
 
-    @OETestID(1622)
     def test_devtool_finish_modify_otherlayer(self):
         recipe, oldrecipefile, recipedir, filesdir = self._setup_test_devtool_finish_modify()
         # Ensure the recipe is where we think it should be (so that cleanup doesn't trash things)
@@ -1647,7 +1610,6 @@ class DevtoolUpgradeTests(DevtoolBase):
         if files:
             self.fail('Unexpected file(s) copied next to bbappend: %s' % ', '.join(files))
 
-    @OETestID(1626)
     def test_devtool_rename(self):
         # Check preconditions
         self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
@@ -1708,7 +1670,6 @@ class DevtoolUpgradeTests(DevtoolBase):
         checkvars['SRC_URI'] = url
         self._test_recipe_contents(newrecipefile, checkvars, [])
 
-    @OETestID(1577)
     def test_devtool_virtual_kernel_modify(self):
         """
         Summary:        The purpose of this test case is to verify that
diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oeqa/selftest/cases/distrodata.py
index 0b454714e95..8962bda011b 100644
--- a/meta/lib/oeqa/selftest/cases/distrodata.py
+++ b/meta/lib/oeqa/selftest/cases/distrodata.py
@@ -2,13 +2,11 @@ from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
 from oeqa.utils.decorators import testcase
 from oeqa.utils.ftools import write_file
-from oeqa.core.decorator.oeid import OETestID
 
 import oe.recipeutils
 
 class Distrodata(OESelftestTestCase):
 
-    @OETestID(1902)
     def test_checkpkg(self):
         """
         Summary:     Test that upstream version checks do not regress
diff --git a/meta/lib/oeqa/selftest/cases/eSDK.py b/meta/lib/oeqa/selftest/cases/eSDK.py
index 8eb6ec660ce..d501238854e 100644
--- a/meta/lib/oeqa/selftest/cases/eSDK.py
+++ b/meta/lib/oeqa/selftest/cases/eSDK.py
@@ -3,7 +3,6 @@ import shutil
 import os
 import glob
 import time
-from oeqa.core.decorator.oeid import OETestID
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
 
@@ -104,14 +103,12 @@ SSTATE_MIRRORS =  "file://.* file://%s/PATH"
         cls.tmpdirobj.cleanup()
         super().tearDownClass()
 
-    @OETestID(1602)
     def test_install_libraries_headers(self):
         pn_sstate = 'bc'
         bitbake(pn_sstate)
         cmd = "devtool sdk-install %s " % pn_sstate
         oeSDKExtSelfTest.run_esdk_cmd(self.env_eSDK, self.tmpdir_eSDKQA, cmd)
 
-    @OETestID(1603)
     def test_image_generation_binary_feeds(self):
         image = 'core-image-minimal'
         cmd = "devtool build-image %s" % image
diff --git a/meta/lib/oeqa/selftest/cases/fetch.py b/meta/lib/oeqa/selftest/cases/fetch.py
index 4acc8cdcc8e..c5de4fd4015 100644
--- a/meta/lib/oeqa/selftest/cases/fetch.py
+++ b/meta/lib/oeqa/selftest/cases/fetch.py
@@ -1,10 +1,8 @@
 import oe.path
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake
-from oeqa.core.decorator.oeid import OETestID
 
 class Fetch(OESelftestTestCase):
-    @OETestID(1058)
     def test_git_mirrors(self):
         """
         Verify that the git fetcher will fall back to the HTTP mirrors. The
diff --git a/meta/lib/oeqa/selftest/cases/image_typedep.py b/meta/lib/oeqa/selftest/cases/image_typedep.py
index 932c7f883da..9f1f983e1d3 100644
--- a/meta/lib/oeqa/selftest/cases/image_typedep.py
+++ b/meta/lib/oeqa/selftest/cases/image_typedep.py
@@ -2,13 +2,11 @@ import os
 
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake
-from oeqa.core.decorator.oeid import OETestID
 
 class ImageTypeDepTests(OESelftestTestCase):
 
     # Verify that when specifying a IMAGE_TYPEDEP_ of the form "foo.bar" that
     # the conversion type bar gets added as a dep as well
-    @OETestID(1633)
     def test_conversion_typedep_added(self):
 
         self.write_recipeinc('emptytest', """
diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index aed63e5476a..a1d9f12dcc2 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -1,6 +1,5 @@
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
-from oeqa.core.decorator.oeid import OETestID
 from oeqa.utils.sshcontrol import SSHControl
 import os
 import json
@@ -10,7 +9,6 @@ class ImageFeatures(OESelftestTestCase):
     test_user = 'tester'
     root_user = 'root'
 
-    @OETestID(1107)
     def test_non_root_user_can_connect_via_ssh_without_password(self):
         """
         Summary: Check if non root user can connect via ssh without password
@@ -36,7 +34,6 @@ class ImageFeatures(OESelftestTestCase):
                 status, output = ssh.run("true")
                 self.assertEqual(status, 0, 'ssh to user %s failed with %s' % (user, output))
 
-    @OETestID(1115)
     def test_all_users_can_connect_via_ssh_without_password(self):
         """
         Summary:     Check if all users can connect via ssh without password
@@ -66,7 +63,6 @@ class ImageFeatures(OESelftestTestCase):
                     self.assertEqual(status, 0, 'ssh to user tester failed with %s' % output)
 
 
-    @OETestID(1116)
     def test_clutter_image_can_be_built(self):
         """
         Summary:     Check if clutter image can be built
@@ -79,7 +75,6 @@ class ImageFeatures(OESelftestTestCase):
         # Build a core-image-clutter
         bitbake('core-image-clutter')
 
-    @OETestID(1117)
     def test_wayland_support_in_image(self):
         """
         Summary:     Check Wayland support in image
@@ -97,7 +92,6 @@ class ImageFeatures(OESelftestTestCase):
         # Build a core-image-weston
         bitbake('core-image-weston')
 
-    @OETestID(1497)
     def test_bmap(self):
         """
         Summary:     Check bmap support
@@ -131,7 +125,6 @@ class ImageFeatures(OESelftestTestCase):
         # check if the resulting gzip is valid
         self.assertTrue(runCmd('gzip -t %s' % gzip_path))
 
-    @OETestID(1903)
     def test_hypervisor_fmts(self):
         """
         Summary:     Check various hypervisor formats
@@ -166,7 +159,6 @@ class ImageFeatures(OESelftestTestCase):
                             native_sysroot=sysroot)
             self.assertTrue(json.loads(result.output).get('format') == itype)
 
-    @OETestID(1905)
     def test_long_chain_conversion(self):
         """
         Summary:     Check for chaining many CONVERSION_CMDs together
@@ -198,7 +190,6 @@ class ImageFeatures(OESelftestTestCase):
         self.assertTrue(runCmd('cd %s;sha256sum -c %s.%s.sha256sum' %
                                (deploy_dir_image, link_name, conv)))
 
-    @OETestID(1904)
     def test_image_fstypes(self):
         """
         Summary:     Check if image of supported image fstypes can be built
diff --git a/meta/lib/oeqa/selftest/cases/layerappend.py b/meta/lib/oeqa/selftest/cases/layerappend.py
index 2fd5cdb0c65..18ccda2df84 100644
--- a/meta/lib/oeqa/selftest/cases/layerappend.py
+++ b/meta/lib/oeqa/selftest/cases/layerappend.py
@@ -3,7 +3,6 @@ import os
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var
 import oeqa.utils.ftools as ftools
-from oeqa.core.decorator.oeid import OETestID
 
 class LayerAppendTests(OESelftestTestCase):
     layerconf = """
@@ -49,7 +48,6 @@ SRC_URI_append = " file://appendtest.txt"
             ftools.remove_from_file(self.builddir + "/conf/bblayers.conf", self.layerappend)
         super(LayerAppendTests, self).tearDownLocal()
 
-    @OETestID(1196)
     def test_layer_appends(self):
         corebase = get_bb_var("COREBASE")
 
diff --git a/meta/lib/oeqa/selftest/cases/liboe.py b/meta/lib/oeqa/selftest/cases/liboe.py
index e84609246a7..01b2cab7aa7 100644
--- a/meta/lib/oeqa/selftest/cases/liboe.py
+++ b/meta/lib/oeqa/selftest/cases/liboe.py
@@ -1,5 +1,4 @@
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.core.decorator.oeid import OETestID
 from oeqa.utils.commands import get_bb_var, get_bb_vars, bitbake, runCmd
 import oe.path
 import os
@@ -11,7 +10,6 @@ class LibOE(OESelftestTestCase):
         super(LibOE, cls).setUpClass()
         cls.tmp_dir = get_bb_var('TMPDIR')
 
-    @OETestID(1635)
     def test_copy_tree_special(self):
         """
         Summary:    oe.path.copytree() should copy files with special character
@@ -37,7 +35,6 @@ class LibOE(OESelftestTestCase):
 
         oe.path.remove(testloc)
 
-    @OETestID(1636)
     def test_copy_tree_xattr(self):
         """
         Summary:    oe.path.copytree() should preserve xattr on copied files
@@ -72,7 +69,6 @@ class LibOE(OESelftestTestCase):
 
         oe.path.remove(testloc)
 
-    @OETestID(1634)
     def test_copy_hardlink_tree_count(self):
         """
         Summary:    oe.path.copyhardlinktree() shouldn't miss out files
diff --git a/meta/lib/oeqa/selftest/cases/lic_checksum.py b/meta/lib/oeqa/selftest/cases/lic_checksum.py
index f992b3736e4..70b4fe27006 100644
--- a/meta/lib/oeqa/selftest/cases/lic_checksum.py
+++ b/meta/lib/oeqa/selftest/cases/lic_checksum.py
@@ -4,13 +4,11 @@ import tempfile
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake
 from oeqa.utils import CommandError
-from oeqa.core.decorator.oeid import OETestID
 
 class LicenseTests(OESelftestTestCase):
 
     # Verify that changing a license file that has an absolute path causes
     # the license qa to fail due to a mismatched md5sum.
-    @OETestID(1197)
     def test_nonmatching_checksum(self):
         bitbake_cmd = '-c populate_lic emptytest'
         error_msg = 'emptytest: The new md5 checksum is 8d777f385d3dfec8815d20f7496026dc'
diff --git a/meta/lib/oeqa/selftest/cases/manifest.py b/meta/lib/oeqa/selftest/cases/manifest.py
index 146071934dd..799e1fb47db 100644
--- a/meta/lib/oeqa/selftest/cases/manifest.py
+++ b/meta/lib/oeqa/selftest/cases/manifest.py
@@ -2,7 +2,6 @@ import os
 
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import get_bb_var, get_bb_vars, bitbake
-from oeqa.core.decorator.oeid import OETestID
 
 class ManifestEntry:
     '''A manifest item of a collection able to list missing packages'''
@@ -59,7 +58,6 @@ class VerifyManifest(OESelftestTestCase):
             self.skipTest("{}: Cannot setup testing scenario"\
                     .format(self.classname))
 
-    @OETestID(1380)
     def test_SDK_manifest_entries(self):
         '''Verifying the SDK manifest entries exist, this may take a build'''
 
@@ -126,7 +124,6 @@ class VerifyManifest(OESelftestTestCase):
                 self.logger.info(msg)
                 self.fail(logmsg)
 
-    @OETestID(1381)
     def test_image_manifest_entries(self):
         '''Verifying the image manifest entries exist'''
 
diff --git a/meta/lib/oeqa/selftest/cases/meta_ide.py b/meta/lib/oeqa/selftest/cases/meta_ide.py
index 5df9d3ed938..76cbac3c77c 100644
--- a/meta/lib/oeqa/selftest/cases/meta_ide.py
+++ b/meta/lib/oeqa/selftest/cases/meta_ide.py
@@ -1,7 +1,6 @@
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.sdk.utils.sdkbuildproject import SDKBuildProject
 from oeqa.utils.commands import bitbake, get_bb_vars, runCmd
-from oeqa.core.decorator.oeid import OETestID
 import tempfile
 import shutil
 
@@ -23,18 +22,15 @@ class MetaIDE(OESelftestTestCase):
         shutil.rmtree(cls.tmpdir_metaideQA, ignore_errors=True)
         super(MetaIDE, cls).tearDownClass()
 
-    @OETestID(1982)
     def test_meta_ide_had_installed_meta_ide_support(self):
         self.assertExists(self.environment_script_path)
 
-    @OETestID(1983)
     def test_meta_ide_can_compile_c_program(self):
         runCmd('cp %s/test.c %s' % (self.tc.files_dir, self.tmpdir_metaideQA))
         runCmd("cd %s; . %s; $CC test.c -lm" % (self.tmpdir_metaideQA, self.environment_script_path))
         compiled_file = '%s/a.out' % self.tmpdir_metaideQA
         self.assertExists(compiled_file)
 
-    @OETestID(1984)
     def test_meta_ide_can_build_cpio_project(self):
         dl_dir = self.td.get('DL_DIR', None)
         self.project = SDKBuildProject(self.tmpdir_metaideQA + "/cpio/", self.environment_script_path,
diff --git a/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py b/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
index 08675fd8208..f9bec53d4ae 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
@@ -2,7 +2,6 @@ import os
 from oeqa.selftest.case import OESelftestTestCase
 import tempfile
 from oeqa.utils.commands import get_bb_var
-from oeqa.core.decorator.oeid import OETestID
 
 class TestBlobParsing(OESelftestTestCase):
 
@@ -40,7 +39,6 @@ class TestBlobParsing(OESelftestTestCase):
         self.repo.git.add("--all")
         self.repo.git.commit(message=msg)
 
-    @OETestID(1859)
     def test_blob_to_dict(self):
         """
         Test convertion of git blobs to dictionary
@@ -53,7 +51,6 @@ class TestBlobParsing(OESelftestTestCase):
         self.assertEqual(valuesmap, blob_to_dict(blob),
             "commit was not translated correctly to dictionary")
 
-    @OETestID(1860)
     def test_compare_dict_blobs(self):
         """
         Test comparisson of dictionaries extracted from git blobs
@@ -74,7 +71,6 @@ class TestBlobParsing(OESelftestTestCase):
         var_changes = { x.fieldname : (x.oldvalue, x.newvalue) for x in change_records}
         self.assertEqual(changesmap, var_changes, "Changes not reported correctly")
 
-    @OETestID(1861)
     def test_compare_dict_blobs_default(self):
         """
         Test default values for comparisson of git blob dictionaries
diff --git a/meta/lib/oeqa/selftest/cases/oescripts.py b/meta/lib/oeqa/selftest/cases/oescripts.py
index bcdc2d5ac07..e0b41e64fbe 100644
--- a/meta/lib/oeqa/selftest/cases/oescripts.py
+++ b/meta/lib/oeqa/selftest/cases/oescripts.py
@@ -1,11 +1,9 @@
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.selftest.cases.buildhistory import BuildhistoryBase
 from oeqa.utils.commands import Command, runCmd, bitbake, get_bb_var, get_test_layer
-from oeqa.core.decorator.oeid import OETestID
 
 class BuildhistoryDiffTests(BuildhistoryBase):
 
-    @OETestID(295)
     def test_buildhistory_diff(self):
         target = 'xcursor-transparent-theme'
         self.run_buildhistory_operation(target, target_config="PR = \"r1\"", change_bh_location=True)
diff --git a/meta/lib/oeqa/selftest/cases/package.py b/meta/lib/oeqa/selftest/cases/package.py
index 6596dabc322..c166c876664 100644
--- a/meta/lib/oeqa/selftest/cases/package.py
+++ b/meta/lib/oeqa/selftest/cases/package.py
@@ -1,5 +1,4 @@
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.core.decorator.oeid import OETestID
 from oeqa.utils.commands import bitbake, get_bb_vars, get_bb_var, runqemu
 import stat
 import subprocess, os
@@ -36,7 +35,6 @@ class VersionOrdering(OESelftestTestCase):
         self.bindir = type(self).bindir
         self.libdir = type(self).libdir
 
-    @OETestID(1880)
     def test_dpkg(self):
         for ver1, ver2, sort in self.tests:
             op = { -1: "<<", 0: "=", 1: ">>" }[sort]
@@ -53,7 +51,6 @@ class VersionOrdering(OESelftestTestCase):
             status = subprocess.call((oe.path.join(self.bindir, "dpkg"), "--compare-versions", ver1, op, ver2))
             self.assertNotEqual(status, 0, "%s %s %s failed" % (ver1, op, ver2))
 
-    @OETestID(1881)
     def test_opkg(self):
         for ver1, ver2, sort in self.tests:
             op = { -1: "<<", 0: "=", 1: ">>" }[sort]
@@ -70,7 +67,6 @@ class VersionOrdering(OESelftestTestCase):
             status = subprocess.call((oe.path.join(self.bindir, "opkg"), "compare-versions", ver1, op, ver2))
             self.assertNotEqual(status, 0, "%s %s %s failed" % (ver1, op, ver2))
 
-    @OETestID(1882)
     def test_rpm(self):
         # Need to tell the Python bindings where to find its configuration
         env = os.environ.copy()
diff --git a/meta/lib/oeqa/selftest/cases/pkgdata.py b/meta/lib/oeqa/selftest/cases/pkgdata.py
index aa05f40d6ac..58ec6e0ebc0 100644
--- a/meta/lib/oeqa/selftest/cases/pkgdata.py
+++ b/meta/lib/oeqa/selftest/cases/pkgdata.py
@@ -4,7 +4,6 @@ import fnmatch
 
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
-from oeqa.core.decorator.oeid import OETestID
 
 class OePkgdataUtilTests(OESelftestTestCase):
 
@@ -16,7 +15,6 @@ class OePkgdataUtilTests(OESelftestTestCase):
         bitbake('target-sdk-provides-dummy -c clean')
         bitbake('busybox zlib m4')
 
-    @OETestID(1203)
     def test_lookup_pkg(self):
         # Forward tests
         result = runCmd('oe-pkgdata-util lookup-pkg "zlib busybox"')
@@ -35,7 +33,6 @@ class OePkgdataUtilTests(OESelftestTestCase):
         self.assertEqual(result.status, 1, "Status different than 1. output: %s" % result.output)
         self.assertEqual(result.output, 'ERROR: The following packages could not be found: nonexistentpkg')
 
-    @OETestID(1205)
     def test_read_value(self):
         result = runCmd('oe-pkgdata-util read-value PN libz1')
         self.assertEqual(result.output, 'zlib')
@@ -45,7 +42,6 @@ class OePkgdataUtilTests(OESelftestTestCase):
         pkgsize = int(result.output.strip())
         self.assertGreater(pkgsize, 1, "Size should be greater than 1. %s" % result.output)
 
-    @OETestID(1198)
     def test_find_path(self):
         result = runCmd('oe-pkgdata-util find-path /lib/libz.so.1')
         self.assertEqual(result.output, 'zlib: /lib/libz.so.1')
@@ -55,7 +51,6 @@ class OePkgdataUtilTests(OESelftestTestCase):
         self.assertEqual(result.status, 1, "Status different than 1. output: %s" % result.output)
         self.assertEqual(result.output, 'ERROR: Unable to find any package producing path /not/exist')
 
-    @OETestID(1204)
     def test_lookup_recipe(self):
         result = runCmd('oe-pkgdata-util lookup-recipe "libz-staticdev busybox"')
         self.assertEqual(result.output, 'zlib\nbusybox')
@@ -65,7 +60,6 @@ class OePkgdataUtilTests(OESelftestTestCase):
         self.assertEqual(result.status, 1, "Status different than 1. output: %s" % result.output)
         self.assertEqual(result.output, 'ERROR: The following packages could not be found: nonexistentpkg')
 
-    @OETestID(1202)
     def test_list_pkgs(self):
         # No arguments
         result = runCmd('oe-pkgdata-util list-pkgs')
@@ -109,7 +103,6 @@ class OePkgdataUtilTests(OESelftestTestCase):
         pkglist = sorted(result.output.split())
         self.assertEqual(pkglist, ['libz-dbg', 'libz-dev', 'libz-doc'], "Packages listed: %s" % result.output)
 
-    @OETestID(1201)
     def test_list_pkg_files(self):
         def splitoutput(output):
             files = {}
@@ -199,7 +192,6 @@ class OePkgdataUtilTests(OESelftestTestCase):
         self.assertIn(os.path.join(mandir, 'man3/zlib.3'), files['libz-doc'])
         self.assertIn(os.path.join(libdir, 'libz.a'), files['libz-staticdev'])
 
-    @OETestID(1200)
     def test_glob(self):
         tempdir = tempfile.mkdtemp(prefix='pkgdataqa')
         self.track_for_cleanup(tempdir)
@@ -219,7 +211,6 @@ class OePkgdataUtilTests(OESelftestTestCase):
         self.assertNotIn('libz-dev', resultlist)
         self.assertNotIn('libz-dbg', resultlist)
 
-    @OETestID(1206)
     def test_specify_pkgdatadir(self):
         result = runCmd('oe-pkgdata-util -p %s lookup-pkg zlib' % get_bb_var('PKGDATA_DIR'))
         self.assertEqual(result.output, 'libz1')
diff --git a/meta/lib/oeqa/selftest/cases/prservice.py b/meta/lib/oeqa/selftest/cases/prservice.py
index 796ad4f5feb..b0a68a0b1fc 100644
--- a/meta/lib/oeqa/selftest/cases/prservice.py
+++ b/meta/lib/oeqa/selftest/cases/prservice.py
@@ -6,7 +6,6 @@ import datetime
 import oeqa.utils.ftools as ftools
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var
-from oeqa.core.decorator.oeid import OETestID
 from oeqa.utils.network import get_free_port
 
 class BitbakePrTests(OESelftestTestCase):
@@ -88,39 +87,30 @@ class BitbakePrTests(OESelftestTestCase):
 
         self.assertTrue(pr_2 - pr_1 == 1, "Step between same pkg. revision is greater than 1")
 
-    @OETestID(930)
     def test_import_export_replace_db(self):
         self.run_test_pr_export_import('m4')
 
-    @OETestID(931)
     def test_import_export_override_db(self):
         self.run_test_pr_export_import('m4', replace_current_db=False)
 
-    @OETestID(932)
     def test_pr_service_rpm_arch_dep(self):
         self.run_test_pr_service('m4', 'rpm', 'do_package')
 
-    @OETestID(934)
     def test_pr_service_deb_arch_dep(self):
         self.run_test_pr_service('m4', 'deb', 'do_package')
 
-    @OETestID(933)
     def test_pr_service_ipk_arch_dep(self):
         self.run_test_pr_service('m4', 'ipk', 'do_package')
 
-    @OETestID(935)
     def test_pr_service_rpm_arch_indep(self):
         self.run_test_pr_service('xcursor-transparent-theme', 'rpm', 'do_package')
 
-    @OETestID(937)
     def test_pr_service_deb_arch_indep(self):
         self.run_test_pr_service('xcursor-transparent-theme', 'deb', 'do_package')
 
-    @OETestID(936)
     def test_pr_service_ipk_arch_indep(self):
         self.run_test_pr_service('xcursor-transparent-theme', 'ipk', 'do_package')
 
-    @OETestID(1419)
     def test_stopping_prservice_message(self):
         port = get_free_port()
 
diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 06f980e1b0e..439d87f834c 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -5,7 +5,6 @@ import urllib.parse
 
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var
 from oeqa.utils.commands import get_bb_vars, create_temp_layer
-from oeqa.core.decorator.oeid import OETestID
 from oeqa.selftest.cases import devtool
 
 templayerdir = None
@@ -89,7 +88,6 @@ class RecipetoolTests(RecipetoolBase):
         for errorstr in checkerror:
             self.assertIn(errorstr, result.output)
 
-    @OETestID(1177)
     def test_recipetool_appendfile_basic(self):
         # Basic test
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
@@ -97,14 +95,12 @@ class RecipetoolTests(RecipetoolBase):
         _, output = self._try_recipetool_appendfile('base-files', '/etc/motd', self.testfile, '', expectedlines, ['motd'])
         self.assertNotIn('WARNING: ', output)
 
-    @OETestID(1183)
     def test_recipetool_appendfile_invalid(self):
         # Test some commands that should error
         self._try_recipetool_appendfile_fail('/etc/passwd', self.testfile, ['ERROR: /etc/passwd cannot be handled by this tool', 'useradd', 'extrausers'])
         self._try_recipetool_appendfile_fail('/etc/timestamp', self.testfile, ['ERROR: /etc/timestamp cannot be handled by this tool'])
         self._try_recipetool_appendfile_fail('/dev/console', self.testfile, ['ERROR: /dev/console cannot be handled by this tool'])
 
-    @OETestID(1176)
     def test_recipetool_appendfile_alternatives(self):
         # Now try with a file we know should be an alternative
         # (this is very much a fake example, but one we know is reliably an alternative)
@@ -128,7 +124,6 @@ class RecipetoolTests(RecipetoolBase):
         result = runCmd('diff -q %s %s' % (testfile2, copiedfile), ignore_status=True)
         self.assertNotEqual(result.status, 0, 'New file should have been copied but was not %s' % result.output)
 
-    @OETestID(1178)
     def test_recipetool_appendfile_binary(self):
         # Try appending a binary file
         # /bin/ls can be a symlink to /usr/bin/ls
@@ -137,7 +132,6 @@ class RecipetoolTests(RecipetoolBase):
         self.assertIn('WARNING: ', result.output)
         self.assertIn('is a binary', result.output)
 
-    @OETestID(1173)
     def test_recipetool_appendfile_add(self):
         # Try arbitrary file add to a recipe
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
@@ -166,7 +160,6 @@ class RecipetoolTests(RecipetoolBase):
                          '}\n']
         self._try_recipetool_appendfile('netbase', '/usr/share/scriptname', testfile2, '-r netbase', expectedlines, ['testfile', testfile2name])
 
-    @OETestID(1174)
     def test_recipetool_appendfile_add_bindir(self):
         # Try arbitrary file add to a recipe, this time to a location such that should be installed as executable
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
@@ -180,7 +173,6 @@ class RecipetoolTests(RecipetoolBase):
         _, output = self._try_recipetool_appendfile('netbase', '/usr/bin/selftest-recipetool-testbin', self.testfile, '-r netbase', expectedlines, ['testfile'])
         self.assertNotIn('WARNING: ', output)
 
-    @OETestID(1175)
     def test_recipetool_appendfile_add_machine(self):
         # Try arbitrary file add to a recipe, this time to a location such that should be installed as executable
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
@@ -196,7 +188,6 @@ class RecipetoolTests(RecipetoolBase):
         _, output = self._try_recipetool_appendfile('netbase', '/usr/share/something', self.testfile, '-r netbase -m mymachine', expectedlines, ['mymachine/testfile'])
         self.assertNotIn('WARNING: ', output)
 
-    @OETestID(1184)
     def test_recipetool_appendfile_orig(self):
         # A file that's in SRC_URI and in do_install with the same name
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
@@ -204,7 +195,6 @@ class RecipetoolTests(RecipetoolBase):
         _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/usr/share/selftest-replaceme-orig', self.testfile, '', expectedlines, ['selftest-replaceme-orig'])
         self.assertNotIn('WARNING: ', output)
 
-    @OETestID(1191)
     def test_recipetool_appendfile_todir(self):
         # A file that's in SRC_URI and in do_install with destination directory rather than file
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
@@ -212,7 +202,6 @@ class RecipetoolTests(RecipetoolBase):
         _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/usr/share/selftest-replaceme-todir', self.testfile, '', expectedlines, ['selftest-replaceme-todir'])
         self.assertNotIn('WARNING: ', output)
 
-    @OETestID(1187)
     def test_recipetool_appendfile_renamed(self):
         # A file that's in SRC_URI with a different name to the destination file
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
@@ -220,7 +209,6 @@ class RecipetoolTests(RecipetoolBase):
         _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/usr/share/selftest-replaceme-renamed', self.testfile, '', expectedlines, ['file1'])
         self.assertNotIn('WARNING: ', output)
 
-    @OETestID(1190)
     def test_recipetool_appendfile_subdir(self):
         # A file that's in SRC_URI in a subdir
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
@@ -234,7 +222,6 @@ class RecipetoolTests(RecipetoolBase):
         _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/usr/share/selftest-replaceme-subdir', self.testfile, '', expectedlines, ['testfile'])
         self.assertNotIn('WARNING: ', output)
 
-    @OETestID(1189)
     def test_recipetool_appendfile_src_glob(self):
         # A file that's in SRC_URI as a glob
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
@@ -248,7 +235,6 @@ class RecipetoolTests(RecipetoolBase):
         _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/usr/share/selftest-replaceme-src-globfile', self.testfile, '', expectedlines, ['testfile'])
         self.assertNotIn('WARNING: ', output)
 
-    @OETestID(1181)
     def test_recipetool_appendfile_inst_glob(self):
         # A file that's in do_install as a glob
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
@@ -256,7 +242,6 @@ class RecipetoolTests(RecipetoolBase):
         _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/usr/share/selftest-replaceme-inst-globfile', self.testfile, '', expectedlines, ['selftest-replaceme-inst-globfile'])
         self.assertNotIn('WARNING: ', output)
 
-    @OETestID(1182)
     def test_recipetool_appendfile_inst_todir_glob(self):
         # A file that's in do_install as a glob with destination as a directory
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
@@ -264,7 +249,6 @@ class RecipetoolTests(RecipetoolBase):
         _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/usr/share/selftest-replaceme-inst-todir-globfile', self.testfile, '', expectedlines, ['selftest-replaceme-inst-todir-globfile'])
         self.assertNotIn('WARNING: ', output)
 
-    @OETestID(1185)
     def test_recipetool_appendfile_patch(self):
         # A file that's added by a patch in SRC_URI
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
@@ -283,7 +267,6 @@ class RecipetoolTests(RecipetoolBase):
         else:
             self.fail('Patch warning not found in output:\n%s' % output)
 
-    @OETestID(1188)
     def test_recipetool_appendfile_script(self):
         # Now, a file that's in SRC_URI but installed by a script (so no mention in do_install)
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
@@ -297,7 +280,6 @@ class RecipetoolTests(RecipetoolBase):
         _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/usr/share/selftest-replaceme-scripted', self.testfile, '', expectedlines, ['testfile'])
         self.assertNotIn('WARNING: ', output)
 
-    @OETestID(1180)
     def test_recipetool_appendfile_inst_func(self):
         # A file that's installed from a function called by do_install
         expectedlines = ['FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n',
@@ -305,7 +287,6 @@ class RecipetoolTests(RecipetoolBase):
         _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/usr/share/selftest-replaceme-inst-func', self.testfile, '', expectedlines, ['selftest-replaceme-inst-func'])
         self.assertNotIn('WARNING: ', output)
 
-    @OETestID(1186)
     def test_recipetool_appendfile_postinstall(self):
         # A file that's created by a postinstall script (and explicitly mentioned in it)
         # First try without specifying recipe
@@ -321,7 +302,6 @@ class RecipetoolTests(RecipetoolBase):
                          '}\n']
         _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/usr/share/selftest-replaceme-postinst', self.testfile, '-r selftest-recipetool-appendfile', expectedlines, ['testfile'])
 
-    @OETestID(1179)
     def test_recipetool_appendfile_extlayer(self):
         # Try creating a bbappend in a layer that's not in bblayers.conf and has a different structure
         exttemplayerdir = os.path.join(self.tempdir, 'extlayer')
@@ -337,7 +317,6 @@ class RecipetoolTests(RecipetoolBase):
                          'metadata/recipes/recipes-test/selftest-recipetool-appendfile/selftest-recipetool-appendfile/selftest-replaceme-orig']
         self.assertEqual(sorted(createdfiles), sorted(expectedfiles))
 
-    @OETestID(1192)
     def test_recipetool_appendfile_wildcard(self):
 
         def try_appendfile_wc(options):
@@ -362,7 +341,6 @@ class RecipetoolTests(RecipetoolBase):
         filename = try_appendfile_wc('-w')
         self.assertEqual(filename, recipefn.split('_')[0] + '_%.bbappend')
 
-    @OETestID(1193)
     def test_recipetool_create(self):
         # Try adding a recipe
         tempsrc = os.path.join(self.tempdir, 'srctree')
@@ -379,7 +357,6 @@ class RecipetoolTests(RecipetoolBase):
         checkvars['SRC_URI[sha256sum]'] = '2e6a401cac9024db2288297e3be1a8ab60e7401ba8e91225218aaf4a27e82a07'
         self._test_recipe_contents(recipefile, checkvars, [])
 
-    @OETestID(1194)
     def test_recipetool_create_git(self):
         if 'x11' not in get_bb_var('DISTRO_FEATURES'):
             self.skipTest('Test requires x11 as distro feature')
@@ -402,7 +379,6 @@ class RecipetoolTests(RecipetoolBase):
         inherits = ['autotools', 'pkgconfig']
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
-    @OETestID(1392)
     def test_recipetool_create_simple(self):
         # Try adding a recipe
         temprecipe = os.path.join(self.tempdir, 'recipe')
@@ -425,7 +401,6 @@ class RecipetoolTests(RecipetoolBase):
         inherits = ['autotools']
         self._test_recipe_contents(os.path.join(temprecipe, dirlist[0]), checkvars, inherits)
 
-    @OETestID(1418)
     def test_recipetool_create_cmake(self):
         bitbake('-c packagedata gtk+')
 
@@ -445,7 +420,6 @@ class RecipetoolTests(RecipetoolBase):
         inherits = ['cmake', 'python-dir', 'gettext', 'pkgconfig']
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
-    @OETestID(1638)
     def test_recipetool_create_github(self):
         # Basic test to see if github URL mangling works
         temprecipe = os.path.join(self.tempdir, 'recipe')
@@ -460,7 +434,6 @@ class RecipetoolTests(RecipetoolBase):
         inherits = ['setuptools']
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
-    @OETestID(1639)
     def test_recipetool_create_github_tarball(self):
         # Basic test to ensure github URL mangling doesn't apply to release tarballs
         temprecipe = os.path.join(self.tempdir, 'recipe')
@@ -476,7 +449,6 @@ class RecipetoolTests(RecipetoolBase):
         inherits = ['setuptools']
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
-    @OETestID(1637)
     def test_recipetool_create_git_http(self):
         # Basic test to check http git URL mangling works
         temprecipe = os.path.join(self.tempdir, 'recipe')
@@ -504,7 +476,6 @@ class RecipetoolTests(RecipetoolBase):
             shutil.copy(srcfile, dstfile)
             self.track_for_cleanup(dstfile)
 
-    @OETestID(1640)
     def test_recipetool_load_plugin(self):
         """Test that recipetool loads only the first found plugin in BBPATH."""
 
@@ -626,11 +597,9 @@ class RecipetoolAppendsrcBase(RecipetoolBase):
 
 class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
 
-    @OETestID(1273)
     def test_recipetool_appendsrcfile_basic(self):
         self._test_appendsrcfile('base-files', 'a-file')
 
-    @OETestID(1274)
     def test_recipetool_appendsrcfile_basic_wildcard(self):
         testrecipe = 'base-files'
         self._test_appendsrcfile(testrecipe, 'a-file', options='-w')
@@ -638,15 +607,12 @@ class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
         bbappendfile = self._check_bbappend(testrecipe, recipefile, self.templayerdir)
         self.assertEqual(os.path.basename(bbappendfile), '%s_%%.bbappend' % testrecipe)
 
-    @OETestID(1281)
     def test_recipetool_appendsrcfile_subdir_basic(self):
         self._test_appendsrcfile('base-files', 'a-file', 'tmp')
 
-    @OETestID(1282)
     def test_recipetool_appendsrcfile_subdir_basic_dirdest(self):
         self._test_appendsrcfile('base-files', destdir='tmp')
 
-    @OETestID(1280)
     def test_recipetool_appendsrcfile_srcdir_basic(self):
         testrecipe = 'bash'
         bb_vars = get_bb_vars(['S', 'WORKDIR'], testrecipe)
@@ -655,14 +621,12 @@ class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
         subdir = os.path.relpath(srcdir, workdir)
         self._test_appendsrcfile(testrecipe, 'a-file', srcdir=subdir)
 
-    @OETestID(1275)
     def test_recipetool_appendsrcfile_existing_in_src_uri(self):
         testrecipe = 'base-files'
         filepath = self._get_first_file_uri(testrecipe)
         self.assertTrue(filepath, 'Unable to test, no file:// uri found in SRC_URI for %s' % testrecipe)
         self._test_appendsrcfile(testrecipe, filepath, has_src_uri=False)
 
-    @OETestID(1276)
     def test_recipetool_appendsrcfile_existing_in_src_uri_diff_params(self):
         testrecipe = 'base-files'
         subdir = 'tmp'
@@ -672,7 +636,6 @@ class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
         output = self._test_appendsrcfile(testrecipe, filepath, subdir, has_src_uri=False)
         self.assertTrue(any('with different parameters' in l for l in output))
 
-    @OETestID(1277)
     def test_recipetool_appendsrcfile_replace_file_srcdir(self):
         testrecipe = 'bash'
         filepath = 'Makefile.in'
@@ -685,7 +648,6 @@ class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
         bitbake('%s:do_unpack' % testrecipe)
         self.assertEqual(open(self.testfile, 'r').read(), open(os.path.join(srcdir, filepath), 'r').read())
 
-    @OETestID(1278)
     def test_recipetool_appendsrcfiles_basic(self, destdir=None):
         newfiles = [self.testfile]
         for i in range(1, 5):
@@ -695,6 +657,5 @@ class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
             newfiles.append(testfile)
         self._test_appendsrcfiles('gcc', newfiles, destdir=destdir, options='-W')
 
-    @OETestID(1279)
     def test_recipetool_appendsrcfiles_basic_subdir(self):
         self.test_recipetool_appendsrcfiles_basic(destdir='testdir')
diff --git a/meta/lib/oeqa/selftest/cases/recipeutils.py b/meta/lib/oeqa/selftest/cases/recipeutils.py
index dd2f55839ae..408eb356bf4 100644
--- a/meta/lib/oeqa/selftest/cases/recipeutils.py
+++ b/meta/lib/oeqa/selftest/cases/recipeutils.py
@@ -6,7 +6,6 @@ import bb.tinfoil
 
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, get_test_layer
-from oeqa.core.decorator.oeid import OETestID
 
 
 def setUpModule():
diff --git a/meta/lib/oeqa/selftest/cases/runcmd.py b/meta/lib/oeqa/selftest/cases/runcmd.py
index a1615cfd20b..ed4ba8a4652 100644
--- a/meta/lib/oeqa/selftest/cases/runcmd.py
+++ b/meta/lib/oeqa/selftest/cases/runcmd.py
@@ -1,7 +1,6 @@
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd
 from oeqa.utils import CommandError
-from oeqa.core.decorator.oeid import OETestID
 
 import subprocess
 import threading
@@ -27,60 +26,49 @@ class RunCmdTests(OESelftestTestCase):
     TIMEOUT = 5
     DELTA = 3
 
-    @OETestID(1916)
     def test_result_okay(self):
         result = runCmd("true")
         self.assertEqual(result.status, 0)
 
-    @OETestID(1915)
     def test_result_false(self):
         result = runCmd("false", ignore_status=True)
         self.assertEqual(result.status, 1)
 
-    @OETestID(1917)
     def test_shell(self):
         # A shell is used for all string commands.
         result = runCmd("false; true", ignore_status=True)
         self.assertEqual(result.status, 0)
 
-    @OETestID(1910)
     def test_no_shell(self):
         self.assertRaises(FileNotFoundError,
                           runCmd, "false; true", shell=False)
 
-    @OETestID(1906)
     def test_list_not_found(self):
         self.assertRaises(FileNotFoundError,
                           runCmd, ["false; true"])
 
-    @OETestID(1907)
     def test_list_okay(self):
         result = runCmd(["true"])
         self.assertEqual(result.status, 0)
 
-    @OETestID(1913)
     def test_result_assertion(self):
         self.assertRaisesRegexp(AssertionError, "Command 'echo .* false' returned non-zero exit status 1:\nfoobar",
                                 runCmd, "echo foobar >&2; false", shell=True)
 
-    @OETestID(1914)
     def test_result_exception(self):
         self.assertRaisesRegexp(CommandError, "Command 'echo .* false' returned non-zero exit status 1 with output: foobar",
                                 runCmd, "echo foobar >&2; false", shell=True, assert_error=False)
 
-    @OETestID(1911)
     def test_output(self):
         result = runCmd("echo stdout; echo stderr >&2", shell=True)
         self.assertEqual("stdout\nstderr", result.output)
         self.assertEqual("", result.error)
 
-    @OETestID(1912)
     def test_output_split(self):
         result = runCmd("echo stdout; echo stderr >&2", shell=True, stderr=subprocess.PIPE)
         self.assertEqual("stdout", result.output)
         self.assertEqual("stderr", result.error)
 
-    @OETestID(1920)
     def test_timeout(self):
         numthreads = threading.active_count()
         start = time.time()
@@ -91,7 +79,6 @@ class RunCmdTests(OESelftestTestCase):
         self.assertLess(end - start, self.TIMEOUT + self.DELTA)
         self.assertEqual(numthreads, threading.active_count())
 
-    @OETestID(1921)
     def test_timeout_split(self):
         numthreads = threading.active_count()
         start = time.time()
@@ -102,14 +89,12 @@ class RunCmdTests(OESelftestTestCase):
         self.assertLess(end - start, self.TIMEOUT + self.DELTA)
         self.assertEqual(numthreads, threading.active_count())
 
-    @OETestID(1918)
     def test_stdin(self):
         numthreads = threading.active_count()
         result = runCmd("cat", data=b"hello world", timeout=self.TIMEOUT)
         self.assertEqual("hello world", result.output)
         self.assertEqual(numthreads, threading.active_count())
 
-    @OETestID(1919)
     def test_stdin_timeout(self):
         numthreads = threading.active_count()
         start = time.time()
@@ -119,14 +104,12 @@ class RunCmdTests(OESelftestTestCase):
         self.assertLess(end - start, self.TIMEOUT + self.DELTA)
         self.assertEqual(numthreads, threading.active_count())
 
-    @OETestID(1908)
     def test_log(self):
         log = MemLogger()
         result = runCmd("echo stdout; echo stderr >&2", shell=True, output_log=log)
         self.assertEqual(["Running: echo stdout; echo stderr >&2", "stdout", "stderr"], log.info_msgs)
         self.assertEqual([], log.error_msgs)
 
-    @OETestID(1909)
     def test_log_split(self):
         log = MemLogger()
         result = runCmd("echo stdout; echo stderr >&2", shell=True, output_log=log, stderr=subprocess.PIPE)
diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
index f69d4706a50..3598104aeb6 100644
--- a/meta/lib/oeqa/selftest/cases/runqemu.py
+++ b/meta/lib/oeqa/selftest/cases/runqemu.py
@@ -8,7 +8,6 @@ import time
 import oe.types
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake, runqemu, get_bb_var, runCmd
-from oeqa.core.decorator.oeid import OETestID
 
 class RunqemuTests(OESelftestTestCase):
     """Runqemu test class"""
@@ -42,7 +41,6 @@ SYSLINUX_TIMEOUT = "10"
             bitbake(self.recipe)
             RunqemuTests.image_is_ready = True
 
-    @OETestID(2001)
     def test_boot_machine(self):
         """Test runqemu machine"""
         cmd = "%s %s" % (self.cmd_common, self.machine)
@@ -50,7 +48,6 @@ SYSLINUX_TIMEOUT = "10"
             with open(qemu.qemurunnerlog) as f:
                 self.assertTrue(qemu.runner.logged, "Failed: %s, %s" % (cmd, f.read()))
 
-    @OETestID(2002)
     def test_boot_machine_ext4(self):
         """Test runqemu machine ext4"""
         cmd = "%s %s ext4" % (self.cmd_common, self.machine)
@@ -58,7 +55,6 @@ SYSLINUX_TIMEOUT = "10"
             with open(qemu.qemurunnerlog) as f:
                 self.assertIn('rootfs.ext4', f.read(), "Failed: %s" % cmd)
 
-    @OETestID(2003)
     def test_boot_machine_iso(self):
         """Test runqemu machine iso"""
         cmd = "%s %s iso" % (self.cmd_common, self.machine)
@@ -66,7 +62,6 @@ SYSLINUX_TIMEOUT = "10"
             with open(qemu.qemurunnerlog) as f:
                 self.assertIn('media=cdrom', f.read(), "Failed: %s" % cmd)
 
-    @OETestID(2004)
     def test_boot_recipe_image(self):
         """Test runqemu recipe-image"""
         cmd = "%s %s" % (self.cmd_common, self.recipe)
@@ -75,7 +70,6 @@ SYSLINUX_TIMEOUT = "10"
                 self.assertTrue(qemu.runner.logged, "Failed: %s, %s" % (cmd, f.read()))
 
 
-    @OETestID(2005)
     def test_boot_recipe_image_vmdk(self):
         """Test runqemu recipe-image vmdk"""
         cmd = "%s %s wic.vmdk" % (self.cmd_common, self.recipe)
@@ -83,7 +77,6 @@ SYSLINUX_TIMEOUT = "10"
             with open(qemu.qemurunnerlog) as f:
                 self.assertIn('format=vmdk', f.read(), "Failed: %s" % cmd)
 
-    @OETestID(2006)
     def test_boot_recipe_image_vdi(self):
         """Test runqemu recipe-image vdi"""
         cmd = "%s %s wic.vdi" % (self.cmd_common, self.recipe)
@@ -91,7 +84,6 @@ SYSLINUX_TIMEOUT = "10"
             with open(qemu.qemurunnerlog) as f:
                 self.assertIn('format=vdi', f.read(), "Failed: %s" % cmd)
 
-    @OETestID(2007)
     def test_boot_deploy(self):
         """Test runqemu deploy_dir_image"""
         cmd = "%s %s" % (self.cmd_common, self.deploy_dir_image)
@@ -100,7 +92,6 @@ SYSLINUX_TIMEOUT = "10"
                 self.assertTrue(qemu.runner.logged, "Failed: %s, %s" % (cmd, f.read()))
 
 
-    @OETestID(2008)
     def test_boot_deploy_hddimg(self):
         """Test runqemu deploy_dir_image hddimg"""
         cmd = "%s %s hddimg" % (self.cmd_common, self.deploy_dir_image)
@@ -108,7 +99,6 @@ SYSLINUX_TIMEOUT = "10"
             with open(qemu.qemurunnerlog) as f:
                 self.assertTrue(re.search('file=.*.hddimg', f.read()), "Failed: %s, %s" % (cmd, f.read()))
 
-    @OETestID(2009)
     def test_boot_machine_slirp(self):
         """Test runqemu machine slirp"""
         cmd = "%s slirp %s" % (self.cmd_common, self.machine)
@@ -116,7 +106,6 @@ SYSLINUX_TIMEOUT = "10"
             with open(qemu.qemurunnerlog) as f:
                 self.assertIn(' -netdev user', f.read(), "Failed: %s" % cmd)
 
-    @OETestID(2009)
     def test_boot_machine_slirp_qcow2(self):
         """Test runqemu machine slirp qcow2"""
         cmd = "%s slirp wic.qcow2 %s" % (self.cmd_common, self.machine)
@@ -124,7 +113,6 @@ SYSLINUX_TIMEOUT = "10"
             with open(qemu.qemurunnerlog) as f:
                 self.assertIn('format=qcow2', f.read(), "Failed: %s" % cmd)
 
-    @OETestID(2010)
     def test_boot_qemu_boot(self):
         """Test runqemu /path/to/image.qemuboot.conf"""
         qemuboot_conf = "%s-%s.qemuboot.conf" % (self.recipe, self.machine)
@@ -136,7 +124,6 @@ SYSLINUX_TIMEOUT = "10"
             with open(qemu.qemurunnerlog) as f:
                 self.assertTrue(qemu.runner.logged, "Failed: %s, %s" % (cmd, f.read()))
 
-    @OETestID(2011)
     def test_boot_rootfs(self):
         """Test runqemu /path/to/rootfs.ext4"""
         rootfs = "%s-%s.ext4" % (self.recipe, self.machine)
diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 6c25bb901d1..072029ba728 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -1,7 +1,6 @@
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars, runqemu
 from oeqa.utils.sshcontrol import SSHControl
-from oeqa.core.decorator.oeid import OETestID
 import os
 import re
 import tempfile
@@ -15,7 +14,6 @@ class TestExport(OESelftestTestCase):
         runCmd("rm -rf /tmp/sdk")
         super(TestExport, cls).tearDownClass()
 
-    @OETestID(1499)
     def test_testexport_basic(self):
         """
         Summary: Check basic testexport functionality with only ping test enabled.
@@ -55,7 +53,6 @@ class TestExport(OESelftestTestCase):
             # Verify ping test was succesful
             self.assertEqual(0, result.status, 'oe-test runtime returned a non 0 status')
 
-    @OETestID(1641)
     def test_testexport_sdk(self):
         """
         Summary: Check sdk functionality for testexport.
@@ -110,7 +107,6 @@ class TestExport(OESelftestTestCase):
 
 class TestImage(OESelftestTestCase):
 
-    @OETestID(1644)
     def test_testimage_install(self):
         """
         Summary: Check install packages functionality for testimage/testexport.
@@ -131,7 +127,6 @@ class TestImage(OESelftestTestCase):
         bitbake('core-image-full-cmdline socat')
         bitbake('-c testimage core-image-full-cmdline')
 
-    @OETestID(1883)
     def test_testimage_dnf(self):
         """
         Summary: Check package feeds functionality for dnf
@@ -169,7 +164,6 @@ class TestImage(OESelftestTestCase):
         # remove the oeqa-feed-sign temporal directory
         shutil.rmtree(self.gpg_home, ignore_errors=True)
 
-    @OETestID(1883)
     def test_testimage_virgl_gtk(self):
         """
         Summary: Check host-assisted accelerate OpenGL functionality in qemu with gtk frontend
@@ -200,7 +194,6 @@ class TestImage(OESelftestTestCase):
         bitbake('core-image-minimal')
         bitbake('-c testimage core-image-minimal')
 
-    @OETestID(1883)
     def test_testimage_virgl_headless(self):
         """
         Summary: Check host-assisted accelerate OpenGL functionality in qemu with egl-headless frontend
@@ -235,8 +228,6 @@ class TestImage(OESelftestTestCase):
         bitbake('-c testimage core-image-minimal')
 
 class Postinst(OESelftestTestCase):
-    @OETestID(1540)
-    @OETestID(1545)
     def test_postinst_rootfs_and_boot(self):
         """
         Summary:        The purpose of this test case is to verify Post-installation
diff --git a/meta/lib/oeqa/selftest/cases/selftest.py b/meta/lib/oeqa/selftest/cases/selftest.py
index 4b3cb144638..7d3a8ce5f62 100644
--- a/meta/lib/oeqa/selftest/cases/selftest.py
+++ b/meta/lib/oeqa/selftest/cases/selftest.py
@@ -2,11 +2,9 @@ import importlib
 from oeqa.utils.commands import runCmd
 import oeqa.selftest
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.core.decorator.oeid import OETestID
 
 class ExternalLayer(OESelftestTestCase):
 
-    @OETestID(1885)
     def test_list_imported(self):
         """
         Summary: Checks functionality to import tests from other layers.
diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
index 4fa99acbc94..cfa87333bca 100644
--- a/meta/lib/oeqa/selftest/cases/signing.py
+++ b/meta/lib/oeqa/selftest/cases/signing.py
@@ -7,7 +7,6 @@ import re
 import shutil
 import tempfile
 from contextlib import contextmanager
-from oeqa.core.decorator.oeid import OETestID
 from oeqa.utils.ftools import write_file
 
 
@@ -51,7 +50,6 @@ class Signing(OESelftestTestCase):
                 os.environ[e] = origenv[e]
             os.chdir(builddir)
 
-    @OETestID(1362)
     def test_signing_packages(self):
         """
         Summary:     Test that packages can be signed in the package feed
@@ -116,7 +114,6 @@ class Signing(OESelftestTestCase):
         bitbake('core-image-minimal')
 
 
-    @OETestID(1382)
     def test_signing_sstate_archive(self):
         """
         Summary:     Test that sstate archives can be signed
@@ -169,7 +166,6 @@ class Signing(OESelftestTestCase):
 
 class LockedSignatures(OESelftestTestCase):
 
-    @OETestID(1420)
     def test_locked_signatures(self):
         """
         Summary:     Test locked signature mechanism
diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 938e654e9a3..8cae2f74917 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -7,7 +7,6 @@ import tempfile
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_test_layer, create_temp_layer
 from oeqa.selftest.cases.sstate import SStateBase
-from oeqa.core.decorator.oeid import OETestID
 
 import bb.siggen
 
@@ -73,19 +72,15 @@ class SStateTests(SStateBase):
         else:
             self.assertTrue(not file_tracker , msg="Found sstate files in the wrong place for: %s (found %s)" % (', '.join(map(str, targets)), str(file_tracker)))
 
-    @OETestID(975)
     def test_sstate_creation_distro_specific_pass(self):
         self.run_test_sstate_creation(['binutils-cross-'+ self.tune_arch, 'binutils-native'], distro_specific=True, distro_nonspecific=False, temp_sstate_location=True)
 
-    @OETestID(1374)
     def test_sstate_creation_distro_specific_fail(self):
         self.run_test_sstate_creation(['binutils-cross-'+ self.tune_arch, 'binutils-native'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True, should_pass=False)
 
-    @OETestID(976)
     def test_sstate_creation_distro_nonspecific_pass(self):
         self.run_test_sstate_creation(['linux-libc-headers'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True)
 
-    @OETestID(1375)
     def test_sstate_creation_distro_nonspecific_fail(self):
         self.run_test_sstate_creation(['linux-libc-headers'], distro_specific=True, distro_nonspecific=False, temp_sstate_location=True, should_pass=False)
 
@@ -106,17 +101,14 @@ class SStateTests(SStateBase):
         tgz_removed = self.search_sstate('|'.join(map(str, [s + r'.*?\.tgz$' for s in targets])), distro_specific, distro_nonspecific)
         self.assertTrue(not tgz_removed, msg="do_cleansstate didn't remove .tgz sstate files for: %s (%s)" % (', '.join(map(str, targets)), str(tgz_removed)))
 
-    @OETestID(977)
     def test_cleansstate_task_distro_specific_nonspecific(self):
         targets = ['binutils-cross-'+ self.tune_arch, 'binutils-native']
         targets.append('linux-libc-headers')
         self.run_test_cleansstate_task(targets, distro_specific=True, distro_nonspecific=True, temp_sstate_location=True)
 
-    @OETestID(1376)
     def test_cleansstate_task_distro_nonspecific(self):
         self.run_test_cleansstate_task(['linux-libc-headers'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True)
 
-    @OETestID(1377)
     def test_cleansstate_task_distro_specific(self):
         targets = ['binutils-cross-'+ self.tune_arch, 'binutils-native']
         targets.append('linux-libc-headers')
@@ -155,15 +147,12 @@ class SStateTests(SStateBase):
         created_once = [x for x in file_tracker_2 if x not in file_tracker_1]
         self.assertTrue(created_once == [], msg="The following sstate files ware created only in the second run: %s" % ', '.join(map(str, created_once)))
 
-    @OETestID(175)
     def test_rebuild_distro_specific_sstate_cross_native_targets(self):
         self.run_test_rebuild_distro_specific_sstate(['binutils-cross-' + self.tune_arch, 'binutils-native'], temp_sstate_location=True)
 
-    @OETestID(1372)
     def test_rebuild_distro_specific_sstate_cross_target(self):
         self.run_test_rebuild_distro_specific_sstate(['binutils-cross-' + self.tune_arch], temp_sstate_location=True)
 
-    @OETestID(1373)
     def test_rebuild_distro_specific_sstate_native_target(self):
         self.run_test_rebuild_distro_specific_sstate(['binutils-native'], temp_sstate_location=True)
 
@@ -210,7 +199,6 @@ class SStateTests(SStateBase):
         expected_not_actual = [x for x in expected_remaining_sstate if x not in actual_remaining_sstate]
         self.assertFalse(expected_not_actual, msg="Extra files ware removed: %s" ', '.join(map(str, expected_not_actual)))
 
-    @OETestID(973)
     def test_sstate_cache_management_script_using_pr_1(self):
         global_config = []
         target_config = []
@@ -218,7 +206,6 @@ class SStateTests(SStateBase):
         target_config.append('PR = "0"')
         self.run_test_sstate_cache_management_script('m4', global_config,  target_config, ignore_patterns=['populate_lic'])
 
-    @OETestID(978)
     def test_sstate_cache_management_script_using_pr_2(self):
         global_config = []
         target_config = []
@@ -228,7 +215,6 @@ class SStateTests(SStateBase):
         target_config.append('PR = "1"')
         self.run_test_sstate_cache_management_script('m4', global_config,  target_config, ignore_patterns=['populate_lic'])
 
-    @OETestID(979)
     def test_sstate_cache_management_script_using_pr_3(self):
         global_config = []
         target_config = []
@@ -240,7 +226,6 @@ class SStateTests(SStateBase):
         target_config.append('PR = "1"')
         self.run_test_sstate_cache_management_script('m4', global_config,  target_config, ignore_patterns=['populate_lic'])
 
-    @OETestID(974)
     def test_sstate_cache_management_script_using_machine(self):
         global_config = []
         target_config = []
@@ -250,7 +235,6 @@ class SStateTests(SStateBase):
         target_config.append('')
         self.run_test_sstate_cache_management_script('m4', global_config,  target_config, ignore_patterns=['populate_lic'])
 
-    @OETestID(1270)
     def test_sstate_32_64_same_hash(self):
         """
         The sstate checksums for both native and target should not vary whether
@@ -299,7 +283,6 @@ PACKAGE_CLASSES = "package_rpm package_ipk package_deb"
         self.assertCountEqual(files1, files2)
 
 
-    @OETestID(1271)
     def test_sstate_nativelsbstring_same_hash(self):
         """
         The sstate checksums should be independent of whichever NATIVELSBSTRING is
@@ -333,7 +316,6 @@ NATIVELSBSTRING = \"DistroB\"
         self.maxDiff = None
         self.assertCountEqual(files1, files2)
 
-    @OETestID(1368)
     def test_sstate_allarch_samesigs(self):
         """
         The sstate checksums of allarch packages should be independent of whichever
@@ -354,7 +336,6 @@ MACHINE = \"qemuarm\"
 """
         self.sstate_allarch_samesigs(configA, configB)
 
-    @OETestID(1645)
     def test_sstate_nativesdk_samesigs_multilib(self):
         """
         check nativesdk stamps are the same between the two MACHINE values.
@@ -405,7 +386,6 @@ MULTILIBS = \"\"
         self.maxDiff = None
         self.assertEqual(files1, files2)
 
-    @OETestID(1369)
     def test_sstate_sametune_samesigs(self):
         """
         The sstate checksums of two identical machines (using the same tune) should be the
@@ -452,7 +432,6 @@ DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
         self.assertCountEqual(files1, files2)
 
 
-    @OETestID(1498)
     def test_sstate_noop_samesigs(self):
         """
         The sstate checksums of two builds with these variables changed or
diff --git a/meta/lib/oeqa/selftest/cases/tinfoil.py b/meta/lib/oeqa/selftest/cases/tinfoil.py
index f889a47b26d..6c246d53069 100644
--- a/meta/lib/oeqa/selftest/cases/tinfoil.py
+++ b/meta/lib/oeqa/selftest/cases/tinfoil.py
@@ -6,12 +6,10 @@ import bb.tinfoil
 
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd
-from oeqa.core.decorator.oeid import OETestID
 
 class TinfoilTests(OESelftestTestCase):
     """ Basic tests for the tinfoil API """
 
-    @OETestID(1568)
     def test_getvar(self):
         with bb.tinfoil.Tinfoil() as tinfoil:
             tinfoil.prepare(True)
@@ -19,7 +17,6 @@ class TinfoilTests(OESelftestTestCase):
             if not machine:
                 self.fail('Unable to get MACHINE value - returned %s' % machine)
 
-    @OETestID(1569)
     def test_expand(self):
         with bb.tinfoil.Tinfoil() as tinfoil:
             tinfoil.prepare(True)
@@ -28,7 +25,6 @@ class TinfoilTests(OESelftestTestCase):
             if not pid:
                 self.fail('Unable to expand "%s" - returned %s' % (expr, pid))
 
-    @OETestID(1570)
     def test_getvar_bb_origenv(self):
         with bb.tinfoil.Tinfoil() as tinfoil:
             tinfoil.prepare(True)
@@ -37,7 +33,6 @@ class TinfoilTests(OESelftestTestCase):
                 self.fail('Unable to get BB_ORIGENV value - returned %s' % origenv)
             self.assertEqual(origenv.getVar('HOME', False), os.environ['HOME'])
 
-    @OETestID(1571)
     def test_parse_recipe(self):
         with bb.tinfoil.Tinfoil() as tinfoil:
             tinfoil.prepare(config_only=False, quiet=2)
@@ -48,7 +43,6 @@ class TinfoilTests(OESelftestTestCase):
             rd = tinfoil.parse_recipe_file(best[3])
             self.assertEqual(testrecipe, rd.getVar('PN'))
 
-    @OETestID(1572)
     def test_parse_recipe_copy_expand(self):
         with bb.tinfoil.Tinfoil() as tinfoil:
             tinfoil.prepare(config_only=False, quiet=2)
@@ -67,7 +61,6 @@ class TinfoilTests(OESelftestTestCase):
             localdata.setVar('PN', 'hello')
             self.assertEqual('hello', localdata.getVar('BPN'))
 
-    @OETestID(1573)
     def test_parse_recipe_initial_datastore(self):
         with bb.tinfoil.Tinfoil() as tinfoil:
             tinfoil.prepare(config_only=False, quiet=2)
@@ -81,7 +74,6 @@ class TinfoilTests(OESelftestTestCase):
             # Check we can get variable values
             self.assertEqual('somevalue', rd.getVar('MYVARIABLE'))
 
-    @OETestID(1574)
     def test_list_recipes(self):
         with bb.tinfoil.Tinfoil() as tinfoil:
             tinfoil.prepare(config_only=False, quiet=2)
@@ -100,7 +92,6 @@ class TinfoilTests(OESelftestTestCase):
             if checkpns:
                 self.fail('Unable to find pkg_fn entries for: %s' % ', '.join(checkpns))
 
-    @OETestID(1575)
     def test_wait_event(self):
         with bb.tinfoil.Tinfoil() as tinfoil:
             tinfoil.prepare(config_only=True)
@@ -136,7 +127,6 @@ class TinfoilTests(OESelftestTestCase):
             self.assertTrue(commandcomplete, 'Timed out waiting for CommandCompleted event from bitbake server')
             self.assertTrue(eventreceived, 'Did not receive FilesMatchingFound event from bitbake server')
 
-    @OETestID(1576)
     def test_setvariable_clean(self):
         # First check that setVariable affects the datastore
         with bb.tinfoil.Tinfoil() as tinfoil:
@@ -159,7 +149,6 @@ class TinfoilTests(OESelftestTestCase):
             value = tinfoil.run_command('getVariable', 'TESTVAR')
             self.assertEqual(value, 'specialvalue', 'Value set using config_data.setVar() is not reflected in config_data.getVar()')
 
-    @OETestID(1884)
     def test_datastore_operations(self):
         with bb.tinfoil.Tinfoil() as tinfoil:
             tinfoil.prepare(config_only=True)
diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 79925f942f8..f22781d15c0 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -34,7 +34,6 @@ from tempfile import NamedTemporaryFile
 
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars, runqemu
-from oeqa.core.decorator.oeid import OETestID
 
 
 @lru_cache(maxsize=32)
@@ -103,63 +102,51 @@ class WicTestCase(OESelftestTestCase):
 
 class Wic(WicTestCase):
 
-    @OETestID(1552)
     def test_version(self):
         """Test wic --version"""
         runCmd('wic --version')
 
-    @OETestID(1208)
     def test_help(self):
         """Test wic --help and wic -h"""
         runCmd('wic --help')
         runCmd('wic -h')
 
-    @OETestID(1209)
     def test_createhelp(self):
         """Test wic create --help"""
         runCmd('wic create --help')
 
-    @OETestID(1210)
     def test_listhelp(self):
         """Test wic list --help"""
         runCmd('wic list --help')
 
-    @OETestID(1553)
     def test_help_create(self):
         """Test wic help create"""
         runCmd('wic help create')
 
-    @OETestID(1554)
     def test_help_list(self):
         """Test wic help list"""
         runCmd('wic help list')
 
-    @OETestID(1215)
     def test_help_overview(self):
         """Test wic help overview"""
         runCmd('wic help overview')
 
-    @OETestID(1216)
     def test_help_plugins(self):
         """Test wic help plugins"""
         runCmd('wic help plugins')
 
-    @OETestID(1217)
     def test_help_kickstart(self):
         """Test wic help kickstart"""
         runCmd('wic help kickstart')
 
-    @OETestID(1555)
     def test_list_images(self):
         """Test wic list images"""
         runCmd('wic list images')
 
-    @OETestID(1556)
     def test_list_source_plugins(self):
         """Test wic list source-plugins"""
         runCmd('wic list source-plugins')
 
-    @OETestID(1557)
     def test_listed_images_help(self):
         """Test wic listed images help"""
         output = runCmd('wic list images').output
@@ -167,24 +154,20 @@ class Wic(WicTestCase):
         for image in imagelist:
             runCmd('wic list %s help' % image)
 
-    @OETestID(1213)
     def test_unsupported_subcommand(self):
         """Test unsupported subcommand"""
         self.assertNotEqual(0, runCmd('wic unsupported', ignore_status=True).status)
 
-    @OETestID(1214)
     def test_no_command(self):
         """Test wic without command"""
         self.assertEqual(1, runCmd('wic', ignore_status=True).status)
 
-    @OETestID(1211)
     def test_build_image_name(self):
         """Test wic create wictestdisk --image-name=core-image-minimal"""
         cmd = "wic create wictestdisk --image-name=core-image-minimal -o %s" % self.resultdir
         runCmd(cmd)
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
 
-    @OETestID(1157)
     @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_gpt_image(self):
         """Test creation of core-image-minimal with gpt table and UUID boot"""
@@ -192,7 +175,6 @@ class Wic(WicTestCase):
         runCmd(cmd)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
 
-    @OETestID(1346)
     @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_iso_image(self):
         """Test creation of hybrid iso image with legacy and EFI boot"""
@@ -207,7 +189,6 @@ class Wic(WicTestCase):
         self.assertEqual(1, len(glob(self.resultdir + "HYBRID_ISO_IMG-*.direct")))
         self.assertEqual(1, len(glob(self.resultdir + "HYBRID_ISO_IMG-*.iso")))
 
-    @OETestID(1348)
     @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_qemux86_directdisk(self):
         """Test creation of qemux-86-directdisk image"""
@@ -215,7 +196,6 @@ class Wic(WicTestCase):
         runCmd(cmd)
         self.assertEqual(1, len(glob(self.resultdir + "qemux86-directdisk-*direct")))
 
-    @OETestID(1350)
     @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_mkefidisk(self):
         """Test creation of mkefidisk image"""
@@ -223,7 +203,6 @@ class Wic(WicTestCase):
         runCmd(cmd)
         self.assertEqual(1, len(glob(self.resultdir + "mkefidisk-*direct")))
 
-    @OETestID(1385)
     @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_bootloader_config(self):
         """Test creation of directdisk-bootloader-config image"""
@@ -235,7 +214,6 @@ class Wic(WicTestCase):
         runCmd(cmd)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-bootloader-config-*direct")))
 
-    @OETestID(1560)
     @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_systemd_bootdisk(self):
         """Test creation of systemd-bootdisk image"""
@@ -247,7 +225,6 @@ class Wic(WicTestCase):
         runCmd(cmd)
         self.assertEqual(1, len(glob(self.resultdir + "systemd-bootdisk-*direct")))
 
-    @OETestID(1561)
     def test_sdimage_bootpart(self):
         """Test creation of sdimage-bootpart image"""
         cmd = "wic create sdimage-bootpart -e core-image-minimal -o %s" % self.resultdir
@@ -256,7 +233,6 @@ class Wic(WicTestCase):
         runCmd(cmd)
         self.assertEqual(1, len(glob(self.resultdir + "sdimage-bootpart-*direct")))
 
-    @OETestID(1562)
     @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_default_output_dir(self):
         """Test default output location"""
@@ -270,7 +246,6 @@ class Wic(WicTestCase):
         runCmd(cmd)
         self.assertEqual(1, len(glob("directdisk-*.direct")))
 
-    @OETestID(1212)
     @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_build_artifacts(self):
         """Test wic create directdisk providing all artifacts."""
@@ -288,7 +263,6 @@ class Wic(WicTestCase):
                         "-o %(resultdir)s" % bbvars)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
 
-    @OETestID(1264)
     def test_compress_gzip(self):
         """Test compressing an image with gzip"""
         runCmd("wic create wictestdisk "
@@ -296,7 +270,6 @@ class Wic(WicTestCase):
                                    "-c gzip -o %s" % self.resultdir)
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct.gz")))
 
-    @OETestID(1265)
     def test_compress_bzip2(self):
         """Test compressing an image with bzip2"""
         runCmd("wic create wictestdisk "
@@ -304,7 +277,6 @@ class Wic(WicTestCase):
                                    "-c bzip2 -o %s" % self.resultdir)
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct.bz2")))
 
-    @OETestID(1266)
     def test_compress_xz(self):
         """Test compressing an image with xz"""
         runCmd("wic create wictestdisk "
@@ -312,7 +284,6 @@ class Wic(WicTestCase):
                                    "--compress-with=xz -o %s" % self.resultdir)
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct.xz")))
 
-    @OETestID(1267)
     def test_wrong_compressor(self):
         """Test how wic breaks if wrong compressor is provided"""
         self.assertEqual(2, runCmd("wic create wictestdisk "
@@ -320,7 +291,6 @@ class Wic(WicTestCase):
                                    "-c wrong -o %s" % self.resultdir,
                                    ignore_status=True).status)
 
-    @OETestID(1558)
     def test_debug_short(self):
         """Test -D option"""
         runCmd("wic create wictestdisk "
@@ -328,7 +298,6 @@ class Wic(WicTestCase):
                                    "-D -o %s" % self.resultdir)
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
 
-    @OETestID(1658)
     def test_debug_long(self):
         """Test --debug option"""
         runCmd("wic create wictestdisk "
@@ -336,7 +305,6 @@ class Wic(WicTestCase):
                                    "--debug -o %s" % self.resultdir)
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
 
-    @OETestID(1563)
     def test_skip_build_check_short(self):
         """Test -s option"""
         runCmd("wic create wictestdisk "
@@ -344,7 +312,6 @@ class Wic(WicTestCase):
                                    "-s -o %s" % self.resultdir)
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
 
-    @OETestID(1671)
     def test_skip_build_check_long(self):
         """Test --skip-build-check option"""
         runCmd("wic create wictestdisk "
@@ -353,7 +320,6 @@ class Wic(WicTestCase):
                                    "--outdir %s" % self.resultdir)
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
 
-    @OETestID(1564)
     def test_build_rootfs_short(self):
         """Test -f option"""
         runCmd("wic create wictestdisk "
@@ -361,7 +327,6 @@ class Wic(WicTestCase):
                                    "-f -o %s" % self.resultdir)
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
 
-    @OETestID(1656)
     def test_build_rootfs_long(self):
         """Test --build-rootfs option"""
         runCmd("wic create wictestdisk "
@@ -370,7 +335,6 @@ class Wic(WicTestCase):
                                    "--outdir %s" % self.resultdir)
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
 
-    @OETestID(1268)
     @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_rootfs_indirect_recipes(self):
         """Test usage of rootfs plugin with rootfs recipes"""
@@ -381,7 +345,6 @@ class Wic(WicTestCase):
                         "--outdir %s" % self.resultdir)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-multi-rootfs*.direct")))
 
-    @OETestID(1269)
     @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_rootfs_artifacts(self):
         """Test usage of rootfs plugin with rootfs paths"""
@@ -401,7 +364,6 @@ class Wic(WicTestCase):
                         "--outdir %(resultdir)s" % bbvars)
         self.assertEqual(1, len(glob(self.resultdir + "%(wks)s-*.direct" % bbvars)))
 
-    @OETestID(1661)
     def test_exclude_path(self):
         """Test --exclude-path wks option."""
 
@@ -504,7 +466,6 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
         finally:
             os.environ['PATH'] = oldpath
 
-    @OETestID(1662)
     def test_exclude_path_errors(self):
         """Test --exclude-path wks option error handling."""
         wks_file = 'temp.wks'
@@ -525,7 +486,6 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
 
 class Wic2(WicTestCase):
 
-    @OETestID(1496)
     def test_bmap_short(self):
         """Test generation of .bmap file -m option"""
         cmd = "wic create wictestdisk -e core-image-minimal -m -o %s" % self.resultdir
@@ -533,7 +493,6 @@ class Wic2(WicTestCase):
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*direct")))
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*direct.bmap")))
 
-    @OETestID(1655)
     def test_bmap_long(self):
         """Test generation of .bmap file --bmap option"""
         cmd = "wic create wictestdisk -e core-image-minimal --bmap -o %s" % self.resultdir
@@ -541,7 +500,6 @@ class Wic2(WicTestCase):
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*direct")))
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*direct.bmap")))
 
-    @OETestID(1347)
     def test_image_env(self):
         """Test generation of <image>.env files."""
         image = 'core-image-minimal'
@@ -564,7 +522,6 @@ class Wic2(WicTestCase):
                 self.assertTrue(var in content, "%s is not in .env file" % var)
                 self.assertTrue(content[var])
 
-    @OETestID(1559)
     def test_image_vars_dir_short(self):
         """Test image vars directory selection -v option"""
         image = 'core-image-minimal'
@@ -577,7 +534,6 @@ class Wic2(WicTestCase):
                                       self.resultdir))
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*direct")))
 
-    @OETestID(1665)
     def test_image_vars_dir_long(self):
         """Test image vars directory selection --vars option"""
         image = 'core-image-minimal'
@@ -593,7 +549,6 @@ class Wic2(WicTestCase):
                                       self.resultdir))
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*direct")))
 
-    @OETestID(1351)
     @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_wic_image_type(self):
         """Test building wic images by bitbake"""
@@ -614,7 +569,6 @@ class Wic2(WicTestCase):
             self.assertTrue(os.path.islink(path))
             self.assertTrue(os.path.isfile(os.path.realpath(path)))
 
-    @OETestID(1424)
     @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_qemu(self):
         """Test wic-image-minimal under qemu"""
@@ -636,7 +590,6 @@ class Wic2(WicTestCase):
             self.assertEqual(output, 'UUID=2c71ef06-a81d-4735-9d3a-379b69c6bdba\t/media\text4\tdefaults\t0\t0')
 
     @only_for_arch(['i586', 'i686', 'x86_64'])
-    @OETestID(1852)
     def test_qemu_efi(self):
         """Test core-image-minimal efi image under qemu"""
         config = 'IMAGE_FSTYPES = "wic"\nWKS_FILE = "mkefidisk.wks"\n'
@@ -666,7 +619,6 @@ class Wic2(WicTestCase):
 
         return wkspath, wksname
 
-    @OETestID(1847)
     def test_fixed_size(self):
         """
         Test creation of a simple image with partition size controlled through
@@ -697,7 +649,6 @@ class Wic2(WicTestCase):
         self.assertEqual(1, len(partlns))
         self.assertEqual("1:0.00MiB:200MiB:200MiB:ext4::;", partlns[0])
 
-    @OETestID(1848)
     def test_fixed_size_error(self):
         """
         Test creation of a simple image with partition size controlled through
@@ -713,7 +664,6 @@ class Wic2(WicTestCase):
         self.assertEqual(0, len(wicout))
 
     @only_for_arch(['i586', 'i686', 'x86_64'])
-    @OETestID(1854)
     def test_rawcopy_plugin_qemu(self):
         """Test rawcopy plugin in qemu"""
         # build ext4 and wic images
@@ -729,7 +679,6 @@ class Wic2(WicTestCase):
             self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
             self.assertEqual(output, '2')
 
-    @OETestID(1853)
     def test_rawcopy_plugin(self):
         """Test rawcopy plugin"""
         img = 'core-image-minimal'
@@ -746,7 +695,6 @@ class Wic2(WicTestCase):
             out = glob(self.resultdir + "%s-*direct" % wksname)
             self.assertEqual(1, len(out))
 
-    @OETestID(1849)
     def test_fs_types(self):
         """Test filesystem types for empty and not empty partitions"""
         img = 'core-image-minimal'
@@ -766,7 +714,6 @@ class Wic2(WicTestCase):
             out = glob(self.resultdir + "%s-*direct" % wksname)
             self.assertEqual(1, len(out))
 
-    @OETestID(1851)
     def test_kickstart_parser(self):
         """Test wks parser options"""
         with NamedTemporaryFile("w", suffix=".wks") as wks:
@@ -779,7 +726,6 @@ class Wic2(WicTestCase):
             out = glob(self.resultdir + "%s-*direct" % wksname)
             self.assertEqual(1, len(out))
 
-    @OETestID(1850)
     def test_image_bootpart_globbed(self):
         """Test globbed sources with image-bootpart plugin"""
         img = "core-image-minimal"
@@ -790,7 +736,6 @@ class Wic2(WicTestCase):
         self.remove_config(config)
         self.assertEqual(1, len(glob(self.resultdir + "sdimage-bootpart-*direct")))
 
-    @OETestID(1855)
     def test_sparse_copy(self):
         """Test sparse_copy with FIEMAP and SEEK_HOLE filemap APIs"""
         libpath = os.path.join(get_bb_var('COREBASE'), 'scripts', 'lib', 'wic')
@@ -819,7 +764,6 @@ class Wic2(WicTestCase):
                 self.assertEqual(dest_stat.st_blocks, 8)
             os.unlink(dest)
 
-    @OETestID(1857)
     def test_wic_ls(self):
         """Test listing image content using 'wic ls'"""
         runCmd("wic create wictestdisk "
@@ -838,7 +782,6 @@ class Wic2(WicTestCase):
         result = runCmd("wic ls %s:1/ -n %s" % (images[0], sysroot))
         self.assertEqual(6, len(result.output.split('\n')))
 
-    @OETestID(1856)
     def test_wic_cp(self):
         """Test copy files and directories to the the wic image."""
         runCmd("wic create wictestdisk "
@@ -878,7 +821,6 @@ class Wic2(WicTestCase):
             self.assertEqual(8, len(result.output.split('\n')))
             self.assertTrue(os.path.basename(testdir) in result.output)
 
-    @OETestID(1858)
     def test_wic_rm(self):
         """Test removing files and directories from the the wic image."""
         runCmd("wic create mkefidisk "
@@ -905,7 +847,6 @@ class Wic2(WicTestCase):
         self.assertNotIn('\nBZIMAGE        ', result.output)
         self.assertNotIn('\nEFI          <DIR>     ', result.output)
 
-    @OETestID(1922)
     def test_mkfs_extraopts(self):
         """Test wks option --mkfs-extraopts for empty and not empty partitions"""
         img = 'core-image-minimal'
-- 
2.20.1


