Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RVl0K-0000H4-Hs
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 15:19:20 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 30 Nov 2011 06:12:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,597,1315206000"; d="scan'208";a="90584278"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.50])
	by fmsmga001.fm.intel.com with ESMTP; 30 Nov 2011 06:12:40 -0800
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2011 22:12:33 +0800
Message-Id: <4d1adfbb4221373792f80af1c0ff38974db486eb.1322662245.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1322662245.git.dexuan.cui@intel.com>
References: <cover.1322662245.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1322662245.git.dexuan.cui@intel.com>
References: <cover.1322662245.git.dexuan.cui@intel.com>
Subject: [PATCH 7/8] inputproto: upgrade from 2.0.2 to the latest stable 2.0.99.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Nov 2011 14:19:20 -0000

The current latest version 2.1.99.2 is not stable: "This branch contains
protocol elements which have not yet been finalised.", so we upgrade to
2.0.99.1 for now.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 ...{inputproto_2.0.2.bb => inputproto_2.0.99.1.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{inputproto_2.0.2.bb => inputproto_2.0.99.1.bb} (78%)

diff --git a/meta/recipes-graphics/xorg-proto/inputproto_2.0.2.bb b/meta/recipes-graphics/xorg-proto/inputproto_2.0.99.1.bb
similarity index 78%
rename from meta/recipes-graphics/xorg-proto/inputproto_2.0.2.bb
rename to meta/recipes-graphics/xorg-proto/inputproto_2.0.99.1.bb
index 26f1e2d..487d9b8 100644
--- a/meta/recipes-graphics/xorg-proto/inputproto_2.0.2.bb
+++ b/meta/recipes-graphics/xorg-proto/inputproto_2.0.99.1.bb
@@ -17,6 +17,6 @@ inherit gettext
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "07d54ae098ed4e6dce472f6ef3de05ce"
-SRC_URI[sha256sum] = "64222a590ad4a62a3c8d57805379451769e3329cc5c8c5c1f1fc0d1529ebf005"
+SRC_URI[md5sum] = "c5a4bef0431b4197e95d1e15b2996d49"
+SRC_URI[sha256sum] = "e699b4c44977b8edb97d171c7a68ff1551366d00c5ed93e6b72e3d9072b48145"
 
-- 
1.7.6



