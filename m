Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6CE8070100
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 04:36:52 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id a70so315387pge.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Jun 2017 21:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=/eFVUvkTzH+UGXqXLtFxhCii1lxC0RTLKptwTIZQmDk=;
	b=nMCk/E01bb1U9zifdEkcF0RmXFmtTJImERTIFq46a8LlURmBFbOBcKkBIgdasx2vFq
	Xl/HjsK+EBwJ3yCHiBCd5ft5ewGrGOZFCaLXA71RoRDthpofDDmArjGognRu+aQFF4XR
	cNkjnIRMn03CibtWPjahFpnfX7HbulZ7nUYPUIvKc7X6aAu/QORmArKqidPTWeFFHq9z
	kcqNEUJeEuc7JRdcf/Y7obyzcNp2kxCOgUBiCVB8dZv5ids30sTWUD/SGAE3/MYGzrgB
	mZSunxe1huIllGlxhcdz+u7dgmkJ7cTMAypcGP9wsiDf5Nn/bjydP9vdh7ngQmBFHa3V
	YBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/eFVUvkTzH+UGXqXLtFxhCii1lxC0RTLKptwTIZQmDk=;
	b=SxMqny6xnGtZKlrCL3B8agNKlkyOYw9Dr4Xk7WHoX/OIwi4ZSF7KFz6qBOxqWXcA8i
	UHscis+4XUXdmQlQA8z1c4yC5x/pUMIHs1Tgrh0Dxtrs5UnNxalPiIEo6DcPdtZvtjo/
	xuD5Ydg4iqVhIk9QmHoeoTk2kESLtVgbDfETXbzZ7s074J0yAT32z78FAPU0l68LvDYH
	LL9Pg1GyTNn1hbhE8VDqDlcH60jeu7g61ejnSDkFJ6a5bYUadNBh5iF/WwR55+QbdIfE
	81SURgc88cT/Jmt40Kp9IrgTfTSERFn2oAaIiPjt4h90vQc65HhFI1n45zq47WqIGu+9
	wftQ==
X-Gm-Message-State: AODbwcB3osf/fAGMuHECYsDR5ZcQVWYZ6AxLRbf/CVHiaLAxhto5uMrS
	atby6ZN36wfCNvxC
X-Received: by 10.84.208.236 with SMTP id c41mr24586739plj.95.1496810213729;
	Tue, 06 Jun 2017 21:36:53 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::748])
	by smtp.gmail.com with ESMTPSA id u73sm742087pgb.24.2017.06.06.21.36.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Jun 2017 21:36:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Jun 2017 21:36:38 -0700
Message-Id: <20170607043638.5350-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
Subject: [PATCH] gdb: Upgrade to 8.0 release
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
X-List-Received-Date: Wed, 07 Jun 2017 04:36:53 -0000

For details on changes see
http://lists.gnu.org/archive/html/info-gnu/2017-06/msg00002.html

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gdb/{gdb-7.12.1.inc => gdb-8.0.inc}            |  4 +-
 ...anadian_7.12.1.bb => gdb-cross-canadian_8.0.bb} |  0
 .../gdb/{gdb-cross_7.12.1.bb => gdb-cross_8.0.bb}  |  0
 .../gdb/0001-include-sys-types.h-for-mode_t.patch  |  6 +--
 ...0002-make-man-install-relative-to-DESTDIR.patch |  6 +--
 ...s-linux-nat-Define-_ABIO32-if-not-defined.patch |  8 +--
 ...Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch | 10 ++--
 ...d-support-for-Renesas-SH-sh4-architecture.patch | 57 +++++++++++-----------
 ...e-libreadline.a-when-using-disable-static.patch | 12 ++---
 .../gdb/gdb/0007-use-asm-sgidefs.h.patch           |  8 +--
 .../0008-Use-exorted-definitions-of-SIGRTMIN.patch | 14 +++---
 .../gdb/gdb/0009-Change-order-of-CFLAGS.patch      | 24 ++++-----
 .../0010-resolve-restrict-keyword-conflict.patch   |  8 +--
 .../gdb/{gdb_7.12.1.bb => gdb_8.0.bb}              |  0
 14 files changed, 77 insertions(+), 80 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-7.12.1.inc => gdb-8.0.inc} (88%)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.12.1.bb => gdb-cross-canadian_8.0.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_7.12.1.bb => gdb-cross_8.0.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb_7.12.1.bb => gdb_8.0.bb} (100%)

