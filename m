Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DE6207714F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 12:41:11 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 09 Nov 2015 04:41:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,265,1444719600"; d="scan'208";a="596861581"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Nov 2015 04:41:06 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Nov 2015 14:44:04 +0200
Message-Id: <46860a717ce3edad1f6761fec4219bde6ba5c56e.1447072488.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <090fbaaf8c5d1b0a51169fce3b9c6ef822103dc7.1447072488.git.jussi.kukkonen@intel.com>
References: <090fbaaf8c5d1b0a51169fce3b9c6ef822103dc7.1447072488.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1447072488.git.jussi.kukkonen@intel.com>
References: <cover.1447072488.git.jussi.kukkonen@intel.com>
Subject: [PATCHv2 7/8] at-spi2-atk: Upgrade 2.16.0 -> 2.18.1
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
X-List-Received-Date: Mon, 09 Nov 2015 12:41:12 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../atk/{at-spi2-atk_2.16.0.bb => at-spi2-atk_2.18.1.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/atk/{at-spi2-atk_2.16.0.bb => at-spi2-atk_2.18.1.bb} (82%)

diff --git a/meta/recipes-support/atk/at-spi2-atk_2.16.0.bb b/meta/recipes-support/atk/at-spi2-atk_2.18.1.bb
similarity index 82%
rename from meta/recipes-support/atk/at-spi2-atk_2.16.0.bb
rename to meta/recipes-support/atk/at-spi2-atk_2.18.1.bb
index 7d95fdb..f2e543f 100644
--- a/meta/recipes-support/atk/at-spi2-atk_2.16.0.bb
+++ b/meta/recipes-support/atk/at-spi2-atk_2.18.1.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886"
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "8936488c8cdce0e158f80b2e247527f9"
-SRC_URI[sha256sum] = "78efc45ec36383bf785f8636e64a8d866defeb020e00a08f92978f1fc3772ff9"
+SRC_URI[md5sum] = "d7040a55df975865ab0d74a4b325afb5"
+SRC_URI[sha256sum] = "c4b15f9386d34d464ddad5f6cc85669742c016df87141ceee93513245979c12d"
 
 DEPENDS = "dbus glib-2.0 atk at-spi2-core"
 
-- 
2.1.4


