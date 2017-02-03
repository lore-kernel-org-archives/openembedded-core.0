Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id B462071957
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Feb 2017 22:45:35 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id v184so3037215pgv.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Feb 2017 14:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=2HeNnCnAq+ypzTlX6V3I1CXlZeToNPHzbGcwfv3S3VY=;
	b=bkUJYCDBCWkgrUNZMQ6oLilIn6n4suagL4RJTJwt0Xv6QoStWEu63hHi6Tp1vrqUdX
	hpdzfklKXYXRhfs2MooQhsv/G02/2O+0y54KyfyzIEBKREE1dayYy06MwvY69naIdFd8
	/x6z1zgwGmzAfD/Mn+aWMMqX8vbPU+ZGWJ3UP3QaXmyXMjqlI3J4991BAlA7Ehip6sqK
	pBPSjinRgh6oT4T+LZF7xQNiquLgKteh+JgeuVLQdWAFhrcrzr5OY1qipCbNAY6rI6Z0
	PoIfih1bMiG52tjMNoUxJS1T4DdPqC1EzoL1V/TksvquejrEaMzJQsr2IsM9SGZNqNq1
	U9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2HeNnCnAq+ypzTlX6V3I1CXlZeToNPHzbGcwfv3S3VY=;
	b=KnHA2iAg6Z8tBVNzI7+FwcUtt+fs+ZPmlUe8G/0UtFxgRUQH5EDqeDgWwPqMvE0DNO
	HfS4dhqyRV09t25nJvO51zzsI11whMQIOUoeNE4EKaXVHaIoLDkSPUm31drWF/nHcR+f
	PZKJ40ZIvmV9+uaO/0/a89/VJGV++IjRdB02oG3CJXKIwvExseZsEtXBm3q9h189Vhil
	1Y2+VD1m62w/3O0uB/kFzWZ9XUP47FbwulrSJjNML4zBG2hnvlHcFZ5aUPpg8kOikCuF
	zwbavWyyVKChlMoNQGlt9/WPABF86fy6Eq3E9JCYx4tS3vIyNJAfp8Ci8g/vSsfcYjYI
	Khbg==
X-Gm-Message-State: AIkVDXLG14imlT5avkfvAc0CopUT+BnCvFxFtU9w4KoM9InUVKlejsC6MtQxU+pmWP6/qw==
X-Received: by 10.99.228.69 with SMTP id i5mr21189977pgk.63.1486161935632;
	Fri, 03 Feb 2017 14:45:35 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	w16sm70229165pgc.15.2017.02.03.14.45.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Feb 2017 14:45:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Feb 2017 14:45:26 -0800
Message-Id: <20170203224526.13288-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] gcc-6: Sync gcc stddef.h with musl stddef.h
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Feb 2017 22:45:37 -0000

GCC provides some of std* headers including stddef.h
and it syncs with glibc definitions via __needed* defines
to find which datatypes are expected to be defined on top
of glibc. we need same for musl.

Drop unused 0048-ARM-PR-target-71056-Don-t-use-vectorized-builtins-wh.patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-6.3.inc              |  1 +
 ...et-71056-Don-t-use-vectorized-builtins-wh.patch | 92 ----------------------
 .../gcc-6.3/0048-sync-gcc-stddef.h-with-musl.patch | 91 +++++++++++++++++++++
 3 files changed, 92 insertions(+), 92 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.3/0048-ARM-PR-target-71056-Don-t-use-vectorized-builtins-wh.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.3/0048-sync-gcc-stddef.h-with-musl.patch

