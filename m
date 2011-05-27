Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QPqYL-0003mF-L3
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 08:29:46 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 26 May 2011 23:26:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,278,1304319600"; 
   d="scan'208";a="9785671"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.87])
	by fmsmga001.fm.intel.com with ESMTP; 26 May 2011 23:26:40 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 May 2011 14:31:55 +0800
Message-Id: <bdd13ef6a6b78a89b06400b49687fe510f3f9841.1306477652.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <93b575839974dfc9e49598a5c2db76ebabbb5bc0.1306477652.git.lianhao.lu@intel.com>
References: <93b575839974dfc9e49598a5c2db76ebabbb5bc0.1306477652.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1306477652.git.lianhao.lu@intel.com>
References: <cover.1306477652.git.lianhao.lu@intel.com>
Subject: [PATCH 11/11] conf/bitbake.conf: Removed EXTENDPV and EXTENDPEVER.
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
X-List-Received-Date: Fri, 27 May 2011 06:29:46 -0000

Removed the unused variable EXTENDPV and EXTENDPEVER. User should use
EXTENDPKGV instead for package feed generation.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/conf/bitbake.conf |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 4fcf4f6..dd68adc 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -152,8 +152,6 @@ PV = "${@bb.parse.BBHandler.vars_from_file(bb.data.getVar('FILE',d),d)[1] or '1.
 PR = "${@bb.parse.BBHandler.vars_from_file(bb.data.getVar('FILE',d),d)[2] or 'r0'}"
 PF = "${PN}-${EXTENDPE}${PV}-${PR}"
 EXTENDPE = "${@['','${PE\x7d_'][bb.data.getVar('PE',d,1) > 0]}"
-EXTENDPEVER = "${@['','${PE\x7d:'][bb.data.getVar('PE',d,1) > 0]}"
-EXTENDPV = "${EXTENDPEVER}${PV}-${PR}{DISTRO_PR}"
 P = "${PN}-${PV}"
 
 EXTENDPRAUTO = "${@['.${PRAUTO\x7d',''][bb.data.getVar('PRAUTO',d,1) is None]}"
-- 
1.7.0.4



