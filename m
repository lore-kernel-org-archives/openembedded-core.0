Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6E4947528A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 17:43:22 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id bi12-v6so1703245plb.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 10:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PMtfzny0YnjAj/qQPL/f2JU+vU8LxiJ2j2kk+nk2gfU=;
	b=O5Fr4M0uWjwoMH3FFz3ow+6wVUPQZqiYCxMo5SWYnBLzh1urqnnBnxXkkjOQj5o89B
	cAa45bUupiUnIRFqO5tErW150hr0kDpbc3057xnTSNv7drsfMo0HH5UMLbfijJHDEvnK
	ujw1rG2q/lUcsvAglCF3sb5rFJGY/F8/wufLrkHM71gZ0pXKH4uTohI+3xySUSxa9XFy
	ijtPiMovH0MeEr3AjAWcKOl6T9/ErcX6eJEszFELmHq39u5MBDdxk55EDCvmlVTASxcH
	VL5ebOdHh/3vrox6yWEmQgZIxoYBxvjpS8kAb4xo9bUmzZVh9APoFyEnQKJ/bfvlSPOF
	Cu8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PMtfzny0YnjAj/qQPL/f2JU+vU8LxiJ2j2kk+nk2gfU=;
	b=hppReZUPqE/D0saBCRzNan3baPmJ3Ms0FPgs0V0dngtve8YB7xuLmnpZ6nVbUmZFoP
	In0e3uxEifxnzs8GqkTJb82uZJyHmCgIuG+uR3XYzQch1QLhpZT2nAxpnEi4yjhOgT5f
	bOp0GtpzxM1k19rJuqlvUzPW8X6mH620INQEWK5kK14s/w0f9HC8elJkuwggAIx4BVpI
	stBM5miuHCV367Byp8K6Ln7t5guGIWdkQf0yRUjjNHxWIJNJ89Lth4jHkTubb9owMYk4
	iO5kHRJ2riiphFP54ZTUiNprM+X09OznKgud7QI7WpfbcN+uDkZ6CbT8kOwyBfZTCIpM
	d4xg==
X-Gm-Message-State: ALKqPweQ1AkQs2UHJwPeP5P5InXVFBSzaCXOtcLRnSD0oeyxgG8kAiJ8
	sscU45Jy3eyo8YulhCOO3LhVOw==
X-Google-Smtp-Source: AB8JxZoJBTtANqzor/w56xJplt1QfBH28klWEDdRFXLpOsAq5eOuQAc9TCM4aO+7yhVnKjQRdrHiaw==
X-Received: by 2002:a17:902:4464:: with SMTP id
	k91-v6mr2170534pld.219.1525974202771; 
	Thu, 10 May 2018 10:43:22 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	v23-v6sm2814126pfe.166.2018.05.10.10.43.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 May 2018 10:43:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 May 2018 10:43:19 -0700
Message-Id: <20180510174319.42288-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Subject: [PATCH V2] gdb: Upgrade to 8.1 release
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
X-List-Received-Date: Thu, 10 May 2018 17:43:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

