Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 98D706B457
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 13:10:20 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 31 Jul 2013 06:10:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,787,1367996400"; d="scan'208";a="354884507"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 31 Jul 2013 06:10:14 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jul 2013 16:09:54 +0300
Message-Id: <9951a8faf6529428b7929e1e3b20c8fad2c1984a.1375275560.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1375275560.git.laurentiu.palcu@intel.com>
References: <cover.1375275560.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1375275560.git.laurentiu.palcu@intel.com>
References: <cover.1375275560.git.laurentiu.palcu@intel.com>
Subject: [PATCH 10/13] xhost: upgrade to 1.0.6
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
X-List-Received-Date: Wed, 31 Jul 2013 13:10:21 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../xorg-app/{xhost_1.0.5.bb => xhost_1.0.6.bb}    |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xhost_1.0.5.bb => xhost_1.0.6.bb} (79%)

diff --git a/meta/recipes-graphics/xorg-app/xhost_1.0.5.bb b/meta/recipes-graphics/xorg-app/xhost_1.0.6.bb
similarity index 79%
rename from meta/recipes-graphics/xorg-app/xhost_1.0.5.bb
rename to meta/recipes-graphics/xorg-app/xhost_1.0.6.bb
index 6dc97a1..aba33f0 100644
--- a/meta/recipes-graphics/xorg-app/xhost_1.0.5.bb
+++ b/meta/recipes-graphics/xorg-app/xhost_1.0.6.bb
@@ -11,8 +11,7 @@ protocol for passing other authentication data to the server."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=8fbed71dddf48541818cef8079124199"
 DEPENDS += "libxmu libxau"
-PR = "${INC_PR}.0"
 PE = "1"
 
-SRC_URI[md5sum] = "a0fcd2cb6ddd9f378944cc6f4f83cd7c"
-SRC_URI[sha256sum] = "2870d19f3f4867ead5ba4e35bb73d1fa302be29d812c13e4195066c78d1f8850"
+SRC_URI[md5sum] = "f1669af1fe0554e876f03319c678e79d"
+SRC_URI[sha256sum] = "a6f5b922df0a7be5d3ba43f525fa8e69c539c738418f013a0b7adaa423a89dc2"
-- 
1.7.9.5


