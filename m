Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4967F79357
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 05:42:53 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id u11-v6so4425451plq.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 22:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ZzDhh7ZpG4RR8VyLPvyVUwbmLJEj5H6OKBzgksIBfLY=;
	b=GgPLxYKDclIWOpdIodTDU1zFSco7TaLcRtb772AojmPoa2aaRqy43ZKWN3DQsIDZR/
	5Njzvq+Z05tAYaK9BsrXxzyZWm+u6TWo2uFzQv//NsnN3OAKM0K6Jf+wccVVEg41kdsO
	u+QtND86T4SPylQb702f/cN1yNkG0GSQgViyZ9hog7aIbmVJ8NIhxjz5KlH70NaDzEvK
	G2juNwMxxBTk3XI0ZFK8hfyqtms3arZiBbS02wP/A9T5/jvGgPGhWp76uXQOpvwr0fxX
	AfGJfEju1C5Mf4cdwuIwnd4NkX9MIMq78TNlHn+RzrXtjSGKvoKvGi6n7YBgCCk9FCAU
	rPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ZzDhh7ZpG4RR8VyLPvyVUwbmLJEj5H6OKBzgksIBfLY=;
	b=J2oJl7mS74f/hsGxZaJTMTuGIiXuYX/V3o6kz+N2NsKHIJesCft+VJlNxL/Z1Ubpux
	ajAJuPAy7LRM3100HhgWExlN59d6sTpRqvFyNtYcJkhKjO4pcUu7VoPHYK2ns42fdNr8
	3z6LfZBcgv6eByISp7urAVoRuXJjY9adSRNwdRtc/VM3mvT/kp/8sGZOaNlVgeLOeJ5C
	Z4UnX9AJ0OgdW59EblVGeInUO+xKybEu7K/eMnucBFTJiDUjlfuLfRZ2oFHKOv3XHch0
	uxYS+FXM4EFpxfbDNkSoi3Rzmnj1sTF31DqtQF+tBhZGCh6EFJiRNi7XHX1i/mJ3hgbO
	JePA==
X-Gm-Message-State: APzg51A7S2Cfk8vv6FUBIVvBkoP9rZNdOefEOypiR16O9+8+f5bjRis8
	edXCKkkVNmFMu5+swlROQp3XjPNs
X-Google-Smtp-Source: ANB0VdYUnqNwQY8AORYfamVaD1Yp859On3latDsE//qKpQyK9fUC9jgYWZdnIYgzdPt9V5Nz9OBHWA==
X-Received: by 2002:a17:902:7102:: with SMTP id
	a2-v6mr1099334pll.217.1536212573745; 
	Wed, 05 Sep 2018 22:42:53 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	k8-v6sm11489931pga.80.2018.09.05.22.42.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Sep 2018 22:42:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Sep 2018 22:42:45 -0700
Message-Id: <3ad79c14cede673c5e42a24ee5d50866f3cee092.1536212473.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1536212473.git.raj.khem@gmail.com>
References: <cover.1536212473.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] gdb: Update to 8.2
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
X-List-Received-Date: Thu, 06 Sep 2018 05:42:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* https://sourceware.org/ml/gdb-announce/2018/msg00003.html
* Support RISC-V

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gdb/{gdb-8.1.1.inc => gdb-8.2.inc}        |   5 +-
 ...ian_8.1.1.bb => gdb-cross-canadian_8.2.bb} |   0
 .../{gdb-cross_8.1.1.bb => gdb-cross_8.2.bb}  |   0
 .../0001-include-sys-types.h-for-mode_t.patch |   9 +-
 ...make-man-install-relative-to-DESTDIR.patch |   8 +-
 ...ux-nat-Define-_ABIO32-if-not-defined.patch |  26 ++--
 ...e-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch |  14 +-
 ...port-for-Renesas-SH-sh4-architecture.patch | 139 +++++++++---------
 ...readline.a-when-using-disable-static.patch |  10 +-
 .../gdb/gdb/0007-use-asm-sgidefs.h.patch      |   8 +-
 ...-Use-exorted-definitions-of-SIGRTMIN.patch |  12 +-
 .../gdb/gdb/0009-Change-order-of-CFLAGS.patch |  10 +-
 ...10-resolve-restrict-keyword-conflict.patch |   8 +-
 ...> 0011-Fix-invalid-sigprocmask-call.patch} |  20 ++-
 ...ining-TRAP_HWBKPT-before-including-g.patch |  56 -------
 .../gdb/{gdb_8.1.1.bb => gdb_8.2.bb}          |   0
 16 files changed, 135 insertions(+), 190 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-8.1.1.inc => gdb-8.2.inc} (77%)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_8.1.1.bb => gdb-cross-canadian_8.2.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_8.1.1.bb => gdb-cross_8.2.bb} (100%)
 rename meta/recipes-devtools/gdb/gdb/{package_devel_gdb_patches_120-sigprocmask-invalid-call.patch => 0011-Fix-invalid-sigprocmask-call.patch} (75%)
 delete mode 100644 meta/recipes-devtools/gdb/gdb/gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.patch
 rename meta/recipes-devtools/gdb/{gdb_8.1.1.bb => gdb_8.2.bb} (100%)

diff --git a/meta/recipes-devtools/gdb/gdb-8.1.1.inc b/meta/recipes-devtools/gdb/gdb-8.2.inc
similarity index 77%
rename from meta/recipes-devtools/gdb/gdb-8.1.1.inc
rename to meta/recipes-devtools/gdb/gdb-8.2.inc
index ad80dd3e4d..371665ab15 100644
--- a/meta/recipes-devtools/gdb/gdb-8.1.1.inc
+++ b/meta/recipes-devtools/gdb/gdb-8.2.inc
@@ -15,9 +15,6 @@ SRC_URI = "http://ftp.gnu.org/gnu/gdb/gdb-${PV}.tar.xz \
            file://0008-Use-exorted-definitions-of-SIGRTMIN.patch \
            file://0009-Change-order-of-CFLAGS.patch \
            file://0010-resolve-restrict-keyword-conflict.patch \
-           file://package_devel_gdb_patches_120-sigprocmask-invalid-call.patch \
-           file://gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.patch \
+           file://0011-Fix-invalid-sigprocmask-call.patch \
 "
