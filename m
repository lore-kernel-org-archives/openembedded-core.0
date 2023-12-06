Return-Path: <qiutt@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40EE6C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 01:09:04 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.18366.1701824938689669558
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 17:08:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: qiutt@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="142153722"
X-IronPort-AV: E=Sophos;i="6.04,254,1695654000"; 
   d="scan'208";a="142153722"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 10:08:56 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id D9333CA240
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Dec 2023 10:08:53 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id E960DD88C3
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Dec 2023 10:08:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 71E38202FBE9B
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Dec 2023 10:08:52 +0900 (JST)
Received: from ubuntu-Lenovo.lan (unknown [10.167.219.81])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 20C8D1A0071;
	Wed,  6 Dec 2023 09:08:52 +0800 (CST)
From: qiutt@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: fnstml-fujitsuten@fujitsu.com,
	qiutt <qiutt@fujitsu.com>
Subject: [PATCH V3] cairo: upgrade 1.16.0 -> 1.18.0
Date: Wed,  6 Dec 2023 09:04:28 +0800
Message-Id: <20231206010428.1275299-1-qiutt@fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28040.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28040.003
X-TMASE-Result: 10--17.357600-10.000000
X-TMASE-MatchedRID: AVoYXzWQQe2jz0nOeth/yUIIxwDaU5mrxqwmEOBVKeqvY1zctlJ9TDBX
	Xb/qS263sU8ECLuhDYszKUcjfbDidspSC015mx5vHeq/w17M53qZmLDnd2pI3wUMroZlhAl9OcY
	/jkDGKiKIhghQQiyup3tBxdKLkQVY+gtEW3D/QKaqFx2c/3V5cU3yuY9BGW8rNBBNXB5b9My0dz
	44aFByLpPCjTjzpWyS2eZ8wuOmKcWIKyp7CdRkYM2CuVPkCNzuN5dqZcIK7Via5Z0T0DVA7IPz9
	0d6wOeroTssFGSH7W0bYA1xraQblC/7QU2czuUNGYJhRh6ssesfimmlcABuN3XH1Ot8vMTwCVoX
	M3huKKucLsX6pVpO2gAHKAZ6feEKNbeNmiyKiUZIcJTn2HkqsTj75yeQ84is+hQFDxFe7IZHOkt
	jJ4/P0wL9HgOTFm6SebEStOsB1eFAsGseyn9084L5ja7E+Ohyg55m5RSwLMItferJ/d7Ab+KgaD
	ciS6Bw5ZV+p1mxM5DB7YywFo8mQNSxXbZonmxOhJGWG7a9pi1+tO36GYDlsst7+8TAtQuk1vkMk
	si4zIM2OhOm5LqNNnkNrWD+KBWtKz8U6m7mv8CVOwZbcOalS+JkuUnYmiSIM/dZg2GSzOV25lG5
	ErCg9troQQnIL8e2bKoDNYwJRxO6HS0eKYYtRjllFsU0CXSPJScvOTX4jHNIyDY579vwTKEWUPx
	8K79aUPUBvDxW81DcLo35fU2AnX1PaVvCiNKv9DGkDtq4vAxpkBMYDn8FePJRrpiIYQLIfEzRZ8
	UqjkpbJcQH3furV3k48PxckV+kHxPMjOKY7A8/vucGn10dpisAK2bu8sP4SSluJg5SbDHfd+P6w
	wCt8xoxTJ4LSy1onAOnU4i/fOPTro2l1LHu9LGdMQqgU76UBBzl44+7+DghIAlYAkgW961uy7KZ
	ek76
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 01:09:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191864

From: qiutt <qiutt@fujitsu.com>

Changelog for 1.18.0 [1]:
  The cairo-sphinx tool has been removed
  Cairo now implements Type 3 color fonts for PDF
  The XML surface has been removed
  The Tee surface is now automatically enabled
  The Quartz surface is improved
  Cairo now hides all private symbols by default on every platform
  Fixed multiple issues

