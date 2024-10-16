Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79646D2A556
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 19:36:19 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.32037.1729107375608109929
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Oct 2024 12:36:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VGHZktT1;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42f6bec84b5so2012905e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Oct 2024 12:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729107374; x=1729712174; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sevE3wZ4T6LjKjAWhq3xJanIKnVp5aoS8Dr4WbB0Dy0=;
        b=VGHZktT1gMLg9TE525Di9p0G80n6naE4TCRWk6MyQ63jIKdjwUTIdUCUtuvLgNmQFM
         +jewbvyq6wb7gMhvWXG9ehVLMbVvhP4aE4U1sWPekws5tfav/IBdyAo4ELNWkXsPldo/
         xckJgNlop6hZ+00jsxupcS1RTV6K582cwKVeU4GPbmzEe4J13PF0xqq2M/GM9HR0cgc1
         AzPFkb5Wh5u7Ch+mtMpmN9x7Gad0ZBRXT8afwApXK3JsoFtuqJfNp5AQcHEy8nx/onRD
         gXip3j20E3kpR4om41mwsB+S2ac5D9kn/JD2xbTItuWHCR2s2A+nMwoXt2RoXbSX6jrW
         ZiYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729107374; x=1729712174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sevE3wZ4T6LjKjAWhq3xJanIKnVp5aoS8Dr4WbB0Dy0=;
        b=jEPEBBZhnPiER7Ca0wuGD0TXY/UvO6QV1tHZ3H9LzcYtaLs7bBrpWk7z2m1iITYitJ
         MtISyRARn9thR/HG60debZI3S36WOaQHbVhuY0ha1aFW7mfrs7g16nzUhWKohNyT6dWL
         d7oY2auSjeft4VgSROYkkAT3gBe3kQ50BB9bDTb1M9883ZeupMlH2ka1r22D19G+AUT1
         apDbsW2JUZX0PYeVi9+MAK3sYB8kSY3T2woTb6e8RlGe4x0+9jwK2Xh+mgKBhwzuD1On
         X74NhADe7cnB1tCi7AGEc/CNf7jEipHmSDVlZO2fwSZ35YG4pG0hAj/b4OmmBxbXYdF3
         J06Q==
X-Gm-Message-State: AOJu0Yz867p7A8xiR8oe2FPuDA10As7AlZyrP4gUhKeu0ifaeFRuSCZ3
	Bb/Ojqzvmax2Ta2uLtJXwq6PzKFeMAGjBOXt81AN5BkZCogVRMQYCLQr1g==
X-Google-Smtp-Source: AGHT+IFT+k/7xz7xvB12KULausAIcjSPloSr9lwha37PqEYekFvHeu9gCkXALFqEDDxeUaObGzY3IQ==
X-Received: by 2002:a05:600c:49a6:b0:431:55bf:fe4 with SMTP id 5b1f17b1804b1-43155bf1294mr13234405e9.24.1729107373296;
        Wed, 16 Oct 2024 12:36:13 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43158c359casm3159265e9.8.2024.10.16.12.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 12:36:12 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 5/5] python3: update 3.12.6 -> 3.13.0
Date: Wed, 16 Oct 2024 21:36:06 +0200
Message-Id: <20241016193606.3459951-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241016193606.3459951-1-alex.kanavin@gmail.com>
References: <20241016193606.3459951-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Oct 2024 19:36:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205976

From: Alexander Kanavin <alex@linutronix.de>

License-update: copyright years

Update 0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
to only include tests that do not fail under qemu (following upstream
change that also no longer obscures failures).

Drop
0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
(backport)
0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
(fixed upstream)
0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch
(code completely rewritten upstream)
cgi_py.patch
(cgi and cgitb modules removed upstream)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-recipe/python3-dir.bbclass       |   2 +-
 ...shebang-overflow-on-python-config.py.patch |   6 +-
 ...e-stdin-I-O-errors-same-way-as-maste.patch |   3 +-
 ...-use-prefix-value-from-build-configu.patch |  15 +-
 ...-qemu-wrapper-when-gathering-profile.patch |  10 +-
 ...sts-due-to-load-variability-on-YP-AB.patch |  16 +--
 ...est_sysconfig-for-posix_user-purelib.patch |   9 +-
 ...e-treat-overflow-in-UID-GID-as-failu.patch |  40 ------
 ...asename-to-replace-CC-for-checking-c.patch | 120 ----------------
 ..._fileno-test-due-to-load-variability.patch |  10 +-
 ...g.py-use-platlibdir-also-for-purelib.patch |  27 ++--
 ...ctive_children-skip-problematic-test.patch |   9 +-
 ...pes.test_find-skip-without-tools-sdk.patch |   7 +-
 ...-test_deadlock-skip-problematic-test.patch |   9 +-
 ...le.py-correct-the-test-output-format.patch |   7 +-
 ...t_readline-skip-limited-history-test.patch |  14 +-
 ...-test_shutdown-skip-problematic-test.patch |  11 +-
 ...orlines-skip-due-to-load-variability.patch |   7 +-
 ...up.py-do-not-add-a-curses-include-pa.patch |  33 -----
 .../python/python3/cgi_py.patch               |  32 -----
 .../python/python3/crosspythonpath.patch      |   7 +-
 .../python3/deterministic_imports.patch       |   7 +-
 .../python/python3/fix-armv5.patch            |  65 +++++++++
 .../python/python3/makerace.patch             |   6 +-
 .../python/python3/python3-manifest.json      | 131 ++++--------------
 .../{python3_3.12.6.bb => python3_3.13.0.bb}  |  24 ++--
 26 files changed, 191 insertions(+), 436 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch
 delete mode 100644 meta/recipes-devtools/python/python3/cgi_py.patch
 create mode 100644 meta/recipes-devtools/python/python3/fix-armv5.patch
 rename meta/recipes-devtools/python/{python3_3.12.6.bb => python3_3.13.0.bb} (96%)

diff --git a/meta/classes-recipe/python3-dir.bbclass b/meta/classes-recipe/python3-dir.bbclass
index 3d07de99b88..0f4e7e77738 100644
--- a/meta/classes-recipe/python3-dir.bbclass
+++ b/meta/classes-recipe/python3-dir.bbclass
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
 
-PYTHON_BASEVERSION = "3.12"
+PYTHON_BASEVERSION = "3.13"
 PYTHON_ABI = ""
 PYTHON_DIR = "python${PYTHON_BASEVERSION}"
 PYTHON_PN = "python3"
diff --git a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
index 0d807db39f7..d2246327f21 100644
--- a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
+++ b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
@@ -1,4 +1,4 @@
-From 365399f17d35719d828ddd49182dcb401fb7791c Mon Sep 17 00:00:00 2001
+From 6b111a328c1c57b1580d63894b2b5d337316f6d4 Mon Sep 17 00:00:00 2001
 From: Paulo Neves <ptsneves@gmail.com>
 Date: Tue, 7 Jun 2022 16:16:41 +0200
 Subject: [PATCH] Avoid shebang overflow on python-config.py
@@ -16,10 +16,10 @@ Upstream-Status: Denied [distribution]
  1 file changed, 2 insertions(+)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 77bf09a..6353c57 100644
+index 9ec3a71..f7d5382 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2339,6 +2339,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
+@@ -2606,6 +2606,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
  	@ # Substitution happens here, as the completely-expanded BINDIR
  	@ # is not available in configure
  	sed -e "s,@EXENAME@,$(EXENAME)," < $(srcdir)/Misc/python-config.in >python-config.py
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch b/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
index 026150f0e24..84ad2abb0bc 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
@@ -1,4 +1,4 @@
-From f8a664cf1fc73e381d57d6927207286059744837 Mon Sep 17 00:00:00 2001
+From 129ee75863081d9e3418acca3df1e47667f671ad Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 16 Sep 2021 16:35:37 +0200
 Subject: [PATCH] Lib/pty.py: handle stdin I/O errors same way as master I/O
