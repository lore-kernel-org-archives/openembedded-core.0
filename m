Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 40C7B73211
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 16:47:03 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id g132so9708488pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 09:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=T7YiuO7fFfHkUnTjLdLdplzFBzhJZ8XrdKHmZZVZI8Q=;
	b=EW9YWlVifhIyZ8sPyTnFL6b02DWWCDFsNBJgK4XZnAL13cX/2wGwa+eqgwpeyRPlAK
	CrjgTNyyGbVc2CcJFiTA/g+hmrOND+VDH4N3wQ6gvtJ01EPdvvxuUWgcf1YTM4ByhdIH
	hGMLcHVGLocY7fTLIEipmQHJdH3TIoi9Liicg3wsryrSgATR+6h6CEOk7/DAYFjH8EUq
	B9rsyeRVLUa1eTPTJod3mXFKUvNbwjCbUAKIbUyKVia+pugbzr85g4O36wG3xBTUzmzg
	mJMQ3LwqY+5OuqzM0YkNC7256ISLRH7EYx8h0ALpJ1P9J1brteKsaqqD02ttQ39Rj2oS
	Yz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=T7YiuO7fFfHkUnTjLdLdplzFBzhJZ8XrdKHmZZVZI8Q=;
	b=gM7DYrVlbGIkF1N3ASVWbsItgm8MwdHKJmhA3xED/OH8Qd0+n3YeCr6eIvghV9PcpW
	7ZPsFQS+9pp5uFCo4iJQPlE5BltPNpzib9dneswRi+4yke7tPAm+ggTrs72GnNBGnyad
	UujZsDRtE6oIaG/BId+tlCuRdXdRGA7OARFhdIkJyX6cZXYiFk2FXNyRJBhTaQjKnJdN
	+Q8WQOUHSs0p9rKdm8j8KyaWhBtnu53TjhV2RberV/8y9Ub4kZQKM/MShdaz7nRBfOL2
	u8rH7EAyZHWq/3q6eZ4pNMDso3zg4gNDp8ooWntRj+RbRTMBHm2ebKQbadKB6vViEBIR
	UkIQ==
X-Gm-Message-State: AOPr4FUQ3zaH6CTbvu7ECyuR8e1HVuNRY2pbRd9ONs6/ppHAcR4JnUjuUiB46s249CcItA==
X-Received: by 10.98.67.150 with SMTP id l22mr24642684pfi.85.1463158024539;
	Fri, 13 May 2016 09:47:04 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	uw2sm28725174pac.10.2016.05.13.09.47.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 May 2016 09:47:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 May 2016 09:46:51 -0700
Message-Id: <7de56da00bcbb625db36ecd585e082a1a2678507.1463157783.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <fa9c2d513cff678eebb231d4cf5991ea37061b34.1463157783.git.raj.khem@gmail.com>
References: <fa9c2d513cff678eebb231d4cf5991ea37061b34.1463157783.git.raj.khem@gmail.com>
In-Reply-To: <cover.1463157783.git.raj.khem@gmail.com>
References: <cover.1463157783.git.raj.khem@gmail.com>
Subject: [PATCH 3/6] gdb: Upgrade to 7.11
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
X-List-Received-Date: Fri, 13 May 2016 16:47:04 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gdb/{gdb-7.10.1.inc => gdb-7.11.inc}           |  0
 meta/recipes-devtools/gdb/gdb-common.inc           | 20 +++++++--
 ...nadian_7.10.1.bb => gdb-cross-canadian_7.11.bb} |  0
 meta/recipes-devtools/gdb/gdb-cross_7.10.1.bb      |  4 --
 meta/recipes-devtools/gdb/gdb-cross_7.11.bb        |  2 +
 meta/recipes-devtools/gdb/gdb.inc                  | 10 -----
 .../gdb/0001-include-sys-types.h-for-mode_t.patch  | 10 ++---
 ...002-make-man-install-relative-to-DESTDIR.patch} |  8 ++--
 ...-linux-nat-Define-_ABIO32-if-not-defined.patch} |  8 ++--
 ...efine-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch} | 11 ++---
 ...-support-for-Renesas-SH-sh4-architecture.patch} | 32 +++++++--------
 ...-libreadline.a-when-using-disable-static.patch} | 21 ++++++++--
 ...gidefs.h.patch => 0007-use-asm-sgidefs.h.patch} | 15 +++----
 ...0008-Use-exorted-definitions-of-SIGRTMIN.patch} | 44 +++++++++-----------
 ...AGS.patch => 0009-Change-order-of-CFLAGS.patch} | 18 ++++----
 .../0010-resolve-restrict-keyword-conflict.patch   | 48 ++++++++++++++++++++++
 .../gdb/{gdb_7.10.1.bb => gdb_7.11.bb}             |  1 +
 17 files changed, 156 insertions(+), 96 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-7.10.1.inc => gdb-7.11.inc} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.10.1.bb => gdb-cross-canadian_7.11.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gdb/gdb-cross_7.10.1.bb
 create mode 100644 meta/recipes-devtools/gdb/gdb-cross_7.11.bb
 rename meta/recipes-devtools/gdb/gdb/{0001-make-man-install-relative-to-DESTDIR.patch => 0002-make-man-install-relative-to-DESTDIR.patch} (78%)
 rename meta/recipes-devtools/gdb/gdb/{0001-mips-linux-nat-Define-_ABIO32-if-not-defined.patch => 0003-mips-linux-nat-Define-_ABIO32-if-not-defined.patch} (84%)
 rename meta/recipes-devtools/gdb/gdb/{0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch => 0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch} (83%)
 rename meta/recipes-devtools/gdb/gdb/{0003-Add-support-for-Renesas-SH-sh4-architecture.patch => 0005-Add-support-for-Renesas-SH-sh4-architecture.patch} (97%)
 rename meta/recipes-devtools/gdb/gdb/{force-readline-static.patch => 0006-Dont-disable-libreadline.a-when-using-disable-static.patch} (67%)
 rename meta/recipes-devtools/gdb/gdb/{0001-use-asm-sgidefs.h.patch => 0007-use-asm-sgidefs.h.patch} (69%)
 rename meta/recipes-devtools/gdb/gdb/{0001-Use-exported-definitions-of-SIGRTMIN.patch => 0008-Use-exorted-definitions-of-SIGRTMIN.patch} (49%)
 rename meta/recipes-devtools/gdb/gdb/{0002-Change-order-of-CFLAGS.patch => 0009-Change-order-of-CFLAGS.patch} (69%)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0010-resolve-restrict-keyword-conflict.patch
 rename meta/recipes-devtools/gdb/{gdb_7.10.1.bb => gdb_7.11.bb} (89%)