As a part of 1.18.0, the following patches should be dropped.
  CVE-2018-19876.patch : https://gitlab.freedesktop.org/cairo/cairo/-/commit/90e85c2493fdfa3551f202ff10282463f1e36645
  CVE-2019-6461.patch  : https://gitlab.freedesktop.org/cairo/cairo/-/commit/09643ee1abdd5daacebfcb564448f29be9a79bac
  CVE-2019-6462.patch  : https://gitlab.freedesktop.org/cairo/cairo/-/commit/bbeaf08190d3006a80b80a77724801cd477a37b8
  CVE-2020-35492.patch : https://gitlab.freedesktop.org/cairo/cairo/-/commit/c986a7310bb06582b7d8a566d5f007ba4e5e75bf

Add patch for 1.18.0.
  0002-meson.build-fix-x11-build.patch [3] : Fix cross compile error

These options are all gone [2]: directfb, valgrind, egl, glesv2, opengl, trace

Build tool is changed : autotools -> meson

 [1] https://www.cairographics.org/news/cairo-1.18.0/
 [2] https://gitlab.freedesktop.org/cairo/cairo/-/blob/master/meson_options.txt
 [3] https://gitlab.freedesktop.org/cairo/cairo/-/issues/613

Signed-off-by: qiutt <qiutt@fujitsu.com>
---
 .../0002-meson.build-fix-x11-build.patch      | 29 +++++++++
 .../cairo/cairo/CVE-2018-19876.patch          | 34 ----------
 .../cairo/cairo/CVE-2019-6461.patch           | 20 ------
 .../cairo/cairo/CVE-2019-6462.patch           | 40 ------------
 .../cairo/cairo/CVE-2020-35492.patch          | 60 -----------------
 .../{cairo_1.16.0.bb => cairo_1.18.0.bb}      | 64 +++++--------------
 6 files changed, 46 insertions(+), 201 deletions(-)
 create mode 100644 meta/recipes-graphics/cairo/cairo/0002-meson.build-fix-x11-build.patch
 delete mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2018-19876.patch
 delete mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch
 delete mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch
 delete mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2020-35492.patch
 rename meta/recipes-graphics/cairo/{cairo_1.16.0.bb => cairo_1.18.0.bb} (51%)

