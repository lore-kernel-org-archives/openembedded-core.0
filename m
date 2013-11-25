Return-Path: <laurentiu.palcu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 78A146DBF7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2013 13:51:15 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 Nov 2013 05:51:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,768,1378882800"; d="scan'208";a="439337151"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by fmsmga002.fm.intel.com with ESMTP; 25 Nov 2013 05:51:10 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Nov 2013 15:50:56 +0200
Message-Id: <7356d639b7cb811debe843a2eef897367b9c71ba.1385386370.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1385386370.git.laurentiu.palcu@intel.com>
References: <cover.1385386370.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1385386370.git.laurentiu.palcu@intel.com>
References: <cover.1385386370.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/9] xtrans: upgrade to 1.3.2
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
X-List-Received-Date: Mon, 25 Nov 2013 13:51:16 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../xorg-lib/{xtrans_1.3.0.bb => xtrans_1.3.2.bb}  |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{xtrans_1.3.0.bb => xtrans_1.3.2.bb} (82%)

diff --git a/meta/recipes-graphics/xorg-lib/xtrans_1.3.0.bb b/meta/recipes-graphics/xorg-lib/xtrans_1.3.2.bb
similarity index 82%
rename from meta/recipes-graphics/xorg-lib/xtrans_1.3.0.bb
rename to meta/recipes-graphics/xorg-lib/xtrans_1.3.2.bb
index 2ed365e..7ddc841 100644
--- a/meta/recipes-graphics/xorg-lib/xtrans_1.3.0.bb
+++ b/meta/recipes-graphics/xorg-lib/xtrans_1.3.2.bb
@@ -20,5 +20,5 @@ inherit gettext
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "1942deb831fd21703e30ebe47794d60c"
-SRC_URI[sha256sum] = "3ae7600e8553ccf2f5c46fbcc63d887729637a4b2a898927dcd339a13355bd4a"
+SRC_URI[md5sum] = "050eb8f1d41e254f508bab72f1c10d6e"
+SRC_URI[sha256sum] = "94177c89b74f594bcddc6a12825e9b464e17ab1977de671d25f67a4ea922cb87"
-- 
1.7.9.5