@@ -24,7 +24,6 @@ So let's treat both channels the same.
 
 Upstream-Status: Submitted [https://github.com/python/cpython/pull/28388]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
 ---
  Lib/pty.py | 5 ++++-
  1 file changed, 4 insertions(+), 1 deletion(-)
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
index 680254fab99..45094481a8f 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
@@ -1,4 +1,4 @@
-From 71c194077bb907bfe423d3f3275f33a6c8ca0e74 Mon Sep 17 00:00:00 2001
+From 3f4f3e917950e286d5729ea949ca342995eb3c3e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 17 Nov 2023 14:26:32 +0100
 Subject: [PATCH] Lib/sysconfig.py: use prefix value from build configuration
@@ -9,16 +9,15 @@ native python.
 
 Upstream-Status: Inappropriate [oe-core cross builds]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
 ---
- Lib/sysconfig.py | 5 +++++
+ Lib/sysconfig/__init__.py | 5 +++++
  1 file changed, 5 insertions(+)
 
-diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
-index 79c0510..91ebcb6 100644
---- a/Lib/sysconfig.py
-+++ b/Lib/sysconfig.py
-@@ -668,6 +668,11 @@ def _init_config_vars():
+diff --git a/Lib/sysconfig/__init__.py b/Lib/sysconfig/__init__.py
+index f8e1c7d..0882526 100644
+--- a/Lib/sysconfig/__init__.py
++++ b/Lib/sysconfig/__init__.py
+@@ -481,6 +481,11 @@ def _init_config_vars():
          _CONFIG_VARS['VPATH'] = sys._vpath
      if os.name == 'posix':
          _init_posix(_CONFIG_VARS)
diff --git a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
index ee33128fa19..508754286fd 100644
--- a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
+++ b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
@@ -1,4 +1,4 @@
-From 38278339832a57dbf5fa3ef21accaa03e2c814d7 Mon Sep 17 00:00:00 2001
+From 701720a5bab5b42fd7520fd9dd95fd2c7e42c186 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 30 Jan 2019 12:41:04 +0100
 Subject: [PATCH] Makefile.pre: use qemu wrapper when gathering profile data
@@ -10,16 +10,16 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index dd5e69f..381feb0 100644
+index f9932dd..be1b9ea 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -658,8 +658,7 @@ profile-run-stamp:
+@@ -751,8 +751,7 @@ profile-run-stamp:
  	# enabled.
  	$(MAKE) profile-gen-stamp
  	# Next, run the profile task to generate the profile information.
 -	@ # FIXME: can't run for a cross build
--	$(LLVM_PROF_FILE) $(RUNSHARED) ./$(BUILDPYTHON) $(PROFILE_TASK) || true
-+	./pgo-wrapper ./python -m test.regrtest --pgo test_grammar test_opcodes test_dict test_builtin test_exceptions test_types test_support || true
+-	$(LLVM_PROF_FILE) $(RUNSHARED) ./$(BUILDPYTHON) $(PROFILE_TASK)
++	./pgo-wrapper ./python -m test.regrtest --pgo test_grammar test_opcodes test_dict test_types
  	$(LLVM_PROF_MERGER)
  	# Remove profile generation binary since we are done with it.
  	$(MAKE) clean-retain-profile
diff --git a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch b/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
index 197daa71a58..230e847d2bf 100644
--- a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
+++ b/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
@@ -1,4 +1,4 @@
-From 3471e3478e0760c42e04f8046cee2367ab5706d2 Mon Sep 17 00:00:00 2001
+From 8828a52ebace98199569404f01174398bcc64a00 Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <yifan.yu@windriver.com>
 Date: Thu, 1 Apr 2021 13:08:37 -0700
 Subject: [PATCH] Skip failing tests due to load variability on YP AB
@@ -23,7 +23,7 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  2 files changed, 5 insertions(+)
 
 diff --git a/Lib/test/_test_multiprocessing.py b/Lib/test/_test_multiprocessing.py
-index e42c7ab..dff5227 100644
+index 5dae370..23eb971 100644
 --- a/Lib/test/_test_multiprocessing.py
 +++ b/Lib/test/_test_multiprocessing.py
 @@ -682,6 +682,7 @@ class _TestProcess(BaseTestCase):
@@ -34,7 +34,7 @@ index e42c7ab..dff5227 100644
      def test_many_processes(self):
          if self.TYPE == 'threads':
              self.skipTest('test not appropriate for {}'.format(self.TYPE))
-@@ -2066,6 +2067,7 @@ class _TestBarrier(BaseTestCase):
+@@ -2083,6 +2084,7 @@ class _TestBarrier(BaseTestCase):
          except threading.BrokenBarrierError:
              results.append(True)
  
@@ -42,7 +42,7 @@ index e42c7ab..dff5227 100644
      def test_timeout(self):
          """
          Test wait(timeout)
-@@ -5024,6 +5026,7 @@ class TestWait(unittest.TestCase):
+@@ -5171,6 +5173,7 @@ class TestWait(unittest.TestCase):
          time.sleep(period)
  
      @support.requires_resource('walltime')
@@ -51,10 +51,10 @@ index e42c7ab..dff5227 100644
          from multiprocessing.connection import wait
  
 diff --git a/Lib/test/test_time.py b/Lib/test/test_time.py
-index 02cc3f4..51a4548 100644
+index 293799f..1dbb623 100644
 --- a/Lib/test/test_time.py
 +++ b/Lib/test/test_time.py
-@@ -492,6 +492,7 @@ class TimeTestCase(unittest.TestCase):
+@@ -504,6 +504,7 @@ class TimeTestCase(unittest.TestCase):
      @unittest.skipIf(
          support.is_wasi, "process_time not available on WASI"
      )
@@ -62,11 +62,11 @@ index 02cc3f4..51a4548 100644
      def test_process_time(self):
          # process_time() should not include time spend during a sleep
          start = time.process_time()
-@@ -505,6 +506,7 @@ class TimeTestCase(unittest.TestCase):
+@@ -517,6 +518,7 @@ class TimeTestCase(unittest.TestCase):
          self.assertTrue(info.monotonic)
          self.assertFalse(info.adjustable)
  
 +    @unittest.skip('timing related test, dependent on load')
      def test_thread_time(self):
          if not hasattr(time, 'thread_time'):
-             if sys.platform.startswith(('linux', 'win')):
+             if sys.platform.startswith(('linux', 'android', 'win')):
diff --git a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
index b6c6ac5a28a..b967a36e491 100644
--- a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
+++ b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
@@ -1,4 +1,4 @@
-From 37d058e841ba3bd89b5746cc5381afb014b11581 Mon Sep 17 00:00:00 2001
+From 5bf5aa6eae1fa3eed66893e51a1858ab481426b4 Mon Sep 17 00:00:00 2001
 From: Wentao Zhang <wentao.zhang@windriver.com>
 Date: Mon, 20 Mar 2023 13:39:52 +0800
 Subject: [PATCH] Update test_sysconfig for posix_user purelib
@@ -17,16 +17,15 @@ Update test_sysconfig.test_user_similar() for the posix_user scheme:
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Wentao Zhang <wentao.zhang@windriver.com>
-
 ---
  Lib/test/test_sysconfig.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Lib/test/test_sysconfig.py b/Lib/test/test_sysconfig.py
-index b6dbf3d..5672590 100644
+index 1ade492..4e94889 100644
 --- a/Lib/test/test_sysconfig.py
 +++ b/Lib/test/test_sysconfig.py
-@@ -372,7 +372,7 @@ class TestSysConfig(unittest.TestCase):
+@@ -414,7 +414,7 @@ class TestSysConfig(unittest.TestCase):
                  expected = os.path.normpath(global_path.replace(base, user, 1))
                  # bpo-44860: platlib of posix_user doesn't use sys.platlibdir,
                  # whereas posix_prefix does.
@@ -34,4 +33,4 @@ index b6dbf3d..5672590 100644
 +                if name == 'platlib' or name == 'purelib':
                      # Replace "/lib64/python3.11/site-packages" suffix
                      # with "/lib/python3.11/site-packages".
-                     py_version_short = sysconfig.get_python_version()
+                     py_version_abi = sysconfig._get_python_version_abi()
diff --git a/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch b/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
deleted file mode 100644
index 88b84c60243..00000000000
--- a/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 999d4e74d34afa233ad8ad0c70b989d77a21957f Mon Sep 17 00:00:00 2001
-From: Petr Viktorin <encukou@gmail.com>
-Date: Wed, 23 Aug 2023 20:00:07 +0200
-Subject: [PATCH] gh-107811: tarfile: treat overflow in UID/GID as failure to
- set it (#108369)
-
-Upstream-Status: Backport [https://github.com/python/cpython/pull/108369]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Lib/tarfile.py                                                 | 3 ++-
- .../Library/2023-08-23-17-34-39.gh-issue-107811.3Fng72.rst     | 3 +++
- 2 files changed, 5 insertions(+), 1 deletion(-)
- create mode 100644 Misc/NEWS.d/next/Library/2023-08-23-17-34-39.gh-issue-107811.3Fng72.rst
-
-diff --git a/Lib/tarfile.py b/Lib/tarfile.py
-index 3bbbcaa..473167d 100755
---- a/Lib/tarfile.py
-+++ b/Lib/tarfile.py
-@@ -2557,7 +2557,8 @@ class TarFile(object):
-                     os.lchown(targetpath, u, g)
-                 else:
-                     os.chown(targetpath, u, g)
--            except OSError as e:
-+            except (OSError, OverflowError) as e:
-+                # OverflowError can be raised if an ID doesn't fit in `id_t`
-                 raise ExtractError("could not change owner") from e
- 
-     def chmod(self, tarinfo, targetpath):
-diff --git a/Misc/NEWS.d/next/Library/2023-08-23-17-34-39.gh-issue-107811.3Fng72.rst b/Misc/NEWS.d/next/Library/2023-08-23-17-34-39.gh-issue-107811.3Fng72.rst
-new file mode 100644
-index 0000000..ffca413
---- /dev/null
-+++ b/Misc/NEWS.d/next/Library/2023-08-23-17-34-39.gh-issue-107811.3Fng72.rst
-@@ -0,0 +1,3 @@
-+:mod:`tarfile`: extraction of members with overly large UID or GID (e.g. on
-+an OS with 32-bit :c:type:`!id_t`) now fails in the same way as failing to
-+set the ID.
--- 
-2.45.0
-
diff --git a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
deleted file mode 100644
index bbeabe43896..00000000000
--- a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
+++ /dev/null
@@ -1,120 +0,0 @@
-From ababc7b1db8c406910766e11cdd04cbef7a706c9 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Mon, 22 Oct 2018 15:19:51 +0800
-Subject: [PATCH] python3: use cc_basename to replace CC for checking compiler
-
-When working path contains "clang"/"gcc"/"icc", it might be part of $CC
-because of the "--sysroot" parameter. That could cause judgement error
-about clang/gcc/icc compilers. e.g.
-When "icc" is containded in working path, below errors are reported when
-compiling python3:
-x86_64-wrs-linux-gcc: error: strict: No such file or directory
-x86_64-wrs-linux-gcc: error: unrecognized command line option '-fp-model'
-
-Here use cc_basename to replace CC for checking compiler to avoid such
-kind of issue.
-
-Upstream-Status: Submitted [https://github.com/python/cpython/pull/96399]
-
-Signed-off-by: Li Zhou <li.zhou@windriver.com>
-
-patch originally from Li Zhou, I just rework it to new version
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- configure.ac | 19 ++++++++++---------
- 1 file changed, 10 insertions(+), 9 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 384718d..5a1d58b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -137,6 +137,7 @@ AC_CONFIG_HEADERS([pyconfig.h])
- AC_CANONICAL_HOST
- AC_SUBST([build])
- AC_SUBST([host])
-+LT_INIT
- 
- AS_VAR_IF([cross_compiling], [maybe],
-  [AC_MSG_ERROR([Cross compiling required --host=HOST-TUPLE and --build=ARCH])]
-@@ -896,7 +897,7 @@ AC_SUBST([CXX])
- preset_cxx="$CXX"
- if test -z "$CXX"
- then
--        case "$CC" in
-+        case "$cc_basename" in
-         gcc)    AC_PATH_TOOL([CXX], [g++], [g++], [notfound]) ;;
-         cc)     AC_PATH_TOOL([CXX], [c++], [c++], [notfound]) ;;
-         clang|*/clang)     AC_PATH_TOOL([CXX], [clang++], [clang++], [notfound]) ;;
-@@ -1328,7 +1329,7 @@ rmdir CaseSensitiveTestDir
- 
- case $ac_sys_system in
- hp*|HP*)
--    case $CC in
-+    case $cc_basename in
-     cc|*/cc) CC="$CC -Ae";;
-     esac;;
- esac
-@@ -1854,7 +1855,7 @@ esac
- ],
- [AC_MSG_RESULT([no])])
- if test "$Py_LTO" = 'true' ; then
--  case $CC in
-+  case $cc_basename in
-     *clang*)
-       LDFLAGS_NOLTO="-fno-lto"
-       dnl Clang linker requires -flto in order to link objects with LTO information.
-@@ -1983,7 +1984,7 @@ then
-   fi
- fi
- LLVM_PROF_ERR=no
--case $CC in
-+case $cc_basename in
-   *clang*)
-     # Any changes made here should be reflected in the GCC+Darwin case below
-     PGO_PROF_GEN_FLAG="-fprofile-instr-generate"
-@@ -2147,7 +2148,7 @@ AC_MSG_RESULT([$BOLT_APPLY_FLAGS])
- # compiler and platform.  BASECFLAGS tweaks need to be made even if the
- # user set OPT.
- 
--case $CC in
-+case $cc_basename in
-     *clang*)
-         cc_is_clang=1
-         ;;
-@@ -2419,7 +2420,7 @@ yes)
- 
-     # ICC doesn't recognize the option, but only emits a warning
-     ## XXX does it emit an unused result warning and can it be disabled?
--    AS_CASE([$CC],
-+    AS_CASE([$cc_basename],
-             [*icc*], [ac_cv_disable_unused_result_warning=no]
-             [PY_CHECK_CC_WARNING([disable], [unused-result])])
-     AS_VAR_IF([ac_cv_disable_unused_result_warning], [yes],
-@@ -2665,7 +2666,7 @@ yes)
-     ;;
- esac
- 
--case "$CC" in
-+case "$cc_basename" in
- *mpicc*)
-     CFLAGS_NODIST="$CFLAGS_NODIST"
-     ;;
-@@ -3482,7 +3483,7 @@ then
- 		then
- 			LINKFORSHARED="-Wl,--export-dynamic"
- 		fi;;
--	SunOS/5*) case $CC in
-+	SunOS/5*) case $cc_basename in
- 		  *gcc*)
- 		    if $CC -Xlinker --help 2>&1 | grep export-dynamic >/dev/null
- 		    then
-@@ -6803,7 +6804,7 @@ if test "$ac_cv_gcc_asm_for_x87" = yes; then
-     # Some versions of gcc miscompile inline asm:
-     # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=46491
-     # http://gcc.gnu.org/ml/gcc/2010-11/msg00366.html
--    case $CC in
-+    case $cc_basename in
-         *gcc*)
-             AC_MSG_CHECKING([for gcc ipa-pure-const bug])
-             saved_cflags="$CFLAGS"
diff --git a/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch b/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
index 2d7bca6a77c..ea103bc8341 100644
--- a/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
+++ b/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
@@ -1,4 +1,4 @@
-From 217cea231462e7703e8c9ea39c0a6833f799a420 Mon Sep 17 00:00:00 2001
+From c5bdd39f8ebc4e6c58a47d7e424eac028eddb4ff Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Fri, 15 Sep 2023 08:48:33 -0400
 Subject: [PATCH] skip no_stdout_fileno test due to load variability
@@ -16,12 +16,12 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/Lib/test/test_builtin.py b/Lib/test/test_builtin.py
-index 4d03c46..b329b7a 100644
+index c5394de..ed17fb6 100644
 --- a/Lib/test/test_builtin.py
 +++ b/Lib/test/test_builtin.py
-@@ -2326,6 +2326,7 @@ class PtyTests(unittest.TestCase):
-         # Check stdin/stdout error handler is used when invoking PyOS_Readline()
-         self.check_input_tty("prompté", b"quux\xe9", "ascii")
+@@ -2435,6 +2435,7 @@ class PtyTests(unittest.TestCase):
+                          "byte 0xe9 in position 4: ordinal not in "
+                          "range(128)")
  
 +    @unittest.skip("Test may fail under heavy load")
      def test_input_no_stdout_fileno(self):
diff --git a/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch b/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch
index fc52fdac26e..b9c68a98d70 100644
--- a/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch
+++ b/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch
@@ -1,4 +1,4 @@
-From a5d429a0e1a4809c1ded7be7e45dcabeb82c53d8 Mon Sep 17 00:00:00 2001
+From bbcb17dc1ed283f41c8cd94d39f70898f0c45583 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sun, 12 Sep 2021 21:44:36 +0200
 Subject: [PATCH] sysconfig.py: use platlibdir also for purelib
@@ -8,21 +8,20 @@ is not correct.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
 ---
- Lib/sysconfig.py | 2 +-
+ Lib/sysconfig/__init__.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
-index 122d441..79c0510 100644
---- a/Lib/sysconfig.py
-+++ b/Lib/sysconfig.py
-@@ -28,7 +28,7 @@ _INSTALL_SCHEMES = {
+diff --git a/Lib/sysconfig/__init__.py b/Lib/sysconfig/__init__.py
+index 80aef34..f8e1c7d 100644
+--- a/Lib/sysconfig/__init__.py
++++ b/Lib/sysconfig/__init__.py
+@@ -29,7 +29,7 @@ _INSTALL_SCHEMES = {
      'posix_prefix': {
-         'stdlib': '{installed_base}/{platlibdir}/python{py_version_short}',
-         'platstdlib': '{platbase}/{platlibdir}/python{py_version_short}',
--        'purelib': '{base}/lib/python{py_version_short}/site-packages',
-+        'purelib': '{base}/{platlibdir}/python{py_version_short}/site-packages',
-         'platlib': '{platbase}/{platlibdir}/python{py_version_short}/site-packages',
+         'stdlib': '{installed_base}/{platlibdir}/{implementation_lower}{py_version_short}{abi_thread}',
+         'platstdlib': '{platbase}/{platlibdir}/{implementation_lower}{py_version_short}{abi_thread}',
+-        'purelib': '{base}/lib/{implementation_lower}{py_version_short}{abi_thread}/site-packages',
++        'purelib': '{base}/{platlibdir}/{implementation_lower}{py_version_short}{abi_thread}/site-packages',
+         'platlib': '{platbase}/{platlibdir}/{implementation_lower}{py_version_short}{abi_thread}/site-packages',
          'include':
-             '{installed_base}/include/python{py_version_short}{abiflags}',
+             '{installed_base}/include/{implementation_lower}{py_version_short}{abiflags}',
diff --git a/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch b/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch
index 6ebbaf10e0f..7749fcbe7df 100644
--- a/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch
@@ -1,4 +1,4 @@
-From bf3eb28bba24509a3e1cd40f1f0e26db833779a2 Mon Sep 17 00:00:00 2001
+From 540765b148d942a2339affa6c0d11445e9d0f26c Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Thu, 13 Jun 2024 10:54:31 -0400
 Subject: [PATCH] test_active_children: skip problematic test
@@ -14,10 +14,10 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/Lib/test/_test_multiprocessing.py b/Lib/test/_test_multiprocessing.py
-index 3955123455..a1861fa3a0 100644
+index 23eb971..b1295b2 100644
 --- a/Lib/test/_test_multiprocessing.py
 +++ b/Lib/test/_test_multiprocessing.py
-@@ -579,6 +579,7 @@ def test_cpu_count(self):
+@@ -579,6 +579,7 @@ class _TestProcess(BaseTestCase):
          self.assertTrue(type(cpus) is int)
          self.assertTrue(cpus >= 1)
  
@@ -25,6 +25,3 @@ index 3955123455..a1861fa3a0 100644
      def test_active_children(self):
          self.assertEqual(type(self.active_children()), list)
  
--- 
-2.45.2
-
diff --git a/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch b/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
index b4fe946cba2..68e277d662e 100644
--- a/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
@@ -1,4 +1,4 @@
-From b64c131a576a4b4f821514e711ab91b1394fb4ff Mon Sep 17 00:00:00 2001
+From 0e9d0c58e77ef540d9601ce84a1aa79d9ce6ee9b Mon Sep 17 00:00:00 2001
 From: Tim Orling <timothy.t.orling@intel.com>
 Date: Fri, 18 Jun 2021 11:56:50 -0700
 Subject: [PATCH] test_ctypes.test_find: skip without tools-sdk
@@ -10,16 +10,15 @@ easiest way to dynamically check for that is looking for
 Upstream-Status: Inappropriate [oe-specific]
 
 Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
-
 ---
  Lib/test/test_ctypes/test_find.py | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/Lib/test/test_ctypes/test_find.py b/Lib/test/test_ctypes/test_find.py
-index 1ff9d01..59def26 100644
+index 85b2861..b033203 100644
 --- a/Lib/test/test_ctypes/test_find.py
 +++ b/Lib/test/test_ctypes/test_find.py
-@@ -113,10 +113,12 @@ class FindLibraryLinux(unittest.TestCase):
+@@ -116,10 +116,12 @@ class FindLibraryLinux(unittest.TestCase):
                  # LD_LIBRARY_PATH)
                  self.assertEqual(find_library(libname), 'lib%s.so' % libname)
  
diff --git a/meta/recipes-devtools/python/python3/0001-test_deadlock-skip-problematic-test.patch b/meta/recipes-devtools/python/python3/0001-test_deadlock-skip-problematic-test.patch
index f0a7cfd39b2..3336e2913a1 100644
--- a/meta/recipes-devtools/python/python3/0001-test_deadlock-skip-problematic-test.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_deadlock-skip-problematic-test.patch
@@ -1,4 +1,4 @@
-From d7e3f26e7094fbe20e2271d75f18ac3b23a67f58 Mon Sep 17 00:00:00 2001
+From 5a44f74549b32395109342e9299510c32db71068 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Wed, 12 Jun 2024 10:29:03 -0400
 Subject: [PATCH] test_deadlock: skip problematic test
@@ -14,10 +14,10 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/Lib/test/test_concurrent_futures/test_deadlock.py b/Lib/test/test_concurrent_futures/test_deadlock.py
-index 1db4cd0099..fd07895a17 100644
+index 3c30c45..008d6c0 100644
 --- a/Lib/test/test_concurrent_futures/test_deadlock.py
 +++ b/Lib/test/test_concurrent_futures/test_deadlock.py
-@@ -90,6 +90,7 @@ def __reduce__(self):
+@@ -90,6 +90,7 @@ class ErrorAtUnpickle(object):
          return _raise_error_ignore_stderr, (UnpicklingError, )
  
  
@@ -25,6 +25,3 @@ index 1db4cd0099..fd07895a17 100644
  class ExecutorDeadlockTest:
      TIMEOUT = support.LONG_TIMEOUT
  
--- 
-2.45.2
-
diff --git a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
index 410a9fc7f17..7f03cf105f4 100644
--- a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
@@ -1,4 +1,4 @@
-From ef5728f0af14da5c9f80b0f038fe5bf6d44cb0e9 Mon Sep 17 00:00:00 2001
+From c1f3cf625c0f011060ddaa2a4096f6aa13dd1ee6 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Mon, 5 Aug 2019 15:57:39 +0800
 Subject: [PATCH] test_locale.py: correct the test output format
@@ -26,16 +26,15 @@ Upstream-Status: Submitted [https://github.com/python/cpython/pull/15132]
 Rebased for 3.9.4, still not accepted upstream Signed-off-by: Alejandro Hernandez <alejandro@enedino.org>
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
-
 ---
  Lib/test/test_locale.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Lib/test/test_locale.py b/Lib/test/test_locale.py
-index b0d7998..cb12153 100644
+index da4bd79..fd9e67d 100644
 --- a/Lib/test/test_locale.py
 +++ b/Lib/test/test_locale.py
-@@ -557,7 +557,7 @@ class TestMiscellaneous(unittest.TestCase):
+@@ -568,7 +568,7 @@ class TestMiscellaneous(unittest.TestCase):
              self.skipTest('test needs Turkish locale')
          loc = locale.getlocale(locale.LC_CTYPE)
          if verbose:
diff --git a/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch b/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
index e8d297c7219..d63c73e3340 100644
--- a/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
@@ -1,4 +1,4 @@
-From d9d916d5ea946c945323679d1709de1b87029b96 Mon Sep 17 00:00:00 2001
+From 1a0a145261ba4f97aaff3c0c656ac2e0ad9695a8 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Tue, 13 Aug 2024 11:07:05 -0400
 Subject: [PATCH] test_readline: skip limited history test
@@ -16,11 +16,11 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  Lib/test/test_readline.py | 2 ++
  1 file changed, 2 insertions(+)
 
-Index: Python-3.12.6/Lib/test/test_readline.py
-===================================================================
---- Python-3.12.6.orig/Lib/test/test_readline.py
-+++ Python-3.12.6/Lib/test/test_readline.py
-@@ -133,6 +133,7 @@ class TestHistoryManipulation (unittest.
+diff --git a/Lib/test/test_readline.py b/Lib/test/test_readline.py
+index 50e77cb..09b644a 100644
+--- a/Lib/test/test_readline.py
++++ b/Lib/test/test_readline.py
+@@ -133,6 +133,7 @@ class TestHistoryManipulation (unittest.TestCase):
          self.assertEqual(readline.get_history_item(1), "entrée 1")
          self.assertEqual(readline.get_history_item(2), "entrée 22")
  
@@ -28,7 +28,7 @@ Index: Python-3.12.6/Lib/test/test_readline.py
      def test_write_read_limited_history(self):
          previous_length = readline.get_history_length()
          self.addCleanup(readline.set_history_length, previous_length)
-@@ -371,6 +372,7 @@ readline.write_history_file(history_file
+@@ -374,6 +375,7 @@ readline.write_history_file(history_file)
          self.assertIn(b"done", output)
  
  
diff --git a/meta/recipes-devtools/python/python3/0001-test_shutdown-skip-problematic-test.patch b/meta/recipes-devtools/python/python3/0001-test_shutdown-skip-problematic-test.patch
index 1d4cda18b16..4e284de6137 100644
--- a/meta/recipes-devtools/python/python3/0001-test_shutdown-skip-problematic-test.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_shutdown-skip-problematic-test.patch
@@ -1,4 +1,4 @@
-From 9d4cdbde100798ba9fa1cf3f82dbaf18fd10a543 Mon Sep 17 00:00:00 2001
+From b678363156b5d40e09c1d138840180e3ddc7d20b Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Wed, 8 May 2024 11:58:09 -0400
 Subject: [PATCH] test_shutdown: skip problematic test
@@ -14,7 +14,7 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/Lib/test/test_concurrent_futures/test_shutdown.py b/Lib/test/test_concurrent_futures/test_shutdown.py
-index 7a4065afd4..6b878a48bf 100644
+index 7a4065a..6b878a4 100644
 --- a/Lib/test/test_concurrent_futures/test_shutdown.py
 +++ b/Lib/test/test_concurrent_futures/test_shutdown.py
 @@ -20,6 +20,7 @@ def sleep_and_print(t, msg):
@@ -25,7 +25,7 @@ index 7a4065afd4..6b878a48bf 100644
  class ExecutorShutdownTest:
      def test_run_after_shutdown(self):
          self.executor.shutdown()
-@@ -156,6 +157,7 @@ def timeout(_signum, _frame):
+@@ -156,6 +157,7 @@ class ExecutorShutdownTest:
              signal.signal(signal.SIGALRM, old_handler)
  
  
@@ -33,7 +33,7 @@ index 7a4065afd4..6b878a48bf 100644
  class ThreadPoolShutdownTest(ThreadPoolMixin, ExecutorShutdownTest, BaseTestCase):
      def test_threads_terminate(self):
          def acquire_lock(lock):
-@@ -252,6 +254,7 @@ def test_cancel_futures_wait_false(self):
+@@ -252,6 +254,7 @@ class ThreadPoolShutdownTest(ThreadPoolMixin, ExecutorShutdownTest, BaseTestCase
          self.assertIn(out.strip(), [b"apple", b""])
  
  
@@ -41,6 +41,3 @@ index 7a4065afd4..6b878a48bf 100644
  class ProcessPoolShutdownTest(ExecutorShutdownTest):
      def test_processes_terminate(self):
          def acquire_lock(lock):
--- 
-2.45.0
-
diff --git a/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch b/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch
index 0d0eb08459a..b4f873fd721 100644
--- a/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch
@@ -1,4 +1,4 @@
-From dc69a1afdb3ba619705ff71e14f19ed3142e422f Mon Sep 17 00:00:00 2001
+From 9f252a691cd335341938489da32d6e2d4620d8ca Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Fri, 6 Oct 2023 10:59:44 -0400
 Subject: [PATCH] test_storlines: skip due to load variability
@@ -11,16 +11,15 @@ Upstream-Status: Inappropriate [OE-Specific]
 [YOCTO #14933]
 
 Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
-
 ---
  Lib/test/test_ftplib.py | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/Lib/test/test_ftplib.py b/Lib/test/test_ftplib.py
-index 2f191ea..dc29346 100644
+index bed0e6d..36602be 100644
 --- a/Lib/test/test_ftplib.py
 +++ b/Lib/test/test_ftplib.py
-@@ -626,6 +626,7 @@ class TestFTPClass(TestCase):
+@@ -627,6 +627,7 @@ class TestFTPClass(TestCase):
              self.client.storbinary('stor', f, rest=r)
              self.assertEqual(self.server.handler_instance.rest, str(r))
  
diff --git a/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch b/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch
deleted file mode 100644
index 0661249bfd5..00000000000
--- a/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From d0205c60d08f51d84bd8ddc07a57e8c71710fdad Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Fri, 17 Nov 2023 14:16:40 +0100
-Subject: [PATCH] configure.ac: do not add a curses include path from the host
-
-This leads to host contamination, and particularly can cause
-curses modules to fail at runtime if the host curses is configured
-differently to native curses (observed on current OpenSuse Tumbleweed
-as dnf failures).
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- configure.ac | 6 ------
- 1 file changed, 6 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index c49cd4f..affdedf 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -6508,12 +6508,6 @@ AS_VAR_IF([have_panel], [no], [
-   AC_MSG_RESULT([$have_panel (CFLAGS: $PANEL_CFLAGS, LIBS: $PANEL_LIBS)])
- ])
- 
--# first curses header check
--ac_save_cppflags="$CPPFLAGS"
--if test "$cross_compiling" = no; then
--  CPPFLAGS="$CPPFLAGS -I/usr/include/ncursesw"
--fi
--
- # On Solaris, term.h requires curses.h
- AC_CHECK_HEADERS([term.h], [], [], [
- #ifdef HAVE_CURSES_H
diff --git a/meta/recipes-devtools/python/python3/cgi_py.patch b/meta/recipes-devtools/python/python3/cgi_py.patch
deleted file mode 100644
index 8262c88e737..00000000000
--- a/meta/recipes-devtools/python/python3/cgi_py.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From a56778372fe8dc7c42f5ffd911d89498c22dd064 Mon Sep 17 00:00:00 2001
-From: Mark Hatle <mark.hatle@windriver.com>
-Date: Wed, 21 Sep 2011 20:55:33 -0500
-Subject: [PATCH] Lib/cgi.py: Update the script as mentioned in the comment
-
-Upstream-Status: Inappropriate [distribution]
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
----
- Lib/cgi.py | 11 +----------
- 1 file changed, 1 insertion(+), 10 deletions(-)
-
-diff --git a/Lib/cgi.py b/Lib/cgi.py
-index 8787567..ebe8652 100755
---- a/Lib/cgi.py
-+++ b/Lib/cgi.py
-@@ -1,13 +1,4 @@
--#! /usr/local/bin/python
--
--# NOTE: the above "/usr/local/bin/python" is NOT a mistake.  It is
--# intentionally NOT "/usr/bin/env python".  On many systems
--# (e.g. Solaris), /usr/local/bin is not in $PATH as passed to CGI
--# scripts, and /usr/local/bin is the default directory where Python is
--# installed, so /usr/bin/env would be unable to find python.  Granted,
--# binary installations by Linux vendors often install Python in
--# /usr/bin.  So let those vendors patch cgi.py to match their choice
--# of installation.
-+#! /usr/bin/env python
- 
- """Support module for CGI (Common Gateway Interface) scripts.
- 
diff --git a/meta/recipes-devtools/python/python3/crosspythonpath.patch b/meta/recipes-devtools/python/python3/crosspythonpath.patch
index 2c4aef05111..f18898e4c4f 100644
--- a/meta/recipes-devtools/python/python3/crosspythonpath.patch
+++ b/meta/recipes-devtools/python/python3/crosspythonpath.patch
@@ -1,4 +1,4 @@
-From 5b66463c10fec1440e977d5a21a0167862d6d79c Mon Sep 17 00:00:00 2001
+From 8840438e73e43b99bc9c83896a5f950e4259738f Mon Sep 17 00:00:00 2001
 From: Ricardo Ribalda <ricardo@ribalda.com>
 Date: Tue, 18 Nov 2014 03:35:33 -0500
 Subject: [PATCH] configure.ac: add CROSSPYTHONPATH into PYTHONPATH for
@@ -14,16 +14,15 @@ Upstream-Status: Inappropriate [OE-Core integration specific]
 Credits-to: Mark Hatle <mark.hatle@windriver.com>
 Credits-to: Jackie Huang <jackie.huang@windriver.com>
 Signed-off-by: Ricardo Ribalda <ricardo@ribalda.com>
-
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index cb9e198..d81c19a 100644
+index 58f5407..5101806 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -165,7 +165,7 @@ AC_ARG_WITH([build-python],
+@@ -164,7 +164,7 @@ AC_ARG_WITH([build-python],
      dnl Build Python interpreter is used for regeneration and freezing.
      ac_cv_prog_PYTHON_FOR_REGEN=$with_build_python
      PYTHON_FOR_FREEZE="$with_build_python"
diff --git a/meta/recipes-devtools/python/python3/deterministic_imports.patch b/meta/recipes-devtools/python/python3/deterministic_imports.patch
index 2de6ae2e981..61f136ef42a 100644
--- a/meta/recipes-devtools/python/python3/deterministic_imports.patch
+++ b/meta/recipes-devtools/python/python3/deterministic_imports.patch
@@ -1,4 +1,4 @@
-From 039d5e652796b55f1132afa568c7432b6ed89afd Mon Sep 17 00:00:00 2001
+From 0a02e3b85176a5ce4dd98830bb65dac8596142e9 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 27 May 2022 17:05:44 +0100
 Subject: [PATCH] python3: Ensure stale empty python module directories don't
@@ -13,16 +13,15 @@ As a result, patch this to a behaviour which works for us.
 
 Upstream-Status: Submitted [https://github.com/python/cpython/issues/120492; need to first talk to upstream to see if they'll take one or both fixes]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
 ---
  Lib/importlib/metadata/__init__.py | 9 ++++++++-
  1 file changed, 8 insertions(+), 1 deletion(-)
 
 diff --git a/Lib/importlib/metadata/__init__.py b/Lib/importlib/metadata/__init__.py
-index 82e0ce1..969cac4 100644
+index 8ce62dd..a6ea6e9 100644
 --- a/Lib/importlib/metadata/__init__.py
 +++ b/Lib/importlib/metadata/__init__.py
-@@ -710,7 +710,14 @@ class Lookup:
+@@ -786,7 +786,14 @@ class Lookup:
          self.infos = FreezableDefaultDict(list)
          self.eggs = FreezableDefaultDict(list)
  
diff --git a/meta/recipes-devtools/python/python3/fix-armv5.patch b/meta/recipes-devtools/python/python3/fix-armv5.patch
new file mode 100644
index 00000000000..961404b24fc
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/fix-armv5.patch
@@ -0,0 +1,65 @@
+From 18b9079ddbc149d6b99c922630c246812e4d8ae7 Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Wed, 16 Oct 2024 16:48:40 +0200
+Subject: [PATCH] [3.13] gh-125444: Fix illegal instruction for older Arm
+ architectures (GH-125574) (GH-125595)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+On Arm v5 it is not possible to get the thread ID via c13 register
+hence the illegal instruction. The c13 register started to provide
+thread ID since Arm v6K architecture variant. Other variants of
+Arm v6 (T2, Z and base) don’t provide the thread ID via c13.
+For the sake of simplicity we group v5 and v6 together and
+consider that instructions for Arm v7 only.
+(cherry picked from commit feda9aa73ab95d17a291db22c416146f8e70edeb)
+
+Co-authored-by: Diego Russo <diego.russo@arm.com>
+
+Upstream-Status: Backport [https://github.com/python/cpython/commit/18b9079ddbc149d6b99c922630c246812e4d8ae7]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ Include/internal/mimalloc/mimalloc/prim.h                     | 4 ++--
+ Include/object.h                                              | 2 +-
+ .../2024-10-16-12-12-39.gh-issue-125444.9tG2X6.rst            | 1 +
+ 3 files changed, 4 insertions(+), 3 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Core_and_Builtins/2024-10-16-12-12-39.gh-issue-125444.9tG2X6.rst
+
+diff --git a/Include/internal/mimalloc/mimalloc/prim.h b/Include/internal/mimalloc/mimalloc/prim.h
+index 8a60d528458e6c..322ab29e6b41c2 100644
+--- a/Include/internal/mimalloc/mimalloc/prim.h
++++ b/Include/internal/mimalloc/mimalloc/prim.h
+@@ -151,9 +151,9 @@ static inline mi_threadid_t _mi_prim_thread_id(void) mi_attr_noexcept {
+ // If you test on another platform and it works please send a PR :-)
+ // see also https://akkadia.org/drepper/tls.pdf for more info on the TLS register.
+ #elif defined(__GNUC__) && ( \
+-           (defined(__GLIBC__)   && (defined(__x86_64__) || defined(__i386__) || defined(__arm__) || defined(__aarch64__))) \
++           (defined(__GLIBC__)   && (defined(__x86_64__) || defined(__i386__) || (defined(__arm__) && __ARM_ARCH >= 7) || defined(__aarch64__))) \
+         || (defined(__APPLE__)   && (defined(__x86_64__) || defined(__aarch64__))) \
+-        || (defined(__BIONIC__)  && (defined(__x86_64__) || defined(__i386__) || defined(__arm__) || defined(__aarch64__))) \
++        || (defined(__BIONIC__)  && (defined(__x86_64__) || defined(__i386__) || (defined(__arm__) && __ARM_ARCH >= 7) || defined(__aarch64__))) \
+         || (defined(__FreeBSD__) && (defined(__x86_64__) || defined(__i386__) || defined(__aarch64__))) \
+         || (defined(__OpenBSD__) && (defined(__x86_64__) || defined(__i386__) || defined(__aarch64__))) \
+       )
+diff --git a/Include/object.h b/Include/object.h
+index 78aa7ad0f459ff..b53f9acfebdb0c 100644
+--- a/Include/object.h
++++ b/Include/object.h
+@@ -259,7 +259,7 @@ _Py_ThreadId(void)
+     __asm__("movq %%gs:0, %0" : "=r" (tid));  // x86_64 macOSX uses GS
+ #elif defined(__x86_64__)
+    __asm__("movq %%fs:0, %0" : "=r" (tid));  // x86_64 Linux, BSD uses FS
+-#elif defined(__arm__)
++#elif defined(__arm__) && __ARM_ARCH >= 7
+     __asm__ ("mrc p15, 0, %0, c13, c0, 3\nbic %0, %0, #3" : "=r" (tid));
+ #elif defined(__aarch64__) && defined(__APPLE__)
+     __asm__ ("mrs %0, tpidrro_el0" : "=r" (tid));
+diff --git a/Misc/NEWS.d/next/Core_and_Builtins/2024-10-16-12-12-39.gh-issue-125444.9tG2X6.rst b/Misc/NEWS.d/next/Core_and_Builtins/2024-10-16-12-12-39.gh-issue-125444.9tG2X6.rst
+new file mode 100644
+index 00000000000000..13c1e745edf8d5
+--- /dev/null
++++ b/Misc/NEWS.d/next/Core_and_Builtins/2024-10-16-12-12-39.gh-issue-125444.9tG2X6.rst
+@@ -0,0 +1 @@
++Fix illegal instruction for older Arm architectures. Patch by Diego Russo, testing by Ross Burton.
diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/recipes-devtools/python/python3/makerace.patch
index c1b20703e68..f63c2307477 100644
--- a/meta/recipes-devtools/python/python3/makerace.patch
+++ b/meta/recipes-devtools/python/python3/makerace.patch
@@ -1,4 +1,4 @@
-From 9f827c29adbe656af3c8fc963fdd8f47aec0c442 Mon Sep 17 00:00:00 2001
+From 2b458b4e1bcd57e3f135d3f0e715f64b98b27906 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 13 Jul 2021 23:19:29 +0100
 Subject: [PATCH] python3: Fix make race
@@ -17,10 +17,10 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 381feb0..77bf09a 100644
+index be1b9ea..9ec3a71 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2250,7 +2250,7 @@ COMPILEALL_OPTS=-j0
+@@ -2513,7 +2513,7 @@ COMPILEALL_OPTS=-j0
  TEST_MODULES=@TEST_MODULES@
  
  .PHONY: libinstall
diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 292c5bbc5da..4b7f9cc7e33 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -103,17 +103,6 @@
         ],
         "cached": []
     },
-    "2to3": {
-        "summary": "Python automated Python 2 to 3 code translator",
-        "rdepends": [
-            "core"
-        ],
-        "files": [
-            "${bindir}/2to3*",
-            "${libdir}/python${PYTHON_MAJMIN}/lib2to3"
-        ],
-        "cached": []
-    },
     "asyncio": {
         "summary": "Python Asynchronous I/O",
         "rdepends": [
@@ -138,49 +127,21 @@
             "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/chunk.py",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/audioop.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/ossaudiodev.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/sndhdr.py",
-            "${libdir}/python${PYTHON_MAJMIN}/sunau.py",
             "${libdir}/python${PYTHON_MAJMIN}/wave.py"
         ],
         "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/chunk.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sndhdr.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sunau.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/wave.*.pyc"
         ]
     },
-    "cgitb": {
-        "summary": "Special exception handler for Python scripts",
-        "rdepends": [
-            "core",
-            "crypt",
-            "html",
-            "io",
-            "math",
-            "pydoc"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/cgitb.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/cgitb.*.pyc"
-        ]
-    },
     "codecs": {
         "summary": "Python codec",
         "rdepends": [
             "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_multibytecodec.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/xdrlib.py"
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_multibytecodec.*.so"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/xdrlib.*.pyc"
-        ]
+        "cached": []
     },
     "compile": {
         "summary": "Python bytecode compilation support",
@@ -229,8 +190,12 @@
             "${libdir}/python${PYTHON_MAJMIN}/_abcoll.py",
             "${libdir}/python${PYTHON_MAJMIN}/_bootlocale.py",
             "${libdir}/python${PYTHON_MAJMIN}/_collections_abc.py",
+            "${libdir}/python${PYTHON_MAJMIN}/_colorize.py",
             "${libdir}/python${PYTHON_MAJMIN}/_compression.py",
             "${libdir}/python${PYTHON_MAJMIN}/_markupbase.py",
+            "${libdir}/python${PYTHON_MAJMIN}/_opcode_metadata.py",
+            "${libdir}/python${PYTHON_MAJMIN}/_pyrepl",
+            "${libdir}/python${PYTHON_MAJMIN}/_pyrepl/pager.py",
             "${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.py",
             "${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.py",
             "${libdir}/python${PYTHON_MAJMIN}/_weakrefset.py",
@@ -261,6 +226,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/genericpath.py",
             "${libdir}/python${PYTHON_MAJMIN}/getopt.py",
             "${libdir}/python${PYTHON_MAJMIN}/gettext.py",
+            "${libdir}/python${PYTHON_MAJMIN}/glob.py",
             "${libdir}/python${PYTHON_MAJMIN}/heapq.py",
             "${libdir}/python${PYTHON_MAJMIN}/imp.py",
             "${libdir}/python${PYTHON_MAJMIN}/importlib",
@@ -289,6 +255,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_typing.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/array.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/binascii.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/fcntl.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/grp.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/math.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/parser.*.so",
@@ -307,7 +274,10 @@
             "${libdir}/python${PYTHON_MAJMIN}/operator.py",
             "${libdir}/python${PYTHON_MAJMIN}/optparse.py",
             "${libdir}/python${PYTHON_MAJMIN}/os.py",
+            "${libdir}/python${PYTHON_MAJMIN}/pathlib",
             "${libdir}/python${PYTHON_MAJMIN}/pathlib.py",
+            "${libdir}/python${PYTHON_MAJMIN}/pathlib/_abc.py",
+            "${libdir}/python${PYTHON_MAJMIN}/pathlib/_local.py",
             "${libdir}/python${PYTHON_MAJMIN}/pkgutil.py",
             "${libdir}/python${PYTHON_MAJMIN}/platform.py",
             "${libdir}/python${PYTHON_MAJMIN}/posixpath.py",
@@ -332,6 +302,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/struct.py",
             "${libdir}/python${PYTHON_MAJMIN}/subprocess.py",
             "${libdir}/python${PYTHON_MAJMIN}/symbol.py",
+            "${libdir}/python${PYTHON_MAJMIN}/sysconfig",
             "${libdir}/python${PYTHON_MAJMIN}/sysconfig.py",
             "${libdir}/python${PYTHON_MAJMIN}/textwrap.py",
             "${libdir}/python${PYTHON_MAJMIN}/threading.py",
@@ -351,8 +322,10 @@
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/__future__.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_bootlocale.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_collections_abc.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_colorize.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_compression.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_markupbase.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_opcode_metadata.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_sitebuiltins.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_sysconfigdata*.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_weakrefset.*.pyc",
@@ -377,6 +350,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/genericpath.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/getopt.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/gettext.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/glob.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/heapq.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/imp.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/inspect.*.pyc",
@@ -421,6 +395,8 @@
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/typing.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/warnings.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/weakref.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/_pyrepl/__pycache__",
+            "${libdir}/python${PYTHON_MAJMIN}/_pyrepl/__pycache__/pager.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/collections/__pycache__",
             "${libdir}/python${PYTHON_MAJMIN}/collections/__pycache__/abc.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/encodings/__pycache__",
@@ -432,11 +408,15 @@
             "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/abc.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/machinery.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/util.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/pathlib/__pycache__",
+            "${libdir}/python${PYTHON_MAJMIN}/pathlib/__pycache__/_abc.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/pathlib/__pycache__/_local.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/re/__pycache__",
             "${libdir}/python${PYTHON_MAJMIN}/re/__pycache__/_casefix.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/re/__pycache__/_compiler.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/re/__pycache__/_constants.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/re/__pycache__/_parser.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/sysconfig/__pycache__",
             "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__",
             "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__/parse.*.pyc"
         ]
@@ -444,15 +424,11 @@
     "crypt": {
         "summary": "Python basic cryptographic and hashing support",
         "rdepends": [
-            "core",
-            "math",
-            "stringold"
+            "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/crypt.py",
             "${libdir}/python${PYTHON_MAJMIN}/hashlib.py",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_blake2.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_crypt.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_hashlib.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_md5.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha1.*.so",
@@ -460,7 +436,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha3.*.so"
         ],
         "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/crypt.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/hashlib.*.pyc"
         ]
     },
@@ -468,7 +443,6 @@
         "summary": "Python C types support",
         "rdepends": [
             "core",
-            "crypt",
             "io",
             "math"
         ],
@@ -590,7 +564,6 @@
         "summary": "Python email support",
         "rdepends": [
             "core",
-            "crypt",
             "datetime",
             "io",
             "math",
@@ -663,36 +636,30 @@
             "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/colorsys.py",
-            "${libdir}/python${PYTHON_MAJMIN}/imghdr.py"
+            "${libdir}/python${PYTHON_MAJMIN}/colorsys.py"
         ],
         "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/colorsys.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/imghdr.*.pyc"
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/colorsys.*.pyc"
         ]
     },
     "io": {
         "summary": "Python low-level I/O",
         "rdepends": [
             "core",
-            "crypt",
             "math",
-            "netclient",
-            "shell"
+            "netclient"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/_pyio.py",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_socket.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_ssl.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/termios.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/pipes.py",
             "${libdir}/python${PYTHON_MAJMIN}/socket.py",
             "${libdir}/python${PYTHON_MAJMIN}/ssl.py",
             "${libdir}/python${PYTHON_MAJMIN}/tempfile.py"
         ],
         "cached": [
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_pyio.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pipes.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/socket.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ssl.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tempfile.*.pyc"
@@ -728,7 +695,6 @@
         "summary": "Python mailbox format support",
         "rdepends": [
             "core",
-            "crypt",
             "datetime",
             "email",
             "io",
@@ -747,8 +713,7 @@
     "math": {
         "summary": "Python math support",
         "rdepends": [
-            "core",
-            "crypt"
+            "core"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_random.*.so",
@@ -765,12 +730,10 @@
             "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/quopri.py",
-            "${libdir}/python${PYTHON_MAJMIN}/uu.py"
+            "${libdir}/python${PYTHON_MAJMIN}/quopri.py"
         ],
         "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/quopri.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/uu.*.pyc"
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/quopri.*.pyc"
         ]
     },
     "mmap": {
@@ -787,7 +750,6 @@
         "cached": [],
         "files": [],
         "rdepends": [
-            "2to3",
             "asyncio",
             "audio",
             "codecs",
@@ -884,11 +846,9 @@
             "${libdir}/python${PYTHON_MAJMIN}/http/__pycache__",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_uuid.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/mimetypes.py",
-            "${libdir}/python${PYTHON_MAJMIN}/nntplib.py",
             "${libdir}/python${PYTHON_MAJMIN}/poplib.py",
             "${libdir}/python${PYTHON_MAJMIN}/secrets.py",
             "${libdir}/python${PYTHON_MAJMIN}/smtplib.py",
-            "${libdir}/python${PYTHON_MAJMIN}/telnetlib.py",
             "${libdir}/python${PYTHON_MAJMIN}/urllib",
             "${libdir}/python${PYTHON_MAJMIN}/uuid.py"
         ],
@@ -897,11 +857,9 @@
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ftplib.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/hmac.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/mimetypes.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/nntplib.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/poplib.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/secrets.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/smtplib.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/telnetlib.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/uuid.*.pyc"
         ]
     },
@@ -909,22 +867,12 @@
         "summary": "Python Internet Protocol servers",
         "rdepends": [
             "core",
-            "crypt",
-            "datetime",
-            "email",
-            "html",
-            "io",
-            "math",
-            "mime",
-            "netclient",
-            "stringold"
+            "io"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/cgi.py",
             "${libdir}/python${PYTHON_MAJMIN}/socketserver.py"
         ],
         "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/cgi.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/socketserver.*.pyc"
         ]
     },
