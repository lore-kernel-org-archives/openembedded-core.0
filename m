Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Tn3iW-0003pg-BX
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Dec 2012 09:49:00 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 24 Dec 2012 00:34:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,346,1355126400"; d="scan'208";a="266440698"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by fmsmga001.fm.intel.com with ESMTP; 24 Dec 2012 00:34:06 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Dec 2012 10:34:24 +0200
Message-Id: <ada698188d1d50f3b85ce765a3ce9b5b4ffe66c5.1356337650.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1356337650.git.constantinx.musca@intel.com>
References: <cover.1356337650.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1356337650.git.constantinx.musca@intel.com>
References: <cover.1356337650.git.constantinx.musca@intel.com>
Subject: [PATCH 12/15] menu-cache: upgrade to 0.4.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Dec 2012 08:49:00 -0000

License checksum change due to:
    libmenu-cache/menu-cache.h: code (not license) change

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../menu-cache/{menu-cache_0.3.3.bb => menu-cache_0.4.1.bb}         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/menu-cache/{menu-cache_0.3.3.bb => menu-cache_0.4.1.bb} (77%)

diff --git a/meta/recipes-graphics/menu-cache/menu-cache_0.3.3.bb b/meta/recipes-graphics/menu-cache/menu-cache_0.4.1.bb
similarity index 77%
rename from meta/recipes-graphics/menu-cache/menu-cache_0.3.3.bb
rename to meta/recipes-graphics/menu-cache/menu-cache_0.4.1.bb
index 894da48..d0c5340 100644
--- a/meta/recipes-graphics/menu-cache/menu-cache_0.3.3.bb
+++ b/meta/recipes-graphics/menu-cache/menu-cache_0.4.1.bb
@@ -5,7 +5,7 @@ BUGTRACKER = ""
 
 LICENSE = "GPLv2 & GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://libmenu-cache/menu-cache.h;endline=29;md5=21625ca49a07e7c381027c63eff769dc \
+                    file://libmenu-cache/menu-cache.h;endline=29;md5=26571532593adb17a37eac396260532c \
                     file://menu-cache-daemon/menu-cached.c;endline=22;md5=fcecb7d315c57ef804103fa9cdab7111"
 
 SECTION = "x11/libs"
@@ -13,8 +13,8 @@ DEPENDS = "glib-2.0 zlib"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/lxde/menu-cache-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "a14b0b162cd64d56c16bf6af16f3a47f"
-SRC_URI[sha256sum] = "07241c1f5f371b426d3b0a6e571a86184ec6256bdd7ead7a4da866cd10f25955"
+SRC_URI[md5sum] = "20fed982f5d8e6ec8a56a5b48894ecf0"
+SRC_URI[sha256sum] = "4fa9408e353fedba5b7314cbf6b6cd06d873a1424e281aa050d88bb9c0a0191e"
 
 PR = "r0"
 
-- 
1.7.11.7



