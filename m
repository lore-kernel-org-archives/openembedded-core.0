Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id E1F0873D43
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Apr 2015 01:21:08 +0000 (UTC)
Received: by pacyx8 with SMTP id yx8so37831595pac.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 18:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=wkTi41kYo8bLemI42ylSyUaJiylIfLa2t9I4Kyc6dd8=;
	b=qa1K4YHZbn1dIR7yC6ZrqexqpEEdsJ0ZyUgfxpE4V43PgzQzy4DMxSiXb88FAzNUlx
	bC6XuIs7iRxNDSQTAewjHU2/o70ieCrOpTGaPIs+3hqe/1PQvP2ZtKH5XwFvA0gCPMfa
	scN+VAr/W2bFKqdCT1KrWIktud+KqHGthNVBGz/7KSyiqCXdqT+nya2AB8hUQLzQNzF0
	lwXfiruEMmLGgfCl9kjbmG1LuidD5EC75p/8Bw//Ls/MmFLU+WBbXJQ/RWNltV+shtRZ
	9/pr3t7f3gO9XNIX61JI302hQyzUGI2u/C7Mup1ElG3oEjVMrRlqoNl4Tz4xAaJyhYlJ
	8lKw==
X-Received: by 10.66.119.136 with SMTP id ku8mr7311961pab.29.1428715270063;
	Fri, 10 Apr 2015 18:21:10 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169])
	by mx.google.com with ESMTPSA id nb10sm259984pdb.76.2015.04.10.18.21.09
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 10 Apr 2015 18:21:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Apr 2015 18:20:47 -0700
Message-Id: <50820b0dc33db136bc127953f356ceb2e49de875.1428714999.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <9f232e6f50da95ec02e84c6c25a321250e439d79.1428714999.git.raj.khem@gmail.com>
References: <9f232e6f50da95ec02e84c6c25a321250e439d79.1428714999.git.raj.khem@gmail.com>
In-Reply-To: <cover.1428714999.git.raj.khem@gmail.com>
References: <cover.1428714999.git.raj.khem@gmail.com>
Subject: [PATCH 16/17] gdb: Refresh patches against git
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
X-List-Received-Date: Sat, 11 Apr 2015 01:21:09 -0000

Drop dead patches sim-install.patch, uclibc.patch

Change-Id: I5bd160d0959154896096ebc93a8a450d04979c73
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-cross_7.9.bb         |   2 +-
 meta/recipes-devtools/gdb/gdb.inc                  |   5 +-
 ...0001-make-man-install-relative-to-DESTDIR.patch |  28 +
 ...last.diff => 0002-Change-order-of-CFLAGS.patch} |  23 +-
 ...-support-for-Renesas-SH-sh4-architecture.patch} | 835 +++++----------------
 .../gdb/0004-Change-comment-in-gdb-compile.patch   |  48 ++
 .../recipes-devtools/gdb/gdb/sim-install-6.6.patch |  14 -
 meta/recipes-devtools/gdb/gdb/sim-install.patch    |  36 -
 meta/recipes-devtools/gdb/gdb/uclibc.patch         | 196 -----
 9 files changed, 286 insertions(+), 901 deletions(-)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTDIR.patch
 rename meta/recipes-devtools/gdb/gdb/{gdbserver-cflags-last.diff => 0002-Change-order-of-CFLAGS.patch} (55%)
 rename meta/recipes-devtools/gdb/gdb/{renesas-sh-native-support.patch => 0003-Add-support-for-Renesas-SH-sh4-architecture.patch} (60%)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0004-Change-comment-in-gdb-compile.patch
 delete mode 100644 meta/recipes-devtools/gdb/gdb/sim-install-6.6.patch
 delete mode 100644 meta/recipes-devtools/gdb/gdb/sim-install.patch
 delete mode 100644 meta/recipes-devtools/gdb/gdb/uclibc.patch

diff --git a/meta/recipes-devtools/gdb/gdb-cross_7.9.bb b/meta/recipes-devtools/gdb/gdb-cross_7.9.bb
index f9da486..3a95cfb 100644
--- a/meta/recipes-devtools/gdb/gdb-cross_7.9.bb
+++ b/meta/recipes-devtools/gdb/gdb-cross_7.9.bb
@@ -1,4 +1,4 @@
 require gdb-cross.inc
 require gdb-${PV}.inc
 
-SRC_URI += "file://sim-install-6.6.patch"
+SRC_URI += "file://0001-make-man-install-relative-to-DESTDIR.patch"
diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index 2c95e03..e65af4b 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -2,8 +2,9 @@ require gdb-common.inc
 
 inherit gettext
 
-SRC_URI += "file://gdbserver-cflags-last.diff;striplevel=0 \
-            file://renesas-sh-native-support.patch \
+SRC_URI += "file://0002-Change-order-of-CFLAGS.patch \
+            file://0003-Add-support-for-Renesas-SH-sh4-architecture.patch \
+            file://0004-Change-comment-in-gdb-compile.patch \
            "
 #LDFLAGS_append = " -s"
 #export CFLAGS_append=" -L${STAGING_LIBDIR}"
diff --git a/meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTDIR.patch b/meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTDIR.patch
new file mode 100644
index 0000000..e0221af
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTDIR.patch
@@ -0,0 +1,28 @@
+From d3ec939b82be23e7c9534cdc7502645f6c5856d1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 2 Mar 2015 02:27:55 +0000
+Subject: [PATCH 1/3] make man install relative to DESTDIR
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ sim/common/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sim/common/Makefile.in b/sim/common/Makefile.in
+index d49a93b..2121c46 100644
+--- a/sim/common/Makefile.in
++++ b/sim/common/Makefile.in
+@@ -35,7 +35,7 @@ tooldir = $(libdir)/$(target_alias)
+ datarootdir = @datarootdir@
+ datadir = @datadir@
+ mandir = @mandir@
+-man1dir = $(mandir)/man1
++man1dir = $(DESTDIR)$(mandir)/man1
+ infodir = @infodir@
+ includedir = @includedir@
+ 
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/gdb/gdb/gdbserver-cflags-last.diff b/meta/recipes-devtools/gdb/gdb/0002-Change-order-of-CFLAGS.patch
similarity index 55%
rename from meta/recipes-devtools/gdb/gdb/gdbserver-cflags-last.diff
rename to meta/recipes-devtools/gdb/gdb/0002-Change-order-of-CFLAGS.patch
index 16a3aa9..26a34d3 100644
--- a/meta/recipes-devtools/gdb/gdb/gdbserver-cflags-last.diff
+++ b/meta/recipes-devtools/gdb/gdb/0002-Change-order-of-CFLAGS.patch
@@ -1,13 +1,21 @@
-Upstream-Status: Pending
+From 0dcb0a8b139b44ae84e8fd8ff8130cbbb52e444d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 2 Mar 2015 02:29:23 +0000
+Subject: [PATCH 2/3] Change order of CFLAGS
 
+Lets us override Werror if need be
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- gdb/gdbserver/Makefile.in |    4 ++--
+ gdb/gdbserver/Makefile.in | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-Index: gdb/gdbserver/Makefile.in
-===================================================================
---- gdb/gdbserver/Makefile.in.orig
-+++ gdb/gdbserver/Makefile.in
+diff --git a/gdb/gdbserver/Makefile.in b/gdb/gdbserver/Makefile.in
+index 1ed2ec8..0cef95b 100644
+--- a/gdb/gdbserver/Makefile.in
++++ b/gdb/gdbserver/Makefile.in
 @@ -131,10 +131,10 @@ CFLAGS = @CFLAGS@
  CPPFLAGS = @CPPFLAGS@
  
