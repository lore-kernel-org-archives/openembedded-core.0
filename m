Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1TwAfI-0002Kz-Qd
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 13:03:25 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 Jan 2013 03:47:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,491,1355126400"; d="scan'208";a="245575076"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by azsmga001.ch.intel.com with ESMTP; 18 Jan 2013 03:47:51 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Jan 2013 13:48:30 +0200
Message-Id: <e661953a41b84fdac85a2dde71b1ff62283d99b3.1358509450.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1358509450.git.constantinx.musca@intel.com>
References: <cover.1358509450.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1358509450.git.constantinx.musca@intel.com>
References: <cover.1358509450.git.constantinx.musca@intel.com>
Subject: [PATCH 2/4] core-image-gtk-directfb: rename to core-image-directfb
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
- use packagegroup-core-directfb instead of packagegroup-core-gtk-directfb

[YOCTO #3642]

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../images/{core-image-gtk-directfb.bb => core-image-directfb.bb}  | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/images/{core-image-gtk-directfb.bb => core-image-directfb.bb} (78%)

diff --git a/meta/recipes-graphics/images/core-image-gtk-directfb.bb b/meta/recipes-graphics/images/core-image-directfb.bb
similarity index 78%
rename from meta/recipes-graphics/images/core-image-gtk-directfb.bb
rename to meta/recipes-graphics/images/core-image-directfb.bb
index 05f03cd..4f47185 100644
--- a/meta/recipes-graphics/images/core-image-gtk-directfb.bb
+++ b/meta/recipes-graphics/images/core-image-directfb.bb
@@ -1,21 +1,20 @@
 LICENSE = "MIT"
-PR="r1"
+PR="r0"
 
 
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-
 inherit core-image
 
 IMAGE_INSTALL += "\
 	${CORE_IMAGE_BASE_INSTALL} \
 	packagegroup-core-basic \
-	packagegroup-core-gtk-directfb \
+	packagegroup-core-directfb \
 "
 
 python __anonymous () {
 	packages = d.getVar('DISTRO_FEATURES', True).split()
 	if "x11" in packages:
-		raise bb.parse.SkipPackage("FEATURE \"x11\" is in DISTRO_FEATURES, Please remove \"x11\" from DISTRO_FEATURES, use \"gtk-directfb\" instead of it\n")
+		raise bb.parse.SkipPackage("FEATURE \"x11\" is in DISTRO_FEATURES, Please remove \"x11\" from DISTRO_FEATURES, use \"directfb\" instead of it\n")
 }
-- 
1.7.11.7



