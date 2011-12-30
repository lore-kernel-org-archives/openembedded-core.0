Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RgYKk-00080E-6e
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Dec 2011 10:01:02 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 30 Dec 2011 00:53:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="91490726"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.50])
	by orsmga001.jf.intel.com with ESMTP; 30 Dec 2011 00:53:44 -0800
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Dec 2011 16:53:39 +0800
Message-Id: <0523a2776cb8fe022fd3b51c31cd03c90b14550b.1325234092.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1325234092.git.dexuan.cui@intel.com>
References: <cover.1325234092.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1325234092.git.dexuan.cui@intel.com>
References: <cover.1325234092.git.dexuan.cui@intel.com>
Subject: [PATCH 5/6] util-macros: upgrade from 1.15.0 to the latest 1.16.0
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
X-List-Received-Date: Fri, 30 Dec 2011 09:01:02 -0000

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 ...util-macros_1.15.0.bb => util-macros_1.16.0.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-util/{util-macros_1.15.0.bb => util-macros_1.16.0.bb} (75%)

diff --git a/meta/recipes-graphics/xorg-util/util-macros_1.15.0.bb b/meta/recipes-graphics/xorg-util/util-macros_1.16.0.bb
similarity index 75%
rename from meta/recipes-graphics/xorg-util/util-macros_1.15.0.bb
rename to meta/recipes-graphics/xorg-util/util-macros_1.16.0.bb
index d2b04bf..da9c31d 100644
--- a/meta/recipes-graphics/xorg-util/util-macros_1.15.0.bb
+++ b/meta/recipes-graphics/xorg-util/util-macros_1.16.0.bb
@@ -16,5 +16,5 @@ RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "c7f0c94126443f6744328a92d2b94cff"
-SRC_URI[sha256sum] = "db05c59c0e7843c398ed2847ba4b5bf54292499e5fcadbb7c38a445bf4347ab8"
+SRC_URI[md5sum] = "3f77f0b6452c677d4b5ce9feaea7d15e"
+SRC_URI[sha256sum] = "1387cec5c2e655811e9a60afee7bda1652f8cd97be6c89418566bcf934ff6935"
-- 
1.7.6



