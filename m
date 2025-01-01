Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BB70C0218B
	for <webhook@archiver.kernel.org>; Wed,  1 Jan 2025 09:32:36 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.11336.1735723943081916594
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jan 2025 01:32:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=QEiDtZy4;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=SM3n8NXt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101942135985d-ee785bd9-4935-4c3c-9277-5f991409517e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1735723948;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vs+XKMBA3X/kncWIJvNmjZ/x+m65vjO8rF1DCW9OAR0=;
	b=QEiDtZy4LlzkwwLem58DTbORRwDs2jtZ6DyD/r0OVwdjmvz17qvED6gLhJ6qHAB1
	aNyVW5mhZ6MC6SwBsjf0KLT1KaUj4/8gJdsMqfqMl81sCEORL5QXqIK8++xJbnCjIJq
	72YZah25H2r4XNBNVGzCg85LcX7hY8v9Ztq71jAs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1735723948;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vs+XKMBA3X/kncWIJvNmjZ/x+m65vjO8rF1DCW9OAR0=;
	b=SM3n8NXtbIjg0nZujOOoZpyOEUt1Ya2qYZjx7PB5n/55v2OmPBA6aVOK6j2G8s9r
	O/S4LPlrhFnZteBq03woz1vP/eIN331vJqDVI3hi1iSeAWIZw5bD+76UPIQmA6CWkTD
	CX3D/TPxoladc7R52Ol0iJKnS7bq8MqAL4EMnHT4=
Content-Type: multipart/mixed; boundary="===============1914491611030447555=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-numpy: upgrading to 2.2.1 SUCCEEDED
Message-ID: <010101942135985d-ee785bd9-4935-4c3c-9277-5f991409517e-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jan 2025 09:32:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jan 2025 09:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209220

--===============1914491611030447555==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-numpy* to *2.2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-numpy-upgrade-2.1.3-2.2.1.patch
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
From d34e4c02ddfd4f887d1d7094762484c31d795b8c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jan 2025 07:15:27 +0000
Subject: [PATCH] python3-numpy: upgrade 2.1.3 -> 2.2.1

