Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id C72F874578
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 19:36:29 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id f15so5135992pfn.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 12:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JKerWy+KDn6c0nxiiV3vnjjHRv/hJekbCHeod6apuU8=;
	b=bciKWnAlBCadmczAO+q7igag3YYuMX7tfFFwbEAbZ1+rPY2T8M3UpvLYKTC5BBOyaj
	EYrh+WHmjw4w+3vFAfBqa3asjD+fK9nhIva7/QRHXMpdkpNy05BdTDsLOnZlF1Cqq4AF
	sasEVS1WZrpSA0y2pfG0qSUlej0pjP+eqeNWkixwO8VKQ30xT8BF7Lh2B0oqu8ZxoMcI
	VVAJpE6yaMgdzWuri/4SDEZ839WaNtKYnz61QvuedTCL/xv6dB86ZGYwOQYL/9AJSPxz
	ZpNWzeFlGuvBmr10afa9jJPfsHNwFudtpMIWoS4JKMNB17cFie77rSS1YQy1mjpU8cwv
	krSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=JKerWy+KDn6c0nxiiV3vnjjHRv/hJekbCHeod6apuU8=;
	b=DfhlpxP8WpMAjo5hnV6jc4YKJVqu7R8Mi9btj8qGXDnGsrCW00bbympxMvV1LpKVYr
	vT0SWoLMqQ/o6Dv00eHe9UYssn9hibf0dL4f6tWyeF54vNQfUvCZdwCF0cxijWsNX5hi
	lHm9ZVbWtzTC1n55470smdSXoOxrsv1BNEbuMGv/7nX9ncVU+mvswEmFDmjQr8esp+si
	X3rHoCrDATMLoeNfpADBCKSOYk/Co496Neo7uB7Irco+2rbKqRewhSg2Axykp80X5OE+
	OC1oTFHisQ0KNuUdrXGJ496o8OYknfZ9o6vj5FkdzT35S0tRMYjfr2fDbBwUigUmqVQw
	cNNQ==
X-Gm-Message-State: ALQs6tBkReZrrkv7FLlJqWRuXD/7BBFQm++S/A8LR5qFttLAcyN9yurm
	Rk0D+7Xj1BdYcFeEyk4zHVIMUg==
X-Google-Smtp-Source: AB8JxZoXwv1Wg8mqNTuJukCKQu+dfVCJZJHmTgLbt/JjBc6Bqo17juvZtPj1owwWDxpF2WWdt3lb3w==
X-Received: by 2002:a17:902:a5c7:: with SMTP id
	t7-v6mr1707448plq.360.1525030590123; 
	Sun, 29 Apr 2018 12:36:30 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::ddd5])
	by smtp.gmail.com with ESMTPSA id
	125sm11960737pfc.145.2018.04.29.12.36.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Apr 2018 12:36:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Apr 2018 12:35:58 -0700
Message-Id: <6d3146f33cb58cd71adff2e3555744d17645eb40.1525029885.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525029885.git.raj.khem@gmail.com>
References: <cover.1525029885.git.raj.khem@gmail.com>
Subject: [PATCH 11/24] glibc: Drop obsolete rpc and libnsl
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
X-List-Received-Date: Sun, 29 Apr 2018 19:36:30 -0000

use libnsl2 and rpcsvc-proto packages

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/libc-common.bbclass              |   4 -
 .../distro/include/default-distrovars.inc     |   2 +-
 meta/conf/local.conf.sample.extended          |   2 +-
 .../glibc/cross-localedef-native_2.27.bb      |   1 -
 meta/recipes-core/glibc/glibc-initial.inc     |   4 +-
 meta/recipes-core/glibc/glibc-package.inc     |   5 +-
 meta/recipes-core/glibc/glibc.inc             |   4 -
 .../0021-eglibc-Install-PIC-archives.patch    | 123 ------------------
 meta/recipes-core/glibc/glibc_2.27.bb         |  18 +--
 9 files changed, 7 insertions(+), 156 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/0021-eglibc-Install-PIC-archives.patch

