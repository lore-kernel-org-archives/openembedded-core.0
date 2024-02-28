Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82773C54E41
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:52 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.8430.1709105624289238093
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=U90XfmRa;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105624; x=1740641624;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GWvI3BpSzAEJIDSuucEfkSPPgxikdqnGkkCANrf2SRY=;
  b=U90XfmRaluq2eGDgESnwkximpNGAk/9WEJPJvcfbibof15kNHQoTOGut
   OmibgzxedykekGVIG0z3HwbWsJVNqDXNViPGU6QT4yOvrIVBRsW8NMX0T
   Q1OnLYrEKdjgQWS14Kf7nnseyk/5198bil05MfYWm+EOz/+V2NTZMStjx
   iLDlHQmy4aiV56GAHoZjk7VFQSrKBgZ+UhXHc4ByZXWO7ym6rb8oBUNNE
   wiYUApNtv3KTgUNTsAX8ycANrsaN4SuetkB7x6s6uMhW0VeZL+BtWwqsI
   87gIhcoIGXsYNQEDc94ClSahu2MuQenXeZOhWQnMz5IrzdlBluijtJhGt
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="139129178"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="139129178"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:41 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 98A1CE8CE4
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:39 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id CF7B3304E2
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:38 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 557CD41180
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:38 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F23371A006A;
	Wed, 28 Feb 2024 15:33:37 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 42/48] python3: upgrade 3.12.1 -> 3.12.2
Date: Wed, 28 Feb 2024 15:32:49 +0800
Message-Id: <1709105575-24259-42-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10--32.988400-10.000000
X-TMASE-MatchedRID: vKhHPp3m4mKjz0nOeth/yYldKbZsGYat1QQ6Jx/fflb+Aw16GgqpO2wv
	XTkGdY2nnLxlXh5nX2OYPsTBEa9DWf12TsqRMnfHQgjHANpTmasGAD6h6FZmEd9RlPzeVuQQ1vZ
	7s3YIVDL7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgEdkXOA+YC9LtXl9IxEPXOoPvN
	iZLos3H6hf9szwmti5uGvarJbfwHtKpIM6MfwkGrixxDRpftwPgbNN0R684zPckT01s4XfLqTzq
	4wH3yI2yZOnz913gYU4FVJeMplGi/RkvXpVnKiuGqSG/c50XgNpkBMYDn8FeOZYcdJgScjxDqSC
	wuHpWJNyhEbsob8Kax8GSwQM8TG4r8SWmHOl/Ut85pjA/x1xfuOaAxDXuHnradstfHk0/23T0Pp
	HDbMis7Y6y7HHamv163smvwVtnbqInHjrjZy8ltDcymdiVMdWBGvINcfHqhdOeMm3G6m0TZGGU2
	vUNnkjgcDogF3e9Cxr9XcWWXaWPmPTscoO5/fPxOIv4/oKgyC/XAJUFuWKa2g57jYcpVEODuhhx
	8YYGQ8X0jceDJtHITKHYLsR4q0Lv1l2Uvx6idpr34lUqic7tw1fU1q220JrKrauXd3MZDUMFsa+
	1wyh/JRMZUCEHkRt
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196369

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Avoid-shebang-overflow-on-python-config.py.patch
0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
0001-gh-114492-Initialize-struct-termios-before-calling-t.patch
0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
0001-test_xml_etree.py-Fix-for-Expat-2.6.0-with-reparse-d.patch
0020-configure.ac-setup.py-do-not-add-a-c
refreshed for 3.12.2

