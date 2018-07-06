Return-Path: <armccurdy@gmail.com>
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3964478879
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2018 20:55:06 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id c5-v6so11018932qth.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jul 2018 13:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rDZ3jTfKiHg7sx21XcPpIhgrPiah/RuOVVDfZQJOZE0=;
	b=VOG45i+eCSMWnhAdmXxdB5q8A5tz4PoJTwKn48SN4TO9f736fwUWBl3keAnUGG1mQ+
	XKjITKn+UTJB2GiqzXgQBGH0d7M2G1E/TLBgyT4uwCSRX0p8eYbCPMr5dK+qiYn3yoQV
	PpXDfctHQwbZNRTuYiwgTlZvt9r6JsG7l6mqHJYurxvKe3KhSKfdqhoktggp7kQQs13B
	S5gmF5hjB2aItW4rlbADkbfRz8QsQxZW35K+M1dv5UFKJawi5hJPiwoNVLte4gV5YPM1
	aICYFn6FxELgQvtilXYvsICBG6wXP2E6W+/MzCNtcxA2dTzqXyQ8p+lJCIEnEwlYXlS4
	E9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rDZ3jTfKiHg7sx21XcPpIhgrPiah/RuOVVDfZQJOZE0=;
	b=iBBMqQQAJXcczjFDHzRhkVTEqaT9368n8Os/7ZYWzYl68i5tkGHYE6TyFi1KoiBvF7
	5IGZlfNE9atS/Uw5yG8dZwsuTY561w8njvHJnSpvGBR0flZaM88V4s3yxnVdLjjZ9Bce
	muCtjE7GppcIXLAvOcrtepy2Z72EXu3WwR3Oor8HCnT300g/BFxl5wk4Bla6fn3ugjeN
	nwOX0Xm2XFKWFctzdvskSuNB9g+EdJZOa2b65MYP36dUIeNjbPtf/196eKChioqwAOyC
	G4HTdymvgKsxvAcJVF5pZQaaD6Q8XA7uOBmRSRvT/+s6sSRtQ8qHocyLHVKgPlU+mRE5
	y2JQ==
X-Gm-Message-State: APt69E3HJJEy6mBOBlVzWrm9l0duZMQIAr8lYLtMhPaU3QgU9px/o8v+
	BKFoMdGBuPvu0FqvGthfc7kNoQ==
X-Google-Smtp-Source: AAOMgpcxhna9nXVEJyCNJOUiR06V3PlS33XB60Oq9goOebrOKmdApG7kwU2GIISCXh2sHLh50jxE2Q==
X-Received: by 2002:aed:2299:: with SMTP id
	p25-v6mr10893774qtc.70.1530910506976; 
	Fri, 06 Jul 2018 13:55:06 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	i1-v6sm5690442qtj.65.2018.07.06.13.55.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 06 Jul 2018 13:55:06 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jul 2018 13:54:55 -0700
Message-Id: <1530910495-8058-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1530910495-8058-1-git-send-email-armccurdy@gmail.com>
References: <1530910495-8058-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/2] gobject-introspection: minor recipe formatting tweaks
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
X-List-Received-Date: Fri, 06 Jul 2018 20:55:06 -0000

Re-order variables to align more closely to the OE style-guide.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../gobject-introspection_1.56.1.bb                | 97 +++++++++++-----------
 1 file changed, 50 insertions(+), 47 deletions(-)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.56.1.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.56.1.bb
index 96e0d6c..f347956 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.56.1.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.56.1.bb
@@ -17,17 +17,13 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-$
            file://0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch \
            file://0001-giscanner-add-a-lib-dirs-envvar-option.patch \
            "
+
 SRC_URI[md5sum] = "62e5f5685b8d9752fdeaf17c057d53d1"
 SRC_URI[sha256sum] = "5b2875ccff99ff7baab63a34b67f8c920def240e178ff50add809e267d9ea24b"
 
-SRC_URI_append_class-native = " file://0001-Relocate-the-repository-directory-for-native-builds.patch "
+SRC_URI_append_class-native = " file://0001-Relocate-the-repository-directory-for-native-builds.patch"
 
 inherit autotools pkgconfig gtk-doc python3native qemu gobject-introspection-data upstream-version-is-even
-BBCLASSEXTEND = "native"
-
-# needed for writing out the qemu wrapper script
-export STAGING_DIR_HOST
-export B
 
 DEPENDS_append = " libffi zlib glib-2.0 python3 flex-native bison-native"
 
@@ -38,7 +34,29 @@ DEPENDS_append = " libffi zlib glib-2.0 python3 flex-native bison-native"
 # (standard ldd doesn't work when cross-compiling).
 DEPENDS_class-target_append = " gobject-introspection-native qemu-native prelink-native"
 
-SSTATE_SCAN_FILES += "g-ir-scanner-qemuwrapper g-ir-scanner-wrapper g-ir-compiler-wrapper g-ir-scanner-lddwrapper Gio-2.0.gir postinst-ldsoconf-${PN}"
+# needed for writing out the qemu wrapper script
+export STAGING_DIR_HOST
+export B
+
+PACKAGECONFIG ?= ""
+PACKAGECONFIG[doctool] = "--enable-doctool,--disable-doctool,python3-mako,"
+
+# Configure target build to use native tools of itself and to use a qemu wrapper
+# and optionally to generate introspection data
+EXTRA_OECONF_class-target = " \
+    --disable-static \
+    --enable-host-gi \
+    --enable-gi-cross-wrapper=${B}/g-ir-scanner-qemuwrapper \
+    --enable-gi-ldd-wrapper=${B}/g-ir-scanner-lddwrapper \
+    ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '--enable-introspection-data', '--disable-introspection-data', d)} \
+"
+
+# Need to ensure ld.so.conf exists so prelink-native works
+# both before we build and if we install from sstate
+do_configure[prefuncs] += "gobject_introspection_preconfigure"
+python gobject_introspection_preconfigure () {
+    oe.utils.write_ld_so_conf(d)
+}
 
 do_configure_prepend_class-native() {
         # Tweak the native python scripts so that they don't refer to the
@@ -100,18 +118,6 @@ EOF
         sed -i -e '1s,#!.*,#!${USRBINPATH}/env python3,' ${S}/tools/g-ir-tool-template.in
 }
 
