Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AA04760722
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 15:09:17 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP; 19 Oct 2016 08:09:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,514,1473145200"; d="scan'208";a="21266949"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 19 Oct 2016 08:09:18 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Oct 2016 18:06:44 +0300
Message-Id: <2995e9ec5eeadb8b780f1b0393f839666df87b45.1476888929.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
References: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
References: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 09/19] ffmpeg: update to 3.1.4
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
X-List-Received-Date: Wed, 19 Oct 2016 15:09:17 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-multimedia/ffmpeg/{ffmpeg_3.1.3.bb => ffmpeg_3.1.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_3.1.3.bb => ffmpeg_3.1.4.bb} (97%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.1.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.1.4.bb
similarity index 97%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_3.1.3.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_3.1.4.bb
index 050f1ee..06e7a306 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.1.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.1.4.bb
@@ -16,8 +16,8 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://mips64_cpu_detection.patch \
           "
-SRC_URI[md5sum] = "72769316a4b2b8809c7f6d5a8b6766f4"
-SRC_URI[sha256sum] = "f8575c071e2a64437aeb70c8c030b385cddbe0b5cde20c9b18a6def840128822"
+SRC_URI[md5sum] = "b54d3e3d2d14d64305b840bb3d287445"
+SRC_URI[sha256sum] = "a80cb378dda5c9bbcdbd62a99bdec0e4eedbcb47f290e72845af4855c1146b5b"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET = "arm"
-- 
2.9.3