diff --git a/meta/recipes-devtools/gdb/gdb-7.10.1.inc b/meta/recipes-devtools/gdb/gdb-7.11.inc
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-7.10.1.inc
rename to meta/recipes-devtools/gdb/gdb-7.11.inc
diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 3260dbd..1d1cf8f 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -16,8 +16,6 @@ LTTNGUST_mips64eln32 = ""
 LTTNGUST_sh4 = ""
 LTTNGUST_libc-musl = ""
 
-INC_PR = "r0"
-
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 		file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674 \
 		file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
@@ -25,8 +23,22 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 
 inherit autotools texinfo
 
-SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.gz \
-          "
+SRCREV = "1a982b689ce4e20523bdf69e47fdd574c4f63934"
+
+SRC_URI = "git://sourceware.org/git/binutils-gdb.git;branch=gdb-7.11-branch \
+           file://0001-include-sys-types.h-for-mode_t.patch \
+           file://0002-make-man-install-relative-to-DESTDIR.patch \
+           file://0003-mips-linux-nat-Define-_ABIO32-if-not-defined.patch \
+           file://0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch \
+           file://0005-Add-support-for-Renesas-SH-sh4-architecture.patch \
+           file://0006-Dont-disable-libreadline.a-when-using-disable-static.patch \
+           file://0007-use-asm-sgidefs.h.patch \
+           file://0008-Use-exorted-definitions-of-SIGRTMIN.patch \
+           file://0009-Change-order-of-CFLAGS.patch \
+           file://0010-resolve-restrict-keyword-conflict.patch \
+"
+
+S = "${WORKDIR}/git"
 
 B = "${WORKDIR}/build-${TARGET_SYS}"
 
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.10.1.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.11.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_7.10.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_7.11.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross_7.10.1.bb b/meta/recipes-devtools/gdb/gdb-cross_7.10.1.bb
deleted file mode 100644
index 3a95cfb..0000000
--- a/meta/recipes-devtools/gdb/gdb-cross_7.10.1.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require gdb-cross.inc
-require gdb-${PV}.inc
-
-SRC_URI += "file://0001-make-man-install-relative-to-DESTDIR.patch"
diff --git a/meta/recipes-devtools/gdb/gdb-cross_7.11.bb b/meta/recipes-devtools/gdb/gdb-cross_7.11.bb
new file mode 100644
index 0000000..50cf159
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb-cross_7.11.bb
@@ -0,0 +1,2 @@
+require gdb-cross.inc
+require gdb-${PV}.inc
diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index 5a2067e..52119a0 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -2,16 +2,6 @@ require gdb-common.inc
 
 inherit gettext
 
-SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.gz \
-           file://0002-Change-order-of-CFLAGS.patch \
-           file://0003-Add-support-for-Renesas-SH-sh4-architecture.patch \
-           file://0001-Use-exported-definitions-of-SIGRTMIN.patch \
-           file://0001-include-sys-types.h-for-mode_t.patch \
-           file://0001-use-asm-sgidefs.h.patch \
-           file://force-readline-static.patch \
-           file://0001-mips-linux-nat-Define-_ABIO32-if-not-defined.patch \
-           file://0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch \
-           "
 #LDFLAGS_append = " -s"
 #export CFLAGS_append=" -L${STAGING_LIBDIR}"
 
