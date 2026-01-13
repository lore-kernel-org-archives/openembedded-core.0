Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 771D8D2D0E9
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 12:45:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.57775.1768308325602637419
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 04:45:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=n4ukyx2m;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=54739ea024=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D5Ynlk2961705;
	Tue, 13 Jan 2026 04:45:08 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=TDMpl6ZNe3WmrZFwoUnyrpUEoWb2EGkk1tmwECxZ0H0=; b=n4ukyx2mod12
	b80FVXcR4g6yGaqiPk133sYDVAWWyfh5Yn/lT4SKSdpeq40Ol/HJC0P6jKeqXrQe
	15hlUKCinILZWHSekAvPlFsRy2qL/Jf2L3WcOp6hUNrVCmu/2qUFTFlVetbsTx/V
	5gOmWBHrUpx92yQu8OacZygKTbVKNoT4Q8ZA5BfwDQV8hC5Pd/heLhOQxGNeNO1j
	NselgEfKEmf2lVXWA1yYDOeHxPytetavbrUBU+aAEi5PgAtiAP7wbKJesZcjaLbM
	kLHZUMCB14DLyrsbJG7najnxXaSdUFJ5B3HS5EJzPQWYL67pt+KReWqO5IuQHQEC
	FfnXuiJUsw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkq5fttbf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 13 Jan 2026 04:45:08 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 13 Jan 2026 04:45:07 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 13 Jan 2026 04:45:06 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <alex@linutronix.de>,
        <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH 2/2] webkitgtk: upgrade 2.50.0 -> 2.50.4
Date: Tue, 13 Jan 2026 20:45:04 +0800
Message-ID: <20260113124504.961856-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260113124504.961856-1-hongxu.jia@windriver.com>
References: <20260113124504.961856-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=d/z4CBjE c=1 sm=1 tr=0 ts=69663e54 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iGHA9ds3AAAA:8 a=NEAV23lmAAAA:8 a=Q1sTgoEvAAAA:8 a=Oh2cFVv5AAAA:8
 a=LXCGm8LIAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=V2sgnzSHAAAA:8
 a=ag1SF4gXAAAA:8 a=20KFwNOVAAAA:8 a=7y0kW8l6kmJsD2JvtmQA:9
 a=4vBCUijPwtmRX65I:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FkGh3qDytyf094M0uOEt:22 a=7KeoIwV6GZqOttXkcoxL:22
 a=NxI9r9ql2kHpUT0AVVEO:22 a=FdTzh2GWekK77mhwV6Dw:22 a=Z31ocT7rh6aUJxSkT1EX:22
 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEwOCBTYWx0ZWRfXzCEZjMyf84pR
 r0Ffv7IDoV2WZUXHU4fDjIxA8LWO6vogJKtLAuKEX4tJx0jDUeLU+inozoG3RCDBJOT/ioFrG2w
 QZtINjIYl5ls9VY7tqhQvLRgkJrHgOrBNEeqAzTrhJGAWwMGjQ2TJ/S77qTOkxKbCapNQ2OEi7f
 WymBniGwGfy+jFexsekDVbjBQUOKZ0KDrr1+lYR3jpBH8W/n8IakMsGsd++D1E1uQiCBnOo5jN9
 YXcJ8cEP4OA70wSDcHT+cTeZx2JbULuK0iRpDLlXiExri0C9iHyT6FiLxu+kgjnkBCgUczKMWYN
 5LQM5MTZTEc/c/TD4QRR9uAu6cdCef+RSoq0rlhgjx/pyO1bDBx7BTSEAhRTYfC+Sogb7AFNBqf
 m7viXeWm+FVTYR7Ylu+j7akab3ZN9x7ztmGC54LOFf2Rk6+FAPfYmQXpbwCe4yI/dRtXe+kafYz
 ZfSinp7LkPWjo2EfSHg==
X-Proofpoint-ORIG-GUID: _8zLLJPB3ujj6pxgzNijX8msuqsID9Pc
X-Proofpoint-GUID: _8zLLJPB3ujj6pxgzNijX8msuqsID9Pc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130108
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 60D5Ynlk2961705
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 12:45:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229264

Refresh patches
- 0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
- 0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
- 0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch
- fix-ftbfs-riscv64.patch
- reproducibility.patch
- sys_futex.patch
- t6-not-declared.patch

Drop backport fix-musl-compilation.patch which already exists
in 2.50.4

