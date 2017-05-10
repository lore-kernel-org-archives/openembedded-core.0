Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D55F771A2D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 09:35:23 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 May 2017 02:35:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,318,1491289200"; d="scan'208";a="85649660"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 10 May 2017 02:35:24 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 May 2017 12:35:19 +0300
Message-Id: <20170510093529.6651-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 01/11] ffmpeg: update to 3.3
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
X-List-Received-Date: Wed, 10 May 2017 09:35:24 -0000

--enabled-x11grab option has been removed upstream
(and it was described as 'legacy' in the previous version)

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-multimedia/ffmpeg/{ffmpeg_3.2.4.bb => ffmpeg_3.3.bb} | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_3.2.4.bb => ffmpeg_3.3.bb} (95%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.4.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.bb
similarity index 95%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.4.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.bb
index 3216f8eb00e..c2b570e85cf 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.4.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.bb
@@ -26,8 +26,8 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://mips64_cpu_detection.patch \
           "
-SRC_URI[md5sum] = "39fd71024ac76ba35f04397021af5606"
-SRC_URI[sha256sum] = "6e38ff14f080c98b58cf5967573501b8cb586e3a173b591f3807d8f0660daf7a"
+SRC_URI[md5sum] = "368f1fff4bdadaf2823934cc0aadd71d"
+SRC_URI[sha256sum] = "599e7f7c017221c22011c4037b88bdcd1c47cd40c1e466838bc3c465f3e9569d"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET = "arm"
@@ -42,7 +42,7 @@ inherit autotools pkgconfig
 
 PACKAGECONFIG ??= "avdevice avfilter avcodec avformat swresample swscale postproc \
                    bzlib gpl lzma theora x264 \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xv', '', d)}"
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xv', '', d)}"
 
 # libraries to build in addition to avutil
 PACKAGECONFIG[avdevice] = "--enable-avdevice,--disable-avdevice"
@@ -69,7 +69,6 @@ PACKAGECONFIG[theora] = "--enable-libtheora,--disable-libtheora,libtheora"
 PACKAGECONFIG[vaapi] = "--enable-vaapi,--disable-vaapi,libva"
 PACKAGECONFIG[vdpau] = "--enable-vdpau,--disable-vdpau,libvdpau"
 PACKAGECONFIG[vpx] = "--enable-libvpx,--disable-libvpx,libvpx"
-PACKAGECONFIG[x11] = "--enable-x11grab,--disable-x11grab,virtual/libx11 libxfixes libxext xproto virtual/libsdl"
 PACKAGECONFIG[x264] = "--enable-libx264,--disable-libx264,x264"
 PACKAGECONFIG[xv] = "--enable-outdev=xv,--disable-outdev=xv,libxv"
 
-- 
2.11.0