diff --git a/meta/recipes-devtools/gdb/gdb-7.12.1.inc b/meta/recipes-devtools/gdb/gdb-8.0.inc
similarity index 88%
rename from meta/recipes-devtools/gdb/gdb-7.12.1.inc
rename to meta/recipes-devtools/gdb/gdb-8.0.inc
index b15a2b5832..91f2ebfa4b 100644
--- a/meta/recipes-devtools/gdb/gdb-7.12.1.inc
+++ b/meta/recipes-devtools/gdb/gdb-8.0.inc
@@ -16,6 +16,6 @@ SRC_URI = "http://ftp.gnu.org/gnu/gdb/gdb-${PV}.tar.xz \
            file://0009-Change-order-of-CFLAGS.patch \
            file://0010-resolve-restrict-keyword-conflict.patch \
 "
-SRC_URI[md5sum] = "193453347ddced7acb6b1cd2ee8f2e4b"
-SRC_URI[sha256sum] = "4607680b973d3ec92c30ad029f1b7dbde3876869e6b3a117d8a7e90081113186"
+SRC_URI[md5sum] = "c3d35cd949084be53b92cc1e03485f88"
+SRC_URI[sha256sum] = "f6a24ffe4917e67014ef9273eb8b547cb96a13e5ca74895b06d683b391f3f4ee"
 
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.12.1.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_8.0.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_7.12.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_8.0.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross_7.12.1.bb b/meta/recipes-devtools/gdb/gdb-cross_8.0.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_7.12.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross_8.0.bb
diff --git a/meta/recipes-devtools/gdb/gdb/0001-include-sys-types.h-for-mode_t.patch b/meta/recipes-devtools/gdb/gdb/0001-include-sys-types.h-for-mode_t.patch
index fc6c92f186..4f06d46d70 100644
--- a/meta/recipes-devtools/gdb/gdb/0001-include-sys-types.h-for-mode_t.patch
+++ b/meta/recipes-devtools/gdb/gdb/0001-include-sys-types.h-for-mode_t.patch
@@ -1,4 +1,4 @@
-From 2c81e17216b4e471a1ce0bddb50f374b0722a2ce Mon Sep 17 00:00:00 2001
+From 91da0458b333249eb9c2f4c1f1e53fa4bc085cc9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 19 Jan 2016 18:18:52 -0800
 Subject: [PATCH 01/10] include sys/types.h for mode_t
@@ -14,7 +14,7 @@ Upstream-Status: Pending
  1 file changed, 1 insertion(+)
 
 diff --git a/gdb/gdbserver/target.h b/gdb/gdbserver/target.h
-index 4c14c204bb..bdab18f7f7 100644
+index 3cc2bc4bab..e6b19b06b9 100644
 --- a/gdb/gdbserver/target.h
 +++ b/gdb/gdbserver/target.h
 @@ -28,6 +28,7 @@
@@ -26,5 +26,5 @@ index 4c14c204bb..bdab18f7f7 100644
  struct emit_ops;
  struct buffer;
 -- 
-2.11.0
+2.13.1
 
diff --git a/meta/recipes-devtools/gdb/gdb/0002-make-man-install-relative-to-DESTDIR.patch b/meta/recipes-devtools/gdb/gdb/0002-make-man-install-relative-to-DESTDIR.patch
index 9a9201b39c..83c4dded3b 100644
--- a/meta/recipes-devtools/gdb/gdb/0002-make-man-install-relative-to-DESTDIR.patch
+++ b/meta/recipes-devtools/gdb/gdb/0002-make-man-install-relative-to-DESTDIR.patch
@@ -1,4 +1,4 @@
-From f316d604b312bead78594f02e1355633eda9507b Mon Sep 17 00:00:00 2001
+From 9ce61f97b7758794f06894e934fbb256ff62163e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 02:27:55 +0000
 Subject: [PATCH 02/10] make man install relative to DESTDIR
@@ -11,7 +11,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/sim/common/Makefile.in b/sim/common/Makefile.in
-index a05f50767a..8d0fa64ea8 100644
+index 3944956b5d..aa355e8347 100644
 --- a/sim/common/Makefile.in
 +++ b/sim/common/Makefile.in
 @@ -35,7 +35,7 @@ tooldir = $(libdir)/$(target_alias)
@@ -24,5 +24,5 @@ index a05f50767a..8d0fa64ea8 100644
  includedir = @includedir@
  
 -- 
