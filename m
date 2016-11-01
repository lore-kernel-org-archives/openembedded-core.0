Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7577171A34
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 15:27:51 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 01 Nov 2016 08:27:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,580,1473145200"; d="scan'208";a="780876152"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 01 Nov 2016 08:27:52 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Nov 2016 17:25:10 +0200
Message-Id: <348b956a0405e79fed0641af3ddf83b7f15f6d1d.1478013701.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
References: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
References: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 03/13] gnome-desktop3: fix dependencies
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
X-List-Received-Date: Tue, 01 Nov 2016 15:27:51 -0000

libxrandr dependency has been removed upstream

Udev dependecy has been added upstream:

    commit b8cbfbe06475703f333367976eae9477f229891a

    pnp-ids: Use udev's hwdb to query PNP IDs

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.22.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.22.1.bb b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.22.1.bb
index 867376e..59b1c4f 100644
--- a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.22.1.bb
+++ b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.22.1.bb
@@ -10,7 +10,7 @@ inherit gnome pkgconfig upstream-version-is-even gobject-introspection
 SRC_URI[archive.md5sum] = "bc09d58d7870d6464f20803850cdb90f"
 SRC_URI[archive.sha256sum] = "6458add4fc3a81fbd9a63db90de22a1e3a62644c1bfd1aca042c43836195aab2"
 
-DEPENDS += "intltool-native gsettings-desktop-schemas gconf libxrandr virtual/libx11 gtk+3 glib-2.0 startup-notification xkeyboard-config iso-codes"
+DEPENDS += "intltool-native gsettings-desktop-schemas gconf virtual/libx11 gtk+3 glib-2.0 startup-notification xkeyboard-config iso-codes udev"
 
 inherit distro_features_check gtk-doc
 REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.10.1