---
 ...-and-so-on-for-libraries-by-default-.patch |  7 +--
 ...1-numpy-core-Define-RISCV-32-support.patch | 58 -------------------
 .../python3-numpy/fix_reproducibility.patch   | 23 +++++---
 ...-numpy_2.1.3.bb => python3-numpy_2.2.1.bb} |  3 +-
 4 files changed, 19 insertions(+), 72 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
 rename meta/recipes-devtools/python/{python3-numpy_2.1.3.bb => python3-numpy_2.2.1.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
index bbe309c556..4a67308106 100644
--- a/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
+++ b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
@@ -1,4 +1,4 @@
-From 46eea664cf89d0602e7ff16d587c37c045b125b7 Mon Sep 17 00:00:00 2001
+From 16a973c118989674afeeda2c2ccc24c9c366210e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 10 Dec 2015 13:20:30 +0200
 Subject: [PATCH] Don't search /usr and so on for libraries by default to
@@ -8,16 +8,15 @@ Subject: [PATCH] Don't search /usr and so on for libraries by default to
 Upstream-Status: Inappropriate (As the code stands, this is a hack)
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  numpy/distutils/system_info.py | 42 +++++-----------------------------
  1 file changed, 6 insertions(+), 36 deletions(-)
 
 diff --git a/numpy/distutils/system_info.py b/numpy/distutils/system_info.py
-index feb28f6..a48d6d1 100644
+index 6478548..c0620e7 100644
 --- a/numpy/distutils/system_info.py
 +++ b/numpy/distutils/system_info.py
-@@ -327,44 +327,14 @@ def add_system_root(library_root):
+@@ -326,44 +326,14 @@ def add_system_root(library_root):
          add_system_root(os.path.join(conda_dir, 'Library'))
  
  else:
diff --git a/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch b/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
deleted file mode 100644
index 6da9047ec5..0000000000
--- a/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 0e2b652a0eff85798584116c905a2d6ad8f25d5f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 15 Nov 2020 15:32:39 -0800
-Subject: [PATCH] numpy/core: Define RISCV-32 support
-
-Helps compile on riscv32
-
-Upstream-Status: Backport
-(https://github.com/numpy/numpy/pull/17780/commits/0e2b652a0eff85798584116c905a2d6ad8f25d5f)
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- numpy/_core/include/numpy/npy_cpu.h    | 9 +++++++--
- numpy/_core/include/numpy/npy_endian.h | 1 +
- 2 files changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/numpy/_core/include/numpy/npy_cpu.h b/numpy/_core/include/numpy/npy_cpu.h
-index a19f8e6bbd..15f9f12931 100644
---- a/numpy/_core/include/numpy/npy_cpu.h
-+++ b/numpy/_core/include/numpy/npy_cpu.h
-@@ -18,6 +18,7 @@
-  *              NPY_CPU_ARCEL
-  *              NPY_CPU_ARCEB
-  *              NPY_CPU_RISCV64
-+ *              NPY_CPU_RISCV32
-  *              NPY_CPU_LOONGARCH
-  *              NPY_CPU_WASM
-  */
-@@ -102,8 +103,12 @@
-     #define NPY_CPU_ARCEL
- #elif defined(__arc__) && defined(__BIG_ENDIAN__)
-     #define NPY_CPU_ARCEB
--#elif defined(__riscv) && defined(__riscv_xlen) && __riscv_xlen == 64
--    #define NPY_CPU_RISCV64
-+#elif defined(__riscv)
-+    #if __riscv_xlen == 64
-+	#define NPY_CPU_RISCV64
-+    #elif __riscv_xlen == 32
-+	#define NPY_CPU_RISCV32
-+    #endif
- #elif defined(__loongarch__)
-     #define NPY_CPU_LOONGARCH
- #elif defined(__EMSCRIPTEN__)
-diff --git a/numpy/_core/include/numpy/npy_endian.h b/numpy/_core/include/numpy/npy_endian.h
-index 5e58a7f52c..09262120bf 100644
---- a/numpy/_core/include/numpy/npy_endian.h
-+++ b/numpy/_core/include/numpy/npy_endian.h
-@@ -49,6 +49,7 @@
-             || defined(NPY_CPU_PPC64LE)       \
-             || defined(NPY_CPU_ARCEL)         \
-             || defined(NPY_CPU_RISCV64)       \
-+            || defined(NPY_CPU_RISCV32)       \
-             || defined(NPY_CPU_LOONGARCH)     \
-             || defined(NPY_CPU_WASM)
-         #define NPY_BYTE_ORDER NPY_LITTLE_ENDIAN
--- 
-2.39.5
-
diff --git a/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch b/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
index d952aed00c..18d7f3f84e 100644
--- a/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
+++ b/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
@@ -1,7 +1,11 @@
-This regex decides whether to use O3 opimisation on numpy or not.
+From cde931f4380745b9818b55d7b06a43d347518967 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/python/python3-numpy_2.1.3.bb b/meta/recipes-devtools/python/python3-numpy_2.2.1.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-numpy_2.1.3.bb
rename to meta/recipes-devtools/python/python3-numpy_2.2.1.bb
index 0120bee439..c2bb614461 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.1.3.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.2.1.bb
@@ -9,11 +9,10 @@ SRCNAME = "numpy"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
-           file://0001-numpy-core-Define-RISCV-32-support.patch \
            file://fix_reproducibility.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "aa08e04e08aaf974d4458def539dece0d28146d866a39da5639596f4921fd761"
+SRC_URI[sha256sum] = "45681fd7128c8ad1c379f0ca0776a8b0c6583d2f69889ddac01559dfe4390918"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.44.1


--===============1914491611030447555==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-numpy: PKGV changed from 2.1.3 [default] to 2.2.1 [default]
packages/core2-64-poky-linux/python3-numpy: SRC_URI changed from "https://github.com/numpy/numpy/releases/download/v2.1.3/numpy-2.1.3.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://0001-numpy-core-Define-RISCV-32-support.patch file://fix_reproducibility.patch file://run-ptest" to "https://github.com/numpy/numpy/releases/download/v2.2.1/numpy-2.2.1.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://fix_reproducibility.patch file://run-ptest"
packages/core2-64-poky-linux/python3-numpy: PV changed from "2.1.3" to "2.2.1"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-dbg: PKGSIZE changed from 122856960 to 122919584 (+0%)
packages/core2-64-poky-linux/python3-numpy/python3-numpy-dbg: PV changed from "2.1.3" to "2.2.1"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-dbg: PKGV changed from 2.1.3 [default] to 2.2.1 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-dev: PV changed from "2.1.3" to "2.2.1"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-dev: PKGV changed from 2.1.3 [default] to 2.2.1 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-doc: PV changed from "2.1.3" to "2.2.1"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-doc: PKGV changed from 2.1.3 [default] to 2.2.1 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-locale: PV changed from "2.1.3" to "2.2.1"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-locale: PKGV changed from 2.1.3 [default] to 2.2.1 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-ptest: PV changed from "2.1.3" to "2.2.1"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-ptest: PKGV changed from 2.1.3 [default] to 2.2.1 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-src: FILELIST: directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/random/src/legacy -> /usr/src/debug/python3-numpy/2.2.1/numpy/random/src/legacy, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/npymath -> /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/npymath, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/random/bit_generator.cpython-313-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.2.1/numpy/random/bit_generator.cpython-313-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/random/_bounded_integers.cpython-313-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.2.1/numpy/random/_bounded_integers.cpython-313-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/highway/hwy -> /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/highway/hwy, directory 
 renamed /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/npysort -> /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/npysort, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/_simd -> /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/_simd, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/random/src/philox -> /usr/src/debug/python3-numpy/2.2.1/numpy/random/src/philox, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/simd/sse -> /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/simd/sse, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/linalg -> /usr/src/debug/python3-numpy/2.2.1/numpy/linalg, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/_core -> /usr/src/debug/python3-numpy/2.2.1/numpy/_core, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/random/_mt19937.cpython-313-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.2.1/numpy/random/_mt19937.cpython-313-x86_64-
 linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/random/mtrand.cpython-313-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.2.1/numpy/random/mtrand.cpython-313-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/highway/hwy/ops -> /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/highway/hwy/ops, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/random/include -> /usr/src/debug/python3-numpy/2.2.1/numpy/random/include, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/multiarray/textreading -> /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/multiarray/textreading, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/random/_common.cpython-313-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.2.1/numpy/random/_common.cpython-313-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.1.3/n
 umpy/_core/src/common/simd -> /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/simd, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/random/src/pcg64 -> /usr/src/debug/python3-numpy/2.2.1/numpy/random/src/pcg64, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/random/src/sfc64 -> /usr/src/debug/python3-numpy/2.2.1/numpy/random/src/sfc64, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/simd/avx512 -> /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/simd/avx512, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/_core/include/numpy -> /usr/src/debug/python3-numpy/2.2.1/numpy/_core/include/numpy, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/fft -> /usr/src/debug/python3-numpy/2.2.1/numpy/fft, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/random/src/mt19937 -> /usr/src/debug/python3-numpy/2.2.1/numpy/random/src/mt19937, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/_core/sr
 c/multiarray/stringdtype -> /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/multiarray/stringdtype, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/dlpack -> /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/dlpack, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/multiarray -> /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/multiarray, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/random/_generator.cpython-313-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.2.1/numpy/random/_generator.cpython-313-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/random/src/distributions -> /usr/src/debug/python3-numpy/2.2.1/numpy/random/src/distributions, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/simd/avx2 -> /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/simd/avx2, directory renamed /usr/src/debug/python3-numpy/2.1
 .3/numpy/_core/include/numpy/libdivide -> /usr/src/debug/python3-numpy/2.2.1/numpy/_core/include/numpy/libdivide, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/npysort/x86-simd-sort/src -> /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/npysort/x86-simd-sort/src, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/fft/pocketfft -> /usr/src/debug/python3-numpy/2.2.1/numpy/fft/pocketfft, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/random/_pcg64.cpython-313-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.2.1/numpy/random/_pcg64.cpython-313-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/random/_sfc64.cpython-313-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.2.1/numpy/random/_sfc64.cpython-313-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/linalg/lapack_lite -> /usr/src/debug/python3-numpy/2.2.1/numpy/l
 inalg/lapack_lite, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/_core/include/numpy/random -> /usr/src/debug/python3-numpy/2.2.1/numpy/_core/include/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/random/_philox.cpython-313-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.2.1/numpy/random/_philox.cpython-313-x86_64-linux-gnu.so.p/numpy/random, removed "/usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/loops_trigonometric.dispatch.cpp /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/npy_binsearch.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/npy_argparse.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/npy_hashtable.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/npy_argparse.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/npy_hashtable.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/npy_svml.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/commo
 n/numpy_tag.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/string_ufuncs.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/loops_arithm_fp.dispatch.c.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/npy_import.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/loops.c.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/loops.h.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/npy_import.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/loops_unary.dispatch.c.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/npy_partition.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/_scaled_float_dtype.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/loops_arithmetic.dispatch.c.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/ufunc_object.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/loops_exponent_log.dispatch.c.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/um
 ath/ufunc_object.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/numpyos.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/gil_utils.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/numpyos.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/gil_utils.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/override.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/ucsnarrow.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/umathmodule.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/override.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/scalarmath.c.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/umathmodule.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/ucsnarrow.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/mem_overlap.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/loops_autovec.dispatch.c.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/
 common/mem_overlap.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/npy_atomic.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/loops_hyperbolic.dispatch.c.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/string_fastsearch.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/ufunc_override.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/binop_override.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/ufunc_override.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/loops_modulo.dispatch.c.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/npy_cpu_features.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/npy_cpu_features.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/reduction.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/_struct_ufunc_tests.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/reduction.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/l
 oops_logical.dispatch.c.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/templ_common.h.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/matmul.h.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/npy_cpu_dispatch.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/npy_simd_data.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/npy_cpu_dispatch.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/half_private.hpp /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/npy_sort.h.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/loops_unary_fp.dispatch.c.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/special_integer_comparisons.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/loops_unary_fp_le.dispatch.c.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/lowlevel_strided_loops.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/clip.cpp /usr/src/debug/python3-numpy/2.1.3
 /numpy/_core/src/umath/loops_comparison.dispatch.c.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/loops_umath_fp.dispatch.c.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/clip.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/_umath_tests.dispatch.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/dispatching.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/stringdtype_ufuncs.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/_operand_flag_tests.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/extobj.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/dispatching.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/string_ufuncs.cpp /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/extobj.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/loops_unary_complex.dispatch.c.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/npy_ctypes.h /usr/src/debug/python3-numpy/2.1.3/numpy/
 _core/src/umath/string_buffer.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/npy_longdouble.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/funcs.inc.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/npy_longdouble.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/matmul.c.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/_rational_tests.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/get_attr_string.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/fast_loop_macros.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/stringdtype_ufuncs.cpp /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/loops_utils.h.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/npstd.hpp /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/npy_dlpack.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/utils.hpp /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/npy_extint128.h /usr/src/de
 bug/python3-numpy/2.1.3/numpy/_core/src/umath/loops_minmax.dispatch.c.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/half.hpp /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/meta.hpp /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/_umath_tests.c.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/wrapping_array_method.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/special_integer_comparisons.cpp /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/legacy_array_method.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/legacy_array_method.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/ufunc_type_resolution.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/array_assign.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/float_status.hpp /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/array_assign.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/ufunc_type_resolution.c", 
 added "/usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/loops_trigonometric.dispatch.cpp /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/npy_binsearch.h /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/npy_argparse.c /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/npy_hashtable.h /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/npy_argparse.h /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/npy_svml.h /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/numpy_tag.h /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/string_ufuncs.h /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/loops_arithm_fp.dispatch.c.src /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/npy_import.c /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/loops.c.src /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/loops.h.src /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/npy_import.h /usr/src/debug/python3-num
 py/2.2.1/numpy/_core/src/umath/loops_unary.dispatch.c.src /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/npy_partition.h /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/_scaled_float_dtype.c /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/loops_arithmetic.dispatch.c.src /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/ufunc_object.c /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/loops_exponent_log.dispatch.c.src /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/ufunc_object.h /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/numpyos.c /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/gil_utils.h /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/numpyos.h /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/gil_utils.c /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/override.h /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/ucsnarrow.h /usr/src/debug/python3-numpy/2.2.1/numpy/_core/s
 rc/common/umathmodule.h /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/override.c /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/scalarmath.c.src /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/umathmodule.c /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/ucsnarrow.c /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/mem_overlap.c /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/loops_autovec.dispatch.c.src /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/mem_overlap.h /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/npy_atomic.h /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/loops_hyperbolic.dispatch.c.src /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/string_fastsearch.h /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/ufunc_override.c /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/binop_override.h /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/ufunc_override.
 h /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/loops_modulo.dispatch.c.src /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/npy_cpu_features.h /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/npy_cpu_features.c /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/reduction.c /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/_struct_ufunc_tests.c /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/reduction.h /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/loops_logical.dispatch.c.src /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/templ_common.h.src /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/matmul.h.src /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/npy_cpu_dispatch.h /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/npy_simd_data.h /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/npy_cpu_dispatch.c /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/half_private.hpp /usr
 /src/debug/python3-numpy/2.2.1/numpy/_core/src/common/npy_sort.h.src /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/loops_unary_fp.dispatch.c.src /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/special_integer_comparisons.h /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/loops_unary_fp_le.dispatch.c.src /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/lowlevel_strided_loops.h /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/clip.cpp /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/loops_comparison.dispatch.c.src /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/loops_umath_fp.dispatch.c.src /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/clip.h /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/npy_hashtable.cpp /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/_umath_tests.dispatch.c /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/stringdtype_ufuncs.h /usr/src/debug/python3-numpy/2.2.1/numpy
 /_core/src/umath/_operand_flag_tests.c /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/extobj.c /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/dispatching.h /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/string_ufuncs.cpp /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/extobj.h /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/loops_unary_complex.dispatch.c.src /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/npy_ctypes.h /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/string_buffer.h /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/npy_longdouble.h /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/funcs.inc.src /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/npy_longdouble.c /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/matmul.c.src /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/_rational_tests.c /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/get_attr_string.h /u
 sr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/fast_loop_macros.h /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/stringdtype_ufuncs.cpp /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/loops_utils.h.src /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/npstd.hpp /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/npy_dlpack.h /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/utils.hpp /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/dispatching.cpp /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/npy_extint128.h /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/loops_minmax.dispatch.c.src /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/half.hpp /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/meta.hpp /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/_umath_tests.c.src /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/wrapping_array_method.c /usr/src/debug/python3-numpy/2.2.1/num
 py/_core/src/umath/special_integer_comparisons.cpp /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/legacy_array_method.h /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/legacy_array_method.c /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/ufunc_type_resolution.h /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/array_assign.h /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/float_status.hpp /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/common/array_assign.c /usr/src/debug/python3-numpy/2.2.1/numpy/_core/src/umath/ufunc_type_resolution.c"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-src: PKGSIZE changed from 24337188 to 24378899 (+0%)
packages/core2-64-poky-linux/python3-numpy/python3-numpy-src: PV changed from "2.1.3" to "2.2.1"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-src: PKGV changed from 2.1.3 [default] to 2.2.1 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-staticdev: PV changed from "2.1.3" to "2.2.1"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-staticdev: PKGV changed from 2.1.3 [default] to 2.2.1 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy: FILELIST: directory renamed /usr/lib/python3.13/site-packages/numpy-2.1.3.dist-info -> /usr/lib/python3.13/site-packages/numpy-2.2.1.dist-info, removed "/usr/lib/python3.13/site-packages/numpy/typing/tests/data/fail/false_positives.pyi", added "/usr/lib/python3.13/site-packages/numpy/f2py/tests/src/routines/funcfortranname.pyf /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/routines/funcfortranname.f /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/routines/subrout.f /usr/lib/python3.13/site-packages/numpy/__config__.pyi /usr/lib/python3.13/site-packages/numpy/f2py/tests/test_routines.py /usr/lib/python3.13/site-packages/numpy/_typing/_ufunc.py /usr/lib/python3.13/site-packages/numpy/typing/tests/data/pass/__pycache__/nditer.cpython-313.pyc /usr/lib/python3.13/site-packages/numpy/_typing/__pycache__/_ufunc.cpython-313.pyc /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/regression/assignOnlyModule.f90 /usr/l
 ib/python3.13/site-packages/numpy/_typing/_nbit_base.py /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/regression/datonly.f90 /usr/lib/python3.13/site-packages/numpy/_typing/__pycache__/_nbit_base.cpython-313.pyc /usr/lib/python3.13/site-packages/numpy/typing/tests/data/pass/nditer.py /usr/lib/python3.13/site-packages/numpy/typing/tests/data/reveal/ndarray_assignability.pyi /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/callback/gh26681.f90 /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/routines/subrout.pyf /usr/lib/python3.13/site-packages/numpy/f2py/tests/__pycache__/test_routines.cpython-313.pyc /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/crackfortran/gh27697.f90"
packages/core2-64-poky-linux/python3-numpy/python3-numpy: PKGSIZE changed from 42316743 to 42552732 (+1%)
packages/core2-64-poky-linux/python3-numpy/python3-numpy: PV changed from "2.1.3" to "2.2.1"
packages/core2-64-poky-linux/python3-numpy/python3-numpy: PKGV changed from 2.1.3 [default] to 2.2.1 [default]
Changes to packages/core2-64-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.13/site-packages/numpy/f2py/crackfortran.py changed permissions from rwxr-xr-x to rw-r--r--
  /usr/lib/python3.13/site-packages/numpy/f2py/f2py2e.py changed permissions from rwxr-xr-x to rw-r--r--
  /usr/lib/python3.13/site-packages/numpy/f2py/rules.py changed permissions from rwxr-xr-x to rw-r--r--
  /usr/lib/python3.13/site-packages/numpy-2.1.3.dist-info moved to /usr/lib/python3.13/site-packages/numpy-2.2.1.dist-info
  /usr/lib/python3.13/site-packages/numpy/__config__.pyi was added
  /usr/lib/python3.13/site-packages/numpy/f2py/tests/__pycache__/test_routines.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/callback/gh26681.f90 was added
  /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/crackfortran/gh27697.f90 was added
  /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/regression/assignOnlyModule.f90 was added
  /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/regression/datonly.f90 was added
  /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/routines was added
  /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/routines/funcfortranname.f was added
  /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/routines/funcfortranname.pyf was added
  /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/routines/subrout.f was added
  /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/routines/subrout.pyf was added
  /usr/lib/python3.13/site-packages/numpy/f2py/tests/test_routines.py was added
  /usr/lib/python3.13/site-packages/numpy/_typing/_nbit_base.py was added
  /usr/lib/python3.13/site-packages/numpy/_typing/__pycache__/_nbit_base.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/numpy/_typing/__pycache__/_ufunc.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/numpy/typing/tests/data/pass/nditer.py was added
  /usr/lib/python3.13/site-packages/numpy/typing/tests/data/pass/__pycache__/nditer.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/numpy/typing/tests/data/reveal/ndarray_assignability.pyi was added
  /usr/lib/python3.13/site-packages/numpy/_typing/_ufunc.py was added
  /usr/lib/python3.13/site-packages/numpy/typing/tests/data/fail/false_positives.pyi was removed

--===============1914491611030447555==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-numpy/python3-numpy: FILELIST: directory renamed /usr/lib/python3.13/site-packages/numpy-2.1.3.dist-info -> /usr/lib/python3.13/site-packages/numpy-2.2.1.dist-info, removed "/usr/lib/python3.13/site-packages/numpy/typing/tests/data/fail/false_positives.pyi", added "/usr/lib/python3.13/site-packages/numpy/f2py/tests/src/routines/subrout.pyf /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/routines/funcfortranname.f /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/regression/assignOnlyModule.f90 /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/routines/subrout.f /usr/lib/python3.13/site-packages/numpy/_typing/_ufunc.py /usr/lib/python3.13/site-packages/numpy/_typing/_nbit_base.py /usr/lib/python3.13/site-packages/numpy/typing/tests/data/reveal/ndarray_assignability.pyi /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/callback/gh26681.f90 /usr/lib/python3.13/site-packages/numpy/f2py/tests/__pycache__/test_routines.cpython-313.
 pyc /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/crackfortran/gh27697.f90 /usr/lib/python3.13/site-packages/numpy/typing/tests/data/pass/nditer.py /usr/lib/python3.13/site-packages/numpy/__config__.pyi /usr/lib/python3.13/site-packages/numpy/f2py/tests/test_routines.py /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/regression/datonly.f90 /usr/lib/python3.13/site-packages/numpy/_typing/__pycache__/_nbit_base.cpython-313.pyc /usr/lib/python3.13/site-packages/numpy/_typing/__pycache__/_ufunc.cpython-313.pyc /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/routines/funcfortranname.pyf /usr/lib/python3.13/site-packages/numpy/typing/tests/data/pass/__pycache__/nditer.cpython-313.pyc"
Changes to packages/core2-64-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.13/site-packages/numpy/f2py/crackfortran.py changed permissions from rwxr-xr-x to rw-r--r--
  /usr/lib/python3.13/site-packages/numpy/f2py/f2py2e.py changed permissions from rwxr-xr-x to rw-r--r--
  /usr/lib/python3.13/site-packages/numpy/f2py/rules.py changed permissions from rwxr-xr-x to rw-r--r--
  /usr/lib/python3.13/site-packages/numpy-2.1.3.dist-info moved to /usr/lib/python3.13/site-packages/numpy-2.2.1.dist-info
  /usr/lib/python3.13/site-packages/numpy/__config__.pyi was added
  /usr/lib/python3.13/site-packages/numpy/f2py/tests/__pycache__/test_routines.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/callback/gh26681.f90 was added
  /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/crackfortran/gh27697.f90 was added
  /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/regression/assignOnlyModule.f90 was added
  /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/regression/datonly.f90 was added
  /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/routines was added
  /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/routines/funcfortranname.f was added
  /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/routines/funcfortranname.pyf was added
  /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/routines/subrout.f was added
  /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/routines/subrout.pyf was added
  /usr/lib/python3.13/site-packages/numpy/f2py/tests/test_routines.py was added
  /usr/lib/python3.13/site-packages/numpy/_typing/_nbit_base.py was added
  /usr/lib/python3.13/site-packages/numpy/_typing/__pycache__/_nbit_base.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/numpy/_typing/__pycache__/_ufunc.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/numpy/typing/tests/data/pass/nditer.py was added
  /usr/lib/python3.13/site-packages/numpy/typing/tests/data/pass/__pycache__/nditer.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/numpy/typing/tests/data/reveal/ndarray_assignability.pyi was added
  /usr/lib/python3.13/site-packages/numpy/_typing/_ufunc.py was added
  /usr/lib/python3.13/site-packages/numpy/typing/tests/data/fail/false_positives.pyi was removed

--===============1914491611030447555==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (0 cached, 920 parsed). 1876 targets, 52 skipped, 0 masked, 0 errors.
Removing 26 recipes from the core2-64 sysroot...done.
Removing 65 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:d5a74abe5c5f173e733e9f6ba7a7be8d9628aee0"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 542 Local 528 Mirrors 0 Missed 14 Current 264 (97% match, 98% complete)
Removing 3 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 274 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 275 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 276 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 278 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.12.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 285 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 292 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.4.bb:do_package_qa_setscene)
NOTE: Running setscene task 293 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 295 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 296 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 303 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.12.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 304 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 305 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package_qa_setscene)
NOTE: Running setscene task 306 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.12.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 310 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 313 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 314 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-typing-extensions-4.12.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-8.3.4-r0: task do_package_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-typing-extensions-4.12.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-typing-extensions-4.12.2-r0: task do_package_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 315 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-3.13.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pytest-8.3.4-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.13.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.12.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.12.2-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 318 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.122.6.bb:do_package_qa_setscene)
NOTE: Running setscene task 319 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.122.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 325 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 330 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.122.6.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 332 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 334 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 336 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_package_qa_setscene)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.12.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 342 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.122.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 359 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 367 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 371 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.4.bb:do_create_spdx_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 383 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.12.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 385 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.122.6.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-hypothesis-6.122.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-hypothesis-6.122.6-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-pytest-8.3.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pytest-8.3.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-hypothesis-6.122.6-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-hypothesis-6.122.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-typing-extensions-4.12.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pytest-8.3.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-8.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-numpy-2.2.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-hypothesis-6.122.6-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-hypothesis-6.122.6-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 386 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_deb_setscene)
NOTE: recipe python3-hypothesis-6.122.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 388 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.12.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-pytest-8.3.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 391 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-hypothesis-6.122.6-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pytest-8.3.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 401 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-hypothesis-6.122.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.12.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pytest-8.3.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pytest-8.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-numpy-2.2.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.122.6-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.13.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 413 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.122.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 414 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pluggy_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 417 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 418 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 419 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_24.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.13.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-typing-extensions-4.12.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 423 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_packagedata_setscene)
NOTE: Running setscene task 424 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 425 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 426 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.122.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-8.3.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 427 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_packagedata_setscene)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-24.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-24.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-typing-extensions-4.12.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 428 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 431 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-20240203-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.43.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 434 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: recipe tzdata-2024b-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-8.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pluggy-1.5.0-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-hypothesis/6.122.6/temp/log.do_packagedata_setscene.1258943
NOTE: recipe python3-packaging-24.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 438 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 440 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.12.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 442 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.122.6.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 445 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.122.6.bb:do_package_setscene)
NOTE: recipe python3-attrs-24.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20240203-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.12.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2024b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.12.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.43.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 448 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 453 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 478 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 479 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 500 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_packagedata_setscene)
NOTE: Running setscene task 501 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 505 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 510 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.12.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 512 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 515 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 521 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-typing-extensions-4.12.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pytest-8.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.12.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pytest-8.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 535 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 538 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 848 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.1.bb:do_recipe_qa)
NOTE: Running setscene task 544 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 547 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 551 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 557 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 558 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: Running task 944 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.1.bb:do_write_config)
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-numpy-2.2.1-r0: task do_recipe_qa: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.7-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 569 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-numpy-2.2.1-r0: task do_write_config: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-numpy-2.2.1-r0: task do_write_config: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 587 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 588 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 591 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe python3-hypothesis-6.122.6-r0: task do_package_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-numpy-2.2.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1350 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.1.bb:do_fetch)
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-numpy-2.2.1-r0: task do_fetch: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 617 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata_setscene)
NOTE: recipe python3-numpy-2.2.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 618 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 622 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_packagedata_setscene)
NOTE: Running setscene task 626 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.71.bb:do_packagedata_setscene)
NOTE: Running task 1367 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.1.bb:do_unpack)
NOTE: recipe curl-8.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 631 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.71-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 637 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 638 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 641 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 644 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: recipe python3-numpy-2.2.1-r0: task do_unpack: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.71-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 653 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.122.6-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 657 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 658 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 660 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.122.6.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 676 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe python3-hypothesis-6.122.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 679 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.122.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 690 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 691 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 692 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 693 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 694 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 695 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 696 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 697 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 698 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 699 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 700 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 701 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 702 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 703 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 704 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-numpy-2.2.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 705 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 707 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 711 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 712 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 713 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 714 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 715 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 716 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 718 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 726 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe libedit-20240808-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 729 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 732 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1452 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.1.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 735 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 737 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-numpy-2.2.1-r0: task do_patch: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 738 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 740 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 741 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.13.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 744 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 745 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 747 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 749 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 752 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 754 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 756 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-numpy-2.2.1-r0: task do_patch: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 758 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 759 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 761 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: Running task 1519 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 766 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-numpy-2.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 767 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 769 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 771 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-numpy-2.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 773 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 775 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 776 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 778 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 779 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 780 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 785 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 786 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 787 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 790 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 793 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 795 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 797 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 798 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 801 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 803 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 805 of 806 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1890 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2045 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.122.6.bb:do_packagedata)
NOTE: Running task 2188 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-numpy-2.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.122.6-r0: task do_packagedata: Started
NOTE: recipe python3-numpy-2.2.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-hypothesis-6.122.6-r0: task do_packagedata: Succeeded
NOTE: recipe python3-numpy-2.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-numpy-2.2.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2241 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.1.bb:do_configure)
NOTE: recipe python3-numpy-2.2.1-r0: task do_configure: Started
NOTE: recipe python3-numpy-2.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2242 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.1.bb:do_configure_ptest_base)
NOTE: recipe python3-numpy-2.2.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-2.2.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2243 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.1.bb:do_compile)
NOTE: recipe python3-numpy-2.2.1-r0: task do_compile: Started
NOTE: recipe python3-numpy-2.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2244 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.1.bb:do_compile_ptest_base)
NOTE: recipe python3-numpy-2.2.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-numpy-2.2.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2245 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.1.bb:do_install)
NOTE: recipe python3-numpy-2.2.1-r0: task do_install: Started
NOTE: recipe python3-numpy-2.2.1-r0: task do_install: Succeeded
NOTE: Running task 2246 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.1.bb:do_install_ptest_base)
NOTE: recipe python3-numpy-2.2.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-numpy-2.2.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2247 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.1.bb:do_package)
NOTE: Running task 2248 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.1.bb:do_populate_sysroot)
NOTE: recipe python3-numpy-2.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-numpy-2.2.1-r0: task do_package: Started
NOTE: recipe python3-numpy-2.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-numpy-2.2.1-r0: task do_package: Succeeded
NOTE: Running task 2249 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.1.bb:do_packagedata)
NOTE: recipe python3-numpy-2.2.1-r0: task do_packagedata: Started
NOTE: recipe python3-numpy-2.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2250 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.1.bb:do_create_spdx)
NOTE: Running task 2251 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.1.bb:do_package_write_ipk)
NOTE: Running task 2252 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.1.bb:do_package_write_deb)
NOTE: Running task 2253 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.1.bb:do_package_write_rpm)
NOTE: Running task 2254 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.1.bb:do_package_qa)
NOTE: recipe python3-numpy-2.2.1-r0: task do_create_spdx: Started
NOTE: recipe python3-numpy-2.2.1-r0: task do_package_write_ipk: Started
NOTE: recipe python3-numpy-2.2.1-r0: task do_package_write_deb: Started
NOTE: recipe python3-numpy-2.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-numpy-2.2.1-r0: task do_package_qa: Started
NOTE: recipe python3-numpy-2.2.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2255 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.1.bb:do_create_package_spdx)
NOTE: recipe python3-numpy-2.2.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-numpy-2.2.1-r0: task do_create_package_spdx: Started
NOTE: recipe python3-numpy-2.2.1-r0: task do_package_qa: Succeeded
NOTE: recipe python3-numpy-2.2.1-r0: task do_create_package_spdx: Succeeded
NOTE: recipe python3-numpy-2.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-numpy-2.2.1-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 2256 of 2256 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_2.2.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2256 tasks of which 2231 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-hypothesis-6.122.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.123.2-r0 to 0:6.122.6-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.122.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.123.2-r0 to 0:6.122.6-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.122.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.123.2-r0 to 0:6.122.6-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.122.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.123.2-r0 to 0:6.122.6-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.122.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.123.2-r0 to 0:6.122.6-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.122.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.123.2-r0 to 0:6.122.6-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.122.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.123.2-r0 to 0:6.122.6-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.122.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.123.2-r0 to 0:6.122.6-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.122.6-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1914491611030447555==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-numpy-upgrade-2.1.3-2.2.1.patch"

