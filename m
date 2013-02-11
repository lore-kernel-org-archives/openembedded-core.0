Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1U4tBh-0007YQ-KT
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Feb 2013 14:12:54 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 11 Feb 2013 04:56:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,643,1355126400"; d="scan'208";a="201061481"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Feb 2013 04:56:49 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Feb 2013 14:57:42 +0200
Message-Id: <1360587462-2973-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH] cairo: upgrade to 1.12.12
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
X-List-Received-Date: Mon, 11 Feb 2013 13:12:56 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-graphics/cairo/{cairo_1.12.10.bb => cairo_1.12.12.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/cairo/{cairo_1.12.10.bb => cairo_1.12.12.bb} (92%)

diff --git a/meta/recipes-graphics/cairo/cairo_1.12.10.bb b/meta/recipes-graphics/cairo/cairo_1.12.12.bb
similarity index 92%
rename from meta/recipes-graphics/cairo/cairo_1.12.10.bb
rename to meta/recipes-graphics/cairo/cairo_1.12.12.bb
index 00c0377..7bf2b82 100644
--- a/meta/recipes-graphics/cairo/cairo_1.12.10.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.12.12.bb
@@ -6,8 +6,8 @@ PR = "r0"
 
 SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "bddd5c5b734ab4b9683eb0ba363070d4"
-SRC_URI[sha256sum] = "f1581aef210f6caa9cf42875fb66ab3b47a32db9436bdfa9913b9bbd5034b03b"
+SRC_URI[md5sum] = "9f7315e54885c735dcfdabe77f322d30"
+SRC_URI[sha256sum] = "14f693759ecc87472355ae8f0c34731a8578b408b607cfd0b5d34331ff05d81a"
 
 PACKAGES =+ "cairo-gobject cairo-script-interpreter cairo-perf-utils"
 
-- 
1.7.11.7