-2.11.0
+2.13.1
 
diff --git a/meta/recipes-devtools/gdb/gdb/0003-mips-linux-nat-Define-_ABIO32-if-not-defined.patch b/meta/recipes-devtools/gdb/gdb/0003-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
index 74c00063e4..6f7955be13 100644
--- a/meta/recipes-devtools/gdb/gdb/0003-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
+++ b/meta/recipes-devtools/gdb/gdb/0003-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
@@ -1,4 +1,4 @@
-From f2912b1d2e5c854a112176682903b696da33e003 Mon Sep 17 00:00:00 2001
+From ca0ef06b7320912df350e730e63f9bafdaa6ea70 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 23 Mar 2016 06:30:09 +0000
 Subject: [PATCH 03/10] mips-linux-nat: Define _ABIO32 if not defined
@@ -17,10 +17,10 @@ Upstream-Status: Pending
  1 file changed, 5 insertions(+)
 
 diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
-index 0f20f16814..722532bb6c 100644
+index 8041d84be7..f2df1b9907 100644
 --- a/gdb/mips-linux-nat.c
 +++ b/gdb/mips-linux-nat.c
-@@ -46,6 +46,11 @@
+@@ -47,6 +47,11 @@
  #define PTRACE_GET_THREAD_AREA 25
  #endif
  
@@ -33,5 +33,5 @@ index 0f20f16814..722532bb6c 100644
     we'll clear this and use PTRACE_PEEKUSER instead.  */
  static int have_ptrace_regsets = 1;
 -- 
-2.11.0
+2.13.1
 
diff --git a/meta/recipes-devtools/gdb/gdb/0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/meta/recipes-devtools/gdb/gdb/0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
index 847f24f7fe..357db25ec1 100644
--- a/meta/recipes-devtools/gdb/gdb/0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
+++ b/meta/recipes-devtools/gdb/gdb/0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
@@ -1,6 +1,6 @@
-From 7ef7b709885378279c424eab0510b93233400b24 Mon Sep 17 00:00:00 2001
+From 0f6d71118ca914002fcad78d2c8a518223d06bfb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 6 Aug 2016 17:32:50 -0700
+Date: Sat, 30 Apr 2016 18:32:14 -0700
 Subject: [PATCH 04/10] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLIBC
  systems
 
@@ -13,7 +13,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 12 insertions(+)
 
 diff --git a/gdb/gdbserver/linux-ppc-low.c b/gdb/gdbserver/linux-ppc-low.c
-index 1d013f185f..68098b3db9 100644
+index 33a9feb12c..1a9141faef 100644
 --- a/gdb/gdbserver/linux-ppc-low.c
 +++ b/gdb/gdbserver/linux-ppc-low.c
 @@ -21,7 +21,13 @@
@@ -31,7 +31,7 @@ index 1d013f185f..68098b3db9 100644
  #include "nat/ppc-linux.h"
  #include "linux-ppc-tdesc.h"
 diff --git a/gdb/nat/ppc-linux.h b/gdb/nat/ppc-linux.h
-index 85fbcd84bb..cbec9c53b2 100644
+index 5837ea1767..7233929192 100644
 --- a/gdb/nat/ppc-linux.h
 +++ b/gdb/nat/ppc-linux.h
 @@ -18,7 +18,13 @@
@@ -49,5 +49,5 @@ index 85fbcd84bb..cbec9c53b2 100644
  
  /* This sometimes isn't defined.  */
 -- 
-2.11.0
+2.13.1
 
diff --git a/meta/recipes-devtools/gdb/gdb/0005-Add-support-for-Renesas-SH-sh4-architecture.patch b/meta/recipes-devtools/gdb/gdb/0005-Add-support-for-Renesas-SH-sh4-architecture.patch
index d0c15f6289..cb1b7abd07 100644
--- a/meta/recipes-devtools/gdb/gdb/0005-Add-support-for-Renesas-SH-sh4-architecture.patch
+++ b/meta/recipes-devtools/gdb/gdb/0005-Add-support-for-Renesas-SH-sh4-architecture.patch
@@ -1,4 +1,4 @@
-From 6649e2cccfb11dec076abb02eae0afab95614829 Mon Sep 17 00:00:00 2001
+From 60ac68f601885ea6480229a5c8a89a0257da376c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 02:31:12 +0000
 Subject: [PATCH 05/10] Add support for Renesas SH (sh4) architecture.
