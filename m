Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1TwAfH-0002Kx-Gj
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 13:03:25 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 Jan 2013 03:47:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,491,1355126400"; d="scan'208";a="245575071"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by azsmga001.ch.intel.com with ESMTP; 18 Jan 2013 03:47:50 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Jan 2013 13:48:29 +0200
Message-Id: <3e9e32d745fa7a228acfcc04aac62e084e0540cd.1358509450.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1358509450.git.constantinx.musca@intel.com>
References: <cover.1358509450.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1358509450.git.constantinx.musca@intel.com>
References: <cover.1358509450.git.constantinx.musca@intel.com>
Subject: [PATCH 1/4] packagegroup-core-gtk-directfb: rename to packagegroup-core-directfb
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
X-List-Received-Date: Fri, 18 Jan 2013 12:03:35 -0000

- DirectFB is not supported by gtk versions >= 2.18
- remove the backwards compatibility statements (packagegroup-core-directfb
is an independent packagegroup)
- remove all gtk dependencies

[YOCTO #3642]

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 ...oup-core-gtk-directfb.bb => packagegroup-core-directfb.bb} | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)
 rename meta/recipes-graphics/packagegroups/{packagegroup-core-gtk-directfb.bb => packagegroup-core-directfb.bb} (49%)

diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-gtk-directfb.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb
similarity index 49%
rename from meta/recipes-graphics/packagegroups/packagegroup-core-gtk-directfb.bb
rename to meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb
index 55b0b9d..aca3a67 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-gtk-directfb.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb
@@ -1,14 +1,9 @@
-SUMMARY = "GTK+ over DirectFB without X11"
-PR = "r1"
+SUMMARY = "DirectFB without X11"
+PR = "r0"
 LICENSE = "MIT"
 
 inherit packagegroup
 
-# For backwards compatibility after rename
-RPROVIDES_${PN} = "task-core-gtk-directfb-base"
-RREPLACES_${PN} = "task-core-gtk-directfb-base"
-RCONFLICTS_${PN} = "task-core-gtk-directfb-base"
-
 TOUCH = ' ${@base_contains("MACHINE_FEATURES", "touchscreen", "tslib tslib-calibrate tslib-tests", "",d)}'
 
 RDEPENDS_${PN} = " \
@@ -17,7 +12,5 @@ RDEPENDS_${PN} = " \
 		pango \
 		pango-modules \
 		fontconfig \
-		gtk+ \
-		gtk-demo \
 		${TOUCH} \
 "
-- 
1.7.11.7