diff --git a/meta/recipes-devtools/gdb/gdb/0001-include-sys-types.h-for-mode_t.patch b/meta/recipes-devtools/gdb/gdb/0001-include-sys-types.h-for-mode_t.patch
index a0292e4..0042c00 100644
--- a/meta/recipes-devtools/gdb/gdb/0001-include-sys-types.h-for-mode_t.patch
+++ b/meta/recipes-devtools/gdb/gdb/0001-include-sys-types.h-for-mode_t.patch
@@ -1,7 +1,7 @@
-From acbee4edacb80b5eeaff2480712fe98e56443997 Mon Sep 17 00:00:00 2001
+From fddd7178915968acf680814411b8b3cb137d0587 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 19 Jan 2016 18:18:52 -0800
-Subject: [PATCH] include sys/types.h for mode_t
+Subject: [PATCH 01/10] include sys/types.h for mode_t
 
 mode_t is used in target.h, so we need to include sys/types.h to get the
 defintion
@@ -14,10 +14,10 @@ Upstream-Status: Pending
  1 file changed, 1 insertion(+)
 
 diff --git a/gdb/gdbserver/target.h b/gdb/gdbserver/target.h
-index 9a40867..aaecab9 100644
+index 5af2051..f42c510 100644
 --- a/gdb/gdbserver/target.h
 +++ b/gdb/gdbserver/target.h
-@@ -27,6 +27,7 @@
+@@ -28,6 +28,7 @@
  #include "target/waitstatus.h"
  #include "mem-break.h"
  #include "btrace-common.h"
@@ -26,5 +26,5 @@ index 9a40867..aaecab9 100644
  struct emit_ops;
  struct buffer;
 -- 
-2.7.0
+2.8.2
 
diff --git a/meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTDIR.patch b/meta/recipes-devtools/gdb/gdb/0002-make-man-install-relative-to-DESTDIR.patch
similarity index 78%
rename from meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTDIR.patch
rename to meta/recipes-devtools/gdb/gdb/0002-make-man-install-relative-to-DESTDIR.patch
index 6996c18..defed62 100644
--- a/meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTDIR.patch
+++ b/meta/recipes-devtools/gdb/gdb/0002-make-man-install-relative-to-DESTDIR.patch
@@ -1,7 +1,7 @@
-From 12b0506951460c3cc37d775478d024db3f95e9d8 Mon Sep 17 00:00:00 2001
+From 3229cb09033eeb5003a08d91fa9d43be8ba4c86b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 02:27:55 +0000
-Subject: [PATCH 1/3] make man install relative to DESTDIR
+Subject: [PATCH 02/10] make man install relative to DESTDIR
 
 Upstream-Status: Pending
 
@@ -11,7 +11,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/sim/common/Makefile.in b/sim/common/Makefile.in
-index d49a93b..2121c46 100644
+index a05f507..8d0fa64 100644
 --- a/sim/common/Makefile.in
 +++ b/sim/common/Makefile.in
 @@ -35,7 +35,7 @@ tooldir = $(libdir)/$(target_alias)
@@ -24,5 +24,5 @@ index d49a93b..2121c46 100644
  includedir = @includedir@
  
 -- 
-2.1.4
+2.8.2
 
diff --git a/meta/recipes-devtools/gdb/gdb/0001-mips-linux-nat-Define-_ABIO32-if-not-defined.patch b/meta/recipes-devtools/gdb/gdb/0003-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
similarity index 84%
rename from meta/recipes-devtools/gdb/gdb/0001-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
rename to meta/recipes-devtools/gdb/gdb/0003-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
index 3173952..bac7939 100644
--- a/meta/recipes-devtools/gdb/gdb/0001-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
+++ b/meta/recipes-devtools/gdb/gdb/0003-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
@@ -1,7 +1,7 @@
-From e92f8932ef488de2a56db4299131ce6a4eb170bd Mon Sep 17 00:00:00 2001
+From 88e67caed662d8344c8db56176c9f1221e6cd2a2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 23 Mar 2016 06:30:09 +0000
-Subject: [PATCH] mips-linux-nat: Define _ABIO32 if not defined
+Subject: [PATCH 03/10] mips-linux-nat: Define _ABIO32 if not defined
 
 This helps building gdb on mips64 on musl, since
 musl does not provide sgidefs.h this define is
@@ -17,7 +17,7 @@ Upstream-Status: Pending
  1 file changed, 5 insertions(+)
 
 diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
-index fd5c705..753f29d 100644
+index bfe9fcb..449b43a 100644
 --- a/gdb/mips-linux-nat.c
 +++ b/gdb/mips-linux-nat.c
 @@ -46,6 +46,11 @@
@@ -33,5 +33,5 @@ index fd5c705..753f29d 100644
     we'll clear this and use PTRACE_PEEKUSER instead.  */
  static int have_ptrace_regsets = 1;
 -- 
