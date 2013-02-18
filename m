Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1U7Pgi-0006HX-JN
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Feb 2013 13:19:21 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 18 Feb 2013 04:03:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,687,1355126400"; d="scan'208";a="288582856"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by fmsmga001.fm.intel.com with ESMTP; 18 Feb 2013 04:03:06 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Feb 2013 14:04:09 +0200
Message-Id: <1361189049-2355-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH] cairo: upgrade to 1.12.14
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Feb 2013 12:19:23 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-graphics/cairo/{cairo_1.12.12.bb => cairo_1.12.14.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/cairo/{cairo_1.12.12.bb => cairo_1.12.14.bb} (92%)

diff --git a/meta/recipes-graphics/cairo/cairo_1.12.12.bb b/meta/recipes-graphics/cairo/cairo_1.12.14.bb
similarity index 92%
rename from meta/recipes-graphics/cairo/cairo_1.12.12.bb
rename to meta/recipes-graphics/cairo/cairo_1.12.14.bb
index 7bf2b82..16f9d7b 100644
--- a/meta/recipes-graphics/cairo/cairo_1.12.12.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.12.14.bb
@@ -6,8 +6,8 @@ PR = "r0"
 
 SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "9f7315e54885c735dcfdabe77f322d30"
-SRC_URI[sha256sum] = "14f693759ecc87472355ae8f0c34731a8578b408b607cfd0b5d34331ff05d81a"
+SRC_URI[md5sum] = "27b634113d0f52152d60ae8e2ec7daa7"
+SRC_URI[sha256sum] = "96d0d1e3f9b74d2ca3469ff187c5e5f25649b1ad35cf06f4f3a83847dff4ac13"
 
 PACKAGES =+ "cairo-gobject cairo-script-interpreter cairo-perf-utils"
 
-- 
1.7.11.7



