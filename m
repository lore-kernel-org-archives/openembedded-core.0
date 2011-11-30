Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RVl0G-0000H5-N6
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 15:19:16 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 30 Nov 2011 06:12:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="81596378"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.50])
	by orsmga002.jf.intel.com with ESMTP; 30 Nov 2011 06:12:37 -0800
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2011 22:12:31 +0800
Message-Id: <adf6bc5f2442ad95fbfbd218a4a09bf0aa8eb0f0.1322662245.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1322662245.git.dexuan.cui@intel.com>
References: <cover.1322662245.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1322662245.git.dexuan.cui@intel.com>
References: <cover.1322662245.git.dexuan.cui@intel.com>
Subject: [PATCH 5/8] libxcursor: upgrade from 1.1.11 to 1.1.12
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
X-List-Received-Date: Wed, 30 Nov 2011 14:19:16 -0000

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../{libxcursor_1.1.11.bb => libxcursor_1.1.12.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxcursor_1.1.11.bb => libxcursor_1.1.12.bb} (79%)

diff --git a/meta/recipes-graphics/xorg-lib/libxcursor_1.1.11.bb b/meta/recipes-graphics/xorg-lib/libxcursor_1.1.12.bb
similarity index 79%
rename from meta/recipes-graphics/xorg-lib/libxcursor_1.1.11.bb
rename to meta/recipes-graphics/xorg-lib/libxcursor_1.1.12.bb
index a8dee4c..b593093 100644
--- a/meta/recipes-graphics/xorg-lib/libxcursor_1.1.11.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcursor_1.1.12.bb
@@ -18,5 +18,5 @@ PE = "1"
 
 XORG_PN = "libXcursor"
 
-SRC_URI[md5sum] = "866ed46f7e0d85b8c0003cebbb78a4af"
-SRC_URI[sha256sum] = "a06ef74579e2c06f9490e682b8e7ac915cb5280ee47bb071a2b850637a2bf6fe"
+SRC_URI[md5sum] = "a93b5a6f5b05976d2c0d3f8a07f6ac6a"
+SRC_URI[sha256sum] = "0c4de165e07ac66b091af50a4db1f07e3c14d1bcf80830013693a21ef03e7ba4"
-- 
1.7.6



