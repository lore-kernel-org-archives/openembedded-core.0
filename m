Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.5])
 by mx.groups.io with SMTP id smtpd.web09.2802.1615770160434307084
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Mar 2021 18:02:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 85.158.142.5, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.113.0.194] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-central-1.aws.symcld.net id 94/80-38244-322BE406; Mon, 15 Mar 2021 01:02:27 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRWlGSWpSXmKPExsViZ8MRqqu8yS/
  B4OQmJYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPx6yXsBTfdKj4sWMXSwHjOuouRi0NIYAaT
  xKHzTYwQznFGid9nbgE5nBxsApoSvVu2ANkcHCICehJX/4mChJkF1CUurWthAQkLC9hLrGoWB
  gmzCKhKzNi7mxnE5hVwlZj3pp0VxJYQUJCY8vA9VFxQ4uTMJywQYyQkDr54wQxRoygx+3IzC4
  RdKbFn80PWCYy8s5C0zELSsoCRaRWjZVJRZnpGSW5iZo6uoYGBrqGhsa6hrpGRmV5ilW6iXmq
  pbnJqXklRIlBWL7G8WK+4Mjc5J0UvL7VkEyMwvFIKGR/tYDz9+oPeIUZJDiYlUV6DEJ8EIb6k
  /JTKjMTijPii0pzU4kOMMhwcShK8K9b7JQgJFqWmp1akZeYAQx0mLcHBoyTCe3QDUJq3uCAxt
  zgzHSJ1ilGX48XxxYuYhVjy8vNSpcR594AUCYAUZZTmwY2Axd0lRlkpYV5GBgYGIZ6C1KLczB
  JU+VeM4hyMSsK8T0Gm8GTmlcBtegV0BBPQEYbSYEeUJCKkpBqYth16Nz1tUYbwv2/bfOp2pR/
  RmfhOZVOjceQ7hrMbbQ7JZW/+dENj2o3NvRqsKmvip137Ly5+4RHzy3P2UmrTDMS4j7vXp+iJ
  hqix9F1qfvdvEmPYog5eiQf1wcv8zwhuW7Ig9YPDWZaMpgku5tLRh7bfiXo2sfgOu5iadv1S2
  x1n50q3ath//L5eMi5v/sEvR17mZvVlW0+dsoBHK/Nns4Lit7UGgat4Nsnumia4kk/QtVBDcO
  LzwsT3fCc2drBqyhT8mjd1z8nv5uYbZv3UdZkouWsl/zP+8BWzTX/k/jx3SMct5RWrndKJhro
  ZHMunnT7fFhxbYrHH9O3lKU+1U7WmtXcbhdtI/OlI979ursRSnJFoqMVcVJwIAL4hZ882AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-226.messagelabs.com!1615770146!371069!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12788 invoked from network); 15 Mar 2021 01:02:27 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-16.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Mar 2021 01:02:27 -0000
Received: from r01ukexcasm111.r01.fujitsu.local ([10.183.43.167])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12F12Ln3013963
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 01:02:26 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 15 Mar 2021 01:02:19 +0000
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: Fix error in do_patch when using "PATCHTOOL = "patch""
Date: Mon, 15 Mar 2021 09:02:04 +0800
Message-ID: <1615770124-15950-1-git-send-email-wangmy@cn.fujitsu.com>
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

