Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 14355601B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 12:28:24 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 30 Aug 2016 05:28:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,256,1470726000"; d="scan'208";a="1033127033"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.49])
	by fmsmga001.fm.intel.com with ESMTP; 30 Aug 2016 05:28:24 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Aug 2016 15:26:52 +0300
Message-Id: <20160830122653.16162-2-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160830122653.16162-1-alexander.kanavin@linux.intel.com>
References: <20160830122653.16162-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/3] ffmpeg: update to 3.1.3
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
X-List-Received-Date: Tue, 30 Aug 2016 12:28:24 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-multimedia/ffmpeg/{ffmpeg_3.1.2.bb => ffmpeg_3.1.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_3.1.2.bb => ffmpeg_3.1.3.bb} (97%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.1.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.1.3.bb
similarity index 97%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_3.1.2.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_3.1.3.bb
index 6aad18e..050f1ee 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.1.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.1.3.bb
@@ -16,8 +16,8 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://mips64_cpu_detection.patch \
           "
-SRC_URI[md5sum] = "cf030109b066a336fc4f7d3a123abf66"
-SRC_URI[sha256sum] = "58d2a2b69f0f46fe8aacd45e582c62e380ba611b5baf6a4dfcf2906eb2b9bd61"
+SRC_URI[md5sum] = "72769316a4b2b8809c7f6d5a8b6766f4"
+SRC_URI[sha256sum] = "f8575c071e2a64437aeb70c8c030b385cddbe0b5cde20c9b18a6def840128822"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET = "arm"
-- 
2.9.3


