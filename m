Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SNdVk-00018l-Ru
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 07:14:29 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 26 Apr 2012 22:04:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="93712564"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.110])
	by AZSMGA002.ch.intel.com with ESMTP; 26 Apr 2012 22:04:52 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Apr 2012 13:04:06 +0800
Message-Id: <87b92e38deaa987f3d0917913a70438b8f404a32.1335498445.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <f640dfb6acb1d703fefae61226547773f82a2a07.1335498445.git.lianhao.lu@intel.com>
References: <f640dfb6acb1d703fefae61226547773f82a2a07.1335498445.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1335498445.git.lianhao.lu@intel.com>
References: <cover.1335498445.git.lianhao.lu@intel.com>
Subject: [PATCH 6/7] xorg-app: Use ${libdir} for packaging.
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
X-List-Received-Date: Fri, 27 Apr 2012 05:14:29 -0000

Used ${libdir} instead of hard coded "/usr/lib" for packaging.

Also included INC_PR in PR.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/recipes-graphics/xorg-app/mkfontdir_1.0.7.bb  |    2 +-
 .../recipes-graphics/xorg-app/mkfontscale_1.1.0.bb |    2 ++
 meta/recipes-graphics/xorg-app/x11perf_1.5.4.bb    |    2 +-
 meta/recipes-graphics/xorg-app/xauth_1.0.6.bb      |    2 +-
 meta/recipes-graphics/xorg-app/xdpyinfo_1.3.0.bb   |    2 +-
 meta/recipes-graphics/xorg-app/xhost_1.0.4.bb      |    2 +-
 meta/recipes-graphics/xorg-app/xinit_1.3.2.bb      |    2 +-
 meta/recipes-graphics/xorg-app/xinput_1.5.3.bb     |    2 +-
 meta/recipes-graphics/xorg-app/xkbcomp_1.2.3.bb    |    2 ++
 meta/recipes-graphics/xorg-app/xmodmap_1.0.5.bb    |    2 +-
 meta/recipes-graphics/xorg-app/xorg-app-common.inc |    4 ++--
 meta/recipes-graphics/xorg-app/xprop_1.2.1.bb      |    2 +-
 meta/recipes-graphics/xorg-app/xrandr_1.3.5.bb     |    2 +-
 meta/recipes-graphics/xorg-app/xset_1.2.2.bb       |    2 +-
 meta/recipes-graphics/xorg-app/xvinfo_1.1.1.bb     |    1 +
 meta/recipes-graphics/xorg-app/xwininfo_1.1.2.bb   |    2 +-
 16 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-graphics/xorg-app/mkfontdir_1.0.7.bb b/meta/recipes-graphics/xorg-app/mkfontdir_1.0.7.bb
index db6d2b4..6637326 100644
--- a/meta/recipes-graphics/xorg-app/mkfontdir_1.0.7.bb
+++ b/meta/recipes-graphics/xorg-app/mkfontdir_1.0.7.bb
@@ -9,7 +9,7 @@ The X server and font server use these files to find the available font \
 files."
 
 PE = "1"
-PR = "r0"
+PR = "${INC_PR}.0"
 
 RDEPENDS_${PN} += "mkfontscale"
 RDEPENDS_${PN}_virtclass-native += "mkfontscale-native"
diff --git a/meta/recipes-graphics/xorg-app/mkfontscale_1.1.0.bb b/meta/recipes-graphics/xorg-app/mkfontscale_1.1.0.bb
index 49706e5..d98057b 100644
--- a/meta/recipes-graphics/xorg-app/mkfontscale_1.1.0.bb
+++ b/meta/recipes-graphics/xorg-app/mkfontscale_1.1.0.bb
@@ -10,6 +10,8 @@ is used by the mkfontdir program."
 
 DEPENDS += " zlib libfontenc freetype virtual/libx11"
 
+PR = "${INC_PR}.0"
+
 BBCLASSEXTEND = "native"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e0d129d05305176d1a790e0ac1acb7f"
diff --git a/meta/recipes-graphics/xorg-app/x11perf_1.5.4.bb b/meta/recipes-graphics/xorg-app/x11perf_1.5.4.bb
index 15fa314..cc0b323 100644
--- a/meta/recipes-graphics/xorg-app/x11perf_1.5.4.bb
+++ b/meta/recipes-graphics/xorg-app/x11perf_1.5.4.bb
@@ -11,7 +11,7 @@ DEPENDS += "libxmu libxrender libxft libxext fontconfig"
 LIC_FILES_CHKSUM = "file://COPYING;md5=428ca4d67a41fcd4fc3283dce9bbda7e \
                     file://x11perf.h;endline=24;md5=29555066baf406a105ff917ac25b2d01"
 
-PR = "r0"
+PR = "${INC_PR}.0"
 PE = "1"
 
 FILES_${PN} += "${libdir}/X11/x11perfcomp/*"
