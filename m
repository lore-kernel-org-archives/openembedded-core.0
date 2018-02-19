Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 308B577DCD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 08:34:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Feb 2018 00:34:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,534,1511856000"; d="scan'208";a="31132330"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 19 Feb 2018 00:34:54 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 963385802D1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 00:34:53 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Feb 2018 10:36:54 +0200
Message-Id: <1519029438-11092-4-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
References: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 03/27] pkgconfig: remove from oe-core
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
X-List-Received-Date: Mon, 19 Feb 2018 08:34:54 -0000

Move freedesktop.org's pkg-config as we are replacing it with pkgconf

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...t.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch | 41 ------------
 .../fix-glib-configure-libtool-usage.patch         | 45 -------------
 .../pkgconfig/pkgconfig/pkg-config-esdk.in         | 24 -------
 .../pkgconfig/pkgconfig/pkg-config-native.in       |  7 ---
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb   | 73 ----------------------
 5 files changed, 190 deletions(-)
 delete mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/0001-glib-gettext.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch
 delete mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/fix-glib-configure-libtool-usage.patch
 delete mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-esdk.in
 delete mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in
 delete mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig/0001-glib-gettext.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch b/meta/recipes-devtools/pkgconfig/pkgconfig/0001-glib-gettext.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch
deleted file mode 100644
index 80310cd..0000000
--- a/meta/recipes-devtools/pkgconfig/pkgconfig/0001-glib-gettext.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From e404e27de77d8b993c4cc87013d707200b3a5547 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Tue, 17 May 2016 13:26:27 +0300
-Subject: [PATCH] glib-gettext.m4: Update AM_GLIB_GNU_GETTEXT to match glib
-
-This avoids
-  error: m4_copy: won't overwrite defined macro: glib_DEFUN
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Upstream-Status: Pending
-
----
- glib/m4macros/glib-gettext.m4 | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/glib/m4macros/glib-gettext.m4 b/glib/m4macros/glib-gettext.m4
-index 5217fd8..155b1d8 100644
---- a/glib/m4macros/glib-gettext.m4
-+++ b/glib/m4macros/glib-gettext.m4
-@@ -313,7 +313,7 @@ msgstr ""
- # on various variables needed by the Makefile.in.in installed by 
- # glib-gettextize.
- dnl
--glib_DEFUN([GLIB_GNU_GETTEXT],
-+AU_DEFUN([GLIB_GNU_GETTEXT],
-   [AC_REQUIRE([AC_PROG_CC])dnl
-    
-    GLIB_LC_MESSAGES
-@@ -383,7 +383,8 @@ glib_DEFUN([GLIB_GNU_GETTEXT],
-    rm -f po/POTFILES
-    sed -e "/^#/d" -e "/^\$/d" -e "s,.*,	$posrcprefix& \\\\," -e "\$s/\(.*\) \\\\/\1/" \
- 	< $srcdir/po/POTFILES.in > po/POTFILES
--  ])
-+  ],
-+  [[$0: This macro is deprecated. You should use upstream gettext instead.]])
- 
- # AM_GLIB_DEFINE_LOCALEDIR(VARIABLE)
- # -------------------------------
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig/fix-glib-configure-libtool-usage.patch b/meta/recipes-devtools/pkgconfig/pkgconfig/fix-glib-configure-libtool-usage.patch
deleted file mode 100644
index 01c6247..0000000
--- a/meta/recipes-devtools/pkgconfig/pkgconfig/fix-glib-configure-libtool-usage.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-
-Index: pkg-config-0.28/glib/configure.ac
-===================================================================
---- pkg-config-0.28.orig/glib/configure.ac
-+++ pkg-config-0.28/glib/configure.ac
-@@ -1438,7 +1438,7 @@ if test x"$glib_native_win32" = xyes; th
-   G_MODULE_LDFLAGS=
- else
-   export SED
--  G_MODULE_LDFLAGS=`(./libtool --config; echo eval echo \\$export_dynamic_flag_spec) | sh`
-+  G_MODULE_LDFLAGS=`(./${host_alias}-libtool --config; echo eval echo \\$export_dynamic_flag_spec) | sh`
- fi
- dnl G_MODULE_IMPL= don't reset, so cmd-line can override
- G_MODULE_NEED_USCORE=0
-@@ -1503,13 +1503,13 @@ if test "$G_MODULE_IMPL" = "G_MODULE_IMP
- 	LDFLAGS="$LDFLAGS $G_MODULE_LDFLAGS"
- dnl *** check for OSF1/5.0 RTLD_GLOBAL brokenness
- 	echo "void glib_plugin_test(void) { }" > plugin.c
--	${SHELL} ./libtool --mode=compile --tag=CC ${CC} ${CFLAGS} \
-+	${SHELL} ./${host_alias}-libtool --mode=compile --tag=CC ${CC} ${CFLAGS} \
- 		${CPPFLAGS} -c -o plugin.lo plugin.c >/dev/null 2>&1
--	${SHELL} ./libtool --mode=link --tag=CC ${CC} ${CFLAGS} \
-+	${SHELL} ./${host_alias}-libtool --mode=link --tag=CC ${CC} ${CFLAGS} \
- 		${LDFLAGS} -module -o plugin.la -export-dynamic \
- 		-shrext ".o" -avoid-version plugin.lo \
- 		-rpath /dont/care >/dev/null 2>&1
--	eval `./libtool --config | grep ^objdir`
-+	eval `./${host_alias}-libtool --config | grep ^objdir`
- 	AC_CACHE_CHECK([for RTLD_GLOBAL brokenness],
- 		glib_cv_rtldglobal_broken,[
- 		AC_TRY_RUN([
-@@ -1582,7 +1582,7 @@ fi
- 
- AC_MSG_CHECKING(for the suffix of module shared libraries)
- export SED
--shrext_cmds=`./libtool --config | grep '^shrext_cmds='`
-+shrext_cmds=`./${host_alias}-libtool --config | grep '^shrext_cmds='`
- eval $shrext_cmds
- module=yes eval std_shrext=$shrext_cmds
- # chop the initial dot
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-esdk.in b/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-esdk.in
deleted file mode 100644
index 4fc9b0a..0000000
--- a/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-esdk.in
+++ /dev/null
@@ -1,24 +0,0 @@
-#! /bin/sh
-
-# Orignal pkg-config-native action when called as pkg-config-native
-# NO Change here
-if [ "pkg-config-native" = "`basename $0`" ] ; then
-	PKG_CONFIG_PATH="@PATH_NATIVE@"
-	PKG_CONFIG_LIBDIR="@LIBDIR_NATIVE@"
-	unset PKG_CONFIG_SYSROOT_DIR
-else
-	# in this case check if we are in the esdk
-	if [ "$OE_SKIP_SDK_CHECK" = "1" ] ; then
-		parentpid=`ps -o ppid= -p $$`
-		parentpid_info=`ps -wo comm= -o args= -p $parentpid`
-
-		# check if we are being called from  the kernel's make menuconfig
-		if ( echo $parentpid_info | grep -q check-lxdialog ) ; then
-			PKG_CONFIG_PATH="@PATH_NATIVE@"
-			PKG_CONFIG_LIBDIR="@LIBDIR_NATIVE@"
-			unset PKG_CONFIG_SYSROOT_DIR
-		fi
-	fi
-fi
-
-pkg-config.real "$@"
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in b/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in
deleted file mode 100644
index 5e44bb4..0000000
--- a/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in
+++ /dev/null
@@ -1,7 +0,0 @@
-#! /bin/sh
-
-PKG_CONFIG_PATH="@PATH_NATIVE@"
-PKG_CONFIG_LIBDIR="@LIBDIR_NATIVE@"
-unset PKG_CONFIG_SYSROOT_DIR
-
-pkg-config "$@"
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
deleted file mode 100644
index 52ef2a9..0000000
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ /dev/null
@@ -1,73 +0,0 @@
-SUMMARY = "Helper tool used when compiling"
-DESCRIPTION = "pkg-config is a helper tool used when compiling applications and libraries. It helps determined \
-the correct compiler/link options.  It is also language-agnostic."
-HOMEPAGE = "http://pkg-config.freedesktop.org/wiki/"
-BUGTRACKER = "http://bugs.freedesktop.org/buglist.cgi?product=pkg-config"
-SECTION = "console/utils"
-
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-SRCREV = "edf8e6f0ea77ede073f07bff0d2ae1fc7a38103b"
-PV = "0.29.2+git${SRCPV}"
-
-SRC_URI = "git://anongit.freedesktop.org/pkg-config \
-           file://pkg-config-esdk.in \
-           file://pkg-config-native.in \
-           file://fix-glib-configure-libtool-usage.patch \
-           file://0001-glib-gettext.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch \
-           "
-
-S = "${WORKDIR}/git"
-
-inherit autotools
-
-# Because of a faulty test, the current auto mode always evaluates to no,
-# so just continue that behaviour.
-#
-EXTRA_OECONF += "--disable-indirect-deps"
-
-PACKAGECONFIG ??= "glib"
-PACKAGECONFIG_class-native = ""
-PACKAGECONFIG_class-nativesdk = ""
-
-PACKAGECONFIG[glib] = "--without-internal-glib,--with-internal-glib,glib-2.0 pkgconfig-native"
-
-acpaths = "-I ."
-
-BBCLASSEXTEND = "native nativesdk"
-
-# Set an empty dev package to ensure the base PN package gets
-# the pkg.m4 macros, pkgconfig does not deliver any other -dev
-# files.
-FILES_${PN}-dev = ""
-FILES_${PN} += "${datadir}/aclocal/pkg.m4"
-
-# When using the RPM generated automatic package dependencies, some packages
-# will end up requiring 'pkgconfig(pkg-config)'.  Allow this behavior by
-# specifying an appropriate provide.
-RPROVIDES_${PN} += "pkgconfig(pkg-config)"
-
-# Install a pkg-config-native wrapper that will use the native sysroot instead
-# of the MACHINE sysroot, for using pkg-config when building native tools.
-do_install_append_class-native () {
-    sed -e "s|@PATH_NATIVE@|${PKG_CONFIG_PATH}|" \
-        -e "s|@LIBDIR_NATIVE@|${PKG_CONFIG_LIBDIR}|" \
-        < ${WORKDIR}/pkg-config-native.in > ${B}/pkg-config-native
-    install -m755 ${B}/pkg-config-native ${D}${bindir}/pkg-config-native
-    sed -e "s|@PATH_NATIVE@|${PKG_CONFIG_PATH}|" \
-        -e "s|@LIBDIR_NATIVE@|${PKG_CONFIG_LIBDIR}|" \
-        < ${WORKDIR}/pkg-config-esdk.in > ${B}/pkg-config-esdk
-    install -m755 ${B}/pkg-config-esdk ${D}${bindir}/pkg-config-esdk
-}
-
-pkgconfig_sstate_fixup_esdk () {
-	if [ "${BB_CURRENTTASK}" = "populate_sysroot_setscene" -a "${WITHIN_EXT_SDK}" = "1" ] ; then
-		pkgconfdir="${SSTATE_INSTDIR}/recipe-sysroot-native/${bindir_native}"
-		mv $pkgconfdir/pkg-config $pkgconfdir/pkg-config.real
-		lnr $pkgconfdir/pkg-config-esdk $pkgconfdir/pkg-config
-		sed -i -e "s|^pkg-config|pkg-config.real|" $pkgconfdir/pkg-config-native
-	fi
-}
-
-SSTATEPOSTUNPACKFUNCS_append_class-native = " pkgconfig_sstate_fixup_esdk"
-- 
2.4.0


