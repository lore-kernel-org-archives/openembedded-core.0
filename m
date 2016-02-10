Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 557786FFC8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 12:45:52 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 10 Feb 2016 04:45:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,425,1449561600"; d="scan'208";a="45548515"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 10 Feb 2016 04:45:52 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 14:42:39 +0200
Message-Id: <665b18beb51e5fbcfb033bdda22d7ba85b50f903.1455107972.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1455107972.git.alexander.kanavin@linux.intel.com>
References: <cover.1455107972.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1455107972.git.alexander.kanavin@linux.intel.com>
References: <cover.1455107972.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 1/7] ffmpeg: update to 2.8.6
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
X-List-Received-Date: Wed, 10 Feb 2016 12:45:52 -0000

Add libxv dependency only when libavdevice is enabled (as nothing else needs it).

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../ffmpeg/{ffmpeg_2.8.5.bb => ffmpeg_2.8.6.bb}                   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_2.8.5.bb => ffmpeg_2.8.6.bb} (94%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.5.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.6.bb
similarity index 94%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.5.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.6.bb
index 7107803..72393b3 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.5.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.6.bb
@@ -15,19 +15,19 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz"
 
-SRC_URI[md5sum] = "b34164bd181f4f81c21da3dd131d919d"
-SRC_URI[sha256sum] = "76fb83a267d2d1cb332742dadf28ad8b58af7958165f51bb1a2c226a122f0ac7"
+SRC_URI[md5sum] = "0cff5dae51375f0a31a651f986ed1534"
+SRC_URI[sha256sum] = "25bcedbdafadac3d09c325c1d46a51f53d858b26a260d5aed6b4f17fea6e07fa"
 
 # Should be API compatible with libav (which was a fork of ffmpeg)
 # libpostproc was previously packaged from a separate recipe
 PROVIDES = "libav libpostproc"
 
-DEPENDS = "alsa-lib zlib libogg yasm-native libxv"
+DEPENDS = "alsa-lib zlib libogg yasm-native"
 
 inherit autotools pkgconfig
 
 PACKAGECONFIG ??= "avdevice avfilter gpl theora x264 ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
-PACKAGECONFIG[avdevice] = "--enable-avdevice,--disable-avdevice"
+PACKAGECONFIG[avdevice] = "--enable-avdevice,--disable-avdevice, libxv"
 PACKAGECONFIG[avfilter] = "--enable-avfilter,--disable-avfilter"
 PACKAGECONFIG[faac] = "--enable-libfaac,--disable-libfaac,faac"
 PACKAGECONFIG[gpl] = "--enable-gpl,--disable-gpl"
-- 
2.7.0