Signed-off-by: Alexander Kanavin <alex@linutronix.de>

- Fix compile failure on qemux86 [1] to
drop fix_op_instanceof_handler_for_32-bit_C-loop_build.patch,
which conflicts with upstream solution [2]

- Fix compile failure on qemuriscv64
...
Source/ThirdParty/skia/modules/skcms/src/Transform_inl.h:810:71: error: c=
annot tail-call: tail call production failed
  810 |         DECLARE_STAGE(name, arg, [[clang::musttail]] return (*lis=
t.fn)(list, ctx, src, dst, \
      |                                                             ~~~~~=
~~~~~^~~~~~~~~~~~~~~~~~~~~~~
  811 |                                                                  =
      r, g, b, a, i))
      |                                                                  =
      ~~~~~~~~~~~~~~
...

[1] https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/290=
7
[2] https://github.com/WebKit/WebKit/commit/fcaa289f6015595a638eb96b9f728=
eaaa7b13ab8

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...able-to-control-macro-__PAS_ALWAYS_I.patch |   8 +-
 ...spection.cmake-prefix-variables-obta.patch |   2 +-
 ...-on-RISCV-https-bugs.webkit.org-show.patch |   4 +-
 .../webkit/webkitgtk/fix-ftbfs-riscv64.patch  |  24 +++-
 .../webkitgtk/fix-musl-compilation.patch      |  94 --------------
 ...ceof_handler_for_32-bit_C-loop_build.patch | 122 ------------------
 .../webkit/webkitgtk/reproducibility.patch    |   2 +-
 .../webkit/webkitgtk/sys_futex.patch          |  11 +-
 .../webkit/webkitgtk/t6-not-declared.patch    |   6 +-
 ...ebkitgtk_2.50.0.bb =3D> webkitgtk_2.50.4.bb} |   8 +-
 10 files changed, 44 insertions(+), 237 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/fix-musl-compilati=
on.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/fix_op_instanceof_=
handler_for_32-bit_C-loop_build.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.50.0.bb =3D> webkitgtk_2.50=
.4.bb} (96%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable=
-to-control-macro-__PAS_ALWAYS_I.patch b/meta/recipes-sato/webkit/webkitg=
tk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
index f990384511..a2c315a7cc 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-con=
trol-macro-__PAS_ALWAYS_I.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-con=
trol-macro-__PAS_ALWAYS_I.patch
@@ -1,4 +1,4 @@
-From bbf661310448d430350eb2ad8c5869ace648dcf8 Mon Sep 17 00:00:00 2001
+From ec0a881bb05e5a4eed9a71b4494e64373cdd4d25 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Fri, 11 Aug 2023 14:20:48 +0800
 Subject: [PATCH] Add a variable to control macro
@@ -44,7 +44,7 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  2 files changed, 8 insertions(+), 1 deletion(-)
=20
 diff --git a/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h b/Sourc=
e/bmalloc/libpas/src/libpas/pas_utils_prefix.h
-index 5d5fb38c..a554f700 100644
+index ea511e5b..2e8df1e5 100644
 --- a/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
 +++ b/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
 @@ -44,7 +44,7 @@ __PAS_BEGIN_EXTERN_C;
@@ -57,10 +57,10 @@ index 5d5fb38c..a554f700 100644
  #else
  #define __PAS_ALWAYS_INLINE_BUT_NOT_INLINE
 diff --git a/Source/cmake/WebKitCompilerFlags.cmake b/Source/cmake/WebKi=
tCompilerFlags.cmake
-index f5ec0a55..dfd741e7 100644
+index 77a292fb..bf53d809 100644
 --- a/Source/cmake/WebKitCompilerFlags.cmake
 +++ b/Source/cmake/WebKitCompilerFlags.cmake
-@@ -503,3 +503,10 @@ endif ()
+@@ -512,3 +512,10 @@ endif ()
 =20
  # FIXME: Enable pre-compiled headers for all ports <https://webkit.org/=
b/139438>
  set(CMAKE_DISABLE_PRECOMPILE_HEADERS ON)
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospec=
tion.cmake-prefix-variables-obta.patch b/meta/recipes-sato/webkit/webkitg=
tk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
index b11a18ba22..56d532749a 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cm=
ake-prefix-variables-obta.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cm=
ake-prefix-variables-obta.patch
@@ -1,4 +1,4 @@
-From e0dfc113b016227da8a654d625e8f568b56761d0 Mon Sep 17 00:00:00 2001
+From 14b50f50e1c8198f3a14767b8d62e25093babe51 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 27 Oct 2015 16:02:19 +0200
 Subject: [PATCH] FindGObjectIntrospection.cmake: prefix variables obtain=
ed
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-errors-on-=
RISCV-https-bugs.webkit.org-show.patch b/meta/recipes-sato/webkit/webkitg=
tk/0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch
index 40a7133052..66ffd1266b 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-errors-on-RISCV-h=
ttps-bugs.webkit.org-show.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-errors-on-RISCV-h=
ttps-bugs.webkit.org-show.patch
@@ -1,4 +1,4 @@
-From 984538dcce7b184269efc1e1b0fb78e1cb932b5d Mon Sep 17 00:00:00 2001
+From 7fe5b5ef35441a2e40cac13a51c6af10afa1dbe2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 21 Mar 2025 01:21:22 -0700
 Subject: [PATCH] Fix build errors on RISCV
@@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+)
=20
 diff --git a/Source/WebCore/contentextensions/ContentExtensionActions.h =