diff --git a/meta/recipes-graphics/xorg-app/xauth_1.0.6.bb b/meta/recipes-graphics/xorg-app/xauth_1.0.6.bb
index f00d30a..c43d0eb 100644
--- a/meta/recipes-graphics/xorg-app/xauth_1.0.6.bb
+++ b/meta/recipes-graphics/xorg-app/xauth_1.0.6.bb
@@ -6,7 +6,7 @@ information used in connecting to the X server."
 LIC_FILES_CHKSUM = "file://COPYING;md5=5ec74dd7ea4d10c4715a7c44f159a40b"
 
 DEPENDS += "libxau libxext libxmu"
-PR = "r0"
+PR = "${INC_PR}.0"
 PE = "1"
 
 SRC_URI[md5sum] = "105f5b00bb9293b3db36f7e500d4f950"
diff --git a/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.0.bb b/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.0.bb
index a118d0d..ae3cc8c 100644
--- a/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.0.bb
+++ b/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.0.bb
@@ -10,7 +10,7 @@ that are available."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f3d09e6b9e203a1af489e16c708f4fb3"
 DEPENDS += "libxtst libxext libxxf86vm libxxf86dga libxxf86misc libxi libxrender libxinerama libdmx libxp libxau"
-PR = "r0"
+PR = "${INC_PR}.0"
 PE = "1"
 
 SRC_URI += "file://disable-xkb.patch"
diff --git a/meta/recipes-graphics/xorg-app/xhost_1.0.4.bb b/meta/recipes-graphics/xorg-app/xhost_1.0.4.bb
index 9330228..7a78f80 100644
--- a/meta/recipes-graphics/xorg-app/xhost_1.0.4.bb
+++ b/meta/recipes-graphics/xorg-app/xhost_1.0.4.bb
@@ -11,7 +11,7 @@ protocol for passing other authentication data to the server."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=8fbed71dddf48541818cef8079124199"
 DEPENDS += "libxmu libxau"
-PR = "r0"
+PR = "${INC_PR}.0"
 PE = "1"
 
 SRC_URI[md5sum] = "2be663a0afbcc0856c1591477d5bf32a"
diff --git a/meta/recipes-graphics/xorg-app/xinit_1.3.2.bb b/meta/recipes-graphics/xorg-app/xinit_1.3.2.bb
index cb3e028..2008e79 100644
--- a/meta/recipes-graphics/xorg-app/xinit_1.3.2.bb
+++ b/meta/recipes-graphics/xorg-app/xinit_1.3.2.bb
@@ -10,7 +10,7 @@ then terminate."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=0d4b5eef75f1584ccbdc5e4a34314407"
 
-PR = "r0"
+PR = "${INC_PR}.0"
 PE = "1"
 
 SRC_URI[md5sum] = "9c0943cbd83e489ad1b05221b97efd44"
diff --git a/meta/recipes-graphics/xorg-app/xinput_1.5.3.bb b/meta/recipes-graphics/xorg-app/xinput_1.5.3.bb
index 8f17e9a..6790f60 100644
--- a/meta/recipes-graphics/xorg-app/xinput_1.5.3.bb
+++ b/meta/recipes-graphics/xorg-app/xinput_1.5.3.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=22c34ea36136407a77702a8b784f9bd0"
 
 DEPENDS += " libxi"
 
-PR = "r7"
+PR = "${INC_PR}.7"
 
 SRC_URI[md5sum] = "1e2f0ad4f3fa833b65c568907f171d28"
 SRC_URI[sha256sum] = "6aade131cecddaeefc39ddce1dd5e8473f6039c2e4efbfd9fbb5ee2a75885c76"
diff --git a/meta/recipes-graphics/xorg-app/xkbcomp_1.2.3.bb b/meta/recipes-graphics/xorg-app/xkbcomp_1.2.3.bb
index d8b3e7a..f5f0870 100644
--- a/meta/recipes-graphics/xorg-app/xkbcomp_1.2.3.bb
+++ b/meta/recipes-graphics/xorg-app/xkbcomp_1.2.3.bb
@@ -9,6 +9,8 @@ be read directly by XKB-capable X servers or utilities."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=08436e4f4476964e2e2dd7e7e41e076a"
 
+PR = "${INC_PR}.0"
+
 DEPENDS += "libxkbfile"
 
 SRC_URI[md5sum] = "35622a497894c1cff9182d42696c3e27"
diff --git a/meta/recipes-graphics/xorg-app/xmodmap_1.0.5.bb b/meta/recipes-graphics/xorg-app/xmodmap_1.0.5.bb
index e98ed4f..2c9ecde 100644
--- a/meta/recipes-graphics/xorg-app/xmodmap_1.0.5.bb
+++ b/meta/recipes-graphics/xorg-app/xmodmap_1.0.5.bb
@@ -11,7 +11,7 @@ according to personal tastes."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eef098b27f09d0ac39268df0cc2c00b5"
 
-PR = "r0"
+PR = "${INC_PR}.0"
 PE = "1"
 
 SRC_URI[md5sum] = "b18850d373f3717dca569377c449d091"
