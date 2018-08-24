Return-Path: <armccurdy@gmail.com>
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id EDE9B795CA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 02:09:16 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id c6-v6so400918pls.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 19:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wTj6CHZKWqenzuGwjEUBJbpu7p0qVzr+6pDx0cN4oTk=;
	b=mYO5Ei7qo3PElj1jyNe6JO4AxVg09Dh/+bu6HK5LvdHOANp16kms1r5VLJ9uN18jCX
	1Bc0Mc0iW2CeXHoqckNRyf3q6mI2ciFohmMVKpnwDB5OtgNc34a/DWO39AQGKo6JO5aB
	YKoFNQEXgSq1SeCXtSwZk7gjycjQ2fQL2pz1qrjTl/vT7nqhu5+rRTdXLrweIcgpwlqi
	aRRVX1H/qmVwv4KuiuyLoyoGq5+fE+hBEBhYjjCWvuOMqqLTyitqmO2LtjRXMaHup/ET
	WIbT1UChtH7HDGGvrnOFjj5rp/pb4t9h4JfCa64I/JggqPZzfUPd+bByqtensUZU7R7o
	ytzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wTj6CHZKWqenzuGwjEUBJbpu7p0qVzr+6pDx0cN4oTk=;
	b=ubKWnEbashYRYOM/9aeh5KkKinxBNZIMonPLmkOE55R4rCSyJI5SM0dG4NuKFJ84Aq
	W0vQ7J6yqCtM8BT2vfmT9weTuY4f/yb8q38Xq8Ea5/gRVyXJ7q09vbVfy6yoY/cfA2J3
	n71Oeu8EDJ+wLxigXS5gxjGknpMXujQ3vP6eo8vl2fR1r4Q7tv3x7vv77+4+g9XKNEgE
	l5GL2FhuC0fCpd3+cTG3JeNEZQY5CHpxTl1HbebPKLvr28Tj9F3Q3KkqmIJB7QhHpyHk
	QyxBIIoQordNY8d3SlNmOohQYrRtbaKivx5KJUOZhcBJqlIdhjs+OqYuKoJCTR9/HzCk
	Tn8w==
X-Gm-Message-State: AOUpUlE+SPCnbKoJQCQApr2E/yhY/oqhDA3ZOvbwOS4C4KUK7lwieCal
	OtYaUUzifTLoKtNMT9jK2p/sXGWr
X-Google-Smtp-Source: AA+uWPxWU2kA3Fgwdw1Xz6FlGEFzDMrt/rgf4fIKpGpH03xXsN0fdqG9I/L6R2Qd1nD87UvZfAgGIw==
X-Received: by 2002:a17:902:2804:: with SMTP id
	e4-v6mr51253836plb.327.1535076557917; 
	Thu, 23 Aug 2018 19:09:17 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	u17-v6sm12791650pfa.176.2018.08.23.19.09.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Aug 2018 19:09:17 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Aug 2018 19:09:09 -0700
Message-Id: <1535076549-29504-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1535076549-29504-1-git-send-email-armccurdy@gmail.com>
References: <1535076549-29504-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/2] cairo: merge cairo.inc into cairo recipe
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
X-List-Received-Date: Fri, 24 Aug 2018 02:09:17 -0000

Remove SUMMARY_${PN} and DESCRIPTION_${PN}, which duplicate the
default SUMMARY and DESCRIPTION.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-graphics/cairo/cairo.inc        | 48 ------------------
 meta/recipes-graphics/cairo/cairo_1.14.12.bb | 75 +++++++++++++++++++++-------
 2 files changed, 57 insertions(+), 66 deletions(-)
 delete mode 100644 meta/recipes-graphics/cairo/cairo.inc

diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-graphics/cairo/cairo.inc
deleted file mode 100644
index b432da0..0000000
--- a/meta/recipes-graphics/cairo/cairo.inc
+++ /dev/null
@@ -1,48 +0,0 @@
-SUMMARY = "The Cairo 2D vector graphics library"
-DESCRIPTION = "Cairo is a multi-platform library providing anti-aliased \
-vector-based rendering for multiple target backends. Paths consist \
-of line segments and cubic splines and can be rendered at any width \
-with various join and cap styles. All colors may be specified with \
-optional translucence (opacity/alpha) and combined using the \
-extended Porter/Duff compositing algebra as found in the X Render \
-Extension."
-HOMEPAGE = "http://cairographics.org"
-BUGTRACKER = "http://bugs.freedesktop.org"
-SECTION = "libs"
-
-LICENSE = "MPL-1 & LGPLv2.1 & GPLv3+"
-LICENSE_${PN} = "MPL-1 & LGPLv2.1"
-LICENSE_${PN}-dev = "MPL-1 & LGPLv2.1"
-LICENSE_${PN}-doc = "MPL-1 & LGPLv2.1"
-LICENSE_${PN}-gobject = "MPL-1 & LGPLv2.1"
-LICENSE_${PN}-script-interpreter = "MPL-1 & LGPLv2.1"
-LICENSE_${PN}-perf-utils = "GPLv3+"
-
-X11DEPENDS = "virtual/libx11 libsm libxrender libxext"
-DEPENDS = "libpng fontconfig pixman glib-2.0 zlib"
-
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)} \
-           ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'opengl', '', d)}"
-
-PACKAGECONFIG[x11] = "--with-x=yes -enable-xlib,--with-x=no --disable-xlib,${X11DEPENDS}"
-PACKAGECONFIG[xcb] = "--enable-xcb,--disable-xcb,libxcb"
-PACKAGECONFIG[directfb] = "--enable-directfb=yes,,directfb"
-PACKAGECONFIG[valgrind] = "--enable-valgrind=yes,--disable-valgrind,valgrind"
-PACKAGECONFIG[egl] = "--enable-egl=yes,--disable-egl,virtual/egl"
-PACKAGECONFIG[glesv2] = "--enable-glesv2,--disable-glesv2,virtual/libgles2"
-PACKAGECONFIG[opengl] = "--enable-gl,--disable-gl,virtual/libgl"
-
-EXTRA_OECONF += " \
-    ${@bb.utils.contains('TARGET_FPU', 'soft', '--disable-some-floating-point', '', d)} \
-    --enable-tee \
-"
-
-inherit autotools pkgconfig upstream-version-is-even gtk-doc
-
-# We don't depend on binutils so we need to disable this
-export ac_cv_lib_bfd_bfd_openr="no"
-# Ensure we don't depend on LZO
-export ac_cv_lib_lzo2_lzo2a_decompress="no"
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-graphics/cairo/cairo_1.14.12.bb b/meta/recipes-graphics/cairo/cairo_1.14.12.bb
index 075ca1e..a902c26 100644
--- a/meta/recipes-graphics/cairo/cairo_1.14.12.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.14.12.bb
@@ -1,7 +1,27 @@
-require cairo.inc
+SUMMARY = "The Cairo 2D vector graphics library"
+DESCRIPTION = "Cairo is a multi-platform library providing anti-aliased \
+vector-based rendering for multiple target backends. Paths consist \
+of line segments and cubic splines and can be rendered at any width \
+with various join and cap styles. All colors may be specified with \
+optional translucence (opacity/alpha) and combined using the \
+extended Porter/Duff compositing algebra as found in the X Render \
+Extension."
+HOMEPAGE = "http://cairographics.org"
+BUGTRACKER = "http://bugs.freedesktop.org"
+SECTION = "libs"
+
+LICENSE = "MPL-1 & LGPLv2.1 & GPLv3+"
+LICENSE_${PN} = "MPL-1 & LGPLv2.1"
+LICENSE_${PN}-dev = "MPL-1 & LGPLv2.1"
+LICENSE_${PN}-doc = "MPL-1 & LGPLv2.1"
+LICENSE_${PN}-gobject = "MPL-1 & LGPLv2.1"
+LICENSE_${PN}-script-interpreter = "MPL-1 & LGPLv2.1"
+LICENSE_${PN}-perf-utils = "GPLv3+"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
 
+DEPENDS = "fontconfig glib-2.0 libpng pixman zlib"
+
 SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz \
            file://cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff \ 
            file://0001-cairo-Fix-CVE-2017-9814.patch \