@@ -21,3 +29,6 @@ Index: gdb/gdbserver/Makefile.in
  
  # LDFLAGS is specifically reserved for setting from the command line
  # when running make.
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/gdb/gdb/renesas-sh-native-support.patch b/meta/recipes-devtools/gdb/gdb/0003-Add-support-for-Renesas-SH-sh4-architecture.patch
similarity index 60%
rename from meta/recipes-devtools/gdb/gdb/renesas-sh-native-support.patch
rename to meta/recipes-devtools/gdb/gdb/0003-Add-support-for-Renesas-SH-sh4-architecture.patch
index 2259c6f..d82d269 100644
--- a/meta/recipes-devtools/gdb/gdb/renesas-sh-native-support.patch
+++ b/meta/recipes-devtools/gdb/gdb/0003-Add-support-for-Renesas-SH-sh4-architecture.patch
@@ -1,41 +1,35 @@
-Description: Add Renesas SH (sh4) support
- Add support for Renesas SH (sh4) architecture.
- .
- gdb (7.4-1~cvs20111117.2) experimental; urgency=low
+From 4e5507488068b3ea2ebf9c84c6c192c7bfd3be82 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 2 Mar 2015 02:31:12 +0000
+Subject: [PATCH 3/3] Add support for Renesas SH (sh4) architecture.
+
+gdb (7.4-1~cvs20111117.2) experimental; urgency=low
  .
    * Add Renesas SH (sh4) support (Closes: #576242)
      - Thanks Nobuhiro Iwamatsu, Takashi Yoshii.
 Author: Hector Oron <zumbi@debian.org>
 Bug-Debian: http://bugs.debian.org/576242
 
----
-The information above should follow the Patch Tagging Guidelines, please
-checkout http://dep.debian.net/deps/dep3/ to learn about the format. Here
-are templates for supplementary fields that you might want to add:
-
-Forwarded: <no|not-needed|url proving that it has been forwarded>
-Last-Update: <2011-11-17>
-
-
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gdb/Makefile.in                      |   1 +
+ gdb/configure.host                   |   1 +
+ gdb/sh-linux-tdep.c                  | 519 +++++++++++++++++++++++++++++++++++
+ gdb/sh-tdep.c                        |  54 ++--
+ gdb/sh-tdep.h                        |  49 ++++
+ gdb/testsuite/gdb.asm/asm-source.exp |   5 +
+ gdb/testsuite/gdb.asm/sh.inc         |   3 +-
+ gdb/testsuite/gdb.base/annota1.c     |   3 +
+ gdb/testsuite/gdb.base/annota3.c     |   4 +
+ gdb/testsuite/gdb.base/sigall.c      |   3 +
+ gdb/testsuite/gdb.base/signals.c     |   4 +
+ 11 files changed, 617 insertions(+), 29 deletions(-)
 
-Index: gdb-7.9/gdb/configure.host
-===================================================================
---- gdb-7.9.orig/gdb/configure.host
-+++ gdb-7.9/gdb/configure.host
-@@ -150,6 +150,7 @@ powerpc*-*-linux*)	gdb_host=linux ;;
- 
- s390*-*-linux*)		gdb_host=linux ;;
- 
-+sh*-*-linux*)		gdb_host=linux ;;
- sh*-*-netbsdelf* | sh*-*-knetbsd*-gnu)
- 			gdb_host=nbsd ;;
- sh*-*-openbsd*)		gdb_host=nbsd ;;
-Index: gdb-7.9/gdb/Makefile.in
-===================================================================
---- gdb-7.9.orig/gdb/Makefile.in
-+++ gdb-7.9/gdb/Makefile.in
+diff --git a/gdb/Makefile.in b/gdb/Makefile.in
+index 7937801..63baf81 100644
+--- a/gdb/Makefile.in
++++ b/gdb/Makefile.in
 @@ -1707,6 +1707,7 @@ ALLDEPFILES = \
  	score-tdep.c \
  	ser-go32.c ser-pipe.c ser-tcp.c ser-mingw.c \
@@ -44,10 +38,22 @@ Index: gdb-7.9/gdb/Makefile.in
  	sol2-tdep.c \
  	solib-svr4.c \
  	sparc-linux-nat.c sparc-linux-tdep.c \
-Index: gdb-7.9/gdb/sh-linux-tdep.c
-===================================================================
---- gdb-7.9.orig/gdb/sh-linux-tdep.c
-+++ gdb-7.9/gdb/sh-linux-tdep.c
+diff --git a/gdb/configure.host b/gdb/configure.host
+index d07be4b..b6391c5 100644
+--- a/gdb/configure.host
++++ b/gdb/configure.host
+@@ -150,6 +150,7 @@ powerpc*-*-linux*)	gdb_host=linux ;;
+ 
+ s390*-*-linux*)		gdb_host=linux ;;
+ 
++sh*-*-linux*)		gdb_host=linux ;;
+ sh*-*-netbsdelf* | sh*-*-knetbsd*-gnu)
+ 			gdb_host=nbsd ;;
+ sh*-*-openbsd*)		gdb_host=nbsd ;;
+diff --git a/gdb/sh-linux-tdep.c b/gdb/sh-linux-tdep.c
+index 2ff2ee8..1a11262 100644
+--- a/gdb/sh-linux-tdep.c
++++ b/gdb/sh-linux-tdep.c
 @@ -18,14 +18,37 @@
     along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
  
@@ -86,7 +92,7 @@ Index: gdb-7.9/gdb/sh-linux-tdep.c
  #include "glibc-tdep.h"
  #include "sh-tdep.h"
  #include "linux-tdep.h"
-@@ -180,9 +203,505 @@ static struct tramp_frame sh_linux_rt_si
+@@ -180,9 +203,505 @@ static struct tramp_frame sh_linux_rt_sigreturn_tramp_frame = {
    sh_linux_rt_sigreturn_init
  };
  
@@ -592,367 +598,10 @@ Index: gdb-7.9/gdb/sh-linux-tdep.c
    linux_init_abi (info, gdbarch);
  
    /* GNU/Linux uses SVR4-style shared libraries.  */