b/Source/WebCore/contentextensions/ContentExtensionActions.h
-index 0b75d2e1df78..61cb33c94ce8 100644
+index a600f410..80512454 100644
 --- a/Source/WebCore/contentextensions/ContentExtensionActions.h
 +++ b/Source/WebCore/contentextensions/ContentExtensionActions.h
 @@ -28,6 +28,7 @@
diff --git a/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch b=
/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch
index e436896098..82eb56a0f6 100644
--- a/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch
@@ -1,13 +1,23 @@
+From 9d09d47c01b8ee92a02662d58d2570160064fa5d Mon Sep 17 00:00:00 2001
 From: Alberto Garcia <berto@igalia.com>
-Description: Use WTF_CPU_UNKNOWN when building for riscv64
- WebKitGTK doesn't build on riscv64 even with the JIT disabled.
- Treating the CPU as unknown is perhaps a bit severe, but it allows us
- to get the build done until someone steps up to maintain this
- properly.
+Date: Fri, 19 Dec 2025 10:10:41 +0000
+Subject: Use WTF_CPU_UNKNOWN when building for riscv64
+
+WebKitGTK doesn't build on riscv64 even with the JIT disabled.
+Treating the CPU as unknown is perhaps a bit severe, but it allows us
+to get the build done until someone steps up to maintain this
+properly.
 Bug: https://bugs.webkit.org/show_bug.cgi?id=3D271371
