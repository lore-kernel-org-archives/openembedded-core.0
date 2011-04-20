Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QCP2y-0007nN-JC
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Apr 2011 06:29:50 +0200
Received: by pwj9 with SMTP id 9so231810pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2011 21:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=3N96apA8C+qZ8HxDtJj/JfSA0Vgr46PVlJrifp4If4E=;
	b=m3d7XDCCGvTcfVcOoM5ue/guTyetXdaVRwDKhmWVCydDcR5jaVa9l+IOTgc6QES0Cs
	0fytSdGwTNh9/3GTw0Eynw0owr5gI9Ad/OqDoQOipN17igH9j7TS3uzVLT0v+bGfzGt0
	k0LjofTzdLfcW8GkoviZmiImVxkye+sVhpcsc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=qhScdaHY7Mvy0dVpFUpjfaQH4faqCEmwurn6uhHuEZAPLdrd+sS/fUydveVXLUQ2Ml
	FHmljnJFgzilS3auFsmqgad226IiycFLBu4eHk3jn6FJMsi1bViCFPu1kgLSAAvXnRSo
	gLaETf0keMD74FO1cN9ki2D0dxTedWtszW9oU=
Received: by 10.68.48.4 with SMTP id h4mr9938658pbn.37.1303273643861;
	Tue, 19 Apr 2011 21:27:23 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id u3sm377445pbh.8.2011.04.19.21.27.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 19 Apr 2011 21:27:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Apr 2011 21:27:09 -0700
Message-Id: <1303273629-1631-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] gcc: Add recipes for 4.6.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Apr 2011 04:29:50 -0000

Hi

This is initial set of patches for testing them out
The patches need documentation is pending
Some patches especially uclibc related are not
needed they must be dropped.

This is not the final version yet. But I would like
folks to help trying them out and report issues

I have tried to boot uclibc/arm on it but qemu
died on me. so please boot the images you build
and I would be interested to know the results.

-Khem

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.6.0.inc            |   82 +
 .../gcc/gcc-4.6.0/100-uclibc-conf.patch            |   37 +
 .../gcc/gcc-4.6.0/103-uclibc-conf-noupstream.patch |   15 +
 .../gcc/gcc-4.6.0/200-uclibc-locale.patch          | 2840 ++++++++++++++++++++
 .../gcc/gcc-4.6.0/203-uclibc-locale-no__x.patch    |  233 ++
 .../gcc-4.6.0/204-uclibc-locale-wchar_fix.patch    |   52 +
 .../gcc/gcc-4.6.0/205-uclibc-locale-update.patch   |  519 ++++
 .../gcc/gcc-4.6.0/301-missing-execinfo_h.patch     |   13 +
 .../gcc/gcc-4.6.0/302-c99-snprintf.patch           |   13 +
 .../gcc/gcc-4.6.0/303-c99-complex-ugly-hack.patch  |   14 +
 .../gcc/gcc-4.6.0/304-index_macro.patch            |   28 +
 .../gcc-4.6.0/305-libmudflap-susv3-legacy.patch    |   49 +
 .../gcc/gcc-4.6.0/306-libstdc++-namespace.patch    |   38 +
 .../gcc/gcc-4.6.0/307-locale_facets.patch          |   19 +
 .../gcc/gcc-4.6.0/602-sdk-libstdc++-includes.patch |   20 +
 .../recipes-devtools/gcc/gcc-4.6.0/64bithack.patch |   33 +
 .../gcc/gcc-4.6.0/740-sh-pr24836.patch             |   29 +
 .../gcc/gcc-4.6.0/800-arm-bigendian.patch          |   34 +
 .../gcc/gcc-4.6.0/904-flatten-switch-stmt-00.patch |   74 +
 .../gcc/gcc-4.6.0/COLLECT_GCC_OPTIONS.patch        |   23 +
 .../GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch       |   33 +
 .../gcc/gcc-4.6.0/arm-bswapsi2.patch               |   13 +
 .../gcc/gcc-4.6.0/arm-nolibfloat.patch             |   24 +
 .../gcc/gcc-4.6.0/arm-softfloat.patch              |   16 +
 .../gcc/gcc-4.6.0/arm-unbreak-eabi-armv4t.dpatch   |   36 +
 .../gcc/gcc-4.6.0/cache-amnesia.patch              |   31 +
 .../gcc-4.6.0/disable_relax_pic_calls_flag.patch   |   46 +
 .../gcc/gcc-4.6.0/fortran-cross-compile-hack.patch |   30 +
 .../gcc/gcc-4.6.0/gcc-4.0.2-e300c2c3.patch         |  319 +++
 .../gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch          |   31 +
 .../gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch      |  114 +
 .../gcc/gcc-4.6.0/gcc-arm-frename-registers.patch  |   25 +
 .../gcc/gcc-4.6.0/gcc-flags-for-build.patch        |  178 ++
 .../gcc/gcc-4.6.0/gcc-ice-hack.dpatch              |  331 +++
 .../gcc/gcc-4.6.0/gcc-poison-dir-extend.patch      |   25 +
 .../gcc/gcc-4.6.0/gcc-poison-parameters.patch      |   74 +
 .../gcc-4.6.0/gcc-poison-system-directories.patch  |  221 ++
 .../gcc-uclibc-locale-ctype_touplow_t.patch        |   70 +
 .../gcc/gcc-4.6.0/libstdc++-pic.dpatch             |   71 +
 .../gcc/gcc-4.6.0/optional_libstdc.patch           |   84 +
 meta/recipes-devtools/gcc/gcc-4.6.0/pr30961.dpatch |  179 ++
 meta/recipes-devtools/gcc/gcc-4.6.0/pr35942.patch  |   38 +
 .../gcc/gcc-4.6.0/zecke-xgcc-cpp.patch             |   28 +
 .../gcc/gcc-cross-initial_4.6.0.bb                 |    2 +
 .../gcc/gcc-cross-intermediate_4.6.0.bb            |    3 +
 meta/recipes-devtools/gcc/gcc-cross_4.6.0.bb       |    8 +
 .../gcc/gcc-crosssdk-initial_4.6.0.bb              |    4 +
 .../gcc/gcc-crosssdk-intermediate_4.6.0.bb         |    4 +
 meta/recipes-devtools/gcc/gcc-runtime_4.6.0.bb     |   10 +
 meta/recipes-devtools/gcc/gcc_4.6.0.bb             |    7 +
 meta/recipes-devtools/gcc/libgcc_4.6.0.bb          |   46 +
 51 files changed, 6266 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0.inc
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/100-uclibc-conf.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/103-uclibc-conf-noupstream.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/200-uclibc-locale.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/203-uclibc-locale-no__x.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/204-uclibc-locale-wchar_fix.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/205-uclibc-locale-update.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/301-missing-execinfo_h.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/302-c99-snprintf.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/303-c99-complex-ugly-hack.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/304-index_macro.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/305-libmudflap-susv3-legacy.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/306-libstdc++-namespace.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/307-locale_facets.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/602-sdk-libstdc++-includes.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/64bithack.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/740-sh-pr24836.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/800-arm-bigendian.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/904-flatten-switch-stmt-00.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/COLLECT_GCC_OPTIONS.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/arm-bswapsi2.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/arm-nolibfloat.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/arm-softfloat.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/arm-unbreak-eabi-armv4t.dpatch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/cache-amnesia.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/disable_relax_pic_calls_flag.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/fortran-cross-compile-hack.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4.0.2-e300c2c3.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-arm-frename-registers.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-flags-for-build.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-ice-hack.dpatch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-poison-dir-extend.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-poison-parameters.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-poison-system-directories.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-uclibc-locale-ctype_touplow_t.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/libstdc++-pic.dpatch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/optional_libstdc.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/pr30961.dpatch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/pr35942.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/zecke-xgcc-cpp.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-cross-initial_4.6.0.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-cross-intermediate_4.6.0.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-cross_4.6.0.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.6.0.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.6.0.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-runtime_4.6.0.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc_4.6.0.bb
 create mode 100644 meta/recipes-devtools/gcc/libgcc_4.6.0.bb

diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0.inc b/meta/recipes-devtools/gcc/gcc-4.6.0.inc
new file mode 100644
index 0000000..6f319d4
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0.inc
@@ -0,0 +1,82 @@
+require gcc-common.inc
+
+DEPENDS =+ "mpfr gmp libmpc"
+NATIVEDEPS = "mpfr-native gmp-native gettext-native libmpc-native"
+
+LICENSE="GCC RUNTIME LIBRARY EXCEPTION & GPLv3"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
+                   file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
+                   file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
+                   file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
+		   file://COPYING.RUNTIME;md5=fe60d87048567d4fe8c8a0ed2448bcc8"
+
+SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
+	   file://gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
+	   file://100-uclibc-conf.patch \
+           file://gcc-uclibc-locale-ctype_touplow_t.patch \
+	   file://cache-amnesia.patch \
+	   file://gcc-flags-for-build.patch \
+           file://103-uclibc-conf-noupstream.patch  \
+           file://200-uclibc-locale.patch  \
+           file://203-uclibc-locale-no__x.patch;striplevel=1 \
+           file://204-uclibc-locale-wchar_fix.patch;striplevel=1 \
+           file://205-uclibc-locale-update.patch;striplevel=1 \
+           file://301-missing-execinfo_h.patch  \
+           file://302-c99-snprintf.patch  \
+           file://303-c99-complex-ugly-hack.patch  \
+           file://304-index_macro.patch  \
+           file://305-libmudflap-susv3-legacy.patch  \
+           file://306-libstdc++-namespace.patch  \
+           file://740-sh-pr24836.patch  \
+           file://800-arm-bigendian.patch  \
+           file://904-flatten-switch-stmt-00.patch  \
+           file://arm-nolibfloat.patch  \
+           file://arm-softfloat.patch \
+           file://zecke-xgcc-cpp.patch \
+           file://gcc-poison-system-directories.patch \
+           file://gcc-poison-dir-extend.patch \
+           file://gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch \
+	   file://64bithack.patch \
+	   file://optional_libstdc.patch \
+	   file://disable_relax_pic_calls_flag.patch \
+	   file://gcc-poison-parameters.patch \
+	   file://GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch \
+	   file://COLLECT_GCC_OPTIONS.patch \
+	  "
+SRC_URI_append_sh3  = " file://sh3-installfix-fixheaders.patch;patch=1 "
+
+SRC_URI[md5sum] = "93d1c436bf991564524701259b6285a2"
+SRC_URI[sha256sum] = "23bd0013d76ac6fb4537e5e8f4e5947129362dcc32f0d08563b7d4d9e44c0e17"
+
+
+# Language Overrides
+FORTRAN = ""
+JAVA = ""
+
+#EXTRA_OECONF_BASE = "  --enable-cheaders=c_std \
+#			--enable-libssp \
+#			--disable-bootstrap \
+#			--disable-libgomp \
+#			--disable-libmudflap"
+EXTRA_OECONF_BASE = " --enable-lto \
+			--enable-libssp \
+			--disable-bootstrap \
+			--disable-libgomp \
+			--disable-libmudflap \
+			--enable-cheaders=c_global "
+
+EXTRA_OECONF_INITIAL = "--disable-libmudflap \
+			--disable-libgomp \
+			--disable-libssp \
+			--disable-libquadmath \
+			--enable-decimal-float=no"
+
+EXTRA_OECONF_INTERMEDIATE = "--disable-libmudflap \
+				--disable-libgomp \
+				--disable-libquadmath \
+				--disable-libssp"
+
+EXTRA_OECONF_append_linux-uclibc = " --disable-decimal-float "
+EXTRA_OECONF_append_linux-uclibceabi = " --disable-decimal-float "
+EXTRA_OECONF_append_linux-uclibcspe = " --disable-decimal-float "
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/100-uclibc-conf.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/100-uclibc-conf.patch
new file mode 100644
index 0000000..313b828
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/100-uclibc-conf.patch
@@ -0,0 +1,37 @@
+Index: gcc-4.6.0/contrib/regression/objs-gcc.sh
+===================================================================
+--- gcc-4.6.0.orig/contrib/regression/objs-gcc.sh
++++ gcc-4.6.0/contrib/regression/objs-gcc.sh
+@@ -106,6 +106,10 @@ if [ $H_REAL_TARGET = $H_REAL_HOST -a $H
+  then
+   make all-gdb all-dejagnu all-ld || exit 1
+   make install-gdb install-dejagnu install-ld || exit 1
++elif [ $H_REAL_TARGET = $H_REAL_HOST -a $H_REAL_TARGET = i686-pc-linux-uclibc ]
++ then
++  make all-gdb all-dejagnu all-ld || exit 1
++  make install-gdb install-dejagnu install-ld || exit 1
+ elif [ $H_REAL_TARGET = $H_REAL_HOST ] ; then
+   make bootstrap || exit 1
+   make install || exit 1
+Index: gcc-4.6.0/libjava/classpath/ltconfig
+===================================================================
+--- gcc-4.6.0.orig/libjava/classpath/ltconfig
++++ gcc-4.6.0/libjava/classpath/ltconfig
+@@ -603,7 +603,7 @@ host_os=`echo $host | sed 's/^\([^-]*\)-
+ 
+ # Transform linux* to *-*-linux-gnu*, to support old configure scripts.
+ case $host_os in
+-linux-gnu*) ;;
++linux-gnu*|linux-uclibc*) ;;
+ linux*) host=`echo $host | sed 's/^\(.*-.*-linux\)\(.*\)$/\1-gnu\2/'`
+ esac
+ 
+@@ -1247,7 +1247,7 @@ linux-gnuoldld* | linux-gnuaout* | linux
+   ;;
+ 
+ # This must be Linux ELF.
+-linux-gnu*)
++linux*)
+   version_type=linux
+   need_lib_prefix=no
+   need_version=no
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/103-uclibc-conf-noupstream.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/103-uclibc-conf-noupstream.patch
new file mode 100644
index 0000000..b28fac2
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/103-uclibc-conf-noupstream.patch
@@ -0,0 +1,15 @@
+Corrects sub machine arch corectly
+
+Index: gcc-4.6.0/gcc/config.gcc
+===================================================================
+--- gcc-4.6.0.orig/gcc/config.gcc
++++ gcc-4.6.0/gcc/config.gcc
+@@ -2316,7 +2316,7 @@ score-*-elf)
+         ;;
+ sh-*-elf* | sh[12346l]*-*-elf* | \
+ sh-*-symbianelf* | sh[12346l]*-*-symbianelf* | \
+-  sh-*-linux* | sh[2346lbe]*-*-linux* | \
++  sh*-*-linux* | sh[2346lbe]*-*-linux* | \
+   sh-*-netbsdelf* | shl*-*-netbsdelf* | sh5-*-netbsd* | sh5l*-*-netbsd* | \
+    sh64-*-netbsd* | sh64l*-*-netbsd*)
+ 	tmake_file="${tmake_file} sh/t-sh sh/t-elf"
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/200-uclibc-locale.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/200-uclibc-locale.patch
new file mode 100644
index 0000000..0f2caff
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/200-uclibc-locale.patch
@@ -0,0 +1,2840 @@
+Index: gcc-4.6.0/libstdc++-v3/acinclude.m4
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/acinclude.m4
++++ gcc-4.6.0/libstdc++-v3/acinclude.m4
+@@ -1753,7 +1753,7 @@ dnl
+ AC_DEFUN([GLIBCXX_ENABLE_CLOCALE], [
+   GLIBCXX_ENABLE(clocale,auto,[[[=MODEL]]],
+     [use MODEL for target locale package],
+-    [permit generic|gnu|ieee_1003.1-2001|yes|no|auto])
++    [permit generic|gnu|ieee_1003.1-2001|uclibc|yes|no|auto])
+ 
+   # Deal with gettext issues.  Default to not using it (=no) until we detect
+   # support for it later.  Let the user turn it off via --e/d, but let that
+@@ -1774,6 +1774,9 @@ AC_DEFUN([GLIBCXX_ENABLE_CLOCALE], [
+   # Default to "generic".
+   if test $enable_clocale_flag = auto; then
+     case ${target_os} in
++      *-uclibc*)
++        enable_clocale_flag=uclibc
++        ;;
+       linux* | gnu* | kfreebsd*-gnu | knetbsd*-gnu)
+ 	enable_clocale_flag=gnu
+ 	;;
+@@ -1915,6 +1918,40 @@ AC_DEFUN([GLIBCXX_ENABLE_CLOCALE], [
+       CTIME_CC=config/locale/generic/time_members.cc
+       CLOCALE_INTERNAL_H=config/locale/generic/c++locale_internal.h
+       ;;
++    uclibc)
++      AC_MSG_RESULT(uclibc)
++
++      # Declare intention to use gettext, and add support for specific
++      # languages.
++      # For some reason, ALL_LINGUAS has to be before AM-GNU-GETTEXT
++      ALL_LINGUAS="de fr"
++
++      # Don't call AM-GNU-GETTEXT here. Instead, assume glibc.
++      AC_CHECK_PROG(check_msgfmt, msgfmt, yes, no)
++      if test x"$check_msgfmt" = x"yes" && test x"$enable_nls" = x"yes"; then
++        USE_NLS=yes
++      fi
++      # Export the build objects.
++      for ling in $ALL_LINGUAS; do \
++        glibcxx_MOFILES="$glibcxx_MOFILES $ling.mo"; \
++        glibcxx_POFILES="$glibcxx_POFILES $ling.po"; \
++      done
++      AC_SUBST(glibcxx_MOFILES)
++      AC_SUBST(glibcxx_POFILES)
++
++      CLOCALE_H=config/locale/uclibc/c_locale.h
++      CLOCALE_CC=config/locale/uclibc/c_locale.cc
++      CCODECVT_CC=config/locale/uclibc/codecvt_members.cc
++      CCOLLATE_CC=config/locale/uclibc/collate_members.cc
++      CCTYPE_CC=config/locale/uclibc/ctype_members.cc
++      CMESSAGES_H=config/locale/uclibc/messages_members.h
++      CMESSAGES_CC=config/locale/uclibc/messages_members.cc
++      CMONEY_CC=config/locale/uclibc/monetary_members.cc
++      CNUMERIC_CC=config/locale/uclibc/numeric_members.cc
++      CTIME_H=config/locale/uclibc/time_members.h
++      CTIME_CC=config/locale/uclibc/time_members.cc
++      CLOCALE_INTERNAL_H=config/locale/uclibc/c++locale_internal.h
++      ;;
+   esac
+ 
+   # This is where the testsuite looks for locale catalogs, using the
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
+===================================================================
+--- /dev/null
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
+@@ -0,0 +1,63 @@
++// Prototypes for GLIBC thread locale __-prefixed functions -*- C++ -*-
++
++// Copyright (C) 2002, 2004, 2005 Free Software Foundation, Inc.
++//
++// This file is part of the GNU ISO C++ Library.  This library is free
++// software; you can redistribute it and/or modify it under the
++// terms of the GNU General Public License as published by the
++// Free Software Foundation; either version 2, or (at your option)
++// any later version.
++
++// This library is distributed in the hope that it will be useful,
++// but WITHOUT ANY WARRANTY; without even the implied warranty of
++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++// GNU General Public License for more details.
++
++// You should have received a copy of the GNU General Public License along
++// with this library; see the file COPYING.  If not, write to the Free
++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
++// USA.
++
++// As a special exception, you may use this file as part of a free software
++// library without restriction.  Specifically, if other files instantiate
++// templates or use macros or inline functions from this file, or you compile
++// this file and link it with other files to produce an executable, this
++// file does not by itself cause the resulting executable to be covered by
++// the GNU General Public License.  This exception does not however
++// invalidate any other reasons why the executable file might be covered by
++// the GNU General Public License.
++
++// Written by Jakub Jelinek <jakub@redhat.com>
++
++#include <bits/c++config.h>
++#include <clocale>
++
++#ifdef __UCLIBC_MJN3_ONLY__
++#warning clean this up
++#endif
++
++#ifdef __UCLIBC_HAS_XLOCALE__
++
++extern "C" __typeof(nl_langinfo_l) __nl_langinfo_l;
++extern "C" __typeof(strcoll_l) __strcoll_l;
++extern "C" __typeof(strftime_l) __strftime_l;
++extern "C" __typeof(strtod_l) __strtod_l;
++extern "C" __typeof(strtof_l) __strtof_l;
++extern "C" __typeof(strtold_l) __strtold_l;
++extern "C" __typeof(strxfrm_l) __strxfrm_l;
++extern "C" __typeof(newlocale) __newlocale;
++extern "C" __typeof(freelocale) __freelocale;
++extern "C" __typeof(duplocale) __duplocale;
++extern "C" __typeof(uselocale) __uselocale;
++
++#ifdef _GLIBCXX_USE_WCHAR_T
++extern "C" __typeof(iswctype_l) __iswctype_l;
++extern "C" __typeof(towlower_l) __towlower_l;
++extern "C" __typeof(towupper_l) __towupper_l;
++extern "C" __typeof(wcscoll_l) __wcscoll_l;
++extern "C" __typeof(wcsftime_l) __wcsftime_l;
++extern "C" __typeof(wcsxfrm_l) __wcsxfrm_l;
++extern "C" __typeof(wctype_l) __wctype_l;
++#endif
++
++#endif // GLIBC 2.3 and later
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/c_locale.cc
+===================================================================
+--- /dev/null
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/c_locale.cc
+@@ -0,0 +1,160 @@
++// Wrapper for underlying C-language localization -*- C++ -*-
++
++// Copyright (C) 2001, 2002, 2003 Free Software Foundation, Inc.
++//
++// This file is part of the GNU ISO C++ Library.  This library is free
++// software; you can redistribute it and/or modify it under the
++// terms of the GNU General Public License as published by the
++// Free Software Foundation; either version 2, or (at your option)
++// any later version.
++
++// This library is distributed in the hope that it will be useful,
++// but WITHOUT ANY WARRANTY; without even the implied warranty of
++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++// GNU General Public License for more details.
++
++// You should have received a copy of the GNU General Public License along
++// with this library; see the file COPYING.  If not, write to the Free
++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
++// USA.
++
++// As a special exception, you may use this file as part of a free software
++// library without restriction.  Specifically, if other files instantiate
++// templates or use macros or inline functions from this file, or you compile
++// this file and link it with other files to produce an executable, this
++// file does not by itself cause the resulting executable to be covered by
++// the GNU General Public License.  This exception does not however
++// invalidate any other reasons why the executable file might be covered by
++// the GNU General Public License.
++
++//
++// ISO C++ 14882: 22.8  Standard locale categories.
++//
++
++// Written by Benjamin Kosnik <bkoz@redhat.com>
++
++#include <cerrno>  // For errno
++#include <locale>
++#include <stdexcept>
++#include <langinfo.h>
++#include <bits/c++locale_internal.h>
++
++#ifndef __UCLIBC_HAS_XLOCALE__
++#define __strtol_l(S, E, B, L)      strtol((S), (E), (B))
++#define __strtoul_l(S, E, B, L)     strtoul((S), (E), (B))
++#define __strtoll_l(S, E, B, L)     strtoll((S), (E), (B))
++#define __strtoull_l(S, E, B, L)    strtoull((S), (E), (B))
++#define __strtof_l(S, E, L)         strtof((S), (E))
++#define __strtod_l(S, E, L)         strtod((S), (E))
++#define __strtold_l(S, E, L)        strtold((S), (E))
++#warning should dummy __newlocale check for C|POSIX ?
++#define __newlocale(a, b, c)        NULL
++#define __freelocale(a)             ((void)0)
++#define __duplocale(a)              __c_locale()
++#endif
++
++namespace std
++{
++  template<>
++    void
++    __convert_to_v(const char* __s, float& __v, ios_base::iostate& __err,
++		   const __c_locale& __cloc)
++    {
++      if (!(__err & ios_base::failbit))
++	{
++	  char* __sanity;
++	  errno = 0;
++	  float __f = __strtof_l(__s, &__sanity, __cloc);
++          if (__sanity != __s && errno != ERANGE)
++	    __v = __f;
++	  else
++	    __err |= ios_base::failbit;
++	}
++    }
++
++  template<>
++    void
++    __convert_to_v(const char* __s, double& __v, ios_base::iostate& __err,
++		   const __c_locale& __cloc)
++    {
++      if (!(__err & ios_base::failbit))
++	{
++	  char* __sanity;
++	  errno = 0;
++	  double __d = __strtod_l(__s, &__sanity, __cloc);
++          if (__sanity != __s && errno != ERANGE)
++	    __v = __d;
++	  else
++	    __err |= ios_base::failbit;
++	}
++    }
++
++  template<>
++    void
++    __convert_to_v(const char* __s, long double& __v, ios_base::iostate& __err,
++		   const __c_locale& __cloc)
++    {
++      if (!(__err & ios_base::failbit))
++	{
++	  char* __sanity;
++	  errno = 0;
++	  long double __ld = __strtold_l(__s, &__sanity, __cloc);
++          if (__sanity != __s && errno != ERANGE)
++	    __v = __ld;
++	  else
++	    __err |= ios_base::failbit;
++	}
++    }
++
++  void
++  locale::facet::_S_create_c_locale(__c_locale& __cloc, const char* __s,
++				    __c_locale __old)
++  {
++    __cloc = __newlocale(1 << LC_ALL, __s, __old);
++#ifdef __UCLIBC_HAS_XLOCALE__
++    if (!__cloc)
++      {
++	// This named locale is not supported by the underlying OS.
++	__throw_runtime_error(__N("locale::facet::_S_create_c_locale "
++			      "name not valid"));
++      }
++#endif
++  }
++
++  void
++  locale::facet::_S_destroy_c_locale(__c_locale& __cloc)
++  {
++    if (_S_get_c_locale() != __cloc)
++      __freelocale(__cloc);
++  }
++
++  __c_locale
++  locale::facet::_S_clone_c_locale(__c_locale& __cloc)
++  { return __duplocale(__cloc); }
++} // namespace std
++
++namespace __gnu_cxx
++{
++  const char* const category_names[6 + _GLIBCXX_NUM_CATEGORIES] =
++    {
++      "LC_CTYPE",
++      "LC_NUMERIC",
++      "LC_TIME",
++      "LC_COLLATE",
++      "LC_MONETARY",
++      "LC_MESSAGES",
++#if _GLIBCXX_NUM_CATEGORIES != 0
++      "LC_PAPER",
++      "LC_NAME",
++      "LC_ADDRESS",
++      "LC_TELEPHONE",
++      "LC_MEASUREMENT",
++      "LC_IDENTIFICATION"
++#endif
++    };
++}
++
++namespace std
++{
++  const char* const* const locale::_S_categories = __gnu_cxx::category_names;
++}  // namespace std
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/c_locale.h
+===================================================================
+--- /dev/null
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/c_locale.h
+@@ -0,0 +1,117 @@
++// Wrapper for underlying C-language localization -*- C++ -*-
++
++// Copyright (C) 2001, 2002, 2003, 2004, 2005 Free Software Foundation, Inc.
++//
++// This file is part of the GNU ISO C++ Library.  This library is free
++// software; you can redistribute it and/or modify it under the
++// terms of the GNU General Public License as published by the
++// Free Software Foundation; either version 2, or (at your option)
++// any later version.
++
++// This library is distributed in the hope that it will be useful,
++// but WITHOUT ANY WARRANTY; without even the implied warranty of
++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++// GNU General Public License for more details.
++
++// You should have received a copy of the GNU General Public License along
++// with this library; see the file COPYING.  If not, write to the Free
++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
++// USA.
++
++// As a special exception, you may use this file as part of a free software
++// library without restriction.  Specifically, if other files instantiate
++// templates or use macros or inline functions from this file, or you compile
++// this file and link it with other files to produce an executable, this
++// file does not by itself cause the resulting executable to be covered by
++// the GNU General Public License.  This exception does not however
++// invalidate any other reasons why the executable file might be covered by
++// the GNU General Public License.
++
++//
++// ISO C++ 14882: 22.8  Standard locale categories.
++//
++
++// Written by Benjamin Kosnik <bkoz@redhat.com>
++
++#ifndef _C_LOCALE_H
++#define _C_LOCALE_H 1
++
++#pragma GCC system_header
++
++#include <cstring>              // get std::strlen
++#include <cstdio>               // get std::snprintf or std::sprintf
++#include <clocale>
++#include <langinfo.h>		// For codecvt
++#ifdef __UCLIBC_MJN3_ONLY__
++#warning fix this
++#endif
++#ifdef __UCLIBC_HAS_LOCALE__
++#include <iconv.h>		// For codecvt using iconv, iconv_t
++#endif
++#ifdef __UCLIBC_HAS_GETTEXT_AWARENESS__
++#include <libintl.h> 		// For messages
++#endif
++
++#ifdef __UCLIBC_MJN3_ONLY__
++#warning what is _GLIBCXX_C_LOCALE_GNU for
++#endif
++#define _GLIBCXX_C_LOCALE_GNU 1
++
++#ifdef __UCLIBC_MJN3_ONLY__
++#warning fix categories
++#endif
++// #define _GLIBCXX_NUM_CATEGORIES 6
++#define _GLIBCXX_NUM_CATEGORIES 0
++
++#ifdef __UCLIBC_HAS_XLOCALE__
++namespace __gnu_cxx
++{
++  extern "C" __typeof(uselocale) __uselocale;
++}
++#endif
++
++namespace std
++{
++#ifdef __UCLIBC_HAS_XLOCALE__
++  typedef __locale_t		__c_locale;
++#else
++  typedef int*			__c_locale;
++#endif
++
++  // Convert numeric value of type _Tv to string and return length of
++  // string.  If snprintf is available use it, otherwise fall back to
++  // the unsafe sprintf which, in general, can be dangerous and should
++  // be avoided.
++  template<typename _Tv>
++    int
++    __convert_from_v(char* __out,
++		     const int __size __attribute__ ((__unused__)),
++		     const char* __fmt,
++#ifdef __UCLIBC_HAS_XCLOCALE__
++		     _Tv __v, const __c_locale& __cloc, int __prec)
++    {
++      __c_locale __old = __gnu_cxx::__uselocale(__cloc);
++#else
++		     _Tv __v, const __c_locale&, int __prec)
++    {
++# ifdef __UCLIBC_HAS_LOCALE__
++      char* __old = std::setlocale(LC_ALL, NULL);
++      char* __sav = new char[std::strlen(__old) + 1];
++      std::strcpy(__sav, __old);
++      std::setlocale(LC_ALL, "C");
++# endif
++#endif
++
++      const int __ret = std::snprintf(__out, __size, __fmt, __prec, __v);
++
++#ifdef __UCLIBC_HAS_XCLOCALE__
++      __gnu_cxx::__uselocale(__old);
++#elif defined __UCLIBC_HAS_LOCALE__
++      std::setlocale(LC_ALL, __sav);
++      delete [] __sav;
++#endif
++      return __ret;
++    }
++}
++
++#endif
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/codecvt_members.cc
+===================================================================
+--- /dev/null
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/codecvt_members.cc
+@@ -0,0 +1,308 @@
++// std::codecvt implementation details, GNU version -*- C++ -*-
++
++// Copyright (C) 2002, 2003 Free Software Foundation, Inc.
++//
++// This file is part of the GNU ISO C++ Library.  This library is free
++// software; you can redistribute it and/or modify it under the
++// terms of the GNU General Public License as published by the
++// Free Software Foundation; either version 2, or (at your option)
++// any later version.
++
++// This library is distributed in the hope that it will be useful,
++// but WITHOUT ANY WARRANTY; without even the implied warranty of
++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++// GNU General Public License for more details.
++
++// You should have received a copy of the GNU General Public License along
++// with this library; see the file COPYING.  If not, write to the Free
++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
++// USA.
++
++// As a special exception, you may use this file as part of a free software
++// library without restriction.  Specifically, if other files instantiate
++// templates or use macros or inline functions from this file, or you compile
++// this file and link it with other files to produce an executable, this
++// file does not by itself cause the resulting executable to be covered by
++// the GNU General Public License.  This exception does not however
++// invalidate any other reasons why the executable file might be covered by
++// the GNU General Public License.
++
++//
++// ISO C++ 14882: 22.2.1.5 - Template class codecvt
++//
++
++// Written by Benjamin Kosnik <bkoz@redhat.com>
++
++#include <locale>
++#include <cstdlib>  // For MB_CUR_MAX
++#include <climits>  // For MB_LEN_MAX
++#include <bits/c++locale_internal.h>
++
++namespace std
++{
++  // Specializations.
++#ifdef _GLIBCXX_USE_WCHAR_T
++  codecvt_base::result
++  codecvt<wchar_t, char, mbstate_t>::
++  do_out(state_type& __state, const intern_type* __from,
++	 const intern_type* __from_end, const intern_type*& __from_next,
++	 extern_type* __to, extern_type* __to_end,
++	 extern_type*& __to_next) const
++  {
++    result __ret = ok;
++    state_type __tmp_state(__state);
++
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __c_locale __old = __uselocale(_M_c_locale_codecvt);
++#endif
++
++    // wcsnrtombs is *very* fast but stops if encounters NUL characters:
++    // in case we fall back to wcrtomb and then continue, in a loop.
++    // NB: wcsnrtombs is a GNU extension
++    for (__from_next = __from, __to_next = __to;
++	 __from_next < __from_end && __to_next < __to_end
++	 && __ret == ok;)
++      {
++	const intern_type* __from_chunk_end = wmemchr(__from_next, L'\0',
++						      __from_end - __from_next);
++	if (!__from_chunk_end)
++	  __from_chunk_end = __from_end;
++
++	__from = __from_next;
++	const size_t __conv = wcsnrtombs(__to_next, &__from_next,
++					 __from_chunk_end - __from_next,
++					 __to_end - __to_next, &__state);
++	if (__conv == static_cast<size_t>(-1))
++	  {
++	    // In case of error, in order to stop at the exact place we
++	    // have to start again from the beginning with a series of
++	    // wcrtomb.
++	    for (; __from < __from_next; ++__from)
++	      __to_next += wcrtomb(__to_next, *__from, &__tmp_state);
++	    __state = __tmp_state;
++	    __ret = error;
++	  }
++	else if (__from_next && __from_next < __from_chunk_end)
++	  {
++	    __to_next += __conv;
++	    __ret = partial;
++	  }
++	else
++	  {
++	    __from_next = __from_chunk_end;
++	    __to_next += __conv;
++	  }
++
++	if (__from_next < __from_end && __ret == ok)
++	  {
++	    extern_type __buf[MB_LEN_MAX];
++	    __tmp_state = __state;
++	    const size_t __conv = wcrtomb(__buf, *__from_next, &__tmp_state);
++	    if (__conv > static_cast<size_t>(__to_end - __to_next))
++	      __ret = partial;
++	    else
++	      {
++		memcpy(__to_next, __buf, __conv);
++		__state = __tmp_state;
++		__to_next += __conv;
++		++__from_next;
++	      }
++	  }
++      }
++
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __uselocale(__old);
++#endif
++
++    return __ret;
++  }
++
++  codecvt_base::result
++  codecvt<wchar_t, char, mbstate_t>::
++  do_in(state_type& __state, const extern_type* __from,
++	const extern_type* __from_end, const extern_type*& __from_next,
++	intern_type* __to, intern_type* __to_end,
++	intern_type*& __to_next) const
++  {
++    result __ret = ok;
++    state_type __tmp_state(__state);
++
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __c_locale __old = __uselocale(_M_c_locale_codecvt);
++#endif
++
++    // mbsnrtowcs is *very* fast but stops if encounters NUL characters:
++    // in case we store a L'\0' and then continue, in a loop.
++    // NB: mbsnrtowcs is a GNU extension
++    for (__from_next = __from, __to_next = __to;
++	 __from_next < __from_end && __to_next < __to_end
++	 && __ret == ok;)
++      {
++	const extern_type* __from_chunk_end;
++	__from_chunk_end = static_cast<const extern_type*>(memchr(__from_next, '\0',
++								  __from_end
++								  - __from_next));
++	if (!__from_chunk_end)
++	  __from_chunk_end = __from_end;
++
++	__from = __from_next;
++	size_t __conv = mbsnrtowcs(__to_next, &__from_next,
++				   __from_chunk_end - __from_next,
++				   __to_end - __to_next, &__state);
++	if (__conv == static_cast<size_t>(-1))
++	  {
++	    // In case of error, in order to stop at the exact place we
++	    // have to start again from the beginning with a series of
++	    // mbrtowc.
++	    for (;; ++__to_next, __from += __conv)
++	      {
++		__conv = mbrtowc(__to_next, __from, __from_end - __from,
++				 &__tmp_state);
++		if (__conv == static_cast<size_t>(-1)
++		    || __conv == static_cast<size_t>(-2))
++		  break;
++	      }
++	    __from_next = __from;
++	    __state = __tmp_state;
++	    __ret = error;
++	  }
++	else if (__from_next && __from_next < __from_chunk_end)
++	  {
++	    // It is unclear what to return in this case (see DR 382).
++	    __to_next += __conv;
++	    __ret = partial;
++	  }
++	else
++	  {
++	    __from_next = __from_chunk_end;
++	    __to_next += __conv;
++	  }
++
++	if (__from_next < __from_end && __ret == ok)
++	  {
++	    if (__to_next < __to_end)
++	      {
++		// XXX Probably wrong for stateful encodings
++		__tmp_state = __state;
++		++__from_next;
++		*__to_next++ = L'\0';
++	      }
++	    else
++	      __ret = partial;
++	  }
++      }
++
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __uselocale(__old);
++#endif
++
++    return __ret;
++  }
++
++  int
++  codecvt<wchar_t, char, mbstate_t>::
++  do_encoding() const throw()
++  {
++    // XXX This implementation assumes that the encoding is
++    // stateless and is either single-byte or variable-width.
++    int __ret = 0;
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __c_locale __old = __uselocale(_M_c_locale_codecvt);
++#endif
++    if (MB_CUR_MAX == 1)
++      __ret = 1;
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __uselocale(__old);
++#endif
++    return __ret;
++  }
++
++  int
++  codecvt<wchar_t, char, mbstate_t>::
++  do_max_length() const throw()
++  {
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __c_locale __old = __uselocale(_M_c_locale_codecvt);
++#endif
++    // XXX Probably wrong for stateful encodings.
++    int __ret = MB_CUR_MAX;
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __uselocale(__old);
++#endif
++    return __ret;
++  }
++
++  int
++  codecvt<wchar_t, char, mbstate_t>::
++  do_length(state_type& __state, const extern_type* __from,
++	    const extern_type* __end, size_t __max) const
++  {
++    int __ret = 0;
++    state_type __tmp_state(__state);
++
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __c_locale __old = __uselocale(_M_c_locale_codecvt);
++#endif
++
++    // mbsnrtowcs is *very* fast but stops if encounters NUL characters:
++    // in case we advance past it and then continue, in a loop.
++    // NB: mbsnrtowcs is a GNU extension
++
++    // A dummy internal buffer is needed in order for mbsnrtocws to consider
++    // its fourth parameter (it wouldn't with NULL as first parameter).
++    wchar_t* __to = static_cast<wchar_t*>(__builtin_alloca(sizeof(wchar_t)
++							   * __max));
++    while (__from < __end && __max)
++      {
++	const extern_type* __from_chunk_end;
++	__from_chunk_end = static_cast<const extern_type*>(memchr(__from, '\0',
++								  __end
++								  - __from));
++	if (!__from_chunk_end)
++	  __from_chunk_end = __end;
++
++	const extern_type* __tmp_from = __from;
++	size_t __conv = mbsnrtowcs(__to, &__from,
++				   __from_chunk_end - __from,
++				   __max, &__state);
++	if (__conv == static_cast<size_t>(-1))
++	  {
++	    // In case of error, in order to stop at the exact place we
++	    // have to start again from the beginning with a series of
++	    // mbrtowc.
++	    for (__from = __tmp_from;; __from += __conv)
++	      {
++		__conv = mbrtowc(NULL, __from, __end - __from,
++				 &__tmp_state);
++		if (__conv == static_cast<size_t>(-1)
++		    || __conv == static_cast<size_t>(-2))
++		  break;
++	      }
++	    __state = __tmp_state;
++	    __ret += __from - __tmp_from;
++	    break;
++	  }
++	if (!__from)
++	  __from = __from_chunk_end;
++
++	__ret += __from - __tmp_from;
++	__max -= __conv;
++
++	if (__from < __end && __max)
++	  {
++	    // XXX Probably wrong for stateful encodings
++	    __tmp_state = __state;
++	    ++__from;
++	    ++__ret;
++	    --__max;
++	  }
++      }
++
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __uselocale(__old);
++#endif
++
++    return __ret;
++  }
++#endif
++}
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/collate_members.cc
+===================================================================
+--- /dev/null
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/collate_members.cc
+@@ -0,0 +1,80 @@
++// std::collate implementation details, GNU version -*- C++ -*-
++
++// Copyright (C) 2001, 2002 Free Software Foundation, Inc.
++//
++// This file is part of the GNU ISO C++ Library.  This library is free
++// software; you can redistribute it and/or modify it under the
++// terms of the GNU General Public License as published by the
++// Free Software Foundation; either version 2, or (at your option)
++// any later version.
++
++// This library is distributed in the hope that it will be useful,
++// but WITHOUT ANY WARRANTY; without even the implied warranty of
++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++// GNU General Public License for more details.
++
++// You should have received a copy of the GNU General Public License along
++// with this library; see the file COPYING.  If not, write to the Free
++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
++// USA.
++
++// As a special exception, you may use this file as part of a free software
++// library without restriction.  Specifically, if other files instantiate
++// templates or use macros or inline functions from this file, or you compile
++// this file and link it with other files to produce an executable, this
++// file does not by itself cause the resulting executable to be covered by
++// the GNU General Public License.  This exception does not however
++// invalidate any other reasons why the executable file might be covered by
++// the GNU General Public License.
++
++//
++// ISO C++ 14882: 22.2.4.1.2  collate virtual functions
++//
++
++// Written by Benjamin Kosnik <bkoz@redhat.com>
++
++#include <locale>
++#include <bits/c++locale_internal.h>
++
++#ifndef __UCLIBC_HAS_XLOCALE__
++#define __strcoll_l(S1, S2, L)      strcoll((S1), (S2))
++#define __strxfrm_l(S1, S2, N, L)   strxfrm((S1), (S2), (N))
++#define __wcscoll_l(S1, S2, L)      wcscoll((S1), (S2))
++#define __wcsxfrm_l(S1, S2, N, L)   wcsxfrm((S1), (S2), (N))
++#endif
++
++namespace std
++{
++  // These are basically extensions to char_traits, and perhaps should
++  // be put there instead of here.
++  template<>
++    int
++    collate<char>::_M_compare(const char* __one, const char* __two) const
++    {
++      int __cmp = __strcoll_l(__one, __two, _M_c_locale_collate);
++      return (__cmp >> (8 * sizeof (int) - 2)) | (__cmp != 0);
++    }
++
++  template<>
++    size_t
++    collate<char>::_M_transform(char* __to, const char* __from,
++				size_t __n) const
++    { return __strxfrm_l(__to, __from, __n, _M_c_locale_collate); }
++
++#ifdef _GLIBCXX_USE_WCHAR_T
++  template<>
++    int
++    collate<wchar_t>::_M_compare(const wchar_t* __one,
++				 const wchar_t* __two) const
++    {
++      int __cmp = __wcscoll_l(__one, __two, _M_c_locale_collate);
++      return (__cmp >> (8 * sizeof (int) - 2)) | (__cmp != 0);
++    }
++
++  template<>
++    size_t
++    collate<wchar_t>::_M_transform(wchar_t* __to, const wchar_t* __from,
++				   size_t __n) const
++    { return __wcsxfrm_l(__to, __from, __n, _M_c_locale_collate); }
++#endif
++}
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/ctype_members.cc
+===================================================================
+--- /dev/null
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/ctype_members.cc
+@@ -0,0 +1,300 @@
++// std::ctype implementation details, GNU version -*- C++ -*-
++
++// Copyright (C) 2001, 2002, 2003, 2004 Free Software Foundation, Inc.
++//
++// This file is part of the GNU ISO C++ Library.  This library is free
++// software; you can redistribute it and/or modify it under the
++// terms of the GNU General Public License as published by the
++// Free Software Foundation; either version 2, or (at your option)
++// any later version.
++
++// This library is distributed in the hope that it will be useful,
++// but WITHOUT ANY WARRANTY; without even the implied warranty of
++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++// GNU General Public License for more details.
++
++// You should have received a copy of the GNU General Public License along
++// with this library; see the file COPYING.  If not, write to the Free
++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
++// USA.
++
++// As a special exception, you may use this file as part of a free software
++// library without restriction.  Specifically, if other files instantiate
++// templates or use macros or inline functions from this file, or you compile
++// this file and link it with other files to produce an executable, this
++// file does not by itself cause the resulting executable to be covered by
++// the GNU General Public License.  This exception does not however
++// invalidate any other reasons why the executable file might be covered by
++// the GNU General Public License.
++
++//
++// ISO C++ 14882: 22.2.1.1.2  ctype virtual functions.
++//
++
++// Written by Benjamin Kosnik <bkoz@redhat.com>
++
++#define _LIBC
++#include <locale>
++#undef _LIBC
++#include <bits/c++locale_internal.h>
++
++#ifndef __UCLIBC_HAS_XLOCALE__
++#define __wctype_l(S, L)           wctype((S))
++#define __towupper_l(C, L)         towupper((C))
++#define __towlower_l(C, L)         towlower((C))
++#define __iswctype_l(C, M, L)      iswctype((C), (M))
++#endif
++
++namespace std
++{
++  // NB: The other ctype<char> specializations are in src/locale.cc and
++  // various /config/os/* files.
++  template<>
++    ctype_byname<char>::ctype_byname(const char* __s, size_t __refs)
++    : ctype<char>(0, false, __refs)
++    {
++      if (std::strcmp(__s, "C") != 0 && std::strcmp(__s, "POSIX") != 0)
++	{
++	  this->_S_destroy_c_locale(this->_M_c_locale_ctype);
++	  this->_S_create_c_locale(this->_M_c_locale_ctype, __s);
++#ifdef __UCLIBC_HAS_XLOCALE__
++	  this->_M_toupper = this->_M_c_locale_ctype->__ctype_toupper;
++	  this->_M_tolower = this->_M_c_locale_ctype->__ctype_tolower;
++	  this->_M_table = this->_M_c_locale_ctype->__ctype_b;
++#endif
++	}
++    }
++
++#ifdef _GLIBCXX_USE_WCHAR_T
++  ctype<wchar_t>::__wmask_type
++  ctype<wchar_t>::_M_convert_to_wmask(const mask __m) const
++  {
++    __wmask_type __ret;
++    switch (__m)
++      {
++      case space:
++	__ret = __wctype_l("space", _M_c_locale_ctype);
++	break;
++      case print:
++	__ret = __wctype_l("print", _M_c_locale_ctype);
++	break;
++      case cntrl:
++	__ret = __wctype_l("cntrl", _M_c_locale_ctype);
++	break;
++      case upper:
++	__ret = __wctype_l("upper", _M_c_locale_ctype);
++	break;
++      case lower:
++	__ret = __wctype_l("lower", _M_c_locale_ctype);
++	break;
++      case alpha:
++	__ret = __wctype_l("alpha", _M_c_locale_ctype);
++	break;
++      case digit:
++	__ret = __wctype_l("digit", _M_c_locale_ctype);
++	break;
++      case punct:
++	__ret = __wctype_l("punct", _M_c_locale_ctype);
++	break;
++      case xdigit:
++	__ret = __wctype_l("xdigit", _M_c_locale_ctype);
++	break;
++      case alnum:
++	__ret = __wctype_l("alnum", _M_c_locale_ctype);
++	break;
++      case graph:
++	__ret = __wctype_l("graph", _M_c_locale_ctype);
++	break;
++      default:
++	__ret = __wmask_type();
++      }
++    return __ret;
++  }
++
++  wchar_t
++  ctype<wchar_t>::do_toupper(wchar_t __c) const
++  { return __towupper_l(__c, _M_c_locale_ctype); }
++
++  const wchar_t*
++  ctype<wchar_t>::do_toupper(wchar_t* __lo, const wchar_t* __hi) const
++  {
++    while (__lo < __hi)
++      {
++        *__lo = __towupper_l(*__lo, _M_c_locale_ctype);
++        ++__lo;
++      }
++    return __hi;
++  }
++
++  wchar_t
++  ctype<wchar_t>::do_tolower(wchar_t __c) const
++  { return __towlower_l(__c, _M_c_locale_ctype); }
++
++  const wchar_t*
++  ctype<wchar_t>::do_tolower(wchar_t* __lo, const wchar_t* __hi) const
++  {
++    while (__lo < __hi)
++      {
++        *__lo = __towlower_l(*__lo, _M_c_locale_ctype);
++        ++__lo;
++      }
++    return __hi;
++  }
++
++  bool
++  ctype<wchar_t>::
++  do_is(mask __m, wchar_t __c) const
++  {
++    // Highest bitmask in ctype_base == 10, but extra in "C"
++    // library for blank.
++    bool __ret = false;
++    const size_t __bitmasksize = 11;
++    for (size_t __bitcur = 0; __bitcur <= __bitmasksize; ++__bitcur)
++      if (__m & _M_bit[__bitcur]
++	  && __iswctype_l(__c, _M_wmask[__bitcur], _M_c_locale_ctype))
++	{
++	  __ret = true;
++	  break;
++	}
++    return __ret;
++  }
++
++  const wchar_t*
++  ctype<wchar_t>::
++  do_is(const wchar_t* __lo, const wchar_t* __hi, mask* __vec) const
++  {
++    for (; __lo < __hi; ++__vec, ++__lo)
++      {
++	// Highest bitmask in ctype_base == 10, but extra in "C"
++	// library for blank.
++	const size_t __bitmasksize = 11;
++	mask __m = 0;
++	for (size_t __bitcur = 0; __bitcur <= __bitmasksize; ++__bitcur)
++	  if (__iswctype_l(*__lo, _M_wmask[__bitcur], _M_c_locale_ctype))
++	    __m |= _M_bit[__bitcur];
++	*__vec = __m;
++      }
++    return __hi;
++  }
++
++  const wchar_t*
++  ctype<wchar_t>::
++  do_scan_is(mask __m, const wchar_t* __lo, const wchar_t* __hi) const
++  {
++    while (__lo < __hi && !this->do_is(__m, *__lo))
++      ++__lo;
++    return __lo;
++  }
++
++  const wchar_t*
++  ctype<wchar_t>::
++  do_scan_not(mask __m, const char_type* __lo, const char_type* __hi) const
++  {
++    while (__lo < __hi && this->do_is(__m, *__lo) != 0)
++      ++__lo;
++    return __lo;
++  }
++
++  wchar_t
++  ctype<wchar_t>::
++  do_widen(char __c) const
++  { return _M_widen[static_cast<unsigned char>(__c)]; }
++
++  const char*
++  ctype<wchar_t>::
++  do_widen(const char* __lo, const char* __hi, wchar_t* __dest) const
++  {
++    while (__lo < __hi)
++      {
++	*__dest = _M_widen[static_cast<unsigned char>(*__lo)];
++	++__lo;
++	++__dest;
++      }
++    return __hi;
++  }
++
++  char
++  ctype<wchar_t>::
++  do_narrow(wchar_t __wc, char __dfault) const
++  {
++    if (__wc >= 0 && __wc < 128 && _M_narrow_ok)
++      return _M_narrow[__wc];
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __c_locale __old = __uselocale(_M_c_locale_ctype);
++#endif
++    const int __c = wctob(__wc);
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __uselocale(__old);
++#endif
++    return (__c == EOF ? __dfault : static_cast<char>(__c));
++  }
++
++  const wchar_t*
++  ctype<wchar_t>::
++  do_narrow(const wchar_t* __lo, const wchar_t* __hi, char __dfault,
++	    char* __dest) const
++  {
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __c_locale __old = __uselocale(_M_c_locale_ctype);
++#endif
++    if (_M_narrow_ok)
++      while (__lo < __hi)
++	{
++	  if (*__lo >= 0 && *__lo < 128)
++	    *__dest = _M_narrow[*__lo];
++	  else
++	    {
++	      const int __c = wctob(*__lo);
++	      *__dest = (__c == EOF ? __dfault : static_cast<char>(__c));
++	    }
++	  ++__lo;
++	  ++__dest;
++	}
++    else
++      while (__lo < __hi)
++	{
++	  const int __c = wctob(*__lo);
++	  *__dest = (__c == EOF ? __dfault : static_cast<char>(__c));
++	  ++__lo;
++	  ++__dest;
++	}
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __uselocale(__old);
++#endif
++    return __hi;
++  }
++
++  void
++  ctype<wchar_t>::_M_initialize_ctype()
++  {
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __c_locale __old = __uselocale(_M_c_locale_ctype);
++#endif
++    wint_t __i;
++    for (__i = 0; __i < 128; ++__i)
++      {
++	const int __c = wctob(__i);
++	if (__c == EOF)
++	  break;
++	else
++	  _M_narrow[__i] = static_cast<char>(__c);
++      }
++    if (__i == 128)
++      _M_narrow_ok = true;
++    else
++      _M_narrow_ok = false;
++    for (size_t __j = 0;
++	 __j < sizeof(_M_widen) / sizeof(wint_t); ++__j)
++      _M_widen[__j] = btowc(__j);
++
++    for (size_t __k = 0; __k <= 11; ++__k)
++      {
++	_M_bit[__k] = static_cast<mask>(_ISbit(__k));
++	_M_wmask[__k] = _M_convert_to_wmask(_M_bit[__k]);
++      }
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __uselocale(__old);
++#endif
++  }
++#endif //  _GLIBCXX_USE_WCHAR_T
++}
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/messages_members.cc
+===================================================================
+--- /dev/null
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/messages_members.cc
+@@ -0,0 +1,100 @@
++// std::messages implementation details, GNU version -*- C++ -*-
++
++// Copyright (C) 2001, 2002 Free Software Foundation, Inc.
++//
++// This file is part of the GNU ISO C++ Library.  This library is free
++// software; you can redistribute it and/or modify it under the
++// terms of the GNU General Public License as published by the
++// Free Software Foundation; either version 2, or (at your option)
++// any later version.
++
++// This library is distributed in the hope that it will be useful,
++// but WITHOUT ANY WARRANTY; without even the implied warranty of
++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++// GNU General Public License for more details.
++
++// You should have received a copy of the GNU General Public License along
++// with this library; see the file COPYING.  If not, write to the Free
++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
++// USA.
++
++// As a special exception, you may use this file as part of a free software
++// library without restriction.  Specifically, if other files instantiate
++// templates or use macros or inline functions from this file, or you compile
++// this file and link it with other files to produce an executable, this
++// file does not by itself cause the resulting executable to be covered by
++// the GNU General Public License.  This exception does not however
++// invalidate any other reasons why the executable file might be covered by
++// the GNU General Public License.
++
++//
++// ISO C++ 14882: 22.2.7.1.2  messages virtual functions
++//
++
++// Written by Benjamin Kosnik <bkoz@redhat.com>
++
++#include <locale>
++#include <bits/c++locale_internal.h>
++
++#ifdef __UCLIBC_MJN3_ONLY__
++#warning fix gettext stuff
++#endif
++#ifdef __UCLIBC_HAS_GETTEXT_AWARENESS__
++extern "C" char *__dcgettext(const char *domainname,
++			     const char *msgid, int category);
++#undef gettext
++#define gettext(msgid) __dcgettext(NULL, msgid, LC_MESSAGES)
++#else
++#undef gettext
++#define gettext(msgid) (msgid)
++#endif
++
++namespace std
++{
++  // Specializations.
++  template<>
++    string
++    messages<char>::do_get(catalog, int, int, const string& __dfault) const
++    {
++#ifdef __UCLIBC_HAS_XLOCALE__
++      __c_locale __old = __uselocale(_M_c_locale_messages);
++      const char* __msg = const_cast<const char*>(gettext(__dfault.c_str()));
++      __uselocale(__old);
++      return string(__msg);
++#elif defined __UCLIBC_HAS_LOCALE__
++      char* __old = strdup(setlocale(LC_ALL, NULL));
++      setlocale(LC_ALL, _M_name_messages);
++      const char* __msg = gettext(__dfault.c_str());
++      setlocale(LC_ALL, __old);
++      free(__old);
++      return string(__msg);
++#else
++      const char* __msg = gettext(__dfault.c_str());
++      return string(__msg);
++#endif
++    }
++
++#ifdef _GLIBCXX_USE_WCHAR_T
++  template<>
++    wstring
++    messages<wchar_t>::do_get(catalog, int, int, const wstring& __dfault) const
++    {
++# ifdef __UCLIBC_HAS_XLOCALE__
++      __c_locale __old = __uselocale(_M_c_locale_messages);
++      char* __msg = gettext(_M_convert_to_char(__dfault));
++      __uselocale(__old);
++      return _M_convert_from_char(__msg);
++# elif defined __UCLIBC_HAS_LOCALE__
++      char* __old = strdup(setlocale(LC_ALL, NULL));
++      setlocale(LC_ALL, _M_name_messages);
++      char* __msg = gettext(_M_convert_to_char(__dfault));
++      setlocale(LC_ALL, __old);
++      free(__old);
++      return _M_convert_from_char(__msg);
++# else
++      char* __msg = gettext(_M_convert_to_char(__dfault));
++      return _M_convert_from_char(__msg);
++# endif
++    }
++#endif
++}
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/messages_members.h
+===================================================================
+--- /dev/null
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/messages_members.h
+@@ -0,0 +1,118 @@
++// std::messages implementation details, GNU version -*- C++ -*-
++
++// Copyright (C) 2001, 2002, 2003, 2004 Free Software Foundation, Inc.
++//
++// This file is part of the GNU ISO C++ Library.  This library is free
++// software; you can redistribute it and/or modify it under the
++// terms of the GNU General Public License as published by the
++// Free Software Foundation; either version 2, or (at your option)
++// any later version.
++
++// This library is distributed in the hope that it will be useful,
++// but WITHOUT ANY WARRANTY; without even the implied warranty of
++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++// GNU General Public License for more details.
++
++// You should have received a copy of the GNU General Public License along
++// with this library; see the file COPYING.  If not, write to the Free
++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
++// USA.
++
++// As a special exception, you may use this file as part of a free software
++// library without restriction.  Specifically, if other files instantiate
++// templates or use macros or inline functions from this file, or you compile
++// this file and link it with other files to produce an executable, this
++// file does not by itself cause the resulting executable to be covered by
++// the GNU General Public License.  This exception does not however
++// invalidate any other reasons why the executable file might be covered by
++// the GNU General Public License.
++
++//
++// ISO C++ 14882: 22.2.7.1.2  messages functions
++//
++
++// Written by Benjamin Kosnik <bkoz@redhat.com>
++
++#ifdef __UCLIBC_MJN3_ONLY__
++#warning fix prototypes for *textdomain funcs
++#endif
++#ifdef __UCLIBC_HAS_GETTEXT_AWARENESS__
++extern "C" char *__textdomain(const char *domainname);
++extern "C" char *__bindtextdomain(const char *domainname,
++				  const char *dirname);
++#else
++#undef __textdomain
++#undef __bindtextdomain
++#define __textdomain(D)           ((void)0)
++#define __bindtextdomain(D,P)     ((void)0)
++#endif
++
++  // Non-virtual member functions.
++  template<typename _CharT>
++     messages<_CharT>::messages(size_t __refs)
++     : facet(__refs), _M_c_locale_messages(_S_get_c_locale()),
++     _M_name_messages(_S_get_c_name())
++     { }
++
++  template<typename _CharT>
++     messages<_CharT>::messages(__c_locale __cloc, const char* __s,
++				size_t __refs)
++     : facet(__refs), _M_c_locale_messages(_S_clone_c_locale(__cloc)),
++     _M_name_messages(__s)
++     {
++       char* __tmp = new char[std::strlen(__s) + 1];
++       std::strcpy(__tmp, __s);
++       _M_name_messages = __tmp;
++     }
++
++  template<typename _CharT>
++    typename messages<_CharT>::catalog
++    messages<_CharT>::open(const basic_string<char>& __s, const locale& __loc,
++			   const char* __dir) const
++    {
++      __bindtextdomain(__s.c_str(), __dir);
++      return this->do_open(__s, __loc);
++    }
++
++  // Virtual member functions.
++  template<typename _CharT>
++    messages<_CharT>::~messages()
++    {
++      if (_M_name_messages != _S_get_c_name())
++	delete [] _M_name_messages;
++      _S_destroy_c_locale(_M_c_locale_messages);
++    }
++
++  template<typename _CharT>
++    typename messages<_CharT>::catalog
++    messages<_CharT>::do_open(const basic_string<char>& __s,
++			      const locale&) const
++    {
++      // No error checking is done, assume the catalog exists and can
++      // be used.
++      __textdomain(__s.c_str());
++      return 0;
++    }
++
++  template<typename _CharT>
++    void
++    messages<_CharT>::do_close(catalog) const
++    { }
++
++   // messages_byname
++   template<typename _CharT>
++     messages_byname<_CharT>::messages_byname(const char* __s, size_t __refs)
++     : messages<_CharT>(__refs)
++     {
++       if (this->_M_name_messages != locale::facet::_S_get_c_name())
++	 delete [] this->_M_name_messages;
++       char* __tmp = new char[std::strlen(__s) + 1];
++       std::strcpy(__tmp, __s);
++       this->_M_name_messages = __tmp;
++
++       if (std::strcmp(__s, "C") != 0 && std::strcmp(__s, "POSIX") != 0)
++	 {
++	   this->_S_destroy_c_locale(this->_M_c_locale_messages);
++	   this->_S_create_c_locale(this->_M_c_locale_messages, __s);
++	 }
++     }
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/monetary_members.cc
+===================================================================
+--- /dev/null
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/monetary_members.cc
+@@ -0,0 +1,692 @@
++// std::moneypunct implementation details, GNU version -*- C++ -*-
++
++// Copyright (C) 2001, 2002, 2003, 2004 Free Software Foundation, Inc.
++//
++// This file is part of the GNU ISO C++ Library.  This library is free
++// software; you can redistribute it and/or modify it under the
++// terms of the GNU General Public License as published by the
++// Free Software Foundation; either version 2, or (at your option)
++// any later version.
++
++// This library is distributed in the hope that it will be useful,
++// but WITHOUT ANY WARRANTY; without even the implied warranty of
++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++// GNU General Public License for more details.
++
++// You should have received a copy of the GNU General Public License along
++// with this library; see the file COPYING.  If not, write to the Free
++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
++// USA.
++
++// As a special exception, you may use this file as part of a free software
++// library without restriction.  Specifically, if other files instantiate
++// templates or use macros or inline functions from this file, or you compile
++// this file and link it with other files to produce an executable, this
++// file does not by itself cause the resulting executable to be covered by
++// the GNU General Public License.  This exception does not however
++// invalidate any other reasons why the executable file might be covered by
++// the GNU General Public License.
++
++//
++// ISO C++ 14882: 22.2.6.3.2  moneypunct virtual functions
++//
++
++// Written by Benjamin Kosnik <bkoz@redhat.com>
++
++#define _LIBC
++#include <locale>
++#undef _LIBC
++#include <bits/c++locale_internal.h>
++
++#ifdef __UCLIBC_MJN3_ONLY__
++#warning optimize this for uclibc
++#warning tailor for stub locale support
++#endif
++
++#ifndef __UCLIBC_HAS_XLOCALE__
++#define __nl_langinfo_l(N, L)         nl_langinfo((N))
++#endif
++
++namespace std
++{
++  // Construct and return valid pattern consisting of some combination of:
++  // space none symbol sign value
++  money_base::pattern
++  money_base::_S_construct_pattern(char __precedes, char __space, char __posn)
++  {
++    pattern __ret;
++
++    // This insanely complicated routine attempts to construct a valid
++    // pattern for use with monyepunct. A couple of invariants:
++
++    // if (__precedes) symbol -> value
++    // else value -> symbol
++
++    // if (__space) space
++    // else none
++
++    // none == never first
++    // space never first or last
++
++    // Any elegant implementations of this are welcome.
++    switch (__posn)
++      {
++      case 0:
++      case 1:
++	// 1 The sign precedes the value and symbol.
++	__ret.field[0] = sign;
++	if (__space)
++	  {
++	    // Pattern starts with sign.
++	    if (__precedes)
++	      {
++		__ret.field[1] = symbol;
++		__ret.field[3] = value;
++	      }
++	    else
++	      {
++		__ret.field[1] = value;
++		__ret.field[3] = symbol;
++	      }
++	    __ret.field[2] = space;
++	  }
++	else
++	  {
++	    // Pattern starts with sign and ends with none.
++	    if (__precedes)
++	      {
++		__ret.field[1] = symbol;
++		__ret.field[2] = value;
++	      }
++	    else
++	      {
++		__ret.field[1] = value;
++		__ret.field[2] = symbol;
++	      }
++	    __ret.field[3] = none;
++	  }
++	break;
++      case 2:
++	// 2 The sign follows the value and symbol.
++	if (__space)
++	  {
++	    // Pattern either ends with sign.
++	    if (__precedes)
++	      {
++		__ret.field[0] = symbol;
++		__ret.field[2] = value;
++	      }
++	    else
++	      {
++		__ret.field[0] = value;
++		__ret.field[2] = symbol;
++	      }
++	    __ret.field[1] = space;
++	    __ret.field[3] = sign;
++	  }
++	else
++	  {
++	    // Pattern ends with sign then none.
++	    if (__precedes)
++	      {
++		__ret.field[0] = symbol;
++		__ret.field[1] = value;
++	      }
++	    else
++	      {
++		__ret.field[0] = value;
++		__ret.field[1] = symbol;
++	      }
++	    __ret.field[2] = sign;
++	    __ret.field[3] = none;
++	  }
++	break;
++      case 3:
++	// 3 The sign immediately precedes the symbol.
++	if (__precedes)
++	  {
++	    __ret.field[0] = sign;
++	    __ret.field[1] = symbol;
++	    if (__space)
++	      {
++		__ret.field[2] = space;
++		__ret.field[3] = value;
++	      }
++	    else
++	      {
++		__ret.field[2] = value;
++		__ret.field[3] = none;
++	      }
++	  }
++	else
++	  {
++	    __ret.field[0] = value;
++	    if (__space)
++	      {
++		__ret.field[1] = space;
++		__ret.field[2] = sign;
++		__ret.field[3] = symbol;
++	      }
++	    else
++	      {
++		__ret.field[1] = sign;
++		__ret.field[2] = symbol;
++		__ret.field[3] = none;
++	      }
++	  }
++	break;
++      case 4:
++	// 4 The sign immediately follows the symbol.
++	if (__precedes)
++	  {
++	    __ret.field[0] = symbol;
++	    __ret.field[1] = sign;
++	    if (__space)
++	      {
++		__ret.field[2] = space;
++		__ret.field[3] = value;
++	      }
++	    else
++	      {
++		__ret.field[2] = value;
++		__ret.field[3] = none;
++	      }
++	  }
++	else
++	  {
++	    __ret.field[0] = value;
++	    if (__space)
++	      {
++		__ret.field[1] = space;
++		__ret.field[2] = symbol;
++		__ret.field[3] = sign;
++	      }
++	    else
++	      {
++		__ret.field[1] = symbol;
++		__ret.field[2] = sign;
++		__ret.field[3] = none;
++	      }
++	  }
++	break;
++      default:
++	;
++      }
++    return __ret;
++  }
++
++  template<>
++    void
++    moneypunct<char, true>::_M_initialize_moneypunct(__c_locale __cloc,
++						     const char*)
++    {
++      if (!_M_data)
++	_M_data = new __moneypunct_cache<char, true>;
++
++      if (!__cloc)
++	{
++	  // "C" locale
++	  _M_data->_M_decimal_point = '.';
++	  _M_data->_M_thousands_sep = ',';
++	  _M_data->_M_grouping = "";
++	  _M_data->_M_grouping_size = 0;
++	  _M_data->_M_curr_symbol = "";
++	  _M_data->_M_curr_symbol_size = 0;
++	  _M_data->_M_positive_sign = "";
++	  _M_data->_M_positive_sign_size = 0;
++	  _M_data->_M_negative_sign = "";
++	  _M_data->_M_negative_sign_size = 0;
++	  _M_data->_M_frac_digits = 0;
++	  _M_data->_M_pos_format = money_base::_S_default_pattern;
++	  _M_data->_M_neg_format = money_base::_S_default_pattern;
++
++	  for (size_t __i = 0; __i < money_base::_S_end; ++__i)
++	    _M_data->_M_atoms[__i] = money_base::_S_atoms[__i];
++	}
++      else
++	{
++	  // Named locale.
++	  _M_data->_M_decimal_point = *(__nl_langinfo_l(__MON_DECIMAL_POINT,
++							__cloc));
++	  _M_data->_M_thousands_sep = *(__nl_langinfo_l(__MON_THOUSANDS_SEP,
++							__cloc));
++	  _M_data->_M_grouping = __nl_langinfo_l(__MON_GROUPING, __cloc);
++	  _M_data->_M_grouping_size = strlen(_M_data->_M_grouping);
++	  _M_data->_M_positive_sign = __nl_langinfo_l(__POSITIVE_SIGN, __cloc);
++	  _M_data->_M_positive_sign_size = strlen(_M_data->_M_positive_sign);
++
++	  char __nposn = *(__nl_langinfo_l(__INT_N_SIGN_POSN, __cloc));
++	  if (!__nposn)
++	    _M_data->_M_negative_sign = "()";
++	  else
++	    _M_data->_M_negative_sign = __nl_langinfo_l(__NEGATIVE_SIGN,
++							__cloc);
++	  _M_data->_M_negative_sign_size = strlen(_M_data->_M_negative_sign);
++
++	  // _Intl == true
++	  _M_data->_M_curr_symbol = __nl_langinfo_l(__INT_CURR_SYMBOL, __cloc);
++	  _M_data->_M_curr_symbol_size = strlen(_M_data->_M_curr_symbol);
++	  _M_data->_M_frac_digits = *(__nl_langinfo_l(__INT_FRAC_DIGITS,
++						      __cloc));
++	  char __pprecedes = *(__nl_langinfo_l(__INT_P_CS_PRECEDES, __cloc));
++	  char __pspace = *(__nl_langinfo_l(__INT_P_SEP_BY_SPACE, __cloc));
++	  char __pposn = *(__nl_langinfo_l(__INT_P_SIGN_POSN, __cloc));
++	  _M_data->_M_pos_format = _S_construct_pattern(__pprecedes, __pspace,
++							__pposn);
++	  char __nprecedes = *(__nl_langinfo_l(__INT_N_CS_PRECEDES, __cloc));
++	  char __nspace = *(__nl_langinfo_l(__INT_N_SEP_BY_SPACE, __cloc));
++	  _M_data->_M_neg_format = _S_construct_pattern(__nprecedes, __nspace,
++							__nposn);
++	}
++    }
++
++  template<>
++    void
++    moneypunct<char, false>::_M_initialize_moneypunct(__c_locale __cloc,
++						      const char*)
++    {
++      if (!_M_data)
++	_M_data = new __moneypunct_cache<char, false>;
++
++      if (!__cloc)
++	{
++	  // "C" locale
++	  _M_data->_M_decimal_point = '.';
++	  _M_data->_M_thousands_sep = ',';
++	  _M_data->_M_grouping = "";
++	  _M_data->_M_grouping_size = 0;
++	  _M_data->_M_curr_symbol = "";
++	  _M_data->_M_curr_symbol_size = 0;
++	  _M_data->_M_positive_sign = "";
++	  _M_data->_M_positive_sign_size = 0;
++	  _M_data->_M_negative_sign = "";
++	  _M_data->_M_negative_sign_size = 0;
++	  _M_data->_M_frac_digits = 0;
++	  _M_data->_M_pos_format = money_base::_S_default_pattern;
++	  _M_data->_M_neg_format = money_base::_S_default_pattern;
++
++	  for (size_t __i = 0; __i < money_base::_S_end; ++__i)
++	    _M_data->_M_atoms[__i] = money_base::_S_atoms[__i];
++	}
++      else
++	{
++	  // Named locale.
++	  _M_data->_M_decimal_point = *(__nl_langinfo_l(__MON_DECIMAL_POINT,
++							__cloc));
++	  _M_data->_M_thousands_sep = *(__nl_langinfo_l(__MON_THOUSANDS_SEP,
++							__cloc));
++	  _M_data->_M_grouping = __nl_langinfo_l(__MON_GROUPING, __cloc);
++	  _M_data->_M_grouping_size = strlen(_M_data->_M_grouping);
++	  _M_data->_M_positive_sign = __nl_langinfo_l(__POSITIVE_SIGN, __cloc);
++	  _M_data->_M_positive_sign_size = strlen(_M_data->_M_positive_sign);
++
++	  char __nposn = *(__nl_langinfo_l(__N_SIGN_POSN, __cloc));
++	  if (!__nposn)
++	    _M_data->_M_negative_sign = "()";
++	  else
++	    _M_data->_M_negative_sign = __nl_langinfo_l(__NEGATIVE_SIGN,
++							__cloc);
++	  _M_data->_M_negative_sign_size = strlen(_M_data->_M_negative_sign);
++
++	  // _Intl == false
++	  _M_data->_M_curr_symbol = __nl_langinfo_l(__CURRENCY_SYMBOL, __cloc);
++	  _M_data->_M_curr_symbol_size = strlen(_M_data->_M_curr_symbol);
++	  _M_data->_M_frac_digits = *(__nl_langinfo_l(__FRAC_DIGITS, __cloc));
++	  char __pprecedes = *(__nl_langinfo_l(__P_CS_PRECEDES, __cloc));
++	  char __pspace = *(__nl_langinfo_l(__P_SEP_BY_SPACE, __cloc));
++	  char __pposn = *(__nl_langinfo_l(__P_SIGN_POSN, __cloc));
++	  _M_data->_M_pos_format = _S_construct_pattern(__pprecedes, __pspace,
++							__pposn);
++	  char __nprecedes = *(__nl_langinfo_l(__N_CS_PRECEDES, __cloc));
++	  char __nspace = *(__nl_langinfo_l(__N_SEP_BY_SPACE, __cloc));
++	  _M_data->_M_neg_format = _S_construct_pattern(__nprecedes, __nspace,
++							__nposn);
++	}
++    }
++
++  template<>
++    moneypunct<char, true>::~moneypunct()
++    { delete _M_data; }
++
++  template<>
++    moneypunct<char, false>::~moneypunct()
++    { delete _M_data; }
++
++#ifdef _GLIBCXX_USE_WCHAR_T
++  template<>
++    void
++    moneypunct<wchar_t, true>::_M_initialize_moneypunct(__c_locale __cloc,
++#ifdef __UCLIBC_HAS_XLOCALE__
++							const char*)
++#else
++							const char* __name)
++#endif
++    {
++      if (!_M_data)
++	_M_data = new __moneypunct_cache<wchar_t, true>;
++
++      if (!__cloc)
++	{
++	  // "C" locale
++	  _M_data->_M_decimal_point = L'.';
++	  _M_data->_M_thousands_sep = L',';
++	  _M_data->_M_grouping = "";
++	  _M_data->_M_grouping_size = 0;
++	  _M_data->_M_curr_symbol = L"";
++	  _M_data->_M_curr_symbol_size = 0;
++	  _M_data->_M_positive_sign = L"";
++	  _M_data->_M_positive_sign_size = 0;
++	  _M_data->_M_negative_sign = L"";
++	  _M_data->_M_negative_sign_size = 0;
++	  _M_data->_M_frac_digits = 0;
++	  _M_data->_M_pos_format = money_base::_S_default_pattern;
++	  _M_data->_M_neg_format = money_base::_S_default_pattern;
++
++	  // Use ctype::widen code without the facet...
++	  for (size_t __i = 0; __i < money_base::_S_end; ++__i)
++	    _M_data->_M_atoms[__i] =
++	      static_cast<wchar_t>(money_base::_S_atoms[__i]);
++	}
++      else
++	{
++	  // Named locale.
++#ifdef __UCLIBC_HAS_XLOCALE__
++	  __c_locale __old = __uselocale(__cloc);
++#else
++	  // Switch to named locale so that mbsrtowcs will work.
++	  char* __old = strdup(setlocale(LC_ALL, NULL));
++	  setlocale(LC_ALL, __name);
++#endif
++
++#ifdef __UCLIBC_MJN3_ONLY__
++#warning fix this... should be monetary
++#endif
++#ifdef __UCLIBC__
++# ifdef __UCLIBC_HAS_XLOCALE__
++	  _M_data->_M_decimal_point = __cloc->decimal_point_wc;
++	  _M_data->_M_thousands_sep = __cloc->thousands_sep_wc;
++# else
++	  _M_data->_M_decimal_point = __global_locale->decimal_point_wc;
++	  _M_data->_M_thousands_sep = __global_locale->thousands_sep_wc;
++# endif
++#else
++	  union { char *__s; wchar_t __w; } __u;
++	  __u.__s = __nl_langinfo_l(_NL_MONETARY_DECIMAL_POINT_WC, __cloc);
++	  _M_data->_M_decimal_point = __u.__w;
++
++	  __u.__s = __nl_langinfo_l(_NL_MONETARY_THOUSANDS_SEP_WC, __cloc);
++	  _M_data->_M_thousands_sep = __u.__w;
++#endif
++	  _M_data->_M_grouping = __nl_langinfo_l(__MON_GROUPING, __cloc);
++	  _M_data->_M_grouping_size = strlen(_M_data->_M_grouping);
++
++	  const char* __cpossign = __nl_langinfo_l(__POSITIVE_SIGN, __cloc);
++	  const char* __cnegsign = __nl_langinfo_l(__NEGATIVE_SIGN, __cloc);
++	  const char* __ccurr = __nl_langinfo_l(__INT_CURR_SYMBOL, __cloc);
++
++	  wchar_t* __wcs_ps = 0;
++	  wchar_t* __wcs_ns = 0;
++	  const char __nposn = *(__nl_langinfo_l(__INT_N_SIGN_POSN, __cloc));
++	  try
++	    {
++	      mbstate_t __state;
++	      size_t __len = strlen(__cpossign);
++	      if (__len)
++		{
++		  ++__len;
++		  memset(&__state, 0, sizeof(mbstate_t));
++		  __wcs_ps = new wchar_t[__len];
++		  mbsrtowcs(__wcs_ps, &__cpossign, __len, &__state);
++		  _M_data->_M_positive_sign = __wcs_ps;
++		}
++	      else
++		_M_data->_M_positive_sign = L"";
++	      _M_data->_M_positive_sign_size = wcslen(_M_data->_M_positive_sign);
++
++	      __len = strlen(__cnegsign);
++	      if (!__nposn)
++		_M_data->_M_negative_sign = L"()";
++	      else if (__len)
++		{
++		  ++__len;
++		  memset(&__state, 0, sizeof(mbstate_t));
++		  __wcs_ns = new wchar_t[__len];
++		  mbsrtowcs(__wcs_ns, &__cnegsign, __len, &__state);
++		  _M_data->_M_negative_sign = __wcs_ns;
++		}
++	      else
++		_M_data->_M_negative_sign = L"";
++	      _M_data->_M_negative_sign_size = wcslen(_M_data->_M_negative_sign);
++
++	      // _Intl == true.
++	      __len = strlen(__ccurr);
++	      if (__len)
++		{
++		  ++__len;
++		  memset(&__state, 0, sizeof(mbstate_t));
++		  wchar_t* __wcs = new wchar_t[__len];
++		  mbsrtowcs(__wcs, &__ccurr, __len, &__state);
++		  _M_data->_M_curr_symbol = __wcs;
++		}
++	      else
++		_M_data->_M_curr_symbol = L"";
++	      _M_data->_M_curr_symbol_size = wcslen(_M_data->_M_curr_symbol);
++	    }
++	  catch (...)
++	    {
++	      delete _M_data;
++	      _M_data = 0;
++	      delete __wcs_ps;
++	      delete __wcs_ns;
++#ifdef __UCLIBC_HAS_XLOCALE__
++	      __uselocale(__old);
++#else
++	      setlocale(LC_ALL, __old);
++	      free(__old);
++#endif
++	      __throw_exception_again;
++	    }
++
++	  _M_data->_M_frac_digits = *(__nl_langinfo_l(__INT_FRAC_DIGITS,
++						      __cloc));
++	  char __pprecedes = *(__nl_langinfo_l(__INT_P_CS_PRECEDES, __cloc));
++	  char __pspace = *(__nl_langinfo_l(__INT_P_SEP_BY_SPACE, __cloc));
++	  char __pposn = *(__nl_langinfo_l(__INT_P_SIGN_POSN, __cloc));
++	  _M_data->_M_pos_format = _S_construct_pattern(__pprecedes, __pspace,
++							__pposn);
++	  char __nprecedes = *(__nl_langinfo_l(__INT_N_CS_PRECEDES, __cloc));
++	  char __nspace = *(__nl_langinfo_l(__INT_N_SEP_BY_SPACE, __cloc));
++	  _M_data->_M_neg_format = _S_construct_pattern(__nprecedes, __nspace,
++							__nposn);
++
++#ifdef __UCLIBC_HAS_XLOCALE__
++	  __uselocale(__old);
++#else
++	  setlocale(LC_ALL, __old);
++	  free(__old);
++#endif
++	}
++    }
++
++  template<>
++  void
++  moneypunct<wchar_t, false>::_M_initialize_moneypunct(__c_locale __cloc,
++#ifdef __UCLIBC_HAS_XLOCALE__
++						       const char*)
++#else
++                                                       const char* __name)
++#endif
++  {
++    if (!_M_data)
++      _M_data = new __moneypunct_cache<wchar_t, false>;
++
++    if (!__cloc)
++	{
++	  // "C" locale
++	  _M_data->_M_decimal_point = L'.';
++	  _M_data->_M_thousands_sep = L',';
++	  _M_data->_M_grouping = "";
++          _M_data->_M_grouping_size = 0;
++	  _M_data->_M_curr_symbol = L"";
++	  _M_data->_M_curr_symbol_size = 0;
++	  _M_data->_M_positive_sign = L"";
++	  _M_data->_M_positive_sign_size = 0;
++	  _M_data->_M_negative_sign = L"";
++	  _M_data->_M_negative_sign_size = 0;
++	  _M_data->_M_frac_digits = 0;
++	  _M_data->_M_pos_format = money_base::_S_default_pattern;
++	  _M_data->_M_neg_format = money_base::_S_default_pattern;
++
++	  // Use ctype::widen code without the facet...
++	  for (size_t __i = 0; __i < money_base::_S_end; ++__i)
++	    _M_data->_M_atoms[__i] =
++	      static_cast<wchar_t>(money_base::_S_atoms[__i]);
++	}
++      else
++	{
++	  // Named locale.
++#ifdef __UCLIBC_HAS_XLOCALE__
++	  __c_locale __old = __uselocale(__cloc);
++#else
++	  // Switch to named locale so that mbsrtowcs will work.
++	  char* __old = strdup(setlocale(LC_ALL, NULL));
++	  setlocale(LC_ALL, __name);
++#endif
++
++#ifdef __UCLIBC_MJN3_ONLY__
++#warning fix this... should be monetary
++#endif
++#ifdef __UCLIBC__
++# ifdef __UCLIBC_HAS_XLOCALE__
++	  _M_data->_M_decimal_point = __cloc->decimal_point_wc;
++	  _M_data->_M_thousands_sep = __cloc->thousands_sep_wc;
++# else
++	  _M_data->_M_decimal_point = __global_locale->decimal_point_wc;
++	  _M_data->_M_thousands_sep = __global_locale->thousands_sep_wc;
++# endif
++#else
++          union { char *__s; wchar_t __w; } __u;
++	  __u.__s = __nl_langinfo_l(_NL_MONETARY_DECIMAL_POINT_WC, __cloc);
++	  _M_data->_M_decimal_point = __u.__w;
++
++	  __u.__s = __nl_langinfo_l(_NL_MONETARY_THOUSANDS_SEP_WC, __cloc);
++	  _M_data->_M_thousands_sep = __u.__w;
++#endif
++	  _M_data->_M_grouping = __nl_langinfo_l(__MON_GROUPING, __cloc);
++          _M_data->_M_grouping_size = strlen(_M_data->_M_grouping);
++
++	  const char* __cpossign = __nl_langinfo_l(__POSITIVE_SIGN, __cloc);
++	  const char* __cnegsign = __nl_langinfo_l(__NEGATIVE_SIGN, __cloc);
++	  const char* __ccurr = __nl_langinfo_l(__CURRENCY_SYMBOL, __cloc);
++
++	  wchar_t* __wcs_ps = 0;
++	  wchar_t* __wcs_ns = 0;
++	  const char __nposn = *(__nl_langinfo_l(__N_SIGN_POSN, __cloc));
++	  try
++            {
++              mbstate_t __state;
++              size_t __len;
++              __len = strlen(__cpossign);
++              if (__len)
++                {
++		  ++__len;
++		  memset(&__state, 0, sizeof(mbstate_t));
++		  __wcs_ps = new wchar_t[__len];
++		  mbsrtowcs(__wcs_ps, &__cpossign, __len, &__state);
++		  _M_data->_M_positive_sign = __wcs_ps;
++		}
++	      else
++		_M_data->_M_positive_sign = L"";
++              _M_data->_M_positive_sign_size = wcslen(_M_data->_M_positive_sign);
++
++	      __len = strlen(__cnegsign);
++	      if (!__nposn)
++		_M_data->_M_negative_sign = L"()";
++	      else if (__len)
++		{
++		  ++__len;
++		  memset(&__state, 0, sizeof(mbstate_t));
++		  __wcs_ns = new wchar_t[__len];
++		  mbsrtowcs(__wcs_ns, &__cnegsign, __len, &__state);
++		  _M_data->_M_negative_sign = __wcs_ns;
++		}
++	      else
++		_M_data->_M_negative_sign = L"";
++              _M_data->_M_negative_sign_size = wcslen(_M_data->_M_negative_sign);
++
++	      // _Intl == true.
++	      __len = strlen(__ccurr);
++	      if (__len)
++		{
++		  ++__len;
++		  memset(&__state, 0, sizeof(mbstate_t));
++		  wchar_t* __wcs = new wchar_t[__len];
++		  mbsrtowcs(__wcs, &__ccurr, __len, &__state);
++		  _M_data->_M_curr_symbol = __wcs;
++		}
++	      else
++		_M_data->_M_curr_symbol = L"";
++              _M_data->_M_curr_symbol_size = wcslen(_M_data->_M_curr_symbol);
++	    }
++          catch (...)
++	    {
++	      delete _M_data;
++              _M_data = 0;
++	      delete __wcs_ps;
++	      delete __wcs_ns;
++#ifdef __UCLIBC_HAS_XLOCALE__
++	      __uselocale(__old);
++#else
++	      setlocale(LC_ALL, __old);
++	      free(__old);
++#endif
++              __throw_exception_again;
++	    }
++
++	  _M_data->_M_frac_digits = *(__nl_langinfo_l(__FRAC_DIGITS, __cloc));
++	  char __pprecedes = *(__nl_langinfo_l(__P_CS_PRECEDES, __cloc));
++	  char __pspace = *(__nl_langinfo_l(__P_SEP_BY_SPACE, __cloc));
++	  char __pposn = *(__nl_langinfo_l(__P_SIGN_POSN, __cloc));
++	  _M_data->_M_pos_format = _S_construct_pattern(__pprecedes, __pspace,
++	                                                __pposn);
++	  char __nprecedes = *(__nl_langinfo_l(__N_CS_PRECEDES, __cloc));
++	  char __nspace = *(__nl_langinfo_l(__N_SEP_BY_SPACE, __cloc));
++	  _M_data->_M_neg_format = _S_construct_pattern(__nprecedes, __nspace,
++	                                                __nposn);
++
++#ifdef __UCLIBC_HAS_XLOCALE__
++	  __uselocale(__old);
++#else
++	  setlocale(LC_ALL, __old);
++	  free(__old);
++#endif
++	}
++    }
++
++  template<>
++    moneypunct<wchar_t, true>::~moneypunct()
++    {
++      if (_M_data->_M_positive_sign_size)
++	delete [] _M_data->_M_positive_sign;
++      if (_M_data->_M_negative_sign_size
++          && wcscmp(_M_data->_M_negative_sign, L"()") != 0)
++	delete [] _M_data->_M_negative_sign;
++      if (_M_data->_M_curr_symbol_size)
++	delete [] _M_data->_M_curr_symbol;
++      delete _M_data;
++    }
++
++  template<>
++    moneypunct<wchar_t, false>::~moneypunct()
++    {
++      if (_M_data->_M_positive_sign_size)
++	delete [] _M_data->_M_positive_sign;
++      if (_M_data->_M_negative_sign_size
++          && wcscmp(_M_data->_M_negative_sign, L"()") != 0)
++	delete [] _M_data->_M_negative_sign;
++      if (_M_data->_M_curr_symbol_size)
++	delete [] _M_data->_M_curr_symbol;
++      delete _M_data;
++    }
++#endif
++}
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/numeric_members.cc
+===================================================================
+--- /dev/null
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/numeric_members.cc
+@@ -0,0 +1,160 @@
++// std::numpunct implementation details, GNU version -*- C++ -*-
++
++// Copyright (C) 2001, 2002, 2003, 2004 Free Software Foundation, Inc.
++//
++// This file is part of the GNU ISO C++ Library.  This library is free
++// software; you can redistribute it and/or modify it under the
++// terms of the GNU General Public License as published by the
++// Free Software Foundation; either version 2, or (at your option)
++// any later version.
++
++// This library is distributed in the hope that it will be useful,
++// but WITHOUT ANY WARRANTY; without even the implied warranty of
++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++// GNU General Public License for more details.
++
++// You should have received a copy of the GNU General Public License along
++// with this library; see the file COPYING.  If not, write to the Free
++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
++// USA.
++
++// As a special exception, you may use this file as part of a free software
++// library without restriction.  Specifically, if other files instantiate
++// templates or use macros or inline functions from this file, or you compile
++// this file and link it with other files to produce an executable, this
++// file does not by itself cause the resulting executable to be covered by
++// the GNU General Public License.  This exception does not however
++// invalidate any other reasons why the executable file might be covered by
++// the GNU General Public License.
++
++//
++// ISO C++ 14882: 22.2.3.1.2  numpunct virtual functions
++//
++
++// Written by Benjamin Kosnik <bkoz@redhat.com>
++
++#define _LIBC
++#include <locale>
++#undef _LIBC
++#include <bits/c++locale_internal.h>
++
++#ifdef __UCLIBC_MJN3_ONLY__
++#warning tailor for stub locale support
++#endif
++#ifndef __UCLIBC_HAS_XLOCALE__
++#define __nl_langinfo_l(N, L)         nl_langinfo((N))
++#endif
++
++namespace std
++{
++  template<>
++    void
++    numpunct<char>::_M_initialize_numpunct(__c_locale __cloc)
++    {
++      if (!_M_data)
++	_M_data = new __numpunct_cache<char>;
++
++      if (!__cloc)
++	{
++	  // "C" locale
++	  _M_data->_M_grouping = "";
++	  _M_data->_M_grouping_size = 0;
++	  _M_data->_M_use_grouping = false;
++
++	  _M_data->_M_decimal_point = '.';
++	  _M_data->_M_thousands_sep = ',';
++
++	  for (size_t __i = 0; __i < __num_base::_S_oend; ++__i)
++	    _M_data->_M_atoms_out[__i] = __num_base::_S_atoms_out[__i];
++
++	  for (size_t __j = 0; __j < __num_base::_S_iend; ++__j)
++	    _M_data->_M_atoms_in[__j] = __num_base::_S_atoms_in[__j];
++	}
++      else
++	{
++	  // Named locale.
++	  _M_data->_M_decimal_point = *(__nl_langinfo_l(DECIMAL_POINT,
++							__cloc));
++	  _M_data->_M_thousands_sep = *(__nl_langinfo_l(THOUSANDS_SEP,
++							__cloc));
++
++	  // Check for NULL, which implies no grouping.
++	  if (_M_data->_M_thousands_sep == '\0')
++	    _M_data->_M_grouping = "";
++	  else
++	    _M_data->_M_grouping = __nl_langinfo_l(GROUPING, __cloc);
++	  _M_data->_M_grouping_size = strlen(_M_data->_M_grouping);
++	}
++
++      // NB: There is no way to extact this info from posix locales.
++      // _M_truename = __nl_langinfo_l(YESSTR, __cloc);
++      _M_data->_M_truename = "true";
++      _M_data->_M_truename_size = 4;
++      // _M_falsename = __nl_langinfo_l(NOSTR, __cloc);
++      _M_data->_M_falsename = "false";
++      _M_data->_M_falsename_size = 5;
++    }
++
++  template<>
++    numpunct<char>::~numpunct()
++    { delete _M_data; }
++
++#ifdef _GLIBCXX_USE_WCHAR_T
++  template<>
++    void
++    numpunct<wchar_t>::_M_initialize_numpunct(__c_locale __cloc)
++    {
++      if (!_M_data)
++	_M_data = new __numpunct_cache<wchar_t>;
++
++      if (!__cloc)
++	{
++	  // "C" locale
++	  _M_data->_M_grouping = "";
++	  _M_data->_M_grouping_size = 0;
++	  _M_data->_M_use_grouping = false;
++
++	  _M_data->_M_decimal_point = L'.';
++	  _M_data->_M_thousands_sep = L',';
++
++	  // Use ctype::widen code without the facet...
++	  for (size_t __i = 0; __i < __num_base::_S_oend; ++__i)
++	    _M_data->_M_atoms_out[__i] =
++	      static_cast<wchar_t>(__num_base::_S_atoms_out[__i]);
++
++	  for (size_t __j = 0; __j < __num_base::_S_iend; ++__j)
++	    _M_data->_M_atoms_in[__j] =
++	      static_cast<wchar_t>(__num_base::_S_atoms_in[__j]);
++	}
++      else
++	{
++	  // Named locale.
++	  // NB: In the GNU model wchar_t is always 32 bit wide.
++	  union { char *__s; wchar_t __w; } __u;
++	  __u.__s = __nl_langinfo_l(_NL_NUMERIC_DECIMAL_POINT_WC, __cloc);
++	  _M_data->_M_decimal_point = __u.__w;
++
++	  __u.__s = __nl_langinfo_l(_NL_NUMERIC_THOUSANDS_SEP_WC, __cloc);
++	  _M_data->_M_thousands_sep = __u.__w;
++
++	  if (_M_data->_M_thousands_sep == L'\0')
++	    _M_data->_M_grouping = "";
++	  else
++	    _M_data->_M_grouping = __nl_langinfo_l(GROUPING, __cloc);
++	  _M_data->_M_grouping_size = strlen(_M_data->_M_grouping);
++	}
++
++      // NB: There is no way to extact this info from posix locales.
++      // _M_truename = __nl_langinfo_l(YESSTR, __cloc);
++      _M_data->_M_truename = L"true";
++      _M_data->_M_truename_size = 4;
++      // _M_falsename = __nl_langinfo_l(NOSTR, __cloc);
++      _M_data->_M_falsename = L"false";
++      _M_data->_M_falsename_size = 5;
++    }
++
++  template<>
++    numpunct<wchar_t>::~numpunct()
++    { delete _M_data; }
++ #endif
++}
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/time_members.cc
+===================================================================
+--- /dev/null
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/time_members.cc
+@@ -0,0 +1,406 @@
++// std::time_get, std::time_put implementation, GNU version -*- C++ -*-
++
++// Copyright (C) 2001, 2002, 2003, 2004 Free Software Foundation, Inc.
++//
++// This file is part of the GNU ISO C++ Library.  This library is free
++// software; you can redistribute it and/or modify it under the
++// terms of the GNU General Public License as published by the
++// Free Software Foundation; either version 2, or (at your option)
++// any later version.
++
++// This library is distributed in the hope that it will be useful,
++// but WITHOUT ANY WARRANTY; without even the implied warranty of
++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++// GNU General Public License for more details.
++
++// You should have received a copy of the GNU General Public License along
++// with this library; see the file COPYING.  If not, write to the Free
++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
++// USA.
++
++// As a special exception, you may use this file as part of a free software
++// library without restriction.  Specifically, if other files instantiate
++// templates or use macros or inline functions from this file, or you compile
++// this file and link it with other files to produce an executable, this
++// file does not by itself cause the resulting executable to be covered by
++// the GNU General Public License.  This exception does not however
++// invalidate any other reasons why the executable file might be covered by
++// the GNU General Public License.
++
++//
++// ISO C++ 14882: 22.2.5.1.2 - time_get virtual functions
++// ISO C++ 14882: 22.2.5.3.2 - time_put virtual functions
++//
++
++// Written by Benjamin Kosnik <bkoz@redhat.com>
++
++#include <locale>
++#include <bits/c++locale_internal.h>
++
++#ifdef __UCLIBC_MJN3_ONLY__
++#warning tailor for stub locale support
++#endif
++#ifndef __UCLIBC_HAS_XLOCALE__
++#define __nl_langinfo_l(N, L)         nl_langinfo((N))
++#endif
++
++namespace std
++{
++  template<>
++    void
++    __timepunct<char>::
++    _M_put(char* __s, size_t __maxlen, const char* __format,
++	   const tm* __tm) const
++    {
++#ifdef __UCLIBC_HAS_XLOCALE__
++      const size_t __len = __strftime_l(__s, __maxlen, __format, __tm,
++					_M_c_locale_timepunct);
++#else
++      char* __old = strdup(setlocale(LC_ALL, NULL));
++      setlocale(LC_ALL, _M_name_timepunct);
++      const size_t __len = strftime(__s, __maxlen, __format, __tm);
++      setlocale(LC_ALL, __old);
++      free(__old);
++#endif
++      // Make sure __s is null terminated.
++      if (__len == 0)
++	__s[0] = '\0';
++    }
++
++  template<>
++    void
++    __timepunct<char>::_M_initialize_timepunct(__c_locale __cloc)
++    {
++      if (!_M_data)
++	_M_data = new __timepunct_cache<char>;
++
++      if (!__cloc)
++	{
++	  // "C" locale
++	  _M_c_locale_timepunct = _S_get_c_locale();
++
++	  _M_data->_M_date_format = "%m/%d/%y";
++	  _M_data->_M_date_era_format = "%m/%d/%y";
++	  _M_data->_M_time_format = "%H:%M:%S";
++	  _M_data->_M_time_era_format = "%H:%M:%S";
++	  _M_data->_M_date_time_format = "";
++	  _M_data->_M_date_time_era_format = "";
++	  _M_data->_M_am = "AM";
++	  _M_data->_M_pm = "PM";
++	  _M_data->_M_am_pm_format = "";
++
++	  // Day names, starting with "C"'s Sunday.
++	  _M_data->_M_day1 = "Sunday";
++	  _M_data->_M_day2 = "Monday";
++	  _M_data->_M_day3 = "Tuesday";
++	  _M_data->_M_day4 = "Wednesday";
++	  _M_data->_M_day5 = "Thursday";
++	  _M_data->_M_day6 = "Friday";
++	  _M_data->_M_day7 = "Saturday";
++
++	  // Abbreviated day names, starting with "C"'s Sun.
++	  _M_data->_M_aday1 = "Sun";
++	  _M_data->_M_aday2 = "Mon";
++	  _M_data->_M_aday3 = "Tue";
++	  _M_data->_M_aday4 = "Wed";
++	  _M_data->_M_aday5 = "Thu";
++	  _M_data->_M_aday6 = "Fri";
++	  _M_data->_M_aday7 = "Sat";
++
++	  // Month names, starting with "C"'s January.
++	  _M_data->_M_month01 = "January";
++	  _M_data->_M_month02 = "February";
++	  _M_data->_M_month03 = "March";
++	  _M_data->_M_month04 = "April";
++	  _M_data->_M_month05 = "May";
++	  _M_data->_M_month06 = "June";
++	  _M_data->_M_month07 = "July";
++	  _M_data->_M_month08 = "August";
++	  _M_data->_M_month09 = "September";
++	  _M_data->_M_month10 = "October";
++	  _M_data->_M_month11 = "November";
++	  _M_data->_M_month12 = "December";
++
++	  // Abbreviated month names, starting with "C"'s Jan.
++	  _M_data->_M_amonth01 = "Jan";
++	  _M_data->_M_amonth02 = "Feb";
++	  _M_data->_M_amonth03 = "Mar";
++	  _M_data->_M_amonth04 = "Apr";
++	  _M_data->_M_amonth05 = "May";
++	  _M_data->_M_amonth06 = "Jun";
++	  _M_data->_M_amonth07 = "Jul";
++	  _M_data->_M_amonth08 = "Aug";
++	  _M_data->_M_amonth09 = "Sep";
++	  _M_data->_M_amonth10 = "Oct";
++	  _M_data->_M_amonth11 = "Nov";
++	  _M_data->_M_amonth12 = "Dec";
++	}
++      else
++	{
++	  _M_c_locale_timepunct = _S_clone_c_locale(__cloc);
++
++	  _M_data->_M_date_format = __nl_langinfo_l(D_FMT, __cloc);
++	  _M_data->_M_date_era_format = __nl_langinfo_l(ERA_D_FMT, __cloc);
++	  _M_data->_M_time_format = __nl_langinfo_l(T_FMT, __cloc);
++	  _M_data->_M_time_era_format = __nl_langinfo_l(ERA_T_FMT, __cloc);
++	  _M_data->_M_date_time_format = __nl_langinfo_l(D_T_FMT, __cloc);
++	  _M_data->_M_date_time_era_format = __nl_langinfo_l(ERA_D_T_FMT,
++							     __cloc);
++	  _M_data->_M_am = __nl_langinfo_l(AM_STR, __cloc);
++	  _M_data->_M_pm = __nl_langinfo_l(PM_STR, __cloc);
++	  _M_data->_M_am_pm_format = __nl_langinfo_l(T_FMT_AMPM, __cloc);
++
++	  // Day names, starting with "C"'s Sunday.
++	  _M_data->_M_day1 = __nl_langinfo_l(DAY_1, __cloc);
++	  _M_data->_M_day2 = __nl_langinfo_l(DAY_2, __cloc);
++	  _M_data->_M_day3 = __nl_langinfo_l(DAY_3, __cloc);
++	  _M_data->_M_day4 = __nl_langinfo_l(DAY_4, __cloc);
++	  _M_data->_M_day5 = __nl_langinfo_l(DAY_5, __cloc);
++	  _M_data->_M_day6 = __nl_langinfo_l(DAY_6, __cloc);
++	  _M_data->_M_day7 = __nl_langinfo_l(DAY_7, __cloc);
++
++	  // Abbreviated day names, starting with "C"'s Sun.
++	  _M_data->_M_aday1 = __nl_langinfo_l(ABDAY_1, __cloc);
++	  _M_data->_M_aday2 = __nl_langinfo_l(ABDAY_2, __cloc);
++	  _M_data->_M_aday3 = __nl_langinfo_l(ABDAY_3, __cloc);
++	  _M_data->_M_aday4 = __nl_langinfo_l(ABDAY_4, __cloc);
++	  _M_data->_M_aday5 = __nl_langinfo_l(ABDAY_5, __cloc);
++	  _M_data->_M_aday6 = __nl_langinfo_l(ABDAY_6, __cloc);
++	  _M_data->_M_aday7 = __nl_langinfo_l(ABDAY_7, __cloc);
++
++	  // Month names, starting with "C"'s January.
++	  _M_data->_M_month01 = __nl_langinfo_l(MON_1, __cloc);
++	  _M_data->_M_month02 = __nl_langinfo_l(MON_2, __cloc);
++	  _M_data->_M_month03 = __nl_langinfo_l(MON_3, __cloc);
++	  _M_data->_M_month04 = __nl_langinfo_l(MON_4, __cloc);
++	  _M_data->_M_month05 = __nl_langinfo_l(MON_5, __cloc);
++	  _M_data->_M_month06 = __nl_langinfo_l(MON_6, __cloc);
++	  _M_data->_M_month07 = __nl_langinfo_l(MON_7, __cloc);
++	  _M_data->_M_month08 = __nl_langinfo_l(MON_8, __cloc);
++	  _M_data->_M_month09 = __nl_langinfo_l(MON_9, __cloc);
++	  _M_data->_M_month10 = __nl_langinfo_l(MON_10, __cloc);
++	  _M_data->_M_month11 = __nl_langinfo_l(MON_11, __cloc);
++	  _M_data->_M_month12 = __nl_langinfo_l(MON_12, __cloc);
++
++	  // Abbreviated month names, starting with "C"'s Jan.
++	  _M_data->_M_amonth01 = __nl_langinfo_l(ABMON_1, __cloc);
++	  _M_data->_M_amonth02 = __nl_langinfo_l(ABMON_2, __cloc);
++	  _M_data->_M_amonth03 = __nl_langinfo_l(ABMON_3, __cloc);
++	  _M_data->_M_amonth04 = __nl_langinfo_l(ABMON_4, __cloc);
++	  _M_data->_M_amonth05 = __nl_langinfo_l(ABMON_5, __cloc);
++	  _M_data->_M_amonth06 = __nl_langinfo_l(ABMON_6, __cloc);
++	  _M_data->_M_amonth07 = __nl_langinfo_l(ABMON_7, __cloc);
++	  _M_data->_M_amonth08 = __nl_langinfo_l(ABMON_8, __cloc);
++	  _M_data->_M_amonth09 = __nl_langinfo_l(ABMON_9, __cloc);
++	  _M_data->_M_amonth10 = __nl_langinfo_l(ABMON_10, __cloc);
++	  _M_data->_M_amonth11 = __nl_langinfo_l(ABMON_11, __cloc);
++	  _M_data->_M_amonth12 = __nl_langinfo_l(ABMON_12, __cloc);
++	}
++    }
++
++#ifdef _GLIBCXX_USE_WCHAR_T
++  template<>
++    void
++    __timepunct<wchar_t>::
++    _M_put(wchar_t* __s, size_t __maxlen, const wchar_t* __format,
++	   const tm* __tm) const
++    {
++#ifdef __UCLIBC_HAS_XLOCALE__
++      __wcsftime_l(__s, __maxlen, __format, __tm, _M_c_locale_timepunct);
++      const size_t __len = __wcsftime_l(__s, __maxlen, __format, __tm,
++					_M_c_locale_timepunct);
++#else
++      char* __old = strdup(setlocale(LC_ALL, NULL));
++      setlocale(LC_ALL, _M_name_timepunct);
++      const size_t __len = wcsftime(__s, __maxlen, __format, __tm);
++      setlocale(LC_ALL, __old);
++      free(__old);
++#endif
++      // Make sure __s is null terminated.
++      if (__len == 0)
++	__s[0] = L'\0';
++    }
++
++  template<>
++    void
++    __timepunct<wchar_t>::_M_initialize_timepunct(__c_locale __cloc)
++    {
++      if (!_M_data)
++	_M_data = new __timepunct_cache<wchar_t>;
++
++#warning wide time stuff
++//       if (!__cloc)
++	{
++	  // "C" locale
++	  _M_c_locale_timepunct = _S_get_c_locale();
++
++	  _M_data->_M_date_format = L"%m/%d/%y";
++	  _M_data->_M_date_era_format = L"%m/%d/%y";
++	  _M_data->_M_time_format = L"%H:%M:%S";
++	  _M_data->_M_time_era_format = L"%H:%M:%S";
++	  _M_data->_M_date_time_format = L"";
++	  _M_data->_M_date_time_era_format = L"";
++	  _M_data->_M_am = L"AM";
++	  _M_data->_M_pm = L"PM";
++	  _M_data->_M_am_pm_format = L"";
++
++	  // Day names, starting with "C"'s Sunday.
++	  _M_data->_M_day1 = L"Sunday";
++	  _M_data->_M_day2 = L"Monday";
++	  _M_data->_M_day3 = L"Tuesday";
++	  _M_data->_M_day4 = L"Wednesday";
++	  _M_data->_M_day5 = L"Thursday";
++	  _M_data->_M_day6 = L"Friday";
++	  _M_data->_M_day7 = L"Saturday";
++
++	  // Abbreviated day names, starting with "C"'s Sun.
++	  _M_data->_M_aday1 = L"Sun";
++	  _M_data->_M_aday2 = L"Mon";
++	  _M_data->_M_aday3 = L"Tue";
++	  _M_data->_M_aday4 = L"Wed";
++	  _M_data->_M_aday5 = L"Thu";
++	  _M_data->_M_aday6 = L"Fri";
++	  _M_data->_M_aday7 = L"Sat";
++
++	  // Month names, starting with "C"'s January.
++	  _M_data->_M_month01 = L"January";
++	  _M_data->_M_month02 = L"February";
++	  _M_data->_M_month03 = L"March";
++	  _M_data->_M_month04 = L"April";
++	  _M_data->_M_month05 = L"May";
++	  _M_data->_M_month06 = L"June";
++	  _M_data->_M_month07 = L"July";
++	  _M_data->_M_month08 = L"August";
++	  _M_data->_M_month09 = L"September";
++	  _M_data->_M_month10 = L"October";
++	  _M_data->_M_month11 = L"November";
++	  _M_data->_M_month12 = L"December";
++
++	  // Abbreviated month names, starting with "C"'s Jan.
++	  _M_data->_M_amonth01 = L"Jan";
++	  _M_data->_M_amonth02 = L"Feb";
++	  _M_data->_M_amonth03 = L"Mar";
++	  _M_data->_M_amonth04 = L"Apr";
++	  _M_data->_M_amonth05 = L"May";
++	  _M_data->_M_amonth06 = L"Jun";
++	  _M_data->_M_amonth07 = L"Jul";
++	  _M_data->_M_amonth08 = L"Aug";
++	  _M_data->_M_amonth09 = L"Sep";
++	  _M_data->_M_amonth10 = L"Oct";
++	  _M_data->_M_amonth11 = L"Nov";
++	  _M_data->_M_amonth12 = L"Dec";
++	}
++#if 0
++      else
++	{
++	  _M_c_locale_timepunct = _S_clone_c_locale(__cloc);
++
++	  union { char *__s; wchar_t *__w; } __u;
++
++	  __u.__s = __nl_langinfo_l(_NL_WD_FMT, __cloc);
++	  _M_data->_M_date_format = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WERA_D_FMT, __cloc);
++	  _M_data->_M_date_era_format = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WT_FMT, __cloc);
++	  _M_data->_M_time_format = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WERA_T_FMT, __cloc);
++	  _M_data->_M_time_era_format = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WD_T_FMT, __cloc);
++	  _M_data->_M_date_time_format = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WERA_D_T_FMT, __cloc);
++	  _M_data->_M_date_time_era_format = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WAM_STR, __cloc);
++	  _M_data->_M_am = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WPM_STR, __cloc);
++	  _M_data->_M_pm = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WT_FMT_AMPM, __cloc);
++	  _M_data->_M_am_pm_format = __u.__w;
++
++	  // Day names, starting with "C"'s Sunday.
++	  __u.__s = __nl_langinfo_l(_NL_WDAY_1, __cloc);
++	  _M_data->_M_day1 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WDAY_2, __cloc);
++	  _M_data->_M_day2 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WDAY_3, __cloc);
++	  _M_data->_M_day3 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WDAY_4, __cloc);
++	  _M_data->_M_day4 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WDAY_5, __cloc);
++	  _M_data->_M_day5 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WDAY_6, __cloc);
++	  _M_data->_M_day6 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WDAY_7, __cloc);
++	  _M_data->_M_day7 = __u.__w;
++
++	  // Abbreviated day names, starting with "C"'s Sun.
++	  __u.__s = __nl_langinfo_l(_NL_WABDAY_1, __cloc);
++	  _M_data->_M_aday1 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABDAY_2, __cloc);
++	  _M_data->_M_aday2 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABDAY_3, __cloc);
++	  _M_data->_M_aday3 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABDAY_4, __cloc);
++	  _M_data->_M_aday4 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABDAY_5, __cloc);
++	  _M_data->_M_aday5 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABDAY_6, __cloc);
++	  _M_data->_M_aday6 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABDAY_7, __cloc);
++	  _M_data->_M_aday7 = __u.__w;
++
++	  // Month names, starting with "C"'s January.
++	  __u.__s = __nl_langinfo_l(_NL_WMON_1, __cloc);
++	  _M_data->_M_month01 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WMON_2, __cloc);
++	  _M_data->_M_month02 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WMON_3, __cloc);
++	  _M_data->_M_month03 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WMON_4, __cloc);
++	  _M_data->_M_month04 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WMON_5, __cloc);
++	  _M_data->_M_month05 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WMON_6, __cloc);
++	  _M_data->_M_month06 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WMON_7, __cloc);
++	  _M_data->_M_month07 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WMON_8, __cloc);
++	  _M_data->_M_month08 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WMON_9, __cloc);
++	  _M_data->_M_month09 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WMON_10, __cloc);
++	  _M_data->_M_month10 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WMON_11, __cloc);
++	  _M_data->_M_month11 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WMON_12, __cloc);
++	  _M_data->_M_month12 = __u.__w;
++
++	  // Abbreviated month names, starting with "C"'s Jan.
++	  __u.__s = __nl_langinfo_l(_NL_WABMON_1, __cloc);
++	  _M_data->_M_amonth01 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABMON_2, __cloc);
++	  _M_data->_M_amonth02 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABMON_3, __cloc);
++	  _M_data->_M_amonth03 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABMON_4, __cloc);
++	  _M_data->_M_amonth04 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABMON_5, __cloc);
++	  _M_data->_M_amonth05 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABMON_6, __cloc);
++	  _M_data->_M_amonth06 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABMON_7, __cloc);
++	  _M_data->_M_amonth07 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABMON_8, __cloc);
++	  _M_data->_M_amonth08 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABMON_9, __cloc);
++	  _M_data->_M_amonth09 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABMON_10, __cloc);
++	  _M_data->_M_amonth10 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABMON_11, __cloc);
++	  _M_data->_M_amonth11 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABMON_12, __cloc);
++	  _M_data->_M_amonth12 = __u.__w;
++	}
++#endif // 0
++    }
++#endif
++}
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/time_members.h
+===================================================================
+--- /dev/null
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/time_members.h
+@@ -0,0 +1,68 @@
++// std::time_get, std::time_put implementation, GNU version -*- C++ -*-
++
++// Copyright (C) 2001, 2002, 2003, 2004 Free Software Foundation, Inc.
++//
++// This file is part of the GNU ISO C++ Library.  This library is free
++// software; you can redistribute it and/or modify it under the
++// terms of the GNU General Public License as published by the
++// Free Software Foundation; either version 2, or (at your option)
++// any later version.
++
++// This library is distributed in the hope that it will be useful,
++// but WITHOUT ANY WARRANTY; without even the implied warranty of
++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++// GNU General Public License for more details.
++
++// You should have received a copy of the GNU General Public License along
++// with this library; see the file COPYING.  If not, write to the Free
++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
++// USA.
++
++// As a special exception, you may use this file as part of a free software
++// library without restriction.  Specifically, if other files instantiate
++// templates or use macros or inline functions from this file, or you compile
++// this file and link it with other files to produce an executable, this
++// file does not by itself cause the resulting executable to be covered by
++// the GNU General Public License.  This exception does not however
++// invalidate any other reasons why the executable file might be covered by
++// the GNU General Public License.
++
++//
++// ISO C++ 14882: 22.2.5.1.2 - time_get functions
++// ISO C++ 14882: 22.2.5.3.2 - time_put functions
++//
++
++// Written by Benjamin Kosnik <bkoz@redhat.com>
++
++  template<typename _CharT>
++    __timepunct<_CharT>::__timepunct(size_t __refs)
++    : facet(__refs), _M_data(NULL), _M_c_locale_timepunct(NULL),
++    _M_name_timepunct(_S_get_c_name())
++    { _M_initialize_timepunct(); }
++
++  template<typename _CharT>
++    __timepunct<_CharT>::__timepunct(__cache_type* __cache, size_t __refs)
++    : facet(__refs), _M_data(__cache), _M_c_locale_timepunct(NULL),
++    _M_name_timepunct(_S_get_c_name())
++    { _M_initialize_timepunct(); }
++
++  template<typename _CharT>
++    __timepunct<_CharT>::__timepunct(__c_locale __cloc, const char* __s,
++				     size_t __refs)
++    : facet(__refs), _M_data(NULL), _M_c_locale_timepunct(NULL),
++    _M_name_timepunct(__s)
++    {
++      char* __tmp = new char[std::strlen(__s) + 1];
++      std::strcpy(__tmp, __s);
++      _M_name_timepunct = __tmp;
++      _M_initialize_timepunct(__cloc);
++    }
++
++  template<typename _CharT>
++    __timepunct<_CharT>::~__timepunct()
++    {
++      if (_M_name_timepunct != _S_get_c_name())
++	delete [] _M_name_timepunct;
++      delete _M_data;
++      _S_destroy_c_locale(_M_c_locale_timepunct);
++    }
+Index: gcc-4.6.0/libstdc++-v3/configure
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/configure
++++ gcc-4.6.0/libstdc++-v3/configure
+@@ -15642,7 +15642,7 @@ $as_echo "stdio" >&6; }
+ if test "${enable_clocale+set}" = set; then :
+   enableval=$enable_clocale;
+       case "$enableval" in
+-       generic|gnu|ieee_1003.1-2001|yes|no|auto) ;;
++       generic|gnu|ieee_1003.1-2001|uclibc|yes|no|auto) ;;
+        *) as_fn_error "Unknown argument to enable/disable clocale" "$LINENO" 5 ;;
+ 	  	        esac
+ 
+@@ -15674,6 +15674,9 @@ fi
+   # Default to "generic".
+   if test $enable_clocale_flag = auto; then
+     case ${target_os} in
++      *-uclibc*)
++        enable_clocale_flag=uclibc
++        ;;
+       linux* | gnu* | kfreebsd*-gnu | knetbsd*-gnu)
+ 	enable_clocale_flag=gnu
+ 	;;
+@@ -15907,6 +15910,76 @@ $as_echo "IEEE 1003.1" >&6; }
+       CTIME_CC=config/locale/generic/time_members.cc
+       CLOCALE_INTERNAL_H=config/locale/generic/c++locale_internal.h
+       ;;
++    uclibc)
++      echo "$as_me:$LINENO: result: uclibc" >&5
++echo "${ECHO_T}uclibc" >&6
++
++      # Declare intention to use gettext, and add support for specific
++      # languages.
++      # For some reason, ALL_LINGUAS has to be before AM-GNU-GETTEXT
++      ALL_LINGUAS="de fr"
++
++      # Don't call AM-GNU-GETTEXT here. Instead, assume glibc.
++      # Extract the first word of "msgfmt", so it can be a program name with args.
++set dummy msgfmt; ac_word=$2
++echo "$as_me:$LINENO: checking for $ac_word" >&5
++echo $ECHO_N "checking for $ac_word... $ECHO_C" >&6
++if test "${ac_cv_prog_check_msgfmt+set}" = set; then
++  echo $ECHO_N "(cached) $ECHO_C" >&6
++else
++  if test -n "$check_msgfmt"; then
++  ac_cv_prog_check_msgfmt="$check_msgfmt" # Let the user override the test.
++else
++as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
++for as_dir in $PATH
++do
++  IFS=$as_save_IFS
++  test -z "$as_dir" && as_dir=.
++  for ac_exec_ext in '' $ac_executable_extensions; do
++  if $as_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
++    ac_cv_prog_check_msgfmt="yes"
++    echo "$as_me:$LINENO: found $as_dir/$ac_word$ac_exec_ext" >&5
++    break 2
++  fi
++done
++done
++
++  test -z "$ac_cv_prog_check_msgfmt" && ac_cv_prog_check_msgfmt="no"
++fi
++fi
++check_msgfmt=$ac_cv_prog_check_msgfmt
++if test -n "$check_msgfmt"; then
++  echo "$as_me:$LINENO: result: $check_msgfmt" >&5
++echo "${ECHO_T}$check_msgfmt" >&6
++else
++  echo "$as_me:$LINENO: result: no" >&5
++echo "${ECHO_T}no" >&6
++fi
++
++      if test x"$check_msgfmt" = x"yes" && test x"$enable_nls" = x"yes"; then
++        USE_NLS=yes
++      fi
++      # Export the build objects.
++      for ling in $ALL_LINGUAS; do \
++        glibcxx_MOFILES="$glibcxx_MOFILES $ling.mo"; \
++        glibcxx_POFILES="$glibcxx_POFILES $ling.po"; \
++      done
++
++
++
++      CLOCALE_H=config/locale/uclibc/c_locale.h
++      CLOCALE_CC=config/locale/uclibc/c_locale.cc
++      CCODECVT_CC=config/locale/uclibc/codecvt_members.cc
++      CCOLLATE_CC=config/locale/uclibc/collate_members.cc
++      CCTYPE_CC=config/locale/uclibc/ctype_members.cc
++      CMESSAGES_H=config/locale/uclibc/messages_members.h
++      CMESSAGES_CC=config/locale/uclibc/messages_members.cc
++      CMONEY_CC=config/locale/uclibc/monetary_members.cc
++      CNUMERIC_CC=config/locale/uclibc/numeric_members.cc
++      CTIME_H=config/locale/uclibc/time_members.h
++      CTIME_CC=config/locale/uclibc/time_members.cc
++      CLOCALE_INTERNAL_H=config/locale/uclibc/c++locale_internal.h
++      ;;
+   esac
+ 
+   # This is where the testsuite looks for locale catalogs, using the
+@@ -16957,6 +17030,7 @@ rm -f core conftest.err conftest.$ac_obj
+ 
+     cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+ /* end confdefs.h.  */
++#line 17016 "configure"
+ #include <wctype.h>
+ int
+ main ()
+@@ -64172,7 +64246,6 @@ $as_echo_n "checking for shared libgcc..
+ fi
+ cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+ /* end confdefs.h.  */
+-
+ int
+ main ()
+ {
+Index: gcc-4.6.0/libstdc++-v3/include/c_compatibility/wchar.h
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/include/c_compatibility/wchar.h
++++ gcc-4.6.0/libstdc++-v3/include/c_compatibility/wchar.h
+@@ -101,7 +101,9 @@ using std::wmemcmp;
+ using std::wmemcpy;
+ using std::wmemmove;
+ using std::wmemset;
++#if _GLIBCXX_HAVE_WCSFTIME
+ using std::wcsftime;
++#endif
+ 
+ #if _GLIBCXX_USE_C99
+ using std::wcstold;
+Index: gcc-4.6.0/libstdc++-v3/include/c_std/cwchar
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/include/c_std/cwchar
++++ gcc-4.6.0/libstdc++-v3/include/c_std/cwchar
+@@ -177,7 +177,9 @@ _GLIBCXX_BEGIN_NAMESPACE_VERSION
+   using ::wcscoll;
+   using ::wcscpy;
+   using ::wcscspn;
++#if _GLIBCXX_HAVE_WCSFTIME
+   using ::wcsftime;
++#endif
+   using ::wcslen;
+   using ::wcsncat;
+   using ::wcsncmp;
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/203-uclibc-locale-no__x.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/203-uclibc-locale-no__x.patch
new file mode 100644
index 0000000..78743c6
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/203-uclibc-locale-no__x.patch
@@ -0,0 +1,233 @@
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
+@@ -60,4 +60,49 @@ extern "C" __typeof(wcsxfrm_l) __wcsxfrm
+ extern "C" __typeof(wctype_l) __wctype_l;
+ #endif
+ 
++# define __nl_langinfo_l nl_langinfo_l
++# define __strcoll_l strcoll_l
++# define __strftime_l strftime_l
++# define __strtod_l strtod_l
++# define __strtof_l strtof_l
++# define __strtold_l strtold_l
++# define __strxfrm_l strxfrm_l
++# define __newlocale newlocale
++# define __freelocale freelocale
++# define __duplocale duplocale
++# define __uselocale uselocale
++
++# ifdef _GLIBCXX_USE_WCHAR_T
++#  define __iswctype_l iswctype_l
++#  define __towlower_l towlower_l
++#  define __towupper_l towupper_l
++#  define __wcscoll_l wcscoll_l
++#  define __wcsftime_l wcsftime_l
++#  define __wcsxfrm_l wcsxfrm_l
++#  define __wctype_l wctype_l
++# endif
++
++#else
++# define __nl_langinfo_l(N, L)       nl_langinfo((N))
++# define __strcoll_l(S1, S2, L)      strcoll((S1), (S2))
++# define __strtod_l(S, E, L)         strtod((S), (E))
++# define __strtof_l(S, E, L)         strtof((S), (E))
++# define __strtold_l(S, E, L)        strtold((S), (E))
++# define __strxfrm_l(S1, S2, N, L)   strxfrm((S1), (S2), (N))
++# warning should dummy __newlocale check for C|POSIX ?
++# define __newlocale(a, b, c)        NULL
++# define __freelocale(a)             ((void)0)
++# define __duplocale(a)              __c_locale()
++//# define __uselocale ?
++//
++# ifdef _GLIBCXX_USE_WCHAR_T
++#  define __iswctype_l(C, M, L)       iswctype((C), (M))
++#  define __towlower_l(C, L)          towlower((C))
++#  define __towupper_l(C, L)          towupper((C))
++#  define __wcscoll_l(S1, S2, L)      wcscoll((S1), (S2))
++//#  define __wcsftime_l(S, M, F, T, L)  wcsftime((S), (M), (F), (T))
++#  define __wcsxfrm_l(S1, S2, N, L)   wcsxfrm((S1), (S2), (N))
++#  define __wctype_l(S, L)            wctype((S))
++# endif
++
+ #endif // GLIBC 2.3 and later
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/c_locale.cc
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/c_locale.cc
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/c_locale.cc
+@@ -39,20 +39,6 @@
+ #include <langinfo.h>
+ #include <bits/c++locale_internal.h>
+ 
+-#ifndef __UCLIBC_HAS_XLOCALE__
+-#define __strtol_l(S, E, B, L)      strtol((S), (E), (B))
+-#define __strtoul_l(S, E, B, L)     strtoul((S), (E), (B))
+-#define __strtoll_l(S, E, B, L)     strtoll((S), (E), (B))
+-#define __strtoull_l(S, E, B, L)    strtoull((S), (E), (B))
+-#define __strtof_l(S, E, L)         strtof((S), (E))
+-#define __strtod_l(S, E, L)         strtod((S), (E))
+-#define __strtold_l(S, E, L)        strtold((S), (E))
+-#warning should dummy __newlocale check for C|POSIX ?
+-#define __newlocale(a, b, c)        NULL
+-#define __freelocale(a)             ((void)0)
+-#define __duplocale(a)              __c_locale()
+-#endif
+-
+ namespace std
+ {
+   template<>
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/collate_members.cc
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/collate_members.cc
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/collate_members.cc
+@@ -36,13 +36,6 @@
+ #include <locale>
+ #include <bits/c++locale_internal.h>
+ 
+-#ifndef __UCLIBC_HAS_XLOCALE__
+-#define __strcoll_l(S1, S2, L)      strcoll((S1), (S2))
+-#define __strxfrm_l(S1, S2, N, L)   strxfrm((S1), (S2), (N))
+-#define __wcscoll_l(S1, S2, L)      wcscoll((S1), (S2))
+-#define __wcsxfrm_l(S1, S2, N, L)   wcsxfrm((S1), (S2), (N))
+-#endif
+-
+ namespace std
+ {
+   // These are basically extensions to char_traits, and perhaps should
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/monetary_members.cc
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/monetary_members.cc
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/monetary_members.cc
+@@ -43,10 +43,6 @@
+ #warning tailor for stub locale support
+ #endif
+ 
+-#ifndef __UCLIBC_HAS_XLOCALE__
+-#define __nl_langinfo_l(N, L)         nl_langinfo((N))
+-#endif
+-
+ namespace std
+ {
+   // Construct and return valid pattern consisting of some combination of:
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/numeric_members.cc
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/numeric_members.cc
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/numeric_members.cc
+@@ -41,9 +41,6 @@
+ #ifdef __UCLIBC_MJN3_ONLY__
+ #warning tailor for stub locale support
+ #endif
+-#ifndef __UCLIBC_HAS_XLOCALE__
+-#define __nl_langinfo_l(N, L)         nl_langinfo((N))
+-#endif
+ 
+ namespace std
+ {
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/time_members.cc
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/time_members.cc
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/time_members.cc
+@@ -40,9 +40,6 @@
+ #ifdef __UCLIBC_MJN3_ONLY__
+ #warning tailor for stub locale support
+ #endif
+-#ifndef __UCLIBC_HAS_XLOCALE__
+-#define __nl_langinfo_l(N, L)         nl_langinfo((N))
+-#endif
+ 
+ namespace std
+ {
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/ctype_members.cc
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/ctype_members.cc
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/ctype_members.cc
+@@ -38,13 +38,6 @@
+ #undef _LIBC
+ #include <bits/c++locale_internal.h>
+ 
+-#ifndef __UCLIBC_HAS_XLOCALE__
+-#define __wctype_l(S, L)           wctype((S))
+-#define __towupper_l(C, L)         towupper((C))
+-#define __towlower_l(C, L)         towlower((C))
+-#define __iswctype_l(C, M, L)      iswctype((C), (M))
+-#endif
+-
+ namespace std
+ {
+   // NB: The other ctype<char> specializations are in src/locale.cc and
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/messages_members.cc
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/messages_members.cc
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/messages_members.cc
+@@ -39,13 +39,10 @@
+ #ifdef __UCLIBC_MJN3_ONLY__
+ #warning fix gettext stuff
+ #endif
+-#ifdef __UCLIBC_HAS_GETTEXT_AWARENESS__
+-extern "C" char *__dcgettext(const char *domainname,
+-			     const char *msgid, int category);
+ #undef gettext
+-#define gettext(msgid) __dcgettext(NULL, msgid, LC_MESSAGES)
++#ifdef __UCLIBC_HAS_GETTEXT_AWARENESS__
++#define gettext(msgid) dcgettext(NULL, msgid, LC_MESSAGES)
+ #else
+-#undef gettext
+ #define gettext(msgid) (msgid)
+ #endif
+ 
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/messages_members.h
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/messages_members.h
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/messages_members.h
+@@ -36,15 +36,11 @@
+ #ifdef __UCLIBC_MJN3_ONLY__
+ #warning fix prototypes for *textdomain funcs
+ #endif
+-#ifdef __UCLIBC_HAS_GETTEXT_AWARENESS__
+-extern "C" char *__textdomain(const char *domainname);
+-extern "C" char *__bindtextdomain(const char *domainname,
+-				  const char *dirname);
+-#else
+-#undef __textdomain
+-#undef __bindtextdomain
+-#define __textdomain(D)           ((void)0)
+-#define __bindtextdomain(D,P)     ((void)0)
++#ifndef __UCLIBC_HAS_GETTEXT_AWARENESS__
++#undef textdomain
++#undef bindtextdomain
++#define textdomain(D)           ((void)0)
++#define bindtextdomain(D,P)     ((void)0)
+ #endif
+ 
+   // Non-virtual member functions.
+@@ -70,7 +66,7 @@ extern "C" char *__bindtextdomain(const
+     messages<_CharT>::open(const basic_string<char>& __s, const locale& __loc,
+ 			   const char* __dir) const
+     {
+-      __bindtextdomain(__s.c_str(), __dir);
++      bindtextdomain(__s.c_str(), __dir);
+       return this->do_open(__s, __loc);
+     }
+ 
+@@ -90,7 +86,7 @@ extern "C" char *__bindtextdomain(const
+     {
+       // No error checking is done, assume the catalog exists and can
+       // be used.
+-      __textdomain(__s.c_str());
++      textdomain(__s.c_str());
+       return 0;
+     }
+ 
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/c_locale.h
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/c_locale.h
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/c_locale.h
+@@ -68,6 +68,7 @@ namespace __gnu_cxx
+ {
+   extern "C" __typeof(uselocale) __uselocale;
+ }
++#define __uselocale uselocale
+ #endif
+ 
+ namespace std
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/204-uclibc-locale-wchar_fix.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/204-uclibc-locale-wchar_fix.patch
new file mode 100644
index 0000000..2d8d70a
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/204-uclibc-locale-wchar_fix.patch
@@ -0,0 +1,52 @@
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/monetary_members.cc
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/monetary_members.cc
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/monetary_members.cc
+@@ -401,7 +401,7 @@ namespace std
+ # ifdef __UCLIBC_HAS_XLOCALE__
+ 	  _M_data->_M_decimal_point = __cloc->decimal_point_wc;
+ 	  _M_data->_M_thousands_sep = __cloc->thousands_sep_wc;
+-# else
++# elif defined __UCLIBC_HAS_LOCALE__
+ 	  _M_data->_M_decimal_point = __global_locale->decimal_point_wc;
+ 	  _M_data->_M_thousands_sep = __global_locale->thousands_sep_wc;
+ # endif
+@@ -556,7 +556,7 @@ namespace std
+ # ifdef __UCLIBC_HAS_XLOCALE__
+ 	  _M_data->_M_decimal_point = __cloc->decimal_point_wc;
+ 	  _M_data->_M_thousands_sep = __cloc->thousands_sep_wc;
+-# else
++# elif defined __UCLIBC_HAS_LOCALE__
+ 	  _M_data->_M_decimal_point = __global_locale->decimal_point_wc;
+ 	  _M_data->_M_thousands_sep = __global_locale->thousands_sep_wc;
+ # endif
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/numeric_members.cc
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/numeric_members.cc
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/numeric_members.cc
+@@ -127,12 +127,25 @@ namespace std
+ 	{
+ 	  // Named locale.
+ 	  // NB: In the GNU model wchar_t is always 32 bit wide.
++#ifdef __UCLIBC_MJN3_ONLY__
++#warning fix this... should be numeric
++#endif
++#ifdef __UCLIBC__
++# ifdef __UCLIBC_HAS_XLOCALE__
++	  _M_data->_M_decimal_point = __cloc->decimal_point_wc;
++	  _M_data->_M_thousands_sep = __cloc->thousands_sep_wc;
++# elif defined __UCLIBC_HAS_LOCALE__
++	  _M_data->_M_decimal_point = __global_locale->decimal_point_wc;
++	  _M_data->_M_thousands_sep = __global_locale->thousands_sep_wc;
++# endif
++#else
+ 	  union { char *__s; wchar_t __w; } __u;
+ 	  __u.__s = __nl_langinfo_l(_NL_NUMERIC_DECIMAL_POINT_WC, __cloc);
+ 	  _M_data->_M_decimal_point = __u.__w;
+ 
+ 	  __u.__s = __nl_langinfo_l(_NL_NUMERIC_THOUSANDS_SEP_WC, __cloc);
+ 	  _M_data->_M_thousands_sep = __u.__w;
++#endif
+ 
+ 	  if (_M_data->_M_thousands_sep == L'\0')
+ 	    _M_data->_M_grouping = "";
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/205-uclibc-locale-update.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/205-uclibc-locale-update.patch
new file mode 100644
index 0000000..911ad51
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/205-uclibc-locale-update.patch
@@ -0,0 +1,519 @@
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/c_locale.cc
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/c_locale.cc
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/c_locale.cc
+@@ -39,23 +39,20 @@
+ #include <langinfo.h>
+ #include <bits/c++locale_internal.h>
+ 
+-namespace std
+-{
++_GLIBCXX_BEGIN_NAMESPACE(std)
++
+   template<>
+     void
+     __convert_to_v(const char* __s, float& __v, ios_base::iostate& __err,
+ 		   const __c_locale& __cloc)
+     {
+-      if (!(__err & ios_base::failbit))
+-	{
+-	  char* __sanity;
+-	  errno = 0;
+-	  float __f = __strtof_l(__s, &__sanity, __cloc);
+-          if (__sanity != __s && errno != ERANGE)
+-	    __v = __f;
+-	  else
+-	    __err |= ios_base::failbit;
+-	}
++      char* __sanity;
++      errno = 0;
++      float __f = __strtof_l(__s, &__sanity, __cloc);
++      if (__sanity != __s && errno != ERANGE)
++	__v = __f;
++      else
++	__err |= ios_base::failbit;
+     }
+ 
+   template<>
+@@ -63,16 +60,13 @@ namespace std
+     __convert_to_v(const char* __s, double& __v, ios_base::iostate& __err,
+ 		   const __c_locale& __cloc)
+     {
+-      if (!(__err & ios_base::failbit))
+-	{
+-	  char* __sanity;
+-	  errno = 0;
+-	  double __d = __strtod_l(__s, &__sanity, __cloc);
+-          if (__sanity != __s && errno != ERANGE)
+-	    __v = __d;
+-	  else
+-	    __err |= ios_base::failbit;
+-	}
++      char* __sanity;
++      errno = 0;
++      double __d = __strtod_l(__s, &__sanity, __cloc);
++      if (__sanity != __s && errno != ERANGE)
++	__v = __d;
++      else
++	__err |= ios_base::failbit;
+     }
+ 
+   template<>
+@@ -80,16 +74,13 @@ namespace std
+     __convert_to_v(const char* __s, long double& __v, ios_base::iostate& __err,
+ 		   const __c_locale& __cloc)
+     {
+-      if (!(__err & ios_base::failbit))
+-	{
+-	  char* __sanity;
+-	  errno = 0;
+-	  long double __ld = __strtold_l(__s, &__sanity, __cloc);
+-          if (__sanity != __s && errno != ERANGE)
+-	    __v = __ld;
+-	  else
+-	    __err |= ios_base::failbit;
+-	}
++      char* __sanity;
++      errno = 0;
++      long double __ld = __strtold_l(__s, &__sanity, __cloc);
++      if (__sanity != __s && errno != ERANGE)
++	__v = __ld;
++      else
++	__err |= ios_base::failbit;
+     }
+ 
+   void
+@@ -110,17 +101,18 @@ namespace std
+   void
+   locale::facet::_S_destroy_c_locale(__c_locale& __cloc)
+   {
+-    if (_S_get_c_locale() != __cloc)
++    if (__cloc && _S_get_c_locale() != __cloc)
+       __freelocale(__cloc);
+   }
+ 
+   __c_locale
+   locale::facet::_S_clone_c_locale(__c_locale& __cloc)
+   { return __duplocale(__cloc); }
+-} // namespace std
+ 
+-namespace __gnu_cxx
+-{
++_GLIBCXX_END_NAMESPACE
++
++_GLIBCXX_BEGIN_NAMESPACE(__gnu_cxx)
++
+   const char* const category_names[6 + _GLIBCXX_NUM_CATEGORIES] =
+     {
+       "LC_CTYPE",
+@@ -138,9 +130,11 @@ namespace __gnu_cxx
+       "LC_IDENTIFICATION"
+ #endif
+     };
+-}
+ 
+-namespace std
+-{
++_GLIBCXX_END_NAMESPACE
++
++_GLIBCXX_BEGIN_NAMESPACE(std)
++
+   const char* const* const locale::_S_categories = __gnu_cxx::category_names;
+-}  // namespace std
++
++_GLIBCXX_END_NAMESPACE
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/ctype_members.cc
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/ctype_members.cc
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/ctype_members.cc
+@@ -33,16 +33,20 @@
+ 
+ // Written by Benjamin Kosnik <bkoz@redhat.com>
+ 
++#include <features.h>
++#ifdef __UCLIBC_HAS_LOCALE__
+ #define _LIBC
+ #include <locale>
+ #undef _LIBC
++#else
++#include <locale>
++#endif
+ #include <bits/c++locale_internal.h>
+ 
+-namespace std
+-{
++_GLIBCXX_BEGIN_NAMESPACE(std)
++
+   // NB: The other ctype<char> specializations are in src/locale.cc and
+   // various /config/os/* files.
+-  template<>
+     ctype_byname<char>::ctype_byname(const char* __s, size_t __refs)
+     : ctype<char>(0, false, __refs)
+     {
+@@ -57,6 +61,8 @@ namespace std
+ #endif
+ 	}
+     }
++    ctype_byname<char>::~ctype_byname()
++    { }
+ 
+ #ifdef _GLIBCXX_USE_WCHAR_T
+   ctype<wchar_t>::__wmask_type
+@@ -138,17 +144,33 @@ namespace std
+   ctype<wchar_t>::
+   do_is(mask __m, wchar_t __c) const
+   {
+-    // Highest bitmask in ctype_base == 10, but extra in "C"
+-    // library for blank.
++    // The case of __m == ctype_base::space is particularly important,
++    // due to its use in many istream functions.  Therefore we deal with
++    // it first, exploiting the knowledge that on GNU systems _M_bit[5]
++    // is the mask corresponding to ctype_base::space.  NB: an encoding
++    // change would not affect correctness!
++
+     bool __ret = false;
+-    const size_t __bitmasksize = 11;
+-    for (size_t __bitcur = 0; __bitcur <= __bitmasksize; ++__bitcur)
+-      if (__m & _M_bit[__bitcur]
+-	  && __iswctype_l(__c, _M_wmask[__bitcur], _M_c_locale_ctype))
+-	{
+-	  __ret = true;
+-	  break;
+-	}
++    if (__m == _M_bit[5])
++      __ret = __iswctype_l(__c, _M_wmask[5], _M_c_locale_ctype);
++    else
++      {
++	// Highest bitmask in ctype_base == 10, but extra in "C"
++	// library for blank.
++	const size_t __bitmasksize = 11;
++	for (size_t __bitcur = 0; __bitcur <= __bitmasksize; ++__bitcur)
++	  if (__m & _M_bit[__bitcur])
++	    {
++	      if (__iswctype_l(__c, _M_wmask[__bitcur], _M_c_locale_ctype))
++		{
++		  __ret = true;
++		  break;
++		}
++	      else if (__m == _M_bit[__bitcur])
++		break;
++	    }
++      }
++
+     return __ret;
+   }
+ 
+@@ -290,4 +312,5 @@ namespace std
+ #endif
+   }
+ #endif //  _GLIBCXX_USE_WCHAR_T
+-}
++
++_GLIBCXX_END_NAMESPACE
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/messages_members.h
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/messages_members.h
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/messages_members.h
+@@ -53,12 +53,16 @@
+   template<typename _CharT>
+      messages<_CharT>::messages(__c_locale __cloc, const char* __s,
+ 				size_t __refs)
+-     : facet(__refs), _M_c_locale_messages(_S_clone_c_locale(__cloc)),
+-     _M_name_messages(__s)
++     : facet(__refs), _M_c_locale_messages(NULL),
++     _M_name_messages(NULL)
+      {
+-       char* __tmp = new char[std::strlen(__s) + 1];
+-       std::strcpy(__tmp, __s);
++       const size_t __len = std::strlen(__s) + 1;
++       char* __tmp = new char[__len];
++       std::memcpy(__tmp, __s, __len);
+        _M_name_messages = __tmp;
++
++       // Last to avoid leaking memory if new throws.
++       _M_c_locale_messages = _S_clone_c_locale(__cloc);
+      }
+ 
+   template<typename _CharT>
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/monetary_members.cc
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/monetary_members.cc
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/monetary_members.cc
+@@ -33,9 +33,14 @@
+ 
+ // Written by Benjamin Kosnik <bkoz@redhat.com>
+ 
++#include <features.h>
++#ifdef __UCLIBC_HAS_LOCALE__
+ #define _LIBC
+ #include <locale>
+ #undef _LIBC
++#else
++#include <locale>
++#endif
+ #include <bits/c++locale_internal.h>
+ 
+ #ifdef __UCLIBC_MJN3_ONLY__
+@@ -206,7 +211,7 @@ namespace std
+ 	  }
+ 	break;
+       default:
+-	;
++	__ret = pattern();
+       }
+     return __ret;
+   }
+@@ -390,7 +395,9 @@ namespace std
+ 	  __c_locale __old = __uselocale(__cloc);
+ #else
+ 	  // Switch to named locale so that mbsrtowcs will work.
+-	  char* __old = strdup(setlocale(LC_ALL, NULL));
++  	  char* __old = setlocale(LC_ALL, NULL);
++          const size_t __llen = strlen(__old) + 1;
++          char* __sav = new char[__llen];
+ 	  setlocale(LC_ALL, __name);
+ #endif
+ 
+@@ -477,8 +484,8 @@ namespace std
+ #ifdef __UCLIBC_HAS_XLOCALE__
+ 	      __uselocale(__old);
+ #else
+-	      setlocale(LC_ALL, __old);
+-	      free(__old);
++	      setlocale(LC_ALL, __sav);
++	      delete [] __sav;
+ #endif
+ 	      __throw_exception_again;
+ 	    }
+@@ -498,8 +505,8 @@ namespace std
+ #ifdef __UCLIBC_HAS_XLOCALE__
+ 	  __uselocale(__old);
+ #else
+-	  setlocale(LC_ALL, __old);
+-	  free(__old);
++	  setlocale(LC_ALL, __sav);
++	  delete [] __sav;
+ #endif
+ 	}
+     }
+@@ -545,8 +552,11 @@ namespace std
+ 	  __c_locale __old = __uselocale(__cloc);
+ #else
+ 	  // Switch to named locale so that mbsrtowcs will work.
+-	  char* __old = strdup(setlocale(LC_ALL, NULL));
+-	  setlocale(LC_ALL, __name);
++          char* __old = setlocale(LC_ALL, NULL);
++          const size_t __llen = strlen(__old) + 1;
++          char* __sav = new char[__llen];
++          memcpy(__sav, __old, __llen);
++          setlocale(LC_ALL, __name);
+ #endif
+ 
+ #ifdef __UCLIBC_MJN3_ONLY__
+@@ -633,8 +643,8 @@ namespace std
+ #ifdef __UCLIBC_HAS_XLOCALE__
+ 	      __uselocale(__old);
+ #else
+-	      setlocale(LC_ALL, __old);
+-	      free(__old);
++	      setlocale(LC_ALL, __sav);
++	      delete [] __sav;
+ #endif
+               __throw_exception_again;
+ 	    }
+@@ -653,8 +663,8 @@ namespace std
+ #ifdef __UCLIBC_HAS_XLOCALE__
+ 	  __uselocale(__old);
+ #else
+-	  setlocale(LC_ALL, __old);
+-	  free(__old);
++	  setlocale(LC_ALL, __sav);
++	  delete [] __sav;
+ #endif
+ 	}
+     }
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/numeric_members.cc
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/numeric_members.cc
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/numeric_members.cc
+@@ -33,9 +33,14 @@
+ 
+ // Written by Benjamin Kosnik <bkoz@redhat.com>
+ 
++#include <features.h>
++#ifdef __UCLIBC_HAS_LOCALE__
+ #define _LIBC
+ #include <locale>
+ #undef _LIBC
++#else
++#include <locale>
++#endif
+ #include <bits/c++locale_internal.h>
+ 
+ #ifdef __UCLIBC_MJN3_ONLY__
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/time_members.h
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/time_members.h
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/time_members.h
+@@ -50,12 +50,21 @@
+     __timepunct<_CharT>::__timepunct(__c_locale __cloc, const char* __s,
+ 				     size_t __refs)
+     : facet(__refs), _M_data(NULL), _M_c_locale_timepunct(NULL),
+-    _M_name_timepunct(__s)
++    _M_name_timepunct(NULL)
+     {
+-      char* __tmp = new char[std::strlen(__s) + 1];
+-      std::strcpy(__tmp, __s);
++      const size_t __len = std::strlen(__s) + 1;
++      char* __tmp = new char[__len];
++      std::memcpy(__tmp, __s, __len);
+       _M_name_timepunct = __tmp;
+-      _M_initialize_timepunct(__cloc);
++
++      try
++	{ _M_initialize_timepunct(__cloc); }
++      catch(...)
++	{
++	  delete [] _M_name_timepunct;
++	  __throw_exception_again;
++	}
++
+     }
+ 
+   template<typename _CharT>
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/c_locale.h
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/c_locale.h
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/c_locale.h
+@@ -39,21 +39,23 @@
+ #pragma GCC system_header
+ 
+ #include <cstring>              // get std::strlen
+-#include <cstdio>               // get std::snprintf or std::sprintf
++#include <cstdio>               // get std::vsnprintf or std::vsprintf
+ #include <clocale>
+ #include <langinfo.h>		// For codecvt
+ #ifdef __UCLIBC_MJN3_ONLY__
+ #warning fix this
+ #endif
+-#ifdef __UCLIBC_HAS_LOCALE__
++#ifdef _GLIBCXX_USE_ICONV
+ #include <iconv.h>		// For codecvt using iconv, iconv_t
+ #endif
+-#ifdef __UCLIBC_HAS_GETTEXT_AWARENESS__
+-#include <libintl.h> 		// For messages
++#ifdef HAVE_LIBINTL_H
++#include <libintl.h>		// For messages
+ #endif
++#include <cstdarg>
+ 
+ #ifdef __UCLIBC_MJN3_ONLY__
+ #warning what is _GLIBCXX_C_LOCALE_GNU for
++// psm: used in os/gnu-linux/ctype_noninline.h
+ #endif
+ #define _GLIBCXX_C_LOCALE_GNU 1
+ 
+@@ -78,23 +80,25 @@ namespace std
+ #else
+   typedef int*			__c_locale;
+ #endif
+-
+-  // Convert numeric value of type _Tv to string and return length of
+-  // string.  If snprintf is available use it, otherwise fall back to
+-  // the unsafe sprintf which, in general, can be dangerous and should
++  // Convert numeric value of type double to string and return length of
++  // string.  If vsnprintf is available use it, otherwise fall back to
++  // the unsafe vsprintf which, in general, can be dangerous and should
+   // be avoided.
+-  template<typename _Tv>
+-    int
+-    __convert_from_v(char* __out,
+-		     const int __size __attribute__ ((__unused__)),
+-		     const char* __fmt,
+-#ifdef __UCLIBC_HAS_XCLOCALE__
+-		     _Tv __v, const __c_locale& __cloc, int __prec)
++    inline int
++    __convert_from_v(const __c_locale&
++#ifndef __UCLIBC_HAS_XCLOCALE__
++	__cloc __attribute__ ((__unused__))
++#endif
++		     ,
++		     char* __out,
++		     const int __size,
++		     const char* __fmt, ...)
+     {
++      va_list __args;
++#ifdef __UCLIBC_HAS_XCLOCALE__
++
+       __c_locale __old = __gnu_cxx::__uselocale(__cloc);
+ #else
+-		     _Tv __v, const __c_locale&, int __prec)
+-    {
+ # ifdef __UCLIBC_HAS_LOCALE__
+       char* __old = std::setlocale(LC_ALL, NULL);
+       char* __sav = new char[std::strlen(__old) + 1];
+@@ -103,7 +107,9 @@ namespace std
+ # endif
+ #endif
+ 
+-      const int __ret = std::snprintf(__out, __size, __fmt, __prec, __v);
++      va_start(__args, __fmt);
++      const int __ret = std::vsnprintf(__out, __size, __fmt, __args);
++      va_end(__args);
+ 
+ #ifdef __UCLIBC_HAS_XCLOCALE__
+       __gnu_cxx::__uselocale(__old);
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/time_members.cc
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/time_members.cc
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/time_members.cc
+@@ -53,11 +53,14 @@ namespace std
+       const size_t __len = __strftime_l(__s, __maxlen, __format, __tm,
+ 					_M_c_locale_timepunct);
+ #else
+-      char* __old = strdup(setlocale(LC_ALL, NULL));
++      char* __old = setlocale(LC_ALL, NULL);
++      const size_t __llen = strlen(__old) + 1;
++      char* __sav = new char[__llen];
++      memcpy(__sav, __old, __llen);
+       setlocale(LC_ALL, _M_name_timepunct);
+       const size_t __len = strftime(__s, __maxlen, __format, __tm);
+-      setlocale(LC_ALL, __old);
+-      free(__old);
++      setlocale(LC_ALL, __sav);
++      delete [] __sav;
+ #endif
+       // Make sure __s is null terminated.
+       if (__len == 0)
+@@ -207,11 +210,14 @@ namespace std
+       const size_t __len = __wcsftime_l(__s, __maxlen, __format, __tm,
+ 					_M_c_locale_timepunct);
+ #else
+-      char* __old = strdup(setlocale(LC_ALL, NULL));
++      char* __old = setlocale(LC_ALL, NULL);
++      const size_t __llen = strlen(__old) + 1;
++      char* __sav = new char[__llen];
++      memcpy(__sav, __old, __llen);
+       setlocale(LC_ALL, _M_name_timepunct);
+       const size_t __len = wcsftime(__s, __maxlen, __format, __tm);
+-      setlocale(LC_ALL, __old);
+-      free(__old);
++      setlocale(LC_ALL, __sav);
++      delete [] __sav;
+ #endif
+       // Make sure __s is null terminated.
+       if (__len == 0)
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
+@@ -31,6 +31,9 @@
+ 
+ #include <bits/c++config.h>
+ #include <clocale>
++#include <cstdlib>
++#include <cstring>
++#include <cstddef>
+ 
+ #ifdef __UCLIBC_MJN3_ONLY__
+ #warning clean this up
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/301-missing-execinfo_h.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/301-missing-execinfo_h.patch
new file mode 100644
index 0000000..99bd229
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/301-missing-execinfo_h.patch
@@ -0,0 +1,13 @@
+Index: gcc-4.6.0/boehm-gc/include/gc.h
+===================================================================
+--- gcc-4.6.0.orig/boehm-gc/include/gc.h
++++ gcc-4.6.0/boehm-gc/include/gc.h
+@@ -503,7 +503,7 @@ GC_API GC_PTR GC_malloc_atomic_ignore_of
+ #if defined(__linux__) || defined(__GLIBC__)
+ # include <features.h>
+ # if (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 1 || __GLIBC__ > 2) \
+-     && !defined(__ia64__)
++     && !defined(__ia64__) && !defined(__UCLIBC__)
+ #   ifndef GC_HAVE_BUILTIN_BACKTRACE
+ #     define GC_HAVE_BUILTIN_BACKTRACE
+ #   endif
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/302-c99-snprintf.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/302-c99-snprintf.patch
new file mode 100644
index 0000000..9f841ae
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/302-c99-snprintf.patch
@@ -0,0 +1,13 @@
+Index: gcc-4.6.0/libstdc++-v3/include/c_std/cstdio
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/include/c_std/cstdio
++++ gcc-4.6.0/libstdc++-v3/include/c_std/cstdio
+@@ -136,7 +136,7 @@ namespace std
+   using ::vsprintf;
+ } // namespace std
+ 
+-#if _GLIBCXX_USE_C99
++#if _GLIBCXX_USE_C99 || defined(__UCLIBC__)
+ 
+ #undef snprintf
+ #undef vfscanf
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/303-c99-complex-ugly-hack.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/303-c99-complex-ugly-hack.patch
new file mode 100644
index 0000000..47ae88e
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/303-c99-complex-ugly-hack.patch
@@ -0,0 +1,14 @@
+Index: gcc-4.6.0/libstdc++-v3/configure
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/configure
++++ gcc-4.6.0/libstdc++-v3/configure
+@@ -18302,6 +18302,9 @@ $as_echo_n "checking for ISO C99 support
+     cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+ /* end confdefs.h.  */
+ #include <complex.h>
++#ifdef __UCLIBC__
++#error ugly hack to make sure configure test fails here for cross until uClibc supports the complex funcs
++#endif
+ int
+ main ()
+ {
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/304-index_macro.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/304-index_macro.patch
new file mode 100644
index 0000000..f6eedb3
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/304-index_macro.patch
@@ -0,0 +1,28 @@
+Index: gcc-4.6.0/libstdc++-v3/include/ext/rope
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/include/ext/rope
++++ gcc-4.6.0/libstdc++-v3/include/ext/rope
+@@ -54,6 +54,9 @@
+ #include <bits/gthr.h>
+ #include <tr1/functional>
+ 
++/* cope w/ index defined as macro, SuSv3 proposal */
++#undef index
++
+ # ifdef __GC
+ #   define __GC_CONST const
+ # else
+Index: gcc-4.6.0/libstdc++-v3/include/ext/ropeimpl.h
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/include/ext/ropeimpl.h
++++ gcc-4.6.0/libstdc++-v3/include/ext/ropeimpl.h
+@@ -49,6 +49,9 @@
+ #include <ext/memory> // For uninitialized_copy_n
+ #include <ext/numeric> // For power
+ 
++/* cope w/ index defined as macro, SuSv3 proposal */
++#undef index
++
+ namespace __gnu_cxx _GLIBCXX_VISIBILITY(default)
+ {
+ _GLIBCXX_BEGIN_NAMESPACE_VERSION
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/305-libmudflap-susv3-legacy.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/305-libmudflap-susv3-legacy.patch
new file mode 100644
index 0000000..4cabb36
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/305-libmudflap-susv3-legacy.patch
@@ -0,0 +1,49 @@
+Index: gcc-4.6.0/libmudflap/mf-hooks2.c
+===================================================================
+--- gcc-4.6.0.orig/libmudflap/mf-hooks2.c
++++ gcc-4.6.0/libmudflap/mf-hooks2.c
+@@ -421,7 +421,7 @@ WRAPPER2(void, bzero, void *s, size_t n)
+ {
+   TRACE ("%s\n", __PRETTY_FUNCTION__);
+   MF_VALIDATE_EXTENT(s, n, __MF_CHECK_WRITE, "bzero region");
+-  bzero (s, n);
++  memset (s, 0, n);
+ }
+ 
+ 
+@@ -431,7 +431,7 @@ WRAPPER2(void, bcopy, const void *src, v
+   TRACE ("%s\n", __PRETTY_FUNCTION__);
+   MF_VALIDATE_EXTENT(src, n, __MF_CHECK_READ, "bcopy src");
+   MF_VALIDATE_EXTENT(dest, n, __MF_CHECK_WRITE, "bcopy dest");
+-  bcopy (src, dest, n);
++  memmove (dest, src, n);
+ }
+ 
+ 
+@@ -441,7 +441,7 @@ WRAPPER2(int, bcmp, const void *s1, cons
+   TRACE ("%s\n", __PRETTY_FUNCTION__);
+   MF_VALIDATE_EXTENT(s1, n, __MF_CHECK_READ, "bcmp 1st arg");
+   MF_VALIDATE_EXTENT(s2, n, __MF_CHECK_READ, "bcmp 2nd arg");
+-  return bcmp (s1, s2, n);
++  return n == 0 ? 0 : memcmp (s1, s2, n);
+ }
+ 
+ 
+@@ -450,7 +450,7 @@ WRAPPER2(char *, index, const char *s, i
+   size_t n = strlen (s);
+   TRACE ("%s\n", __PRETTY_FUNCTION__);
+   MF_VALIDATE_EXTENT(s, CLAMPADD(n, 1), __MF_CHECK_READ, "index region");
+-  return index (s, c);
++  return strchr (s, c);
+ }
+ 
+ 
+@@ -459,7 +459,7 @@ WRAPPER2(char *, rindex, const char *s,
+   size_t n = strlen (s);
+   TRACE ("%s\n", __PRETTY_FUNCTION__);
+   MF_VALIDATE_EXTENT(s, CLAMPADD(n, 1), __MF_CHECK_READ, "rindex region");
+-  return rindex (s, c);
++  return strrchr (s, c);
+ }
+ 
+ /* XXX:  stpcpy, memccpy */
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/306-libstdc++-namespace.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/306-libstdc++-namespace.patch
new file mode 100644
index 0000000..1fbf043
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/306-libstdc++-namespace.patch
@@ -0,0 +1,38 @@
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/messages_members.h
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/messages_members.h
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/messages_members.h
+@@ -32,7 +32,8 @@
+ //
+ 
+ // Written by Benjamin Kosnik <bkoz@redhat.com>
+-
++namespace std
++{
+ #ifdef __UCLIBC_MJN3_ONLY__
+ #warning fix prototypes for *textdomain funcs
+ #endif
+@@ -116,3 +117,4 @@
+ 	   this->_S_create_c_locale(this->_M_c_locale_messages, __s);
+ 	 }
+      }
++}
+Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/time_members.h
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/time_members.h
++++ gcc-4.6.0/libstdc++-v3/config/locale/uclibc/time_members.h
+@@ -33,7 +33,8 @@
+ //
+ 
+ // Written by Benjamin Kosnik <bkoz@redhat.com>
+-
++namespace std
++{
+   template<typename _CharT>
+     __timepunct<_CharT>::__timepunct(size_t __refs)
+     : facet(__refs), _M_data(NULL), _M_c_locale_timepunct(NULL),
+@@ -75,3 +76,4 @@
+       delete _M_data;
+       _S_destroy_c_locale(_M_c_locale_timepunct);
+     }
++}
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/307-locale_facets.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/307-locale_facets.patch
new file mode 100644
index 0000000..774fcfa
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/307-locale_facets.patch
@@ -0,0 +1,19 @@
+This patch fixes a bug into ostream::operator<<(double) due to the wrong size
+passed into the __convert_from_v method. The wrong size is then passed to
+std::snprintf function, that, on uClibc, doens't handle sized 0 buffer.
+
+Signed-off-by: Carmelo Amoroso <carmelo.amoroso@st.com>
+
+Index: gcc-4.3.1/libstdc++-v3/include/bits/locale_facets.tcc
+===================================================================
+--- gcc-4.3.1.orig/libstdc++-v3/include/bits/locale_facets.tcc	2007-11-26 17:59:41.000000000 -0800
++++ gcc-4.3.1/libstdc++-v3/include/bits/locale_facets.tcc	2008-08-16 02:14:48.000000000 -0700
+@@ -1004,7 +1004,7 @@
+ 	const int __cs_size = __fixed ? __max_exp + __prec + 4
+ 	                              : __max_digits * 2 + __prec;
+ 	char* __cs = static_cast<char*>(__builtin_alloca(__cs_size));
+-	__len = std::__convert_from_v(_S_get_c_locale(), __cs, 0, __fbuf, 
++	__len = std::__convert_from_v(_S_get_c_locale(), __cs, __cs_size, __fbuf,
+ 				      __prec, __v);
+ #endif
+ 
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/602-sdk-libstdc++-includes.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/602-sdk-libstdc++-includes.patch
new file mode 100644
index 0000000..23fce75
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/602-sdk-libstdc++-includes.patch
@@ -0,0 +1,20 @@
+--- gcc-4.1.0/libstdc++-v3/fragment.am	2005-03-21 11:40:14.000000000 -0600
++++ gcc-4.1.0-patched/libstdc++-v3/fragment.am	2005-04-25 20:14:39.856251785 -0500
+@@ -21,5 +21,5 @@
+ 	$(WARN_FLAGS) $(WERROR) -fdiagnostics-show-location=once
+ 
+ # -I/-D flags to pass when compiling.
+-AM_CPPFLAGS = $(GLIBCXX_INCLUDES)
++AM_CPPFLAGS = $(GLIBCXX_INCLUDES) -I$(toplevel_srcdir)/include
+ 
+--- gcc-4.1.0/libstdc++-v3/libmath/Makefile.am	2005-03-21 11:40:18.000000000 -0600
++++ gcc-4.1.0-patched/libstdc++-v3/libmath/Makefile.am	2005-04-25 20:14:39.682280735 -0500
+@@ -35,7 +35,7 @@
+ 
+ libmath_la_SOURCES = stubs.c
+ 
+-AM_CPPFLAGS = $(CANADIAN_INCLUDES)
++AM_CPPFLAGS = $(CANADIAN_INCLUDES) -I$(toplevel_srcdir)/include
+ 
+ # Only compiling "C" sources in this directory.
+ LIBTOOL = @LIBTOOL@ --tag CC
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/64bithack.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/64bithack.patch
new file mode 100644
index 0000000..11cbbed
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/64bithack.patch
@@ -0,0 +1,33 @@
+By default gcc places 64 bit libs in a lib64 directory. This makes it use 
+"lib" instead.
+
+RP 25/7/10
+
+Index: gcc-4.6.0/gcc/config/i386/t-linux64
+===================================================================
+--- gcc-4.6.0.orig/gcc/config/i386/t-linux64
++++ gcc-4.6.0/gcc/config/i386/t-linux64
+@@ -24,8 +24,8 @@
+ # MULTILIB_OSDIRNAMES according to what is found on the target.
+ 
+ MULTILIB_OPTIONS = m64/m32
+-MULTILIB_DIRNAMES = 64 32 
+-MULTILIB_OSDIRNAMES = ../lib64 $(if $(wildcard $(shell echo $(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib)
++MULTILIB_DIRNAMES = . 32
++MULTILIB_OSDIRNAMES = . $(if $(wildcard $(shell echo $(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib)
+ 
+ LIBGCC = stmp-multilib
+ INSTALL_LIBGCC = install-multilib
+Index: gcc-4.6.0/gcc/config/i386/linux64.h
+===================================================================
+--- gcc-4.6.0.orig/gcc/config/i386/linux64.h
++++ gcc-4.6.0/gcc/config/i386/linux64.h
+@@ -63,7 +63,7 @@ see the files COPYING3 and COPYING.RUNTI
+    done.  */
+ 
+ #define GLIBC_DYNAMIC_LINKER32 "/lib/ld-linux.so.2"
+-#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux-x86-64.so.2"
++#define GLIBC_DYNAMIC_LINKER64 "/lib/ld-linux-x86-64.so.2"
+ 
+ #if TARGET_64BIT_DEFAULT
+ #define SPEC_32 "m32"
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/740-sh-pr24836.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/740-sh-pr24836.patch
new file mode 100644
index 0000000..89a3934
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/740-sh-pr24836.patch
@@ -0,0 +1,29 @@
+http://sourceforge.net/mailarchive/forum.php?thread_id=8959304&forum_id=5348
+http://gcc.gnu.org/bugzilla/show_bug.cgi?id=24836
+
+Index: gcc-4.6.0/gcc/configure.ac
+===================================================================
+--- gcc-4.6.0.orig/gcc/configure.ac
++++ gcc-4.6.0/gcc/configure.ac
+@@ -2926,7 +2926,7 @@ foo:	.long	25
+ 	tls_first_minor=14
+ 	tls_as_opt="-m64 -Aesame --fatal-warnings"
+ 	;;
+-  sh-*-* | sh[34]-*-*)
++  sh-*-* | sh[34]*-*-*)
+     conftest_s='
+ 	.section ".tdata","awT",@progbits
+ foo:	.long	25
+Index: gcc-4.6.0/gcc/configure
+===================================================================
+--- gcc-4.6.0.orig/gcc/configure
++++ gcc-4.6.0/gcc/configure
+@@ -22756,7 +22756,7 @@ foo:	.long	25
+ 	tls_first_minor=14
+ 	tls_as_opt="-m64 -Aesame --fatal-warnings"
+ 	;;
+-  sh-*-* | sh[34]-*-*)
++  sh-*-* | sh[34]*-*-*)
+     conftest_s='
+ 	.section ".tdata","awT",@progbits
+ foo:	.long	25
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/800-arm-bigendian.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/800-arm-bigendian.patch
new file mode 100644
index 0000000..50088cf
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/800-arm-bigendian.patch
@@ -0,0 +1,34 @@
+By Lennert Buytenhek <buytenh@wantstofly.org>
+Adds support for arm*b-linux* big-endian ARM targets
+
+See http://gcc.gnu.org/PR16350
+
+Index: gcc-4.6.0/gcc/config/arm/linux-elf.h
+===================================================================
+--- gcc-4.6.0.orig/gcc/config/arm/linux-elf.h
++++ gcc-4.6.0/gcc/config/arm/linux-elf.h
+@@ -51,7 +51,7 @@
+ 
+ #undef  MULTILIB_DEFAULTS
+ #define MULTILIB_DEFAULTS \
+-	{ "marm", "mlittle-endian", "mhard-float", "mno-thumb-interwork" }
++	{ "marm", TARGET_ENDIAN_OPTION, "mhard-float", "mno-thumb-interwork" }
+ 
+ /* Now we define the strings used to build the spec file.  */
+ #undef  LIB_SPEC
+Index: gcc-4.6.0/gcc/config.gcc
+===================================================================
+--- gcc-4.6.0.orig/gcc/config.gcc
++++ gcc-4.6.0/gcc/config.gcc
+@@ -822,6 +822,11 @@ arm*-*-linux*)			# ARM GNU/Linux with EL
+ 	esac
+ 	tmake_file="${tmake_file} t-linux arm/t-arm"
+ 	case ${target} in
++	arm*b-*)
++		tm_defines="${tm_defines} TARGET_BIG_ENDIAN_DEFAULT=1"
++		;;
++	esac
++	case ${target} in
+ 	arm*-*-linux-*eabi)
+ 	    tm_file="$tm_file arm/bpabi.h arm/linux-eabi.h"
+ 	    tm_file="$tm_file ../../libgcc/config/arm/bpabi-lib.h"
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/904-flatten-switch-stmt-00.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/904-flatten-switch-stmt-00.patch
new file mode 100644
index 0000000..2623313
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/904-flatten-switch-stmt-00.patch
@@ -0,0 +1,74 @@
+Hi,
+
+The attached patch makes sure that we create smaller object code for
+simple switch statements. We just make sure to flatten the switch
+statement into an if-else chain, basically.
+
+This fixes a size-regression as compared to gcc-3.4, as can be seen
+below.
+
+2007-04-15  Bernhard Fischer  <..>
+
+	* stmt.c (expand_case): Do not create a complex binary tree when
+	optimizing for size but rather use the simple ordered list.
+	(emit_case_nodes): do not emit jumps to the default_label when
+	optimizing for size.
+
+Not regtested so far.
+Comments?
+
+Attached is the test switch.c mentioned below.
+
+$ for i in 2.95 3.3 3.4 4.0 4.1 4.2.orig-HEAD 4.3.orig-HEAD 4.3-HEAD;do
+gcc-$i  -DCHAIN -Os -o switch-CHAIN-$i.o -c switch.c ;done
+$ for i in 2.95 3.3 3.4 4.0 4.1 4.2.orig-HEAD 4.3.orig-HEAD 4.3-HEAD;do
+gcc-$i  -UCHAIN -Os -o switch-$i.o -c switch.c ;done
+
+$ size switch-*.o
+   text	   data	    bss	    dec	    hex	filename
+    169	      0	      0	    169	     a9	switch-2.95.o
+    115	      0	      0	    115	     73	switch-3.3.o
+    103	      0	      0	    103	     67	switch-3.4.o
+    124	      0	      0	    124	     7c	switch-4.0.o
+    124	      0	      0	    124	     7c	switch-4.1.o
+    124	      0	      0	    124	     7c	switch-4.2.orig-HEAD.o
+     95	      0	      0	     95	     5f	switch-4.3-HEAD.o
+    124	      0	      0	    124	     7c	switch-4.3.orig-HEAD.o
+    166	      0	      0	    166	     a6	switch-CHAIN-2.95.o
+    111	      0	      0	    111	     6f	switch-CHAIN-3.3.o
+     95	      0	      0	     95	     5f	switch-CHAIN-3.4.o
+     95	      0	      0	     95	     5f	switch-CHAIN-4.0.o
+     95	      0	      0	     95	     5f	switch-CHAIN-4.1.o
+     95	      0	      0	     95	     5f	switch-CHAIN-4.2.orig-HEAD.o
+     95	      0	      0	     95	     5f	switch-CHAIN-4.3-HEAD.o
+     95	      0	      0	     95	     5f	switch-CHAIN-4.3.orig-HEAD.o
+
+
+Content-Type: text/x-diff; charset=us-ascii
+Content-Disposition: attachment; filename="gcc-4.3.gcc-flatten-switch-stmt.00.diff"
+
+Index: gcc-4.6.0/gcc/stmt.c
+===================================================================
+--- gcc-4.6.0.orig/gcc/stmt.c
++++ gcc-4.6.0/gcc/stmt.c
+@@ -2478,7 +2478,11 @@ expand_case (gimple stmt)
+ 	     default code is emitted.  */
+ 
+ 	  use_cost_table = estimate_case_costs (case_list);
+-	  balance_case_nodes (&case_list, NULL);
++	  /* When optimizing for size, we want a straight list to avoid
++	     jumps as much as possible. This basically creates an if-else
++	     chain.  */
++	  if (!optimize_size)
++	    balance_case_nodes (&case_list, NULL);
+ 	  emit_case_nodes (index, case_list, default_label, index_type);
+ 	  if (default_label)
+ 	    emit_jump (default_label);
+@@ -3046,6 +3050,7 @@ emit_case_nodes (rtx index, case_node_pt
+ 	    {
+ 	      if (!node_has_low_bound (node, index_type))
+ 		{
++		  if (!optimize_size) /* don't jl to the .default_label. */
+ 		  emit_cmp_and_jump_insns (index,
+ 					   convert_modes
+ 					   (mode, imode,
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/COLLECT_GCC_OPTIONS.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/COLLECT_GCC_OPTIONS.patch
new file mode 100644
index 0000000..8b53b83
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/COLLECT_GCC_OPTIONS.patch
@@ -0,0 +1,23 @@
+#This patck added --sysroot into COLLECT_GCC_OPTIONS which is used to
+#invoke collect2.
+
+Index: gcc-4.6.0/gcc/gcc.c
+===================================================================
+--- gcc-4.6.0.orig/gcc/gcc.c
++++ gcc-4.6.0/gcc/gcc.c
+@@ -3948,6 +3948,15 @@ set_collect_gcc_options (void)
+ 		sizeof ("COLLECT_GCC_OPTIONS=") - 1);
+ 
+   first_time = TRUE;
++#ifdef HAVE_LD_SYSROOT
++  if (target_system_root_changed && target_system_root)
++    {
++      obstack_grow (&collect_obstack, "'--sysroot=", sizeof("'--sysroot=")-1);
++      obstack_grow (&collect_obstack, target_system_root,strlen(target_system_root));
++      obstack_grow (&collect_obstack, "'", 1);
++      first_time = FALSE;
++    }
++#endif
+   for (i = 0; (int) i < n_switches; i++)
+     {
+       const char *const *args;
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch
new file mode 100644
index 0000000..ffb2267
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch
@@ -0,0 +1,33 @@
+# by default c++ include directories are not relative to "--sysroot"
+# which brings one trouble when using the toolchain in an environment
+# where the build directory generating that toolchain doesn't exist,
+# e.g. in sstate, machine specific sysroot and relocatable SDK
+# toolchain. This patch now enables c++ include paths under sysroot.
+# This way it's enough as long as "--sysroot" is correctly enabled
+# in the new environment.
+#
+# Signed-off-by Kevin Tian <kevin.tian@intel.com>, 2010-12-30
+
+Index: gcc-4.6.0/gcc/cppdefault.c
+===================================================================
+--- gcc-4.6.0.orig/gcc/cppdefault.c
++++ gcc-4.6.0/gcc/cppdefault.c
+@@ -48,15 +48,15 @@ const struct default_include cpp_include
+ = {
+ #ifdef GPLUSPLUS_INCLUDE_DIR
+     /* Pick up GNU C++ generic include files.  */
+-    { GPLUSPLUS_INCLUDE_DIR, "G++", 1, 1, 0, 0 },
++    { GPLUSPLUS_INCLUDE_DIR, "G++", 1, 1, 1, 0 },
+ #endif
+ #ifdef GPLUSPLUS_TOOL_INCLUDE_DIR
+     /* Pick up GNU C++ target-dependent include files.  */
+-    { GPLUSPLUS_TOOL_INCLUDE_DIR, "G++", 1, 1, 0, 1 },
++    { GPLUSPLUS_TOOL_INCLUDE_DIR, "G++", 1, 1, 1, 1 },
+ #endif
+ #ifdef GPLUSPLUS_BACKWARD_INCLUDE_DIR
+     /* Pick up GNU C++ backward and deprecated include files.  */
+-    { GPLUSPLUS_BACKWARD_INCLUDE_DIR, "G++", 1, 1, 0, 0 },
++    { GPLUSPLUS_BACKWARD_INCLUDE_DIR, "G++", 1, 1, 1, 0 },
+ #endif
+ #ifdef GCC_INCLUDE_DIR
+     /* This is the dir for gcc's private headers.  */
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/arm-bswapsi2.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/arm-bswapsi2.patch
new file mode 100644
index 0000000..7ac61a6
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/arm-bswapsi2.patch
@@ -0,0 +1,13 @@
+Index: gcc-4.5/gcc/config/arm/arm.md
+===================================================================
+--- gcc-4.5.orig/gcc/config/arm/arm.md	2010-06-17 09:13:07.000000000 -0700
++++ gcc-4.5/gcc/config/arm/arm.md	2010-06-22 08:08:45.397212002 -0700
+@@ -11267,7 +11267,7 @@
+ (define_expand "bswapsi2"
+   [(set (match_operand:SI 0 "s_register_operand" "=r")
+   	(bswap:SI (match_operand:SI 1 "s_register_operand" "r")))]
+-"TARGET_EITHER"
++"TARGET_EITHER && (arm_arch6 && !optimize_size)"
+ "
+   if (!arm_arch6)
+     {
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/arm-nolibfloat.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/arm-nolibfloat.patch
new file mode 100644
index 0000000..2175519
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/arm-nolibfloat.patch
@@ -0,0 +1,24 @@
+# Dimitry Andric <dimitry@andric.com>, 2004-05-01
+#
+# * Removed the extra -lfloat option from LIBGCC_SPEC, since it isn't needed
+#   anymore.  (The required functions are now in libgcc.)
+# 
+# Fixes errors like
+# arm-softfloat-linux-gnu/3.4.0/../../../../arm-softfloat-linux-gnu/bin/ld: cannot find -lfloat
+# collect2: ld returned 1 exit status
+# make[2]: *** [arm-softfloat-linux-gnu/gcc-3.4.0-glibc-2.3.2/build-glibc/iconvdata/ISO8859-1.so] Error 1
+# when building glibc-2.3.3 with gcc-3.4.0 for arm-softfloat
+
+Index: gcc-4.6.0/gcc/config/arm/linux-elf.h
+===================================================================
+--- gcc-4.6.0.orig/gcc/config/arm/linux-elf.h
++++ gcc-4.6.0/gcc/config/arm/linux-elf.h
+@@ -60,7 +60,7 @@
+    %{shared:-lc} \
+    %{!shared:%{profile:-lc_p}%{!profile:-lc}}"
+ 
+-#define LIBGCC_SPEC "%{msoft-float:-lfloat} %{mfloat-abi=soft*:-lfloat} -lgcc"
++#define LIBGCC_SPEC "-lgcc"
+ 
+ #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
+ 
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/arm-softfloat.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/arm-softfloat.patch
new file mode 100644
index 0000000..908e2d8
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/arm-softfloat.patch
@@ -0,0 +1,16 @@
+Index: gcc-4.6.0/gcc/config/arm/t-linux
+===================================================================
+--- gcc-4.6.0.orig/gcc/config/arm/t-linux
++++ gcc-4.6.0/gcc/config/arm/t-linux
+@@ -23,7 +23,10 @@ TARGET_LIBGCC2_CFLAGS = -fomit-frame-poi
+ 
+ LIB1ASMSRC = arm/lib1funcs.asm
+ LIB1ASMFUNCS = _udivsi3 _divsi3 _umodsi3 _modsi3 _dvmd_lnx _clzsi2 _clzdi2 \
+-	_arm_addsubdf3 _arm_addsubsf3
++    _negdf2 _addsubdf3 _muldivdf3 _cmpdf2 _unorddf2 _fixdfsi _fixunsdfsi \
++    _truncdfsf2 _negsf2 _addsubsf3 _muldivsf3 _cmpsf2 _unordsf2 \
++    _fixsfsi _fixunssfsi _floatdidf _floatdisf _floatundisf _floatundidf
++#	_arm_addsubdf3 _arm_addsubsf3
+ 
+ # MULTILIB_OPTIONS = mhard-float/msoft-float
+ # MULTILIB_DIRNAMES = hard-float soft-float
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/arm-unbreak-eabi-armv4t.dpatch b/meta/recipes-devtools/gcc/gcc-4.6.0/arm-unbreak-eabi-armv4t.dpatch
new file mode 100644
index 0000000..7bb8887
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/arm-unbreak-eabi-armv4t.dpatch
@@ -0,0 +1,36 @@
+#! /bin/sh -e
+
+# DP: Fix armv4t build on ARM
+
+dir=
+if [ $# -eq 3 -a "$2" = '-d' ]; then
+    pdir="-d $3"
+    dir="$3/"
+elif [ $# -ne 1 ]; then
+    echo >&2 "`basename $0`: script expects -patch|-unpatch as argument"
+    exit 1
+fi
+case "$1" in
+    -patch)
+        patch $pdir -f --no-backup-if-mismatch -p1 < $0
+        ;;
+    -unpatch)
+        patch $pdir -f --no-backup-if-mismatch -R -p1 < $0
+        ;;
+    *)
+        echo >&2 "`basename $0`: script expects -patch|-unpatch as argument"
+        exit 1
+esac
+exit 0
+
+--- src/gcc/config/arm/linux-eabi.h.orig	2007-11-24 12:37:38.000000000 +0000
++++ src/gcc/config/arm/linux-eabi.h	2007-11-24 12:39:41.000000000 +0000
+@@ -44,7 +44,7 @@
+    The ARM10TDMI core is the default for armv5t, so set
+    SUBTARGET_CPU_DEFAULT to achieve this.  */
+ #undef  SUBTARGET_CPU_DEFAULT
+-#define SUBTARGET_CPU_DEFAULT TARGET_CPU_arm10tdmi
++#define SUBTARGET_CPU_DEFAULT TARGET_CPU_arm9tdmi
+ 
+ /* TARGET_BIG_ENDIAN_DEFAULT is set in
+    config.gcc for big endian configurations.  */
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/cache-amnesia.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/cache-amnesia.patch
new file mode 100644
index 0000000..3a98b02
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/cache-amnesia.patch
@@ -0,0 +1,31 @@
+---
+ gcc/configure    |    2 +-
+ gcc/configure.ac |    2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+Index: gcc-4.6.0/gcc/configure
+===================================================================
+--- gcc-4.6.0.orig/gcc/configure
++++ gcc-4.6.0/gcc/configure
+@@ -10898,7 +10898,7 @@ else
+ 	saved_CFLAGS="${CFLAGS}"
+ 	CC="${CC_FOR_BUILD}" CFLAGS="${CFLAGS_FOR_BUILD}" \
+ 	LDFLAGS="${LDFLAGS_FOR_BUILD}" \
+-	${realsrcdir}/configure \
++	CONFIG_SITE= ${realsrcdir}/configure --cache-file=./other.cache \
+ 		--enable-languages=${enable_languages-all} \
+ 		--target=$target_alias --host=$build_alias --build=$build_alias
+ 	CFLAGS="${saved_CFLAGS}"
+Index: gcc-4.6.0/gcc/configure.ac
+===================================================================
+--- gcc-4.6.0.orig/gcc/configure.ac
++++ gcc-4.6.0/gcc/configure.ac
+@@ -1435,7 +1435,7 @@ else
+ 	saved_CFLAGS="${CFLAGS}"
+ 	CC="${CC_FOR_BUILD}" CFLAGS="${CFLAGS_FOR_BUILD}" \
+ 	LDFLAGS="${LDFLAGS_FOR_BUILD}" \
+-	${realsrcdir}/configure \
++	CONFIG_SITE= ${realsrcdir}/configure --cache-file=./other.cache \
+ 		--enable-languages=${enable_languages-all} \
+ 		--target=$target_alias --host=$build_alias --build=$build_alias
+ 	CFLAGS="${saved_CFLAGS}"
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/disable_relax_pic_calls_flag.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/disable_relax_pic_calls_flag.patch
new file mode 100644
index 0000000..4f73cc8
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/disable_relax_pic_calls_flag.patch
@@ -0,0 +1,46 @@
+GCC: disable MASK_RELAX_PIC_CALLS bit
+
+The new feature added after 4.3.3
+"http://www.pubbs.net/200909/gcc/94048-patch-add-support-for-rmipsjalr.html"
+will cause cc1plus eat up all the system memory when build webkit-gtk.
+The function mips_get_pic_call_symbol keeps on recursively calling itself.
+Disable this feature to walk aside the bug.
+
+Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
+
+Index: gcc-4.6.0/gcc/configure
+===================================================================
+--- gcc-4.6.0.orig/gcc/configure
++++ gcc-4.6.0/gcc/configure
+@@ -24887,13 +24887,6 @@ $as_echo_n "checking assembler and linke
+         rm -f conftest.*
+       fi
+     fi
+-    if test $gcc_cv_as_ld_jalr_reloc = yes; then
+-      if test x$target_cpu_default = x; then
+-        target_cpu_default=MASK_RELAX_PIC_CALLS
+-      else
+-        target_cpu_default="($target_cpu_default)|MASK_RELAX_PIC_CALLS"
+-      fi
+-    fi
+     { $as_echo "$as_me:${as_lineno-$LINENO}: result: $gcc_cv_as_ld_jalr_reloc" >&5
+ $as_echo "$gcc_cv_as_ld_jalr_reloc" >&6; }
+ 
+Index: gcc-4.6.0/gcc/configure.ac
+===================================================================
+--- gcc-4.6.0.orig/gcc/configure.ac
++++ gcc-4.6.0/gcc/configure.ac
+@@ -3764,13 +3764,6 @@ x:
+         rm -f conftest.*
+       fi
+     fi
+-    if test $gcc_cv_as_ld_jalr_reloc = yes; then
+-      if test x$target_cpu_default = x; then
+-        target_cpu_default=MASK_RELAX_PIC_CALLS
+-      else
+-        target_cpu_default="($target_cpu_default)|MASK_RELAX_PIC_CALLS"
+-      fi
+-    fi
+     AC_MSG_RESULT($gcc_cv_as_ld_jalr_reloc)
+ 
+     AC_CACHE_CHECK([linker for .eh_frame personality relaxation],
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/fortran-cross-compile-hack.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/fortran-cross-compile-hack.patch
new file mode 100644
index 0000000..348c770
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/fortran-cross-compile-hack.patch
@@ -0,0 +1,30 @@
+* Fortran would have searched for arm-angstrom-gnueabi-gfortran but would have used
+  used gfortan. For gcc_4.2.2.bb we want to use the gfortran compiler from our cross
+  directory.
+
+Index: gcc-4.5+svnr155514/libgfortran/configure
+===================================================================
+--- gcc-4.5+svnr155514.orig/libgfortran/configure	2009-12-29 22:02:01.000000000 -0800
++++ gcc-4.5+svnr155514/libgfortran/configure	2009-12-30 08:12:40.889091657 -0800
+@@ -11655,7 +11655,7 @@ CC="$lt_save_CC"
+ 
+ # We need gfortran to compile parts of the library
+ #AC_PROG_FC(gfortran)
+-FC="$GFORTRAN"
++#FC="$GFORTRAN"
+ ac_ext=${ac_fc_srcext-f}
+ ac_compile='$FC -c $FCFLAGS $ac_fcflags_srcext conftest.$ac_ext >&5'
+ ac_link='$FC -o conftest$ac_exeext $FCFLAGS $LDFLAGS $ac_fcflags_srcext conftest.$ac_ext $LIBS >&5'
+Index: gcc-4.5+svnr155514/libgfortran/configure.ac
+===================================================================
+--- gcc-4.5+svnr155514.orig/libgfortran/configure.ac	2009-12-29 22:02:01.000000000 -0800
++++ gcc-4.5+svnr155514/libgfortran/configure.ac	2009-12-30 08:12:13.453094218 -0800
+@@ -187,7 +187,7 @@ AC_SUBST(enable_static)
+ 
+ # We need gfortran to compile parts of the library
+ #AC_PROG_FC(gfortran)
+-FC="$GFORTRAN"
++#FC="$GFORTRAN"
+ AC_PROG_FC(gfortran)
+ 
+ # extra LD Flags which are required for targets
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4.0.2-e300c2c3.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4.0.2-e300c2c3.patch
new file mode 100644
index 0000000..d1df8b2
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4.0.2-e300c2c3.patch
@@ -0,0 +1,319 @@
+Adds support for Freescale Power architecture e300c2 and e300c3 cores.
+http://www.bitshrine.org/gpp/tc-fsl-x86lnx-e300c3-nptl-4.0.2-2.src.rpm
+
+Leon Woestenberg <leonw@mailcan.com>
+
+---
+ gcc/config.gcc                |    2 
+ gcc/config/rs6000/e300c2c3.md |  189 ++++++++++++++++++++++++++++++++++++++++++
+ gcc/config/rs6000/rs6000.c    |   24 +++++
+ gcc/config/rs6000/rs6000.h    |    4 
+ gcc/config/rs6000/rs6000.md   |    3 
+ 5 files changed, 220 insertions(+), 2 deletions(-)
+
+Index: gcc-4.3.1/gcc/config/rs6000/e300c2c3.md
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ gcc-4.3.1/gcc/config/rs6000/e300c2c3.md	2008-08-23 16:51:33.000000000 -0700
+@@ -0,0 +1,189 @@
++;; Pipeline description for Motorola PowerPC e300c3 core.
++;;   Copyright (C) 2003 Free Software Foundation, Inc.
++;;
++;; This file is part of GCC.
++
++;; GCC is free software; you can redistribute it and/or modify it
++;; under the terms of the GNU General Public License as published
++;; by the Free Software Foundation; either version 2, or (at your
++;; option) any later version.
++
++;; GCC is distributed in the hope that it will be useful, but WITHOUT
++;; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
++;; or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
++;; License for more details.
++
++;; You should have received a copy of the GNU General Public License
++;; along with GCC; see the file COPYING.  If not, write to the
++;; Free Software Foundation, 59 Temple Place - Suite 330, Boston,
++;; MA 02111-1307, USA.
++
++(define_automaton "ppce300c3_most,ppce300c3_long,ppce300c3_retire")
++(define_cpu_unit "ppce300c3_decode_0,ppce300c3_decode_1" "ppce300c3_most")
++
++;; We don't simulate general issue queue (GIC).  If we have SU insn
++;; and then SU1 insn, they can not be issued on the same cycle
++;; (although SU1 insn and then SU insn can be issued) because the SU
++;; insn will go to SU1 from GIC0 entry.  Fortunately, the first cycle
++;; multipass insn scheduling will find the situation and issue the SU1
++;; insn and then the SU insn.
++(define_cpu_unit "ppce300c3_issue_0,ppce300c3_issue_1"   "ppce300c3_most")
++
++;; We could describe completion buffers slots in combination with the
++;; retirement units and the order of completion but the result
++;; automaton would behave in the same way because we can not describe
++;; real latency time with taking in order completion into account.
++;; Actually we could define the real latency time by querying reserved
++;; automaton units but the current scheduler uses latency time before
++;; issuing insns and making any reservations.
++;;
++;; So our description is aimed to achieve a insn schedule in which the
++;; insns would not wait in the completion buffer.
++(define_cpu_unit "ppce300c3_retire_0,ppce300c3_retire_1" "ppce300c3_retire")
++
++;; Branch unit:
++(define_cpu_unit "ppce300c3_bu" "ppce300c3_most")
++
++;; IU:
++(define_cpu_unit "ppce300c3_iu0_stage0,ppce300c3_iu1_stage0" "ppce300c3_most")
++
++;; IU: This used to describe non-pipelined division.
++(define_cpu_unit "ppce300c3_mu_div" "ppce300c3_long")
++
++;; SRU:
++(define_cpu_unit "ppce300c3_sru_stage0" "ppce300c3_most")
++
++;; Here we simplified LSU unit description not describing the stages.
++(define_cpu_unit "ppce300c3_lsu" "ppce300c3_most")
++
++;; FPU:
++(define_cpu_unit "ppce300c3_fpu" "ppce300c3_most")
++
++;; The following units are used to make automata deterministic
++(define_cpu_unit "present_ppce300c3_decode_0" "ppce300c3_most")
++(define_cpu_unit "present_ppce300c3_issue_0" "ppce300c3_most")
++(define_cpu_unit "present_ppce300c3_retire_0" "ppce300c3_retire")
++(define_cpu_unit "present_ppce300c3_iu0_stage0" "ppce300c3_most")
++
++;; The following sets to make automata deterministic when option ndfa is used.
++(presence_set "present_ppce300c3_decode_0" "ppce300c3_decode_0")
++(presence_set "present_ppce300c3_issue_0" "ppce300c3_issue_0")
++(presence_set "present_ppce300c3_retire_0" "ppce300c3_retire_0")
++(presence_set "present_ppce300c3_iu0_stage0" "ppce300c3_iu0_stage0")
++
++;; Some useful abbreviations.
++(define_reservation "ppce300c3_decode"
++    "ppce300c3_decode_0|ppce300c3_decode_1+present_ppce300c3_decode_0")
++(define_reservation "ppce300c3_issue"
++    "ppce300c3_issue_0|ppce300c3_issue_1+present_ppce300c3_issue_0")
++(define_reservation "ppce300c3_retire"
++   "ppce300c3_retire_0|ppce300c3_retire_1+present_ppce300c3_retire_0")
++(define_reservation "ppce300c3_iu_stage0"
++   "ppce300c3_iu0_stage0|ppce300c3_iu1_stage0+present_ppce300c3_iu0_stage0")
++
++;; Compares can be executed either one of the IU or SRU
++(define_insn_reservation "ppce300c3_cmp" 1
++  (and (eq_attr "type" "cmp,compare,delayed_compare,fast_compare")
++       (ior (eq_attr "cpu" "ppce300c2") (eq_attr "cpu" "ppce300c3")))
++  "ppce300c3_decode,ppce300c3_issue+(ppce300c3_iu_stage0|ppce300c3_sru_stage0) \
++        +ppce300c3_retire")
++
++;; Other one cycle IU insns
++(define_insn_reservation "ppce300c3_iu" 1
++  (and (eq_attr "type" "integer,insert_word")
++       (ior (eq_attr "cpu" "ppce300c2") (eq_attr "cpu" "ppce300c3")))
++  "ppce300c3_decode,ppce300c3_issue+ppce300c3_iu_stage0+ppce300c3_retire")
++
++;; Branch.  Actually this latency time is not used by the scheduler.
++(define_insn_reservation "ppce300c3_branch" 1
++  (and (eq_attr "type" "jmpreg,branch")
++       (ior (eq_attr "cpu" "ppce300c2") (eq_attr "cpu" "ppce300c3")))
++  "ppce300c3_decode,ppce300c3_bu,ppce300c3_retire")
++
++;; Multiply is non-pipelined but can be executed in any IU
++(define_insn_reservation "ppce300c3_multiply" 2
++  (and (eq_attr "type" "imul,imul2,imul3,imul_compare")
++       (ior (eq_attr "cpu" "ppce300c2") (eq_attr "cpu" "ppce300c3")))
++  "ppce300c3_decode,ppce300c3_issue+ppce300c3_iu_stage0, \
++   ppce300c3_iu_stage0+ppce300c3_retire")
++
++;; Divide.  We use the average latency time here.  We omit reserving a
++;; retire unit because of the result automata will be huge.
++(define_insn_reservation "ppce300c3_divide" 20
++  (and (eq_attr "type" "idiv")
++       (ior (eq_attr "cpu" "ppce300c2") (eq_attr "cpu" "ppce300c3")))
++  "ppce300c3_decode,ppce300c3_issue+ppce300c3_iu_stage0+ppce300c3_mu_div,\
++   ppce300c3_mu_div*19")
++
++;; CR logical
++(define_insn_reservation "ppce300c3_cr_logical" 1
++  (and (eq_attr "type" "cr_logical,delayed_cr")
++       (ior (eq_attr "cpu" "ppce300c2") (eq_attr "cpu" "ppce300c3")))
++  "ppce300c3_decode,ppce300c3_issue+ppce300c3_sru_stage0+ppce300c3_retire")
++
++;; Mfcr
++(define_insn_reservation "ppce300c3_mfcr" 1
++  (and (eq_attr "type" "mfcr")
++       (ior (eq_attr "cpu" "ppce300c2") (eq_attr "cpu" "ppce300c3")))
++  "ppce300c3_decode,ppce300c3_issue+ppce300c3_sru_stage0+ppce300c3_retire")
++
++;; Mtcrf
++(define_insn_reservation "ppce300c3_mtcrf" 1
++  (and (eq_attr "type" "mtcr")
++       (ior (eq_attr "cpu" "ppce300c2") (eq_attr "cpu" "ppce300c3")))
++  "ppce300c3_decode,ppce300c3_issue+ppce300c3_sru_stage0+ppce300c3_retire")
++
++;; Mtjmpr
++(define_insn_reservation "ppce300c3_mtjmpr" 1
++  (and (eq_attr "type" "mtjmpr,mfjmpr")
++       (ior (eq_attr "cpu" "ppce300c2") (eq_attr "cpu" "ppce300c3")))
++  "ppce300c3_decode,ppce300c3_issue+ppce300c3_sru_stage0+ppce300c3_retire")
++
++;; Float point instructions
++(define_insn_reservation "ppce300c3_fpcompare" 3
++  (and (eq_attr "type" "fpcompare")
++       (eq_attr "cpu" "ppce300c3"))
++  "ppce300c3_decode,ppce300c3_issue+ppce300c3_fpu,nothing,ppce300c3_retire")
++
++(define_insn_reservation "ppce300c3_fp" 3
++  (and (eq_attr "type" "fp")
++       (eq_attr "cpu" "ppce300c3"))
++  "ppce300c3_decode,ppce300c3_issue+ppce300c3_fpu,nothing,ppce300c3_retire")
++
++(define_insn_reservation "ppce300c3_dmul" 4
++  (and (eq_attr "type" "dmul")
++       (eq_attr "cpu" "ppce300c3"))
++  "ppce300c3_decode,ppce300c3_issue+ppce300c3_fpu,ppce300c3_fpu,nothing,ppce300c3_retire")
++
++; Divides are not pipelined
++(define_insn_reservation "ppce300c3_sdiv" 18
++  (and (eq_attr "type" "sdiv")
++       (eq_attr "cpu" "ppce300c3"))
++  "ppce300c3_decode,ppce300c3_issue+ppce300c3_fpu,ppce300c3_fpu*17")
++
++(define_insn_reservation "ppce300c3_ddiv" 33
++  (and (eq_attr "type" "ddiv")
++       (eq_attr "cpu" "ppce300c3"))
++  "ppce300c3_decode,ppce300c3_issue+ppce300c3_fpu,ppce300c3_fpu*32")
++
++;; Loads
++(define_insn_reservation "ppce300c3_load" 2
++  (and (eq_attr "type" "load,load_ext,load_ext_u,load_ext_ux,load_ux,load_u")
++       (ior (eq_attr "cpu" "ppce300c2") (eq_attr "cpu" "ppce300c3")))
++  "ppce300c3_decode,ppce300c3_issue+ppce300c3_lsu,ppce300c3_retire")
++
++(define_insn_reservation "ppce300c3_fpload" 2
++  (and (eq_attr "type" "fpload,fpload_ux,fpload_u")
++       (eq_attr "cpu" "ppce300c3"))
++  "ppce300c3_decode,ppce300c3_issue+ppce300c3_lsu,ppce300c3_retire")
++
++;; Stores.
++(define_insn_reservation "ppce300c3_store" 2
++  (and (eq_attr "type" "store,store_ux,store_u")
++       (ior (eq_attr "cpu" "ppce300c2") (eq_attr "cpu" "ppce300c3")))
++  "ppce300c3_decode,ppce300c3_issue+ppce300c3_lsu,ppce300c3_retire")
++
++(define_insn_reservation "ppce300c3_fpstore" 2
++  (and (eq_attr "type" "fpstore,fpstore_ux,fpstore_u")
++       (eq_attr "cpu" "ppce300c3"))
++  "ppce300c3_decode,ppce300c3_issue+ppce300c3_lsu,ppce300c3_retire")
+Index: gcc-4.3.1/gcc/config/rs6000/rs6000.c
+===================================================================
+--- gcc-4.3.1.orig/gcc/config/rs6000/rs6000.c	2008-08-23 16:49:39.000000000 -0700
++++ gcc-4.3.1/gcc/config/rs6000/rs6000.c	2008-08-23 16:54:25.000000000 -0700
+@@ -669,6 +669,21 @@ struct processor_costs ppc8540_cost = {
+   1,			/* prefetch streams /*/
+ };
+ 
++/* Instruction costs on E300C2 and E300C3 cores.  */
++static const
++struct processor_costs ppce300c2c3_cost = {
++  COSTS_N_INSNS (4),    /* mulsi */
++  COSTS_N_INSNS (4),    /* mulsi_const */
++  COSTS_N_INSNS (4),    /* mulsi_const9 */
++  COSTS_N_INSNS (4),    /* muldi */
++  COSTS_N_INSNS (19),   /* divsi */
++  COSTS_N_INSNS (19),   /* divdi */
++  COSTS_N_INSNS (3),    /* fp */
++  COSTS_N_INSNS (4),    /* dmul */
++  COSTS_N_INSNS (18),   /* sdiv */
++  COSTS_N_INSNS (33),   /* ddiv */
++};
++
+ /* Instruction costs on POWER4 and POWER5 processors.  */
+ static const
+ struct processor_costs power4_cost = {
+@@ -1420,6 +1435,8 @@ rs6000_override_options (const char *def
+ 	 {"8540", PROCESSOR_PPC8540, POWERPC_BASE_MASK | MASK_STRICT_ALIGN},
+ 	 /* 8548 has a dummy entry for now.  */
+ 	 {"8548", PROCESSOR_PPC8540, POWERPC_BASE_MASK | MASK_STRICT_ALIGN},
++	 {"e300c2", PROCESSOR_PPCE300C2, POWERPC_BASE_MASK | MASK_SOFT_FLOAT},
++	 {"e300c3", PROCESSOR_PPCE300C3, POWERPC_BASE_MASK},
+ 	 {"860", PROCESSOR_MPCCORE, POWERPC_BASE_MASK | MASK_SOFT_FLOAT},
+ 	 {"970", PROCESSOR_POWER4,
+ 	  POWERPC_7400_MASK | MASK_PPC_GPOPT | MASK_MFCRF | MASK_POWERPC64},
+@@ -1845,6 +1862,11 @@ rs6000_override_options (const char *def
+ 	rs6000_cost = &ppc8540_cost;
+ 	break;
+ 
++      case PROCESSOR_PPCE300C2:
++      case PROCESSOR_PPCE300C3:
++	rs6000_cost = &ppce300c2c3_cost;
++	break;
++
+       case PROCESSOR_POWER4:
+       case PROCESSOR_POWER5:
+ 	rs6000_cost = &power4_cost;
+@@ -18606,6 +18628,8 @@ rs6000_issue_rate (void)
+   case CPU_PPC7400:
+   case CPU_PPC8540:
+   case CPU_CELL:
++  case CPU_PPCE300C2:
++  case CPU_PPCE300C3:
+     return 2;
+   case CPU_RIOS2:
+   case CPU_PPC604:
+Index: gcc-4.3.1/gcc/config/rs6000/rs6000.h
+===================================================================
+--- gcc-4.3.1.orig/gcc/config/rs6000/rs6000.h	2008-01-26 09:18:35.000000000 -0800
++++ gcc-4.3.1/gcc/config/rs6000/rs6000.h	2008-08-23 16:55:30.000000000 -0700
+@@ -117,6 +117,8 @@
+ %{mcpu=G5: -mpower4 -maltivec} \
+ %{mcpu=8540: -me500} \
+ %{mcpu=8548: -me500} \
++%{mcpu=e300c2: -mppc} \
++%{mcpu=e300c3: -mppc -mpmr} \
+ %{maltivec: -maltivec} \
+ -many"
+ 
+@@ -262,6 +264,8 @@ enum processor_type
+    PROCESSOR_PPC7400,
+    PROCESSOR_PPC7450,
+    PROCESSOR_PPC8540,
++   PROCESSOR_PPCE300C2,
++   PROCESSOR_PPCE300C3,
+    PROCESSOR_POWER4,
+    PROCESSOR_POWER5,
+    PROCESSOR_POWER6,
+Index: gcc-4.3.1/gcc/config/rs6000/rs6000.md
+===================================================================
+--- gcc-4.3.1.orig/gcc/config/rs6000/rs6000.md	2008-02-13 16:14:45.000000000 -0800
++++ gcc-4.3.1/gcc/config/rs6000/rs6000.md	2008-08-23 16:57:29.000000000 -0700
+@@ -133,7 +133,7 @@
+ ;; Processor type -- this attribute must exactly match the processor_type
+ ;; enumeration in rs6000.h.
+ 
+-(define_attr "cpu" "rios1,rios2,rs64a,mpccore,ppc403,ppc405,ppc440,ppc601,ppc603,ppc604,ppc604e,ppc620,ppc630,ppc750,ppc7400,ppc7450,ppc8540,power4,power5,power6,cell"
++(define_attr "cpu" "rios1,rios2,rs64a,mpccore,ppc403,ppc405,ppc440,ppc601,ppc603,ppc604,ppc604e,ppc620,ppc630,ppc750,ppc7400,ppc7450,ppc8540,power4,power5,power6,cell,ppce300c2,ppce300c3"
+   (const (symbol_ref "rs6000_cpu_attr")))
+ 
+ 
+@@ -166,6 +166,7 @@
+ (include "7xx.md")
+ (include "7450.md")
+ (include "8540.md")
++(include "e300c2c3.md")
+ (include "power4.md")
+ (include "power5.md")
+ (include "power6.md")
+Index: gcc-4.3.1/gcc/config.gcc
+===================================================================
+--- gcc-4.3.1.orig/gcc/config.gcc	2008-08-23 16:49:43.000000000 -0700
++++ gcc-4.3.1/gcc/config.gcc	2008-08-23 17:03:55.000000000 -0700
+@@ -3144,7 +3144,7 @@ case "${target}" in
+ 			| rios | rios1 | rios2 | rsc | rsc1 | rs64a \
+ 			| 401 | 403 | 405 | 405fp | 440 | 440fp | 505 \
+ 			| 601 | 602 | 603 | 603e | ec603e | 604 \
+-			| 604e | 620 | 630 | 740 | 750 | 7400 | 7450 \
++			| 604e | 620 | 630 | 740 | 750 | 7400 | 7450 | e300c[23] \
+ 			| 854[08] | 801 | 821 | 823 | 860 | 970 | G3 | G4 | G5 | cell)
+ 				# OK
+ 				;;
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
new file mode 100644
index 0000000..d249c1c
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
@@ -0,0 +1,31 @@
+---
+ configure    |    2 +-
+ configure.ac |    2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+Index: gcc-4.6.0/configure.ac
+===================================================================
+--- gcc-4.6.0.orig/configure.ac
++++ gcc-4.6.0/configure.ac
+@@ -3073,7 +3073,7 @@ fi
+ # for target_alias and gcc doesn't manage it consistently.
+ target_configargs="--cache-file=./config.cache ${target_configargs}"
+ 
+-FLAGS_FOR_TARGET=
++FLAGS_FOR_TARGET="$ARCH_FLAGS_FOR_TARGET"
+ case " $target_configdirs " in
+  *" newlib "*)
+   case " $target_configargs " in
+Index: gcc-4.6.0/configure
+===================================================================
+--- gcc-4.6.0.orig/configure
++++ gcc-4.6.0/configure
+@@ -7594,7 +7594,7 @@ fi
+ # for target_alias and gcc doesn't manage it consistently.
+ target_configargs="--cache-file=./config.cache ${target_configargs}"
+ 
+-FLAGS_FOR_TARGET=
++FLAGS_FOR_TARGET="$ARCH_FLAGS_FOR_TARGET"
+ case " $target_configdirs " in
+  *" newlib "*)
+   case " $target_configargs " in
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
new file mode 100644
index 0000000..428dd08
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
@@ -0,0 +1,114 @@
+Before committing, I noticed that PR/32161 was marked as a dup of PR/32009, but my previous patch did not fix it.
+
+This alternative patch is better because it lets you just use CFLAGS_FOR_TARGET to set the compilation flags for libgcc. Since bootstrapped target libraries are never compiled with the native compiler, it makes little sense to use different flags for stage1 and later stages. And it also makes little sense to use a different variable than CFLAGS_FOR_TARGET.
+
+Other changes I had to do include:
+
+- moving the creation of default CFLAGS_FOR_TARGET from Makefile.am to configure.ac, because otherwise the BOOT_CFLAGS are substituted into CFLAGS_FOR_TARGET (which is "-O2 -g $(CFLAGS)") via $(CFLAGS). It is also cleaner this way though.
+
+- passing the right CFLAGS to configure scripts as exported environment variables
+
+I also stopped passing LIBCFLAGS to configure scripts since they are unused in the whole src tree. And I updated the documentation as H-P reminded me to do.
+
+Bootstrapped/regtested i686-pc-linux-gnu, will commit to 4.4 shortly. Ok for 4.3?
+
+Paolo
+
+2008-02-19  Paolo Bonzini  <bonzini@gnu.org>
+
+        PR bootstrap/32009
+        PR bootstrap/32161
+
+	* configure.ac (CFLAGS_FOR_TARGET, CXXFLAGS_FOR_TARGET): Compute here.
+	* configure: Regenerate.
+
+	* Makefile.def: Define stage_libcflags for all bootstrap stages.
+	* Makefile.tpl (BOOT_LIBCFLAGS, STAGE2_LIBCFLAGS, STAGE3_LIBCFLAGS,
+	STAGE4_LIBCFLAGS): New.
+	(CFLAGS_FOR_TARGET, CXXFLAGS_FOR_TARGET): Subst from autoconf, without
+	$(SYSROOT_CFLAGS_FOR_TARGET) and $(DEBUG_PREFIX_CFLAGS_FOR_TARGET).
+	(BASE_TARGET_EXPORTS): Append them here to C{,XX}FLAGS.
+	(EXTRA_TARGET_FLAGS): Append them here to {LIB,}C{,XX}FLAGS.
+	(configure-stage[+id+]-[+prefix+][+module+]): Pass stage_libcflags
+	for target modules.  Don't export LIBCFLAGS.
+	(all-stage[+id+]-[+prefix+][+module+]): Pass stage_libcflags; pass
+	$(BASE_FLAGS_TO_PASS) where [+args+] was passed, and [+args+] after
+	the overridden CFLAGS_FOR_TARGET and CXXFLAGS_FOR_TARGET.
+	(invocations of `all'): Replace $(TARGET_FLAGS_TO_PASS) with
+	$(EXTRA_TARGET_FLAGS), $(FLAGS_TO_PASS) with $(EXTRA_HOST_FLAGS).
+	* Makefile.in: Regenerate.
+
+config:
+2008-02-19  Paolo Bonzini  <bonzini@gnu.org>
+
+	PR bootstrap/32009
+	* mh-ppc-darwin (BOOT_CFLAGS): Reenable.
+
+gcc:
+2008-02-19  Paolo Bonzini  <bonzini@gnu.org>
+
+	PR bootstrap/32009
+	* doc/install.texi: Correct references to CFLAGS, replacing them
+	with BOOT_CFLAGS.  Document flags used during bootstrap for
+	target libraries.
+
+
+---
+ Makefile.def           |   25 
+ Makefile.in            | 1845 ++++++++++++++++++++++++++++++-------------------
+ Makefile.tpl           |   91 +-
+ config/mh-ppc-darwin   |    3 
+ configure              |   36 
+ configure.ac           |   32 
+ gcc/Makefile.in        |    2 
+ gcc/configure          |    6 
+ gcc/configure.ac       |    3 
+ gcc/doc/install.texi   |   56 -
+ libiberty/Makefile.in  |  162 ++--
+ libiberty/configure    |   46 -
+ libiberty/configure.ac |   43 -
+ 13 files changed, 1454 insertions(+), 896 deletions(-)
+
+Index: gcc-4.6.0/configure
+===================================================================
+--- gcc-4.6.0.orig/configure
++++ gcc-4.6.0/configure
+@@ -6785,6 +6785,38 @@ if test "x$CXXFLAGS_FOR_TARGET" = x; the
+ fi
+ 
+ 
++# During gcc bootstrap, if we use some random cc for stage1 then CFLAGS
++# might be empty or "-g".  We don't require a C++ compiler, so CXXFLAGS
++# might also be empty (or "-g", if a non-GCC C++ compiler is in the path).
++# We want to ensure that TARGET libraries (which we know are built with
++# gcc) are built with "-O2 -g", so include those options when setting
++# CFLAGS_FOR_TARGET and CXXFLAGS_FOR_TARGET.
++if test "x$CFLAGS_FOR_TARGET" = x; then
++  CFLAGS_FOR_TARGET=$CFLAGS
++  case " $CFLAGS " in
++    *" -O2 "*) ;;
++    *) CFLAGS_FOR_TARGET="-O2 $CFLAGS" ;;
++  esac
++  case " $CFLAGS " in
++    *" -g "* | *" -g3 "*) ;;
++    *) CFLAGS_FOR_TARGET="-g $CFLAGS" ;;
++  esac
++fi
++
++
++if test "x$CXXFLAGS_FOR_TARGET" = x; then
++  CXXFLAGS_FOR_TARGET=$CXXFLAGS
++  case " $CXXFLAGS " in
++    *" -O2 "*) ;;
++    *) CXXFLAGS_FOR_TARGET="-O2 $CXXFLAGS" ;;
++  esac
++  case " $CXXFLAGS " in
++    *" -g "* | *" -g3 "*) ;;
++    *) CXXFLAGS_FOR_TARGET="-g $CXXFLAGS" ;;
++  esac
++fi
++
++
+ # Handle --with-headers=XXX.  If the value is not "yes", the contents of
+ # the named directory are copied to $(tooldir)/sys-include.
+ if test x"${with_headers}" != x && test x"${with_headers}" != xno ; then
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-arm-frename-registers.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-arm-frename-registers.patch
new file mode 100644
index 0000000..280b903
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-arm-frename-registers.patch
@@ -0,0 +1,25 @@
+http://gcc.gnu.org/bugzilla/show_bug.cgi?id=35964
+Index: gcc-4.3.0/gcc/regrename.c
+===================================================================
+--- gcc-4.3.0.orig/gcc/regrename.c	2008-05-28 08:31:15.000000000 -0700
++++ gcc-4.3.0/gcc/regrename.c	2008-05-28 08:34:00.000000000 -0700
+@@ -782,6 +782,10 @@
+ 	          || (predicated && recog_data.operand_type[i] == OP_OUT))
+ 		recog_data.operand_type[i] = OP_INOUT;
+ 	    }
++	  /* Unshare dup_loc RTL */
++	  for (i = 0; i < recog_data.n_dups; i++)
++	    *recog_data.dup_loc[i] = copy_rtx(*recog_data.dup_loc[i]);
++
+ 
+ 	  /* Step 1: Close chains for which we have overlapping reads.  */
+ 	  for (i = 0; i < n_ops; i++)
+@@ -813,7 +817,7 @@
+ 		    OP_IN, 0);
+ 
+ 	  for (i = 0; i < recog_data.n_dups; i++)
+-	    *recog_data.dup_loc[i] = copy_rtx (old_dups[i]);
++	    *recog_data.dup_loc[i] = old_dups[i];
+ 	  for (i = 0; i < n_ops; i++)
+ 	    *recog_data.operand_loc[i] = old_operands[i];
+ 	  if (recog_data.n_dups)
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-flags-for-build.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-flags-for-build.patch
new file mode 100644
index 0000000..f7beb78
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-flags-for-build.patch
@@ -0,0 +1,178 @@
+Index: gcc-4.6.0/Makefile.def
+===================================================================
+--- gcc-4.6.0.orig/Makefile.def
++++ gcc-4.6.0/Makefile.def
+@@ -243,6 +243,7 @@ flags_to_pass = { flag= AWK ; };
+ flags_to_pass = { flag= BISON ; };
+ flags_to_pass = { flag= CC_FOR_BUILD ; };
+ flags_to_pass = { flag= CFLAGS_FOR_BUILD ; };
++flags_to_pass = { flag= CPPFLAGS_FOR_BUILD ; };
+ flags_to_pass = { flag= CXX_FOR_BUILD ; };
+ flags_to_pass = { flag= EXPECT ; };
+ flags_to_pass = { flag= FLEX ; };
+Index: gcc-4.6.0/gcc/Makefile.in
+===================================================================
+--- gcc-4.6.0.orig/gcc/Makefile.in
++++ gcc-4.6.0/gcc/Makefile.in
+@@ -770,7 +770,7 @@ BUILD_LINKERFLAGS = $(BUILD_CFLAGS)
+ 
+ # Native linker and preprocessor flags.  For x-fragment overrides.
+ BUILD_LDFLAGS=@BUILD_LDFLAGS@
+-BUILD_CPPFLAGS=$(ALL_CPPFLAGS)
++BUILD_CPPFLAGS=$(INCLUDES) @BUILD_CPPFLAGS@ $(X_CPPFLAGS)
+ 
+ # Actual name to use when installing a native compiler.
+ GCC_INSTALL_NAME := $(shell echo gcc|sed '$(program_transform_name)')
+Index: gcc-4.6.0/gcc/configure.ac
+===================================================================
+--- gcc-4.6.0.orig/gcc/configure.ac
++++ gcc-4.6.0/gcc/configure.ac
+@@ -1784,16 +1784,18 @@ AC_SUBST(inhibit_libc)
+ # Also, we cannot run fixincludes.
+ 
+ # These are the normal (build=host) settings:
+-CC_FOR_BUILD='$(CC)'		AC_SUBST(CC_FOR_BUILD)
+-BUILD_CFLAGS='$(ALL_CFLAGS)'	AC_SUBST(BUILD_CFLAGS)
+-BUILD_LDFLAGS='$(LDFLAGS)'	AC_SUBST(BUILD_LDFLAGS)
+-STMP_FIXINC=stmp-fixinc		AC_SUBST(STMP_FIXINC)
++CC_FOR_BUILD='$(CC)'			AC_SUBST(CC_FOR_BUILD)
++BUILD_CFLAGS='$(ALL_CFLAGS)'		AC_SUBST(BUILD_CFLAGS)
++BUILD_LDFLAGS='$(LDFLAGS)'		AC_SUBST(BUILD_LDFLAGS)
++BUILD_CPPFLAGS='$(ALL_CPPFLAGS)'	AC_SUBST(BUILD_CPPFLAGS)
++STMP_FIXINC=stmp-fixinc			AC_SUBST(STMP_FIXINC)
+ 
+ # And these apply if build != host, or we are generating coverage data
+ if test x$build != x$host || test "x$coverage_flags" != x
+ then
+     BUILD_CFLAGS='$(INTERNAL_CFLAGS) $(T_CFLAGS) $(CFLAGS_FOR_BUILD)'
+     BUILD_LDFLAGS='$(LDFLAGS_FOR_BUILD)'
++    BUILD_CPPFLAGS='$(CPPFLAGS_FOR_BUILD)'
+ fi
+ 
+ # Expand extra_headers to include complete path.
+Index: gcc-4.6.0/Makefile.in
+===================================================================
+--- gcc-4.6.0.orig/Makefile.in
++++ gcc-4.6.0/Makefile.in
+@@ -338,6 +338,7 @@ AR_FOR_BUILD = @AR_FOR_BUILD@
+ AS_FOR_BUILD = @AS_FOR_BUILD@
+ CC_FOR_BUILD = @CC_FOR_BUILD@
+ CFLAGS_FOR_BUILD = @CFLAGS_FOR_BUILD@
++CPPFLAGS_FOR_BUILD = @CPPFLAGS_FOR_BUILD@
+ CXXFLAGS_FOR_BUILD = @CXXFLAGS_FOR_BUILD@
+ CXX_FOR_BUILD = @CXX_FOR_BUILD@
+ DLLTOOL_FOR_BUILD = @DLLTOOL_FOR_BUILD@
+@@ -691,6 +692,7 @@ BASE_FLAGS_TO_PASS = \
+ 	"BISON=$(BISON)" \
+ 	"CC_FOR_BUILD=$(CC_FOR_BUILD)" \
+ 	"CFLAGS_FOR_BUILD=$(CFLAGS_FOR_BUILD)" \
++	"CPPFLAGS_FOR_BUILD=$(CPPFLAGS_FOR_BUILD)" \
+ 	"CXX_FOR_BUILD=$(CXX_FOR_BUILD)" \
+ 	"EXPECT=$(EXPECT)" \
+ 	"FLEX=$(FLEX)" \
+Index: gcc-4.6.0/gcc/configure
+===================================================================
+--- gcc-4.6.0.orig/gcc/configure
++++ gcc-4.6.0/gcc/configure
+@@ -703,6 +703,7 @@ SED
+ LIBTOOL
+ collect2
+ STMP_FIXINC
++BUILD_CPPFLAGS
+ BUILD_LDFLAGS
+ BUILD_CFLAGS
+ CC_FOR_BUILD
+@@ -11382,6 +11383,7 @@ fi
+ CC_FOR_BUILD='$(CC)'
+ BUILD_CFLAGS='$(ALL_CFLAGS)'
+ BUILD_LDFLAGS='$(LDFLAGS)'
++BUILD_CPPFLAGS='$(ALL_CPPFLAGS)'
+ STMP_FIXINC=stmp-fixinc
+ 
+ # And these apply if build != host, or we are generating coverage data
+@@ -11389,6 +11391,7 @@ if test x$build != x$host || test "x$cov
+ then
+     BUILD_CFLAGS='$(INTERNAL_CFLAGS) $(T_CFLAGS) $(CFLAGS_FOR_BUILD)'
+     BUILD_LDFLAGS='$(LDFLAGS_FOR_BUILD)'
++    BUILD_CPPFLAGS='$(CPPFLAGS_FOR_BUILD)'
+ fi
+ 
+ # Expand extra_headers to include complete path.
+@@ -17505,7 +17508,7 @@ else
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 17508 "configure"
++#line 17511 "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
+@@ -17611,7 +17614,7 @@ else
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 17614 "configure"
++#line 17617 "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
+Index: gcc-4.6.0/Makefile.tpl
+===================================================================
+--- gcc-4.6.0.orig/Makefile.tpl
++++ gcc-4.6.0/Makefile.tpl
+@@ -341,6 +341,7 @@ AR_FOR_BUILD = @AR_FOR_BUILD@
+ AS_FOR_BUILD = @AS_FOR_BUILD@
+ CC_FOR_BUILD = @CC_FOR_BUILD@
+ CFLAGS_FOR_BUILD = @CFLAGS_FOR_BUILD@
++CPPFLAGS_FOR_BUILD = @CPPFLAGS_FOR_BUILD@
+ CXXFLAGS_FOR_BUILD = @CXXFLAGS_FOR_BUILD@
+ CXX_FOR_BUILD = @CXX_FOR_BUILD@
+ DLLTOOL_FOR_BUILD = @DLLTOOL_FOR_BUILD@
+Index: gcc-4.6.0/configure.ac
+===================================================================
+--- gcc-4.6.0.orig/configure.ac
++++ gcc-4.6.0/configure.ac
+@@ -3154,6 +3154,7 @@ esac
+ # our build compiler if desired.
+ if test x"${build}" = x"${host}" ; then
+   CFLAGS_FOR_BUILD=${CFLAGS_FOR_BUILD-${CFLAGS}}
++  CPPFLAGS_FOR_BUILD=${CPPFLAGS_FOR_BUILD-${CPPFLAGS}}
+   CXXFLAGS_FOR_BUILD=${CXXFLAGS_FOR_BUILD-${CXXFLAGS}}
+   LDFLAGS_FOR_BUILD=${LDFLAGS_FOR_BUILD-${LDFLAGS}}
+ fi
+@@ -3220,6 +3221,7 @@ AC_SUBST(AR_FOR_BUILD)
+ AC_SUBST(AS_FOR_BUILD)
+ AC_SUBST(CC_FOR_BUILD)
+ AC_SUBST(CFLAGS_FOR_BUILD)
++AC_SUBST(CPPFLAGS_FOR_BUILD)
+ AC_SUBST(CXXFLAGS_FOR_BUILD)
+ AC_SUBST(CXX_FOR_BUILD)
+ AC_SUBST(DLLTOOL_FOR_BUILD)
+Index: gcc-4.6.0/configure
+===================================================================
+--- gcc-4.6.0.orig/configure
++++ gcc-4.6.0/configure
+@@ -617,6 +617,7 @@ GCJ_FOR_BUILD
+ DLLTOOL_FOR_BUILD
+ CXX_FOR_BUILD
+ CXXFLAGS_FOR_BUILD
++CPPFLAGS_FOR_BUILD
+ CFLAGS_FOR_BUILD
+ CC_FOR_BUILD
+ AS_FOR_BUILD
+@@ -7675,6 +7676,7 @@ esac
+ # our build compiler if desired.
+ if test x"${build}" = x"${host}" ; then
+   CFLAGS_FOR_BUILD=${CFLAGS_FOR_BUILD-${CFLAGS}}
++  CPPFLAGS_FOR_BUILD=${CPPFLAGS_FOR_BUILD-${CPPFLAGS}}
+   CXXFLAGS_FOR_BUILD=${CXXFLAGS_FOR_BUILD-${CXXFLAGS}}
+   LDFLAGS_FOR_BUILD=${LDFLAGS_FOR_BUILD-${LDFLAGS}}
+ fi
+@@ -7740,6 +7742,7 @@ done
+ 
+ 
+ 
++
+ 
+ 
+ 
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-ice-hack.dpatch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-ice-hack.dpatch
new file mode 100644
index 0000000..84c5ef2
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-ice-hack.dpatch
@@ -0,0 +1,331 @@
+#! /bin/sh -e
+
+# DP: Retry the build on an ice, save the calling options and preprocessed
+# DP: source when the ice is reproducible.
+
+dir=
+if [ $# -eq 3 -a "$2" = '-d' ]; then
+    pdir="-d $3"
+    dir="$3/"
+elif [ $# -ne 1 ]; then
+    echo >&2 "`basename $0`: script expects -patch|-unpatch as argument"
+    exit 1
+fi
+case "$1" in
+    -patch)
+        patch $pdir -f --no-backup-if-mismatch -p0 < $0
+        ;;
+    -unpatch)
+        patch $pdir -f --no-backup-if-mismatch -R -p0 < $0
+        ;;
+    *)
+        echo >&2 "`basename $0`: script expects -patch|-unpatch as argument"
+        exit 1
+esac
+exit 0
+
+2004-01-23  Jakub Jelinek  <jakub@redhat.com>
+
+	* system.h (ICE_EXIT_CODE): Define.
+	* gcc.c (execute): Don't free first string early, but at the end
+	of the function.  Call retry_ice if compiler exited with
+	ICE_EXIT_CODE.
+	(retry_ice): New function.
+	* diagnostic.c (diagnostic_count_diagnostic,
+	diagnostic_action_after_output, error_recursion): Exit with
+	ICE_EXIT_CODE instead of FATAL_EXIT_CODE.
+
+--- gcc/diagnostic.c.orig	2007-09-30 10:48:13.000000000 +0000
++++ gcc/diagnostic.c	2007-09-30 10:49:57.000000000 +0000
+@@ -244,7 +244,7 @@
+       fnotice (stderr, "Please submit a full bug report,\n"
+ 	       "with preprocessed source if appropriate.\n"
+ 	       "See %s for instructions.\n", bug_report_url);
+-      exit (ICE_EXIT_CODE);
++      exit (FATAL_EXIT_CODE);
+ 
+     case DK_FATAL:
+       if (context->abort_on_error)
+--- gcc/gcc.c.orig	2007-09-30 10:48:13.000000000 +0000
++++ gcc/gcc.c	2007-09-30 10:48:39.000000000 +0000
+@@ -357,6 +357,9 @@
+ #if defined(HAVE_TARGET_OBJECT_SUFFIX) || defined(HAVE_TARGET_EXECUTABLE_SUFFIX)
+ static const char *convert_filename (const char *, int, int);
+ #endif
++#if !(defined (__MSDOS__) || defined (OS2) || defined (VMS))
++static void retry_ice (const char *prog, const char **argv);
++#endif
+ 
+ static const char *getenv_spec_function (int, const char **);
+ static const char *if_exists_spec_function (int, const char **);
+@@ -2999,7 +3002,7 @@
+ 	    }
+ 	}
+ 
+-      if (string != commands[i].prog)
++      if (i && string != commands[i].prog)
+ 	free (CONST_CAST (char *, string));
+     }
+ 
+@@ -3056,6 +3059,16 @@
+ 	else if (WIFEXITED (status)
+ 		 && WEXITSTATUS (status) >= MIN_FATAL_STATUS)
+ 	  {
++#if !(defined (__MSDOS__) || defined (OS2) || defined (VMS))
++	    /* For ICEs in cc1, cc1obj, cc1plus see if it is
++	       reproducible or not.  */
++	    char *p;
++	    if (WEXITSTATUS (status) == ICE_EXIT_CODE
++		&& i == 0
++		&& (p = strrchr (commands[0].argv[0], DIR_SEPARATOR))
++		&& ! strncmp (p + 1, "cc1", 3))
++	      retry_ice (commands[0].prog, commands[0].argv);
++#endif
+ 	    if (WEXITSTATUS (status) > greatest_status)
+ 	      greatest_status = WEXITSTATUS (status);
+ 	    ret_code = -1;
+@@ -3076,6 +3089,9 @@
+ 	  }
+       }
+ 
++    if (commands[0].argv[0] != commands[0].prog)
++      free ((PTR) commands[0].argv[0]);
++
+     return ret_code;
+   }
+ }
+@@ -6016,6 +6032,224 @@
+   switches[switchnum].validated = 1;
+ }
+ 
++#if !(defined (__MSDOS__) || defined (OS2) || defined (VMS))
++#define RETRY_ICE_ATTEMPTS 2
++
++static void
++retry_ice (const char *prog, const char **argv)
++{
++  int nargs, out_arg = -1, quiet = 0, attempt;
++  int pid, retries, sleep_interval;
++  const char **new_argv;
++  char *temp_filenames[RETRY_ICE_ATTEMPTS * 2 + 2];
++
++  if (input_filename == NULL || ! strcmp (input_filename, "-"))
++    return;
++
++  for (nargs = 0; argv[nargs] != NULL; ++nargs)
++    /* Only retry compiler ICEs, not preprocessor ones.  */
++    if (! strcmp (argv[nargs], "-E"))
++      return;
++    else if (argv[nargs][0] == '-' && argv[nargs][1] == 'o')
++      {
++	if (out_arg == -1)
++	  out_arg = nargs;
++	else
++	  return;
++      }
++    /* If the compiler is going to output any time information,
++       it might vary between invocations.  */
++    else if (! strcmp (argv[nargs], "-quiet"))
++      quiet = 1;
++    else if (! strcmp (argv[nargs], "-ftime-report"))
++      return;
++
++  if (out_arg == -1 || !quiet)
++    return;
++
++  memset (temp_filenames, '\0', sizeof (temp_filenames));
++  new_argv = alloca ((nargs + 3) * sizeof (const char *));
++  memcpy (new_argv, argv, (nargs + 1) * sizeof (const char *));
++  new_argv[nargs++] = "-frandom-seed=0";
++  new_argv[nargs] = NULL;
++  if (new_argv[out_arg][2] == '\0')
++    new_argv[out_arg + 1] = "-";
++  else
++    new_argv[out_arg] = "-o-";
++
++  for (attempt = 0; attempt < RETRY_ICE_ATTEMPTS + 1; ++attempt)
++    {
++      int fd = -1;
++      int status;
++
++      temp_filenames[attempt * 2] = make_temp_file (".out");
++      temp_filenames[attempt * 2 + 1] = make_temp_file (".err");
++
++      if (attempt == RETRY_ICE_ATTEMPTS)
++        {
++	  int i;
++	  int fd1, fd2;
++	  struct stat st1, st2;
++	  size_t n, len;
++	  char *buf;
++
++	  buf = xmalloc (8192);
++
++	  for (i = 0; i < 2; ++i)
++	    {
++	      fd1 = open (temp_filenames[i], O_RDONLY);
++	      fd2 = open (temp_filenames[2 + i], O_RDONLY);
++
++	      if (fd1 < 0 || fd2 < 0)
++		{
++		  i = -1;
++		  close (fd1);
++		  close (fd2);
++		  break;
++		}
++
++	      if (fstat (fd1, &st1) < 0 || fstat (fd2, &st2) < 0)
++		{
++		  i = -1;
++		  close (fd1);
++		  close (fd2);
++		  break;
++		}
++
++	      if (st1.st_size != st2.st_size)
++		{
++		  close (fd1);
++		  close (fd2);
++		  break;
++		}
++
++	      len = 0;
++	      for (n = st1.st_size; n; n -= len)
++		{
++		  len = n;
++		  if (len > 4096)
++		    len = 4096;
++
++		  if (read (fd1, buf, len) != (int) len
++		      || read (fd2, buf + 4096, len) != (int) len)
++		    {
++		      i = -1;
++		      break;
++		    }
++
++		  if (memcmp (buf, buf + 4096, len) != 0)
++		    break;
++		}
++
++	      close (fd1);
++	      close (fd2);
++
++	      if (n)
++		break;
++	    }
++
++	  free (buf);
++	  if (i == -1)
++	    break;
++
++	  if (i != 2)
++	    {
++	      notice ("The bug is not reproducible, so it is likely a hardware or OS problem.\n");
++	      break;
++	    }
++
++          fd = open (temp_filenames[attempt * 2], O_RDWR);
++	  if (fd < 0)
++	    break;
++	  write (fd, "//", 2);
++	  for (i = 0; i < nargs; i++)
++	    {
++	      write (fd, " ", 1);
++	      write (fd, new_argv[i], strlen (new_argv[i]));
++	    }
++	  write (fd, "\n", 1);
++	  new_argv[nargs] = "-E";
++	  new_argv[nargs + 1] = NULL;
++        }
++
++      /* Fork a subprocess; wait and retry if it fails.  */
++      sleep_interval = 1;
++      pid = -1;
++      for (retries = 0; retries < 4; retries++)
++	{
++	  pid = fork ();
++	  if (pid >= 0)
++	    break;
++	  sleep (sleep_interval);
++	  sleep_interval *= 2;
++	}
++
++      if (pid < 0)
++	break;
++      else if (pid == 0)
++	{
++	  if (attempt != RETRY_ICE_ATTEMPTS)
++	    fd = open (temp_filenames[attempt * 2], O_RDWR);
++	  if (fd < 0)
++	    exit (-1);
++	  if (fd != 1)
++	    {
++	      close (1);
++	      dup (fd);
++	      close (fd);
++	    }
++
++	  fd = open (temp_filenames[attempt * 2 + 1], O_RDWR);
++	  if (fd < 0)
++	    exit (-1);
++	  if (fd != 2)
++	    {
++	      close (2);
++	      dup (fd);
++	      close (fd);
++	    }
++
++	  if (prog == new_argv[0])
++	    execvp (prog, (char *const *) new_argv);
++	  else
++	    execv (new_argv[0], (char *const *) new_argv);
++	  exit (-1);
++	}
++
++      if (waitpid (pid, &status, 0) < 0)
++	break;
++
++      if (attempt < RETRY_ICE_ATTEMPTS
++	  && (! WIFEXITED (status) || WEXITSTATUS (status) != ICE_EXIT_CODE))
++	{
++	  notice ("The bug is not reproducible, so it is likely a hardware or OS problem.\n");
++	  break;
++	}
++      else if (attempt == RETRY_ICE_ATTEMPTS)
++	{
++	  close (fd);
++	  if (WIFEXITED (status)
++	      && WEXITSTATUS (status) == SUCCESS_EXIT_CODE)
++	    {
++	      notice ("Preprocessed source stored into %s file, please attach this to your bugreport.\n",
++		      temp_filenames[attempt * 2]);
++	      /* Make sure it is not deleted.  */
++	      free (temp_filenames[attempt * 2]);
++	      temp_filenames[attempt * 2] = NULL;
++	      break;
++	    }
++	}
++    }
++
++  for (attempt = 0; attempt < RETRY_ICE_ATTEMPTS * 2 + 2; attempt++)
++    if (temp_filenames[attempt])
++      {
++	unlink (temp_filenames[attempt]);
++	free (temp_filenames[attempt]);
++      }
++}
++#endif
++
+ /* Search for a file named NAME trying various prefixes including the
+    user's -B prefix and some standard ones.
+    Return the absolute file name found.  If nothing is found, return NAME.  */
+--- gcc/Makefile.in.orig	2007-09-30 10:48:13.000000000 +0000
++++ gcc/Makefile.in	2007-09-30 10:48:39.000000000 +0000
+@@ -192,6 +192,7 @@
+ build/gengtype-lex.o-warn = -Wno-error
+ # SYSCALLS.c misses prototypes
+ SYSCALLS.c.X-warn = -Wno-strict-prototypes -Wno-error
++build/gcc.o-warn = -Wno-error
+ 
+ # All warnings have to be shut off in stage1 if the compiler used then
+ # isn't gcc; configure determines that.  WARN_CFLAGS will be either
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-poison-dir-extend.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-poison-dir-extend.patch
new file mode 100644
index 0000000..d477105
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-poison-dir-extend.patch
@@ -0,0 +1,25 @@
+Add /sw/include and /opt/include based on the original
+zecke-no-host-includes.patch patch.  The original patch checked for
+/usr/include, /sw/include and /opt/include and then triggered a failure and
+aborted.
+
+Instead, we add the two missing items to the current scan.  If the user
+wants this to be a failure, they can add "-Werror=poison-system-directories".
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+Index: gcc-4.6.0/gcc/incpath.c
+===================================================================
+--- gcc-4.6.0.orig/gcc/incpath.c
++++ gcc-4.6.0/gcc/incpath.c
+@@ -363,7 +363,9 @@ merge_include_chains (const char *sysroo
+          {
+           if ((!strncmp (p->name, "/usr/include", 12))
+               || (!strncmp (p->name, "/usr/local/include", 18))
+-              || (!strncmp (p->name, "/usr/X11R6/include", 18)))
++              || (!strncmp (p->name, "/usr/X11R6/include", 18))
++              || (!strncmp (p->name, "/sw/include", 11))
++              || (!strncmp (p->name, "/opt/include", 12)))
+             warning (OPT_Wpoison_system_directories,
+                      "include location \"%s\" is unsafe for "
+                      "cross-compilation",
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-poison-parameters.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-poison-parameters.patch
new file mode 100644
index 0000000..f36fa81
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-poison-parameters.patch
@@ -0,0 +1,74 @@
+gcc: add poison parameters detection
+
+Add the logic that, if not configured with "--enable-target-optspace",
+gcc will meet error when build target app with "-Os" option.
+This could avoid potential binary crash.
+
+Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
+
+Index: gcc-4.6.0/gcc/config.in
+===================================================================
+--- gcc-4.6.0.orig/gcc/config.in
++++ gcc-4.6.0/gcc/config.in
+@@ -150,6 +150,12 @@
+ #endif
+ 
+ 
++/* Define to enable target optspace support. */
++#ifndef USED_FOR_TARGET
++#undef ENABLE_TARGET_OPTSPACE
++#endif
++
++
+ /* Define if you want all operations on RTL (the basic data structure of the
+    optimizer and back end) to be checked for dynamic type safety at runtime.
+    This is quite expensive. */
+Index: gcc-4.6.0/gcc/configure
+===================================================================
+--- gcc-4.6.0.orig/gcc/configure
++++ gcc-4.6.0/gcc/configure
+@@ -26434,6 +26434,13 @@ $as_echo "#define ENABLE_LIBQUADMATH_SUP
+ fi
+ 
+ 
++if test x"$enable_target_optspace" != x; then :
++
++$as_echo "#define ENABLE_TARGET_OPTSPACE 1" >>confdefs.h
++
++fi
++
++
+ # Configure the subdirectories
+ # AC_CONFIG_SUBDIRS($subdirs)
+ 
+Index: gcc-4.6.0/gcc/configure.ac
+===================================================================
+--- gcc-4.6.0.orig/gcc/configure.ac
++++ gcc-4.6.0/gcc/configure.ac
+@@ -4907,6 +4907,11 @@ if test "${ENABLE_LIBQUADMATH_SUPPORT}"
+ fi
+ 
+ 
++AC_SUBST(enable_target_optspace)
++if test x"$enable_target_optspace" != x; then
++  AC_DEFINE(ENABLE_TARGET_OPTSPACE, 1, [Define to enable target optspace support.])
++fi
++
+ # Configure the subdirectories
+ # AC_CONFIG_SUBDIRS($subdirs)
+ 
+Index: gcc-4.6.0/gcc/opts.c
+===================================================================
+--- gcc-4.6.0.orig/gcc/opts.c
++++ gcc-4.6.0/gcc/opts.c
+@@ -605,6 +605,10 @@ default_options_optimization (struct gcc
+     maybe_set_param_value (PARAM_MIN_CROSSJUMP_INSNS,
+ 			   default_param_value (PARAM_MIN_CROSSJUMP_INSNS),
+ 			   opts->x_param_values, opts_set->x_param_values);
++#ifndef ENABLE_TARGET_OPTSPACE
++  if (optimize_size == 1)
++    error ("Do not use -Os option if --enable-target-optspace is not set.");
++#endif
+ 
+   /* Allow default optimizations to be specified on a per-machine basis.  */
+   maybe_default_options (opts, opts_set,
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-poison-system-directories.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-poison-system-directories.patch
new file mode 100644
index 0000000..e1b7131
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-poison-system-directories.patch
@@ -0,0 +1,221 @@
+       gcc/
+       2008-07-02  Joseph Myers  <joseph@codesourcery.com>
+       * c-incpath.c: Include toplev.h.
+       (merge_include_chains): Use warning instead of cpp_error for
+       system directory poisoning diagnostic.
+       * Makefile.in (c-incpath.o): Depend on toplev.h.
+       * gcc.c (LINK_COMMAND_SPEC): Pass
+       --error-poison-system-directories if
+       -Werror=poison-system-directories.
+
+       2007-06-13  Joseph Myers  <joseph@codesourcery.com>
+       * common.opt (--Wno-poison-system-directories): New.
+       * doc/invoke.texi (-Wno-poison-system-directories): Document.
+       * c-incpath.c: Include flags.h.
+       (merge_include_chains): Check flag_poison_system_directories.
+       * gcc.c (LINK_COMMAND_SPEC): Pass --no-poison-system-directories
+       to linker if -Wno-poison-system-directories.
+       * Makefile.in (c-incpath.o): Depend on $(FLAGS_H).
+
+       2007-03-20  Daniel Jacobowitz  <dan@codesourcery.com>
+                   Joseph Myers  <joseph@codesourcery.com>
+       * configure.ac (--enable-poison-system-directories): New option.
+       * configure, config.in: Regenerate.
+       * c-incpath.c (merge_include_chains): If
+       ENABLE_POISON_SYSTEM_DIRECTORIES defined, warn for use of
+       /usr/include, /usr/local/include or /usr/X11R6/include.
+
+Index: gcc-4.6.0/gcc/common.opt
+===================================================================
+--- gcc-4.6.0.orig/gcc/common.opt
++++ gcc-4.6.0/gcc/common.opt
+@@ -558,6 +558,10 @@ Wpadded
+ Common Var(warn_padded) Warning
+ Warn when padding is required to align structure members
+ 
++Wpoison-system-directories
++Common Var(flag_poison_system_directories) Init(1) Warning
++Warn for -I and -L options using system directories if cross compiling
++
+ Wshadow
+ Common Var(warn_shadow) Warning
+ Warn when one local variable shadows another
+Index: gcc-4.6.0/gcc/config.in
+===================================================================
+--- gcc-4.6.0.orig/gcc/config.in
++++ gcc-4.6.0/gcc/config.in
+@@ -144,6 +144,12 @@
+ #endif
+ 
+ 
++/* Define to warn for use of native system header directories */
++#ifndef USED_FOR_TARGET
++#undef ENABLE_POISON_SYSTEM_DIRECTORIES
++#endif
++
++
+ /* Define if you want all operations on RTL (the basic data structure of the
+    optimizer and back end) to be checked for dynamic type safety at runtime.
+    This is quite expensive. */
+Index: gcc-4.6.0/gcc/configure.ac
+===================================================================
+--- gcc-4.6.0.orig/gcc/configure.ac
++++ gcc-4.6.0/gcc/configure.ac
+@@ -4694,6 +4694,16 @@ else
+ fi)
+ AC_SUBST(slibdir)
+ 
++AC_ARG_ENABLE([poison-system-directories],
++             AS_HELP_STRING([--enable-poison-system-directories],
++                            [warn for use of native system header directories]),,
++             [enable_poison_system_directories=no])
++if test "x${enable_poison_system_directories}" = "xyes"; then
++  AC_DEFINE([ENABLE_POISON_SYSTEM_DIRECTORIES],
++           [1],
++           [Define to warn for use of native system header directories])
++fi
++
+ # Substitute configuration variables
+ AC_SUBST(subdirs)
+ AC_SUBST(srcdir)
+Index: gcc-4.6.0/gcc/doc/invoke.texi
+===================================================================
+--- gcc-4.6.0.orig/gcc/doc/invoke.texi
++++ gcc-4.6.0/gcc/doc/invoke.texi
+@@ -257,6 +257,7 @@ Objective-C and Objective-C++ Dialects}.
+ -Woverlength-strings  -Wpacked  -Wpacked-bitfield-compat  -Wpadded @gol
+ -Wparentheses  -Wpedantic-ms-format -Wno-pedantic-ms-format @gol
+ -Wpointer-arith  -Wno-pointer-to-int-cast @gol
++-Wno-poison-system-directories @gol
+ -Wredundant-decls @gol
+ -Wreturn-type  -Wsequence-point  -Wshadow @gol
+ -Wsign-compare  -Wsign-conversion  -Wstack-protector @gol
+@@ -3773,6 +3774,14 @@ headers---for that, @option{-Wunknown-pr
+  for most targets, it is made up of code and thus requires the stack
+  to be made executable in order for the program to work properly.
+ 
++@item -Wno-poison-system-directories
++@opindex Wno-poison-system-directories
++Do not warn for @option{-I} or @option{-L} options using system
++directories such as @file{/usr/include} when cross compiling.  This
++option is intended for use in chroot environments when such
++directories contain the correct headers and libraries for the target
++system rather than the host.
++
+ @item -Wfloat-equal
+ @opindex Wfloat-equal
+ @opindex Wno-float-equal
+Index: gcc-4.6.0/gcc/gcc.c
+===================================================================
+--- gcc-4.6.0.orig/gcc/gcc.c
++++ gcc-4.6.0/gcc/gcc.c
+@@ -659,6 +659,8 @@ proper position among the other output f
+     %{flto} %{flto=*} %l " LINK_PIE_SPEC \
+    "%X %{o*} %{e*} %{N} %{n} %{r}\
+     %{s} %{t} %{u*} %{z} %{Z} %{!nostdlib:%{!nostartfiles:%S}}\
++    %{Wno-poison-system-directories:--no-poison-system-directories}\
++    %{Werror=poison-system-directories:--error-poison-system-directories}\
+     %{static:} %{L*} %(mfwrap) %(link_libgcc) %o\
+     %{fopenmp|ftree-parallelize-loops=*:%:include(libgomp.spec)%(link_gomp)}\
+     %(mflib) " STACK_SPLIT_SPEC "\
+Index: gcc-4.6.0/gcc/incpath.c
+===================================================================
+--- gcc-4.6.0.orig/gcc/incpath.c
++++ gcc-4.6.0/gcc/incpath.c
+@@ -353,6 +353,24 @@ merge_include_chains (const char *sysroo
+ 	}
+       fprintf (stderr, _("End of search list.\n"));
+     }
++
++#ifdef ENABLE_POISON_SYSTEM_DIRECTORIES
++  if (flag_poison_system_directories)
++    {
++       struct cpp_dir *p;
++
++       for (p = heads[QUOTE]; p; p = p->next)
++         {
++          if ((!strncmp (p->name, "/usr/include", 12))
++              || (!strncmp (p->name, "/usr/local/include", 18))
++              || (!strncmp (p->name, "/usr/X11R6/include", 18)))
++            warning (OPT_Wpoison_system_directories,
++                     "include location \"%s\" is unsafe for "
++                     "cross-compilation",
++                     p->name);
++         }
++    }
++#endif
+ }
+ 
+ /* Use given -I paths for #include "..." but not #include <...>, and
+Index: gcc-4.6.0/gcc/Makefile.in
+===================================================================
+--- gcc-4.6.0.orig/gcc/Makefile.in
++++ gcc-4.6.0/gcc/Makefile.in
+@@ -2179,7 +2179,7 @@ attribs.o : attribs.c $(CONFIG_H) $(SYST
+ 
+ incpath.o: incpath.c incpath.h $(CONFIG_H) $(SYSTEM_H) $(CPPLIB_H) \
+ 		intl.h prefix.h coretypes.h $(TM_H) cppdefault.h $(TARGET_H) \
+-		$(MACHMODE_H)
++		$(MACHMODE_H) $(FLAGS_H) toplev.h
+ 
+ prefix.o: prefix.c $(CONFIG_H) $(SYSTEM_H) coretypes.h $(TM_H) prefix.h \
+ 	Makefile $(BASEVER)
+Index: gcc-4.6.0/gcc/configure
+===================================================================
+--- gcc-4.6.0.orig/gcc/configure
++++ gcc-4.6.0/gcc/configure
+@@ -912,6 +912,7 @@ with_system_zlib
+ enable_maintainer_mode
+ enable_version_specific_runtime_libs
+ with_slibdir
++enable_poison_system_directories
+ enable_plugin
+ enable_libquadmath_support
+ '
+@@ -1623,6 +1624,8 @@ Optional Features:
+   --enable-version-specific-runtime-libs
+                           specify that runtime libraries should be
+                           installed in a compiler-specific directory
++  --enable-poison-system-directories
++                          warn for use of native system header directories
+   --enable-plugin         enable plugin support
+   --disable-libquadmath-support
+                           disable libquadmath support for Fortran
+@@ -17508,7 +17511,7 @@ else
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 17511 "configure"
++#line 17514 "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
+@@ -17614,7 +17617,7 @@ else
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 17617 "configure"
++#line 17620 "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
+@@ -26127,6 +26130,19 @@ fi
+ 
+ 
+ 
++# Check whether --enable-poison-system-directories was given.
++if test "${enable_poison_system_directories+set}" = set; then :
++  enableval=$enable_poison_system_directories;
++else
++  enable_poison_system_directories=no
++fi
++
++if test "x${enable_poison_system_directories}" = "xyes"; then
++
++$as_echo "#define ENABLE_POISON_SYSTEM_DIRECTORIES 1" >>confdefs.h
++
++fi
++
+ # Substitute configuration variables
+ 
+ 
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-uclibc-locale-ctype_touplow_t.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-uclibc-locale-ctype_touplow_t.patch
new file mode 100644
index 0000000..8b71e31
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-uclibc-locale-ctype_touplow_t.patch
@@ -0,0 +1,70 @@
+Index: gcc-4.6.0/libstdc++-v3/config/locale/generic/c_locale.h
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/generic/c_locale.h
++++ gcc-4.6.0/libstdc++-v3/config/locale/generic/c_locale.h
+@@ -41,13 +41,22 @@
+ 
+ #include <clocale>
+ 
++#ifdef __UCLIBC__
++#include <features.h>
++#include <ctype.h>
++#endif
++
+ #define _GLIBCXX_NUM_CATEGORIES 0
+ 
+ namespace std _GLIBCXX_VISIBILITY(default)
+ {
+ _GLIBCXX_BEGIN_NAMESPACE_VERSION
+ 
++#ifdef __UCLIBC__
++  typedef __ctype_touplow_t*	__c_locale;
++#else
+   typedef int*			__c_locale;
++#endif
+ 
+   // Convert numeric value of type double and long double to string and
+   // return length of string.  If vsnprintf is available use it, otherwise
+Index: gcc-4.6.0/libstdc++-v3/config/os/gnu-linux/ctype_base.h
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/os/gnu-linux/ctype_base.h
++++ gcc-4.6.0/libstdc++-v3/config/os/gnu-linux/ctype_base.h
+@@ -34,6 +34,11 @@
+ 
+ // Information as gleaned from /usr/include/ctype.h
+ 
++#ifdef __UCLIBC__
++#include <features.h>
++#include <ctype.h>
++#endif
++
+ namespace std _GLIBCXX_VISIBILITY(default)
+ {
+ _GLIBCXX_BEGIN_NAMESPACE_VERSION
+@@ -42,7 +47,11 @@ _GLIBCXX_BEGIN_NAMESPACE_VERSION
+   struct ctype_base
+   {
+     // Non-standard typedefs.
++#ifdef __UCLIBC__
++    typedef const __ctype_touplow_t*	__to_type;
++#else
+     typedef const int* 		__to_type;
++#endif
+ 
+     // NB: Offsets into ctype<char>::_M_table force a particular size
+     // on the mask type. Because of this, we don't use an enum.
+Index: gcc-4.6.0/libstdc++-v3/config/locale/generic/c_locale.cc
+===================================================================
+--- gcc-4.6.0.orig/libstdc++-v3/config/locale/generic/c_locale.cc
++++ gcc-4.6.0/libstdc++-v3/config/locale/generic/c_locale.cc
+@@ -264,5 +264,10 @@ _GLIBCXX_END_NAMESPACE_VERSION
+ #ifdef _GLIBCXX_LONG_DOUBLE_COMPAT
+ #define _GLIBCXX_LDBL_COMPAT(dbl, ldbl) \
+   extern "C" void ldbl (void) __attribute__ ((alias (#dbl)))
++#ifdef __UCLIBC__
++// This is because __c_locale is of type __ctype_touplow_t* which is short on uclibc. for glibc its int*
++_GLIBCXX_LDBL_COMPAT(_ZSt14__convert_to_vIdEvPKcRT_RSt12_Ios_IostateRKPs, _ZSt14__convert_to_vIeEvPKcRT_RSt12_Ios_IostateRKPs);
++#else
+ _GLIBCXX_LDBL_COMPAT(_ZSt14__convert_to_vIdEvPKcRT_RSt12_Ios_IostateRKPi, _ZSt14__convert_to_vIeEvPKcRT_RSt12_Ios_IostateRKPi);
++#endif
+ #endif // _GLIBCXX_LONG_DOUBLE_COMPAT
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/libstdc++-pic.dpatch b/meta/recipes-devtools/gcc/gcc-4.6.0/libstdc++-pic.dpatch
new file mode 100644
index 0000000..70c9e81
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/libstdc++-pic.dpatch
@@ -0,0 +1,71 @@
+#! /bin/sh -e
+
+# DP: Build and install libstdc++_pic.a library.
+
+dir=
+if [ $# -eq 3 -a "$2" = '-d' ]; then
+    pdir="-d $3"
+    dir="$3/"
+elif [ $# -ne 1 ]; then
+    echo >&2 "`basename $0`: script expects -patch|-unpatch as argument"
+    exit 1
+fi
+case "$1" in
+    -patch)
+        patch $pdir -f --no-backup-if-mismatch -p0 < $0
+        ;;
+    -unpatch)
+        patch $pdir -f --no-backup-if-mismatch -R -p0 < $0
+        ;;
+    *)
+        echo >&2 "`basename $0`: script expects -patch|-unpatch as argument"
+        exit 1
+esac
+exit 0
+
+diff -ur libstdc++-v3/src/Makefile.am libstdc++-v3/src/Makefile.am
+--- libstdc++-v3/src/Makefile.am~	2004-04-16 21:04:05.000000000 +0200
++++ libstdc++-v3/src/Makefile.am	2004-07-03 20:22:43.000000000 +0200
+@@ -210,6 +210,10 @@
+ 	  $(OPT_LDFLAGS) $(SECTION_LDFLAGS) $(AM_CXXFLAGS) $(LDFLAGS) -o $@
+ 
+ 
++install-exec-local:
++	$(AR) cru libstdc++_pic.a .libs/*.o $(top_builddir)/libsupc++/*.o || touch libstdc++_pic.a
++	$(INSTALL_DATA) libstdc++_pic.a $(DESTDIR)$(toolexeclibdir)
++
+ # Added bits to build debug library.
+ if GLIBCXX_BUILD_DEBUG
+ all-local: build_debug
+diff -ur libstdc++-v3/src/Makefile.in libstdc++-v3/src/Makefile.in
+--- libstdc++-v3/src/Makefile.in	2004-07-03 06:41:13.000000000 +0200
++++ libstdc++-v3/src/Makefile.in	2004-07-03 20:25:05.000000000 +0200
+@@ -611,7 +611,7 @@
+ 
+ install-data-am: install-data-local
+ 
+-install-exec-am: install-toolexeclibLTLIBRARIES
++install-exec-am: install-toolexeclibLTLIBRARIES install-exec-local
+ 
+ install-info: install-info-am
+ 
+@@ -644,6 +644,7 @@
+ 	distclean-libtool distclean-tags distdir dvi dvi-am html \
+ 	html-am info info-am install install-am install-data \
+ 	install-data-am install-data-local install-exec \
++	install-exec-local \
+ 	install-exec-am install-info install-info-am install-man \
+ 	install-strip install-toolexeclibLTLIBRARIES installcheck \
+ 	installcheck-am installdirs maintainer-clean \
+@@ -729,6 +730,11 @@
+ install_debug:
+ 	(cd ${debugdir} && $(MAKE) \
+ 	toolexeclibdir=$(glibcxx_toolexeclibdir)/debug install)
++
++install-exec-local:
++	$(AR) cru libstdc++_pic.a .libs/*.o $(top_builddir)/libsupc++/*.o || touch libstdc++_pic.a
++	$(INSTALL_DATA) libstdc++_pic.a $(DESTDIR)$(toolexeclibdir)
++
+ # Tell versions [3.59,3.63) of GNU make to not export all variables.
+ # Otherwise a system limit (for SysV at least) may be exceeded.
+ .NOEXPORT:
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/optional_libstdc.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/optional_libstdc.patch
new file mode 100644
index 0000000..f132fbf
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/optional_libstdc.patch
@@ -0,0 +1,84 @@
+gcc-runtime builds libstdc++ separately from gcc-cross-*. Its configure tests using g++ 
+will not run correctly since by default the linker will try to link against libstdc++
+which shouldn't exist yet. We need an option to disable -lstdc++
+option whilst leaving -lc, -lgcc and other automatic library dependencies added by gcc 
+driver. This patch adds such an option which only disables the -lstdc++.
+
+A "standard" gcc build uses xgcc and hence avoids this. We should ask upstream how to 
+do this officially, the likely answer is don't build libstdc++ separately.
+
+RP 29/6/10
+
+Index: gcc-4.6.0/gcc/cp/g++spec.c
+===================================================================
+--- gcc-4.6.0.orig/gcc/cp/g++spec.c
++++ gcc-4.6.0/gcc/cp/g++spec.c
+@@ -127,6 +127,7 @@ lang_specific_driver (struct cl_decoded_
+       switch (decoded_options[i].opt_index)
+ 	{
+ 	case OPT_nostdlib:
++	case OPT_nostdlib__:
+ 	case OPT_nodefaultlibs:
+ 	  library = -1;
+ 	  break;
+Index: gcc-4.6.0/gcc/doc/invoke.texi
+===================================================================
+--- gcc-4.6.0.orig/gcc/doc/invoke.texi
++++ gcc-4.6.0/gcc/doc/invoke.texi
+@@ -193,7 +193,7 @@ in the following sections.
+ -fno-pretty-templates @gol
+ -frepo  -fno-rtti  -fstats  -ftemplate-depth=@var{n} @gol
+ -fno-threadsafe-statics -fuse-cxa-atexit  -fno-weak  -nostdinc++ @gol
+--fno-default-inline  -fvisibility-inlines-hidden @gol
++-nostdlib++ -fno-default-inline  -fvisibility-inlines-hidden @gol
+ -fvisibility-ms-compat @gol
+ -Wabi  -Wconversion-null  -Wctor-dtor-privacy @gol
+ -Wnoexcept -Wnon-virtual-dtor  -Wreorder @gol
+@@ -431,7 +431,7 @@ Objective-C and Objective-C++ Dialects}.
+ @gccoptlist{@var{object-file-name}  -l@var{library} @gol
+ -nostartfiles  -nodefaultlibs  -nostdlib -pie -rdynamic @gol
+ -s  -static  -static-libgcc  -static-libstdc++ -shared  @gol
+--shared-libgcc  -symbolic @gol
++-shared-libgcc  -symbolic -nostdlib++ @gol
+ -T @var{script}  -Wl,@var{option}  -Xlinker @var{option} @gol
+ -u @var{symbol}}
+ 
+@@ -9069,6 +9069,11 @@ These entries are usually resolved by en
+ libc.  These entry points should be supplied through some other
+ mechanism when this option is specified.
+ 
++@item -nostdlib++
++@opindex nostdlib++
++Do not use the standard system C++ runtime libraries when linking.
++Only the libraries you specify will be passed to the linker.
++
+ @cindex @option{-lgcc}, use with @option{-nostdlib}
+ @cindex @option{-nostdlib} and unresolved references
+ @cindex unresolved references and @option{-nostdlib}
+Index: gcc-4.6.0/gcc/c-family/c.opt
+===================================================================
+--- gcc-4.6.0.orig/gcc/c-family/c.opt
++++ gcc-4.6.0/gcc/c-family/c.opt
+@@ -1111,6 +1111,10 @@ nostdinc++
+ C++ ObjC++
+ Do not search standard system include directories for C++
+ 
++nostdlib++
++Driver
++Do not link standard C++ runtime library
++
+ o
+ C ObjC C++ ObjC++ Joined Separate
+ ; Documented in common.opt
+Index: gcc-4.6.0/gcc/gcc.c
+===================================================================
+--- gcc-4.6.0.orig/gcc/gcc.c
++++ gcc-4.6.0/gcc/gcc.c
+@@ -666,6 +666,7 @@ proper position among the other output f
+     %(mflib) " STACK_SPLIT_SPEC "\
+     %{fprofile-arcs|fprofile-generate*|coverage:-lgcov}\
+     %{!nostdlib:%{!nodefaultlibs:%(link_ssp) %(link_gcc_c_sequence)}}\
++    %{!nostdlib++:}\
+     %{!nostdlib:%{!nostartfiles:%E}} %{T*} }}}}}}"
+ #endif
+ 
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/pr30961.dpatch b/meta/recipes-devtools/gcc/gcc-4.6.0/pr30961.dpatch
new file mode 100644
index 0000000..b20fdf5
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/pr30961.dpatch
@@ -0,0 +1,179 @@
+#! /bin/sh -e
+
+# DP: <your description>
+
+dir=
+if [ $# -eq 3 -a "$2" = '-d' ]; then
+    pdir="-d $3"
+    dir="$3/"
+elif [ $# -ne 1 ]; then
+    echo >&2 "`basename $0`: script expects -patch|-unpatch as argument"
+    exit 1
+fi
+case "$1" in
+    -patch)
+        patch $pdir -f --no-backup-if-mismatch -p0 < $0
+        ;;
+    -unpatch)
+        patch $pdir -f --no-backup-if-mismatch -R -p0 < $0
+        ;;
+    *)
+        echo >&2 "`basename $0`: script expects -patch|-unpatch as argument"
+        exit 1
+esac
+exit 0
+
+From: "H.J. Lu" <hjl@lucon.org>
+Sender: gcc-patches-owner@gcc.gnu.org
+To: gcc-patches@gcc.gnu.org
+Subject: PATCH: PR target/30961: [4.1/4.2/4.3 regression] redundant reg/mem 	stores/moves
+Date: Mon, 27 Aug 2007 11:34:12 -0700
+
+We start with
+
+(note:HI 3 4 22 2 NOTE_INSN_FUNCTION_BEG)
+
+(insn:HI 6 3 10 2 c.c:3 (set (reg:DF 58 [ <result> ])
+        (subreg:DF (reg/v:DI 59 [ in ]) 0)) 102 {*movdf_integer_rex64} (expr_list:REG_DEAD (reg/v:DI 59 [ in ])
+        (nil)))
+
+(insn:HI 10 6 16 2 c.c:7 (set (reg/i:DF 21 xmm0 [ <result> ])
+        (reg:DF 58 [ <result> ])) 102 {*movdf_integer_rex64} (expr_list:REG_DEAD (reg:DF 58 [ <result> ])
+        (nil)))
+
+(insn:HI 16 10 0 2 c.c:7 (use (reg/i:DF 21 xmm0 [ <result> ])) -1 (nil))
+
+we are trying to allocate registers for insn 6 and we allocate
+xmm0 for the return value. Reload doesn't check if xmm0 can be used for
+DF 59, it allocates xmm1 for DF 59 and generates:
+
+Reloads for insn # 6
+Reload 0: reload_in (DF) = (reg:DF 5 di)
+        SSE_REGS, RELOAD_FOR_INPUT (opnum = 1), can't combine
+        reload_in_reg: (subreg:DF (reg/v:DI 5 di [orig:59 in ] [59]) 0)
+        reload_reg_rtx: (reg:DF 22 xmm1)
+...
+
+(note:HI 4 1 3 2 [bb 2] NOTE_INSN_BASIC_BLOCK)
+
+(note:HI 3 4 22 2 NOTE_INSN_FUNCTION_BEG)
+
+(insn 22 3 23 2 c.c:3 (set (mem/c:DF (plus:DI (reg/f:DI 7 sp)
+                (const_int -8 [0xfffffffffffffff8])) [0 S8 A8])
+        (reg:DF 5 di)) 102 {*movdf_integer_rex64} (nil))
+
+(insn 23 22 6 2 c.c:3 (set (reg:DF 22 xmm1)
+        (mem/c:DF (plus:DI (reg/f:DI 7 sp)
+                (const_int -8 [0xfffffffffffffff8])) [0 S8 A8])) 102 {*movdf_integer_rex64} (nil))
+
+(insn:HI 6 23 16 2 c.c:3 (set (reg:DF 21 xmm0 [orig:58 <result> ] [58])
+        (reg:DF 22 xmm1)) 102 {*movdf_integer_rex64} (nil))
+
+(insn 16 6 21 2 c.c:7 (use (reg/i:DF 21 xmm0 [ <result> ])) -1 (nil))
+
+This patch tries to use the destination register when reloading for input. It
+generates
+
+Reloads for insn # 6
+Reload 0: reload_in (DF) = (reg:DF 5 di)
+        SSE_REGS, RELOAD_FOR_INPUT (opnum = 1), can't combine
+        reload_in_reg: (subreg:DF (reg/v:DI 5 di [orig:59 in ] [59]) 0)
+        reload_reg_rtx: (reg:DF 21 xmm0)
+...
+(note:HI 4 1 3 2 [bb 2] NOTE_INSN_BASIC_BLOCK)
+
+(note:HI 3 4 22 2 NOTE_INSN_FUNCTION_BEG)
+
+(insn 22 3 23 2 c.c:3 (set (mem/c:DF (plus:DI (reg/f:DI 7 sp)
+                (const_int -8 [0xfffffffffffffff8])) [0 S8 A8])
+        (reg:DF 5 di)) 102 {*movdf_integer_rex64} (nil))
+
+(insn 23 22 6 2 c.c:3 (set (reg:DF 21 xmm0)
+        (mem/c:DF (plus:DI (reg/f:DI 7 sp)
+                (const_int -8 [0xfffffffffffffff8])) [0 S8 A8])) 102 {*movdf_integer_rex64} (nil))
+
+(insn:HI 6 23 10 2 c.c:3 (set (reg:DF 22 xmm1 [orig:58 <result> ] [58])
+        (reg:DF 21 xmm0)) 102 {*movdf_integer_rex64} (nil))
+
+(insn:HI 10 6 16 2 c.c:7 (set (reg/i:DF 21 xmm0 [ <result> ])
+        (reg:DF 22 xmm1 [orig:58 <result> ] [58])) 102 {*movdf_integer_rex64} (nil))
+
+(insn 16 10 21 2 c.c:7 (use (reg/i:DF 21 xmm0 [ <result> ])) -1 (nil))
+
+
+H.J.
+----
+gcc/
+
+2007-08-27  H.J. Lu  <hongjiu.lu@intel.com>
+
+	PR target/30961
+	* reload1.c (find_reg): Favor the hard register in destination
+	if it is usable and a memory location is needed for reload
+	input.
+
+gcc/testsuite/
+
+2007-08-27  H.J. Lu  <hongjiu.lu@intel.com>
+
+	PR target/30961
+	* gcc.target/i386/pr30961-1.c: New.
+
+--- gcc/reload1.c.second	2007-08-27 09:35:08.000000000 -0700
++++ gcc/reload1.c	2007-08-27 09:36:33.000000000 -0700
+@@ -1781,6 +1781,20 @@ find_reg (struct insn_chain *chain, int 
+   HARD_REG_SET not_usable;
+   HARD_REG_SET used_by_other_reload;
+   reg_set_iterator rsi;
++#ifdef SECONDARY_MEMORY_NEEDED
++  rtx body = PATTERN (chain->insn);
++  unsigned int dest_reg = FIRST_PSEUDO_REGISTER;
++
++  if (GET_CODE (body) == SET)
++    {
++      rtx dest = SET_DEST (body);
++
++      if ((REG_P (dest)
++	   || (GET_CODE (dest) == SUBREG
++	       && REG_P (SUBREG_REG (dest)))))
++	dest_reg = reg_or_subregno (dest);
++    }
++#endif
+ 
+   COPY_HARD_REG_SET (not_usable, bad_spill_regs);
+   IOR_HARD_REG_SET (not_usable, bad_spill_regs_global);
+@@ -1821,6 +1835,18 @@ find_reg (struct insn_chain *chain, int 
+ 	    this_cost--;
+ 	  if (rl->out && REG_P (rl->out) && REGNO (rl->out) == regno)
+ 	    this_cost--;
++#ifdef SECONDARY_MEMORY_NEEDED
++	  /* If a memory location is needed for rl->in and dest_reg
++	     is usable, we will favor it.  */
++	  else if (dest_reg == regno
++		   && rl->in
++		   && REG_P (rl->in)
++		   && REGNO (rl->in) < FIRST_PSEUDO_REGISTER
++		   && SECONDARY_MEMORY_NEEDED (REGNO_REG_CLASS (REGNO (rl->in)),
++					       rl->class,
++					       rl->mode))
++	    this_cost = 0;
++#endif
+ 	  if (this_cost < best_cost
+ 	      /* Among registers with equal cost, prefer caller-saved ones, or
+ 		 use REG_ALLOC_ORDER if it is defined.  */
+--- gcc/testsuite/gcc.target/i386/pr30961-1.c.second	2007-08-27 11:01:59.000000000 -0700
++++ gcc/testsuite/gcc.target/i386/pr30961-1.c	2007-08-27 11:02:51.000000000 -0700
+@@ -0,0 +1,13 @@
++/* { dg-do compile } */
++/* { dg-require-effective-target lp64 } */
++/* { dg-options "-O2" } */
++
++double
++convert (long long in)
++{
++  double f;
++  __builtin_memcpy( &f, &in, sizeof( in ) );
++  return f;
++}
++
++/* { dg-final { scan-assembler-not "movapd" } } */
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/pr35942.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/pr35942.patch
new file mode 100644
index 0000000..da610f5
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/pr35942.patch
@@ -0,0 +1,38 @@
+Fix PR 35942: remove -lstdc++ from libtool postdeps for CXX.
+
+libstdc++-v3/ChangeLog:
+2010-01-04  Ralf Wildenhues  <Ralf.Wildenhues@gmx.de>
+
+	PR libstdc++/35942
+	* configure.ac: Remove -lstdc++ from libtool's postdeps_CXX.
+	* configure: Regenerate.
+
+
+Index: gcc-4.3.3/libstdc++-v3/configure
+===================================================================
+--- gcc-4.3.3.orig/libstdc++-v3/configure	2010-03-26 17:57:51.000000000 +0000
++++ gcc-4.3.3/libstdc++-v3/configure	2010-03-26 17:57:58.000000000 +0000
+@@ -13759,6 +13759,9 @@
+ 
+ 
+ 
++# Eliminate -lstdc++ addition to postdeps for cross compiles.
++postdeps_CXX=`echo " $postdeps_CXX " | sed 's, -lstdc++ ,,g'`
++
+ # Possibly disable most of the library.
+ ## TODO: Consider skipping unncessary tests altogether in this case, rather
+ ## than just ignoring the results.  Faster /and/ more correct, win win.
+Index: gcc-4.3.3/libstdc++-v3/configure.ac
+===================================================================
+--- gcc-4.3.3.orig/libstdc++-v3/configure.ac	2010-03-26 17:57:54.000000000 +0000
++++ gcc-4.3.3/libstdc++-v3/configure.ac	2010-03-26 17:57:58.000000000 +0000
+@@ -89,6 +89,9 @@
+ AC_SUBST(enable_shared)
+ AC_SUBST(enable_static)
+ 
++# Eliminate -lstdc++ addition to postdeps for cross compiles.
++postdeps_CXX=`echo " $postdeps_CXX " | sed 's, -lstdc++ ,,g'`
++
+ # Possibly disable most of the library.
+ ## TODO: Consider skipping unncessary tests altogether in this case, rather
+ ## than just ignoring the results.  Faster /and/ more correct, win win.
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/zecke-xgcc-cpp.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/zecke-xgcc-cpp.patch
new file mode 100644
index 0000000..b3f02dc
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/zecke-xgcc-cpp.patch
@@ -0,0 +1,28 @@
+upstream: n/a
+comment: Use the preprocessor we have just compiled instead the one of
+the system. There might be incompabilities between us and them.
+
+Index: gcc-4.6.0/Makefile.in
+===================================================================
+--- gcc-4.6.0.orig/Makefile.in
++++ gcc-4.6.0/Makefile.in
+@@ -270,6 +270,7 @@ BASE_TARGET_EXPORTS = \
+ 	AR="$(AR_FOR_TARGET)"; export AR; \
+ 	AS="$(COMPILER_AS_FOR_TARGET)"; export AS; \
+ 	CC="$(CC_FOR_TARGET) $(XGCC_FLAGS_FOR_TARGET) $$TFLAGS"; export CC; \
++	CPP="$(CC_FOR_TARGET) -E"; export CPP; \
+ 	CFLAGS="$(CFLAGS_FOR_TARGET)"; export CFLAGS; \
+ 	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
+ 	CPPFLAGS="$(CPPFLAGS_FOR_TARGET)"; export CPPFLAGS; \
+Index: gcc-4.6.0/Makefile.tpl
+===================================================================
+--- gcc-4.6.0.orig/Makefile.tpl
++++ gcc-4.6.0/Makefile.tpl
+@@ -273,6 +273,7 @@ BASE_TARGET_EXPORTS = \
+ 	AR="$(AR_FOR_TARGET)"; export AR; \
+ 	AS="$(COMPILER_AS_FOR_TARGET)"; export AS; \
+ 	CC="$(CC_FOR_TARGET) $(XGCC_FLAGS_FOR_TARGET) $$TFLAGS"; export CC; \
++	CPP="$(CC_FOR_TARGET) -E"; export CPP; \
+ 	CFLAGS="$(CFLAGS_FOR_TARGET)"; export CFLAGS; \
+ 	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
+ 	CPPFLAGS="$(CPPFLAGS_FOR_TARGET)"; export CPPFLAGS; \
diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial_4.6.0.bb b/meta/recipes-devtools/gcc/gcc-cross-initial_4.6.0.bb
new file mode 100644
index 0000000..1639511
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-cross-initial_4.6.0.bb
@@ -0,0 +1,2 @@
+require gcc-cross_${PV}.bb
+require gcc-cross-initial.inc
diff --git a/meta/recipes-devtools/gcc/gcc-cross-intermediate_4.6.0.bb b/meta/recipes-devtools/gcc/gcc-cross-intermediate_4.6.0.bb
new file mode 100644
index 0000000..42fd0f0
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-cross-intermediate_4.6.0.bb
@@ -0,0 +1,3 @@
+require gcc-cross_${PV}.bb
+require gcc-cross-intermediate.inc
+
diff --git a/meta/recipes-devtools/gcc/gcc-cross_4.6.0.bb b/meta/recipes-devtools/gcc/gcc-cross_4.6.0.bb
new file mode 100644
index 0000000..97a0c81
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-cross_4.6.0.bb
@@ -0,0 +1,8 @@
+require gcc-${PV}.inc
+require gcc-cross4.inc
+
+EXTRA_OECONF += "--disable-libunwind-exceptions \
+                 --with-mpfr=${STAGING_DIR_NATIVE}${prefix_native} \
+                 --with-system-zlib "
+
+ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_DIR_TARGET}${target_includedir}"
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.6.0.bb b/meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.6.0.bb
new file mode 100644
index 0000000..9708248
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.6.0.bb
@@ -0,0 +1,4 @@
+require gcc-cross-initial_${PV}.bb
+require gcc-crosssdk-initial.inc
+
+PR = "r4"
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.6.0.bb b/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.6.0.bb
new file mode 100644
index 0000000..d235969
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.6.0.bb
@@ -0,0 +1,4 @@
+require gcc-cross-intermediate_${PV}.bb
+require gcc-crosssdk-intermediate.inc
+
+PR = "r4"
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_4.6.0.bb b/meta/recipes-devtools/gcc/gcc-runtime_4.6.0.bb
new file mode 100644
index 0000000..568b5af
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-runtime_4.6.0.bb
@@ -0,0 +1,10 @@
+require gcc-${PV}.inc
+require gcc-configure-runtime.inc
+require gcc-package-runtime.inc
+
+SRC_URI_append = "file://fortran-cross-compile-hack.patch"
+
+ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR}"
+
+EXTRA_OECONF += "--disable-libunwind-exceptions"
+EXTRA_OECONF_append_poky-lsb = " --enable-clocale=gnu"
diff --git a/meta/recipes-devtools/gcc/gcc_4.6.0.bb b/meta/recipes-devtools/gcc/gcc_4.6.0.bb
new file mode 100644
index 0000000..bfaec86
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc_4.6.0.bb
@@ -0,0 +1,7 @@
+require gcc-${PV}.inc
+require gcc-configure-target.inc
+require gcc-package-target.inc
+
+SRC_URI_append = "file://fortran-cross-compile-hack.patch"
+
+ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR}"
diff --git a/meta/recipes-devtools/gcc/libgcc_4.6.0.bb b/meta/recipes-devtools/gcc/libgcc_4.6.0.bb
new file mode 100644
index 0000000..b6cf268
--- /dev/null
+++ b/meta/recipes-devtools/gcc/libgcc_4.6.0.bb
@@ -0,0 +1,46 @@
+require gcc-${PV}.inc
+
+PR = "r0"
+
+INHIBIT_DEFAULT_DEPS = "1"
+DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
+
+PACKAGES = "\
+  ${PN} \
+  ${PN}-dev \
+  "
+
+FILES_${PN} = "${base_libdir}/libgcc*.so.*"
+FILES_${PN}-dev = " \
+  ${base_libdir}/libgcc*.so \
+  ${libdir}/${TARGET_SYS}/${BINV}/crt* \
+  ${libdir}/${TARGET_SYS}/${BINV}/libgcc*"
+
+do_fetch[noexec] = "1"
+do_unpack[noexec] = "1"
+do_patch[noexec] = "1"
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+
+do_install () {
+	target=`echo ${MULTIMACH_TARGET_SYS} | sed -e s#-nativesdk##`
+
+	# Install libgcc from our gcc-cross saved data
+	install -d ${D}${base_libdir} ${D}${libdir}
+	cp -fpPR ${STAGING_INCDIR_NATIVE}/gcc-build-internal-$target/* ${D}
+
+	# Move libgcc_s into /lib
+	mkdir -p ${D}${base_libdir}
+	if [ -f ${D}${libdir}/nof/libgcc_s.so ]; then
+		mv ${D}${libdir}/nof/libgcc* ${D}${base_libdir}
+	else
+		mv ${D}${libdir}/libgcc* ${D}${base_libdir} || true
+	fi
+}
+
+do_package_write_ipk[depends] += "virtual/libc:do_package"
+do_package_write_deb[depends] += "virtual/libc:do_package"
+do_package_write_rpm[depends] += "virtual/libc:do_package"
+
+BBCLASSEXTEND = "nativesdk"
+
-- 
1.7.4.1



