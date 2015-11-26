Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id BD8F06011F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 14:29:09 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Nov 2015 06:29:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,347,1444719600"; d="scan'208";a="829574702"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 26 Nov 2015 06:29:10 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Nov 2015 16:26:16 +0200
Message-Id: <afdad36ba78a7b48d0e1c6045aec4d793c9e0e50.1448547850.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
References: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
References: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 13/29] gconf: enable gobject-introspection
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Nov 2015 14:29:09 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-gnome/gnome/gconf_3.2.6.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gconf_3.2.6.bb b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
index 17fdafa..8bb5094 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.6.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
@@ -3,8 +3,8 @@ SECTION = "x11/gnome"
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 
-DEPENDS = "glib-2.0 dbus dbus-glib libxml2 intltool-native gobject-introspection-stub"
-DEPENDS_class-native = "glib-2.0-native dbus-native dbus-glib-native libxml2-native intltool-native gnome-common-native gobject-introspection-stub-native"
+DEPENDS = "glib-2.0 dbus dbus-glib libxml2 intltool-native"
+DEPENDS_class-native = "glib-2.0-native dbus-native dbus-glib-native libxml2-native intltool-native gnome-common-native gobject-introspection-native"
 
 
 inherit gnomebase gtk-doc gettext
@@ -20,7 +20,7 @@ SRC_URI[archive.sha256sum] = "1912b91803ab09a5eed34d364bf09fe3a2a9c96751fde03a4e
 S = "${WORKDIR}/GConf-${PV}"
 
 EXTRA_OECONF = "--enable-shared --disable-static --enable-debug=yes \
-                --disable-introspection --disable-orbit --with-openldap=no --disable-gtk"
+                --disable-orbit --with-openldap=no --disable-gtk"
 
 # Disable PolicyKit by default
 PACKAGECONFIG ??= ""
-- 
2.6.2