-SRC_URI[md5sum] = "372fa63a53adeee1bfbfd581d8da9e34"
-SRC_URI[sha256sum] = "97dcc3169bd430270fc29adb65145846a58c1b55cdbb73382a4a89307bdad03c"
 
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_8.1.1.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_8.2.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_8.1.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_8.2.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross_8.1.1.bb b/meta/recipes-devtools/gdb/gdb-cross_8.2.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_8.1.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross_8.2.bb
diff --git a/meta/recipes-devtools/gdb/gdb/0001-include-sys-types.h-for-mode_t.patch b/meta/recipes-devtools/gdb/gdb/0001-include-sys-types.h-for-mode_t.patch
index 5d19380e30..2c8783e192 100644
--- a/meta/recipes-devtools/gdb/gdb/0001-include-sys-types.h-for-mode_t.patch
+++ b/meta/recipes-devtools/gdb/gdb/0001-include-sys-types.h-for-mode_t.patch
@@ -1,4 +1,4 @@
-From ff37f9360ab6f841f28ced9f23f66542febcc0f6 Mon Sep 17 00:00:00 2001
+From 6ae0fb9b49047cef338262e30273f63139fd1261 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 19 Jan 2016 18:18:52 -0800
 Subject: [PATCH 01/11] include sys/types.h for mode_t
@@ -6,15 +6,14 @@ Subject: [PATCH 01/11] include sys/types.h for mode_t
 mode_t is used in target.h, so we need to include sys/types.h to get the
 defintion
 
+Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
-Upstream-Status: Pending
-
  gdb/gdbserver/target.h | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/gdb/gdbserver/target.h b/gdb/gdbserver/target.h
-index 25accd2207..7f6bca8aa4 100644
+index fce54e05ad..278cee78a8 100644
 --- a/gdb/gdbserver/target.h
 +++ b/gdb/gdbserver/target.h
 @@ -29,6 +29,7 @@
@@ -26,5 +25,5 @@ index 25accd2207..7f6bca8aa4 100644
  struct emit_ops;
  struct buffer;
 -- 
-2.17.0
+2.18.0
 
diff --git a/meta/recipes-devtools/gdb/gdb/0002-make-man-install-relative-to-DESTDIR.patch b/meta/recipes-devtools/gdb/gdb/0002-make-man-install-relative-to-DESTDIR.patch
index 83c4dded3b..60479e5410 100644
--- a/meta/recipes-devtools/gdb/gdb/0002-make-man-install-relative-to-DESTDIR.patch
+++ b/meta/recipes-devtools/gdb/gdb/0002-make-man-install-relative-to-DESTDIR.patch
@@ -1,7 +1,7 @@
-From 9ce61f97b7758794f06894e934fbb256ff62163e Mon Sep 17 00:00:00 2001
+From b0209f282716bed2c230c7b496fbcc7af503d0cc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 02:27:55 +0000
-Subject: [PATCH 02/10] make man install relative to DESTDIR
+Subject: [PATCH 02/11] make man install relative to DESTDIR
 
 Upstream-Status: Pending
 
@@ -11,7 +11,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/sim/common/Makefile.in b/sim/common/Makefile.in
-index 3944956b5d..aa355e8347 100644
+index 227e4cfbc2..8c3457e0bd 100644
 --- a/sim/common/Makefile.in
 +++ b/sim/common/Makefile.in
 @@ -35,7 +35,7 @@ tooldir = $(libdir)/$(target_alias)
@@ -24,5 +24,5 @@ index 3944956b5d..aa355e8347 100644
  includedir = @includedir@
  
 -- 
-2.13.1
+2.18.0
 
diff --git a/meta/recipes-devtools/gdb/gdb/0003-mips-linux-nat-Define-_ABIO32-if-not-defined.patch b/meta/recipes-devtools/gdb/gdb/0003-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
index 6f7955be13..cf54c74c09 100644
--- a/meta/recipes-devtools/gdb/gdb/0003-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
+++ b/meta/recipes-devtools/gdb/gdb/0003-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
@@ -1,7 +1,7 @@
-From ca0ef06b7320912df350e730e63f9bafdaa6ea70 Mon Sep 17 00:00:00 2001
+From b14a57d90e1cdd8144cda4c8882bd1db44d26dab Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 23 Mar 2016 06:30:09 +0000
-Subject: [PATCH 03/10] mips-linux-nat: Define _ABIO32 if not defined
+Subject: [PATCH 03/11] mips-linux-nat: Define _ABIO32 if not defined
 
 This helps building gdb on mips64 on musl, since
 musl does not provide sgidefs.h this define is
@@ -9,29 +9,27 @@ only defined when GCC is using o32 ABI, in that
 case gcc emits it as built-in define and hence
 it works ok for mips32
 
+Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
-Upstream-Status: Pending
-
- gdb/mips-linux-nat.c | 5 +++++
- 1 file changed, 5 insertions(+)
+ gdb/mips-linux-nat.c | 4 ++++
+ 1 file changed, 4 insertions(+)
 
 diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
-index 8041d84be7..f2df1b9907 100644
+index 32835c16b2..68a7587af2 100644
 --- a/gdb/mips-linux-nat.c
 +++ b/gdb/mips-linux-nat.c
-@@ -47,6 +47,11 @@
+@@ -41,6 +41,10 @@
+ #ifndef PTRACE_GET_THREAD_AREA
  #define PTRACE_GET_THREAD_AREA 25
  #endif
