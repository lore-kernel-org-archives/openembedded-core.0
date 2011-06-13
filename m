Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QW9RA-0004yk-Hb
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 17:52:24 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 13 Jun 2011 08:49:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,359,1304319600"; d="scan'208";a="11944529"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by azsmga001.ch.intel.com with ESMTP; 13 Jun 2011 08:49:01 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jun 2011 23:48:37 +0800
Message-Id: <ff76a2dfbde11105f0319458542ecdf5b3cc1266.1307979545.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <d4faff15427f5ece20d771f086358c167de0776a.1307979545.git.dexuan.cui@intel.com>
References: <d4faff15427f5ece20d771f086358c167de0776a.1307979545.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1307979545.git.dexuan.cui@intel.com>
References: <cover.1307979545.git.dexuan.cui@intel.com>
Subject: [PATCH 12/13] libxi: upgrade from 1.4.2 to the latest version 1.4.3
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
X-List-Received-Date: Mon, 13 Jun 2011 15:52:24 -0000

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../xorg-lib/{libxi_1.4.2.bb => libxi_1.4.3.bb}    |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxi_1.4.2.bb => libxi_1.4.3.bb} (80%)

diff --git a/meta/recipes-graphics/xorg-lib/libxi_1.4.2.bb b/meta/recipes-graphics/xorg-lib/libxi_1.4.3.bb
similarity index 80%
rename from meta/recipes-graphics/xorg-lib/libxi_1.4.2.bb
rename to meta/recipes-graphics/xorg-lib/libxi_1.4.3.bb
index 50ff426..80a01fc 100644
--- a/meta/recipes-graphics/xorg-lib/libxi_1.4.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxi_1.4.3.bb
@@ -12,11 +12,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=17b064789fab936a1c58c4e13d965b0f \
                     file://src/XIGetDevFocus.c;endline=23;md5=cdfb0d435a33ec57ea0d1e8e395b729f"
 
 DEPENDS += "libxext inputproto"
+
 PE = "1"
+PR = "r0"
 
 XORG_PN = "libXi"
 
 EXTRA_OECONF_append = " --enable-specs=no"
 
-SRC_URI[md5sum] = "3d14f7bfc4a4335cf0144de9b67a5444"
-SRC_URI[sha256sum] = "272b8041efc0a0203fb0ba33481ddec989539aed862181b58c8c3e410e325691"
+SRC_URI[md5sum] = "792e8a7ddc7175911d69f823d38eaff6"
+SRC_URI[sha256sum] = "08c9d89a404740592621e6f5078414df86ccc78ca876e3da1af15639d81c74e0"
-- 
1.7.1



