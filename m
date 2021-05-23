Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web09.6651.1621745134367888282
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 May 2021 21:45:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cP/RCX1L;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id m190so17604051pga.2
        for <openembedded-core@lists.openembedded.org>; Sat, 22 May 2021 21:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hxNFPoSWLC1ClkoWudwFpsPe0DF6qaC3q8dY3XqLiMM=;
        b=cP/RCX1LhC+hYJ3v6jsjGX81IYBCNboRnvLB8+K7cHXf6FT67M34NNlnI7D+FxV572
         jZfvQmcENlr1MPRVvRG0S4qv8Uk3oK+IAqGyI5updDBVsMQeTv/G6QbDlIseNcJQNIMj
         D0URY8BvA3ugx0YeLJANeOG9ka3ndOd6eVJ0iob48GRYcaVz4yFo+d+aCb/gHQVjZNE6
         FFmGPPhfo9fhlN6Yd+8pfkTQkGUC2yJs6lMyEzSgmbsA5hlUDYyDvYS8Y3yw+TiUksv6
         dicH/GujHjWXKYA3SPIt4scp5b9sVsE9hvm3GUuIP4dZ9B3FTDaY4gdTIRDjFudeZ6rR
         58ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hxNFPoSWLC1ClkoWudwFpsPe0DF6qaC3q8dY3XqLiMM=;
        b=kwvBzrRvvjYp5kXGITbSQHtIcEVrXFFDnzrj/Gmn+xCWs2rhx/DThaDOGGW9PJ8E/Z
         MXPcE8AIRwXLYi0DOHTc9ucrT1Xm3/MZXQH+Y2R0ekUBsFDkTgtXhX0ky7BfM1rK7ga3
         U/xJ1kRgk/qUkUKss2IyB0AyfvNe49qPTcrOdKLnRtC6v1VwnIARSlxAsOCRk3qmBjAS
         65Af6K22cSHju6VRzE9+toTLvz+ruzSL+j0W86qaeMpZhuL/66NC3t4NeZQ/x1s5rhZO
         2wf6yT7Nn6ilZSmEqbzABkRsyssZ9fh/akjeHpACScvsptvFRvoNkBnBXQPgmf6wTWoG
         EpZA==
X-Gm-Message-State: AOAM532QjrmHuUwbfMp+p9WaxbxWpRN0dTG96H0bt9btEArqEJ0yKlln
	0XGZK3wv5YfpqHdb3LZP2F4gDXupNvupVQ==
X-Google-Smtp-Source: ABdhPJwCPfQzFZzIcfZokkAsYGQsupJ3sWFMeENTTvYrymnx4LLFfyCEz/AQwoGAnw/xHUbpA1VsRQ==
X-Received: by 2002:a65:6156:: with SMTP id o22mr7060009pgv.71.1621745132964;
        Sat, 22 May 2021 21:45:32 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::db30])
        by smtp.gmail.com with ESMTPSA id w125sm7645078pfw.214.2021.05.22.21.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 May 2021 21:45:32 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] glibc: Update to latest 2.33 branch
Date: Sat, 22 May 2021 21:45:29 -0700
Message-Id: <20210523044529.2404444-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop backported patches
Add CVE-2021-27645 to CVE_CHECK_WHITELIST and drop the patch as its also
upstreamed

Changes in the version bump are

