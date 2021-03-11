Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web10.1435.1615433385651529130
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 19:29:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.112.199.60] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id FF/B4-60958-8AE89406; Thu, 11 Mar 2021 03:29:44 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRWlGSWpSXmKPExsViZ8MxVXd5n2e
  CwfQV5hZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bi10vYC266VXxYsIqlgfGcdRcjF4eQwAwm
  iUnzbrJDOMcZJbofLGHtYuTkYBPQlOjdsoWxi5GDQ0RAT+LqP1GQMLOAusSldS0sIGFhAXuJV
  c3CICaLgKpEww1LkApeAReJDY/ms4PYEgIKElMevmeGiAtKnJz5hAViioTEwRcvmCFqFCVmX2
  5mgbArJfZsfsg6gZF3FpKWWUhaFjAyrWK0SCrKTM8oyU3MzNE1NDDQNTQ00jW0NNM1MjTRS6z
  STdJLLdUtTy0u0TXUSywv1iuuzE3OSdHLSy3ZxAgMrZSCI9d2MB54/UHvEKMkB5OSKG9fgUeC
  EF9SfkplRmJxRnxRaU5q8SFGGQ4OJQne2y2eCUKCRanpqRVpmTnAMIdJS3DwKInwKjQCpXmLC
  xJzizPTIVKnGHU5XhxfvIhZiCUvPy9VSpx3aQ9QkQBIUUZpHtwIWMxdYpSVEuZlZGBgEOIpSC
  3KzSxBlX/FKM7BqCTMu7kXaApPZl4J3KZXQEcwgRxh4AZyREkiQkqqgek298c4u4/en2+3vsg
  tVnHbt+mQbv0xjnYezh+53rvW1Ja4nXy8dL6ttNfDnF8PmStOZj+z6ZzVZH4reMdLthlC9bOO
  nD0i5BbxZPkB/50msxdz9/ytXMKZ8kX6GcP/znNL2ywza+WtDZ5+jPvV+Ebo3gx94cXsvwStD
  j1psGDn+Jv0YJb00UdPtlj8DRRJ9s3flOPEfCvryfbky9PzFD/xXv5i+LLlJIeP4gWH8l8P7J
  tdvysdWGV4YYbS6gl79qrctIqTe84hVhIj8s8vtX7+gptPPKscrrVEZj17Mifua4P9Cj2jY7Y
  Crx6kHPwd8T8uvZWrKn0p0wqlacwPFE1a+Yq+RAu66k+OO/po0gslluKMREMt5qLiRADvDwjA
  NAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-285.messagelabs.com!1615433383!1704265!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16056 invoked from network); 11 Mar 2021 03:29:43 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-18.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 11 Mar 2021 03:29:43 -0000
Received: from r01ukexcasm111.r01.fujitsu.local ([10.183.43.167])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12B3ThsI024106
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Mar 2021 03:29:43 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 11 Mar 2021 03:29:41 +0000
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: Fix error in do_patch when using "PATCHTOOL = "patch""
Date: Thu, 11 Mar 2021 11:29:29 +0800
Message-ID: <1615433369-5140-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167)
Content-Type: text/plain

error message:
checking file gcc/configure.ac Hunk #1 FAILED at 6602.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../0002-gcc-poison-system-directories.patch  | 105 +++++++-----------
 1 file changed, 43 insertions(+), 62 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
index 333d543dd9..697bdc8219 100644
--- a/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
+++ b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
@@ -13,20 +13,21 @@ wants this to be a failure, they can add "-Werror=poison-system-directories".
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
 
 Upstream-Status: Pending
 ---
  gcc/common.opt      |  4 ++++
- gcc/config.in       |  6 ++++++
- gcc/configure       | 16 ++++++++++++++++
- gcc/configure.ac    | 10 ++++++++++
+ gcc/config.in       | 10 ++++++++++
+ gcc/configure       | 19 +++++++++++++++++++
+ gcc/configure.ac    | 16 ++++++++++++++++
  gcc/doc/invoke.texi |  9 +++++++++
- gcc/gcc.c           |  2 ++
+ gcc/gcc.c           |  9 +++++++--
  gcc/incpath.c       | 21 +++++++++++++++++++++
- 7 files changed, 68 insertions(+)
+ 7 files changed, 86 insertions(+), 2 deletions(-)
 
 diff --git a/gcc/common.opt b/gcc/common.opt
-index 65a82410abc..415f38fa1f4 100644
+index 3ec7743ea..d3c3e51dc 100644
 --- a/gcc/common.opt
 +++ b/gcc/common.opt
 @@ -682,6 +682,10 @@ Wreturn-local-addr
