Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 72E657001D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 07:21:03 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 12 May 2016 00:21:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,609,1455004800"; d="scan'208";a="974144501"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 12 May 2016 00:20:46 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 May 2016 10:20:25 +0300
Message-Id: <49a74ce06f12e159f76209e49aec1c1d9edd16ad.1463035854.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <93f1600d7ce782dbafb1ab32da9416dc29d432c2.1463035854.git.jussi.kukkonen@intel.com>
References: <93f1600d7ce782dbafb1ab32da9416dc29d432c2.1463035854.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1463035854.git.jussi.kukkonen@intel.com>
References: <cover.1463035854.git.jussi.kukkonen@intel.com>
Subject: [PATCH 02/13] xrandr: Upgrade to 1.5.0
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
X-List-Received-Date: Thu, 12 May 2016 07:21:04 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/xorg-app/{xrandr_1.4.3.bb => xrandr_1.5.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xrandr_1.4.3.bb => xrandr_1.5.0.bb} (72%)

diff --git a/meta/recipes-graphics/xorg-app/xrandr_1.4.3.bb b/meta/recipes-graphics/xorg-app/xrandr_1.5.0.bb
similarity index 72%
rename from meta/recipes-graphics/xorg-app/xrandr_1.4.3.bb
rename to meta/recipes-graphics/xorg-app/xrandr_1.5.0.bb
index 41bd420..ea68979 100644
--- a/meta/recipes-graphics/xorg-app/xrandr_1.4.3.bb
+++ b/meta/recipes-graphics/xorg-app/xrandr_1.5.0.bb
@@ -11,5 +11,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fe1608bdb33cf8c62a4438f7d34679b3"
 DEPENDS += "libxrandr libxrender"
 PE = "1"
 
-SRC_URI[md5sum] = "441fdb98d2abc6051108b7075d948fc7"
-SRC_URI[sha256sum] = "7154ac3486b86923692f2d6cdb2991a2ee72bc32af2c4379a6f1c068f204be1b"
+SRC_URI[md5sum] = "ebffac98021b8f1dc71da0c1918e9b57"
+SRC_URI[sha256sum] = "c1cfd4e1d4d708c031d60801e527abc9b6d34b85f2ffa2cadd21f75ff38151cd"
-- 
2.1.4


