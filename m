Return-Path: <ionutx.radu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 9C97E6B4F0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2013 15:37:54 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 02 Aug 2013 08:37:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,802,1367996400"; d="scan'208";a="276854932"
Received: from work.rb.intel.com ([10.237.105.51])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Aug 2013 08:37:54 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Aug 2013 18:40:32 +0300
Message-Id: <08a4585c2793705445417b442a345ae2f358fb87.1375457879.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <c9a41bb004c2b313f8dc4067b431da6f3c18f689.1375457879.git.ionutx.radu@intel.com>
References: <c9a41bb004c2b313f8dc4067b431da6f3c18f689.1375457879.git.ionutx.radu@intel.com>
In-Reply-To: <cover.1375457879.git.ionutx.radu@intel.com>
References: <cover.1375457879.git.ionutx.radu@intel.com>
Subject: [PATCH 2/2] gdk-pixbuf: upgrade to 2.28.2
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
X-List-Received-Date: Fri, 02 Aug 2013 15:37:55 -0000

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
---
 .../gdk-pixbuf/{gdk-pixbuf_2.28.1.bb => gdk-pixbuf_2.28.2.bb}      |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.28.1.bb => gdk-pixbuf_2.28.2.bb} (94%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.28.1.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.28.2.bb
similarity index 94%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.28.1.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.28.2.bb
index a97234c..08d6f0a 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.28.1.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.28.2.bb
@@ -19,8 +19,8 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://extending-libinstall-dependencies.patch \
            "
 
-SRC_URI[md5sum] = "5c71cce316d08c559fc5970aa60754ab"
-SRC_URI[sha256sum] = "bea0b743fdb5c3c8e23210f73623ec5f18f9ead2522942897fe739d80b50c2bb"
+SRC_URI[md5sum] = "04c04e5042acd85cff6c439aba1995f1"
+SRC_URI[sha256sum] = "183113c2eb2232963e88864a6a54fd963dbfeb1a3679fb0d3456f9e0b79e4617"
 
 inherit autotools pkgconfig gettext pixbufcache
 
-- 
1.7.10.4


