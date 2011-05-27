Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QPqYF-0003fS-LC
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 08:29:39 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 26 May 2011 23:26:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,278,1304319600"; 
   d="scan'208";a="2757414"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.87])
	by azsmga001.ch.intel.com with ESMTP; 26 May 2011 23:26:36 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 May 2011 14:31:52 +0800
Message-Id: <29341b7ed3f2e971d3bc8f38edfbe4e4ba08adb4.1306477652.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <93b575839974dfc9e49598a5c2db76ebabbb5bc0.1306477652.git.lianhao.lu@intel.com>
References: <93b575839974dfc9e49598a5c2db76ebabbb5bc0.1306477652.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1306477652.git.lianhao.lu@intel.com>
References: <cover.1306477652.git.lianhao.lu@intel.com>
Subject: [PATCH 08/11] xorg-proto: use EXTENDPKGV instead of EXTENDPV.
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
X-List-Received-Date: Fri, 27 May 2011 06:29:40 -0000

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 .../xorg-proto/xorg-proto-common.inc               |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc b/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc
index ab1af28..765e30a 100644
--- a/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc
+++ b/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc
@@ -18,4 +18,4 @@ EXTRA_OECONF = "--with-fop=no"
 
 # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
 RDEPENDS_${PN}-dev = ""
-RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPV})"
+RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
-- 
1.7.0.4