cache strerror so it does not try to use rpl_* versions

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes since V1:
- Fix build with musl

 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 .../gdb/{gdb-8.0.1.inc => gdb-8.1.inc}        |   5 +-
 ...ian_8.0.1.bb => gdb-cross-canadian_8.1.bb} |   0
 .../{gdb-cross_8.0.1.bb => gdb-cross_8.1.bb}  |   0
 .../0001-include-sys-types.h-for-mode_t.patch |  12 +-
 ...port-for-Renesas-SH-sh4-architecture.patch | 153 ++++++++----------
 ...0012-Unbreak-GDBserver-build-for-x32.patch | 101 ------------
 .../gdb/{gdb_8.0.1.bb => gdb_8.1.bb}          |   2 +
 8 files changed, 82 insertions(+), 193 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-8.0.1.inc => gdb-8.1.inc} (85%)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_8.0.1.bb => gdb-cross-canadian_8.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_8.0.1.bb => gdb-cross_8.1.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0012-Unbreak-GDBserver-build-for-x32.patch
 rename meta/recipes-devtools/gdb/{gdb_8.0.1.bb => gdb_8.1.bb} (86%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 6dd0224812..5271b41860 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -25,7 +25,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 GCCVERSION ?= "8.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.30%"
-GDBVERSION ?= "8.0%"
+GDBVERSION ?= "8.1%"
 GLIBCVERSION ?= "2.27%"
 LINUXLIBCVERSION ?= "4.15%"
 QEMUVERSION ?= "2.12%"
diff --git a/meta/recipes-devtools/gdb/gdb-8.0.1.inc b/meta/recipes-devtools/gdb/gdb-8.1.inc
similarity index 85%
rename from meta/recipes-devtools/gdb/gdb-8.0.1.inc
rename to meta/recipes-devtools/gdb/gdb-8.1.inc
index 4a5299b73f..4d9faa2d4b 100644
--- a/meta/recipes-devtools/gdb/gdb-8.0.1.inc
+++ b/meta/recipes-devtools/gdb/gdb-8.1.inc
@@ -16,9 +16,8 @@ SRC_URI = "http://ftp.gnu.org/gnu/gdb/gdb-${PV}.tar.xz \
            file://0009-Change-order-of-CFLAGS.patch \
            file://0010-resolve-restrict-keyword-conflict.patch \
            file://package_devel_gdb_patches_120-sigprocmask-invalid-call.patch \
-           file://0012-Unbreak-GDBserver-build-for-x32.patch \
            file://gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.patch \
 "
-SRC_URI[md5sum] = "48cac527e6f3018b865ece021e9723ac"
-SRC_URI[sha256sum] = "3dbd5f93e36ba2815ad0efab030dcd0c7b211d7b353a40a53f4c02d7d56295e3"
+SRC_URI[md5sum] = "f46487561f9a16916a8102316f7fd105"
+SRC_URI[sha256sum] = "af61a0263858e69c5dce51eab26662ff3d2ad9aa68da9583e8143b5426be4b34"
 
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_8.0.1.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_8.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_8.0.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_8.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross_8.0.1.bb b/meta/recipes-devtools/gdb/gdb-cross_8.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_8.0.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross_8.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb/0001-include-sys-types.h-for-mode_t.patch b/meta/recipes-devtools/gdb/gdb/0001-include-sys-types.h-for-mode_t.patch
index 4f06d46d70..5d19380e30 100644
--- a/meta/recipes-devtools/gdb/gdb/0001-include-sys-types.h-for-mode_t.patch
+++ b/meta/recipes-devtools/gdb/gdb/0001-include-sys-types.h-for-mode_t.patch
@@ -1,7 +1,7 @@
-From 91da0458b333249eb9c2f4c1f1e53fa4bc085cc9 Mon Sep 17 00:00:00 2001
+From ff37f9360ab6f841f28ced9f23f66542febcc0f6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 19 Jan 2016 18:18:52 -0800
-Subject: [PATCH 01/10] include sys/types.h for mode_t
+Subject: [PATCH 01/11] include sys/types.h for mode_t
 
 mode_t is used in target.h, so we need to include sys/types.h to get the
 defintion
@@ -14,17 +14,17 @@ Upstream-Status: Pending
  1 file changed, 1 insertion(+)
 
 diff --git a/gdb/gdbserver/target.h b/gdb/gdbserver/target.h
-index 3cc2bc4bab..e6b19b06b9 100644
+index 25accd2207..7f6bca8aa4 100644
 --- a/gdb/gdbserver/target.h
 +++ b/gdb/gdbserver/target.h
-@@ -28,6 +28,7 @@
- #include "target/waitstatus.h"
+@@ -29,6 +29,7 @@
  #include "mem-break.h"
  #include "btrace-common.h"
+ #include <vector>
 +#include <sys/types.h>
  
  struct emit_ops;
  struct buffer;
 -- 
-2.13.1
+2.17.0
 
diff --git a/meta/recipes-devtools/gdb/gdb/0005-Add-support-for-Renesas-SH-sh4-architecture.patch b/meta/recipes-devtools/gdb/gdb/0005-Add-support-for-Renesas-SH-sh4-architecture.patch
index cb1b7abd07..f678598284 100644
--- a/meta/recipes-devtools/gdb/gdb/0005-Add-support-for-Renesas-SH-sh4-architecture.patch
+++ b/meta/recipes-devtools/gdb/gdb/0005-Add-support-for-Renesas-SH-sh4-architecture.patch
@@ -1,7 +1,7 @@
-From 60ac68f601885ea6480229a5c8a89a0257da376c Mon Sep 17 00:00:00 2001
+From 8757b36be6109f6d7ea0bd8dafbaed647e0d2192 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 02:31:12 +0000
-Subject: [PATCH 05/10] Add support for Renesas SH (sh4) architecture.
+Subject: [PATCH 05/11] Add support for Renesas SH (sh4) architecture.
 
 gdb (7.4-1~cvs20111117.2) experimental; urgency=low
  .
@@ -15,35 +15,35 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  gdb/Makefile.in                      |   2 +
  gdb/configure.host                   |   1 +
- gdb/sh-linux-tdep.c                  | 519 +++++++++++++++++++++++++++++++++++
- gdb/sh-tdep.c                        |  54 ++--
- gdb/sh-tdep.h                        |  49 ++++
+ gdb/sh-linux-tdep.c                  | 519 +++++++++++++++++++++++++++
+ gdb/sh-tdep.c                        |  53 ++-
+ gdb/sh-tdep.h                        |  49 +++
  gdb/testsuite/gdb.asm/asm-source.exp |   5 +
  gdb/testsuite/gdb.asm/sh.inc         |   3 +-
  gdb/testsuite/gdb.base/annota1.c     |   3 +
  gdb/testsuite/gdb.base/annota3.c     |   4 +
  gdb/testsuite/gdb.base/sigall.c      |   3 +
  gdb/testsuite/gdb.base/signals.c     |   4 +
- 11 files changed, 618 insertions(+), 29 deletions(-)
+ 11 files changed, 617 insertions(+), 29 deletions(-)
 
-diff --git a/gdb/Makefile.in b/gdb/Makefile.in
-index 8be73ba423..e287ff6a2e 100644
---- a/gdb/Makefile.in
-+++ b/gdb/Makefile.in
-@@ -2638,6 +2638,8 @@ ALLDEPFILES = \
- 	sh-nbsd-tdep.c \
- 	sh-tdep.c \
- 	sh64-tdep.c \
-+	sh-linux-tdep.c \
-+	sh-linux-nat.c \
- 	sol2-tdep.c \
- 	solib-aix.c \
- 	solib-spu.c \
-diff --git a/gdb/configure.host b/gdb/configure.host
-index d74fd04934..be12de1446 100644
---- a/gdb/configure.host
-+++ b/gdb/configure.host
-@@ -150,6 +150,7 @@ powerpc*-*-linux*)	gdb_host=linux ;;
+Index: gdb-8.1/gdb/Makefile.in
+===================================================================
+--- gdb-8.1.orig/gdb/Makefile.in
++++ gdb-8.1/gdb/Makefile.in
+@@ -758,6 +758,8 @@ ALL_TARGET_OBS = \
+ 	sh-linux-tdep.o \
+ 	sh-nbsd-tdep.o \
+ 	sh-tdep.o \
++	sh-linux-tdep.o \
++	sh-linux-nat.o \
+ 	sh64-tdep.o \
+ 	sol2-tdep.o \
+ 	solib-aix.o \
+Index: gdb-8.1/gdb/configure.host
+===================================================================
+--- gdb-8.1.orig/gdb/configure.host
++++ gdb-8.1/gdb/configure.host
+@@ -152,6 +152,7 @@ powerpc*-*-linux*)	gdb_host=linux ;;
  
  s390*-*-linux*)		gdb_host=linux ;;
  
