Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3AFEB6D320
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2013 09:25:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 05 Nov 2013 01:21:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,638,1378882800"; d="scan'208";a="422417472"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by fmsmga001.fm.intel.com with ESMTP; 05 Nov 2013 01:25:23 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2013 11:25:13 +0200
Message-Id: <140ffa15c0ab4e3b47b47eeb1c4fc03e803cdf49.1383643350.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1383643350.git.laurentiu.palcu@intel.com>
References: <cover.1383643350.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1383643350.git.laurentiu.palcu@intel.com>
References: <cover.1383643350.git.laurentiu.palcu@intel.com>
Subject: [PATCH 3/7] xtrans: upgrade to 1.3.0
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
X-List-Received-Date: Tue, 05 Nov 2013 09:25:26 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../xorg-lib/{xtrans_1.2.7.bb => xtrans_1.3.0.bb}  |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{xtrans_1.2.7.bb => xtrans_1.3.0.bb} (82%)

diff --git a/meta/recipes-graphics/xorg-lib/xtrans_1.2.7.bb b/meta/recipes-graphics/xorg-lib/xtrans_1.3.0.bb
similarity index 82%
rename from meta/recipes-graphics/xorg-lib/xtrans_1.2.7.bb
rename to meta/recipes-graphics/xorg-lib/xtrans_1.3.0.bb
index 3c3f4dd..2ed365e 100644
--- a/meta/recipes-graphics/xorg-lib/xtrans_1.2.7.bb
+++ b/meta/recipes-graphics/xorg-lib/xtrans_1.3.0.bb
@@ -20,5 +20,5 @@ inherit gettext
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "84c66908cf003ad8c272b0eecbdbaee3"
-SRC_URI[sha256sum] = "7f811191ba70a34a9994d165ea11a239e52c527f039b6e7f5011588f075fe1a6"
+SRC_URI[md5sum] = "1942deb831fd21703e30ebe47794d60c"
+SRC_URI[sha256sum] = "3ae7600e8553ccf2f5c46fbcc63d887729637a4b2a898927dcd339a13355bd4a"
-- 
1.7.9.5


