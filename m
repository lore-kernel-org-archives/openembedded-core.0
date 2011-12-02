Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1RWOAl-0005q6-RE
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 09:08:44 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Dec 2011 00:00:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,282,1320652800"; d="scan'208";a="81422787"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by azsmga001.ch.intel.com with ESMTP; 02 Dec 2011 00:00:56 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Dec 2011 15:55:57 +0800
Message-Id: <2fe1910927e5741631767ed3611e361749c75d3c.1322812458.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1322812458.git.edwin.zhai@intel.com>
References: <cover.1322812458.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1322812458.git.edwin.zhai@intel.com>
References: <cover.1322812458.git.edwin.zhai@intel.com>
Subject: [PATCH 3/4] x11vnc: Upgrade to 0.9.13
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
X-List-Received-Date: Fri, 02 Dec 2011 08:08:44 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../x11vnc/{x11vnc_0.9.12.bb => x11vnc_0.9.13.bb}  |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/x11vnc/{x11vnc_0.9.12.bb => x11vnc_0.9.13.bb} (66%)

diff --git a/meta/recipes-graphics/x11vnc/x11vnc_0.9.12.bb b/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
similarity index 66%
rename from meta/recipes-graphics/x11vnc/x11vnc_0.9.12.bb
rename to meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
index 9bf7d41..4b8bed4 100644
--- a/meta/recipes-graphics/x11vnc/x11vnc_0.9.12.bb
+++ b/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
@@ -5,18 +5,18 @@ SECTION = "x11/utils"
 AUTHOR = "Karl Runge"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=361b6b837cad26c6900a926b62aada5f \
-                    file://x11vnc/x11vnc.h;endline=33;md5=ee4946e57bb73ecf93d7d98a3d48c6be"
+                    file://x11vnc/x11vnc.h;endline=33;md5=6f95dc6535467d7ee1563fd434fb372e"
 
 DEPENDS = "openssl virtual/libx11 libxext avahi jpeg zlib"
 
-PR = "r2"
+PR = "r0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/libvncserver/x11vnc/${PV}/x11vnc-${PV}.tar.gz\
            file://starting-fix.patch \
            file://endian-fix.patch "
 
-SRC_URI[md5sum] = "1498a68d02aa7b6c97bf746c073c8d00"
-SRC_URI[sha256sum] = "60a7cceee2c9a5f1c854340b2bae13f975ac55906237042f81f795b28a154a79"
+SRC_URI[md5sum] = "a372ec4fe8211221547b1c108cf56e4c"
+SRC_URI[sha256sum] = "f6829f2e629667a5284de62b080b13126a0736499fe47cdb447aedb07a59f13b"
 
 inherit autotools
 
-- 
1.7.1



