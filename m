Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1AFF8750DF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 11:54:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Apr 2018 04:54:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,427,1517904000"; d="scan'208";a="218897624"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 09 Apr 2018 04:54:51 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 9F3C25803B6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 04:54:50 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Apr 2018 14:55:09 +0300
Message-Id: <1523274911-20401-7-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1523274911-20401-1-git-send-email-maxin.john@intel.com>
References: <1523274911-20401-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 6/8] gsettings-desktop-schemas: upgrade to version 3.28.0
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
X-List-Received-Date: Mon, 09 Apr 2018 11:54:50 -0000

3.24.1 -> 3.28.0

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...-desktop-schemas_3.24.1.bb => gsettings-desktop-schemas_3.28.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-desktop-schemas_3.24.1.bb => gsettings-desktop-schemas_3.28.0.bb} (70%)

diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.24.1.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.28.0.bb
similarity index 70%
rename from meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.24.1.bb
rename to meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.28.0.bb
index b61fd24..c2b3cd8 100644
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.24.1.bb
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.28.0.bb
@@ -9,5 +9,5 @@ DEPENDS = "glib-2.0 intltool-native"
 
 inherit gnomebase gsettings gettext gobject-introspection upstream-version-is-even
 
-SRC_URI[archive.md5sum] = "796b6ac1eff450261edd521b72e7fe6d"
-SRC_URI[archive.sha256sum] = "76a3fa309f9de6074d66848987214f0b128124ba7184c958c15ac78a8ac7eea7"
+SRC_URI[archive.md5sum] = "370610e29b37d063ede3ef0f29c06eb9"
+SRC_URI[archive.sha256sum] = "4cb4cd7790b77e5542ec75275237613ad22f3a1f2f41903a298cf6cc996a9167"
-- 
2.4.0