diff --git a/meta/recipes-graphics/cairo/cairo/0002-meson.build-fix-x11-build.patch b/meta/recipes-graphics/cairo/cairo/0002-meson.build-fix-x11-build.patch
new file mode 100644
index 0000000000..f2fc64248d
--- /dev/null
+++ b/meta/recipes-graphics/cairo/cairo/0002-meson.build-fix-x11-build.patch
@@ -0,0 +1,29 @@
+From 840e3ad20f8536d9857876ca2f5161896b68ab9b Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Sun, 12 Nov 2023 10:44:13 +0100
+Subject: [PATCH] meson.build: fix x11 build
+
+../../br-test-pkg/arm-aarch64/build/cairo-1.18.0/meson.build:381:13: ERROR: Can not run test applications in this cross environment.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/cairo/cairo/-/issues/613]
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 9efe91978..9864b8699 100644
+--- a/meson.build
++++ b/meson.build
+@@ -369,7 +369,7 @@ if x11_dep.found() and xext_dep.found()
+ 
+   # Can skip the run check by providing the result in a cross file or
+   # native file as bool property value.
+-  prop = meson.get_external_property('ipc_rmid_deferred_release', 'auto')
++  prop = meson.get_external_property('ipc_rmid_deferred_release', 'false')
+   # We don't know the type of prop (bool, string) but need to differentiate
+   # between a set value (bool) or the fallback value (string), so convert to
+   # a string and check the string value.
+-- 
+2.34.1
+
diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2018-19876.patch b/meta/recipes-graphics/cairo/cairo/CVE-2018-19876.patch
deleted file mode 100644
index 4252a5663b..0000000000
--- a/meta/recipes-graphics/cairo/cairo/CVE-2018-19876.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-CVE: CVE-2018-19876
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 90e85c2493fdfa3551f202ff10282463f1e36645 Mon Sep 17 00:00:00 2001
-From: Carlos Garcia Campos <cgarcia@igalia.com>
-Date: Mon, 19 Nov 2018 12:33:07 +0100
-Subject: [PATCH] ft: Use FT_Done_MM_Var instead of free when available in
- cairo_ft_apply_variations
-
-Fixes a crash when using freetype >= 2.9
----
- src/cairo-ft-font.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/cairo-ft-font.c b/src/cairo-ft-font.c
-index 325dd61b4..981973f78 100644
---- a/src/cairo-ft-font.c
-+++ b/src/cairo-ft-font.c
-@@ -2393,7 +2393,11 @@ skip:
- done:
-         free (coords);
-         free (current_coords);
-+#if HAVE_FT_DONE_MM_VAR
-+        FT_Done_MM_Var (face->glyph->library, ft_mm_var);
-+#else
-         free (ft_mm_var);
-+#endif
-     }
- }
- 
--- 
-2.11.0
-
diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch b/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch
deleted file mode 100644
index a2dba6cb20..0000000000
--- a/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-There is an assertion in function _cairo_arc_in_direction().
-
-CVE: CVE-2019-6461
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/src/cairo-arc.c b/src/cairo-arc.c
-index 390397bae..1bde774a4 100644
---- a/src/cairo-arc.c
-+++ b/src/cairo-arc.c
-@@ -186,7 +186,8 @@ _cairo_arc_in_direction (cairo_t	  *cr,
-     if (cairo_status (cr))
-         return;
- 
--    assert (angle_max >= angle_min);
-+    if (angle_max < angle_min)
-+       return;
- 
-     if (angle_max - angle_min > 2 * M_PI * MAX_FULL_CIRCLES) {
- 	angle_max = fmod (angle_max - angle_min, 2 * M_PI);
diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch b/meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch
deleted file mode 100644
index 7c3209291b..0000000000
--- a/meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-CVE: CVE-2019-6462
-Upstream-Status: Backport
-Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
-
-From ab2c5ee21e5f3d3ee4b3f67cfcd5811a4f99c3a0 Mon Sep 17 00:00:00 2001
-From: Heiko Lewin <hlewin@gmx.de>
-Date: Sun, 1 Aug 2021 11:16:03 +0000
-Subject: [PATCH] _arc_max_angle_for_tolerance_normalized: fix infinite loop
-
----
- src/cairo-arc.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/cairo-arc.c b/src/cairo-arc.c
-index 390397bae..1c891d1a0 100644
---- a/src/cairo-arc.c
-+++ b/src/cairo-arc.c
-@@ -90,16 +90,18 @@ _arc_max_angle_for_tolerance_normalized (double tolerance)
- 	{ M_PI / 11.0,  9.81410988043554039085e-09 },
-     };
-     int table_size = ARRAY_LENGTH (table);
-+    const int max_segments = 1000; /* this value is chosen arbitrarily. this gives an error of about 1.74909e-20 */
- 
-     for (i = 0; i < table_size; i++)
- 	if (table[i].error < tolerance)
- 	    return table[i].angle;
- 
-     ++i;
-+
-     do {
- 	angle = M_PI / i++;
- 	error = _arc_error_normalized (angle);
--    } while (error > tolerance);
-+    } while (error > tolerance && i < max_segments);
- 
-     return angle;
- }
--- 
-2.38.1
-
diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2020-35492.patch b/meta/recipes-graphics/cairo/cairo/CVE-2020-35492.patch
deleted file mode 100644
index fb6ce5cfdf..0000000000
--- a/meta/recipes-graphics/cairo/cairo/CVE-2020-35492.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-Fix stack buffer overflow.
-
-CVE: CVE-2020-35492
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 03a820b173ed1fdef6ff14b4468f5dbc02ff59be Mon Sep 17 00:00:00 2001
-From: Heiko Lewin <heiko.lewin@worldiety.de>
-Date: Tue, 15 Dec 2020 16:48:19 +0100
-Subject: [PATCH] Fix mask usage in image-compositor
-
----
- src/cairo-image-compositor.c                |   8 ++--
- test/Makefile.sources                       |   1 +
- test/bug-image-compositor.c                 |  39 ++++++++++++++++++++
- test/reference/bug-image-compositor.ref.png | Bin 0 -> 185 bytes
- 4 files changed, 44 insertions(+), 4 deletions(-)
- create mode 100644 test/bug-image-compositor.c
- create mode 100644 test/reference/bug-image-compositor.ref.png
-
-diff --git a/src/cairo-image-compositor.c b/src/cairo-image-compositor.c
-index 79ad69f68..4f8aaed99 100644
---- a/src/cairo-image-compositor.c
-+++ b/src/cairo-image-compositor.c
-@@ -2601,14 +2601,14 @@ _inplace_src_spans (void *abstract_renderer, int y, int h,
- 		    unsigned num_spans)
- {
-     cairo_image_span_renderer_t *r = abstract_renderer;
--    uint8_t *m;
-+    uint8_t *m, *base = (uint8_t*)pixman_image_get_data(r->mask);
-     int x0;
- 
-     if (num_spans == 0)
- 	return CAIRO_STATUS_SUCCESS;
- 
-     x0 = spans[0].x;
--    m = r->_buf;
-+    m = base;
-     do {
- 	int len = spans[1].x - spans[0].x;
- 	if (len >= r->u.composite.run_length && spans[0].coverage == 0xff) {
-@@ -2655,7 +2655,7 @@ _inplace_src_spans (void *abstract_renderer, int y, int h,
- 				      spans[0].x, y,
- 				      spans[1].x - spans[0].x, h);
- 
--	    m = r->_buf;
-+	    m = base;
- 	    x0 = spans[1].x;
- 	} else if (spans[0].coverage == 0x0) {
- 	    if (spans[0].x != x0) {
-@@ -2684,7 +2684,7 @@ _inplace_src_spans (void *abstract_renderer, int y, int h,
- #endif
- 	    }
- 
--	    m = r->_buf;
-+	    m = base;
- 	    x0 = spans[1].x;
- 	} else {
- 	    *m++ = spans[0].coverage;
--- 
diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-graphics/cairo/cairo_1.18.0.bb
similarity index 51%
rename from meta/recipes-graphics/cairo/cairo_1.16.0.bb
rename to meta/recipes-graphics/cairo/cairo_1.18.0.bb
index ffb813d290..2f99099b60 100644
--- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.18.0.bb
@@ -7,7 +7,7 @@ optional translucence (opacity/alpha) and combined using the \
 extended Porter/Duff compositing algebra as found in the X Render \
 Extension."
 HOMEPAGE = "http://cairographics.org"
-BUGTRACKER = "http://bugs.freedesktop.org"
+BUGTRACKER = "https://gitlab.freedesktop.org/cairo/cairo/-/issues"
 SECTION = "libs"
 
 LICENSE = "(MPL-1.1 | LGPL-2.1-only) & GPL-3.0-or-later"
@@ -26,62 +26,32 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77 \
                     ${@bb.utils.contains('PACKAGECONFIG', 'trace', 'file://util/cairo-trace/COPYING-GPL-3;md5=d32239bcb673463ab874e80d47fae504', '', d)}"
 
 
-DEPENDS = "fontconfig glib-2.0 libpng pixman zlib"
+DEPENDS = "fontconfig freetype glib-2.0 libpng pixman zlib"
 
 SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz \
            file://cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff \
-           file://CVE-2018-19876.patch \
-           file://CVE-2019-6461.patch \
-           file://CVE-2019-6462.patch \
-           file://CVE-2020-35492.patch \
+           file://0002-meson.build-fix-x11-build.patch \
           "
 
-SRC_URI[md5sum] = "f19e0353828269c22bd72e271243a552"
-SRC_URI[sha256sum] = "5e7b29b3f113ef870d1e3ecf8adf21f923396401604bda16d44be45e66052331"
+SRC_URI[sha256sum] = "243a0736b978a33dee29f9cca7521733b78a65b5418206fef7bd1c3d4cf10b64"
 
-inherit autotools pkgconfig upstream-version-is-even gtk-doc multilib_script
+inherit meson pkgconfig upstream-version-is-even gtk-doc multilib_script
+
+GTKDOC_MESON_OPTION = "gtk_doc"
 
 MULTILIB_SCRIPTS = "${PN}-perf-utils:${bindir}/cairo-trace"
 
-X11DEPENDS = "virtual/libx11 libsm libxrender libxext"
-
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'opengl', '', d)} \
-                   trace"
-PACKAGECONFIG:class-native = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)}"
-PACKAGECONFIG:class-nativesdk = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)}"
-
-PACKAGECONFIG[x11] = "--with-x=yes -enable-xlib,--with-x=no --disable-xlib,${X11DEPENDS}"
-PACKAGECONFIG[xcb] = "--enable-xcb,--disable-xcb,libxcb"
-PACKAGECONFIG[directfb] = "--enable-directfb=yes,,directfb"
-PACKAGECONFIG[valgrind] = "--enable-valgrind=yes,--disable-valgrind,valgrind"
-PACKAGECONFIG[egl] = "--enable-egl=yes,--disable-egl,virtual/egl"
-PACKAGECONFIG[glesv2] = "--enable-glesv2,--disable-glesv2,virtual/libgles2"
-PACKAGECONFIG[opengl] = "--enable-gl,--disable-gl,virtual/libgl"
-# trace is under GPLv3
-PACKAGECONFIG[trace] = "--enable-trace,--disable-trace"
-
-EXTRA_OECONF += " \
-    ${@bb.utils.contains('TARGET_FPU', 'soft', '--disable-some-floating-point', '', d)} \
-    --enable-tee \
-"
-
-# We don't depend on binutils so we need to disable this
-export ac_cv_lib_bfd_bfd_openr="no"
-# Ensure we don't depend on LZO
-export ac_cv_lib_lzo2_lzo2a_decompress="no"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xlib xcb', '', d)} trace"
+PACKAGECONFIG[xlib] = "-Dxlib=enabled,-Dxlib=disabled,virtual/libx11 libxrender libxext"
+PACKAGECONFIG[xcb] = "-Dxcb=enabled,-Dxcb=disabled,libxcb"
+# cairo-trace is GPLv3 so add an option to remove it
+PACKAGECONFIG[trace] = ""
 
 do_install:append () {
-	rm -rf ${D}${bindir}/cairo-sphinx
-	rm -rf ${D}${libdir}/cairo/cairo-fdr*
-	rm -rf ${D}${libdir}/cairo/cairo-sphinx*
-	rm -rf ${D}${libdir}/cairo/.debug/cairo-fdr*
-	rm -rf ${D}${libdir}/cairo/.debug/cairo-sphinx*
-	[ ! -d ${D}${bindir} ] ||
-		rmdir -p --ignore-fail-on-non-empty ${D}${bindir}
-	[ ! -d ${D}${libdir}/cairo ] ||
-		rmdir -p --ignore-fail-on-non-empty ${D}${libdir}/cairo
+    if ! ${@bb.utils.contains('PACKAGECONFIG', 'trace', 'true', 'false', d)}; then
+        rm ${D}${bindir}/cairo-trace ${D}${libdir}/cairo/libcairo-trace.so
+        rmdir --ignore-fail-on-non-empty ${D}${bindir} ${D}${libdir}/cairo
+    fi
 }
 
 PACKAGES =+ "cairo-gobject cairo-script-interpreter cairo-perf-utils"
@@ -99,7 +69,7 @@ DESCRIPTION:cairo-perf-utils = "The Cairo library performance utilities"
 FILES:${PN} = "${libdir}/libcairo.so.*"
 FILES:${PN}-gobject = "${libdir}/libcairo-gobject.so.*"
 FILES:${PN}-script-interpreter = "${libdir}/libcairo-script-interpreter.so.*"
-FILES:${PN}-perf-utils = "${bindir}/cairo-trace* ${libdir}/cairo/*.la ${libdir}/cairo/libcairo-trace.so"
+FILES:${PN}-perf-utils = "${bindir}/cairo-* ${libdir}/cairo/libcairo-trace.so ${libdir}/cairo/libcairo-fdr.so"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.25.1


