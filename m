Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 563F76FFFE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Dec 2015 07:14:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tBS7Es7G024181
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Dec 2015 23:14:54 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 27 Dec 2015 23:14:53 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 27 Dec 2015 23:14:16 -0800
Message-ID: <7d45881da23dca70334400f556ed198126190cea.1451286789.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1451286789.git.liezhi.yang@windriver.com>
References: <cover.1451286789.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 08/40] gst-plugins-bad: add PACKAGECONFIGs for voamrwbenc, voaacenc, resindvd
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
X-List-Received-Date: Mon, 28 Dec 2015 07:14:53 -0000
Content-Type: text/plain

From: Martin Jansa <Martin.Jansa@gmail.com>

* allows to easily enable them and fixes:
WARNING: QA Issue: gstreamer1.0-plugins-bad: Files/directories were installed but not shipped in any package:
  /usr/share/gstreamer-1.0
  /usr/share/gstreamer-1.0/presets
  /usr/share/gstreamer-1.0/presets/GstVoAmrwbEnc.prs
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
gstreamer1.0-plugins-bad: 3 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad.inc         |   11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index d7aefec..b4f01af 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -55,6 +55,9 @@ PACKAGECONFIG[sndfile]         = "--enable-sndfile,--disable-sndfile,libsndfile1
 PACKAGECONFIG[webp]            = "--enable-webp,--disable-webp,libwebp"
 PACKAGECONFIG[rtmp]            = "--enable-rtmp,--disable-rtmp,rtmpdump"
 PACKAGECONFIG[libssh2]         = "--enable-libssh2,--disable-libssh2,libssh2"
+PACKAGECONFIG[voamrwbenc]      = "--enable-voamrwbenc,--disable-voamrwbenc,vo-amrwbenc"
+PACKAGECONFIG[voaacenc]        = "--enable-voaacenc,--disable-voaacenc,vo-aacenc"
+PACKAGECONFIG[resindvd]        = "--enable-resindvd,--disable-resindvd,libdvdnav libdvdread"
 
 # these plugins have not been ported to 1.0 (yet):
 #   directdraw vcd apexsink dc1394 lv2 linsys musepack mythtv
@@ -66,8 +69,8 @@ PACKAGECONFIG[libssh2]         = "--enable-libssh2,--disable-libssh2,libssh2"
 # these plugins have no corresponding library in OE-core or meta-openembedded:
 #   openni2 winks direct3d directdraw directsound winscreencap osx_video
 #   apple_media android_media avc chromaprint daala dts gme gsm kate ladspa mimic
-#   mpeg2enc mplex ofa openjpeg opensles pvr resindvd rtmp soundtouch spandsp spc
-#   srtp vdpau voaacenc voamrwbenc wasapi zbar
+#   mpeg2enc mplex ofa openjpeg opensles pvr rtmp soundtouch spandsp spc
+#   srtp vdpau wasapi zbar
 
 EXTRA_OECONF += " \
     --enable-dvb \
@@ -106,7 +109,6 @@ EXTRA_OECONF += " \
     --disable-osx_video \
     --disable-pvr \
     --disable-quicktime \
-    --disable-resindvd \
     --disable-sdl \
     --disable-sdltest \
     --disable-sndio \
@@ -118,8 +120,6 @@ EXTRA_OECONF += " \
     --disable-timidity \
     --disable-vcd \
     --disable-vdpau \
-    --disable-voaacenc \
-    --disable-voamrwbenc \
     --disable-wasapi \
     --disable-wildmidi \
     --disable-wininet \
@@ -133,3 +133,4 @@ ARM_INSTRUCTION_SET = "arm"
 
 FILES_gstreamer1.0-plugins-bad-opencv += "${datadir}/gst-plugins-bad/1.0/opencv*"
 
+FILES_${PN}-voamrwbenc += "${datadir}/gstreamer-${LIBV}/presets/GstVoAmrwbEnc.prs"
-- 
1.7.9.5


