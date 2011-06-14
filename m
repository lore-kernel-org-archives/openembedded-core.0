Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QWOdA-0001K8-Hu
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 10:05:48 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Jun 2011 01:02:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,363,1304319600"; d="scan'208";a="14283995"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.216])
	by orsmga001.jf.intel.com with ESMTP; 14 Jun 2011 01:02:18 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2011 01:01:45 -0700
Message-Id: <3144c2c468465411eaefc1f86222ce232a8847f3.1308037753.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308037752.git.sgw@linux.intel.com>
References: <cover.1308037752.git.sgw@linux.intel.com>
In-Reply-To: <cover.1308037752.git.sgw@linux.intel.com>
References: <cover.1308037752.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 36/51] libxi: upgrade from 1.4.2 to the latest version 1.4.3
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
X-List-Received-Date: Tue, 14 Jun 2011 08:06:48 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

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
1.7.3.4



