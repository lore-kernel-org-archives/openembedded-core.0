Return-Path: <armccurdy@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id BCC446FFA1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 02:39:03 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id g2-v6so1737712pgs.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 19:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JTQ2E6gsjHfwl8id53nsWBFvFrXOSlfEuecwbKJNm7g=;
	b=dVDY06wPT+2xiaY4bRz9v7Vrf5m+rOp5q0fILDGWH30Y7/lG+0MTmc3OGL5opRba5q
	BfUJG5pXnXDqhoYye3QUfivu3b+sXXwpHzheyWYrL5fN+G0tZnn9iDkcKg+WfXFEqtzZ
	dIYGL+/19ra3IoZrOEUHiP5PvqiNm4aOrv6vhTuLAm90r3N6huKYw3oV3AkQeigOdCkf
	ll3MAGPo/H+h4tFkwWFHDjt3Vd8Im/Gr5UgG2Ll+E9LogKz8swXU+PS2GWUPqyfsyHx0
	NI4AF7Zr5NpGv6lYWcblgawpKWds14AQFjYhMep7Z9SwyNhQ6WxAIoxyYfmAAyjtDGD0
	eUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=JTQ2E6gsjHfwl8id53nsWBFvFrXOSlfEuecwbKJNm7g=;
	b=HwMqMr7WkuxwxJIVGDXXEgydGQoD19arvH7Pzpr3Xidph9qDc5NAT/FnHZf37Pizeh
	PuVLdkzV+mHEnRmlbGMrIy0lCJORIaIee5Rgz+w91yfX1loM3BDD1ybOfSeRH/bI3GKk
	pX0fMSTCHP3ipnqDJbjYJpO9TCYsSlguiuSvNSVoc2D7itNWgkY4VUZ12qpQHnd+oeYx
	eptTTVdovP2KSkEMj9F0tjxTMvFglbdkbngnVKMyeyBxa2RbRMwn/ON/mDDVNmBN6Mqj
	WzJk1T3ic0mO9PYKlorfukZwjJEpFPq2pHiDRXXBHw3fPZrPM+AzBeto3KlGKJ1a1Ffx
	e+gQ==
X-Gm-Message-State: AOUpUlGTgrquEUQij0fGdplTXEEExSBjCO5c6asJnMY8K9mVCydWC9nS
	6bxdyHRXPcJf0UusTgP3LOxts5b5
X-Google-Smtp-Source: AAOMgpfOvUSmQV4OP4tPd/UbD8jA1einighQNOwhiJ1vn52EAvwM3W+5xnDq9Uuwwuh6MuAVBPzgvQ==
X-Received: by 2002:a62:2119:: with SMTP id
	h25-v6mr15492420pfh.112.1532399944565; 
	Mon, 23 Jul 2018 19:39:04 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	y132-v6sm14746314pfb.91.2018.07.23.19.39.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Jul 2018 19:39:04 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jul 2018 19:38:48 -0700
Message-Id: <1532399935-32296-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1532399935-32296-1-git-send-email-armccurdy@gmail.com>
References: <1532399935-32296-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/9] openssl_1.0: minor recipe formatting tweaks etc
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
X-List-Received-Date: Tue, 24 Jul 2018 02:39:03 -0000

Drop redundant setting of S to its default value, fix inconsistent
indent and re-order variables to align more closely to the OE
style-guide.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../recipes-connectivity/openssl/openssl_1.0.2o.bb | 121 +++++++++++----------
 1 file changed, 61 insertions(+), 60 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
index 619f3d8..7f32d09 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
@@ -46,7 +46,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-openssl-force-soft-link-to-avoid-rare-race.patch \
            "
 
-SRC_URI_append_class-target = "\
+SRC_URI_append_class-target = " \
            file://reproducible-cflags.patch \
            file://reproducible-mkbuildinf.patch \
            "
@@ -58,75 +58,55 @@ SRC_URI_append_class-nativesdk = " \
 SRC_URI[md5sum] = "44279b8557c3247cbe324e2322ecd114"
 SRC_URI[sha256sum] = "ec3f5c9714ba0fd45cb4e087301eb1336c317e0d20b575a125050470e8089e4d"
 
-S = "${WORKDIR}/openssl-${PV}"
 UPSTREAM_CHECK_REGEX = "openssl-(?P<pver>1\.0.+)\.tar"
 
