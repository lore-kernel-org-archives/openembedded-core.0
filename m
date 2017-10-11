Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2C45678202
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 15:39:04 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2017 08:38:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,361,1503385200"; d="scan'208";a="1180945829"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 11 Oct 2017 08:38:53 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Oct 2017 18:34:23 +0300
Message-Id: <1e0d1bb3e018ea62517ef113598e5ad9fc5ae568.1507735448.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
References: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 31/50] gsettings-desktop-schemas: update to 3.24.1
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
X-List-Received-Date: Wed, 11 Oct 2017 15:39:04 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...-desktop-schemas_3.22.0.bb => gsettings-desktop-schemas_3.24.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-desktop-schemas_3.22.0.bb => gsettings-desktop-schemas_3.24.1.bb} (70%)

diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.22.0.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.24.1.bb
similarity index 70%
rename from meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.22.0.bb
rename to meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.24.1.bb
index d84a4f3ead2..b61fd2408f4 100644
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.22.0.bb
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.24.1.bb
@@ -9,5 +9,5 @@ DEPENDS = "glib-2.0 intltool-native"
 
 inherit gnomebase gsettings gettext gobject-introspection upstream-version-is-even
 
-SRC_URI[archive.md5sum] = "5b9056ab6eff42a0117f2912edff5f20"
-SRC_URI[archive.sha256sum] = "0f06c7ba34c3a99e4d58b10889496133c9aaad6698ea2d8405d481c7f1a7eae1"
+SRC_URI[archive.md5sum] = "796b6ac1eff450261edd521b72e7fe6d"
+SRC_URI[archive.sha256sum] = "76a3fa309f9de6074d66848987214f0b128124ba7184c958c15ac78a8ac7eea7"
-- 
2.14.1


