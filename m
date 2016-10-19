Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A4F7D71A70
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 15:09:18 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP; 19 Oct 2016 08:09:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,514,1473145200"; d="scan'208";a="21266953"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 19 Oct 2016 08:09:19 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Oct 2016 18:06:45 +0300
Message-Id: <9a2f86103e33586c0587cdc62a2633768a4a6648.1476888929.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
References: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
References: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 10/19] gnome-desktop3: update to 3.22.1
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
X-List-Received-Date: Wed, 19 Oct 2016 15:09:18 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../{gnome-desktop3_3.20.2.bb => gnome-desktop3_3.22.1.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gnome-desktop/{gnome-desktop3_3.20.2.bb => gnome-desktop3_3.22.1.bb} (83%)

diff --git a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.20.2.bb b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.22.1.bb
similarity index 83%
rename from meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.20.2.bb
rename to meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.22.1.bb
index eb061b2..867376e 100644
--- a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.20.2.bb
+++ b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.22.1.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 BPN = "gnome-desktop"
 
 inherit gnome pkgconfig upstream-version-is-even gobject-introspection
-SRC_URI[archive.md5sum] = "8354ed38624f5eb6b5d34267b658a9c9"
-SRC_URI[archive.sha256sum] = "492c2da7aa8c3a8b65796e8171fc8f0dfb5d322dd2799c0d76392e1fb061e2b2"
+SRC_URI[archive.md5sum] = "bc09d58d7870d6464f20803850cdb90f"
+SRC_URI[archive.sha256sum] = "6458add4fc3a81fbd9a63db90de22a1e3a62644c1bfd1aca042c43836195aab2"
 
 DEPENDS += "intltool-native gsettings-desktop-schemas gconf libxrandr virtual/libx11 gtk+3 glib-2.0 startup-notification xkeyboard-config iso-codes"
 
-- 
2.9.3