diff --git a/meta/recipes-devtools/gcc/gcc-6.3.inc b/meta/recipes-devtools/gcc/gcc-6.3.inc
index 0b84597a42..0f1b88bea7 100644
--- a/meta/recipes-devtools/gcc/gcc-6.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-6.3.inc
@@ -78,6 +78,7 @@ SRC_URI = "\
            file://0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch \
            file://0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch \
            file://0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch \
+           file://0048-sync-gcc-stddef.h-with-musl.patch \
            ${BACKPORTS} \
 "
 BACKPORTS = ""
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0048-ARM-PR-target-71056-Don-t-use-vectorized-builtins-wh.patch b/meta/recipes-devtools/gcc/gcc-6.3/0048-ARM-PR-target-71056-Don-t-use-vectorized-builtins-wh.patch
deleted file mode 100644
index 9c39c7f7ad..0000000000
--- a/meta/recipes-devtools/gcc/gcc-6.3/0048-ARM-PR-target-71056-Don-t-use-vectorized-builtins-wh.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From 84d2a5509892b65ed60d39e6e2f9719e3762e40e Mon Sep 17 00:00:00 2001
-From: ktkachov <ktkachov@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Tue, 31 May 2016 08:29:39 +0000
-Subject: [PATCH] [ARM] PR target/71056: Don't use vectorized builtins when
- NEON is not available
-
-	PR target/71056
-	* config/arm/arm-builtins.c (arm_builtin_vectorized_function): Return
-	NULL_TREE early if NEON is not available.  Remove now redundant check
-	in ARM_CHECK_BUILTIN_MODE.
-
-	* gcc.target/arm/pr71056.c: New test.
-
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-6-branch@236910 138bc75d-0d04-0410-961f-82ee72b054a4
----
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
- gcc/ChangeLog                          |  7 +++++++
- gcc/config/arm/arm-builtins.c          |  6 +++++-
- gcc/testsuite/ChangeLog                |  5 +++++
- gcc/testsuite/gcc.target/arm/pr71056.c | 32 ++++++++++++++++++++++++++++++++
- 4 files changed, 49 insertions(+), 1 deletion(-)
- create mode 100644 gcc/testsuite/gcc.target/arm/pr71056.c
-
-diff --git a/gcc/config/arm/arm-builtins.c b/gcc/config/arm/arm-builtins.c
-index 90fb40f..68b2839 100644
---- a/gcc/config/arm/arm-builtins.c
-+++ b/gcc/config/arm/arm-builtins.c
-@@ -2861,6 +2861,10 @@ arm_builtin_vectorized_function (unsigned int fn, tree type_out, tree type_in)
-   int in_n, out_n;
-   bool out_unsigned_p = TYPE_UNSIGNED (type_out);
- 
-+  /* Can't provide any vectorized builtins when we can't use NEON.  */
-+  if (!TARGET_NEON)
-+    return NULL_TREE;
-+
-   if (TREE_CODE (type_out) != VECTOR_TYPE
-       || TREE_CODE (type_in) != VECTOR_TYPE)
-     return NULL_TREE;
-@@ -2875,7 +2879,7 @@ arm_builtin_vectorized_function (unsigned int fn, tree type_out, tree type_in)
-    NULL_TREE is returned if no such builtin is available.  */
- #undef ARM_CHECK_BUILTIN_MODE
- #define ARM_CHECK_BUILTIN_MODE(C)    \
--  (TARGET_NEON && TARGET_FPU_ARMV8   \
-+  (TARGET_FPU_ARMV8   \
-    && flag_unsafe_math_optimizations \
-    && ARM_CHECK_BUILTIN_MODE_1 (C))
- 
-diff --git a/gcc/testsuite/gcc.target/arm/pr71056.c b/gcc/testsuite/gcc.target/arm/pr71056.c
-new file mode 100644
-index 0000000..136754e
---- /dev/null
-+++ b/gcc/testsuite/gcc.target/arm/pr71056.c
-@@ -0,0 +1,32 @@
-+/* PR target/71056.  */
-+/* { dg-do compile } */
-+/* { dg-require-effective-target arm_vfp3_ok } */
-+/* { dg-options "-O3 -mfpu=vfpv3" } */
-+
-+/* Check that compiling for a non-NEON target doesn't try to introduce
-+   a NEON vectorized builtin.  */
-+
-+extern char *buff;
-+int f2 ();
-+struct T1
-+{
-+  int reserved[2];
-+  unsigned int ip;
-+  unsigned short cs;
-+  unsigned short rsrv2;
-+};
-+void
-+f3 (const char *p)
-+{
-+  struct T1 x;
-+  __builtin_memcpy (&x, p, sizeof (struct T1));
-+  x.reserved[0] = __builtin_bswap32 (x.reserved[0]);
-+  x.reserved[1] = __builtin_bswap32 (x.reserved[1]);
-+  x.ip = __builtin_bswap32 (x.ip);
-+  x.cs = x.cs << 8 | x.cs >> 8;
-+  x.rsrv2 = x.rsrv2 << 8 | x.rsrv2 >> 8;
-+  if (f2 ())
-+    {
-+      __builtin_memcpy (buff, "\n", 1);
-+    }
-+}
--- 
-2.9.0
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0048-sync-gcc-stddef.h-with-musl.patch b/meta/recipes-devtools/gcc/gcc-6.3/0048-sync-gcc-stddef.h-with-musl.patch
new file mode 100644
index 0000000000..30c158d7da
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.3/0048-sync-gcc-stddef.h-with-musl.patch
@@ -0,0 +1,91 @@
+From 10595c03c39b4e980d2a00e16fc84e9caf82292e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 3 Feb 2017 12:56:00 -0800
+Subject: [PATCH 48/48] sync gcc stddef.h with musl
+
+musl defines ptrdiff_t size_t and wchar_t
+so dont define them here if musl is definining them
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ gcc/ginclude/stddef.h | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/gcc/ginclude/stddef.h b/gcc/ginclude/stddef.h
+index d711530d053..c315b7a97c1 100644
+--- a/gcc/ginclude/stddef.h
++++ b/gcc/ginclude/stddef.h
+@@ -134,6 +134,7 @@ _TYPE_wchar_t;
+ #ifndef ___int_ptrdiff_t_h
+ #ifndef _GCC_PTRDIFF_T
+ #ifndef _PTRDIFF_T_DECLARED /* DragonFly */
++#ifndef __DEFINED_ptrdiff_t /* musl */
+ #define _PTRDIFF_T
+ #define _T_PTRDIFF_
+ #define _T_PTRDIFF
+@@ -143,10 +144,12 @@ _TYPE_wchar_t;
+ #define ___int_ptrdiff_t_h
+ #define _GCC_PTRDIFF_T
+ #define _PTRDIFF_T_DECLARED
++#define __DEFINED_ptrdiff_t /* musl */
+ #ifndef __PTRDIFF_TYPE__
+ #define __PTRDIFF_TYPE__ long int
+ #endif
+ typedef __PTRDIFF_TYPE__ ptrdiff_t;
++#endif /* __DEFINED_ptrdiff_t */
+ #endif /* _PTRDIFF_T_DECLARED */
+ #endif /* _GCC_PTRDIFF_T */
+ #endif /* ___int_ptrdiff_t_h */
+@@ -184,6 +187,7 @@ typedef __PTRDIFF_TYPE__ ptrdiff_t;
+ #ifndef _GCC_SIZE_T
+ #ifndef _SIZET_
+ #ifndef __size_t
++#ifndef __DEFINED_size_t /* musl */
+ #define __size_t__	/* BeOS */
+ #define __SIZE_T__	/* Cray Unicos/Mk */
+ #define _SIZE_T
+@@ -200,6 +204,7 @@ typedef __PTRDIFF_TYPE__ ptrdiff_t;
+ #define ___int_size_t_h
+ #define _GCC_SIZE_T
+ #define _SIZET_
++#define __DEFINED_size_t /* musl */
+ #if (defined (__FreeBSD__) && (__FreeBSD__ >= 5)) \
+   || defined(__DragonFly__) \
+   || defined(__FreeBSD_kernel__)
+@@ -235,6 +240,7 @@ typedef long ssize_t;
+ #endif /* _SIZE_T */
+ #endif /* __SIZE_T__ */
+ #endif /* __size_t__ */
++#endif /* __DEFINED_size_t */
+ #undef	__need_size_t
+ #endif /* _STDDEF_H or __need_size_t.  */
+ 
+@@ -264,6 +270,7 @@ typedef long ssize_t;
+ #ifndef ___int_wchar_t_h
+ #ifndef __INT_WCHAR_T_H
+ #ifndef _GCC_WCHAR_T
++#ifndef __DEFINED_wchar_t /* musl */
+ #define __wchar_t__	/* BeOS */
+ #define __WCHAR_T__	/* Cray Unicos/Mk */
+ #define _WCHAR_T
+@@ -279,6 +286,7 @@ typedef long ssize_t;
+ #define __INT_WCHAR_T_H
+ #define _GCC_WCHAR_T
+ #define _WCHAR_T_DECLARED
++#define __DEFINED_wchar_t /* musl */
+ 
+ /* On BSD/386 1.1, at least, machine/ansi.h defines _BSD_WCHAR_T_
+    instead of _WCHAR_T_, and _BSD_RUNE_T_ (which, unlike the other
+@@ -344,6 +352,7 @@ typedef __WCHAR_TYPE__ wchar_t;
+ #endif
+ #endif /* __WCHAR_T__ */
+ #endif /* __wchar_t__ */
++#endif /* __DEFINED_wchar_t musl */
+ #undef	__need_wchar_t
+ #endif /* _STDDEF_H or __need_wchar_t.  */
+ 
+-- 
+2.11.0
+
-- 
2.11.0


