Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3054460761
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 13:37:29 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP; 28 Nov 2016 05:37:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,564,1473145200"; d="scan'208";a="36412244"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 28 Nov 2016 05:37:30 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Nov 2016 15:34:18 +0200
Message-Id: <9c4caf582e3c573a7b4a57761f80472435c0507d.1480333940.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
References: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
References: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 07/18] gnome-desktop3: update to 3.22.2
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
X-List-Received-Date: Mon, 28 Nov 2016 13:37:29 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../{gnome-desktop3_3.22.1.bb => gnome-desktop3_3.22.2.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gnome-desktop/{gnome-desktop3_3.22.1.bb => gnome-desktop3_3.22.2.bb} (83%)

diff --git a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.22.1.bb b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.22.2.bb
similarity index 83%
rename from meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.22.1.bb
rename to meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.22.2.bb
index 59b1c4f..8dfd782 100644
--- a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.22.1.bb
+++ b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.22.2.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 BPN = "gnome-desktop"
 
 inherit gnome pkgconfig upstream-version-is-even gobject-introspection
-SRC_URI[archive.md5sum] = "bc09d58d7870d6464f20803850cdb90f"
-SRC_URI[archive.sha256sum] = "6458add4fc3a81fbd9a63db90de22a1e3a62644c1bfd1aca042c43836195aab2"
+SRC_URI[archive.md5sum] = "3d7222d5305f3db022eca31d8108e02d"
+SRC_URI[archive.sha256sum] = "51d7ebf7a6c359be14c3dd7a022213e931484653815eb10b0131bef4c8979e1c"
 
 DEPENDS += "intltool-native gsettings-desktop-schemas gconf virtual/libx11 gtk+3 glib-2.0 startup-notification xkeyboard-config iso-codes udev"
 
-- 
2.10.2