-1.8.3.1
+2.8.2
 
diff --git a/meta/recipes-devtools/gdb/gdb/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/meta/recipes-devtools/gdb/gdb/0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
similarity index 83%
rename from meta/recipes-devtools/gdb/gdb/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
rename to meta/recipes-devtools/gdb/gdb/0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
index 342f1ce..a5fe2a2 100644
--- a/meta/recipes-devtools/gdb/gdb/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
+++ b/meta/recipes-devtools/gdb/gdb/0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
@@ -1,7 +1,8 @@
-From 33a2cdb731298b73277507f01b9a21cd340c5b5c Mon Sep 17 00:00:00 2001
+From bec564eb454bc7fc6ecfcb573aa53040bf39c1d5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 16:46:03 +0000
-Subject: [PATCH] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLIBC systems
+Subject: [PATCH 04/10] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLIBC
+ systems
 
 Upstream-Status: Pending
 
@@ -12,7 +13,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 12 insertions(+)
 
 diff --git a/gdb/gdbserver/linux-ppc-low.c b/gdb/gdbserver/linux-ppc-low.c
-index 188fac0..f71d5ab 100644
+index 2145c50..777905d 100644
 --- a/gdb/gdbserver/linux-ppc-low.c
 +++ b/gdb/gdbserver/linux-ppc-low.c
 @@ -21,7 +21,13 @@
@@ -30,7 +31,7 @@ index 188fac0..f71d5ab 100644
  #include "nat/ppc-linux.h"
  
 diff --git a/gdb/nat/ppc-linux.h b/gdb/nat/ppc-linux.h
-index 0ff2223..c978daa 100644
+index 85fbcd8..cbec9c5 100644
 --- a/gdb/nat/ppc-linux.h
 +++ b/gdb/nat/ppc-linux.h
 @@ -18,7 +18,13 @@
@@ -48,5 +49,5 @@ index 0ff2223..c978daa 100644
  
  /* This sometimes isn't defined.  */
 -- 
-1.8.3.1
+2.8.2
 
diff --git a/meta/recipes-devtools/gdb/gdb/0003-Add-support-for-Renesas-SH-sh4-architecture.patch b/meta/recipes-devtools/gdb/gdb/0005-Add-support-for-Renesas-SH-sh4-architecture.patch
similarity index 97%
rename from meta/recipes-devtools/gdb/gdb/0003-Add-support-for-Renesas-SH-sh4-architecture.patch
rename to meta/recipes-devtools/gdb/gdb/0005-Add-support-for-Renesas-SH-sh4-architecture.patch
index 4a3e22c..8809e6f 100644
--- a/meta/recipes-devtools/gdb/gdb/0003-Add-support-for-Renesas-SH-sh4-architecture.patch
+++ b/meta/recipes-devtools/gdb/gdb/0005-Add-support-for-Renesas-SH-sh4-architecture.patch
@@ -1,7 +1,7 @@
-From 407cb13cfb70697f45dfb761304e005e1ecbd0e9 Mon Sep 17 00:00:00 2001
+From 8c5fe58c5a0044ddb517a41b277ed27fb3d3bedc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 02:31:12 +0000
-Subject: [PATCH 3/3] Add support for Renesas SH (sh4) architecture.
+Subject: [PATCH 05/10] Add support for Renesas SH (sh4) architecture.
 
 gdb (7.4-1~cvs20111117.2) experimental; urgency=low
  .
@@ -27,10 +27,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  11 files changed, 617 insertions(+), 29 deletions(-)
 
 diff --git a/gdb/Makefile.in b/gdb/Makefile.in
-index 7937801..63baf81 100644
+index ec2af52..df8e84d 100644
 --- a/gdb/Makefile.in
 +++ b/gdb/Makefile.in
-@@ -1707,6 +1707,7 @@ ALLDEPFILES = \
+@@ -1736,6 +1736,7 @@ ALLDEPFILES = \
  	score-tdep.c \
  	ser-go32.c ser-pipe.c ser-tcp.c ser-mingw.c \
  	sh-tdep.c sh64-tdep.c shnbsd-tdep.c shnbsd-nat.c \
@@ -39,10 +39,10 @@ index 7937801..63baf81 100644
  	solib-svr4.c \
  	sparc-linux-nat.c sparc-linux-tdep.c \
 diff --git a/gdb/configure.host b/gdb/configure.host
-index d07be4b..b6391c5 100644
+index ef265eb..322a1e2 100644
 --- a/gdb/configure.host
 +++ b/gdb/configure.host
-@@ -150,6 +150,7 @@ powerpc*-*-linux*)	gdb_host=linux ;;
+@@ -149,6 +149,7 @@ powerpc*-*-linux*)	gdb_host=linux ;;
  
  s390*-*-linux*)		gdb_host=linux ;;
  
