Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id EAEA479F78
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 00:15:49 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id l9so21250772wrt.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 16:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=m6ABtxvLii+JTWJ2e4AikujBR8jdmztQEUwLppiDek0=;
	b=gWI8sYxX96Qpvfd2YH5MqT92DDYszo3S+nQR0tOR3oNyo2mZ6kZ/caHicPxCbjyLQL
	KUOCnmE2ld2nEWBNmzoYX9wt67AmSzcwdHoY1ZKsk84BKeFVaD6A3qNtJ3UHtm+hYLhs
	hI0FXXstCralTVWBuoOS+SscMVHc9o57aIzUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=m6ABtxvLii+JTWJ2e4AikujBR8jdmztQEUwLppiDek0=;
	b=ECdN1i8hShJgmdRHkCxzIo2JoawtT3bbrQM7yvTvLlsyvrQ4dhz8SQyGzdQkqztV2+
	YVnEtZAlMSQPzfzTAb4CjB9UkraYuRcckhNWn3EIl1FcytUA6zsJXW7MhHV3RyaoS9pk
	aL1hlVOtF+Fuow1aHoGvylnXOq+jxt0UsdMuTnFiBJIRF+HYPq+KxfN8NxmjY/OhDQ//
	+fuYVq+7JwfvUumuZe1IB/n/4jbJidD9QxJGDuCfkWUF/RV/65hoqpquYULvkfKn6Hw6
	9CXMh9Lq1/caks81XEMiLcs26z1dbXMBAOpt4HAXFOz9vvTXzL8YohCM/GeRnalGY34d
	wC7g==
X-Gm-Message-State: AA+aEWY0eRhfufFL1zLaRShQRjjAZdQgFdQ0yD81qBdwlW7vIwheKAaW
	zmlnH//DUMzVJYgRqHJJmStCxe1VQwlFBg==
X-Google-Smtp-Source: AFSGD/WX2PaqrDBti1yiayqGTsKSONaMVmX2KZuln9lSPQCycmeDQo3n8OHb7Dn7p46pWR76gqSsiA==
X-Received: by 2002:adf:a1d2:: with SMTP id v18mr19505829wrv.87.1545264949941; 
	Wed, 19 Dec 2018 16:15:49 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o81sm10175581wmd.10.2018.12.19.16.15.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Dec 2018 16:15:49 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Dec 2018 00:15:44 +0000
Message-Id: <20181220001545.12618-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181220001545.12618-1-richard.purdie@linuxfoundation.org>
References: <20181220001545.12618-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 3/4] gcc: Drop the -initial versions of the compiler
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
X-List-Received-Date: Thu, 20 Dec 2018 00:15:50 -0000
Content-Transfer-Encoding: 8bit

Separated out from the previous commit for clarity, this simply drops
all the -inital pieces of gcc which are no longer needed after the
previous commit.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-8.2.inc         | 14 ---
 meta/recipes-devtools/gcc/gcc-common.inc      |  7 +-
 .../gcc/gcc-configure-common.inc              |  1 -
 .../gcc/gcc-cross-initial.inc                 | 89 -------------------
 .../gcc/gcc-cross-initial_8.2.bb              |  2 -
 meta/recipes-devtools/gcc/gcc-cross.inc       |  4 +-
 .../gcc/gcc-crosssdk-initial.inc              | 10 ---
 .../gcc/gcc-crosssdk-initial_8.2.bb           |  3 -
 meta/recipes-devtools/gcc/gcc-crosssdk.inc    |  2 +-
 9 files changed, 6 insertions(+), 126 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-cross-initial.inc
 delete mode 100644 meta/recipes-devtools/gcc/gcc-cross-initial_8.2.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk-initial.inc
 delete mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk-initial_8.2.bb

diff --git a/meta/recipes-devtools/gcc/gcc-8.2.inc b/meta/recipes-devtools/gcc/gcc-8.2.inc
index 206e1571b29..b6568a046e9 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-8.2.inc
@@ -107,20 +107,6 @@ EXTRA_OECONF_BASE = "\
     --without-isl \
 "
 
-EXTRA_OECONF_INITIAL = "\
-    --disable-libmudflap \
-    --disable-libgomp \
-    --disable-libitm \
-    --disable-libquadmath \
-    --with-system-zlib \
-    --disable-lto \
-    --disable-plugin \
-    --enable-linker-build-id \
-    --enable-decimal-float=no \
-    --without-isl \
-    --disable-libssp \
-"
-
 EXTRA_OECONF_PATHS = "\
     --with-gxx-include-dir=/not/exist{target_includedir}/c++/${BINV} \
     --with-sysroot=/not/exist \
diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 06c90336b66..96334e54b4b 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -10,12 +10,11 @@ CVE_PRODUCT = "gcc"
 inherit autotools gettext texinfo
 
 BPN = "gcc"
