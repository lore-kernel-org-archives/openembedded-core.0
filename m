Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 24443772BB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 12:48:36 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 15 Dec 2016 04:48:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,351,1477983600"; d="scan'208";a="18480816"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 15 Dec 2016 04:48:37 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Dec 2016 14:48:01 +0200
Message-Id: <7ee5f76ccc13e838162030f361e28c7401cdc3a1.1481805889.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1481805889.git.alexander.kanavin@linux.intel.com>
References: <cover.1481805889.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 08/16] ffmpeg: update to 3.2.2
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
X-List-Received-Date: Thu, 15 Dec 2016 12:48:36 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-multimedia/ffmpeg/{ffmpeg_3.2.1.bb => ffmpeg_3.2.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_3.2.1.bb => ffmpeg_3.2.2.bb} (97%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb
similarity index 97%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.1.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb
index 9ff6c67..4fac46b 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb
@@ -16,8 +16,8 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://mips64_cpu_detection.patch \
           "
-SRC_URI[md5sum] = "10eaee7cca7d1e745eec6e4217772361"
-SRC_URI[sha256sum] = "1ecf93da5d601e6fb3096c65cbe33fdaf042d690a3c50c4efadb0a9b74f2badf"
+SRC_URI[md5sum] = "e34d1b92c5d844f2a3611c741a6dba18"
+SRC_URI[sha256sum] = "3f01bd1fe1a17a277f8c84869e5d9192b4b978cb660872aa2b54c3cc8a2fedfc"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET = "arm"
-- 
2.10.2


