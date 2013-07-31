Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E14F16A5AF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 13:10:14 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 31 Jul 2013 06:10:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,787,1367996400"; d="scan'208";a="354884335"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 31 Jul 2013 06:10:01 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jul 2013 16:09:45 +0300
Message-Id: <2884de293d7efaa782eb11fbdfd01a3c98cb32e1.1375275560.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1375275560.git.laurentiu.palcu@intel.com>
References: <cover.1375275560.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1375275560.git.laurentiu.palcu@intel.com>
References: <cover.1375275560.git.laurentiu.palcu@intel.com>
Subject: [PATCH 01/13] xf86-video-intel: upgrade to 2.21.13
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
X-List-Received-Date: Wed, 31 Jul 2013 13:10:15 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...intel_2.21.9.bb => xf86-video-intel_2.21.13.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-intel_2.21.9.bb => xf86-video-intel_2.21.13.bb} (85%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.9.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.13.bb
similarity index 85%
rename from meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.9.bb
rename to meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.13.bb
index 6112089..9817049 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.9.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.13.bb
@@ -21,5 +21,5 @@ EXTRA_OECONF += '${@base_conditional( "ROOTLESS_X", "1", " --enable-kms-only", "
 
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
-SRC_URI[md5sum] = "fd96651b0d90dc7e977b23fd54f2c3e8"
-SRC_URI[sha256sum] = "1359cbc9e494a284faa52d1db83e7388cb8ab590b660e29e78e6e7f5ee7ff189"
+SRC_URI[md5sum] = "018154293ea25b69568ff0340a89ae7c"
+SRC_URI[sha256sum] = "76e17cebf79d3c3c98af246fcfb55018aa12e2d56fe5f3b6d54b93e90837efa8"
-- 
1.7.9.5


