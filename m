Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f53.google.com (mail-pb0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id A5B886E7BE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 19:32:58 +0000 (UTC)
Received: by mail-pb0-f53.google.com with SMTP id md12so15591327pbc.26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 11:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4yQ4I3YnWCuYZZ6OaC27mqF2y3yrQIAVZfF+E9VsSQs=;
	b=Jw11rQkgMJhCvJIGMdxLLtxKld14fceA9/ZoSkzdf2UWa93eBu1ZTJU4P/HTFdtefr
	s/vlRnvAU95oXVbMR27IqezpdKyxXfnDJENa+HQ/ysw30t7tQPpp11Py7ADcdEwD77GL
	EsQ3BFolMDId4w1h6GPolRfm01dkfPHFf3cuFY4XKi/TPQpeXDh4uqgU50ssCxdsDq++
	ET0PHSqMilK4FDtKpFpzl33vpvO6hJSFPcEVM1LnLru8Nj+ZICM4m2Qx+4moSrJfkYob
	x+URm1Lj0OX5FKIEvkGglOdamE8+v+/FPOpLeK5hXN+dHFoq6CPl2LiN2z/adB4naHP+
	PLvA==
X-Received: by 10.66.246.229 with SMTP id xz5mr28445976pac.119.1392665579563; 
	Mon, 17 Feb 2014 11:32:59 -0800 (PST)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	nm5sm48339985pbc.29.2014.02.17.11.32.57 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Feb 2014 11:32:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Feb 2014 11:34:13 -0800
Message-Id: <74162f3b1e7a4f7da6939103dfee9bb3f16c2c39.1392665521.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1392665521.git.raj.khem@gmail.com>
References: <cover.1392665521.git.raj.khem@gmail.com>
Subject: [PATCH 1/6] eglibc: Upgrade from 2.18 -> 2.19
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
X-List-Received-Date: Mon, 17 Feb 2014 19:32:58 -0000

License formatting and address for FSF in the COPYING and COPYING.LIB
has changed.

Dropped patched already upstream and patches that were workarounds for
older glibc and busybox

for e500 we have should pass --without-fp to eglibc/glibc 2.19 onwards
the code is merged from eglibc into glibc upstream under nofpu/ pretext

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/libc-common.bbclass                   |    2 +-
 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 ...tive_2.18.bb => cross-localedef-native_2.19.bb} |   10 +-
 .../0001-ARM-Pass-dl_hwcap-to-IFUNC-resolver.patch |   43 ------
 meta/recipes-core/eglibc/eglibc-2.18/make-4.patch  |   31 ----
 .../eglibc/eglibc-2.18/tzselect-awk.patch          |   42 ------
 .../eglibc/eglibc-2.18/tzselect-sh.patch           |  156 --------------------
 .../0001-R_ARM_TLS_DTPOFF32.patch                  |    0
 .../0001-eglibc-menuconfig-support.patch           |  122 +++++++--------
 ...n-libm-err-tab.pl-with-specific-dirs-in-S.patch |    0
 ...0002-eglibc-menuconfig-hex-string-options.patch |    0
 ...0003-eglibc-menuconfig-build-instructions.patch |    0
 .../GLRO_dl_debug_mask.patch                       |    0
 .../IO-acquire-lock-fix.patch                      |    0
 .../add_resource_h_to_wait_h.patch                 |    0
 .../eglibc-svn-arm-lowlevellock-include-tls.patch  |    0
 .../eglibc_fix_findidx_parameters.patch            |    0
 .../{eglibc-2.18 => eglibc-2.19}/etc/ld.so.conf    |    0
 .../fileops-without-wchar-io.patch                 |    0
 .../fix-tibetian-locales.patch                     |    0
 .../fix_for_centos_5.8.patch                       |    0
 .../fsl-ppc-no-fsqrt.patch                         |    0
 .../generate-supported.mk                          |    0
 .../glibc.fix_sqrt2.patch                          |    0
 .../initgroups_keys.patch                          |    0
 .../ld-search-order.patch                          |    0
 .../mips-rld-map-check.patch                       |    0
 .../multilib_readlib.patch                         |    0
 .../ppc-sqrt_finite.patch                          |    0
 .../ppc_slow_ieee754_sqrt.patch                    |    0
 .../relocatable_sdk.patch                          |    0
 .../relocatable_sdk_fix_openpath.patch             |    0
 ...libc-initial_2.18.bb => eglibc-initial_2.19.bb} |    0
 ...eglibc-locale_2.18.bb => eglibc-locale_2.19.bb} |    0
 ...eglibc-mtrace_2.18.bb => eglibc-mtrace_2.19.bb} |    0
 ...libc-scripts_2.18.bb => eglibc-scripts_2.19.bb} |    0
 .../eglibc/{eglibc_2.18.bb => eglibc_2.19.bb}      |   14 +-
 37 files changed, 73 insertions(+), 349 deletions(-)
 rename meta/recipes-core/eglibc/{cross-localedef-native_2.18.bb => cross-localedef-native_2.19.bb} (73%)
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.18/0001-ARM-Pass-dl_hwcap-to-IFUNC-resolver.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.18/make-4.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.18/tzselect-awk.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.18/tzselect-sh.patch
 rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/0001-R_ARM_TLS_DTPOFF32.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/0001-eglibc-menuconfig-support.patch (93%)
 rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/0002-eglibc-menuconfig-hex-string-options.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/0003-eglibc-menuconfig-build-instructions.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/GLRO_dl_debug_mask.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/IO-acquire-lock-fix.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/add_resource_h_to_wait_h.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/eglibc-svn-arm-lowlevellock-include-tls.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/eglibc_fix_findidx_parameters.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/etc/ld.so.conf (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/fileops-without-wchar-io.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/fix-tibetian-locales.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/fix_for_centos_5.8.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/fsl-ppc-no-fsqrt.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/generate-supported.mk (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/glibc.fix_sqrt2.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/initgroups_keys.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/ld-search-order.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/mips-rld-map-check.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/multilib_readlib.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/ppc-sqrt_finite.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/ppc_slow_ieee754_sqrt.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/relocatable_sdk.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/relocatable_sdk_fix_openpath.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-initial_2.18.bb => eglibc-initial_2.19.bb} (100%)
 rename meta/recipes-core/eglibc/{eglibc-locale_2.18.bb => eglibc-locale_2.19.bb} (100%)
 rename meta/recipes-core/eglibc/{eglibc-mtrace_2.18.bb => eglibc-mtrace_2.19.bb} (100%)
 rename meta/recipes-core/eglibc/{eglibc-scripts_2.18.bb => eglibc-scripts_2.19.bb} (100%)
 rename meta/recipes-core/eglibc/{eglibc_2.18.bb => eglibc_2.19.bb} (90%)

diff --git a/meta/classes/libc-common.bbclass b/meta/classes/libc-common.bbclass
index 67b018b..daf499d 100644
--- a/meta/classes/libc-common.bbclass
+++ b/meta/classes/libc-common.bbclass
@@ -19,7 +19,7 @@ do_install() {
 }
 
 def get_libc_fpu_setting(bb, d):
-    if d.getVar('TARGET_FPU', True) in [ 'soft' ]:
+    if d.getVar('TARGET_FPU', True) in [ 'soft', 'ppc-efd' ]:
         return "--without-fp"
     return ""
 
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 1805da7..d6a626c 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -20,7 +20,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 GCCVERSION ?= "4.8%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.24"
-EGLIBCVERSION ?= "2.18"
+EGLIBCVERSION ?= "2.19"
 UCLIBCVERSION ?= "0.9.33+git%"
 LINUXLIBCVERSION ?= "3.10"
 
diff --git a/meta/recipes-core/eglibc/cross-localedef-native_2.18.bb b/meta/recipes-core/eglibc/cross-localedef-native_2.19.bb
similarity index 73%
rename from meta/recipes-core/eglibc/cross-localedef-native_2.18.bb
rename to meta/recipes-core/eglibc/cross-localedef-native_2.19.bb
index 4e7e947..d3f43bd 100644
--- a/meta/recipes-core/eglibc/cross-localedef-native_2.18.bb
+++ b/meta/recipes-core/eglibc/cross-localedef-native_2.19.bb
@@ -5,9 +5,9 @@ LICENSE = "LGPL-2.1"
 
 LIC_DIR = "${WORKDIR}/eglibc-${PV}/libc"
 LIC_FILES_CHKSUM = "file://${LIC_DIR}/LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
-      file://${LIC_DIR}/COPYING;md5=393a5ca445f6965873eca0259a17f833 \
+      file://${LIC_DIR}/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
       file://${LIC_DIR}/posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
-      file://${LIC_DIR}/COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff "
+      file://${LIC_DIR}/COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 
 inherit native
@@ -16,11 +16,11 @@ inherit autotools
 # pick up an eglibc patch
 FILESPATH = "${FILE_DIRNAME}/eglibc-${PV}"
 
-SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr23787.tar.bz2 \
+SRC_URI = "http://sakrah.homelinux.org/files/eglibc-${PV}-svnr25243.tar.bz2 \
 	   file://fix_for_centos_5.8.patch;patchdir=.. \
 	  "
-SRC_URI[md5sum] = "b395b021422a027d89884992e91734fc"
-SRC_URI[sha256sum] = "15f564b45dc5dd65faf0875579e3447961ae61e876933384ae05d19328539ad4"
+SRC_URI[md5sum] = "197836c2ba42fb146e971222647198dd"
+SRC_URI[sha256sum] = "baaa030531fc308f7820c46acdf8e1b2f8e3c1f40bcd28b6e440d1c95d170d4c"
 
 S = "${WORKDIR}/eglibc-${PV}/localedef"
 
diff --git a/meta/recipes-core/eglibc/eglibc-2.18/0001-ARM-Pass-dl_hwcap-to-IFUNC-resolver.patch b/meta/recipes-core/eglibc/eglibc-2.18/0001-ARM-Pass-dl_hwcap-to-IFUNC-resolver.patch
deleted file mode 100644
index 24d4772..0000000
--- a/meta/recipes-core/eglibc/eglibc-2.18/0001-ARM-Pass-dl_hwcap-to-IFUNC-resolver.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-Upstream-Status: Backport
-
-From d0721e703d222c01a9e8c329311c4fb01dac6972 Mon Sep 17 00:00:00 2001
-From: Carlos O'Donell <carlos@redhat.com>
-Date: Thu, 29 Aug 2013 00:17:33 -0400
-Subject: [PATCH] ARM: Pass dl_hwcap to IFUNC resolver.
-
-For REL relocs pass dl_hwcap to the IFUNC resolver
-as is required by the IFUNC API (bug 15905).
----
- NEWS                           | 2 +-
- ports/ChangeLog.arm            | 7 +++++++
- ports/sysdeps/arm/dl-machine.h | 2 +-
- 3 files changed, 9 insertions(+), 2 deletions(-)
-
-Index: libc/ports/ChangeLog.arm
-===================================================================
---- libc.orig/ports/ChangeLog.arm	2013-07-14 16:08:52.000000000 -0700
-+++ libc/ports/ChangeLog.arm	2013-09-12 17:17:24.174387150 -0700
-@@ -1,3 +1,10 @@
-+2013-08-28  Kyle McMartin  <kyle@redhat.com>
-+	    Carlos O'Donell  <carlos@redhat.com>
-+
-+	[BZ #15905]
-+	* sysdeps/arm/dl-machine [!RTLD_BOOTSTRAP] (elf_machine_rel):
-+	Pass GLRO(dl_hwcap) to the IFUNC resolver.
-+
- 2013-07-03  Joseph Myers  <joseph@codesourcery.com>
- 
- 	* sysdeps/arm/include/bits/setjmp.h [_ISOMAC] (JMP_BUF_REGLIST):
-Index: libc/ports/sysdeps/arm/dl-machine.h
-===================================================================
---- libc.orig/ports/sysdeps/arm/dl-machine.h	2013-09-12 08:56:03.641743520 -0700
-+++ libc/ports/sysdeps/arm/dl-machine.h	2013-09-12 17:17:24.174387150 -0700
-@@ -503,7 +503,7 @@
- 	  break;
- 	case R_ARM_IRELATIVE:
- 	  value = map->l_addr + *reloc_addr;
--	  value = ((Elf32_Addr (*) (void)) value) ();
-+	  value = ((Elf32_Addr (*) (int)) value) (GLRO(dl_hwcap));
- 	  *reloc_addr = value;
- 	  break;
- #endif
diff --git a/meta/recipes-core/eglibc/eglibc-2.18/make-4.patch b/meta/recipes-core/eglibc/eglibc-2.18/make-4.patch
deleted file mode 100644
index ec105b4..0000000
--- a/meta/recipes-core/eglibc/eglibc-2.18/make-4.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Accept make versions 4.0 and greater
-
-Backport of glibc 28d708c44bc47b56f6551ff285f78edcf61c208a.
-
-Upstream-Status: Backport
-Signed-off-by: Jonathan Liu <net147@gmail.com>
-
-diff -Nur libc.orig/configure libc/configure
---- libc.orig/configure     2013-08-21 02:23:48.000000000 +1000
-+++ libc/configure  2013-11-04 17:04:17.778333748 +1100
-@@ -4772,7 +4772,7 @@
-   ac_prog_version=`$MAKE --version 2>&1 | sed -n 's/^.*GNU Make[^0-9]*\([0-9][0-9.]*\).*$/\1/p'`
-   case $ac_prog_version in
-     '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
--    3.79* | 3.[89]*)
-+    3.79* | 3.[89]* | [4-9].* | [1-9][0-9]*)
-        ac_prog_version="$ac_prog_version, ok"; ac_verc_fail=no;;
-     *) ac_prog_version="$ac_prog_version, bad"; ac_verc_fail=yes;;
- 
-diff -Nur libc.orig/configure.in libc/configure.in
---- libc.orig/configure.in	2013-08-21 02:23:48.000000000 +1000
-+++ libc/configure.in	2013-11-04 16:54:17.955014870 +1100
-@@ -989,7 +989,7 @@
-   critic_missing="$critic_missing gcc")
- AC_CHECK_PROG_VER(MAKE, gnumake gmake make, --version,
-   [GNU Make[^0-9]*\([0-9][0-9.]*\)],
--  [3.79* | 3.[89]*], critic_missing="$critic_missing make")
-+  [3.79* | 3.[89]* | [4-9].* | [1-9][0-9]*], critic_missing="$critic_missing make")
- 
- AC_CHECK_PROG_VER(MSGFMT, gnumsgfmt gmsgfmt msgfmt, --version,
-   [GNU gettext.* \([0-9]*\.[0-9.]*\)],
diff --git a/meta/recipes-core/eglibc/eglibc-2.18/tzselect-awk.patch b/meta/recipes-core/eglibc/eglibc-2.18/tzselect-awk.patch
deleted file mode 100644
index dc9949b..0000000
--- a/meta/recipes-core/eglibc/eglibc-2.18/tzselect-awk.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-tzselect: workaround bug in busybox awk
-
-busybox's version of awk in version 1.20.2 and lower doesn't support
-escape sequences in conjunction with the -F option. Use -v FS= instead
-as a workaround until the bug is fixed.
-
-Reference:
-https://bugs.busybox.net/show_bug.cgi?id=5126
-
-Upstream-Status: Inappropriate [other]
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-
---- libc/timezone/tzselect.ksh
-+++ libc/timezone/tzselect.ksh
-@@ -208,7 +208,7 @@ while
- 		TZ_for_date=$TZ;;
- 	*)
- 		# Get list of names of countries in the continent or ocean.
--		countries=$($AWK -F'\t' \
-+		countries=$($AWK -v FS="\t" \
- 			-v continent="$continent" \
- 			-v TZ_COUNTRY_TABLE="$TZ_COUNTRY_TABLE" \
- 		'
-@@ -252,7 +252,7 @@ while
- 
- 
- 		# Get list of names of time zone rule regions in the country.
--		regions=$($AWK -F'\t' \
-+		regions=$($AWK -v FS="\t" \
- 			-v country="$country" \
- 			-v TZ_COUNTRY_TABLE="$TZ_COUNTRY_TABLE" \
- 		'
-@@ -289,7 +289,7 @@ while
- 		esac
- 
- 		# Determine TZ from country and region.
--		TZ=$($AWK -F'\t' \
-+		TZ=$($AWK -v FS="\t" \
- 			-v country="$country" \
- 			-v region="$region" \
- 			-v TZ_COUNTRY_TABLE="$TZ_COUNTRY_TABLE" \
diff --git a/meta/recipes-core/eglibc/eglibc-2.18/tzselect-sh.patch b/meta/recipes-core/eglibc/eglibc-2.18/tzselect-sh.patch
deleted file mode 100644
index e9a3691..0000000
--- a/meta/recipes-core/eglibc/eglibc-2.18/tzselect-sh.patch
+++ /dev/null
@@ -1,156 +0,0 @@
-tzselect: eliminate ksh-dependency
-
-This is an adapted version of a patch originally
-by Peter Seebach <peter.seebach@windriver.com> found here:
-http://www.eglibc.org/archives/patches/msg00671.html
-
-Upstream-Status: Pending
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-
-Index: libc/timezone/tzselect.ksh
-===================================================================
---- libc.orig/timezone/tzselect.ksh	2012-11-17 09:50:14.000000000 -0800
-+++ libc/timezone/tzselect.ksh	2013-01-03 22:46:26.423844259 -0800
-@@ -1,4 +1,4 @@
--#!/bin/bash
-+#!/bin/sh
- 
- PKGVERSION='(tzcode) '
- TZVERSION=see_Makefile
-@@ -11,23 +11,80 @@
- 
- # Porting notes:
- #
--# This script requires a Posix-like shell with the extension of a
--# 'select' statement.  The 'select' statement was introduced in the
--# Korn shell and is available in Bash and other shell implementations.
--# If your host lacks both Bash and the Korn shell, you can get their
--# source from one of these locations:
-+# func_select allows this script to run on shells (such as busybox ash)
-+# which lack the ksh "select" builtin.
- #
--#	Bash <http://www.gnu.org/software/bash/bash.html>
--#	Korn Shell <http://www.kornshell.com/>
--#	Public Domain Korn Shell <http://www.cs.mun.ca/~michael/pdksh/>
--#
--# This script also uses several features of modern awk programs.
-+# This script uses several features of modern awk programs.
- # If your host lacks awk, or has an old awk that does not conform to Posix,
- # you can use either of the following free programs instead:
- #
- #	Gawk (GNU awk) <http://www.gnu.org/software/gawk/>
- #	mawk <http://invisible-island.net/mawk/>
- 
-+# Implement ksh-style select in POSIX shell
-+
-+# We need a mostly-portable echo-n.
-+case `echo -n "foo\c"` in
-+*n*c*)  func_echo_n() { echo "$*"; } ;;
-+*n*)    func_echo_n() { echo "$*\c"; } ;;
-+*)      func_echo_n() { echo -n "$*"; } ;;
-+esac
-+
-+# Synopsis: Replace "select foo in list" with "while func_select foo in list"
-+# and this works just like ksh, so far as I know.
-+func_select () {
-+	func_select_args=0
-+	if expr "$1" : "[_a-zA-Z][_a-zA-Z0-9]*$" > /dev/null; then
-+		func_select_var=$1
-+	else
-+		echo >&2 "func_select: '$1' is not a valid variable name."
-+		return 1
-+	fi
-+	shift 1
-+	case $1 in
-+		in) shift 1;;
-+ *) echo >&2 "func_select: usage: func_select var in ... (you must provide
-+arguments)"; return 1;;
-+	esac
-+	case $# in
-+		0) echo >&2 "func_select: usage: func_select var in ..."; return 1;;
-+	esac
-+	for func_select_arg
-+	do
-+		func_select_args=`expr $func_select_args + 1`
-+		eval func_select_a_$func_select_args=\$func_select_arg
-+	done
-+	REPLY=""
-+	while :
-+	do
-+		if test -z "$REPLY"; then
-+			func_select_i=1
-+			while test $func_select_i -le $func_select_args
-+			do
-+				eval echo "\"\$func_select_i) \$func_select_a_$func_select_i\""
-+				func_select_i=`expr $func_select_i + 1`
-+			done
-+		fi
-+		func_echo_n "${PS3-#? }" >&2
-+		if read REPLY; then
-+			if test -n "${REPLY}"; then
-+				if expr "$REPLY" : '[1-9][0-9]*$' > /dev/null; then
-+					if test "$REPLY" -ge 1 && test "$REPLY" -le $func_select_args; then
-+						eval $func_select_var=\$func_select_a_$REPLY
-+					else
-+						eval $func_select_var=
-+					fi
-+				else
-+					eval $func_select_var=
-+				fi
-+				return 0
-+			fi
-+		else
-+			eval $func_select_var=
-+			return 1
-+		fi
-+	done
-+}
- 
- # Specify default values for environment variables if they are unset.
- : ${AWK=awk}
-@@ -72,7 +129,7 @@
- 
- 
- # Work around a bug in bash 1.14.7 and earlier, where $PS3 is sent to stdout.
--case $(echo 1 | (select x in x; do break; done) 2>/dev/null) in
-+case $(echo 1 | (while func_select x in x; do break; done) 2>/dev/null) in
- ?*) PS3=
- esac
- 
-@@ -92,7 +149,7 @@
- 
- 	echo >&2 'Please select a continent or ocean.'
- 
--	select continent in \
-+	while func_select continent in \
- 	    Africa \
- 	    Americas \
- 	    Antarctica \
-@@ -172,7 +229,7 @@
- 		case $countries in
- 		*"$newline"*)
- 			echo >&2 'Please select a country.'
--			select country in $countries
-+			while func_select country in $countries
- 			do
- 			    case $country in
- 			    '') echo >&2 'Please enter a number in range.';;
-@@ -211,7 +268,7 @@
- 		*"$newline"*)
- 			echo >&2 'Please select one of the following' \
- 				'time zone regions.'
--			select region in $regions
-+			while func_select region in $regions
- 			do
- 				case $region in
- 				'') echo >&2 'Please enter a number in range.';;
-@@ -288,7 +345,7 @@
- 	echo >&2 "Is the above information OK?"
- 
- 	ok=
--	select ok in Yes No
-+	while func_select ok in Yes No
- 	do
- 	    case $ok in
- 	    '') echo >&2 'Please enter 1 for Yes, or 2 for No.';;
diff --git a/meta/recipes-core/eglibc/eglibc-2.18/0001-R_ARM_TLS_DTPOFF32.patch b/meta/recipes-core/eglibc/eglibc-2.19/0001-R_ARM_TLS_DTPOFF32.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.18/0001-R_ARM_TLS_DTPOFF32.patch
rename to meta/recipes-core/eglibc/eglibc-2.19/0001-R_ARM_TLS_DTPOFF32.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.18/0001-eglibc-menuconfig-support.patch b/meta/recipes-core/eglibc/eglibc-2.19/0001-eglibc-menuconfig-support.patch
similarity index 93%
rename from meta/recipes-core/eglibc/eglibc-2.18/0001-eglibc-menuconfig-support.patch
rename to meta/recipes-core/eglibc/eglibc-2.19/0001-eglibc-menuconfig-support.patch
index 9e23e7c..4559a11 100644
--- a/meta/recipes-core/eglibc/eglibc-2.18/0001-eglibc-menuconfig-support.patch
+++ b/meta/recipes-core/eglibc/eglibc-2.19/0001-eglibc-menuconfig-support.patch
@@ -57,9 +57,9 @@ Nucleus(r) | Linux(r) | Android(tm) | Services | UI | Multi-OS
 
 Index: libc/EGLIBC.cross-building
 ===================================================================