@@ -41,7 +42,7 @@ index 65a82410abc..415f38fa1f4 100644
  Common Var(warn_shadow) Warning
  Warn when one variable shadows another.  Same as -Wshadow=global.
 diff --git a/gcc/config.in b/gcc/config.in
-index 809e7b26823..5adeaeed36b 100644
+index 364eba477..7d2c3bbf1 100644
 --- a/gcc/config.in
 +++ b/gcc/config.in
 @@ -224,6 +224,16 @@
@@ -62,7 +63,7 @@ index 809e7b26823..5adeaeed36b 100644
     optimizer and back end) to be checked for dynamic type safety at runtime.
     This is quite expensive. */
 diff --git a/gcc/configure b/gcc/configure
-index cd3d9516fce..8de766a942c 100755
+index 2a9d646b4..a848792f2 100755
 --- a/gcc/configure
 +++ b/gcc/configure
 @@ -1010,6 +1010,7 @@ with_system_zlib
@@ -82,7 +83,7 @@ index cd3d9516fce..8de766a942c 100755
    --enable-plugin         enable plugin support
    --enable-host-shared    build host code as shared libraries
    --disable-libquadmath-support
-@@ -30235,6 +30238,22 @@ if test "${enable_version_specific_runtime_libs+set}" = set; then :
+@@ -30280,6 +30283,22 @@ if test "${enable_version_specific_runtime_libs+set}" = set; then :
  fi
  
  
@@ -106,31 +107,37 @@ index cd3d9516fce..8de766a942c 100755
  
  
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 0de3b4bf97b..8bfd6feb780 100644
+index 51cce36ce..66ffde305 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -6595,6 +6595,16 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
+@@ -6614,6 +6614,22 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
                  [specify that runtime libraries should be
                   installed in a compiler-specific directory])])
  
 +AC_ARG_ENABLE([poison-system-directories],
 +             AS_HELP_STRING([--enable-poison-system-directories],
-+                            [warn for use of native system header directories]),,
++			    [warn for use of native system header directories (no/yes/error)]),,
 +             [enable_poison_system_directories=no])
-+if test "x${enable_poison_system_directories}" = "xyes"; then
++AC_MSG_NOTICE([poisoned directories $enable_poison_system_directories])
++if test "x${enable_poison_system_directories}" != "xno"; then
++  AC_MSG_NOTICE([poisoned directories enabled])
 +  AC_DEFINE([ENABLE_POISON_SYSTEM_DIRECTORIES],
 +           [1],
 +           [Define to warn for use of native system header directories])
++  if test $enable_poison_system_directories = "error"; then
++   AC_MSG_NOTICE([poisoned directories are fatal])
++   AC_DEFINE([POISON_BY_DEFAULT], [1], [Define to make poison warnings errors])
++  fi
 +fi
 +
  # Substitute configuration variables
  AC_SUBST(subdirs)
  AC_SUBST(srcdir)
 diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index f98161391a0..f12d8d12150 100644
+index d929eb109..aa5ff88b1 100644
 --- a/gcc/doc/invoke.texi
 +++ b/gcc/doc/invoke.texi
-@@ -348,6 +348,7 @@ Objective-C and Objective-C++ Dialects}.
+@@ -351,6 +351,7 @@ Objective-C and Objective-C++ Dialects}.
  -Wpacked  -Wno-packed-bitfield-compat  -Wpacked-not-aligned  -Wpadded @gol
  -Wparentheses  -Wno-pedantic-ms-format @gol
  -Wpointer-arith  -Wno-pointer-compare  -Wno-pointer-to-int-cast @gol
@@ -138,7 +145,7 @@ index f98161391a0..f12d8d12150 100644
  -Wno-pragmas  -Wno-prio-ctor-dtor  -Wredundant-decls @gol
  -Wrestrict  -Wno-return-local-addr  -Wreturn-type @gol
  -Wno-scalar-storage-order  -Wsequence-point @gol
-@@ -6924,6 +6925,14 @@ made up of data only and thus requires no special treatment.  But, for
+@@ -6928,6 +6929,14 @@ made up of data only and thus requires no special treatment.  But, for
  most targets, it is made up of code and thus requires the stack to be
  made executable in order for the program to work properly.
  
@@ -154,10 +161,10 @@ index f98161391a0..f12d8d12150 100644
  @opindex Wfloat-equal
  @opindex Wno-float-equal
 diff --git a/gcc/gcc.c b/gcc/gcc.c
