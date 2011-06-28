Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QbT1t-0005tX-2o
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 09:48:17 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Jun 2011 00:44:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,436,1304319600"; d="scan'208";a="21367614"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by fmsmga002.fm.intel.com with ESMTP; 28 Jun 2011 00:44:34 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jun 2011 15:42:57 +0800
Message-Id: <2c83cbe9b56b589ad8786d8d371c2d85810b31f2.1309246787.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1309246787.git.edwin.zhai@intel.com>
References: <cover.1309246787.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1309246787.git.edwin.zhai@intel.com>
References: <cover.1309246787.git.edwin.zhai@intel.com>
Subject: [PATCH 1/3] glib-networking: Add 2.28.7 as new recipe
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
X-List-Received-Date: Tue, 28 Jun 2011 07:48:17 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

glib-networking contains the implementations of certain GLib networking
features that cannot be implemented directly in GLib itself because of their
dependencies. TLS/SSL support is one of them, which is needed for accessing SSL
web page.

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../glib-networking/glib-networking_2.28.7.bb      |   21 ++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-core/glib-networking/glib-networking_2.28.7.bb

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.28.7.bb b/meta/recipes-core/glib-networking/glib-networking_2.28.7.bb
new file mode 100644
index 0000000..64fff50
--- /dev/null
+++ b/meta/recipes-core/glib-networking/glib-networking_2.28.7.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "glib-networking contains the implementations of certain GLib networking features that cannot be implemented directly in GLib itself because of their dependencies."
+HOMEPAGE = "http://git.gnome.org/browse/glib-networking/"
+BUGTRACKER = "http://bugzilla.gnome.org"
+
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
+
+SECTION = "libs"
+DEPENDS = "glib-2.0 gnutls"
+
+PR = "r0"
+
+SRC_URI = "${GNOME_MIRROR}/${PN}/2.28/${PN}-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "c10e51571d03c10111a37bcd21fbf777"
+SRC_URI[sha256sum] = "98bedfbd530c4b1b53c91025fe82290bafd289d249e4eb549c3b90d23a76021c"
+
+inherit autotools pkgconfig
+
+FILES_${PN} += "${libdir}/gio/modules/libgio* ${datadir}/dbus-1/services/"
+FILES_${PN}-dbg += "${libdir}/gio/modules/.debug/"
-- 
1.7.1



