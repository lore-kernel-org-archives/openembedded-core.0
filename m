Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7C69765D41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Apr 2014 13:51:19 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Apr 2014 06:51:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,951,1389772800"; d="scan'208";a="531596803"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga002.jf.intel.com with ESMTP; 29 Apr 2014 06:51:17 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Apr 2014 16:29:53 +0300
Message-Id: <dc64730f29ffc49ffd36e2cb2509c0a693a03e33.1398775392.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1398775392.git.laurentiu.palcu@intel.com>
References: <cover.1398775392.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1398775392.git.laurentiu.palcu@intel.com>
References: <cover.1398775392.git.laurentiu.palcu@intel.com>
Subject: [PATCH 11/12] xauth: upgrade to 1.0.9
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
X-List-Received-Date: Tue, 29 Apr 2014 13:51:19 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../xorg-app/{xauth_1.0.8.bb => xauth_1.0.9.bb}    |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xauth_1.0.8.bb => xauth_1.0.9.bb} (68%)

diff --git a/meta/recipes-graphics/xorg-app/xauth_1.0.8.bb b/meta/recipes-graphics/xorg-app/xauth_1.0.9.bb
similarity index 68%
rename from meta/recipes-graphics/xorg-app/xauth_1.0.8.bb
rename to meta/recipes-graphics/xorg-app/xauth_1.0.9.bb
index a2da49e..b173f4f 100644
--- a/meta/recipes-graphics/xorg-app/xauth_1.0.8.bb
+++ b/meta/recipes-graphics/xorg-app/xauth_1.0.9.bb
@@ -8,5 +8,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5ec74dd7ea4d10c4715a7c44f159a40b"
 DEPENDS += "libxau libxext libxmu"
 PE = "1"
 
-SRC_URI[md5sum] = "50ee2ec0836c0186b05ec8fdcfd566d0"
-SRC_URI[sha256sum] = "a8696ae7a50c699d5fb3a41408b60d98843d19ea46e9f09e391cb98c8f7fd4f7"
+SRC_URI[md5sum] = "7d6003f32838d5b688e2c8a131083271"
+SRC_URI[sha256sum] = "56ce1523eb48b1f8a4f4244fe1c3d8e6af1a3b7d4b0e6063582421b0b68dc28f"
-- 
1.7.9.5


