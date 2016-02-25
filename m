Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id ED6996E64A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 16:03:06 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 25 Feb 2016 08:02:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,498,1449561600"; d="scan'208";a="659220085"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Feb 2016 08:02:26 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Feb 2016 17:59:22 +0200
Message-Id: <7f4eb7cafac54b53e3c7119e89b700bc38135a23.1456415870.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
References: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
References: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 05/19] ffmpeg: update to 3.0
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
X-List-Received-Date: Thu, 25 Feb 2016 16:03:07 -0000

Also, enforce arm instruction set (thumb is causing build failures)

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-multimedia/ffmpeg/{ffmpeg_2.8.6.bb => ffmpeg_3.0.bb} | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_2.8.6.bb => ffmpeg_3.0.bb} (94%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.6.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.0.bb
similarity index 94%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.6.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_3.0.bb
index 72393b3..3f0cbf8 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.6.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.0.bb
@@ -15,8 +15,11 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz"
 
-SRC_URI[md5sum] = "0cff5dae51375f0a31a651f986ed1534"
-SRC_URI[sha256sum] = "25bcedbdafadac3d09c325c1d46a51f53d858b26a260d5aed6b4f17fea6e07fa"
+SRC_URI[md5sum] = "ef9b6634bb7c920efc940b4d55adf7b2"
+SRC_URI[sha256sum] = "12f32cee41c74435f608c30793fd616bdf53467bb513278e273e135a4c58e470"
+
+# Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
+ARM_INSTRUCTION_SET = "arm"
 
 # Should be API compatible with libav (which was a fork of ffmpeg)
 # libpostproc was previously packaged from a separate recipe
-- 
2.7.0