-COMPILERINITIAL = ""
-COMPILERDEP = "virtual/${MLPREFIX}${TARGET_PREFIX}gcc${COMPILERINITIAL}:do_gcc_stash_builddir"
-COMPILERDEP_class-nativesdk = "virtual/${TARGET_PREFIX}gcc${COMPILERINITIAL}-crosssdk:do_gcc_stash_builddir"
+COMPILERDEP = "virtual/${MLPREFIX}${TARGET_PREFIX}gcc:do_gcc_stash_builddir"
+COMPILERDEP_class-nativesdk = "virtual/${TARGET_PREFIX}gcc-crosssdk:do_gcc_stash_builddir"
 
 python extract_stashed_builddir () {
-    src = d.expand("${COMPONENTS_DIR}/${BUILD_ARCH}/gcc-stashed-builddir${COMPILERINITIAL}-${TARGET_SYS}")
+    src = d.expand("${COMPONENTS_DIR}/${BUILD_ARCH}/gcc-stashed-builddir-${TARGET_SYS}")
     dest = d.getVar("B")
     oe.path.copyhardlinktree(src, dest)
     staging_processfixme([src + "/fixmepath"], dest, dest, dest, d)
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index 009ab111683..70f7628bc98 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -17,7 +17,6 @@ LANGUAGES ?= "c,c++${FORTRAN}${JAVA}"
 
 EXTRA_OECONF_BASE ?= ""
 EXTRA_OECONF_PATHS ?= ""
-EXTRA_OECONF_INITIAL ?= ""
 
 GCCMULTILIB ?= "--disable-multilib"
 GCCTHREADS ?= "posix"
diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
deleted file mode 100644
index 892b1dbf2f0..00000000000
--- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
+++ /dev/null
@@ -1,89 +0,0 @@
-DEPENDS = "virtual/${TARGET_PREFIX}binutils ${NATIVEDEPS}"
-PROVIDES = "virtual/${TARGET_PREFIX}gcc-initial"
-PACKAGES = ""
-
-INHIBIT_AUTOTOOLS_DEPS = "1"
-INHIBIT_DEFAULT_DEPS = "1"
-
-# We still need gnu-config-native
-DEPENDS_prepend = "gnu-config-native autoconf-native "
-
-PN = "gcc-cross-initial-${TARGET_ARCH}"
-
-CROSS_TARGET_SYS_DIR_append = ".${PN}"
-
-# This is intended to be a -very- basic config
-# sysroot is needed in case we use libc-initial
-EXTRA_OECONF = "\
-    --with-newlib \
-    --without-headers \
-    --disable-shared \
-    --disable-threads \
-    --disable-multilib \
-    --disable-__cxa_atexit \
-    --enable-languages=c \
-    --program-prefix=${TARGET_PREFIX} \
-    --with-sysroot=/not/exist \
-    --with-build-sysroot=${STAGING_DIR_TARGET} \
-    ${EXTRA_OECONF_INITIAL} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '--with-ld=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}ld.bfd', '', d)} \
-    ${EXTRA_OECONF_GCC_FLOAT} \
-    ${@get_gcc_ppc_plt_settings(bb, d)} \
-"
-
-EXTRA_OECONF += "--with-native-system-header-dir=${SYSTEMHEADERS}"
-
-do_compile () {
-    oe_runmake all-gcc configure-target-libgcc
-    (cd ${B}/${TARGET_SYS}/libgcc; oe_runmake enable-execute-stack.c unwind.h md-unwind-support.h sfp-machine.h gthr-default.h)
-}
-
-do_install () {
-	( cd ${B}/${TARGET_SYS}/libgcc; oe_runmake 'DESTDIR=${D}' install-unwind_h-forbuild install-unwind_h)
-	oe_runmake 'DESTDIR=${D}' install-gcc
-
-	# We don't really need this (here shares/ contains man/, info/, locale/).
-	rm -rf ${D}${datadir}/
-
-	# We use libiberty from binutils
-	find ${D}${exec_prefix}/lib -name libiberty.a | xargs rm -f
-	find ${D}${exec_prefix}/lib -name libiberty.h | xargs rm -f
-
-	# Insert symlinks into libexec so when tools without a prefix are searched for, the correct ones are
-	# found. These need to be relative paths so they work in different locations.
-	dest=${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/
-	install -d $dest
-	useld=${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '.bfd', '', d)}
-	ln -sf ${BINRELPATH}/${TARGET_PREFIX}ld${useld} ${dest}ld
-	for t in ar as nm objcopy objdump ranlib strip g77 gcc cpp gfortran; do
-		ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t $dest$t
-	done
-	# fixed limits.h infact includes the so called real limits.h
-	# which should come from libc but when we build libc-initial
-	# then bunch of configure tests include fixed limits.h which in turn
-	# includes real limits.h but this real limits.h is not staged yet
-	# so we overwirte the generated include-fixed/limits.h for gcc-cross-initial
-	# to get rid references to real limits.h
-	cp gcc/include-fixed/limits.h ${D}${gcclibdir}/${TARGET_SYS}/${BINV}/include/limits.h
-}
-#
-# Override the default sysroot staging copy since this won't look like a target system
-#
-sysroot_stage_all() {
-	sysroot_stage_dir ${D} ${SYSROOT_DESTDIR}
-	install -d ${SYSROOT_DESTDIR}${STAGING_DIR_TARGET}${target_base_libdir}/
-	install -d ${SYSROOT_DESTDIR}${STAGING_DIR_TARGET}${target_libdir}/
-	mv ${SYSROOT_DESTDIR}${target_base_libdir}/* ${SYSROOT_DESTDIR}${STAGING_DIR_TARGET}${target_base_libdir}/ || true
-	mv ${SYSROOT_DESTDIR}${target_libdir}/* ${SYSROOT_DESTDIR}${STAGING_DIR_TARGET}${target_libdir}/ || true
-}
-
-do_populate_sysroot[sstate-inputdirs] = "${SYSROOT_DESTDIR}/${STAGING_DIR_HOST}/"
-do_populate_sysroot[sstate-outputdirs] = "${COMPONENTS_DIR}/${PACKAGE_ARCH}/${PN}"
-
-inherit nopackages
-
-COMPILERINITIAL = "-initial"
-
-
-# We really only want this built by things that need it, not any recrdeptask
-deltask do_build
diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial_8.2.bb b/meta/recipes-devtools/gcc/gcc-cross-initial_8.2.bb
deleted file mode 100644
index 4c73e5ce613..00000000000
--- a/meta/recipes-devtools/gcc/gcc-cross-initial_8.2.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require recipes-devtools/gcc/gcc-cross_${PV}.bb
-require gcc-cross-initial.inc
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index 63a196e2e99..add6b43017d 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -215,8 +215,8 @@ do_gcc_stash_builddir () {
 addtask do_gcc_stash_builddir after do_compile before do_install
 SSTATETASKS += "do_gcc_stash_builddir"
 do_gcc_stash_builddir[sstate-inputdirs] = "${BUILDDIRSTASH}"
-do_gcc_stash_builddir[sstate-outputdirs] = "${COMPONENTS_DIR}/${BUILD_ARCH}/gcc-stashed-builddir${COMPILERINITIAL}-${TARGET_SYS}"
-do_gcc_stash_builddir[sstate-fixmedir] = "${COMPONENTS_DIR}/${BUILD_ARCH}/gcc-stashed-builddir${COMPILERINITIAL}-${TARGET_SYS}"
+do_gcc_stash_builddir[sstate-outputdirs] = "${COMPONENTS_DIR}/${BUILD_ARCH}/gcc-stashed-builddir-${TARGET_SYS}"
+do_gcc_stash_builddir[sstate-fixmedir] = "${COMPONENTS_DIR}/${BUILD_ARCH}/gcc-stashed-builddir-${TARGET_SYS}"
 
 python do_gcc_stash_builddir_setscene () {
     sstate_setscene(d)
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-initial.inc b/meta/recipes-devtools/gcc/gcc-crosssdk-initial.inc
deleted file mode 100644
index 08eda5d4c7c..00000000000
--- a/meta/recipes-devtools/gcc/gcc-crosssdk-initial.inc
+++ /dev/null
@@ -1,10 +0,0 @@
-inherit crosssdk
-
-PN = "gcc-crosssdk-initial-${SDK_SYS}"
-
-SYSTEMHEADERS = "${SDKPATHNATIVE}${prefix_nativesdk}/include"
-SYSTEMLIBS = "${SDKPATHNATIVE}${base_libdir_nativesdk}/"
-SYSTEMLIBS1 = "${SDKPATHNATIVE}${libdir_nativesdk}/"
-
-DEPENDS = "virtual/${TARGET_PREFIX}binutils-crosssdk gettext-native ${NATIVEDEPS}"
-PROVIDES = "virtual/${TARGET_PREFIX}gcc-initial-crosssdk"
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_8.2.bb b/meta/recipes-devtools/gcc/gcc-crosssdk-initial_8.2.bb
deleted file mode 100644
index fd90e1140f1..00000000000
--- a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_8.2.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require recipes-devtools/gcc/gcc-cross-initial_${PV}.bb
-require gcc-crosssdk-initial.inc
-
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk.inc b/meta/recipes-devtools/gcc/gcc-crosssdk.inc
index cda29277944..bd2e71d63f1 100644
--- a/meta/recipes-devtools/gcc/gcc-crosssdk.inc
+++ b/meta/recipes-devtools/gcc/gcc-crosssdk.inc
@@ -8,5 +8,5 @@ SYSTEMLIBS1 = "${SDKPATHNATIVE}${libdir_nativesdk}/"
 
 GCCMULTILIB = "--disable-multilib"
 
-DEPENDS = "virtual/${TARGET_PREFIX}binutils-crosssdk virtual/nativesdk-${TARGET_PREFIX}libc-for-gcc gettext-native ${NATIVEDEPS}"
+DEPENDS = "virtual/${TARGET_PREFIX}binutils-crosssdk gettext-native ${NATIVEDEPS}"
 PROVIDES = "virtual/${TARGET_PREFIX}gcc-crosssdk virtual/${TARGET_PREFIX}g++-crosssdk"
-- 
2.19.1


