Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3E1B27001D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2016 08:06:37 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 28 Jun 2016 01:06:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,540,1459839600"; d="scan'208";a="129745436"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 28 Jun 2016 01:06:27 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jun 2016 11:06:12 +0300
Message-Id: <1467101180-23116-2-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1467101180-23116-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1467101180-23116-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 02/10] ffmpeg: update to 3.1
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
X-List-Received-Date: Tue, 28 Jun 2016 08:06:37 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-multimedia/ffmpeg/{ffmpeg_3.0.2.bb => ffmpeg_3.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_3.0.2.bb => ffmpeg_3.1.bb} (97%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.0.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.1.bb
similarity index 97%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_3.0.2.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_3.1.bb
index 17a6562..2d83ef0 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.0.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.1.bb
@@ -15,8 +15,8 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz"
 
-SRC_URI[md5sum] = "beb5c69c671aba1386e7156fc2af1ab6"
-SRC_URI[sha256sum] = "82943cc7b0c4d14b612404de0dd7b24cd8ca3511d51e4fd3ae36b2d71bb95223"
+SRC_URI[md5sum] = "24ef0c0d541c857c8bc39215619b126f"
+SRC_URI[sha256sum] = "919022430e2dad782fabccffdd6c4cae4e7029f84f0701aa662f036a9ca65423"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET = "arm"
-- 
2.8.1