-Index: gdb-7.9/gdb/sh-tdep.h
-===================================================================
---- gdb-7.9.orig/gdb/sh-tdep.h
-+++ gdb-7.9/gdb/sh-tdep.h
-@@ -21,6 +21,12 @@
- 
- /* Contributed by Steve Chamberlain sac@cygnus.com.  */
- 
-+struct frame_info;
-+struct gdbarch;
-+struct reggroup;
-+struct regset;
-+struct regcache;
-+
- /* Registers for all SH variants.  Used also by sh3-rom.c.  */
- enum
-   {
-@@ -29,6 +35,7 @@ enum
-     ARG0_REGNUM = 4,
-     ARGLAST_REGNUM = 7,
-     FP_REGNUM = 14,
-+    SP_REGNUM = 15,
-     PC_REGNUM = 16,
-     PR_REGNUM = 17,
-     GBR_REGNUM = 18,
-@@ -81,6 +88,24 @@ enum
-     FV0_REGNUM = 76,
-     FV_LAST_REGNUM = 79
-   };
-+#define SH_NUM_REGS 67
-+
-+struct sh_frame_cache
-+{
-+  /* Base address.  */
-+  CORE_ADDR base;
-+  LONGEST sp_offset;
-+  CORE_ADDR pc;
-+
-+  /* Flag showing that a frame has been created in the prologue code. */
-+  int uses_fp;
-+
-+  /* Saved registers.  */
-+  CORE_ADDR saved_regs[SH_NUM_REGS];
-+  CORE_ADDR saved_sp;
-+};
-+
-+extern struct sh_frame_cache *sh_frame_cache (struct frame_info *next_frame, void **this_cache);
- 
- /* This structure describes a register in a core-file.  */
- struct sh_corefile_regmap
-@@ -89,8 +114,32 @@ struct sh_corefile_regmap
-   unsigned int offset;
- };
- 
-+/* sh architecture specific information.  */
- struct gdbarch_tdep
- {
-+  /* General-purpose registers.  */
-+  struct regset *gregset;
-+  int *gregset_reg_offset;
-+  int gregset_num_regs;
-+  size_t sizeof_gregset;
-+
-+  /* Floating-point registers.  */
-+  struct regset *fpregset;
-+  size_t sizeof_fpregset;
-+
-+  /* Offset of saved PC in jmp_buf.  */
-+  int jb_pc_offset;
-+
-+  /* Detect sigtramp.  */
-+  int (*sigtramp_p) (struct frame_info *);
-+
-+  /* Get address of sigcontext for sigtramp.  */
-+  CORE_ADDR (*sigcontext_addr) (struct frame_info *);
-+
-+  /* Offset of registers in `struct sigcontext'.  */
-+  int *sc_reg_offset;
-+  int sc_num_regs;
-+
-   /* Non-NULL when debugging from a core file.  Provides the offset
-      where each general-purpose register is stored inside the associated
-      core file section.  */
-Index: gdb-7.9/gdb/sh-linux-nat.c
-===================================================================
---- /dev/null
-+++ gdb-7.9/gdb/sh-linux-nat.c
-@@ -0,0 +1,269 @@
-+/* Low level SH interface to ptrace, for GDB when running native.
-+   Copyright (C) 2002, 2004 Free Software Foundation, Inc.
-+
-+This file is part of GDB.
-+
-+This program is free software; you can redistribute it and/or modify
-+it under the terms of the GNU General Public License as published by
-+the Free Software Foundation; either version 2 of the License, or
-+(at your option) any later version.
-+
-+This program is distributed in the hope that it will be useful,
-+but WITHOUT ANY WARRANTY; without even the implied warranty of
-+MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+GNU General Public License for more details.
-+
-+You should have received a copy of the GNU General Public License
-+along with this program; if not, write to the Free Software
-+Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.  */
-+
-+#include "defs.h"
-+#include "inferior.h"
-+#include "gdbcore.h"
-+#include "regcache.h"
-+#include "linux-nat.h"
-+#include "target.h"
-+#include "arch-utils.h"
-+
-+#include "gdb_assert.h"
-+#include "gdb_string.h"
-+#include <sys/ptrace.h>
-+#include <sys/user.h>
-+#include <sys/procfs.h>
-+#include <asm/ptrace.h>
-+
-+/* Prototypes for supply_gregset etc. */
-+#include "gregset.h"
-+#include "sh-tdep.h"
-+
-+/* Defines ps_err_e, struct ps_prochandle.  */
-+#include "gdb_proc_service.h"
-+
-+//#include <asm/elf.h>
-+
-+#define SH_LINUX_NUM_REGS	40
-+/* This table must line up with REGISTER_NAME in "sh-tdep.c".  */
-+static const int regmap[] =
-+{
-+  /* general registers 0-15 */
-+  REG_REG0   , REG_REG0+1 , REG_REG0+2 , REG_REG0+3,
-+  REG_REG0+4 , REG_REG0+5 , REG_REG0+6 , REG_REG0+7,
-+  REG_REG0+8 , REG_REG0+9 , REG_REG0+10, REG_REG0+11,
-+  REG_REG0+12, REG_REG0+13, REG_REG0+14, REG_REG0+15,
-+  /* 16 - 22 */
-+  REG_PC, REG_PR, REG_GBR, -1, REG_MACH, REG_MACL, REG_SR,
-+  /* 23, 24 */
-+  REG_FPUL, REG_FPSCR,
-+  /* floating point registers 25 - 40 */
-+  REG_FPREG0   , REG_FPREG0+1 , REG_FPREG0+2 , REG_FPREG0+3 ,
-+  REG_FPREG0+4 , REG_FPREG0+5 , REG_FPREG0+6 , REG_FPREG0+7 ,
-+  REG_FPREG0+8 , REG_FPREG0+9 , REG_FPREG0+10, REG_FPREG0+11,
-+  REG_FPREG0+12, REG_FPREG0+13, REG_FPREG0+14, REG_FPREG0+15,
-+};
-+
-+CORE_ADDR
-+register_u_addr (CORE_ADDR blockend, int regnum)
-+{
-+  if (regnum < 0 || regnum >= sizeof regmap/sizeof regmap[0])
-+    return (CORE_ADDR)-1;
-+  return (blockend + 4 * regmap[regnum]);
-+}
-+
-+
-+/* Return the address in the core dump or inferior of register REGNO.
-+   BLOCKEND is the address of the end of the user structure.  */
-+
-+CORE_ADDR
-+register_addr (int regno, CORE_ADDR blockend)
-+{
-+  CORE_ADDR addr;
-+
-+  if (regno < 0 || regno >= SH_LINUX_NUM_REGS) {
-+    internal_error (__FILE__, __LINE__,
-+		  _("Got request for bad register number %d."), regno);
-+  }
-+
-+  REGISTER_U_ADDR (addr, blockend, regno);
-+
-+  return addr;
-+}
-+
-+/* Fetch one register.  */
-+
-+static void
-+fetch_register (struct regcache *regcache, int tid, int regno)
-+{
-+  int val;
-+
-+  if (cannot_fetch_register (regno))
-+    {
-+      regcache_raw_supply (regcache, regno, NULL);
-+      return;
-+    }
-+
-+  errno = 0;
-+  val = ptrace (PTRACE_PEEKUSER, tid, register_addr (regno, 0), 0);
-+  if (errno != 0)
-+    perror_with_name (_("Couldn't get registers"));
-+
-+  regcache_raw_supply (regcache, regno, &val);
-+}
-+
-+/* Store one register. */
-+
-+static void
-+store_register (struct regcache *regcache, int tid, int regno)
-+{
-+  int val;
-+
-+  if (cannot_store_register (regno))
-+    return;
-+
-+  errno = 0;
-+  regcache_raw_collect (regcache, regno, &val);
-+  ptrace (PTRACE_POKEUSER, tid, register_addr (regno, 0), val);
-+  if (errno != 0)
-+    perror_with_name (_("Couldn't write registers"));
-+}
-+
-+/* Transfering the general-purpose registers between GDB, inferiors
-+   and core files.  */
-+
-+/* Fill GDB's register array with the general-purpose register values
-+   in *GREGSETP.  */
-+
-+void
-+supply_gregset (struct regcache *regcache, const elf_gregset_t *gregsetp)
-+{
-+  elf_greg_t *regp = (elf_greg_t *) gregsetp;
-+  int i;
-+
-+  for (i = 0; i < 23; i++)
-+    if (regmap[i] == -1)
-+      regcache_raw_supply (regcache, i, NULL);
-+    else
-+      regcache_raw_supply (regcache, i, (char *) (regp + regmap[i]));
-+}
-+
-+/* Fill register REGNO (if it is a general-purpose register) in
-+   *GREGSETPS with the value in GDB's register array.  If REGNO is -1,
-+   do this for all registers.  */
-+
-+void
-+fill_gregset (const struct regcache *regcache, elf_gregset_t *gregsetp, int regno)
-+{
-+  elf_greg_t *regp = (elf_greg_t *) gregsetp;
-+  int i;
-+
-+  for (i = 0; i < 23; i++)
-+    if (regmap[i] != -1 && (regno == -1 || regno == i))
-+      regcache_raw_collect (regcache, i, (char *) (regp + regmap[i]));
-+}
-+
-+/* Transfering floating-point registers between GDB, inferiors and cores.  */
-+
-+/* Fill GDB's register array with the floating-point register values in
-+   *FPREGSETP.  */
-+
-+void
-+supply_fpregset (struct regcache *regcache, const elf_fpregset_t *fpregsetp)
-+{
-+  int i;
-+  long *regp = (long *)fpregsetp;
-+
-+  for (i = 0; i < 16; i++)
-+    regcache_raw_supply (regcache, 25 + i, (char *) (regp + i));
-+  regcache_raw_supply (regcache, FPUL_REGNUM, (char *) (regp + REG_FPUL - REG_FPREG0));
-+  regcache_raw_supply (regcache, FPSCR_REGNUM, (char *) (regp + REG_FPSCR - REG_FPREG0));
-+}
-+
-+/* Fill register REGNO (if it is a floating-point register) in
-+   *FPREGSETP with the value in GDB's register array.  If REGNO is -1,
-+   do this for all registers.  */
-+
-+void
-+fill_fpregset (const struct regcache *regcache, elf_fpregset_t *fpregsetp, int regno)
-+{
-+  int i;
-+  long *regp = (long *)fpregsetp;
-+
-+  for (i = 0; i < 16; i++)
-+    if ((regno == -1) || (regno == i))
-+      regcache_raw_collect (regcache, 25 + i, (char *) (regp + i));
-+  if ((regno == -1) || regno == FPSCR_REGNUM)
-+    regcache_raw_collect (regcache, FPSCR_REGNUM, (char *) (regp + REG_FPSCR - REG_FPREG0));
-+  if ((regno == -1) || regno == FPUL_REGNUM)
-+    regcache_raw_collect (regcache, FPUL_REGNUM, (char *) (regp + REG_FPUL - REG_FPREG0));
-+}
-+
-+/* Transferring arbitrary registers between GDB and inferior.  */
-+
-+/* Check if register REGNO in the child process is accessible.
-+   If we are accessing registers directly via the U area, only the
-+   general-purpose registers are available.
-+   All registers should be accessible if we have GETREGS support.  */
-+
-+int
-+cannot_fetch_register (int regno)
-+{
-+  return (regno < 0 || regno >= sizeof regmap / sizeof regmap[0] || regmap[regno] == -1);
-+}
-+
-+int
-+cannot_store_register (int regno)
-+{
-+  return (regno < 0 || regno >= sizeof regmap / sizeof regmap[0] || regmap[regno] == -1);
-+}
-+
-+/* Fetch register values from the inferior.
-+   If REGNO is negative, do this for all registers.
-+   Otherwise, REGNO specifies which register (so we can save time). */
-+
-+static void
-+sh_linux_fetch_inferior_registers (struct target_ops *ops, struct regcache *regcache, int regno)
-+{
-+  int i;
-+  int tid;
-+
-+  /* GNU/Linux LWP ID's are process ID's.  */
-+  if ((tid = TIDGET (inferior_ptid)) == 0)
-+    tid = PIDGET (inferior_ptid);	/* Not a threaded program.  */
-+
-+  for (i = 0; i < SH_LINUX_NUM_REGS; i++)
-+    if (regno == -1 || regno == i)
-+      fetch_register (regcache, tid, i);
-+}
-+/* Store our register values back into the inferior.
-+   If REGNO is negative, do this for all registers.
-+   Otherwise, REGNO specifies which register (so we can save time).  */
-+
-+static void
-+sh_linux_store_inferior_registers (struct target_ops *ops, struct regcache *regcache, int regno)
-+{
-+  int i;
-+  int tid;
-+
-+  /* GNU/Linux LWP ID's are process ID's.  */
-+  if ((tid = TIDGET (inferior_ptid)) == 0)
-+    tid = PIDGET (inferior_ptid);	/* Not a threaded program.  */
-+
-+  for (i = 0; i < SH_LINUX_NUM_REGS; i++)
-+    if (regno == -1 || regno == i)
-+      store_register (regcache, tid, i);
-+}
-+
-+void
-+_initialize_sh_linux_nat (void)
-+{
-+  struct target_ops *t;
-+
-+  /* Fill in the generic GNU/Linux methods.  */
-+  t = linux_target ();
-+
-+  /* Add our register access methods.  */
-+  t->to_fetch_registers = sh_linux_fetch_inferior_registers;
-+  t->to_store_registers = sh_linux_store_inferior_registers;
-+
-+  /* Register the target.  */
-+  linux_nat_add_target (t);
-+}
-Index: gdb-7.9/gdb/sh-tdep.c
-===================================================================
---- gdb-7.9.orig/gdb/sh-tdep.c
-+++ gdb-7.9/gdb/sh-tdep.c
+diff --git a/gdb/sh-tdep.c b/gdb/sh-tdep.c
+index 82cf2f4..b443e46 100644
+--- a/gdb/sh-tdep.c
++++ b/gdb/sh-tdep.c
 @@ -21,6 +21,9 @@
     sac@cygnus.com.  */
  
@@ -971,7 +620,7 @@ Index: gdb-7.9/gdb/sh-tdep.c
  #include "doublest.h"
  #include "osabi.h"
  #include "reggroups.h"
-@@ -67,23 +71,6 @@ static const char *const sh_cc_enum[] =
+@@ -67,23 +71,6 @@ static const char *const sh_cc_enum[] = {
  
  static const char *sh_active_calling_convention = sh_cc_gcc;
  
@@ -1004,7 +653,7 @@ Index: gdb-7.9/gdb/sh-tdep.c
      return 1;
    /* Otherwise it's not treated as float.  */
    return 0;
-@@ -1093,7 +1080,7 @@ sh_push_dummy_call_fpu (struct gdbarch *
+@@ -1093,7 +1080,7 @@ sh_push_dummy_call_fpu (struct gdbarch *gdbarch,
       in four registers available.  Loop thru args from first to last.  */
    for (argnum = 0; argnum < nargs; argnum++)
      {
@@ -1013,7 +662,7 @@ Index: gdb-7.9/gdb/sh-tdep.c
        len = TYPE_LENGTH (type);
        val = sh_justify_value_in_reg (gdbarch, args[argnum], len);
  
-@@ -1821,7 +1808,7 @@ sh_dwarf2_frame_init_reg (struct gdbarch
+@@ -1821,7 +1808,7 @@ sh_dwarf2_frame_init_reg (struct gdbarch *gdbarch, int regnum,
      reg->how = DWARF2_FRAME_REG_UNDEFINED;
  }
  
@@ -1031,7 +680,7 @@ Index: gdb-7.9/gdb/sh-tdep.c
  sh_frame_cache (struct frame_info *this_frame, void **this_cache)
  {
    struct gdbarch *gdbarch = get_frame_arch (this_frame);
-@@ -1915,9 +1902,9 @@ sh_frame_cache (struct frame_info *this_
+@@ -1915,9 +1902,9 @@ sh_frame_cache (struct frame_info *this_frame, void **this_cache)
    return cache;
  }
  
@@ -1044,7 +693,7 @@ Index: gdb-7.9/gdb/sh-tdep.c
  {
    struct gdbarch *gdbarch = get_frame_arch (this_frame);
    struct sh_frame_cache *cache = sh_frame_cache (this_frame, this_cache);
-@@ -1931,7 +1918,7 @@ sh_frame_prev_register (struct frame_inf
+@@ -1931,7 +1918,7 @@ sh_frame_prev_register (struct frame_info *this_frame,
       the current frame.  Frob regnum so that we pull the value from
       the correct place.  */
    if (regnum == gdbarch_pc_regnum (gdbarch))
@@ -1053,7 +702,7 @@ Index: gdb-7.9/gdb/sh-tdep.c
  
    if (regnum < SH_NUM_REGS && cache->saved_regs[regnum] != -1)
      return frame_unwind_got_memory (this_frame, regnum,
-@@ -2237,8 +2224,8 @@ sh_return_in_first_hidden_param_p (struc
+@@ -2237,8 +2224,8 @@ sh_return_in_first_hidden_param_p (struct gdbarch *gdbarch,
  static struct gdbarch *
  sh_gdbarch_init (struct gdbarch_info info, struct gdbarch_list *arches)
  {
@@ -1063,7 +712,7 @@ Index: gdb-7.9/gdb/sh-tdep.c
  
    /* SH5 is handled entirely in sh64-tdep.c.  */
    if (info.bfd_arch_info->mach == bfd_mach_sh5)
-@@ -2254,6 +2241,18 @@ sh_gdbarch_init (struct gdbarch_info inf
+@@ -2254,6 +2241,18 @@ sh_gdbarch_init (struct gdbarch_info info, struct gdbarch_list *arches)
    tdep = XCNEW (struct gdbarch_tdep);
    gdbarch = gdbarch_alloc (&info, tdep);
  
@@ -1082,7 +731,7 @@ Index: gdb-7.9/gdb/sh-tdep.c
    set_gdbarch_short_bit (gdbarch, 2 * TARGET_CHAR_BIT);
    set_gdbarch_int_bit (gdbarch, 4 * TARGET_CHAR_BIT);
    set_gdbarch_long_bit (gdbarch, 4 * TARGET_CHAR_BIT);
-@@ -2404,10 +2403,11 @@ sh_gdbarch_init (struct gdbarch_info inf
+@@ -2404,10 +2403,11 @@ sh_gdbarch_init (struct gdbarch_info info, struct gdbarch_list *arches)
        break;
      }
  
@@ -1095,108 +744,93 @@ Index: gdb-7.9/gdb/sh-tdep.c
    frame_unwind_append_unwinder (gdbarch, &sh_stub_unwind);
    frame_unwind_append_unwinder (gdbarch, &sh_frame_unwind);
  
-Index: gdb-7.9/gdb/testsuite/gdb.asm/sh-linux.inc
-===================================================================
---- /dev/null
-+++ gdb-7.9/gdb/testsuite/gdb.asm/sh-linux.inc
-@@ -0,0 +1,78 @@
-+# You'll find a bunch of nop opcodes in the below macros.  They are
-+# there to keep the code correctly aligned.  Be careful to maintain
-+# them when changing the code.
-+
-+	comment "subroutine declare"
-+	.purgem gdbasm_declare
-+	.macro gdbasm_declare name
-+	.align	1
-+	.global	\name
-+\name:
-+	.endm
-+
-+	comment "subroutine prologue"
-+	.macro gdbasm_enter
-+	mov.l   r14,@-r15
-+	sts.l   pr,@-r15
-+	mov     r15,r14
-+	nop
-+	.endm
-+
-+	comment "subroutine epilogue"
-+	.macro gdbasm_leave
-+	mov     r14,r15
-+	lds.l   @r15+,pr
-+	mov.l   @r15+,r14
-+	rts
-+	nop
-+	nop
-+	.endm
-+
-+	comment "subroutine end"
-+	.purgem gdbasm_end
-+	.macro gdbasm_end name
-+	.size   \name, .-_foo1
-+	.align	1
-+	.endm
-+
-+	comment "subroutine call"
-+	.macro gdbasm_call subr
-+	mov.l   .Lconst\@,r1
-+	bra	.Lafterconst\@
-+	nop
-+	.align	2
-+.Lconst\@:
-+	.long	\subr
-+.Lafterconst\@:
-+	jsr	@r1
-+	nop
-+	.endm
-+
-+	.macro gdbasm_several_nops
-+	nop
-+	nop
-+	nop
-+	nop
-+	.endm
-+
-+	comment "exit (0)"
-+	.macro gdbasm_exit0
-+	sleep
-+	nop
-+	.endm
-+
-+	comment "crt0 startup"
-+	.macro gdbasm_startup
-+	mov	#0,r14
-+	.endm
-+
-+	comment "Declare a data variable"
-+	.purgem gdbasm_datavar
-+	.macro gdbasm_datavar name value
-+	.data
-+	.align 2
-+	.type	\name, @object
-+	.size	\name, 4
-+\name:
-+	.long	\value
-+	.endm
-Index: gdb-7.9/gdb/testsuite/gdb.asm/sh.inc
-===================================================================
---- gdb-7.9.orig/gdb/testsuite/gdb.asm/sh.inc
-+++ gdb-7.9/gdb/testsuite/gdb.asm/sh.inc
-@@ -40,9 +40,8 @@
- 	mov.l   .Lconst\@,r1
- 	bra	.Lafterconst\@
- 	nop
--	nop
--.Lconst\@:
- 	.align	2
-+.Lconst\@:
- 	.long	\subr
- 	.align	1
- .Lafterconst\@:
-Index: gdb-7.9/gdb/testsuite/gdb.asm/asm-source.exp
-===================================================================
---- gdb-7.9.orig/gdb/testsuite/gdb.asm/asm-source.exp
-+++ gdb-7.9/gdb/testsuite/gdb.asm/asm-source.exp
+diff --git a/gdb/sh-tdep.h b/gdb/sh-tdep.h
+index fc671a5..699f59f 100644
+--- a/gdb/sh-tdep.h
++++ b/gdb/sh-tdep.h
+@@ -21,6 +21,12 @@
+ 
+ /* Contributed by Steve Chamberlain sac@cygnus.com.  */
+ 
++struct frame_info;
++struct gdbarch;
++struct reggroup;
++struct regset;
++struct regcache;
++
+ /* Registers for all SH variants.  Used also by sh3-rom.c.  */
+ enum
+   {
+@@ -29,6 +35,7 @@ enum
+     ARG0_REGNUM = 4,
+     ARGLAST_REGNUM = 7,
+     FP_REGNUM = 14,
++    SP_REGNUM = 15,
+     PC_REGNUM = 16,
+     PR_REGNUM = 17,
+     GBR_REGNUM = 18,
+@@ -81,6 +88,24 @@ enum
+     FV0_REGNUM = 76,
+     FV_LAST_REGNUM = 79
+   };
++#define SH_NUM_REGS 67
++
++struct sh_frame_cache
++{
++  /* Base address.  */
++  CORE_ADDR base;
++  LONGEST sp_offset;
++  CORE_ADDR pc;
++
++  /* Flag showing that a frame has been created in the prologue code. */
++  int uses_fp;
++
++  /* Saved registers.  */
++  CORE_ADDR saved_regs[SH_NUM_REGS];
++  CORE_ADDR saved_sp;
++};
++
++extern struct sh_frame_cache *sh_frame_cache (struct frame_info *next_frame, void **this_cache);
+ 
+ /* This structure describes a register in a core-file.  */
+ struct sh_corefile_regmap
+@@ -89,8 +114,32 @@ struct sh_corefile_regmap
+   unsigned int offset;
+ };
+ 
++/* sh architecture specific information.  */
+ struct gdbarch_tdep
+ {
++  /* General-purpose registers.  */
++  struct regset *gregset;
++  int *gregset_reg_offset;
++  int gregset_num_regs;
++  size_t sizeof_gregset;
++
++  /* Floating-point registers.  */
++  struct regset *fpregset;
++  size_t sizeof_fpregset;
++
++  /* Offset of saved PC in jmp_buf.  */
++  int jb_pc_offset;
++
++  /* Detect sigtramp.  */
++  int (*sigtramp_p) (struct frame_info *);
++
++  /* Get address of sigcontext for sigtramp.  */
++  CORE_ADDR (*sigcontext_addr) (struct frame_info *);
++
++  /* Offset of registers in `struct sigcontext'.  */
++  int *sc_reg_offset;
++  int sc_num_regs;
++
+   /* Non-NULL when debugging from a core file.  Provides the offset
+      where each general-purpose register is stored inside the associated
+      core file section.  */
+diff --git a/gdb/testsuite/gdb.asm/asm-source.exp b/gdb/testsuite/gdb.asm/asm-source.exp
+index 8854af0..ef44682 100644
+--- a/gdb/testsuite/gdb.asm/asm-source.exp
++++ b/gdb/testsuite/gdb.asm/asm-source.exp
 @@ -113,6 +113,11 @@ switch -glob -- [istarget] {
              append link-flags " -m elf32ppc"
          }
@@ -1209,170 +843,79 @@ Index: gdb-7.9/gdb/testsuite/gdb.asm/asm-source.exp
      "sh*-*-*" {
          set asm-arch sh
  	set debug-flags "-gdwarf-2"
-Index: gdb-7.9/gdb/testsuite/gdb.base/sigall.c
-===================================================================
---- gdb-7.9.orig/gdb/testsuite/gdb.base/sigall.c
-+++ gdb-7.9/gdb/testsuite/gdb.base/sigall.c
+diff --git a/gdb/testsuite/gdb.asm/sh.inc b/gdb/testsuite/gdb.asm/sh.inc
+index a4a5fc5..89efed7 100644
+--- a/gdb/testsuite/gdb.asm/sh.inc
++++ b/gdb/testsuite/gdb.asm/sh.inc
+@@ -40,9 +40,8 @@
+ 	mov.l   .Lconst\@,r1
+ 	bra	.Lafterconst\@
+ 	nop
+-	nop
+-.Lconst\@:
+ 	.align	2
++.Lconst\@:
+ 	.long	\subr
+ 	.align	1
+ .Lafterconst\@:
+diff --git a/gdb/testsuite/gdb.base/annota1.c b/gdb/testsuite/gdb.base/annota1.c
+index 424e1b8..0de2e7b 100644
+--- a/gdb/testsuite/gdb.base/annota1.c
++++ b/gdb/testsuite/gdb.base/annota1.c
 @@ -1,6 +1,9 @@
+ #include <stdio.h>
  #include <signal.h>
- #include <unistd.h>
  
 +#ifdef __sh__
 +#define signal(a,b)    /* Signals not supported on this target - make them go away */
 +#endif
  
- /* Signal handlers, we set breakpoints in them to make sure that the
-    signals really get delivered.  */
-Index: gdb-7.9/gdb/testsuite/gdb.base/signals.c
-===================================================================
---- gdb-7.9.orig/gdb/testsuite/gdb.base/signals.c
-+++ gdb-7.9/gdb/testsuite/gdb.base/signals.c
-@@ -3,6 +3,10 @@
+ void
+ handle_USR1 (int sig)
+diff --git a/gdb/testsuite/gdb.base/annota3.c b/gdb/testsuite/gdb.base/annota3.c
+index 424e1b8..952aaf2 100644
+--- a/gdb/testsuite/gdb.base/annota3.c
++++ b/gdb/testsuite/gdb.base/annota3.c
+@@ -1,6 +1,10 @@
+ #include <stdio.h>
  #include <signal.h>
- #include <unistd.h>
  
 +#ifdef __sh__
 +#define signal(a,b)    /* Signals not supported on this target - make them go away */
-+#define alarm(a)       /* Ditto for alarm() */
 +#endif
++
  
- static int count = 0;
- 
-Index: gdb-7.9/gdb/testsuite/gdb.base/annota1.c
-===================================================================
---- gdb-7.9.orig/gdb/testsuite/gdb.base/annota1.c
-+++ gdb-7.9/gdb/testsuite/gdb.base/annota1.c
+ void
+ handle_USR1 (int sig)
+diff --git a/gdb/testsuite/gdb.base/sigall.c b/gdb/testsuite/gdb.base/sigall.c
+index 81f3b08..1574b2d 100644
+--- a/gdb/testsuite/gdb.base/sigall.c
++++ b/gdb/testsuite/gdb.base/sigall.c
 @@ -1,6 +1,9 @@
- #include <stdio.h>
  #include <signal.h>
+ #include <unistd.h>
  
 +#ifdef __sh__
 +#define signal(a,b)    /* Signals not supported on this target - make them go away */
 +#endif
  
- void
- handle_USR1 (int sig)
-Index: gdb-7.9/gdb/testsuite/gdb.base/annota3.c
-===================================================================
---- gdb-7.9.orig/gdb/testsuite/gdb.base/annota3.c
-+++ gdb-7.9/gdb/testsuite/gdb.base/annota3.c
-@@ -1,6 +1,10 @@
- #include <stdio.h>
+ /* Signal handlers, we set breakpoints in them to make sure that the
+    signals really get delivered.  */
+diff --git a/gdb/testsuite/gdb.base/signals.c b/gdb/testsuite/gdb.base/signals.c
+index 7566068..1205a9b 100644
+--- a/gdb/testsuite/gdb.base/signals.c
++++ b/gdb/testsuite/gdb.base/signals.c
+@@ -3,6 +3,10 @@
  #include <signal.h>
+ #include <unistd.h>
  
 +#ifdef __sh__
 +#define signal(a,b)    /* Signals not supported on this target - make them go away */
++#define alarm(a)       /* Ditto for alarm() */
 +#endif
-+
  
- void
- handle_USR1 (int sig)
-Index: gdb-7.9/gdb/config/sh/xm-linux.h
-===================================================================
---- /dev/null
-+++ gdb-7.9/gdb/config/sh/xm-linux.h
-@@ -0,0 +1,32 @@
-+/* Native support for GNU/Linux, for GDB, the GNU debugger.
-+   Copyright (C) 2000 Free Software Foundation, Inc.
-+
-+This file is part of GDB.
-+
-+This program is free software; you can redistribute it and/or modify
-+it under the terms of the GNU General Public License as published by
-+the Free Software Foundation; either version 2 of the License, or
-+(at your option) any later version.
-+
-+This program is distributed in the hope that it will be useful,
-+but WITHOUT ANY WARRANTY; without even the implied warranty of
-+MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+GNU General Public License for more details.
-+
-+You should have received a copy of the GNU General Public License
-+along with this program; if not, write to the Free Software
-+Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.  */
-+
-+#ifndef XM_LINUX_H
-+#define XM_LINUX_H
-+
-+#define HOST_BYTE_ORDER LITTLE_ENDIAN
-+
-+#define HAVE_TERMIOS
-+
-+#define NEED_POSIX_SETPGID
-+
-+/* Need R_OK etc, but USG isn't defined.  */
-+#include <unistd.h>
-+
-+#endif	/* #ifndef XM_LINUX_H */
-Index: gdb-7.9/gdb/config/sh/nm-linux.h
-===================================================================
---- /dev/null
-+++ gdb-7.9/gdb/config/sh/nm-linux.h
-@@ -0,0 +1,54 @@
-+/* Native-dependent definitions for SuperH running Linux, for GDB.
-+   Copyright 2004 Free Software Foundation, Inc.
-+
-+   This file is part of GDB.
-+
-+   This program is free software; you can redistribute it and/or modify
-+   it under the terms of the GNU General Public License as published by
-+   the Free Software Foundation; either version 2 of the License, or
-+   (at your option) any later version.
-+
-+   This program is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+   GNU General Public License for more details.
-+
-+   You should have received a copy of the GNU General Public License
-+   along with this program; if not, write to the Free Software
-+   Foundation, Inc., 59 Temple Place - Suite 330,
-+   Boston, MA 02111-1307, USA.  */
-+
-+#ifndef NM_LINUX_H
-+#define NM_LINUX_H
-+
-+/* Get generic Linux native definitions.  */
-+#include "config/nm-linux.h"
-+/* Support for the user area.  */
-+
-+/* Return the size of the user struct.  */
-+extern int kernel_u_size (void);
-+#define KERNEL_U_SIZE kernel_u_size()
-+
-+/* This is the amount to substract from u.u_ar0 to get the offset in
-+   the core file of the register values.  */
-+#define KERNEL_U_ADDR 0
-+
-+#define U_REGS_OFFSET 0
-+
-+extern CORE_ADDR register_u_addr (CORE_ADDR blockend, int regnum);
-+#define REGISTER_U_ADDR(addr, blockend, regnum) \
-+  (addr) = register_u_addr (blockend, regnum)
-+
-+/* Override copies of {fetch,store}_inferior_registers in `infptrace.c'.  */
-+#define FETCH_INFERIOR_REGISTERS
-+
-+/* Nevertheless, define CANNOT_{FETCH,STORE}_REGISTER, because we
-+   might fall back on the code `infptrace.c' (well a copy of that code
-+   in `sh-linux-nat.c' for now) and we can access only the
-+   general-purpose registers in that way.  */
-+extern int cannot_fetch_register (int regno);
-+extern int cannot_store_register (int regno);
-+#define CANNOT_FETCH_REGISTER(regno) cannot_fetch_register (regno)
-+#define CANNOT_STORE_REGISTER(regno) cannot_store_register (regno)
-+
-+#endif /* NM_LINUX_H */
-Index: gdb-7.9/gdb/config/sh/linux.mh
-===================================================================
---- /dev/null
-+++ gdb-7.9/gdb/config/sh/linux.mh
-@@ -0,0 +1,8 @@
-+# Host: Renesas Super-H running GNU/Linux
-+NAT_FILE= config/sh/nm-linux.h
-+NATDEPFILES= inf-ptrace.o fork-child.o corelow.o sh-linux-nat.o \
-+	proc-service.o linux-thread-db.o gcore.o \
-+	linux-nat.o linux-osdata.o linux-fork.o linux-procfs.o
-+
-+NAT_CDEPS = $(srcdir)/proc-service.list
-+LOADLIBES= -ldl $(RDYNAMIC)
+ static int count = 0;
+ 
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/gdb/gdb/0004-Change-comment-in-gdb-compile.patch b/meta/recipes-devtools/gdb/gdb/0004-Change-comment-in-gdb-compile.patch
new file mode 100644
index 0000000..4df552c
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/0004-Change-comment-in-gdb-compile.patch
@@ -0,0 +1,48 @@
+Upstream-Status: Backport
+
+From 09de64b93c2402e068daf0bce1c4a1dda833b646 Mon Sep 17 00:00:00 2001
+From: Jan Kratochvil <jan.kratochvil@redhat.com>
+Date: Thu, 26 Feb 2015 11:52:28 +0100
+Subject: [PATCH] Change // comment in gdb/compile/
+
+gdb/ChangeLog
+2015-02-26  Jan Kratochvil  <jan.kratochvil@redhat.com>
+
+	PR build/18033
+	* compile/compile-c-support.c (c_compute_program): Change // comment.
+	* compile/compile-object-load.c (setup_sections): Change // comment.
+---
+ gdb/ChangeLog                     | 6 ++++++
+ gdb/compile/compile-c-support.c   | 2 +-
+ gdb/compile/compile-object-load.c | 2 +-
+ 3 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/gdb/compile/compile-c-support.c b/gdb/compile/compile-c-support.c
+index 8f1f45d..1711cda 100644
+--- a/gdb/compile/compile-c-support.c
++++ b/gdb/compile/compile-c-support.c
+@@ -351,7 +351,7 @@ c_compute_program (struct compile_instance *inst,
+ 			" __gdb_intptr;\n",
+ 			buf);
+ 
+-      // Iterate all log2 sizes in bytes supported by c_get_mode_for_size.
++      /* Iterate all log2 sizes in bytes supported by c_get_mode_for_size.  */
+       for (i = 0; i < 4; ++i)
+ 	{
+ 	  const char *mode = c_get_mode_for_size (1 << i);
+diff --git a/gdb/compile/compile-object-load.c b/gdb/compile/compile-object-load.c
+index 5903f18..e187970 100644
+--- a/gdb/compile/compile-object-load.c
++++ b/gdb/compile/compile-object-load.c
+@@ -67,7 +67,7 @@ setup_sections (bfd *abfd, asection *sect, void *data_voidp)
+       if ((bfd_get_section_flags (abfd, sect) & SEC_ALLOC) == 0)
+ 	return;
+ 
+-      // Make the memory always readable.
++      /* Make the memory always readable.  */
+       prot = GDB_MMAP_PROT_READ;
+       if ((bfd_get_section_flags (abfd, sect) & SEC_READONLY) == 0)
+ 	prot |= GDB_MMAP_PROT_WRITE;
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/gdb/gdb/sim-install-6.6.patch b/meta/recipes-devtools/gdb/gdb/sim-install-6.6.patch
deleted file mode 100644
index f67c25d..0000000
--- a/meta/recipes-devtools/gdb/gdb/sim-install-6.6.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
---- gdb-6.1/sim/common/Makefile.in~	2004-01-15 21:25:06.000000000 +0000
-+++ gdb-6.1/sim/common/Makefile.in	2004-07-22 17:07:46.237809032 +0100
-@@ -34,7 +34,7 @@
- 
- datadir = @datadir@
- mandir = @mandir@
--man1dir = $(mandir)/man1
-+man1dir = $(DESTDIR)$(mandir)/man1
- infodir = @infodir@
- includedir = @includedir@
- 
-
diff --git a/meta/recipes-devtools/gdb/gdb/sim-install.patch b/meta/recipes-devtools/gdb/gdb/sim-install.patch
deleted file mode 100644
index a663ba7..0000000
--- a/meta/recipes-devtools/gdb/gdb/sim-install.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
---- gdb-6.1/sim/common/Makefile.in~	2004-01-15 21:25:06.000000000 +0000
-+++ gdb-6.1/sim/common/Makefile.in	2004-07-22 17:07:46.237809032 +0100
-@@ -34,7 +34,7 @@
- 
- datadir = @datadir@
- mandir = @mandir@
--man1dir = $(mandir)/man1
-+man1dir = $(DESTDIR)$(mandir)/man1
- infodir = @infodir@
- includedir = @includedir@
- 
-
---- gdb-6.1/sim/common/Make-common.in~sim-install.patch	2003-09-08 18:24:59.000000000 +0100
-+++ gdb-6.1/sim/common/Make-common.in	2004-07-22 17:56:18.947423032 +0100
-@@ -581,14 +581,14 @@
- 
- install-common: installdirs
- 	n=`echo run | sed '$(program_transform_name)'`; \
--	$(INSTALL_PROGRAM) run$(EXEEXT) $(bindir)/$$n$(EXEEXT)
-+	$(INSTALL_PROGRAM) run$(EXEEXT) $(DESTDIR)$(bindir)/$$n$(EXEEXT)
- 	n=`echo libsim.a | sed s/libsim.a/lib$(target_alias)-sim.a/`; \
--	$(INSTALL_DATA) libsim.a $(libdir)/$$n ; \
--	( cd $(libdir) ; $(RANLIB) $$n )
-+	$(INSTALL_DATA) libsim.a $(DESTDIR)$(libdir)/$$n ; \
-+	( cd $(DESTDIR)$(libdir) ; $(RANLIB) $$n )
- 
- installdirs:
--	$(SHELL) $(srcdir)/../../mkinstalldirs $(bindir)
--	$(SHELL) $(srcdir)/../../mkinstalldirs $(libdir)
-+	$(SHELL) $(srcdir)/../../mkinstalldirs $(DESTDIR)$(bindir)
-+	$(SHELL) $(srcdir)/../../mkinstalldirs $(DESTDIR)$(libdir)
- 
- check:
- 	cd ../testsuite && $(MAKE) check RUNTESTFLAGS="$(RUNTESTFLAGS)"
diff --git a/meta/recipes-devtools/gdb/gdb/uclibc.patch b/meta/recipes-devtools/gdb/gdb/uclibc.patch
deleted file mode 100644
index f5fd518..0000000
--- a/meta/recipes-devtools/gdb/gdb/uclibc.patch
+++ /dev/null
@@ -1,196 +0,0 @@
-Upstream-Status: Pending
-
---- binutils-2.15.91.0.1/bfd/config.bfd~binutils-2.15.90.0.3-uclibc-100-conf
-+++ binutils-2.15.91.0.1/bfd/config.bfd
-@@ -128,7 +128,7 @@
-     targ_defvec=ecoffalpha_little_vec
-     targ_selvecs=bfd_elf64_alpha_vec
-     ;;
--  alpha*-*-linux-gnu* | alpha*-*-elf*)
-+  alpha*-*-linux-gnu* | alpha*-*-linux-uclibc* | alpha*-*-elf*)
-     targ_defvec=bfd_elf64_alpha_vec
-     targ_selvecs=ecoffalpha_little_vec
-     ;;
-@@ -138,7 +138,7 @@
-   alpha*-*-*)
-     targ_defvec=ecoffalpha_little_vec
-     ;;
--  ia64*-*-freebsd* | ia64*-*-netbsd* | ia64*-*-linux-gnu* | ia64*-*-elf* | ia64*-*-kfreebsd*-gnu)
-+  ia64*-*-freebsd* | ia64*-*-netbsd* | ia64*-*-linux-gnu* | ia64*-*-elf* | ia64*-*-linux-uclibc* | ia64*-*-kfreebsd*-gnu)
-     targ_defvec=bfd_elf64_ia64_little_vec
-     targ_selvecs="bfd_elf64_ia64_big_vec bfd_efi_app_ia64_vec"
-     ;;
-@@ -215,7 +215,7 @@
-     targ_defvec=bfd_elf32_littlearm_vec
-     targ_selvecs=bfd_elf32_bigarm_vec
-     ;;
--  armeb-*-elf | arm*b-*-linux-gnu*)
-+  armeb-*-elf | arm*b-*-linux-gnu* | arm*b-*-linux-uclibc*)
-     targ_defvec=bfd_elf32_bigarm_vec
-     targ_selvecs=bfd_elf32_littlearm_vec
-     ;;
-@@ -223,8 +223,8 @@
-     targ_defvec=bfd_elf32_littlearm_vec
-     targ_selvecs=bfd_elf32_bigarm_vec
-     ;;
--  arm-*-elf | arm-*-freebsd* | arm*-*-linux-gnu* | arm*-*-conix* | \
--  arm*-*-uclinux* | arm-*-kfreebsd*-gnu | arm-*-vxworks)
-+  arm-*-elf | arm-*-freebsd* | arm*-*-linux-gnu* | arm*-*-linux-uclibc* | \
-+  arm*-*-conix* | arm*-*-uclinux* | arm-*-kfreebsd*-gnu | arm-*-vxworks)
-     targ_defvec=bfd_elf32_littlearm_vec
-     targ_selvecs=bfd_elf32_bigarm_vec
-     ;;
-@@ -367,7 +367,7 @@
-     ;;
- 
- #ifdef BFD64
--  hppa*64*-*-linux-gnu*)
-+  hppa*64*-*-linux-gnu* | hppa*64*-*-linux-uclibc*)
-     targ_defvec=bfd_elf64_hppa_linux_vec
-     targ_selvecs=bfd_elf64_hppa_vec
-     ;;
-@@ -378,7 +378,7 @@
-     ;;
- #endif
- 
--  hppa*-*-linux-gnu* | hppa*-*-netbsd*)
-+  hppa*-*-linux-gnu* | hppa*-*-netbsd* | hppa*-*-linux-uclibc*)
-     targ_defvec=bfd_elf32_hppa_linux_vec
-     targ_selvecs=bfd_elf32_hppa_vec
-     ;;
-@@ -501,7 +501,7 @@
-     targ_selvecs=bfd_elf32_i386_vec
-     targ_underscore=yes
-     ;;
--  i[3-7]86-*-linux-gnu*)
-+  i[3-7]86-*-linux-gnu* | i[3-7]86-*-linux-uclibc*)
-     targ_defvec=bfd_elf32_i386_vec
-     targ_selvecs="i386linux_vec bfd_efi_app_ia32_vec"
-     targ64_selvecs=bfd_elf64_x86_64_vec
-@@ -515,7 +515,7 @@
-     targ_defvec=bfd_elf64_x86_64_vec
-     targ_selvecs="bfd_elf32_i386_vec i386netbsd_vec i386coff_vec bfd_efi_app_ia32_vec"
-     ;;
--  x86_64-*-linux-gnu*)
-+  x86_64-*-linux-gnu* | x86_64-*-linux-uclibc*)
-     targ_defvec=bfd_elf64_x86_64_vec
-     targ_selvecs="bfd_elf32_i386_vec i386linux_vec bfd_efi_app_ia32_vec"
-     ;;
-@@ -690,7 +690,7 @@
-     targ_selvecs=bfd_elf32_m68k_vec
-     targ_underscore=yes
-     ;;
--  m68*-*-linux-gnu*)
-+  m68*-*-linux-gnu* | m68*-*-linux-uclibc*)
-     targ_defvec=bfd_elf32_m68k_vec
-     targ_selvecs=m68klinux_vec
-     ;;
-@@ -966,7 +966,8 @@
-     ;;
- #endif
-   powerpc-*-*bsd* | powerpc-*-elf* | powerpc-*-sysv4* | powerpc-*-eabi* | \
--  powerpc-*-solaris2* | powerpc-*-linux-gnu* | powerpc-*-rtems* | \
-+  powerpc-*-solaris2* | powerpc-*-linux-gnu* | powerpc-*-linux-uclibc* | \
-+  powerpc-*-rtems* | \
-   powerpc-*-chorus* | powerpc-*-vxworks* | powerpc-*-windiss*)
-     targ_defvec=bfd_elf32_powerpc_vec
-     targ_selvecs="rs6000coff_vec bfd_elf32_powerpcle_vec ppcboot_vec"
-@@ -1003,8 +1004,8 @@
-     targ_selvecs="rs6000coff_vec bfd_elf32_powerpc_vec ppcboot_vec"
-     ;;
-   powerpcle-*-elf* | powerpcle-*-sysv4* | powerpcle-*-eabi* | \
--  powerpcle-*-solaris2* | powerpcle-*-linux-gnu* | powerpcle-*-vxworks* |\
--  powerpcle-*-rtems*)
-+  powerpcle-*-solaris2* | powerpcle-*-linux-gnu* | powerpcle-*-linux-uclibc* |\
-+  powerpcle-*-vxworks* | powerpcle-*-rtems*)
-     targ_defvec=bfd_elf32_powerpcle_vec
-     targ_selvecs="rs6000coff_vec bfd_elf32_powerpc_vec ppcboot_vec"
-     targ64_selvecs="bfd_elf64_powerpc_vec bfd_elf64_powerpcle_vec"
-@@ -1165,7 +1166,7 @@
-     targ_selvecs="bfd_elf32_sparc_vec sunos_big_vec"
-     targ_underscore=yes
-     ;;
--  sparc-*-linux-gnu*)
-+  sparc-*-linux-gnu* | sparc-*-linux-uclibc*)
-     targ_defvec=bfd_elf32_sparc_vec
-     targ_selvecs="sparclinux_vec bfd_elf64_sparc_vec sunos_big_vec"
-     ;;
-@@ -1212,7 +1213,7 @@
-     targ_defvec=sunos_big_vec
-     targ_underscore=yes
-     ;;
--  sparc64-*-linux-gnu*)
-+  sparc64-*-linux-gnu* | sparc64-*-linux-uclibc*)
-     targ_defvec=bfd_elf64_sparc_vec
-     targ_selvecs="bfd_elf32_sparc_vec sparclinux_vec sunos_big_vec"
-     ;;
---- binutils-2.15.91.0.1/bfd/configure~binutils-2.15.90.0.3-uclibc-100-conf
-+++ binutils-2.15.91.0.1/bfd/configure
-@@ -1687,6 +1687,11 @@
-   lt_cv_file_magic_test_file=`echo /lib/libc.so* /lib/libc-*.so`
-   ;;
- 
-+linux-uclibc*)
-+  lt_cv_deplibs_check_method=pass_all
-+  lt_cv_file_magic_test_file=`echo /lib/libuClibc-*.so`
-+  ;;
-+
- netbsd*)
-   if echo __ELF__ | $CC -E - | grep __ELF__ > /dev/null; then
-     lt_cv_deplibs_check_method='match_pattern /lib[^/\.]+\.so\.[0-9]+\.[0-9]+$'
-@@ -5266,7 +5271,7 @@
-   alpha*-*-freebsd* | alpha*-*-kfreebsd*-gnu)
- 	COREFILE=''
- 	;;
--  alpha*-*-linux-gnu*)
-+  alpha*-*-linux-gnu* | alpha*-*-linux-uclibc*)
- 	COREFILE=trad-core.lo
- 	TRAD_HEADER='"hosts/alphalinux.h"'
- 	;;
-@@ -5326,7 +5331,7 @@
- 	COREFILE=trad-core.lo
- 	TRAD_HEADER='"hosts/i386mach3.h"'
- 	;;
--  i[3-7]86-*-linux-gnu*)
-+  i[3-7]86-*-linux-gnu* | i[3-7]86-*-linux-uclibc*)
- 	COREFILE=trad-core.lo
- 	TRAD_HEADER='"hosts/i386linux.h"'
- 	;;
-@@ -5364,7 +5369,7 @@
- 	COREFILE=trad-core.lo
- 	TRAD_HEADER='"hosts/hp300bsd.h"'
- 	;;
--  m68*-*-linux-gnu*)
-+  m68*-*-linux-gnu* | m68*-*-linux-uclibc*)
- 	COREFILE=trad-core.lo
- 	TRAD_HEADER='"hosts/m68klinux.h"'
- 	;;
---- binutils-2.15.91.0.1/bfd/configure.in~binutils-2.15.90.0.3-uclibc-100-conf
-+++ binutils-2.15.91.0.1/bfd/configure.in
-@@ -164,7 +164,7 @@
-   alpha*-*-freebsd* | alpha*-*-kfreebsd*-gnu)
- 	COREFILE=''
- 	;;
--  alpha*-*-linux-gnu*)
-+  alpha*-*-linux-gnu* | alpha*-*-linux-uclibc*)
- 	COREFILE=trad-core.lo
- 	TRAD_HEADER='"hosts/alphalinux.h"'
- 	;;
-@@ -245,7 +245,7 @@
- 	TRAD_HEADER='"hosts/i386mach3.h"'
- 	;;
- changequote(,)dnl
--  i[3-7]86-*-linux-gnu*)
-+  i[3-7]86-*-linux-gnu* | i[3-7]86-*-linux-uclibc*)
- changequote([,])dnl
- 	COREFILE=trad-core.lo
- 	TRAD_HEADER='"hosts/i386linux.h"'
-@@ -286,7 +286,7 @@
- 	COREFILE=trad-core.lo
- 	TRAD_HEADER='"hosts/hp300bsd.h"'
- 	;;
--  m68*-*-linux-gnu*)
-+  m68*-*-linux-gnu* | m68*-*-linux-uclibc*)
- 	COREFILE=trad-core.lo
- 	TRAD_HEADER='"hosts/m68klinux.h"'
- 	;;
-- 
2.1.4