---- libc.orig/EGLIBC.cross-building	2007-04-20 16:15:03.000000000 -0700
-+++ libc/EGLIBC.cross-building	2013-06-26 00:45:15.788885570 -0700
-@@ -243,9 +243,29 @@
+--- libc.orig/EGLIBC.cross-building
++++ libc/EGLIBC.cross-building
+@@ -243,9 +243,29 @@ full EGLIBC build:
      > $src/libc/configure \
      >     --prefix=/usr \
      >     --with-headers=$sysroot/usr/include \
@@ -89,11 +89,11 @@ Index: libc/EGLIBC.cross-building
      $ PATH=$tools/bin:$PATH make
      $ PATH=$tools/bin:$PATH make install install_root=$sysroot
  
-Index: libc/configure.in
+Index: libc/configure.ac
 ===================================================================
---- libc.orig/configure.in	2013-06-24 15:42:26.000000000 -0700
-+++ libc/configure.in	2013-06-26 00:45:15.792885570 -0700
-@@ -127,6 +127,16 @@
+--- libc.orig/configure.ac
++++ libc/configure.ac
+@@ -127,6 +127,16 @@ AC_ARG_WITH([headers],
  	    [sysheaders=''])
  AC_SUBST(sysheaders)
  
@@ -112,9 +112,9 @@ Index: libc/configure.in
  	    AC_HELP_STRING([--with-default-link],
 Index: libc/config.make.in
 ===================================================================
---- libc.orig/config.make.in	2013-04-28 08:21:50.000000000 -0700
-+++ libc/config.make.in	2013-06-26 00:45:15.792885570 -0700
-@@ -45,6 +45,8 @@
+--- libc.orig/config.make.in
++++ libc/config.make.in
+@@ -45,6 +45,8 @@ sysincludes = @SYSINCLUDES@
  c++-sysincludes = @CXX_SYSINCLUDES@
  all-warnings = @all_warnings@
  
@@ -125,8 +125,8 @@ Index: libc/config.make.in
  have-Bgroup = @libc_cv_Bgroup@
 Index: libc/options-config/config-postproc.pl
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ libc/options-config/config-postproc.pl	2013-06-26 00:45:15.792885570 -0700
+--- /dev/null
++++ libc/options-config/config-postproc.pl
 @@ -0,0 +1,54 @@
 +#!/usr/bin/perl
 +
@@ -184,8 +184,8 @@ Index: libc/options-config/config-postproc.pl
 +}
 Index: libc/options-config/config-preproc.pl
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ libc/options-config/config-preproc.pl	2013-06-26 00:45:15.792885570 -0700
+--- /dev/null
++++ libc/options-config/config-preproc.pl
 @@ -0,0 +1,8 @@
 +#!/usr/bin/perl
 +
