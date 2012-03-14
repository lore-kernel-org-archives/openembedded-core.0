Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7jmj-0004Xk-9T
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 09:42:18 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 14 Mar 2012 01:33:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="138551619"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.152])
	by fmsmga002.fm.intel.com with ESMTP; 14 Mar 2012 01:33:28 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Mar 2012 01:33:20 -0700
Message-Id: <90bfc74c2522eb6df7c3955579223eec3c85899b.1331713807.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1331713807.git.sgw@linux.intel.com>
References: <cover.1331713807.git.sgw@linux.intel.com>
In-Reply-To: <cover.1331713807.git.sgw@linux.intel.com>
References: <cover.1331713807.git.sgw@linux.intel.com>
Subject: [PATCH 09/14] avahi: Update to 0.6.31
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
X-List-Received-Date: Wed, 14 Mar 2012 08:42:18 -0000

Removed unneeded patch, because the issue was fixed upstream

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../{avahi-ui_0.6.30.bb => avahi-ui_0.6.31.bb}     |    8 ++++----
 meta/recipes-connectivity/avahi/avahi.inc          |    6 +++---
 .../avahi/{avahi_0.6.30.bb => avahi_0.6.31.bb}     |    6 +++---
 3 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-connectivity/avahi/{avahi-ui_0.6.30.bb => avahi-ui_0.6.31.bb} (93%)
 rename meta/recipes-connectivity/avahi/{avahi_0.6.30.bb => avahi_0.6.31.bb} (80%)

diff --git a/meta/recipes-connectivity/avahi/avahi-ui_0.6.30.bb b/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb
similarity index 93%
rename from meta/recipes-connectivity/avahi/avahi-ui_0.6.30.bb
rename to meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb
index d7b9ed8..2c12053 100644
--- a/meta/recipes-connectivity/avahi/avahi-ui_0.6.30.bb
+++ b/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb
@@ -6,7 +6,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
 
 require avahi.inc
 
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "2f22745b8f7368ad5a0a3fddac343f2d"
+SRC_URI[sha256sum] = "8372719b24e2dd75de6f59bb1315e600db4fd092805bd1201ed0cb651a2dab48"
 
 DEPENDS += "avahi gtk+ libglade"
 
@@ -34,9 +37,6 @@ RDEPENDS_avahi-discover = "python-avahi python-pygtk"
 RDEPENDS_python-avahi = "python-dbus"
 
 
-SRC_URI[md5sum] = "e4db89a2a403ff4c47d66ac66fad1f43"
-SRC_URI[sha256sum] = "f9e4316c2339d0020726edd846d01bee0c39980906db0c247479e5807457ff1f"
-
 do_install_append () {
 	rm ${D}${sysconfdir} -rf
 	rm ${D}${base_libdir} -rf
diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index 5e29b9c..0308095 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -14,15 +14,14 @@ SECTION = "network"
 # python scripts are under GPLv2+
 LICENSE = "GPLv2+ & LGPLv2.1+"
 
-INC_PR = "r11"
+INC_PR = "r0"
 
 DEPENDS = "expat libcap libdaemon dbus glib-2.0"
 
 SRC_URI = "http://avahi.org/download/avahi-${PV}.tar.gz \
           file://00avahi-autoipd \
           file://99avahi-autoipd \
-          file://initscript.patch \
-          file://fix_for_automake_1.11.2.patch"
+          file://initscript.patch" 
 
 USERADD_PACKAGES = "avahi-daemon"
 USERADD_PARAM_avahi-daemon = "--system --home /var/run/avahi-daemon \
@@ -113,6 +112,7 @@ do_install() {
 	# if /var/run become non-empty in the future, need to install it via volatile
 	rm -rf ${D}/var/run
 	rm -rf ${D}${datadir}/dbus-1/interfaces
+	rm -rf ${D}/usr/lib/avahi
 }
 
 do_install_avahi-autoipd() {
diff --git a/meta/recipes-connectivity/avahi/avahi_0.6.30.bb b/meta/recipes-connectivity/avahi/avahi_0.6.31.bb
similarity index 80%
rename from meta/recipes-connectivity/avahi/avahi_0.6.30.bb
rename to meta/recipes-connectivity/avahi/avahi_0.6.31.bb
index 692a5df..e56bb1d 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.6.30.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.6.31.bb
@@ -8,9 +8,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
 
 PR = "${INC_PR}.0"
 
+SRC_URI[md5sum] = "2f22745b8f7368ad5a0a3fddac343f2d"
+SRC_URI[sha256sum] = "8372719b24e2dd75de6f59bb1315e600db4fd092805bd1201ed0cb651a2dab48"
+
 DEPENDS += "intltool-native"
 
 PACKAGES =+ "libavahi-gobject"
-
-SRC_URI[md5sum] = "e4db89a2a403ff4c47d66ac66fad1f43"
-SRC_URI[sha256sum] = "f9e4316c2339d0020726edd846d01bee0c39980906db0c247479e5807457ff1f"
-- 
1.7.7.6



