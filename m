Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4329.1794732559692513403
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 00:49:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PAv5x6YH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so26086535e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 00:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794732558; x=1795337358; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=My5iT8N5pR02Td9ANQ722itb/YNzTLUcGN2RvfV4XnM=;
        b=PAv5x6YHA/jTDttRSoz3uySbcKW8Nph6wR/SWG5W50SuuycnE5cHKRoGEFDx/bqMLH
         VEUZFTHw2Z5M75Yc/AGAn2tMI/fgWfFaOVDTs1guv0F2tYkZXthdPY8Ii0UqTtZID88s
         zVlWEMaeM2Dr8GchitnXMKftxe4fgJ+YcAb70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732558; x=1795337358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=My5iT8N5pR02Td9ANQ722itb/YNzTLUcGN2RvfV4XnM=;
        b=kOTpJwbvnu8kcDPvMXcyfB+UjBc+xYM3l2P9wt1LPFcBRo1v44qRqQcAuD98ytJTTl
         6jF3PT435zW1DQiq8CJ0SbBmMi+omQ2tYniqoi4Pi4+gAS9DCDy9Q5R5oqGF45nxYh5e
         Kbxw2uaMISQscSo7vbz2yLSrAsmEHYwvhQigifWrCY2Ho+N+2Y0S6WcJbbW58btxUIor
         sz+z9e/93MArHx5aBC+yRkrudbAjWQTziNlWIGjxKC8NGVtpG7D35wImyqD4Wuc2tYvW
         1MsyD+W3SZY2ysS9rHAL+G4s/Y1B17hAjFTbmStMsNyp+pcLOWBEL245e2mv9d56K6cW
         c0Rg==
X-Gm-Message-State: APuU4Z/LM2s+19DT+GiLf3IQqLtp6UIw1M9KCLbWvsT9UUKD+m4PHr6K
	cOYaAOam3UUpFQdWVkGuzph+vtJVLq4G23QiFllDxO5zfB05GSDzGOxe5K8Xf/qOsM4RJUznp/8
	KJTW+EV8=
X-Gm-Gg: AYBFou0IGysEDhNNdtuQT3H310dnVvR9k+LeMuH+m9eGhJoTgMUMho1AePVNUMYDH5u
	g0slMzqZSFrie5TQh6qboqj62BAAZH3DSl9DtEPCu9YT08Bo6DOixrIOoIkZzXVmAQ7xc54gV+n
	THYlYjOfgDbENtIQmwVxTsmj403Lbw1Qjc4L9T7aInhorD0m2YoHgvURt9UMDYN7WjE0Y1VIUt3
	lB75glknwgogDnv7LSlNyj+wbaMqa2E9a+gzMgOn+k6oUUPS027B6wKCWhEgglo27KFEMczv7mW
	Upn4OtC6kFwC9A25cThqdDVnro1Pxlcv3Kgzxd0mkxXQ13r+jd5XOicOnIGLGySsSfrXLpd347e
	ky/yfhkMR0iI0DeLQzXdJTekB6183NTg5TovfVlDV49NFsmzhc0OoAkMTOUi+y+2xcJ4RDfv0Aj
	z5fEhAnRQBnU3Le8GxZ5aAXZGUS2n7Yy7e2ml+ir1Led1bqGiN6lm/av0TAd/wFGRh1QAMpmzBa
	+5NcxdkzrJaPYjrRQ6qqPhfl3XLY/5cNcOOnSy149YGym2lH+dNmaFnN3iTZXAL47BHSyEyB2tk
	FgfTGfTp5uW9UFIPctvCXNdwKRlo99OwgkGUoACGoUqOL4/NbEDQVHbkpg==
X-Received: by 2002:a05:600c:4e8c:b0:4bb:60ba:49e0 with SMTP id 5b1f17b1804b1-4bb60ba4a70mr83060365e9.26.1794732557604;
        Sun, 15 Nov 2026 00:49:17 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b65:588d:a4ce:ce3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm13804452f8f.57.2026.11.15.00.49.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:49:16 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 18/41] oeqa/oetest.py: Remove
