Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 797436ABFC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 12:07:15 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 27 Nov 2015 04:07:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,351,1444719600"; d="scan'208";a="860460915"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 27 Nov 2015 04:07:16 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Nov 2015 14:10:39 +0200
Message-Id: <0174a765303076b85f304ccc680b514ffa48c071.1448625307.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <338e77cbca9b7de1c5638e59b440f0da85087835.1448625307.git.jussi.kukkonen@intel.com>
References: <338e77cbca9b7de1c5638e59b440f0da85087835.1448625307.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1448625307.git.jussi.kukkonen@intel.com>
References: <cover.1448625307.git.jussi.kukkonen@intel.com>
Subject: [PATCH 06/10] gsettings-desktop-schemas: Upgrade 2.16.1 -> 3.18.1
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
X-List-Received-Date: Fri, 27 Nov 2015 12:07:15 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...desktop-schemas_3.16.1.bb => gsettings-desktop-schemas_3.18.1.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-desktop-schemas_3.16.1.bb => gsettings-desktop-schemas_3.18.1.bb} (69%)

diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.16.1.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.18.1.bb
similarity index 69%
rename from meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.16.1.bb
rename to meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.18.1.bb
index f2f2c75..6904666 100644
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.16.1.bb
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.18.1.bb
@@ -9,5 +9,6 @@ DEPENDS = "glib-2.0 intltool-native gobject-introspection-stub-native"
 
 inherit gnomebase gsettings gettext
 
-SRC_URI[archive.md5sum] = "baebbcf3c20591f98876e42fb0a3fd35"
-SRC_URI[archive.sha256sum] = "74fe9fdad510c8a6666febeceb7ebafc581ef990b3afcc8c1e8b5d90b24b3461"
+SRC_URI[archive.md5sum] = "e7ec56bb55013e89500c8f3ae6fcf738"
+SRC_URI[archive.sha256sum] = "258713b2a3dc6b6590971bcfc81f98d78ea9827d60e2f55ffbe40d9cd0f99a1a"
+
-- 
2.1.4


