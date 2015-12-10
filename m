Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 9CE266FFD4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 13:47:01 +0000 (UTC)
Received: by wmww144 with SMTP id w144so25411757wmw.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 05:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=YrLJYiVEMoJITdsA5MuEqMnUjTZOJ3IbSahmAcamgHw=;
	b=AgqN13+9SleSrjSXlwKBB5/8l6JkygzX1LH8NnToNxoJcesdLBQVZB7h1OYSnoPOoY
	1Y3Emp9sIqhwmjJ7V1PFeyYd/PaEscMxXvVTk+Ymq2uh/TBSJjlKvieELVm+CFyShUPo
	8Jo0SY1P+OnHGiyginVyOCZxdwwR3Bn7hqGlaH756QY8RjHCChtZOBYhzDLmTVwDqDFE
	g+GbdsmikkgkDXdmJxQZ0ghjs+kFoc2cMPeHwYTPFIo9MYRYuC8oj550YpJzddg95bxL
	Z+ej4ynfyjG5qEpHx9CB5GcJ8MrZY6fbQX3V5TSmrOdlnf1M8D/s9GlKuy8CIlq1goRJ
	ikSg==
X-Received: by 10.28.148.147 with SMTP id w141mr19587623wmd.14.1449755222098; 
	Thu, 10 Dec 2015 05:47:02 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	lx4sm12514526wjb.5.2015.12.10.05.47.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Dec 2015 05:47:01 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2015 14:48:29 +0100
Message-Id: <1449755316-17611-8-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1449754341.git.Martin.Jansa@gmail.com>
References: <cover.1449754341.git.Martin.Jansa@gmail.com>
Subject: [PATCH 08/11] gst-plugins-bad: add PACKAGECONFIGs for voamrwbenc, voaacenc, resindvd
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
X-List-Received-Date: Thu, 10 Dec 2015 13:47:02 -0000

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
2.6.3


