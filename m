Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CDE6973D22
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Apr 2015 12:16:52 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 09 Apr 2015 05:16:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,549,1422950400"; d="scan'208";a="706187258"
Received: from heimdall.fi.intel.com ([10.237.72.168])
	by fmsmga002.fm.intel.com with ESMTP; 09 Apr 2015 05:16:52 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Apr 2015 15:16:25 +0300
Message-Id: <71aeee030b08295ee4d8b9c399ebb9c139419f70.1428577515.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <d3d9f4037e97ba885958f3d527ab8bea2f2261dd.1428577515.git.jussi.kukkonen@intel.com>
References: <d3d9f4037e97ba885958f3d527ab8bea2f2261dd.1428577515.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1428577515.git.jussi.kukkonen@intel.com>
References: <cover.1428577515.git.jussi.kukkonen@intel.com>
Subject: [PATCH 5/7] at-spi2-atk: Upgrade to 2.16.0
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
X-List-Received-Date: Thu, 09 Apr 2015 12:16:53 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../atk/{at-spi2-atk_2.14.1.bb => at-spi2-atk_2.16.0.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/atk/{at-spi2-atk_2.14.1.bb => at-spi2-atk_2.16.0.bb} (79%)

diff --git a/meta/recipes-support/atk/at-spi2-atk_2.14.1.bb b/meta/recipes-support/atk/at-spi2-atk_2.16.0.bb
similarity index 79%
rename from meta/recipes-support/atk/at-spi2-atk_2.14.1.bb
rename to meta/recipes-support/atk/at-spi2-atk_2.16.0.bb
index 2391389..d8379c1 100644
--- a/meta/recipes-support/atk/at-spi2-atk_2.14.1.bb
+++ b/meta/recipes-support/atk/at-spi2-atk_2.16.0.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886"
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "5c6a085249a6d4e792ead86dca183504"
-SRC_URI[sha256sum] = "058f34ea60edf0a5f831c9f2bdd280fe95c1bcafb76e466e44aa0fb356d17bcb"
+SRC_URI[md5sum] = "8936488c8cdce0e158f80b2e247527f9"
+SRC_URI[sha256sum] = "78efc45ec36383bf785f8636e64a8d866defeb020e00a08f92978f1fc3772ff9"
 
 DEPENDS = "dbus glib-2.0 atk at-spi2-core"
 
-- 
2.1.4