-# Configure target build to use native tools of itself and to use a qemu wrapper
-# and optionally to generate introspection data
-EXTRA_OECONF_class-target = "--enable-host-gi \
-                              --disable-static \
-                              --enable-gi-cross-wrapper=${B}/g-ir-scanner-qemuwrapper \
-                              --enable-gi-ldd-wrapper=${B}/g-ir-scanner-lddwrapper \
-                              ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '--enable-introspection-data', '--disable-introspection-data', d)} \
-                             "
-
-PACKAGECONFIG ?= ""
-PACKAGECONFIG[doctool] = "--enable-doctool,--disable-doctool,python3-mako,"
-
 do_compile_prepend() {
         # This prevents g-ir-scanner from writing cache data to $HOME
         export GI_SCANNER_DISABLE_CACHE=1
@@ -130,27 +136,6 @@ do_install_append_class-target() {
         install ${B}/g-ir-scanner-lddwrapper ${D}${bindir}/
 }
 
-# .typelib files are needed at runtime and so they go to the main package
-FILES_${PN}_append = " ${libdir}/girepository-*/*.typelib"
-
-# .gir files go to dev package, as they're needed for developing (but not for running)
-# things that depends on introspection.
-FILES_${PN}-dev_append = " ${datadir}/gir-*/*.gir"
-FILES_${PN}-dev_append = " ${datadir}/gir-*/*.rnc"
-
-# These are used by gobject-based packages
-# to generate transient introspection binaries
-FILES_${PN}-dev_append = " ${datadir}/gobject-introspection-1.0/gdump.c \
-               ${datadir}/gobject-introspection-1.0/Makefile.introspection"
-
-# These are used by dependent packages (e.g. pygobject) to build their
-# testsuites.
-FILES_${PN}-dev_append = " ${datadir}/gobject-introspection-1.0/tests/*.c \
-                   ${datadir}/gobject-introspection-1.0/tests/*.h"
-
-FILES_${PN}-dbg += "${libdir}/gobject-introspection/giscanner/.debug/"
-FILES_${PN}-staticdev += "${libdir}/gobject-introspection/giscanner/*.a"
-
 # we need target versions of introspection tools in sysroot so that they can be run via qemu
 # when building introspection files in other packages
 SYSROOT_DIRS_append_class-target = " ${bindir}"
@@ -165,13 +150,6 @@ gi_binaries_sysroot_preprocess() {
            ${SYSROOT_DESTDIR}${libdir}/pkgconfig/gobject-introspection-1.0.pc
 }
 
-# Need to ensure ld.so.conf exists so prelink-native works
-# both before we build and if we install from sstate
-do_configure[prefuncs] += "gobject_introspection_preconfigure"
-python gobject_introspection_preconfigure () {
-    oe.utils.write_ld_so_conf(d)
-}
-
 SYSROOT_PREPROCESS_FUNCS_append = " gi_ldsoconf_sysroot_preprocess"
 gi_ldsoconf_sysroot_preprocess () {
 	mkdir -p ${SYSROOT_DESTDIR}${bindir}
@@ -191,3 +169,28 @@ gi_package_preprocess() {
 	rm -f ${PKGD}${bindir}/g-ir-compiler-wrapper
 	rm -f ${PKGD}${bindir}/g-ir-scanner-lddwrapper
 }
+
+SSTATE_SCAN_FILES += "g-ir-scanner-qemuwrapper g-ir-scanner-wrapper g-ir-compiler-wrapper g-ir-scanner-lddwrapper Gio-2.0.gir postinst-ldsoconf-${PN}"
+
+# .typelib files are needed at runtime and so they go to the main package
+FILES_${PN}_append = " ${libdir}/girepository-*/*.typelib"
+
+# .gir files go to dev package, as they're needed for developing (but not for running)
+# things that depends on introspection.
+FILES_${PN}-dev_append = " ${datadir}/gir-*/*.gir"
+FILES_${PN}-dev_append = " ${datadir}/gir-*/*.rnc"
+
+# These are used by gobject-based packages
+# to generate transient introspection binaries
+FILES_${PN}-dev_append = " ${datadir}/gobject-introspection-1.0/gdump.c \
+                           ${datadir}/gobject-introspection-1.0/Makefile.introspection"
+
+# These are used by dependent packages (e.g. pygobject) to build their
+# testsuites.
+FILES_${PN}-dev_append = " ${datadir}/gobject-introspection-1.0/tests/*.c \
+                           ${datadir}/gobject-introspection-1.0/tests/*.h"
+
+FILES_${PN}-dbg += "${libdir}/gobject-introspection/giscanner/.debug/"
+FILES_${PN}-staticdev += "${libdir}/gobject-introspection/giscanner/*.a"
+
+BBCLASSEXTEND = "native"
-- 
1.9.1


