Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei.adrianx.dinu@intel.com>) id 1U9wyb-00087U-Iu
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Feb 2013 13:16:29 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 25 Feb 2013 03:59:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,735,1355126400"; d="scan'208";a="205989934"
Received: from adinu-vostro-460 (HELO localhost.localdomain) ([10.237.105.147])
	by AZSMGA002.ch.intel.com with ESMTP; 25 Feb 2013 03:59:52 -0800
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Feb 2013 14:00:12 +0200
Message-Id: <1361793612-26991-1-git-send-email-andrei.adrianx.dinu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] dbus-glib : update to 0.100.1 Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
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
X-List-Received-Date: Mon, 25 Feb 2013 12:16:31 -0000

---
 .../no-examples.patch                              |    0
 .../obsolete_automake_macros.patch                 |    0
 .../test-install-makefile.patch                    |    0
 .../{dbus-glib_0.100.bb => dbus-glib_0.100.1.bb}   |    6 +++---
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-core/dbus/{dbus-glib-0.100 => dbus-glib-0.100.1}/no-examples.patch (100%)
 rename meta/recipes-core/dbus/{dbus-glib-0.100 => dbus-glib-0.100.1}/obsolete_automake_macros.patch (100%)
 rename meta/recipes-core/dbus/{dbus-glib-0.100 => dbus-glib-0.100.1}/test-install-makefile.patch (100%)
 rename meta/recipes-core/dbus/{dbus-glib_0.100.bb => dbus-glib_0.100.1.bb} (13%)

diff --git a/meta/recipes-core/dbus/dbus-glib-0.100/no-examples.patch b/meta/recipes-core/dbus/dbus-glib-0.100.1/no-examples.patch
similarity index 100%
rename from meta/recipes-core/dbus/dbus-glib-0.100/no-examples.patch
rename to meta/recipes-core/dbus/dbus-glib-0.100.1/no-examples.patch
diff --git a/meta/recipes-core/dbus/dbus-glib-0.100/obsolete_automake_macros.patch b/meta/recipes-core/dbus/dbus-glib-0.100.1/obsolete_automake_macros.patch
similarity index 100%
rename from meta/recipes-core/dbus/dbus-glib-0.100/obsolete_automake_macros.patch
rename to meta/recipes-core/dbus/dbus-glib-0.100.1/obsolete_automake_macros.patch
diff --git a/meta/recipes-core/dbus/dbus-glib-0.100/test-install-makefile.patch b/meta/recipes-core/dbus/dbus-glib-0.100.1/test-install-makefile.patch
similarity index 100%
rename from meta/recipes-core/dbus/dbus-glib-0.100/test-install-makefile.patch
rename to meta/recipes-core/dbus/dbus-glib-0.100.1/test-install-makefile.patch
diff --git a/meta/recipes-core/dbus/dbus-glib_0.100.bb b/meta/recipes-core/dbus/dbus-glib_0.100.1.bb
similarity index 13%
rename from meta/recipes-core/dbus/dbus-glib_0.100.bb
rename to meta/recipes-core/dbus/dbus-glib_0.100.1.bb
index ad5aa97..1c4150f 100644
--- a/meta/recipes-core/dbus/dbus-glib_0.100.bb
+++ b/meta/recipes-core/dbus/dbus-glib_0.100.1.bb
@@ -1,6 +1,6 @@
 require dbus-glib.inc
 
-PR = "r2"
+PR = "r0"
 
-SRC_URI[md5sum] = "d33959a9c0c6a158f5ac6d640316e89e"
-SRC_URI[sha256sum] = "80ddf7584a659590103817798dd95d7e451d666f385e5e95a83abf85c46d4605"
+SRC_URI[md5sum] = "d758967b70ea3d5318b62839d5bd440f"
+SRC_URI[sha256sum] = "1f40d0dce4c6fa8998dbd2d915388d574ae962a20e7016fef4bed6c550767800"
-- 
1.7.9.5