Date: Sun, 15 Nov 2026 08:48:21 +0000
Message-ID: <20261115084845.701136-18-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
References: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 08:49:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250249
Content-Type: text/plain; charset="utf-8"

Nothing uses this any more, it is dead code. Drop it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/oetest.py | 598 ----------------------------------------
 1 file changed, 598 deletions(-)
 delete mode 100644 meta/lib/oeqa/oetest.py

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
deleted file mode 100644
index f5703ea9cd3..00000000000
--- a/meta/lib/oeqa/oetest.py
+++ /dev/null
@@ -1,598 +0,0 @@
-#
-# Copyright (C) 2013 Intel Corporation
-#
-# SPDX-License-Identifier: MIT
-#
-
-# Main unittest module used by testimage.bbclass
-# This provides the oeRuntimeTest base class which is inherited by all tests in meta/lib/oeqa/runtime.
-
-# It also has some helper functions and it's responsible for actually starting the tests
-
-import os, re, sys
-import unittest
-import inspect
-import subprocess
-import signal
-import shutil
-import functools
-try:
-    import bb
-except ImportError:
-    pass
-import logging
-
-import oeqa.runtime
-# Exported test doesn't require sdkext
-try:
-    import oeqa.sdkext
-except ImportError:
-    pass
-from oeqa.utils.decorators import LogResults, gettag
-
-logger = logging.getLogger("BitBake")
-
-def getVar(obj):
-    #extend form dict, if a variable didn't exists, need find it in testcase
-    class VarDict(dict):
-        def __getitem__(self, key):
-            return gettag(obj, key)
-    return VarDict()
-
-def checkTags(tc, tagexp):
-    return eval(tagexp, None, getVar(tc))
-
-def filterByTagExp(testsuite, tagexp):
-    if not tagexp:
-        return testsuite
-    caseList = []
-    for each in testsuite:
-        if not isinstance(each, unittest.BaseTestSuite):
-            if checkTags(each, tagexp):
-                caseList.append(each)
-        else:
-            caseList.append(filterByTagExp(each, tagexp))
-    return testsuite.__class__(caseList)
-
-@LogResults
-class oeTest(unittest.TestCase):
-
-    longMessage = True
-
-    @classmethod
-    def hasPackage(self, pkg):
-        """
-        True if the full package name exists in the manifest, False otherwise.
-        """
-        return pkg in oeTest.tc.pkgmanifest
-
-    @classmethod
-    def hasPackageMatch(self, match):
-        """
-        True if match exists in the manifest as a regular expression substring,
-        False otherwise.
-        """
-        for s in oeTest.tc.pkgmanifest:
-            if re.match(match, s):
-                return True
-        return False
-
-    @classmethod
-    def hasFeature(self,feature):
-        if feature in oeTest.tc.imagefeatures or \
-                feature in oeTest.tc.distrofeatures:
-            return True
-        else:
-            return False
-
-class oeRuntimeTest(oeTest):
-    def __init__(self, methodName='runTest'):
-        self.target = oeRuntimeTest.tc.target
-        super().__init__(methodName)
-
-    def setUp(self):
-        # Install packages in the DUT
-        self.tc.install_uninstall_packages(self.id())
-
-        # Check if test needs to run
-        if self.tc.sigterm:
-            self.fail("Got SIGTERM")
-        elif (type(self.target).__name__ == "QemuTarget"):
-            self.assertTrue(self.target.check(), msg = "Qemu not running?")
-
-        self.setUpLocal()
-
-    # a setup method before tests but after the class instantiation
-    def setUpLocal(self):
-        pass
-
-    def tearDown(self):
-        # Uninstall packages in the DUT
-        self.tc.install_uninstall_packages(self.id(), False)
-        self.tearDownLocal()
-
-    # Method to be run after tearDown and implemented by child classes
-    def tearDownLocal(self):
-        pass
-
-def getmodule(pos=2):
-    # stack returns a list of tuples containg frame information
-    # First element of the list the is current frame, caller is 1
-    frameinfo = inspect.stack()[pos]
-    modname = inspect.getmodulename(frameinfo[1])
-    #modname = inspect.getmodule(frameinfo[0]).__name__
-    return modname
-
-def skipModule(reason, pos=2):
-    modname = getmodule(pos)
-    if modname not in oeTest.tc.testsrequired:
-        raise unittest.SkipTest("%s: %s" % (modname, reason))
-    else:
-        raise Exception("\nTest %s wants to be skipped.\nReason is: %s" \
-                "\nTest was required in TEST_SUITES, so either the condition for skipping is wrong" \
-                "\nor the image really doesn't have the required feature/package when it should." % (modname, reason))
-
-def skipModuleIf(cond, reason):
-
-    if cond:
-        skipModule(reason, 3)
-
-def skipModuleUnless(cond, reason):
-
-    if not cond:
-        skipModule(reason, 3)
-
-_buffer_logger = ""
-def custom_verbose(msg, *args, **kwargs):
-    global _buffer_logger
-    if msg[-1] != "\n":
-        _buffer_logger += msg
-    else:
-        _buffer_logger += msg
-        try:
-            bb.plain(_buffer_logger.rstrip("\n"), *args, **kwargs)
-        except NameError:
-            logger.info(_buffer_logger.rstrip("\n"), *args, **kwargs)
-        _buffer_logger = ""
-
-class TestContext:
-    def __init__(self, d, exported=False):
-        self.d = d
-
-        self.testsuites = self._get_test_suites()
-
-        if exported:
-            path = [os.path.dirname(os.path.abspath(__file__))]
-            extrapath = ""
-        else:
-            path = d.getVar("BBPATH").split(':')
-            extrapath = "lib/oeqa"
-
-        self.testslist = self._get_tests_list(path, extrapath)
-        self.testsrequired = self._get_test_suites_required()
-
-        self.filesdir = os.path.join(os.path.dirname(os.path.abspath(__file__)), "runtime/files")
-        self.corefilesdir = os.path.join(os.path.dirname(os.path.abspath(__file__)), "files")
-        self.imagefeatures = d.getVar("IMAGE_FEATURES").split()
-        self.distrofeatures = d.getVar("DISTRO_FEATURES").split()
-
-    # get testcase list from specified file
-    # if path is a relative path, then relative to build/conf/
-    def _read_testlist(self, fpath, builddir):
-        if not os.path.isabs(fpath):
-            fpath = os.path.join(builddir, "conf", fpath)
-        if not os.path.exists(fpath):
-            bb.fatal("No such manifest file: ", fpath)
-        tcs = []
-        for line in open(fpath).readlines():
-            line = line.strip()
-            if line and not line.startswith("#"):
-                tcs.append(line)
-        return " ".join(tcs)
-
-    # return test list by type also filter if TEST_SUITES is specified
-    def _get_tests_list(self, bbpath, extrapath):
-        testslist = []
-
-        type = self._get_test_namespace()
-
-        # This relies on lib/ under each directory in BBPATH being added to sys.path
-        # (as done by default in base.bbclass)
-        for testname in self.testsuites:
-            if testname != "auto":
-                if testname.startswith("oeqa."):
-                    testslist.append(testname)
-                    continue
-                found = False
-                for p in bbpath:
-                    if os.path.exists(os.path.join(p, extrapath, type, testname + ".py")):
-                        testslist.append("oeqa." + type + "." + testname)
-                        found = True
-                        break
-                    elif os.path.exists(os.path.join(p, extrapath, type, testname.split(".")[0] + ".py")):
-                        testslist.append("oeqa." + type + "." + testname)
-                        found = True
-                        break
-                if not found:
-                    bb.fatal('Test %s specified in TEST_SUITES could not be found in lib/oeqa/runtime under BBPATH' % testname)
-
-        if "auto" in self.testsuites:
-            def add_auto_list(path):
-                files = sorted([f for f in os.listdir(path) if f.endswith('.py') and not f.startswith('_')])
-                for f in files:
-                    module = 'oeqa.' + type + '.' + f[:-3]
-                    if module not in testslist:
-                        testslist.append(module)
-
-            for p in bbpath:
-                testpath = os.path.join(p, 'lib', 'oeqa', type)
-                bb.debug(2, 'Searching for tests in %s' % testpath)
-                if os.path.exists(testpath):
-                    add_auto_list(testpath)
-
-        return testslist
-
-    def getTestModules(self):
-        """
-        Returns all the test modules in the testlist.
-        """
-
-        import pkgutil
-
-        modules = []
-        for test in self.testslist:
-            if re.search(r"\w+\.\w+\.test_\S+", test):
-                test = '.'.join(t.split('.')[:3])
-            module = pkgutil.get_loader(test)
-            modules.append(module)
-
-        return modules
-
-    def getModulefromID(self, test_id):
-        """
-        Returns the test module based on a test id.
-        """
-
-        module_name = ".".join(test_id.split(".")[:3])
-        modules = self.getTestModules()
-        for module in modules:
-            if module.name == module_name:
-                return module
-
-        return None
-
-    def getTests(self, test):
-        '''Return all individual tests executed when running the suite.'''
-        # Unfortunately unittest does not have an API for this, so we have
-        # to rely on implementation details. This only needs to work
-        # for TestSuite containing TestCase.
-        method = getattr(test, '_testMethodName', None)
-        if method:
-            # leaf case: a TestCase
-            yield test
-        else:
-            # Look into TestSuite.
-            tests = getattr(test, '_tests', [])
-            for t1 in tests:
-                for t2 in self.getTests(t1):
-                    yield t2
-
-    def loadTests(self):
-        setattr(oeTest, "tc", self)
-
-        testloader = unittest.TestLoader()
-        testloader.sortTestMethodsUsing = None
-        suites = [testloader.loadTestsFromName(name) for name in self.testslist]
-        suites = filterByTagExp(suites, getattr(self, "tagexp", None))
-
-        # Determine dependencies between suites by looking for @skipUnlessPassed
-        # method annotations. Suite A depends on suite B if any method in A
-        # depends on a method on B.
-        for suite in suites:
-            suite.dependencies = []
-            suite.depth = 0
-            for test in self.getTests(suite):
-                methodname = getattr(test, '_testMethodName', None)
-                if methodname:
-                    method = getattr(test, methodname)
-                    depends_on = getattr(method, '_depends_on', None)
-                    if depends_on:
-                        for dep_suite in suites:
-                            if depends_on in [getattr(t, '_testMethodName', None) for t in self.getTests(dep_suite)]:
-                                if dep_suite not in suite.dependencies and \
-                                   dep_suite is not suite:
-                                    suite.dependencies.append(dep_suite)
-                                break
-                        else:
-                            logger.warning("Test %s was declared as @skipUnlessPassed('%s') but that test is either not defined or not active. Will run the test anyway." %
-                                    (test, depends_on))
-
-        # Use brute-force topological sort to determine ordering. Sort by
-        # depth (higher depth = must run later), with original ordering to
-        # break ties.
-        def set_suite_depth(suite):
-            for dep in suite.dependencies:
-                new_depth = set_suite_depth(dep) + 1
-                if new_depth > suite.depth:
-                    suite.depth = new_depth
-            return suite.depth
-
-        for index, suite in enumerate(suites):
-            set_suite_depth(suite)
-            suite.index = index
-
-        def cmp(a, b):
-            return (a > b) - (a < b)
-
-        def cmpfunc(a, b):
-            return cmp((a.depth, a.index), (b.depth, b.index))
-
-        suites.sort(key=functools.cmp_to_key(cmpfunc))
-
-        self.suite = testloader.suiteClass(suites)
-
-        return self.suite
-
-    def runTests(self):
-        logger.info("Test modules  %s" % self.testslist)
-        if hasattr(self, "tagexp") and self.tagexp:
-            logger.info("Filter test cases by tags: %s" % self.tagexp)
-        logger.info("Found %s tests" % self.suite.countTestCases())
-        runner = unittest.TextTestRunner(verbosity=2)
-        if 'bb' in sys.modules:
-            runner.stream.write = custom_verbose
-
-        return runner.run(self.suite)
-
-class RuntimeTestContext(TestContext):
-    def __init__(self, d, target, exported=False):
-        super().__init__(d, exported)
-
-        self.target = target
-
-        self.pkgmanifest = {}
-        manifest = os.path.join(d.getVar("DEPLOY_DIR_IMAGE"),
-                d.getVar("IMAGE_LINK_NAME") + ".manifest")
-        nomanifest = d.getVar("IMAGE_NO_MANIFEST")
-        if nomanifest is None or nomanifest != "1":
-            try:
-                with open(manifest) as f:
-                    for line in f:
-                        (pkg, arch, version) = line.strip().split()
-                        self.pkgmanifest[pkg] = (version, arch)
-            except OSError as e:
-                bb.fatal("No package manifest file found. Did you build the image?\n%s" % e)
-
-    def _get_test_namespace(self):
-        return "runtime"
-
-    def _get_test_suites(self):
-        testsuites = []
-
-        manifests = (self.d.getVar("TEST_SUITES_MANIFEST") or '').split()
-        if manifests:
-            for manifest in manifests:
-                testsuites.extend(self._read_testlist(manifest,
-                                  self.d.getVar("TOPDIR")).split())
-
-        else:
-            testsuites = self.d.getVar("TEST_SUITES").split()
-
-        return testsuites
-
-    def _get_test_suites_required(self):
-        return [t for t in self.d.getVar("TEST_SUITES").split() if t != "auto"]
-
-    def extract_packages(self):
-        """
-        Find packages that will be needed during runtime.
-        """
-
-        modules = self.getTestModules()
-        bbpaths = self.d.getVar("BBPATH").split(":")
-
-        shutil.rmtree(self.d.getVar("TEST_EXTRACTED_DIR"))
-        shutil.rmtree(self.d.getVar("TEST_PACKAGED_DIR"))
-        for module in modules:
-            json_file = self._getJsonFile(module)
-            if json_file:
-                needed_packages = self._getNeededPackages(json_file)
-                self._perform_package_extraction(needed_packages)
-
-    def _perform_package_extraction(self, needed_packages):
-        """
-        Extract packages that will be needed during runtime.
-        """
-
-        import oe.path
-
-        extracted_path = self.d.getVar("TEST_EXTRACTED_DIR")
-        packaged_path = self.d.getVar("TEST_PACKAGED_DIR")
-
-        for key,value in needed_packages.items():
-            packages = ()
-            if isinstance(value, dict):
-                packages = (value, )
-            elif isinstance(value, list):
-                packages = value
-            else:
-                bb.fatal("Failed to process needed packages for %s; "
-                         "Value must be a dict or list" % key)
-
-            for package in packages:
-                pkg = package["pkg"]
-                rm = package.get("rm", False)
-                extract = package.get("extract", True)
-                if extract:
-                    dst_dir = os.path.join(extracted_path, pkg)
-                else:
-                    dst_dir = os.path.join(packaged_path)
-
-                # Extract package and copy it to TEST_EXTRACTED_DIR
-                pkg_dir = self._extract_in_tmpdir(pkg)
-                if extract:
-
-                    # Same package used for more than one test,
-                    # don't need to extract again.
-                    if os.path.exists(dst_dir):
-                        continue
-                    oe.path.copytree(pkg_dir, dst_dir)
-                    shutil.rmtree(pkg_dir)
-
-                # Copy package to TEST_PACKAGED_DIR
-                else:
-                    self._copy_package(pkg)
-
-    def _getJsonFile(self, module):
-        """
-        Returns the path of the JSON file for a module, empty if doesn't exitst.
-        """
-
-        module_file = module.path
-        json_file = "%s.json" % module_file.rsplit(".", 1)[0]
-        if os.path.isfile(module_file) and os.path.isfile(json_file):
-            return json_file
-        else:
-            return ""
-
-    def _getNeededPackages(self, json_file, test=None):
-        """
-        Returns a dict with needed packages based on a JSON file.
-
-
-        If a test is specified it will return the dict just for that test.
-        """
-
-        import json
-
-        needed_packages = {}
-
-        with open(json_file) as f:
-            test_packages = json.load(f)
-        for key,value in test_packages.items():
-            needed_packages[key] = value
-
-        if test:
-            if test in needed_packages:
-                needed_packages = needed_packages[test]
-            else:
-                needed_packages = {}
-
-        return needed_packages
-
-    def _extract_in_tmpdir(self, pkg):
-        """"
-        Returns path to a temp directory where the package was
-        extracted without dependencies.
-        """
-
-        from oeqa.utils.package_manager import get_package_manager
-
-        pkg_path = os.path.join(self.d.getVar("TEST_INSTALL_TMP_DIR"), pkg)
-        pm = get_package_manager(self.d, pkg_path)
-        extract_dir = pm.extract(pkg)
-        shutil.rmtree(pkg_path)
-
-        return extract_dir
-
-    def _copy_package(self, pkg):
-        """
-        Copy the RPM, DEB or IPK package to dst_dir
-        """
-
-        from oeqa.utils.package_manager import get_package_manager
-
-        pkg_path = os.path.join(self.d.getVar("TEST_INSTALL_TMP_DIR"), pkg)
-        dst_dir = self.d.getVar("TEST_PACKAGED_DIR")
-        pm = get_package_manager(self.d, pkg_path)
-        pkg_info = pm.package_info(pkg)
-        file_path = pkg_info[pkg]["filepath"]
-        shutil.copy2(file_path, dst_dir)
-        shutil.rmtree(pkg_path)
-
-    def install_uninstall_packages(self, test_id, pkg_dir, install):
-        """
-        Check if the test requires a package and Install/Uninstall it in the DUT
-        """
-
-        test = test_id.split(".")[4]
-        module = self.getModulefromID(test_id)
-        json = self._getJsonFile(module)
-        if json:
-            needed_packages = self._getNeededPackages(json, test)
-            if needed_packages:
-                self._install_uninstall_packages(needed_packages, pkg_dir, install)
-
-    def _install_uninstall_packages(self, needed_packages, pkg_dir, install=True):
-        """
-        Install/Uninstall packages in the DUT without using a package manager
-        """
-
-        if isinstance(needed_packages, dict):
-            packages = [needed_packages]
-        elif isinstance(needed_packages, list):
-            packages = needed_packages
-
-        for package in packages:
-            pkg = package["pkg"]
-            rm = package.get("rm", False)
-            extract = package.get("extract", True)
-            src_dir = os.path.join(pkg_dir, pkg)
-
-            # Install package
-            if install and extract:
-                self.target.connection.copy_dir_to(src_dir, "/")
-
-            # Uninstall package
-            elif not install and rm:
-                self.target.connection.delete_dir_structure(src_dir, "/")
-
-class ImageTestContext(RuntimeTestContext):
-    def __init__(self, d, target, host_dumper):
-        super().__init__(d, target)
-
-        self.tagexp = d.getVar("TEST_SUITES_TAGS")
-
-        self.host_dumper = host_dumper
-
-        self.sigterm = False
-        self.origsigtermhandler = signal.getsignal(signal.SIGTERM)
-        signal.signal(signal.SIGTERM, self._sigterm_exception)
-
-    def _sigterm_exception(self, signum, stackframe):
-        bb.warn("TestImage received SIGTERM, shutting down...")
-        self.sigterm = True
-        self.target.stop()
-
-    def install_uninstall_packages(self, test_id, install=True):
-        """
-        Check if the test requires a package and Install/Uninstall it in the DUT
-        """
-
-        pkg_dir = self.d.getVar("TEST_EXTRACTED_DIR")
-        super().install_uninstall_packages(test_id, pkg_dir, install)
-
-class ExportTestContext(RuntimeTestContext):
-    def __init__(self, d, target, exported=False, parsedArgs={}):
-        """
-        This class is used when exporting tests and when are executed outside OE environment.
-
-        parsedArgs can contain the following:
-            - tag:      Filter test by tag.
-        """
-        super().__init__(d, target, exported)
-
-        tag = parsedArgs.get("tag", None)
-        self.tagexp = tag if tag is not None else d.getVar("TEST_SUITES_TAGS")
-
-        self.sigterm = None
-
-    def install_uninstall_packages(self, test_id, install=True):
-        """
-        Check if the test requires a package and Install/Uninstall it in the DUT
-        """
-
-        export_dir = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))
-        extracted_dir = self.d.getVar("TEST_EXPORT_EXTRACTED_DIR")
-        pkg_dir = os.path.join(export_dir, extracted_dir)
-        super().install_uninstall_packages(test_id, pkg_dir, install)