@@ -197,8 +197,8 @@ Index: libc/options-config/config-preproc.pl
 +}
 Index: libc/options-config/Makefile
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ libc/options-config/Makefile	2013-06-26 00:45:15.792885570 -0700
+--- /dev/null
++++ libc/options-config/Makefile
 @@ -0,0 +1,55 @@
 +# ===========================================================================
 +# EGLIBC option-groups configuration targets
@@ -257,8 +257,8 @@ Index: libc/options-config/Makefile
 +endif
 Index: libc/option-groups.def
 ===================================================================
---- libc.orig/option-groups.def	2013-05-17 17:12:09.000000000 -0700
-+++ libc/option-groups.def	2013-06-26 00:45:15.796885570 -0700
+--- libc.orig/option-groups.def
++++ libc/option-groups.def
 @@ -4,19 +4,19 @@
  #
  # An entry of the form:
@@ -294,7 +294,7 @@ Index: libc/option-groups.def
     help
         This option group includes the functions specified by RFC 3542,
         "Advanced Sockets Application Program Interface (API) for
-@@ -71,7 +71,7 @@
+@@ -71,7 +71,7 @@ config OPTION_EGLIBC_ADVANCED_INET6
           inet6_rth_segments
           inet6_rth_space
  
@@ -303,7 +303,7 @@ Index: libc/option-groups.def
     bool "Functions for producing backtraces"
     help
         This option group includes functions for producing a list of
