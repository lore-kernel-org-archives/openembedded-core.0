Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QPqYT-0003oe-RM
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 08:29:54 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 26 May 2011 23:26:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,278,1304319600"; 
   d="scan'208";a="5708159"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.87])
	by orsmga001.jf.intel.com with ESMTP; 26 May 2011 23:26:37 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 May 2011 14:31:53 +0800
Message-Id: <fb689fae9008e0e07df8e84fd43e80cb550c2ecf.1306477652.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <93b575839974dfc9e49598a5c2db76ebabbb5bc0.1306477652.git.lianhao.lu@intel.com>
References: <93b575839974dfc9e49598a5c2db76ebabbb5bc0.1306477652.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1306477652.git.lianhao.lu@intel.com>
References: <cover.1306477652.git.lianhao.lu@intel.com>
Subject: [PATCH 09/11] xorg-util/util-macros: use EXTENDPKGV instead of EXTENDPV.
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
X-List-Received-Date: Fri, 27 May 2011 06:29:54 -0000

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 .../xorg-util/util-macros_1.13.0.bb                |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/xorg-util/util-macros_1.13.0.bb b/meta/recipes-graphics/xorg-util/util-macros_1.13.0.bb
index a708ed0..a6f5402 100644
--- a/meta/recipes-graphics/xorg-util/util-macros_1.13.0.bb
+++ b/meta/recipes-graphics/xorg-util/util-macros_1.13.0.bb
@@ -16,7 +16,7 @@ DEPENDS_virtclass-native = "gettext"
 DEPENDS_virtclass-nativesdk = "gettext"
 
 RDEPENDS_${PN}-dev = ""
-RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPV})"
+RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
1.7.0.4