@@ -51,7 +51,7 @@ index d07be4b..b6391c5 100644
  			gdb_host=nbsd ;;
  sh*-*-openbsd*)		gdb_host=nbsd ;;
 diff --git a/gdb/sh-linux-tdep.c b/gdb/sh-linux-tdep.c
-index 2ff2ee8..1a11262 100644
+index 2418d25..ac8ea9e 100644
 --- a/gdb/sh-linux-tdep.c
 +++ b/gdb/sh-linux-tdep.c
 @@ -18,14 +18,37 @@
@@ -599,7 +599,7 @@ index 2ff2ee8..1a11262 100644
  
    /* GNU/Linux uses SVR4-style shared libraries.  */
 diff --git a/gdb/sh-tdep.c b/gdb/sh-tdep.c
-index 82cf2f4..b443e46 100644
+index 336b48e..847b271 100644
 --- a/gdb/sh-tdep.c
 +++ b/gdb/sh-tdep.c
 @@ -21,6 +21,9 @@
@@ -702,7 +702,7 @@ index 82cf2f4..b443e46 100644
  
    if (regnum < SH_NUM_REGS && cache->saved_regs[regnum] != -1)
      return frame_unwind_got_memory (this_frame, regnum,
-@@ -2237,8 +2224,8 @@ sh_return_in_first_hidden_param_p (struct gdbarch *gdbarch,
+@@ -2240,8 +2227,8 @@ sh_return_in_first_hidden_param_p (struct gdbarch *gdbarch,
  static struct gdbarch *
  sh_gdbarch_init (struct gdbarch_info info, struct gdbarch_list *arches)
  {
@@ -712,7 +712,7 @@ index 82cf2f4..b443e46 100644
  
    /* SH5 is handled entirely in sh64-tdep.c.  */
    if (info.bfd_arch_info->mach == bfd_mach_sh5)
-@@ -2254,6 +2241,18 @@ sh_gdbarch_init (struct gdbarch_info info, struct gdbarch_list *arches)
+@@ -2257,6 +2244,18 @@ sh_gdbarch_init (struct gdbarch_info info, struct gdbarch_list *arches)
    tdep = XCNEW (struct gdbarch_tdep);
    gdbarch = gdbarch_alloc (&info, tdep);
  
@@ -731,7 +731,7 @@ index 82cf2f4..b443e46 100644
    set_gdbarch_short_bit (gdbarch, 2 * TARGET_CHAR_BIT);
    set_gdbarch_int_bit (gdbarch, 4 * TARGET_CHAR_BIT);
    set_gdbarch_long_bit (gdbarch, 4 * TARGET_CHAR_BIT);
-@@ -2404,10 +2403,11 @@ sh_gdbarch_init (struct gdbarch_info info, struct gdbarch_list *arches)
+@@ -2407,10 +2406,11 @@ sh_gdbarch_init (struct gdbarch_info info, struct gdbarch_list *arches)
        break;
      }
  
@@ -745,7 +745,7 @@ index 82cf2f4..b443e46 100644
    frame_unwind_append_unwinder (gdbarch, &sh_frame_unwind);
  
 diff --git a/gdb/sh-tdep.h b/gdb/sh-tdep.h
-index fc671a5..699f59f 100644
+index 666968f..62c65b5 100644
 --- a/gdb/sh-tdep.h
 +++ b/gdb/sh-tdep.h
 @@ -21,6 +21,12 @@
@@ -828,10 +828,10 @@ index fc671a5..699f59f 100644
       where each general-purpose register is stored inside the associated
       core file section.  */
 diff --git a/gdb/testsuite/gdb.asm/asm-source.exp b/gdb/testsuite/gdb.asm/asm-source.exp
-index 8854af0..ef44682 100644
+index 6d9aef8..5b66b42 100644
 --- a/gdb/testsuite/gdb.asm/asm-source.exp
 +++ b/gdb/testsuite/gdb.asm/asm-source.exp
-@@ -113,6 +113,11 @@ switch -glob -- [istarget] {
+@@ -116,6 +116,11 @@ switch -glob -- [istarget] {
              append link-flags " -m elf32ppc"
          }
      }
@@ -873,7 +873,7 @@ index 424e1b8..0de2e7b 100644
  void
  handle_USR1 (int sig)
 diff --git a/gdb/testsuite/gdb.base/annota3.c b/gdb/testsuite/gdb.base/annota3.c
-index 424e1b8..952aaf2 100644
+index 424e1b8..952aaf21 100644
 --- a/gdb/testsuite/gdb.base/annota3.c
 +++ b/gdb/testsuite/gdb.base/annota3.c
 @@ -1,6 +1,10 @@
@@ -917,5 +917,5 @@ index 7566068..1205a9b 100644
  static int count = 0;
  
 -- 
-2.1.4
+2.8.2
 
diff --git a/meta/recipes-devtools/gdb/gdb/force-readline-static.patch b/meta/recipes-devtools/gdb/gdb/0006-Dont-disable-libreadline.a-when-using-disable-static.patch
similarity index 67%
rename from meta/recipes-devtools/gdb/gdb/force-readline-static.patch
rename to meta/recipes-devtools/gdb/gdb/0006-Dont-disable-libreadline.a-when-using-disable-static.patch
index d34ee8c..394d26d 100644
--- a/meta/recipes-devtools/gdb/gdb/force-readline-static.patch
+++ b/meta/recipes-devtools/gdb/gdb/0006-Dont-disable-libreadline.a-when-using-disable-static.patch
@@ -1,3 +1,8 @@
+From f3932cb2960fd54655a448b13d5a5b80f356f8de Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 30 Apr 2016 15:25:03 -0700
+Subject: [PATCH 06/10] Dont disable libreadline.a when using --disable-static
+
 If gdb is configured with --disable-static then this is dutifully passed to
 readline which then disables libreadline.a, which causes a problem when gdb
 tries to link against that.
@@ -7,12 +12,17 @@ the sub-configure.
 
 Upstream-Status: Pending
 Signed-off-by: Ross Burton <ross.burton@intel.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile.def | 3 ++-
+ Makefile.in  | 2 +-
+ 2 files changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.def b/Makefile.def
-index 4394188..05c661a 100644
+index ea8453e..0fc66c6 100644
 --- a/Makefile.def
 +++ b/Makefile.def
-@@ -100,7 +100,8 @@ host_modules= { module= libiconv;
+@@ -104,7 +104,8 @@ host_modules= { module= libiconv;
  		missing= install-html;
  		missing= install-info; };
  host_modules= { module= m4; };
@@ -23,10 +33,10 @@ index 4394188..05c661a 100644
  host_modules= { module= sim; };
  host_modules= { module= texinfo; no_install= true; };
 diff --git a/Makefile.in b/Makefile.in
-index 61e0ab6..837f36e 100644
+index 2733c4d..3e04e80 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -24971,7 +24971,7 @@ configure-readline:
+@@ -25380,7 +25380,7 @@ configure-readline:
  	  $$s/$$module_srcdir/configure \
  	  --srcdir=$${topdir}/$$module_srcdir \
  	  $(HOST_CONFIGARGS) --build=${build_alias} --host=${host_alias} \
@@ -35,3 +45,6 @@ index 61e0ab6..837f36e 100644
  	  || exit 1
  @endif readline
  
+-- 
+2.8.2
+
diff --git a/meta/recipes-devtools/gdb/gdb/0001-use-asm-sgidefs.h.patch b/meta/recipes-devtools/gdb/gdb/0007-use-asm-sgidefs.h.patch
similarity index 69%
rename from meta/recipes-devtools/gdb/gdb/0001-use-asm-sgidefs.h.patch
rename to meta/recipes-devtools/gdb/gdb/0007-use-asm-sgidefs.h.patch
index eaec390..f32f8ee 100644
--- a/meta/recipes-devtools/gdb/gdb/0001-use-asm-sgidefs.h.patch
+++ b/meta/recipes-devtools/gdb/gdb/0007-use-asm-sgidefs.h.patch
@@ -1,7 +1,7 @@
-From 677b5b56135141c0d259e370aacd0e11c810aa15 Mon Sep 17 00:00:00 2001
-From: Andre McCurdy <armccurdy@gmail.com>
-Date: Fri, 5 Feb 2016 14:00:00 -0800
-Subject: [PATCH] use <asm/sgidefs.h>
+From 048675a915a72989f2613386975730da016e7c5d Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <amccurdy@gmail.com>
+Date: Sat, 30 Apr 2016 15:29:06 -0700
+Subject: [PATCH 07/10] use <asm/sgidefs.h>
 
 Build fix for MIPS with musl libc
 
@@ -13,12 +13,13 @@ instead.
 Upstream-Status: Pending
 
 Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  gdb/mips-linux-nat.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
-index a36bb63..fd5c705 100644
+index 449b43a..09603da 100644
 --- a/gdb/mips-linux-nat.c
 +++ b/gdb/mips-linux-nat.c
 @@ -31,7 +31,7 @@
@@ -27,9 +28,9 @@ index a36bb63..fd5c705 100644
  
 -#include <sgidefs.h>
 +#include <asm/sgidefs.h>
- #include <sys/ptrace.h>
+ #include "nat/gdb_ptrace.h"
  #include <asm/ptrace.h>
  
 -- 
-1.9.1
+2.8.2
 
diff --git a/meta/recipes-devtools/gdb/gdb/0001-Use-exported-definitions-of-SIGRTMIN.patch b/meta/recipes-devtools/gdb/gdb/0008-Use-exorted-definitions-of-SIGRTMIN.patch
similarity index 49%
rename from meta/recipes-devtools/gdb/gdb/0001-Use-exported-definitions-of-SIGRTMIN.patch
rename to meta/recipes-devtools/gdb/gdb/0008-Use-exorted-definitions-of-SIGRTMIN.patch
index 5f0c096..7e58b61 100644
--- a/meta/recipes-devtools/gdb/gdb/0001-Use-exported-definitions-of-SIGRTMIN.patch
+++ b/meta/recipes-devtools/gdb/gdb/0008-Use-exorted-definitions-of-SIGRTMIN.patch
@@ -1,7 +1,7 @@
-From 2f97e89e9e4e5797d0d973e1d05c1f44c46b4912 Mon Sep 17 00:00:00 2001
+From e54ead9d81f4d38412751b815f909db3cb144bb1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 5 Jun 2015 20:21:38 -0700
-Subject: [PATCH] Use exorted definitions of SIGRTMIN
+Date: Sat, 30 Apr 2016 15:31:40 -0700
+Subject: [PATCH 08/10] Use exorted definitions of SIGRTMIN
 
 Define W_STOPCODE if not defined already
 
@@ -11,38 +11,34 @@ may not provide them
 Fixes
 https://sourceware.org/bugzilla/show_bug.cgi?id=13012
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
 Upstream-Status: Submitted
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
  gdb/linux-nat.c     | 4 ++--
  gdb/nat/linux-nat.h | 4 ++++
  2 files changed, 6 insertions(+), 2 deletions(-)
 
 diff --git a/gdb/linux-nat.c b/gdb/linux-nat.c
-index 396c30c..50320ee 100644
+index 0829bcb..3b8a896 100644
 --- a/gdb/linux-nat.c
 +++ b/gdb/linux-nat.c
-@@ -4856,10 +4856,10 @@ lin_thread_get_thread_signals (sigset_t *set)
-      fortunately they don't change!  */
- 
-   if (restart == 0)
--    restart = __SIGRTMIN;
-+    restart = SIGRTMIN;
- 
-   if (cancel == 0)
--    cancel = __SIGRTMIN + 1;
-+    cancel = SIGRTMIN + 1;
- 
-   sigaddset (set, restart);
-   sigaddset (set, cancel);
+@@ -4845,6 +4845,6 @@ lin_thread_get_thread_signals (sigset_t *set)
+   /* NPTL reserves the first two RT signals, but does not provide any
+      way for the debugger to query the signal numbers - fortunately
+      they don't change.  */
+-  sigaddset (set, __SIGRTMIN);
+-  sigaddset (set, __SIGRTMIN + 1);
++  sigaddset (set, SIGRTMIN);
++  sigaddset (set, SIGRTMIN + 1);
+ }
 diff --git a/gdb/nat/linux-nat.h b/gdb/nat/linux-nat.h
-index 83a6d91..efbe0fd 100644
+index 2b485db..d058afc 100644
 --- a/gdb/nat/linux-nat.h
 +++ b/gdb/nat/linux-nat.h
-@@ -25,4 +25,8 @@
-    instead SIGTRAP with bit 7 set.  */
- #define SYSCALL_SIGTRAP (SIGTRAP | 0x80)
+@@ -85,4 +85,8 @@ extern enum target_stop_reason lwp_stop_reason (struct lwp_info *lwp);
+ 
+ extern void linux_stop_lwp (struct lwp_info *lwp);
  
 +#ifndef W_STOPCODE
 +#define W_STOPCODE(sig) ((sig) << 8 | 0x7f)
@@ -50,5 +46,5 @@ index 83a6d91..efbe0fd 100644
 +
  #endif /* LINUX_NAT_H */
 -- 
-2.1.4
+2.8.2
 
diff --git a/meta/recipes-devtools/gdb/gdb/0002-Change-order-of-CFLAGS.patch b/meta/recipes-devtools/gdb/gdb/0009-Change-order-of-CFLAGS.patch
similarity index 69%
rename from meta/recipes-devtools/gdb/gdb/0002-Change-order-of-CFLAGS.patch
rename to meta/recipes-devtools/gdb/gdb/0009-Change-order-of-CFLAGS.patch
index bccb45f..a230047 100644
--- a/meta/recipes-devtools/gdb/gdb/0002-Change-order-of-CFLAGS.patch
+++ b/meta/recipes-devtools/gdb/gdb/0009-Change-order-of-CFLAGS.patch
@@ -1,7 +1,7 @@
-From 262ccc4fdb2a3df0f16c61a807046964ae7729c9 Mon Sep 17 00:00:00 2001
+From ba0bbf887d4911ccee9df57cb13eafb1de34bb31 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 2 Mar 2015 02:29:23 +0000
-Subject: [PATCH 2/3] Change order of CFLAGS
+Date: Sat, 30 Apr 2016 15:35:39 -0700
+Subject: [PATCH 09/10] Change order of CFLAGS
 
 Lets us override Werror if need be
 
@@ -13,22 +13,22 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/gdb/gdbserver/Makefile.in b/gdb/gdbserver/Makefile.in
-index 1ed2ec8..0cef95b 100644
+index 1e874e3..91e8550 100644
 --- a/gdb/gdbserver/Makefile.in
 +++ b/gdb/gdbserver/Makefile.in
-@@ -131,10 +131,10 @@ CFLAGS = @CFLAGS@
+@@ -138,10 +138,10 @@ CXXFLAGS = @CXXFLAGS@
  CPPFLAGS = @CPPFLAGS@
  
  # INTERNAL_CFLAGS is the aggregate of all other *CFLAGS macros.
--INTERNAL_CFLAGS_BASE =  ${CFLAGS} ${GLOBAL_CFLAGS} \
-+INTERNAL_CFLAGS_BASE = ${GLOBAL_CFLAGS} \
+-INTERNAL_CFLAGS_BASE =  ${COMPILER_CFLAGS} ${GLOBAL_CFLAGS} \
++INTERNAL_CFLAGS_BASE =  ${GLOBAL_CFLAGS} \
  	${PROFILE_CFLAGS} ${INCLUDE_CFLAGS} ${CPPFLAGS}
  INTERNAL_WARN_CFLAGS =  ${INTERNAL_CFLAGS_BASE} $(WARN_CFLAGS)
 -INTERNAL_CFLAGS =  ${INTERNAL_WARN_CFLAGS} $(WERROR_CFLAGS) -DGDBSERVER
-+INTERNAL_CFLAGS =  ${INTERNAL_WARN_CFLAGS} $(WERROR_CFLAGS) ${CFLAGS} -DGDBSERVER
++INTERNAL_CFLAGS =  ${INTERNAL_WARN_CFLAGS} $(WERROR_CFLAGS) ${COMPILER_CFLAGS} -DGDBSERVER
  
  # LDFLAGS is specifically reserved for setting from the command line
  # when running make.
 -- 
-2.1.4
+2.8.2
 
diff --git a/meta/recipes-devtools/gdb/gdb/0010-resolve-restrict-keyword-conflict.patch b/meta/recipes-devtools/gdb/gdb/0010-resolve-restrict-keyword-conflict.patch
new file mode 100644
index 0000000..16c34c7
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/0010-resolve-restrict-keyword-conflict.patch
@@ -0,0 +1,48 @@
+From 5a9ccb8c0728b658fc4f7f0f7b36873c64274f10 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 10 May 2016 08:47:05 -0700
+Subject: [PATCH 10/10] resolve restrict keyword conflict
+
+GCC detects that we call 'restrict' as param name in function
+signatures and complains since both params are called 'restrict'
+therefore we use __restrict to denote the C99 keywork
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gdb/gnulib/import/sys_time.in.h | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/gdb/gnulib/import/sys_time.in.h b/gdb/gnulib/import/sys_time.in.h
+index c556c5d..2a6107f 100644
+--- a/gdb/gnulib/import/sys_time.in.h
++++ b/gdb/gnulib/import/sys_time.in.h
+@@ -93,20 +93,20 @@ struct timeval
+ #   define gettimeofday rpl_gettimeofday
+ #  endif
+ _GL_FUNCDECL_RPL (gettimeofday, int,
+-                  (struct timeval *restrict, void *restrict)
++                  (struct timeval *__restrict, void *__restrict)
+                   _GL_ARG_NONNULL ((1)));
+ _GL_CXXALIAS_RPL (gettimeofday, int,
+-                  (struct timeval *restrict, void *restrict));
++                  (struct timeval *__restrict, void *__restrict));
+ # else
+ #  if !@HAVE_GETTIMEOFDAY@
+ _GL_FUNCDECL_SYS (gettimeofday, int,
+-                  (struct timeval *restrict, void *restrict)
++                  (struct timeval *__restrict, void *__restrict)
+                   _GL_ARG_NONNULL ((1)));
+ #  endif
+ /* Need to cast, because on glibc systems, by default, the second argument is
+                                                   struct timezone *.  */
+ _GL_CXXALIAS_SYS_CAST (gettimeofday, int,
+-                       (struct timeval *restrict, void *restrict));
++                       (struct timeval *__restrict, void *__restrict));
+ # endif
+ _GL_CXXALIASWARN (gettimeofday);
+ #elif defined GNULIB_POSIXCHECK
+-- 
+2.8.2
+
diff --git a/meta/recipes-devtools/gdb/gdb_7.10.1.bb b/meta/recipes-devtools/gdb/gdb_7.11.bb
similarity index 89%
rename from meta/recipes-devtools/gdb/gdb_7.10.1.bb
rename to meta/recipes-devtools/gdb/gdb_7.11.bb
index f897e12..ccc33b8 100644
--- a/meta/recipes-devtools/gdb/gdb_7.10.1.bb
+++ b/meta/recipes-devtools/gdb/gdb_7.11.bb
@@ -18,3 +18,4 @@ EOF
 		chmod +x ${WORKDIR}/python
 	fi
 }
+CFLAGS_append_libc-musl = " -Drpl_gettimeofday=gettimeofday"
-- 
2.8.2


