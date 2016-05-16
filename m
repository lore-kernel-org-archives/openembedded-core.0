Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0AC14731E5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 13:22:59 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 May 2016 06:23:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,627,1455004800"; d="scan'208";a="977873466"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 16 May 2016 06:22:59 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 May 2016 16:22:43 +0300
Message-Id: <97db0b505f74c02833717941d1e312b778e576e8.1463404035.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <25872fbe16b6f36bee45fec3e7f088cd72507351.1463404035.git.jussi.kukkonen@intel.com>
References: <25872fbe16b6f36bee45fec3e7f088cd72507351.1463404035.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1463404035.git.jussi.kukkonen@intel.com>
References: <cover.1463404035.git.jussi.kukkonen@intel.com>
Subject: [PATCH 06/13] inputproto: Upgrade 2.3.1 -> 2.3.2
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
X-List-Received-Date: Mon, 16 May 2016 13:22:59 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../xorg-proto/{inputproto_2.3.1.bb => inputproto_2.3.2.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{inputproto_2.3.1.bb => inputproto_2.3.2.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-proto/inputproto_2.3.1.bb b/meta/recipes-graphics/xorg-proto/inputproto_2.3.2.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-proto/inputproto_2.3.1.bb
rename to meta/recipes-graphics/xorg-proto/inputproto_2.3.2.bb
index 7e8e0c1..ae50b87 100644
--- a/meta/recipes-graphics/xorg-proto/inputproto_2.3.1.bb
+++ b/meta/recipes-graphics/xorg-proto/inputproto_2.3.2.bb
@@ -16,5 +16,5 @@ inherit gettext
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "6caebead4b779ba031727f66a7ffa358"
-SRC_URI[sha256sum] = "5a47ee62053a6acef3a83f506312494be1461068d0b9269d818839703b95c1d1"
+SRC_URI[md5sum] = "b290a463af7def483e6e190de460f31a"
+SRC_URI[sha256sum] = "893a6af55733262058a27b38eeb1edc733669f01d404e8581b167f03c03ef31d"
-- 
2.1.4