RnJvbSBkMzRlNGMwMmRkZmQ0Zjg4N2QxZDcwOTQ3NjI0ODRjMzFkNzk1YjhjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBKYW4gMjAyNSAwNzoxNToyNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbnVtcHk6IHVwZ3JhZGUgMi4xLjMgLT4gMi4yLjEKCi0tLQogLi4uLWFuZC1zby1vbi1m
b3ItbGlicmFyaWVzLWJ5LWRlZmF1bHQtLnBhdGNoIHwgIDcgKy0tCiAuLi4xLW51bXB5LWNvcmUt
RGVmaW5lLVJJU0NWLTMyLXN1cHBvcnQucGF0Y2ggfCA1OCAtLS0tLS0tLS0tLS0tLS0tLS0tCiAu
Li4vcHl0aG9uMy1udW1weS9maXhfcmVwcm9kdWNpYmlsaXR5LnBhdGNoICAgfCAyMyArKysrKy0t
LQogLi4uLW51bXB5XzIuMS4zLmJiID0+IHB5dGhvbjMtbnVtcHlfMi4yLjEuYmJ9IHwgIDMgKy0K
IDQgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgNzIgZGVsZXRpb25zKC0pCiBkZWxl
dGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5
LzAwMDEtbnVtcHktY29yZS1EZWZpbmUtUklTQ1YtMzItc3VwcG9ydC5wYXRjaAogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtbnVtcHlfMi4xLjMuYmIgPT4gcHl0
aG9uMy1udW1weV8yLjIuMS5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHkvMDAwMS1Eb24tdC1zZWFyY2gtdXNyLWFuZC1zby1v
bi1mb3ItbGlicmFyaWVzLWJ5LWRlZmF1bHQtLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLW51bXB5LzAwMDEtRG9uLXQtc2VhcmNoLXVzci1hbmQtc28tb24tZm9y
LWxpYnJhcmllcy1ieS1kZWZhdWx0LS5wYXRjaAppbmRleCBiYmUzMDljNTU2Li40YTY3MzA4MTA2
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHkv
MDAwMS1Eb24tdC1zZWFyY2gtdXNyLWFuZC1zby1vbi1mb3ItbGlicmFyaWVzLWJ5LWRlZmF1bHQt
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weS8w
MDAxLURvbi10LXNlYXJjaC11c3ItYW5kLXNvLW9uLWZvci1saWJyYXJpZXMtYnktZGVmYXVsdC0u
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDQ2ZWVhNjY0Y2Y4OWQwNjAyZTdmZjE2ZDU4N2Mz
N2MwNDViMTI1YjcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDE2YTk3M2MxMTg5ODk2
NzRhZmVlZGEyYzJjY2MyNGM5YzM2NjIxMGUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFRodSwg
MTAgRGVjIDIwMTUgMTM6MjA6MzAgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gRG9uJ3Qgc2VhcmNo
IC91c3IgYW5kIHNvIG9uIGZvciBsaWJyYXJpZXMgYnkgZGVmYXVsdCB0bwpAQCAtOCwxNiArOCwx
NSBAQCBTdWJqZWN0OiBbUEFUQ0hdIERvbid0IHNlYXJjaCAvdXNyIGFuZCBzbyBvbiBmb3IgbGli
cmFyaWVzIGJ5IGRlZmF1bHQgdG8KIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSAoQXMg
dGhlIGNvZGUgc3RhbmRzLCB0aGlzIGlzIGEgaGFjaykKIFNpZ25lZC1vZmYtYnk6IFJvc3MgQnVy
dG9uIDxyb3NzLmJ1cnRvbkBpbnRlbC5jb20+CiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2Fu
YXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KLQogLS0tCiAgbnVtcHkvZGlzdHV0aWxzL3N5
c3RlbV9pbmZvLnB5IHwgNDIgKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogIDEg
ZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDM2IGRlbGV0aW9ucygtKQogCiBkaWZmIC0t
Z2l0IGEvbnVtcHkvZGlzdHV0aWxzL3N5c3RlbV9pbmZvLnB5IGIvbnVtcHkvZGlzdHV0aWxzL3N5
c3RlbV9pbmZvLnB5Ci1pbmRleCBmZWIyOGY2Li5hNDhkNmQxIDEwMDY0NAoraW5kZXggNjQ3ODU0
OC4uYzA2MjBlNyAxMDA2NDQKIC0tLSBhL251bXB5L2Rpc3R1dGlscy9zeXN0ZW1faW5mby5weQog
KysrIGIvbnVtcHkvZGlzdHV0aWxzL3N5c3RlbV9pbmZvLnB5Ci1AQCAtMzI3LDQ0ICszMjcsMTQg
QEAgZGVmIGFkZF9zeXN0ZW1fcm9vdChsaWJyYXJ5X3Jvb3QpOgorQEAgLTMyNiw0NCArMzI2LDE0
IEBAIGRlZiBhZGRfc3lzdGVtX3Jvb3QobGlicmFyeV9yb290KToKICAgICAgICAgIGFkZF9zeXN0
ZW1fcm9vdChvcy5wYXRoLmpvaW4oY29uZGFfZGlyLCAnTGlicmFyeScpKQogIAogIGVsc2U6CmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHkvMDAw
MS1udW1weS1jb3JlLURlZmluZS1SSVNDVi0zMi1zdXBwb3J0LnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5LzAwMDEtbnVtcHktY29yZS1EZWZpbmUtUklT
Q1YtMzItc3VwcG9ydC5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggNmRhOTA0
N2VjNS4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtbnVtcHkvMDAwMS1udW1weS1jb3JlLURlZmluZS1SSVNDVi0zMi1zdXBwb3J0LnBhdGNoCisr
KyAvZGV2L251bGwKQEAgLTEsNTggKzAsMCBAQAotRnJvbSAwZTJiNjUyYTBlZmY4NTc5ODU4NDEx
NmM5MDVhMmQ2YWQ4ZjI1ZDVmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogS2hlbSBS
YWogPHJhai5raGVtQGdtYWlsLmNvbT4KLURhdGU6IFN1biwgMTUgTm92IDIwMjAgMTU6MzI6Mzkg
LTA4MDAKLVN1YmplY3Q6IFtQQVRDSF0gbnVtcHkvY29yZTogRGVmaW5lIFJJU0NWLTMyIHN1cHBv
cnQKLQotSGVscHMgY29tcGlsZSBvbiByaXNjdjMyCi0KLVVwc3RyZWFtLVN0YXR1czogQmFja3Bv
cnQKLShodHRwczovL2dpdGh1Yi5jb20vbnVtcHkvbnVtcHkvcHVsbC8xNzc4MC9jb21taXRzLzBl
MmI2NTJhMGVmZjg1Nzk4NTg0MTE2YzkwNWEyZDZhZDhmMjVkNWYpCi0KLVNpZ25lZC1vZmYtYnk6
IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+Ci0tLS0KLSBudW1weS9fY29yZS9pbmNsdWRl
L251bXB5L25weV9jcHUuaCAgICB8IDkgKysrKysrKy0tCi0gbnVtcHkvX2NvcmUvaW5jbHVkZS9u
dW1weS9ucHlfZW5kaWFuLmggfCAxICsKLSAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKLQotZGlmZiAtLWdpdCBhL251bXB5L19jb3JlL2luY2x1ZGUvbnVt
cHkvbnB5X2NwdS5oIGIvbnVtcHkvX2NvcmUvaW5jbHVkZS9udW1weS9ucHlfY3B1LmgKLWluZGV4
IGExOWY4ZTZiYmQuLjE1ZjlmMTI5MzEgMTAwNjQ0Ci0tLS0gYS9udW1weS9fY29yZS9pbmNsdWRl
L251bXB5L25weV9jcHUuaAotKysrIGIvbnVtcHkvX2NvcmUvaW5jbHVkZS9udW1weS9ucHlfY3B1
LmgKLUBAIC0xOCw2ICsxOCw3IEBACi0gICogICAgICAgICAgICAgIE5QWV9DUFVfQVJDRUwKLSAg
KiAgICAgICAgICAgICAgTlBZX0NQVV9BUkNFQgotICAqICAgICAgICAgICAgICBOUFlfQ1BVX1JJ
U0NWNjQKLSsgKiAgICAgICAgICAgICAgTlBZX0NQVV9SSVNDVjMyCi0gICogICAgICAgICAgICAg
IE5QWV9DUFVfTE9PTkdBUkNICi0gICogICAgICAgICAgICAgIE5QWV9DUFVfV0FTTQotICAqLwot
QEAgLTEwMiw4ICsxMDMsMTIgQEAKLSAgICAgI2RlZmluZSBOUFlfQ1BVX0FSQ0VMCi0gI2VsaWYg
ZGVmaW5lZChfX2FyY19fKSAmJiBkZWZpbmVkKF9fQklHX0VORElBTl9fKQotICAgICAjZGVmaW5l
IE5QWV9DUFVfQVJDRUIKLS0jZWxpZiBkZWZpbmVkKF9fcmlzY3YpICYmIGRlZmluZWQoX19yaXNj
dl94bGVuKSAmJiBfX3Jpc2N2X3hsZW4gPT0gNjQKLS0gICAgI2RlZmluZSBOUFlfQ1BVX1JJU0NW
NjQKLSsjZWxpZiBkZWZpbmVkKF9fcmlzY3YpCi0rICAgICNpZiBfX3Jpc2N2X3hsZW4gPT0gNjQK
LSsJI2RlZmluZSBOUFlfQ1BVX1JJU0NWNjQKLSsgICAgI2VsaWYgX19yaXNjdl94bGVuID09IDMy
Ci0rCSNkZWZpbmUgTlBZX0NQVV9SSVNDVjMyCi0rICAgICNlbmRpZgotICNlbGlmIGRlZmluZWQo
X19sb29uZ2FyY2hfXykKLSAgICAgI2RlZmluZSBOUFlfQ1BVX0xPT05HQVJDSAotICNlbGlmIGRl
ZmluZWQoX19FTVNDUklQVEVOX18pCi1kaWZmIC0tZ2l0IGEvbnVtcHkvX2NvcmUvaW5jbHVkZS9u
dW1weS9ucHlfZW5kaWFuLmggYi9udW1weS9fY29yZS9pbmNsdWRlL251bXB5L25weV9lbmRpYW4u
aAotaW5kZXggNWU1OGE3ZjUyYy4uMDkyNjIxMjBiZiAxMDA2NDQKLS0tLSBhL251bXB5L19jb3Jl
L2luY2x1ZGUvbnVtcHkvbnB5X2VuZGlhbi5oCi0rKysgYi9udW1weS9fY29yZS9pbmNsdWRlL251
bXB5L25weV9lbmRpYW4uaAotQEAgLTQ5LDYgKzQ5LDcgQEAKLSAgICAgICAgICAgICB8fCBkZWZp
bmVkKE5QWV9DUFVfUFBDNjRMRSkgICAgICAgXAotICAgICAgICAgICAgIHx8IGRlZmluZWQoTlBZ
X0NQVV9BUkNFTCkgICAgICAgICBcCi0gICAgICAgICAgICAgfHwgZGVmaW5lZChOUFlfQ1BVX1JJ
U0NWNjQpICAgICAgIFwKLSsgICAgICAgICAgICB8fCBkZWZpbmVkKE5QWV9DUFVfUklTQ1YzMikg
ICAgICAgXAotICAgICAgICAgICAgIHx8IGRlZmluZWQoTlBZX0NQVV9MT09OR0FSQ0gpICAgICBc
Ci0gICAgICAgICAgICAgfHwgZGVmaW5lZChOUFlfQ1BVX1dBU00pCi0gICAgICAgICAjZGVmaW5l
IE5QWV9CWVRFX09SREVSIE5QWV9MSVRUTEVfRU5ESUFOCi0tLSAKLTIuMzkuNQotCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHkvZml4X3JlcHJv
ZHVjaWJpbGl0eS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1u
dW1weS9maXhfcmVwcm9kdWNpYmlsaXR5LnBhdGNoCmluZGV4IGQ5NTJhZWQwMGMuLjE4ZDdmM2Y4
NGUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1w
eS9maXhfcmVwcm9kdWNpYmlsaXR5LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1udW1weS9maXhfcmVwcm9kdWNpYmlsaXR5LnBhdGNoCkBAIC0xLDcgKzEs
MTEgQEAKLVRoaXMgcmVnZXggZGVjaWRlcyB3aGV0aGVyIHRvIHVzZSBPMyBvcGltaXNhdGlvbiBv
biBudW1weSBvciBub3QuCitGcm9tIGNkZTkzMWY0MzgwNzQ1Yjk4MThiNTVkN2IwNmE0M2QzNDc1
MTg5NjcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmlj
aGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KK0RhdGU6IEZyaSwgMjkgU2VwIDIwMjMg
MjI6NTM6MjQgKzAxMDAKK1N1YmplY3Q6IFtQQVRDSF0gVGhpcyByZWdleCBkZWNpZGVzIHdoZXRo
ZXIgdG8gdXNlIE8zIG9waW1pc2F0aW9uIG9uIG51bXB5IG9yCisgbm90LgogCiBJdCBpbmNsdWRl
cyAib2QiLCB3aGljaCBoYXBwZW5zIHRvIGJlIGEgc3Vic3RyaW5nIG9mICJyZXByb2R1Y2libGUi
Ci1idXQgbm90ICJxZW11eDg2LXdvcmxkIi4gCitidXQgbm90ICJxZW11eDg2LXdvcmxkIi4KIAog
VGhlIHJlZ2V4IHdpbGwgcnVuIGFnYWluc3QgYWxsIGNvbXBpbGVyIG9wdGlvbnMgaW5jbHVkaW5n
IHRoaW5ncyBsaWtlOgogCkBAIC0xNywxMiArMjEsMTUgQEAgcmVwcm9kdWNpYmxlIHRhcmdldCBy
YW4gZmlyc3QgYW5kIHdvbiB0aGUgcmFjZSB0byBwb3B1bGF0ZSBzc3RhdGUuCiAKIFVwc3RyZWFt
LVN0YXR1czogSW5hcHByb3ByaWF0ZSBbdXBzdHJlYW0gaGF2ZSBkcm9wcGVkIGRpc3R1dGlscyBh
bmQgc3dpdGNoZWQgdG8gbWVzb25dCiBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIFB1cmRpZSA8cmlj
aGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KLQotSW5kZXg6IG51bXB5LTEuMjYuMC9u
dW1weS9kaXN0dXRpbHMvY2NvbXBpbGVyX29wdC5weQotPT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQotLS0tIG51bXB5LTEu
MjYuMC5vcmlnL251bXB5L2Rpc3R1dGlscy9jY29tcGlsZXJfb3B0LnB5Ci0rKysgbnVtcHktMS4y
Ni4wL251bXB5L2Rpc3R1dGlscy9jY29tcGlsZXJfb3B0LnB5Ci1AQCAtOTkwLDcgKzk5MCw3IEBA
IGNsYXNzIF9DQ29tcGlsZXI6CistLS0KKyBudW1weS9kaXN0dXRpbHMvY2NvbXBpbGVyX29wdC5w
eSB8IDIgKy0KKyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
KworZGlmZiAtLWdpdCBhL251bXB5L2Rpc3R1dGlscy9jY29tcGlsZXJfb3B0LnB5IGIvbnVtcHkv
ZGlzdHV0aWxzL2Njb21waWxlcl9vcHQucHkKK2luZGV4IGIxYTZmYTMuLjdiMDMwMmIgMTAwNjQ0
CistLS0gYS9udW1weS9kaXN0dXRpbHMvY2NvbXBpbGVyX29wdC5weQorKysrIGIvbnVtcHkvZGlz
dHV0aWxzL2Njb21waWxlcl9vcHQucHkKK0BAIC05OTEsNyArOTkxLDcgQEAgZGVmIF9faW5pdF9f
KHNlbGYpOgogICAgICAgICAgICAgICgiY2NfaXNfbm9jYyIsICAgICAiIiwgIiIpLAogICAgICAg
ICAgKQogICAgICAgICAgZGV0ZWN0X2FyZ3MgPSAoCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHlfMi4xLjMuYmIgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHlfMi4yLjEuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUK
cmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5XzIu
MS4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVt
cHlfMi4yLjEuYmIKaW5kZXggMDEyMGJlZTQzOS4uYzJiYjYxNDQ2MSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5XzIuMS4zLmJiCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weV8yLjIuMS5iYgpAQCAtOSwx
MSArOSwxMCBAQCBTUkNOQU1FID0gIm51bXB5IgogCiBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0Vf
VVJJfS9kb3dubG9hZC92JHtQVn0vJHtTUkNOQU1FfS0ke1BWfS50YXIuZ3ogXAogICAgICAgICAg
ICBmaWxlOi8vMDAwMS1Eb24tdC1zZWFyY2gtdXNyLWFuZC1zby1vbi1mb3ItbGlicmFyaWVzLWJ5
LWRlZmF1bHQtLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEtbnVtcHktY29yZS1EZWZp
bmUtUklTQ1YtMzItc3VwcG9ydC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly9maXhfcmVwcm9k
dWNpYmlsaXR5LnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL3J1bi1wdGVzdCBcCiAgICAgICAg
ICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJhYTA4ZTA0ZTA4YWFmOTc0ZDQ0NThkZWY1Mzlk
ZWNlMGQyODE0NmQ4NjZhMzlkYTU2Mzk1OTZmNDkyMWZkNzYxIgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjQ1NjgxZmQ3MTI4YzhhZDFjMzc5ZjBjYTA3NzZhOGIwYzY1ODNkMmY2OTg4OWRkYWMwMTU1
OWRmZTQzOTA5MTgiCiAKIEdJVEhVQl9CQVNFX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20vbnVt
cHkvbnVtcHkvcmVsZWFzZXMiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJyZWxlYXNlcy90YWcv
dj8oP1A8cHZlcj5cZCsoXC5cZCspKykkIgotLSAKMi40NC4xCgo=

--===============1914491611030447555==--