Changelog:
 https://docs.python.org/3.12/whatsnew/3.12.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...shebang-overflow-on-python-config.py.patch |  7 +++---
 ...-qemu-wrapper-when-gathering-profile.patch |  7 +++---
 ...sts-due-to-load-variability-on-YP-AB.patch |  7 +++---
 ...lize-struct-termios-before-calling-t.patch | 24 ++++---------------
 ...asename-to-replace-CC-for-checking-c.patch |  7 +++---
 ..._fileno-test-due-to-load-variability.patch |  7 +++---
 ...y-Fix-for-Expat-2.6.0-with-reparse-d.patch | 14 +++++------
 ...up.py-do-not-add-a-curses-include-pa.patch |  7 +++---
 .../python/python3/makerace.patch             |  7 +++---
 .../{python3_3.12.1.bb => python3_3.12.2.bb}  |  2 +-
 10 files changed, 32 insertions(+), 57 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.12.1.bb => python3_3.12.2.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
index 03ecda98c2..0d807db39f 100644
--- a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
+++ b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
@@ -1,4 +1,4 @@
-From 33bf96f31c4873032ace2cc9afacc3785997527a Mon Sep 17 00:00:00 2001
+From 365399f17d35719d828ddd49182dcb401fb7791c Mon Sep 17 00:00:00 2001
 From: Paulo Neves <ptsneves@gmail.com>
 Date: Tue, 7 Jun 2022 16:16:41 +0200
 Subject: [PATCH] Avoid shebang overflow on python-config.py
@@ -11,16 +11,15 @@ Denial reason: [1]
 Upstream-Status: Denied [distribution]
 
 [1] https://github.com/python/cpython/pull/93760#pullrequestreview-1005365737
-
 ---
  Makefile.pre.in | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index fb0b525..75d2e73 100644
+index 77bf09a..6353c57 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2335,6 +2335,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
+@@ -2339,6 +2339,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
  	@ # Substitution happens here, as the completely-expanded BINDIR
  	@ # is not available in configure
  	sed -e "s,@EXENAME@,$(EXENAME)," < $(srcdir)/Misc/python-config.in >python-config.py
diff --git a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
index 158cbf8ee0..ee33128fa1 100644
--- a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
+++ b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
@@ -1,20 +1,19 @@
-From ea8e486a416b90c562f3b33faa91d9d1d030be0e Mon Sep 17 00:00:00 2001
+From 38278339832a57dbf5fa3ef21accaa03e2c814d7 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 30 Jan 2019 12:41:04 +0100
 Subject: [PATCH] Makefile.pre: use qemu wrapper when gathering profile data
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  Makefile.pre.in | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 7af1845..fc7ab79 100644
+index dd5e69f..381feb0 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -656,8 +656,7 @@ profile-run-stamp:
+@@ -658,8 +658,7 @@ profile-run-stamp:
  	# enabled.
  	$(MAKE) profile-gen-stamp
  	# Next, run the profile task to generate the profile information.
diff --git a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch b/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
index edb85395ff..197daa71a5 100644
--- a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
+++ b/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
@@ -1,4 +1,4 @@
-From bafdd769330c9d49a066fb1427f451b8d253262d Mon Sep 17 00:00:00 2001
+From 3471e3478e0760c42e04f8046cee2367ab5706d2 Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <yifan.yu@windriver.com>
 Date: Thu, 1 Apr 2021 13:08:37 -0700
 Subject: [PATCH] Skip failing tests due to load variability on YP AB
