Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 381BDC3DA47
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 16:57:59 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.2191.1719853076876905683
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 09:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=XPAukySY;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=eduB+2RG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101906f3b4cb1-3c361be9-be12-4f41-822a-7adeb87bf178-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1719853076;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3N2qj39vh9AUUoQUsz+3QAK2oUUxfdlMBgKVLdz1Pj4=;
	b=XPAukySYlwgGB6ctdDHaueaa7rbPhhXGyb1Kafy9LABDjcQ9yh/ep8NoINBLQrdb
	By4J8wzIESWJXBdmiJw7S/qTpr+g7oj0Q8Huld1o4LDZeVqu4lylJHQIm4l3TEP9iFY
	Ftu+zyExL2r4RpY+42vEz9PL+dpDq3yRqY1WfnUU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1719853076;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3N2qj39vh9AUUoQUsz+3QAK2oUUxfdlMBgKVLdz1Pj4=;
	b=eduB+2RGFv5GuwP8IToUKVRYeyjvtV9tEg46kMG91sJsnEL5CnAsw4ShuIRSK2BQ
	3p45zkXWGDLTK1xLvNhccvDNV02StGlY6mCZIo19308CFq6lDX3E0g2rH0ZmPuBV8BG
	ejvNhOZ7K3OVvxI6I9kCTq1BtUQQmfBvJPS9S76U=
Content-Type: multipart/mixed; boundary="===============1477033128033431261=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-numpy: upgrading to 2.0.0 FAILED
Message-ID: <010101906f3b4cb1-3c361be9-be12-4f41-822a-7adeb87bf178-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jul 2024 16:57:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 16:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201365

--===============1477033128033431261==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-numpy* to *2.0.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-numpy-upgrade-1.26.4-2.0.0.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From e5689ac5a95dd1fcac3f4bfb2bb868c025e7f942 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jul 2024 08:55:19 +0000
Subject: [PATCH] python3-numpy: upgrade 1.26.4 -> 2.0.0

---
 ...-and-so-on-for-libraries-by-default-.patch |  5 ++--
 ...1-numpy-core-Define-RISCV-32-support.patch | 23 ++++++++-----------
 .../python3-numpy/fix_reproducibility.patch   | 23 ++++++++++++-------
 ...numpy_1.26.4.bb => python3-numpy_2.0.0.bb} | 23 +++++++++++++++++--
 4 files changed, 48 insertions(+), 26 deletions(-)
 rename meta/recipes-devtools/python/{python3-numpy_1.26.4.bb => python3-numpy_2.0.0.bb} (73%)

diff --git a/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
index bbe309c556..d8038593ff 100644
--- a/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
+++ b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
@@ -1,4 +1,4 @@
-From 46eea664cf89d0602e7ff16d587c37c045b125b7 Mon Sep 17 00:00:00 2001
+From 76eaa744d2175d93959b2a5dc7ec18ab60187811 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 10 Dec 2015 13:20:30 +0200
 Subject: [PATCH] Don't search /usr and so on for libraries by default to
@@ -8,13 +8,12 @@ Subject: [PATCH] Don't search /usr and so on for libraries by default to
 Upstream-Status: Inappropriate (As the code stands, this is a hack)
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  numpy/distutils/system_info.py | 42 +++++-----------------------------
  1 file changed, 6 insertions(+), 36 deletions(-)
 
 diff --git a/numpy/distutils/system_info.py b/numpy/distutils/system_info.py
-index feb28f6..a48d6d1 100644
+index edf5690..3b55df1 100644
 --- a/numpy/distutils/system_info.py
 +++ b/numpy/distutils/system_info.py
 @@ -327,44 +327,14 @@ def add_system_root(library_root):
diff --git a/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch b/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
index 676bdbb3af..e8fe4975d0 100644
--- a/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
+++ b/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
@@ -1,4 +1,4 @@
-From eb6d6579150bf4684603ce377c51e90ad3bb8109 Mon Sep 17 00:00:00 2001
+From f26c310f4edb139e9b30b4415ef9fd2ddb00f035 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 15 Nov 2020 15:32:39 -0800
 Subject: [PATCH] numpy/core: Define RISCV-32 support