* 3f5080aedd nptl: Do not build nptl/tst-pthread-gdb-attach as PIE
* 36783141cf nptl: Check for compatible GDB in nptl/tst-pthread-gdb-attach
* ea299b62e8 nptl_db: Support different libpthread/ld.so load orders (bug 27744)
* 162df872f0 x86: tst-cpu-features-supports.c: Update AMX check
* 12ff80b312 Remove PR_TAGGED_ADDR_ENABLE from sys/prctl.h
* 1bf38e7260 Fix SXID_ERASE behavior in setuid programs (BZ #27471)
* a7b8e8ec9b Enhance setuid-tunables test
* ee16c81063 tst-env-setuid: Use support_capture_subprogram_self_sgid
* 267e174f19 support: Add capability to fork an sgid child
* 249c486ce8 support: Pass environ to child process
* 45b2c57d34 support: Typo and formatting fixes
* e07abf59b2 tunables: Fix comparison of tunable values
* 3e9ca60a58 linux: always update select timeout (BZ #27706)
* 8380ca5833 linux: Normalize and return timeout on select (BZ #27651)
* 85e4dc415a libsupport: Add support_select_normalizes_timeout
* b5b4aa62c1 libsupport: Add support_select_modifies_timeout
* 3d525dd639 misc: Fix tst-select timeout handling (BZ#27648)
* 830674605f tst: Provide test for select
* e78ea9bd26 Update Nios II libm-test-ulps.
* 98bb18f52a malloc: Fix a realloc crash with heap tagging [BZ 27468]
* fc4ecce85b S390: Also check vector support in memmove ifunc-selector [BZ #27511]
* db32fc27e7 test-container: Always copy test-specific support files [BZ #27537]
* 79c6be6a0a nptl: Remove private futex optimization [BZ #27304]
* f90d6b0484 pthread_once hangs when init routine throws an exception [BZ #18435]
* dd8023c2ac elf: ld.so --help calls _dl_init_paths without a main map [BZ #27577]
* ea5a537e87 elf: Always set l in _dl_init_paths (bug 23462)
* 64f6c287ad x86: Handle _SC_LEVEL1_ICACHE_LINESIZE [BZ #27444]
* 32b9280f1d io: Return EBAFD for negative file descriptor on fstat (BZ #27559)
* a151f2e05a nscd: Fix double free in netgroupcache [BZ #27462]
* ee9f98d9ca x86: Set minimum x86-64 level marker [BZ #27318]
* 3e880d7337 nss: Re-enable NSS module loading after chroot [BZ #27389]
* 71b2463f61 x86: Add CPU-specific diagnostics to ld.so --list-diagnostics
* a1eb3915e7 x86: Automate generation of PREFERRED_FEATURE_INDEX_1 bitfield
* 33dc1dd602 ld.so: Implement the --list-diagnostics option
* 8d4241b897 string: Work around GCC PR 98512 in rawmemchr
* 6efa2d44c8 S390: Add new hwcap values.
* c5e3545897 tunables: Disallow negative values for some tunables
* 905fdc7071 x86: Use SIZE_MAX instead of (long int)-1 for tunable range value
* 15afd6b8d8 tunables: Simplify TUNABLE_SET interface
* 17f0ff0978 nsswitch: return result when nss database is locked [BZ #27343]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 ...-private-futex-optimization-BZ-27304.patch |  49 -----
 ...-ISA-support-for-x86-64-level-marker.patch | 116 -----------
 ...ork-around-GCC-PR-98512-in-rawmemchr.patch |  58 ------
 ...-_SC_LEVEL1_ICACHE_LINESIZE-BZ-27444.patch | 185 ------------------
 .../glibc/glibc/CVE-2021-27645.patch          |  51 -----
 meta/recipes-core/glibc/glibc_2.33.bb         |   7 +-
 7 files changed, 2 insertions(+), 466 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/0001-nptl-Remove-private-futex-optimization-BZ-27304.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0031-x86-Require-full-ISA-support-for-x86-64-level-marker.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0032-string-Work-around-GCC-PR-98512-in-rawmemchr.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0033-x86-Handle-_SC_LEVEL1_ICACHE_LINESIZE-BZ-27444.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-27645.patch

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 3a95173175..376ead66ac 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.33/master"
 PV = "2.33"
-SRCREV_glibc ?= "9826b03b747b841f5fc6de2054bf1ef3f5c4bdf3"
+SRCREV_glibc ?= "3f5080aedd164c1f92a53552dd3e0b82ac6d2bd3"
 SRCREV_localedef ?= "bd644c9e6f3e20c5504da1488448173c69c56c28"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
diff --git a/meta/recipes-core/glibc/glibc/0001-nptl-Remove-private-futex-optimization-BZ-27304.patch b/meta/recipes-core/glibc/glibc/0001-nptl-Remove-private-futex-optimization-BZ-27304.patch
deleted file mode 100644
index 39fde5b785..0000000000
--- a/meta/recipes-core/glibc/glibc/0001-nptl-Remove-private-futex-optimization-BZ-27304.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From c4ad832276f4dadfa40904109b26a521468f66bc Mon Sep 17 00:00:00 2001
-From: Florian Weimer <fweimer@redhat.com>
-Date: Thu, 4 Feb 2021 15:00:20 +0100
-Subject: [PATCH] nptl: Remove private futex optimization [BZ #27304]
-
-It is effectively used, unexcept for pthread_cond_destroy, where we do
-not want it; see bug 27304.  The internal locks do not support a
-process-shared mode.
-
-This fixes commit dc6cfdc934db9997c33728082d63552b9eee4563 ("nptl:
-Move pthread_cond_destroy implementation into libc").
-
-Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>
-
-Upstream-Status: Backport [https://sourceware.org/bugzilla/show_bug.cgi?id=27304]
-Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
----
- sysdeps/nptl/lowlevellock-futex.h | 14 +-------------
- 1 file changed, 1 insertion(+), 13 deletions(-)
-
-diff --git a/sysdeps/nptl/lowlevellock-futex.h b/sysdeps/nptl/lowlevellock-futex.h
-index ecb729da6b..ca96397a4a 100644
---- a/sysdeps/nptl/lowlevellock-futex.h
-+++ b/sysdeps/nptl/lowlevellock-futex.h
-@@ -50,20 +50,8 @@
- #define LLL_SHARED	FUTEX_PRIVATE_FLAG
- 
- #ifndef __ASSEMBLER__
--
--# if IS_IN (libc) || IS_IN (rtld)
--/* In libc.so or ld.so all futexes are private.  */
--#  define __lll_private_flag(fl, private)			\
--  ({								\
--    /* Prevent warnings in callers of this macro.  */		\
--    int __lll_private_flag_priv __attribute__ ((unused));	\
--    __lll_private_flag_priv = (private);			\
--    ((fl) | FUTEX_PRIVATE_FLAG);				\
--  })
--# else
--#  define __lll_private_flag(fl, private) \
-+# define __lll_private_flag(fl, private) \
-   (((fl) | FUTEX_PRIVATE_FLAG) ^ (private))
--# endif
- 
- # define lll_futex_syscall(nargs, futexp, op, ...)                      \
-   ({                                                                    \
--- 
-2.27.0
-
diff --git a/meta/recipes-core/glibc/glibc/0031-x86-Require-full-ISA-support-for-x86-64-level-marker.patch b/meta/recipes-core/glibc/glibc/0031-x86-Require-full-ISA-support-for-x86-64-level-marker.patch
deleted file mode 100644
index 3cb60b2e55..0000000000
--- a/meta/recipes-core/glibc/glibc/0031-x86-Require-full-ISA-support-for-x86-64-level-marker.patch
+++ /dev/null
@@ -1,116 +0,0 @@
-From b1971f6f1331d738d1d6b376b4741668a7546125 Mon Sep 17 00:00:00 2001
-From: "H.J. Lu" <hjl.tools@gmail.com>
-Date: Tue, 2 Feb 2021 13:45:58 -0800
-Subject: [PATCH] x86: Require full ISA support for x86-64 level marker [BZ #27318]
-
-Since -march=sandybridge enables ISAs in x86-64 ISA level v3, the v3
-marker is set on libc.so.  We couldn't set the needed ISA marker to v2
-since this libc won't run on all v2 machines.  Technically, the v3 marker
-is correct.  But the resulting libc.so won't run on Sandy Brigde, which
-is a v2 machine, even when libc is compiled with -march=sandybridge:
-
-$ ./elf/ld.so ./libc.so
-./libc.so: (p) CPU ISA level is lower than required: needed: 7; got: 3
-
-Instead, we require full ISA support for x86-64 level marker and disable
-x86-64 level marker for -march=sandybridge which enables ISAs between v2
-and v3.
-
-Upstream-Status: Submitted [https://sourceware.org/pipermail/libc-alpha/2021-February/122297.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-
- sysdeps/x86/configure    |  7 ++++++-
- sysdeps/x86/configure.ac |  2 +-
- sysdeps/x86/isa-level.c  | 21 ++++++++++++++++++++-
- 3 files changed, 27 insertions(+), 3 deletions(-)
-
-diff --git a/sysdeps/x86/configure b/sysdeps/x86/configure
-index 5e32dc62b3..5b20646843 100644
---- a/sysdeps/x86/configure
-+++ b/sysdeps/x86/configure
-@@ -133,7 +133,12 @@ if { ac_try='${CC-cc} $CFLAGS $CPPFLAGS -nostartfiles -nostdlib -r -o conftest c
-   $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
-   test $ac_status = 0; }; }; then
-   count=`LC_ALL=C $READELF -n conftest | grep NT_GNU_PROPERTY_TYPE_0 | wc -l`
--  if test "$count" = 1; then
-+  if test "$count" = 1 && { ac_try='${CC-cc} $CFLAGS $CPPFLAGS -DINCLUDE_X86_ISA_LEVEL -S -o conftest.s $srcdir/sysdeps/x86/isa-level.c'
-+  { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_try\""; } >&5
-+  (eval $ac_try) 2>&5
-+  ac_status=$?
-+  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
-+  test $ac_status = 0; }; }; then
-     libc_cv_include_x86_isa_level=yes
-   fi
- fi
-diff --git a/sysdeps/x86/configure.ac b/sysdeps/x86/configure.ac
-index f94088f377..54ecd33d2c 100644
---- a/sysdeps/x86/configure.ac
-+++ b/sysdeps/x86/configure.ac
-@@ -100,7 +100,7 @@ EOF
- libc_cv_include_x86_isa_level=no
- if AC_TRY_COMMAND(${CC-cc} $CFLAGS $CPPFLAGS -nostartfiles -nostdlib -r -o conftest conftest1.S conftest2.S); then
-   count=`LC_ALL=C $READELF -n conftest | grep NT_GNU_PROPERTY_TYPE_0 | wc -l`
--  if test "$count" = 1; then
-+  if test "$count" = 1 && AC_TRY_COMMAND(${CC-cc} $CFLAGS $CPPFLAGS -DINCLUDE_X86_ISA_LEVEL -S -o conftest.s $srcdir/sysdeps/x86/isa-level.c); then
-     libc_cv_include_x86_isa_level=yes
-   fi
- fi
-diff --git a/sysdeps/x86/isa-level.c b/sysdeps/x86/isa-level.c
-index aaf524cb56..7f83449061 100644
---- a/sysdeps/x86/isa-level.c
-+++ b/sysdeps/x86/isa-level.c
-@@ -25,12 +25,17 @@
-    License along with the GNU C Library; if not, see
-    <https://www.gnu.org/licenses/>.  */
- 
--#include <elf.h>
-+#ifdef _LIBC
-+# include <elf.h>
-+#endif
- 
- /* ELF program property for x86 ISA level.  */
- #ifdef INCLUDE_X86_ISA_LEVEL
- # if defined __x86_64__ || defined __FXSR__ || !defined _SOFT_FLOAT \
-      || defined  __MMX__ || defined __SSE__ || defined __SSE2__
-+#  if !defined __SSE__ || !defined __SSE2__
-+#   error "Missing ISAs for x86-64 ISA level baseline"
-+#  endif
- #  define ISA_BASELINE	GNU_PROPERTY_X86_ISA_1_BASELINE
- # else
- #  define ISA_BASELINE	0
-@@ -40,6 +45,11 @@
-      || (defined __x86_64__ && defined __LAHF_SAHF__) \
-      || defined __POPCNT__ || defined __SSE3__ \
-      || defined __SSSE3__ || defined __SSE4_1__ || defined __SSE4_2__
-+#  if !defined __GCC_HAVE_SYNC_COMPARE_AND_SWAP_16 \
-+     || !defined __POPCNT__ || !defined __SSE3__ \
-+     || !defined __SSSE3__ || !defined __SSE4_1__ || !defined __SSE4_2__
-+#   error "Missing ISAs for x86-64 ISA level v2"
-+#  endif
- #  define ISA_V2	GNU_PROPERTY_X86_ISA_1_V2
- # else
- #  define ISA_V2	0
-@@ -48,6 +58,10 @@
- # if defined __AVX__ || defined __AVX2__ || defined __F16C__ \
-      || defined __FMA__ || defined __LZCNT__ || defined __MOVBE__ \
-      || defined __XSAVE__
-+# if !defined __AVX__ || !defined __AVX2__ || !defined __F16C__ \
-+     || !defined __FMA__ || !defined __LZCNT__
-+#   error "Missing ISAs for x86-64 ISA level v3"
-+#  endif
- #  define ISA_V3	GNU_PROPERTY_X86_ISA_1_V3
- # else
- #  define ISA_V3	0
-@@ -55,6 +69,11 @@
- 
- # if defined __AVX512F__ || defined __AVX512BW__ || defined __AVX512CD__ \
-      || defined __AVX512DQ__ || defined __AVX512VL__
-+#  if !defined __AVX512F__ || !defined __AVX512BW__ \
-+      || !defined __AVX512CD__ || !defined __AVX512DQ__ \
-+      || !defined __AVX512VL__
-+#   error "Missing ISAs for x86-64 ISA level v4"
-+#  endif
- #  define ISA_V4	GNU_PROPERTY_X86_ISA_1_V4
- # else
- #  define ISA_V4	0
diff --git a/meta/recipes-core/glibc/glibc/0032-string-Work-around-GCC-PR-98512-in-rawmemchr.patch b/meta/recipes-core/glibc/glibc/0032-string-Work-around-GCC-PR-98512-in-rawmemchr.patch
deleted file mode 100644
index e904b28a05..0000000000
--- a/meta/recipes-core/glibc/glibc/0032-string-Work-around-GCC-PR-98512-in-rawmemchr.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 044e603b698093cf48f6e6229e0b66acf05227e4 Mon Sep 17 00:00:00 2001
-From: Florian Weimer <fweimer@redhat.com>
-Date: Fri, 19 Feb 2021 13:29:00 +0100
-Subject: [PATCH] string: Work around GCC PR 98512 in rawmemchr
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=044e603b698093cf48f6e6229e0b66acf05227e4]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- string/rawmemchr.c | 26 +++++++++++++++-----------
- 1 file changed, 15 insertions(+), 11 deletions(-)
-
-diff --git a/string/rawmemchr.c b/string/rawmemchr.c
-index 59bbeeaa42..b8523118e5 100644
---- a/string/rawmemchr.c
-+++ b/string/rawmemchr.c
-@@ -22,24 +22,28 @@
- # define RAWMEMCHR __rawmemchr
- #endif
- 
--/* Find the first occurrence of C in S.  */
--void *
--RAWMEMCHR (const void *s, int c)
--{
--  DIAG_PUSH_NEEDS_COMMENT;
-+/* The pragmata should be nested inside RAWMEMCHR below, but that
-+   triggers GCC PR 98512.  */
-+DIAG_PUSH_NEEDS_COMMENT;
- #if __GNUC_PREREQ (7, 0)
--  /* GCC 8 warns about the size passed to memchr being larger than
--     PTRDIFF_MAX; the use of SIZE_MAX is deliberate here.  */
--  DIAG_IGNORE_NEEDS_COMMENT (8, "-Wstringop-overflow=");
-+/* GCC 8 warns about the size passed to memchr being larger than
-+   PTRDIFF_MAX; the use of SIZE_MAX is deliberate here.  */
-+DIAG_IGNORE_NEEDS_COMMENT (8, "-Wstringop-overflow=");
- #endif
- #if __GNUC_PREREQ (11, 0)
--  /* Likewise GCC 11, with a different warning option.  */
--  DIAG_IGNORE_NEEDS_COMMENT (11, "-Wstringop-overread");
-+/* Likewise GCC 11, with a different warning option.  */
-+DIAG_IGNORE_NEEDS_COMMENT (11, "-Wstringop-overread");
- #endif
-+
-+/* Find the first occurrence of C in S.  */
-+void *
-+RAWMEMCHR (const void *s, int c)
-+{
-   if (c != '\0')
-     return memchr (s, c, (size_t)-1);
--  DIAG_POP_NEEDS_COMMENT;
-   return (char *)s + strlen (s);
- }
- libc_hidden_def (__rawmemchr)
- weak_alias (__rawmemchr, rawmemchr)
-+
-+DIAG_POP_NEEDS_COMMENT;
--- 
-2.30.1
-
diff --git a/meta/recipes-core/glibc/glibc/0033-x86-Handle-_SC_LEVEL1_ICACHE_LINESIZE-BZ-27444.patch b/meta/recipes-core/glibc/glibc/0033-x86-Handle-_SC_LEVEL1_ICACHE_LINESIZE-BZ-27444.patch
deleted file mode 100644
index 3a004e227f..0000000000
--- a/meta/recipes-core/glibc/glibc/0033-x86-Handle-_SC_LEVEL1_ICACHE_LINESIZE-BZ-27444.patch
+++ /dev/null
@@ -1,185 +0,0 @@
-From 750b00a1ddae220403fd892a6fd4e0791ffd154a Mon Sep 17 00:00:00 2001
-From: "H.J. Lu" <hjl.tools@gmail.com>
-Date: Fri, 18 Sep 2020 07:55:14 -0700
-Subject: [PATCH] x86: Handle _SC_LEVEL1_ICACHE_LINESIZE [BZ #27444]
-
-    x86: Move x86 processor cache info to cpu_features
-
-missed _SC_LEVEL1_ICACHE_LINESIZE.
-
-1. Add level1_icache_linesize to struct cpu_features.
-2. Initialize level1_icache_linesize by calling handle_intel,
-handle_zhaoxin and handle_amd with _SC_LEVEL1_ICACHE_LINESIZE.
-3. Return level1_icache_linesize for _SC_LEVEL1_ICACHE_LINESIZE.
-
-Upstream-Status: Backport [https://sourceware.org/bugzilla/show_bug.cgi?id=27444]
-Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
----
- sysdeps/x86/Makefile                          |  8 +++
- sysdeps/x86/cacheinfo.c                       |  3 +
- sysdeps/x86/dl-cacheinfo.h                    |  6 ++
- sysdeps/x86/include/cpu-features.h            |  2 +
- .../x86/tst-sysconf-cache-linesize-static.c   |  1 +
- sysdeps/x86/tst-sysconf-cache-linesize.c      | 57 +++++++++++++++++++
- 6 files changed, 77 insertions(+)
- create mode 100644 sysdeps/x86/tst-sysconf-cache-linesize-static.c
- create mode 100644 sysdeps/x86/tst-sysconf-cache-linesize.c
-
-diff --git a/sysdeps/x86/Makefile b/sysdeps/x86/Makefile
-index dd82674342..d231263051 100644
---- a/sysdeps/x86/Makefile
-+++ b/sysdeps/x86/Makefile
-@@ -208,3 +208,11 @@ $(objpfx)check-cet.out: $(..)sysdeps/x86/check-cet.awk \
- generated += check-cet.out
- endif
- endif
-+
-+ifeq ($(subdir),posix)
-+tests += \
-+  tst-sysconf-cache-linesize \
-+  tst-sysconf-cache-linesize-static
-+tests-static += \
-+  tst-sysconf-cache-linesize-static
-+endif
-diff --git a/sysdeps/x86/cacheinfo.c b/sysdeps/x86/cacheinfo.c
-index 7b8df45e3b..5ea4723ca6 100644
---- a/sysdeps/x86/cacheinfo.c
-+++ b/sysdeps/x86/cacheinfo.c
-@@ -32,6 +32,9 @@ __cache_sysconf (int name)
-     case _SC_LEVEL1_ICACHE_SIZE:
-       return cpu_features->level1_icache_size;
- 
-+    case _SC_LEVEL1_ICACHE_LINESIZE:
-+      return cpu_features->level1_icache_linesize;
-+
-     case _SC_LEVEL1_DCACHE_SIZE:
-       return cpu_features->level1_dcache_size;
- 
-diff --git a/sysdeps/x86/dl-cacheinfo.h b/sysdeps/x86/dl-cacheinfo.h
-index a31fa0783a..7cd00b92f1 100644
---- a/sysdeps/x86/dl-cacheinfo.h
-+++ b/sysdeps/x86/dl-cacheinfo.h
-@@ -707,6 +707,7 @@ dl_init_cacheinfo (struct cpu_features *cpu_features)
-   long int core;
-   unsigned int threads = 0;
-   unsigned long int level1_icache_size = -1;
-+  unsigned long int level1_icache_linesize = -1;
-   unsigned long int level1_dcache_size = -1;
-   unsigned long int level1_dcache_assoc = -1;
-   unsigned long int level1_dcache_linesize = -1;
-@@ -726,6 +727,8 @@ dl_init_cacheinfo (struct cpu_features *cpu_features)
- 
-       level1_icache_size
- 	= handle_intel (_SC_LEVEL1_ICACHE_SIZE, cpu_features);
-+      level1_icache_linesize
-+	= handle_intel (_SC_LEVEL1_ICACHE_LINESIZE, cpu_features);
-       level1_dcache_size = data;
-       level1_dcache_assoc
- 	= handle_intel (_SC_LEVEL1_DCACHE_ASSOC, cpu_features);
-@@ -753,6 +756,7 @@ dl_init_cacheinfo (struct cpu_features *cpu_features)
-       shared = handle_zhaoxin (_SC_LEVEL3_CACHE_SIZE);
- 
-       level1_icache_size = handle_zhaoxin (_SC_LEVEL1_ICACHE_SIZE);
-+      level1_icache_linesize = handle_zhaoxin (_SC_LEVEL1_ICACHE_LINESIZE);
-       level1_dcache_size = data;
-       level1_dcache_assoc = handle_zhaoxin (_SC_LEVEL1_DCACHE_ASSOC);
-       level1_dcache_linesize = handle_zhaoxin (_SC_LEVEL1_DCACHE_LINESIZE);
-@@ -772,6 +776,7 @@ dl_init_cacheinfo (struct cpu_features *cpu_features)
-       shared = handle_amd (_SC_LEVEL3_CACHE_SIZE);
- 
-       level1_icache_size = handle_amd (_SC_LEVEL1_ICACHE_SIZE);
-+      level1_icache_linesize = handle_amd (_SC_LEVEL1_ICACHE_LINESIZE);
-       level1_dcache_size = data;
-       level1_dcache_assoc = handle_amd (_SC_LEVEL1_DCACHE_ASSOC);
-       level1_dcache_linesize = handle_amd (_SC_LEVEL1_DCACHE_LINESIZE);
-@@ -833,6 +838,7 @@ dl_init_cacheinfo (struct cpu_features *cpu_features)
-     }
- 
-   cpu_features->level1_icache_size = level1_icache_size;
-+  cpu_features->level1_icache_linesize = level1_icache_linesize;
-   cpu_features->level1_dcache_size = level1_dcache_size;
-   cpu_features->level1_dcache_assoc = level1_dcache_assoc;
-   cpu_features->level1_dcache_linesize = level1_dcache_linesize;
-diff --git a/sysdeps/x86/include/cpu-features.h b/sysdeps/x86/include/cpu-features.h
-index 624736b40e..39a3f4f311 100644
---- a/sysdeps/x86/include/cpu-features.h
-+++ b/sysdeps/x86/include/cpu-features.h
-@@ -874,6 +874,8 @@ struct cpu_features
-   unsigned long int rep_stosb_threshold;
-   /* _SC_LEVEL1_ICACHE_SIZE.  */
-   unsigned long int level1_icache_size;
-+  /* _SC_LEVEL1_ICACHE_LINESIZE.  */
-+  unsigned long int level1_icache_linesize;
-   /* _SC_LEVEL1_DCACHE_SIZE.  */
-   unsigned long int level1_dcache_size;
-   /* _SC_LEVEL1_DCACHE_ASSOC.  */
-diff --git a/sysdeps/x86/tst-sysconf-cache-linesize-static.c b/sysdeps/x86/tst-sysconf-cache-linesize-static.c
-new file mode 100644
-index 0000000000..152ae68821
---- /dev/null
-+++ b/sysdeps/x86/tst-sysconf-cache-linesize-static.c
-@@ -0,0 +1 @@
-+#include "tst-sysconf-cache-linesize.c"
-diff --git a/sysdeps/x86/tst-sysconf-cache-linesize.c b/sysdeps/x86/tst-sysconf-cache-linesize.c
-new file mode 100644
-index 0000000000..642dbde5d2
---- /dev/null
-+++ b/sysdeps/x86/tst-sysconf-cache-linesize.c
-@@ -0,0 +1,57 @@
-+/* Test system cache line sizes.
-+   Copyright (C) 2021 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, see
-+   <https://www.gnu.org/licenses/>.  */
-+
-+#include <stdio.h>
-+#include <stdlib.h>
-+#include <unistd.h>
-+#include <array_length.h>
-+
-+static struct
-+{
-+  const char *name;
-+  int _SC_val;
-+} sc_options[] =
-+  {
-+#define N(name) { "_SC_"#name, _SC_##name }
-+    N (LEVEL1_ICACHE_LINESIZE),
-+    N (LEVEL1_DCACHE_LINESIZE),
-+    N (LEVEL2_CACHE_LINESIZE)
-+  };
-+
-+static int
-+do_test (void)
-+{
-+  int result = EXIT_SUCCESS;
-+
-+  for (int i = 0; i < array_length (sc_options); ++i)
-+    {
-+      long int scret = sysconf (sc_options[i]._SC_val);
-+      if (scret < 0)
-+	{
-+	  printf ("sysconf (%s) returned < 0 (%ld)\n",
-+		  sc_options[i].name, scret);
-+	  result = EXIT_FAILURE;
-+	}
-+      else
-+	printf ("sysconf (%s): %ld\n", sc_options[i].name, scret);
-+    }
-+
-+  return result;
-+}
-+
-+#include <support/test-driver.c>
diff --git a/meta/recipes-core/glibc/glibc/CVE-2021-27645.patch b/meta/recipes-core/glibc/glibc/CVE-2021-27645.patch
deleted file mode 100644
index 26c5c0d2a9..0000000000
--- a/meta/recipes-core/glibc/glibc/CVE-2021-27645.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From dca565886b5e8bd7966e15f0ca42ee5cff686673 Mon Sep 17 00:00:00 2001
-From: DJ Delorie <dj@redhat.com>
-Date: Thu, 25 Feb 2021 16:08:21 -0500
-Subject: [PATCH] nscd: Fix double free in netgroupcache [BZ #27462]
-
-In commit 745664bd798ec8fd50438605948eea594179fba1 a use-after-free
-was fixed, but this led to an occasional double-free.  This patch
-tracks the "live" allocation better.
-
-Tested manually by a third party.
-
-Related: RHBZ 1927877
-
-Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
-Reviewed-by: Carlos O'Donell <carlos@redhat.com>
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=dca565886b5e8bd7966e15f0ca42ee5cff686673]
-
-CVE: CVE-2021-27645
-
-Reviewed-by: Carlos O'Donell <carlos@redhat.com>
-Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
----
- nscd/netgroupcache.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/nscd/netgroupcache.c b/nscd/netgroupcache.c
-index dba6ceec1b..ad2daddafd 100644
---- a/nscd/netgroupcache.c
-+++ b/nscd/netgroupcache.c
-@@ -248,7 +248,7 @@ addgetnetgrentX (struct database_dyn *db, int fd, request_header *req,
- 					     : NULL);
- 				    ndomain = (ndomain ? newbuf + ndomaindiff
- 					       : NULL);
--				    buffer = newbuf;
-+				    *tofreep = buffer = newbuf;
- 				  }
- 
- 				nhost = memcpy (buffer + bufused,
-@@ -319,7 +319,7 @@ addgetnetgrentX (struct database_dyn *db, int fd, request_header *req,
- 		    else if (status == NSS_STATUS_TRYAGAIN && e == ERANGE)
- 		      {
- 			buflen *= 2;
--			buffer = xrealloc (buffer, buflen);
-+			*tofreep = buffer = xrealloc (buffer, buflen);
- 		      }
- 		    else if (status == NSS_STATUS_RETURN
- 			     || status == NSS_STATUS_NOTFOUND
--- 
-2.27.0
-
diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipes-core/glibc/glibc_2.33.bb
index 75a1f36d6b..6bdfdfcd4a 100644
--- a/meta/recipes-core/glibc/glibc_2.33.bb
+++ b/meta/recipes-core/glibc/glibc_2.33.bb
@@ -1,7 +1,7 @@
 require glibc.inc
 require glibc-version.inc
 
-CVE_CHECK_WHITELIST += "CVE-2020-10029"
+CVE_CHECK_WHITELIST += "CVE-2020-10029 CVE-2021-27645"
 
 # glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010022
 # glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010023
@@ -56,11 +56,6 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0028-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch \
            file://0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch \
            file://0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch \
-           file://0031-x86-Require-full-ISA-support-for-x86-64-level-marker.patch \
-           file://0032-string-Work-around-GCC-PR-98512-in-rawmemchr.patch \
-           file://0033-x86-Handle-_SC_LEVEL1_ICACHE_LINESIZE-BZ-27444.patch \
-           file://CVE-2021-27645.patch \
-           file://0001-nptl-Remove-private-futex-optimization-BZ-27304.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.31.1

