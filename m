Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 68A0474829
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 11:20:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2018 04:20:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,405,1517904000"; d="scan'208";a="40599829"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 04 Apr 2018 04:20:04 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2018 14:13:09 +0300
Message-Id: <20180404111321.10824-10-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180404111321.10824-1-alexander.kanavin@linux.intel.com>
References: <20180404111321.10824-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 10/22] gsettings-desktop-schemas: update to 3.28.0
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
X-List-Received-Date: Wed, 04 Apr 2018 11:20:04 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...-desktop-schemas_3.24.1.bb => gsettings-desktop-schemas_3.28.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-desktop-schemas_3.24.1.bb => gsettings-desktop-schemas_3.28.0.bb} (70%)

diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.24.1.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.28.0.bb
similarity index 70%
rename from meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.24.1.bb
rename to meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.28.0.bb
index b61fd2408f4..c2b3cd89550 100644
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.24.1.bb
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.28.0.bb
@@ -9,5 +9,5 @@ DEPENDS = "glib-2.0 intltool-native"
 
 inherit gnomebase gsettings gettext gobject-introspection upstream-version-is-even
 
-SRC_URI[archive.md5sum] = "796b6ac1eff450261edd521b72e7fe6d"
-SRC_URI[archive.sha256sum] = "76a3fa309f9de6074d66848987214f0b128124ba7184c958c15ac78a8ac7eea7"
+SRC_URI[archive.md5sum] = "370610e29b37d063ede3ef0f29c06eb9"
+SRC_URI[archive.sha256sum] = "4cb4cd7790b77e5542ec75275237613ad22f3a1f2f41903a298cf6cc996a9167"
-- 
2.16.1


