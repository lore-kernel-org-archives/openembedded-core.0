Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9028B731AE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 11:52:36 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Jun 2016 04:52:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,509,1459839600"; d="scan'208";a="1002968771"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 22 Jun 2016 04:52:36 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jun 2016 14:52:23 +0300
Message-Id: <7ef32dae19fc044ade50308ad4cd77c2e5bc8480.1466595928.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <d54f69d5faec48cd7dda7efbbc1b7fdd0bb0bd65.1466595928.git.jussi.kukkonen@intel.com>
References: <d54f69d5faec48cd7dda7efbbc1b7fdd0bb0bd65.1466595928.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1466595928.git.jussi.kukkonen@intel.com>
References: <cover.1466595928.git.jussi.kukkonen@intel.com>
Subject: [PATCH 04/10] at-spi2-atk: Upgrade 2.18.1 -> 2.20.1
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
X-List-Received-Date: Wed, 22 Jun 2016 11:52:36 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../atk/{at-spi2-atk_2.18.1.bb => at-spi2-atk_2.20.1.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/atk/{at-spi2-atk_2.18.1.bb => at-spi2-atk_2.20.1.bb} (81%)

diff --git a/meta/recipes-support/atk/at-spi2-atk_2.18.1.bb b/meta/recipes-support/atk/at-spi2-atk_2.20.1.bb
similarity index 81%
rename from meta/recipes-support/atk/at-spi2-atk_2.18.1.bb
rename to meta/recipes-support/atk/at-spi2-atk_2.20.1.bb
index b8a93f3..d4120b6 100644
--- a/meta/recipes-support/atk/at-spi2-atk_2.18.1.bb
+++ b/meta/recipes-support/atk/at-spi2-atk_2.20.1.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886"
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "d7040a55df975865ab0d74a4b325afb5"
-SRC_URI[sha256sum] = "c4b15f9386d34d464ddad5f6cc85669742c016df87141ceee93513245979c12d"
+SRC_URI[md5sum] = "23309b6f8e1623871ace6347fb734dce"
+SRC_URI[sha256sum] = "2358a794e918e8f47ce0c7370eee8fc8a6207ff1afe976ec9ff547a03277bf8e"
 
 DEPENDS = "dbus glib-2.0 atk at-spi2-core"
 
-- 
2.1.4