-index 9f790db0daf..b2200c5185a 100644
+index 49c9c6c17..24a92bf27 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
-@@ -1041,6 +1041,8 @@ proper position among the other output files.  */
+@@ -1044,6 +1044,8 @@ proper position among the other output files.  */
     "%{fuse-ld=*:-fuse-ld=%*} " LINK_COMPRESS_DEBUG_SPEC \
     "%X %{o*} %{e*} %{N} %{n} %{r}\
      %{s} %{t} %{u*} %{z} %{Z} %{!nostdlib:%{!r:%{!nostartfiles:%S}}} \
@@ -166,8 +173,22 @@ index 9f790db0daf..b2200c5185a 100644
      %{static|no-pie|static-pie:} %@{L*} %(mfwrap) %(link_libgcc) " \
      VTABLE_VERIFICATION_SPEC " " SANITIZER_EARLY_SPEC " %o "" \
      %{fopenacc|fopenmp|%:gt(%{ftree-parallelize-loops=*:%*} 1):\
+@@ -1138,8 +1140,11 @@ static const char *cpp_unique_options =
+ static const char *cpp_options =
+ "%(cpp_unique_options) %1 %{m*} %{std*&ansi&trigraphs} %{W*&pedantic*} %{w}\
+  %{f*} %{g*:%{%:debug-level-gt(0):%{g*}\
+- %{!fno-working-directory:-fworking-directory}}} %{O*}\
+- %{undef} %{save-temps*:-fpch-preprocess}";
++ %{!fno-working-directory:-fworking-directory}}} %{O*}"
++#ifdef POISON_BY_DEFAULT
++ " -Werror=poison-system-directories"
++#endif
++ " %{undef} %{save-temps*:-fpch-preprocess}";
+ 
+ /* This contains cpp options which are not passed when the preprocessor
+    output will be used by another program.  */
 diff --git a/gcc/incpath.c b/gcc/incpath.c
-index 8a2bda00f80..9098ab044ab 100644
+index 94eaba7b1..bfad4ebe3 100644
 --- a/gcc/incpath.c
 +++ b/gcc/incpath.c
 @@ -26,6 +26,7 @@
@@ -205,46 +226,6 @@ index 8a2bda00f80..9098ab044ab 100644
  }
  
  /* Use given -I paths for #include "..." but not #include <...>, and
-diff --git a/gcc/configure.ac b/gcc/configure.ac
-index f42006e5476..de7e176ea53 100644
---- a/gcc/configure.ac
-+++ b/gcc/configure.ac
-@@ -6602,12 +6602,18 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
- 
- AC_ARG_ENABLE([poison-system-directories],
-              AS_HELP_STRING([--enable-poison-system-directories],
--                            [warn for use of native system header directories]),,
-+                            [warn for use of native system header directories (no/yes/error)]),,
-              [enable_poison_system_directories=no])
-+AC_MSG_NOTICE([poisoned directories $enable_poison_system_directories])
--if test "x${enable_poison_system_directories}" = "xyes"; then
-+if test "x${enable_poison_system_directories}" != "xno"; then
-+  AC_MSG_NOTICE([poisoned directories enabled])
-   AC_DEFINE([ENABLE_POISON_SYSTEM_DIRECTORIES],
-            [1],
-            [Define to warn for use of native system header directories])
-+  if test $enable_poison_system_directories = "error"; then
-+   AC_MSG_NOTICE([poisoned directories are fatal])
-+   AC_DEFINE([POISON_BY_DEFAULT], [1], [Define to make poison warnings errors])
-+  fi
- fi
- 
- # Substitute configuration variables
-diff --git a/gcc/gcc.c b/gcc/gcc.c
-index b2200c5185a..fa7b6fc8ddb 100644
---- a/gcc/gcc.c
-+++ b/gcc/gcc.c
-@@ -1136,8 +1136,11 @@ static const char *cpp_unique_options =
- static const char *cpp_options =
- "%(cpp_unique_options) %1 %{m*} %{std*&ansi&trigraphs} %{W*&pedantic*} %{w}\
-  %{f*} %{g*:%{%:debug-level-gt(0):%{g*}\
-- %{!fno-working-directory:-fworking-directory}}} %{O*}\
-- %{undef} %{save-temps*:-fpch-preprocess}";
-+ %{!fno-working-directory:-fworking-directory}}} %{O*}"
-+#ifdef POISON_BY_DEFAULT
-+ " -Werror=poison-system-directories"
-+#endif
-+ " %{undef} %{save-temps*:-fpch-preprocess}";
- 
- /* This contains cpp options which are not passed when the preprocessor
-    output will be used by another program.  */
+-- 
+2.25.1
+
-- 
2.25.1

