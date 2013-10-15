Return-Path: <laurentiu.palcu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 842FE6D141
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 12:46:17 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Oct 2013 05:46:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,498,1378882800"; d="scan'208";a="417091206"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by fmsmga002.fm.intel.com with ESMTP; 15 Oct 2013 05:46:18 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Oct 2013 15:46:04 +0300
Message-Id: <a541852768c3569348628af6954d35a02cbbb693.1381841061.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1381841061.git.laurentiu.palcu@intel.com>
References: <cover.1381841061.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1381841061.git.laurentiu.palcu@intel.com>
References: <cover.1381841061.git.laurentiu.palcu@intel.com>
Subject: [PATCH 07/10] xf86-video-intel: upgrade to 2.21.15
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
X-List-Received-Date: Tue, 15 Oct 2013 12:46:17 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...ntel_2.21.13.bb => xf86-video-intel_2.21.15.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-intel_2.21.13.bb => xf86-video-intel_2.21.15.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.13.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.15.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.13.bb
rename to meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.15.bb
index 3e30936..828cae8 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.13.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.15.bb
@@ -26,5 +26,5 @@ EXTRA_OECONF += '${@base_conditional( "ROOTLESS_X", "1", " --enable-kms-only", "
 
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
-SRC_URI[md5sum] = "018154293ea25b69568ff0340a89ae7c"
-SRC_URI[sha256sum] = "76e17cebf79d3c3c98af246fcfb55018aa12e2d56fe5f3b6d54b93e90837efa8"
+SRC_URI[md5sum] = "8b646d257ace8197d6ab4e5ddeb8efb2"
+SRC_URI[sha256sum] = "7d5a140f82a72fd1cbc8a664d66c3d4eca47ee240ca4927b8a98d7af6f65d6fc"
-- 
1.7.9.5