diff --git a/meta/classes/libc-common.bbclass b/meta/classes/libc-common.bbclass
index 9ea2c03749..0e351b6746 100644
--- a/meta/classes/libc-common.bbclass
+++ b/meta/classes/libc-common.bbclass
@@ -1,9 +1,5 @@
 do_install() {
 	oe_runmake install_root=${D} install
-	for r in ${rpcsvc}; do
-		h=`echo $r|sed -e's,\.x$,.h,'`
-		install -m 0644 ${S}/sunrpc/rpcsvc/$h ${D}/${includedir}/rpcsvc/
-	done
 	install -Dm 0644 ${WORKDIR}/etc/ld.so.conf ${D}/${sysconfdir}/ld.so.conf
 	install -d ${D}${localedir}
 	make -f ${WORKDIR}/generate-supported.mk IN="${S}/localedata/SUPPORTED" OUT="${WORKDIR}/SUPPORTED"
diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 9620ad48de..5aa3434ec7 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -14,7 +14,7 @@ DISTRO_FEATURES_DEFAULT ?= "acl alsa argp bluetooth ext2 irda largefile pcmcia u
 DISTRO_FEATURES_LIBC_DEFAULT ?= "ipv4 ipv6 libc-backtrace libc-big-macros libc-bsd libc-cxx-tests libc-catgets libc-charsets libc-crypt \
 					libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt libc-fmtmsg libc-fstab libc-ftraverse \
 					libc-getlogin libc-idn libc-inet-anl libc-libm libc-locales libc-locale-code \
-					libc-memusage libc-nis libc-nsswitch libc-rcmd libc-rtld-debug libc-spawn libc-streams libc-sunrpc \
+					libc-memusage libc-nsswitch libc-rcmd libc-rtld-debug libc-spawn libc-streams \
 					libc-utmp libc-utmpx libc-wordexp libc-posix-clang-wchar libc-posix-regexp libc-posix-regexp-glibc \
 					libc-posix-wchar-io"
 DISTRO_FEATURES_LIBC ?= "${DISTRO_FEATURES_LIBC_DEFAULT}"
diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index 5d6c37dbcf..e698acb84b 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -32,7 +32,7 @@
 #DISTRO_FEATURES_LIBC = "ipv6 libc-backtrace libc-big-macros libc-bsd libc-cxx-tests libc-catgets libc-charsets libc-crypt \
 #               libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt libc-fmtmsg libc-fstab libc-ftraverse \
 #               libc-getlogin libc-idn libc-inet libc-inet-anl libc-libm libc-locales libc-locale-code \
-#               libc-memusage libc-nis libc-nsswitch libc-rcmd libc-rtld-debug libc-spawn libc-streams libc-sunrpc \
+#               libc-memusage libc-nsswitch libc-rcmd libc-rtld-debug libc-spawn libc-streams \
 #               libc-utmp libc-utmpx libc-wordexp libc-posix-clang-wchar libc-posix-regexp libc-posix-regexp-glibc \
 #               libc-posix-wchar-io"
 
diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.27.bb b/meta/recipes-core/glibc/cross-localedef-native_2.27.bb
index 5e92eb71d5..6a26376ac2 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.27.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.27.bb
@@ -32,7 +32,6 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0018-eglibc-Help-bootstrap-cross-toolchain.patch \
            file://0019-eglibc-Clear-cache-lines-on-ppc8xx.patch \
            file://0020-eglibc-Resolve-__fpscr_values-on-SH4.patch \
-           file://0021-eglibc-Install-PIC-archives.patch \
            file://0022-eglibc-Forward-port-cross-locale-generation-support.patch \
            file://0023-Define-DUMMY_LOCALE_T-if-not-defined.patch \
            file://archive-path.patch \
diff --git a/meta/recipes-core/glibc/glibc-initial.inc b/meta/recipes-core/glibc/glibc-initial.inc
index b86e2fb2db..28f006fc7f 100644
--- a/meta/recipes-core/glibc/glibc-initial.inc
+++ b/meta/recipes-core/glibc/glibc-initial.inc
@@ -13,9 +13,9 @@ do_configure () {
 	cfgscript=`python3 -c "import os; print(os.path.relpath('${S}', '.'))"`/configure
 	$cfgscript --host=${TARGET_SYS} --build=${BUILD_SYS} \
 		--prefix=/usr \
-		--without-cvs --disable-sanity-checks \
+		--disable-sanity-checks \
 		--with-headers=${STAGING_DIR_TARGET}${includedir} \
-		--enable-hacker-mode --enable-addons
+		--enable-hacker-mode
 }
 
 do_compile () {
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index ff45dfe35a..9050218619 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -28,7 +28,7 @@ FILES_sln = "${base_sbindir}/sln"
 FILES_${PN}-pic = "${libdir}/*_pic.a ${libdir}/*_pic.map ${libdir}/libc_pic/*.o"
 FILES_libsotruss = "${libdir}/audit/sotruss-lib.so"
 FILES_SOLIBSDEV = "${libdir}/lib*${SOLIBSDEV}"
-FILES_${PN}-dev += "${bindir}/rpcgen ${libdir}/*_nonshared.a ${base_libdir}/*_nonshared.a ${base_libdir}/*.o ${datadir}/aclocal"
+FILES_${PN}-dev += "${libdir}/*_nonshared.a ${base_libdir}/*_nonshared.a ${base_libdir}/*.o ${datadir}/aclocal"
 FILES_${PN}-staticdev += "${libdir}/*.a ${base_libdir}/*.a"
 FILES_nscd = "${sbindir}/nscd* ${sysconfdir}/init.d/nscd ${systemd_unitdir}/system/nscd* ${sysconfdir}/tmpfiles.d/nscd.conf \
               ${sysconfdir}/nscd.conf ${sysconfdir}/default/volatiles/98_nscd ${localstatedir}/db/nscd"
@@ -51,7 +51,7 @@ DESCRIPTION_glibc-extra-nss = "glibc: nis, nisplus and hesiod search services."
 SUMMARY_ldd = "print shared library dependencies"
 DESCRIPTION_ldd = "${bindir}/ldd prints shared library dependencies for each program or shared library specified on the command line."
 SUMMARY_${PN}-utils = "Miscellaneous utilities provided by glibc"
-DESCRIPTION_${PN}-utils = "Miscellaneous utilities including getconf, iconv, locale, gencat, rpcgen, ..."
+DESCRIPTION_${PN}-utils = "Miscellaneous utilities including getconf, iconv, locale, gencat, ..."
 DESCRIPTION_libsotruss = "Library to support sotruss which traces calls through PLTs"
 DESCRIPTION_tzcode = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
 
@@ -71,7 +71,6 @@ do_install_append () {
 	if [ -f ${D}${bindir}/mtrace ]; then
 		sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' -e '2s,exec.*perl,exec ${USRBINPATH}/env perl,' ${D}${bindir}/mtrace
 	fi
-	rm -rf ${D}${includedir}/rpcsvc/rquota*
 	# Info dir listing isn't interesting at this point so remove it if it exists.
 	if [ -e "${D}${infodir}/dir" ]; then
 		rm -f ${D}${infodir}/dir
diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index ce1222be68..3db55f926f 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -33,8 +33,6 @@ siteconfig_do_siteconfig_gencache_prepend = " \
 
 # nptl needs unwind support in gcc, which can't be built without glibc.
 DEPENDS = "virtual/${TARGET_PREFIX}gcc-initial libgcc-initial linux-libc-headers virtual/${TARGET_PREFIX}libc-initial"
-# nptl needs libgcc but dlopens it, so our shlibs code doesn't detect this
-#RDEPENDS_${PN} += "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
 
 CRYPTPROVIDES = "virtual/crypt"
 CRYPTPROVIDES_class-nativesdk = ""
@@ -80,8 +78,6 @@ do_configure_prepend() {
 	sed -e "s#@BASH@#/bin/sh#" -i ${S}/elf/ldd.bash.in
 }
 
-GLIBC_ADDONS ?= "nptl,libidn"
-
 # Enable backtrace from abort()
 do_configure_append_arm () {
 	echo "CFLAGS-abort.c = -fasynchronous-unwind-tables" >> ${B}/configparms
diff --git a/meta/recipes-core/glibc/glibc/0021-eglibc-Install-PIC-archives.patch b/meta/recipes-core/glibc/glibc/0021-eglibc-Install-PIC-archives.patch
deleted file mode 100644
index 530f4e1087..0000000000
--- a/meta/recipes-core/glibc/glibc/0021-eglibc-Install-PIC-archives.patch
+++ /dev/null
@@ -1,123 +0,0 @@
-From c1beab8a11985f96f5eb644e7103d343b705afc6 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 18 Mar 2015 01:57:01 +0000
-Subject: [PATCH 21/27] eglibc: Install PIC archives
-
-Forward port from eglibc
-
-2008-02-07  Joseph Myers  <joseph@codesourcery.com>
-
-        * Makerules (install-extras, install-map): New variables.
-        (installed-libcs): Add libc_pic.a.
-        (install-lib): Include _pic.a files for versioned shared
-        libraries.
-        (install-map-nosubdir, install-extras-nosubdir): Add rules for
-        installing extra files.
-        (install-no-libc.a-nosubdir): Depend on install-map-nosubdir and
-        install-extras-nosubdir.
-
-2008-04-01  Maxim Kuvyrkov  <maxim@codesourcery.com>
-
-        * Makerules (install-lib): Don't install libpthread_pic.a.
-        (install-map): Don't install libpthread_pic.map.
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Makerules | 42 ++++++++++++++++++++++++++++++++++++++++--
- 1 file changed, 40 insertions(+), 2 deletions(-)
-
-diff --git a/Makerules b/Makerules
-index ef6abeac6d..eeaa667f49 100644
---- a/Makerules
-+++ b/Makerules
-@@ -778,6 +778,9 @@ ifeq ($(build-shared),yes)
- $(common-objpfx)libc.so: $(common-objpfx)libc.map
- endif
- common-generated += libc.so libc_pic.os
-+ifndef subdir
-+install-extras := soinit.o sofini.o
-+endif
- ifdef libc.so-version
- $(common-objpfx)libc.so$(libc.so-version): $(common-objpfx)libc.so
- 	$(make-link)
-@@ -1029,6 +1032,7 @@ endif
- 
- install: check-install-supported
- 
-+installed-libcs := $(installed-libcs) $(inst_libdir)/libc_pic.a
- install: $(installed-libcs)
- $(installed-libcs): $(inst_libdir)/lib$(libprefix)%: lib $(+force)
- 	$(make-target-directory)
-@@ -1057,6 +1061,22 @@ versioned := $(strip $(foreach so,$(install-lib.so),\
- install-lib.so-versioned := $(filter $(versioned), $(install-lib.so))
- install-lib.so-unversioned := $(filter-out $(versioned), $(install-lib.so))
- 
-+# Install the _pic.a files for versioned libraries, and corresponding
-+# .map files.
-+# libpthread_pic.a breaks mklibs, so don't install it and its map.
-+install-lib := $(install-lib) $(install-lib.so-versioned:%.so=%_pic.a)
-+install-lib := $(filter-out libpthread_pic.a,$(install-lib))
-+# Despite having a soname libhurduser and libmachuser do not use symbol
-+# versioning, so don't install the corresponding .map files.
-+ifeq ($(build-shared),yes)
-+install-map := $(patsubst %.so,%.map,\
-+			$(foreach L,$(install-lib.so-versioned),$(notdir $L)))
-+install-map := $(filter-out libhurduser.map libmachuser.map libpthread.map,$(install-map))
-+ifndef subdir
-+install-map := $(install-map) libc.map
-+endif
-+endif
-+
- # For versioned libraries, we install three files:
- #	$(inst_libdir)/libfoo.so	-- for linking, symlink or ld script
- #	$(inst_slibdir)/libfoo.so.NN	-- for loading by SONAME, symlink
-@@ -1311,9 +1331,22 @@ $(addprefix $(inst_includedir)/,$(headers-nonh)): $(inst_includedir)/%: \
- endif	# headers-nonh
- endif	# headers
- 
-+ifdef install-map
-+$(addprefix $(inst_libdir)/,$(patsubst lib%.map,lib%_pic.map,$(install-map))): \
-+  $(inst_libdir)/lib%_pic.map: $(common-objpfx)lib%.map $(+force)
-+	$(do-install)
-+endif
-+
-+ifdef install-extras
-+$(addprefix $(inst_libdir)/libc_pic/,$(install-extras)): \
-+  $(inst_libdir)/libc_pic/%.o: $(elf-objpfx)%.os $(+force)
-+	$(do-install)
-+endif
-+
- .PHONY: install-bin-nosubdir install-bin-script-nosubdir \
- 	install-rootsbin-nosubdir install-sbin-nosubdir install-lib-nosubdir \
--	install-data-nosubdir install-headers-nosubdir
-+	install-data-nosubdir install-headers-nosubdir install-map-nosubdir \
-+	install-extras-nosubdir
- install-bin-nosubdir: $(addprefix $(inst_bindir)/,$(install-bin))
- install-bin-script-nosubdir: $(addprefix $(inst_bindir)/,$(install-bin-script))
- install-rootsbin-nosubdir: \
-@@ -1326,6 +1359,10 @@ install-data-nosubdir: $(addprefix $(inst_datadir)/,$(install-data))
- install-headers-nosubdir: $(addprefix $(inst_includedir)/,$(headers))
- install-others-nosubdir: $(install-others)
- install-others-programs-nosubdir: $(install-others-programs)
-+install-map-nosubdir: $(addprefix $(inst_libdir)/,\
-+		       $(patsubst lib%.map,lib%_pic.map,$(install-map)))
-+install-extras-nosubdir: $(addprefix $(inst_libdir)/libc_pic/,\
-+		       $(install-extras))
- 
- # We need all the `-nosubdir' targets so that `install' in the parent
- # doesn't depend on several things which each iterate over the subdirs.
-@@ -1335,7 +1372,8 @@ install-%:: install-%-nosubdir ;
- 
- .PHONY: install install-no-libc.a-nosubdir
- install-no-libc.a-nosubdir: install-headers-nosubdir install-data-nosubdir \
--			    install-lib-nosubdir install-others-nosubdir
-+			    install-lib-nosubdir install-others-nosubdir \
-+			    install-map-nosubdir install-extras-nosubdir
- ifeq ($(build-programs),yes)
- install-no-libc.a-nosubdir: install-bin-nosubdir install-bin-script-nosubdir \
- 			    install-rootsbin-nosubdir install-sbin-nosubdir \
--- 
-2.16.1
-
diff --git a/meta/recipes-core/glibc/glibc_2.27.bb b/meta/recipes-core/glibc/glibc_2.27.bb
index c814798bbd..d3bdeaefc3 100644
--- a/meta/recipes-core/glibc/glibc_2.27.bb
+++ b/meta/recipes-core/glibc/glibc_2.27.bb
@@ -35,7 +35,6 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0018-eglibc-Help-bootstrap-cross-toolchain.patch \
            file://0019-eglibc-Clear-cache-lines-on-ppc8xx.patch \
            file://0020-eglibc-Resolve-__fpscr_values-on-SH4.patch \
-           file://0021-eglibc-Install-PIC-archives.patch \
            file://0022-eglibc-Forward-port-cross-locale-generation-support.patch \
            file://0023-Define-DUMMY_LOCALE_T-if-not-defined.patch \
            file://0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch \
@@ -76,14 +75,11 @@ COMPATIBLE_HOST_libc-musl_class-target = "null"
 GLIBCPIE ??= ""
 
 EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
-                --without-cvs --disable-profile \
+                --disable-profile \
                 --disable-debug --without-gd \
                 --enable-clocale=gnu \
-                --enable-add-ons=libidn \
                 --with-headers=${STAGING_INCDIR} \
                 --without-selinux \
-                --enable-obsolete-rpc \
-                --enable-obsolete-nsl \
                 --enable-tunables \
                 --enable-bind-now \
                 --enable-stack-protector=strong \
@@ -113,22 +109,10 @@ do_configure () {
         CPPFLAGS="" oe_runconf
 }
 
-rpcsvc = "bootparam_prot.x nlm_prot.x rstat.x \
-	  yppasswd.x klm_prot.x rex.x sm_inter.x mount.x \
-	  rusers.x spray.x nfs_prot.x rquota.x key_prot.x"
-
 do_compile () {
 	# -Wl,-rpath-link <staging>/lib in LDFLAGS can cause breakage if another glibc is in staging
 	unset LDFLAGS
 	base_do_compile
-	(
-		cd ${S}/sunrpc/rpcsvc
-		for r in ${rpcsvc}; do
-			h=`echo $r|sed -e's,\.x$,.h,'`
-			rm -f $h
-			${B}/sunrpc/cross-rpcgen -h $r -o $h || bbwarn "${PN}: unable to generate header for $r"
-		done
-	)
 	echo "Adjust ldd script"
 	if [ -n "${RTLDLIST}" ]
 	then
-- 
2.17.0