=20
 Upstream-Status: Submitted [https://bugs.webkit.org/show_bug.cgi?id=3D27=
1371#c1]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Source/WTF/wtf/PlatformCPU.h    | 8 --------
+ Source/cmake/WebKitCommon.cmake | 2 --
+ 2 files changed, 10 deletions(-)
+
+diff --git a/Source/WTF/wtf/PlatformCPU.h b/Source/WTF/wtf/PlatformCPU.h
+index 8aac1024..d9d69a40 100644
 --- a/Source/WTF/wtf/PlatformCPU.h
 +++ b/Source/WTF/wtf/PlatformCPU.h
 @@ -286,14 +286,6 @@
@@ -25,9 +35,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #if !CPU(KNOWN)
  #define WTF_CPU_UNKNOWN 1
  #endif
+diff --git a/Source/cmake/WebKitCommon.cmake b/Source/cmake/WebKitCommon=
.cmake
+index 98ee788a..3861c0a4 100644
 --- a/Source/cmake/WebKitCommon.cmake
 +++ b/Source/cmake/WebKitCommon.cmake
-@@ -125,8 +125,6 @@ if (NOT HAS_RUN_WEBKIT_COMMON)
+@@ -129,8 +129,6 @@ if (NOT HAS_RUN_WEBKIT_COMMON)
          set(WTF_CPU_PPC64 1)
      elseif (LOWERCASE_CMAKE_SYSTEM_PROCESSOR MATCHES "ppc64le")
          set(WTF_CPU_PPC64LE 1)
diff --git a/meta/recipes-sato/webkit/webkitgtk/fix-musl-compilation.patc=
h b/meta/recipes-sato/webkit/webkitgtk/fix-musl-compilation.patch
deleted file mode 100644
index c0112cad18..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/fix-musl-compilation.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-From 820e4bb46d7e72ba2b14b15819166919c2e81205 Mon Sep 17 00:00:00 2001
-From: Adrian Perez de Castro <aperez@igalia.com>
-Date: Wed, 15 Oct 2025 00:58:59 +0300
-Subject: [PATCH] [libpas] Build fails with libc implementations that lac=
k
- execinfo.h https://bugs.webkit.org/show_bug.cgi?id=3D300701
-
-Reviewed by NOBODY (OOPS!).
-
-Change guards to use backtrace() and execinfo.h on Linux only when using
-glibc as the C library. The PlayStation and Windows cases no longer need
-to be matched, as they are neither Linux nor Darwin, both of which are n=
ow
-explicitly listed. The Android check is kept as it was.
-
-* Source/bmalloc/libpas/src/libpas/pas_probabilistic_guard_malloc_alloca=
tor.c:
-* Source/bmalloc/libpas/src/test/PGMTests.cpp:
-(addPGMTests):
-
-
-Fixes the following error in OE, when compiled with musl:
-
-| ${UNPACKDIR}/webkitgtk-2.50.0/Source/bmalloc/libpas/src/libpas/pas_pro=
babilistic_guard_malloc_allocator.c:52:10: fatal error: execinfo.h: No su=
ch file or directory
-|    52 | #include <execinfo.h>
-
-
-Upstream-Status: Backport [https://github.com/WebKit/WebKit/pull/52300]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
-
----
- .../pas_probabilistic_guard_malloc_allocator.c      |  4 ++--
- Source/bmalloc/libpas/src/test/PGMTests.cpp         | 13 ++++++-------
- 2 files changed, 8 insertions(+), 9 deletions(-)
-
-diff --git a/Source/bmalloc/libpas/src/libpas/pas_probabilistic_guard_ma=
lloc_allocator.c b/Source/bmalloc/libpas/src/libpas/pas_probabilistic_gua=
rd_malloc_allocator.c
-index ff3adefa7dcc..58ec32eb4fed 100644
---- a/Source/bmalloc/libpas/src/libpas/pas_probabilistic_guard_malloc_al=
locator.c
-+++ b/Source/bmalloc/libpas/src/libpas/pas_probabilistic_guard_malloc_al=
locator.c
-@@ -43,8 +43,8 @@
- #include <unistd.h>
- #endif
-=20
--/* PlayStation does not currently support the backtrace API. Android AP=
I versions < 33 don't, either. Windows does not either. */
--#if !PAS_PLATFORM(PLAYSTATION) && (!PAS_OS(ANDROID) || __ANDROID_API__ =
>=3D 33) && !PAS_OS(WINDOWS)
-+/* PlayStation does not currently support the backtrace API. Android AP=
I versions < 33 don't, either. Windows does not either. Linux only with G=
Libc and not uCLibc/Musl. */
-+#if (PAS_OS(ANDROID) && __ANDROID_API__ >=3D 33) || PAS_OS(DARWIN) || (=
PAS_OS(LINUX) && defined(__GLIBC__) && !defined(__UCLIBC__))
- #include <execinfo.h>
- #else
- size_t backtrace(void** buffer, size_t size)
-diff --git a/Source/bmalloc/libpas/src/test/PGMTests.cpp b/Source/bmallo=
c/libpas/src/test/PGMTests.cpp
-index 0432f46ba3b0..dfbf957a3421 100644
---- a/Source/bmalloc/libpas/src/test/PGMTests.cpp
-+++ b/Source/bmalloc/libpas/src/test/PGMTests.cpp
-@@ -43,9 +43,9 @@
- #include "pas_report_crash.h"
- #include "pas_root.h"
-=20
--#if !PAS_PLATFORM(PLAYSTATION)
-+#if (PAS_OS(ANDROID) && __ANDROID_API__ >=3D 33) || PAS_OS(DARWIN) || (=
PAS_OS(LINUX) && defined(__GLIBC__) && !defined(__UCLIBC__))
- #include <execinfo.h>
--#endif // !PAS_PLATFORM(PLAYSTATION)
-+#endif
-=20
- using namespace std;
-=20
-@@ -383,8 +383,7 @@ void testPGMMetadataVectorManagementFewDeallocations=
()
-     pas_heap_lock_unlock();
- }
-=20
--/* Backtrace API is currently not supported on PlayStation. */
--#if !PAS_PLATFORM(PLAYSTATION)
-+#if (PAS_OS(ANDROID) && __ANDROID_API__ >=3D 33) || PAS_OS(DARWIN) || (=
PAS_OS(LINUX) && defined(__GLIBC__) && !defined(__UCLIBC__))
- void testPGMMetadataDoubleFreeBehavior()
- {
-     pas_probabilistic_guard_malloc_initialize_pgm_as_enabled(1);
-@@ -583,7 +582,7 @@ void testPGMAllocMetadataOnly()
-         CHECK(!dealloc_metadata);
-     }
- }
--#endif // !PAS_PLATFORM(PLAYSTATION)
-+#endif
-=20
- } // anonymous namespace
-=20
-@@ -598,9 +597,9 @@ void addPGMTests()
-     ADD_TEST(testPGMMetadataVectorManagement());
-     ADD_TEST(testPGMMetadataVectorManagementFewDeallocations());
-     ADD_TEST(testPGMMetadataVectorManagementRehash());
--#if !PAS_PLATFORM(PLAYSTATION)
-+#if (PAS_OS(ANDROID) && __ANDROID_API__ >=3D 33) || PAS_OS(DARWIN) || (=
PAS_OS(LINUX) && defined(__GLIBC__) && !defined(__UCLIBC__))
-     ADD_TEST(testPGMMetadataDoubleFreeBehavior());
-     ADD_TEST(testPGMBmallocAllocationBacktrace());
-     ADD_TEST(testPGMAllocMetadataOnly());
--#endif // !PAS_PLATFORM(PLAYSTATION)
-+#endif
- }
diff --git a/meta/recipes-sato/webkit/webkitgtk/fix_op_instanceof_handler=
_for_32-bit_C-loop_build.patch b/meta/recipes-sato/webkit/webkitgtk/fix_o=
p_instanceof_handler_for_32-bit_C-loop_build.patch
deleted file mode 100644
index aa3b53e1bb..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/fix_op_instanceof_handler_for_32=
-bit_C-loop_build.patch
+++ /dev/null
@@ -1,122 +0,0 @@
-From 0000000000000000000000000000000000000000 Fri Sep 19 11:55:30 2025=20
-From: amaxcz <amaxcz@gmail.com>
-Date: Fri, 19 Sep 2025 11:55:30 +0000
-Subject: [PATCH] JSC: fix op_instanceof handler for 32-bit C-loop build
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-JSC: fix op_instanceof handler for 32-bit C-loop build
-
-Fixes missing 'op_instanceof' handler in LowLevelInterpreter32_64.asm
-which breaks 32=E2=80=91bit builds.
-
-* No ChangeLog (raw external patch).
-
-Upstream-Status: Submitted [https://bugs.webkit.org/show_bug.cgi?id=3D29=
9166]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
-
---- ./Source/JavaScriptCore/llint/LowLevelInterpreter32_64.asm	2025-08-0=
8 11:17:51.552549400 +0200
-+++ ./Source/JavaScriptCore/llint/LowLevelInterpreter32_64.asm	2025-09-1=
9 12:34:26.253563496 +0200
-@@ -3445,4 +3445,97 @@
- slowPathOp(mod)
-=20
- llintSlowPathOp(has_structure_with_flags)
--llintSlowPathOp(instanceof)
-+
-+llintOpWithMetadata(op_instanceof, OpInstanceof, macro (size, get, disp=
atch, metadata, return)
-+
-+    macro getAndLoadConstantOrVariable(fieldName, tagReg, payloadReg)
-+        get(fieldName, t5)
-+        loadConstantOrVariable(size, t5, tagReg, payloadReg)
-+    end
-+
-+    macro isObject(field, falseLabel)
-+        getAndLoadConstantOrVariable(field, t0, t1)
-+        bineq t0, CellTag, falseLabel
-+        bbneq JSCell::m_type[t1], ObjectType, falseLabel
-+    end
-+
-+    macro overridesHasInstance(hasInstanceField, constructorField, true=
Label)
-+        getAndLoadConstantOrVariable(hasInstanceField, t0, t1)
-+        bineq t0, CellTag, trueLabel
-+        loadp CodeBlock[cfr], t2
-+        loadp CodeBlock::m_globalObject[t2], t2
-+        loadp JSGlobalObject::m_functionProtoHasInstanceSymbolFunction[=
t2], t2
-+        bpneq t1, t2, trueLabel
-+
-+        get(constructorField, t5)
-+        loadConstantOrVariablePayload(size, t5, CellTag, t1, trueLabel)
-+        btbz JSCell::m_flags[t1], ImplementsDefaultHasInstance, trueLab=
el
-+    end
-+
-+    macro storeValue(tagReg, payloadReg, fieldName)
-+        move tagReg, t0
-+        move payloadReg, t1
-+        get(fieldName, t5)
-+        storei t0, TagOffset[cfr, t5, 8]
-+        storei t1, PayloadOffset[cfr, t5, 8]
-+    end
-+
-+.getHasInstance:
-+    isObject(m_constructor, .throwStaticError)
-+    get(m_constructor, t5)
-+    metadata(t2, t6)
-+    loadConstantOrVariablePayload(size, t5, CellTag, t3, .getHasInstanc=
eSlow)
-+    performGetByIDHelper(OpInstanceof, m_hasInstanceModeMetadata, m_has=
InstanceValueProfile, .getHasInstanceSlow, size,
-+        macro (resultTag, resultPayload)
-+            storeValue(resultTag, resultPayload, m_hasInstanceOrPrototy=
pe)
-+            jmp .getPrototype
-+        end)
-+    jmp .getPrototype
-+
-+.getHasInstanceSlow:
-+    callSlowPath(_llint_slow_path_get_hasInstance_from_instanceof)
-+    branchIfException(_llint_throw_from_slow_path_trampoline)
-+    jmp .getPrototype
-+
-+.getHasInstanceInlinedGetterOSRReturnPoint:
-+    # This path is taken when exiting to the LLInt from an inlined gett=
er for Symbol.hasInstance.
-+    getterSetterOSRExitReturnPoint(op_instanceof, size)
-+    valueProfile(size, OpInstanceof, m_hasInstanceValueProfile, r1, r0,=
 t2)
-+    storeValue(r1, r0, m_hasInstanceOrPrototype)
-+
-+.getPrototype:
-+    overridesHasInstance(m_hasInstanceOrPrototype, m_constructor, .inst=
anceofCustom)
-+    isObject(m_value, .false)
-+    get(m_constructor, t5)
-+    metadata(t2, t6)
-+    loadConstantOrVariablePayload(size, t5, CellTag, t3, .getPrototypeS=
low)
-+    performGetByIDHelper(OpInstanceof, m_prototypeModeMetadata, m_proto=
typeValueProfile, .getPrototypeSlow, size,
-+        macro (resultTag, resultPayload)
-+            storeValue(resultTag, resultPayload, m_hasInstanceOrPrototy=
pe)
-+            jmp .instanceof
-+        end)
-+    jmp .instanceof
-+
-+.getPrototypeSlow:
-+    callSlowPath(_llint_slow_path_get_prototype_from_instanceof)
-+    branchIfException(_llint_throw_from_slow_path_trampoline)
-+    jmp .instanceof
-+
-+.instanceof:
-+    callSlowPath(_llint_slow_path_instanceof_from_instanceof)
-+    dispatch()
-+
-+.throwStaticError:
-+    callSlowPath(_slow_path_throw_static_error_from_instanceof)
-+    dispatch()
-+
-+.instanceofCustom:
-+    callSlowPath(_slow_path_instanceof_custom_from_instanceof)
-+    dispatch()
-+
-+.false:
-+    get(m_dst, t5)
-+    storei BooleanTag, TagOffset[cfr, t5, 8]
-+    storei 0, PayloadOffset[cfr, t5, 8]
-+    dispatch()
-+end)
-
---=20
-2.45.0
diff --git a/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch b/m=
eta/recipes-sato/webkit/webkitgtk/reproducibility.patch
index 436ad2f02c..14784a38a0 100644
--- a/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
@@ -1,4 +1,4 @@
-From 65e9a68c9d05f4902c2fc34303b7f8233ffa98d5 Mon Sep 17 00:00:00 2001
+From d8a41103d268c7d7de12326a15642508c3541d85 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 3 Jan 2022 14:18:34 +0000
 Subject: [PATCH] webkitgtk: Add reproducibility fix
