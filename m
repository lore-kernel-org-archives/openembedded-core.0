Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id BB04A71A68
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 22:57:11 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id y68so2895226pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2016 15:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=6G1IKX1ynVtwNx1gDBefCue8bT28YVqX4mKGV++z+BQ=;
	b=HEN7FNtV2OMUNPkYl1b7UepEjOREX9Y8KTBMS1N+9Uk9ElkVL/PVgtXyg7fDPjJirm
	jN5IEDUpPR6XdN8DEr6iGIj6Yhd1AXQrQlsnOSAcqJ2+4OZoHbll45rKOOnZAzOXAI9S
	7+lr6AVRJdQja1gAQiYd9HUdUhsJSUCkgcLIrVmAOn5k0OlvYhRyXfo6DriHKifGJLYZ
	TvjQ8+cTlra7meybbqC0sAKVTu4sC11ND0Mrqth5zJSWuRNJarBCyNh5ZCC7C42xLe+s
	kismLZoJwLkIn3/MRoHHw6XuOxA6HAJbRFnx8O5u67MVDJWao0gupntXXnrHNmM4/bWA
	Nhdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6G1IKX1ynVtwNx1gDBefCue8bT28YVqX4mKGV++z+BQ=;
	b=GqyjXY1ONMzd66hLUQmOVOi8Jqf1flgUH3IzPqFaDdmt8pCqcUtVZmJm+Db9TTF73y
	mWz/yqqlZ/QWLnV8cYpzSY3O9yYZKTZ8h+dnm3MNUEnXfgAi4LgrglOXnaBMWEyysjwj
	Hafzp9/T03XqD/QPzlN3zkIOeHPNdrn24PSmsrUOdSpCvAjOOB5B9ylxM8ebkSX9kvEh
	5PeetPmOBv7DjnRu+DdxSyKsr5DADhUGqGP6XMgsuM35hW7OcSHgV6PfRZ0Y8q6WlN35
	zuHjMdxnkfFn/GI8TMK7bjEwdJnnQULsAYpKSRTJeHu8rD0ddP1hxZ3zFhvlCnhW4abJ
	iFEA==
X-Gm-Message-State: ABUngve6MW5OhqOAuAk66WbapH94KMOtko/FaGa/n+eXlWVsrPX44hueuPSBzIZjb5Mvgg==
X-Received: by 10.98.10.198 with SMTP id 67mr10620619pfk.157.1478127433127;
	Wed, 02 Nov 2016 15:57:13 -0700 (PDT)
Received: from e6520.adbgroup.pl
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id n7sm7170868pfn.62.2016.11.02.15.57.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Nov 2016 15:57:12 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Nov 2016 15:57:03 -0700
Message-Id: <1478127423-4954-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] gdb: update 7.11+git1a982b689c -> 7.11.1
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
X-List-Received-Date: Wed, 02 Nov 2016 22:57:12 -0000

  41d8236 Set GDB version number to 7.11.1.
  136613e Fix PR gdb/19828: gdb -p <process from a container>: internal error
  a0de87e Make gdb/linux-nat.c consider a waitstatus pending on the infrun side
  cf2cd51 Add mi-threads-interrupt.exp test (PR 20039)
  f0a8d0d Fix double prompt output after run control MI commands with mi-async on (PR 20045)
  b5f0db4 Fix -exec-run not running asynchronously with mi-async on (PR gdb/18077)
  7f8e34d Use target_terminal_ours_for_output in MI

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-7.11.1.inc           | 22 ++++++++++++++++++++
 meta/recipes-devtools/gdb/gdb-7.11.inc             |  9 --------
 meta/recipes-devtools/gdb/gdb-common.inc           | 24 ----------------------
 ...nadian_7.11.bb => gdb-cross-canadian_7.11.1.bb} |  0
 .../gdb/{gdb-cross_7.11.bb => gdb-cross_7.11.1.bb} |  0
 .../gdb/{gdb_7.11.bb => gdb_7.11.1.bb}             |  0
 6 files changed, 22 insertions(+), 33 deletions(-)
 create mode 100644 meta/recipes-devtools/gdb/gdb-7.11.1.inc
 delete mode 100644 meta/recipes-devtools/gdb/gdb-7.11.inc
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.11.bb => gdb-cross-canadian_7.11.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_7.11.bb => gdb-cross_7.11.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb_7.11.bb => gdb_7.11.1.bb} (100%)

