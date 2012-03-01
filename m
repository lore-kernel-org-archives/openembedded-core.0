Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S30XG-0007yn-Nd
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 08:34:47 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 29 Feb 2012 23:26:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="113168889"
Received: from unknown (HELO swold-mobl.myhome.westell.com) ([10.255.15.82])
	by azsmga001.ch.intel.com with ESMTP; 29 Feb 2012 23:26:14 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Feb 2012 23:26:08 -0800
Message-Id: <3d96c591f182971ec0fb0aff9b8d18af80febe40.1330586641.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1330586641.git.sgw@linux.intel.com>
References: <cover.1330586641.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330586641.git.sgw@linux.intel.com>
References: <cover.1330586641.git.sgw@linux.intel.com>
Subject: [PATCH 5/7] pixman: updat to 0.24.4
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Mar 2012 07:34:47 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../{pixman_0.24.2.bb => pixman_0.24.4.bb}         |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{pixman_0.24.2.bb => pixman_0.24.4.bb} (82%)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.24.2.bb b/meta/recipes-graphics/xorg-lib/pixman_0.24.4.bb
similarity index 82%
rename from meta/recipes-graphics/xorg-lib/pixman_0.24.2.bb
rename to meta/recipes-graphics/xorg-lib/pixman_0.24.4.bb
index c710b42..4c90ea3 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.24.2.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.24.4.bb
@@ -15,10 +15,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=14096c769ae0cbb5fcb94ec468be11b3 \
 DEPENDS += "zlib libpng"
 
 PE = "1"
-PR = "r1"
+PR = "r0"
 
 EXTRA_OECONF="--disable-gtk"
 
-SRC_URI[md5sum] = "2ce7d12750664d2eebd51bf0a07b6205"
-SRC_URI[sha256sum] = "32f74f3e3c1feea33e6ad3e2fd66cb3eb816805c384b346ea1636a87c9057dbf"
-
+SRC_URI[md5sum] = "89eb7db8853681bbcea626b161de0488"
+SRC_URI[sha256sum] = "5f4b384aa39e82a582bdc8835e2e81b28176db851dd1f7ff32d682d026a23bb5"
-- 
1.7.7.6