- 
 +/* musl does not define and relies on compiler built-in macros for it   */
 +#ifndef _ABIO32
 +#define _ABIO32 1
 +#endif
-+
- /* Assume that we have PTRACE_GETREGS et al. support.  If we do not,
-    we'll clear this and use PTRACE_PEEKUSER instead.  */
- static int have_ptrace_regsets = 1;
+ 
+ class mips_linux_nat_target final : public linux_nat_trad_target
+ {
 -- 
-2.13.1
+2.18.0
 
diff --git a/meta/recipes-devtools/gdb/gdb/0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/meta/recipes-devtools/gdb/gdb/0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
index 357db25ec1..bbe0020bf3 100644
--- a/meta/recipes-devtools/gdb/gdb/0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
+++ b/meta/recipes-devtools/gdb/gdb/0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
@@ -1,7 +1,7 @@
-From 0f6d71118ca914002fcad78d2c8a518223d06bfb Mon Sep 17 00:00:00 2001
+From 1dd5c44474b01d84de60faded960fef4a0a87e41 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 18:32:14 -0700
-Subject: [PATCH 04/10] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLIBC
+Subject: [PATCH 04/11] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLIBC
  systems
 
 Upstream-Status: Pending
@@ -13,7 +13,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 12 insertions(+)
 
 diff --git a/gdb/gdbserver/linux-ppc-low.c b/gdb/gdbserver/linux-ppc-low.c
-index 33a9feb12c..1a9141faef 100644
+index 47428c1529..841a5e02b9 100644
 --- a/gdb/gdbserver/linux-ppc-low.c
 +++ b/gdb/gdbserver/linux-ppc-low.c
 @@ -21,7 +21,13 @@
@@ -28,10 +28,10 @@ index 33a9feb12c..1a9141faef 100644
 +# undef pt_regs
 +#endif
  
- #include "nat/ppc-linux.h"
- #include "linux-ppc-tdesc.h"
+ #include "arch/ppc-linux-common.h"
+ #include "arch/ppc-linux-tdesc.h"
 diff --git a/gdb/nat/ppc-linux.h b/gdb/nat/ppc-linux.h
-index 5837ea1767..7233929192 100644
+index 3d4d4fdc56..5b93af8d3a 100644
 --- a/gdb/nat/ppc-linux.h
 +++ b/gdb/nat/ppc-linux.h
 @@ -18,7 +18,13 @@
@@ -49,5 +49,5 @@ index 5837ea1767..7233929192 100644
  
  /* This sometimes isn't defined.  */
 -- 
-2.13.1
+2.18.0
 
diff --git a/meta/recipes-devtools/gdb/gdb/0005-Add-support-for-Renesas-SH-sh4-architecture.patch b/meta/recipes-devtools/gdb/gdb/0005-Add-support-for-Renesas-SH-sh4-architecture.patch
index f678598284..f840cafe2e 100644
--- a/meta/recipes-devtools/gdb/gdb/0005-Add-support-for-Renesas-SH-sh4-architecture.patch
+++ b/meta/recipes-devtools/gdb/gdb/0005-Add-support-for-Renesas-SH-sh4-architecture.patch
@@ -1,4 +1,4 @@
-From 8757b36be6109f6d7ea0bd8dafbaed647e0d2192 Mon Sep 17 00:00:00 2001
+From 215486b53a7a6dfca064cd2e9196a9de6ed6f0c2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 02:31:12 +0000
 Subject: [PATCH 05/11] Add support for Renesas SH (sh4) architecture.
@@ -26,24 +26,24 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  gdb/testsuite/gdb.base/signals.c     |   4 +
  11 files changed, 617 insertions(+), 29 deletions(-)
 
-Index: gdb-8.1/gdb/Makefile.in
-===================================================================
---- gdb-8.1.orig/gdb/Makefile.in
-+++ gdb-8.1/gdb/Makefile.in
-@@ -758,6 +758,8 @@ ALL_TARGET_OBS = \
- 	sh-linux-tdep.o \
- 	sh-nbsd-tdep.o \
- 	sh-tdep.o \
-+	sh-linux-tdep.o \
-+	sh-linux-nat.o \
- 	sh64-tdep.o \
- 	sol2-tdep.o \
- 	solib-aix.o \
-Index: gdb-8.1/gdb/configure.host
-===================================================================
---- gdb-8.1.orig/gdb/configure.host
-+++ gdb-8.1/gdb/configure.host
-@@ -152,6 +152,7 @@ powerpc*-*-linux*)	gdb_host=linux ;;
+diff --git a/gdb/Makefile.in b/gdb/Makefile.in
+index c76a4e4394..921fdadb49 100644
+--- a/gdb/Makefile.in
++++ b/gdb/Makefile.in
+@@ -2326,6 +2326,8 @@ ALLDEPFILES = \
+ 	sh-nbsd-nat.c \
+ 	sh-nbsd-tdep.c \
+ 	sh-tdep.c \
++	sh-linux-tdep.c \
++	sh-linux-nat.c \
+ 	sol2-tdep.c \
+ 	solib-aix.c \
+ 	solib-spu.c \
+diff --git a/gdb/configure.host b/gdb/configure.host
+index 23a2f16399..39a886ec53 100644
+--- a/gdb/configure.host
++++ b/gdb/configure.host
+@@ -153,6 +153,7 @@ riscv*-*-linux*)	gdb_host=linux ;;
  
  s390*-*-linux*)		gdb_host=linux ;;
  
@@ -51,10 +51,10 @@ Index: gdb-8.1/gdb/configure.host
  sh*-*-netbsdelf* | sh*-*-knetbsd*-gnu)
  			gdb_host=nbsd ;;
  sh*-*-openbsd*)		gdb_host=nbsd ;;