diff --git a/meta/recipes-devtools/gdb/gdb-7.11.1.inc b/meta/recipes-devtools/gdb/gdb-7.11.1.inc
new file mode 100644
index 0000000..d9dfe6f
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb-7.11.1.inc
@@ -0,0 +1,22 @@
+LICENSE = "GPLv2 & GPLv3 & LGPLv2 & LGPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
+		    file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
+		    file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
+		    file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674"
+
+SRC_URI = "http://ftp.gnu.org/gnu/gdb/gdb-${PV}.tar.xz \
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
+           file://0011-avx_mpx.patch \
+"
+
+SRC_URI[md5sum] = "5aa71522e488e358243917967db87476"
+SRC_URI[sha256sum] = "e9216da4e3755e9f414c1aa0026b626251dfc57ffe572a266e98da4f6988fc70"
diff --git a/meta/recipes-devtools/gdb/gdb-7.11.inc b/meta/recipes-devtools/gdb/gdb-7.11.inc
deleted file mode 100644
index a9267d5..0000000
--- a/meta/recipes-devtools/gdb/gdb-7.11.inc
+++ /dev/null
@@ -1,9 +0,0 @@
-LICENSE = "GPLv2 & GPLv3 & LGPLv2 & LGPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
-		    file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
-		    file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
-		    file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674"
-
-SRC_URI[md5sum] = "b93a2721393e5fa226375b42d567d90b"
-SRC_URI[sha256sum] = "ff14f8050e6484508c73cbfa63731e57901478490ca1672dc0b5e2b03f6af622"
-
diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 0923143..33a5ce9 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -1,6 +1,5 @@
 SUMMARY = "GNU debugger"
 HOMEPAGE = "http://www.gnu.org/software/gdb/"
-LICENSE = "GPLv3+"
 SECTION = "devel"
 DEPENDS = "expat zlib ncurses virtual/libiconv ${LTTNGUST}"
 
@@ -16,33 +15,10 @@ LTTNGUST_mips64eln32 = ""
 LTTNGUST_sh4 = ""
 LTTNGUST_libc-musl = ""
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
-		file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674 \
-		file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
-		file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6"
-
 inherit autotools texinfo
 
-SRCREV = "1a982b689ce4e20523bdf69e47fdd574c4f63934"
-
-SRC_URI = "git://sourceware.org/git/binutils-gdb.git;branch=gdb-7.11-branch \
-           file://0001-include-sys-types.h-for-mode_t.patch \
-           file://0002-make-man-install-relative-to-DESTDIR.patch \
-           file://0003-mips-linux-nat-Define-_ABIO32-if-not-defined.patch \
-           file://0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch \
-           file://0005-Add-support-for-Renesas-SH-sh4-architecture.patch \
-           file://0006-Dont-disable-libreadline.a-when-using-disable-static.patch \
-           file://0007-use-asm-sgidefs.h.patch \
-           file://0008-Use-exorted-definitions-of-SIGRTMIN.patch \
-           file://0009-Change-order-of-CFLAGS.patch \
-           file://0010-resolve-restrict-keyword-conflict.patch \
-           file://0011-avx_mpx.patch \
-"
-
 UPSTREAM_CHECK_GITTAGREGEX = "gdb\-(?P<pver>.+)\-release"
 
-S = "${WORKDIR}/git"
-
 B = "${WORKDIR}/build-${TARGET_SYS}"
 
 EXTRA_OEMAKE = "'SUBDIRS=intl mmalloc libiberty opcodes bfd sim gdb etc utils'"
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.11.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.11.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_7.11.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_7.11.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross_7.11.bb b/meta/recipes-devtools/gdb/gdb-cross_7.11.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_7.11.bb
rename to meta/recipes-devtools/gdb/gdb-cross_7.11.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb_7.11.bb b/meta/recipes-devtools/gdb/gdb_7.11.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_7.11.bb
rename to meta/recipes-devtools/gdb/gdb_7.11.1.bb
-- 
1.9.1