@@ -8,14 +8,14 @@ Helps compile on riscv32
 Upstream-Status: Submitted [https://github.com/numpy/numpy/pull/17780]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- numpy/core/include/numpy/npy_cpu.h    | 3 +++
- numpy/core/include/numpy/npy_endian.h | 1 +
+ numpy/_core/include/numpy/npy_cpu.h    | 3 +++
+ numpy/_core/include/numpy/npy_endian.h | 1 +
  2 files changed, 4 insertions(+)
 
-diff --git a/numpy/core/include/numpy/npy_cpu.h b/numpy/core/include/numpy/npy_cpu.h
-index 78d229e..04be511 100644
---- a/numpy/core/include/numpy/npy_cpu.h
-+++ b/numpy/core/include/numpy/npy_cpu.h
+diff --git a/numpy/_core/include/numpy/npy_cpu.h b/numpy/_core/include/numpy/npy_cpu.h
+index a19f8e6..d824d4e 100644
+--- a/numpy/_core/include/numpy/npy_cpu.h
++++ b/numpy/_core/include/numpy/npy_cpu.h
 @@ -19,6 +19,7 @@
   *              NPY_CPU_ARCEB
   *              NPY_CPU_RISCV64
@@ -33,10 +33,10 @@ index 78d229e..04be511 100644
  #elif defined(__loongarch__)
      #define NPY_CPU_LOONGARCH
  #elif defined(__EMSCRIPTEN__)
-diff --git a/numpy/core/include/numpy/npy_endian.h b/numpy/core/include/numpy/npy_endian.h
+diff --git a/numpy/_core/include/numpy/npy_endian.h b/numpy/_core/include/numpy/npy_endian.h
 index 5e58a7f..0926212 100644
---- a/numpy/core/include/numpy/npy_endian.h
-+++ b/numpy/core/include/numpy/npy_endian.h
+--- a/numpy/_core/include/numpy/npy_endian.h
++++ b/numpy/_core/include/numpy/npy_endian.h
 @@ -49,6 +49,7 @@
              || defined(NPY_CPU_PPC64LE)       \
              || defined(NPY_CPU_ARCEL)         \
@@ -45,6 +45,3 @@ index 5e58a7f..0926212 100644
              || defined(NPY_CPU_LOONGARCH)     \
              || defined(NPY_CPU_WASM)
          #define NPY_BYTE_ORDER NPY_LITTLE_ENDIAN
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch b/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
index d952aed00c..ede190ff0b 100644
--- a/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
+++ b/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
@@ -1,7 +1,11 @@
-This regex decides whether to use O3 opimisation on numpy or not.
+From faa3d6884a39c5d8eca0d4cf3c1f4909bbdf044d Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Fri, 29 Sep 2023 22:53:24 +0100
+Subject: [PATCH] This regex decides whether to use O3 opimisation on numpy or
+ not.
 
 It includes "od", which happens to be a substring of "reproducible"
-but not "qemux86-world". 
+but not "qemux86-world".
 
 The regex will run against all compiler options including things like:
 
@@ -17,12 +21,15 @@ reproducible target ran first and won the race to populate sstate.
 
 Upstream-Status: Inappropriate [upstream have dropped distutils and switched to meson]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Index: numpy-1.26.0/numpy/distutils/ccompiler_opt.py
-===================================================================
---- numpy-1.26.0.orig/numpy/distutils/ccompiler_opt.py
-+++ numpy-1.26.0/numpy/distutils/ccompiler_opt.py
-@@ -990,7 +990,7 @@ class _CCompiler:
+---
+ numpy/distutils/ccompiler_opt.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/numpy/distutils/ccompiler_opt.py b/numpy/distutils/ccompiler_opt.py
+index b1a6fa3..7b0302b 100644
+--- a/numpy/distutils/ccompiler_opt.py
++++ b/numpy/distutils/ccompiler_opt.py
+@@ -991,7 +991,7 @@ def __init__(self):
              ("cc_is_nocc",     "", ""),
          )
          detect_args = (
diff --git a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb b/meta/recipes-devtools/python/python3-numpy_2.0.0.bb
similarity index 73%
rename from meta/recipes-devtools/python/python3-numpy_1.26.4.bb
rename to meta/recipes-devtools/python/python3-numpy_2.0.0.bb
index ccd08147af..d076a8d4dc 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.0.0.bb
@@ -1,9 +1,28 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE.txt
+# +++ LICENSE.txt
+# @@ -1,4 +1,4 @@
+# -Copyright (c) 2005-2023, NumPy Developers.
+# +Copyright (c) 2005-2024, NumPy Developers.
+#  All rights reserved.
+#  
+#  Redistribution and use in source and binary forms, with or without
+# 
+#
+
 SUMMARY = "A sophisticated Numeric Processing Package for Python"
 HOMEPAGE = "https://numpy.org/"
 DESCRIPTION = "NumPy is the fundamental package needed for scientific computing with Python."
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & PSF-2.0 & Apache-2.0 & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a752eb20459cf74a9d84ee4825e8317c"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1de863c37a83e71b1e97b64d036ea78b"
 
 SRCNAME = "numpy"
 
@@ -13,7 +32,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://fix_reproducibility.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "2a02aba9ed12e4ac4eb3ea9421c420301a0c6460d9830d74a9df87efa4912010"
+SRC_URI[sha256sum] = "cf5d1c9e6837f8af9f92b6bd3e86d513cdc11f60fd62185cc49ec7d1aba34864"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.44.0


--===============1477033128033431261==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1881 entries from dependency cache.
Parsing recipes...done.
Parsing of 918 .bb files complete (917 cached, 1 parsed). 1878 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-1e1f4bf5da650e1dc28993c4a51ee400f9e6fc83"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:1e1f4bf5da650e1dc28993c4a51ee400f9e6fc83"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 383 Local 370 Mirrors 0 Missed 13 Current 424 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 506 of 807 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-numpy-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-numpy-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1403 of 2286 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.0.0.bb:do_fetch)
NOTE: recipe python3-numpy-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-numpy-2.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1791 of 2286 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.0.0.bb:do_unpack)
NOTE: Running task 1792 of 2286 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-numpy-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-numpy-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-numpy-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-numpy-2.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 2267 of 2286 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.0.0.bb:do_patch)
NOTE: Running task 2268 of 2286 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.0.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-numpy-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-numpy-2.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-numpy-2.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-numpy-2.0.0-r0: task do_patch: Succeeded
NOTE: Running task 2269 of 2286 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2270 of 2286 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.0.0.bb:do_populate_lic)
NOTE: recipe python3-numpy-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-2.0.0-r0: task do_populate_lic: Started
NOTE: recipe python3-numpy-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-numpy-2.0.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.0.0.bb:do_deploy_source_date_epoch unihash changed to 9c802fa881825bf89b32da4772bdcfd5215e82dbeb18c40f8a52180184272a74
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.0.0.bb:do_populate_lic unihash changed to a85e1aec8156160b72f8afbcf0cec2cca95d93c26600bb7d21d8257531ce7e51
NOTE: Setscene tasks completed
NOTE: Running task 2271 of 2286 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.0.0.bb:do_configure)
NOTE: recipe python3-numpy-2.0.0-r0: task do_configure: Started
NOTE: recipe python3-numpy-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2272 of 2286 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.0.0.bb:do_configure_ptest_base)
NOTE: recipe python3-numpy-2.0.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-2.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2273 of 2286 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.0.0.bb:do_compile)
NOTE: recipe python3-numpy-2.0.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-numpy/2.0.0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-numpy/2.0.0/numpy-2.0.0/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-numpy/2.0.0/temp/run.do_compile.2341379:181 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-numpy/2.0.0/temp/run.do_compile.2341379, line 181
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-numpy/2.0.0/temp/run.do_compile.2341379, line 171
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-numpy/2.0.0/temp/run.do_compile.2341379, line 153
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-numpy/2.0.0/temp/run.do_compile.2341379, line 185
NOTE: recipe python3-numpy-2.0.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2273 tasks of which 2263 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240701085458.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240701085458.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.0.0.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-numpy-2.0.0-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-numpy-2.0.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-numpy/2.0.0/temp/run.do_compile.2341379', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-numpy/2.0.0/temp/log.do_compile.2341379
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.0.0.bb:do_compile) failed with exit code '1'

