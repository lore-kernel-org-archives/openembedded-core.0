Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1U0DIb-0001Pq-5t
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 16:40:40 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 Jan 2013 07:23:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,561,1355126400"; d="scan'208";a="278046907"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.105.59])
	by orsmga002.jf.intel.com with ESMTP; 29 Jan 2013 07:24:57 -0800
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Jan 2013 17:24:43 +0200
Message-Id: <1359473084-592-2-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1359473084-592-1-git-send-email-radu.moisan@intel.com>
References: <1359473084-592-1-git-send-email-radu.moisan@intel.com>
Subject: [PATCH 1/2] systemd: Remove -systemd postfix
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
X-List-Received-Date: Tue, 29 Jan 2013 15:40:42 -0000

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 meta/recipes-core/systemd/systemd_196.bb |    9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_196.bb b/meta/recipes-core/systemd/systemd_196.bb
index 2854aae..69a4387 100644
--- a/meta/recipes-core/systemd/systemd_196.bb
+++ b/meta/recipes-core/systemd/systemd_196.bb
@@ -171,7 +171,7 @@ FILES_${PN} = " ${base_bindir}/* \
 FILES_${PN}-dbg += "${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
 FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
 
-RDEPENDS_${PN} += "dbus udev-systemd"
+RDEPENDS_${PN} += "dbus udev"
 
 # kbd -> loadkeys,setfont
 # systemd calls 'modprobe -sab --', which busybox doesn't support due to lack
@@ -188,7 +188,7 @@ RRECOMMENDS_${PN} += "systemd-serialgetty \
                       kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 \
 "
 
-PACKAGES =+ "udev-dbg udev udev-consolekit udev-utils udev-systemd"
+PACKAGES =+ "udev-dbg udev udev-consolekit udev-utils"
 
 FILES_udev-dbg += "/lib/udev/.debug"
 
@@ -218,6 +218,8 @@ FILES_udev += "${base_sbindir}/udevd \
                /lib/udev/rules.d/95*.rules \
                ${base_libdir}/udev/hwdb.d \
                ${sysconfdir}/udev \
+               ${systemd_unitdir}/system/*udev* \
+               ${systemd_unitdir}/system/*.wants/*udev* \
               "
 
 FILES_udev-consolekit += "/lib/ConsoleKit"
@@ -225,9 +227,6 @@ RDEPENDS_udev-consolekit += "${@base_contains('DISTRO_FEATURES', 'x11', 'console
 
 FILES_udev-utils = "${bindir}/udevadm"
 
-FILES_udev-systemd = "${systemd_unitdir}/system/*udev* ${systemd_unitdir}/system/*.wants/*udev*"
-RDEPENDS_udev-systemd = "udev"
-
 # TODO:
 # u-a for runlevel and telinit
 
-- 
1.7.9.5



