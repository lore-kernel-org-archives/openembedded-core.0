Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 922A5730FD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 14:52:28 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2017 06:52:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,194,1484035200"; d="scan'208";a="51302204"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 22 Feb 2017 06:52:29 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 16:51:11 +0200
Message-Id: <fbbd542f5bfdd5110369b840e7b4298dc033f4c1.1487774787.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1487774787.git.alexander.kanavin@linux.intel.com>
References: <cover.1487774787.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 16/24] ffmpeg: update to 3.2.4
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
X-List-Received-Date: Wed, 22 Feb 2017 14:52:29 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-multimedia/ffmpeg/{ffmpeg_3.2.2.bb => ffmpeg_3.2.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_3.2.2.bb => ffmpeg_3.2.4.bb} (97%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.4.bb
similarity index 97%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.4.bb
index c376d82dfc6..6f37106a84f 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.4.bb
@@ -16,8 +16,8 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://mips64_cpu_detection.patch \
           "
-SRC_URI[md5sum] = "e34d1b92c5d844f2a3611c741a6dba18"
-SRC_URI[sha256sum] = "3f01bd1fe1a17a277f8c84869e5d9192b4b978cb660872aa2b54c3cc8a2fedfc"
+SRC_URI[md5sum] = "39fd71024ac76ba35f04397021af5606"
+SRC_URI[sha256sum] = "6e38ff14f080c98b58cf5967573501b8cb586e3a173b591f3807d8f0660daf7a"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET = "arm"
-- 
2.11.0


