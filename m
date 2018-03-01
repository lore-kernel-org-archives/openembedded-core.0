Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id ABF7E788B4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 14:06:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Mar 2018 06:06:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,408,1515484800"; d="scan'208";a="35134138"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 01 Mar 2018 06:06:57 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2018 16:00:47 +0200
Message-Id: <20180301140052.1388-10-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180301140052.1388-1-alexander.kanavin@linux.intel.com>
References: <20180301140052.1388-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 10/15] ffmpeg: upgrade 3.4.1 -> 3.4.2
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
X-List-Received-Date: Thu, 01 Mar 2018 14:06:56 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-multimedia/ffmpeg/{ffmpeg_3.4.1.bb => ffmpeg_3.4.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_3.4.1.bb => ffmpeg_3.4.2.bb} (97%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.4.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.4.2.bb
similarity index 97%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_3.4.1.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_3.4.2.bb
index 1837956904d..879cf7ffb94 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.4.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.4.2.bb
@@ -26,8 +26,8 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://mips64_cpu_detection.patch \
            "
-SRC_URI[md5sum] = "726212db1b8a7eff6c25a2bc2e6fa75c"
-SRC_URI[sha256sum] = "5a77278a63741efa74e26bf197b9bb09ac6381b9757391b922407210f0f991c0"
+SRC_URI[md5sum] = "cbf4ead227fcedddf54c86013705a988"
+SRC_URI[sha256sum] = "2b92e9578ef8b3e49eeab229e69305f5f4cbc1fdaa22e927fc7fca18acccd740"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET = "arm"
-- 
2.15.1


