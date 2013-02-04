Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1U2ISd-0004wh-49
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 10:35:35 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 04 Feb 2013 01:19:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,598,1355126400"; d="scan'208";a="252243165"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by azsmga001.ch.intel.com with ESMTP; 04 Feb 2013 01:19:47 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2013 11:20:22 +0200
Message-Id: <4ab45afacced3a8cf9ff71b098cf435d318eedcf.1359967266.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1359967266.git.constantinx.musca@intel.com>
References: <cover.1359967266.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1359967266.git.constantinx.musca@intel.com>
References: <cover.1359967266.git.constantinx.musca@intel.com>
Subject: [PATCH 08/10] consolekit: add arch independent unpackaged files
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
X-List-Received-Date: Mon, 04 Feb 2013 09:35:36 -0000

Fix the following warning:

WARNING: QA Issue: consolekit: Files/directories were installed but not shipped
  /usr/lib
  /usr/lib/ConsoleKit
  /usr/lib/ConsoleKit/run-seat.d
  /usr/lib/ConsoleKit/scripts
  /usr/lib/ConsoleKit/run-session.d
  /usr/lib/ConsoleKit/scripts/ck-system-restart
  /usr/lib/ConsoleKit/scripts/ck-system-stop

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-support/consolekit/consolekit_0.4.5.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/consolekit/consolekit_0.4.5.bb b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
index 67899f6..e510c45 100644
--- a/meta/recipes-support/consolekit/consolekit_0.4.5.bb
+++ b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "ConsoleKit is a framework for defining and tracking users, login
 HOMEPAGE="http://www.freedesktop.org/wiki/Software/ConsoleKit"
 BUGTRACKER="https://bugs.freedesktop.org/buglist.cgi?query_format=specific&product=ConsoleKit"
 
-PR = "r9"
+PR = "r10"
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
@@ -29,7 +29,9 @@ EXTRA_OECONF = "${POLKITCONF} --with-systemdsystemunitdir=${systemd_unitdir}/sys
                 ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam-module --with-pam-module-dir=${base_libdir}/security', '--disable-pam-module', d)} \
                "
 
-FILES_${PN} += "${localstatedir}/log/ConsoleKit ${libdir}/ConsoleKit  ${systemd_unitdir} ${base_libdir} ${datadir}/dbus-1 ${datadir}/PolicyKit ${datadir}/polkit*"
+FILES_${PN} += "${localstatedir}/log/ConsoleKit ${exec_prefix}/lib/ConsoleKit \
+                ${libdir}/ConsoleKit  ${systemd_unitdir} ${base_libdir} \
+                ${datadir}/dbus-1 ${datadir}/PolicyKit ${datadir}/polkit*"
 FILES_${PN}-dbg += "${base_libdir}/security/.debug"
 
 PACKAGES =+ "pam-plugin-ck-connector"
-- 
1.7.11.7



