Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S8GHY-00032X-Bt
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 20:24:16 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Mar 2012 12:15:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="121397474"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.152])
	by orsmga002.jf.intel.com with ESMTP; 15 Mar 2012 12:15:27 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2012 12:15:22 -0700
Message-Id: <a5778a9726f2bcdd1329485c56c39f81c55cf4d4.1331837170.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1331837170.git.sgw@linux.intel.com>
References: <cover.1331837170.git.sgw@linux.intel.com>
In-Reply-To: <cover.1331837170.git.sgw@linux.intel.com>
References: <cover.1331837170.git.sgw@linux.intel.com>
Subject: [PATCH 10/11] telepathy-glib: remove package warnings
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
X-List-Received-Date: Thu, 15 Mar 2012 19:24:16 -0000

WARNING: For recipe telepathy-glib, the following files/directories were installed but not shipped in any package:
WARNING:   /srv
WARNING:   /usr/bin
WARNING:   /usr/libexec
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../telepathy/telepathy-glib_0.17.4.bb             |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-glib_0.17.4.bb b/meta/recipes-connectivity/telepathy/telepathy-glib_0.17.4.bb
index 731ab74..4ded4e5 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-glib_0.17.4.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-glib_0.17.4.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Telepathy Framework: GLib-based helper library for connection man
 HOMEPAGE = "http://telepathy.freedesktop.org/wiki/"
 DEPENDS = "glib-2.0 dbus python-native-runtime dbus-native dbus-glib"
 LICENSE = "LGPLv2.1+"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-glib/${BPN}-${PV}.tar.gz"
 
@@ -17,3 +17,8 @@ inherit autotools pkgconfig gettext
 FILES_${PN} += "${datadir}/telepathy \
                 ${datadir}/dbus-1"
 
+do_install_append() {
+	rmdir ${D}${bindir}
+	rmdir ${D}${libexecdir}
+	rmdir ${D}${serivcedir}
+}
-- 
1.7.7.6



