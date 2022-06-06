Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41525CCA47F
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 12:01:44 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.30981.1654516900561492149
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:01:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jAjdyCaC;
 spf=pass (domain: gmail.com, ip: 209.85.128.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id
 67-20020a1c1946000000b00397382b44f4so7812650wmz.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fpodBt9ueEMCA7cY9VkUzUbbKH1qSAzEepVyl19qZ4M=;
        b=jAjdyCaCDd4kRcfgJbz1ONSbUf0511wwqBw6g1LQJ1+goExsroV9oXKGEIzplKRluY
         jrTwHitBaC3LGnkVlTSdyrcW/CWf6Aguz55Ju2wulQzcy/ebaO4m6sMwV2keYOjIJ+7t
         624kJmUegVSlBeKDb4Kj7yejLiVg+erwrSXXFcNY8XDn4rhrGklH/zE/0gW2mRCWEvoH
         Tlr2EIvMGjtQQXIA3zlTwX8FpclafjMPq1ZdSCReuM3WQRUka8zOnBPdVviTaMAfHeC8
         C5m/8HUVSY2iTIgTyMODYJBIyAHpV6F/q/X9WWBOe312Qnnxr3vPfBAyg7dlmva64ctC
         bWyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fpodBt9ueEMCA7cY9VkUzUbbKH1qSAzEepVyl19qZ4M=;
        b=kIePEfNWe1oyvah9Gq0YMykcNonssjv8aDuOW9jHRaBGk7tsAh++kwIPu8TDq/hShi
         by0nEbAOmxsU/jX6JYgRbQAKYed4GMW5HI7/1MKc1v+fylTxmgyjOGkREu7EguT01zQI
         utz70565eDAc2C2RAVYhRDPpTIpHbVSZp/ocL59orAgjC3nq/MLzEIrIjfC4aTq5/uvo
         Hp4srpMFtrC7MiWVxOfzskkFbb0HkuuIVlG3mwnZ8qRxvuwyvXy7DpRzrxzlX4Bm3bRG
         UnkYdsWLlhOxxAqsg75wGAdOAkHaU/BJmB81+vQVY6bG4O8iBhZTQichnfNMwlTG6RyC
         OwLA==
X-Gm-Message-State: AOAM5318sKD+tKDJaWfDzWB0h9+Md8pVlsx/QfIpgJg6aJdLOlcC3It4
	su0tn9/m0kNbkc57tag4xcwLsI8RxmUXcQ==
X-Google-Smtp-Source: 
 ABdhPJz6M0nTMtoJbOiIei2WQlqqkWh0cuB34iqiusvdc9BGLLiyC6QCUk6AI1mlb4H6wZdZ+Z/8Rw==
X-Received: by 2002:a7b:cb4b:0:b0:39c:49dd:b2cc with SMTP id
 v11-20020a7bcb4b000000b0039c49ddb2ccmr9154845wmj.123.1654516898995;
        Mon, 06 Jun 2022 05:01:38 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002100316b126sm15526455wru.6.2022.06.06.05.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 05:01:38 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/21] python3-psutil: update 5.9.0 -> 5.9.1
Date: Mon,  6 Jun 2022 14:01:15 +0200
Message-Id: <20220606120126.3381438-10-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220606120126.3381438-1-alex@linutronix.de>
References: <20220606120126.3381438-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 12:01:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166603

