Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QW9R3-0004yS-Op
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 17:52:18 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 13 Jun 2011 08:48:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,359,1304319600"; d="scan'208";a="15668314"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by fmsmga002.fm.intel.com with ESMTP; 13 Jun 2011 08:48:51 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jun 2011 23:48:30 +0800
Message-Id: <a686dfaea753113a61beae9bb8af6333969e9675.1307979545.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <d4faff15427f5ece20d771f086358c167de0776a.1307979545.git.dexuan.cui@intel.com>
References: <d4faff15427f5ece20d771f086358c167de0776a.1307979545.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1307979545.git.dexuan.cui@intel.com>
References: <cover.1307979545.git.dexuan.cui@intel.com>
Subject: [PATCH 05/13] util-macros: upgrade from 1.13.0 to the latest version 0.14.0
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
X-List-Received-Date: Mon, 13 Jun 2011 15:52:18 -0000

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 ...util-macros_1.13.0.bb => util-macros_1.14.0.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-util/{util-macros_1.13.0.bb => util-macros_1.14.0.bb} (79%)

diff --git a/meta/recipes-graphics/xorg-util/util-macros_1.13.0.bb b/meta/recipes-graphics/xorg-util/util-macros_1.14.0.bb
similarity index 79%
rename from meta/recipes-graphics/xorg-util/util-macros_1.13.0.bb
rename to meta/recipes-graphics/xorg-util/util-macros_1.14.0.bb
index a6f5402..dfeb7ff 100644
--- a/meta/recipes-graphics/xorg-util/util-macros_1.13.0.bb
+++ b/meta/recipes-graphics/xorg-util/util-macros_1.14.0.bb
@@ -20,5 +20,5 @@ RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "31e9ddcbc1d8bc8c09ab180443974dd1"
-SRC_URI[sha256sum] = "7bff944fb120192e7fe1706e9c0b7e41666e7983ce3e2bdef0b7734392d9e695"
+SRC_URI[md5sum] = "cbe57cd7cc492a762466f5280a7ffba8"
+SRC_URI[sha256sum] = "9bd6949b930aadfce32bc9e101008d4c6ff48329ed0e3a467990bee69f574d66"
-- 
1.7.1