-@@ -85,7 +85,7 @@
+@@ -85,7 +85,7 @@ config OPTION_EGLIBC_BACKTRACE
           backtrace_symbols
           backtrace_symbols_fd
  
@@ -312,7 +312,7 @@ Index: libc/option-groups.def
     bool "Use extensive inline code"
     help
         This option group specifies whether certain pieces of code
-@@ -93,7 +93,7 @@
+@@ -93,7 +93,7 @@ config OPTION_EGLIBC_BIG_MACROS
         group is not selected, function calls will be used instead,
         hence reducing the library footprint.
  
@@ -321,7 +321,7 @@ Index: libc/option-groups.def
     bool "BSD-specific functions, and their compatibility stubs"
     help
         This option group includes functions specific to BSD kernels.
-@@ -109,10 +109,9 @@
+@@ -109,10 +109,9 @@ config OPTION_EGLIBC_BSD
           revoke
           setlogin
  
@@ -334,7 +334,7 @@ Index: libc/option-groups.def
     help
         This option group does not include any C library functions;
         instead, it controls which EGLIBC tests an ordinary 'make
-@@ -121,23 +120,22 @@
+@@ -121,23 +120,22 @@ config OPTION_EGLIBC_CXX_TESTS
         run.
  
         The standard C++ library depends on the math library 'libm' and
