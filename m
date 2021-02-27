Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.3])
 by mx.groups.io with SMTP id smtpd.web09.636.1614401326415727521
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 20:48:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 195.245.230.3, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.112.193.211] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.symcld.net id E4/0F-56109-12FC9306; Sat, 27 Feb 2021 04:48:33 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBIsWRWlGSWpSXmKPExsViZ8MxVVfxvGW
  CwfXj4hZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8an15oFe4IqmndPZm1g3OvRxcjFISQwg0mi
  49otJgjnOKPEvSWz2LsYOTnYBDQlerdsYexi5OAQEdCTuPpPFCTMLKAucWldCwuILSxgKrHr0
  GRWEJtFQFXi+t6PYHFeAVeJ7w3XmUFsCQEFiSkP3zNDxAUlTs58wgIxR0Li4IsXUDWKErMvN7
  NA2JUSezY/ZJ3AyDsLScssJC0LGJlWMVokFWWmZ5TkJmbm6BoaGOgaGhrpGloa6RoZmOglVuk
  m6qWW6panFpfoGuollhfrFVfmJuek6OWllmxiBAZXSsGBMzsYT73+oHeIUZKDSUmU17HZMkGI
  Lyk/pTIjsTgjvqg0J7X4EKMMB4eSBO+8s0A5waLU9NSKtMwcYKDDpCU4eJREeJefAkrzFhck5
  hZnpkOkTjEac7z7uXgRM8fJVUsWMQux5OXnpUqJ80aDTBIAKc0ozYMbBIvAS4yyUsK8jAwMDE
  I8BalFuZklqPKvGMU5GJWEeX1ApvBk5pXA7XsFdAoT0ClXYsxATilJREhJNTBNN7NqW++tk3r
  YVHFu7Ho99WVR53PU059GVevc5gy3KLx4st50euJyuStxxUeNxAr2n5L+ctaWLcSR91DModlV
  bvfU/aasFI5Mf1jf9ueFx59ZM46uD/8uqXzH+KTw827z5U63F3rnSl8QWre2oq77qEux/Jq0u
  31/NqrXrXzR5zjbgvdeJc/nquMGLhMmJVa+dzdQFdn1gqPGyP8w26xn3NwNK2JtZl+rWcdres
  zBkFn2St/0+J0P/DfI3ee3Xbbop9Ht1bpMTksmW1luLg9cy2UV+HCHcc8KA/ZlWbftWxxrS6U
  E+1x0Vr5UO9lq+v341dm/uWOVfy1Tv6Lxsc834anjr3bJqE62/EkMKUosxRmJhlrMRcWJACkM
  PE07AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-271.messagelabs.com!1614401313!658856!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1575 invoked from network); 27 Feb 2021 04:48:33 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-12.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Feb 2021 04:48:33 -0000
Received: from r01ukexcasm111.r01.fujitsu.local ([10.183.43.167])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 11R4mRDH017058
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sat, 27 Feb 2021 04:48:32 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Sat, 27 Feb 2021 04:48:25 +0000
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] ccache: upgrade 4.1 -> 4.2
Date: Sat, 27 Feb 2021 12:48:13 +0800
Message-ID: <1614401296-27095-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167)
Content-Type: text/plain

0001-Improve-SIMD-detection-735.patch
0001-blake3-Remove-asm-checks-for-sse-avx.patch
0002-Always-use-64bit-to-print-time_t.patch
removed since they'are included in 4.2

-License-Update: Copyright year updated to 2021.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../0001-Improve-SIMD-detection-735.patch     | 121 ------------------
 ...blake3-Remove-asm-checks-for-sse-avx.patch |  35 -----
 ...002-Always-use-64bit-to-print-time_t.patch |  33 -----
 .../ccache/{ccache_4.1.bb => ccache_4.2.bb}   |  10 +-
 4 files changed, 3 insertions(+), 196 deletions(-)
 delete mode 100644 meta/recipes-devtools/ccache/ccache/0001-Improve-SIMD-detection-735.patch
 delete mode 100644 meta/recipes-devtools/ccache/ccache/0001-blake3-Remove-asm-checks-for-sse-avx.patch
 delete mode 100644 meta/recipes-devtools/ccache/ccache/0002-Always-use-64bit-to-print-time_t.patch
 rename meta/recipes-devtools/ccache/{ccache_4.1.bb => ccache_4.2.bb} (60%)

