Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17518E7719B
	for <webhook@archiver.kernel.org>; Sun, 15 Dec 2024 09:29:51 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.33383.1734254982758079082
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Dec 2024 01:29:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=SpgqUHpQ;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=TTG0QziN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010193c9a6f379-ea4e0363-a73a-4de4-9d24-ed21b5086266-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1734254982;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+he7+Mhxnx2/yGDJB5Ng/5NSx+NhTiPcdjw+LPgx4MI=;
	b=SpgqUHpQvzMUhhdlS+mwzCTNs0o4td1168AwMNYYlEW1xvabeCI04GN0EsI7t+yM
	XK++XzI1+7MHIzH448j+ZYjD4gknJK79GJF+4KscjNwkuDE5V5RMM2Byj2cAlTv5SNZ
	t8ZMcYGCjiQkQXo6HQy7MCVLdh0K2iy9chn1EucM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1734254982;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+he7+Mhxnx2/yGDJB5Ng/5NSx+NhTiPcdjw+LPgx4MI=;
	b=TTG0QziNRvMeb+telkGr98D9ehP9vmY1GXML9O76M/3JPDT0no361Ty7Uc7G/VQF
	pwgxjNaIFte32gPlahpEjq/UK9y5plDM7Me1IQ+Jvft96tDs/S8yNTU6VyHdWZjJqEH
	pcewDVZv87ZVD/dPSylyHauQgGISwJzWo6a8LkwM=
Content-Type: multipart/mixed; boundary="===============0282473816315144280=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-numpy: upgrading to 2.2.0 SUCCEEDED
Message-ID: <01010193c9a6f379-ea4e0363-a73a-4de4-9d24-ed21b5086266-000000@us-west-2.amazonses.com>
Date: Sun, 15 Dec 2024 09:29:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Dec 2024 09:29:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208717

--===============0282473816315144280==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-numpy* to *2.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-numpy-upgrade-2.1.3-2.2.0.patch
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
From 03f31640b58b687a050608d9aa5b468a9e79a95a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Dec 2024 07:23:18 +0000
Subject: [PATCH] python3-numpy: upgrade 2.1.3 -> 2.2.0

