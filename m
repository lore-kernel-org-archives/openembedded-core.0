Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id E228A785DA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 21:37:10 +0000 (UTC)
Received: from localhost.localdomain (62-178-118-86.cable.dynamic.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 726E84CB59
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 23:37:11 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Aug 2017 23:36:56 +0200
Message-Id: <1502487421-18235-6-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1502487421-18235-1-git-send-email-dv@pseudoterminal.org>
References: <1502487421-18235-1-git-send-email-dv@pseudoterminal.org>
Subject: [PATCH v2 05/10] gstreamer1.0-plugins-ugly: upgrade to version 1.12.2
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
X-List-Received-Date: Fri, 11 Aug 2017 21:37:11 -0000

From: Maxin John <maxin.john@intel.com>

* libmad plugin was removed in 1.12.0, since mad is GPLed,
  unmaintained, and both gst-libav & the mpg123 plugin are
  fully functional alternatives.

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc       | 1 -
 ...1.0-plugins-ugly_1.10.4.bb => gstreamer1.0-plugins-ugly_1.12.2.bb} | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.10.4.bb => gstreamer1.0-plugins-ugly_1.12.2.bb} (76%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
index 708ad7a..60aa968 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
@@ -18,7 +18,6 @@ PACKAGECONFIG[amrwb]    = "--enable-amrwb,--disable-amrwb,opencore-amr"
 PACKAGECONFIG[cdio]     = "--enable-cdio,--disable-cdio,libcdio"
 PACKAGECONFIG[dvdread]  = "--enable-dvdread,--disable-dvdread,libdvdread"
 PACKAGECONFIG[lame]     = "--enable-lame,--disable-lame,lame"
-PACKAGECONFIG[mad]      = "--enable-mad,--disable-mad,libmad"
 PACKAGECONFIG[mpeg2dec] = "--enable-mpeg2dec,--disable-mpeg2dec,mpeg2dec"
 PACKAGECONFIG[mpg123]   = "--enable-mpg123,--disable-mpg123,mpg123"
 PACKAGECONFIG[x264]     = "--enable-x264,--disable-x264,x264"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.12.2.bb
similarity index 76%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.10.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.12.2.bb
index 92a2caa..6956c85 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.12.2.bb
@@ -7,7 +7,7 @@ SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
 "
-SRC_URI[md5sum] = "c68d0509c9980b0b70a4b836ff73fff1"
-SRC_URI[sha256sum] = "6386c77ca8459cba431ed0b63da780c7062c7cc48055d222024d8eaf198ffa59"
+SRC_URI[md5sum] = "eb639021905a32cf3013ca5bac1b694d"
+SRC_URI[sha256sum] = "1cc3942bbf3ea87da3e35437d4e014e991b103db22a6174f62a98c89c3f5f466"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
-- 
2.7.4