diff --git a/meta/recipes-devtools/ccache/ccache/0001-Improve-SIMD-detection-735.patch b/meta/recipes-devtools/ccache/ccache/0001-Improve-SIMD-detection-735.patch
deleted file mode 100644
index 12d4ebc4bc..0000000000
--- a/meta/recipes-devtools/ccache/ccache/0001-Improve-SIMD-detection-735.patch
+++ /dev/null
@@ -1,121 +0,0 @@
-From 05d290165a3b61da09b715e6c8e62cebebab57cc Mon Sep 17 00:00:00 2001
-From: Erik Flodin <erik@ejohansson.se>
-Date: Mon, 7 Dec 2020 19:20:31 +0100
-Subject: [PATCH 1/2] Improve SIMD detection (#735)
-
-* Try to compile code to detect SSE/AVX support. Just checking if the compiler
-  supports the flag isn't enough as e.g. Clang on Apple's new ARM silicon seems
-  to accept the flag but then fails when building.
-* Try to detect and enable BLAKE3's Neon support.
-* Improve detection of AVX2 target attribute support and remove the explicit
-  compiler version check that hopefully shouldn't be needed.
-
-Fixes #734.
-Upstream-Status: Backport [https://github.com/ccache/ccache/commit/b438f50388dd00285083260f60450e6237b7d58f]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- cmake/GenerateConfigurationFile.cmake | 25 +++++++++---------
- src/third_party/blake3/CMakeLists.txt | 38 ++++++++++++++++++++-------
- 2 files changed, 42 insertions(+), 21 deletions(-)
-
-diff --git a/cmake/GenerateConfigurationFile.cmake b/cmake/GenerateConfigurationFile.cmake
-index a21861f4..836ff9bb 100644
---- a/cmake/GenerateConfigurationFile.cmake
-+++ b/cmake/GenerateConfigurationFile.cmake
-@@ -67,18 +67,19 @@ check_struct_has_member("struct stat" st_mtim sys/stat.h
- check_struct_has_member("struct statfs" f_fstypename sys/mount.h
-                         HAVE_STRUCT_STATFS_F_FSTYPENAME)
- 
--include(CheckCXXCompilerFlag)
--
--# Old GCC versions don't have the required header support.
--# Old Apple Clang versions seem to support -mavx2 but not the target
--# attribute that's used to enable AVX2 for a certain function.
--if((CMAKE_CXX_COMPILER_ID STREQUAL "GNU" AND CMAKE_CXX_COMPILER_VERSION VERSION_LESS 5.0)
--   OR (CMAKE_CXX_COMPILER_ID STREQUAL "AppleClang" AND CMAKE_CXX_COMPILER_VERSION VERSION_LESS 8.0))
--  message(STATUS "Detected unsupported compiler for HAVE_AVX2 - disabled")
--  set(HAVE_AVX2 FALSE)
--else()
--  check_cxx_compiler_flag(-mavx2 HAVE_AVX2)
--endif()
-+include(CheckCXXSourceCompiles)
-+check_cxx_source_compiles(
-+  [=[
-+    #include <immintrin.h>
-+    void func() __attribute__((target("avx2")));
-+    void func() { _mm256_abs_epi8(_mm256_set1_epi32(42)); }
-+    int main()
-+    {
-+      func();
-+      return 0;
-+    }
-+  ]=]
-+  HAVE_AVX2)
- 
- list(APPEND CMAKE_REQUIRED_LIBRARIES ws2_32)
- list(REMOVE_ITEM CMAKE_REQUIRED_LIBRARIES ws2_32)
-diff --git a/src/third_party/blake3/CMakeLists.txt b/src/third_party/blake3/CMakeLists.txt
-index a75e5611..cc24253c 100644
---- a/src/third_party/blake3/CMakeLists.txt
-+++ b/src/third_party/blake3/CMakeLists.txt
-@@ -13,9 +13,9 @@ else()
- endif()
- 
- include(CheckAsmCompilerFlag)
--include(CheckCCompilerFlag)
-+include(CheckCSourceCompiles)
- 
--function(add_source_if_enabled feature compile_flags)
-+function(add_source_if_enabled feature compile_flags intrinsic)
-   string(TOUPPER "have_${blake_source_type}_${feature}" have_feature)
- 
-   # AVX512 support fails to compile with old Apple Clang versions even though
-@@ -28,7 +28,14 @@ function(add_source_if_enabled feature compile_flags)
-   elseif(${blake_source_type} STREQUAL "asm")
-     check_asm_compiler_flag(${compile_flags} ${have_feature})
-   else()
--    check_c_compiler_flag(${compile_flags} ${have_feature})
-+    set(CMAKE_REQUIRED_FLAGS ${compile_flags})
-+    check_c_source_compiles(
-+      [=[
-+        #include <immintrin.h>
-+        int main() { ${intrinsic}; return 0; }
-+      ]=]
-+      ${have_feature})
-+    unset(CMAKE_REQUIRED_FLAGS)
-   endif()
- 
-   if(${have_feature})
-@@ -42,10 +49,23 @@ function(add_source_if_enabled feature compile_flags)
-   endif()
- endfunction()
- 
--add_source_if_enabled(sse2 "-msse2")
--add_source_if_enabled(sse41 "-msse4.1")
--add_source_if_enabled(avx2 "-mavx2")
--add_source_if_enabled(avx512 "-mavx512f -mavx512vl")
-+# https://software.intel.com/sites/landingpage/IntrinsicsGuide/
-+add_source_if_enabled(sse2 "-msse2" "_mm_set1_epi32(42)")
-+add_source_if_enabled(sse41 "-msse4.1" "_mm_test_all_ones(_mm_set1_epi32(42))")
-+add_source_if_enabled(avx2 "-mavx2" "_mm256_abs_epi8(_mm256_set1_epi32(42))")
-+add_source_if_enabled(avx512 "-mavx512f -mavx512vl" "_mm256_abs_epi64(_mm256_set1_epi32(42))")
- 
--# TODO: how to detect ARM NEON support?
--# If NEON, define BLAKE3_USE_NEON and build blake3_neon.c
-+# Neon is always available on AArch64
-+if(CMAKE_SIZEOF_VOID_P EQUAL 8)
-+  # https://developer.arm.com/architectures/instruction-sets/simd-isas/neon/intrinsics
-+  check_c_source_compiles(
-+    [=[
-+      #include <arm_neon.h>
-+      int main() { vdupq_n_s32(42); return 0; }
-+    ]=]
-+    HAVE_NEON)
-+  if(HAVE_NEON)
-+    target_sources(blake3 PRIVATE blake3_neon.c)
-+    target_compile_definitions(blake3 PRIVATE BLAKE3_USE_NEON)
-+  endif()
-+endif()
--- 
-2.30.0
-
diff --git a/meta/recipes-devtools/ccache/ccache/0001-blake3-Remove-asm-checks-for-sse-avx.patch b/meta/recipes-devtools/ccache/ccache/0001-blake3-Remove-asm-checks-for-sse-avx.patch
deleted file mode 100644
index bdabb381aa..0000000000
--- a/meta/recipes-devtools/ccache/ccache/0001-blake3-Remove-asm-checks-for-sse-avx.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 0448eddcf2863ebf911e7dd445bca1c7eee2a239 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 5 Jan 2021 13:55:34 -0800
-Subject: [PATCH] blake3: Remove asm checks for sse/avx
-
-This ends up passing on clang/linux wrongly when building for aarch64
-the check in else part is good to detect the feature support and this
-check can be removed, it was setting
-
-HAVE_ASM_AVX* and HAVE_ASM_SSE* macros which are not used in the build
-anyway
-
-Upstream-Status: Submitted [https://github.com/ccache/ccache/pull/768]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/third_party/blake3/CMakeLists.txt | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/src/third_party/blake3/CMakeLists.txt b/src/third_party/blake3/CMakeLists.txt
-index cc24253c..856b5721 100644
---- a/src/third_party/blake3/CMakeLists.txt
-+++ b/src/third_party/blake3/CMakeLists.txt
-@@ -25,8 +25,6 @@ function(add_source_if_enabled feature compile_flags intrinsic)
-       AND CMAKE_CXX_COMPILER_VERSION VERSION_LESS 9.0)
-     message(STATUS "Detected unsupported compiler for ${have_feature} - disabled")
-     set(${have_feature} FALSE)
--  elseif(${blake_source_type} STREQUAL "asm")
--    check_asm_compiler_flag(${compile_flags} ${have_feature})
-   else()
-     set(CMAKE_REQUIRED_FLAGS ${compile_flags})
-     check_c_source_compiles(
--- 
-2.30.0
-
diff --git a/meta/recipes-devtools/ccache/ccache/0002-Always-use-64bit-to-print-time_t.patch b/meta/recipes-devtools/ccache/ccache/0002-Always-use-64bit-to-print-time_t.patch
deleted file mode 100644
index 85ce2b762d..0000000000
--- a/meta/recipes-devtools/ccache/ccache/0002-Always-use-64bit-to-print-time_t.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From fa360ca8a457dafcae1d22df2b342d3ee291e8af Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 31 Dec 2020 14:28:39 -0800
-Subject: [PATCH 2/2] Always use 64bit to print time_t
-
-some 32bit architectures e.g. RISCV32 use 64bit time_t from beginning
-which does not fit into long int size on LP32 systems
-
-Upstream-Status: Submitted [https://github.com/ccache/ccache/pull/762]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/Logging.cpp | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/src/Logging.cpp b/src/Logging.cpp
-index 9a5d99b7..1a6e6264 100644
---- a/src/Logging.cpp
-+++ b/src/Logging.cpp
-@@ -88,7 +88,10 @@ do_log(string_view message, bool bulk)
-     if (tm) {
-       strftime(timestamp, sizeof(timestamp), "%Y-%m-%dT%H:%M:%S", &*tm);
-     } else {
--      snprintf(timestamp, sizeof(timestamp), "%lu", tv.tv_sec);
-+      snprintf(timestamp,
-+               sizeof(timestamp),
-+               "%llu",
-+               (long long unsigned int)tv.tv_sec);
-     }
-     snprintf(prefix,
-              sizeof(prefix),
--- 
-2.30.0
-
diff --git a/meta/recipes-devtools/ccache/ccache_4.1.bb b/meta/recipes-devtools/ccache/ccache_4.2.bb
similarity index 60%
rename from meta/recipes-devtools/ccache/ccache_4.1.bb
rename to meta/recipes-devtools/ccache/ccache_4.2.bb
index 6bd46b1017..9957bc7e65 100644
--- a/meta/recipes-devtools/ccache/ccache_4.1.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.2.bb
@@ -7,16 +7,12 @@ HOMEPAGE = "http://ccache.samba.org"
 SECTION = "devel"
 
 LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=a66c581f855c1c408730fe5d171e3013"
+LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=28afb89f649f309e7ac1aab554564637"
 
 DEPENDS = "zstd"
 
-SRC_URI = "https://github.com/ccache/ccache/releases/download/v${PV}/${BP}.tar.gz \
-           file://0001-Improve-SIMD-detection-735.patch \
-           file://0002-Always-use-64bit-to-print-time_t.patch \
-           file://0001-blake3-Remove-asm-checks-for-sse-avx.patch \
-           "
-SRC_URI[sha256sum] = "cdeefb827b3eef3b42b5454858123881a4a90abbd46cc72cf8c20b3bd039deb7"
+SRC_URI = "https://github.com/ccache/ccache/releases/download/v${PV}/${BP}.tar.gz"
+SRC_URI[sha256sum] = "dbf139ff32031b54cb47f2d7983269f328df14b5a427882f89f7721e5c411b7e"
 
 UPSTREAM_CHECK_URI = "https://github.com/ccache/ccache/releases/"
 
-- 
2.25.1

