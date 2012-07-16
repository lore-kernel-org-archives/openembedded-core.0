Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SqnhN-0006tH-TF
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 17:59:02 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jul 2012 08:47:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="193443326"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.178])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jul 2012 08:47:39 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2012 08:47:17 -0700
Message-Id: <39b2a455ab6b7c38b782e1b3e2811c3d9e4de7af.1342453118.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1342453118.git.sgw@linux.intel.com>
References: <cover.1342453118.git.sgw@linux.intel.com>
In-Reply-To: <cover.1342453118.git.sgw@linux.intel.com>
References: <cover.1342453118.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 11/30] python-dbus: upgrade to 1.1.0
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
X-List-Received-Date: Mon, 16 Jul 2012 15:59:04 -0000

From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>

Tested by compiling core-image-basic

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../{python-dbus_1.0.0.bb => python-dbus_1.1.0.bb} |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python-dbus_1.0.0.bb => python-dbus_1.1.0.bb} (82%)

diff --git a/meta/recipes-devtools/python/python-dbus_1.0.0.bb b/meta/recipes-devtools/python/python-dbus_1.1.0.bb
similarity index 82%
rename from meta/recipes-devtools/python/python-dbus_1.0.0.bb
rename to meta/recipes-devtools/python/python-dbus_1.1.0.bb
index 1b174eb..a10fda3 100644
--- a/meta/recipes-devtools/python/python-dbus_1.0.0.bb
+++ b/meta/recipes-devtools/python/python-dbus_1.1.0.bb
@@ -4,12 +4,12 @@ HOMEPAGE = "http://www.freedesktop.org/Software/dbus"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5612614133e9a2f2dad527d97554670"
 DEPENDS = "expat dbus dbus-glib virtual/libintl python-pyrex-native"
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus-python/dbus-python-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "775a8235736bf760cdd96e2d76546469"
-SRC_URI[sha256sum] = "9e46f97d739dde8a5ab33ec6b11da58794c4c20804aacdad2880b7d3bc05187a"
+SRC_URI[md5sum] = "41a459bbbb5fd92eeebd632623af0bd7"
+SRC_URI[sha256sum] = "2dc30b53cdb2e20f8d0265af3be878e9da68745cf9ccc72f75de869094c4fc60"
 S = "${WORKDIR}/dbus-python-${PV}"
 
 inherit distutils-base autotools pkgconfig
-- 
1.7.7.6



