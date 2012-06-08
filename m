Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Sd0fO-0001vf-Uf
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 16:59:59 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 08 Jun 2012 07:48:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="153552668"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by azsmga001.ch.intel.com with ESMTP; 08 Jun 2012 07:48:24 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jun 2012 17:48:18 +0300
Message-Id: <1339166898-11667-5-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1339166898-11667-1-git-send-email-laurentiu.palcu@intel.com>
References: <1339166898-11667-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [PATCH 4/4] menu-cache: upgrade to 0.3.3
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
X-List-Received-Date: Fri, 08 Jun 2012 14:59:59 -0000

Other changes:
	- licence MD5 for menu-cache.h has changed because some whitespaces
	  were removed;

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../{menu-cache_0.3.2.bb => menu-cache_0.3.3.bb}   |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/menu-cache/{menu-cache_0.3.2.bb => menu-cache_0.3.3.bb} (76%)

diff --git a/meta/recipes-graphics/menu-cache/menu-cache_0.3.2.bb b/meta/recipes-graphics/menu-cache/menu-cache_0.3.3.bb
similarity index 76%
rename from meta/recipes-graphics/menu-cache/menu-cache_0.3.2.bb
rename to meta/recipes-graphics/menu-cache/menu-cache_0.3.3.bb
index b8f9d97..894da48 100644
--- a/meta/recipes-graphics/menu-cache/menu-cache_0.3.2.bb
+++ b/meta/recipes-graphics/menu-cache/menu-cache_0.3.3.bb
@@ -5,7 +5,7 @@ BUGTRACKER = ""
 
 LICENSE = "GPLv2 & GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://libmenu-cache/menu-cache.h;endline=29;md5=ca0101a419b3584963e0c45f2b6b55ef \
+                    file://libmenu-cache/menu-cache.h;endline=29;md5=21625ca49a07e7c381027c63eff769dc \
                     file://menu-cache-daemon/menu-cached.c;endline=22;md5=fcecb7d315c57ef804103fa9cdab7111"
 
 SECTION = "x11/libs"
@@ -13,9 +13,9 @@ DEPENDS = "glib-2.0 zlib"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/lxde/menu-cache-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "ac4a9ea77db68d3db3f9f53cc75af66a"
-SRC_URI[sha256sum] = "6b7c1627b5102d8301a8a3e845f673a7181a71dde32f6455abf22d03e392b89f"
+SRC_URI[md5sum] = "a14b0b162cd64d56c16bf6af16f3a47f"
+SRC_URI[sha256sum] = "07241c1f5f371b426d3b0a6e571a86184ec6256bdd7ead7a4da866cd10f25955"
 
-PR = "r2"
+PR = "r0"
 
 inherit autotools pkgconfig
-- 
1.7.9.5



