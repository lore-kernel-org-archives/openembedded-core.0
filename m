Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 528E8784E7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 14:58:17 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Nov 2017 06:58:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,395,1505804400"; d="scan'208";a="173402294"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 14 Nov 2017 06:58:17 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 16:57:53 +0200
Message-Id: <20171114145754.9643-26-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171114145754.9643-1-alexander.kanavin@linux.intel.com>
References: <20171114145754.9643-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 26/27] ffmpeg: update to 3.4
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
X-List-Received-Date: Tue, 14 Nov 2017 14:58:17 -0000

Schroedinger support has been dropped:
https://git.ffmpeg.org/gitweb/ffmpeg.git/commitdiff/220b24c7c9

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-multimedia/ffmpeg/{ffmpeg_3.3.4.bb => ffmpeg_3.4.bb} | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_3.3.4.bb => ffmpeg_3.4.bb} (95%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.4.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.4.bb
similarity index 95%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.4.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_3.4.bb
index 57e0ac04115..42dbe5582f3 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.4.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.4.bb
@@ -25,10 +25,9 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://mips64_cpu_detection.patch \
-           file://0001-build-fix-for-mips.patch \
-          "
-SRC_URI[md5sum] = "e14a0200c78ce5c918427e57cd406a0d"
-SRC_URI[sha256sum] = "98b97e1b908dfeb6aeb6d407e5a5eacdfc253a40c2d195f5867ed2d1d46ea957"
+           "
+SRC_URI[md5sum] = "c64ba7247bb91e516f6a5789348fd5b5"
+SRC_URI[sha256sum] = "aeee06e4d8b18d852c61ebbfe5e1bb7014b1e118e8728c1c2115f91e51bffbef"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET = "arm"
@@ -64,7 +63,6 @@ PACKAGECONFIG[libvorbis] = "--enable-libvorbis,--disable-libvorbis,libvorbis"
 PACKAGECONFIG[lzma] = "--enable-lzma,--disable-lzma,xz"
 PACKAGECONFIG[mp3lame] = "--enable-libmp3lame,--disable-libmp3lame,lame"
 PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
-PACKAGECONFIG[schroedinger] = "--enable-libschroedinger,--disable-libschroedinger,schroedinger"
 PACKAGECONFIG[sdl2] = "--enable-sdl2,--disable-sdl2,virtual/libsdl2"
 PACKAGECONFIG[speex] = "--enable-libspeex,--disable-libspeex,speex"
 PACKAGECONFIG[theora] = "--enable-libtheora,--disable-libtheora,libtheora"
-- 
2.15.0


