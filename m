Return-Path: <qiutt@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5089C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 02:34:36 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.46357.1699238075433767795
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Nov 2023 18:34:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: qiutt@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="126632102"
X-IronPort-AV: E=Sophos;i="6.03,280,1694703600"; 
   d="scan'208";a="126632102"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 11:34:13 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id BD42AD9DB5
	for <openembedded-core@lists.openembedded.org>; Mon,  6 Nov 2023 11:34:11 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id EA22926AEB
	for <openembedded-core@lists.openembedded.org>; Mon,  6 Nov 2023 11:34:10 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6EE56200501BD
	for <openembedded-core@lists.openembedded.org>; Mon,  6 Nov 2023 11:34:10 +0900 (JST)
Received: from centos.g08.fujitsu.local (unknown [10.167.219.96])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0CF841A006F;
	Mon,  6 Nov 2023 10:34:09 +0800 (CST)
From: qiutt@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: qiutt <qiutt@fujitsu.com>
Subject: [PATCH] cairo: upgrade 1.16.0 -> 1.18.0
Date: Mon,  6 Nov 2023 10:34:05 +0800
Message-Id: <1699238045-2801-1-git-send-email-qiutt@fujitsu.com>
X-Mailer: git-send-email 1.7.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27980.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27980.004
X-TMASE-Result: 10--9.092100-10.000000
X-TMASE-MatchedRID: Zht1puvKudmjz0nOeth/yUIIxwDaU5mrxqwmEOBVKeqvY1zctlJ9TDBX
	Xb/qS263sU8ECLuhDYszKUcjfbDidspSC015mx5vHeq/w17M53qZmLDnd2pI3wUMroZlhAl9OcY
	/jkDGKiJV4C/vPAJ49XdNoXv6UJm+YTECZtuF/N0D2WXLXdz+AdUEOicf335WmOZ1aYocYsOVIb
	fpsq9FzNvJClw+2wnZxiiH+oQX+1UBOHW58ozCWk7nLUqYrlslNmVjpriVEtm4GyTmeN+AbNizx
	Nej0JUTw1vigW0zG7E4XZaUWQ+fgAI2KcLRn3QRzfqlpbtmcWgnhzAhgvoq50Yx760ONDcWKpi9
	XFTnNcDPz9CYF+mMT3y8s7RgoirCxG11D4HJ3wS/QNwZdfw3FSJtibNJuxPCo2PBF3QVHR9WDCU
	d3SK4dosAGCSLDiuK+bg+kMDal2sWQV+Hmk6Z5/hmLfH/1YU7LYdywTHl7nuervGnOiwVzftqIr
	kO/l5c6tJOVmmMtwe636hV6a1ExwTmrXwoXYx7EzEoOqAAVLNr9+Kgn2XgeHXHQq6zBeSUs0Bvo
	FssJgWWM5TrNhwGvBuB5Xh71Q+eeAhnd12HpxdmPsTq8ee41heN9Hd3TB5Gnebzwo/2+OOUg5UD
	6AlF0rF9uGobEuT7gDLqnrRlXra/ZOFeDeXHgN0H8LFZNFG7/nnwJ52QYi+pygCGKFPC+PL0dqd
	hIhOvA0ihJoywxP1/MOQ1Z9NLMA1q3VdInFoLVTZi8K+htUM=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 02:34:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190191

From: qiutt <qiutt@fujitsu.com>

Changelog for 1.18.0 [1]:
  The cairo-sphinx tool has been removed
  Cairo now implements Type 3 color fonts for PDF
  The XML surface has been removed
  The Tee surface is now automatically enabled
  The Quartz surface is improved
  Cairo now hides all private symbols by default on every platform
  Fixed multiple issues

[1] https://www.cairographics.org/news/cairo-1.18.0/

Signed-off-by: qiutt <qiutt@fujitsu.com>
---
 .../cairo/cairo/CVE-2018-19876.patch          | 34 -----------
 .../cairo/cairo/CVE-2019-6461.patch           | 13 ++--
 .../cairo/cairo/CVE-2019-6462.patch           | 40 -------------
 .../cairo/cairo/CVE-2020-35492.patch          | 60 -------------------
 .../{cairo_1.16.0.bb => cairo_1.18.0.bb}      | 41 ++++---------
 5 files changed, 18 insertions(+), 170 deletions(-)
 delete mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2018-19876.patch
 delete mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch
 delete mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2020-35492.patch
 rename meta/recipes-graphics/cairo/{cairo_1.16.0.bb => cairo_1.18.0.bb} (68%)

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
index a2dba6cb20..fab514332c 100644
--- a/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch
+++ b/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch
@@ -1,15 +1,16 @@
 There is an assertion in function _cairo_arc_in_direction().
