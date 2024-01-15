Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE5CCC48BF1
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 17:34:00 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.88283.1705340030137066893
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 09:33:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Mfnd8mBX;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=fjW4YUwc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018d0e2fca36-9ec8eaa7-bb21-4be7-8d02-8ec7849ce84c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1705340029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AcYAjNRy2/jLE+nYGP54uyf/P0ODI/2RC/PPj6E4r3k=;
	b=Mfnd8mBXAKWuRS+dJao1HhUkxxQPFsF8liTObwjVOVCmCwQZdSe5xefpJ3skvgvr
	c9cmWjQCoDPk54GEG77xZ6TI3E6/7O4sZxhA0OLAAWXARqAOn7DziNs41qGqBPgzM6F
	GJlKGhXrThA2rDxpeWKgD32kmtw0EKTn6pupSsbo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1705340029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AcYAjNRy2/jLE+nYGP54uyf/P0ODI/2RC/PPj6E4r3k=;
	b=fjW4YUwcT0JGsrhObytsuLn2XVpjaGviKGte/pSz23jpk2fWugpaNtUr5b5w5QGG
	OAyz0ayhF1GiJKlK+Pg6YCz2YinO7zK1wNj6uA6RKVgWqju4nX5PxIhM/LRgqpUtTlv
	MEESJynW8bLYksnpezL4smWt5aHDAbVxXNqaLp0k=
Content-Type: multipart/mixed; boundary="===============5110567669780750584=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-numpy: upgrading to 1.26.3 SUCCEEDED
Message-ID: <0101018d0e2fca36-9ec8eaa7-bb21-4be7-8d02-8ec7849ce84c-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jan 2024 17:33:49 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:34:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193726

--===============5110567669780750584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-numpy* to *1.26.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-numpy-upgrade-1.26.2-1.26.3.patch
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
From 14b6473143aa5449eeda14d5d4f4fccde9886153 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jan 2024 07:48:37 +0000
Subject: [PATCH] python3-numpy: upgrade 1.26.2 -> 1.26.3

