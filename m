Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1Tlhw1-0006jD-8V
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 16:21:21 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 20 Dec 2012 07:05:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,324,1355126400"; d="scan'208";a="265045416"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.157])
	by fmsmga001.fm.intel.com with ESMTP; 20 Dec 2012 07:05:30 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Dec 2012 17:05:55 +0200
Message-Id: <1356015955-24078-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] telepathy-mission-control: upgrade to 5.14.0
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
X-List-Received-Date: Thu, 20 Dec 2012 15:21:23 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 ...n-control_5.13.0.bb => telepathy-mission-control_5.14.0.bb} |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-connectivity/telepathy/{telepathy-mission-control_5.13.0.bb => telepathy-mission-control_5.14.0.bb} (87%)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.13.0.bb b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.14.0.bb
similarity index 87%
rename from meta/recipes-connectivity/telepathy/telepathy-mission-control_5.13.0.bb
rename to meta/recipes-connectivity/telepathy/telepathy-mission-control_5.14.0.bb
index 55ae117..7caacb4 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.13.0.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.14.0.bb
@@ -8,7 +8,7 @@ DEPENDS = "libtelepathy dbus-glib gconf"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-mission-control/telepathy-mission-control-${PV}.tar.gz"
 
-PR = "r1"
+PR = "r0"
 
 inherit autotools pkgconfig
 
@@ -32,7 +32,7 @@ FILES_libmissioncontrol-server = "${libdir}/libmissioncontrol-server.so.*"
 
 FILES_libmissioncontrol-dev = "${libdir}/libmissioncontrol.* \
                                ${includedir}/libmissioncontrol/ \
-                	       ${libdir}/pkgconfig/libmissioncontrol.pc"
+                               ${libdir}/pkgconfig/libmissioncontrol.pc"
 FILES_libmissioncontrol-config-dev = "${libdir}/libmissioncontrol-config.*"
 FILES_libmissioncontrol-server-dev = "${libdir}/libmissioncontrol-server.*"
 
@@ -40,5 +40,5 @@ FILES_libmissioncontrol-dbg = "${libdir}/.debug/libmissioncontrol.so.*"
 FILES_libmissioncontrol-config-dbg = "${libdir}/.debug/libmissioncontrol-config.so.*"
 FILES_libmissioncontrol-server-dbg = "${libdir}/.debug/libmissioncontrol-server.so.*"
 
-SRC_URI[md5sum] = "8b0c82136467d1188d4fa7f032cd3beb"
-SRC_URI[sha256sum] = "b546da6bd1a1ac16f8a1db67b7673673e007ecaf9844da405c50acbcef0118eb"
+SRC_URI[md5sum] = "483fa8860891815a540ecf1bb9155122"
+SRC_URI[sha256sum] = "58e0047f5292836c2c35e1603a908b3ac20a5c0b183869514c63de339fd48a30"
-- 
1.7.10.4



