Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8DDDE73211
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 13:22:56 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 May 2016 06:22:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,627,1455004800"; d="scan'208";a="977873439"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 16 May 2016 06:22:56 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 May 2016 16:22:41 +0300
Message-Id: <4feaac6524df95924c340508111419c9a72838fd.1463404035.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <25872fbe16b6f36bee45fec3e7f088cd72507351.1463404035.git.jussi.kukkonen@intel.com>
References: <25872fbe16b6f36bee45fec3e7f088cd72507351.1463404035.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1463404035.git.jussi.kukkonen@intel.com>
References: <cover.1463404035.git.jussi.kukkonen@intel.com>
Subject: [PATCH 04/13] gdk-pixbuf: Upgrade 2.32.3 -> 2.34.0
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
X-List-Received-Date: Mon, 16 May 2016 13:22:56 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../gdk-pixbuf/{gdk-pixbuf_2.32.3.bb => gdk-pixbuf_2.34.0.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.32.3.bb => gdk-pixbuf_2.34.0.bb} (96%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.3.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.34.0.bb
similarity index 96%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.3.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.34.0.bb
index ba94eec..c24ec12 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.3.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.34.0.bb
@@ -19,8 +19,8 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://fatal-loader.patch \
            "
 
-SRC_URI[md5sum] = "9275076639baa24a342f3e02c402920e"
-SRC_URI[sha256sum] = "2b6771f1ac72f687a8971e59810b8dc658e65e7d3086bd2e676e618fd541d031"
+SRC_URI[md5sum] = "63cb19f92cf7709ccf44bbb6fe1ff70c"
+SRC_URI[sha256sum] = "d55e5b383ee219bd0e23bf6ed4427d56a7db5379729a6e3e0a0e0eba9a8d8879"
 
 inherit autotools pkgconfig gettext pixbufcache ptest-gnome upstream-version-is-even gobject-introspection
 
-- 
2.1.4


