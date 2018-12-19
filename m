Return-Path: <anuj.mittal@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D87F97BF4F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 07:29:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Dec 2018 23:29:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,371,1539673200"; d="scan'208";a="119597355"
Received: from anmitta2-mobl1.png.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.221.21.206])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Dec 2018 23:29:32 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Dec 2018 15:29:22 +0800
Message-Id: <20181219072929.5870-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181219072929.5870-1-anuj.mittal@intel.com>
References: <20181219072929.5870-1-anuj.mittal@intel.com>
Subject: [PATCH 2/9] gsettings-desktop-schemas: upgrade 3.28.0 -> 3.28.1
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
X-List-Received-Date: Wed, 19 Dec 2018 07:29:32 -0000

Changes from release notes:

- Set default background image for screen lock to an existing one
- Translation updates

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...-schemas_3.28.0.bb => gsettings-desktop-schemas_3.28.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-desktop-schemas_3.28.0.bb => gsettings-desktop-schemas_3.28.1.bb} (70%)

diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.28.0.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.28.1.bb
similarity index 70%
rename from meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.28.0.bb
rename to meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.28.1.bb
index c2b3cd8955..693c109d83 100644
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.28.0.bb
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.28.1.bb
@@ -9,5 +9,5 @@ DEPENDS = "glib-2.0 intltool-native"
 
 inherit gnomebase gsettings gettext gobject-introspection upstream-version-is-even
 
-SRC_URI[archive.md5sum] = "370610e29b37d063ede3ef0f29c06eb9"
-SRC_URI[archive.sha256sum] = "4cb4cd7790b77e5542ec75275237613ad22f3a1f2f41903a298cf6cc996a9167"
+SRC_URI[archive.md5sum] = "83bb19d025f126fae495ab43a2f26f40"
+SRC_URI[archive.sha256sum] = "f88ea6849ffe897c51cfeca5e45c3890010c82c58be2aee18b01349648e5502f"
-- 
2.17.1


