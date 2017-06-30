Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 52BC878290
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 14:56:13 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Jun 2017 07:56:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,286,1496127600"; d="scan'208";a="280669531"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 30 Jun 2017 07:56:14 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 93DD6580565
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 07:56:14 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Jun 2017 17:56:16 +0300
Message-Id: <1498834581-12279-7-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1498834581-12279-1-git-send-email-maxin.john@intel.com>
References: <1498834581-12279-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 06/11] gstreamer1.0-plugins-ugly: upgrade 1.10.4 -> 1.12.1
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
X-List-Received-Date: Fri, 30 Jun 2017 14:56:13 -0000

libmad support is not present anymore.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc       | 1 -
 ...1.0-plugins-ugly_1.10.4.bb => gstreamer1.0-plugins-ugly_1.12.1.bb} | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.10.4.bb => gstreamer1.0-plugins-ugly_1.12.1.bb} (76%)

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
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.12.1.bb
similarity index 76%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.10.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.12.1.bb
index 92a2caa..fb6cc90 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.12.1.bb
@@ -7,7 +7,7 @@ SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
 "
-SRC_URI[md5sum] = "c68d0509c9980b0b70a4b836ff73fff1"
-SRC_URI[sha256sum] = "6386c77ca8459cba431ed0b63da780c7062c7cc48055d222024d8eaf198ffa59"
+SRC_URI[md5sum] = "101a9d1613c16889df43f00d859c954a"
+SRC_URI[sha256sum] = "8fc2123d059713a34fa5d0a26641fb8158f52f6766633d2db7a661adc88e1069"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
-- 
2.4.0


