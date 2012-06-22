Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SiC8C-0007hO-BF
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Jun 2012 00:15:10 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 22 Jun 2012 15:04:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="115173260"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.175])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Jun 2012 15:04:18 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jun 2012 15:00:48 -0700
Message-Id: <0d53a2bac63bb0d6fa8c892f859f5afad01f14cd.1340402353.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340402353.git.sgw@linux.intel.com>
References: <cover.1340402353.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340402353.git.sgw@linux.intel.com>
References: <cover.1340402353.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 07/17] gcc: Remove csl gcc recipes
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
X-List-Received-Date: Fri, 22 Jun 2012 22:15:12 -0000

From: Khem Raj <raj.khem@gmail.com>

sourcery toolchain is available as external pluggable toolchain
if needed.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gcc/gcc-cross-initial_csl-arm-2008q1.bb        |   10 -
 .../gcc/gcc-cross-intermediate_csl-arm-2008q1.bb   |   10 -
 meta/recipes-devtools/gcc/gcc-cross-kernel.inc     |   19 -
 .../gcc/gcc-cross_csl-arm-2008q1.bb                |   24 -
 meta/recipes-devtools/gcc/gcc-csl-arm-2005q3.inc   |   22 -
 meta/recipes-devtools/gcc/gcc-csl-arm-2008q1.inc   |   53 -
 .../gcc/gcc-csl-arm/arm-nolibfloat.patch           |   25 -
 .../gcc/gcc-csl-arm/arm-softfloat.patch            |   17 -
 .../gcc/gcc-csl-arm/gcc-3.4.4-eabi-bigendian.patch |   13 -
 .../gcc/gcc-csl-arm/gcc-3.4.4-makefile-fix.patch   |   30 -
 .../gcc/gcc-csl-arm/gcc-configure-no-fortran.patch | 1076 --------------------
 .../gcc/gcc-csl-arm/gcc-new-makeinfo.patch         |   36 -
 .../gcc/gcc-csl-arm/gcc41-configure.in.patch       |   24 -
 .../gcc/gcc-csl-arm/gcc_optab_arm.patch            |   97 --
 .../gcc/gcc-csl-arm/gfortran.patch                 |   42 -
 .../gcc/gcc-csl-arm/zecke-no-host-includes.patch   |   33 -
 .../gcc/gcc-csl-arm/zecke-xgcc-cpp.patch           |   17 -
 meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb    |    3 -
 18 files changed, 0 insertions(+), 1551 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-cross-initial_csl-arm-2008q1.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc-cross-intermediate_csl-arm-2008q1.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc-cross-kernel.inc
 delete mode 100644 meta/recipes-devtools/gcc/gcc-cross_csl-arm-2008q1.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm-2005q3.inc
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm-2008q1.inc
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/arm-nolibfloat.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/arm-softfloat.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/gcc-3.4.4-eabi-bigendian.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/gcc-3.4.4-makefile-fix.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/gcc-configure-no-fortran.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/gcc-new-makeinfo.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/gcc41-configure.in.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/gcc_optab_arm.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/gfortran.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/zecke-no-host-includes.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/zecke-xgcc-cpp.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb

diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial_csl-arm-2008q1.bb b/meta/recipes-devtools/gcc/gcc-cross-initial_csl-arm-2008q1.bb
deleted file mode 100644
index 0621103..0000000
--- a/meta/recipes-devtools/gcc/gcc-cross-initial_csl-arm-2008q1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require gcc-cross_${PV}.bb
-require gcc-cross-initial.inc
-
-S = "${WORKDIR}/gcc-4.2"
-
-# Hack till we fix *libc properly
-do_install_append() {
-	ln -sf ${STAGING_DIR_NATIVE}${prefix_native}/lib/gcc/${TARGET_SYS}/${BINV}/include-fixed/* ${D}${STAGING_DIR_NATIVE}${prefix_native}/lib/gcc/${TARGET_SYS}/${BINV}/include/
-}
-
diff --git a/meta/recipes-devtools/gcc/gcc-cross-intermediate_csl-arm-2008q1.bb b/meta/recipes-devtools/gcc/gcc-cross-intermediate_csl-arm-2008q1.bb
deleted file mode 100644
index 8a8f21a..0000000
--- a/meta/recipes-devtools/gcc/gcc-cross-intermediate_csl-arm-2008q1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require gcc-cross_${PV}.bb
-require gcc-cross-intermediate.inc
-
-S = "${WORKDIR}/gcc-4.2"
-
-# Hack till we fix *libc properly
-do_install_append() {
-	ln -sf ${STAGING_DIR_NATIVE}${prefix_native}/lib/gcc/${TARGET_SYS}/${BINV}/include-fixed/* ${D}${STAGING_DIR_NATIVE}${prefix_native}/lib/gcc/${TARGET_SYS}/${BINV}/include/
-}
-
diff --git a/meta/recipes-devtools/gcc/gcc-cross-kernel.inc b/meta/recipes-devtools/gcc/gcc-cross-kernel.inc
deleted file mode 100644
index be772ba..0000000
--- a/meta/recipes-devtools/gcc/gcc-cross-kernel.inc
+++ /dev/null
@@ -1,19 +0,0 @@
-# Cut-down gcc for kernel builds
-# Only installs ${TARGET_PREFIX}gcc-${PV}, not ${TARGET_PREFIX}gcc.
-
-PROVIDES = "virtual/${TARGET_PREFIX}gcc-${PV}"
-
-do_install () {
-	cd gcc
-	oe_runmake 'DESTDIR=${D}' install-common install-headers install-libgcc
-	install -m 0755 xgcc  ${D}${bindir}/${TARGET_PREFIX}gcc-${PV}
-
-    # Insert symlinks into libexec so when tools without a prefix are searched for, the correct ones are
-    # found. These need to be relative paths so they work in different locations.
-    dest=${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/
-    install -d $dest
-    for t in ar as ld nm objcopy objdump ranlib strip cpp; do
-        ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t $dest$t
-        ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t ${dest}${TARGET_PREFIX}$t
-    done
-}
diff --git a/meta/recipes-devtools/gcc/gcc-cross_csl-arm-2008q1.bb b/meta/recipes-devtools/gcc/gcc-cross_csl-arm-2008q1.bb
deleted file mode 100644
index 58eba46..0000000
--- a/meta/recipes-devtools/gcc/gcc-cross_csl-arm-2008q1.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-require gcc-csl-arm-2008q1.inc
-require gcc-cross4.inc
-require gcc-configure-cross.inc
-require gcc-package-cross.inc
-
-SRC_URI_append = " file://zecke-no-host-includes.patch "
-
-EXTRA_OECONF += "--disable-multilib --disable-libunwind-exceptions --with-mpfr=${STAGING_DIR_NATIVE}${prefix_native}"
-
-#We don't want i686 linux ending up in the CFLAGS_FOR_TARGET like this: -isystem/OE/angstrom-tmp/staging/i686-linux/usr/include
-CFLAGS = ""
-CXXFLAGS = ""
-LDFLAGS = ""
-
-# staging-linkage and cross-linkage recipes don't work anymore, so do it by hand for this backwards CSL toolchain
-do_compile_prepend() {
-	ln -sf ${STAGING_DIR_TARGET}${target_libdir}/crt*.o ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/
-	ln -sf ${STAGING_DIR_TARGET}${target_libdir}/ld-* ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/
-	ln -sf ${STAGING_DIR_TARGET}/lib/libc* ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib/ 
-	sed -i -e 's:gcc_no_link=yes:gcc_no_link=no:' ${S}/libstdc++-v3/configure
-
-}
-
-ARCH_FLAGS_FOR_TARGET += " -L${STAGING_DIR_TARGET}${target_libdir} -isystem${STAGING_DIR_TARGET}${target_includedir}"
diff --git a/meta/recipes-devtools/gcc/gcc-csl-arm-2005q3.inc b/meta/recipes-devtools/gcc/gcc-csl-arm-2005q3.inc
deleted file mode 100644
index 9aad535..0000000
--- a/meta/recipes-devtools/gcc/gcc-csl-arm-2005q3.inc
+++ /dev/null
@@ -1,22 +0,0 @@
-require gcc-common.inc
-
-BINV = "3.4.4"
-PV = "3.4.4+csl-arm-2005q3-2"
-PV_chinook-compat = "3.4.4cs2005q3.2"
-
-FILESDIR = "${FILE_DIRNAME}/gcc-csl-arm"
-
-SRC_URI = "http://www.codesourcery.com/public/gnu_toolchain/arm-none-eabi/arm-2005q3-2-arm-none-eabi.src.tar.bz2 \
-           file://gcc_optab_arm.patch \
-           file://gcc-3.4.4-eabi-bigendian.patch"
-
-S = "${WORKDIR}/gcc-2005q3"
-
-do_unpack2() {
-	cd ${WORKDIR}
-	tar -xvjf ./arm-2005q3-2-arm-none-eabi/gcc-2005q3-2.tar.bz2
-}
-
-addtask unpack2 after do_unpack before do_patch
-
-
diff --git a/meta/recipes-devtools/gcc/gcc-csl-arm-2008q1.inc b/meta/recipes-devtools/gcc/gcc-csl-arm-2008q1.inc
deleted file mode 100644
index 648d783..0000000
--- a/meta/recipes-devtools/gcc/gcc-csl-arm-2008q1.inc
+++ /dev/null
@@ -1,53 +0,0 @@
-require gcc-common.inc
-
-BINV = "4.2.3"
-PV = "4.2.3+csl-arm-2008q1-126"
-PR = "r6"
-
-FILESDIR = "${FILE_DIRNAME}/gcc-csl-arm"
-
-SRC_URI = "http://www.codesourcery.com/public/gnu_toolchain/arm-none-eabi/arm-2008q1-126-arm-none-eabi.src.tar.bz2 \
-           file://gcc41-configure.in.patch \
-           file://arm-nolibfloat.patch \
-           file://arm-softfloat.patch \
-           file://zecke-xgcc-cpp.patch \
-"
-#           file://100-uclibc-conf.patch
-#           file://103-uclibc-conf-noupstream.patch
-#           file://200-uclibc-locale.patch
-#           file://203-uclibc-locale-no__x.patch
-#           file://204-uclibc-locale-wchar_fix.patch
-#           file://205-uclibc-locale-update.patch
-#           file://300-libstdc++-pic.patch
-#           file://302-c99-snprintf.patch
-#           file://303-c99-complex-ugly-hack.patch
-#           file://304-index_macro.patch
-#           file://305-libmudflap-susv3-legacy.patch
-#           file://306-libstdc++-namespace.patch
-#           file://307-locale_facets.patch
-#           file://402-libbackend_dep_gcov-iov.h.patch
-#           file://602-sdk-libstdc++-includes.patch
-#           file://gfortran.patch
-#           file://fortran-static-linking.patch
-#           file://gcc-configure-no-fortran.patch
-#           file://gcc-new-makeinfo.patch
-
-S = "${WORKDIR}/gcc-4.2"
-
-do_unpack2() {
-	cd ${WORKDIR}
-	tar -xvjf ./arm-2008q1-126-arm-none-eabi/gcc-2008q1-126.tar.bz2
-}
-
-# Language Overrides
-FORTRAN = ""
-#FORTRAN_linux-gnueabi = ",fortran"
-#JAVA = ",java"
-
-EXTRA_OECONF_BASE = "--enable-libssp --disable-bootstrap --disable-libgomp --disable-libmudflap"
-EXTRA_OECONF_INITIAL = "--disable-libmudflap --disable-libgomp --disable-libssp --disable-bootstrap"
-EXTRA_OECONF_INTERMEDIATE = "--disable-libmudflap --disable-libgomp --disable-libssp --disable-bootstrap"
-
-ARM_INSTRUCTION_SET = "arm"
-
-addtask unpack2 after do_unpack before do_patch
diff --git a/meta/recipes-devtools/gcc/gcc-csl-arm/arm-nolibfloat.patch b/meta/recipes-devtools/gcc/gcc-csl-arm/arm-nolibfloat.patch
deleted file mode 100644
index 57d4a00..0000000
--- a/meta/recipes-devtools/gcc/gcc-csl-arm/arm-nolibfloat.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Upstream-Status: Pending
-# Dimitry Andric <dimitry@andric.com>, 2004-05-01
-#
-# * Removed the extra -lfloat option from LIBGCC_SPEC, since it isn't needed
-#   anymore.  (The required functions are now in libgcc.)
-# 
-# Fixes errors like
-# arm-softfloat-linux-gnu/3.4.0/../../../../arm-softfloat-linux-gnu/bin/ld: cannot find -lfloat
-# collect2: ld returned 1 exit status
-# make[2]: *** [arm-softfloat-linux-gnu/gcc-3.4.0-glibc-2.3.2/build-glibc/iconvdata/ISO8859-1.so] Error 1
-# when building glibc-2.3.3 with gcc-3.4.0 for arm-softfloat
-
-Index: gcc-4.0.2/gcc/config/arm/linux-elf.h
-===================================================================
---- gcc-4.0.2.orig/gcc/config/arm/linux-elf.h	2005-03-04 16:14:01.000000000 +0000
-+++ gcc-4.0.2/gcc/config/arm/linux-elf.h	2005-11-11 18:02:54.000000000 +0000
-@@ -56,7 +56,7 @@
-    %{shared:-lc} \
-    %{!shared:%{profile:-lc_p}%{!profile:-lc}}"
- 
--#define LIBGCC_SPEC "%{msoft-float:-lfloat} %{mfloat-abi=soft*:-lfloat} -lgcc"
-+#define LIBGCC_SPEC "-lgcc"
- 
- /* Provide a STARTFILE_SPEC appropriate for GNU/Linux.  Here we add
-    the GNU/Linux magical crtbegin.o file (see crtstuff.c) which
diff --git a/meta/recipes-devtools/gcc/gcc-csl-arm/arm-softfloat.patch b/meta/recipes-devtools/gcc/gcc-csl-arm/arm-softfloat.patch
deleted file mode 100644
index 9a0a691..0000000
--- a/meta/recipes-devtools/gcc/gcc-csl-arm/arm-softfloat.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Pending
-Index: gcc-4.0.2/gcc/config/arm/t-linux
-===================================================================
---- gcc-4.0.2.orig/gcc/config/arm/t-linux	2004-05-15 12:41:35.000000000 +0000
-+++ gcc-4.0.2/gcc/config/arm/t-linux	2005-11-11 16:07:53.000000000 +0000
-@@ -4,7 +4,10 @@
- LIBGCC2_DEBUG_CFLAGS = -g0
- 
- LIB1ASMSRC = arm/lib1funcs.asm
--LIB1ASMFUNCS = _udivsi3 _divsi3 _umodsi3 _modsi3 _dvmd_lnx
-+LIB1ASMFUNCS = _udivsi3 _divsi3 _umodsi3 _modsi3 _dvmd_lnx \
-+    _negdf2 _addsubdf3 _muldivdf3 _cmpdf2 _unorddf2 _fixdfsi _fixunsdfsi \
-+    _truncdfsf2 _negsf2 _addsubsf3 _muldivsf3 _cmpsf2 _unordsf2 \
-+    _fixsfsi _fixunssfsi _floatdidf _floatdisf _floatundisf _floatundidf
- 
- # MULTILIB_OPTIONS = mhard-float/msoft-float
- # MULTILIB_DIRNAMES = hard-float soft-float
diff --git a/meta/recipes-devtools/gcc/gcc-csl-arm/gcc-3.4.4-eabi-bigendian.patch b/meta/recipes-devtools/gcc/gcc-csl-arm/gcc-3.4.4-eabi-bigendian.patch
deleted file mode 100644
index 7453acd..0000000
--- a/meta/recipes-devtools/gcc/gcc-csl-arm/gcc-3.4.4-eabi-bigendian.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Upstream-Status: Pending
---- gcc-2005q3/gcc/config/arm/linux-eabi.h~	2007-07-10 09:19:47.000000000 +0930
-+++ gcc-2005q3/gcc/config/arm/linux-eabi.h	2007-07-10 10:42:37.000000000 +0930
-@@ -48,7 +48,8 @@
- #define SUBTARGET_CPU_DEFAULT TARGET_CPU_arm10tdmi
- 
- #undef SUBTARGET_EXTRA_LINK_SPEC
--#define SUBTARGET_EXTRA_LINK_SPEC " -m armelf_linux_eabi"
-+#define SUBTARGET_EXTRA_LINK_SPEC \
-+    " %{mbig-endian:-m armelfb_linux_eabi} %{mlittle-endian:-m armelf_linux_eabi} "
- 
- /* Use ld-linux.so.3 so that it will be possible to run "classic"
-    GNU/Linux binaries on an EABI system.  */
diff --git a/meta/recipes-devtools/gcc/gcc-csl-arm/gcc-3.4.4-makefile-fix.patch b/meta/recipes-devtools/gcc/gcc-csl-arm/gcc-3.4.4-makefile-fix.patch
deleted file mode 100644
index 9c53173..0000000
--- a/meta/recipes-devtools/gcc/gcc-csl-arm/gcc-3.4.4-makefile-fix.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Upstream-Status: Pending
---- gcc-3.4.4/gcc/Makefile.in.orig	2005-07-25 21:00:37 +0200
-+++ gcc-3.4.4/gcc/Makefile.in	2005-07-25 21:01:19 +0200
-@@ -304,7 +304,7 @@
-     if [ "$(host)" = "$(target)" ] ; then \
-       echo ar; \
-     else \
--       t='$(program_transform_name)'; echo ar | sed -e $$t ; \
-+       t='$(program_transform_name)'; echo ar | sed -e "$$t" ; \
-     fi; \
-   fi`
- AR_FLAGS_FOR_TARGET =
-@@ -317,7 +317,7 @@
-     if [ "$(host)" = "$(target)" ] ; then \
-       echo $(RANLIB); \
-     else \
--       t='$(program_transform_name)'; echo ranlib | sed -e $$t ; \
-+       t='$(program_transform_name)'; echo ranlib | sed -e "$$t" ; \
-     fi; \
-   fi`
- NM_FOR_TARGET = ` \
-@@ -329,7 +329,7 @@
-     if [ "$(host)" = "$(target)" ] ; then \
-       echo nm; \
-     else \
--       t='$(program_transform_name)'; echo nm | sed -e $$t ; \
-+       t='$(program_transform_name)'; echo nm | sed -e "$$t" ; \
-     fi; \
-   fi`
- 
diff --git a/meta/recipes-devtools/gcc/gcc-csl-arm/gcc-configure-no-fortran.patch b/meta/recipes-devtools/gcc/gcc-csl-arm/gcc-configure-no-fortran.patch
deleted file mode 100644
index d9aed34..0000000
--- a/meta/recipes-devtools/gcc/gcc-csl-arm/gcc-configure-no-fortran.patch
+++ /dev/null
@@ -1,1076 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
---- tmp/configure.in.orig	2006-09-05 17:50:48.000000000 +0100
-+++ tmp/configure.in	2006-09-05 17:50:48.000000000 +0100
-@@ -157,7 +157,6 @@
- 		target-libstdc++-v3 \
- 		target-libmudflap \
- 		target-libssp \
--		target-libgfortran \
- 		${libgcj} \
- 		target-libobjc \
- 		target-libada"
-@@ -1084,77 +1083,6 @@
- AC_SUBST(docdir)
- AC_SUBST(htmldir)
- 
--# Check for GMP and MPFR
--gmplibs=
--gmpinc=
--have_gmp=yes
--# Specify a location for mpfr
--# check for this first so it ends up on the link line before gmp.
--AC_ARG_WITH(mpfr-dir, [  --with-mpfr-dir=PATH    Specify source directory for MPFR library])
--
--if test "x$with_mpfr_dir" != x; then
--  gmpinc="-I$with_mpfr_dir"
--  gmplibs="$with_mpfr_dir/libmpfr.a"
--else
--  gmplibs="-lmpfr"
--fi
--
--AC_ARG_WITH(mpfr, [  --with-mpfr=PATH        Specify directory for installed MPFR library])
--
--if test "x$with_mpfr" != x; then
--  gmplibs="-L$with_mpfr/lib $gmplibs"
--  gmpinc="-I$with_mpfr/include"
--fi
--
--# Specify a location for gmp
--AC_ARG_WITH(gmp-dir, [  --with-gmp-dir=PATH     Specify source directory for GMP library])
--
--if test "x$with_gmp_dir" != x; then
--  gmpinc="$gmpinc -I$with_gmp_dir"
--  if test -f "$with_gmp_dir/.libs/libgmp.a"; then
--    gmplibs="$gmplibs $with_gmp_dir/.libs/libgmp.a"
--  elif test -f "$with_gmp_dir/_libs/libgmp.a"; then
--    gmplibs="$gmplibs $with_gmp_dir/_libs/libgmp.a"
--  fi
--  # One of the later tests will catch the error if neither library is present.
--else
--  gmplibs="$gmplibs -lgmp"
--fi
--
--AC_ARG_WITH(gmp, [  --with-gmp=PATH         Specify directory for installed GMP library])
--
--if test "x$with_gmp" != x; then
--  gmplibs="-L$with_gmp/lib $gmplibs"
--  gmpinc="-I$with_gmp/include $gmpinc"
--fi
--
--saved_CFLAGS="$CFLAGS"
--CFLAGS="$CFLAGS $gmpinc"
--# Check GMP actually works
--AC_MSG_CHECKING([for correct version of gmp.h])
--AC_TRY_COMPILE([#include "gmp.h"],[
--#if __GNU_MP_VERSION < 3
--choke me
--#endif
--], [AC_MSG_RESULT([yes])],
--  [AC_MSG_RESULT([no]); have_gmp=no])
--
--if test x"$have_gmp" = xyes; then
--  AC_MSG_CHECKING([for MPFR])
--
--  saved_LIBS="$LIBS"
--  LIBS="$LIBS $gmplibs"
--  AC_TRY_LINK([#include <gmp.h>
--#include <mpfr.h>], [mpfr_t n; mpfr_init(n);],
--    [AC_MSG_RESULT([yes])],  [AC_MSG_RESULT([no]); have_gmp=no])
--  LIBS="$saved_LIBS"
--  CFLAGS="$saved_CFLAGS"
--fi
--
--# Flags needed for both GMP and/or MPFR
--AC_SUBST(gmplibs)
--AC_SUBST(gmpinc)
--
- # By default, C is the only stage 1 language.
- stage1_languages=c
- AC_SUBST(stage1_languages)
-@@ -1182,15 +1110,6 @@
-   fi
-   enable_languages=`echo "${enable_languages}" | sed -e 's/[[ 	,]][[ 	,]]*/,/g' -e 's/,$//'`
- 
--  # 'f95' is the old name for the 'fortran' language. We issue a warning
--  # and make the substitution.
--  case ,${enable_languages}, in
--    *,f95,*)
--      echo configure.in: warning: 'f95' as language name is deprecated, use 'fortran' instead 1>&2
--      enable_languages=`echo "${enable_languages}" | sed -e 's/f95/fortran/g'`
--      ;;
--  esac
--
-   # First scan to see if an enabled language requires some other language.
-   # We assume that a given config-lang.in will list all the language
-   # front ends it requires, even if some are required indirectly.
-@@ -2213,7 +2132,6 @@
- NCN_STRICT_CHECK_TARGET_TOOLS(DLLTOOL_FOR_TARGET, dlltool)
- NCN_STRICT_CHECK_TARGET_TOOLS(GCC_FOR_TARGET, gcc, ${CC_FOR_TARGET})
- NCN_STRICT_CHECK_TARGET_TOOLS(GCJ_FOR_TARGET, gcj)
--NCN_STRICT_CHECK_TARGET_TOOLS(GFORTRAN_FOR_TARGET, gfortran)
- NCN_STRICT_CHECK_TARGET_TOOLS(LD_FOR_TARGET, ld)
- NCN_STRICT_CHECK_TARGET_TOOLS(LIPO_FOR_TARGET, lipo)
- NCN_STRICT_CHECK_TARGET_TOOLS(NM_FOR_TARGET, nm)
-@@ -2237,9 +2155,7 @@
- GCC_TARGET_TOOL(gcc, GCC_FOR_TARGET, , [gcc/xgcc -B$$r/$(HOST_SUBDIR)/gcc/])
- GCC_TARGET_TOOL(gcj, GCJ_FOR_TARGET, GCJ,
- 		[gcc/gcj -B$$r/$(HOST_SUBDIR)/gcc/], java)
--GCC_TARGET_TOOL(gfortran, GFORTRAN_FOR_TARGET, GFORTRAN,
--		[gcc/gfortran -B$$r/$(HOST_SUBDIR)/gcc/], fortran)
- GCC_TARGET_TOOL(ld, LD_FOR_TARGET, LD, [ld/ld-new])
- GCC_TARGET_TOOL(lipo, LIPO_FOR_TARGET, LIPO)
- GCC_TARGET_TOOL(nm, NM_FOR_TARGET, NM, [binutils/nm-new])
-
---- tmp/Makefile.in.orig	2006-09-06 08:33:46.000000000 +0100
-+++ tmp/Makefile.in	2006-09-06 08:33:46.000000000 +0100
-@@ -119,7 +119,6 @@
- 	CXX="$(CXX_FOR_BUILD)"; export CXX; \
- 	CXXFLAGS="$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
- 	GCJ="$(GCJ_FOR_BUILD)"; export GCJ; \
--	GFORTRAN="$(GFORTRAN_FOR_BUILD)"; export GFORTRAN; \
- 	DLLTOOL="$(DLLTOOL_FOR_BUILD)"; export DLLTOOL; \
- 	LD="$(LD_FOR_BUILD)"; export LD; \
- 	LDFLAGS="$(LDFLAGS_FOR_BUILD)"; export LDFLAGS; \
-@@ -201,7 +200,6 @@
- 	CPPFLAGS="$(CPPFLAGS_FOR_TARGET)"; export CPPFLAGS; \
- 	CXXFLAGS="$(CXXFLAGS_FOR_TARGET)"; export CXXFLAGS; \
- 	GCJ="$(GCJ_FOR_TARGET)"; export GCJ; \
--	GFORTRAN="$(GFORTRAN_FOR_TARGET)"; export GFORTRAN; \
- 	DLLTOOL="$(DLLTOOL_FOR_TARGET)"; export DLLTOOL; \
- 	LD="$(COMPILER_LD_FOR_TARGET)"; export LD; \
- 	LDFLAGS="$(LDFLAGS_FOR_TARGET)"; export LDFLAGS; \
-@@ -313,7 +311,6 @@
- CXX_FOR_TARGET=$(STAGE_CC_WRAPPER) @CXX_FOR_TARGET@ $(FLAGS_FOR_TARGET)
- RAW_CXX_FOR_TARGET=$(STAGE_CC_WRAPPER) @RAW_CXX_FOR_TARGET@ $(FLAGS_FOR_TARGET)
- GCJ_FOR_TARGET=$(STAGE_CC_WRAPPER) @GCJ_FOR_TARGET@ $(FLAGS_FOR_TARGET)
--GFORTRAN_FOR_TARGET=$(STAGE_CC_WRAPPER) @GFORTRAN_FOR_TARGET@ $(FLAGS_FOR_TARGET)
- DLLTOOL_FOR_TARGET=@DLLTOOL_FOR_TARGET@
- LD_FOR_TARGET=@LD_FOR_TARGET@
- 
-@@ -452,7 +449,6 @@
- 	"CXXFLAGS_FOR_TARGET=$(CXXFLAGS_FOR_TARGET)" \
- 	"DLLTOOL_FOR_TARGET=$(DLLTOOL_FOR_TARGET)" \
- 	"GCJ_FOR_TARGET=$(GCJ_FOR_TARGET)" \
--	"GFORTRAN_FOR_TARGET=$(GFORTRAN_FOR_TARGET)" \
- 	"LD_FOR_TARGET=$(LD_FOR_TARGET)" \
- 	"LIPO_FOR_TARGET=$(LIPO_FOR_TARGET)" \
- 	"LDFLAGS_FOR_TARGET=$(LDFLAGS_FOR_TARGET)" \
-@@ -618,7 +614,6 @@
-     maybe-configure-target-libmudflap \
-     maybe-configure-target-libssp \
-     maybe-configure-target-newlib \
--    maybe-configure-target-libgfortran \
-     maybe-configure-target-libobjc \
-     maybe-configure-target-libtermcap \
-     maybe-configure-target-winsup \
-@@ -737,7 +732,6 @@
-     maybe-all-target-libmudflap \
-     maybe-all-target-libssp \
-     maybe-all-target-newlib \
--    maybe-all-target-libgfortran \
-     maybe-all-target-libobjc \
-     maybe-all-target-libtermcap \
-     maybe-all-target-winsup \
-@@ -844,7 +838,6 @@
-     maybe-info-target-libmudflap \
-     maybe-info-target-libssp \
-     maybe-info-target-newlib \
--    maybe-info-target-libgfortran \
-     maybe-info-target-libobjc \
-     maybe-info-target-libtermcap \
-     maybe-info-target-winsup \
-@@ -946,7 +939,6 @@
-     maybe-dvi-target-libmudflap \
-     maybe-dvi-target-libssp \
-     maybe-dvi-target-newlib \
--    maybe-dvi-target-libgfortran \
-     maybe-dvi-target-libobjc \
-     maybe-dvi-target-libtermcap \
-     maybe-dvi-target-winsup \
-@@ -1048,7 +1040,6 @@
-     maybe-html-target-libmudflap \
-     maybe-html-target-libssp \
-     maybe-html-target-newlib \
--    maybe-html-target-libgfortran \
-     maybe-html-target-libobjc \
-     maybe-html-target-libtermcap \
-     maybe-html-target-winsup \
-@@ -1150,7 +1141,6 @@
-     maybe-TAGS-target-libmudflap \
-     maybe-TAGS-target-libssp \
-     maybe-TAGS-target-newlib \
--    maybe-TAGS-target-libgfortran \
-     maybe-TAGS-target-libobjc \
-     maybe-TAGS-target-libtermcap \
-     maybe-TAGS-target-winsup \
-@@ -1252,7 +1242,6 @@
-     maybe-install-info-target-libmudflap \
-     maybe-install-info-target-libssp \
-     maybe-install-info-target-newlib \
--    maybe-install-info-target-libgfortran \
-     maybe-install-info-target-libobjc \
-     maybe-install-info-target-libtermcap \
-     maybe-install-info-target-winsup \
-@@ -1354,7 +1343,6 @@
-     maybe-install-html-target-libmudflap \
-     maybe-install-html-target-libssp \
-     maybe-install-html-target-newlib \
--    maybe-install-html-target-libgfortran \
-     maybe-install-html-target-libobjc \
-     maybe-install-html-target-libtermcap \
-     maybe-install-html-target-winsup \
-@@ -1456,7 +1444,6 @@
-     maybe-installcheck-target-libmudflap \
-     maybe-installcheck-target-libssp \
-     maybe-installcheck-target-newlib \
--    maybe-installcheck-target-libgfortran \
-     maybe-installcheck-target-libobjc \
-     maybe-installcheck-target-libtermcap \
-     maybe-installcheck-target-winsup \
-@@ -1558,7 +1545,6 @@
-     maybe-mostlyclean-target-libmudflap \
-     maybe-mostlyclean-target-libssp \
-     maybe-mostlyclean-target-newlib \
--    maybe-mostlyclean-target-libgfortran \
-     maybe-mostlyclean-target-libobjc \
-     maybe-mostlyclean-target-libtermcap \
-     maybe-mostlyclean-target-winsup \
-@@ -1660,7 +1646,6 @@
-     maybe-clean-target-libmudflap \
-     maybe-clean-target-libssp \
-     maybe-clean-target-newlib \
--    maybe-clean-target-libgfortran \
-     maybe-clean-target-libobjc \
-     maybe-clean-target-libtermcap \
-     maybe-clean-target-winsup \
-@@ -1762,7 +1747,6 @@
-     maybe-distclean-target-libmudflap \
-     maybe-distclean-target-libssp \
-     maybe-distclean-target-newlib \
--    maybe-distclean-target-libgfortran \
-     maybe-distclean-target-libobjc \
-     maybe-distclean-target-libtermcap \
-     maybe-distclean-target-winsup \
-@@ -1864,7 +1848,6 @@
-     maybe-maintainer-clean-target-libmudflap \
-     maybe-maintainer-clean-target-libssp \
-     maybe-maintainer-clean-target-newlib \
--    maybe-maintainer-clean-target-libgfortran \
-     maybe-maintainer-clean-target-libobjc \
-     maybe-maintainer-clean-target-libtermcap \
-     maybe-maintainer-clean-target-winsup \
-@@ -2024,7 +2007,6 @@
-     maybe-check-target-libmudflap \
-     maybe-check-target-libssp \
-     maybe-check-target-newlib \
--    maybe-check-target-libgfortran \
-     maybe-check-target-libobjc \
-     maybe-check-target-libtermcap \
-     maybe-check-target-winsup \
-@@ -2223,7 +2205,6 @@
-     maybe-install-target-libmudflap \
-     maybe-install-target-libssp \
-     maybe-install-target-newlib \
--    maybe-install-target-libgfortran \
-     maybe-install-target-libobjc \
-     maybe-install-target-libtermcap \
-     maybe-install-target-winsup \
-@@ -31606,382 +31587,6 @@
- 
- 
- # There's only one multilib.out.  Cleverer subdirs shouldn't need it copied.
--@if target-libgfortran
--$(TARGET_SUBDIR)/libgfortran/multilib.out: multilib.out
--	$(SHELL) $(srcdir)/mkinstalldirs $(TARGET_SUBDIR)/libgfortran ; \
--	rm -f $(TARGET_SUBDIR)/libgfortran/Makefile || : ; \
--	cp multilib.out $(TARGET_SUBDIR)/libgfortran/multilib.out
--@endif target-libgfortran
--
--
--
--.PHONY: configure-target-libgfortran maybe-configure-target-libgfortran
--maybe-configure-target-libgfortran:
--@if target-libgfortran
--maybe-configure-target-libgfortran: configure-target-libgfortran
--configure-target-libgfortran: $(TARGET_SUBDIR)/libgfortran/multilib.out
--	@$(unstage)
--	@test ! -f $(TARGET_SUBDIR)/libgfortran/Makefile || exit 0; \
--	$(SHELL) $(srcdir)/mkinstalldirs $(TARGET_SUBDIR)/libgfortran ; \
--	r=`${PWD_COMMAND}`; export r; \
--	s=`cd $(srcdir); ${PWD_COMMAND}`; export s; \
--	$(NORMAL_TARGET_EXPORTS) \
--	echo Configuring in $(TARGET_SUBDIR)/libgfortran; \
--	cd "$(TARGET_SUBDIR)/libgfortran" || exit 1; \
--	case $(srcdir) in \
--	  /* | [A-Za-z]:[\\/]*) topdir=$(srcdir) ;; \
--	  *) topdir=`echo $(TARGET_SUBDIR)/libgfortran/ | \
--		sed -e 's,\./,,g' -e 's,[^/]*/,../,g' `$(srcdir) ;; \
--	esac; \
--	srcdiroption="--srcdir=$${topdir}/libgfortran"; \
--	libsrcdir="$$s/libgfortran"; \
--	rm -f no-such-file || : ; \
--	CONFIG_SITE=no-such-file $(SHELL) $${libsrcdir}/configure \
--	  $(TARGET_CONFIGARGS) $${srcdiroption}  \
--	  || exit 1
--@endif target-libgfortran
--
--
--
--
--
--.PHONY: all-target-libgfortran maybe-all-target-libgfortran
--maybe-all-target-libgfortran:
--@if target-libgfortran
--TARGET-target-libgfortran=all
--maybe-all-target-libgfortran: all-target-libgfortran
--all-target-libgfortran: configure-target-libgfortran
--	@$(unstage)
--	@r=`${PWD_COMMAND}`; export r; \
--	s=`cd $(srcdir); ${PWD_COMMAND}`; export s; \
--	$(NORMAL_TARGET_EXPORTS) \
--	(cd $(TARGET_SUBDIR)/libgfortran && \
--	  $(MAKE) $(TARGET_FLAGS_TO_PASS)  $(TARGET-target-libgfortran))
--@endif target-libgfortran
--
--
--
--
--
--.PHONY: check-target-libgfortran maybe-check-target-libgfortran
--maybe-check-target-libgfortran:
--@if target-libgfortran
--maybe-check-target-libgfortran: check-target-libgfortran
--
--check-target-libgfortran:
--	@: $(MAKE); $(unstage)
--	@r=`${PWD_COMMAND}`; export r; \
--	s=`cd $(srcdir); ${PWD_COMMAND}`; export s; \
--	$(NORMAL_TARGET_EXPORTS) \
--	(cd $(TARGET_SUBDIR)/libgfortran && \
--	  $(MAKE) $(TARGET_FLAGS_TO_PASS)   check)
--
--@endif target-libgfortran
--
--.PHONY: install-target-libgfortran maybe-install-target-libgfortran
--maybe-install-target-libgfortran:
--@if target-libgfortran
--maybe-install-target-libgfortran: install-target-libgfortran
--
--install-target-libgfortran: installdirs
--	@: $(MAKE); $(unstage)
--	@r=`${PWD_COMMAND}`; export r; \
--	s=`cd $(srcdir); ${PWD_COMMAND}`; export s; \
--	$(NORMAL_TARGET_EXPORTS) \
--	(cd $(TARGET_SUBDIR)/libgfortran && \
--	  $(MAKE) $(TARGET_FLAGS_TO_PASS)  install)
--
--@endif target-libgfortran
--
--# Other targets (info, dvi, etc.)
--
--.PHONY: maybe-info-target-libgfortran info-target-libgfortran
--maybe-info-target-libgfortran:
--@if target-libgfortran
--maybe-info-target-libgfortran: info-target-libgfortran
--
--info-target-libgfortran: \
--    configure-target-libgfortran 
--	@: $(MAKE); $(unstage)
--	@[ -f $(TARGET_SUBDIR)/libgfortran/Makefile ] || exit 0 ; \
--	r=`${PWD_COMMAND}`; export r; \
--	s=`cd $(srcdir); ${PWD_COMMAND}`; export s; \
--	$(NORMAL_TARGET_EXPORTS) \
--	echo "Doing info in $(TARGET_SUBDIR)/libgfortran" ; \
--	for flag in $(EXTRA_TARGET_FLAGS); do \
--	  eval `echo "$$flag" | sed -e "s|^\([^=]*\)=\(.*\)|\1='\2'; export \1|"`; \
--	done; \
--	(cd $(TARGET_SUBDIR)/libgfortran && \
--	  $(MAKE) $(BASE_FLAGS_TO_PASS) "AR=$${AR}" "AS=$${AS}" \
--	          "CC=$${CC}" "CXX=$${CXX}" "LD=$${LD}" "NM=$${NM}" \
--	          "RANLIB=$${RANLIB}" \
--	          "DLLTOOL=$${DLLTOOL}" "WINDRES=$${WINDRES}" \
--	           info) \
--	  || exit 1
--
--@endif target-libgfortran
--
--.PHONY: maybe-dvi-target-libgfortran dvi-target-libgfortran
--maybe-dvi-target-libgfortran:
--@if target-libgfortran
--maybe-dvi-target-libgfortran: dvi-target-libgfortran
--
--dvi-target-libgfortran: \
--    configure-target-libgfortran 
--	@: $(MAKE); $(unstage)
--	@[ -f $(TARGET_SUBDIR)/libgfortran/Makefile ] || exit 0 ; \
--	r=`${PWD_COMMAND}`; export r; \
--	s=`cd $(srcdir); ${PWD_COMMAND}`; export s; \
--	$(NORMAL_TARGET_EXPORTS) \
--	echo "Doing dvi in $(TARGET_SUBDIR)/libgfortran" ; \
--	for flag in $(EXTRA_TARGET_FLAGS); do \
--	  eval `echo "$$flag" | sed -e "s|^\([^=]*\)=\(.*\)|\1='\2'; export \1|"`; \
--	done; \
--	(cd $(TARGET_SUBDIR)/libgfortran && \
--	  $(MAKE) $(BASE_FLAGS_TO_PASS) "AR=$${AR}" "AS=$${AS}" \
--	          "CC=$${CC}" "CXX=$${CXX}" "LD=$${LD}" "NM=$${NM}" \
--	          "RANLIB=$${RANLIB}" \
--	          "DLLTOOL=$${DLLTOOL}" "WINDRES=$${WINDRES}" \
--	           dvi) \
--	  || exit 1
--
--@endif target-libgfortran
--
--.PHONY: maybe-html-target-libgfortran html-target-libgfortran
--maybe-html-target-libgfortran:
--@if target-libgfortran
--maybe-html-target-libgfortran: html-target-libgfortran
--
--html-target-libgfortran: \
--    configure-target-libgfortran 
--	@: $(MAKE); $(unstage)
--	@[ -f $(TARGET_SUBDIR)/libgfortran/Makefile ] || exit 0 ; \
--	r=`${PWD_COMMAND}`; export r; \
--	s=`cd $(srcdir); ${PWD_COMMAND}`; export s; \
--	$(NORMAL_TARGET_EXPORTS) \
--	echo "Doing html in $(TARGET_SUBDIR)/libgfortran" ; \
--	for flag in $(EXTRA_TARGET_FLAGS); do \
--	  eval `echo "$$flag" | sed -e "s|^\([^=]*\)=\(.*\)|\1='\2'; export \1|"`; \
--	done; \
--	(cd $(TARGET_SUBDIR)/libgfortran && \
--	  $(MAKE) $(BASE_FLAGS_TO_PASS) "AR=$${AR}" "AS=$${AS}" \
--	          "CC=$${CC}" "CXX=$${CXX}" "LD=$${LD}" "NM=$${NM}" \
--	          "RANLIB=$${RANLIB}" \
--	          "DLLTOOL=$${DLLTOOL}" "WINDRES=$${WINDRES}" \
--	           html) \
--	  || exit 1
--
--@endif target-libgfortran
--
--.PHONY: maybe-TAGS-target-libgfortran TAGS-target-libgfortran
--maybe-TAGS-target-libgfortran:
--@if target-libgfortran
--maybe-TAGS-target-libgfortran: TAGS-target-libgfortran
--
--TAGS-target-libgfortran: \
--    configure-target-libgfortran 
--	@: $(MAKE); $(unstage)
--	@[ -f $(TARGET_SUBDIR)/libgfortran/Makefile ] || exit 0 ; \
--	r=`${PWD_COMMAND}`; export r; \
--	s=`cd $(srcdir); ${PWD_COMMAND}`; export s; \
--	$(NORMAL_TARGET_EXPORTS) \
--	echo "Doing TAGS in $(TARGET_SUBDIR)/libgfortran" ; \
--	for flag in $(EXTRA_TARGET_FLAGS); do \
--	  eval `echo "$$flag" | sed -e "s|^\([^=]*\)=\(.*\)|\1='\2'; export \1|"`; \
--	done; \
--	(cd $(TARGET_SUBDIR)/libgfortran && \
--	  $(MAKE) $(BASE_FLAGS_TO_PASS) "AR=$${AR}" "AS=$${AS}" \
--	          "CC=$${CC}" "CXX=$${CXX}" "LD=$${LD}" "NM=$${NM}" \
--	          "RANLIB=$${RANLIB}" \
--	          "DLLTOOL=$${DLLTOOL}" "WINDRES=$${WINDRES}" \
--	           TAGS) \
--	  || exit 1
--
--@endif target-libgfortran
--
--.PHONY: maybe-install-info-target-libgfortran install-info-target-libgfortran
--maybe-install-info-target-libgfortran:
--@if target-libgfortran
--maybe-install-info-target-libgfortran: install-info-target-libgfortran
--
--install-info-target-libgfortran: \
--    configure-target-libgfortran \
--    info-target-libgfortran 
--	@: $(MAKE); $(unstage)
--	@[ -f $(TARGET_SUBDIR)/libgfortran/Makefile ] || exit 0 ; \
--	r=`${PWD_COMMAND}`; export r; \
--	s=`cd $(srcdir); ${PWD_COMMAND}`; export s; \
--	$(NORMAL_TARGET_EXPORTS) \
--	echo "Doing install-info in $(TARGET_SUBDIR)/libgfortran" ; \
--	for flag in $(EXTRA_TARGET_FLAGS); do \
--	  eval `echo "$$flag" | sed -e "s|^\([^=]*\)=\(.*\)|\1='\2'; export \1|"`; \
--	done; \
--	(cd $(TARGET_SUBDIR)/libgfortran && \
--	  $(MAKE) $(BASE_FLAGS_TO_PASS) "AR=$${AR}" "AS=$${AS}" \
--	          "CC=$${CC}" "CXX=$${CXX}" "LD=$${LD}" "NM=$${NM}" \
--	          "RANLIB=$${RANLIB}" \
--	          "DLLTOOL=$${DLLTOOL}" "WINDRES=$${WINDRES}" \
--	           install-info) \
--	  || exit 1
--
--@endif target-libgfortran
--
--.PHONY: maybe-install-html-target-libgfortran install-html-target-libgfortran
--maybe-install-html-target-libgfortran:
--@if target-libgfortran
--maybe-install-html-target-libgfortran: install-html-target-libgfortran
--
--install-html-target-libgfortran: \
--    configure-target-libgfortran \
--    html-target-libgfortran 
--	@: $(MAKE); $(unstage)
--	@[ -f $(TARGET_SUBDIR)/libgfortran/Makefile ] || exit 0 ; \
--	r=`${PWD_COMMAND}`; export r; \
--	s=`cd $(srcdir); ${PWD_COMMAND}`; export s; \
--	$(NORMAL_TARGET_EXPORTS) \
--	echo "Doing install-html in $(TARGET_SUBDIR)/libgfortran" ; \
--	for flag in $(EXTRA_TARGET_FLAGS); do \
--	  eval `echo "$$flag" | sed -e "s|^\([^=]*\)=\(.*\)|\1='\2'; export \1|"`; \
--	done; \
--	(cd $(TARGET_SUBDIR)/libgfortran && \
--	  $(MAKE) $(BASE_FLAGS_TO_PASS) "AR=$${AR}" "AS=$${AS}" \
--	          "CC=$${CC}" "CXX=$${CXX}" "LD=$${LD}" "NM=$${NM}" \
--	          "RANLIB=$${RANLIB}" \
--	          "DLLTOOL=$${DLLTOOL}" "WINDRES=$${WINDRES}" \
--	           install-html) \
--	  || exit 1
--
--@endif target-libgfortran
--
--.PHONY: maybe-installcheck-target-libgfortran installcheck-target-libgfortran
--maybe-installcheck-target-libgfortran:
--@if target-libgfortran
--maybe-installcheck-target-libgfortran: installcheck-target-libgfortran
--
--installcheck-target-libgfortran: \
--    configure-target-libgfortran 
--	@: $(MAKE); $(unstage)
--	@[ -f $(TARGET_SUBDIR)/libgfortran/Makefile ] || exit 0 ; \
--	r=`${PWD_COMMAND}`; export r; \
--	s=`cd $(srcdir); ${PWD_COMMAND}`; export s; \
--	$(NORMAL_TARGET_EXPORTS) \
--	echo "Doing installcheck in $(TARGET_SUBDIR)/libgfortran" ; \
--	for flag in $(EXTRA_TARGET_FLAGS); do \
--	  eval `echo "$$flag" | sed -e "s|^\([^=]*\)=\(.*\)|\1='\2'; export \1|"`; \
--	done; \
--	(cd $(TARGET_SUBDIR)/libgfortran && \
--	  $(MAKE) $(BASE_FLAGS_TO_PASS) "AR=$${AR}" "AS=$${AS}" \
--	          "CC=$${CC}" "CXX=$${CXX}" "LD=$${LD}" "NM=$${NM}" \
--	          "RANLIB=$${RANLIB}" \
--	          "DLLTOOL=$${DLLTOOL}" "WINDRES=$${WINDRES}" \
--	           installcheck) \
--	  || exit 1
--
--@endif target-libgfortran
--
--.PHONY: maybe-mostlyclean-target-libgfortran mostlyclean-target-libgfortran
--maybe-mostlyclean-target-libgfortran:
--@if target-libgfortran
--maybe-mostlyclean-target-libgfortran: mostlyclean-target-libgfortran
--
--mostlyclean-target-libgfortran: 
--	@: $(MAKE); $(unstage)
--	@[ -f $(TARGET_SUBDIR)/libgfortran/Makefile ] || exit 0 ; \
--	r=`${PWD_COMMAND}`; export r; \
--	s=`cd $(srcdir); ${PWD_COMMAND}`; export s; \
--	$(NORMAL_TARGET_EXPORTS) \
--	echo "Doing mostlyclean in $(TARGET_SUBDIR)/libgfortran" ; \
--	for flag in $(EXTRA_TARGET_FLAGS); do \
--	  eval `echo "$$flag" | sed -e "s|^\([^=]*\)=\(.*\)|\1='\2'; export \1|"`; \
--	done; \
--	(cd $(TARGET_SUBDIR)/libgfortran && \
--	  $(MAKE) $(BASE_FLAGS_TO_PASS) "AR=$${AR}" "AS=$${AS}" \
--	          "CC=$${CC}" "CXX=$${CXX}" "LD=$${LD}" "NM=$${NM}" \
--	          "RANLIB=$${RANLIB}" \
--	          "DLLTOOL=$${DLLTOOL}" "WINDRES=$${WINDRES}" \
--	           mostlyclean) \
--	  || exit 1
--
--@endif target-libgfortran
--
--.PHONY: maybe-clean-target-libgfortran clean-target-libgfortran
--maybe-clean-target-libgfortran:
--@if target-libgfortran
--maybe-clean-target-libgfortran: clean-target-libgfortran
--
--clean-target-libgfortran: 
--	@: $(MAKE); $(unstage)
--	@[ -f $(TARGET_SUBDIR)/libgfortran/Makefile ] || exit 0 ; \
--	r=`${PWD_COMMAND}`; export r; \
--	s=`cd $(srcdir); ${PWD_COMMAND}`; export s; \
--	$(NORMAL_TARGET_EXPORTS) \
--	echo "Doing clean in $(TARGET_SUBDIR)/libgfortran" ; \
--	for flag in $(EXTRA_TARGET_FLAGS); do \
--	  eval `echo "$$flag" | sed -e "s|^\([^=]*\)=\(.*\)|\1='\2'; export \1|"`; \
--	done; \
--	(cd $(TARGET_SUBDIR)/libgfortran && \
--	  $(MAKE) $(BASE_FLAGS_TO_PASS) "AR=$${AR}" "AS=$${AS}" \
--	          "CC=$${CC}" "CXX=$${CXX}" "LD=$${LD}" "NM=$${NM}" \
--	          "RANLIB=$${RANLIB}" \
--	          "DLLTOOL=$${DLLTOOL}" "WINDRES=$${WINDRES}" \
--	           clean) \
--	  || exit 1
--
--@endif target-libgfortran
--
--.PHONY: maybe-distclean-target-libgfortran distclean-target-libgfortran
--maybe-distclean-target-libgfortran:
--@if target-libgfortran
--maybe-distclean-target-libgfortran: distclean-target-libgfortran
--
--distclean-target-libgfortran: 
--	@: $(MAKE); $(unstage)
--	@[ -f $(TARGET_SUBDIR)/libgfortran/Makefile ] || exit 0 ; \
--	r=`${PWD_COMMAND}`; export r; \
--	s=`cd $(srcdir); ${PWD_COMMAND}`; export s; \
--	$(NORMAL_TARGET_EXPORTS) \
--	echo "Doing distclean in $(TARGET_SUBDIR)/libgfortran" ; \
--	for flag in $(EXTRA_TARGET_FLAGS); do \
--	  eval `echo "$$flag" | sed -e "s|^\([^=]*\)=\(.*\)|\1='\2'; export \1|"`; \
--	done; \
--	(cd $(TARGET_SUBDIR)/libgfortran && \
--	  $(MAKE) $(BASE_FLAGS_TO_PASS) "AR=$${AR}" "AS=$${AS}" \
--	          "CC=$${CC}" "CXX=$${CXX}" "LD=$${LD}" "NM=$${NM}" \
--	          "RANLIB=$${RANLIB}" \
--	          "DLLTOOL=$${DLLTOOL}" "WINDRES=$${WINDRES}" \
--	           distclean) \
--	  || exit 1
--
--@endif target-libgfortran
--
--.PHONY: maybe-maintainer-clean-target-libgfortran maintainer-clean-target-libgfortran
--maybe-maintainer-clean-target-libgfortran:
--@if target-libgfortran
--maybe-maintainer-clean-target-libgfortran: maintainer-clean-target-libgfortran
--
--maintainer-clean-target-libgfortran: 
--	@: $(MAKE); $(unstage)
--	@[ -f $(TARGET_SUBDIR)/libgfortran/Makefile ] || exit 0 ; \
--	r=`${PWD_COMMAND}`; export r; \
--	s=`cd $(srcdir); ${PWD_COMMAND}`; export s; \
--	$(NORMAL_TARGET_EXPORTS) \
--	echo "Doing maintainer-clean in $(TARGET_SUBDIR)/libgfortran" ; \
--	for flag in $(EXTRA_TARGET_FLAGS); do \
--	  eval `echo "$$flag" | sed -e "s|^\([^=]*\)=\(.*\)|\1='\2'; export \1|"`; \
--	done; \
--	(cd $(TARGET_SUBDIR)/libgfortran && \
--	  $(MAKE) $(BASE_FLAGS_TO_PASS) "AR=$${AR}" "AS=$${AS}" \
--	          "CC=$${CC}" "CXX=$${CXX}" "LD=$${LD}" "NM=$${NM}" \
--	          "RANLIB=$${RANLIB}" \
--	          "DLLTOOL=$${DLLTOOL}" "WINDRES=$${WINDRES}" \
--	           maintainer-clean) \
--	  || exit 1
--
--@endif target-libgfortran
--
--
--
--# There's only one multilib.out.  Cleverer subdirs shouldn't need it copied.
- @if target-libobjc
- $(TARGET_SUBDIR)/libobjc/multilib.out: multilib.out
- 	$(SHELL) $(srcdir)/mkinstalldirs $(TARGET_SUBDIR)/libobjc ; \
-@@ -38574,8 +38179,6 @@
- 
- configure-target-newlib: maybe-all-gcc
- 
--configure-target-libgfortran: maybe-all-gcc
--
- configure-target-libobjc: maybe-all-gcc
- 
- configure-target-libtermcap: maybe-all-gcc
-@@ -38613,9 +38216,7 @@
- 
- configure-target-libada: maybe-all-target-newlib maybe-all-target-libgloss
- 
--configure-target-libgfortran: maybe-all-target-newlib maybe-all-target-libgloss
--
- configure-target-libffi: maybe-all-target-newlib maybe-all-target-libgloss
- 
- configure-target-libjava: maybe-all-target-newlib maybe-all-target-libgloss
-
---- tmp/Makefile.tpl.orig	2006-09-06 08:36:52.000000000 +0100
-+++ tmp/Makefile.tpl	2006-09-06 08:36:52.000000000 +0100
-@@ -122,7 +122,6 @@
- 	CXX="$(CXX_FOR_BUILD)"; export CXX; \
- 	CXXFLAGS="$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
- 	GCJ="$(GCJ_FOR_BUILD)"; export GCJ; \
--	GFORTRAN="$(GFORTRAN_FOR_BUILD)"; export GFORTRAN; \
- 	DLLTOOL="$(DLLTOOL_FOR_BUILD)"; export DLLTOOL; \
- 	LD="$(LD_FOR_BUILD)"; export LD; \
- 	LDFLAGS="$(LDFLAGS_FOR_BUILD)"; export LDFLAGS; \
-@@ -204,7 +203,6 @@
- 	CPPFLAGS="$(CPPFLAGS_FOR_TARGET)"; export CPPFLAGS; \
- 	CXXFLAGS="$(CXXFLAGS_FOR_TARGET)"; export CXXFLAGS; \
- 	GCJ="$(GCJ_FOR_TARGET)"; export GCJ; \
--	GFORTRAN="$(GFORTRAN_FOR_TARGET)"; export GFORTRAN; \
- 	DLLTOOL="$(DLLTOOL_FOR_TARGET)"; export DLLTOOL; \
- 	LD="$(COMPILER_LD_FOR_TARGET)"; export LD; \
- 	LDFLAGS="$(LDFLAGS_FOR_TARGET)"; export LDFLAGS; \
-@@ -316,7 +314,6 @@
- CXX_FOR_TARGET=$(STAGE_CC_WRAPPER) @CXX_FOR_TARGET@ $(FLAGS_FOR_TARGET)
- RAW_CXX_FOR_TARGET=$(STAGE_CC_WRAPPER) @RAW_CXX_FOR_TARGET@ $(FLAGS_FOR_TARGET)
- GCJ_FOR_TARGET=$(STAGE_CC_WRAPPER) @GCJ_FOR_TARGET@ $(FLAGS_FOR_TARGET)
--GFORTRAN_FOR_TARGET=$(STAGE_CC_WRAPPER) @GFORTRAN_FOR_TARGET@ $(FLAGS_FOR_TARGET)
- DLLTOOL_FOR_TARGET=@DLLTOOL_FOR_TARGET@
- LD_FOR_TARGET=@LD_FOR_TARGET@
-
---- tmp/Makefile.def.orig	2006-09-06 08:38:50.000000000 +0100
-+++ tmp/Makefile.def	2006-09-06 08:38:50.000000000 +0100
-@@ -117,7 +117,6 @@
- target_modules = { module= libmudflap; lib_path=.libs; };
- target_modules = { module= libssp; lib_path=.libs; };
- target_modules = { module= newlib; };
--target_modules = { module= libgfortran; };
- target_modules = { module= libobjc; };
- target_modules = { module= libtermcap; no_check=true;
-                    missing=mostlyclean;
-@@ -227,7 +226,6 @@
- flags_to_pass = { flag= CXXFLAGS_FOR_TARGET ; };
- flags_to_pass = { flag= DLLTOOL_FOR_TARGET ; };
- flags_to_pass = { flag= GCJ_FOR_TARGET ; };
--flags_to_pass = { flag= GFORTRAN_FOR_TARGET ; };
- flags_to_pass = { flag= LD_FOR_TARGET ; };
- flags_to_pass = { flag= LIPO_FOR_TARGET ; };
- flags_to_pass = { flag= LDFLAGS_FOR_TARGET ; };
-@@ -415,7 +413,6 @@
- lang_env_dependencies = { module=boehm-gc; };
- lang_env_dependencies = { module=gperf; cxx=true; };
- lang_env_dependencies = { module=libada; };
--lang_env_dependencies = { module=libgfortran; };
- lang_env_dependencies = { module=libffi; };
- lang_env_dependencies = { module=libjava; cxx=true; };
- lang_env_dependencies = { module=libmudflap; };
-
---- tmp/configure.orgig	2006-09-06 10:01:52.000000000 +0100
-+++ tmp/configure	2006-09-06 10:01:52.000000000 +0100
-@@ -921,7 +921,6 @@
- 		target-libstdc++-v3 \
- 		target-libmudflap \
- 		target-libssp \
--		target-libgfortran \
- 		${libgcj} \
- 		target-libobjc \
- 		target-libada"
-@@ -2246,135 +2245,6 @@
- fi
- 
- 
--
--
--
--
--# Check for GMP and MPFR
--gmplibs=
--gmpinc=
--have_gmp=yes
--# Specify a location for mpfr
--# check for this first so it ends up on the link line before gmp.
--# Check whether --with-mpfr-dir or --without-mpfr-dir was given.
--if test "${with_mpfr_dir+set}" = set; then
--  withval="$with_mpfr_dir"
--  :
--fi
--
--
--if test "x$with_mpfr_dir" != x; then
--  gmpinc="-I$with_mpfr_dir"
--  gmplibs="$with_mpfr_dir/libmpfr.a"
--else
--  gmplibs="-lmpfr"
--fi
--
--# Check whether --with-mpfr or --without-mpfr was given.
--if test "${with_mpfr+set}" = set; then
--  withval="$with_mpfr"
--  :
--fi
--
--
--if test "x$with_mpfr" != x; then
--  gmplibs="-L$with_mpfr/lib $gmplibs"
--  gmpinc="-I$with_mpfr/include"
--fi
--
--# Specify a location for gmp
--# Check whether --with-gmp-dir or --without-gmp-dir was given.
--if test "${with_gmp_dir+set}" = set; then
--  withval="$with_gmp_dir"
--  :
--fi
--
--
--if test "x$with_gmp_dir" != x; then
--  gmpinc="$gmpinc -I$with_gmp_dir"
--  if test -f "$with_gmp_dir/.libs/libgmp.a"; then
--    gmplibs="$gmplibs $with_gmp_dir/.libs/libgmp.a"
--  elif test -f "$with_gmp_dir/_libs/libgmp.a"; then
--    gmplibs="$gmplibs $with_gmp_dir/_libs/libgmp.a"
--  fi
--  # One of the later tests will catch the error if neither library is present.
--else
--  gmplibs="$gmplibs -lgmp"
--fi
--
--# Check whether --with-gmp or --without-gmp was given.
--if test "${with_gmp+set}" = set; then
--  withval="$with_gmp"
--  :
--fi
--
--
--if test "x$with_gmp" != x; then
--  gmplibs="-L$with_gmp/lib $gmplibs"
--  gmpinc="-I$with_gmp/include $gmpinc"
--fi
--
--saved_CFLAGS="$CFLAGS"
--CFLAGS="$CFLAGS $gmpinc"
--# Check GMP actually works
--echo $ac_n "checking for correct version of gmp.h""... $ac_c" 1>&6
--echo "configure:2322: checking for correct version of gmp.h" >&5
--cat > conftest.$ac_ext <<EOF
--#line 2324 "configure"
--#include "confdefs.h"
--#include "gmp.h"
--int main() {
--
--#if __GNU_MP_VERSION < 3
--choke me
--#endif
--
--; return 0; }
--EOF
--if { (eval echo configure:2335: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>&5; }; then
--  rm -rf conftest*
--  echo "$ac_t""yes" 1>&6
--else
--  echo "configure: failed program was:" >&5
--  cat conftest.$ac_ext >&5
--  rm -rf conftest*
--  echo "$ac_t""no" 1>&6; have_gmp=no
--fi
--rm -f conftest*
--
--if test x"$have_gmp" = xyes; then
--  echo $ac_n "checking for MPFR""... $ac_c" 1>&6
--echo "configure:2348: checking for MPFR" >&5
--
--  saved_LIBS="$LIBS"
--  LIBS="$LIBS $gmplibs"
--  cat > conftest.$ac_ext <<EOF
--#line 2353 "configure"
--#include "confdefs.h"
--#include <gmp.h>
--#include <mpfr.h>
--int main() {
--mpfr_t n; mpfr_init(n);
--; return 0; }
--EOF
--if { (eval echo configure:2361: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
--  rm -rf conftest*
--  echo "$ac_t""yes" 1>&6
--else
--  echo "configure: failed program was:" >&5
--  cat conftest.$ac_ext >&5
--  rm -rf conftest*
--  echo "$ac_t""no" 1>&6; have_gmp=no
--fi
--rm -f conftest*
--  LIBS="$saved_LIBS"
--  CFLAGS="$saved_CFLAGS"
--fi
--
--# Flags needed for both GMP and/or MPFR
--
--
--
- # By default, C is the only stage 1 language.
- stage1_languages=c
- 
-@@ -2402,15 +2272,6 @@
-   fi
-   enable_languages=`echo "${enable_languages}" | sed -e 's/[ 	,][ 	,]*/,/g' -e 's/,$//'`
- 
--  # 'f95' is the old name for the 'fortran' language. We issue a warning
--  # and make the substitution.
--  case ,${enable_languages}, in
--    *,f95,*)
--      echo configure.in: warning: 'f95' as language name is deprecated, use 'fortran' instead 1>&2
--      enable_languages=`echo "${enable_languages}" | sed -e 's/f95/fortran/g'`
--      ;;
--  esac
--
-   # First scan to see if an enabled language requires some other language.
-   # We assume that a given config-lang.in will list all the language
-   # front ends it requires, even if some are required indirectly.
-@@ -5036,81 +4897,6 @@
-   fi
- fi
- 
-- for ncn_progname in gfortran; do
--  if test -n "$ncn_target_tool_prefix"; then
--    # Extract the first word of "${ncn_target_tool_prefix}${ncn_progname}", so it can be a program name with args.
--set dummy ${ncn_target_tool_prefix}${ncn_progname}; ac_word=$2
--echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:5045: checking for $ac_word" >&5
--if eval "test \"`echo '$''{'ac_cv_prog_GFORTRAN_FOR_TARGET'+set}'`\" = set"; then
--  echo $ac_n "(cached) $ac_c" 1>&6
--else
--  if test -n "$GFORTRAN_FOR_TARGET"; then
--  ac_cv_prog_GFORTRAN_FOR_TARGET="$GFORTRAN_FOR_TARGET" # Let the user override the test.
--else
--  IFS="${IFS= 	}"; ac_save_ifs="$IFS"; IFS=":"
--  ac_dummy="$PATH"
--  for ac_dir in $ac_dummy; do
--    test -z "$ac_dir" && ac_dir=.
--    if test -f $ac_dir/$ac_word; then
--      ac_cv_prog_GFORTRAN_FOR_TARGET="${ncn_target_tool_prefix}${ncn_progname}"
--      break
--    fi
--  done
--  IFS="$ac_save_ifs"
--fi
--fi
--GFORTRAN_FOR_TARGET="$ac_cv_prog_GFORTRAN_FOR_TARGET"
--if test -n "$GFORTRAN_FOR_TARGET"; then
--  echo "$ac_t""$GFORTRAN_FOR_TARGET" 1>&6
--else
--  echo "$ac_t""no" 1>&6
--fi
--
--  fi
--  if test -z "$ac_cv_prog_GFORTRAN_FOR_TARGET" && test $build = $target ; then
--    # Extract the first word of "${ncn_progname}", so it can be a program name with args.
--set dummy ${ncn_progname}; ac_word=$2
--echo $ac_n "checking for $ac_word""... $ac_c" 1>&6
--echo "configure:5076: checking for $ac_word" >&5
--if eval "test \"`echo '$''{'ac_cv_prog_GFORTRAN_FOR_TARGET'+set}'`\" = set"; then
--  echo $ac_n "(cached) $ac_c" 1>&6
--else
--  if test -n "$GFORTRAN_FOR_TARGET"; then
--  ac_cv_prog_GFORTRAN_FOR_TARGET="$GFORTRAN_FOR_TARGET" # Let the user override the test.
--else
--  IFS="${IFS= 	}"; ac_save_ifs="$IFS"; IFS=":"
--  ac_dummy="$PATH"
--  for ac_dir in $ac_dummy; do
--    test -z "$ac_dir" && ac_dir=.
--    if test -f $ac_dir/$ac_word; then
--      ac_cv_prog_GFORTRAN_FOR_TARGET="${ncn_progname}"
--      break
--    fi
--  done
--  IFS="$ac_save_ifs"
--fi
--fi
--GFORTRAN_FOR_TARGET="$ac_cv_prog_GFORTRAN_FOR_TARGET"
--if test -n "$GFORTRAN_FOR_TARGET"; then
--  echo "$ac_t""$GFORTRAN_FOR_TARGET" 1>&6
--else
--  echo "$ac_t""no" 1>&6
--fi
-- 
--  fi
--  test -n "$ac_cv_prog_GFORTRAN_FOR_TARGET" && break
--done
--
--if test -z "$ac_cv_prog_GFORTRAN_FOR_TARGET" ; then
--  set dummy gfortran
--  if test $build = $target ; then
--    GFORTRAN_FOR_TARGET="$2"
--  else
--    GFORTRAN_FOR_TARGET="${ncn_target_tool_prefix}$2"
--  fi
--fi
--
-  for ncn_progname in ld; do
-   if test -n "$ncn_target_tool_prefix"; then
-     # Extract the first word of "${ncn_target_tool_prefix}${ncn_progname}", so it can be a program name with args.
-@@ -5843,34 +5629,6 @@
-     echo "$ac_t""pre-installed" 1>&6
-   fi
- fi
--echo $ac_n "checking where to find the target gfortran""... $ac_c" 1>&6
--echo "configure:5848: checking where to find the target gfortran" >&5
--if test "x${build}" != "x${host}" ; then
--  # Canadian cross, just use what we found
--  echo "$ac_t""pre-installed" 1>&6
--else
--  ok=yes
--  case " ${configdirs} " in
--    *" gcc "*) ;;
--    *) ok=no ;;
--  esac
--  case ,${enable_languages}, in
--    *,fortran,*) ;;
--    *) ok=no ;;
--  esac
--  if test $ok = yes; then
--    # An in-tree tool is available and we can use it
--    GFORTRAN_FOR_TARGET='$$r/$(HOST_SUBDIR)/gcc/gfortran -B$$r/$(HOST_SUBDIR)/gcc/'
--    echo "$ac_t""just compiled" 1>&6
--  elif test "x$target" = "x$host"; then
--    # We can use an host tool
--    GFORTRAN_FOR_TARGET='$(GFORTRAN)'
--    echo "$ac_t""host tool" 1>&6
--  else
--    # We need a cross tool
--    echo "$ac_t""pre-installed" 1>&6
--  fi
--fi
- echo $ac_n "checking where to find the target ld""... $ac_c" 1>&6
- echo "configure:5876: checking where to find the target ld" >&5
- if test "x${build}" != "x${host}" ; then
-@@ -6413,7 +6171,6 @@
- s%@DLLTOOL_FOR_TARGET@%$DLLTOOL_FOR_TARGET%g
- s%@GCC_FOR_TARGET@%$GCC_FOR_TARGET%g
- s%@GCJ_FOR_TARGET@%$GCJ_FOR_TARGET%g
--s%@GFORTRAN_FOR_TARGET@%$GFORTRAN_FOR_TARGET%g
- s%@LD_FOR_TARGET@%$LD_FOR_TARGET%g
- s%@LIPO_FOR_TARGET@%$LIPO_FOR_TARGET%g
- s%@NM_FOR_TARGET@%$NM_FOR_TARGET%g
-
---- tmp/config-ml.in.orig	2006-09-06 10:27:49.000000000 +0100
-+++ tmp/config-ml.in	2006-09-06 10:27:49.000000000 +0100
-@@ -785,14 +785,12 @@
-         break
-       fi
-     done
--    ml_config_env='CC="${CC_}$flags" CXX="${CXX_}$flags" F77="${F77_}$flags" GCJ="${GCJ_}$flags" GFORTRAN="${GFORTRAN_}$flags"'
-+    ml_config_env='CC="${CC_}$flags" CXX="${CXX_}$flags" GCJ="${GCJ_}$flags"'
- 
-     if [ "${with_target_subdir}" = "." ]; then
- 	CC_=$CC' '
- 	CXX_=$CXX' '
--	F77_=$F77' '
- 	GCJ_=$GCJ' '
--	GFORTRAN_=$GFORTRAN' '
-     else
- 	# Create a regular expression that matches any string as long
- 	# as ML_POPDIR.
-@@ -821,18 +819,6 @@
- 	  esac
- 	done
- 
--	F77_=
--	for arg in ${F77}; do
--	  case $arg in
--	  -[BIL]"${ML_POPDIR}"/*)
--	    F77_="${F77_}"`echo "X${arg}" | sed -n "s/X\\(-[BIL]${popdir_rx}\\).*/\\1/p"`/${ml_dir}`echo "X${arg}" | sed -n "s/X-[BIL]${popdir_rx}\\(.*\\)/\\1/p"`' ' ;;
--	  "${ML_POPDIR}"/*)
--	    F77_="${F77_}"`echo "X${arg}" | sed -n "s/X\\(${popdir_rx}\\).*/\\1/p"`/${ml_dir}`echo "X${arg}" | sed -n "s/X${popdir_rx}\\(.*\\)/\\1/p"`' ' ;;
--	  *)
--	    F77_="${F77_}${arg} " ;;
--	  esac
--	done
--
- 	GCJ_=
- 	for arg in ${GCJ}; do
- 	  case $arg in
-@@ -845,18 +831,6 @@
- 	  esac
- 	done
- 
--	GFORTRAN_=
--	for arg in ${GFORTRAN}; do
--	  case $arg in
--	  -[BIL]"${ML_POPDIR}"/*)
--	    GFORTRAN_="${GFORTRAN_}"`echo "X${arg}" | sed -n "s/X\\(-[BIL]${popdir_rx}\\).*/\\1/p"`/${ml_dir}`echo "X${arg}" | sed -n "s/X-[BIL]${popdir_rx}\\(.*\\)/\\1/p"`' ' ;;
--	  "${ML_POPDIR}"/*)
--	    GFORTRAN_="${GFORTRAN_}"`echo "X${arg}" | sed -n "s/X\\(${popdir_rx}\\).*/\\1/p"`/${ml_dir}`echo "X${arg}" | sed -n "s/X${popdir_rx}\\(.*\\)/\\1/p"`' ' ;;
--	  *)
--	    GFORTRAN_="${GFORTRAN_}${arg} " ;;
--	  esac
--	done
--
- 	if test "x${LD_LIBRARY_PATH+set}" = xset; then
- 	  LD_LIBRARY_PATH_=
- 	  for arg in `echo "$LD_LIBRARY_PATH" | tr ':' ' '`; do
diff --git a/meta/recipes-devtools/gcc/gcc-csl-arm/gcc-new-makeinfo.patch b/meta/recipes-devtools/gcc/gcc-csl-arm/gcc-new-makeinfo.patch
deleted file mode 100644
index bd3197d..0000000
--- a/meta/recipes-devtools/gcc/gcc-csl-arm/gcc-new-makeinfo.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
----
- configure    |    2 +-
- configure.in |    2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
---- gcc-2006q1.orig/configure
-+++ gcc-2006q1/configure
-@@ -3453,11 +3453,11 @@ case " $build_configdirs " in
-   *)
- 
-     # For an installed makeinfo, we require it to be from texinfo 4.2 or
-     # higher, else we use the "missing" dummy.
-     if ${MAKEINFO} --version \
--       | egrep 'texinfo[^0-9]*([1-3][0-9]|4\.[2-9]|[5-9])' >/dev/null 2>&1; then
-+       | egrep 'texinfo[^0-9]*(4\.([6-9]|[1-9][0-9])|[5-9]|[1-9][0-9])' >/dev/null 2>&1; then
-       :
-     else
-       MAKEINFO="$MISSING makeinfo"
-     fi
-     ;;
---- gcc-2006q1.orig/configure.in
-+++ gcc-2006q1/configure.in
-@@ -2078,11 +2078,11 @@ case " $build_configdirs " in
-   *)
- changequote(,)
-     # For an installed makeinfo, we require it to be from texinfo 4.2 or
-     # higher, else we use the "missing" dummy.
-     if ${MAKEINFO} --version \
--       | egrep 'texinfo[^0-9]*([1-3][0-9]|4\.[2-9]|[5-9])' >/dev/null 2>&1; then
-+       | egrep 'texinfo[^0-9]*(4\.([6-9]|[1-9][0-9])|[5-9]|[1-9][0-9])' >/dev/null 2>&1; then
-       :
-     else
-       MAKEINFO="$MISSING makeinfo"
-     fi
-     ;;
diff --git a/meta/recipes-devtools/gcc/gcc-csl-arm/gcc41-configure.in.patch b/meta/recipes-devtools/gcc/gcc-csl-arm/gcc41-configure.in.patch
deleted file mode 100644
index 88b0611..0000000
--- a/meta/recipes-devtools/gcc/gcc-csl-arm/gcc41-configure.in.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
---- gcc-3.4.4/configure.in.orig	2005-08-09 19:57:51.504323183 -0700
-+++ gcc-3.4.4/configure.in	2005-08-09 20:00:12.073168623 -0700
-@@ -1907,7 +1907,7 @@
-   *) gxx_include_dir=${with_gxx_include_dir} ;;
- esac
- 
--FLAGS_FOR_TARGET=
-+FLAGS_FOR_TARGET="$ARCH_FLAGS_FOR_TARGET"
- case " $target_configdirs " in
-  *" newlib "*)
-   case " $target_configargs " in
---- gcc-3.4.4/configure.orig	2005-08-09 21:02:29.668360660 -0700
-+++ gcc-3.4.4/configure	2005-08-09 21:02:50.157649970 -0700
-@@ -2669,7 +2669,7 @@
-   *) gxx_include_dir=${with_gxx_include_dir} ;;
- esac
- 
--FLAGS_FOR_TARGET=
-+FLAGS_FOR_TARGET="$ARCH_FLAGS_FOR_TARGET"
- case " $target_configdirs " in
-  *" newlib "*)
-   case " $target_configargs " in
diff --git a/meta/recipes-devtools/gcc/gcc-csl-arm/gcc_optab_arm.patch b/meta/recipes-devtools/gcc/gcc-csl-arm/gcc_optab_arm.patch
deleted file mode 100644
index 5738a47..0000000
--- a/meta/recipes-devtools/gcc/gcc-csl-arm/gcc_optab_arm.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-Upstream-Status: Pending
-
-ARM is the only architecture that has a helper function that returns
-an unbiased result. This fix is trivial enough that we can show it
-doesn't effect any of the other arches. Can we consider this a
-regression fix since it used to work until the helper was added :}
-
-Tested with no regressions on x86_64-pc-linux-gnu and arm-none-eabi.
-
-Cheers,
-Carlos.
--- 
-Carlos O'Donell
-CodeSourcery
-carlos@codesourcery.com
-(650) 331-3385 x716
-
-gcc/
-
-2006-01-27  Carlos O'Donell  <carlos@codesourcery.com>
-
-	* optabs.c (prepare_cmp_insn): If unbaised and unsigned then bias
-	the comparison routine return.
-	
-gcc/testsuite/
-
-2006-01-27  Carlos O'Donell  <carlos@codesourcery.com>
-
-	* gcc.dg/unsigned-long-compare.c: New test.
-
-Index: gcc/optabs.c
-===================================================================
---- 1/gcc/optabs.c	(revision 110300)
-+++ 2/gcc/optabs.c	(working copy)
-@@ -3711,18 +3711,24 @@
-       result = emit_library_call_value (libfunc, NULL_RTX, LCT_CONST_MAKE_BLOCK,
- 					word_mode, 2, x, mode, y, mode);
- 
-+      /* There are two kinds of comparison routines. Biased routines
-+	 return 0/1/2, and unbiased routines return -1/0/1. Other parts
-+	 of gcc expect that the comparison operation is equivalent
-+	 to the modified comparison. For signed comparisons compare the 
-+	 result against 1 in the unbiased case, and zero in the biased
-+	 case. For unsigned comparisons always compare against 1 after
-+	 biasing the unbased result by adding 1. This gives us a way to
-+	 represent LTU. */
-       *px = result;
-       *pmode = word_mode;
--      if (TARGET_LIB_INT_CMP_BIASED)
--	/* Integer comparison returns a result that must be compared
--	   against 1, so that even if we do an unsigned compare
--	   afterward, there is still a value that can represent the
--	   result "less than".  */
--	*py = const1_rtx;
--      else
-+      *py = const1_rtx;
-+
-+      if (!TARGET_LIB_INT_CMP_BIASED)
- 	{
--	  *py = const0_rtx;
--	  *punsignedp = 1;
-+	  if (*punsignedp)
-+	    *px = plus_constant (result, 1);  
-+	  else
-+	    *py = const0_rtx;
- 	}
-       return;
-     }
-Index: gcc/testsuite/gcc.dg/unsigned-long-compare.c
-===================================================================
---- 1/gcc/testsuite/gcc.dg/unsigned-long-compare.c	(revision 0)
-+++ 2/gcc/testsuite/gcc.dg/unsigned-long-compare.c	(revision 0)
-@@ -0,0 +1,24 @@
-+/* Copyright (C) 2006 Free Software Foundation, Inc. */
-+/* Contributed by Carlos O'Donell on 2006-01-27 */
-+
-+/* Test a division corner case where the expression simplifies
-+   to a comparison, and the optab expansion is wrong. The optab 
-+   expansion emits a function whose return is unbiased and needs
-+   adjustment. */
-+/* Origin: Carlos O'Donell <carlos@codesourcery.com> */
-+/* { dg-do run { target arm-*-*eabi* } } */
-+/* { dg-options "" } */
-+#include <stdlib.h>
-+
-+#define BIG_CONSTANT 0xFFFFFFFF80000000ULL
-+
-+int main (void)
-+{
-+  unsigned long long OneULL = 1ULL;
-+  unsigned long long result;
-+
-+  result = OneULL / BIG_CONSTANT; 
-+  if (result)
-+    abort ();
-+  exit (0);
-+}
diff --git a/meta/recipes-devtools/gcc/gcc-csl-arm/gfortran.patch b/meta/recipes-devtools/gcc/gcc-csl-arm/gfortran.patch
deleted file mode 100644
index c78e831..0000000
--- a/meta/recipes-devtools/gcc/gcc-csl-arm/gfortran.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-Upstream-Status: Pending
-
-The patch below fixes a crash building libgfortran on arm-linux-gnueabi.
-
-This target doesn't really have a 128-bit integer type, however it does use 
-TImode to represent the return value of certain special ABI defined library 
-functions. This results in type_for_size(TImode) being called.
-
-Because TImode deosn't correspond to any gfortran integer kind 
-gfc_type_for_size returns NULL and we segfault shortly after.
-
-The patch below fixes this by making gfc_type_for_size handle TImode in the 
-same way as the C frontend.
-
-Tested on x86_64-linux and arm-linux-gnueabi.
-Applied to trunk.
-
-Paul
-
-2007-05-15  Paul Brook  <paul@codesourcery.com>
-
-	gcc/fortran/
-	* trans-types.c (gfc_type_for_size): Handle signed TImode.
-
-Index: gcc-4.2.1/gcc/fortran/trans-types.c
-===================================================================
---- gcc-4.2.1/gcc/fortran/trans-types.c	(revision 170435)
-+++ gcc-4.2.1/gcc/fortran/trans-types.c	(working copy)
-@@ -1800,6 +1800,13 @@ gfc_type_for_size (unsigned bits, int un
- 	  if (type && bits == TYPE_PRECISION (type))
- 	    return type;
- 	}
-+
-+      /* Handle TImode as a special case because it is used by some backends
-+         (eg. ARM) even though it is not available for normal use.  */
-+#if HOST_BITS_PER_WIDE_INT >= 64
-+      if (bits == TYPE_PRECISION (intTI_type_node))
-+	return intTI_type_node;
-+#endif
-     }
-   else
-     {
diff --git a/meta/recipes-devtools/gcc/gcc-csl-arm/zecke-no-host-includes.patch b/meta/recipes-devtools/gcc/gcc-csl-arm/zecke-no-host-includes.patch
deleted file mode 100644
index 1695582..0000000
--- a/meta/recipes-devtools/gcc/gcc-csl-arm/zecke-no-host-includes.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Upstream-Status: Pending
-
-Index: gcc-4.0.2/gcc/c-incpath.c
-===================================================================
---- gcc-4.0.2.orig/gcc/c-incpath.c	2005-01-23 16:05:27.000000000 +0100
-+++ gcc-4.0.2/gcc/c-incpath.c	2006-05-15 21:23:02.000000000 +0200
-@@ -350,6 +350,26 @@
-   p->construct = 0;
-   p->user_supplied_p = user_supplied_p;
- 
-+#ifdef CROSS_COMPILE
-+    /* A common error when cross compiling is including
-+    host headers. This code below will try to fail fast
-+    for cross compiling. Currently we consider /usr/include,
-+    /opt/include and /sw/include as harmful.  */
-+	{
-+		/* printf("Adding Path: %s\n", p->name ); */
-+		if( strstr(p->name, "/usr/include" ) == p->name ) {
-+			fprintf(stderr, _("BUILD ISOLATION FAILURE: /usr/include in INCLUDEPATH: %s\n Please fix the flags passed to the compiler to use the correct prefix.\n"), p->name);
-+			abort();
-+		} else if( strstr(p->name, "/sw/include") == p->name ) {
-+			fprintf(stderr, _("BUILD ISOLATION FAILURE: /sw/include in INCLUDEPATH: %s\n Please fix the flags passed to the compiler to use the correct prefix.\n"), p->name);
-+			abort();
-+		} else if( strstr(p->name, "/opt/include") == p->name ) {
-+			fprintf(stderr, _("BUILD ISOLATION FAILURE: /opt/include in INCLUDEPATH: %s\n Please fix the flags passed to the compiler to use the correct prefix.\n"), p->name);
-+			abort();
-+		 }
-+	}
-+#endif
-+
-   add_cpp_dir_path (p, chain);
- }
- 
diff --git a/meta/recipes-devtools/gcc/gcc-csl-arm/zecke-xgcc-cpp.patch b/meta/recipes-devtools/gcc/gcc-csl-arm/zecke-xgcc-cpp.patch
deleted file mode 100644
index b06de54..0000000
--- a/meta/recipes-devtools/gcc/gcc-csl-arm/zecke-xgcc-cpp.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-upstream: n/a
-comment: Use the preprocessor we have just compiled instead the one of
-the system. There might be incompabilities between us and them.
-
-Index: gcc-4.1.1/Makefile.in
-===================================================================
---- gcc-4.1.1.orig/Makefile.in	2006-08-06 13:32:44.000000000 +0200
-+++ gcc-4.1.1/Makefile.in	2006-08-06 13:32:46.000000000 +0200
-@@ -194,6 +194,7 @@
- 	AS="$(COMPILER_AS_FOR_TARGET)"; export AS; \
- 	CC="$(CC_FOR_TARGET)"; export CC; \
- 	CFLAGS="$(CFLAGS_FOR_TARGET)"; export CFLAGS; \
-+	CPP="$(CC_FOR_TARGET) -E"; export CCP; \
- 	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
- 	CPPFLAGS="$(CPPFLAGS_FOR_TARGET)"; export CPPFLAGS; \
- 	CXXFLAGS="$(CXXFLAGS_FOR_TARGET)"; export CXXFLAGS; \
diff --git a/meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb b/meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb
deleted file mode 100644
index 5bb8e58..0000000
--- a/meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require gcc-${PV}.inc
-require gcc-configure-target.inc
-require gcc-package-target.inc
-- 
1.7.7.6



