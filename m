Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9215.1795190874902924978
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 08:07:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=XQ5QqBU3;
 spf=pass (domain: snapchat.com, ip: 209.85.221.46, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so873942f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 08:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1795190873; x=1795795673; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fxNuWCb2YgqjJ/dVLScv8YtNDVMozhYidNirC8ltXio=;
        b=XQ5QqBU3QcgJi5wuWUcrOIq+af2+92uLAxk+Pcg239Bon0GQHRI6Fz7+QEmaVSss6z
         9bUskf7gHxejbuJwNsB7o2W45+wf7UQ29Ci1ZPzGaZ60G9p+uaroD+wxZYoCv3L+6iew
         iLN/OCi97vfFYhZWy9Bhoy36mR/kSwSpCBRCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190873; x=1795795673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fxNuWCb2YgqjJ/dVLScv8YtNDVMozhYidNirC8ltXio=;
        b=EMY8mLrkBhH3mFHxyGhCWYMFWNk3jSNCVQmC/UzPOPD091oKQpdZIPMrhzvnLJS8fi
         4l7HKqCeVgLwxYlzKqnog7yrTnjt3fUMzEnapnEoOa781vD6w4oDOH54rwHBjTjfY3+c
         WiZlMYCTUZkwKezTxoHQCJ/GZcQemrPTNNijwLlAETJLtZHu3eGsSp8i0ijYjfPAjEig
         P6+WLHLIkL7fHCWY9DsVijwXleaz1Z1R/pwNIJ4+/+QX26KaClY+AtcjvTJ5r6nbWki/
         idU4y5Id2Z25ArVHm4t4uHm1t0ssfbOJbx2unX7h7fpDSC2zCEv2g22ho9Sr3j1hk9cn
         IrOQ==
X-Gm-Message-State: APuU4Z+D2uF83l2FtsH3ybOtVhtnjr4EDstbrQLLb1+9TBCDeYHhdIoE
	hBotR/8I2On4GAkNud1dVs/5wEMglhCzOUskUcWNesjGPB2DOykJBjzyhEE0suq9/8wjBoRWKKH
	UqZD6Nzk=
X-Gm-Gg: AZFdTZdm6O4tyTbrQUIBeWjNeJxotnkcNJlfMpXp5FVSdt2JMLW3BEZqDds+Mu08a8T
	rnZElgaLdxVyrG+NjSEKPwf0dlUYBXddLAdfocE/omLNUM2yoAfrfBeCuNU4mX5sI7r8UinZ0Lq
	a+Th1zhUfzSB7uZQoFTG2+EwZo3mJK+o4Ds5qynXGtQRQcHPphi0vVdf8jRdEMgwewcbcMfDy1O
	CyV9OptOgBlW2oqK1ftjIpa0PW6KnHS3tJJKxl9rgRsIbPj6QL6TKwJldTpmkO05YvPixOH8Sdo
	nqFK2OiADH/MHIOrkuz97EWbz5uk861m0ydWBrbb+bcDThsz8TyOXafroI2E8yi9ZubZhGEUzFD
	YHHMoanD+hsgUMXI6A4uzsJ8aZ74QNKTqNARW60eVhReHfMbBhKqeCejBXNOI7HZc/+kQ4m+fqX
	b7FMHkdFlnnLqv/udWZrZmvKQVZQsZCyeRViXhJx+00Sj3csQ3Tezgz1+ByJ2k/Nj4E7qAwAFki
	7tbqSKSRxaHGtH3HJJkebyATMlbhliGFOmrcMbVCkUHmmtUQoX726fGAFPo5xjWxI5FU9qU+qO7
	0lT/bmQgn/2l/jCYhH4lRzeU07iGQ10+aSYeMOkS0fjCg41Ks2cXTqGX1YUbVs6DABUzSvmJXDF
	wC/uGnRm9y06jGyUVKnQRt6nFI2IuRJdmz4EEH4Oh0sg/n4ToLaXsyFG+XudAuXKPLHdPoTSGco
	c=
X-Received: by 2002:a5d:5f4f:0:b0:4a7:35af:c83c with SMTP id ffacd0b85a97d-4abb3e21218mr7206353f8f.43.1795190872527;
        Fri, 20 Nov 2026 08:07:52 -0800 (PST)
Return-Path: <ecordonnier@snapchat.com>
Received: from localhost.localdomain (80-108-196-96.cable.dynamic.surfer.at. [80.108.196.96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf61e8sm6902001f8f.11.2026.11.20.08.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:07:52 -0800 (PST)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [wrynose][PATCH] glibc: Do not use Transparent Huge Pages in malloc by default
Date: Fri, 20 Nov 2026 17:07:46 +0100
Message-ID: <20261120160746.314-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 16:08:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250811
Content-Type: text/plain; charset="utf-8"

From: Etienne Cordonnier <ecordonnier@snap.com>

Since glibc 2.43 malloc on aarch64 defaults to glibc.malloc.hugetlb=1
with a 2MB THP size, which considerably increases memory usage on
embedded systems (an aarch64 system went from 465 MiB to 1105 MiB
AnonPages at idle and started swapping).

The default is a compile-time constant in glibc and GLIBC_TUNABLES does
not reach AT_SECURE programs. Add a configure option to glibc to disable
the default and wire it up as the malloc-default-thp PACKAGECONFIG, off
by default to get the pre-2.43 behavior. THP can still be enabled at run
time with glibc.malloc.hugetlb=1.

Backported to wrynose (glibc 2.43): the glibc patch is the 2.43 backport
of the upstream submission, using the pre-refactor malloc-hugepages.h.

[YOCTO #16490]

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Tested-by: Etienne Cordonnier <ecordonnier@snap.com>
(cherry picked from commit 766b888b41243980b811e848b40fb09894995ea7)
AI-Generated: Uses Claude Code
Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 ...le-malloc-default-thp-configure-opti.patch | 189 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.43.bb         |   7 +
 2 files changed, 196 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0023-malloc-Add-disable-malloc-default-thp-configure-opti.patch

diff --git a/meta/recipes-core/glibc/glibc/0023-malloc-Add-disable-malloc-default-thp-configure-opti.patch b/meta/recipes-core/glibc/glibc/0023-malloc-Add-disable-malloc-default-thp-configure-opti.patch
new file mode 100644
index 0000000000..9731dc08fd
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0023-malloc-Add-disable-malloc-default-thp-configure-opti.patch
@@ -0,0 +1,189 @@
+From f9f37cf138a539263b48e2a6fbe53dce95fe6244 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 14 Nov 2026 21:11:13 +0100
+Subject: [PATCH] malloc: Add --disable-malloc-default-thp configure option
+
+Since glibc 2.43, malloc on aarch64 defaults to glibc.malloc.hugetlb=1
+with a 2MB THP size and also applies MADV_HUGEPAGE to thread arenas.  On
+memory constrained embedded systems this significantly increases the
+resident memory of every process (BZ #34081).
+
+Add a configure option, --disable-malloc-default-thp, which makes the
+generic malloc-hugepages.h override any target definition of
+DEFAULT_THP_PAGESIZE with 0.  The aarch64 header gets an include guard
+so it cannot redefine DEFAULT_THP_PAGESIZE after the generic header has
+undefined it.  This gives the pre-2.43 behavior (glibc.malloc.hugetlb
+defaults to 0, THP can still be enabled at run time with
+glibc.malloc.hugetlb=1).  The default is unchanged.
+
+Upstream-Status: Submitted [https://github.com/kraj/glibc/commit/f42cbe83a44f816cd1780516d738a8681044e9d7]
+
+Backported to glibc 2.43 (pre "hugepages abstraction" refactor): the
+sysdeps hunks apply to sysdeps/generic/malloc-hugepages.h and
+sysdeps/unix/sysv/linux/aarch64/malloc-hugepages.h using
+DEFAULT_THP_PAGESIZE instead of MALLOC_DEFAULT_THP_PAGESIZE, and the
+manual/tunables.texi hunk is dropped.  Functional change is identical.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ INSTALL                                       |  9 ++++++++
+ config.h.in                                   |  4 ++++
+ configure                                     | 21 +++++++++++++++++++
+ configure.ac                                  |  8 +++++++
+ manual/install.texi                           |  8 +++++++
+ sysdeps/generic/malloc-hugepages.h            |  4 ++++
+ .../sysv/linux/aarch64/malloc-hugepages.h     |  7 +++++++
+ 7 files changed, 61 insertions(+)
+
+diff --git a/INSTALL b/INSTALL
+index 4174c9661fa..b1388784076 100644
+--- a/INSTALL
++++ b/INSTALL
+@@ -250,6 +250,15 @@ passed to 'configure'.  For example:
+      Disable using 'scv' instruction for syscalls.  All syscalls will
+      use 'sc' instead, even if the kernel supports 'scv'.  PowerPC only.
+ 
++'--disable-malloc-default-thp'
++     Do not make 'malloc' use Transparent Huge Pages by default.  This
++     restores the behavior of 'glibc.malloc.hugetlb=0' as the default,
++     which can reduce memory usage on systems with limited memory.  Huge
++     pages can still be enabled at run time by setting the
++     'glibc.malloc.hugetlb' tunable to '1'.  This only affects targets
++     which use Transparent Huge Pages in 'malloc' by default, currently
++     AArch64.
++
+ '--build=BUILD-SYSTEM'
+ '--host=HOST-SYSTEM'
+      These options are for cross-compiling.  If you specify both options
+diff --git a/config.h.in b/config.h.in
+index 2cd8c90eb66..74b1a2824c7 100644
+--- a/config.h.in
++++ b/config.h.in
+@@ -29,6 +29,10 @@
+ /* On powerpc*, define if scv should be used for syscalls (when available).  */
+ #undef USE_PPC_SCV
+ 
++/* Define if malloc should use Transparent Huge Pages by default on
++   targets which define DEFAULT_THP_PAGESIZE.  */
++#undef USE_MALLOC_DEFAULT_THP
++
+ /* Define if _Unwind_Find_FDE should be exported from glibc.  */
+ #undef  EXPORT_UNWIND_FIND_FDE
+ 
+diff --git a/configure b/configure
+index 0cd2269859c..d4c8aee085d 100755
+--- a/configure
++++ b/configure
+@@ -820,6 +820,7 @@ enable_pt_chown
+ enable_mathvec
+ enable_cet
+ enable_scv
++enable_malloc_default_thp
+ enable_fortify_source
+ enable_sframe
+ with_cpu
+@@ -1503,6 +1504,10 @@ Optional Features:
+                           (CET), x86 only
+   --disable-scv           syscalls will not use scv instruction, even if the
+                           kernel supports it, powerpc only
++  --disable-malloc-default-thp
++                          malloc will not use Transparent Huge Pages by
++                          default on targets which enable them,
++                          glibc.malloc.hugetlb=1 can still enable them
+   --enable-fortify-source[=1|2|3]
+                           Use -D_FORTIFY_SOURCE=[1|2|3] to control code
+                           hardening, defaults to highest possible value
+@@ -4872,6 +4877,22 @@ then :
+ 
+ fi
+ 
++# Check whether --enable-malloc-default-thp was given.
++if test ${enable_malloc_default_thp+y}
++then :
++  enableval=$enable_malloc_default_thp; use_malloc_default_thp=$enableval
++else case e in #(
++  e) use_malloc_default_thp=yes ;;
++esac
++fi
++
++
++if test "$use_malloc_default_thp" != "no"
++then :
++  printf "%s\n" "#define USE_MALLOC_DEFAULT_THP 1" >>confdefs.h
++
++fi
++
+ # Check whether --enable-fortify-source was given.
+ if test ${enable_fortify_source+y}
+ then :
+diff --git a/configure.ac b/configure.ac
+index 3e4a601c01f..941babaefd0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -429,6 +429,14 @@ AC_ARG_ENABLE([scv],
+ 
+ AS_IF([[test "$use_scv" != "no"]],[AC_DEFINE(USE_PPC_SCV)])
+ 
++AC_ARG_ENABLE([malloc-default-thp],
++	      AS_HELP_STRING([--disable-malloc-default-thp],
++			     [malloc will not use Transparent Huge Pages by default on targets which enable them, glibc.malloc.hugetlb=1 can still enable them]),
++	      [use_malloc_default_thp=$enableval],
++	      [use_malloc_default_thp=yes])
++
++AS_IF([[test "$use_malloc_default_thp" != "no"]],[AC_DEFINE(USE_MALLOC_DEFAULT_THP)])
++
+ dnl Build glibc with _FORTIFY_SOURCE
+ AC_ARG_ENABLE(fortify-source,
+               AS_HELP_STRING([--enable-fortify-source@<:@=1|2|3@:>@],
+diff --git a/manual/install.texi b/manual/install.texi
+index 073cda05309..0a6534e3b35 100644
+--- a/manual/install.texi
++++ b/manual/install.texi
+@@ -280,6 +280,14 @@ C++ libraries.
+ Disable using @code{scv} instruction for syscalls. All syscalls will use
+ @code{sc} instead, even if the kernel supports @code{scv}. PowerPC only.
+ 
++@item --disable-malloc-default-thp
++Do not make @code{malloc} use Transparent Huge Pages by default.  This
++restores the behavior of @code{glibc.malloc.hugetlb=0} as the default,
++which can reduce memory usage on systems with limited memory.  Huge pages
++can still be enabled at run time by setting the @code{glibc.malloc.hugetlb}
++tunable to @code{1}.  This only affects targets which use Transparent
++Huge Pages in @code{malloc} by default, currently AArch64.
++
+ @item --build=@var{build-system}
+ @itemx --host=@var{host-system}
+ These options are for cross-compiling.  If you specify both options and
+diff --git a/sysdeps/generic/malloc-hugepages.h b/sysdeps/generic/malloc-hugepages.h
+index ab2690f7b8a..23a4cdd5bce 100644
+--- a/sysdeps/generic/malloc-hugepages.h
++++ b/sysdeps/generic/malloc-hugepages.h
+@@ -41,6 +41,10 @@ enum malloc_thp_mode_t __malloc_thp_mode (void) attribute_hidden;
+ void __malloc_hugepage_config (size_t requested, size_t *pagesize, int *flags)
+      attribute_hidden;
+ 
++#ifndef USE_MALLOC_DEFAULT_THP
++# undef DEFAULT_THP_PAGESIZE
++#endif
++
+ #ifndef DEFAULT_THP_PAGESIZE
+ # define DEFAULT_THP_PAGESIZE	0
+ #endif
+diff --git a/sysdeps/unix/sysv/linux/aarch64/malloc-hugepages.h b/sysdeps/unix/sysv/linux/aarch64/malloc-hugepages.h
+index 2204112e4e5..27eef7ecca6 100644
+--- a/sysdeps/unix/sysv/linux/aarch64/malloc-hugepages.h
++++ b/sysdeps/unix/sysv/linux/aarch64/malloc-hugepages.h
+@@ -16,6 +16,13 @@
+    License along with the GNU C Library; see the file COPYING.LIB.  If
+    not, see <https://www.gnu.org/licenses/>.  */
+ 
++#ifndef _LINUX_AARCH64_MALLOC_HUGEPAGES_H
++#define _LINUX_AARCH64_MALLOC_HUGEPAGES_H
++
++/* Only define this on the first inclusion, the generic malloc-hugepages.h may
++   undefine it if glibc is configured with --disable-malloc-default-thp.  */
+ #define DEFAULT_THP_PAGESIZE	(1UL << 21)
+ 
+ #include_next <malloc-hugepages.h>
++
++#endif
diff --git a/meta/recipes-core/glibc/glibc_2.43.bb b/meta/recipes-core/glibc/glibc_2.43.bb
index c962171cf3..1f48ab77f5 100644
--- a/meta/recipes-core/glibc/glibc_2.43.bb
+++ b/meta/recipes-core/glibc/glibc_2.43.bb
@@ -60,6 +60,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0020-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://0021-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch \
            file://0022-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch \
+           file://0023-malloc-Add-disable-malloc-default-thp-configure-opti.patch \
 "
 B = "${WORKDIR}/build-${TARGET_SYS}"
 
@@ -97,6 +98,12 @@ PACKAGECONFIG ??= "nscd memory-tagging"
 PACKAGECONFIG[nscd] = "--enable-nscd,--disable-nscd"
 PACKAGECONFIG[memory-tagging] = "--enable-memory-tagging,--disable-memory-tagging"
 
+# Since glibc 2.43 malloc defaults to 2MB Transparent Huge Pages on aarch64,
+# which considerably increases memory usage on embedded systems
+# (https://bugzilla.yoctoproject.org/show_bug.cgi?id=16490). Keep it disabled
+# by default, THP can still be enabled at run time with glibc.malloc.hugetlb=1
+PACKAGECONFIG[malloc-default-thp] = "--enable-malloc-default-thp,--disable-malloc-default-thp"
+
 do_patch:append() {
     bb.build.exec_func('do_fix_readlib_c', d)
 }
-- 
2.43.0