@@ -1052,12 +1000,10 @@
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/cmd.py",
-            "${libdir}/python${PYTHON_MAJMIN}/glob.py",
             "${libdir}/python${PYTHON_MAJMIN}/shlex.py"
         ],
         "cached": [
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/cmd.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/glob.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/shlex.*.pyc"
         ]
     },
@@ -1077,7 +1023,6 @@
         "summary": "Basic statistics module",
         "rdepends": [
             "core",
-            "crypt",
             "math",
             "numbers"
         ],
@@ -1147,7 +1092,6 @@
             "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/tkinter"
         ],
         "cached": []
@@ -1162,18 +1106,6 @@
         ],
         "cached": []
     },
-    "turtle": {
-        "summary": "Turtle graphics is a popular way for introducing programming to kids.",
-        "rdepends": [
-            "tkinter"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/turtle.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/turtle.*.pyc"
-        ]
-     },
     "unittest": {
         "summary": "Python unit testing framework",
         "rdepends": [
@@ -1201,8 +1133,7 @@
             "io"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/getpass.py",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/nis.*.so"
+            "${libdir}/python${PYTHON_MAJMIN}/getpass.py"
         ],
         "cached": [
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/getpass.*.pyc"
@@ -1238,12 +1169,10 @@
         "rdepends": [
             "compression",
             "core",
-            "crypt",
             "datetime",
             "email",
             "html",
             "io",
-            "math",
             "mime",
             "netclient",
             "netserver",
diff --git a/meta/recipes-devtools/python/python3_3.12.6.bb b/meta/recipes-devtools/python/python3_3.13.0.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3_3.12.6.bb
rename to meta/recipes-devtools/python/python3_3.13.0.bb
index 858124d104f..54742f5257b 100644
--- a/meta/recipes-devtools/python/python3_3.12.6.bb
+++ b/meta/recipes-devtools/python/python3_3.13.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "Python is a programming language that lets you work more quickly
 LICENSE = "PSF-2.0"
 SECTION = "devel/python"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3f64a4ff490f884d562feb77bf2435f1"
 
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://run-ptest \
@@ -13,12 +13,9 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://python3-manifest.json \
            file://check_build_completeness.py \
            file://reformat_sysconfig.py \
-           file://cgi_py.patch \
            file://0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch \
-           file://0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch \
            file://crosspythonpath.patch \
            file://0001-test_locale.py-correct-the-test-output-format.patch \
-           file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
            file://0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch \
            file://0001-test_ctypes.test_find-skip-without-tools-sdk.patch \
            file://makerace.patch \
@@ -30,17 +27,17 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-skip-no_stdout_fileno-test-due-to-load-variability.patch \
            file://0001-test_storlines-skip-due-to-load-variability.patch \
            file://0001-test_shutdown-skip-problematic-test.patch \
-           file://0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch \
-	   file://0001-test_deadlock-skip-problematic-test.patch \
-	   file://0001-test_active_children-skip-problematic-test.patch \
+           file://0001-test_deadlock-skip-problematic-test.patch \
+           file://0001-test_active_children-skip-problematic-test.patch \
            file://0001-test_readline-skip-limited-history-test.patch \
+           file://fix-armv5.patch \
            "
 
 SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "1999658298cf2fb837dffed8ff3c033ef0c98ef20cf73c5d5f66bed5ab89697c"
+SRC_URI[sha256sum] = "086de5882e3cb310d4dca48457522e2e48018ecd43da9cdf827f6a0759efb07d"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
@@ -55,7 +52,7 @@ CVE_STATUS[CVE-2022-26488] = "not-applicable-platform: Issue only applies on Win
 CVE_STATUS[CVE-2015-20107] = "upstream-wontfix: The mailcap module is insecure by design, so this can't be fixed in a meaningful way"
 CVE_STATUS[CVE-2023-36632] = "disputed: Not an issue, in fact expected behaviour"
 
-PYTHON_MAJMIN = "3.12"
+PYTHON_MAJMIN = "3.13"
 
 S = "${WORKDIR}/Python-${PV}"
 
@@ -91,6 +88,10 @@ CACHED_CONFIGUREVARS = " \
                 ac_cv_file__dev_ptc=no \
                 ac_cv_working_tzset=yes \
 "
+CACHED_CONFIGUREVARS:append:class-target = " \
+                ac_cv_libatomic_needed=yes \
+"
+
 # set thread stack size to 2MB on musl for interpreter and stdlib C extensions
 # so it does not run into stack limits due to musl's small thread stack
 # This is only needed to build interpreter and not the subsequent modules
@@ -384,6 +385,7 @@ python(){
     # Prepending so to avoid python-misc getting everything
     packages = newpackages + packages
     d.setVar('PACKAGES', ' '.join(packages))
+    d.setVar('ALLOW_EMPTY:${PN}-fcntl', '1')
     d.setVar('ALLOW_EMPTY:${PN}-modules', '1')
     d.setVar('ALLOW_EMPTY:${PN}-pkgutil', '1')
 
@@ -403,6 +405,8 @@ do_create_manifest() {
     # be present, we must ensure it is.
 
     cp ${UNPACKDIR}/create_manifest3.py ${WORKDIR}
+    cp ${UNPACKDIR}/python3-manifest.json ${WORKDIR}
+    cp ${UNPACKDIR}/get_module_deps3.py ${WORKDIR}
     cd ${WORKDIR}
     # This needs to be executed by python-native and NOT by HOST's python
     nativepython3 create_manifest3.py ${PYTHON_MAJMIN}
@@ -458,7 +462,7 @@ FILES:${PN}-man = "${datadir}/man"
 # See https://bugs.python.org/issue18748 and https://bugs.python.org/issue37395
 RDEPENDS:libpython3:append:libc-glibc = " libgcc"
 RDEPENDS:${PN}-ctypes:append:libc-glibc = " ${MLPREFIX}ldconfig"
-RDEPENDS:${PN}-ptest = "${PN}-modules ${PN}-tests ${PN}-dev ${PN}-cgitb ${PN}-zipapp unzip bzip2 libgcc tzdata coreutils sed gcc g++ binutils \
+RDEPENDS:${PN}-ptest = "${PN}-modules ${PN}-tests ${PN}-dev ${PN}-zipapp unzip bzip2 libgcc tzdata coreutils sed gcc g++ binutils \
                         locale-base-fr-fr locale-base-en-us locale-base-de-de"
 RDEPENDS:${PN}-ptest:append:libc-glibc = " locale-base-tr-tr"
 RDEPENDS:${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', '${MLPREFIX}tk ${MLPREFIX}tk-lib', '', d)}"
-- 
2.39.5