-Index: gdb-8.1/gdb/sh-linux-tdep.c
-===================================================================
---- gdb-8.1.orig/gdb/sh-linux-tdep.c
-+++ gdb-8.1/gdb/sh-linux-tdep.c
+diff --git a/gdb/sh-linux-tdep.c b/gdb/sh-linux-tdep.c
+index db93967910..4109c549e8 100644
+--- a/gdb/sh-linux-tdep.c
++++ b/gdb/sh-linux-tdep.c
 @@ -18,14 +18,37 @@
     along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
  
@@ -93,7 +93,7 @@ Index: gdb-8.1/gdb/sh-linux-tdep.c
  #include "glibc-tdep.h"
  #include "sh-tdep.h"
  #include "linux-tdep.h"
-@@ -180,9 +203,505 @@ static struct tramp_frame sh_linux_rt_si
+@@ -180,9 +203,505 @@ static struct tramp_frame sh_linux_rt_sigreturn_tramp_frame = {
    sh_linux_rt_sigreturn_init
  };
  
@@ -599,10 +599,10 @@ Index: gdb-8.1/gdb/sh-linux-tdep.c
    linux_init_abi (info, gdbarch);
  
    /* GNU/Linux uses SVR4-style shared libraries.  */
-Index: gdb-8.1/gdb/sh-tdep.c
-===================================================================
---- gdb-8.1.orig/gdb/sh-tdep.c
-+++ gdb-8.1/gdb/sh-tdep.c
+diff --git a/gdb/sh-tdep.c b/gdb/sh-tdep.c
+index fe64cf979a..4417114cd0 100644
+--- a/gdb/sh-tdep.c
++++ b/gdb/sh-tdep.c
 @@ -21,6 +21,9 @@
     sac@cygnus.com.  */
  
@@ -613,7 +613,7 @@ Index: gdb-8.1/gdb/sh-tdep.c
  #include "frame.h"
  #include "frame-base.h"
  #include "frame-unwind.h"