+inherit pkgconfig siteinfo multilib_header ptest relative_symlinks
+
 PACKAGECONFIG ?= "cryptodev-linux"
 PACKAGECONFIG[perl] = ",,,"
 PACKAGECONFIG[cryptodev-linux] = "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS,,cryptodev-linux"
 
-TERMIO_libc-musl = "-DTERMIOS"
-TERMIO ?= "-DTERMIO"
-# Avoid binaries being marked as requiring an executable stack since it 
-# doesn't(which causes and this causes issues with SELinux
-CFLAG = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', '-DL_ENDIAN', '-DB_ENDIAN', d)} \
-	 ${TERMIO} ${CFLAGS} -Wall -Wa,--noexecstack"
-
-# For target side versions of openssl enable support for OCF Linux driver
-# if they are available.
-
-CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
-CFLAG_append_class-native = " -fPIC"
+# Remove this to enable SSLv3. SSLv3 is defaulted to disabled due to the POODLE
+# vulnerability
+EXTRA_OECONF = "-no-ssl3"
 
 export DIRS = "crypto ssl apps engines"
-export EX_LIBS = "-lgcc -ldl"
 export AS = "${CC} -c"
-
+export EX_LIBS = "-lgcc -ldl"
 export OE_LDFLAGS = "${LDFLAGS}"
 
 # openssl fails with ccache: https://bugzilla.yoctoproject.org/show_bug.cgi?id=12810
 CCACHE = ""
 
-inherit pkgconfig siteinfo multilib_header ptest relative_symlinks
+TERMIO ?= "-DTERMIO"
+TERMIO_libc-musl = "-DTERMIOS"
 
-PACKAGES =+ "libcrypto libssl ${PN}-misc openssl-conf"
-FILES_libcrypto = "${libdir}/libcrypto${SOLIBS}"
-FILES_libssl = "${libdir}/libssl${SOLIBS}"
-FILES_${PN} =+ " ${libdir}/ssl/*"
-FILES_${PN}-misc = "${libdir}/ssl/misc"
-RDEPENDS_${PN}-misc = "${@bb.utils.filter('PACKAGECONFIG', 'perl', d)}"
+CFLAG = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', '-DL_ENDIAN', '-DB_ENDIAN', d)} \
+         ${TERMIO} ${CFLAGS} -Wall"
 
-# Add the openssl.cnf file to the openssl-conf package.  Make the libcrypto
-# package RRECOMMENDS on this package.  This will enable the configuration
-# file to be installed for both the base openssl package and the libcrypto
-# package since the base openssl package depends on the libcrypto package.
-FILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
-CONFFILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
-RRECOMMENDS_libcrypto += "openssl-conf"
-RDEPENDS_${PN}-ptest += "${PN}-misc make perl perl-module-filehandle bc"
+# Avoid binaries being marked as requiring an executable stack since they don't
+# (and it causes issues with SELinux)
+CFLAG += "-Wa,--noexecstack"
 
-PACKAGES =+ "${PN}-engines"
-FILES_${PN}-engines = "${libdir}/ssl/engines/*.so ${libdir}/engines"
+# For target side versions of openssl enable support for OCF Linux driver
+# if they are available.
+CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
 
-# Remove this to enable SSLv3. SSLv3 is defaulted to disabled due to the POODLE
-# vulnerability
-EXTRA_OECONF = " -no-ssl3"
+CFLAG_append_class-native = " -fPIC"
 
 do_configure_prepend_darwin () {
 	sed -i -e '/version-script=openssl\.ld/d' Configure
 }
 
-# The crypto_use_bigint patch means that perl's bignum module needs to be
-# installed, but some distributions (for example Fedora 23) don't ship it by
-# default.  As the resulting error is very misleading check for bignum before
-# building.
-do_configure_prepend() {
+do_configure () {
+	# The crypto_use_bigint patch means that perl's bignum module needs to be
+	# installed, but some distributions (for example Fedora 23) don't ship it by
+	# default.  As the resulting error is very misleading check for bignum before
+	# building.
 	if ! perl -Mbigint -e true; then
 		bbfatal "The perl module 'bignum' was not found but this is required to build openssl.  Please install this module (often packaged as perl-bignum) and re-run bitbake."
 	fi
-}
 
-do_configure () {
 	cd util
 	perl perlpath.pl ${STAGING_BINDIR_NATIVE}
 	cd ..
@@ -141,7 +121,7 @@ do_configure () {
 	linux-musl )
 		os=linux
 		;;
-		*)
+	*)
 		;;
 	esac
 	target="$os-${HOST_ARCH}"
