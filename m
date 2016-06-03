Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id BFCA877505
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 09:15:22 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 03 Jun 2016 02:15:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,411,1459839600"; d="scan'208";a="994440214"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jun 2016 02:15:23 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jun 2016 12:14:51 +0300
Message-Id: <aef550e1a13e4a5b4ce085dc36edc07a28502fec.1464945141.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
References: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
References: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 14/25] gnome-desktop3: update to 3.20.2
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
X-List-Received-Date: Fri, 03 Jun 2016 09:15:22 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../{gnome-desktop3_3.18.2.bb => gnome-desktop3_3.20.2.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gnome-desktop/{gnome-desktop3_3.18.2.bb => gnome-desktop3_3.20.2.bb} (84%)

diff --git a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.18.2.bb b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.20.2.bb
similarity index 84%
rename from meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.18.2.bb
rename to meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.20.2.bb
index 75a99a6..dd1cee5 100644
--- a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.18.2.bb
+++ b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.20.2.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 BPN = "gnome-desktop"
 
 inherit gnome pkgconfig upstream-version-is-even gobject-introspection
-SRC_URI[archive.md5sum] = "9a5875247abdb99bad93f1c4230d1d6d"
-SRC_URI[archive.sha256sum] = "ddd46d022de137543a71f50c7392b32f9b98d5d3f2b53040b35f5802de2e7b56"
+SRC_URI[archive.md5sum] = "8354ed38624f5eb6b5d34267b658a9c9"
+SRC_URI[archive.sha256sum] = "492c2da7aa8c3a8b65796e8171fc8f0dfb5d322dd2799c0d76392e1fb061e2b2"
 
 DEPENDS += "intltool-native gsettings-desktop-schemas gconf libxrandr virtual/libx11 gtk+3 glib-2.0 gnome-doc-utils startup-notification xkeyboard-config iso-codes"
 
-- 
2.8.1


