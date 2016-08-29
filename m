Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3EBF570057
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 14:32:07 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 29 Aug 2016 07:32:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,596,1464678000"; d="scan'208";a="1048688689"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.49])
	by fmsmga002.fm.intel.com with ESMTP; 29 Aug 2016 07:32:02 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2016 17:30:13 +0300
Message-Id: <17f0336de8edd470d7dc358d77ef47336fbfad41.1472480768.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
References: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
References: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 06/15] ffmpeg: update to 3.1.2
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
X-List-Received-Date: Mon, 29 Aug 2016 14:32:07 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-multimedia/ffmpeg/{ffmpeg_3.1.1.bb => ffmpeg_3.1.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_3.1.1.bb => ffmpeg_3.1.2.bb} (97%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.1.2.bb
similarity index 97%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_3.1.1.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_3.1.2.bb
index 8c4fed5..6aad18e 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.1.2.bb
@@ -16,8 +16,8 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://mips64_cpu_detection.patch \
           "
-SRC_URI[md5sum] = "4ba7033da5d9ac4d0391516c7e5d97e4"
-SRC_URI[sha256sum] = "71bc11f2a8202ef3fbe5e43a9a163b4b698855da39fb6216d9a4614eddd031db"
+SRC_URI[md5sum] = "cf030109b066a336fc4f7d3a123abf66"
+SRC_URI[sha256sum] = "58d2a2b69f0f46fe8aacd45e582c62e380ba611b5baf6a4dfcf2906eb2b9bd61"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET = "arm"
-- 
2.9.3