@@ -51,10 +51,10 @@ index d74fd04934..be12de1446 100644
  sh*-*-netbsdelf* | sh*-*-knetbsd*-gnu)
  			gdb_host=nbsd ;;
  sh*-*-openbsd*)		gdb_host=nbsd ;;
-diff --git a/gdb/sh-linux-tdep.c b/gdb/sh-linux-tdep.c
-index c5c745d218..84e539aad3 100644
---- a/gdb/sh-linux-tdep.c
-+++ b/gdb/sh-linux-tdep.c
+Index: gdb-8.1/gdb/sh-linux-tdep.c
+===================================================================
+--- gdb-8.1.orig/gdb/sh-linux-tdep.c
++++ gdb-8.1/gdb/sh-linux-tdep.c
 @@ -18,14 +18,37 @@
     along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
  
@@ -93,7 +93,7 @@ index c5c745d218..84e539aad3 100644
  #include "glibc-tdep.h"
  #include "sh-tdep.h"
  #include "linux-tdep.h"
-@@ -180,9 +203,505 @@ static struct tramp_frame sh_linux_rt_sigreturn_tramp_frame = {
+@@ -180,9 +203,505 @@ static struct tramp_frame sh_linux_rt_si
    sh_linux_rt_sigreturn_init
  };
  