Drop the patch, as we do not actually have ptests for
the module, and the patch submitted upstream differs
significantly, so it makes no sense to rebase
the in-layer version.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-fix-failure-test-cases.patch         | 197 ------------------
 ...sutil_5.9.0.bb => python3-psutil_5.9.1.bb} |   4 +-
 2 files changed, 1 insertion(+), 200 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-psutil/0001-fix-failure-test-cases.patch
 rename meta/recipes-devtools/python/{python3-psutil_5.9.0.bb => python3-psutil_5.9.1.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-psutil/0001-fix-failure-test-cases.patch b/meta/recipes-devtools/python/python3-psutil/0001-fix-failure-test-cases.patch
deleted file mode 100644
index 99bfccca3f..0000000000
--- a/meta/recipes-devtools/python/python3-psutil/0001-fix-failure-test-cases.patch
+++ /dev/null
@@ -1,197 +0,0 @@
-From 8b4e38958ff8bdbb3ece4796bfa2d3b6f7536f71 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Wed, 23 Feb 2022 11:54:40 +0800
-Subject: [PATCH] fix failure test cases
-
-The test cases is not robust enough. skip some cases that is
-not suitable for all conditions.
-
-* test_io_counters failed when kernel config CONFIG_TASKSTATS
-  and CONFIG_TASK_IO_ACCOUNTING are not enable in OE 
-* test_setup_script failed since oe don't install setup.py
-* test_used failed since oe use git source for free, so the version
-  is 3.3.17-dirty
-* test_weird_environ failed since gcc not installed
-* test_debug failed since it is designed to run when PSUTIL_DEBUG is set
-* test_against_findmnt/test_comparisons/test_disk_partitions_mocked/
-  test_disk_partitions is not suitable for Linux nfs boot
-
-Upstream-Status: Submitted [https://github.com/giampaolo/psutil/pull/2097]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- psutil/tests/test_contracts.py | 1 +
- psutil/tests/test_linux.py     | 8 ++++++--
- psutil/tests/test_misc.py      | 4 ++++
- psutil/tests/test_process.py   | 5 +++++
- psutil/tests/test_system.py    | 1 +
- psutil/tests/test_unicode.py   | 4 +++-
- 6 files changed, 20 insertions(+), 3 deletions(-)
-
-diff --git a/psutil/tests/test_contracts.py b/psutil/tests/test_contracts.py
-index 7401cc1..bf0fca0 100755
---- a/psutil/tests/test_contracts.py
-+++ b/psutil/tests/test_contracts.py
-@@ -172,6 +172,7 @@ class TestAvailProcessAPIs(PsutilTestCase):
-     def test_rlimit(self):
-         self.assertEqual(hasattr(psutil.Process, "rlimit"), LINUX or FREEBSD)
- 
-+    @unittest.skip("broken on OE since kernel config maye not be enabled")
-     def test_io_counters(self):
-         hasit = hasattr(psutil.Process, "io_counters")
-         self.assertEqual(hasit, False if MACOS or SUNOS else True)
-diff --git a/psutil/tests/test_linux.py b/psutil/tests/test_linux.py
-index 20e28d2..66b6dda 100755
---- a/psutil/tests/test_linux.py
-+++ b/psutil/tests/test_linux.py
-@@ -196,8 +196,9 @@ def get_free_version_info():
-     out = sh(["free", "-V"]).strip()
-     if 'UNKNOWN' in out:
-         raise unittest.SkipTest("can't determine free version")
--    return tuple(map(int, out.split()[-1].split('.')))
--
-+    vlist = out.split()[-1].split('.')
-+    vlist[:] = [n.split('-')[0] for n in vlist]
-+    return tuple(map(int, vlist))
- 
- @contextlib.contextmanager
- def mock_open_content(for_path, content):
-@@ -1289,6 +1290,7 @@ class TestRootFsDeviceFinder(PsutilTestCase):
-         finder.ask_sys_class_block()
- 
-     @unittest.skipIf(GITHUB_ACTIONS, "unsupported on GITHUB_ACTIONS")
-+    @unittest.skip("Broken for oe")
-     def test_comparisons(self):
-         finder = RootFsDeviceFinder()
-         self.assertIsNotNone(finder.find())
-@@ -1311,11 +1313,13 @@ class TestRootFsDeviceFinder(PsutilTestCase):
- 
-     @unittest.skipIf(not which("findmnt"), "findmnt utility not available")
-     @unittest.skipIf(GITHUB_ACTIONS, "unsupported on GITHUB_ACTIONS")
-+    @unittest.skip("Broken for oe")
-     def test_against_findmnt(self):
-         psutil_value = RootFsDeviceFinder().find()
-         findmnt_value = sh("findmnt -o SOURCE -rn /")
-         self.assertEqual(psutil_value, findmnt_value)
- 
-+    @unittest.skip("Broken for oe")
-     def test_disk_partitions_mocked(self):
-         with mock.patch(
-                 'psutil._pslinux.cext.disk_partitions',
-diff --git a/psutil/tests/test_misc.py b/psutil/tests/test_misc.py
-index d946eb6..121004a 100755
---- a/psutil/tests/test_misc.py
-+++ b/psutil/tests/test_misc.py
-@@ -54,6 +54,8 @@ from psutil.tests import unittest
- # ===================================================================
- 
- 
-+PSUTIL_DEBUG = bool(os.getenv('PSUTIL_DEBUG', 0))
-+
- class TestMisc(PsutilTestCase):
- 
-     def test_process__repr__(self, func=repr):
-@@ -368,6 +370,7 @@ class TestMisc(PsutilTestCase):
- 
-     # XXX: https://github.com/pypa/setuptools/pull/2896
-     @unittest.skipIf(APPVEYOR, "temporarily disabled due to setuptools bug")
-+    @unittest.skip("OE run this test outof source tree")
-     def test_setup_script(self):
-         setup_py = os.path.join(ROOT_DIR, 'setup.py')
-         if CI_TESTING and not os.path.exists(setup_py):
-@@ -401,6 +404,7 @@ class TestMisc(PsutilTestCase):
-                 reload_module(psutil)
-             self.assertIn("version conflict", str(cm.exception).lower())
- 
-+    @unittest.skipIf(not PSUTIL_DEBUG, "env PSUTIL_DEBUG not set")
-     def test_debug(self):
-         if PY3:
-             from io import StringIO
-diff --git a/psutil/tests/test_process.py b/psutil/tests/test_process.py
-index c9059e3..a34ba3d 100755
---- a/psutil/tests/test_process.py
-+++ b/psutil/tests/test_process.py
-@@ -36,6 +36,7 @@ from psutil._compat import PY3
- from psutil._compat import FileNotFoundError
- from psutil._compat import long
- from psutil._compat import super
-+from psutil._compat import which
- from psutil.tests import APPVEYOR
- from psutil.tests import CI_TESTING
- from psutil.tests import GITHUB_ACTIONS
-@@ -726,6 +727,7 @@ class TestProcess(PsutilTestCase):
-             self.assertEqual(' '.join(p.cmdline()), ' '.join(cmdline))
- 
-     @unittest.skipIf(PYPY, "broken on PYPY")
-+    @unittest.skipIf(not which("gcc"), "gcc not installed")
-     def test_long_cmdline(self):
-         testfn = self.get_testfn()
-         create_exe(testfn)
-@@ -740,6 +742,7 @@ class TestProcess(PsutilTestCase):
-         assert pyexe.startswith(name), (pyexe, name)
- 
-     @unittest.skipIf(PYPY, "unreliable on PYPY")
-+    @unittest.skipIf(not which("gcc"), "gcc not installed")
-     def test_long_name(self):
-         testfn = self.get_testfn(suffix="0123456789" * 2)
-         create_exe(testfn)
-@@ -750,6 +753,7 @@ class TestProcess(PsutilTestCase):
-     @unittest.skipIf(SUNOS, "broken on SUNOS")
-     @unittest.skipIf(AIX, "broken on AIX")
-     @unittest.skipIf(PYPY, "broken on PYPY")
-+    @unittest.skipIf(not which("gcc"), "gcc not installed")
-     def test_prog_w_funky_name(self):
-         # Test that name(), exe() and cmdline() correctly handle programs
-         # with funky chars such as spaces and ")", see:
-@@ -1408,6 +1412,7 @@ class TestProcess(PsutilTestCase):
- 
-     @unittest.skipIf(not HAS_ENVIRON, "not supported")
-     @unittest.skipIf(not POSIX, "POSIX only")
-+    @unittest.skipIf(not which("gcc"), "gcc not installed")
-     def test_weird_environ(self):
-         # environment variables can contain values without an equals sign
-         code = textwrap.dedent("""
-diff --git a/psutil/tests/test_system.py b/psutil/tests/test_system.py
-index db2cb34..5ee519f 100755
---- a/psutil/tests/test_system.py
-+++ b/psutil/tests/test_system.py
-@@ -580,6 +580,7 @@ class TestDiskAPIs(PsutilTestCase):
-     def test_disk_usage_bytes(self):
-         psutil.disk_usage(b'.')
- 
-+    @unittest.skip("Broken for oe")
-     def test_disk_partitions(self):
-         def check_ntuple(nt):
-             self.assertIsInstance(nt.device, str)
-diff --git a/psutil/tests/test_unicode.py b/psutil/tests/test_unicode.py
-index e635726..7ba5b0f 100755
---- a/psutil/tests/test_unicode.py
-+++ b/psutil/tests/test_unicode.py
-@@ -86,6 +86,7 @@ from psutil import POSIX
- from psutil import WINDOWS
- from psutil._compat import PY3
- from psutil._compat import u
-+from psutil._compat import which
- from psutil.tests import APPVEYOR
- from psutil.tests import ASCII_FS
- from psutil.tests import CI_TESTING
-@@ -156,7 +157,7 @@ def try_unicode(suffix):
- # FS APIs
- # ===================================================================
- 
--
-+@unittest.skipIf(not which("gcc"), "gcc not installed")
- class BaseUnicodeTest(PsutilTestCase):
-     funky_suffix = None
- 
-@@ -169,6 +170,7 @@ class BaseUnicodeTest(PsutilTestCase):
- @serialrun
- @unittest.skipIf(ASCII_FS, "ASCII fs")
- @unittest.skipIf(PYPY and not PY3, "too much trouble on PYPY2")
-+@unittest.skipIf(not which("gcc"), "gcc not installed")
- class TestFSAPIs(BaseUnicodeTest):
-     """Test FS APIs with a funky, valid, UTF8 path name."""
- 
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/python/python3-psutil_5.9.0.bb b/meta/recipes-devtools/python/python3-psutil_5.9.1.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-psutil_5.9.0.bb
rename to meta/recipes-devtools/python/python3-psutil_5.9.1.bb
index df304f01e6..04b6fb02de 100644
--- a/meta/recipes-devtools/python/python3-psutil_5.9.0.bb
+++ b/meta/recipes-devtools/python/python3-psutil_5.9.1.bb
@@ -3,12 +3,10 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e35fd9f271d19d5f742f20a9d1f8bb8b"
 HOMEPAGE = "https://pypi.org/project/psutil/"
 
-SRC_URI[sha256sum] = "869842dbd66bb80c3217158e629d6fceaecc3a3166d3d1faee515b05dd26ca25"
+SRC_URI[sha256sum] = "57f1819b5d9e95cdfb0c881a8a5b7d542ed0b7c522d575706a80bedc848c8954"
 
 inherit pypi setuptools3
 
-SRC_URI += "file://0001-fix-failure-test-cases.patch"
-
 PACKAGES =+ "${PN}-tests"
 
 FILES:${PN}-tests += " \
-- 
2.30.2


