Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 266486E991
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2014 15:30:02 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 06 Feb 2014 07:29:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,793,1384329600"; d="scan'208";a="450785182"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga001.jf.intel.com with ESMTP; 06 Feb 2014 07:29:50 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Feb 2014 17:29:31 +0200
Message-Id: <be549a5c1f514f0bf414f659eb1a340d159d1f15.1391699953.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1391699953.git.laurentiu.palcu@intel.com>
References: <cover.1391699953.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1391699953.git.laurentiu.palcu@intel.com>
References: <cover.1391699953.git.laurentiu.palcu@intel.com>
Subject: [PATCH 12/13] xserver-xorg: upgrade to 1.15.0
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
X-List-Received-Date: Thu, 06 Feb 2014 15:30:02 -0000

License file changed slightly: a new person has been added to the list
of authors.

Add dependency of presentproto.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |    4 ++--
 ...erver-xorg_1.14.4.bb => xserver-xorg_1.15.0.bb} |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.14.4.bb => xserver-xorg_1.15.0.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index a0283cd..2bacbe5 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -2,7 +2,7 @@ SUMMARY = "The X.Org X server"
 HOMEPAGE = "http://www.x.org"
 SECTION = "x11/base"
 LICENSE = "MIT-X"
-LIC_FILES_CHKSUM = "file://COPYING;md5=bc098b9774ed096943f6c37b5beeef13"
+LIC_FILES_CHKSUM = "file://COPYING;md5=15b5bf9327341c81089137aec4830bfd"
 
 # xf86-*-* packages depend on an X server built with the xfree86 DDX
 # so we have a virtual to represent that:
@@ -23,7 +23,7 @@ S = "${WORKDIR}/${XORG_PN}-${PV}"
 
 inherit autotools pkgconfig
 
-PROTO_DEPS = "randrproto renderproto fixesproto damageproto xextproto xproto xf86dgaproto xf86miscproto xf86vidmodeproto compositeproto recordproto resourceproto videoproto scrnsaverproto  xineramaproto fontsproto kbproto inputproto bigreqsproto xcmiscproto"
+PROTO_DEPS = "randrproto renderproto fixesproto damageproto xextproto xproto xf86dgaproto xf86miscproto xf86vidmodeproto compositeproto recordproto resourceproto videoproto scrnsaverproto  xineramaproto fontsproto kbproto inputproto bigreqsproto xcmiscproto presentproto"
 LIB_DEPS = "pixman libxfont xtrans libxau libxext libxdmcp libdrm libxkbfile libpciaccess openssl libgcrypt"
 DEPENDS = "${PROTO_DEPS} ${LIB_DEPS} font-util"
 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.14.4.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.15.0.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.14.4.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.15.0.bb
index 22b1f82..a4dda4e 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.14.4.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.15.0.bb
@@ -7,8 +7,8 @@ SRC_URI += "file://crosscompile.patch \
             file://aarch64.patch \
            "
 
-SRC_URI[md5sum] = "9d68a30258c67faa3c036a4a85e8bf97"
-SRC_URI[sha256sum] = "608ccfaafb845f6e559884a30f946d365209172416710d687b190e9e1ff65dc3"
+SRC_URI[md5sum] = "c2ace3697b32414094cf8c597c39d7d9"
+SRC_URI[sha256sum] = "613b2f2e7ee2a06d2f8e862c836dc70d319c52f1537749e027398f40086aabb8"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
1.7.9.5