@@ -17,14 +17,13 @@ Skip two additional tests due to suspected load variability failures.
 [YOCTO #15177]
 
 Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
-
 ---
  Lib/test/_test_multiprocessing.py | 3 +++
  Lib/test/test_time.py             | 2 ++
  2 files changed, 5 insertions(+)
 
 diff --git a/Lib/test/_test_multiprocessing.py b/Lib/test/_test_multiprocessing.py
-index d52b10c..5f0e4e3 100644
+index e42c7ab..dff5227 100644
 --- a/Lib/test/_test_multiprocessing.py
 +++ b/Lib/test/_test_multiprocessing.py
 @@ -682,6 +682,7 @@ class _TestProcess(BaseTestCase):
@@ -43,7 +42,7 @@ index d52b10c..5f0e4e3 100644
      def test_timeout(self):
          """
          Test wait(timeout)
-@@ -4992,6 +4994,7 @@ class TestWait(unittest.TestCase):
+@@ -5024,6 +5026,7 @@ class TestWait(unittest.TestCase):
          time.sleep(period)
  
      @support.requires_resource('walltime')
diff --git a/meta/recipes-devtools/python/python3/0001-gh-114492-Initialize-struct-termios-before-calling-t.patch b/meta/recipes-devtools/python/python3/0001-gh-114492-Initialize-struct-termios-before-calling-t.patch
index 141b708a67..8406ef30a2 100644
--- a/meta/recipes-devtools/python/python3/0001-gh-114492-Initialize-struct-termios-before-calling-t.patch
+++ b/meta/recipes-devtools/python/python3/0001-gh-114492-Initialize-struct-termios-before-calling-t.patch
@@ -1,8 +1,9 @@
-From bd0e1bf1504a5cba12133548bc49f1fcaf7b4da2 Mon Sep 17 00:00:00 2001
+From 439aa02f42d6e6715c172076261757fcb89a936a Mon Sep 17 00:00:00 2001
 From: "Miss Islington (bot)"
  <31488909+miss-islington@users.noreply.github.com>
 Date: Tue, 23 Jan 2024 23:02:02 +0100
-Subject: [PATCH] gh-114492: Initialize struct termios before calling tcgetattr() (GH-114495) (GH-114502)
+Subject: [PATCH] gh-114492: Initialize struct termios before calling
+ tcgetattr() (GH-114495) (GH-114502)
 
 On Alpine Linux it could leave some field non-initialized.
 (cherry picked from commit d22c066b802592932f9eb18434782299e80ca42e)
@@ -12,8 +13,7 @@ Co-authored-by: Serhiy Storchaka <storchaka@gmail.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  .../next/Library/2024-01-23-21-20-40.gh-issue-114492.vKxl5o.rst | 2 ++
- Modules/termios.c                                               | 2 ++
- 2 files changed, 4 insertions(+)
+ 1 file changed, 2 insertions(+)
  create mode 100644 Misc/NEWS.d/next/Library/2024-01-23-21-20-40.gh-issue-114492.vKxl5o.rst
 
 diff --git a/Misc/NEWS.d/next/Library/2024-01-23-21-20-40.gh-issue-114492.vKxl5o.rst b/Misc/NEWS.d/next/Library/2024-01-23-21-20-40.gh-issue-114492.vKxl5o.rst
@@ -24,19 +24,3 @@ index 0000000..8df8299
 @@ -0,0 +1,2 @@
 +Make the result of :func:`termios.tcgetattr` reproducible on Alpine Linux.
 +Previously it could leave a random garbage in some fields.
-diff --git a/Modules/termios.c b/Modules/termios.c
-index c3d96cc..402e6ac 100644
---- a/Modules/termios.c
-+++ b/Modules/termios.c
-@@ -84,6 +84,8 @@ termios_tcgetattr_impl(PyObject *module, int fd)
-     struct termios mode;
-     int r;
- 
-+    /* Alpine Linux can leave some fields uninitialized. */
-+    memset(&mode, 0, sizeof(mode));
-     Py_BEGIN_ALLOW_THREADS
-     r = tcgetattr(fd, &mode);
-     Py_END_ALLOW_THREADS
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
index d668858066..bbeabe4389 100644
--- a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
+++ b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
@@ -1,4 +1,4 @@
-From 0558745601cc72c8d6d79cd691f4b82330b29d58 Mon Sep 17 00:00:00 2001
+From ababc7b1db8c406910766e11cdd04cbef7a706c9 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 22 Oct 2018 15:19:51 +0800
 Subject: [PATCH] python3: use cc_basename to replace CC for checking compiler
@@ -21,13 +21,12 @@ Signed-off-by: Li Zhou <li.zhou@windriver.com>
 patch originally from Li Zhou, I just rework it to new version
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
 ---
  configure.ac | 19 ++++++++++---------
  1 file changed, 10 insertions(+), 9 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index bd2be94..cb9e198 100644
+index 384718d..5a1d58b 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -137,6 +137,7 @@ AC_CONFIG_HEADERS([pyconfig.h])
@@ -110,7 +109,7 @@ index bd2be94..cb9e198 100644
  		  *gcc*)
  		    if $CC -Xlinker --help 2>&1 | grep export-dynamic >/dev/null
  		    then
-@@ -6802,7 +6803,7 @@ if test "$ac_cv_gcc_asm_for_x87" = yes; then
+@@ -6803,7 +6804,7 @@ if test "$ac_cv_gcc_asm_for_x87" = yes; then
      # Some versions of gcc miscompile inline asm:
      # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=46491
      # http://gcc.gnu.org/ml/gcc/2010-11/msg00366.html
diff --git a/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch b/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
index cd112c06a8..2d7bca6a77 100644
--- a/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
+++ b/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
@@ -1,4 +1,4 @@
-From 23184742b009ef1a8b2c0c2d79515334d4450cb9 Mon Sep 17 00:00:00 2001
+From 217cea231462e7703e8c9ea39c0a6833f799a420 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Fri, 15 Sep 2023 08:48:33 -0400
 Subject: [PATCH] skip no_stdout_fileno test due to load variability
@@ -11,16 +11,15 @@ Upstream-Status: Inappropriate [OE-Specific]
 [YOCTO #15210]
 
 Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
-
 ---
  Lib/test/test_builtin.py | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/Lib/test/test_builtin.py b/Lib/test/test_builtin.py
-index de83b52..ba98fe8 100644
+index 4d03c46..b329b7a 100644
 --- a/Lib/test/test_builtin.py
 +++ b/Lib/test/test_builtin.py
-@@ -2300,6 +2300,7 @@ class PtyTests(unittest.TestCase):
+@@ -2326,6 +2326,7 @@ class PtyTests(unittest.TestCase):
          # Check stdin/stdout error handler is used when invoking PyOS_Readline()
          self.check_input_tty("prompté", b"quux\xe9", "ascii")
  
diff --git a/meta/recipes-devtools/python/python3/0001-test_xml_etree.py-Fix-for-Expat-2.6.0-with-reparse-d.patch b/meta/recipes-devtools/python/python3/0001-test_xml_etree.py-Fix-for-Expat-2.6.0-with-reparse-d.patch
index 415db4bc5b..598ef08cc4 100644
--- a/meta/recipes-devtools/python/python3/0001-test_xml_etree.py-Fix-for-Expat-2.6.0-with-reparse-d.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_xml_etree.py-Fix-for-Expat-2.6.0-with-reparse-d.patch
@@ -1,7 +1,8 @@
-From 51a048251c552d9ead29a2a3e4884c138fcf9c1c Mon Sep 17 00:00:00 2001
+From d07ca7fbd874e230dec4d4c6d650a66ea2a9008e Mon Sep 17 00:00:00 2001
 From: Sebastian Pipping <sebastian@pipping.org>
 Date: Wed, 7 Feb 2024 15:32:45 +0100
-Subject: [PATCH] test_xml_etree.py: Fix for Expat >=2.6.0 with reparse deferral
+Subject: [PATCH] test_xml_etree.py: Fix for Expat >=2.6.0 with reparse
+ deferral
 
 Upstream-Status: Submitted [https://github.com/python/cpython/pull/115138]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
@@ -12,10 +13,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  create mode 100644 Misc/NEWS.d/next/Tests/2024-02-07-15-49-37.gh-issue-115133.WBajNr.rst
 
 diff --git a/Lib/test/test_xml_etree.py b/Lib/test/test_xml_etree.py
-index 53a4e9f..9a0119c 100644
+index b50898f..4578367 100644
 --- a/Lib/test/test_xml_etree.py
 +++ b/Lib/test/test_xml_etree.py
-@@ -1401,6 +1401,7 @@ class XMLPullParserTest(unittest.TestCase):
+@@ -1403,6 +1403,7 @@ class XMLPullParserTest(unittest.TestCase):
      def test_simple_xml(self):
          for chunk_size in (None, 1, 5):
              with self.subTest(chunk_size=chunk_size):
@@ -23,7 +24,7 @@ index 53a4e9f..9a0119c 100644
                  parser = ET.XMLPullParser()
                  self.assert_event_tags(parser, [])
                  self._feed(parser, "<!-- comment -->\n", chunk_size)
-@@ -1410,16 +1411,17 @@ class XMLPullParserTest(unittest.TestCase):
+@@ -1412,16 +1413,17 @@ class XMLPullParserTest(unittest.TestCase):
                             chunk_size)
                  self.assert_event_tags(parser, [])
                  self._feed(parser, ">\n", chunk_size)
@@ -52,6 +53,3 @@ index 0000000..4dc9c13
 +++ b/Misc/NEWS.d/next/Tests/2024-02-07-15-49-37.gh-issue-115133.WBajNr.rst
 @@ -0,0 +1 @@
 +Fix etree XMLPullParser tests for Expat >=2.6.0 with reparse deferral
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch b/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch
index ed1c1b9975..0661249bfd 100644
--- a/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch
+++ b/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch
@@ -1,4 +1,4 @@
-From 1438c3694665961aa9c478727846343ad31fa133 Mon Sep 17 00:00:00 2001
+From d0205c60d08f51d84bd8ddc07a57e8c71710fdad Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 17 Nov 2023 14:16:40 +0100
 Subject: [PATCH] configure.ac: do not add a curses include path from the host
@@ -10,16 +10,15 @@ as dnf failures).
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  configure.ac | 6 ------
  1 file changed, 6 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index d81c19a..b15b765 100644
+index c49cd4f..affdedf 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -6507,12 +6507,6 @@ AS_VAR_IF([have_panel], [no], [
+@@ -6508,12 +6508,6 @@ AS_VAR_IF([have_panel], [no], [
    AC_MSG_RESULT([$have_panel (CFLAGS: $PANEL_CFLAGS, LIBS: $PANEL_LIBS)])
  ])
  
diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/recipes-devtools/python/python3/makerace.patch
index c813b3975b..c1b20703e6 100644
--- a/meta/recipes-devtools/python/python3/makerace.patch
+++ b/meta/recipes-devtools/python/python3/makerace.patch
@@ -1,4 +1,4 @@
-From c1badb04004c78f376f77f8c41718d51947bf873 Mon Sep 17 00:00:00 2001
+From 9f827c29adbe656af3c8fc963fdd8f47aec0c442 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 13 Jul 2021 23:19:29 +0100
 Subject: [PATCH] python3: Fix make race
@@ -12,16 +12,15 @@ Add a dependency to avoid the race.
 
 Upstream-Status: Pending
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
 ---
  Makefile.pre.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index fc7ab79..fb0b525 100644
+index 381feb0..77bf09a 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2246,7 +2246,7 @@ COMPILEALL_OPTS=-j0
+@@ -2250,7 +2250,7 @@ COMPILEALL_OPTS=-j0
  TEST_MODULES=@TEST_MODULES@
  
  .PHONY: libinstall
diff --git a/meta/recipes-devtools/python/python3_3.12.1.bb b/meta/recipes-devtools/python/python3_3.12.2.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.12.1.bb
rename to meta/recipes-devtools/python/python3_3.12.2.bb
index b4916d8cef..61991cd8e9 100644
--- a/meta/recipes-devtools/python/python3_3.12.1.bb
+++ b/meta/recipes-devtools/python/python3_3.12.2.bb
@@ -37,7 +37,7 @@ SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "8dfb8f426fcd226657f9e2bd5f1e96e53264965176fa17d32658e873591aeb21"
+SRC_URI[sha256sum] = "be28112dac813d2053545c14bf13a16401a21877f1a69eb6ea5d84c4a0f3d870"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.34.1