@@ -365,7 +365,7 @@ Index: libc/option-groups.def
         This option group includes support for character sets other
         than ASCII (ANSI_X3.4-1968) and Unicode and ISO-10646 in their
         various encodings.  This affects both the character sets
-@@ -198,16 +196,16 @@
+@@ -198,16 +196,16 @@ config OPTION_EGLIBC_CHARSETS
            WCHAR_T           - EGLIBC's internal form (target-endian,
                                32-bit ISO 10646)
  
@@ -385,7 +385,7 @@ Index: libc/option-groups.def
     help
         This option group provides ultra fast DES-based implementation of
         the `crypt' function.  When this option group is disabled,
-@@ -216,7 +214,7 @@
+@@ -216,7 +214,7 @@ config OPTION_EGLIBC_CRYPT_UFC
         errno to ENOSYS if /salt/ passed does not correspond to either MD5,
         SHA-256 or SHA-512 algorithm.
  
@@ -394,7 +394,7 @@ Index: libc/option-groups.def
     bool "Functions for accessing the mail aliases database"
     help
         This option group includues functions for looking up mail
-@@ -233,7 +231,7 @@
+@@ -233,7 +231,7 @@ config OPTION_EGLIBC_DB_ALIASES
         When this option group is disabled, the NSS service libraries
         also lack support for querying their mail alias tables.
  
@@ -403,7 +403,7 @@ Index: libc/option-groups.def
     bool "Functions for handling envz-style environment vectors."
     help
         This option group contains functions for creating and operating
-@@ -248,7 +246,7 @@
+@@ -248,7 +246,7 @@ config OPTION_EGLIBC_ENVZ
          envz_entry      envz_remove
          envz_get        envz_strip 
  
@@ -412,7 +412,7 @@ Index: libc/option-groups.def
     bool "Functions for converting floating-point numbers to strings"
     help
         This option group includes functions for converting
-@@ -262,14 +260,14 @@
+@@ -262,14 +260,14 @@ config OPTION_EGLIBC_FCVT
  	 fcvt_r		qfcvt_r
           gcvt		qgcvt
  
@@ -429,7 +429,7 @@ Index: libc/option-groups.def
     bool "Access functions for 'fstab'"
     help
         This option group includes functions for reading the mount
-@@ -283,7 +281,7 @@
+@@ -283,7 +281,7 @@ config OPTION_EGLIBC_FSTAB
           getfsent       setfsent
           getfsfile
  
@@ -438,7 +438,7 @@ Index: libc/option-groups.def
     bool "Functions for traversing file hierarchies"
     help
         This option group includes functions for traversing file
-@@ -297,9 +295,9 @@
+@@ -297,9 +295,9 @@ config OPTION_EGLIBC_FTRAVERSE
  	 fts_set	nftw64
           fts_close
  
@@ -450,7 +450,7 @@ Index: libc/option-groups.def
     help
         This function group includes the 'getlogin' and 'getlogin_r'
         functions, which return the user name associated by the login
-@@ -309,17 +307,17 @@
+@@ -309,17 +307,17 @@ config OPTION_EGLIBC_GETLOGIN
         fall back on 'getlogin' to find the user's login name for tilde
         expansion when the 'HOME' environment variable is not set.
  
@@ -471,7 +471,7 @@ Index: libc/option-groups.def
         installation and API changes as follows:
  
         - The following libraries are not installed:
-@@ -439,14 +437,14 @@
+@@ -439,14 +437,14 @@ config OPTION_EGLIBC_INET
         use Unix-domain sockets to communicate with the syslog daemon;
         syslog is valuable in non-networked contexts.
  
@@ -489,7 +489,7 @@ Index: libc/option-groups.def
     bool "libm (math library)"
     help
         This option group includes the 'libm' library, containing
-@@ -464,7 +462,7 @@
+@@ -464,7 +462,7 @@ config OPTION_EGLIBC_LIBM
         group, you will not be able to build 'libstdc++' against the
         resulting EGLIBC installation.
  
@@ -498,7 +498,7 @@ Index: libc/option-groups.def
     bool "Locale definitions"
     help
         This option group includes all locale definitions other than
-@@ -472,17 +470,17 @@
+@@ -472,17 +470,17 @@ config OPTION_EGLIBC_LOCALES
         only the "C" locale is supported.
  
  
@@ -520,7 +520,7 @@ Index: libc/option-groups.def
         functions are omitted from libc:
  
           duplocale   localeconv  nl_langinfo    rpmatch  strfmon_l
-@@ -491,46 +489,43 @@
+@@ -491,46 +489,43 @@ config OPTION_EGLIBC_LOCALE_CODE
         Furthermore, only the LC_CTYPE and LC_TIME categories of the
         standard "C" locale are available.
  
@@ -576,7 +576,7 @@ Index: libc/option-groups.def
         This option group includes support for the 'nsswitch' facility.
         With this option group enabled, all EGLIBC functions for
         accessing various system databases (passwords and groups;
-@@ -544,12 +539,12 @@
+@@ -544,12 +539,12 @@ config OPTION_EGLIBC_NSSWITCH
         'option-groups.config' file must set the following two
         variables:
  
@@ -591,7 +591,7 @@ Index: libc/option-groups.def
            produces a C library that uses the nsswitch service
            libraries to search for database entries as this file
            specifies, instead of consulting '/etc/nsswitch.conf' at run
-@@ -567,7 +562,7 @@
+@@ -567,7 +562,7 @@ config OPTION_EGLIBC_NSSWITCH
            you will probably want to delete references to databases not
            needed on your system.
  
@@ -600,7 +600,7 @@ Index: libc/option-groups.def
  
            The EGLIBC build process uses this file to decide which
            functions to make available from which service libraries.
-@@ -585,28 +580,28 @@
+@@ -585,28 +580,28 @@ config OPTION_EGLIBC_NSSWITCH
            Be sure to mention each function in each service you wish to
            use.  If you do not mention a service's function here, the
            EGLIBC database access functions will not find it, even if
@@ -647,7 +647,7 @@ Index: libc/option-groups.def
     help
        This option group includes functions for running commands on
        remote machines via the 'rsh' protocol, and doing authentication
-@@ -622,7 +617,7 @@
+@@ -622,7 +617,7 @@ config OPTION_EGLIBC_RCMD
          rresvport       ruserpass
          rresvport_af
          
@@ -656,7 +656,7 @@ Index: libc/option-groups.def
     bool "Runtime linker debug print outs"
     help
        This option group enables debug output of the runtime linker
-@@ -633,7 +628,7 @@
+@@ -633,7 +628,7 @@ config OPTION_EGLIBC_RTLD_DEBUG
        the `ldd' utility which may also be used by the prelinker.
        In particular, the `--unused' ldd option will not work correctly.
  
@@ -665,7 +665,7 @@ Index: libc/option-groups.def
     bool "Support for POSIX posix_spawn functions"
     help
        This option group includes the POSIX functions for executing
-@@ -669,7 +664,7 @@
+@@ -669,7 +664,7 @@ config OPTION_EGLIBC_SPAWN
        disabled, those programs will only operate on uncompressed
        charmap files.
  
@@ -674,7 +674,7 @@ Index: libc/option-groups.def
     bool "Support for accessing STREAMS."
     help
        This option group includes functions for reading and writing
-@@ -685,14 +680,14 @@
+@@ -685,14 +680,14 @@ config OPTION_EGLIBC_STREAMS
          isastream       fdetach
          putmsg
  
@@ -692,7 +692,7 @@ Index: libc/option-groups.def
      bool "Older access functions for 'utmp' login records"
      help
         This option group includes the older 'utent' family of
-@@ -719,9 +714,9 @@
+@@ -719,9 +714,9 @@ config OPTION_EGLIBC_UTMP
  
           libutil.so (and libutil.a)
  
@@ -704,7 +704,7 @@ Index: libc/option-groups.def
      help
         This option group includes the POSIX functions for reading and
         writing user login records in the 'utmp' file (usually
-@@ -742,21 +737,21 @@
+@@ -742,21 +737,21 @@ config OPTION_EGLIBC_UTMPX
           updwtmpx
           utmpxname
  
@@ -729,7 +729,7 @@ Index: libc/option-groups.def
  
          This option group includes the following functions:
  
-@@ -778,14 +773,14 @@
+@@ -778,14 +773,14 @@ config OPTION_POSIX_C_LANG_WIDE_CHAR
            mbrlen        wcscoll       wcstol
            mbrtowc       wcscpy        wcstold
  
@@ -746,7 +746,7 @@ Index: libc/option-groups.def
          omitted from libc:
  
            re_comp                 re_max_failures         regcomp
-@@ -799,9 +794,9 @@
+@@ -799,9 +794,9 @@ config OPTION_POSIX_REGEXP
          <regexp.h> header file, 'compile', 'step', and 'advance', is
          omitted.
  
@@ -758,7 +758,7 @@ Index: libc/option-groups.def
      help
  	This option group specifies which regular expression
          library to use.  The choice is between regex
-@@ -810,9 +805,9 @@
+@@ -810,9 +805,9 @@ config OPTION_POSIX_REGEXP_GLIBC
          optimized for speed; regex from libiberty is more than twice
          as small while still is enough for most practical purposes.
  
@@ -772,9 +772,9 @@ Index: libc/option-groups.def
          wide characters to and from <stdio.h> streams.
 Index: libc/Makefile
 ===================================================================
---- libc.orig/Makefile	2013-06-04 08:48:26.000000000 -0700
-+++ libc/Makefile	2013-06-26 00:45:15.796885570 -0700
-@@ -24,6 +24,7 @@
+--- libc.orig/Makefile
++++ libc/Makefile
+@@ -24,6 +24,7 @@ endif
  
  include Makeconfig
  
@@ -784,9 +784,9 @@ Index: libc/Makefile
  .PHONY: all
 Index: libc/configure
 ===================================================================
---- libc.orig/configure	2013-06-24 15:42:26.000000000 -0700
-+++ libc/configure	2013-06-26 00:45:15.800885570 -0700
-@@ -622,6 +622,7 @@
+--- libc.orig/configure
++++ libc/configure
+@@ -621,6 +621,7 @@ KSH
  libc_cv_have_bash2
  BASH_SHELL
  libc_cv_gcc_static_libgcc
@@ -794,7 +794,7 @@ Index: libc/configure
  CXX_SYSINCLUDES
  SYSINCLUDES
  AUTOCONF
-@@ -734,6 +735,7 @@
+@@ -734,6 +735,7 @@ with_fp
  with_binutils
  with_selinux
  with_headers
@@ -802,7 +802,7 @@ Index: libc/configure
  with_default_link
  enable_sanity_checks
  enable_shared
-@@ -1432,6 +1434,9 @@
+@@ -1438,6 +1440,9 @@ Optional Packages:
    --with-selinux          if building with SELinux support
    --with-headers=PATH     location of system headers to use (for example
                            /usr/src/linux/include) [default=compiler default]
@@ -812,7 +812,7 @@ Index: libc/configure
    --with-default-link     do not use explicit linker scripts
    --with-cpu=CPU          select code for CPU variant
  
-@@ -3395,6 +3400,14 @@
+@@ -3401,6 +3406,14 @@ fi
  
  
  
@@ -829,9 +829,9 @@ Index: libc/configure
  if test "${with_default_link+set}" = set; then :
 Index: libc/EGLIBC.option-groups
 ===================================================================
---- libc.orig/EGLIBC.option-groups	2007-04-13 17:50:17.000000000 -0700
-+++ libc/EGLIBC.option-groups	2013-06-26 00:45:15.800885570 -0700
-@@ -56,33 +56,9 @@
+--- libc.orig/EGLIBC.option-groups
++++ libc/EGLIBC.option-groups
+@@ -56,33 +56,9 @@ disable option groups one by one, until
  
  The Option Groups
  
@@ -868,7 +868,7 @@ Index: libc/EGLIBC.option-groups
  
  The POSIX.1-2001 specification includes a suggested partition of all
  the functions in the POSIX C API into option groups: math functions
-@@ -110,6 +86,18 @@
+@@ -110,6 +86,18 @@ data, but include mathematical functions
     OPTION_EGLIBC_LOCALES = n
     OPTION_EGLIBC_LIBM = y
  
@@ -887,7 +887,7 @@ Index: libc/EGLIBC.option-groups
  In general, each option group variable controls whether a given set of
  object files in EGLIBC is compiled and included in the final
  libraries, or omitted from the build.
-@@ -132,22 +120,3 @@
+@@ -132,22 +120,3 @@ under development.
  
  We have used the system to subset some portions of EGLIBC's
  functionality.  It needs to be extended to cover more of the library.
diff --git a/meta/recipes-core/eglibc/eglibc-2.18/0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch b/meta/recipes-core/eglibc/eglibc-2.19/0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.18/0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
rename to meta/recipes-core/eglibc/eglibc-2.19/0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.18/0002-eglibc-menuconfig-hex-string-options.patch b/meta/recipes-core/eglibc/eglibc-2.19/0002-eglibc-menuconfig-hex-string-options.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.18/0002-eglibc-menuconfig-hex-string-options.patch
rename to meta/recipes-core/eglibc/eglibc-2.19/0002-eglibc-menuconfig-hex-string-options.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.18/0003-eglibc-menuconfig-build-instructions.patch b/meta/recipes-core/eglibc/eglibc-2.19/0003-eglibc-menuconfig-build-instructions.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.18/0003-eglibc-menuconfig-build-instructions.patch
rename to meta/recipes-core/eglibc/eglibc-2.19/0003-eglibc-menuconfig-build-instructions.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.18/GLRO_dl_debug_mask.patch b/meta/recipes-core/eglibc/eglibc-2.19/GLRO_dl_debug_mask.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.18/GLRO_dl_debug_mask.patch
rename to meta/recipes-core/eglibc/eglibc-2.19/GLRO_dl_debug_mask.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.18/IO-acquire-lock-fix.patch b/meta/recipes-core/eglibc/eglibc-2.19/IO-acquire-lock-fix.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.18/IO-acquire-lock-fix.patch
rename to meta/recipes-core/eglibc/eglibc-2.19/IO-acquire-lock-fix.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.18/add_resource_h_to_wait_h.patch b/meta/recipes-core/eglibc/eglibc-2.19/add_resource_h_to_wait_h.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.18/add_resource_h_to_wait_h.patch
rename to meta/recipes-core/eglibc/eglibc-2.19/add_resource_h_to_wait_h.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.18/eglibc-svn-arm-lowlevellock-include-tls.patch b/meta/recipes-core/eglibc/eglibc-2.19/eglibc-svn-arm-lowlevellock-include-tls.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.18/eglibc-svn-arm-lowlevellock-include-tls.patch
rename to meta/recipes-core/eglibc/eglibc-2.19/eglibc-svn-arm-lowlevellock-include-tls.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.18/eglibc_fix_findidx_parameters.patch b/meta/recipes-core/eglibc/eglibc-2.19/eglibc_fix_findidx_parameters.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.18/eglibc_fix_findidx_parameters.patch
rename to meta/recipes-core/eglibc/eglibc-2.19/eglibc_fix_findidx_parameters.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.18/etc/ld.so.conf b/meta/recipes-core/eglibc/eglibc-2.19/etc/ld.so.conf
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.18/etc/ld.so.conf
rename to meta/recipes-core/eglibc/eglibc-2.19/etc/ld.so.conf
diff --git a/meta/recipes-core/eglibc/eglibc-2.18/fileops-without-wchar-io.patch b/meta/recipes-core/eglibc/eglibc-2.19/fileops-without-wchar-io.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.18/fileops-without-wchar-io.patch
rename to meta/recipes-core/eglibc/eglibc-2.19/fileops-without-wchar-io.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.18/fix-tibetian-locales.patch b/meta/recipes-core/eglibc/eglibc-2.19/fix-tibetian-locales.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.18/fix-tibetian-locales.patch
rename to meta/recipes-core/eglibc/eglibc-2.19/fix-tibetian-locales.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.18/fix_for_centos_5.8.patch b/meta/recipes-core/eglibc/eglibc-2.19/fix_for_centos_5.8.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.18/fix_for_centos_5.8.patch
rename to meta/recipes-core/eglibc/eglibc-2.19/fix_for_centos_5.8.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.18/fsl-ppc-no-fsqrt.patch b/meta/recipes-core/eglibc/eglibc-2.19/fsl-ppc-no-fsqrt.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.18/fsl-ppc-no-fsqrt.patch
rename to meta/recipes-core/eglibc/eglibc-2.19/fsl-ppc-no-fsqrt.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.18/generate-supported.mk b/meta/recipes-core/eglibc/eglibc-2.19/generate-supported.mk
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.18/generate-supported.mk
rename to meta/recipes-core/eglibc/eglibc-2.19/generate-supported.mk
diff --git a/meta/recipes-core/eglibc/eglibc-2.18/glibc.fix_sqrt2.patch b/meta/recipes-core/eglibc/eglibc-2.19/glibc.fix_sqrt2.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.18/glibc.fix_sqrt2.patch
rename to meta/recipes-core/eglibc/eglibc-2.19/glibc.fix_sqrt2.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.18/initgroups_keys.patch b/meta/recipes-core/eglibc/eglibc-2.19/initgroups_keys.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.18/initgroups_keys.patch
rename to meta/recipes-core/eglibc/eglibc-2.19/initgroups_keys.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.18/ld-search-order.patch b/meta/recipes-core/eglibc/eglibc-2.19/ld-search-order.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.18/ld-search-order.patch
rename to meta/recipes-core/eglibc/eglibc-2.19/ld-search-order.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.18/mips-rld-map-check.patch b/meta/recipes-core/eglibc/eglibc-2.19/mips-rld-map-check.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.18/mips-rld-map-check.patch
rename to meta/recipes-core/eglibc/eglibc-2.19/mips-rld-map-check.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.18/multilib_readlib.patch b/meta/recipes-core/eglibc/eglibc-2.19/multilib_readlib.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.18/multilib_readlib.patch
rename to meta/recipes-core/eglibc/eglibc-2.19/multilib_readlib.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.18/ppc-sqrt_finite.patch b/meta/recipes-core/eglibc/eglibc-2.19/ppc-sqrt_finite.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.18/ppc-sqrt_finite.patch
rename to meta/recipes-core/eglibc/eglibc-2.19/ppc-sqrt_finite.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.18/ppc_slow_ieee754_sqrt.patch b/meta/recipes-core/eglibc/eglibc-2.19/ppc_slow_ieee754_sqrt.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.18/ppc_slow_ieee754_sqrt.patch
rename to meta/recipes-core/eglibc/eglibc-2.19/ppc_slow_ieee754_sqrt.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.18/relocatable_sdk.patch b/meta/recipes-core/eglibc/eglibc-2.19/relocatable_sdk.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.18/relocatable_sdk.patch
rename to meta/recipes-core/eglibc/eglibc-2.19/relocatable_sdk.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.18/relocatable_sdk_fix_openpath.patch b/meta/recipes-core/eglibc/eglibc-2.19/relocatable_sdk_fix_openpath.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.18/relocatable_sdk_fix_openpath.patch
rename to meta/recipes-core/eglibc/eglibc-2.19/relocatable_sdk_fix_openpath.patch
diff --git a/meta/recipes-core/eglibc/eglibc-initial_2.18.bb b/meta/recipes-core/eglibc/eglibc-initial_2.19.bb
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-initial_2.18.bb
rename to meta/recipes-core/eglibc/eglibc-initial_2.19.bb
diff --git a/meta/recipes-core/eglibc/eglibc-locale_2.18.bb b/meta/recipes-core/eglibc/eglibc-locale_2.19.bb
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-locale_2.18.bb
rename to meta/recipes-core/eglibc/eglibc-locale_2.19.bb
diff --git a/meta/recipes-core/eglibc/eglibc-mtrace_2.18.bb b/meta/recipes-core/eglibc/eglibc-mtrace_2.19.bb
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-mtrace_2.18.bb
rename to meta/recipes-core/eglibc/eglibc-mtrace_2.19.bb
diff --git a/meta/recipes-core/eglibc/eglibc-scripts_2.18.bb b/meta/recipes-core/eglibc/eglibc-scripts_2.19.bb
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-scripts_2.18.bb
rename to meta/recipes-core/eglibc/eglibc-scripts_2.19.bb
diff --git a/meta/recipes-core/eglibc/eglibc_2.18.bb b/meta/recipes-core/eglibc/eglibc_2.19.bb
similarity index 90%
rename from meta/recipes-core/eglibc/eglibc_2.18.bb
rename to meta/recipes-core/eglibc/eglibc_2.19.bb
index 15e5eed..7e582b6 100644
--- a/meta/recipes-core/eglibc/eglibc_2.18.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.19.bb
@@ -2,7 +2,7 @@ require eglibc.inc
 
 DEPENDS += "gperf-native kconfig-frontends-native"
 
-SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr23787.tar.bz2 \
+SRC_URI = "http://sakrah.homelinux.org/files/eglibc-${PV}-svnr25243.tar.bz2 \
            file://eglibc-svn-arm-lowlevellock-include-tls.patch \
            file://IO-acquire-lock-fix.patch \
            file://mips-rld-map-check.patch \
@@ -22,20 +22,16 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr23
            file://0003-eglibc-menuconfig-build-instructions.patch \
            file://fsl-ppc-no-fsqrt.patch \
            file://0001-R_ARM_TLS_DTPOFF32.patch \
-           file://tzselect-sh.patch \
-           file://tzselect-awk.patch \
            file://0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch \
            file://fix-tibetian-locales.patch \
-           file://0001-ARM-Pass-dl_hwcap-to-IFUNC-resolver.patch \
-           file://make-4.patch \
           "
-SRC_URI[md5sum] = "b395b021422a027d89884992e91734fc"
-SRC_URI[sha256sum] = "15f564b45dc5dd65faf0875579e3447961ae61e876933384ae05d19328539ad4"
+SRC_URI[md5sum] = "197836c2ba42fb146e971222647198dd"
+SRC_URI[sha256sum] = "baaa030531fc308f7820c46acdf8e1b2f8e3c1f40bcd28b6e440d1c95d170d4c"
 
 LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
-      file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
+      file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
       file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
-      file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff "
+      file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI_append_class-nativesdk = " file://ld-search-order.patch \
             file://relocatable_sdk.patch \
-- 
1.7.10.4


