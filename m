Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id CAF9A763F4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 10:55:23 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 14 Aug 2015 03:55:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,677,1432623600"; d="scan'208";a="768726440"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 14 Aug 2015 03:55:23 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Aug 2015 13:55:37 +0300
Message-Id: <3f8fee509b5b7cc0643f316e28fc535708e49754.1439549437.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1439549437.git.alexander.kanavin@linux.intel.com>
References: <cover.1439549437.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1439549437.git.alexander.kanavin@linux.intel.com>
References: <cover.1439549437.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 18/22] gsettings-desktop-schemas: add a recipe from meta-gnome
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
X-List-Received-Date: Fri, 14 Aug 2015 10:55:23 -0000

gsettings-desktop-schemas is a dependency of epiphany

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../gsettings-desktop-schemas_3.16.1.bb                     | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.16.1.bb

diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.16.1.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.16.1.bb
new file mode 100644
index 0000000..f2f2c75
--- /dev/null
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.16.1.bb
@@ -0,0 +1,13 @@
+SUMMARY = "GNOME desktop-wide GSettings schemas"
+HOMEPAGE = "http://live.gnome.org/gsettings-desktop-schemas"
+BUGTRACKER = "https://bugzilla.gnome.org/"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+DEPENDS = "glib-2.0 intltool-native gobject-introspection-stub-native"
+
+inherit gnomebase gsettings gettext
+
+SRC_URI[archive.md5sum] = "baebbcf3c20591f98876e42fb0a3fd35"
+SRC_URI[archive.sha256sum] = "74fe9fdad510c8a6666febeceb7ebafc581ef990b3afcc8c1e8b5d90b24b3461"
-- 
2.1.4


