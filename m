Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1T8ZtE-0001A9-Rx
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 18:52:45 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 03 Sep 2012 09:40:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,360,1344236400"; d="scan'208";a="188269347"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.156])
	by azsmga001.ch.intel.com with ESMTP; 03 Sep 2012 09:40:24 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2012 18:45:17 +0300
Message-Id: <f50d288d51d344c519ca18374edd37c8032b5241.1346686600.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1346686600.git.constantinx.musca@intel.com>
References: <cover.1346686600.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1346686600.git.constantinx.musca@intel.com>
References: <cover.1346686600.git.constantinx.musca@intel.com>
Subject: [PATCH 2/9] gypsy: upgrade to 0.9
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
X-List-Received-Date: Mon, 03 Sep 2012 16:52:45 -0000

fix-unused-but-set-variable-warning.patch: removed
	- included in the new version

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../fix-unused-but-set-variable-warning.patch      |   18 ------------------
 .../gypsy/{gypsy_0.8.bb => gypsy_0.9.bb}           |   10 ++++------
 2 files changed, 4 insertions(+), 24 deletions(-)
 delete mode 100644 meta/recipes-connectivity/gypsy/files/fix-unused-but-set-variable-warning.patch
 rename meta/recipes-connectivity/gypsy/{gypsy_0.8.bb => gypsy_0.9.bb} (79%)

diff --git a/meta/recipes-connectivity/gypsy/files/fix-unused-but-set-variable-warning.patch b/meta/recipes-connectivity/gypsy/files/fix-unused-but-set-variable-warning.patch
deleted file mode 100644
index d276b2c..0000000
--- a/meta/recipes-connectivity/gypsy/files/fix-unused-but-set-variable-warning.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Upstream-Status: Accepted
-
-Index: gypsy-0.8/gypsy/gypsy-time.c
-===================================================================
---- gypsy-0.8.orig/gypsy/gypsy-time.c
-+++ gypsy-0.8/gypsy/gypsy-time.c
-@@ -156,10 +156,10 @@ get_property (GObject    *object,
- 	      GParamSpec *pspec)
- {
- 	GypsyTimePrivate *priv;
--
- 	priv = GET_PRIVATE (object);
- 	switch (prop_id) {
- 	case PROP_PATH:
-+		g_value_set_string (value, priv->object_path);
- 		break;
- 
- 	default:
diff --git a/meta/recipes-connectivity/gypsy/gypsy_0.8.bb b/meta/recipes-connectivity/gypsy/gypsy_0.9.bb
similarity index 79%
rename from meta/recipes-connectivity/gypsy/gypsy_0.8.bb
rename to meta/recipes-connectivity/gypsy/gypsy_0.9.bb
index e701838..9b99267 100644
--- a/meta/recipes-connectivity/gypsy/gypsy_0.8.bb
+++ b/meta/recipes-connectivity/gypsy/gypsy_0.9.bb
@@ -13,14 +13,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
 SECTION = "x11"
 DEPENDS = "glib-2.0 dbus bluez4 dbus-glib libxslt"
 
-SRC_URI = "http://gypsy.freedesktop.org/releases/gypsy-${PV}.tar.gz \
-           file://fix-unused-but-set-variable-warning.patch \
-          "
-PR = "r3"
+SRC_URI = "http://gypsy.freedesktop.org/releases/gypsy-${PV}.tar.gz"
+PR = "r0"
 
 inherit autotools pkgconfig
 
 FILES_${PN} += "/usr/share/dbus-1/system-services/"
 
-SRC_URI[md5sum] = "32b8db24db86d2dac87b391dd255f4bf"
-SRC_URI[sha256sum] = "1986a58189614a950725c3bc7d05faa3b84695f35cb696326f340ef87fc3acaa"
+SRC_URI[md5sum] = "e2d186df9c2cc3b70a027043e22acf1a"
+SRC_URI[sha256sum] = "14e1cbe17351f408538e033ca370b4bf51ccf9c88744e236ddfb271904f154d6"
-- 
1.7.9.5



