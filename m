Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6DEEF71C32
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 15:27:50 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 01 Nov 2016 08:27:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,580,1473145200"; d="scan'208";a="780876146"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 01 Nov 2016 08:27:51 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Nov 2016 17:25:09 +0200
Message-Id: <47b2d44d4d203099d12fa368fe205ddec33a5711.1478013701.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
References: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
References: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 02/13] ffmpeg: update to 3.2
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
X-List-Received-Date: Tue, 01 Nov 2016 15:27:50 -0000

Drop faac package config as upstream ./configure doesn't have it anymore.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-multimedia/ffmpeg/{ffmpeg_3.1.4.bb => ffmpeg_3.2.bb} | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_3.1.4.bb => ffmpeg_3.2.bb} (95%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.1.4.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.bb
similarity index 95%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_3.1.4.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.bb
index 06e7a306..1091952 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.1.4.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.bb
@@ -16,8 +16,8 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://mips64_cpu_detection.patch \
           "
-SRC_URI[md5sum] = "b54d3e3d2d14d64305b840bb3d287445"
-SRC_URI[sha256sum] = "a80cb378dda5c9bbcdbd62a99bdec0e4eedbcb47f290e72845af4855c1146b5b"
+SRC_URI[md5sum] = "3c065fb5baae1aeb1494a09ac984b2de"
+SRC_URI[sha256sum] = "88f70c1b8cab108f494ecbab5ba302cdb35d59a84cea88008b5fe49be068d5da"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET = "arm"
@@ -46,7 +46,6 @@ PACKAGECONFIG[avresample] = "--enable-avresample,--disable-avresample"
 
 # features to support
 PACKAGECONFIG[bzlib] = "--enable-bzlib,--disable-bzlib,bzip2"
-PACKAGECONFIG[faac] = "--enable-libfaac,--disable-libfaac,faac"
 PACKAGECONFIG[gpl] = "--enable-gpl,--disable-gpl"
 PACKAGECONFIG[gsm] = "--enable-libgsm,--disable-libgsm,libgsm"
 PACKAGECONFIG[jack] = "--enable-indev=jack,--disable-indev=jack,jack"
@@ -64,7 +63,7 @@ PACKAGECONFIG[x264] = "--enable-libx264,--disable-libx264,x264"
 PACKAGECONFIG[xv] = "--enable-outdev=xv,--disable-outdev=xv,libxv"
 
 # Check codecs that require --enable-nonfree
-USE_NONFREE = "${@bb.utils.contains_any('PACKAGECONFIG', [ 'faac', 'openssl' ], 'yes', '', d)}"
+USE_NONFREE = "${@bb.utils.contains_any('PACKAGECONFIG', [ 'openssl' ], 'yes', '', d)}"
 
 EXTRA_OECONF = " \
     --disable-stripping \
-- 
2.10.1


