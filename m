Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1TlhNS-0003PJ-0a
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 15:45:41 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 20 Dec 2012 06:29:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,324,1355126400"; d="scan'208";a="260216464"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.157])
	by orsmga002.jf.intel.com with ESMTP; 20 Dec 2012 06:30:50 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Dec 2012 16:31:15 +0200
Message-Id: <1356013875-31929-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] telepathy-glib upgrade to 0.20.1
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
X-List-Received-Date: Thu, 20 Dec 2012 14:45:45 -0000

From: Andrei Dinu <andrei.adrianx.dinu@intel.com>

upgrade from 0.19.8 to 0.20.1

Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../{telepathy-glib_0.19.8.bb => telepathy-glib_0.20.1.bb}       |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.19.8.bb => telepathy-glib_0.20.1.bb} (79%)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.8.bb b/meta/recipes-connectivity/telepathy/telepathy-glib_0.20.1.bb
similarity index 79%
rename from meta/recipes-connectivity/telepathy/telepathy-glib_0.19.8.bb
rename to meta/recipes-connectivity/telepathy/telepathy-glib_0.20.1.bb
index 370a822..a0c3103 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.8.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-glib_0.20.1.bb
@@ -3,13 +3,13 @@ DESCRIPTION = "Telepathy Framework: GLib-based helper library for connection man
 HOMEPAGE = "http://telepathy.freedesktop.org/wiki/"
 DEPENDS = "glib-2.0 dbus python-native-runtime dbus-native dbus-glib"
 LICENSE = "LGPLv2.1+"
-PR = "r2"
+PR = "r0"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-glib/${BPN}-${PV}.tar.gz \
            file://pkgconfig.patch"
 
-SRC_URI[md5sum] = "ffd0953953981473fcd9c373ccb9e882"
-SRC_URI[sha256sum] = "581682a937ee33bd4ce01e17d09b338155a79dff44925b988b0701fdbee50b20"
+SRC_URI[md5sum] = "780034ff7433f33e6577b02fd7a2cb0a"
+SRC_URI[sha256sum] = "01a0343f61fbd389fed9c819751aa75914150aa567472dcb480ced7f4ed261b6"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e413d83db6ee8f2c8e6055719096a48e"
 
-- 
1.7.10.4