---
 ...-and-so-on-for-libraries-by-default-.patch | 10 ++++-----
 ...1-numpy-core-Define-RISCV-32-support.patch |  8 +++----
 .../python3-numpy/fix_reproducibility.patch   | 22 +++++++++++++------
 ...umpy_1.26.2.bb => python3-numpy_1.26.3.bb} |  2 +-
 4 files changed, 23 insertions(+), 19 deletions(-)
 rename meta/recipes-devtools/python/{python3-numpy_1.26.2.bb => python3-numpy_1.26.3.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
index 9f5f25f9b5..7f40eb13cc 100644
--- a/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
+++ b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
@@ -1,4 +1,4 @@
-From 27f6687e49bf555fc494d2f14bae6ecd0fa30f14 Mon Sep 17 00:00:00 2001
+From fa527d4a79e604062a1a53e531544812ba776eb6 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 10 Dec 2015 13:20:30 +0200
 Subject: [PATCH] Don't search /usr and so on for libraries by default to
@@ -8,15 +8,16 @@ Subject: [PATCH] Don't search /usr and so on for libraries by default to
 Upstream-Status: Inappropriate (As the code stands, this is a hack)
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  numpy/distutils/system_info.py | 42 +++++-----------------------------
  1 file changed, 6 insertions(+), 36 deletions(-)
 
 diff --git a/numpy/distutils/system_info.py b/numpy/distutils/system_info.py
-index 82e864a..135246d 100644
+index feb28f6..a48d6d1 100644
 --- a/numpy/distutils/system_info.py
 +++ b/numpy/distutils/system_info.py
-@@ -323,44 +323,14 @@ if sys.platform == 'win32':
+@@ -327,44 +327,14 @@ def add_system_root(library_root):
          add_system_root(os.path.join(conda_dir, 'Library'))
  
  else:
@@ -67,6 +68,3 @@ index 82e864a..135246d 100644
  
  if os.path.join(sys.prefix, 'lib') not in default_lib_dirs:
      default_lib_dirs.insert(0, os.path.join(sys.prefix, 'lib'))
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch b/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
index 676bdbb3af..b2a0dc3f66 100644
--- a/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
+++ b/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
@@ -1,4 +1,4 @@
-From eb6d6579150bf4684603ce377c51e90ad3bb8109 Mon Sep 17 00:00:00 2001
+From fa40e92c68b99bf2c7028413fe01e7055b2147e4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 15 Nov 2020 15:32:39 -0800
 Subject: [PATCH] numpy/core: Define RISCV-32 support
@@ -7,13 +7,14 @@ Helps compile on riscv32
 
 Upstream-Status: Submitted [https://github.com/numpy/numpy/pull/17780]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  numpy/core/include/numpy/npy_cpu.h    | 3 +++
  numpy/core/include/numpy/npy_endian.h | 1 +
  2 files changed, 4 insertions(+)
 
 diff --git a/numpy/core/include/numpy/npy_cpu.h b/numpy/core/include/numpy/npy_cpu.h
-index 78d229e..04be511 100644
+index a19f8e6..d824d4e 100644
 --- a/numpy/core/include/numpy/npy_cpu.h
 +++ b/numpy/core/include/numpy/npy_cpu.h
 @@ -19,6 +19,7 @@
@@ -45,6 +46,3 @@ index 5e58a7f..0926212 100644
              || defined(NPY_CPU_LOONGARCH)     \
              || defined(NPY_CPU_WASM)
          #define NPY_BYTE_ORDER NPY_LITTLE_ENDIAN
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch b/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
index d952aed00c..917ab916f4 100644
--- a/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
+++ b/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
@@ -1,7 +1,11 @@
-This regex decides whether to use O3 opimisation on numpy or not.
+From b1abe7e7889f35be21008a3b51135040354031f4 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Fri, 29 Sep 2023 22:53:24 +0100
+Subject: [PATCH] This regex decides whether to use O3 opimisation on numpy or
+ not.
 
 It includes "od", which happens to be a substring of "reproducible"
-but not "qemux86-world". 
+but not "qemux86-world".
 
 The regex will run against all compiler options including things like:
 
@@ -18,11 +22,15 @@ reproducible target ran first and won the race to populate sstate.
 Upstream-Status: Inappropriate [upstream have dropped distutils and switched to meson]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
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
+index 37a5368..19d7538 100644
+--- a/numpy/distutils/ccompiler_opt.py
++++ b/numpy/distutils/ccompiler_opt.py
+@@ -991,7 +991,7 @@ def __init__(self):
              ("cc_is_nocc",     "", ""),
          )
          detect_args = (
diff --git a/meta/recipes-devtools/python/python3-numpy_1.26.2.bb b/meta/recipes-devtools/python/python3-numpy_1.26.3.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-numpy_1.26.2.bb
rename to meta/recipes-devtools/python/python3-numpy_1.26.3.bb
index 253b334367..023d40a9b2 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.26.2.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.26.3.bb
@@ -13,7 +13,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://fix_reproducibility.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "f65738447676ab5777f11e6bbbdb8ce11b785e105f690bc45966574816b6d3ea"
+SRC_URI[sha256sum] = "697df43e2b6310ecc9d95f05d5ef20eacc09c7c4ecc9da3f235d39e71b7da1e4"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.42.0


--===============5110567669780750584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 914 .bb files complete (0 cached, 914 parsed). 1851 targets, 49 skipped, 0 masked, 0 errors.
Removing 27 recipes from the core2-64 sysroot...done.
Removing 72 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-6f4a9a1ee034b6bd8dfd761ff8048cbbc064f86b"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:6f4a9a1ee034b6bd8dfd761ff8048cbbc064f86b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 556 Local 540 Mirrors 0 Missed 16 Current 261 (97% match, 98% complete)
Removing 5 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 263 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 264 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 265 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 267 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.92.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 268 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.92.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 269 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.92.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 271 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.92.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 283 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_7.4.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 284 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_7.4.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 285 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_7.4.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 286 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_7.4.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 287 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 288 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 289 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 290 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 291 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.9.0.bb:do_create_spdx_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_package_write_deb_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-hypothesis-6.92.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-hypothesis-6.92.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-hypothesis-6.92.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pytest-7.4.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-hypothesis-6.92.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-7.4.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-7.4.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pytest-7.4.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-typing-extensions-4.9.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 292 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.9.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-pytest-7.4.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 293 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.9.0.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 294 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.9.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 295 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_package_write_deb_setscene)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 296 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pytest-7.4.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 297 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-pytest-7.4.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.92.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 300 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 301 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 302 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-pytest-7.4.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 303 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe python3-typing-extensions-4.9.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 304 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-importlib-metadata_7.0.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.92.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 305 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-more-itertools_10.1.0.bb:do_packagedata_setscene)
NOTE: recipe python3-typing-extensions-4.9.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-hypothesis-6.92.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 307 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_packagedata_setscene)
NOTE: recipe python3-typing-extensions-4.9.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-typing-extensions-4.9.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-hypothesis-6.92.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 308 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-importlib-metadata-7.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-more-itertools-10.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 309 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.92.2.bb:do_packagedata_setscene)
NOTE: recipe python3-typing-extensions-4.9.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 310 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_packagedata_setscene)
NOTE: recipe python3-packaging-23.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-typing-extensions-4.9.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 311 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pluggy_1.3.0.bb:do_packagedata_setscene)
NOTE: recipe python3-typing-extensions-4.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 312 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 314 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_7.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 315 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_69.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 316 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe python3-attrs-23.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 320 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe python3-importlib-metadata-7.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 324 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.9.0.bb:do_packagedata_setscene)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.92.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 328 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-more-itertools/10.1.0/temp/log.do_packagedata_setscene.3699764
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-more-itertools_10.1.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 329 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-more-itertools_10.1.0.bb:do_package_setscene)
NOTE: recipe python3-pluggy-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-69.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-23.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-attrs-23.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.92.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pluggy-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-69.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-7.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 332 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 333 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 334 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 335 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wcwidth_0.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 371 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 372 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 373 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 379 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 380 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 382 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running setscene task 383 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm_setscene)
NOTE: recipe tzdata-2023d-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-wcwidth-0.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 480 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 481 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-wcwidth-0.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2023d-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 432 of 2302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_1.26.3.bb:do_recipe_qa)
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 512 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 519 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata_setscene)
NOTE: recipe python3-numpy-1.26.3-r0: task do_recipe_qa: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 524 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 536 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 537 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 541 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-more-itertools-10.1.0-r0: task do_package_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 549 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-numpy-1.26.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 589 of 2302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_1.26.3.bb:do_fetch)
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 553 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 557 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 564 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 566 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 568 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 572 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 574 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 576 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_packagedata_setscene)
NOTE: recipe python3-numpy-1.26.3-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 581 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-numpy-1.26.3-r0: task do_fetch: Succeeded
NOTE: Running task 601 of 2302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_1.26.3.bb:do_unpack)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 603 of 2302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe python3-more-itertools-10.1.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 583 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-more-itertools_10.1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 584 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 585 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-numpy-1.26.3-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 605 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 607 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 609 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 611 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-more-itertools-10.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 619 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 622 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-more-itertools-10.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 635 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: Running setscene task 639 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata_setscene)
NOTE: recipe curl-8.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 647 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running task 1231 of 2302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: Running task 1273 of 2302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 650 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 654 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 656 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 658 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 661 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 666 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 667 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 668 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 669 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 670 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 671 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 672 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 673 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 674 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 675 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-numpy-1.26.3-r0: task do_unpack: Succeeded
NOTE: Running setscene task 676 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 678 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 679 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 680 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 684 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 689 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 691 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 693 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 695 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 700 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 702 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 704 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 706 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 707 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 709 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 711 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 719 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 721 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 723 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 725 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 727 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 731 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 735 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 736 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 738 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 741 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 743 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1473 of 2302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_1.26.3.bb:do_patch)
NOTE: Running task 1474 of 2302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 748 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 749 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.44.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe python3-numpy-1.26.3-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 751 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1497 of 2302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 760 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 763 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 765 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.44.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1513 of 2302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-numpy-1.26.3-r0: task do_patch: Succeeded
NOTE: Running task 1524 of 2302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_1.26.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1525 of 2302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_1.26.3.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1531 of 2302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-numpy-1.26.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.26.3-r0: task do_populate_lic: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 767 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 768 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-numpy-1.26.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 775 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 777 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 778 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-numpy-1.26.3-r0: task do_populate_lic: Succeeded
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_1.26.3.bb:do_populate_lic unihash changed to f371d6869639c679236e05858549f583a1b39f71d3a70f136aeab93ca50dd81c
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1547 of 2302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 780 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 782 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 783 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 785 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 786 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 788 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 790 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 791 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 792 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 795 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 796 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 798 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 804 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 806 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 807 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1577 of 2302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e644ec3722734ea60494db1182afab8d0334f493c3dc1fb845b731f7ca727b46
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 1d70cada337bebc6ab625de816fb90484590f58291c04378def96e4b52cda1dd to hashserv.yocto.io:8686 ({'taskhash': '413ebd3559fbc63fe3f324c75e7da4b2f7c88ff7536903791a072eb952ff936d', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1d70cada337bebc6ab625de816fb90484590f58291c04378def96e4b52cda1dd'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 413ebd3559fbc63fe3f324c75e7da4b2f7c88ff7536903791a072eb952ff936d -> 1d70cada337bebc6ab625de816fb90484590f58291c04378def96e4b52cda1dd as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 810 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 812 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 813 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 815 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 817 of 817 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1899 of 2302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_1.26.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-numpy-1.26.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2225 of 2302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-more-itertools_10.1.0.bb:do_packagedata)
NOTE: Running task 2245 of 2302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_1.26.3.bb:do_collect_spdx_deps)
NOTE: recipe python3-more-itertools-10.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-numpy-1.26.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-numpy-1.26.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-numpy-1.26.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2284 of 2302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_1.26.3.bb:do_configure)
NOTE: recipe python3-more-itertools-10.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-numpy-1.26.3-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.26.3-r0: task do_configure: Succeeded
NOTE: Running task 2288 of 2302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_1.26.3.bb:do_configure_ptest_base)
NOTE: recipe python3-numpy-1.26.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.26.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2289 of 2302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_1.26.3.bb:do_compile)
NOTE: recipe python3-numpy-1.26.3-r0: task do_compile: Started
NOTE: recipe python3-numpy-1.26.3-r0: task do_compile: Succeeded
NOTE: Running task 2290 of 2302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_1.26.3.bb:do_compile_ptest_base)
NOTE: recipe python3-numpy-1.26.3-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-numpy-1.26.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2291 of 2302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_1.26.3.bb:do_install)
NOTE: recipe python3-numpy-1.26.3-r0: task do_install: Started
NOTE: recipe python3-numpy-1.26.3-r0: task do_install: Succeeded
NOTE: Running task 2292 of 2302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_1.26.3.bb:do_install_ptest_base)
NOTE: recipe python3-numpy-1.26.3-r0: task do_install_ptest_base: Started
NOTE: recipe python3-numpy-1.26.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2293 of 2302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_1.26.3.bb:do_package)
NOTE: Running task 2294 of 2302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_1.26.3.bb:do_populate_sysroot)
NOTE: recipe python3-numpy-1.26.3-r0: task do_package: Started
NOTE: recipe python3-numpy-1.26.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-numpy-1.26.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-numpy-1.26.3-r0: task do_package: Succeeded
NOTE: Running task 2295 of 2302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_1.26.3.bb:do_packagedata)
NOTE: recipe python3-numpy-1.26.3-r0: task do_packagedata: Started
NOTE: recipe python3-numpy-1.26.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2296 of 2302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_1.26.3.bb:do_create_spdx)
NOTE: Running task 2297 of 2302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_1.26.3.bb:do_package_write_ipk)
NOTE: Running task 2298 of 2302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_1.26.3.bb:do_package_write_deb)
NOTE: Running task 2299 of 2302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_1.26.3.bb:do_package_write_rpm)
NOTE: Running task 2300 of 2302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_1.26.3.bb:do_package_qa)
NOTE: recipe python3-numpy-1.26.3-r0: task do_create_spdx: Started
NOTE: recipe python3-numpy-1.26.3-r0: task do_package_write_ipk: Started
NOTE: recipe python3-numpy-1.26.3-r0: task do_package_write_deb: Started
NOTE: recipe python3-numpy-1.26.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-numpy-1.26.3-r0: task do_package_qa: Started
NOTE: recipe python3-numpy-1.26.3-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-numpy-1.26.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 2301 of 2302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_1.26.3.bb:do_create_runtime_spdx)
NOTE: recipe python3-numpy-1.26.3-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-numpy-1.26.3-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-numpy-1.26.3-r0: task do_package_qa: Succeeded
NOTE: recipe python3-numpy-1.26.3-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-numpy-1.26.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2302 of 2302 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_1.26.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2302 tasks of which 2268 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-more-itertools-10.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-src went backwards which would break package feeds (from 0:10.2.0-r0 to 0:10.1.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-dbg went backwards which would break package feeds (from 0:10.2.0-r0 to 0:10.1.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-ptest went backwards which would break package feeds (from 0:10.2.0-r0 to 0:10.1.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-staticdev went backwards which would break package feeds (from 0:10.2.0-r0 to 0:10.1.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-dev went backwards which would break package feeds (from 0:10.2.0-r0 to 0:10.1.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-doc went backwards which would break package feeds (from 0:10.2.0-r0 to 0:10.1.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-locale went backwards which would break package feeds (from 0:10.2.0-r0 to 0:10.1.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools went backwards which would break package feeds (from 0:10.2.0-r0 to 0:10.1.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.1.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5110567669780750584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-numpy/python3-numpy: FILELIST: directory renamed /usr/lib/python3.11/site-packages/numpy-1.26.2.dist-info -> /usr/lib/python3.11/site-packages/numpy-1.26.3.dist-info, added "/usr/lib/python3.11/site-packages/numpy/f2py/__pycache__/_src_pyf.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/callback/gh25211.f /usr/lib/python3.11/site-packages/numpy/f2py/tests/__pycache__/test_pyf_src.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/f2py/tests/test_pyf_src.py /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/string/gh24662.f90 /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/string/gh25286.f90 /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/regression/gh25337/data.f90 /usr/lib/python3.11/site-packages/numpy/f2py/_backends/meson.build.template /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/cli/gh_22819.pyf /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/regression/gh25337/use_data.f90 /usr/l
 ib/python3.11/site-packages/numpy/f2py/tests/src/common/gh19161.f90 /usr/lib/python3.11/site-packages/numpy/f2py/_src_pyf.py /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/callback/gh25211.pyf /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/string/gh25286_bc.pyf /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/string/gh25286.pyf"
Changes to packages/core2-64-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.11/site-packages/numpy-1.26.2.dist-info moved to /usr/lib/python3.11/site-packages/numpy-1.26.3.dist-info
  /usr/lib/python3.11/site-packages/numpy/f2py/_backends/meson.build.template was added
  /usr/lib/python3.11/site-packages/numpy/f2py/__pycache__/_src_pyf.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/numpy/f2py/_src_pyf.py was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/__pycache__/test_pyf_src.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/callback/gh25211.f was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/callback/gh25211.pyf was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/cli/gh_22819.pyf was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/common/gh19161.f90 was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/regression/gh25337 was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/regression/gh25337/data.f90 was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/regression/gh25337/use_data.f90 was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/string/gh24662.f90 was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/string/gh25286_bc.pyf was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/string/gh25286.f90 was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/string/gh25286.pyf was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/test_pyf_src.py was added

--===============5110567669780750584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-numpy: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/python3-numpy: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/python3-numpy: SRC_URI changed from "https://github.com/numpy/numpy/releases/download/v1.26.2/numpy-1.26.2.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://0001-numpy-core-Define-RISCV-32-support.patch file://fix_reproducibility.patch file://run-ptest" to "https://github.com/numpy/numpy/releases/download/v1.26.3/numpy-1.26.3.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://0001-numpy-core-Define-RISCV-32-support.patch file://fix_reproducibility.patch file://run-ptest"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-dbg: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-dbg: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-dbg: PKGSIZE changed from 57685288 to 58168832 (+1%)
packages/core2-64-poky-linux/python3-numpy/python3-numpy-dev: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-dev: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-doc: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-doc: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-locale: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-locale: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-ptest: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-ptest: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-src: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-src: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-src: PKGSIZE changed from 21131427 to 21132934 (+0%)
packages/core2-64-poky-linux/python3-numpy/python3-numpy-staticdev: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-staticdev: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-staticdev: PKGSIZE changed from 366980 to 366988 (+0%)
packages/core2-64-poky-linux/python3-numpy/python3-numpy: FILELIST: directory renamed /usr/lib/python3.11/site-packages/numpy-1.26.2.dist-info -> /usr/lib/python3.11/site-packages/numpy-1.26.3.dist-info, added "/usr/lib/python3.11/site-packages/numpy/f2py/tests/src/string/gh25286.f90 /usr/lib/python3.11/site-packages/numpy/f2py/tests/__pycache__/test_pyf_src.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/cli/gh_22819.pyf /usr/lib/python3.11/site-packages/numpy/f2py/tests/test_pyf_src.py /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/string/gh24662.f90 /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/string/gh25286.pyf /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/string/gh25286_bc.pyf /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/callback/gh25211.f /usr/lib/python3.11/site-packages/numpy/f2py/__pycache__/_src_pyf.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/callback/gh25211.pyf /usr/lib/python3.11/site-
 packages/numpy/f2py/tests/src/common/gh19161.f90 /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/regression/gh25337/data.f90 /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/regression/gh25337/use_data.f90 /usr/lib/python3.11/site-packages/numpy/f2py/_backends/meson.build.template /usr/lib/python3.11/site-packages/numpy/f2py/_src_pyf.py"
packages/core2-64-poky-linux/python3-numpy/python3-numpy: PKGV changed from 1.26.2 [default] to 1.26.3 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy: PV changed from "1.26.2" to "1.26.3"
packages/core2-64-poky-linux/python3-numpy/python3-numpy: PKGSIZE changed from 39463777 to 39548142 (+0%)
Changes to packages/core2-64-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.11/site-packages/numpy-1.26.2.dist-info moved to /usr/lib/python3.11/site-packages/numpy-1.26.3.dist-info
  /usr/lib/python3.11/site-packages/numpy/f2py/_backends/meson.build.template was added
  /usr/lib/python3.11/site-packages/numpy/f2py/__pycache__/_src_pyf.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/numpy/f2py/_src_pyf.py was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/__pycache__/test_pyf_src.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/callback/gh25211.f was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/callback/gh25211.pyf was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/cli/gh_22819.pyf was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/common/gh19161.f90 was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/regression/gh25337 was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/regression/gh25337/data.f90 was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/regression/gh25337/use_data.f90 was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/string/gh24662.f90 was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/string/gh25286_bc.pyf was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/string/gh25286.f90 was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/string/gh25286.pyf was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/test_pyf_src.py was added

--===============5110567669780750584==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-numpy-upgrade-1.26.2-1.26.3.patch"

RnJvbSAxNGI2NDczMTQzYWE1NDQ5ZWVkYTE0ZDVkNGY0ZmNjZGU5ODg2MTUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSmFuIDIwMjQgMDc6NDg6MzcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW51bXB5OiB1cGdyYWRlIDEuMjYuMiAtPiAxLjI2LjMKCi0tLQogLi4uLWFuZC1zby1v
bi1mb3ItbGlicmFyaWVzLWJ5LWRlZmF1bHQtLnBhdGNoIHwgMTAgKysrKy0tLS0tCiAuLi4xLW51
bXB5LWNvcmUtRGVmaW5lLVJJU0NWLTMyLXN1cHBvcnQucGF0Y2ggfCAgOCArKystLS0tCiAuLi4v
cHl0aG9uMy1udW1weS9maXhfcmVwcm9kdWNpYmlsaXR5LnBhdGNoICAgfCAyMiArKysrKysrKysr
KysrLS0tLS0tCiAuLi51bXB5XzEuMjYuMi5iYiA9PiBweXRob24zLW51bXB5XzEuMjYuMy5iYn0g
fCAgMiArLQogNCBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMo
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLW51bXB5XzEu
MjYuMi5iYiA9PiBweXRob24zLW51bXB5XzEuMjYuMy5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHkvMDAwMS1Eb24tdC1zZWFy
Y2gtdXNyLWFuZC1zby1vbi1mb3ItbGlicmFyaWVzLWJ5LWRlZmF1bHQtLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5LzAwMDEtRG9uLXQtc2VhcmNoLXVz
ci1hbmQtc28tb24tZm9yLWxpYnJhcmllcy1ieS1kZWZhdWx0LS5wYXRjaAppbmRleCA5ZjVmMjVm
OWI1Li43ZjQwZWIxM2NjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtbnVtcHkvMDAwMS1Eb24tdC1zZWFyY2gtdXNyLWFuZC1zby1vbi1mb3ItbGlicmFy
aWVzLWJ5LWRlZmF1bHQtLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1udW1weS8wMDAxLURvbi10LXNlYXJjaC11c3ItYW5kLXNvLW9uLWZvci1saWJyYXJp
ZXMtYnktZGVmYXVsdC0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDI3ZjY2ODdlNDliZjU1
NWZjNDk0ZDJmMTRiYWU2ZWNkMGZhMzBmMTQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IGZhNTI3ZDRhNzllNjA0MDYyYTFhNTNlNTMxNTQ0ODEyYmE3NzZlYjYgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNv
bT4KIERhdGU6IFRodSwgMTAgRGVjIDIwMTUgMTM6MjA6MzAgKzAyMDAKIFN1YmplY3Q6IFtQQVRD
SF0gRG9uJ3Qgc2VhcmNoIC91c3IgYW5kIHNvIG9uIGZvciBsaWJyYXJpZXMgYnkgZGVmYXVsdCB0
bwpAQCAtOCwxNSArOCwxNiBAQCBTdWJqZWN0OiBbUEFUQ0hdIERvbid0IHNlYXJjaCAvdXNyIGFu
ZCBzbyBvbiBmb3IgbGlicmFyaWVzIGJ5IGRlZmF1bHQgdG8KIFVwc3RyZWFtLVN0YXR1czogSW5h
cHByb3ByaWF0ZSAoQXMgdGhlIGNvZGUgc3RhbmRzLCB0aGlzIGlzIGEgaGFjaykKIFNpZ25lZC1v
ZmYtYnk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBpbnRlbC5jb20+CiBTaWduZWQtb2ZmLWJ5
OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KKwogLS0tCiAgbnVt
cHkvZGlzdHV0aWxzL3N5c3RlbV9pbmZvLnB5IHwgNDIgKysrKystLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQogIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDM2IGRlbGV0aW9u
cygtKQogCiBkaWZmIC0tZ2l0IGEvbnVtcHkvZGlzdHV0aWxzL3N5c3RlbV9pbmZvLnB5IGIvbnVt
cHkvZGlzdHV0aWxzL3N5c3RlbV9pbmZvLnB5Ci1pbmRleCA4MmU4NjRhLi4xMzUyNDZkIDEwMDY0
NAoraW5kZXggZmViMjhmNi4uYTQ4ZDZkMSAxMDA2NDQKIC0tLSBhL251bXB5L2Rpc3R1dGlscy9z
eXN0ZW1faW5mby5weQogKysrIGIvbnVtcHkvZGlzdHV0aWxzL3N5c3RlbV9pbmZvLnB5Ci1AQCAt
MzIzLDQ0ICszMjMsMTQgQEAgaWYgc3lzLnBsYXRmb3JtID09ICd3aW4zMic6CitAQCAtMzI3LDQ0
ICszMjcsMTQgQEAgZGVmIGFkZF9zeXN0ZW1fcm9vdChsaWJyYXJ5X3Jvb3QpOgogICAgICAgICAg
YWRkX3N5c3RlbV9yb290KG9zLnBhdGguam9pbihjb25kYV9kaXIsICdMaWJyYXJ5JykpCiAgCiAg
ZWxzZToKQEAgLTY3LDYgKzY4LDMgQEAgaW5kZXggODJlODY0YS4uMTM1MjQ2ZCAxMDA2NDQKICAK
ICBpZiBvcy5wYXRoLmpvaW4oc3lzLnByZWZpeCwgJ2xpYicpIG5vdCBpbiBkZWZhdWx0X2xpYl9k
aXJzOgogICAgICBkZWZhdWx0X2xpYl9kaXJzLmluc2VydCgwLCBvcy5wYXRoLmpvaW4oc3lzLnBy
ZWZpeCwgJ2xpYicpKQotLS0gCi0yLjI1LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5LzAwMDEtbnVtcHktY29yZS1EZWZpbmUtUklTQ1Yt
MzItc3VwcG9ydC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1u
dW1weS8wMDAxLW51bXB5LWNvcmUtRGVmaW5lLVJJU0NWLTMyLXN1cHBvcnQucGF0Y2gKaW5kZXgg
Njc2YmRiYjNhZi4uYjJhMGRjM2Y2NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLW51bXB5LzAwMDEtbnVtcHktY29yZS1EZWZpbmUtUklTQ1YtMzItc3Vw
cG9ydC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVt
cHkvMDAwMS1udW1weS1jb3JlLURlZmluZS1SSVNDVi0zMi1zdXBwb3J0LnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSBlYjZkNjU3OTE1MGJmNDY4NDYwM2NlMzc3YzUxZTkwYWQzYmI4MTA5IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBmYTQwZTkyYzY4Yjk5YmYyYzcwMjg0MTNmZTAx
ZTcwNTViMjE0N2U0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJh
ai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFN1biwgMTUgTm92IDIwMjAgMTU6MzI6MzkgLTA4MDAK
IFN1YmplY3Q6IFtQQVRDSF0gbnVtcHkvY29yZTogRGVmaW5lIFJJU0NWLTMyIHN1cHBvcnQKQEAg
LTcsMTMgKzcsMTQgQEAgSGVscHMgY29tcGlsZSBvbiByaXNjdjMyCiAKIFVwc3RyZWFtLVN0YXR1
czogU3VibWl0dGVkIFtodHRwczovL2dpdGh1Yi5jb20vbnVtcHkvbnVtcHkvcHVsbC8xNzc4MF0K
IFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CisKIC0tLQogIG51
bXB5L2NvcmUvaW5jbHVkZS9udW1weS9ucHlfY3B1LmggICAgfCAzICsrKwogIG51bXB5L2NvcmUv
aW5jbHVkZS9udW1weS9ucHlfZW5kaWFuLmggfCAxICsKICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvbnVtcHkvY29yZS9pbmNsdWRlL251bXB5L25weV9j
cHUuaCBiL251bXB5L2NvcmUvaW5jbHVkZS9udW1weS9ucHlfY3B1LmgKLWluZGV4IDc4ZDIyOWUu
LjA0YmU1MTEgMTAwNjQ0CitpbmRleCBhMTlmOGU2Li5kODI0ZDRlIDEwMDY0NAogLS0tIGEvbnVt
cHkvY29yZS9pbmNsdWRlL251bXB5L25weV9jcHUuaAogKysrIGIvbnVtcHkvY29yZS9pbmNsdWRl
L251bXB5L25weV9jcHUuaAogQEAgLTE5LDYgKzE5LDcgQEAKQEAgLTQ1LDYgKzQ2LDMgQEAgaW5k
ZXggNWU1OGE3Zi4uMDkyNjIxMiAxMDA2NDQKICAgICAgICAgICAgICB8fCBkZWZpbmVkKE5QWV9D
UFVfTE9PTkdBUkNIKSAgICAgXAogICAgICAgICAgICAgIHx8IGRlZmluZWQoTlBZX0NQVV9XQVNN
KQogICAgICAgICAgI2RlZmluZSBOUFlfQllURV9PUkRFUiBOUFlfTElUVExFX0VORElBTgotLS0g
Ci0yLjIwLjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLW51bXB5L2ZpeF9yZXByb2R1Y2liaWxpdHkucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtbnVtcHkvZml4X3JlcHJvZHVjaWJpbGl0eS5wYXRjaAppbmRleCBk
OTUyYWVkMDBjLi45MTdhYjkxNmY0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtbnVtcHkvZml4X3JlcHJvZHVjaWJpbGl0eS5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHkvZml4X3JlcHJvZHVjaWJpbGl0
eS5wYXRjaApAQCAtMSw3ICsxLDExIEBACi1UaGlzIHJlZ2V4IGRlY2lkZXMgd2hldGhlciB0byB1
c2UgTzMgb3BpbWlzYXRpb24gb24gbnVtcHkgb3Igbm90LgorRnJvbSBiMWFiZTdlNzg4OWYzNWJl
MjEwMDhhM2I1MTEzNTA0MDM1NDAzMWY0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTog
UmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CitEYXRl
OiBGcmksIDI5IFNlcCAyMDIzIDIyOjUzOjI0ICswMTAwCitTdWJqZWN0OiBbUEFUQ0hdIFRoaXMg
cmVnZXggZGVjaWRlcyB3aGV0aGVyIHRvIHVzZSBPMyBvcGltaXNhdGlvbiBvbiBudW1weSBvcgor
IG5vdC4KIAogSXQgaW5jbHVkZXMgIm9kIiwgd2hpY2ggaGFwcGVucyB0byBiZSBhIHN1YnN0cmlu
ZyBvZiAicmVwcm9kdWNpYmxlIgotYnV0IG5vdCAicWVtdXg4Ni13b3JsZCIuIAorYnV0IG5vdCAi
cWVtdXg4Ni13b3JsZCIuCiAKIFRoZSByZWdleCB3aWxsIHJ1biBhZ2FpbnN0IGFsbCBjb21waWxl
ciBvcHRpb25zIGluY2x1ZGluZyB0aGluZ3MgbGlrZToKIApAQCAtMTgsMTEgKzIyLDE1IEBAIHJl
cHJvZHVjaWJsZSB0YXJnZXQgcmFuIGZpcnN0IGFuZCB3b24gdGhlIHJhY2UgdG8gcG9wdWxhdGUg
c3N0YXRlLgogVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFt1cHN0cmVhbSBoYXZlIGRy
b3BwZWQgZGlzdHV0aWxzIGFuZCBzd2l0Y2hlZCB0byBtZXNvbl0KIFNpZ25lZC1vZmYtYnk6IFJp
Y2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPgogCi1JbmRl
eDogbnVtcHktMS4yNi4wL251bXB5L2Rpc3R1dGlscy9jY29tcGlsZXJfb3B0LnB5Ci09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09Ci0tLS0gbnVtcHktMS4yNi4wLm9yaWcvbnVtcHkvZGlzdHV0aWxzL2Njb21waWxlcl9vcHQu
cHkKLSsrKyBudW1weS0xLjI2LjAvbnVtcHkvZGlzdHV0aWxzL2Njb21waWxlcl9vcHQucHkKLUBA
IC05OTAsNyArOTkwLDcgQEAgY2xhc3MgX0NDb21waWxlcjoKKy0tLQorIG51bXB5L2Rpc3R1dGls
cy9jY29tcGlsZXJfb3B0LnB5IHwgMiArLQorIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQorCitkaWZmIC0tZ2l0IGEvbnVtcHkvZGlzdHV0aWxzL2Njb21waWxl
cl9vcHQucHkgYi9udW1weS9kaXN0dXRpbHMvY2NvbXBpbGVyX29wdC5weQoraW5kZXggMzdhNTM2
OC4uMTlkNzUzOCAxMDA2NDQKKy0tLSBhL251bXB5L2Rpc3R1dGlscy9jY29tcGlsZXJfb3B0LnB5
CisrKysgYi9udW1weS9kaXN0dXRpbHMvY2NvbXBpbGVyX29wdC5weQorQEAgLTk5MSw3ICs5OTEs
NyBAQCBkZWYgX19pbml0X18oc2VsZik6CiAgICAgICAgICAgICAgKCJjY19pc19ub2NjIiwgICAg
ICIiLCAiIiksCiAgICAgICAgICApCiAgICAgICAgICBkZXRlY3RfYXJncyA9ICgKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weV8xLjI2LjIuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHlfMS4yNi4zLmJiCnNp
bWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1udW1weV8xLjI2LjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1udW1weV8xLjI2LjMuYmIKaW5kZXggMjUzYjMzNDM2Ny4uMDIzZDQw
YTliMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51
bXB5XzEuMjYuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
bnVtcHlfMS4yNi4zLmJiCkBAIC0xMyw3ICsxMyw3IEBAIFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFT
RV9VUkl9L2Rvd25sb2FkL3Yke1BWfS8ke1NSQ05BTUV9LSR7UFZ9LnRhci5neiBcCiAgICAgICAg
ICAgIGZpbGU6Ly9maXhfcmVwcm9kdWNpYmlsaXR5LnBhdGNoIFwKICAgICAgICAgICAgZmlsZTov
L3J1bi1wdGVzdCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJmNjU3Mzg0
NDc2NzZhYjU3NzdmMTFlNmJiYmRiOGNlMTFiNzg1ZTEwNWY2OTBiYzQ1OTY2NTc0ODE2YjZkM2Vh
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjY5N2RmNDNlMmI2MzEwZWNjOWQ5NWYwNWQ1ZWYyMGVh
Y2MwOWM3YzRlY2M5ZGEzZjIzNWQzOWU3MWI3ZGExZTQiCiAKIEdJVEhVQl9CQVNFX1VSSSA9ICJo
dHRwczovL2dpdGh1Yi5jb20vbnVtcHkvbnVtcHkvcmVsZWFzZXMiCiBVUFNUUkVBTV9DSEVDS19S
RUdFWCA9ICJyZWxlYXNlcy90YWcvdj8oP1A8cHZlcj5cZCsoXC5cZCspKykkIgotLSAKMi40Mi4w
Cgo=

--===============5110567669780750584==--

