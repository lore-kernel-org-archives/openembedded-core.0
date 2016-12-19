Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6A6287726D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 13:35:54 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 19 Dec 2016 05:35:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,373,1477983600"; d="scan'208";a="800013189"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 19 Dec 2016 05:35:54 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 701256A4080;
	Mon, 19 Dec 2016 05:35:05 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2016 15:35:40 +0200
Message-Id: <82ddc72a246e9d20952e644c4274abecc8fe66bf.1482154012.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1482154012.git.jussi.kukkonen@intel.com>
References: <cover.1482154012.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/8] gsettings-desktop-schemas: Upgrade 3.20.0 -> 3.22.0
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
X-List-Received-Date: Mon, 19 Dec 2016 13:35:55 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...-desktop-schemas_3.20.0.bb => gsettings-desktop-schemas_3.22.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-desktop-schemas_3.20.0.bb => gsettings-desktop-schemas_3.22.0.bb} (70%)

diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.20.0.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.22.0.bb
similarity index 70%
rename from meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.20.0.bb
rename to meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.22.0.bb
index bb924ce..d84a4f3 100644
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.20.0.bb
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.22.0.bb
@@ -9,5 +9,5 @@ DEPENDS = "glib-2.0 intltool-native"
 
 inherit gnomebase gsettings gettext gobject-introspection upstream-version-is-even
 
-SRC_URI[archive.md5sum] = "c5d87ea480aa9bf66b134ddb5b8ea0f8"
-SRC_URI[archive.sha256sum] = "55a41b533c0ab955e0a36a84d73829451c88b027d8d719955d8f695c35c6d9c1"
+SRC_URI[archive.md5sum] = "5b9056ab6eff42a0117f2912edff5f20"
+SRC_URI[archive.sha256sum] = "0f06c7ba34c3a99e4d58b10889496133c9aaad6698ea2d8405d481c7f1a7eae1"
-- 
2.1.4