-@@ -67,23 +70,6 @@ static const char *const sh_cc_enum[] =
+@@ -66,23 +69,6 @@ static const char *const sh_cc_enum[] = {
  
  static const char *sh_active_calling_convention = sh_cc_gcc;
  
@@ -637,7 +637,7 @@ Index: gdb-8.1/gdb/sh-tdep.c
  static int
  sh_is_renesas_calling_convention (struct type *func_type)
  {
-@@ -1051,7 +1037,7 @@ sh_treat_as_flt_p (struct type *type)
+@@ -1050,7 +1036,7 @@ sh_treat_as_flt_p (struct type *type)
      return 0;
    /* Otherwise if the type of that member is float, the whole type is
       treated as float.  */
@@ -646,7 +646,7 @@ Index: gdb-8.1/gdb/sh-tdep.c
      return 1;
    /* Otherwise it's not treated as float.  */
    return 0;
-@@ -1101,7 +1087,7 @@ sh_push_dummy_call_fpu (struct gdbarch *
+@@ -1100,7 +1086,7 @@ sh_push_dummy_call_fpu (struct gdbarch *gdbarch,
       in four registers available.  Loop thru args from first to last.  */
    for (argnum = 0; argnum < nargs; argnum++)
      {
@@ -655,7 +655,7 @@ Index: gdb-8.1/gdb/sh-tdep.c
        len = TYPE_LENGTH (type);
        val = sh_justify_value_in_reg (gdbarch, args[argnum], len);
  
-@@ -1835,7 +1821,7 @@ sh_dwarf2_frame_init_reg (struct gdbarch
+@@ -1834,7 +1820,7 @@ sh_dwarf2_frame_init_reg (struct gdbarch *gdbarch, int regnum,
      reg->how = DWARF2_FRAME_REG_UNDEFINED;
  }
  
@@ -664,7 +664,7 @@ Index: gdb-8.1/gdb/sh-tdep.c
  sh_alloc_frame_cache (void)
  {
    struct sh_frame_cache *cache;
-@@ -1862,7 +1848,7 @@ sh_alloc_frame_cache (void)
+@@ -1861,7 +1847,7 @@ sh_alloc_frame_cache (void)
    return cache;
  }
  
@@ -673,7 +673,7 @@ Index: gdb-8.1/gdb/sh-tdep.c
  sh_frame_cache (struct frame_info *this_frame, void **this_cache)
  {
    struct gdbarch *gdbarch = get_frame_arch (this_frame);
-@@ -1929,9 +1915,9 @@ sh_frame_cache (struct frame_info *this_
+@@ -1928,9 +1914,9 @@ sh_frame_cache (struct frame_info *this_frame, void **this_cache)
    return cache;
  }
  
@@ -686,7 +686,7 @@ Index: gdb-8.1/gdb/sh-tdep.c
  {
    struct gdbarch *gdbarch = get_frame_arch (this_frame);
    struct sh_frame_cache *cache = sh_frame_cache (this_frame, this_cache);
-@@ -1945,7 +1931,7 @@ sh_frame_prev_register (struct frame_inf
+@@ -1944,7 +1930,7 @@ sh_frame_prev_register (struct frame_info *this_frame,
       the current frame.  Frob regnum so that we pull the value from
       the correct place.  */
    if (regnum == gdbarch_pc_regnum (gdbarch))
@@ -695,7 +695,7 @@ Index: gdb-8.1/gdb/sh-tdep.c
  
    if (regnum < SH_NUM_REGS && cache->saved_regs[regnum] != -1)
      return frame_unwind_got_memory (this_frame, regnum,
-@@ -2254,8 +2240,8 @@ sh_return_in_first_hidden_param_p (struc
+@@ -2255,8 +2241,8 @@ sh_return_in_first_hidden_param_p (struct gdbarch *gdbarch,
  static struct gdbarch *
  sh_gdbarch_init (struct gdbarch_info info, struct gdbarch_list *arches)
  {
@@ -703,9 +703,9 @@ Index: gdb-8.1/gdb/sh-tdep.c
    struct gdbarch_tdep *tdep;
 +  struct gdbarch *gdbarch;
  
-   /* SH5 is handled entirely in sh64-tdep.c.  */
-   if (info.bfd_arch_info->mach == bfd_mach_sh5)
-@@ -2271,6 +2257,18 @@ sh_gdbarch_init (struct gdbarch_info inf
+   /* If there is already a candidate, use it.  */
+   arches = gdbarch_list_lookup_by_info (arches, &info);
+@@ -2268,6 +2254,18 @@ sh_gdbarch_init (struct gdbarch_info info, struct gdbarch_list *arches)
    tdep = XCNEW (struct gdbarch_tdep);
    gdbarch = gdbarch_alloc (&info, tdep);
  
@@ -724,7 +724,7 @@ Index: gdb-8.1/gdb/sh-tdep.c
    set_gdbarch_short_bit (gdbarch, 2 * TARGET_CHAR_BIT);
    set_gdbarch_int_bit (gdbarch, 4 * TARGET_CHAR_BIT);
    set_gdbarch_long_bit (gdbarch, 4 * TARGET_CHAR_BIT);
-@@ -2425,10 +2423,11 @@ sh_gdbarch_init (struct gdbarch_info inf
+@@ -2422,10 +2420,11 @@ sh_gdbarch_init (struct gdbarch_info info, struct gdbarch_list *arches)
        break;
      }
  
@@ -737,10 +737,10 @@ Index: gdb-8.1/gdb/sh-tdep.c
    frame_unwind_append_unwinder (gdbarch, &sh_stub_unwind);
    frame_unwind_append_unwinder (gdbarch, &sh_frame_unwind);
  
-Index: gdb-8.1/gdb/sh-tdep.h
-===================================================================
---- gdb-8.1.orig/gdb/sh-tdep.h
-+++ gdb-8.1/gdb/sh-tdep.h
+diff --git a/gdb/sh-tdep.h b/gdb/sh-tdep.h
+index 59acd35b88..be3f998d84 100644
+--- a/gdb/sh-tdep.h
++++ b/gdb/sh-tdep.h
 @@ -21,6 +21,12 @@
  
  /* Contributed by Steve Chamberlain sac@cygnus.com.  */
@@ -820,10 +820,10 @@ Index: gdb-8.1/gdb/sh-tdep.h
    /* Non-NULL when debugging from a core file.  Provides the offset
       where each general-purpose register is stored inside the associated
       core file section.  */
-Index: gdb-8.1/gdb/testsuite/gdb.asm/asm-source.exp
-===================================================================
---- gdb-8.1.orig/gdb/testsuite/gdb.asm/asm-source.exp
-+++ gdb-8.1/gdb/testsuite/gdb.asm/asm-source.exp
+diff --git a/gdb/testsuite/gdb.asm/asm-source.exp b/gdb/testsuite/gdb.asm/asm-source.exp
+index 9879f0ca47..cbc0e4d5f7 100644
+--- a/gdb/testsuite/gdb.asm/asm-source.exp
++++ b/gdb/testsuite/gdb.asm/asm-source.exp
 @@ -116,6 +116,11 @@ switch -glob -- [istarget] {
              append link-flags " -m elf32ppc"
          }
@@ -836,10 +836,10 @@ Index: gdb-8.1/gdb/testsuite/gdb.asm/asm-source.exp
      "sh*-*-*" {
          set asm-arch sh
  	set debug-flags "-gdwarf-2"
-Index: gdb-8.1/gdb/testsuite/gdb.asm/sh.inc
-===================================================================
---- gdb-8.1.orig/gdb/testsuite/gdb.asm/sh.inc
-+++ gdb-8.1/gdb/testsuite/gdb.asm/sh.inc
+diff --git a/gdb/testsuite/gdb.asm/sh.inc b/gdb/testsuite/gdb.asm/sh.inc
+index a4a5fc545e..89efed7795 100644
+--- a/gdb/testsuite/gdb.asm/sh.inc
++++ b/gdb/testsuite/gdb.asm/sh.inc
 @@ -40,9 +40,8 @@
  	mov.l   .Lconst\@,r1
  	bra	.Lafterconst\@
@@ -851,10 +851,10 @@ Index: gdb-8.1/gdb/testsuite/gdb.asm/sh.inc
  	.long	\subr
  	.align	1
  .Lafterconst\@:
-Index: gdb-8.1/gdb/testsuite/gdb.base/annota1.c
-===================================================================
---- gdb-8.1.orig/gdb/testsuite/gdb.base/annota1.c
-+++ gdb-8.1/gdb/testsuite/gdb.base/annota1.c
+diff --git a/gdb/testsuite/gdb.base/annota1.c b/gdb/testsuite/gdb.base/annota1.c
+index 424e1b8327..0de2e7b633 100644
+--- a/gdb/testsuite/gdb.base/annota1.c
++++ b/gdb/testsuite/gdb.base/annota1.c
 @@ -1,6 +1,9 @@
  #include <stdio.h>
  #include <signal.h>
@@ -865,10 +865,10 @@ Index: gdb-8.1/gdb/testsuite/gdb.base/annota1.c
  
  void
  handle_USR1 (int sig)
-Index: gdb-8.1/gdb/testsuite/gdb.base/annota3.c
-===================================================================
---- gdb-8.1.orig/gdb/testsuite/gdb.base/annota3.c
-+++ gdb-8.1/gdb/testsuite/gdb.base/annota3.c
+diff --git a/gdb/testsuite/gdb.base/annota3.c b/gdb/testsuite/gdb.base/annota3.c
+index 424e1b8327..952aaf218a 100644
+--- a/gdb/testsuite/gdb.base/annota3.c
++++ b/gdb/testsuite/gdb.base/annota3.c
 @@ -1,6 +1,10 @@
  #include <stdio.h>
  #include <signal.h>
@@ -880,10 +880,10 @@ Index: gdb-8.1/gdb/testsuite/gdb.base/annota3.c
  
  void
  handle_USR1 (int sig)
-Index: gdb-8.1/gdb/testsuite/gdb.base/sigall.c
-===================================================================
---- gdb-8.1.orig/gdb/testsuite/gdb.base/sigall.c
-+++ gdb-8.1/gdb/testsuite/gdb.base/sigall.c
+diff --git a/gdb/testsuite/gdb.base/sigall.c b/gdb/testsuite/gdb.base/sigall.c
+index 81f3b08d6b..1574b2d6cb 100644
+--- a/gdb/testsuite/gdb.base/sigall.c
++++ b/gdb/testsuite/gdb.base/sigall.c
 @@ -1,6 +1,9 @@
  #include <signal.h>
  #include <unistd.h>
@@ -894,10 +894,10 @@ Index: gdb-8.1/gdb/testsuite/gdb.base/sigall.c
  
  /* Signal handlers, we set breakpoints in them to make sure that the
     signals really get delivered.  */
-Index: gdb-8.1/gdb/testsuite/gdb.base/signals.c
-===================================================================
---- gdb-8.1.orig/gdb/testsuite/gdb.base/signals.c
-+++ gdb-8.1/gdb/testsuite/gdb.base/signals.c
+diff --git a/gdb/testsuite/gdb.base/signals.c b/gdb/testsuite/gdb.base/signals.c
+index 756606880f..1205a9bc9c 100644
+--- a/gdb/testsuite/gdb.base/signals.c
++++ b/gdb/testsuite/gdb.base/signals.c
 @@ -3,6 +3,10 @@
  #include <signal.h>
  #include <unistd.h>
@@ -909,3 +909,6 @@ Index: gdb-8.1/gdb/testsuite/gdb.base/signals.c
  
  static int count = 0;
  
+-- 
+2.18.0
+
diff --git a/meta/recipes-devtools/gdb/gdb/0006-Dont-disable-libreadline.a-when-using-disable-static.patch b/meta/recipes-devtools/gdb/gdb/0006-Dont-disable-libreadline.a-when-using-disable-static.patch
index 8b13958101..9ae3ee62be 100644
--- a/meta/recipes-devtools/gdb/gdb/0006-Dont-disable-libreadline.a-when-using-disable-static.patch
+++ b/meta/recipes-devtools/gdb/gdb/0006-Dont-disable-libreadline.a-when-using-disable-static.patch
@@ -1,7 +1,7 @@
-From 5c92ebd5e117e4cf118c984171e0703dfcfb8cd8 Mon Sep 17 00:00:00 2001
+From 5fdd42acaa965be7c420a3f2ba12b77ea503c59b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 15:25:03 -0700
-Subject: [PATCH 06/10] Dont disable libreadline.a when using --disable-static
+Subject: [PATCH 06/11] Dont disable libreadline.a when using --disable-static
 
 If gdb is configured with --disable-static then this is dutifully passed to
 readline which then disables libreadline.a, which causes a problem when gdb
@@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.def b/Makefile.def
-index 0d13f037d0..8bcd86e13f 100644
+index 75063b6d12..c27bbe4d28 100644
 --- a/Makefile.def
 +++ b/Makefile.def
 @@ -105,7 +105,8 @@ host_modules= { module= libiconv;
@@ -33,7 +33,7 @@ index 0d13f037d0..8bcd86e13f 100644
  host_modules= { module= sim; };
  host_modules= { module= texinfo; no_install= true; };
 diff --git a/Makefile.in b/Makefile.in
-index 3acb83b8de..e348907128 100644
+index 7814fe745f..3b0dc7cbb0 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -25470,7 +25470,7 @@ configure-readline:
@@ -46,5 +46,5 @@ index 3acb83b8de..e348907128 100644
  @endif readline
  
 -- 
-2.13.1
+2.18.0
 
diff --git a/meta/recipes-devtools/gdb/gdb/0007-use-asm-sgidefs.h.patch b/meta/recipes-devtools/gdb/gdb/0007-use-asm-sgidefs.h.patch
index 33b4c30eef..808f4bfa14 100644
--- a/meta/recipes-devtools/gdb/gdb/0007-use-asm-sgidefs.h.patch
+++ b/meta/recipes-devtools/gdb/gdb/0007-use-asm-sgidefs.h.patch
@@ -1,7 +1,7 @@
-From 12a0b8d81e1fda6ba98abdce8d6f09f9555ebcf5 Mon Sep 17 00:00:00 2001
+From d6e12d52f9cef7f5e6315003ceaa236f6cc7723b Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <amccurdy@gmail.com>
 Date: Sat, 30 Apr 2016 15:29:06 -0700
-Subject: [PATCH 07/10] use <asm/sgidefs.h>
+Subject: [PATCH 07/11] use <asm/sgidefs.h>
 
 Build fix for MIPS with musl libc
 
@@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
-index f2df1b9907..d24664cb56 100644
+index 68a7587af2..2b77221372 100644
 --- a/gdb/mips-linux-nat.c
 +++ b/gdb/mips-linux-nat.c
 @@ -31,7 +31,7 @@
@@ -32,5 +32,5 @@ index f2df1b9907..d24664cb56 100644
  #include <asm/ptrace.h>
  #include "inf-ptrace.h"
 -- 
-2.13.1
+2.18.0
 
diff --git a/meta/recipes-devtools/gdb/gdb/0008-Use-exorted-definitions-of-SIGRTMIN.patch b/meta/recipes-devtools/gdb/gdb/0008-Use-exorted-definitions-of-SIGRTMIN.patch
index 4f64dea254..d32352b813 100644
--- a/meta/recipes-devtools/gdb/gdb/0008-Use-exorted-definitions-of-SIGRTMIN.patch
+++ b/meta/recipes-devtools/gdb/gdb/0008-Use-exorted-definitions-of-SIGRTMIN.patch
@@ -1,7 +1,7 @@
-From d3f240b38eed7cd08f6c50ea896572f1327b437a Mon Sep 17 00:00:00 2001
+From d97878b272bd7c4993f4205983ae8b7ecddbcf82 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 15:31:40 -0700
-Subject: [PATCH 08/10] Use exorted definitions of SIGRTMIN
+Subject: [PATCH 08/11] Use exorted definitions of SIGRTMIN
 
 Define W_STOPCODE if not defined already
 
@@ -20,10 +20,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 6 insertions(+), 2 deletions(-)
 
 diff --git a/gdb/linux-nat.c b/gdb/linux-nat.c
-index 8b29245c3d..f424ae9711 100644
+index 64015e7520..acf950c38b 100644
 --- a/gdb/linux-nat.c
 +++ b/gdb/linux-nat.c
-@@ -5021,6 +5021,6 @@ lin_thread_get_thread_signals (sigset_t *set)
+@@ -4724,6 +4724,6 @@ lin_thread_get_thread_signals (sigset_t *set)
    /* NPTL reserves the first two RT signals, but does not provide any
       way for the debugger to query the signal numbers - fortunately
       they don't change.  */
@@ -33,7 +33,7 @@ index 8b29245c3d..f424ae9711 100644
 +  sigaddset (set, SIGRTMIN + 1);
  }
 diff --git a/gdb/nat/linux-nat.h b/gdb/nat/linux-nat.h
-index 7dd18fefff..35137ab34f 100644
+index a90a124d3a..4f3e681962 100644
 --- a/gdb/nat/linux-nat.h
 +++ b/gdb/nat/linux-nat.h
 @@ -90,4 +90,8 @@ extern void linux_stop_lwp (struct lwp_info *lwp);
@@ -46,5 +46,5 @@ index 7dd18fefff..35137ab34f 100644
 +
  #endif /* LINUX_NAT_H */
 -- 
-2.13.1
+2.18.0
 
diff --git a/meta/recipes-devtools/gdb/gdb/0009-Change-order-of-CFLAGS.patch b/meta/recipes-devtools/gdb/gdb/0009-Change-order-of-CFLAGS.patch
index 0c103ef3f6..bc4bc26835 100644
--- a/meta/recipes-devtools/gdb/gdb/0009-Change-order-of-CFLAGS.patch
+++ b/meta/recipes-devtools/gdb/gdb/0009-Change-order-of-CFLAGS.patch
@@ -1,7 +1,7 @@
-From 3f54036b891054072b3e43ea8daaa57aa367b2e0 Mon Sep 17 00:00:00 2001
+From ba6ffa461fe781d44d6dcbc0fbd569237b450fdc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 15:35:39 -0700
-Subject: [PATCH 09/10] Change order of CFLAGS
+Subject: [PATCH 09/11] Change order of CFLAGS
 
 Lets us override Werror if need be
 
@@ -13,10 +13,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gdb/gdbserver/Makefile.in b/gdb/gdbserver/Makefile.in
-index 01dfdc0b89..f6aebef464 100644
+index f2f8a084bd..9528db1364 100644
 --- a/gdb/gdbserver/Makefile.in
 +++ b/gdb/gdbserver/Makefile.in
-@@ -140,7 +140,7 @@ CPPFLAGS = @CPPFLAGS@
+@@ -143,7 +143,7 @@ CPPFLAGS = @CPPFLAGS@
  INTERNAL_CFLAGS_BASE = ${CXXFLAGS} ${GLOBAL_CFLAGS} \
  	${PROFILE_CFLAGS} ${INCLUDE_CFLAGS} ${CPPFLAGS}
  INTERNAL_WARN_CFLAGS = ${INTERNAL_CFLAGS_BASE} $(WARN_CFLAGS)
@@ -26,5 +26,5 @@ index 01dfdc0b89..f6aebef464 100644
  # LDFLAGS is specifically reserved for setting from the command line
  # when running make.
 -- 
-2.13.1
+2.18.0
 
diff --git a/meta/recipes-devtools/gdb/gdb/0010-resolve-restrict-keyword-conflict.patch b/meta/recipes-devtools/gdb/gdb/0010-resolve-restrict-keyword-conflict.patch
index c9507109b9..809d52f250 100644
--- a/meta/recipes-devtools/gdb/gdb/0010-resolve-restrict-keyword-conflict.patch
+++ b/meta/recipes-devtools/gdb/gdb/0010-resolve-restrict-keyword-conflict.patch
@@ -1,7 +1,7 @@
-From 3ead0dd143521b0ba69c9e753bc4a236f9445ad9 Mon Sep 17 00:00:00 2001
+From 19b581056c1709f7d2872cd76b977542a0fe6142 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 10 May 2016 08:47:05 -0700
-Subject: [PATCH 10/10] resolve restrict keyword conflict
+Subject: [PATCH 10/11] resolve restrict keyword conflict
 
 GCC detects that we call 'restrict' as param name in function
 signatures and complains since both params are called 'restrict'
@@ -15,7 +15,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/gdb/gnulib/import/sys_time.in.h b/gdb/gnulib/import/sys_time.in.h
-index d535a6a48b..7c34d5a1aa 100644
+index b4a0e49c50..d22cea9aaf 100644
 --- a/gdb/gnulib/import/sys_time.in.h
 +++ b/gdb/gnulib/import/sys_time.in.h
 @@ -93,20 +93,20 @@ struct timeval
@@ -44,5 +44,5 @@ index d535a6a48b..7c34d5a1aa 100644
  _GL_CXXALIASWARN (gettimeofday);
  # if defined __cplusplus && defined GNULIB_NAMESPACE
 -- 
-2.13.1
+2.18.0
 
diff --git a/meta/recipes-devtools/gdb/gdb/package_devel_gdb_patches_120-sigprocmask-invalid-call.patch b/meta/recipes-devtools/gdb/gdb/0011-Fix-invalid-sigprocmask-call.patch
similarity index 75%
rename from meta/recipes-devtools/gdb/gdb/package_devel_gdb_patches_120-sigprocmask-invalid-call.patch
rename to meta/recipes-devtools/gdb/gdb/0011-Fix-invalid-sigprocmask-call.patch
index c5484f789d..bce025c391 100644
--- a/meta/recipes-devtools/gdb/gdb/package_devel_gdb_patches_120-sigprocmask-invalid-call.patch
+++ b/meta/recipes-devtools/gdb/gdb/0011-Fix-invalid-sigprocmask-call.patch
@@ -1,7 +1,10 @@
-From 56893a61aa4f0270fa8d1197b9848247f90fce0d Mon Sep 17 00:00:00 2001
+From b1985595e46721bb168ac38f4c841a915cc2f799 Mon Sep 17 00:00:00 2001
 From: Yousong Zhou <yszhou4tech@gmail.com>
 Date: Fri, 24 Mar 2017 10:36:03 +0800
-Subject: [PATCH] Fix invalid sigprocmask call
+Subject: [PATCH 11/11] Fix invalid sigprocmask call
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
 
 The POSIX document says
 
@@ -20,18 +23,19 @@ gdb/ChangeLog:
 
     * common/signals-state-save-restore.c (save_original_signals_state):
     Fix invalid sigprocmask call.
----
+
 Upstream-Status: Pending [not author, cherry-picked from LEDE https://bugs.lede-project.org/index.php?do=details&task_id=637&openedfrom=-1%2Bweek]
 Signed-off-by: André Draszik <adraszik@tycoint.com>
- gdb/ChangeLog                           | 5 +++++
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
  gdb/common/signals-state-save-restore.c | 2 +-
- 2 files changed, 6 insertions(+), 1 deletion(-)
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gdb/common/signals-state-save-restore.c b/gdb/common/signals-state-save-restore.c
-index d11a9ae..734335c 100644
+index 5bb66321bb..6597decbc6 100644
 --- a/gdb/common/signals-state-save-restore.c
 +++ b/gdb/common/signals-state-save-restore.c
-@@ -41,7 +41,7 @@ save_original_signals_state (void)
+@@ -41,7 +41,7 @@ save_original_signals_state (bool quiet)
    int i;
    int res;
  
@@ -41,5 +45,5 @@ index d11a9ae..734335c 100644
      perror_with_name (("sigprocmask"));
  
 -- 
-2.6.4
+2.18.0
 
diff --git a/meta/recipes-devtools/gdb/gdb/gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.patch b/meta/recipes-devtools/gdb/gdb/gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.patch
deleted file mode 100644
index ef97de7772..0000000000
--- a/meta/recipes-devtools/gdb/gdb/gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From b033a9663053eed87cb572397176747b88e9a699 Mon Sep 17 00:00:00 2001
-From: James Clarke <jrtc27@jrtc27.com>
-Date: Fri, 19 Jan 2018 17:22:49 +0000
-Subject: [PATCH] gdb: Fix ia64 defining TRAP_HWBKPT before including
- gdb_wait.h
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-On ia64, gdb_wait.h eventually includes siginfo-consts-arch.h, which
-contains an enum with TRAP_HWBKPT, along with a #define. Thus we cannot
-define TRAP_HWBKPT to 4 beforehand, and so gdb_wait.h must be included
-earlier; include it from linux-ptrace.h so it can never come afterwards.
-
-gdb/ChangeLog:
-
-	* nat/linux-ptrace.c: Remove unnecessary reinclusion of
-	gdb_ptrace.h, and move including gdb_wait.h ...
-	* nat/linux-ptrace.h: ... to here.
-
-Upstream-Status: Accepted [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=5a6c3296a7a90694ad4042f6256f3da6d4fa4ee8]
-
-Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
----
- gdb/nat/linux-ptrace.c | 2 --
- gdb/nat/linux-ptrace.h | 1 +
- 2 files changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/gdb/nat/linux-ptrace.c b/gdb/nat/linux-ptrace.c
-index 3265b16..559c2de 100644
---- a/gdb/nat/linux-ptrace.c
-+++ b/gdb/nat/linux-ptrace.c
-@@ -21,8 +21,6 @@
- #include "linux-procfs.h"
- #include "linux-waitpid.h"
- #include "buffer.h"
--#include "gdb_wait.h"
--#include "gdb_ptrace.h"
- #ifdef HAVE_SYS_PROCFS_H
- #include <sys/procfs.h>
- #endif
-diff --git a/gdb/nat/linux-ptrace.h b/gdb/nat/linux-ptrace.h
-index 5954945..6faa89b 100644
---- a/gdb/nat/linux-ptrace.h
-+++ b/gdb/nat/linux-ptrace.h
-@@ -21,6 +21,7 @@
- struct buffer;
- 
- #include "nat/gdb_ptrace.h"
-+#include "gdb_wait.h"
- 
- #ifdef __UCLIBC__
- #if !(defined(__UCLIBC_HAS_MMU__) || defined(__ARCH_HAS_MMU__))
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/gdb/gdb_8.1.1.bb b/meta/recipes-devtools/gdb/gdb_8.2.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_8.1.1.bb
rename to meta/recipes-devtools/gdb/gdb_8.2.bb
-- 
2.18.0


