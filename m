Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Tfoss-0007zW-Dk
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 10:33:48 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 Dec 2012 01:18:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,214,1355126400"; d="scan'208";a="228661827"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by orsmga001.jf.intel.com with ESMTP; 04 Dec 2012 01:18:20 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Dec 2012 11:19:02 +0200
Message-Id: <21e376dbac711589eea4e324c09d8069db877a66.1354611254.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1354611254.git.constantinx.musca@intel.com>
References: <cover.1354611254.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1354611254.git.constantinx.musca@intel.com>
References: <cover.1354611254.git.constantinx.musca@intel.com>
Subject: [PATCH 2/5] libxcb: upgrade to 1.9
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
X-List-Received-Date: Tue, 04 Dec 2012 09:33:48 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-graphics/xcb/{libxcb_1.8.1.bb => libxcb_1.9.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xcb/{libxcb_1.8.1.bb => libxcb_1.9.bb} (55%)

diff --git a/meta/recipes-graphics/xcb/libxcb_1.8.1.bb b/meta/recipes-graphics/xcb/libxcb_1.9.bb
similarity index 55%
rename from meta/recipes-graphics/xcb/libxcb_1.8.1.bb
rename to meta/recipes-graphics/xcb/libxcb_1.9.bb
index 52ff0b0..f7da48c 100644
--- a/meta/recipes-graphics/xcb/libxcb_1.8.1.bb
+++ b/meta/recipes-graphics/xcb/libxcb_1.9.bb
@@ -9,5 +9,5 @@ DEPENDS += "libxdmcp"
 
 PACKAGES =+ "libxcb-xinerama"
 
-SRC_URI[md5sum] = "9da03df9e2f4c048202920d9f6a7e123"
-SRC_URI[sha256sum] = "d2f46811e950710e7e79e45615d24f2c7ec318b9de9dc717972723da58bffa0d"
+SRC_URI[md5sum] = "2b05856e9d1cb37836aae7406f2f4ce2"
+SRC_URI[sha256sum] = "8857e62b3aae2976c7e10043643e45a85964fd1dcb4469dfde0d04d3d1b12c96"
-- 
1.7.11.7



