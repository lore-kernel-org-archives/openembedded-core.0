Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id F353D60939
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Aug 2017 11:48:30 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Aug 2017 04:48:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,337,1498546800"; d="scan'208";a="136607113"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 07 Aug 2017 04:48:31 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Aug 2017 14:45:01 +0300
Message-Id: <20170807114504.28410-4-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170807114504.28410-1-alexander.kanavin@linux.intel.com>
References: <20170807114504.28410-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 4/7] ffmpeg: update to 3.3.3
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
X-List-Received-Date: Mon, 07 Aug 2017 11:48:31 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-multimedia/ffmpeg/{ffmpeg_3.3.2.bb => ffmpeg_3.3.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_3.3.2.bb => ffmpeg_3.3.3.bb} (97%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.3.bb
similarity index 97%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.2.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.3.bb
index 3c183674118..b4de97300d2 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.3.bb
@@ -27,8 +27,8 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://mips64_cpu_detection.patch \
            file://0001-build-fix-for-mips.patch \
           "
-SRC_URI[md5sum] = "d6c09c84e3d0d9ca8a51f481da660603"
-SRC_URI[sha256sum] = "1998de1ab32616cbf2ff86efc3f1f26e76805ec5dc51e24c041c79edd8262785"
+SRC_URI[md5sum] = "743dc66ebe67180283b92d029f690d0f"
+SRC_URI[sha256sum] = "d2a9002cdc6b533b59728827186c044ad02ba64841f1b7cd6c21779875453a1e"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET = "arm"
-- 
2.13.2