+backport for 1.18.0 version.
+Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
 
 CVE: CVE-2019-6461
 Upstream-Status: Pending
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
-diff --git a/src/cairo-arc.c b/src/cairo-arc.c
-index 390397bae..1bde774a4 100644
---- a/src/cairo-arc.c
-+++ b/src/cairo-arc.c
-@@ -186,7 +186,8 @@ _cairo_arc_in_direction (cairo_t	  *cr,
-     if (cairo_status (cr))
+diff -rNu c/src/cairo-arc.c d/src/cairo-arc.c
+--- c/src/cairo-arc.c	2023-10-25 08:30:04.502179244 +0800
++++ d/src/cairo-arc.c	2023-10-25 08:30:25.122179639 +0800
+@@ -191,7 +191,8 @@
+     if (! ISFINITE (angle_max) || ! ISFINITE (angle_min))
          return;
  
 -    assert (angle_max >= angle_min);
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
similarity index 68%
rename from meta/recipes-graphics/cairo/cairo_1.16.0.bb
rename to meta/recipes-graphics/cairo/cairo_1.18.0.bb
index ffb813d290..a1efc82d45 100644
--- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.18.0.bb
@@ -30,47 +30,28 @@ DEPENDS = "fontconfig glib-2.0 libpng pixman zlib"
 
 SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz \
            file://cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff \
-           file://CVE-2018-19876.patch \
            file://CVE-2019-6461.patch \
-           file://CVE-2019-6462.patch \
-           file://CVE-2020-35492.patch \
           "
 
-SRC_URI[md5sum] = "f19e0353828269c22bd72e271243a552"
-SRC_URI[sha256sum] = "5e7b29b3f113ef870d1e3ecf8adf21f923396401604bda16d44be45e66052331"
+SRC_URI[md5sum] = "3f0685fbadc530606f965b9645bb51d9"
+SRC_URI[sha256sum] = "243a0736b978a33dee29f9cca7521733b78a65b5418206fef7bd1c3d4cf10b64"
 
-inherit autotools pkgconfig upstream-version-is-even gtk-doc multilib_script
+inherit meson pkgconfig
+EXTRA_OEMESON = "-Dglib=enabled -Dpng=enabled -Dfontconfig=enabled -Dzlib=enabled"
 
 MULTILIB_SCRIPTS = "${PN}-perf-utils:${bindir}/cairo-trace"
 
 X11DEPENDS = "virtual/libx11 libsm libxrender libxext"
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'opengl', '', d)} \
-                   trace"
+PACKAGECONFIG ??= " \
+	${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)} \
+"
+
 PACKAGECONFIG:class-native = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)}"
 PACKAGECONFIG:class-nativesdk = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)}"
 
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
+PACKAGECONFIG[x11] = "-Dxlib=enabled,-Dxlib=disabled,${X11DEPENDS}"
+PACKAGECONFIG[xcb] = "-Dxcb=enabled,-Dxcb=disabled,libxcb"
 
 do_install:append () {
 	rm -rf ${D}${bindir}/cairo-sphinx
@@ -96,7 +77,7 @@ to replay rendering."
 
 DESCRIPTION:cairo-perf-utils = "The Cairo library performance utilities"
 
-FILES:${PN} = "${libdir}/libcairo.so.*"
+FILES:${PN} = "${libdir}/libcairo.so.* ${libdir}/cairo/libcairo-fdr.so*"
 FILES:${PN}-gobject = "${libdir}/libcairo-gobject.so.*"
 FILES:${PN}-script-interpreter = "${libdir}/libcairo-script-interpreter.so.*"
 FILES:${PN}-perf-utils = "${bindir}/cairo-trace* ${libdir}/cairo/*.la ${libdir}/cairo/libcairo-trace.so"
-- 
2.25.1


