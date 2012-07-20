Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1SsAIU-0003YY-Ub
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 12:18:59 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 20 Jul 2012 03:07:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="170754639"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.53])
	by azsmga001.ch.intel.com with ESMTP; 20 Jul 2012 03:07:32 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jul 2012 13:07:41 +0300
Message-Id: <1342778862-503-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 1/2] libcanberra: upgrade to ver. 0.29
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
X-List-Received-Date: Fri, 20 Jul 2012 10:18:59 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../{libcanberra_0.28.bb => libcanberra_0.29.bb}   |   14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-multimedia/pulseaudio/{libcanberra_0.28.bb => libcanberra_0.29.bb} (76%)

diff --git a/meta/recipes-multimedia/pulseaudio/libcanberra_0.28.bb b/meta/recipes-multimedia/pulseaudio/libcanberra_0.29.bb
similarity index 76%
rename from meta/recipes-multimedia/pulseaudio/libcanberra_0.28.bb
rename to meta/recipes-multimedia/pulseaudio/libcanberra_0.29.bb
index e69c89d..27020c5 100644
--- a/meta/recipes-multimedia/pulseaudio/libcanberra_0.28.bb
+++ b/meta/recipes-multimedia/pulseaudio/libcanberra_0.29.bb
@@ -5,14 +5,14 @@ LIC_FILES_CHKSUM = "file://LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://src/canberra.h;beginline=7;endline=24;md5=c616c687cf8da540a14f917e0d23ab03"
 
 DEPENDS = "gtk+ pulseaudio alsa-lib libtool libvorbis"
-PR = "r1"
+PR = "r0"
 
 inherit gconf autotools
 
-SRC_URI = "http://0pointer.de/lennart/projects/libcanberra/libcanberra-${PV}.tar.gz"
+SRC_URI = "http://0pointer.de/lennart/projects/libcanberra/libcanberra-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "c198b4811598c4c161ff505e4531b02c"
-SRC_URI[sha256sum] = "eb1f8b2cabad7f07b6e44d606a91d73e1efca4b46daf92bd553e7222bc68868c"
+SRC_URI[md5sum] = "2594093a5d61047bd9cc87e955f86df8"
+SRC_URI[sha256sum] = "127a5ef07805856d63758e5180ebfb241d1f80094fd301c287591a15b8cfcd72"
 
 EXTRA_OECONF = " --disable-oss --disable-ltdl-install" 
 
@@ -25,8 +25,8 @@ PACKAGES += "${PN}-gnome"
 FILES_${PN} += "${libdir}/gtk-2.0/modules/ ${datadir}/gnome"
 FILES_${PN}-gnome += "${datadir}/gdm/autostart/LoginWindow/libcanberra-ready-sound.desktop \
 	              ${libdir}/gnome-settings-daemon-3.0/gtk-modules/canberra-gtk-module.desktop"
-FILES_${PN}-dev += "${libdir}/libcanberra-0.28/libcanberra-*.so \
-		    ${libdir}/libcanberra-0.28/libcanberra-*.la \
+FILES_${PN}-dev += "${libdir}/libcanberra-${PV}/libcanberra-*.so \
+		    ${libdir}/libcanberra-${PV}/libcanberra-*.la \
 		    ${datadir}/vala/vapi"
-FILES_${PN}-dbg += "${libdir}/gtk-2.0/modules/.debug ${libdir}/libcanberra-0.28/.debug"
+FILES_${PN}-dbg += "${libdir}/gtk-2.0/modules/.debug ${libdir}/libcanberra-${PV}/.debug"
 
-- 
1.7.9.5



