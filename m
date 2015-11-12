Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 766A77726A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 19:57:23 +0000 (UTC)
Received: by wmww144 with SMTP id w144so1990059wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 11:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fSRzYnkru7syybZwgBAOcB4EJ1vKQ9G7Tjh4mU5+7cw=;
	b=h5UGL/BUUjOiSAU03XS5z/u9La3X9Eu9+JfmjgRwfA2xRbXoCoziALTNqCGM0nDCTP
	vHJNXc7/5LkHh7iqajL/z0eCzpmTRCvT7l4IbK55TR3l5O/S8oT6NkQOiGQmpo5qiruX
	dgqJF2rBgkJfi8RuvJ8i+E/cVyT0Mj6OcB2kRc/ATDtZLLKNHu0SzEbqTic8aNryHya+
	glbBqwBmeJLuDSzv+FTL1eQhkgemy2/cIEsJQ5jITS5mThEfZtAOFiUJt3GJyBilpGg7
	JDgPv0IVDpKsrQtvsM8Hxaj7l2fBKuUaWR+v+ROu7OnBiEhIEtnbwuirGdcPBlaGaQyO
	dyrw==
X-Received: by 10.28.148.133 with SMTP id w127mr16048068wmd.92.1447358243369; 
	Thu, 12 Nov 2015 11:57:23 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	bh5sm16103897wjb.42.2015.11.12.11.57.22
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Nov 2015 11:57:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Nov 2015 20:57:34 +0100
Message-Id: <1447358254-5676-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447358254-5676-1-git-send-email-Martin.Jansa@gmail.com>
References: <1447358254-5676-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][master][jethro 4/4] gst-plugins-bad: add PACKAGECONFIGs for voamrwbenc, voaacenc, resindvd
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
X-List-Received-Date: Thu, 12 Nov 2015 19:57:23 -0000

* allows to easily enable them and fixes:
WARNING: QA Issue: gstreamer1.0-plugins-bad: Files/directories were installed but not shipped in any package:
  /usr/share/gstreamer-1.0
  /usr/share/gstreamer-1.0/presets
  /usr/share/gstreamer-1.0/presets/GstVoAmrwbEnc.prs
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
gstreamer1.0-plugins-bad: 3 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index 3b32c49..c6c85f1 100644
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
2.6.3


