Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 312FC719DD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 17:19:24 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id b1so9011114pgc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 09:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=K42c30sZq1Nfko5JwbUqQG0RrVQuiAlWSnLsKBGhB2k=;
	b=Q3tQLKX6sokYuGrYg1eF1nApHPpeGz56CEw3gOuu3an0JDEW96V5NTTAFlkN++tZ12
	VAu9jFvo2TPCTlOTWSSi+d3seOqX+dNWNArDK+Nxd0l1MClZTk3XKaKNMjeSFGX6Ofx4
	KDviHBfDrWkFl3LZmIZ6I67bEuUKVp2OW9ZnEWZDQj2Yvt1CREoq1EXNX3A2FV5b55R1
	nGkc0Qoxf3t43mTt9fKSdoW4WoAjj1lb9l/CITkiiY2J9KgeVsFr7CBaDq6GfbJlCHBg
	oiiR/nfPGNg2OJKkC+rU9DWPQrCPv3U2+/FjtDdqmCcAgevraXkFDmafBvEGKavT6vNc
	FDrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=K42c30sZq1Nfko5JwbUqQG0RrVQuiAlWSnLsKBGhB2k=;
	b=J7MQkEfJOfkQcwYGcUeiAa/ZoDleQ7sx7EkI+PgMcZCMqlEm5qXAwnl8KST3OcbuN9
	CLx1rzrcqkwetIdUsAGmb0OKBfUjH8vhdufme3W/eXPIkKx4mHaNUGmIYz3AchUKEBOV
	RNRQX5iptgZX/+uXcL5sX5EXFgoB7vKIu6Ixp42PNVDfH3BWGaFNrb4v2XmdFMYFBwvs
	rMzBY53iJaSi47Hz1/8DfuOdA+0IiIG8OUkfnzgQ6BhcNLmtzJ8diwRQI+VQWUeM2GZn
	sBYHZfXb1mM26CICQrMSx0ukIO8YOx2jAQ3pnP1aucA7u7/DmdipMaMiJ6N2wFK1QrvD
	djYw==
X-Gm-Message-State: AKaTC03BAlIrYPlC6pJIIVBw4v2Qc0Est4er0aJ56FU5Fh8aUEb3b8xYiAHf+0gICzHA2g==
X-Received: by 10.84.140.3 with SMTP id 3mr36657916pls.61.1482167965395;
	Mon, 19 Dec 2016 09:19:25 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	f132sm32846180pfa.72.2016.12.19.09.19.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Dec 2016 09:19:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2016 09:19:15 -0800
Message-Id: <20161219171915.10651-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20161219171915.10651-1-raj.khem@gmail.com>
References: <20161219171915.10651-1-raj.khem@gmail.com>
Subject: [V3 02/10] gdb: Upgrade to 7.12
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
X-List-Received-Date: Mon, 19 Dec 2016 17:19:25 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 .../gdb/{gdb-7.11.1.inc => gdb-7.12.inc}           |    5 +-
 ...nadian_7.11.1.bb => gdb-cross-canadian_7.12.bb} |    0
 .../gdb/{gdb-cross_7.11.1.bb => gdb-cross_7.12.bb} |    0
 .../gdb/0001-include-sys-types.h-for-mode_t.patch  |    6 +-
 ...0002-make-man-install-relative-to-DESTDIR.patch |    6 +-
 ...s-linux-nat-Define-_ABIO32-if-not-defined.patch |    6 +-
 ...Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch |   12 +-
 ...d-support-for-Renesas-SH-sh4-architecture.patch |   42 +-
 ...e-libreadline.a-when-using-disable-static.patch |   10 +-
 .../gdb/gdb/0007-use-asm-sgidefs.h.patch           |    6 +-
 .../0008-Use-exorted-definitions-of-SIGRTMIN.patch |   10 +-
 .../gdb/gdb/0009-Change-order-of-CFLAGS.patch      |    6 +-
 .../0010-resolve-restrict-keyword-conflict.patch   |    6 +-
 meta/recipes-devtools/gdb/gdb/0011-avx_mpx.patch   | 2601 --------------------
 .../gdb/{gdb_7.11.1.bb => gdb_7.12.bb}             |    1 +
 16 files changed, 59 insertions(+), 2660 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-7.11.1.inc => gdb-7.12.inc} (85%)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.11.1.bb => gdb-cross-canadian_7.12.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_7.11.1.bb => gdb-cross_7.12.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0011-avx_mpx.patch
 rename meta/recipes-devtools/gdb/{gdb_7.11.1.bb => gdb_7.12.bb} (92%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index ca3c5ec90a..0a93f5b956 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -25,8 +25,8 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 GCCVERSION ?= "6.2%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.27%"
-GDBVERSION ?= "7.11%"
 GLIBCVERSION ?= "2.24"
+GDBVERSION ?= "7.12%"
 UCLIBCVERSION ?= "1.0%"
 LINUXLIBCVERSION ?= "4.8%"
 
diff --git a/meta/recipes-devtools/gdb/gdb-7.11.1.inc b/meta/recipes-devtools/gdb/gdb-7.12.inc
similarity index 85%
rename from meta/recipes-devtools/gdb/gdb-7.11.1.inc
rename to meta/recipes-devtools/gdb/gdb-7.12.inc
index d9dfe6f3f3..2faddc58bf 100644
--- a/meta/recipes-devtools/gdb/gdb-7.11.1.inc
+++ b/meta/recipes-devtools/gdb/gdb-7.12.inc
@@ -15,8 +15,7 @@ SRC_URI = "http://ftp.gnu.org/gnu/gdb/gdb-${PV}.tar.xz \
            file://0008-Use-exorted-definitions-of-SIGRTMIN.patch \
            file://0009-Change-order-of-CFLAGS.patch \
            file://0010-resolve-restrict-keyword-conflict.patch \
-           file://0011-avx_mpx.patch \
 "
+SRC_URI[md5sum] = "a0a3a00f7499b0c5278ba8676745d180"
+SRC_URI[sha256sum] = "834ff3c5948b30718343ea57b11cbc3235d7995c6a4f3a5cecec8c8114164f94"
 
-SRC_URI[md5sum] = "5aa71522e488e358243917967db87476"
-SRC_URI[sha256sum] = "e9216da4e3755e9f414c1aa0026b626251dfc57ffe572a266e98da4f6988fc70"
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.11.1.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.12.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_7.11.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_7.12.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross_7.11.1.bb b/meta/recipes-devtools/gdb/gdb-cross_7.12.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_7.11.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross_7.12.bb
diff --git a/meta/recipes-devtools/gdb/gdb/0001-include-sys-types.h-for-mode_t.patch b/meta/recipes-devtools/gdb/gdb/0001-include-sys-types.h-for-mode_t.patch
index 0042c00634..fc6c92f186 100644
--- a/meta/recipes-devtools/gdb/gdb/0001-include-sys-types.h-for-mode_t.patch
+++ b/meta/recipes-devtools/gdb/gdb/0001-include-sys-types.h-for-mode_t.patch
@@ -1,4 +1,4 @@
-From fddd7178915968acf680814411b8b3cb137d0587 Mon Sep 17 00:00:00 2001
+From 2c81e17216b4e471a1ce0bddb50f374b0722a2ce Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 19 Jan 2016 18:18:52 -0800
 Subject: [PATCH 01/10] include sys/types.h for mode_t
@@ -14,7 +14,7 @@ Upstream-Status: Pending
  1 file changed, 1 insertion(+)
 
 diff --git a/gdb/gdbserver/target.h b/gdb/gdbserver/target.h
-index 5af2051..f42c510 100644
+index 4c14c204bb..bdab18f7f7 100644
 --- a/gdb/gdbserver/target.h
 +++ b/gdb/gdbserver/target.h
 @@ -28,6 +28,7 @@
@@ -26,5 +26,5 @@ index 5af2051..f42c510 100644
  struct emit_ops;
  struct buffer;
 -- 
-2.8.2
+2.11.0
 
diff --git a/meta/recipes-devtools/gdb/gdb/0002-make-man-install-relative-to-DESTDIR.patch b/meta/recipes-devtools/gdb/gdb/0002-make-man-install-relative-to-DESTDIR.patch
index defed621f4..9a9201b39c 100644
--- a/meta/recipes-devtools/gdb/gdb/0002-make-man-install-relative-to-DESTDIR.patch
+++ b/meta/recipes-devtools/gdb/gdb/0002-make-man-install-relative-to-DESTDIR.patch
@@ -1,4 +1,4 @@
-From 3229cb09033eeb5003a08d91fa9d43be8ba4c86b Mon Sep 17 00:00:00 2001
+From f316d604b312bead78594f02e1355633eda9507b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 02:27:55 +0000
 Subject: [PATCH 02/10] make man install relative to DESTDIR
@@ -11,7 +11,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/sim/common/Makefile.in b/sim/common/Makefile.in
-index a05f507..8d0fa64 100644
+index a05f50767a..8d0fa64ea8 100644
 --- a/sim/common/Makefile.in
 +++ b/sim/common/Makefile.in
 @@ -35,7 +35,7 @@ tooldir = $(libdir)/$(target_alias)
@@ -24,5 +24,5 @@ index a05f507..8d0fa64 100644
  includedir = @includedir@
  
 -- 
-2.8.2
+2.11.0
 
diff --git a/meta/recipes-devtools/gdb/gdb/0003-mips-linux-nat-Define-_ABIO32-if-not-defined.patch b/meta/recipes-devtools/gdb/gdb/0003-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
index bac793964a..74c00063e4 100644
--- a/meta/recipes-devtools/gdb/gdb/0003-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
+++ b/meta/recipes-devtools/gdb/gdb/0003-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
@@ -1,4 +1,4 @@
-From 88e67caed662d8344c8db56176c9f1221e6cd2a2 Mon Sep 17 00:00:00 2001
+From f2912b1d2e5c854a112176682903b696da33e003 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 23 Mar 2016 06:30:09 +0000
 Subject: [PATCH 03/10] mips-linux-nat: Define _ABIO32 if not defined
@@ -17,7 +17,7 @@ Upstream-Status: Pending
  1 file changed, 5 insertions(+)
 
 diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
-index bfe9fcb..449b43a 100644
+index 0f20f16814..722532bb6c 100644
 --- a/gdb/mips-linux-nat.c
 +++ b/gdb/mips-linux-nat.c
 @@ -46,6 +46,11 @@
@@ -33,5 +33,5 @@ index bfe9fcb..449b43a 100644
     we'll clear this and use PTRACE_PEEKUSER instead.  */
  static int have_ptrace_regsets = 1;
 -- 
-2.8.2
+2.11.0
 
diff --git a/meta/recipes-devtools/gdb/gdb/0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/meta/recipes-devtools/gdb/gdb/0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
index a5fe2a2793..847f24f7fe 100644
--- a/meta/recipes-devtools/gdb/gdb/0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
+++ b/meta/recipes-devtools/gdb/gdb/0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
@@ -1,6 +1,6 @@
-From bec564eb454bc7fc6ecfcb573aa53040bf39c1d5 Mon Sep 17 00:00:00 2001
+From 7ef7b709885378279c424eab0510b93233400b24 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 30 Apr 2016 16:46:03 +0000
+Date: Sat, 6 Aug 2016 17:32:50 -0700
 Subject: [PATCH 04/10] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLIBC
  systems
 
@@ -13,7 +13,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 12 insertions(+)
 
 diff --git a/gdb/gdbserver/linux-ppc-low.c b/gdb/gdbserver/linux-ppc-low.c
-index 2145c50..777905d 100644
+index 1d013f185f..68098b3db9 100644
 --- a/gdb/gdbserver/linux-ppc-low.c
 +++ b/gdb/gdbserver/linux-ppc-low.c
 @@ -21,7 +21,13 @@
@@ -29,9 +29,9 @@ index 2145c50..777905d 100644
 +#endif
  
  #include "nat/ppc-linux.h"
- 
+ #include "linux-ppc-tdesc.h"
 diff --git a/gdb/nat/ppc-linux.h b/gdb/nat/ppc-linux.h
-index 85fbcd8..cbec9c5 100644
+index 85fbcd84bb..cbec9c53b2 100644
 --- a/gdb/nat/ppc-linux.h
 +++ b/gdb/nat/ppc-linux.h
 @@ -18,7 +18,13 @@
@@ -49,5 +49,5 @@ index 85fbcd8..cbec9c5 100644
  
  /* This sometimes isn't defined.  */
 -- 
-2.8.2
+2.11.0
 
diff --git a/meta/recipes-devtools/gdb/gdb/0005-Add-support-for-Renesas-SH-sh4-architecture.patch b/meta/recipes-devtools/gdb/gdb/0005-Add-support-for-Renesas-SH-sh4-architecture.patch
index 8809e6f8b2..d0c15f6289 100644
--- a/meta/recipes-devtools/gdb/gdb/0005-Add-support-for-Renesas-SH-sh4-architecture.patch
+++ b/meta/recipes-devtools/gdb/gdb/0005-Add-support-for-Renesas-SH-sh4-architecture.patch
@@ -1,4 +1,4 @@
-From 8c5fe58c5a0044ddb517a41b277ed27fb3d3bedc Mon Sep 17 00:00:00 2001
+From 6649e2cccfb11dec076abb02eae0afab95614829 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 02:31:12 +0000
 Subject: [PATCH 05/10] Add support for Renesas SH (sh4) architecture.
@@ -27,10 +27,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  11 files changed, 617 insertions(+), 29 deletions(-)
 
 diff --git a/gdb/Makefile.in b/gdb/Makefile.in
-index ec2af52..df8e84d 100644
+index 7b2df86878..10f1266fe3 100644
 --- a/gdb/Makefile.in
 +++ b/gdb/Makefile.in
-@@ -1736,6 +1736,7 @@ ALLDEPFILES = \
+@@ -1750,6 +1750,7 @@ ALLDEPFILES = \
  	score-tdep.c \
  	ser-go32.c ser-pipe.c ser-tcp.c ser-mingw.c \
  	sh-tdep.c sh64-tdep.c shnbsd-tdep.c shnbsd-nat.c \
@@ -39,7 +39,7 @@ index ec2af52..df8e84d 100644
  	solib-svr4.c \
  	sparc-linux-nat.c sparc-linux-tdep.c \
 diff --git a/gdb/configure.host b/gdb/configure.host
-index ef265eb..322a1e2 100644
+index ef265ebe29..322a1e2c67 100644
 --- a/gdb/configure.host
 +++ b/gdb/configure.host
 @@ -149,6 +149,7 @@ powerpc*-*-linux*)	gdb_host=linux ;;
@@ -51,7 +51,7 @@ index ef265eb..322a1e2 100644
  			gdb_host=nbsd ;;
  sh*-*-openbsd*)		gdb_host=nbsd ;;
 diff --git a/gdb/sh-linux-tdep.c b/gdb/sh-linux-tdep.c
-index 2418d25..ac8ea9e 100644
+index 2418d25010..ac8ea9e2a4 100644
 --- a/gdb/sh-linux-tdep.c
 +++ b/gdb/sh-linux-tdep.c
 @@ -18,14 +18,37 @@
@@ -599,7 +599,7 @@ index 2418d25..ac8ea9e 100644
  
    /* GNU/Linux uses SVR4-style shared libraries.  */
 diff --git a/gdb/sh-tdep.c b/gdb/sh-tdep.c
-index 336b48e..847b271 100644
+index 694f5f742d..8d54df7a1a 100644
 --- a/gdb/sh-tdep.c
 +++ b/gdb/sh-tdep.c
 @@ -21,6 +21,9 @@
@@ -662,7 +662,7 @@ index 336b48e..847b271 100644
        len = TYPE_LENGTH (type);
        val = sh_justify_value_in_reg (gdbarch, args[argnum], len);
  