diff --git a/meta/recipes-sato/webkit/webkitgtk/sys_futex.patch b/meta/re=
cipes-sato/webkit/webkitgtk/sys_futex.patch
index 19d18dea88..c473e81705 100644
--- a/meta/recipes-sato/webkit/webkitgtk/sys_futex.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/sys_futex.patch
@@ -1,7 +1,16 @@
-Fix build on newer 32bit architectures with only 64bit time_t
+From 5a82a729903fcd6943334c160838a143dc9a3b3c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 18 Dec 2024 20:24:22 -0800
+Subject: [PATCH] Fix build on newer 32bit architectures with only 64bit =
time_t
=20
 Upstream-Status: Submitted [https://chromium-review.googlesource.com/c/a=
ngle/angle/+/6108397]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Source/ThirdParty/ANGLE/src/common/SimpleMutex.cpp | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/Source/ThirdParty/ANGLE/src/common/SimpleMutex.cpp b/Source=
/ThirdParty/ANGLE/src/common/SimpleMutex.cpp
+index 4ed0af51..11feda6c 100644
 --- a/Source/ThirdParty/ANGLE/src/common/SimpleMutex.cpp
 +++ b/Source/ThirdParty/ANGLE/src/common/SimpleMutex.cpp
 @@ -17,6 +17,9 @@