---
 ...-and-so-on-for-libraries-by-default-.patch |  7 +--
 ...1-numpy-core-Define-RISCV-32-support.patch | 58 -------------------
 .../python3-numpy/fix_reproducibility.patch   | 23 +++++---
 ...-numpy_2.1.3.bb => python3-numpy_2.2.0.bb} |  3 +-
 4 files changed, 19 insertions(+), 72 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
 rename meta/recipes-devtools/python/{python3-numpy_2.1.3.bb => python3-numpy_2.2.0.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
index bbe309c556..b8f2e42a25 100644
--- a/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
+++ b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
@@ -1,4 +1,4 @@
-From 46eea664cf89d0602e7ff16d587c37c045b125b7 Mon Sep 17 00:00:00 2001
+From 0f34943f5c2952fc830eb4f5a1e7aa1f1fa298e3 Mon Sep 17 00:00:00 2001
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
index d952aed00c..6412f5f58c 100644
--- a/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
+++ b/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
@@ -1,7 +1,11 @@
-This regex decides whether to use O3 opimisation on numpy or not.
+From 9e382d90d97846477748dbfc8db0c2144091c2a5 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/python/python3-numpy_2.1.3.bb b/meta/recipes-devtools/python/python3-numpy_2.2.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-numpy_2.1.3.bb
rename to meta/recipes-devtools/python/python3-numpy_2.2.0.bb
index 0120bee439..522f9682a5 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.1.3.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.2.0.bb
@@ -9,11 +9,10 @@ SRCNAME = "numpy"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
-           file://0001-numpy-core-Define-RISCV-32-support.patch \
            file://fix_reproducibility.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "aa08e04e08aaf974d4458def539dece0d28146d866a39da5639596f4921fd761"
+SRC_URI[sha256sum] = "140dd80ff8981a583a60980be1a655068f8adebf7a45a06a6858c873fcdcd4a0"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.44.1


--===============0282473816315144280==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-numpy: PKGV changed from 2.1.3 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/python3-numpy: SRC_URI changed from "https://github.com/numpy/numpy/releases/download/v2.1.3/numpy-2.1.3.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://0001-numpy-core-Define-RISCV-32-support.patch file://fix_reproducibility.patch file://run-ptest" to "https://github.com/numpy/numpy/releases/download/v2.2.0/numpy-2.2.0.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://fix_reproducibility.patch file://run-ptest"
packages/core2-64-poky-linux/python3-numpy: PV changed from "2.1.3" to "2.2.0"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-dbg: PKGV changed from 2.1.3 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-dbg: PKGSIZE changed from 122856960 to 122919424 (+0%)
packages/core2-64-poky-linux/python3-numpy/python3-numpy-dbg: PV changed from "2.1.3" to "2.2.0"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-dev: PKGV changed from 2.1.3 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-dev: PV changed from "2.1.3" to "2.2.0"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-doc: PKGV changed from 2.1.3 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-doc: PV changed from "2.1.3" to "2.2.0"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-locale: PKGV changed from 2.1.3 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-locale: PV changed from "2.1.3" to "2.2.0"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-ptest: PKGV changed from 2.1.3 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-ptest: PV changed from "2.1.3" to "2.2.0"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-src: PKGV changed from 2.1.3 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-src: PKGSIZE changed from 24337188 to 24378762 (+0%)
packages/core2-64-poky-linux/python3-numpy/python3-numpy-src: FILELIST: directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/dlpack -> /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/dlpack, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/_simd -> /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/_simd, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/random/_common.cpython-313-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.2.0/numpy/random/_common.cpython-313-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/random/_philox.cpython-313-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.2.0/numpy/random/_philox.cpython-313-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/multiarray/textreading -> /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/multiarray/textreading, directory re
 named /usr/src/debug/python3-numpy/2.1.3/numpy/linalg -> /usr/src/debug/python3-numpy/2.2.0/numpy/linalg, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/random/_mt19937.cpython-313-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.2.0/numpy/random/_mt19937.cpython-313-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/random/include -> /usr/src/debug/python3-numpy/2.2.0/numpy/random/include, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/random/src/mt19937 -> /usr/src/debug/python3-numpy/2.2.0/numpy/random/src/mt19937, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/_core/include/numpy/libdivide -> /usr/src/debug/python3-numpy/2.2.0/numpy/_core/include/numpy/libdivide, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/random/bit_generator.cpython-313-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.2.0/numpy/random/bit_generator.cpython-313-x86_64-linux-gnu.
 so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/highway/hwy -> /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/highway/hwy, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/_core/include/numpy -> /usr/src/debug/python3-numpy/2.2.0/numpy/_core/include/numpy, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/random/src/sfc64 -> /usr/src/debug/python3-numpy/2.2.0/numpy/random/src/sfc64, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/random/src/pcg64 -> /usr/src/debug/python3-numpy/2.2.0/numpy/random/src/pcg64, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/fft -> /usr/src/debug/python3-numpy/2.2.0/numpy/fft, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/random/_generator.cpython-313-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.2.0/numpy/random/_generator.cpython-313-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/_core
 /src/common/simd/avx512 -> /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/simd/avx512, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/linalg/lapack_lite -> /usr/src/debug/python3-numpy/2.2.0/numpy/linalg/lapack_lite, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/_core -> /usr/src/debug/python3-numpy/2.2.0/numpy/_core, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/random/src/legacy -> /usr/src/debug/python3-numpy/2.2.0/numpy/random/src/legacy, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/simd -> /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/simd, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/_core/include/numpy/random -> /usr/src/debug/python3-numpy/2.2.0/numpy/_core/include/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/random/_pcg64.cpython-313-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.2.0/numpy/random/_pcg64.cpython-313-x86_6
 4-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/random/_sfc64.cpython-313-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.2.0/numpy/random/_sfc64.cpython-313-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/simd/avx2 -> /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/simd/avx2, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/npysort/x86-simd-sort/src -> /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/npysort/x86-simd-sort/src, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/random/src/philox -> /usr/src/debug/python3-numpy/2.2.0/numpy/random/src/philox, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/npymath -> /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/npymath, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/fft/pocketfft -> /usr/src/debug/python3-numpy/2.2.0/numpy/fft/pocke
 tfft, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/random/mtrand.cpython-313-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.2.0/numpy/random/mtrand.cpython-313-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/highway/hwy/ops -> /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/highway/hwy/ops, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/random/_bounded_integers.cpython-313-x86_64-linux-gnu.so.p/numpy/random -> /usr/src/debug/python3-numpy/2.2.0/numpy/random/_bounded_integers.cpython-313-x86_64-linux-gnu.so.p/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/multiarray -> /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/multiarray, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/simd/sse -> /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/simd/sse, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/
 _core/src/multiarray/stringdtype -> /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/multiarray/stringdtype, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/npysort -> /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/npysort, directory renamed /usr/src/debug/python3-numpy/2.1.3/numpy/random/src/distributions -> /usr/src/debug/python3-numpy/2.2.0/numpy/random/src/distributions, removed "/usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/ufunc_object.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/utils.hpp /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/npstd.hpp /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/loops.h.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/loops.c.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/float_status.hpp /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/ufunc_object.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/loops_unary_fp_le.dispatch.c.src 
 /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/_umath_tests.dispatch.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/wrapping_array_method.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/npy_argparse.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/npy_longdouble.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/npy_longdouble.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/npy_argparse.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/dispatching.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/dispatching.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/half_private.hpp /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/string_ufuncs.cpp /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/loops_minmax.dispatch.c.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/matmul.c.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/umathmodule.c /usr/src/debug/python
 3-numpy/2.1.3/numpy/_core/src/common/templ_common.h.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/loops_arithm_fp.dispatch.c.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/npy_atomic.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/mem_overlap.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/mem_overlap.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/loops_arithmetic.dispatch.c.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/reduction.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/ucsnarrow.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/ucsnarrow.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/reduction.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/loops_unary_fp.dispatch.c.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/npy_simd_data.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/binop_override.h /usr/src/debug/python3-numpy/2.1.3/n
 umpy/_core/src/common/ufunc_override.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/_scaled_float_dtype.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/ufunc_override.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/loops_utils.h.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/gil_utils.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/npy_extint128.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/half.hpp /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/meta.hpp /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/loops_hyperbolic.dispatch.c.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/gil_utils.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/_operand_flag_tests.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/special_integer_comparisons.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/npy_cpu_features.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/sr
 c/common/lowlevel_strided_loops.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/npy_cpu_features.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/loops_exponent_log.dispatch.c.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/loops_comparison.dispatch.c.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/npy_svml.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/fast_loop_macros.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/array_assign.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/npy_binsearch.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/array_assign.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/clip.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/npy_hashtable.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/npy_hashtable.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/umathmodule.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/
 stringdtype_ufuncs.cpp /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/extobj.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/scalarmath.c.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/npy_sort.h.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/extobj.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/numpy_tag.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/npy_cpu_dispatch.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/clip.cpp /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/funcs.inc.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/npy_cpu_dispatch.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/npy_dlpack.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/override.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/override.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/npy_partition.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/um
 ath/string_buffer.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/_umath_tests.c.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/loops_autovec.dispatch.c.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/loops_unary.dispatch.c.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/_rational_tests.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/get_attr_string.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/npy_ctypes.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/loops_logical.dispatch.c.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/stringdtype_ufuncs.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/ufunc_type_resolution.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/loops_trigonometric.dispatch.cpp /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/ufunc_type_resolution.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/numpyos.c /usr/src/debug/python3-nu
 mpy/2.1.3/numpy/_core/src/umath/loops_modulo.dispatch.c.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/numpyos.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/legacy_array_method.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/legacy_array_method.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/loops_umath_fp.dispatch.c.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/matmul.h.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/string_fastsearch.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/npy_import.h /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/special_integer_comparisons.cpp /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/common/npy_import.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/_struct_ufunc_tests.c /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/loops_unary_complex.dispatch.c.src /usr/src/debug/python3-numpy/2.1.3/numpy/_core/src/umath/string_ufuncs.h", 
 added "/usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/umathmodule.h /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/stringdtype_ufuncs.cpp /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/extobj.c /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/scalarmath.c.src /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/npy_sort.h.src /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/extobj.h /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/numpy_tag.h /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/npy_cpu_dispatch.h /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/clip.cpp /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/funcs.inc.src /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/npy_cpu_dispatch.c /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/npy_dlpack.h /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/override.c /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/ov
 erride.h /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/npy_partition.h /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/string_buffer.h /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/_umath_tests.c.src /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/loops_autovec.dispatch.c.src /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/loops_unary.dispatch.c.src /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/_rational_tests.c /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/get_attr_string.h /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/npy_ctypes.h /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/loops_logical.dispatch.c.src /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/stringdtype_ufuncs.h /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/ufunc_type_resolution.c /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/loops_trigonometric.dispatch.cpp /usr/src/debug/python3-numpy/2.2.0/num
 py/_core/src/umath/ufunc_type_resolution.h /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/numpyos.c /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/loops_modulo.dispatch.c.src /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/numpyos.h /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/legacy_array_method.c /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/legacy_array_method.h /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/loops_umath_fp.dispatch.c.src /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/matmul.h.src /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/string_fastsearch.h /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/npy_import.h /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/special_integer_comparisons.cpp /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/npy_import.c /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/_struct_ufunc_tests.c /usr/src/debug/python3-numpy/2.
 2.0/numpy/_core/src/umath/dispatching.cpp /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/loops_unary_complex.dispatch.c.src /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/string_ufuncs.h /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/ufunc_object.h /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/npstd.hpp /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/utils.hpp /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/loops.c.src /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/loops.h.src /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/float_status.hpp /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/ufunc_object.c /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/loops_unary_fp_le.dispatch.c.src /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/_umath_tests.dispatch.c /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/wrapping_array_method.c /usr/src/debug/python3-numpy/2.2.0/numpy/_cor
 e/src/common/npy_argparse.h /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/npy_longdouble.c /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/npy_longdouble.h /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/npy_argparse.c /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/npy_hashtable.cpp /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/dispatching.h /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/half_private.hpp /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/string_ufuncs.cpp /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/loops_minmax.dispatch.c.src /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/matmul.c.src /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/umathmodule.c /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/templ_common.h.src /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/loops_arithm_fp.dispatch.c.src /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/
 npy_atomic.h /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/mem_overlap.h /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/mem_overlap.c /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/loops_arithmetic.dispatch.c.src /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/reduction.h /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/ucsnarrow.h /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/ucsnarrow.c /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/reduction.c /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/loops_unary_fp.dispatch.c.src /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/npy_simd_data.h /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/binop_override.h /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/ufunc_override.h /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/_scaled_float_dtype.c /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/ufunc_override.c /usr/src/
 debug/python3-numpy/2.2.0/numpy/_core/src/umath/loops_utils.h.src /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/gil_utils.h /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/npy_extint128.h /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/half.hpp /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/meta.hpp /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/loops_hyperbolic.dispatch.c.src /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/gil_utils.c /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/_operand_flag_tests.c /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/special_integer_comparisons.h /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/npy_cpu_features.c /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/lowlevel_strided_loops.h /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/npy_cpu_features.h /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/loops_exponent_log.dispatch.c.src 
 /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/loops_comparison.dispatch.c.src /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/npy_svml.h /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/fast_loop_macros.h /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/array_assign.h /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/npy_binsearch.h /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/array_assign.c /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/umath/clip.h /usr/src/debug/python3-numpy/2.2.0/numpy/_core/src/common/npy_hashtable.h"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-src: PV changed from "2.1.3" to "2.2.0"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-staticdev: PKGV changed from 2.1.3 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-staticdev: PV changed from "2.1.3" to "2.2.0"
packages/core2-64-poky-linux/python3-numpy/python3-numpy: PKGV changed from 2.1.3 [default] to 2.2.0 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy: PKGSIZE changed from 42316743 to 42547973 (+1%)
packages/core2-64-poky-linux/python3-numpy/python3-numpy: FILELIST: directory renamed /usr/lib/python3.13/site-packages/numpy-2.1.3.dist-info -> /usr/lib/python3.13/site-packages/numpy-2.2.0.dist-info, removed "/usr/lib/python3.13/site-packages/numpy/typing/tests/data/fail/false_positives.pyi", added "/usr/lib/python3.13/site-packages/numpy/f2py/tests/src/routines/subrout.f /usr/lib/python3.13/site-packages/numpy/_typing/_ufunc.py /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/regression/datonly.f90 /usr/lib/python3.13/site-packages/numpy/f2py/tests/__pycache__/test_routines.cpython-313.pyc /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/routines/funcfortranname.f /usr/lib/python3.13/site-packages/numpy/__config__.pyi /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/routines/subrout.pyf /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/regression/assignOnlyModule.f90 /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/callback/gh26681.f90 /usr/lib/python3
 .13/site-packages/numpy/_typing/__pycache__/_nbit_base.cpython-313.pyc /usr/lib/python3.13/site-packages/numpy/_typing/__pycache__/_ufunc.cpython-313.pyc /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/crackfortran/gh27697.f90 /usr/lib/python3.13/site-packages/numpy/typing/tests/data/reveal/ndarray_assignability.pyi /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/routines/funcfortranname.pyf /usr/lib/python3.13/site-packages/numpy/f2py/tests/test_routines.py /usr/lib/python3.13/site-packages/numpy/_typing/_nbit_base.py"
packages/core2-64-poky-linux/python3-numpy/python3-numpy: PV changed from "2.1.3" to "2.2.0"
Changes to packages/core2-64-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.13/site-packages/numpy/f2py/crackfortran.py changed permissions from rwxr-xr-x to rw-r--r--
  /usr/lib/python3.13/site-packages/numpy/f2py/f2py2e.py changed permissions from rwxr-xr-x to rw-r--r--
  /usr/lib/python3.13/site-packages/numpy/f2py/rules.py changed permissions from rwxr-xr-x to rw-r--r--
  /usr/lib/python3.13/site-packages/numpy-2.1.3.dist-info moved to /usr/lib/python3.13/site-packages/numpy-2.2.0.dist-info
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
  /usr/lib/python3.13/site-packages/numpy/typing/tests/data/reveal/ndarray_assignability.pyi was added
  /usr/lib/python3.13/site-packages/numpy/_typing/_ufunc.py was added
  /usr/lib/python3.13/site-packages/numpy/typing/tests/data/fail/false_positives.pyi was removed

--===============0282473816315144280==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-numpy/python3-numpy: FILELIST: directory renamed /usr/lib/python3.13/site-packages/numpy-2.1.3.dist-info -> /usr/lib/python3.13/site-packages/numpy-2.2.0.dist-info, removed "/usr/lib/python3.13/site-packages/numpy/typing/tests/data/fail/false_positives.pyi", added "/usr/lib/python3.13/site-packages/numpy/_typing/__pycache__/_ufunc.cpython-313.pyc /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/regression/assignOnlyModule.f90 /usr/lib/python3.13/site-packages/numpy/__config__.pyi /usr/lib/python3.13/site-packages/numpy/_typing/_ufunc.py /usr/lib/python3.13/site-packages/numpy/f2py/tests/test_routines.py /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/routines/funcfortranname.f /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/crackfortran/gh27697.f90 /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/regression/datonly.f90 /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/callback/gh26681.f90 /usr/lib/python3.13/site-pac
 kages/numpy/f2py/tests/src/routines/funcfortranname.pyf /usr/lib/python3.13/site-packages/numpy/_typing/_nbit_base.py /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/routines/subrout.pyf /usr/lib/python3.13/site-packages/numpy/f2py/tests/src/routines/subrout.f /usr/lib/python3.13/site-packages/numpy/f2py/tests/__pycache__/test_routines.cpython-313.pyc /usr/lib/python3.13/site-packages/numpy/typing/tests/data/reveal/ndarray_assignability.pyi /usr/lib/python3.13/site-packages/numpy/_typing/__pycache__/_nbit_base.cpython-313.pyc"
Changes to packages/core2-64-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.13/site-packages/numpy/f2py/crackfortran.py changed permissions from rwxr-xr-x to rw-r--r--
  /usr/lib/python3.13/site-packages/numpy/f2py/f2py2e.py changed permissions from rwxr-xr-x to rw-r--r--
  /usr/lib/python3.13/site-packages/numpy/f2py/rules.py changed permissions from rwxr-xr-x to rw-r--r--
  /usr/lib/python3.13/site-packages/numpy-2.1.3.dist-info moved to /usr/lib/python3.13/site-packages/numpy-2.2.0.dist-info
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
  /usr/lib/python3.13/site-packages/numpy/typing/tests/data/reveal/ndarray_assignability.pyi was added
  /usr/lib/python3.13/site-packages/numpy/_typing/_ufunc.py was added
  /usr/lib/python3.13/site-packages/numpy/typing/tests/data/fail/false_positives.pyi was removed

--===============0282473816315144280==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-numpy-upgrade-2.1.3-2.2.0.patch"

RnJvbSAwM2YzMTY0MGI1OGI2ODdhMDUwNjA4ZDlhYTViNDY4YTllNzlhOTVhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgRGVjIDIwMjQgMDc6MjM6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW51bXB5OiB1cGdyYWRlIDIuMS4zIC0+IDIuMi4wCgotLS0KIC4uLi1hbmQtc28tb24t
Zm9yLWxpYnJhcmllcy1ieS1kZWZhdWx0LS5wYXRjaCB8ICA3ICstLQogLi4uMS1udW1weS1jb3Jl
LURlZmluZS1SSVNDVi0zMi1zdXBwb3J0LnBhdGNoIHwgNTggLS0tLS0tLS0tLS0tLS0tLS0tLQog
Li4uL3B5dGhvbjMtbnVtcHkvZml4X3JlcHJvZHVjaWJpbGl0eS5wYXRjaCAgIHwgMjMgKysrKyst
LS0KIC4uLi1udW1weV8yLjEuMy5iYiA9PiBweXRob24zLW51bXB5XzIuMi4wLmJifSB8ICAzICst
CiA0IGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDcyIGRlbGV0aW9ucygtKQogZGVs
ZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1w
eS8wMDAxLW51bXB5LWNvcmUtRGVmaW5lLVJJU0NWLTMyLXN1cHBvcnQucGF0Y2gKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLW51bXB5XzIuMS4zLmJiID0+IHB5
dGhvbjMtbnVtcHlfMi4yLjAuYmJ9ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5LzAwMDEtRG9uLXQtc2VhcmNoLXVzci1hbmQtc28t
b24tZm9yLWxpYnJhcmllcy1ieS1kZWZhdWx0LS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1udW1weS8wMDAxLURvbi10LXNlYXJjaC11c3ItYW5kLXNvLW9uLWZv
ci1saWJyYXJpZXMtYnktZGVmYXVsdC0ucGF0Y2gKaW5kZXggYmJlMzA5YzU1Ni4uYjhmMmU0MmEy
NSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5
LzAwMDEtRG9uLXQtc2VhcmNoLXVzci1hbmQtc28tb24tZm9yLWxpYnJhcmllcy1ieS1kZWZhdWx0
LS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHkv
MDAwMS1Eb24tdC1zZWFyY2gtdXNyLWFuZC1zby1vbi1mb3ItbGlicmFyaWVzLWJ5LWRlZmF1bHQt
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0NmVlYTY2NGNmODlkMDYwMmU3ZmYxNmQ1ODdj
MzdjMDQ1YjEyNWI3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwZjM0OTQzZjVjMjk1
MmZjODMwZWI0ZjVhMWU3YWExZjFmYTI5OGUzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBUaHUs
IDEwIERlYyAyMDE1IDEzOjIwOjMwICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIERvbid0IHNlYXJj
aCAvdXNyIGFuZCBzbyBvbiBmb3IgbGlicmFyaWVzIGJ5IGRlZmF1bHQgdG8KQEAgLTgsMTYgKzgs
MTUgQEAgU3ViamVjdDogW1BBVENIXSBEb24ndCBzZWFyY2ggL3VzciBhbmQgc28gb24gZm9yIGxp
YnJhcmllcyBieSBkZWZhdWx0IHRvCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgKEFz
IHRoZSBjb2RlIHN0YW5kcywgdGhpcyBpcyBhIGhhY2spCiBTaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1
cnRvbiA8cm9zcy5idXJ0b25AaW50ZWwuY29tPgogU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEth
bmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+Ci0KIC0tLQogIG51bXB5L2Rpc3R1dGlscy9z
eXN0ZW1faW5mby5weSB8IDQyICsrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KICAx
IGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzNiBkZWxldGlvbnMoLSkKIAogZGlmZiAt
LWdpdCBhL251bXB5L2Rpc3R1dGlscy9zeXN0ZW1faW5mby5weSBiL251bXB5L2Rpc3R1dGlscy9z
eXN0ZW1faW5mby5weQotaW5kZXggZmViMjhmNi4uYTQ4ZDZkMSAxMDA2NDQKK2luZGV4IDY0Nzg1
NDguLmMwNjIwZTcgMTAwNjQ0CiAtLS0gYS9udW1weS9kaXN0dXRpbHMvc3lzdGVtX2luZm8ucHkK
ICsrKyBiL251bXB5L2Rpc3R1dGlscy9zeXN0ZW1faW5mby5weQotQEAgLTMyNyw0NCArMzI3LDE0
IEBAIGRlZiBhZGRfc3lzdGVtX3Jvb3QobGlicmFyeV9yb290KToKK0BAIC0zMjYsNDQgKzMyNiwx
NCBAQCBkZWYgYWRkX3N5c3RlbV9yb290KGxpYnJhcnlfcm9vdCk6CiAgICAgICAgICBhZGRfc3lz
dGVtX3Jvb3Qob3MucGF0aC5qb2luKGNvbmRhX2RpciwgJ0xpYnJhcnknKSkKICAKICBlbHNlOgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5LzAw
MDEtbnVtcHktY29yZS1EZWZpbmUtUklTQ1YtMzItc3VwcG9ydC5wYXRjaCBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weS8wMDAxLW51bXB5LWNvcmUtRGVmaW5lLVJJ
U0NWLTMyLXN1cHBvcnQucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDZkYTkw
NDdlYzUuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLW51bXB5LzAwMDEtbnVtcHktY29yZS1EZWZpbmUtUklTQ1YtMzItc3VwcG9ydC5wYXRjaAor
KysgL2Rldi9udWxsCkBAIC0xLDU4ICswLDAgQEAKLUZyb20gMGUyYjY1MmEwZWZmODU3OTg1ODQx
MTZjOTA1YTJkNmFkOGYyNWQ1ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEtoZW0g
UmFqIDxyYWoua2hlbUBnbWFpbC5jb20+Ci1EYXRlOiBTdW4sIDE1IE5vdiAyMDIwIDE1OjMyOjM5
IC0wODAwCi1TdWJqZWN0OiBbUEFUQ0hdIG51bXB5L2NvcmU6IERlZmluZSBSSVNDVi0zMiBzdXBw
b3J0Ci0KLUhlbHBzIGNvbXBpbGUgb24gcmlzY3YzMgotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2tw
b3J0Ci0oaHR0cHM6Ly9naXRodWIuY29tL251bXB5L251bXB5L3B1bGwvMTc3ODAvY29tbWl0cy8w
ZTJiNjUyYTBlZmY4NTc5ODU4NDExNmM5MDVhMmQ2YWQ4ZjI1ZDVmKQotCi1TaWduZWQtb2ZmLWJ5
OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotLS0tCi0gbnVtcHkvX2NvcmUvaW5jbHVk
ZS9udW1weS9ucHlfY3B1LmggICAgfCA5ICsrKysrKystLQotIG51bXB5L19jb3JlL2luY2x1ZGUv
bnVtcHkvbnB5X2VuZGlhbi5oIHwgMSArCi0gMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCi0KLWRpZmYgLS1naXQgYS9udW1weS9fY29yZS9pbmNsdWRlL251
bXB5L25weV9jcHUuaCBiL251bXB5L19jb3JlL2luY2x1ZGUvbnVtcHkvbnB5X2NwdS5oCi1pbmRl
eCBhMTlmOGU2YmJkLi4xNWY5ZjEyOTMxIDEwMDY0NAotLS0tIGEvbnVtcHkvX2NvcmUvaW5jbHVk
ZS9udW1weS9ucHlfY3B1LmgKLSsrKyBiL251bXB5L19jb3JlL2luY2x1ZGUvbnVtcHkvbnB5X2Nw
dS5oCi1AQCAtMTgsNiArMTgsNyBAQAotICAqICAgICAgICAgICAgICBOUFlfQ1BVX0FSQ0VMCi0g
ICogICAgICAgICAgICAgIE5QWV9DUFVfQVJDRUIKLSAgKiAgICAgICAgICAgICAgTlBZX0NQVV9S
SVNDVjY0Ci0rICogICAgICAgICAgICAgIE5QWV9DUFVfUklTQ1YzMgotICAqICAgICAgICAgICAg
ICBOUFlfQ1BVX0xPT05HQVJDSAotICAqICAgICAgICAgICAgICBOUFlfQ1BVX1dBU00KLSAgKi8K
LUBAIC0xMDIsOCArMTAzLDEyIEBACi0gICAgICNkZWZpbmUgTlBZX0NQVV9BUkNFTAotICNlbGlm
IGRlZmluZWQoX19hcmNfXykgJiYgZGVmaW5lZChfX0JJR19FTkRJQU5fXykKLSAgICAgI2RlZmlu
ZSBOUFlfQ1BVX0FSQ0VCCi0tI2VsaWYgZGVmaW5lZChfX3Jpc2N2KSAmJiBkZWZpbmVkKF9fcmlz
Y3ZfeGxlbikgJiYgX19yaXNjdl94bGVuID09IDY0Ci0tICAgICNkZWZpbmUgTlBZX0NQVV9SSVND
VjY0Ci0rI2VsaWYgZGVmaW5lZChfX3Jpc2N2KQotKyAgICAjaWYgX19yaXNjdl94bGVuID09IDY0
Ci0rCSNkZWZpbmUgTlBZX0NQVV9SSVNDVjY0Ci0rICAgICNlbGlmIF9fcmlzY3ZfeGxlbiA9PSAz
MgotKwkjZGVmaW5lIE5QWV9DUFVfUklTQ1YzMgotKyAgICAjZW5kaWYKLSAjZWxpZiBkZWZpbmVk
KF9fbG9vbmdhcmNoX18pCi0gICAgICNkZWZpbmUgTlBZX0NQVV9MT09OR0FSQ0gKLSAjZWxpZiBk
ZWZpbmVkKF9fRU1TQ1JJUFRFTl9fKQotZGlmZiAtLWdpdCBhL251bXB5L19jb3JlL2luY2x1ZGUv
bnVtcHkvbnB5X2VuZGlhbi5oIGIvbnVtcHkvX2NvcmUvaW5jbHVkZS9udW1weS9ucHlfZW5kaWFu
LmgKLWluZGV4IDVlNThhN2Y1MmMuLjA5MjYyMTIwYmYgMTAwNjQ0Ci0tLS0gYS9udW1weS9fY29y
ZS9pbmNsdWRlL251bXB5L25weV9lbmRpYW4uaAotKysrIGIvbnVtcHkvX2NvcmUvaW5jbHVkZS9u
dW1weS9ucHlfZW5kaWFuLmgKLUBAIC00OSw2ICs0OSw3IEBACi0gICAgICAgICAgICAgfHwgZGVm
aW5lZChOUFlfQ1BVX1BQQzY0TEUpICAgICAgIFwKLSAgICAgICAgICAgICB8fCBkZWZpbmVkKE5Q
WV9DUFVfQVJDRUwpICAgICAgICAgXAotICAgICAgICAgICAgIHx8IGRlZmluZWQoTlBZX0NQVV9S
SVNDVjY0KSAgICAgICBcCi0rICAgICAgICAgICAgfHwgZGVmaW5lZChOUFlfQ1BVX1JJU0NWMzIp
ICAgICAgIFwKLSAgICAgICAgICAgICB8fCBkZWZpbmVkKE5QWV9DUFVfTE9PTkdBUkNIKSAgICAg
XAotICAgICAgICAgICAgIHx8IGRlZmluZWQoTlBZX0NQVV9XQVNNKQotICAgICAgICAgI2RlZmlu
ZSBOUFlfQllURV9PUkRFUiBOUFlfTElUVExFX0VORElBTgotLS0gCi0yLjM5LjUKLQpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5L2ZpeF9yZXBy
b2R1Y2liaWxpdHkucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
bnVtcHkvZml4X3JlcHJvZHVjaWJpbGl0eS5wYXRjaAppbmRleCBkOTUyYWVkMDBjLi42NDEyZjVm
NThjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVt
cHkvZml4X3JlcHJvZHVjaWJpbGl0eS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtbnVtcHkvZml4X3JlcHJvZHVjaWJpbGl0eS5wYXRjaApAQCAtMSw3ICsx
LDExIEBACi1UaGlzIHJlZ2V4IGRlY2lkZXMgd2hldGhlciB0byB1c2UgTzMgb3BpbWlzYXRpb24g
b24gbnVtcHkgb3Igbm90LgorRnJvbSA5ZTM4MmQ5MGQ5Nzg0NjQ3Nzc0OGRiZmM4ZGIwYzIxNDQw
OTFjMmE1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogUmljaGFyZCBQdXJkaWUgPHJp
Y2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CitEYXRlOiBGcmksIDI5IFNlcCAyMDIz
IDIyOjUzOjI0ICswMTAwCitTdWJqZWN0OiBbUEFUQ0hdIFRoaXMgcmVnZXggZGVjaWRlcyB3aGV0
aGVyIHRvIHVzZSBPMyBvcGltaXNhdGlvbiBvbiBudW1weSBvcgorIG5vdC4KIAogSXQgaW5jbHVk
ZXMgIm9kIiwgd2hpY2ggaGFwcGVucyB0byBiZSBhIHN1YnN0cmluZyBvZiAicmVwcm9kdWNpYmxl
IgotYnV0IG5vdCAicWVtdXg4Ni13b3JsZCIuIAorYnV0IG5vdCAicWVtdXg4Ni13b3JsZCIuCiAK
IFRoZSByZWdleCB3aWxsIHJ1biBhZ2FpbnN0IGFsbCBjb21waWxlciBvcHRpb25zIGluY2x1ZGlu
ZyB0aGluZ3MgbGlrZToKIApAQCAtMTcsMTIgKzIxLDE1IEBAIHJlcHJvZHVjaWJsZSB0YXJnZXQg
cmFuIGZpcnN0IGFuZCB3b24gdGhlIHJhY2UgdG8gcG9wdWxhdGUgc3N0YXRlLgogCiBVcHN0cmVh
bS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW3Vwc3RyZWFtIGhhdmUgZHJvcHBlZCBkaXN0dXRpbHMg
YW5kIHN3aXRjaGVkIHRvIG1lc29uXQogU2lnbmVkLW9mZi1ieTogUmljaGFyZCBQdXJkaWUgPHJp
Y2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+Ci0KLUluZGV4OiBudW1weS0xLjI2LjAv
bnVtcHkvZGlzdHV0aWxzL2Njb21waWxlcl9vcHQucHkKLT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KLS0tLSBudW1weS0x
LjI2LjAub3JpZy9udW1weS9kaXN0dXRpbHMvY2NvbXBpbGVyX29wdC5weQotKysrIG51bXB5LTEu
MjYuMC9udW1weS9kaXN0dXRpbHMvY2NvbXBpbGVyX29wdC5weQotQEAgLTk5MCw3ICs5OTAsNyBA
QCBjbGFzcyBfQ0NvbXBpbGVyOgorLS0tCisgbnVtcHkvZGlzdHV0aWxzL2Njb21waWxlcl9vcHQu
cHkgfCAyICstCisgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CisKK2RpZmYgLS1naXQgYS9udW1weS9kaXN0dXRpbHMvY2NvbXBpbGVyX29wdC5weSBiL251bXB5
L2Rpc3R1dGlscy9jY29tcGlsZXJfb3B0LnB5CitpbmRleCBiMWE2ZmEzLi43YjAzMDJiIDEwMDY0
NAorLS0tIGEvbnVtcHkvZGlzdHV0aWxzL2Njb21waWxlcl9vcHQucHkKKysrKyBiL251bXB5L2Rp
c3R1dGlscy9jY29tcGlsZXJfb3B0LnB5CitAQCAtOTkxLDcgKzk5MSw3IEBAIGRlZiBfX2luaXRf
XyhzZWxmKToKICAgICAgICAgICAgICAoImNjX2lzX25vY2MiLCAgICAgIiIsICIiKSwKICAgICAg
ICAgICkKICAgICAgICAgIGRldGVjdF9hcmdzID0gKApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5XzIuMS4zLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5XzIuMi4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weV8y
LjEuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51
bXB5XzIuMi4wLmJiCmluZGV4IDAxMjBiZWU0MzkuLjUyMmY5NjgyYTUgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weV8yLjEuMy5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHlfMi4yLjAuYmIKQEAgLTks
MTEgKzksMTAgQEAgU1JDTkFNRSA9ICJudW1weSIKIAogU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNF
X1VSSX0vZG93bmxvYWQvdiR7UFZ9LyR7U1JDTkFNRX0tJHtQVn0udGFyLmd6IFwKICAgICAgICAg
ICAgZmlsZTovLzAwMDEtRG9uLXQtc2VhcmNoLXVzci1hbmQtc28tb24tZm9yLWxpYnJhcmllcy1i
eS1kZWZhdWx0LS5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAxLW51bXB5LWNvcmUtRGVm
aW5lLVJJU0NWLTMyLXN1cHBvcnQucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vZml4X3JlcHJv
ZHVjaWJpbGl0eS5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly9ydW4tcHRlc3QgXAogICAgICAg
ICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYWEwOGUwNGUwOGFhZjk3NGQ0NDU4ZGVmNTM5
ZGVjZTBkMjgxNDZkODY2YTM5ZGE1NjM5NTk2ZjQ5MjFmZDc2MSIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICIxNDBkZDgwZmY4OTgxYTU4M2E2MDk4MGJlMWE2NTUwNjhmOGFkZWJmN2E0NWEwNmE2ODU4
Yzg3M2ZjZGNkNGEwIgogCiBHSVRIVUJfQkFTRV9VUkkgPSAiaHR0cHM6Ly9naXRodWIuY29tL251
bXB5L251bXB5L3JlbGVhc2VzIgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAicmVsZWFzZXMvdGFn
L3Y/KD9QPHB2ZXI+XGQrKFwuXGQrKSspJCIKLS0gCjIuNDQuMQoK

--===============0282473816315144280==--