--===============1477033128033431261==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-numpy-upgrade-1.26.4-2.0.0.patch"

RnJvbSBlNTY4OWFjNWE5NWRkMWZjYWMzZjRiZmIyYmI4NjhjMDI1ZTdmOTQyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdWwgMjAyNCAwODo1NToxOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbnVtcHk6IHVwZ3JhZGUgMS4yNi40IC0+IDIuMC4wCgotLS0KIC4uLi1hbmQtc28tb24t
Zm9yLWxpYnJhcmllcy1ieS1kZWZhdWx0LS5wYXRjaCB8ICA1ICsrLS0KIC4uLjEtbnVtcHktY29y
ZS1EZWZpbmUtUklTQ1YtMzItc3VwcG9ydC5wYXRjaCB8IDIzICsrKysrKysrLS0tLS0tLS0tLS0K
IC4uLi9weXRob24zLW51bXB5L2ZpeF9yZXByb2R1Y2liaWxpdHkucGF0Y2ggICB8IDIzICsrKysr
KysrKysrKy0tLS0tLS0KIC4uLm51bXB5XzEuMjYuNC5iYiA9PiBweXRob24zLW51bXB5XzIuMC4w
LmJifSB8IDIzICsrKysrKysrKysrKysrKysrLS0KIDQgZmlsZXMgY2hhbmdlZCwgNDggaW5zZXJ0
aW9ucygrKSwgMjYgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi97cHl0aG9uMy1udW1weV8xLjI2LjQuYmIgPT4gcHl0aG9uMy1udW1weV8yLjAuMC5iYn0g
KDczJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
bnVtcHkvMDAwMS1Eb24tdC1zZWFyY2gtdXNyLWFuZC1zby1vbi1mb3ItbGlicmFyaWVzLWJ5LWRl
ZmF1bHQtLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5
LzAwMDEtRG9uLXQtc2VhcmNoLXVzci1hbmQtc28tb24tZm9yLWxpYnJhcmllcy1ieS1kZWZhdWx0
LS5wYXRjaAppbmRleCBiYmUzMDljNTU2Li5kODAzODU5M2ZmIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHkvMDAwMS1Eb24tdC1zZWFyY2gtdXNy
LWFuZC1zby1vbi1mb3ItbGlicmFyaWVzLWJ5LWRlZmF1bHQtLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weS8wMDAxLURvbi10LXNlYXJjaC11c3It
YW5kLXNvLW9uLWZvci1saWJyYXJpZXMtYnktZGVmYXVsdC0ucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIDQ2ZWVhNjY0Y2Y4OWQwNjAyZTdmZjE2ZDU4N2MzN2MwNDViMTI1YjcgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIDc2ZWFhNzQ0ZDIxNzVkOTM5NTliMmE1ZGM3ZWMxOGFiNjAx
ODc4MTEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8
YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFRodSwgMTAgRGVjIDIwMTUgMTM6MjA6MzAg
KzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gRG9uJ3Qgc2VhcmNoIC91c3IgYW5kIHNvIG9uIGZvciBs
aWJyYXJpZXMgYnkgZGVmYXVsdCB0bwpAQCAtOCwxMyArOCwxMiBAQCBTdWJqZWN0OiBbUEFUQ0hd
IERvbid0IHNlYXJjaCAvdXNyIGFuZCBzbyBvbiBmb3IgbGlicmFyaWVzIGJ5IGRlZmF1bHQgdG8K
IFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSAoQXMgdGhlIGNvZGUgc3RhbmRzLCB0aGlz
IGlzIGEgaGFjaykKIFNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBpbnRl
bC5jb20+CiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdt
YWlsLmNvbT4KLQogLS0tCiAgbnVtcHkvZGlzdHV0aWxzL3N5c3RlbV9pbmZvLnB5IHwgNDIgKysr
KystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKyksIDM2IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvbnVtcHkvZGlzdHV0aWxz
L3N5c3RlbV9pbmZvLnB5IGIvbnVtcHkvZGlzdHV0aWxzL3N5c3RlbV9pbmZvLnB5Ci1pbmRleCBm
ZWIyOGY2Li5hNDhkNmQxIDEwMDY0NAoraW5kZXggZWRmNTY5MC4uM2I1NWRmMSAxMDA2NDQKIC0t
LSBhL251bXB5L2Rpc3R1dGlscy9zeXN0ZW1faW5mby5weQogKysrIGIvbnVtcHkvZGlzdHV0aWxz
L3N5c3RlbV9pbmZvLnB5CiBAQCAtMzI3LDQ0ICszMjcsMTQgQEAgZGVmIGFkZF9zeXN0ZW1fcm9v
dChsaWJyYXJ5X3Jvb3QpOgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLW51bXB5LzAwMDEtbnVtcHktY29yZS1EZWZpbmUtUklTQ1YtMzItc3VwcG9ydC5w
YXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weS8wMDAxLW51
bXB5LWNvcmUtRGVmaW5lLVJJU0NWLTMyLXN1cHBvcnQucGF0Y2gKaW5kZXggNjc2YmRiYjNhZi4u
ZThmZTQ5NzVkMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLW51bXB5LzAwMDEtbnVtcHktY29yZS1EZWZpbmUtUklTQ1YtMzItc3VwcG9ydC5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHkvMDAwMS1udW1w
eS1jb3JlLURlZmluZS1SSVNDVi0zMi1zdXBwb3J0LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJv
bSBlYjZkNjU3OTE1MGJmNDY4NDYwM2NlMzc3YzUxZTkwYWQzYmI4MTA5IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSBmMjZjMzEwZjRlZGIxMzllOWIzMGI0NDE1ZWY5ZmQyZGRiMDBmMDM1
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWls
LmNvbT4KIERhdGU6IFN1biwgMTUgTm92IDIwMjAgMTU6MzI6MzkgLTA4MDAKIFN1YmplY3Q6IFtQ
QVRDSF0gbnVtcHkvY29yZTogRGVmaW5lIFJJU0NWLTMyIHN1cHBvcnQKQEAgLTgsMTQgKzgsMTQg
QEAgSGVscHMgY29tcGlsZSBvbiByaXNjdjMyCiBVcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBb
aHR0cHM6Ly9naXRodWIuY29tL251bXB5L251bXB5L3B1bGwvMTc3ODBdCiBTaWduZWQtb2ZmLWJ5
OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogLS0tCi0gbnVtcHkvY29yZS9pbmNsdWRl
L251bXB5L25weV9jcHUuaCAgICB8IDMgKysrCi0gbnVtcHkvY29yZS9pbmNsdWRlL251bXB5L25w
eV9lbmRpYW4uaCB8IDEgKworIG51bXB5L19jb3JlL2luY2x1ZGUvbnVtcHkvbnB5X2NwdS5oICAg
IHwgMyArKysKKyBudW1weS9fY29yZS9pbmNsdWRlL251bXB5L25weV9lbmRpYW4uaCB8IDEgKwog
IDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCiAKLWRpZmYgLS1naXQgYS9udW1weS9j
b3JlL2luY2x1ZGUvbnVtcHkvbnB5X2NwdS5oIGIvbnVtcHkvY29yZS9pbmNsdWRlL251bXB5L25w
eV9jcHUuaAotaW5kZXggNzhkMjI5ZS4uMDRiZTUxMSAxMDA2NDQKLS0tLSBhL251bXB5L2NvcmUv
aW5jbHVkZS9udW1weS9ucHlfY3B1LmgKLSsrKyBiL251bXB5L2NvcmUvaW5jbHVkZS9udW1weS9u
cHlfY3B1LmgKK2RpZmYgLS1naXQgYS9udW1weS9fY29yZS9pbmNsdWRlL251bXB5L25weV9jcHUu
aCBiL251bXB5L19jb3JlL2luY2x1ZGUvbnVtcHkvbnB5X2NwdS5oCitpbmRleCBhMTlmOGU2Li5k
ODI0ZDRlIDEwMDY0NAorLS0tIGEvbnVtcHkvX2NvcmUvaW5jbHVkZS9udW1weS9ucHlfY3B1LmgK
KysrKyBiL251bXB5L19jb3JlL2luY2x1ZGUvbnVtcHkvbnB5X2NwdS5oCiBAQCAtMTksNiArMTks
NyBAQAogICAqICAgICAgICAgICAgICBOUFlfQ1BVX0FSQ0VCCiAgICogICAgICAgICAgICAgIE5Q
WV9DUFVfUklTQ1Y2NApAQCAtMzMsMTAgKzMzLDEwIEBAIGluZGV4IDc4ZDIyOWUuLjA0YmU1MTEg
MTAwNjQ0CiAgI2VsaWYgZGVmaW5lZChfX2xvb25nYXJjaF9fKQogICAgICAjZGVmaW5lIE5QWV9D
UFVfTE9PTkdBUkNICiAgI2VsaWYgZGVmaW5lZChfX0VNU0NSSVBURU5fXykKLWRpZmYgLS1naXQg
YS9udW1weS9jb3JlL2luY2x1ZGUvbnVtcHkvbnB5X2VuZGlhbi5oIGIvbnVtcHkvY29yZS9pbmNs
dWRlL251bXB5L25weV9lbmRpYW4uaAorZGlmZiAtLWdpdCBhL251bXB5L19jb3JlL2luY2x1ZGUv
bnVtcHkvbnB5X2VuZGlhbi5oIGIvbnVtcHkvX2NvcmUvaW5jbHVkZS9udW1weS9ucHlfZW5kaWFu
LmgKIGluZGV4IDVlNThhN2YuLjA5MjYyMTIgMTAwNjQ0Ci0tLS0gYS9udW1weS9jb3JlL2luY2x1
ZGUvbnVtcHkvbnB5X2VuZGlhbi5oCi0rKysgYi9udW1weS9jb3JlL2luY2x1ZGUvbnVtcHkvbnB5
X2VuZGlhbi5oCistLS0gYS9udW1weS9fY29yZS9pbmNsdWRlL251bXB5L25weV9lbmRpYW4uaAor
KysrIGIvbnVtcHkvX2NvcmUvaW5jbHVkZS9udW1weS9ucHlfZW5kaWFuLmgKIEBAIC00OSw2ICs0
OSw3IEBACiAgICAgICAgICAgICAgfHwgZGVmaW5lZChOUFlfQ1BVX1BQQzY0TEUpICAgICAgIFwK
ICAgICAgICAgICAgICB8fCBkZWZpbmVkKE5QWV9DUFVfQVJDRUwpICAgICAgICAgXApAQCAtNDUs
NiArNDUsMyBAQCBpbmRleCA1ZTU4YTdmLi4wOTI2MjEyIDEwMDY0NAogICAgICAgICAgICAgIHx8
IGRlZmluZWQoTlBZX0NQVV9MT09OR0FSQ0gpICAgICBcCiAgICAgICAgICAgICAgfHwgZGVmaW5l
ZChOUFlfQ1BVX1dBU00pCiAgICAgICAgICAjZGVmaW5lIE5QWV9CWVRFX09SREVSIE5QWV9MSVRU
TEVfRU5ESUFOCi0tLSAKLTIuMjAuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtbnVtcHkvZml4X3JlcHJvZHVjaWJpbGl0eS5wYXRjaCBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weS9maXhfcmVwcm9kdWNpYmlsaXR5
LnBhdGNoCmluZGV4IGQ5NTJhZWQwMGMuLmVkZTE5MGZmMGIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weS9maXhfcmVwcm9kdWNpYmlsaXR5LnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weS9maXhf
cmVwcm9kdWNpYmlsaXR5LnBhdGNoCkBAIC0xLDcgKzEsMTEgQEAKLVRoaXMgcmVnZXggZGVjaWRl
cyB3aGV0aGVyIHRvIHVzZSBPMyBvcGltaXNhdGlvbiBvbiBudW1weSBvciBub3QuCitGcm9tIGZh
YTNkNjg4NGEzOWM1ZDhlY2EwZDRjZjNjMWY0OTA5YmJkZjA0NGQgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0
aW9uLm9yZz4KK0RhdGU6IEZyaSwgMjkgU2VwIDIwMjMgMjI6NTM6MjQgKzAxMDAKK1N1YmplY3Q6
IFtQQVRDSF0gVGhpcyByZWdleCBkZWNpZGVzIHdoZXRoZXIgdG8gdXNlIE8zIG9waW1pc2F0aW9u
IG9uIG51bXB5IG9yCisgbm90LgogCiBJdCBpbmNsdWRlcyAib2QiLCB3aGljaCBoYXBwZW5zIHRv
IGJlIGEgc3Vic3RyaW5nIG9mICJyZXByb2R1Y2libGUiCi1idXQgbm90ICJxZW11eDg2LXdvcmxk
Ii4gCitidXQgbm90ICJxZW11eDg2LXdvcmxkIi4KIAogVGhlIHJlZ2V4IHdpbGwgcnVuIGFnYWlu
c3QgYWxsIGNvbXBpbGVyIG9wdGlvbnMgaW5jbHVkaW5nIHRoaW5ncyBsaWtlOgogCkBAIC0xNywx
MiArMjEsMTUgQEAgcmVwcm9kdWNpYmxlIHRhcmdldCByYW4gZmlyc3QgYW5kIHdvbiB0aGUgcmFj
ZSB0byBwb3B1bGF0ZSBzc3RhdGUuCiAKIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBb
dXBzdHJlYW0gaGF2ZSBkcm9wcGVkIGRpc3R1dGlscyBhbmQgc3dpdGNoZWQgdG8gbWVzb25dCiBT
aWduZWQtb2ZmLWJ5OiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0
aW9uLm9yZz4KLQotSW5kZXg6IG51bXB5LTEuMjYuMC9udW1weS9kaXN0dXRpbHMvY2NvbXBpbGVy
X29wdC5weQotPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PQotLS0tIG51bXB5LTEuMjYuMC5vcmlnL251bXB5L2Rpc3R1dGls
cy9jY29tcGlsZXJfb3B0LnB5Ci0rKysgbnVtcHktMS4yNi4wL251bXB5L2Rpc3R1dGlscy9jY29t
cGlsZXJfb3B0LnB5Ci1AQCAtOTkwLDcgKzk5MCw3IEBAIGNsYXNzIF9DQ29tcGlsZXI6CistLS0K
KyBudW1weS9kaXN0dXRpbHMvY2NvbXBpbGVyX29wdC5weSB8IDIgKy0KKyAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKKworZGlmZiAtLWdpdCBhL251bXB5L2Rp
c3R1dGlscy9jY29tcGlsZXJfb3B0LnB5IGIvbnVtcHkvZGlzdHV0aWxzL2Njb21waWxlcl9vcHQu
cHkKK2luZGV4IGIxYTZmYTMuLjdiMDMwMmIgMTAwNjQ0CistLS0gYS9udW1weS9kaXN0dXRpbHMv
Y2NvbXBpbGVyX29wdC5weQorKysrIGIvbnVtcHkvZGlzdHV0aWxzL2Njb21waWxlcl9vcHQucHkK
K0BAIC05OTEsNyArOTkxLDcgQEAgZGVmIF9faW5pdF9fKHNlbGYpOgogICAgICAgICAgICAgICgi
Y2NfaXNfbm9jYyIsICAgICAiIiwgIiIpLAogICAgICAgICAgKQogICAgICAgICAgZGV0ZWN0X2Fy
Z3MgPSAoCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
bnVtcHlfMS4yNi40LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51
bXB5XzIuMC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggNzMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weV8xLjI2LjQuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weV8yLjAuMC5iYgppbmRleCBjY2Qw
ODE0N2FmLi5kMDc2YThkNGRjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtbnVtcHlfMS4yNi40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1udW1weV8yLjAuMC5iYgpAQCAtMSw5ICsxLDI4IEBACisjIEZJWE1FOiB0
aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wg
dXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUg
b2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5T
RSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNv
bW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGlj
ZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2Vz
OgorIworIyAtLS0gTElDRU5TRS50eHQKKyMgKysrIExJQ0VOU0UudHh0CisjIEBAIC0xLDQgKzEs
NCBAQAorIyAtQ29weXJpZ2h0IChjKSAyMDA1LTIwMjMsIE51bVB5IERldmVsb3BlcnMuCisjICtD
b3B5cmlnaHQgKGMpIDIwMDUtMjAyNCwgTnVtUHkgRGV2ZWxvcGVycy4KKyMgIEFsbCByaWdodHMg
cmVzZXJ2ZWQuCisjICAKKyMgIFJlZGlzdHJpYnV0aW9uIGFuZCB1c2UgaW4gc291cmNlIGFuZCBi
aW5hcnkgZm9ybXMsIHdpdGggb3Igd2l0aG91dAorIyAKKyMKKwogU1VNTUFSWSA9ICJBIHNvcGhp
c3RpY2F0ZWQgTnVtZXJpYyBQcm9jZXNzaW5nIFBhY2thZ2UgZm9yIFB5dGhvbiIKIEhPTUVQQUdF
ID0gImh0dHBzOi8vbnVtcHkub3JnLyIKIERFU0NSSVBUSU9OID0gIk51bVB5IGlzIHRoZSBmdW5k
YW1lbnRhbCBwYWNrYWdlIG5lZWRlZCBmb3Igc2NpZW50aWZpYyBjb21wdXRpbmcgd2l0aCBQeXRo
b24uIgogU0VDVElPTiA9ICJkZXZlbC9weXRob24iCiBMSUNFTlNFID0gIkJTRC0zLUNsYXVzZSAm
IEJTRC0yLUNsYXVzZSAmIFBTRi0yLjAgJiBBcGFjaGUtMi4wICYgTUlUIgotTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vTElDRU5TRS50eHQ7bWQ1PWE3NTJlYjIwNDU5Y2Y3NGE5ZDg0ZWU0ODI1
ZTgzMTdjIgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS50eHQ7bWQ1PTFkZTg2
M2MzN2E4M2U3MWIxZTk3YjY0ZDAzNmVhNzhiIgogCiBTUkNOQU1FID0gIm51bXB5IgogCkBAIC0x
Myw3ICszMiw3IEBAIFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25sb2FkL3Yke1BW
fS8ke1NSQ05BTUV9LSR7UFZ9LnRhci5neiBcCiAgICAgICAgICAgIGZpbGU6Ly9maXhfcmVwcm9k
dWNpYmlsaXR5LnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL3J1bi1wdGVzdCBcCiAgICAgICAg
ICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyYTAyYWJhOWVkMTJlNGFjNGViM2VhOTQyMWM0
MjAzMDFhMGM2NDYwZDk4MzBkNzRhOWRmODdlZmE0OTEyMDEwIgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImNmNWQxYzllNjgzN2Y4YWY5ZjkyYjZiZDNlODZkNTEzY2RjMTFmNjBmZDYyMTg1Y2M0OWVj
N2QxYWJhMzQ4NjQiCiAKIEdJVEhVQl9CQVNFX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20vbnVt
cHkvbnVtcHkvcmVsZWFzZXMiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJyZWxlYXNlcy90YWcv
dj8oP1A8cHZlcj5cZCsoXC5cZCspKykkIgotLSAKMi40NC4wCgo=

--===============1477033128033431261==--