@@ -203,12 +183,12 @@ do_configure () {
 	linux-powerpc64)
 		target=linux-ppc64
 		;;
-	linux-riscv64)
-		target=linux-generic64
-		;;
 	linux-riscv32)
 		target=linux-generic32
 		;;
+	linux-riscv64)
+		target=linux-generic64
+		;;
 	linux-supersparc)
 		target=linux-sparcv8
 		;;
@@ -219,19 +199,21 @@ do_configure () {
 		target=darwin-i386-cc
 		;;
 	esac
+
 	# inject machine-specific flags
 	sed -i -e "s|^\(\"$target\",\s*\"[^:]\+\):\([^:]\+\)|\1:${CFLAG}|g" Configure
-        useprefix=${prefix}
-        if [ "x$useprefix" = "x" ]; then
-                useprefix=/
-        fi        
+
+	useprefix=${prefix}
+	if [ "x$useprefix" = "x" ]; then
+		useprefix=/
+	fi
 	libdirleaf="$(echo ${libdir} | sed s:$useprefix::)"
 	perl ./Configure ${EXTRA_OECONF} shared --prefix=$useprefix --openssldir=${libdir}/ssl --libdir=${libdirleaf} $target
 }
 
 do_compile_prepend_class-target () {
-    sed -i 's/\((OPENSSL=\)".*"/\1"openssl"/' Makefile
-    oe_runmake depend
+	sed -i 's/\((OPENSSL=\)".*"/\1"openssl"/' Makefile
+	oe_runmake depend
 	cc_sanitized=`echo "${CC} ${CFLAG}" | sed -e 's,--sysroot=${STAGING_DIR_TARGET},,g' -e 's|${DEBUG_PREFIX_MAP}||g'`
 	oe_runmake CC_INFO="${cc_sanitized}"
 }
@@ -296,8 +278,8 @@ do_install () {
 do_install_ptest () {
 	cp -r -L Makefile.org Makefile test ${D}${PTEST_PATH}
 
-        # Replace the path to native perl with the path to target perl
-        sed -i 's,^PERL=.*,PERL=${bindir}/perl,' ${D}${PTEST_PATH}/Makefile
+	# Replace the path to native perl with the path to target perl
+	sed -i 's,^PERL=.*,PERL=${bindir}/perl,' ${D}${PTEST_PATH}/Makefile
 
 	cp Configure config e_os.h ${D}${PTEST_PATH}
 	cp -r -L include ${D}${PTEST_PATH}
@@ -336,9 +318,9 @@ do_install_ptest () {
 
 	# Remove build host references
 	sed -i \
-       -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
-       -e 's|${DEBUG_PREFIX_MAP}||g' \
-       ${D}${PTEST_PATH}/Makefile ${D}${PTEST_PATH}/Configure
+	-e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
+	-e 's|${DEBUG_PREFIX_MAP}||g' \
+	${D}${PTEST_PATH}/Makefile ${D}${PTEST_PATH}/Configure
 }
 
 do_install_append_class-native() {
@@ -350,10 +332,29 @@ do_install_append_class-native() {
 }
 
 do_install_append_class-nativesdk() {
-    mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
-    install -m 644 ${WORKDIR}/environment.d-openssl.sh ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
+	mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
+	install -m 644 ${WORKDIR}/environment.d-openssl.sh ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
 }
 
+# Add the openssl.cnf file to the openssl-conf package.  Make the libcrypto
+# package RRECOMMENDS on this package.  This will enable the configuration
+# file to be installed for both the base openssl package and the libcrypto
+# package since the base openssl package depends on the libcrypto package.
+
+PACKAGES =+ "libcrypto libssl openssl-conf ${PN}-engines ${PN}-misc"
+
+FILES_libcrypto = "${libdir}/libcrypto${SOLIBS}"
+FILES_libssl = "${libdir}/libssl${SOLIBS}"
+FILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
+FILES_${PN}-engines = "${libdir}/ssl/engines/*.so ${libdir}/engines"
+FILES_${PN}-misc = "${libdir}/ssl/misc"
+FILES_${PN} =+ "${libdir}/ssl/*"
 FILES_${PN}_append_class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/openssl.sh"
 
+CONFFILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
+
+RRECOMMENDS_libcrypto += "openssl-conf"
+RDEPENDS_${PN}-misc = "${@bb.utils.filter('PACKAGECONFIG', 'perl', d)}"
+RDEPENDS_${PN}-ptest += "${PN}-misc make perl perl-module-filehandle bc"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


