Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CBEB672EA2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 07:52:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w3P7qGiF021633
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 00:52:16 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Wed, 25 Apr 2018 00:52:15 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Apr 2018 15:23:20 +0800
Message-ID: <98a1ee742eccb2c400e3e5092af0f56a42d999c8.1524640773.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1524640773.git.kai.kang@windriver.com>
References: <cover.1524640773.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2 4/8] gstreamer1.0-plugins-ugly: 1.12.4 -> 1.14.0
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
X-List-Received-Date: Wed, 25 Apr 2018 07:52:15 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade gstreamer1.0-plugins-ugly from 1.12.4 to 1.14.0.

* move packageconfigs 'lame', 'mpg123' and configure options
  '--disable-twolame' to -good that plugins have been moved to -good

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc      | 5 +----
 ....0-plugins-ugly_1.12.4.bb => gstreamer1.0-plugins-ugly_1.14.0.bb} | 4 ++--
 2 files changed, 3 insertions(+), 6 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.12.4.bb => gstreamer1.0-plugins-ugly_1.14.0.bb} (76%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
index 60aa968c95..31f02df3c1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
@@ -9,7 +9,7 @@ inherit gettext
 
 PACKAGECONFIG ??= " \
     ${GSTREAMER_ORC} \
-    a52dec lame mpg123 mpeg2dec \
+    a52dec mpeg2dec \
 "
 
 PACKAGECONFIG[a52dec]   = "--enable-a52dec,--disable-a52dec,liba52"
@@ -17,14 +17,11 @@ PACKAGECONFIG[amrnb]    = "--enable-amrnb,--disable-amrnb,opencore-amr"
 PACKAGECONFIG[amrwb]    = "--enable-amrwb,--disable-amrwb,opencore-amr"
 PACKAGECONFIG[cdio]     = "--enable-cdio,--disable-cdio,libcdio"
 PACKAGECONFIG[dvdread]  = "--enable-dvdread,--disable-dvdread,libdvdread"
-PACKAGECONFIG[lame]     = "--enable-lame,--disable-lame,lame"
 PACKAGECONFIG[mpeg2dec] = "--enable-mpeg2dec,--disable-mpeg2dec,mpeg2dec"
-PACKAGECONFIG[mpg123]   = "--enable-mpg123,--disable-mpg123,mpg123"
 PACKAGECONFIG[x264]     = "--enable-x264,--disable-x264,x264"
 
 EXTRA_OECONF += " \
     --disable-sidplay \
-    --disable-twolame \
 "
 
 FILES_${PN}-amrnb += "${datadir}/gstreamer-1.0/presets/GstAmrnbEnc.prs"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.12.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.14.0.bb
similarity index 76%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.12.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.14.0.bb
index f8333519e9..24904fdd1f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.12.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.14.0.bb
@@ -7,7 +7,7 @@ SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
 "
-SRC_URI[md5sum] = "e2b836fb2747f6ae3a1a6f33a9d8c952"
-SRC_URI[sha256sum] = "1c165b8d888ed350acd8e6ac9f6fe06508e6fcc0a3afc6ccc9fbeb30df9be522"
+SRC_URI[md5sum] = "bcb1f8d9339176aee2b5da2a9cb2df88"
+SRC_URI[sha256sum] = "3fb9ea5fc8a2de4b3eaec4128d71c6a2d81dd19befe1cd87cb833b98bcb542d1"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
-- 
2.14.1