@@ -10,16 +30,41 @@ SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz \
 SRC_URI[md5sum] = "9f0db9dbfca0966be8acd682e636d165"
 SRC_URI[sha256sum] = "8c90f00c500b2299c0a323dd9beead2a00353752b2092ead558139bd67f7bf16"
 
-PACKAGES =+ "cairo-gobject cairo-script-interpreter cairo-perf-utils"
+inherit autotools pkgconfig upstream-version-is-even gtk-doc
 
-SUMMARY_${PN} = "The Cairo 2D vector graphics library"
-DESCRIPTION_${PN} = "Cairo is a multi-platform library providing anti-aliased \
-vector-based rendering for multiple target backends. Paths consist \
-of line segments and cubic splines and can be rendered at any width \
-with various join and cap styles. All colors may be specified with \
-optional translucence (opacity/alpha) and combined using the \
-extended Porter/Duff compositing algebra as found in the X Render \
-Extension."
+X11DEPENDS = "virtual/libx11 libsm libxrender libxext"
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'opengl', '', d)}"
+
+PACKAGECONFIG[x11] = "--with-x=yes -enable-xlib,--with-x=no --disable-xlib,${X11DEPENDS}"
+PACKAGECONFIG[xcb] = "--enable-xcb,--disable-xcb,libxcb"
+PACKAGECONFIG[directfb] = "--enable-directfb=yes,,directfb"
+PACKAGECONFIG[valgrind] = "--enable-valgrind=yes,--disable-valgrind,valgrind"
+PACKAGECONFIG[egl] = "--enable-egl=yes,--disable-egl,virtual/egl"
+PACKAGECONFIG[glesv2] = "--enable-glesv2,--disable-glesv2,virtual/libgles2"
+PACKAGECONFIG[opengl] = "--enable-gl,--disable-gl,virtual/libgl"
+
+EXTRA_OECONF += " \
+    ${@bb.utils.contains('TARGET_FPU', 'soft', '--disable-some-floating-point', '', d)} \
+    --enable-tee \
+"
+
+# We don't depend on binutils so we need to disable this
+export ac_cv_lib_bfd_bfd_openr="no"
+# Ensure we don't depend on LZO
+export ac_cv_lib_lzo2_lzo2a_decompress="no"
+
+do_install_append () {
+	rm -rf ${D}${bindir}/cairo-sphinx
+	rm -rf ${D}${libdir}/cairo/cairo-fdr*
+	rm -rf ${D}${libdir}/cairo/cairo-sphinx*
+	rm -rf ${D}${libdir}/cairo/.debug/cairo-fdr*
+	rm -rf ${D}${libdir}/cairo/.debug/cairo-sphinx*
+}
+
+PACKAGES =+ "cairo-gobject cairo-script-interpreter cairo-perf-utils"
 
 SUMMARY_cairo-gobject = "The Cairo library GObject wrapper library"
 DESCRIPTION_cairo-gobject = "A GObject wrapper library for the Cairo API."
@@ -32,15 +77,9 @@ to replay rendering."
 DESCRIPTION_cairo-perf-utils = "The Cairo library performance utilities"
 
 FILES_${PN} = "${libdir}/libcairo.so.*"
-FILES_${PN}-dev += "${libdir}/cairo/*.so"
 FILES_${PN}-gobject = "${libdir}/libcairo-gobject.so.*"
 FILES_${PN}-script-interpreter = "${libdir}/libcairo-script-interpreter.so.*"
 FILES_${PN}-perf-utils = "${bindir}/cairo-trace ${libdir}/cairo/*.la ${libdir}/cairo/libcairo-trace.so.*"
+FILES_${PN}-dev += "${libdir}/cairo/*.so"
 
-do_install_append () {
-	rm -rf ${D}${bindir}/cairo-sphinx
-	rm -rf ${D}${libdir}/cairo/cairo-fdr*
-	rm -rf ${D}${libdir}/cairo/cairo-sphinx*
-	rm -rf ${D}${libdir}/cairo/.debug/cairo-fdr*
-	rm -rf ${D}${libdir}/cairo/.debug/cairo-sphinx*
-}
+BBCLASSEXTEND = "native"
-- 
1.9.1


