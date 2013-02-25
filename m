Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1U9tzW-0001i2-Jl
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Feb 2013 10:05:03 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 25 Feb 2013 00:48:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,733,1355126400"; d="scan'208";a="291356865"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 25 Feb 2013 00:48:39 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Feb 2013 10:49:01 +0200
Message-Id: <1361782141-18273-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH V2] connman: enable connman client
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
X-List-Received-Date: Mon, 25 Feb 2013 09:05:04 -0000

connmanctl is now included when connman is installed

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/connman/connman.inc |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index b61e2af..b0ede60 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -20,7 +20,7 @@ DEPENDS  = "dbus glib-2.0 ppp iptables gnutls \
             ${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} \
             "
 
-INC_PR = "r17"
+INC_PR = "r18"
 
 TIST = "--enable-tist"
 TIST_powerpc = ""
@@ -38,7 +38,7 @@ EXTRA_OECONF += "\
     --enable-tools \
     --enable-test \
     --disable-polkit \
-    --disable-client \
+    --enable-client \
     --enable-fake \
     ${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdunitdir=${systemd_unitdir}/system/', '', d)} \
 "
@@ -73,6 +73,7 @@ do_install_append() {
 	install -d ${D}${bindir}
 	install -m 0755 ${S}/tools/*-test ${D}${bindir}
 	install -m 0755 ${S}/tools/wispr ${D}${bindir}
+	install -m 0755 ${B}/client/connmanctl ${D}${bindir}
 
 	# We don't need to package an empty directory
 	rmdir ${D}${libdir}/connman/scripts
-- 
1.7.10.4



