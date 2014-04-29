Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id BE95A65D3A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Apr 2014 13:51:16 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Apr 2014 06:51:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,951,1389772800"; d="scan'208";a="531596733"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga002.jf.intel.com with ESMTP; 29 Apr 2014 06:51:13 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Apr 2014 16:29:49 +0300
Message-Id: <767542f8161597869c62bd61d3e075cd912879a4.1398775392.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1398775392.git.laurentiu.palcu@intel.com>
References: <cover.1398775392.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1398775392.git.laurentiu.palcu@intel.com>
References: <cover.1398775392.git.laurentiu.palcu@intel.com>
Subject: [PATCH 07/12] xrandr: upgrade to 1.4.2
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
X-List-Received-Date: Tue, 29 Apr 2014 13:51:16 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../xorg-app/{xrandr_1.4.1.bb => xrandr_1.4.2.bb}  |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xrandr_1.4.1.bb => xrandr_1.4.2.bb} (72%)

diff --git a/meta/recipes-graphics/xorg-app/xrandr_1.4.1.bb b/meta/recipes-graphics/xorg-app/xrandr_1.4.2.bb
similarity index 72%
rename from meta/recipes-graphics/xorg-app/xrandr_1.4.1.bb
rename to meta/recipes-graphics/xorg-app/xrandr_1.4.2.bb
index 6ca6863..84f01b0 100644
--- a/meta/recipes-graphics/xorg-app/xrandr_1.4.1.bb
+++ b/meta/recipes-graphics/xorg-app/xrandr_1.4.2.bb
@@ -11,5 +11,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fe1608bdb33cf8c62a4438f7d34679b3"
 DEPENDS += "libxrandr libxrender"
 PE = "1"
 
-SRC_URI[md5sum] = "52c3de0297bf45be6a189dc2e0515638"
-SRC_URI[sha256sum] = "67b554ab975652778bef587f86dab7fec8cb95dfd21c11d98a203dac5c241e50"
+SRC_URI[md5sum] = "78fd973d9b532106f8777a3449176148"
+SRC_URI[sha256sum] = "b2e76ee92ff827f1c52ded7c666fe6f2704ca81cdeef882397da4e3e8ab490bc"
-- 
1.7.9.5