-@@ -1821,7 +1808,7 @@ sh_dwarf2_frame_init_reg (struct gdbarch *gdbarch, int regnum,
+@@ -1819,7 +1806,7 @@ sh_dwarf2_frame_init_reg (struct gdbarch *gdbarch, int regnum,
      reg->how = DWARF2_FRAME_REG_UNDEFINED;
  }
  
@@ -671,7 +671,7 @@ index 336b48e..847b271 100644
  sh_alloc_frame_cache (void)
  {
    struct sh_frame_cache *cache;
-@@ -1848,7 +1835,7 @@ sh_alloc_frame_cache (void)
+@@ -1846,7 +1833,7 @@ sh_alloc_frame_cache (void)
    return cache;
  }
  
@@ -680,7 +680,7 @@ index 336b48e..847b271 100644
  sh_frame_cache (struct frame_info *this_frame, void **this_cache)
  {
    struct gdbarch *gdbarch = get_frame_arch (this_frame);
-@@ -1915,9 +1902,9 @@ sh_frame_cache (struct frame_info *this_frame, void **this_cache)
+@@ -1913,9 +1900,9 @@ sh_frame_cache (struct frame_info *this_frame, void **this_cache)
    return cache;
  }
  
@@ -693,7 +693,7 @@ index 336b48e..847b271 100644
  {
    struct gdbarch *gdbarch = get_frame_arch (this_frame);
    struct sh_frame_cache *cache = sh_frame_cache (this_frame, this_cache);
-@@ -1931,7 +1918,7 @@ sh_frame_prev_register (struct frame_info *this_frame,
+@@ -1929,7 +1916,7 @@ sh_frame_prev_register (struct frame_info *this_frame,
       the current frame.  Frob regnum so that we pull the value from
       the correct place.  */
    if (regnum == gdbarch_pc_regnum (gdbarch))
@@ -702,7 +702,7 @@ index 336b48e..847b271 100644
  
    if (regnum < SH_NUM_REGS && cache->saved_regs[regnum] != -1)
      return frame_unwind_got_memory (this_frame, regnum,
-@@ -2240,8 +2227,8 @@ sh_return_in_first_hidden_param_p (struct gdbarch *gdbarch,
+@@ -2238,8 +2225,8 @@ sh_return_in_first_hidden_param_p (struct gdbarch *gdbarch,
  static struct gdbarch *
  sh_gdbarch_init (struct gdbarch_info info, struct gdbarch_list *arches)
  {
@@ -712,7 +712,7 @@ index 336b48e..847b271 100644
  
    /* SH5 is handled entirely in sh64-tdep.c.  */
    if (info.bfd_arch_info->mach == bfd_mach_sh5)
-@@ -2257,6 +2244,18 @@ sh_gdbarch_init (struct gdbarch_info info, struct gdbarch_list *arches)
+@@ -2255,6 +2242,18 @@ sh_gdbarch_init (struct gdbarch_info info, struct gdbarch_list *arches)
    tdep = XCNEW (struct gdbarch_tdep);
    gdbarch = gdbarch_alloc (&info, tdep);
  
@@ -731,7 +731,7 @@ index 336b48e..847b271 100644
    set_gdbarch_short_bit (gdbarch, 2 * TARGET_CHAR_BIT);
    set_gdbarch_int_bit (gdbarch, 4 * TARGET_CHAR_BIT);
    set_gdbarch_long_bit (gdbarch, 4 * TARGET_CHAR_BIT);
-@@ -2407,10 +2406,11 @@ sh_gdbarch_init (struct gdbarch_info info, struct gdbarch_list *arches)
+@@ -2405,10 +2404,11 @@ sh_gdbarch_init (struct gdbarch_info info, struct gdbarch_list *arches)
        break;
      }
  
@@ -745,7 +745,7 @@ index 336b48e..847b271 100644
    frame_unwind_append_unwinder (gdbarch, &sh_frame_unwind);
  
 diff --git a/gdb/sh-tdep.h b/gdb/sh-tdep.h
-index 666968f..62c65b5 100644
+index 666968f787..62c65b55ea 100644
 --- a/gdb/sh-tdep.h
 +++ b/gdb/sh-tdep.h
 @@ -21,6 +21,12 @@
@@ -828,7 +828,7 @@ index 666968f..62c65b5 100644
       where each general-purpose register is stored inside the associated
       core file section.  */
 diff --git a/gdb/testsuite/gdb.asm/asm-source.exp b/gdb/testsuite/gdb.asm/asm-source.exp
-index 6d9aef8..5b66b42 100644
+index 6d9aef81bb..5b66b429d1 100644
 --- a/gdb/testsuite/gdb.asm/asm-source.exp
 +++ b/gdb/testsuite/gdb.asm/asm-source.exp
 @@ -116,6 +116,11 @@ switch -glob -- [istarget] {
@@ -844,7 +844,7 @@ index 6d9aef8..5b66b42 100644
          set asm-arch sh
  	set debug-flags "-gdwarf-2"
 diff --git a/gdb/testsuite/gdb.asm/sh.inc b/gdb/testsuite/gdb.asm/sh.inc
-index a4a5fc5..89efed7 100644
+index a4a5fc545e..89efed7795 100644
 --- a/gdb/testsuite/gdb.asm/sh.inc
 +++ b/gdb/testsuite/gdb.asm/sh.inc
 @@ -40,9 +40,8 @@
@@ -859,7 +859,7 @@ index a4a5fc5..89efed7 100644
  	.align	1
  .Lafterconst\@:
 diff --git a/gdb/testsuite/gdb.base/annota1.c b/gdb/testsuite/gdb.base/annota1.c
-index 424e1b8..0de2e7b 100644
+index 424e1b8327..0de2e7b633 100644
 --- a/gdb/testsuite/gdb.base/annota1.c
 +++ b/gdb/testsuite/gdb.base/annota1.c
 @@ -1,6 +1,9 @@
@@ -873,7 +873,7 @@ index 424e1b8..0de2e7b 100644
  void
  handle_USR1 (int sig)
 diff --git a/gdb/testsuite/gdb.base/annota3.c b/gdb/testsuite/gdb.base/annota3.c
-index 424e1b8..952aaf21 100644
+index 424e1b8327..952aaf218a 100644
 --- a/gdb/testsuite/gdb.base/annota3.c
 +++ b/gdb/testsuite/gdb.base/annota3.c
 @@ -1,6 +1,10 @@
@@ -888,7 +888,7 @@ index 424e1b8..952aaf21 100644
  void
  handle_USR1 (int sig)
 diff --git a/gdb/testsuite/gdb.base/sigall.c b/gdb/testsuite/gdb.base/sigall.c
-index 81f3b08..1574b2d 100644
+index 81f3b08d6b..1574b2d6cb 100644
 --- a/gdb/testsuite/gdb.base/sigall.c
 +++ b/gdb/testsuite/gdb.base/sigall.c
 @@ -1,6 +1,9 @@
@@ -902,7 +902,7 @@ index 81f3b08..1574b2d 100644
  /* Signal handlers, we set breakpoints in them to make sure that the
     signals really get delivered.  */
 diff --git a/gdb/testsuite/gdb.base/signals.c b/gdb/testsuite/gdb.base/signals.c
-index 7566068..1205a9b 100644
+index 756606880f..1205a9bc9c 100644
 --- a/gdb/testsuite/gdb.base/signals.c
 +++ b/gdb/testsuite/gdb.base/signals.c
 @@ -3,6 +3,10 @@
@@ -917,5 +917,5 @@ index 7566068..1205a9b 100644
  static int count = 0;
  
 -- 
-2.8.2
+2.11.0
 
diff --git a/meta/recipes-devtools/gdb/gdb/0006-Dont-disable-libreadline.a-when-using-disable-static.patch b/meta/recipes-devtools/gdb/gdb/0006-Dont-disable-libreadline.a-when-using-disable-static.patch
index 394d26d063..5ed8e81e4a 100644
--- a/meta/recipes-devtools/gdb/gdb/0006-Dont-disable-libreadline.a-when-using-disable-static.patch
+++ b/meta/recipes-devtools/gdb/gdb/0006-Dont-disable-libreadline.a-when-using-disable-static.patch
@@ -1,4 +1,4 @@
-From f3932cb2960fd54655a448b13d5a5b80f356f8de Mon Sep 17 00:00:00 2001
+From 2a6e28ad5c0cad189a3697d96de031e4713052b8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 15:25:03 -0700
 Subject: [PATCH 06/10] Dont disable libreadline.a when using --disable-static
@@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.def b/Makefile.def
-index ea8453e..0fc66c6 100644
+index ea8453e851..0fc66c694b 100644
 --- a/Makefile.def
 +++ b/Makefile.def
 @@ -104,7 +104,8 @@ host_modules= { module= libiconv;
@@ -33,10 +33,10 @@ index ea8453e..0fc66c6 100644
  host_modules= { module= sim; };
  host_modules= { module= texinfo; no_install= true; };
 diff --git a/Makefile.in b/Makefile.in
-index 2733c4d..3e04e80 100644
+index cb0136e8f8..55f9085c16 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -25380,7 +25380,7 @@ configure-readline:
+@@ -25385,7 +25385,7 @@ configure-readline:
  	  $$s/$$module_srcdir/configure \
  	  --srcdir=$${topdir}/$$module_srcdir \
  	  $(HOST_CONFIGARGS) --build=${build_alias} --host=${host_alias} \
@@ -46,5 +46,5 @@ index 2733c4d..3e04e80 100644
  @endif readline
  
 -- 
-2.8.2
+2.11.0
 
diff --git a/meta/recipes-devtools/gdb/gdb/0007-use-asm-sgidefs.h.patch b/meta/recipes-devtools/gdb/gdb/0007-use-asm-sgidefs.h.patch
index f32f8ee417..a42c9fd2a7 100644
--- a/meta/recipes-devtools/gdb/gdb/0007-use-asm-sgidefs.h.patch
+++ b/meta/recipes-devtools/gdb/gdb/0007-use-asm-sgidefs.h.patch
@@ -1,4 +1,4 @@
-From 048675a915a72989f2613386975730da016e7c5d Mon Sep 17 00:00:00 2001
+From d7543b44255da4ae71447d4e4d63e0b6aa4ed909 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <amccurdy@gmail.com>
 Date: Sat, 30 Apr 2016 15:29:06 -0700
 Subject: [PATCH 07/10] use <asm/sgidefs.h>
@@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
-index 449b43a..09603da 100644
+index 722532bb6c..51d8fc8f66 100644
 --- a/gdb/mips-linux-nat.c
 +++ b/gdb/mips-linux-nat.c
 @@ -31,7 +31,7 @@
@@ -32,5 +32,5 @@ index 449b43a..09603da 100644
  #include <asm/ptrace.h>
  
 -- 
-2.8.2
+2.11.0
 
diff --git a/meta/recipes-devtools/gdb/gdb/0008-Use-exorted-definitions-of-SIGRTMIN.patch b/meta/recipes-devtools/gdb/gdb/0008-Use-exorted-definitions-of-SIGRTMIN.patch
index 7e58b617ad..ae9cb8c0e2 100644
--- a/meta/recipes-devtools/gdb/gdb/0008-Use-exorted-definitions-of-SIGRTMIN.patch
+++ b/meta/recipes-devtools/gdb/gdb/0008-Use-exorted-definitions-of-SIGRTMIN.patch
@@ -1,4 +1,4 @@
-From e54ead9d81f4d38412751b815f909db3cb144bb1 Mon Sep 17 00:00:00 2001
+From aacd77184da1328908da41c9fdb55ad881fa0e99 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 15:31:40 -0700
 Subject: [PATCH 08/10] Use exorted definitions of SIGRTMIN
@@ -20,10 +20,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 6 insertions(+), 2 deletions(-)
 
 diff --git a/gdb/linux-nat.c b/gdb/linux-nat.c
-index 0829bcb..3b8a896 100644
+index 5d5efa0af4..e3420b49a0 100644
 --- a/gdb/linux-nat.c
 +++ b/gdb/linux-nat.c
-@@ -4845,6 +4845,6 @@ lin_thread_get_thread_signals (sigset_t *set)
+@@ -5022,6 +5022,6 @@ lin_thread_get_thread_signals (sigset_t *set)
    /* NPTL reserves the first two RT signals, but does not provide any
       way for the debugger to query the signal numbers - fortunately
       they don't change.  */
@@ -33,7 +33,7 @@ index 0829bcb..3b8a896 100644
 +  sigaddset (set, SIGRTMIN + 1);
  }
 diff --git a/gdb/nat/linux-nat.h b/gdb/nat/linux-nat.h
-index 2b485db..d058afc 100644
+index 2b485db141..d058afcde8 100644
 --- a/gdb/nat/linux-nat.h
 +++ b/gdb/nat/linux-nat.h
 @@ -85,4 +85,8 @@ extern enum target_stop_reason lwp_stop_reason (struct lwp_info *lwp);
@@ -46,5 +46,5 @@ index 2b485db..d058afc 100644
 +
  #endif /* LINUX_NAT_H */
 -- 
-2.8.2
+2.11.0
 
diff --git a/meta/recipes-devtools/gdb/gdb/0009-Change-order-of-CFLAGS.patch b/meta/recipes-devtools/gdb/gdb/0009-Change-order-of-CFLAGS.patch
index a230047af6..ed6e0aeb7b 100644
--- a/meta/recipes-devtools/gdb/gdb/0009-Change-order-of-CFLAGS.patch
+++ b/meta/recipes-devtools/gdb/gdb/0009-Change-order-of-CFLAGS.patch
@@ -1,4 +1,4 @@
-From ba0bbf887d4911ccee9df57cb13eafb1de34bb31 Mon Sep 17 00:00:00 2001
+From 8c35d5d1825ed017cc58ea91011412e54c002eeb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 15:35:39 -0700
 Subject: [PATCH 09/10] Change order of CFLAGS
@@ -13,7 +13,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/gdb/gdbserver/Makefile.in b/gdb/gdbserver/Makefile.in
-index 1e874e3..91e8550 100644
+index f844ab8853..3f88db52e3 100644
 --- a/gdb/gdbserver/Makefile.in
 +++ b/gdb/gdbserver/Makefile.in
 @@ -138,10 +138,10 @@ CXXFLAGS = @CXXFLAGS@
@@ -30,5 +30,5 @@ index 1e874e3..91e8550 100644
  # LDFLAGS is specifically reserved for setting from the command line
  # when running make.
 -- 
-2.8.2
+2.11.0
 
diff --git a/meta/recipes-devtools/gdb/gdb/0010-resolve-restrict-keyword-conflict.patch b/meta/recipes-devtools/gdb/gdb/0010-resolve-restrict-keyword-conflict.patch
index 16c34c7035..1938beb561 100644
--- a/meta/recipes-devtools/gdb/gdb/0010-resolve-restrict-keyword-conflict.patch
+++ b/meta/recipes-devtools/gdb/gdb/0010-resolve-restrict-keyword-conflict.patch
@@ -1,4 +1,4 @@
-From 5a9ccb8c0728b658fc4f7f0f7b36873c64274f10 Mon Sep 17 00:00:00 2001
+From 7816d3497266e55c1c921d7cc1c8bf81c8ed0b4a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 10 May 2016 08:47:05 -0700
 Subject: [PATCH 10/10] resolve restrict keyword conflict
@@ -15,7 +15,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/gdb/gnulib/import/sys_time.in.h b/gdb/gnulib/import/sys_time.in.h
-index c556c5d..2a6107f 100644
+index c556c5db23..2a6107fcf8 100644
 --- a/gdb/gnulib/import/sys_time.in.h
 +++ b/gdb/gnulib/import/sys_time.in.h
 @@ -93,20 +93,20 @@ struct timeval
@@ -44,5 +44,5 @@ index c556c5d..2a6107f 100644
  _GL_CXXALIASWARN (gettimeofday);
  #elif defined GNULIB_POSIXCHECK
 -- 
-2.8.2
+2.11.0
 
diff --git a/meta/recipes-devtools/gdb/gdb/0011-avx_mpx.patch b/meta/recipes-devtools/gdb/gdb/0011-avx_mpx.patch
deleted file mode 100644
index 209c4fcbdf..0000000000
--- a/meta/recipes-devtools/gdb/gdb/0011-avx_mpx.patch
+++ /dev/null
@@ -1,2601 +0,0 @@
-gdb: Backport patch to support changes with AVX and MPX
-
-The current MPX target descriptions assume that MPX is always combined
-with AVX, however that's not correct.  We can have machines with MPX
-and without AVX; or machines with AVX and without MPX.
-
-This patch adds new target descriptions for machines that support
-both MPX and AVX, as duplicates of the existing MPX descriptions.
-
-The following commit will remove AVX from the MPX-only descriptions.
-
-Upstream-Status: Backport
-
-Signed-off-by: bavery <brian.avery@intel.com>
-
-
-Orignal patch changelog and author attribution:
-
-2016-04-16  Walfred Tedeschi  <walfred.tedeschi@intel.com>
-
-gdb/ChangeLog:
-
-	* amd64-linux-tdep.c (features/i386/amd64-avx-mpx-linux.c):
-	New include.
-	(amd64_linux_core_read_description): Add case for
-	 X86_XSTATE_AVX_MPX_MASK.
-	(_initialize_amd64_linux_tdep): Call initialize_tdesc_amd64_avx_mpx_linux.
-	* amd64-linux-tdep.h (tdesc_amd64_avx_mpx_linux): New definition.
-	* amd64-tdep.c (features/i386/amd64-avx-mpx.c): New include.
-	(amd64_target_description): Add case for  X86_XSTATE_AVX_MPX_MASK.
-	(_initialize_amd64_tdep): Call initialize_tdesc_amd64_avx_mpx.
-	* common/x86-xstate.h (X86_XSTATE_MPX_MASK): Remove AVX bits.
-	(X86_XSTATE_AVX_MPX_MASK): New case.
-	* features/Makefile (i386/i386-avx-mpx, i386/i386-avx-mpx-linux)
-	(i386/amd64-avx-mpx, i386/amd64-avx-mpx-linux): New rules.
-	(i386/i386-avx-mpx-expedite, i386/i386-avx-mpx-linux-expedite)
-	(i386/amd64-avx-mpx-expedite, i386/amd64-avx-mpx-linux-expedite):
-	New expedites.
-	* i386-linux-tdep.c (features/i386/i386-avx-mpx-linux.c): New
-	include.
-	(i386_linux_core_read_description): Add case
-	X86_XSTATE_AVX_MPX_MASK.
-	(_initialize_i386_linux_tdep): Call
-	initialize_tdesc_i386_avx_mpx_linux.
-	* i386-linux-tdep.h (tdesc_i386_avx_mpx_linux): New include.
-	* i386-tdep.c (features/i386/i386-avx-mpx.c): New include.
-	(i386_target_description): Add case for X86_XSTATE_AVX_MPX_MASK.
-	* x86-linux-nat.c (x86_linux_read_description): Add case for
-	X86_XSTATE_AVX_MPX_MASK.
-	* features/i386/amd64-avx-mpx-linux.xml: New file.
-	* features/i386/i386-avx-mpx-linux.xml: New file.
-	* features/i386/i386-avx-mpx.xml: New file.
-	* features/i386/amd64-avx-mpx.xml: New file.
-	* features/i386/amd64-avx-mpx-linux.c: Generated.
-	* features/i386/amd64-avx-mpx.c: Generated.
-	* features/i386/i386-avx-mpx-linux.c: Generated.
-	* features/i386/i386-avx-mpx.c: Generated.
-	* regformats/i386/amd64-avx-mpx-linux.dat: Generated.
-	* regformats/i386/amd64-avx-mpx.dat: Generated.
-	* regformats/i386/i386-avx-mpx-linux.dat: Generated.
-	* regformats/i386/i386-avx-mpx.dat: Generated.
-
-gdb/gdbserver/ChangeLog:
-
-	* Makefile.in (clean): Add removal for i386-avx-mpx.c,
-	i386-avx-mpx-linux.c, amd64-avx-mpx.c and amd64-avx-mpx-linux.c.
-	(i386-avx-mpx.c, i386-avx-mpx-linux.c, amd64-avx-mpx.c)
-	(amd64-avx-mpx-linux.c): New rules.
-	(amd64-avx-mpx-linux-ipa.o, i386-avx-mpx-linux-ipa.o): New rule.
-	* configure.srv (srv_i386_regobj): Add i386-avx-mpx.o.
-	(srv_i386_linux_regobj): Add i386-avx-mpx-linux.o.
-	(srv_amd64_regobj): Add amd64-avx-mpx.o.
-	(srv_amd64_linux_regobj): Add amd64-avx-mpx-linux.o.
-	(srv_i386_xmlfiles): Add i386/i386-avx-mpx.xml.
-	(srv_amd64_xmlfiles): Add i386/amd64-avx-mpx.xml.
-	(srv_i386_linux_xmlfiles): Add i386/i386-avx-mpx-linux.xml.
-	(srv_amd64_linux_xmlfiles): Add i386/amd64-avx-mpx-linux.xml.
-	(ipa_i386_linux_regobj): Add i386-avx-mpx-linux-ipa.o.
-	(ipa_amd64_linux_regobj): Add amd64-avx-mpx-linux-ipa.o.
-	* linux-x86-low.c (x86_linux_read_description): Add case for
-	X86_XSTATE_AVX_MPX_MASK.
-	(x86_get_ipa_tdesc_idx): Add cases for avx_mpx.
-	(initialize_low_arch): Call init_registers_amd64_avx_mpx_linux and
-	init_registers_i386_avx_mpx_linux.
-	* linux-i386-ipa.c (get_ipa_tdesc): Add case for avx_mpx.
-	(initialize_low_tracepoint): Call
-	init_registers_i386_avx_mpx_linux.
-	* linux-amd64-ipa.c (get_ipa_tdesc):  Add case for avx_mpx.
-	(initialize_low_tracepoint): Call
-	init_registers_amd64_avx_mpx_linux.
-	* linux-x86-tdesc.h (X86_TDESC_AVX_MPX): New enum value.
-	(init_registers_amd64_avx_mpx_linux, tdesc_amd64_avx_mpx_linux)
-	(init_registers_i386_avx_mpx_linux, tdesc_i386_avx_mpx_linux): New
-	declarations.
-
-
-
-
-diff --git a/gdb/amd64-linux-tdep.c b/gdb/amd64-linux-tdep.c
-index 21bcd99..5327f7c 100644
---- a/gdb/amd64-linux-tdep.c
-+++ b/gdb/amd64-linux-tdep.c
-@@ -43,6 +43,7 @@
- #include "features/i386/amd64-linux.c"
- #include "features/i386/amd64-avx-linux.c"
- #include "features/i386/amd64-mpx-linux.c"
-+#include "features/i386/amd64-avx-mpx-linux.c"
- #include "features/i386/amd64-avx512-linux.c"
-
- #include "features/i386/x32-linux.c"
-@@ -1590,6 +1591,11 @@ amd64_linux_core_read_description (struct gdbarch *gdbarch,
- 	return tdesc_x32_avx_linux;  /* No x32 MPX falling back to AVX.  */
-       else
- 	return tdesc_amd64_mpx_linux;
-+    case X86_XSTATE_AVX_MPX_MASK:
-+      if (gdbarch_ptr_bit (gdbarch) == 32)
-+	return tdesc_x32_avx_linux;  /* No x32 MPX falling back to AVX.  */
-+      else
-+	return tdesc_amd64_avx_mpx_linux;
-     case X86_XSTATE_AVX_MASK:
-       if (gdbarch_ptr_bit (gdbarch) == 32)
- 	return tdesc_x32_avx_linux;
-@@ -2285,6 +2291,7 @@ _initialize_amd64_linux_tdep (void)
-   initialize_tdesc_amd64_linux ();
-   initialize_tdesc_amd64_avx_linux ();
-   initialize_tdesc_amd64_mpx_linux ();
-+  initialize_tdesc_amd64_avx_mpx_linux ();
-   initialize_tdesc_amd64_avx512_linux ();
-
-   initialize_tdesc_x32_linux ();
-diff --git a/gdb/amd64-linux-tdep.h b/gdb/amd64-linux-tdep.h
-index 8673442..d64d5d6 100644
---- a/gdb/amd64-linux-tdep.h
-+++ b/gdb/amd64-linux-tdep.h
-@@ -35,6 +35,7 @@
- extern struct target_desc *tdesc_amd64_linux;
- extern struct target_desc *tdesc_amd64_avx_linux;
- extern struct target_desc *tdesc_amd64_mpx_linux;
-+extern struct target_desc *tdesc_amd64_avx_mpx_linux;
- extern struct target_desc *tdesc_amd64_avx512_linux;
-
- extern struct target_desc *tdesc_x32_linux;
-diff --git a/gdb/amd64-tdep.c b/gdb/amd64-tdep.c
-index fae92b2..88e3bf8 100644
---- a/gdb/amd64-tdep.c
-+++ b/gdb/amd64-tdep.c
-@@ -44,6 +44,7 @@
- #include "features/i386/amd64.c"
- #include "features/i386/amd64-avx.c"
- #include "features/i386/amd64-mpx.c"
-+#include "features/i386/amd64-avx-mpx.c"
- #include "features/i386/amd64-avx512.c"
-
- #include "features/i386/x32.c"
-@@ -3132,6 +3133,8 @@ amd64_target_description (uint64_t xcr0)
-       return tdesc_amd64_avx512;
-     case X86_XSTATE_MPX_MASK:
-       return tdesc_amd64_mpx;
-+    case X86_XSTATE_AVX_MPX_MASK:
-+      return tdesc_amd64_avx_mpx;
-     case X86_XSTATE_AVX_MASK:
-       return tdesc_amd64_avx;
-     default:
-@@ -3148,6 +3151,7 @@ _initialize_amd64_tdep (void)
-   initialize_tdesc_amd64 ();
-   initialize_tdesc_amd64_avx ();
-   initialize_tdesc_amd64_mpx ();
-+  initialize_tdesc_amd64_avx_mpx ();
-   initialize_tdesc_amd64_avx512 ();
-
-   initialize_tdesc_x32 ();
-diff --git a/gdb/common/x86-xstate.h b/gdb/common/x86-xstate.h
-index 8386420..0aa9164 100644
---- a/gdb/common/x86-xstate.h
-+++ b/gdb/common/x86-xstate.h
-@@ -39,9 +39,10 @@
- #define X86_XSTATE_X87_MASK	X86_XSTATE_X87
- #define X86_XSTATE_SSE_MASK	(X86_XSTATE_X87 | X86_XSTATE_SSE)
- #define X86_XSTATE_AVX_MASK	(X86_XSTATE_SSE_MASK | X86_XSTATE_AVX)
--#define X86_XSTATE_MPX_MASK	(X86_XSTATE_AVX_MASK | X86_XSTATE_MPX)
-+#define X86_XSTATE_MPX_MASK	(X86_XSTATE_SSE_MASK | X86_XSTATE_MPX)
-+#define X86_XSTATE_AVX_MPX_MASK	(X86_XSTATE_AVX_MASK | X86_XSTATE_MPX)
- #define X86_XSTATE_AVX512_MASK	(X86_XSTATE_AVX_MASK | X86_XSTATE_AVX512)
--#define X86_XSTATE_MPX_AVX512_MASK (X86_XSTATE_MPX_MASK | X86_XSTATE_AVX512)
-+#define X86_XSTATE_MPX_AVX512_MASK (X86_XSTATE_AVX_MPX_MASK | X86_XSTATE_AVX512)
-
- #define X86_XSTATE_ALL_MASK	(X86_XSTATE_MPX_AVX512_MASK)
-
-diff --git a/gdb/features/Makefile b/gdb/features/Makefile
-index 10173cf..e5c5154 100644
---- a/gdb/features/Makefile
-+++ b/gdb/features/Makefile
-@@ -50,9 +50,11 @@ WHICH = aarch64 \
- 	i386/amd64 i386/amd64-linux \
- 	i386/i386-avx i386/i386-avx-linux \
- 	i386/i386-mpx i386/i386-mpx-linux \
-+	i386/i386-avx-mpx i386/i386-avx-mpx-linux \
- 	i386/i386-avx512 i386/i386-avx512-linux \
- 	i386/amd64-avx i386/amd64-avx-linux \
- 	i386/amd64-mpx i386/amd64-mpx-linux \
-+	i386/amd64-avx-mpx i386/amd64-avx-mpx-linux \
- 	i386/amd64-avx512 i386/amd64-avx512-linux \
- 	i386/x32 i386/x32-linux \
- 	i386/x32-avx i386/x32-avx-linux \
-@@ -83,7 +85,9 @@ i386/amd64-linux-expedite = rbp,rsp,rip
- i386/i386-avx-expedite = ebp,esp,eip
- i386/i386-avx-linux-expedite = ebp,esp,eip
- i386/i386-mpx-expedite = ebp,esp,eip
-+i386/i386-avx-mpx-expedite = ebp,esp,eip
- i386/i386-mpx-linux-expedite = ebp,esp,eip
-+i386/i386-avx-mpx-linux-expedite = ebp,esp,eip
- i386/i386-avx512-expedite = ebp,esp,eip
- i386/i386-avx512-linux-expedite = ebp,esp,eip
- i386/i386-mmx-expedite = ebp,esp,eip
-@@ -91,7 +95,9 @@ i386/i386-mmx-linux-expedite = ebp,esp,eip
- i386/amd64-avx-expedite = rbp,rsp,rip
- i386/amd64-avx-linux-expedite = rbp,rsp,rip
- i386/amd64-mpx-expedite = rbp,rsp,rip
-+i386/amd64-avx-mpx-expedite = rbp,rsp,rip
- i386/amd64-mpx-linux-expedite = rbp,rsp,rip
-+i386/amd64-avx-mpx-linux-expedite = rbp,rsp,rip
- i386/amd64-avx512-expedite = rbp,rsp,rip
- i386/amd64-avx512-linux-expedite = rbp,rsp,rip
- i386/x32-expedite = rbp,rsp,rip
-@@ -156,6 +162,8 @@ XMLTOC = \
- 	i386/amd64-linux.xml \
- 	i386/amd64-mpx-linux.xml \
- 	i386/amd64-mpx.xml \
-+	i386/amd64-avx-mpx-linux.xml \
-+	i386/amd64-avx-mpx.xml \
- 	i386/amd64.xml \
- 	i386/i386-avx-linux.xml \
- 	i386/i386-avx.xml \
-@@ -166,6 +174,8 @@ XMLTOC = \
- 	i386/i386-mmx.xml \
- 	i386/i386-mpx-linux.xml \
- 	i386/i386-mpx.xml \
-+	i386/i386-avx-mpx-linux.xml \
-+	i386/i386-avx-mpx.xml \
- 	i386/i386.xml \
- 	i386/x32-avx-linux.xml \
- 	i386/x32-avx.xml \
-@@ -271,6 +281,10 @@ $(outdir)/i386/i386-mpx.dat: i386/32bit-core.xml i386/32bit-avx.xml \
- 			       i386/32bit-mpx.xml
- $(outdir)/i386/i386-mpx-linux.dat: i386/32bit-core.xml 	i386/32bit-avx.xml \
- 			       i386/32bit-linux.xml i386/32bit-mpx.xml
-+$(outdir)/i386/i386-mpx-linux.dat: i386/32bit-core.xml \
-+			       i386/32bit-linux.xml i386/32bit-mpx.xml
-+$(outdir)/i386/i386-avx-mpx-linux.dat: i386/32bit-core.xml \
-+			       i386/32bit-linux.xml i386/32bit-mpx.xml
- $(outdir)/i386/i386-avx512.dat: i386/32bit-core.xml i386/32bit-avx.xml \
- 			       i386/32bit-mpx.xml i386/32bit-avx512.xml
- $(outdir)/i386/i386-avx512-linux.dat: i386/32bit-core.xml i386/32bit-avx.xml \
-@@ -282,8 +296,12 @@ $(outdir)/i386/amd64-avx-linux.dat: i386/64bit-core.xml i386/64bit-avx.xml \
- 				    i386/64bit-linux.xml
- $(outdir)/i386/amd64-mpx-linux.dat: i386/64bit-core.xml i386/64bit-avx.xml \
- 			       i386/64bit-linux.xml i386/64bit-mpx.xml
-+$(outdir)/i386/amd64-avx-mpx-linux.dat: i386/64bit-core.xml \
-+			       i386/64bit-linux.xml i386/64bit-mpx.xml
- $(outdir)/i386/amd64-mpx.dat: i386/64bit-core.xml i386/64bit-avx.xml \
- 			       i386/64bit-mpx.xml
-+$(outdir)/i386/amd64-avx-mpx.dat: i386/64bit-core.xml \
-+			       i386/64bit-mpx.xml
- $(outdir)/i386/amd64-avx512.dat: i386/64bit-core.xml i386/64bit-avx.xml \
- 			       i386/64bit-mpx.xml i386/64bit-avx512.xml
- $(outdir)/i386/amd64-avx512-linux.dat: i386/64bit-core.xml i386/64bit-avx.xml \
-diff --git a/gdb/features/i386/amd64-avx-mpx-linux.c b/gdb/features/i386/amd64-avx-mpx-linux.c
-new file mode 100644
-index 0000000..37b4c81
---- /dev/null
-+++ b/gdb/features/i386/amd64-avx-mpx-linux.c
-@@ -0,0 +1,211 @@
-+/* THIS FILE IS GENERATED.  -*- buffer-read-only: t -*- vi:set ro:
-+  Original: amd64-avx-mpx-linux.xml */
-+
-+#include "defs.h"
-+#include "osabi.h"
-+#include "target-descriptions.h"
-+
-+struct target_desc *tdesc_amd64_avx_mpx_linux;
-+static void
-+initialize_tdesc_amd64_avx_mpx_linux (void)
-+{
-+  struct target_desc *result = allocate_target_description ();
-+  struct tdesc_feature *feature;
-+  struct tdesc_type *field_type;
-+  struct tdesc_type *type;
-+
-+  set_tdesc_architecture (result, bfd_scan_arch ("i386:x86-64"));
-+
-+  set_tdesc_osabi (result, osabi_from_tdesc_string ("GNU/Linux"));
-+
-+  feature = tdesc_create_feature (result, "org.gnu.gdb.i386.core");
-+  field_type = tdesc_create_flags (feature, "i386_eflags", 4);
-+  tdesc_add_flag (field_type, 0, "CF");
-+  tdesc_add_flag (field_type, 1, "");
-+  tdesc_add_flag (field_type, 2, "PF");
-+  tdesc_add_flag (field_type, 4, "AF");
-+  tdesc_add_flag (field_type, 6, "ZF");
-+  tdesc_add_flag (field_type, 7, "SF");
-+  tdesc_add_flag (field_type, 8, "TF");
-+  tdesc_add_flag (field_type, 9, "IF");
-+  tdesc_add_flag (field_type, 10, "DF");
-+  tdesc_add_flag (field_type, 11, "OF");
-+  tdesc_add_flag (field_type, 14, "NT");
-+  tdesc_add_flag (field_type, 16, "RF");
-+  tdesc_add_flag (field_type, 17, "VM");
-+  tdesc_add_flag (field_type, 18, "AC");
-+  tdesc_add_flag (field_type, 19, "VIF");
-+  tdesc_add_flag (field_type, 20, "VIP");
-+  tdesc_add_flag (field_type, 21, "ID");
-+
-+  tdesc_create_reg (feature, "rax", 0, 1, NULL, 64, "int64");
-+  tdesc_create_reg (feature, "rbx", 1, 1, NULL, 64, "int64");
-+  tdesc_create_reg (feature, "rcx", 2, 1, NULL, 64, "int64");
-+  tdesc_create_reg (feature, "rdx", 3, 1, NULL, 64, "int64");
-+  tdesc_create_reg (feature, "rsi", 4, 1, NULL, 64, "int64");
-+  tdesc_create_reg (feature, "rdi", 5, 1, NULL, 64, "int64");
-+  tdesc_create_reg (feature, "rbp", 6, 1, NULL, 64, "data_ptr");
-+  tdesc_create_reg (feature, "rsp", 7, 1, NULL, 64, "data_ptr");
-+  tdesc_create_reg (feature, "r8", 8, 1, NULL, 64, "int64");
-+  tdesc_create_reg (feature, "r9", 9, 1, NULL, 64, "int64");
-+  tdesc_create_reg (feature, "r10", 10, 1, NULL, 64, "int64");
-+  tdesc_create_reg (feature, "r11", 11, 1, NULL, 64, "int64");
-+  tdesc_create_reg (feature, "r12", 12, 1, NULL, 64, "int64");
-+  tdesc_create_reg (feature, "r13", 13, 1, NULL, 64, "int64");
-+  tdesc_create_reg (feature, "r14", 14, 1, NULL, 64, "int64");
-+  tdesc_create_reg (feature, "r15", 15, 1, NULL, 64, "int64");
-+  tdesc_create_reg (feature, "rip", 16, 1, NULL, 64, "code_ptr");
-+  tdesc_create_reg (feature, "eflags", 17, 1, NULL, 32, "i386_eflags");
-+  tdesc_create_reg (feature, "cs", 18, 1, NULL, 32, "int32");
-+  tdesc_create_reg (feature, "ss", 19, 1, NULL, 32, "int32");
-+  tdesc_create_reg (feature, "ds", 20, 1, NULL, 32, "int32");
-+  tdesc_create_reg (feature, "es", 21, 1, NULL, 32, "int32");
-+  tdesc_create_reg (feature, "fs", 22, 1, NULL, 32, "int32");
-+  tdesc_create_reg (feature, "gs", 23, 1, NULL, 32, "int32");
-+  tdesc_create_reg (feature, "st0", 24, 1, NULL, 80, "i387_ext");
-+  tdesc_create_reg (feature, "st1", 25, 1, NULL, 80, "i387_ext");
-+  tdesc_create_reg (feature, "st2", 26, 1, NULL, 80, "i387_ext");
-+  tdesc_create_reg (feature, "st3", 27, 1, NULL, 80, "i387_ext");
-+  tdesc_create_reg (feature, "st4", 28, 1, NULL, 80, "i387_ext");
-+  tdesc_create_reg (feature, "st5", 29, 1, NULL, 80, "i387_ext");
-+  tdesc_create_reg (feature, "st6", 30, 1, NULL, 80, "i387_ext");
-+  tdesc_create_reg (feature, "st7", 31, 1, NULL, 80, "i387_ext");
-+  tdesc_create_reg (feature, "fctrl", 32, 1, "float", 32, "int");
-+  tdesc_create_reg (feature, "fstat", 33, 1, "float", 32, "int");
-+  tdesc_create_reg (feature, "ftag", 34, 1, "float", 32, "int");
-+  tdesc_create_reg (feature, "fiseg", 35, 1, "float", 32, "int");
-+  tdesc_create_reg (feature, "fioff", 36, 1, "float", 32, "int");
-+  tdesc_create_reg (feature, "foseg", 37, 1, "float", 32, "int");
-+  tdesc_create_reg (feature, "fooff", 38, 1, "float", 32, "int");
-+  tdesc_create_reg (feature, "fop", 39, 1, "float", 32, "int");
-+
-+  feature = tdesc_create_feature (result, "org.gnu.gdb.i386.sse");
-+  field_type = tdesc_named_type (feature, "ieee_single");
-+  tdesc_create_vector (feature, "v4f", field_type, 4);
-+
-+  field_type = tdesc_named_type (feature, "ieee_double");
-+  tdesc_create_vector (feature, "v2d", field_type, 2);
-+
-+  field_type = tdesc_named_type (feature, "int8");
-+  tdesc_create_vector (feature, "v16i8", field_type, 16);
-+
-+  field_type = tdesc_named_type (feature, "int16");
-+  tdesc_create_vector (feature, "v8i16", field_type, 8);
-+
-+  field_type = tdesc_named_type (feature, "int32");
-+  tdesc_create_vector (feature, "v4i32", field_type, 4);
-+
-+  field_type = tdesc_named_type (feature, "int64");
-+  tdesc_create_vector (feature, "v2i64", field_type, 2);
-+
-+  type = tdesc_create_union (feature, "vec128");
-+  field_type = tdesc_named_type (feature, "v4f");
-+  tdesc_add_field (type, "v4_float", field_type);
-+  field_type = tdesc_named_type (feature, "v2d");
-+  tdesc_add_field (type, "v2_double", field_type);
-+  field_type = tdesc_named_type (feature, "v16i8");
-+  tdesc_add_field (type, "v16_int8", field_type);
-+  field_type = tdesc_named_type (feature, "v8i16");
-+  tdesc_add_field (type, "v8_int16", field_type);
-+  field_type = tdesc_named_type (feature, "v4i32");
-+  tdesc_add_field (type, "v4_int32", field_type);
-+  field_type = tdesc_named_type (feature, "v2i64");
-+  tdesc_add_field (type, "v2_int64", field_type);
-+  field_type = tdesc_named_type (feature, "uint128");
-+  tdesc_add_field (type, "uint128", field_type);
-+
-+  field_type = tdesc_create_flags (feature, "i386_mxcsr", 4);
-+  tdesc_add_flag (field_type, 0, "IE");
-+  tdesc_add_flag (field_type, 1, "DE");
-+  tdesc_add_flag (field_type, 2, "ZE");
-+  tdesc_add_flag (field_type, 3, "OE");
-+  tdesc_add_flag (field_type, 4, "UE");
-+  tdesc_add_flag (field_type, 5, "PE");
-+  tdesc_add_flag (field_type, 6, "DAZ");
-+  tdesc_add_flag (field_type, 7, "IM");
-+  tdesc_add_flag (field_type, 8, "DM");
-+  tdesc_add_flag (field_type, 9, "ZM");
-+  tdesc_add_flag (field_type, 10, "OM");
-+  tdesc_add_flag (field_type, 11, "UM");
-+  tdesc_add_flag (field_type, 12, "PM");
-+  tdesc_add_flag (field_type, 15, "FZ");
-+
-+  tdesc_create_reg (feature, "xmm0", 40, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "xmm1", 41, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "xmm2", 42, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "xmm3", 43, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "xmm4", 44, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "xmm5", 45, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "xmm6", 46, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "xmm7", 47, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "xmm8", 48, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "xmm9", 49, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "xmm10", 50, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "xmm11", 51, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "xmm12", 52, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "xmm13", 53, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "xmm14", 54, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "xmm15", 55, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "mxcsr", 56, 1, "vector", 32, "i386_mxcsr");
-+
-+  feature = tdesc_create_feature (result, "org.gnu.gdb.i386.linux");
-+  tdesc_create_reg (feature, "orig_rax", 57, 1, NULL, 64, "int");
-+
-+  feature = tdesc_create_feature (result, "org.gnu.gdb.i386.avx");
-+  tdesc_create_reg (feature, "ymm0h", 58, 1, NULL, 128, "uint128");
-+  tdesc_create_reg (feature, "ymm1h", 59, 1, NULL, 128, "uint128");
-+  tdesc_create_reg (feature, "ymm2h", 60, 1, NULL, 128, "uint128");
-+  tdesc_create_reg (feature, "ymm3h", 61, 1, NULL, 128, "uint128");
-+  tdesc_create_reg (feature, "ymm4h", 62, 1, NULL, 128, "uint128");
-+  tdesc_create_reg (feature, "ymm5h", 63, 1, NULL, 128, "uint128");
-+  tdesc_create_reg (feature, "ymm6h", 64, 1, NULL, 128, "uint128");
-+  tdesc_create_reg (feature, "ymm7h", 65, 1, NULL, 128, "uint128");
-+  tdesc_create_reg (feature, "ymm8h", 66, 1, NULL, 128, "uint128");
-+  tdesc_create_reg (feature, "ymm9h", 67, 1, NULL, 128, "uint128");
-+  tdesc_create_reg (feature, "ymm10h", 68, 1, NULL, 128, "uint128");
-+  tdesc_create_reg (feature, "ymm11h", 69, 1, NULL, 128, "uint128");
-+  tdesc_create_reg (feature, "ymm12h", 70, 1, NULL, 128, "uint128");
-+  tdesc_create_reg (feature, "ymm13h", 71, 1, NULL, 128, "uint128");
-+  tdesc_create_reg (feature, "ymm14h", 72, 1, NULL, 128, "uint128");
-+  tdesc_create_reg (feature, "ymm15h", 73, 1, NULL, 128, "uint128");
-+
-+  feature = tdesc_create_feature (result, "org.gnu.gdb.i386.mpx");
-+  type = tdesc_create_struct (feature, "br128");
-+  field_type = tdesc_named_type (feature, "uint64");
-+  tdesc_add_field (type, "lbound", field_type);
-+  field_type = tdesc_named_type (feature, "uint64");
-+  tdesc_add_field (type, "ubound_raw", field_type);
-+
-+  type = tdesc_create_struct (feature, "_bndstatus");
-+  tdesc_set_struct_size (type, 8);
-+  tdesc_add_bitfield (type, "bde", 2, 63);
-+  tdesc_add_bitfield (type, "error", 0, 1);
-+
-+  type = tdesc_create_union (feature, "status");
-+  field_type = tdesc_named_type (feature, "data_ptr");
-+  tdesc_add_field (type, "raw", field_type);
-+  field_type = tdesc_named_type (feature, "_bndstatus");
-+  tdesc_add_field (type, "status", field_type);
-+
-+  type = tdesc_create_struct (feature, "_bndcfgu");
-+  tdesc_set_struct_size (type, 8);
-+  tdesc_add_bitfield (type, "base", 12, 63);
-+  tdesc_add_bitfield (type, "reserved", 2, 11);
-+  tdesc_add_bitfield (type, "preserved", 1, 1);
-+  tdesc_add_bitfield (type, "enabled", 0, 0);
-+
-+  type = tdesc_create_union (feature, "cfgu");
-+  field_type = tdesc_named_type (feature, "data_ptr");
-+  tdesc_add_field (type, "raw", field_type);
-+  field_type = tdesc_named_type (feature, "_bndcfgu");
-+  tdesc_add_field (type, "config", field_type);
-+
-+  tdesc_create_reg (feature, "bnd0raw", 74, 1, NULL, 128, "br128");
-+  tdesc_create_reg (feature, "bnd1raw", 75, 1, NULL, 128, "br128");
-+  tdesc_create_reg (feature, "bnd2raw", 76, 1, NULL, 128, "br128");
-+  tdesc_create_reg (feature, "bnd3raw", 77, 1, NULL, 128, "br128");
-+  tdesc_create_reg (feature, "bndcfgu", 78, 1, NULL, 64, "cfgu");
-+  tdesc_create_reg (feature, "bndstatus", 79, 1, NULL, 64, "status");
-+
-+  tdesc_amd64_avx_mpx_linux = result;
-+}
-diff --git a/gdb/features/i386/amd64-avx-mpx-linux.xml b/gdb/features/i386/amd64-avx-mpx-linux.xml
-new file mode 100644
-index 0000000..526c700
---- /dev/null
-+++ b/gdb/features/i386/amd64-avx-mpx-linux.xml
-@@ -0,0 +1,19 @@
-+<?xml version="1.0"?>
-+<!-- Copyright (C) 2013-2016 Free Software Foundation, Inc.
-+
-+     Copying and distribution of this file, with or without modification,
-+     are permitted in any medium without royalty provided the copyright
-+     notice and this notice are preserved.  -->
-+
-+<!-- AMD64 with AVX and MPX - Includes Linux-only special "register".  -->
-+
-+<!DOCTYPE target SYSTEM "gdb-target.dtd">
-+<target>
-+  <architecture>i386:x86-64</architecture>
-+  <osabi>GNU/Linux</osabi>
-+  <xi:include href="64bit-core.xml"/>
-+  <xi:include href="64bit-sse.xml"/>
-+  <xi:include href="64bit-linux.xml"/>
-+  <xi:include href="64bit-avx.xml"/>
-+  <xi:include href="64bit-mpx.xml"/>
-+</target>
-diff --git a/gdb/features/i386/amd64-avx-mpx.c b/gdb/features/i386/amd64-avx-mpx.c
-new file mode 100644
-index 0000000..1279f73
---- /dev/null
-+++ b/gdb/features/i386/amd64-avx-mpx.c
-@@ -0,0 +1,206 @@
-+/* THIS FILE IS GENERATED.  -*- buffer-read-only: t -*- vi:set ro:
-+  Original: amd64-avx-mpx.xml */
-+
-+#include "defs.h"
-+#include "osabi.h"
-+#include "target-descriptions.h"
-+
-+struct target_desc *tdesc_amd64_avx_mpx;
-+static void
-+initialize_tdesc_amd64_avx_mpx (void)
-+{
-+  struct target_desc *result = allocate_target_description ();
-+  struct tdesc_feature *feature;
-+  struct tdesc_type *field_type;
-+  struct tdesc_type *type;
-+
-+  set_tdesc_architecture (result, bfd_scan_arch ("i386:x86-64"));
-+
-+  feature = tdesc_create_feature (result, "org.gnu.gdb.i386.core");
-+  field_type = tdesc_create_flags (feature, "i386_eflags", 4);
-+  tdesc_add_flag (field_type, 0, "CF");
-+  tdesc_add_flag (field_type, 1, "");
-+  tdesc_add_flag (field_type, 2, "PF");
-+  tdesc_add_flag (field_type, 4, "AF");
-+  tdesc_add_flag (field_type, 6, "ZF");
-+  tdesc_add_flag (field_type, 7, "SF");
-+  tdesc_add_flag (field_type, 8, "TF");
-+  tdesc_add_flag (field_type, 9, "IF");
-+  tdesc_add_flag (field_type, 10, "DF");
-+  tdesc_add_flag (field_type, 11, "OF");
-+  tdesc_add_flag (field_type, 14, "NT");
-+  tdesc_add_flag (field_type, 16, "RF");
-+  tdesc_add_flag (field_type, 17, "VM");
-+  tdesc_add_flag (field_type, 18, "AC");
-+  tdesc_add_flag (field_type, 19, "VIF");
-+  tdesc_add_flag (field_type, 20, "VIP");
-+  tdesc_add_flag (field_type, 21, "ID");
-+
-+  tdesc_create_reg (feature, "rax", 0, 1, NULL, 64, "int64");
-+  tdesc_create_reg (feature, "rbx", 1, 1, NULL, 64, "int64");
-+  tdesc_create_reg (feature, "rcx", 2, 1, NULL, 64, "int64");
-+  tdesc_create_reg (feature, "rdx", 3, 1, NULL, 64, "int64");
-+  tdesc_create_reg (feature, "rsi", 4, 1, NULL, 64, "int64");
-+  tdesc_create_reg (feature, "rdi", 5, 1, NULL, 64, "int64");
-+  tdesc_create_reg (feature, "rbp", 6, 1, NULL, 64, "data_ptr");
-+  tdesc_create_reg (feature, "rsp", 7, 1, NULL, 64, "data_ptr");
-+  tdesc_create_reg (feature, "r8", 8, 1, NULL, 64, "int64");
-+  tdesc_create_reg (feature, "r9", 9, 1, NULL, 64, "int64");
-+  tdesc_create_reg (feature, "r10", 10, 1, NULL, 64, "int64");
-+  tdesc_create_reg (feature, "r11", 11, 1, NULL, 64, "int64");
-+  tdesc_create_reg (feature, "r12", 12, 1, NULL, 64, "int64");
-+  tdesc_create_reg (feature, "r13", 13, 1, NULL, 64, "int64");
-+  tdesc_create_reg (feature, "r14", 14, 1, NULL, 64, "int64");
-+  tdesc_create_reg (feature, "r15", 15, 1, NULL, 64, "int64");
-+  tdesc_create_reg (feature, "rip", 16, 1, NULL, 64, "code_ptr");
-+  tdesc_create_reg (feature, "eflags", 17, 1, NULL, 32, "i386_eflags");
-+  tdesc_create_reg (feature, "cs", 18, 1, NULL, 32, "int32");
-+  tdesc_create_reg (feature, "ss", 19, 1, NULL, 32, "int32");
-+  tdesc_create_reg (feature, "ds", 20, 1, NULL, 32, "int32");
-+  tdesc_create_reg (feature, "es", 21, 1, NULL, 32, "int32");
-+  tdesc_create_reg (feature, "fs", 22, 1, NULL, 32, "int32");
-+  tdesc_create_reg (feature, "gs", 23, 1, NULL, 32, "int32");
-+  tdesc_create_reg (feature, "st0", 24, 1, NULL, 80, "i387_ext");
-+  tdesc_create_reg (feature, "st1", 25, 1, NULL, 80, "i387_ext");
-+  tdesc_create_reg (feature, "st2", 26, 1, NULL, 80, "i387_ext");
-+  tdesc_create_reg (feature, "st3", 27, 1, NULL, 80, "i387_ext");
-+  tdesc_create_reg (feature, "st4", 28, 1, NULL, 80, "i387_ext");
-+  tdesc_create_reg (feature, "st5", 29, 1, NULL, 80, "i387_ext");
-+  tdesc_create_reg (feature, "st6", 30, 1, NULL, 80, "i387_ext");
-+  tdesc_create_reg (feature, "st7", 31, 1, NULL, 80, "i387_ext");
-+  tdesc_create_reg (feature, "fctrl", 32, 1, "float", 32, "int");
-+  tdesc_create_reg (feature, "fstat", 33, 1, "float", 32, "int");
-+  tdesc_create_reg (feature, "ftag", 34, 1, "float", 32, "int");
-+  tdesc_create_reg (feature, "fiseg", 35, 1, "float", 32, "int");
-+  tdesc_create_reg (feature, "fioff", 36, 1, "float", 32, "int");
-+  tdesc_create_reg (feature, "foseg", 37, 1, "float", 32, "int");
-+  tdesc_create_reg (feature, "fooff", 38, 1, "float", 32, "int");
-+  tdesc_create_reg (feature, "fop", 39, 1, "float", 32, "int");
-+
-+  feature = tdesc_create_feature (result, "org.gnu.gdb.i386.sse");
-+  field_type = tdesc_named_type (feature, "ieee_single");
-+  tdesc_create_vector (feature, "v4f", field_type, 4);
-+
-+  field_type = tdesc_named_type (feature, "ieee_double");
-+  tdesc_create_vector (feature, "v2d", field_type, 2);
-+
-+  field_type = tdesc_named_type (feature, "int8");
-+  tdesc_create_vector (feature, "v16i8", field_type, 16);
-+
-+  field_type = tdesc_named_type (feature, "int16");
-+  tdesc_create_vector (feature, "v8i16", field_type, 8);
-+
-+  field_type = tdesc_named_type (feature, "int32");
-+  tdesc_create_vector (feature, "v4i32", field_type, 4);
-+
-+  field_type = tdesc_named_type (feature, "int64");
-+  tdesc_create_vector (feature, "v2i64", field_type, 2);
-+
-+  type = tdesc_create_union (feature, "vec128");
-+  field_type = tdesc_named_type (feature, "v4f");
-+  tdesc_add_field (type, "v4_float", field_type);
-+  field_type = tdesc_named_type (feature, "v2d");
-+  tdesc_add_field (type, "v2_double", field_type);
-+  field_type = tdesc_named_type (feature, "v16i8");
-+  tdesc_add_field (type, "v16_int8", field_type);
-+  field_type = tdesc_named_type (feature, "v8i16");
-+  tdesc_add_field (type, "v8_int16", field_type);
-+  field_type = tdesc_named_type (feature, "v4i32");
-+  tdesc_add_field (type, "v4_int32", field_type);
-+  field_type = tdesc_named_type (feature, "v2i64");
-+  tdesc_add_field (type, "v2_int64", field_type);
-+  field_type = tdesc_named_type (feature, "uint128");
-+  tdesc_add_field (type, "uint128", field_type);
-+
-+  field_type = tdesc_create_flags (feature, "i386_mxcsr", 4);
-+  tdesc_add_flag (field_type, 0, "IE");
-+  tdesc_add_flag (field_type, 1, "DE");
-+  tdesc_add_flag (field_type, 2, "ZE");
-+  tdesc_add_flag (field_type, 3, "OE");
-+  tdesc_add_flag (field_type, 4, "UE");
-+  tdesc_add_flag (field_type, 5, "PE");
-+  tdesc_add_flag (field_type, 6, "DAZ");
-+  tdesc_add_flag (field_type, 7, "IM");
-+  tdesc_add_flag (field_type, 8, "DM");
-+  tdesc_add_flag (field_type, 9, "ZM");
-+  tdesc_add_flag (field_type, 10, "OM");
-+  tdesc_add_flag (field_type, 11, "UM");
-+  tdesc_add_flag (field_type, 12, "PM");
-+  tdesc_add_flag (field_type, 15, "FZ");
-+
-+  tdesc_create_reg (feature, "xmm0", 40, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "xmm1", 41, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "xmm2", 42, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "xmm3", 43, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "xmm4", 44, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "xmm5", 45, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "xmm6", 46, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "xmm7", 47, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "xmm8", 48, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "xmm9", 49, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "xmm10", 50, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "xmm11", 51, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "xmm12", 52, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "xmm13", 53, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "xmm14", 54, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "xmm15", 55, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "mxcsr", 56, 1, "vector", 32, "i386_mxcsr");
-+
-+  feature = tdesc_create_feature (result, "org.gnu.gdb.i386.avx");
-+  tdesc_create_reg (feature, "ymm0h", 57, 1, NULL, 128, "uint128");
-+  tdesc_create_reg (feature, "ymm1h", 58, 1, NULL, 128, "uint128");
-+  tdesc_create_reg (feature, "ymm2h", 59, 1, NULL, 128, "uint128");
-+  tdesc_create_reg (feature, "ymm3h", 60, 1, NULL, 128, "uint128");
-+  tdesc_create_reg (feature, "ymm4h", 61, 1, NULL, 128, "uint128");
-+  tdesc_create_reg (feature, "ymm5h", 62, 1, NULL, 128, "uint128");
-+  tdesc_create_reg (feature, "ymm6h", 63, 1, NULL, 128, "uint128");
-+  tdesc_create_reg (feature, "ymm7h", 64, 1, NULL, 128, "uint128");
-+  tdesc_create_reg (feature, "ymm8h", 65, 1, NULL, 128, "uint128");
-+  tdesc_create_reg (feature, "ymm9h", 66, 1, NULL, 128, "uint128");
-+  tdesc_create_reg (feature, "ymm10h", 67, 1, NULL, 128, "uint128");
-+  tdesc_create_reg (feature, "ymm11h", 68, 1, NULL, 128, "uint128");
-+  tdesc_create_reg (feature, "ymm12h", 69, 1, NULL, 128, "uint128");
-+  tdesc_create_reg (feature, "ymm13h", 70, 1, NULL, 128, "uint128");
-+  tdesc_create_reg (feature, "ymm14h", 71, 1, NULL, 128, "uint128");
-+  tdesc_create_reg (feature, "ymm15h", 72, 1, NULL, 128, "uint128");
-+
-+  feature = tdesc_create_feature (result, "org.gnu.gdb.i386.mpx");
-+  type = tdesc_create_struct (feature, "br128");
-+  field_type = tdesc_named_type (feature, "uint64");
-+  tdesc_add_field (type, "lbound", field_type);
-+  field_type = tdesc_named_type (feature, "uint64");
-+  tdesc_add_field (type, "ubound_raw", field_type);
-+
-+  type = tdesc_create_struct (feature, "_bndstatus");
-+  tdesc_set_struct_size (type, 8);
-+  tdesc_add_bitfield (type, "bde", 2, 63);
-+  tdesc_add_bitfield (type, "error", 0, 1);
-+
-+  type = tdesc_create_union (feature, "status");
-+  field_type = tdesc_named_type (feature, "data_ptr");
-+  tdesc_add_field (type, "raw", field_type);
-+  field_type = tdesc_named_type (feature, "_bndstatus");
-+  tdesc_add_field (type, "status", field_type);
-+
-+  type = tdesc_create_struct (feature, "_bndcfgu");
-+  tdesc_set_struct_size (type, 8);
-+  tdesc_add_bitfield (type, "base", 12, 63);
-+  tdesc_add_bitfield (type, "reserved", 2, 11);
-+  tdesc_add_bitfield (type, "preserved", 1, 1);
-+  tdesc_add_bitfield (type, "enabled", 0, 0);
-+
-+  type = tdesc_create_union (feature, "cfgu");
-+  field_type = tdesc_named_type (feature, "data_ptr");
-+  tdesc_add_field (type, "raw", field_type);
-+  field_type = tdesc_named_type (feature, "_bndcfgu");
-+  tdesc_add_field (type, "config", field_type);
-+
-+  tdesc_create_reg (feature, "bnd0raw", 73, 1, NULL, 128, "br128");
-+  tdesc_create_reg (feature, "bnd1raw", 74, 1, NULL, 128, "br128");
-+  tdesc_create_reg (feature, "bnd2raw", 75, 1, NULL, 128, "br128");
-+  tdesc_create_reg (feature, "bnd3raw", 76, 1, NULL, 128, "br128");
-+  tdesc_create_reg (feature, "bndcfgu", 77, 1, NULL, 64, "cfgu");
-+  tdesc_create_reg (feature, "bndstatus", 78, 1, NULL, 64, "status");
-+
-+  tdesc_amd64_avx_mpx = result;
-+}
-diff --git a/gdb/features/i386/amd64-avx-mpx.xml b/gdb/features/i386/amd64-avx-mpx.xml
-new file mode 100644
-index 0000000..3eea6dd
---- /dev/null
-+++ b/gdb/features/i386/amd64-avx-mpx.xml
-@@ -0,0 +1,17 @@
-+<?xml version="1.0"?>
-+<!-- Copyright (C) 2013-2016 Free Software Foundation, Inc.
-+
-+     Copying and distribution of this file, with or without modification,
-+     are permitted in any medium without royalty provided the copyright
-+     notice and this notice are preserved.  -->
-+
-+<!-- AMD64 with AVX and MPX -->
-+
-+<!DOCTYPE target SYSTEM "gdb-target.dtd">
-+<target>
-+  <architecture>i386:x86-64</architecture>
-+  <xi:include href="64bit-core.xml"/>
-+  <xi:include href="64bit-sse.xml"/>
-+  <xi:include href="64bit-avx.xml"/>
-+  <xi:include href="64bit-mpx.xml"/>
-+</target>
-diff --git a/gdb/features/i386/amd64-mpx-linux.c b/gdb/features/i386/amd64-mpx-linux.c
-index 86a1774..5c1584b 100644
---- a/gdb/features/i386/amd64-mpx-linux.c
-+++ b/gdb/features/i386/amd64-mpx-linux.c
-@@ -151,24 +151,6 @@ initialize_tdesc_amd64_mpx_linux (void)
-   feature = tdesc_create_feature (result, "org.gnu.gdb.i386.linux");
-   tdesc_create_reg (feature, "orig_rax", 57, 1, NULL, 64, "int");
-
--  feature = tdesc_create_feature (result, "org.gnu.gdb.i386.avx");
--  tdesc_create_reg (feature, "ymm0h", 58, 1, NULL, 128, "uint128");
--  tdesc_create_reg (feature, "ymm1h", 59, 1, NULL, 128, "uint128");
--  tdesc_create_reg (feature, "ymm2h", 60, 1, NULL, 128, "uint128");
--  tdesc_create_reg (feature, "ymm3h", 61, 1, NULL, 128, "uint128");
--  tdesc_create_reg (feature, "ymm4h", 62, 1, NULL, 128, "uint128");
--  tdesc_create_reg (feature, "ymm5h", 63, 1, NULL, 128, "uint128");
--  tdesc_create_reg (feature, "ymm6h", 64, 1, NULL, 128, "uint128");
--  tdesc_create_reg (feature, "ymm7h", 65, 1, NULL, 128, "uint128");
--  tdesc_create_reg (feature, "ymm8h", 66, 1, NULL, 128, "uint128");
--  tdesc_create_reg (feature, "ymm9h", 67, 1, NULL, 128, "uint128");
--  tdesc_create_reg (feature, "ymm10h", 68, 1, NULL, 128, "uint128");
--  tdesc_create_reg (feature, "ymm11h", 69, 1, NULL, 128, "uint128");
--  tdesc_create_reg (feature, "ymm12h", 70, 1, NULL, 128, "uint128");
--  tdesc_create_reg (feature, "ymm13h", 71, 1, NULL, 128, "uint128");
--  tdesc_create_reg (feature, "ymm14h", 72, 1, NULL, 128, "uint128");
--  tdesc_create_reg (feature, "ymm15h", 73, 1, NULL, 128, "uint128");
--
-   feature = tdesc_create_feature (result, "org.gnu.gdb.i386.mpx");
-   type = tdesc_create_struct (feature, "br128");
-   field_type = tdesc_named_type (feature, "uint64");
-@@ -200,12 +182,12 @@ initialize_tdesc_amd64_mpx_linux (void)
-   field_type = tdesc_named_type (feature, "_bndcfgu");
-   tdesc_add_field (type, "config", field_type);
-
--  tdesc_create_reg (feature, "bnd0raw", 74, 1, NULL, 128, "br128");
--  tdesc_create_reg (feature, "bnd1raw", 75, 1, NULL, 128, "br128");
--  tdesc_create_reg (feature, "bnd2raw", 76, 1, NULL, 128, "br128");
--  tdesc_create_reg (feature, "bnd3raw", 77, 1, NULL, 128, "br128");
--  tdesc_create_reg (feature, "bndcfgu", 78, 1, NULL, 64, "cfgu");
--  tdesc_create_reg (feature, "bndstatus", 79, 1, NULL, 64, "status");
-+  tdesc_create_reg (feature, "bnd0raw", 58, 1, NULL, 128, "br128");
-+  tdesc_create_reg (feature, "bnd1raw", 59, 1, NULL, 128, "br128");
-+  tdesc_create_reg (feature, "bnd2raw", 60, 1, NULL, 128, "br128");
-+  tdesc_create_reg (feature, "bnd3raw", 61, 1, NULL, 128, "br128");
-+  tdesc_create_reg (feature, "bndcfgu", 62, 1, NULL, 64, "cfgu");
-+  tdesc_create_reg (feature, "bndstatus", 63, 1, NULL, 64, "status");
-
-   tdesc_amd64_mpx_linux = result;
- }
-diff --git a/gdb/features/i386/amd64-mpx-linux.xml b/gdb/features/i386/amd64-mpx-linux.xml
-index 15e87b4..835126b 100644
---- a/gdb/features/i386/amd64-mpx-linux.xml
-+++ b/gdb/features/i386/amd64-mpx-linux.xml
-@@ -14,6 +14,5 @@
-   <xi:include href="64bit-core.xml"/>
-   <xi:include href="64bit-sse.xml"/>
-   <xi:include href="64bit-linux.xml"/>
--  <xi:include href="64bit-avx.xml"/>
-   <xi:include href="64bit-mpx.xml"/>
- </target>
-diff --git a/gdb/features/i386/amd64-mpx.c b/gdb/features/i386/amd64-mpx.c
-index 15ae5f7..4c852ef 100644
---- a/gdb/features/i386/amd64-mpx.c
-+++ b/gdb/features/i386/amd64-mpx.c
-@@ -146,24 +146,6 @@ initialize_tdesc_amd64_mpx (void)
-   tdesc_create_reg (feature, "xmm15", 55, 1, NULL, 128, "vec128");
-   tdesc_create_reg (feature, "mxcsr", 56, 1, "vector", 32, "i386_mxcsr");
-
--  feature = tdesc_create_feature (result, "org.gnu.gdb.i386.avx");
--  tdesc_create_reg (feature, "ymm0h", 57, 1, NULL, 128, "uint128");
--  tdesc_create_reg (feature, "ymm1h", 58, 1, NULL, 128, "uint128");
--  tdesc_create_reg (feature, "ymm2h", 59, 1, NULL, 128, "uint128");
--  tdesc_create_reg (feature, "ymm3h", 60, 1, NULL, 128, "uint128");
--  tdesc_create_reg (feature, "ymm4h", 61, 1, NULL, 128, "uint128");
--  tdesc_create_reg (feature, "ymm5h", 62, 1, NULL, 128, "uint128");
--  tdesc_create_reg (feature, "ymm6h", 63, 1, NULL, 128, "uint128");
--  tdesc_create_reg (feature, "ymm7h", 64, 1, NULL, 128, "uint128");
--  tdesc_create_reg (feature, "ymm8h", 65, 1, NULL, 128, "uint128");
--  tdesc_create_reg (feature, "ymm9h", 66, 1, NULL, 128, "uint128");
--  tdesc_create_reg (feature, "ymm10h", 67, 1, NULL, 128, "uint128");
--  tdesc_create_reg (feature, "ymm11h", 68, 1, NULL, 128, "uint128");
--  tdesc_create_reg (feature, "ymm12h", 69, 1, NULL, 128, "uint128");
--  tdesc_create_reg (feature, "ymm13h", 70, 1, NULL, 128, "uint128");
--  tdesc_create_reg (feature, "ymm14h", 71, 1, NULL, 128, "uint128");
--  tdesc_create_reg (feature, "ymm15h", 72, 1, NULL, 128, "uint128");
--
-   feature = tdesc_create_feature (result, "org.gnu.gdb.i386.mpx");
-   type = tdesc_create_struct (feature, "br128");
-   field_type = tdesc_named_type (feature, "uint64");
-@@ -195,12 +177,12 @@ initialize_tdesc_amd64_mpx (void)
-   field_type = tdesc_named_type (feature, "_bndcfgu");
-   tdesc_add_field (type, "config", field_type);
-
--  tdesc_create_reg (feature, "bnd0raw", 73, 1, NULL, 128, "br128");
--  tdesc_create_reg (feature, "bnd1raw", 74, 1, NULL, 128, "br128");
--  tdesc_create_reg (feature, "bnd2raw", 75, 1, NULL, 128, "br128");
--  tdesc_create_reg (feature, "bnd3raw", 76, 1, NULL, 128, "br128");
--  tdesc_create_reg (feature, "bndcfgu", 77, 1, NULL, 64, "cfgu");
--  tdesc_create_reg (feature, "bndstatus", 78, 1, NULL, 64, "status");
-+  tdesc_create_reg (feature, "bnd0raw", 57, 1, NULL, 128, "br128");
-+  tdesc_create_reg (feature, "bnd1raw", 58, 1, NULL, 128, "br128");
-+  tdesc_create_reg (feature, "bnd2raw", 59, 1, NULL, 128, "br128");
-+  tdesc_create_reg (feature, "bnd3raw", 60, 1, NULL, 128, "br128");
-+  tdesc_create_reg (feature, "bndcfgu", 61, 1, NULL, 64, "cfgu");
-+  tdesc_create_reg (feature, "bndstatus", 62, 1, NULL, 64, "status");
-
-   tdesc_amd64_mpx = result;
- }
-diff --git a/gdb/features/i386/amd64-mpx.xml b/gdb/features/i386/amd64-mpx.xml
-index 21b6df3..e458736 100644
---- a/gdb/features/i386/amd64-mpx.xml
-+++ b/gdb/features/i386/amd64-mpx.xml
-@@ -12,6 +12,5 @@
-   <architecture>i386:x86-64</architecture>
-   <xi:include href="64bit-core.xml"/>
-   <xi:include href="64bit-sse.xml"/>
--  <xi:include href="64bit-avx.xml"/>
-   <xi:include href="64bit-mpx.xml"/>
- </target>
-diff --git a/gdb/features/i386/i386-avx-mpx-linux.c b/gdb/features/i386/i386-avx-mpx-linux.c
-new file mode 100644
-index 0000000..dd75403
---- /dev/null
-+++ b/gdb/features/i386/i386-avx-mpx-linux.c
-@@ -0,0 +1,187 @@
-+/* THIS FILE IS GENERATED.  -*- buffer-read-only: t -*- vi:set ro:
-+  Original: i386-avx-mpx-linux.xml */
-+
-+#include "defs.h"
-+#include "osabi.h"
-+#include "target-descriptions.h"
-+
-+struct target_desc *tdesc_i386_avx_mpx_linux;
-+static void
-+initialize_tdesc_i386_avx_mpx_linux (void)
-+{
-+  struct target_desc *result = allocate_target_description ();
-+  struct tdesc_feature *feature;
-+  struct tdesc_type *field_type;
-+  struct tdesc_type *type;
-+
-+  set_tdesc_architecture (result, bfd_scan_arch ("i386"));
-+
-+  set_tdesc_osabi (result, osabi_from_tdesc_string ("GNU/Linux"));
-+
-+  feature = tdesc_create_feature (result, "org.gnu.gdb.i386.core");
-+  field_type = tdesc_create_flags (feature, "i386_eflags", 4);
-+  tdesc_add_flag (field_type, 0, "CF");
-+  tdesc_add_flag (field_type, 1, "");
-+  tdesc_add_flag (field_type, 2, "PF");
-+  tdesc_add_flag (field_type, 4, "AF");
-+  tdesc_add_flag (field_type, 6, "ZF");
-+  tdesc_add_flag (field_type, 7, "SF");
-+  tdesc_add_flag (field_type, 8, "TF");
-+  tdesc_add_flag (field_type, 9, "IF");
-+  tdesc_add_flag (field_type, 10, "DF");
-+  tdesc_add_flag (field_type, 11, "OF");
-+  tdesc_add_flag (field_type, 14, "NT");
-+  tdesc_add_flag (field_type, 16, "RF");
-+  tdesc_add_flag (field_type, 17, "VM");
-+  tdesc_add_flag (field_type, 18, "AC");
-+  tdesc_add_flag (field_type, 19, "VIF");
-+  tdesc_add_flag (field_type, 20, "VIP");
-+  tdesc_add_flag (field_type, 21, "ID");
-+
-+  tdesc_create_reg (feature, "eax", 0, 1, NULL, 32, "int32");
-+  tdesc_create_reg (feature, "ecx", 1, 1, NULL, 32, "int32");
-+  tdesc_create_reg (feature, "edx", 2, 1, NULL, 32, "int32");
-+  tdesc_create_reg (feature, "ebx", 3, 1, NULL, 32, "int32");
-+  tdesc_create_reg (feature, "esp", 4, 1, NULL, 32, "data_ptr");
-+  tdesc_create_reg (feature, "ebp", 5, 1, NULL, 32, "data_ptr");
-+  tdesc_create_reg (feature, "esi", 6, 1, NULL, 32, "int32");
-+  tdesc_create_reg (feature, "edi", 7, 1, NULL, 32, "int32");
-+  tdesc_create_reg (feature, "eip", 8, 1, NULL, 32, "code_ptr");
-+  tdesc_create_reg (feature, "eflags", 9, 1, NULL, 32, "i386_eflags");
-+  tdesc_create_reg (feature, "cs", 10, 1, NULL, 32, "int32");
-+  tdesc_create_reg (feature, "ss", 11, 1, NULL, 32, "int32");
-+  tdesc_create_reg (feature, "ds", 12, 1, NULL, 32, "int32");
-+  tdesc_create_reg (feature, "es", 13, 1, NULL, 32, "int32");
-+  tdesc_create_reg (feature, "fs", 14, 1, NULL, 32, "int32");
-+  tdesc_create_reg (feature, "gs", 15, 1, NULL, 32, "int32");
-+  tdesc_create_reg (feature, "st0", 16, 1, NULL, 80, "i387_ext");
-+  tdesc_create_reg (feature, "st1", 17, 1, NULL, 80, "i387_ext");
-+  tdesc_create_reg (feature, "st2", 18, 1, NULL, 80, "i387_ext");
-+  tdesc_create_reg (feature, "st3", 19, 1, NULL, 80, "i387_ext");
-+  tdesc_create_reg (feature, "st4", 20, 1, NULL, 80, "i387_ext");
-+  tdesc_create_reg (feature, "st5", 21, 1, NULL, 80, "i387_ext");
-+  tdesc_create_reg (feature, "st6", 22, 1, NULL, 80, "i387_ext");
-+  tdesc_create_reg (feature, "st7", 23, 1, NULL, 80, "i387_ext");
-+  tdesc_create_reg (feature, "fctrl", 24, 1, "float", 32, "int");
-+  tdesc_create_reg (feature, "fstat", 25, 1, "float", 32, "int");
-+  tdesc_create_reg (feature, "ftag", 26, 1, "float", 32, "int");
-+  tdesc_create_reg (feature, "fiseg", 27, 1, "float", 32, "int");
-+  tdesc_create_reg (feature, "fioff", 28, 1, "float", 32, "int");
-+  tdesc_create_reg (feature, "foseg", 29, 1, "float", 32, "int");
-+  tdesc_create_reg (feature, "fooff", 30, 1, "float", 32, "int");
-+  tdesc_create_reg (feature, "fop", 31, 1, "float", 32, "int");
-+
-+  feature = tdesc_create_feature (result, "org.gnu.gdb.i386.sse");
-+  field_type = tdesc_named_type (feature, "ieee_single");
-+  tdesc_create_vector (feature, "v4f", field_type, 4);
-+
-+  field_type = tdesc_named_type (feature, "ieee_double");
-+  tdesc_create_vector (feature, "v2d", field_type, 2);
-+
-+  field_type = tdesc_named_type (feature, "int8");
-+  tdesc_create_vector (feature, "v16i8", field_type, 16);
-+
-+  field_type = tdesc_named_type (feature, "int16");
-+  tdesc_create_vector (feature, "v8i16", field_type, 8);
-+
-+  field_type = tdesc_named_type (feature, "int32");
-+  tdesc_create_vector (feature, "v4i32", field_type, 4);
-+
-+  field_type = tdesc_named_type (feature, "int64");
-+  tdesc_create_vector (feature, "v2i64", field_type, 2);
-+
-+  type = tdesc_create_union (feature, "vec128");
-+  field_type = tdesc_named_type (feature, "v4f");
-+  tdesc_add_field (type, "v4_float", field_type);
-+  field_type = tdesc_named_type (feature, "v2d");
-+  tdesc_add_field (type, "v2_double", field_type);
-+  field_type = tdesc_named_type (feature, "v16i8");
-+  tdesc_add_field (type, "v16_int8", field_type);
-+  field_type = tdesc_named_type (feature, "v8i16");
-+  tdesc_add_field (type, "v8_int16", field_type);
-+  field_type = tdesc_named_type (feature, "v4i32");
-+  tdesc_add_field (type, "v4_int32", field_type);
-+  field_type = tdesc_named_type (feature, "v2i64");
-+  tdesc_add_field (type, "v2_int64", field_type);
-+  field_type = tdesc_named_type (feature, "uint128");
-+  tdesc_add_field (type, "uint128", field_type);
-+
-+  field_type = tdesc_create_flags (feature, "i386_mxcsr", 4);
-+  tdesc_add_flag (field_type, 0, "IE");
-+  tdesc_add_flag (field_type, 1, "DE");
-+  tdesc_add_flag (field_type, 2, "ZE");
-+  tdesc_add_flag (field_type, 3, "OE");
-+  tdesc_add_flag (field_type, 4, "UE");
-+  tdesc_add_flag (field_type, 5, "PE");
-+  tdesc_add_flag (field_type, 6, "DAZ");
-+  tdesc_add_flag (field_type, 7, "IM");
-+  tdesc_add_flag (field_type, 8, "DM");
-+  tdesc_add_flag (field_type, 9, "ZM");
-+  tdesc_add_flag (field_type, 10, "OM");
-+  tdesc_add_flag (field_type, 11, "UM");
-+  tdesc_add_flag (field_type, 12, "PM");
-+  tdesc_add_flag (field_type, 15, "FZ");
-+
-+  tdesc_create_reg (feature, "xmm0", 32, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "xmm1", 33, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "xmm2", 34, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "xmm3", 35, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "xmm4", 36, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "xmm5", 37, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "xmm6", 38, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "xmm7", 39, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "mxcsr", 40, 1, "vector", 32, "i386_mxcsr");
-+
-+  feature = tdesc_create_feature (result, "org.gnu.gdb.i386.linux");
-+  tdesc_create_reg (feature, "orig_eax", 41, 1, NULL, 32, "int");
-+
-+  feature = tdesc_create_feature (result, "org.gnu.gdb.i386.avx");
-+  tdesc_create_reg (feature, "ymm0h", 42, 1, NULL, 128, "uint128");
-+  tdesc_create_reg (feature, "ymm1h", 43, 1, NULL, 128, "uint128");
-+  tdesc_create_reg (feature, "ymm2h", 44, 1, NULL, 128, "uint128");
-+  tdesc_create_reg (feature, "ymm3h", 45, 1, NULL, 128, "uint128");
-+  tdesc_create_reg (feature, "ymm4h", 46, 1, NULL, 128, "uint128");
-+  tdesc_create_reg (feature, "ymm5h", 47, 1, NULL, 128, "uint128");
-+  tdesc_create_reg (feature, "ymm6h", 48, 1, NULL, 128, "uint128");
-+  tdesc_create_reg (feature, "ymm7h", 49, 1, NULL, 128, "uint128");
-+
-+  feature = tdesc_create_feature (result, "org.gnu.gdb.i386.mpx");
-+  type = tdesc_create_struct (feature, "br128");
-+  field_type = tdesc_named_type (feature, "uint64");
-+  tdesc_add_field (type, "lbound", field_type);
-+  field_type = tdesc_named_type (feature, "uint64");
-+  tdesc_add_field (type, "ubound_raw", field_type);
-+
-+  type = tdesc_create_struct (feature, "_bndstatus");
-+  tdesc_set_struct_size (type, 8);
-+  tdesc_add_bitfield (type, "bde", 2, 31);
-+  tdesc_add_bitfield (type, "error", 0, 1);
-+
-+  type = tdesc_create_union (feature, "status");
-+  field_type = tdesc_named_type (feature, "data_ptr");
-+  tdesc_add_field (type, "raw", field_type);
-+  field_type = tdesc_named_type (feature, "_bndstatus");
-+  tdesc_add_field (type, "status", field_type);
-+
-+  type = tdesc_create_struct (feature, "_bndcfgu");
-+  tdesc_set_struct_size (type, 8);
-+  tdesc_add_bitfield (type, "base", 12, 31);
-+  tdesc_add_bitfield (type, "reserved", 2, 11);
-+  tdesc_add_bitfield (type, "preserved", 1, 1);
-+  tdesc_add_bitfield (type, "enabled", 0, 1);
-+
-+  type = tdesc_create_union (feature, "cfgu");
-+  field_type = tdesc_named_type (feature, "data_ptr");
-+  tdesc_add_field (type, "raw", field_type);
-+  field_type = tdesc_named_type (feature, "_bndcfgu");
-+  tdesc_add_field (type, "config", field_type);
-+
-+  tdesc_create_reg (feature, "bnd0raw", 50, 1, NULL, 128, "br128");
-+  tdesc_create_reg (feature, "bnd1raw", 51, 1, NULL, 128, "br128");
-+  tdesc_create_reg (feature, "bnd2raw", 52, 1, NULL, 128, "br128");
-+  tdesc_create_reg (feature, "bnd3raw", 53, 1, NULL, 128, "br128");
-+  tdesc_create_reg (feature, "bndcfgu", 54, 1, NULL, 64, "cfgu");
-+  tdesc_create_reg (feature, "bndstatus", 55, 1, NULL, 64, "status");
-+
-+  tdesc_i386_avx_mpx_linux = result;
-+}
-diff --git a/gdb/features/i386/i386-avx-mpx-linux.xml b/gdb/features/i386/i386-avx-mpx-linux.xml
-new file mode 100644
-index 0000000..c9a1a61
---- /dev/null
-+++ b/gdb/features/i386/i386-avx-mpx-linux.xml
-@@ -0,0 +1,19 @@
-+<?xml version="1.0"?>
-+<!-- Copyright (C) 2013-2016 Free Software Foundation, Inc.
-+
-+     Copying and distribution of this file, with or without modification,
-+     are permitted in any medium without royalty provided the copyright
-+     notice and this notice are preserved.  -->
-+
-+<!-- I386 with AVX and MPX- Includes Linux-only special "register".  -->
-+
-+<!DOCTYPE target SYSTEM "gdb-target.dtd">
-+<target>
-+  <architecture>i386</architecture>
-+  <osabi>GNU/Linux</osabi>
-+  <xi:include href="32bit-core.xml"/>
-+  <xi:include href="32bit-sse.xml"/>
-+  <xi:include href="32bit-linux.xml"/>
-+  <xi:include href="32bit-avx.xml"/>
-+  <xi:include href="32bit-mpx.xml"/>
-+</target>
-diff --git a/gdb/features/i386/i386-avx-mpx.c b/gdb/features/i386/i386-avx-mpx.c
-new file mode 100644
-index 0000000..f104e4b
---- /dev/null
-+++ b/gdb/features/i386/i386-avx-mpx.c
-@@ -0,0 +1,182 @@
-+/* THIS FILE IS GENERATED.  -*- buffer-read-only: t -*- vi:set ro:
-+  Original: i386-avx-mpx.xml */
-+
-+#include "defs.h"
-+#include "osabi.h"
-+#include "target-descriptions.h"
-+
-+struct target_desc *tdesc_i386_avx_mpx;
-+static void
-+initialize_tdesc_i386_avx_mpx (void)
-+{
-+  struct target_desc *result = allocate_target_description ();
-+  struct tdesc_feature *feature;
-+  struct tdesc_type *field_type;
-+  struct tdesc_type *type;
-+
-+  set_tdesc_architecture (result, bfd_scan_arch ("i386"));
-+
-+  feature = tdesc_create_feature (result, "org.gnu.gdb.i386.core");
-+  field_type = tdesc_create_flags (feature, "i386_eflags", 4);
-+  tdesc_add_flag (field_type, 0, "CF");
-+  tdesc_add_flag (field_type, 1, "");
-+  tdesc_add_flag (field_type, 2, "PF");
-+  tdesc_add_flag (field_type, 4, "AF");
-+  tdesc_add_flag (field_type, 6, "ZF");
-+  tdesc_add_flag (field_type, 7, "SF");
-+  tdesc_add_flag (field_type, 8, "TF");
-+  tdesc_add_flag (field_type, 9, "IF");
-+  tdesc_add_flag (field_type, 10, "DF");
-+  tdesc_add_flag (field_type, 11, "OF");
-+  tdesc_add_flag (field_type, 14, "NT");
-+  tdesc_add_flag (field_type, 16, "RF");
-+  tdesc_add_flag (field_type, 17, "VM");
-+  tdesc_add_flag (field_type, 18, "AC");
-+  tdesc_add_flag (field_type, 19, "VIF");
-+  tdesc_add_flag (field_type, 20, "VIP");
-+  tdesc_add_flag (field_type, 21, "ID");
-+
-+  tdesc_create_reg (feature, "eax", 0, 1, NULL, 32, "int32");
-+  tdesc_create_reg (feature, "ecx", 1, 1, NULL, 32, "int32");
-+  tdesc_create_reg (feature, "edx", 2, 1, NULL, 32, "int32");
-+  tdesc_create_reg (feature, "ebx", 3, 1, NULL, 32, "int32");
-+  tdesc_create_reg (feature, "esp", 4, 1, NULL, 32, "data_ptr");
-+  tdesc_create_reg (feature, "ebp", 5, 1, NULL, 32, "data_ptr");
-+  tdesc_create_reg (feature, "esi", 6, 1, NULL, 32, "int32");
-+  tdesc_create_reg (feature, "edi", 7, 1, NULL, 32, "int32");
-+  tdesc_create_reg (feature, "eip", 8, 1, NULL, 32, "code_ptr");
-+  tdesc_create_reg (feature, "eflags", 9, 1, NULL, 32, "i386_eflags");
-+  tdesc_create_reg (feature, "cs", 10, 1, NULL, 32, "int32");
-+  tdesc_create_reg (feature, "ss", 11, 1, NULL, 32, "int32");
-+  tdesc_create_reg (feature, "ds", 12, 1, NULL, 32, "int32");
-+  tdesc_create_reg (feature, "es", 13, 1, NULL, 32, "int32");
-+  tdesc_create_reg (feature, "fs", 14, 1, NULL, 32, "int32");
-+  tdesc_create_reg (feature, "gs", 15, 1, NULL, 32, "int32");
-+  tdesc_create_reg (feature, "st0", 16, 1, NULL, 80, "i387_ext");
-+  tdesc_create_reg (feature, "st1", 17, 1, NULL, 80, "i387_ext");
-+  tdesc_create_reg (feature, "st2", 18, 1, NULL, 80, "i387_ext");
-+  tdesc_create_reg (feature, "st3", 19, 1, NULL, 80, "i387_ext");
-+  tdesc_create_reg (feature, "st4", 20, 1, NULL, 80, "i387_ext");
-+  tdesc_create_reg (feature, "st5", 21, 1, NULL, 80, "i387_ext");
-+  tdesc_create_reg (feature, "st6", 22, 1, NULL, 80, "i387_ext");
-+  tdesc_create_reg (feature, "st7", 23, 1, NULL, 80, "i387_ext");
-+  tdesc_create_reg (feature, "fctrl", 24, 1, "float", 32, "int");
-+  tdesc_create_reg (feature, "fstat", 25, 1, "float", 32, "int");
-+  tdesc_create_reg (feature, "ftag", 26, 1, "float", 32, "int");
-+  tdesc_create_reg (feature, "fiseg", 27, 1, "float", 32, "int");
-+  tdesc_create_reg (feature, "fioff", 28, 1, "float", 32, "int");
-+  tdesc_create_reg (feature, "foseg", 29, 1, "float", 32, "int");
-+  tdesc_create_reg (feature, "fooff", 30, 1, "float", 32, "int");
-+  tdesc_create_reg (feature, "fop", 31, 1, "float", 32, "int");
-+
-+  feature = tdesc_create_feature (result, "org.gnu.gdb.i386.sse");
-+  field_type = tdesc_named_type (feature, "ieee_single");
-+  tdesc_create_vector (feature, "v4f", field_type, 4);
-+
-+  field_type = tdesc_named_type (feature, "ieee_double");
-+  tdesc_create_vector (feature, "v2d", field_type, 2);
-+
-+  field_type = tdesc_named_type (feature, "int8");
-+  tdesc_create_vector (feature, "v16i8", field_type, 16);
-+
-+  field_type = tdesc_named_type (feature, "int16");
-+  tdesc_create_vector (feature, "v8i16", field_type, 8);
-+
-+  field_type = tdesc_named_type (feature, "int32");
-+  tdesc_create_vector (feature, "v4i32", field_type, 4);
-+
-+  field_type = tdesc_named_type (feature, "int64");
-+  tdesc_create_vector (feature, "v2i64", field_type, 2);
-+
-+  type = tdesc_create_union (feature, "vec128");
-+  field_type = tdesc_named_type (feature, "v4f");
-+  tdesc_add_field (type, "v4_float", field_type);
-+  field_type = tdesc_named_type (feature, "v2d");
-+  tdesc_add_field (type, "v2_double", field_type);
-+  field_type = tdesc_named_type (feature, "v16i8");
-+  tdesc_add_field (type, "v16_int8", field_type);
-+  field_type = tdesc_named_type (feature, "v8i16");
-+  tdesc_add_field (type, "v8_int16", field_type);
-+  field_type = tdesc_named_type (feature, "v4i32");
-+  tdesc_add_field (type, "v4_int32", field_type);
-+  field_type = tdesc_named_type (feature, "v2i64");
-+  tdesc_add_field (type, "v2_int64", field_type);
-+  field_type = tdesc_named_type (feature, "uint128");
-+  tdesc_add_field (type, "uint128", field_type);
-+
-+  field_type = tdesc_create_flags (feature, "i386_mxcsr", 4);
-+  tdesc_add_flag (field_type, 0, "IE");
-+  tdesc_add_flag (field_type, 1, "DE");
-+  tdesc_add_flag (field_type, 2, "ZE");
-+  tdesc_add_flag (field_type, 3, "OE");
-+  tdesc_add_flag (field_type, 4, "UE");
-+  tdesc_add_flag (field_type, 5, "PE");
-+  tdesc_add_flag (field_type, 6, "DAZ");
-+  tdesc_add_flag (field_type, 7, "IM");
-+  tdesc_add_flag (field_type, 8, "DM");
-+  tdesc_add_flag (field_type, 9, "ZM");
-+  tdesc_add_flag (field_type, 10, "OM");
-+  tdesc_add_flag (field_type, 11, "UM");
-+  tdesc_add_flag (field_type, 12, "PM");
-+  tdesc_add_flag (field_type, 15, "FZ");
-+
-+  tdesc_create_reg (feature, "xmm0", 32, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "xmm1", 33, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "xmm2", 34, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "xmm3", 35, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "xmm4", 36, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "xmm5", 37, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "xmm6", 38, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "xmm7", 39, 1, NULL, 128, "vec128");
-+  tdesc_create_reg (feature, "mxcsr", 40, 1, "vector", 32, "i386_mxcsr");
-+
-+  feature = tdesc_create_feature (result, "org.gnu.gdb.i386.avx");
-+  tdesc_create_reg (feature, "ymm0h", 41, 1, NULL, 128, "uint128");
-+  tdesc_create_reg (feature, "ymm1h", 42, 1, NULL, 128, "uint128");
-+  tdesc_create_reg (feature, "ymm2h", 43, 1, NULL, 128, "uint128");
-+  tdesc_create_reg (feature, "ymm3h", 44, 1, NULL, 128, "uint128");
-+  tdesc_create_reg (feature, "ymm4h", 45, 1, NULL, 128, "uint128");
-+  tdesc_create_reg (feature, "ymm5h", 46, 1, NULL, 128, "uint128");
-+  tdesc_create_reg (feature, "ymm6h", 47, 1, NULL, 128, "uint128");
-+  tdesc_create_reg (feature, "ymm7h", 48, 1, NULL, 128, "uint128");
-+
-+  feature = tdesc_create_feature (result, "org.gnu.gdb.i386.mpx");
-+  type = tdesc_create_struct (feature, "br128");
-+  field_type = tdesc_named_type (feature, "uint64");
-+  tdesc_add_field (type, "lbound", field_type);
-+  field_type = tdesc_named_type (feature, "uint64");
-+  tdesc_add_field (type, "ubound_raw", field_type);
-+
-+  type = tdesc_create_struct (feature, "_bndstatus");
-+  tdesc_set_struct_size (type, 8);
-+  tdesc_add_bitfield (type, "bde", 2, 31);
-+  tdesc_add_bitfield (type, "error", 0, 1);
-+
-+  type = tdesc_create_union (feature, "status");
-+  field_type = tdesc_named_type (feature, "data_ptr");
-+  tdesc_add_field (type, "raw", field_type);
-+  field_type = tdesc_named_type (feature, "_bndstatus");
-+  tdesc_add_field (type, "status", field_type);
-+
-+  type = tdesc_create_struct (feature, "_bndcfgu");
-+  tdesc_set_struct_size (type, 8);
-+  tdesc_add_bitfield (type, "base", 12, 31);
-+  tdesc_add_bitfield (type, "reserved", 2, 11);
-+  tdesc_add_bitfield (type, "preserved", 1, 1);
-+  tdesc_add_bitfield (type, "enabled", 0, 1);
-+
-+  type = tdesc_create_union (feature, "cfgu");
-+  field_type = tdesc_named_type (feature, "data_ptr");
-+  tdesc_add_field (type, "raw", field_type);
-+  field_type = tdesc_named_type (feature, "_bndcfgu");
-+  tdesc_add_field (type, "config", field_type);
-+
-+  tdesc_create_reg (feature, "bnd0raw", 49, 1, NULL, 128, "br128");
-+  tdesc_create_reg (feature, "bnd1raw", 50, 1, NULL, 128, "br128");
-+  tdesc_create_reg (feature, "bnd2raw", 51, 1, NULL, 128, "br128");
-+  tdesc_create_reg (feature, "bnd3raw", 52, 1, NULL, 128, "br128");
-+  tdesc_create_reg (feature, "bndcfgu", 53, 1, NULL, 64, "cfgu");
-+  tdesc_create_reg (feature, "bndstatus", 54, 1, NULL, 64, "status");
-+
-+  tdesc_i386_avx_mpx = result;
-+}
-diff --git a/gdb/features/i386/i386-avx-mpx.xml b/gdb/features/i386/i386-avx-mpx.xml
-new file mode 100644
-index 0000000..ab97367
---- /dev/null
-+++ b/gdb/features/i386/i386-avx-mpx.xml
-@@ -0,0 +1,17 @@
-+<?xml version="1.0"?>
-+<!-- Copyright (C) 2013-2016 Free Software Foundation, Inc.
-+
-+     Copying and distribution of this file, with or without modification,
-+     are permitted in any medium without royalty provided the copyright
-+     notice and this notice are preserved.  -->
-+
-+<!-- I386 with AVX and MPX -->
-+
-+<!DOCTYPE target SYSTEM "gdb-target.dtd">
-+<target>
-+  <architecture>i386</architecture>
-+  <xi:include href="32bit-core.xml"/>
-+  <xi:include href="32bit-sse.xml"/>
-+  <xi:include href="32bit-avx.xml"/>
-+  <xi:include href="32bit-mpx.xml"/>
-+</target>
-diff --git a/gdb/features/i386/i386-mpx-linux.c b/gdb/features/i386/i386-mpx-linux.c
-index dbf8789..c6bafea 100644
---- a/gdb/features/i386/i386-mpx-linux.c
-+++ b/gdb/features/i386/i386-mpx-linux.c
-@@ -135,16 +135,6 @@ initialize_tdesc_i386_mpx_linux (void)
-   feature = tdesc_create_feature (result, "org.gnu.gdb.i386.linux");
-   tdesc_create_reg (feature, "orig_eax", 41, 1, NULL, 32, "int");
-
--  feature = tdesc_create_feature (result, "org.gnu.gdb.i386.avx");
--  tdesc_create_reg (feature, "ymm0h", 42, 1, NULL, 128, "uint128");
--  tdesc_create_reg (feature, "ymm1h", 43, 1, NULL, 128, "uint128");
--  tdesc_create_reg (feature, "ymm2h", 44, 1, NULL, 128, "uint128");
--  tdesc_create_reg (feature, "ymm3h", 45, 1, NULL, 128, "uint128");
--  tdesc_create_reg (feature, "ymm4h", 46, 1, NULL, 128, "uint128");
--  tdesc_create_reg (feature, "ymm5h", 47, 1, NULL, 128, "uint128");
--  tdesc_create_reg (feature, "ymm6h", 48, 1, NULL, 128, "uint128");
--  tdesc_create_reg (feature, "ymm7h", 49, 1, NULL, 128, "uint128");
--
-   feature = tdesc_create_feature (result, "org.gnu.gdb.i386.mpx");
-   type = tdesc_create_struct (feature, "br128");
-   field_type = tdesc_named_type (feature, "uint64");
-@@ -176,12 +166,12 @@ initialize_tdesc_i386_mpx_linux (void)
-   field_type = tdesc_named_type (feature, "_bndcfgu");
-   tdesc_add_field (type, "config", field_type);
-
--  tdesc_create_reg (feature, "bnd0raw", 50, 1, NULL, 128, "br128");
--  tdesc_create_reg (feature, "bnd1raw", 51, 1, NULL, 128, "br128");
--  tdesc_create_reg (feature, "bnd2raw", 52, 1, NULL, 128, "br128");
--  tdesc_create_reg (feature, "bnd3raw", 53, 1, NULL, 128, "br128");
--  tdesc_create_reg (feature, "bndcfgu", 54, 1, NULL, 64, "cfgu");
--  tdesc_create_reg (feature, "bndstatus", 55, 1, NULL, 64, "status");
-+  tdesc_create_reg (feature, "bnd0raw", 42, 1, NULL, 128, "br128");
-+  tdesc_create_reg (feature, "bnd1raw", 43, 1, NULL, 128, "br128");
-+  tdesc_create_reg (feature, "bnd2raw", 44, 1, NULL, 128, "br128");
-+  tdesc_create_reg (feature, "bnd3raw", 45, 1, NULL, 128, "br128");
-+  tdesc_create_reg (feature, "bndcfgu", 46, 1, NULL, 64, "cfgu");
-+  tdesc_create_reg (feature, "bndstatus", 47, 1, NULL, 64, "status");
-
-   tdesc_i386_mpx_linux = result;
- }
-diff --git a/gdb/features/i386/i386-mpx-linux.xml b/gdb/features/i386/i386-mpx-linux.xml
-index c4004d6..4228cf5 100644
---- a/gdb/features/i386/i386-mpx-linux.xml
-+++ b/gdb/features/i386/i386-mpx-linux.xml
-@@ -14,6 +14,5 @@
-   <xi:include href="32bit-core.xml"/>
-   <xi:include href="32bit-sse.xml"/>
-   <xi:include href="32bit-linux.xml"/>
--  <xi:include href="32bit-avx.xml"/>
-   <xi:include href="32bit-mpx.xml"/>
- </target>
-diff --git a/gdb/features/i386/i386-mpx.c b/gdb/features/i386/i386-mpx.c
-index 1e04afd..430db3f 100644
---- a/gdb/features/i386/i386-mpx.c
-+++ b/gdb/features/i386/i386-mpx.c
-@@ -130,16 +130,6 @@ initialize_tdesc_i386_mpx (void)
-   tdesc_create_reg (feature, "xmm7", 39, 1, NULL, 128, "vec128");
-   tdesc_create_reg (feature, "mxcsr", 40, 1, "vector", 32, "i386_mxcsr");
-
--  feature = tdesc_create_feature (result, "org.gnu.gdb.i386.avx");
--  tdesc_create_reg (feature, "ymm0h", 41, 1, NULL, 128, "uint128");
--  tdesc_create_reg (feature, "ymm1h", 42, 1, NULL, 128, "uint128");
--  tdesc_create_reg (feature, "ymm2h", 43, 1, NULL, 128, "uint128");
--  tdesc_create_reg (feature, "ymm3h", 44, 1, NULL, 128, "uint128");
--  tdesc_create_reg (feature, "ymm4h", 45, 1, NULL, 128, "uint128");
--  tdesc_create_reg (feature, "ymm5h", 46, 1, NULL, 128, "uint128");
--  tdesc_create_reg (feature, "ymm6h", 47, 1, NULL, 128, "uint128");
--  tdesc_create_reg (feature, "ymm7h", 48, 1, NULL, 128, "uint128");
--
-   feature = tdesc_create_feature (result, "org.gnu.gdb.i386.mpx");
-   type = tdesc_create_struct (feature, "br128");
-   field_type = tdesc_named_type (feature, "uint64");
-@@ -171,12 +161,12 @@ initialize_tdesc_i386_mpx (void)
-   field_type = tdesc_named_type (feature, "_bndcfgu");
-   tdesc_add_field (type, "config", field_type);
-
--  tdesc_create_reg (feature, "bnd0raw", 49, 1, NULL, 128, "br128");
--  tdesc_create_reg (feature, "bnd1raw", 50, 1, NULL, 128, "br128");
--  tdesc_create_reg (feature, "bnd2raw", 51, 1, NULL, 128, "br128");
--  tdesc_create_reg (feature, "bnd3raw", 52, 1, NULL, 128, "br128");
--  tdesc_create_reg (feature, "bndcfgu", 53, 1, NULL, 64, "cfgu");
--  tdesc_create_reg (feature, "bndstatus", 54, 1, NULL, 64, "status");
-+  tdesc_create_reg (feature, "bnd0raw", 41, 1, NULL, 128, "br128");
-+  tdesc_create_reg (feature, "bnd1raw", 42, 1, NULL, 128, "br128");
-+  tdesc_create_reg (feature, "bnd2raw", 43, 1, NULL, 128, "br128");
-+  tdesc_create_reg (feature, "bnd3raw", 44, 1, NULL, 128, "br128");
-+  tdesc_create_reg (feature, "bndcfgu", 45, 1, NULL, 64, "cfgu");
-+  tdesc_create_reg (feature, "bndstatus", 46, 1, NULL, 64, "status");
-
-   tdesc_i386_mpx = result;
- }
-diff --git a/gdb/features/i386/i386-mpx.xml b/gdb/features/i386/i386-mpx.xml
-index 52a68db..c1806cb 100644
---- a/gdb/features/i386/i386-mpx.xml
-+++ b/gdb/features/i386/i386-mpx.xml
-@@ -12,6 +12,5 @@
-   <architecture>i386</architecture>
-   <xi:include href="32bit-core.xml"/>
-   <xi:include href="32bit-sse.xml"/>
--  <xi:include href="32bit-avx.xml"/>
-   <xi:include href="32bit-mpx.xml"/>
- </target>
-diff --git a/gdb/gdbserver/Makefile.in b/gdb/gdbserver/Makefile.in
-index 1e874e3..dee2ea1 100644
---- a/gdb/gdbserver/Makefile.in
-+++ b/gdb/gdbserver/Makefile.in
-@@ -376,9 +376,11 @@ clean:
- 	rm -f xml-builtin.c stamp-xml
- 	rm -f i386-avx.c i386-avx-linux.c
- 	rm -f i386-mpx.c i386-mpx-linux.c
-+	rm -f i386-avx-mpx.c i386-avx-mpx-linux.c
- 	rm -f i386-avx512.c i386-avx512-linux.c
- 	rm -f amd64-avx.c amd64-avx-linux.c
- 	rm -f amd64-mpx.c amd64-mpx-linux.c
-+	rm -f amd64-avx-mpx.c amd64-avx-mpx-linux.c
- 	rm -f amd64-avx512.c amd64-avx512-linux.c
- 	rm -f i386-mmx.c i386-mmx-linux.c
- 	rm -f x32.c x32-linux.c
-@@ -495,6 +497,21 @@ regcache-ipa.o: regcache.c
- i386-linux-ipa.o: i386-linux.c
- 	$(IPAGENT_COMPILE) $<
- 	$(POSTCOMPILE)
-+i386-mmx-linux-ipa.o: i386-mmx-linux.c
-+	$(IPAGENT_COMPILE) $<
-+	$(POSTCOMPILE)
-+i386-avx-linux-ipa.o: i386-avx-linux.c
-+	$(IPAGENT_COMPILE) $<
-+	$(POSTCOMPILE)
-+i386-mpx-linux-ipa.o: i386-mpx-linux.c
-+	$(IPAGENT_COMPILE) $<
-+	$(POSTCOMPILE)
-+i386-avx-mpx-linux-ipa.o: i386-avx-mpx-linux.c
-+	$(IPAGENT_COMPILE) $<
-+	$(POSTCOMPILE)
-+i386-avx512-linux-ipa.o: i386-avx512-linux.c
-+	$(IPAGENT_COMPILE) $<
-+	$(POSTCOMPILE)
- linux-i386-ipa.o: linux-i386-ipa.c
- 	$(IPAGENT_COMPILE) $<
- 	$(POSTCOMPILE)
-@@ -504,6 +521,18 @@ linux-amd64-ipa.o: linux-amd64-ipa.c
- amd64-linux-ipa.o: amd64-linux.c
- 	$(IPAGENT_COMPILE) $<
- 	$(POSTCOMPILE)
-+amd64-avx-linux-ipa.o: amd64-avx-linux.c
-+	$(IPAGENT_COMPILE) $<
-+	$(POSTCOMPILE)
-+amd64-mpx-linux-ipa.o: amd64-mpx-linux.c
-+	$(IPAGENT_COMPILE) $<
-+	$(POSTCOMPILE)
-+amd64-avx-mpx-linux-ipa.o: amd64-avx-mpx-linux.c
-+	$(IPAGENT_COMPILE) $<
-+	$(POSTCOMPILE)
-+amd64-avx512-linux-ipa.o: amd64-avx512-linux.c
-+	$(IPAGENT_COMPILE) $<
-+	$(POSTCOMPILE)
- linux-aarch64-ipa.o: linux-aarch64-ipa.c
- 	$(IPAGENT_COMPILE) $<
- 	$(POSTCOMPILE)
-@@ -694,6 +723,10 @@ i386-mpx.c : $(srcdir)/../regformats/i386/i386-mpx.dat $(regdat_sh)
- 	$(SHELL) $(regdat_sh) $(srcdir)/../regformats/i386/i386-mpx.dat i386-mpx.c
- i386-mpx-linux.c : $(srcdir)/../regformats/i386/i386-mpx-linux.dat $(regdat_sh)
- 	$(SHELL) $(regdat_sh) $(srcdir)/../regformats/i386/i386-mpx-linux.dat i386-mpx-linux.c
-+i386-avx-mpx.c : $(srcdir)/../regformats/i386/i386-avx-mpx.dat $(regdat_sh)
-+	$(SHELL) $(regdat_sh) $(srcdir)/../regformats/i386/i386-avx-mpx.dat i386-avx-mpx.c
-+i386-avx-mpx-linux.c : $(srcdir)/../regformats/i386/i386-avx-mpx-linux.dat $(regdat_sh)
-+	$(SHELL) $(regdat_sh) $(srcdir)/../regformats/i386/i386-avx-mpx-linux.dat i386-avx-mpx-linux.c
- i386-mmx.c : $(srcdir)/../regformats/i386/i386-mmx.dat $(regdat_sh)
- 	$(SHELL) $(regdat_sh) $(srcdir)/../regformats/i386/i386-mmx.dat i386-mmx.c
- i386-mmx-linux.c : $(srcdir)/../regformats/i386/i386-mmx-linux.dat $(regdat_sh)
-@@ -808,6 +841,10 @@ amd64-mpx.c : $(srcdir)/../regformats/i386/amd64-mpx.dat $(regdat_sh)
- 	$(SHELL) $(regdat_sh) $(srcdir)/../regformats/i386/amd64-mpx.dat amd64-mpx.c
- amd64-mpx-linux.c : $(srcdir)/../regformats/i386/amd64-mpx-linux.dat $(regdat_sh)
- 	$(SHELL) $(regdat_sh) $(srcdir)/../regformats/i386/amd64-mpx-linux.dat amd64-mpx-linux.c
-+amd64-avx-mpx.c : $(srcdir)/../regformats/i386/amd64-avx-mpx.dat $(regdat_sh)
-+	$(SHELL) $(regdat_sh) $(srcdir)/../regformats/i386/amd64-avx-mpx.dat amd64-avx-mpx.c
-+amd64-avx-mpx-linux.c : $(srcdir)/../regformats/i386/amd64-avx-mpx-linux.dat $(regdat_sh)
-+	$(SHELL) $(regdat_sh) $(srcdir)/../regformats/i386/amd64-avx-mpx-linux.dat amd64-avx-mpx-linux.c
- x32.c : $(srcdir)/../regformats/i386/x32.dat $(regdat_sh)
- 	$(SHELL) $(regdat_sh) $(srcdir)/../regformats/i386/x32.dat x32.c
- x32-linux.c : $(srcdir)/../regformats/i386/x32-linux.dat $(regdat_sh)
-diff --git a/gdb/gdbserver/configure.srv b/gdb/gdbserver/configure.srv
-index a54b9e7..4935a36 100644
---- a/gdb/gdbserver/configure.srv
-+++ b/gdb/gdbserver/configure.srv
-@@ -24,20 +24,23 @@
- # Default hostio_last_error implementation
- srv_hostio_err_objs="hostio-errno.o"
-
--srv_i386_regobj="i386.o i386-avx.o i386-avx512.o i386-mpx.o i386-mmx.o"
--srv_i386_linux_regobj="i386-linux.o i386-avx-linux.o i386-avx512-linux.o i386-mpx-linux.o i386-mmx-linux.o"
--srv_amd64_regobj="amd64.o amd64-avx.o amd64-avx512.o amd64-mpx.o x32.o x32-avx.o x32-avx512.o"
--srv_amd64_linux_regobj="amd64-linux.o amd64-avx-linux.o amd64-avx512-linux.o amd64-mpx-linux.o x32-linux.o x32-avx-linux.o x32-avx512-linux.o"
-+srv_i386_regobj="i386.o i386-avx.o i386-avx512.o i386-mpx.o i386-avx-mpx.o i386-mmx.o"
-+srv_i386_linux_regobj="i386-linux.o i386-avx-linux.o i386-avx512-linux.o i386-mpx-linux.o i386-avx-mpx-linux.o i386-mmx-linux.o"
-+srv_amd64_regobj="amd64.o amd64-avx.o amd64-avx512.o amd64-mpx.o amd64-avx-mpx.o x32.o x32-avx.o x32-avx512.o"
-+srv_amd64_linux_regobj="amd64-linux.o amd64-avx-linux.o amd64-avx512-linux.o amd64-mpx-linux.o amd64-avx-mpx-linux.o x32-linux.o x32-avx-linux.o x32-avx512-linux.o"
-+
-+
-+ipa_i386_linux_regobj="i386-linux-ipa.o i386-avx-linux-ipa.o  i386-avx-mpx-linux-ipa.o i386-avx512-linux-ipa.o i386-mpx-linux-ipa.o i386-mmx-linux-ipa.o"
-+ipa_amd64_linux_regobj="amd64-linux-ipa.o amd64-avx-linux-ipa.o amd64-avx-mpx-linux-ipa.o amd64-avx512-linux-ipa.o amd64-mpx-linux-ipa.o"
-
--ipa_i386_linux_regobj=i386-linux-ipa.o
--ipa_amd64_linux_regobj=amd64-linux-ipa.o
-
- srv_i386_32bit_xmlfiles="i386/32bit-core.xml i386/32bit-sse.xml i386/32bit-avx.xml i386/32bit-avx512.xml i386/32bit-mpx.xml"
- srv_i386_64bit_xmlfiles="i386/64bit-core.xml i386/64bit-sse.xml i386/64bit-avx.xml i386/64bit-avx512.xml i386/x32-core.xml i386/64bit-mpx.xml"
--srv_i386_xmlfiles="i386/i386.xml i386/i386-avx.xml i386/i386-avx512.xml i386/i386-mpx.xml i386/i386-mmx.xml $srv_i386_32bit_xmlfiles"
--srv_amd64_xmlfiles="i386/amd64.xml i386/amd64-avx.xml i386/amd64-avx512.xml i386/x32.xml i386/x32-avx.xml i386/x32-avx512.xml i386/amd64-mpx.xml $srv_i386_64bit_xmlfiles"
--srv_i386_linux_xmlfiles="i386/i386-linux.xml i386/i386-avx-linux.xml i386/i386-avx512-linux.xml i386/i386-mmx-linux.xml i386/32bit-linux.xml i386/i386-mpx-linux.xml $srv_i386_32bit_xmlfiles"
--srv_amd64_linux_xmlfiles="i386/amd64-linux.xml i386/amd64-avx-linux.xml i386/amd64-avx512-linux.xml i386/64bit-linux.xml i386/amd64-mpx-linux.xml i386/x32-linux.xml i386/x32-avx-linux.xml i386/x32-avx512-linux.xml $srv_i386_64bit_xmlfiles"
-+srv_i386_xmlfiles="i386/i386.xml i386/i386-avx.xml i386/i386-avx512.xml i386/i386-mpx.xml i386/i386-avx-mpx.xml i386/i386-mmx.xml $srv_i386_32bit_xmlfiles"
-+srv_amd64_xmlfiles="i386/amd64.xml i386/amd64-avx.xml i386/amd64-avx512.xml i386/x32.xml i386/x32-avx.xml i386/x32-avx512.xml i386/amd64-mpx.xml i386/amd64-avx-mpx.xml  $srv_i386_64bit_xmlfiles"
-+srv_i386_linux_xmlfiles="i386/i386-linux.xml i386/i386-avx-linux.xml i386/i386-avx512-linux.xml i386/i386-mmx-linux.xml i386/32bit-linux.xml i386/i386-mpx-linux.xml i386/i386-avx-mpx-linux.xml $srv_i386_32bit_xmlfiles"
-+srv_amd64_linux_xmlfiles="i386/amd64-linux.xml i386/amd64-avx-linux.xml i386/amd64-avx512-linux.xml i386/64bit-linux.xml i386/amd64-mpx-linux.xml i386/amd64-avx-mpx-linux.xml i386/x32-linux.xml i386/x32-avx-linux.xml i386/x32-avx512-linux.xml $srv_i386_64bit_xmlfiles"
-+
-
-
- # Linux object files.  This is so we don't have to repeat
-diff --git a/gdb/gdbserver/linux-aarch64-ipa.c b/gdb/gdbserver/linux-aarch64-ipa.c
-index 758708d..f1eaa70 100644
---- a/gdb/gdbserver/linux-aarch64-ipa.c
-+++ b/gdb/gdbserver/linux-aarch64-ipa.c
-@@ -143,9 +143,18 @@ gdb_agent_get_raw_reg (const unsigned char *raw_regs, int regnum)
- 			+ aarch64_ft_collect_regmap[regnum] * FT_CR_SIZE);
- }
-
-+/* Return target_desc to use for IPA, given the tdesc index passed by
-+   gdbserver.  Index is ignored, since we have only one tdesc
-+   at the moment.  */
-+
-+const struct target_desc *
-+get_ipa_tdesc (int idx)
-+{
-+  return tdesc_aarch64;
-+}
-+
- void
- initialize_low_tracepoint (void)
- {
-   init_registers_aarch64 ();
--  ipa_tdesc = tdesc_aarch64;
- }
-diff --git a/gdb/gdbserver/linux-amd64-ipa.c b/gdb/gdbserver/linux-amd64-ipa.c
-index 2eeedcd..f9c72a0 100644
---- a/gdb/gdbserver/linux-amd64-ipa.c
-+++ b/gdb/gdbserver/linux-amd64-ipa.c
-@@ -20,6 +20,7 @@
-
- #include "server.h"
- #include "tracepoint.h"
-+#include "linux-x86-tdesc.h"
-
- /* Defined in auto-generated file amd64-linux.c.  */
- void init_registers_amd64_linux (void);
-@@ -166,9 +167,37 @@ supply_static_tracepoint_registers (struct regcache *regcache,
-
- #endif /* HAVE_UST */
-
-+/* Return target_desc to use for IPA, given the tdesc index passed by
-+   gdbserver.  */
-+
-+const struct target_desc *
-+get_ipa_tdesc (int idx)
-+{
-+  switch (idx)
-+    {
-+    case X86_TDESC_SSE:
-+      return tdesc_amd64_linux;
-+    case X86_TDESC_AVX:
-+      return tdesc_amd64_avx_linux;
-+    case X86_TDESC_MPX:
-+      return tdesc_amd64_mpx_linux;
-+    case X86_TDESC_AVX_MPX:
-+      return tdesc_amd64_avx_mpx_linux;
-+    case X86_TDESC_AVX512:
-+      return tdesc_amd64_avx512_linux;
-+    default:
-+      internal_error (__FILE__, __LINE__,
-+		      "unknown ipa tdesc index: %d", idx);
-+      return tdesc_amd64_linux;
-+    }
-+}
-+
- void
- initialize_low_tracepoint (void)
- {
-   init_registers_amd64_linux ();
--  ipa_tdesc = tdesc_amd64_linux;
-+  init_registers_amd64_avx_linux ();
-+  init_registers_amd64_avx_mpx_linux ();
-+  init_registers_amd64_mpx_linux ();
-+  init_registers_amd64_avx512_linux ();
- }
-diff --git a/gdb/gdbserver/linux-i386-ipa.c b/gdb/gdbserver/linux-i386-ipa.c
-index 11dc038..d7a8e7d 100644
---- a/gdb/gdbserver/linux-i386-ipa.c
-+++ b/gdb/gdbserver/linux-i386-ipa.c
-@@ -21,6 +21,7 @@
- #include "server.h"
- #include <sys/mman.h>
- #include "tracepoint.h"
-+#include "linux-x86-tdesc.h"
-
- /* GDB register numbers.  */
-
-@@ -47,10 +48,6 @@ enum i386_gdb_regnum
-
- #define i386_num_regs 16
-
--/* Defined in auto-generated file i386-linux.c.  */
--void init_registers_i386_linux (void);
--extern const struct target_desc *tdesc_i386_linux;
--
- #define FT_CR_EAX 15
- #define FT_CR_ECX 14
- #define FT_CR_EDX 13
-@@ -247,10 +244,40 @@ initialize_fast_tracepoint_trampoline_buffer (void)
-     }
- }
-
-+/* Return target_desc to use for IPA, given the tdesc index passed by
-+   gdbserver.  */
-+
-+const struct target_desc *
-+get_ipa_tdesc (int idx)
-+{
-+  switch (idx)
-+    {
-+    case X86_TDESC_MMX:
-+      return tdesc_i386_mmx_linux;
-+    case X86_TDESC_SSE:
-+      return tdesc_i386_linux;
-+    case X86_TDESC_AVX:
-+      return tdesc_i386_avx_linux;
-+    case X86_TDESC_MPX:
-+      return tdesc_i386_mpx_linux;
-+    case X86_TDESC_AVX_MPX:
-+      return tdesc_i386_avx_mpx_linux;
-+    case X86_TDESC_AVX512:
-+      return tdesc_i386_avx512_linux;
-+    default:
-+      internal_error (__FILE__, __LINE__,
-+		      "unknown ipa tdesc index: %d", idx);
-+      return tdesc_i386_linux;
-+    }
-+}
-+
- void
- initialize_low_tracepoint (void)
- {
-+  init_registers_i386_mmx_linux ();
-   init_registers_i386_linux ();
--  ipa_tdesc = tdesc_i386_linux;
-+  init_registers_i386_avx_linux ();
-+  init_registers_i386_mpx_linux ();
-+  init_registers_i386_avx512_linux ();
-   initialize_fast_tracepoint_trampoline_buffer ();
- }
-diff --git a/gdb/gdbserver/linux-low.c b/gdb/gdbserver/linux-low.c
-index 8b025bd..a142c2c 100644
---- a/gdb/gdbserver/linux-low.c
-+++ b/gdb/gdbserver/linux-low.c
-@@ -6432,6 +6432,15 @@ linux_supports_catch_syscall (void)
- }
-
- static int
-+linux_get_ipa_tdesc_idx (void)
-+{
-+  if (the_low_target.get_ipa_tdesc_idx == NULL)
-+    return 0;
-+
-+  return (*the_low_target.get_ipa_tdesc_idx) ();
-+}
-+
-+static int
- linux_supports_tracepoints (void)
- {
-   if (*the_low_target.supports_tracepoints == NULL)
-@@ -7408,6 +7417,7 @@ static struct target_ops linux_target_ops = {
-   linux_breakpoint_kind_from_current_state,
-   linux_supports_software_single_step,
-   linux_supports_catch_syscall,
-+  linux_get_ipa_tdesc_idx,
- };
-
- #ifdef HAVE_LINUX_REGSETS
-diff --git a/gdb/gdbserver/linux-low.h b/gdb/gdbserver/linux-low.h
-index 4ec8550..d4946c1 100644
---- a/gdb/gdbserver/linux-low.h
-+++ b/gdb/gdbserver/linux-low.h
-@@ -246,6 +246,9 @@ struct linux_target_ops
-      due to SYSCALL_SIGTRAP.  */
-   void (*get_syscall_trapinfo) (struct regcache *regcache,
- 				int *sysno, int *sysret);
-+
-+  /* See target.h.  */
-+  int (*get_ipa_tdesc_idx) (void);
- };
-
- extern struct linux_target_ops the_low_target;
-diff --git a/gdb/gdbserver/linux-x86-low.c b/gdb/gdbserver/linux-x86-low.c
-index 0c4954a..2535959 100644
---- a/gdb/gdbserver/linux-x86-low.c
-+++ b/gdb/gdbserver/linux-x86-low.c
-@@ -45,57 +45,7 @@
- #include "nat/linux-nat.h"
- #include "nat/x86-linux.h"
- #include "nat/x86-linux-dregs.h"
--
--#ifdef __x86_64__
--/* Defined in auto-generated file amd64-linux.c.  */
--void init_registers_amd64_linux (void);
--extern const struct target_desc *tdesc_amd64_linux;
--
--/* Defined in auto-generated file amd64-avx-linux.c.  */
--void init_registers_amd64_avx_linux (void);
--extern const struct target_desc *tdesc_amd64_avx_linux;
--
--/* Defined in auto-generated file amd64-avx512-linux.c.  */
--void init_registers_amd64_avx512_linux (void);
--extern const struct target_desc *tdesc_amd64_avx512_linux;
--
--/* Defined in auto-generated file amd64-mpx-linux.c.  */
--void init_registers_amd64_mpx_linux (void);
--extern const struct target_desc *tdesc_amd64_mpx_linux;
--
--/* Defined in auto-generated file x32-linux.c.  */
--void init_registers_x32_linux (void);
--extern const struct target_desc *tdesc_x32_linux;
--
--/* Defined in auto-generated file x32-avx-linux.c.  */
--void init_registers_x32_avx_linux (void);
--extern const struct target_desc *tdesc_x32_avx_linux;
--
--/* Defined in auto-generated file x32-avx512-linux.c.  */
--void init_registers_x32_avx512_linux (void);
--extern const struct target_desc *tdesc_x32_avx512_linux;
--
--#endif
--
--/* Defined in auto-generated file i386-linux.c.  */
--void init_registers_i386_linux (void);
--extern const struct target_desc *tdesc_i386_linux;
--
--/* Defined in auto-generated file i386-mmx-linux.c.  */
--void init_registers_i386_mmx_linux (void);
--extern const struct target_desc *tdesc_i386_mmx_linux;
--
--/* Defined in auto-generated file i386-avx-linux.c.  */
--void init_registers_i386_avx_linux (void);
--extern const struct target_desc *tdesc_i386_avx_linux;
--
--/* Defined in auto-generated file i386-avx512-linux.c.  */
--void init_registers_i386_avx512_linux (void);
--extern const struct target_desc *tdesc_i386_avx512_linux;
--
--/* Defined in auto-generated file i386-mpx-linux.c.  */
--void init_registers_i386_mpx_linux (void);
--extern const struct target_desc *tdesc_i386_mpx_linux;
-+#include "linux-x86-tdesc.h"
-
- #ifdef __x86_64__
- static struct target_desc *tdesc_amd64_linux_no_xml;
-@@ -839,6 +789,9 @@ x86_linux_read_description (void)
- 		case X86_XSTATE_AVX512_MASK:
- 		  return tdesc_amd64_avx512_linux;
-
-+		case X86_XSTATE_AVX_MPX_MASK:
-+		  return tdesc_amd64_avx_mpx_linux;
-+
- 		case X86_XSTATE_MPX_MASK:
- 		  return tdesc_amd64_mpx_linux;
-
-@@ -886,6 +839,9 @@ x86_linux_read_description (void)
- 	    case (X86_XSTATE_MPX_MASK):
- 	      return tdesc_i386_mpx_linux;
-
-+	    case (X86_XSTATE_AVX_MPX_MASK):
-+	      return tdesc_i386_avx_mpx_linux;
-+
- 	    case (X86_XSTATE_AVX_MASK):
- 	      return tdesc_i386_avx_linux;
-
-@@ -2891,6 +2847,42 @@ x86_supports_hardware_single_step (void)
-   return 1;
- }
-
-+static int
-+x86_get_ipa_tdesc_idx (void)
-+{
-+  struct regcache *regcache = get_thread_regcache (current_thread, 0);
-+  const struct target_desc *tdesc = regcache->tdesc;
-+
-+#ifdef __x86_64__
-+  if (tdesc == tdesc_amd64_linux || tdesc == tdesc_amd64_linux_no_xml
-+      || tdesc == tdesc_x32_linux)
-+    return X86_TDESC_SSE;
-+  if (tdesc == tdesc_amd64_avx_linux || tdesc == tdesc_x32_avx_linux)
-+    return X86_TDESC_AVX;
-+  if (tdesc == tdesc_amd64_mpx_linux)
-+    return X86_TDESC_MPX;
-+  if (tdesc == tdesc_amd64_avx_mpx_linux)
-+    return X86_TDESC_AVX_MPX;
-+  if (tdesc == tdesc_amd64_avx512_linux || tdesc == tdesc_x32_avx512_linux)
-+    return X86_TDESC_AVX512;
-+#endif
-+
-+  if (tdesc == tdesc_i386_mmx_linux)
-+    return X86_TDESC_MMX;
-+  if (tdesc == tdesc_i386_linux || tdesc == tdesc_i386_linux_no_xml)
-+    return X86_TDESC_SSE;
-+  if (tdesc == tdesc_i386_avx_linux)
-+    return X86_TDESC_AVX;
-+  if (tdesc == tdesc_i386_mpx_linux)
-+    return X86_TDESC_MPX;
-+  if (tdesc == tdesc_i386_avx_mpx_linux)
-+    return X86_TDESC_AVX_MPX;
-+  if (tdesc == tdesc_i386_avx512_linux)
-+    return X86_TDESC_AVX512;
-+
-+  return 0;
-+}
-+
- /* This is initialized assuming an amd64 target.
-    x86_arch_setup will correct it for i386 or amd64 targets.  */
-
-@@ -2934,6 +2926,7 @@ struct linux_target_ops the_low_target =
-   NULL, /* breakpoint_kind_from_current_state */
-   x86_supports_hardware_single_step,
-   x86_get_syscall_trapinfo,
-+  x86_get_ipa_tdesc_idx,
- };
-
- void
-@@ -2945,6 +2938,7 @@ initialize_low_arch (void)
-   init_registers_amd64_avx_linux ();
-   init_registers_amd64_avx512_linux ();
-   init_registers_amd64_mpx_linux ();
-+  init_registers_amd64_avx_mpx_linux ();
-
-   init_registers_x32_linux ();
-   init_registers_x32_avx_linux ();
-@@ -2959,6 +2953,7 @@ initialize_low_arch (void)
-   init_registers_i386_avx_linux ();
-   init_registers_i386_avx512_linux ();
-   init_registers_i386_mpx_linux ();
-+  init_registers_i386_avx_mpx_linux ();
-
-   tdesc_i386_linux_no_xml = XNEW (struct target_desc);
-   copy_target_description (tdesc_i386_linux_no_xml, tdesc_i386_linux);
-diff --git a/gdb/gdbserver/linux-x86-tdesc.h b/gdb/gdbserver/linux-x86-tdesc.h
-new file mode 100644
-index 0000000..720f50c
---- /dev/null
-+++ b/gdb/gdbserver/linux-x86-tdesc.h
-@@ -0,0 +1,98 @@
-+/* Low level support for x86 (i386 and x86-64), shared between gdbserver
-+   and IPA.
-+
-+   Copyright (C) 2016 Free Software Foundation, Inc.
-+
-+   This file is part of GDB.
-+
-+   This program is free software; you can redistribute it and/or modify
-+   it under the terms of the GNU General Public License as published by
-+   the Free Software Foundation; either version 3 of the License, or
-+   (at your option) any later version.
-+
-+   This program is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+   GNU General Public License for more details.
-+
-+   You should have received a copy of the GNU General Public License
-+   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
-+
-+/* Note: since IPA obviously knows what ABI it's running on (i386 vs x86_64
-+   vs x32), it's sufficient to pass only the register set here.  This,
-+   together with the ABI known at IPA compile time, maps to a tdesc.  */
-+
-+enum x86_linux_tdesc {
-+  X86_TDESC_MMX = 0,
-+  X86_TDESC_SSE = 1,
-+  X86_TDESC_AVX = 2,
-+  X86_TDESC_MPX = 3,
-+  X86_TDESC_AVX_MPX = 4,
-+  X86_TDESC_AVX512 = 5,
-+};
-+
-+#ifdef __x86_64__
-+
-+#if defined __LP64__  || !defined IN_PROCESS_AGENT
-+/* Defined in auto-generated file amd64-linux.c.  */
-+void init_registers_amd64_linux (void);
-+extern const struct target_desc *tdesc_amd64_linux;
-+
-+/* Defined in auto-generated file amd64-avx-linux.c.  */
-+void init_registers_amd64_avx_linux (void);
-+extern const struct target_desc *tdesc_amd64_avx_linux;
-+
-+/* Defined in auto-generated file amd64-avx512-linux.c.  */
-+void init_registers_amd64_avx512_linux (void);
-+extern const struct target_desc *tdesc_amd64_avx512_linux;
-+
-+/* Defined in auto-generated file amd64-avx-mpx-linux.c.  */
-+void init_registers_amd64_avx_mpx_linux (void);
-+extern const struct target_desc *tdesc_amd64_avx_mpx_linux;
-+
-+/* Defined in auto-generated file amd64-mpx-linux.c.  */
-+void init_registers_amd64_mpx_linux (void);
-+extern const struct target_desc *tdesc_amd64_mpx_linux;
-+#endif
-+
-+#if defined __ILP32__ || !defined IN_PROCESS_AGENT
-+/* Defined in auto-generated file x32-linux.c.  */
-+void init_registers_x32_linux (void);
-+extern const struct target_desc *tdesc_x32_linux;
-+
-+/* Defined in auto-generated file x32-avx-linux.c.  */
-+void init_registers_x32_avx_linux (void);
-+extern const struct target_desc *tdesc_x32_avx_linux;
-+
-+/* Defined in auto-generated file x32-avx512-linux.c.  */
-+void init_registers_x32_avx512_linux (void);
-+extern const struct target_desc *tdesc_x32_avx512_linux;
-+#endif
-+
-+#endif
-+
-+#if defined __i386__ || !defined IN_PROCESS_AGENT
-+/* Defined in auto-generated file i386-linux.c.  */
-+void init_registers_i386_linux (void);
-+extern const struct target_desc *tdesc_i386_linux;
-+
-+/* Defined in auto-generated file i386-mmx-linux.c.  */
-+void init_registers_i386_mmx_linux (void);
-+extern const struct target_desc *tdesc_i386_mmx_linux;
-+
-+/* Defined in auto-generated file i386-avx-linux.c.  */
-+void init_registers_i386_avx_linux (void);
-+extern const struct target_desc *tdesc_i386_avx_linux;
-+
-+/* Defined in auto-generated file i386-avx-mpx-linux.c.  */
-+void init_registers_i386_avx_mpx_linux (void);
-+extern const struct target_desc *tdesc_i386_avx_mpx_linux;
-+
-+/* Defined in auto-generated file i386-avx512-linux.c.  */
-+void init_registers_i386_avx512_linux (void);
-+extern const struct target_desc *tdesc_i386_avx512_linux;
-+
-+/* Defined in auto-generated file i386-mpx-linux.c.  */
-+void init_registers_i386_mpx_linux (void);
-+extern const struct target_desc *tdesc_i386_mpx_linux;
-+#endif
-diff --git a/gdb/gdbserver/target.h b/gdb/gdbserver/target.h
-index 5af2051..4c14c20 100644
---- a/gdb/gdbserver/target.h
-+++ b/gdb/gdbserver/target.h
-@@ -471,6 +471,9 @@ struct target_ops
-   /* Return 1 if the target supports catch syscall, 0 (or leave the
-      callback NULL) otherwise.  */
-   int (*supports_catch_syscall) (void);
-+
-+  /* Return tdesc index for IPA.  */
-+  int (*get_ipa_tdesc_idx) (void);
- };
-
- extern struct target_ops *the_target;
-@@ -550,6 +553,10 @@ int kill_inferior (int);
-   (the_target->supports_catch_syscall ?			\
-    (*the_target->supports_catch_syscall) () : 0)
-
-+#define target_get_ipa_tdesc_idx()			\
-+  (the_target->get_ipa_tdesc_idx			\
-+   ? (*the_target->get_ipa_tdesc_idx) () : 0)
-+
- #define target_supports_tracepoints()			\
-   (the_target->supports_tracepoints			\
-    ? (*the_target->supports_tracepoints) () : 0)
-diff --git a/gdb/gdbserver/tracepoint.c b/gdb/gdbserver/tracepoint.c
-index 0671999..cc86677 100644
---- a/gdb/gdbserver/tracepoint.c
-+++ b/gdb/gdbserver/tracepoint.c
-@@ -134,6 +134,7 @@ trace_vdebug (const char *fmt, ...)
- # define ust_loaded IPA_SYM_EXPORTED_NAME (ust_loaded)
- # define helper_thread_id IPA_SYM_EXPORTED_NAME (helper_thread_id)
- # define cmd_buf IPA_SYM_EXPORTED_NAME (cmd_buf)
-+# define ipa_tdesc_idx IPA_SYM_EXPORTED_NAME (ipa_tdesc_idx)
- #endif
-
- #ifndef IN_PROCESS_AGENT
-@@ -171,6 +172,7 @@ struct ipa_sym_addresses
-   CORE_ADDR addr_get_trace_state_variable_value;
-   CORE_ADDR addr_set_trace_state_variable_value;
-   CORE_ADDR addr_ust_loaded;
-+  CORE_ADDR addr_ipa_tdesc_idx;
- };
-
- static struct
-@@ -207,6 +209,7 @@ static struct
-   IPA_SYM(get_trace_state_variable_value),
-   IPA_SYM(set_trace_state_variable_value),
-   IPA_SYM(ust_loaded),
-+  IPA_SYM(ipa_tdesc_idx),
- };
-
- static struct ipa_sym_addresses ipa_sym_addrs;
-@@ -3231,6 +3234,11 @@ cmd_qtstart (char *packet)
-
-   *packet = '\0';
-
-+  /* Tell IPA about the correct tdesc.  */
-+  if (write_inferior_integer (ipa_sym_addrs.addr_ipa_tdesc_idx,
-+			      target_get_ipa_tdesc_idx ()))
-+    error ("Error setting ipa_tdesc_idx variable in lib");
-+
-   /* Start out empty.  */
-   if (agent_loaded_p ())
-     write_inferior_data_ptr (ipa_sym_addrs.addr_tracepoints, 0);
-@@ -4714,19 +4722,20 @@ collect_data_at_step (struct tracepoint_hit_ctx *ctx,
- #endif
-
- #ifdef IN_PROCESS_AGENT
--/* The target description used by the IPA.  Given that the IPA library
--   is built for a specific architecture that is loaded into the
--   inferior, there only needs to be one such description per
--   build.  */
--const struct target_desc *ipa_tdesc;
-+/* The target description index for IPA.  Passed from gdbserver, used
-+   to select ipa_tdesc.  */
-+EXTERN_C_PUSH
-+IP_AGENT_EXPORT_VAR int ipa_tdesc_idx;
-+EXTERN_C_POP
- #endif
-
- static struct regcache *
- get_context_regcache (struct tracepoint_hit_ctx *ctx)
- {
-   struct regcache *regcache = NULL;
--
- #ifdef IN_PROCESS_AGENT
-+  const struct target_desc *ipa_tdesc = get_ipa_tdesc (ipa_tdesc_idx);
-+
-   if (ctx->type == fast_tracepoint)
-     {
-       struct fast_tracepoint_ctx *fctx = (struct fast_tracepoint_ctx *) ctx;
-@@ -5799,11 +5808,13 @@ IP_AGENT_EXPORT_FUNC void
- gdb_collect (struct tracepoint *tpoint, unsigned char *regs)
- {
-   struct fast_tracepoint_ctx ctx;
-+  const struct target_desc *ipa_tdesc;
-
-   /* Don't do anything until the trace run is completely set up.  */
-   if (!tracing)
-     return;
-
-+  ipa_tdesc = get_ipa_tdesc (ipa_tdesc_idx);
-   ctx.base.type = fast_tracepoint;
-   ctx.regs = regs;
-   ctx.regcache_initted = 0;
-@@ -6660,6 +6671,7 @@ gdb_probe (const struct marker *mdata, void *probe_private,
- {
-   struct tracepoint *tpoint;
-   struct static_tracepoint_ctx ctx;
-+  const struct target_desc *ipa_tdesc;
-
-   /* Don't do anything until the trace run is completely set up.  */
-   if (!tracing)
-@@ -6668,6 +6680,7 @@ gdb_probe (const struct marker *mdata, void *probe_private,
-       return;
-     }
-
-+  ipa_tdesc = get_ipa_tdesc (ipa_tdesc_idx);
-   ctx.base.type = static_tracepoint;
-   ctx.regcache_initted = 0;
-   ctx.regs = regs;
-diff --git a/gdb/gdbserver/tracepoint.h b/gdb/gdbserver/tracepoint.h
-index cab89cf..e30f4f7 100644
---- a/gdb/gdbserver/tracepoint.h
-+++ b/gdb/gdbserver/tracepoint.h
-@@ -124,6 +124,7 @@ int handle_tracepoint_bkpts (struct thread_info *tinfo, CORE_ADDR stop_pc);
-
- #ifdef IN_PROCESS_AGENT
- void initialize_low_tracepoint (void);
-+const struct target_desc *get_ipa_tdesc (int idx);
- void supply_fast_tracepoint_registers (struct regcache *regcache,
- 				       const unsigned char *regs);
- void supply_static_tracepoint_registers (struct regcache *regcache,
-@@ -131,9 +132,6 @@ void supply_static_tracepoint_registers (struct regcache *regcache,
- 					 CORE_ADDR pc);
- void set_trampoline_buffer_space (CORE_ADDR begin, CORE_ADDR end,
- 				  char *errmsg);
--
--extern const struct target_desc *ipa_tdesc;
--
- #else
- void stop_tracing (void);
-
-diff --git a/gdb/i386-linux-tdep.c b/gdb/i386-linux-tdep.c
-index af39e78..df47efd 100644
---- a/gdb/i386-linux-tdep.c
-+++ b/gdb/i386-linux-tdep.c
-@@ -47,6 +47,7 @@
- #include "features/i386/i386-linux.c"
- #include "features/i386/i386-mmx-linux.c"
- #include "features/i386/i386-mpx-linux.c"
-+#include "features/i386/i386-avx-mpx-linux.c"
- #include "features/i386/i386-avx-linux.c"
- #include "features/i386/i386-avx512-linux.c"
-
-@@ -630,6 +631,8 @@ i386_linux_core_read_description (struct gdbarch *gdbarch,
-       return tdesc_i386_avx512_linux;
-     case X86_XSTATE_MPX_MASK:
-       return tdesc_i386_mpx_linux;
-+    case X86_XSTATE_AVX_MPX_MASK:
-+      return tdesc_i386_avx_mpx_linux;
-     case X86_XSTATE_AVX_MASK:
-       return tdesc_i386_avx_linux;
-     case X86_XSTATE_SSE_MASK:
-@@ -1018,5 +1021,6 @@ _initialize_i386_linux_tdep (void)
-   initialize_tdesc_i386_mmx_linux ();
-   initialize_tdesc_i386_avx_linux ();
-   initialize_tdesc_i386_mpx_linux ();
-+  initialize_tdesc_i386_avx_mpx_linux ();
-   initialize_tdesc_i386_avx512_linux ();
- }
-diff --git a/gdb/i386-linux-tdep.h b/gdb/i386-linux-tdep.h
-index ecc9e31..0cb0c4d 100644
---- a/gdb/i386-linux-tdep.h
-+++ b/gdb/i386-linux-tdep.h
-@@ -42,6 +42,7 @@ extern struct target_desc *tdesc_i386_linux;
- extern struct target_desc *tdesc_i386_mmx_linux;
- extern struct target_desc *tdesc_i386_avx_linux;
- extern struct target_desc *tdesc_i386_mpx_linux;
-+extern struct target_desc *tdesc_i386_avx_mpx_linux;
- extern struct target_desc *tdesc_i386_avx512_linux;
-
- /* Format of XSAVE extended state is:
-diff --git a/gdb/i386-tdep.c b/gdb/i386-tdep.c
-index b706463..1ec0a08 100644
---- a/gdb/i386-tdep.c
-+++ b/gdb/i386-tdep.c
-@@ -53,6 +53,7 @@
- #include "features/i386/i386.c"
- #include "features/i386/i386-avx.c"
- #include "features/i386/i386-mpx.c"
-+#include "features/i386/i386-avx-mpx.c"
- #include "features/i386/i386-avx512.c"
- #include "features/i386/i386-mmx.c"
-
-@@ -8618,6 +8619,8 @@ i386_target_description (uint64_t xcr0)
-     case X86_XSTATE_MPX_AVX512_MASK:
-     case X86_XSTATE_AVX512_MASK:
-       return tdesc_i386_avx512;
-+    case X86_XSTATE_AVX_MPX_MASK:
-+      return tdesc_i386_avx_mpx;
-     case X86_XSTATE_MPX_MASK:
-       return tdesc_i386_mpx;
-     case X86_XSTATE_AVX_MASK:
-@@ -8957,6 +8960,7 @@ Show Intel Memory Protection Extensions specific variables."),
-   initialize_tdesc_i386_mmx ();
-   initialize_tdesc_i386_avx ();
-   initialize_tdesc_i386_mpx ();
-+  initialize_tdesc_i386_avx_mpx ();
-   initialize_tdesc_i386_avx512 ();
-
-   /* Tell remote stub that we support XML target description.  */
-diff --git a/gdb/regformats/i386/amd64-avx-mpx-linux.dat b/gdb/regformats/i386/amd64-avx-mpx-linux.dat
-new file mode 100644
-index 0000000..6d45324
---- /dev/null
-+++ b/gdb/regformats/i386/amd64-avx-mpx-linux.dat
-@@ -0,0 +1,85 @@
-+# THIS FILE IS GENERATED.  -*- buffer-read-only: t -*- vi :set ro:
-+# Generated from: i386/amd64-avx-mpx-linux.xml
-+name:amd64_avx_mpx_linux
-+xmltarget:amd64-avx-mpx-linux.xml
-+expedite:rbp,rsp,rip
-+64:rax
-+64:rbx
-+64:rcx
-+64:rdx
-+64:rsi
-+64:rdi
-+64:rbp
-+64:rsp
-+64:r8
-+64:r9
-+64:r10
-+64:r11
-+64:r12
-+64:r13
-+64:r14
-+64:r15
-+64:rip
-+32:eflags
-+32:cs
-+32:ss
-+32:ds
-+32:es
-+32:fs
-+32:gs
-+80:st0
-+80:st1
-+80:st2
-+80:st3
-+80:st4
-+80:st5
-+80:st6
-+80:st7
-+32:fctrl
-+32:fstat
-+32:ftag
-+32:fiseg
-+32:fioff
-+32:foseg
-+32:fooff
-+32:fop
-+128:xmm0
-+128:xmm1
-+128:xmm2
-+128:xmm3
-+128:xmm4
-+128:xmm5
-+128:xmm6
-+128:xmm7
-+128:xmm8
-+128:xmm9
-+128:xmm10
-+128:xmm11
-+128:xmm12
-+128:xmm13
-+128:xmm14
-+128:xmm15
-+32:mxcsr
-+64:orig_rax
-+128:ymm0h
-+128:ymm1h
-+128:ymm2h
-+128:ymm3h
-+128:ymm4h
-+128:ymm5h
-+128:ymm6h
-+128:ymm7h
-+128:ymm8h
-+128:ymm9h
-+128:ymm10h
-+128:ymm11h
-+128:ymm12h
-+128:ymm13h
-+128:ymm14h
-+128:ymm15h
-+128:bnd0raw
-+128:bnd1raw
-+128:bnd2raw
-+128:bnd3raw
-+64:bndcfgu
-+64:bndstatus
-diff --git a/gdb/regformats/i386/amd64-avx-mpx.dat b/gdb/regformats/i386/amd64-avx-mpx.dat
-new file mode 100644
-index 0000000..d985641
---- /dev/null
-+++ b/gdb/regformats/i386/amd64-avx-mpx.dat
-@@ -0,0 +1,84 @@
-+# THIS FILE IS GENERATED.  -*- buffer-read-only: t -*- vi :set ro:
-+# Generated from: i386/amd64-avx-mpx.xml
-+name:amd64_avx_mpx
-+xmltarget:amd64-avx-mpx.xml
-+expedite:rbp,rsp,rip
-+64:rax
-+64:rbx
-+64:rcx
-+64:rdx
-+64:rsi
-+64:rdi
-+64:rbp
-+64:rsp
-+64:r8
-+64:r9
-+64:r10
-+64:r11
-+64:r12
-+64:r13
-+64:r14
-+64:r15
-+64:rip
-+32:eflags
-+32:cs
-+32:ss
-+32:ds
-+32:es
-+32:fs
-+32:gs
-+80:st0
-+80:st1
-+80:st2
-+80:st3
-+80:st4
-+80:st5
-+80:st6
-+80:st7
-+32:fctrl
-+32:fstat
-+32:ftag
-+32:fiseg
-+32:fioff
-+32:foseg
-+32:fooff
-+32:fop
-+128:xmm0
-+128:xmm1
-+128:xmm2
-+128:xmm3
-+128:xmm4
-+128:xmm5
-+128:xmm6
-+128:xmm7
-+128:xmm8
-+128:xmm9
-+128:xmm10
-+128:xmm11
-+128:xmm12
-+128:xmm13
-+128:xmm14
-+128:xmm15
-+32:mxcsr
-+128:ymm0h
-+128:ymm1h
-+128:ymm2h
-+128:ymm3h
-+128:ymm4h
-+128:ymm5h
-+128:ymm6h
-+128:ymm7h
-+128:ymm8h
-+128:ymm9h
-+128:ymm10h
-+128:ymm11h
-+128:ymm12h
-+128:ymm13h
-+128:ymm14h
-+128:ymm15h
-+128:bnd0raw
-+128:bnd1raw
-+128:bnd2raw
-+128:bnd3raw
-+64:bndcfgu
-+64:bndstatus
-diff --git a/gdb/regformats/i386/amd64-mpx-linux.dat b/gdb/regformats/i386/amd64-mpx-linux.dat
-index 7a05cfe..523ae01 100644
---- a/gdb/regformats/i386/amd64-mpx-linux.dat
-+++ b/gdb/regformats/i386/amd64-mpx-linux.dat
-@@ -61,22 +61,6 @@ expedite:rbp,rsp,rip
- 128:xmm15
- 32:mxcsr
- 64:orig_rax
--128:ymm0h
--128:ymm1h
--128:ymm2h
--128:ymm3h
--128:ymm4h
--128:ymm5h
--128:ymm6h
--128:ymm7h
--128:ymm8h
--128:ymm9h
--128:ymm10h
--128:ymm11h
--128:ymm12h
--128:ymm13h
--128:ymm14h
--128:ymm15h
- 128:bnd0raw
- 128:bnd1raw
- 128:bnd2raw
-diff --git a/gdb/regformats/i386/amd64-mpx.dat b/gdb/regformats/i386/amd64-mpx.dat
-index 1b75f4d..43b8776 100644
---- a/gdb/regformats/i386/amd64-mpx.dat
-+++ b/gdb/regformats/i386/amd64-mpx.dat
-@@ -60,22 +60,6 @@ expedite:rbp,rsp,rip
- 128:xmm14
- 128:xmm15
- 32:mxcsr
--128:ymm0h
--128:ymm1h
--128:ymm2h
--128:ymm3h
--128:ymm4h
--128:ymm5h
--128:ymm6h
--128:ymm7h
--128:ymm8h
--128:ymm9h
--128:ymm10h
--128:ymm11h
--128:ymm12h
--128:ymm13h
--128:ymm14h
--128:ymm15h
- 128:bnd0raw
- 128:bnd1raw
- 128:bnd2raw
-diff --git a/gdb/regformats/i386/i386-avx-mpx-linux.dat b/gdb/regformats/i386/i386-avx-mpx-linux.dat
-new file mode 100644
-index 0000000..831c476
---- /dev/null
-+++ b/gdb/regformats/i386/i386-avx-mpx-linux.dat
-@@ -0,0 +1,61 @@
-+# THIS FILE IS GENERATED.  -*- buffer-read-only: t -*- vi :set ro:
-+# Generated from: i386/i386-avx-mpx-linux.xml
-+name:i386_avx_mpx_linux
-+xmltarget:i386-avx-mpx-linux.xml
-+expedite:ebp,esp,eip
-+32:eax
-+32:ecx
-+32:edx
-+32:ebx
-+32:esp
-+32:ebp
-+32:esi
-+32:edi
-+32:eip
-+32:eflags
-+32:cs
-+32:ss
-+32:ds
-+32:es
-+32:fs
-+32:gs
-+80:st0
-+80:st1
-+80:st2
-+80:st3
-+80:st4
-+80:st5
-+80:st6
-+80:st7
-+32:fctrl
-+32:fstat
-+32:ftag
-+32:fiseg
-+32:fioff
-+32:foseg
-+32:fooff
-+32:fop
-+128:xmm0
-+128:xmm1
-+128:xmm2
-+128:xmm3
-+128:xmm4
-+128:xmm5
-+128:xmm6
-+128:xmm7
-+32:mxcsr
-+32:orig_eax
-+128:ymm0h
-+128:ymm1h
-+128:ymm2h
-+128:ymm3h
-+128:ymm4h
-+128:ymm5h
-+128:ymm6h
-+128:ymm7h
-+128:bnd0raw
-+128:bnd1raw
-+128:bnd2raw
-+128:bnd3raw
-+64:bndcfgu
-+64:bndstatus
-diff --git a/gdb/regformats/i386/i386-avx-mpx.dat b/gdb/regformats/i386/i386-avx-mpx.dat
-new file mode 100644
-index 0000000..8caef75
---- /dev/null
-+++ b/gdb/regformats/i386/i386-avx-mpx.dat
-@@ -0,0 +1,60 @@
-+# THIS FILE IS GENERATED.  -*- buffer-read-only: t -*- vi :set ro:
-+# Generated from: i386/i386-avx-mpx.xml
-+name:i386_avx_mpx
-+xmltarget:i386-avx-mpx.xml
-+expedite:ebp,esp,eip
-+32:eax
-+32:ecx
-+32:edx
-+32:ebx
-+32:esp
-+32:ebp
-+32:esi
-+32:edi
-+32:eip
-+32:eflags
-+32:cs
-+32:ss
-+32:ds
-+32:es
-+32:fs
-+32:gs
-+80:st0
-+80:st1
-+80:st2
-+80:st3
-+80:st4
-+80:st5
-+80:st6
-+80:st7
-+32:fctrl
-+32:fstat
-+32:ftag
-+32:fiseg
-+32:fioff
-+32:foseg
-+32:fooff
-+32:fop
-+128:xmm0
-+128:xmm1
-+128:xmm2
-+128:xmm3
-+128:xmm4
-+128:xmm5
-+128:xmm6
-+128:xmm7
-+32:mxcsr
-+128:ymm0h
-+128:ymm1h
-+128:ymm2h
-+128:ymm3h
-+128:ymm4h
-+128:ymm5h
-+128:ymm6h
-+128:ymm7h
-+128:bnd0raw
-+128:bnd1raw
-+128:bnd2raw
-+128:bnd3raw
-+64:bndcfgu
-+64:bndstatus
-diff --git a/gdb/regformats/i386/i386-mpx-linux.dat b/gdb/regformats/i386/i386-mpx-linux.dat
-index b52b68d..1dcdce9 100644
---- a/gdb/regformats/i386/i386-mpx-linux.dat
-+++ b/gdb/regformats/i386/i386-mpx-linux.dat
-@@ -45,14 +45,6 @@ expedite:ebp,esp,eip
- 128:xmm7
- 32:mxcsr
- 32:orig_eax
--128:ymm0h
--128:ymm1h
--128:ymm2h
--128:ymm3h
--128:ymm4h
--128:ymm5h
--128:ymm6h
--128:ymm7h
- 128:bnd0raw
- 128:bnd1raw
- 128:bnd2raw
-diff --git a/gdb/regformats/i386/i386-mpx.dat b/gdb/regformats/i386/i386-mpx.dat
-index 0ea420b..dda5164 100644
---- a/gdb/regformats/i386/i386-mpx.dat
-+++ b/gdb/regformats/i386/i386-mpx.dat
-@@ -44,14 +44,6 @@ expedite:ebp,esp,eip
- 128:xmm6
- 128:xmm7
- 32:mxcsr
--128:ymm0h
--128:ymm1h
--128:ymm2h
--128:ymm3h
--128:ymm4h
--128:ymm5h
--128:ymm6h
--128:ymm7h
- 128:bnd0raw
- 128:bnd1raw
- 128:bnd2raw
-diff --git a/gdb/testsuite/gdb.trace/ftrace.exp b/gdb/testsuite/gdb.trace/ftrace.exp
-index 15ad7e7..3a94471 100644
---- a/gdb/testsuite/gdb.trace/ftrace.exp
-+++ b/gdb/testsuite/gdb.trace/ftrace.exp
-@@ -132,7 +132,6 @@ proc test_fast_tracepoints {} {
- 	gdb_test "tfind pc *set_point" "Found trace frame .*" \
- 	    "tfind set_point frame, first time"
-
--	setup_kfail "gdb/13808" "x86_64-*-linux*"
- 	gdb_test "print globvar" " = 1"
-
- 	gdb_test "tfind pc *set_point" "Found trace frame .*" \
-diff --git a/gdb/x86-linux-nat.c b/gdb/x86-linux-nat.c
-index 3cc18c1..107576f 100644
---- a/gdb/x86-linux-nat.c
-+++ b/gdb/x86-linux-nat.c
-@@ -215,6 +215,11 @@ x86_linux_read_description (struct target_ops *ops)
- 	    return tdesc_x32_avx_linux; /* No MPX on x32 using AVX.  */
- 	  else
- 	    return tdesc_amd64_mpx_linux;
-+	case X86_XSTATE_AVX_MPX_MASK:
-+	  if (is_x32)
-+	    return tdesc_x32_avx_linux; /* No MPX on x32 using AVX.  */
-+	  else
-+	    return tdesc_amd64_avx_mpx_linux;
- 	case X86_XSTATE_AVX_MASK:
- 	  if (is_x32)
- 	    return tdesc_x32_avx_linux;
-@@ -237,6 +242,8 @@ x86_linux_read_description (struct target_ops *ops)
- 	  return tdesc_i386_avx512_linux;
- 	case X86_XSTATE_MPX_MASK:
- 	  return tdesc_i386_mpx_linux;
-+	case X86_XSTATE_AVX_MPX_MASK:
-+	  return tdesc_i386_avx_mpx_linux;
- 	case X86_XSTATE_AVX_MASK:
- 	  return tdesc_i386_avx_linux;
- 	default:
diff --git a/meta/recipes-devtools/gdb/gdb_7.11.1.bb b/meta/recipes-devtools/gdb/gdb_7.12.bb
similarity index 92%
rename from meta/recipes-devtools/gdb/gdb_7.11.1.bb
rename to meta/recipes-devtools/gdb/gdb_7.12.bb
index 57cffc9983..4fddf81ffa 100644
--- a/meta/recipes-devtools/gdb/gdb_7.11.1.bb
+++ b/meta/recipes-devtools/gdb/gdb_7.12.bb
@@ -6,6 +6,7 @@ inherit python3-dir
 EXTRA_OEMAKE_append_libc-musl = "\
                                  gt_cv_func_gnugettext1_libc=yes \
                                  gt_cv_func_gnugettext2_libc=yes \
+                                 gl_cv_func_gettimeofday_clobber=no \
                                 "
 
 do_configure_prepend() {
-- 
2.11.0