@@ -599,10 +599,10 @@ index c5c745d218..84e539aad3 100644
    linux_init_abi (info, gdbarch);
  
    /* GNU/Linux uses SVR4-style shared libraries.  */
-diff --git a/gdb/sh-tdep.c b/gdb/sh-tdep.c
-index 2c2b26847d..14f5281ed4 100644
---- a/gdb/sh-tdep.c
-+++ b/gdb/sh-tdep.c
+Index: gdb-8.1/gdb/sh-tdep.c
+===================================================================
+--- gdb-8.1.orig/gdb/sh-tdep.c
++++ gdb-8.1/gdb/sh-tdep.c
 @@ -21,6 +21,9 @@
     sac@cygnus.com.  */
  
@@ -613,15 +613,7 @@ index 2c2b26847d..14f5281ed4 100644
  #include "frame.h"
  #include "frame-base.h"
  #include "frame-unwind.h"
-@@ -35,6 +38,7 @@
- #include "arch-utils.h"
- #include "floatformat.h"
- #include "regcache.h"
-+#include "regset.h"
- #include "doublest.h"
- #include "osabi.h"
- #include "reggroups.h"
-@@ -68,23 +72,6 @@ static const char *const sh_cc_enum[] = {
+@@ -67,23 +70,6 @@ static const char *const sh_cc_enum[] =
  
  static const char *sh_active_calling_convention = sh_cc_gcc;
  
@@ -645,7 +637,7 @@ index 2c2b26847d..14f5281ed4 100644
  static int
  sh_is_renesas_calling_convention (struct type *func_type)
  {
-@@ -1052,7 +1039,7 @@ sh_treat_as_flt_p (struct type *type)
+@@ -1051,7 +1037,7 @@ sh_treat_as_flt_p (struct type *type)
      return 0;
    /* Otherwise if the type of that member is float, the whole type is
       treated as float.  */
@@ -654,7 +646,7 @@ index 2c2b26847d..14f5281ed4 100644
      return 1;
    /* Otherwise it's not treated as float.  */
    return 0;
-@@ -1102,7 +1089,7 @@ sh_push_dummy_call_fpu (struct gdbarch *gdbarch,
+@@ -1101,7 +1087,7 @@ sh_push_dummy_call_fpu (struct gdbarch *
       in four registers available.  Loop thru args from first to last.  */
    for (argnum = 0; argnum < nargs; argnum++)
      {
@@ -663,7 +655,7 @@ index 2c2b26847d..14f5281ed4 100644
        len = TYPE_LENGTH (type);
        val = sh_justify_value_in_reg (gdbarch, args[argnum], len);
  
-@@ -1828,7 +1815,7 @@ sh_dwarf2_frame_init_reg (struct gdbarch *gdbarch, int regnum,
+@@ -1835,7 +1821,7 @@ sh_dwarf2_frame_init_reg (struct gdbarch
      reg->how = DWARF2_FRAME_REG_UNDEFINED;
  }
  
@@ -672,7 +664,7 @@ index 2c2b26847d..14f5281ed4 100644
  sh_alloc_frame_cache (void)
  {
    struct sh_frame_cache *cache;
-@@ -1855,7 +1842,7 @@ sh_alloc_frame_cache (void)
+@@ -1862,7 +1848,7 @@ sh_alloc_frame_cache (void)
    return cache;
  }
  
@@ -681,7 +673,7 @@ index 2c2b26847d..14f5281ed4 100644
  sh_frame_cache (struct frame_info *this_frame, void **this_cache)
  {
    struct gdbarch *gdbarch = get_frame_arch (this_frame);
-@@ -1922,9 +1909,9 @@ sh_frame_cache (struct frame_info *this_frame, void **this_cache)
+@@ -1929,9 +1915,9 @@ sh_frame_cache (struct frame_info *this_
    return cache;
  }
  
@@ -694,7 +686,7 @@ index 2c2b26847d..14f5281ed4 100644
  {
    struct gdbarch *gdbarch = get_frame_arch (this_frame);
    struct sh_frame_cache *cache = sh_frame_cache (this_frame, this_cache);
-@@ -1938,7 +1925,7 @@ sh_frame_prev_register (struct frame_info *this_frame,
+@@ -1945,7 +1931,7 @@ sh_frame_prev_register (struct frame_inf
       the current frame.  Frob regnum so that we pull the value from
       the correct place.  */
    if (regnum == gdbarch_pc_regnum (gdbarch))
@@ -703,7 +695,7 @@ index 2c2b26847d..14f5281ed4 100644
  
    if (regnum < SH_NUM_REGS && cache->saved_regs[regnum] != -1)
      return frame_unwind_got_memory (this_frame, regnum,
-@@ -2247,8 +2234,8 @@ sh_return_in_first_hidden_param_p (struct gdbarch *gdbarch,
+@@ -2254,8 +2240,8 @@ sh_return_in_first_hidden_param_p (struc
  static struct gdbarch *
  sh_gdbarch_init (struct gdbarch_info info, struct gdbarch_list *arches)
  {
@@ -713,7 +705,7 @@ index 2c2b26847d..14f5281ed4 100644
  
    /* SH5 is handled entirely in sh64-tdep.c.  */
    if (info.bfd_arch_info->mach == bfd_mach_sh5)
-@@ -2264,6 +2251,18 @@ sh_gdbarch_init (struct gdbarch_info info, struct gdbarch_list *arches)
+@@ -2271,6 +2257,18 @@ sh_gdbarch_init (struct gdbarch_info inf
    tdep = XCNEW (struct gdbarch_tdep);
    gdbarch = gdbarch_alloc (&info, tdep);
  
@@ -732,7 +724,7 @@ index 2c2b26847d..14f5281ed4 100644
    set_gdbarch_short_bit (gdbarch, 2 * TARGET_CHAR_BIT);
    set_gdbarch_int_bit (gdbarch, 4 * TARGET_CHAR_BIT);
    set_gdbarch_long_bit (gdbarch, 4 * TARGET_CHAR_BIT);
-@@ -2418,10 +2417,11 @@ sh_gdbarch_init (struct gdbarch_info info, struct gdbarch_list *arches)
+@@ -2425,10 +2423,11 @@ sh_gdbarch_init (struct gdbarch_info inf
        break;
      }
  
@@ -745,10 +737,10 @@ index 2c2b26847d..14f5281ed4 100644
    frame_unwind_append_unwinder (gdbarch, &sh_stub_unwind);
    frame_unwind_append_unwinder (gdbarch, &sh_frame_unwind);
  
-diff --git a/gdb/sh-tdep.h b/gdb/sh-tdep.h
-index d15ef050e0..c4642cefa4 100644
---- a/gdb/sh-tdep.h
-+++ b/gdb/sh-tdep.h
+Index: gdb-8.1/gdb/sh-tdep.h
+===================================================================
+--- gdb-8.1.orig/gdb/sh-tdep.h
++++ gdb-8.1/gdb/sh-tdep.h
 @@ -21,6 +21,12 @@
  
  /* Contributed by Steve Chamberlain sac@cygnus.com.  */
@@ -828,10 +820,10 @@ index d15ef050e0..c4642cefa4 100644
    /* Non-NULL when debugging from a core file.  Provides the offset
       where each general-purpose register is stored inside the associated
       core file section.  */
-diff --git a/gdb/testsuite/gdb.asm/asm-source.exp b/gdb/testsuite/gdb.asm/asm-source.exp
-index e07e5543f2..f5e60e1002 100644
---- a/gdb/testsuite/gdb.asm/asm-source.exp
-+++ b/gdb/testsuite/gdb.asm/asm-source.exp
+Index: gdb-8.1/gdb/testsuite/gdb.asm/asm-source.exp
+===================================================================
+--- gdb-8.1.orig/gdb/testsuite/gdb.asm/asm-source.exp
++++ gdb-8.1/gdb/testsuite/gdb.asm/asm-source.exp
 @@ -116,6 +116,11 @@ switch -glob -- [istarget] {
              append link-flags " -m elf32ppc"
          }
@@ -844,10 +836,10 @@ index e07e5543f2..f5e60e1002 100644
      "sh*-*-*" {
          set asm-arch sh
  	set debug-flags "-gdwarf-2"
-diff --git a/gdb/testsuite/gdb.asm/sh.inc b/gdb/testsuite/gdb.asm/sh.inc
-index a4a5fc545e..89efed7795 100644
---- a/gdb/testsuite/gdb.asm/sh.inc
-+++ b/gdb/testsuite/gdb.asm/sh.inc
+Index: gdb-8.1/gdb/testsuite/gdb.asm/sh.inc
+===================================================================
+--- gdb-8.1.orig/gdb/testsuite/gdb.asm/sh.inc
++++ gdb-8.1/gdb/testsuite/gdb.asm/sh.inc
 @@ -40,9 +40,8 @@
  	mov.l   .Lconst\@,r1
  	bra	.Lafterconst\@
@@ -859,10 +851,10 @@ index a4a5fc545e..89efed7795 100644
  	.long	\subr
  	.align	1
  .Lafterconst\@:
-diff --git a/gdb/testsuite/gdb.base/annota1.c b/gdb/testsuite/gdb.base/annota1.c
-index 424e1b8327..0de2e7b633 100644
---- a/gdb/testsuite/gdb.base/annota1.c
-+++ b/gdb/testsuite/gdb.base/annota1.c
+Index: gdb-8.1/gdb/testsuite/gdb.base/annota1.c
+===================================================================
+--- gdb-8.1.orig/gdb/testsuite/gdb.base/annota1.c
++++ gdb-8.1/gdb/testsuite/gdb.base/annota1.c
 @@ -1,6 +1,9 @@
  #include <stdio.h>
  #include <signal.h>
@@ -873,10 +865,10 @@ index 424e1b8327..0de2e7b633 100644
  
  void
  handle_USR1 (int sig)
-diff --git a/gdb/testsuite/gdb.base/annota3.c b/gdb/testsuite/gdb.base/annota3.c
-index 424e1b8327..952aaf218a 100644
---- a/gdb/testsuite/gdb.base/annota3.c
-+++ b/gdb/testsuite/gdb.base/annota3.c
+Index: gdb-8.1/gdb/testsuite/gdb.base/annota3.c
+===================================================================
+--- gdb-8.1.orig/gdb/testsuite/gdb.base/annota3.c
++++ gdb-8.1/gdb/testsuite/gdb.base/annota3.c
 @@ -1,6 +1,10 @@
  #include <stdio.h>
  #include <signal.h>
@@ -888,10 +880,10 @@ index 424e1b8327..952aaf218a 100644
  
  void
  handle_USR1 (int sig)
-diff --git a/gdb/testsuite/gdb.base/sigall.c b/gdb/testsuite/gdb.base/sigall.c
-index 81f3b08d6b..1574b2d6cb 100644
---- a/gdb/testsuite/gdb.base/sigall.c
-+++ b/gdb/testsuite/gdb.base/sigall.c
+Index: gdb-8.1/gdb/testsuite/gdb.base/sigall.c
+===================================================================
+--- gdb-8.1.orig/gdb/testsuite/gdb.base/sigall.c
++++ gdb-8.1/gdb/testsuite/gdb.base/sigall.c
 @@ -1,6 +1,9 @@
  #include <signal.h>
  #include <unistd.h>
@@ -902,10 +894,10 @@ index 81f3b08d6b..1574b2d6cb 100644
  
  /* Signal handlers, we set breakpoints in them to make sure that the
     signals really get delivered.  */
-diff --git a/gdb/testsuite/gdb.base/signals.c b/gdb/testsuite/gdb.base/signals.c
-index 756606880f..1205a9bc9c 100644
---- a/gdb/testsuite/gdb.base/signals.c
-+++ b/gdb/testsuite/gdb.base/signals.c
+Index: gdb-8.1/gdb/testsuite/gdb.base/signals.c
+===================================================================
+--- gdb-8.1.orig/gdb/testsuite/gdb.base/signals.c
++++ gdb-8.1/gdb/testsuite/gdb.base/signals.c
 @@ -3,6 +3,10 @@
  #include <signal.h>
  #include <unistd.h>
@@ -917,6 +909,3 @@ index 756606880f..1205a9bc9c 100644
  
  static int count = 0;
  
--- 
-2.13.1
-
diff --git a/meta/recipes-devtools/gdb/gdb/0012-Unbreak-GDBserver-build-for-x32.patch b/meta/recipes-devtools/gdb/gdb/0012-Unbreak-GDBserver-build-for-x32.patch
deleted file mode 100644
index 18a3ce3d63..0000000000
--- a/meta/recipes-devtools/gdb/gdb/0012-Unbreak-GDBserver-build-for-x32.patch
+++ /dev/null
@@ -1,101 +0,0 @@
-From 3e1e401053ea5f02a9e9c65abddd31a03baa1bd1 Mon Sep 17 00:00:00 2001
-From: Yao Qi <yao.qi@linaro.org>
-Date: Fri, 29 Dec 2017 12:57:25 +0800
-Subject: [PATCH] Unbreak GDBserver build for x32
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-When I verify my target description changes, I build GDB and GDBserver for
-x32, but it failed.
-
-/../../binutils-gdb/gdb/gdbserver/linux-amd64-ipa.c
-../../../binutils-gdb/gdb/gdbserver/linux-amd64-ipa.c: In function ‘const target_desc* get_ipa_tdesc(int)’:
-../../../binutils-gdb/gdb/gdbserver/linux-amd64-ipa.c:184:10: error: ‘X86_TDESC_AVX512’ was not declared in this scope
-     case X86_TDESC_AVX512:
-          ^
-../../../binutils-gdb/gdb/gdbserver/linux-amd64-ipa.c:185:14: error: ‘tdesc_x32_avx512_linux’ was not declared in this scope
-       return tdesc_x32_avx512_linux;
-              ^
-../../../binutils-gdb/gdb/gdbserver/linux-amd64-ipa.c: In function ‘void initialize_low_tracepoint()’:
-../../../binutils-gdb/gdb/gdbserver/linux-amd64-ipa.c:282:36: error: ‘init_registers_x32_avx512_linux’ was not declared in this scope
-   init_registers_x32_avx512_linux ();
-                                    ^
-
-ipa_x32_linux_regobj use to be there, but removed by
-22049425ce40324139be82d9a6ec518c46b65815 by mistake.
-
-gdb/gdbserver:
-
-2017-08-04  Yao Qi  <yao.qi@linaro.org>
-
-        * configure.srv (ipa_x32_linux_regobj): New.
-        * linux-amd64-ipa.c (get_ipa_tdesc): Use X86_TDESC_AVX_AVX512
-        instead of X86_TDESC_AVX512.
-        (initialize_low_tracepoint): Call
-        init_registers_x32_avx_avx512_linux.
-
-Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=f02fd7745d003d65fd3b981618e07b874b721d79]
-
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- ChangeLog                       | 8 ++++++++
- gdb/gdbserver/configure.srv     | 1 +
- gdb/gdbserver/linux-amd64-ipa.c | 6 +++---
- 3 files changed, 12 insertions(+), 3 deletions(-)
-
-diff --git a/ChangeLog b/ChangeLog
-index 4ac2d63..b5b8228 100644
---- a/ChangeLog
-+++ b/ChangeLog
-@@ -1,3 +1,11 @@
-+ 2017-08-04  Yao Qi  <yao.qi@linaro.org>
-+
-+	* configure.srv (ipa_x32_linux_regobj): New.
-+	* linux-amd64-ipa.c (get_ipa_tdesc): Use X86_TDESC_AVX_AVX512
-+	instead of X86_TDESC_AVX512.
-+	(initialize_low_tracepoint): Call
-+	init_registers_x32_avx_avx512_linux.
-+
- 2017-04-13  Andrew Jenner  <andrew@codesourcery.com>
- 
- 	* config.sub: Sync with master version in config project.
-diff --git a/gdb/gdbserver/configure.srv b/gdb/gdbserver/configure.srv
-index d00d9e2..56951c8 100644
---- a/gdb/gdbserver/configure.srv
-+++ b/gdb/gdbserver/configure.srv
-@@ -31,6 +31,7 @@ srv_amd64_linux_regobj="amd64-linux.o amd64-avx-linux.o amd64-avx-avx512-linux.o
- 
- ipa_i386_linux_regobj="i386-linux-ipa.o i386-avx-linux-ipa.o  i386-avx-mpx-linux-ipa.o i386-avx-avx512-linux-ipa.o i386-avx-mpx-avx512-pku-linux-ipa.o i386-mpx-linux-ipa.o i386-mmx-linux-ipa.o"
- ipa_amd64_linux_regobj="amd64-linux-ipa.o amd64-avx-linux-ipa.o amd64-avx-mpx-linux-ipa.o amd64-avx-avx512-linux-ipa.o amd64-avx-mpx-avx512-pku-linux-ipa.o amd64-mpx-linux-ipa.o"
-+ipa_x32_linux_regobj="x32-linux-ipa.o x32-avx-linux-ipa.o x32-avx-avx512-linux-ipa.o"
- ipa_ppc_linux_regobj="powerpc-32l-ipa.o powerpc-altivec32l-ipa.o powerpc-cell32l-ipa.o powerpc-vsx32l-ipa.o powerpc-isa205-32l-ipa.o powerpc-isa205-altivec32l-ipa.o powerpc-isa205-vsx32l-ipa.o powerpc-e500l-ipa.o powerpc-64l-ipa.o powerpc-altivec64l-ipa.o powerpc-cell64l-ipa.o powerpc-vsx64l-ipa.o powerpc-isa205-64l-ipa.o powerpc-isa205-altivec64l-ipa.o powerpc-isa205-vsx64l-ipa.o"
- 
- srv_i386_32bit_xmlfiles="i386/32bit-core.xml i386/32bit-sse.xml i386/32bit-avx.xml i386/32bit-avx512.xml i386/32bit-mpx.xml i386/32bit-pkeys.xml"
-diff --git a/gdb/gdbserver/linux-amd64-ipa.c b/gdb/gdbserver/linux-amd64-ipa.c
-index 67f36c2..683339b 100644
---- a/gdb/gdbserver/linux-amd64-ipa.c
-+++ b/gdb/gdbserver/linux-amd64-ipa.c
-@@ -181,8 +181,8 @@ get_ipa_tdesc (int idx)
-       return tdesc_x32_linux;
-     case X86_TDESC_AVX:
-       return tdesc_x32_avx_linux;
--    case X86_TDESC_AVX512:
--      return tdesc_x32_avx512_linux;
-+    case X86_TDESC_AVX_AVX512:
-+      return tdesc_x32_avx_avx512_linux;
-     default:
-       break;
-     }
-@@ -279,7 +279,7 @@ initialize_low_tracepoint (void)
- #if defined __ILP32__
-   init_registers_x32_linux ();
-   init_registers_x32_avx_linux ();
--  init_registers_x32_avx512_linux ();
-+  init_registers_x32_avx_avx512_linux ();
- #else
-   init_registers_amd64_linux ();
-   init_registers_amd64_avx_linux ();
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/gdb/gdb_8.0.1.bb b/meta/recipes-devtools/gdb/gdb_8.1.bb
similarity index 86%
rename from meta/recipes-devtools/gdb/gdb_8.0.1.bb
rename to meta/recipes-devtools/gdb/gdb_8.1.bb
index ea8fef122c..84ab08ce93 100644
--- a/meta/recipes-devtools/gdb/gdb_8.0.1.bb
+++ b/meta/recipes-devtools/gdb/gdb_8.1.bb
@@ -6,6 +6,8 @@ inherit python3-dir
 EXTRA_OEMAKE_append_libc-musl = "\
                                  gt_cv_func_gnugettext1_libc=yes \
                                  gt_cv_func_gnugettext2_libc=yes \
+                                 gl_cv_func_working_strerror=yes \
+                                 gl_cv_func_strerror_0_works=yes \
                                  gl_cv_func_gettimeofday_clobber=no \
                                 "
 
-- 
2.17.0