diff --git a/meta/recipes-graphics/xorg-app/xorg-app-common.inc b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
index 890648b..d0b4b65 100644
--- a/meta/recipes-graphics/xorg-app/xorg-app-common.inc
+++ b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
@@ -5,7 +5,7 @@ SECTION = "x11/apps"
 LICENSE = "MIT-X"
 DEPENDS = "util-macros-native virtual/libx11"
 
-INC_PR = "r7"
+INC_PR = "r8"
 
 SRC_URI = "${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar.bz2"
 
@@ -13,4 +13,4 @@ S = "${WORKDIR}/${BPN}-${PV}"
 
 inherit autotools pkgconfig
 
-FILES_${PN} += "  /usr/lib/X11/${BPN} /usr/share/X11/app-defaults/"
+FILES_${PN} += " ${libdir}/X11/${BPN} /usr/share/X11/app-defaults/"
diff --git a/meta/recipes-graphics/xorg-app/xprop_1.2.1.bb b/meta/recipes-graphics/xorg-app/xprop_1.2.1.bb
index 6c07230..c74beb4 100644
--- a/meta/recipes-graphics/xorg-app/xprop_1.2.1.bb
+++ b/meta/recipes-graphics/xorg-app/xprop_1.2.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e226ab8db88ac0bc0391673be40c9f91"
 
 DEPENDS += " libxmu virtual/libx11"
 
-PR = "r0"
+PR = "${INC_PR}.0"
 PE = "1"
 
 SRC_URI[md5sum] = "d5529dc8d811efabd136ca2d8e857deb"
diff --git a/meta/recipes-graphics/xorg-app/xrandr_1.3.5.bb b/meta/recipes-graphics/xorg-app/xrandr_1.3.5.bb
index 4410865..da83e8f 100644
--- a/meta/recipes-graphics/xorg-app/xrandr_1.3.5.bb
+++ b/meta/recipes-graphics/xorg-app/xrandr_1.3.5.bb
@@ -10,7 +10,7 @@ LICENSE= "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fe1608bdb33cf8c62a4438f7d34679b3"
 DEPENDS += "libxrandr libxrender"
 PE = "1"
-PR = "r1"
+PR = "${INC_PR}.1"
 
 SRC_URI[md5sum] = "9735173a84dca9b05e06fd4686196b07"
 SRC_URI[sha256sum] = "1059ff7a9ad0df8e00a765ffa4e08a505304c02663112da370ac7082030b980e"
diff --git a/meta/recipes-graphics/xorg-app/xset_1.2.2.bb b/meta/recipes-graphics/xorg-app/xset_1.2.2.bb
index 7d5ac49..0430f8c 100644
--- a/meta/recipes-graphics/xorg-app/xset_1.2.2.bb
+++ b/meta/recipes-graphics/xorg-app/xset_1.2.2.bb
@@ -8,7 +8,7 @@ preference options of the display."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bea81cc9827cdf1af0e12c2b8228cf8d"
 DEPENDS += "libxext libxxf86misc libxfontcache libxmu libxp libxau"
-PR = "r0"
+PR = "${INC_PR}.0"
 PE = "1"
 
 SRC_URI += "file://disable-xkb.patch"
diff --git a/meta/recipes-graphics/xorg-app/xvinfo_1.1.1.bb b/meta/recipes-graphics/xorg-app/xvinfo_1.1.1.bb
index 7a0b822..66d2561 100644
--- a/meta/recipes-graphics/xorg-app/xvinfo_1.1.1.bb
+++ b/meta/recipes-graphics/xorg-app/xvinfo_1.1.1.bb
@@ -9,6 +9,7 @@ extension."
 LIC_FILES_CHKSUM = "file://COPYING;md5=b664101ad7a1dc758a4c4109bf978e68"
 DEPENDS += " libxv"
 PE = "1"
+PR = "${INC_PR}.0"
 
 SRC_URI[md5sum] = "c88feb501083951a8f47a21aaeb1529d"
 SRC_URI[sha256sum] = "60c74aa190bcf1e244f6f1576dc43869018a8ed5ba319703a5c198d3466a3985"
diff --git a/meta/recipes-graphics/xorg-app/xwininfo_1.1.2.bb b/meta/recipes-graphics/xorg-app/xwininfo_1.1.2.bb
index cbc4587..c033e2b 100644
--- a/meta/recipes-graphics/xorg-app/xwininfo_1.1.2.bb
+++ b/meta/recipes-graphics/xorg-app/xwininfo_1.1.2.bb
@@ -9,7 +9,7 @@ and a number of other items."
 LIC_FILES_CHKSUM = "file://COPYING;md5=78976cd3115f6faf615accc4e094d90e"
 DEPENDS += "libxext libxmu"
 
-PR = "r0"
+PR = "${INC_PR}.0"
 PE = "0"
 
 SRC_URI[md5sum] = "9e8b58c8aa6172e87ab4f9cf3612fedd"
-- 
1.7.0.4