@@ -13,7 +13,7 @@ Bug-Debian: http://bugs.debian.org/576242
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- gdb/Makefile.in                      |   1 +
+ gdb/Makefile.in                      |   2 +
  gdb/configure.host                   |   1 +
  gdb/sh-linux-tdep.c                  | 519 +++++++++++++++++++++++++++++++++++
  gdb/sh-tdep.c                        |  54 ++--
@@ -24,25 +24,26 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  gdb/testsuite/gdb.base/annota3.c     |   4 +
  gdb/testsuite/gdb.base/sigall.c      |   3 +
  gdb/testsuite/gdb.base/signals.c     |   4 +
- 11 files changed, 617 insertions(+), 29 deletions(-)
+ 11 files changed, 618 insertions(+), 29 deletions(-)
 
 diff --git a/gdb/Makefile.in b/gdb/Makefile.in
-index 7b2df86878..10f1266fe3 100644
+index 8be73ba423..e287ff6a2e 100644
 --- a/gdb/Makefile.in
 +++ b/gdb/Makefile.in
-@@ -1750,6 +1750,7 @@ ALLDEPFILES = \
- 	score-tdep.c \
- 	ser-go32.c ser-pipe.c ser-tcp.c ser-mingw.c \
- 	sh-tdep.c sh64-tdep.c shnbsd-tdep.c shnbsd-nat.c \
-+	sh-linux-tdep.c sh-linux-nat.c \
+@@ -2638,6 +2638,8 @@ ALLDEPFILES = \
+ 	sh-nbsd-tdep.c \
+ 	sh-tdep.c \
+ 	sh64-tdep.c \
++	sh-linux-tdep.c \
++	sh-linux-nat.c \
  	sol2-tdep.c \
- 	solib-svr4.c \
- 	sparc-linux-nat.c sparc-linux-tdep.c \
+ 	solib-aix.c \
+ 	solib-spu.c \
 diff --git a/gdb/configure.host b/gdb/configure.host
-index ef265ebe29..322a1e2c67 100644
+index d74fd04934..be12de1446 100644
 --- a/gdb/configure.host
 +++ b/gdb/configure.host
-@@ -149,6 +149,7 @@ powerpc*-*-linux*)	gdb_host=linux ;;
+@@ -150,6 +150,7 @@ powerpc*-*-linux*)	gdb_host=linux ;;
  
  s390*-*-linux*)		gdb_host=linux ;;
  
@@ -51,7 +52,7 @@ index ef265ebe29..322a1e2c67 100644
  			gdb_host=nbsd ;;
  sh*-*-openbsd*)		gdb_host=nbsd ;;
 diff --git a/gdb/sh-linux-tdep.c b/gdb/sh-linux-tdep.c
-index 2418d25010..ac8ea9e2a4 100644
+index c5c745d218..84e539aad3 100644
 --- a/gdb/sh-linux-tdep.c
 +++ b/gdb/sh-linux-tdep.c
 @@ -18,14 +18,37 @@
@@ -599,7 +600,7 @@ index 2418d25010..ac8ea9e2a4 100644
  
    /* GNU/Linux uses SVR4-style shared libraries.  */
 diff --git a/gdb/sh-tdep.c b/gdb/sh-tdep.c
-index 694f5f742d..8d54df7a1a 100644
+index 2c2b26847d..14f5281ed4 100644
 --- a/gdb/sh-tdep.c
 +++ b/gdb/sh-tdep.c
 @@ -21,6 +21,9 @@
@@ -620,7 +621,7 @@ index 694f5f742d..8d54df7a1a 100644
  #include "doublest.h"
  #include "osabi.h"
  #include "reggroups.h"
