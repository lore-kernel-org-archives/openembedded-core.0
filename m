Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 29F90758F6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 13:19:57 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 17 Jun 2015 06:19:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,632,1427785200"; d="scan'208";a="729205515"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 17 Jun 2015 06:19:56 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jun 2015 16:19:28 +0300
Message-Id: <1434547172-24620-19-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1434547172-24620-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1434547172-24620-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 18/22] Add a recipe gsettings-desktop-schemas
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
X-List-Received-Date: Wed, 17 Jun 2015 13:19:57 -0000

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