diff --git a/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch b/m=
eta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
index 4b0cf364d8..97af0bce8f 100644
--- a/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
@@ -1,4 +1,4 @@
-From 29431aec88764072a032aa4411e26e566a3a6c0b Mon Sep 17 00:00:00 2001
+From 367cc1e4bdb122a72666314abdb09dad266fd8a6 Mon Sep 17 00:00:00 2001
 From: Michael Catanzaro <mcatanzaro@redhat.com>
 Date: Mon, 5 Feb 2024 11:00:49 -0600
 Subject: [PATCH] =3D?UTF-8?q?LowLevelInterpreter.cpp:339:21:=3D20error:=3D=
20?=3D
@@ -21,10 +21,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.=
com>
  1 file changed, 2 deletions(-)
=20
 diff --git a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp b/Sourc=
e/JavaScriptCore/llint/LowLevelInterpreter.cpp
-index 76c46889..500be433 100644
+index d80e882a..84448df2 100644
 --- a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
 +++ b/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
-@@ -336,8 +336,6 @@ JSValue CLoop::execute(OpcodeID entryOpcodeID, void*=
 executableAddress, VM* vm,
+@@ -340,8 +340,6 @@ JSValue CLoop::execute(OpcodeID entryOpcodeID, void*=
 executableAddress, VM* vm,
      UNUSED_VARIABLE(t2);
      UNUSED_VARIABLE(t3);
      UNUSED_VARIABLE(t5);
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.50.0.bb b/meta/recipes-=
sato/webkit/webkitgtk_2.50.4.bb
similarity index 96%
rename from meta/recipes-sato/webkit/webkitgtk_2.50.0.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.50.4.bb
index b4173c08dd..54ac1463b2 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.50.0.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.50.4.bb
@@ -17,10 +17,8 @@ SRC_URI =3D "https://www.webkitgtk.org/releases/${BPN}=
-${PV}.tar.xz \
            file://sys_futex.patch \
            file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-s=
how.patch \
            file://fix-ftbfs-riscv64.patch \
-           file://fix-musl-compilation.patch \
-           file://fix_op_instanceof_handler_for_32-bit_C-loop_build.patc=
h \
            "
-SRC_URI[sha256sum] =3D "e564b8099f9a3ae32409539b290bbd2ad084e99b6d22d4aa=
c5e51e4554df8bc2"
+SRC_URI[sha256sum] =3D "d3bfa473845acfab72635bada5e0d134fda6792c5b95c5c5=
cd141b46125bd8e4"
=20
 inherit cmake pkgconfig gobject-introspection perlnative features_check =
upstream-version-is-even gi-docgen
=20
@@ -109,6 +107,10 @@ CXXFLAGS:append:arc =3D " -mlong-calls"
 # Needed for non-mesa graphics stacks when x11 is disabled
 CXXFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DEGL=
_NO_X11=3D1', d)}"
=20
+# Fix Source/ThirdParty/skia/modules/skcms/src/Transform_inl.h:810:71:
+# error: cannot tail-call: tail call production failed
+CXXFLAGS:append:riscv64 =3D " -DSKCMS_HAS_MUSTTAIL=3D0"
+
 # Javascript JIT is not supported on powerpc
 EXTRA_OECMAKE:append:powerpc =3D " -DENABLE_JIT=3DOFF "
 EXTRA_OECMAKE:append:powerpc64 =3D " -DENABLE_JIT=3DOFF "
--=20
2.34.1


