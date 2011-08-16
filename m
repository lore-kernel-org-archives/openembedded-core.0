Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QtKSo-0002er-9D
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 16:17:54 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Aug 2011 07:13:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="38910848"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.112])
	by orsmga001.jf.intel.com with ESMTP; 16 Aug 2011 07:13:18 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2011 22:13:15 +0800
Message-Id: <7565aa10395a4beb954d18368c4224b9991609f1.1313503778.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313503778.git.dexuan.cui@intel.com>
References: <cover.1313503778.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1313503778.git.dexuan.cui@intel.com>
References: <cover.1313503778.git.dexuan.cui@intel.com>
Subject: [PATCH 05/10] util-macros: upgrade from 1.14.0 to the latest version 0.15.0
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
X-List-Received-Date: Tue, 16 Aug 2011 14:17:54 -0000

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 ...util-macros_1.14.0.bb => util-macros_1.15.0.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-util/{util-macros_1.14.0.bb => util-macros_1.15.0.bb} (80%)

diff --git a/meta/recipes-graphics/xorg-util/util-macros_1.14.0.bb b/meta/recipes-graphics/xorg-util/util-macros_1.15.0.bb
similarity index 80%
rename from meta/recipes-graphics/xorg-util/util-macros_1.14.0.bb
rename to meta/recipes-graphics/xorg-util/util-macros_1.15.0.bb
index 4fa235b..fb1772b 100644
--- a/meta/recipes-graphics/xorg-util/util-macros_1.14.0.bb
+++ b/meta/recipes-graphics/xorg-util/util-macros_1.15.0.bb
@@ -20,5 +20,5 @@ RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "cbe57cd7cc492a762466f5280a7ffba8"
-SRC_URI[sha256sum] = "9bd6949b930aadfce32bc9e101008d4c6ff48329ed0e3a467990bee69f574d66"
+SRC_URI[md5sum] = "c7f0c94126443f6744328a92d2b94cff"
+SRC_URI[sha256sum] = "db05c59c0e7843c398ed2847ba4b5bf54292499e5fcadbb7c38a445bf4347ab8"
-- 
1.7.6