-@@ -67,23 +71,6 @@ static const char *const sh_cc_enum[] = {
+@@ -68,23 +72,6 @@ static const char *const sh_cc_enum[] = {
  
  static const char *sh_active_calling_convention = sh_cc_gcc;
  
@@ -644,7 +645,7 @@ index 694f5f742d..8d54df7a1a 100644
  static int
  sh_is_renesas_calling_convention (struct type *func_type)
  {
-@@ -1043,7 +1030,7 @@ sh_treat_as_flt_p (struct type *type)
+@@ -1052,7 +1039,7 @@ sh_treat_as_flt_p (struct type *type)
      return 0;
    /* Otherwise if the type of that member is float, the whole type is
       treated as float.  */
@@ -653,7 +654,7 @@ index 694f5f742d..8d54df7a1a 100644
      return 1;
    /* Otherwise it's not treated as float.  */
    return 0;
-@@ -1093,7 +1080,7 @@ sh_push_dummy_call_fpu (struct gdbarch *gdbarch,
+@@ -1102,7 +1089,7 @@ sh_push_dummy_call_fpu (struct gdbarch *gdbarch,
       in four registers available.  Loop thru args from first to last.  */
    for (argnum = 0; argnum < nargs; argnum++)
      {
@@ -662,7 +663,7 @@ index 694f5f742d..8d54df7a1a 100644
        len = TYPE_LENGTH (type);
        val = sh_justify_value_in_reg (gdbarch, args[argnum], len);
  
-@@ -1819,7 +1806,7 @@ sh_dwarf2_frame_init_reg (struct gdbarch *gdbarch, int regnum,
+@@ -1828,7 +1815,7 @@ sh_dwarf2_frame_init_reg (struct gdbarch *gdbarch, int regnum,
      reg->how = DWARF2_FRAME_REG_UNDEFINED;
  }
  
@@ -671,7 +672,7 @@ index 694f5f742d..8d54df7a1a 100644
  sh_alloc_frame_cache (void)
  {
    struct sh_frame_cache *cache;
-@@ -1846,7 +1833,7 @@ sh_alloc_frame_cache (void)
+@@ -1855,7 +1842,7 @@ sh_alloc_frame_cache (void)
    return cache;
  }
  
@@ -680,7 +681,7 @@ index 694f5f742d..8d54df7a1a 100644
  sh_frame_cache (struct frame_info *this_frame, void **this_cache)
  {
    struct gdbarch *gdbarch = get_frame_arch (this_frame);
-@@ -1913,9 +1900,9 @@ sh_frame_cache (struct frame_info *this_frame, void **this_cache)
+@@ -1922,9 +1909,9 @@ sh_frame_cache (struct frame_info *this_frame, void **this_cache)
    return cache;
  }
  
@@ -693,7 +694,7 @@ index 694f5f742d..8d54df7a1a 100644
  {
    struct gdbarch *gdbarch = get_frame_arch (this_frame);
    struct sh_frame_cache *cache = sh_frame_cache (this_frame, this_cache);
-@@ -1929,7 +1916,7 @@ sh_frame_prev_register (struct frame_info *this_frame,
+@@ -1938,7 +1925,7 @@ sh_frame_prev_register (struct frame_info *this_frame,
       the current frame.  Frob regnum so that we pull the value from
       the correct place.  */
    if (regnum == gdbarch_pc_regnum (gdbarch))
@@ -702,7 +703,7 @@ index 694f5f742d..8d54df7a1a 100644
  
    if (regnum < SH_NUM_REGS && cache->saved_regs[regnum] != -1)
      return frame_unwind_got_memory (this_frame, regnum,
-@@ -2238,8 +2225,8 @@ sh_return_in_first_hidden_param_p (struct gdbarch *gdbarch,
+@@ -2247,8 +2234,8 @@ sh_return_in_first_hidden_param_p (struct gdbarch *gdbarch,
  static struct gdbarch *
  sh_gdbarch_init (struct gdbarch_info info, struct gdbarch_list *arches)
  {
@@ -712,7 +713,7 @@ index 694f5f742d..8d54df7a1a 100644
  
    /* SH5 is handled entirely in sh64-tdep.c.  */
    if (info.bfd_arch_info->mach == bfd_mach_sh5)
-@@ -2255,6 +2242,18 @@ sh_gdbarch_init (struct gdbarch_info info, struct gdbarch_list *arches)
+@@ -2264,6 +2251,18 @@ sh_gdbarch_init (struct gdbarch_info info, struct gdbarch_list *arches)
    tdep = XCNEW (struct gdbarch_tdep);
    gdbarch = gdbarch_alloc (&info, tdep);
  
@@ -731,7 +732,7 @@ index 694f5f742d..8d54df7a1a 100644
    set_gdbarch_short_bit (gdbarch, 2 * TARGET_CHAR_BIT);
    set_gdbarch_int_bit (gdbarch, 4 * TARGET_CHAR_BIT);
    set_gdbarch_long_bit (gdbarch, 4 * TARGET_CHAR_BIT);
-@@ -2405,10 +2404,11 @@ sh_gdbarch_init (struct gdbarch_info info, struct gdbarch_list *arches)
+@@ -2418,10 +2417,11 @@ sh_gdbarch_init (struct gdbarch_info info, struct gdbarch_list *arches)
        break;
      }
  
@@ -745,7 +746,7 @@ index 694f5f742d..8d54df7a1a 100644
    frame_unwind_append_unwinder (gdbarch, &sh_frame_unwind);
  
 diff --git a/gdb/sh-tdep.h b/gdb/sh-tdep.h
-index 666968f787..62c65b55ea 100644
+index d15ef050e0..c4642cefa4 100644
 --- a/gdb/sh-tdep.h
 +++ b/gdb/sh-tdep.h
 @@ -21,6 +21,12 @@
@@ -828,7 +829,7 @@ index 666968f787..62c65b55ea 100644
       where each general-purpose register is stored inside the associated
       core file section.  */
 diff --git a/gdb/testsuite/gdb.asm/asm-source.exp b/gdb/testsuite/gdb.asm/asm-source.exp
-index 6d9aef81bb..5b66b429d1 100644
+index e07e5543f2..f5e60e1002 100644
 --- a/gdb/testsuite/gdb.asm/asm-source.exp
 +++ b/gdb/testsuite/gdb.asm/asm-source.exp
 @@ -116,6 +116,11 @@ switch -glob -- [istarget] {
@@ -917,5 +918,5 @@ index 756606880f..1205a9bc9c 100644
  static int count = 0;
  
 -- 
-2.11.0
+2.13.1
 
diff --git a/meta/recipes-devtools/gdb/gdb/0006-Dont-disable-libreadline.a-when-using-disable-static.patch b/meta/recipes-devtools/gdb/gdb/0006-Dont-disable-libreadline.a-when-using-disable-static.patch
index 5ed8e81e4a..8b13958101 100644
--- a/meta/recipes-devtools/gdb/gdb/0006-Dont-disable-libreadline.a-when-using-disable-static.patch
+++ b/meta/recipes-devtools/gdb/gdb/0006-Dont-disable-libreadline.a-when-using-disable-static.patch
@@ -1,4 +1,4 @@
-From 2a6e28ad5c0cad189a3697d96de031e4713052b8 Mon Sep 17 00:00:00 2001
+From 5c92ebd5e117e4cf118c984171e0703dfcfb8cd8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 15:25:03 -0700
 Subject: [PATCH 06/10] Dont disable libreadline.a when using --disable-static
@@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.def b/Makefile.def
-index ea8453e851..0fc66c694b 100644
+index 0d13f037d0..8bcd86e13f 100644
 --- a/Makefile.def
 +++ b/Makefile.def
-@@ -104,7 +104,8 @@ host_modules= { module= libiconv;
+@@ -105,7 +105,8 @@ host_modules= { module= libiconv;
  		missing= install-html;
  		missing= install-info; };
  host_modules= { module= m4; };
@@ -33,10 +33,10 @@ index ea8453e851..0fc66c694b 100644
  host_modules= { module= sim; };
  host_modules= { module= texinfo; no_install= true; };
 diff --git a/Makefile.in b/Makefile.in
-index cb0136e8f8..55f9085c16 100644
+index 3acb83b8de..e348907128 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -25385,7 +25385,7 @@ configure-readline:
+@@ -25470,7 +25470,7 @@ configure-readline:
  	  $$s/$$module_srcdir/configure \
  	  --srcdir=$${topdir}/$$module_srcdir \
  	  $(HOST_CONFIGARGS) --build=${build_alias} --host=${host_alias} \
@@ -46,5 +46,5 @@ index cb0136e8f8..55f9085c16 100644
  @endif readline
  
 -- 
-2.11.0
+2.13.1
 
diff --git a/meta/recipes-devtools/gdb/gdb/0007-use-asm-sgidefs.h.patch b/meta/recipes-devtools/gdb/gdb/0007-use-asm-sgidefs.h.patch
index a42c9fd2a7..33b4c30eef 100644
--- a/meta/recipes-devtools/gdb/gdb/0007-use-asm-sgidefs.h.patch
+++ b/meta/recipes-devtools/gdb/gdb/0007-use-asm-sgidefs.h.patch
@@ -1,4 +1,4 @@
-From d7543b44255da4ae71447d4e4d63e0b6aa4ed909 Mon Sep 17 00:00:00 2001
+From 12a0b8d81e1fda6ba98abdce8d6f09f9555ebcf5 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <amccurdy@gmail.com>
 Date: Sat, 30 Apr 2016 15:29:06 -0700
 Subject: [PATCH 07/10] use <asm/sgidefs.h>
@@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
-index 722532bb6c..51d8fc8f66 100644
+index f2df1b9907..d24664cb56 100644
 --- a/gdb/mips-linux-nat.c
 +++ b/gdb/mips-linux-nat.c
 @@ -31,7 +31,7 @@
@@ -30,7 +30,7 @@ index 722532bb6c..51d8fc8f66 100644
 +#include <asm/sgidefs.h>
  #include "nat/gdb_ptrace.h"
  #include <asm/ptrace.h>
- 
+ #include "inf-ptrace.h"
 -- 
-2.11.0
+2.13.1
 
diff --git a/meta/recipes-devtools/gdb/gdb/0008-Use-exorted-definitions-of-SIGRTMIN.patch b/meta/recipes-devtools/gdb/gdb/0008-Use-exorted-definitions-of-SIGRTMIN.patch
index ae9cb8c0e2..4f64dea254 100644
--- a/meta/recipes-devtools/gdb/gdb/0008-Use-exorted-definitions-of-SIGRTMIN.patch
+++ b/meta/recipes-devtools/gdb/gdb/0008-Use-exorted-definitions-of-SIGRTMIN.patch
@@ -1,4 +1,4 @@
-From aacd77184da1328908da41c9fdb55ad881fa0e99 Mon Sep 17 00:00:00 2001
+From d3f240b38eed7cd08f6c50ea896572f1327b437a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 15:31:40 -0700
 Subject: [PATCH 08/10] Use exorted definitions of SIGRTMIN
@@ -20,10 +20,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 6 insertions(+), 2 deletions(-)
 
 diff --git a/gdb/linux-nat.c b/gdb/linux-nat.c
-index 5d5efa0af4..e3420b49a0 100644
+index 8b29245c3d..f424ae9711 100644
 --- a/gdb/linux-nat.c
 +++ b/gdb/linux-nat.c
-@@ -5022,6 +5022,6 @@ lin_thread_get_thread_signals (sigset_t *set)
+@@ -5021,6 +5021,6 @@ lin_thread_get_thread_signals (sigset_t *set)
    /* NPTL reserves the first two RT signals, but does not provide any
       way for the debugger to query the signal numbers - fortunately
       they don't change.  */
@@ -33,12 +33,12 @@ index 5d5efa0af4..e3420b49a0 100644
 +  sigaddset (set, SIGRTMIN + 1);
  }
 diff --git a/gdb/nat/linux-nat.h b/gdb/nat/linux-nat.h
-index 2b485db141..d058afcde8 100644
+index 7dd18fefff..35137ab34f 100644
 --- a/gdb/nat/linux-nat.h
 +++ b/gdb/nat/linux-nat.h
-@@ -85,4 +85,8 @@ extern enum target_stop_reason lwp_stop_reason (struct lwp_info *lwp);
+@@ -90,4 +90,8 @@ extern void linux_stop_lwp (struct lwp_info *lwp);
  
- extern void linux_stop_lwp (struct lwp_info *lwp);
+ extern int lwp_is_stepping (struct lwp_info *lwp);
  
 +#ifndef W_STOPCODE
 +#define W_STOPCODE(sig) ((sig) << 8 | 0x7f)
@@ -46,5 +46,5 @@ index 2b485db141..d058afcde8 100644
 +
  #endif /* LINUX_NAT_H */
 -- 
-2.11.0
+2.13.1
 
diff --git a/meta/recipes-devtools/gdb/gdb/0009-Change-order-of-CFLAGS.patch b/meta/recipes-devtools/gdb/gdb/0009-Change-order-of-CFLAGS.patch
index ed6e0aeb7b..0c103ef3f6 100644
--- a/meta/recipes-devtools/gdb/gdb/0009-Change-order-of-CFLAGS.patch
+++ b/meta/recipes-devtools/gdb/gdb/0009-Change-order-of-CFLAGS.patch
@@ -1,4 +1,4 @@
-From 8c35d5d1825ed017cc58ea91011412e54c002eeb Mon Sep 17 00:00:00 2001
+From 3f54036b891054072b3e43ea8daaa57aa367b2e0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 15:35:39 -0700
 Subject: [PATCH 09/10] Change order of CFLAGS
@@ -9,26 +9,22 @@ Upstream-Status: Inappropriate
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- gdb/gdbserver/Makefile.in | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ gdb/gdbserver/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gdb/gdbserver/Makefile.in b/gdb/gdbserver/Makefile.in
-index f844ab8853..3f88db52e3 100644
+index 01dfdc0b89..f6aebef464 100644
 --- a/gdb/gdbserver/Makefile.in
 +++ b/gdb/gdbserver/Makefile.in
-@@ -138,10 +138,10 @@ CXXFLAGS = @CXXFLAGS@
- CPPFLAGS = @CPPFLAGS@
- 
- # INTERNAL_CFLAGS is the aggregate of all other *CFLAGS macros.
--INTERNAL_CFLAGS_BASE =  ${COMPILER_CFLAGS} ${GLOBAL_CFLAGS} \
-+INTERNAL_CFLAGS_BASE =  ${GLOBAL_CFLAGS} \
+@@ -140,7 +140,7 @@ CPPFLAGS = @CPPFLAGS@
+ INTERNAL_CFLAGS_BASE = ${CXXFLAGS} ${GLOBAL_CFLAGS} \
  	${PROFILE_CFLAGS} ${INCLUDE_CFLAGS} ${CPPFLAGS}
- INTERNAL_WARN_CFLAGS =  ${INTERNAL_CFLAGS_BASE} $(WARN_CFLAGS)
--INTERNAL_CFLAGS =  ${INTERNAL_WARN_CFLAGS} $(WERROR_CFLAGS) -DGDBSERVER
-+INTERNAL_CFLAGS =  ${INTERNAL_WARN_CFLAGS} $(WERROR_CFLAGS) ${COMPILER_CFLAGS} -DGDBSERVER
+ INTERNAL_WARN_CFLAGS = ${INTERNAL_CFLAGS_BASE} $(WARN_CFLAGS)
+-INTERNAL_CFLAGS = ${INTERNAL_WARN_CFLAGS} $(WERROR_CFLAGS) -DGDBSERVER
++INTERNAL_CFLAGS = ${INTERNAL_WARN_CFLAGS} $(WERROR_CFLAGS) ${COMPILER_CFLAGS} -DGDBSERVER
  
  # LDFLAGS is specifically reserved for setting from the command line
  # when running make.
 -- 
-2.11.0
+2.13.1
 
diff --git a/meta/recipes-devtools/gdb/gdb/0010-resolve-restrict-keyword-conflict.patch b/meta/recipes-devtools/gdb/gdb/0010-resolve-restrict-keyword-conflict.patch
index 1938beb561..c9507109b9 100644
--- a/meta/recipes-devtools/gdb/gdb/0010-resolve-restrict-keyword-conflict.patch
+++ b/meta/recipes-devtools/gdb/gdb/0010-resolve-restrict-keyword-conflict.patch
@@ -1,4 +1,4 @@
-From 7816d3497266e55c1c921d7cc1c8bf81c8ed0b4a Mon Sep 17 00:00:00 2001
+From 3ead0dd143521b0ba69c9e753bc4a236f9445ad9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 10 May 2016 08:47:05 -0700
 Subject: [PATCH 10/10] resolve restrict keyword conflict
@@ -15,7 +15,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/gdb/gnulib/import/sys_time.in.h b/gdb/gnulib/import/sys_time.in.h
-index c556c5db23..2a6107fcf8 100644
+index d535a6a48b..7c34d5a1aa 100644
 --- a/gdb/gnulib/import/sys_time.in.h
 +++ b/gdb/gnulib/import/sys_time.in.h
 @@ -93,20 +93,20 @@ struct timeval
@@ -42,7 +42,7 @@ index c556c5db23..2a6107fcf8 100644
 +                       (struct timeval *__restrict, void *__restrict));
  # endif
  _GL_CXXALIASWARN (gettimeofday);
- #elif defined GNULIB_POSIXCHECK
+ # if defined __cplusplus && defined GNULIB_NAMESPACE
 -- 
-2.11.0
+2.13.1
 
diff --git a/meta/recipes-devtools/gdb/gdb_7.12.1.bb b/meta/recipes-devtools/gdb/gdb_8.0.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_7.12.1.bb
rename to meta/recipes-devtools/gdb/gdb_8.0.bb
-- 
2.13.1


