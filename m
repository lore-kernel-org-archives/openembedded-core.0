Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1Rp1fU-0001c1-MX
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Jan 2012 18:57:29 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 22 Jan 2012 09:49:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="98549181"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by azsmga001.ch.intel.com with ESMTP; 22 Jan 2012 09:49:44 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2012 02:06:09 +0800
Message-Id: <2b648779f05c440ee8da5b845755ce86b1328541.1327255445.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <a3776c81de568353900eec28bb7f10372875e727.1327255445.git.shane.wang@intel.com>
References: <a3776c81de568353900eec28bb7f10372875e727.1327255445.git.shane.wang@intel.com>
In-Reply-To: <cover.1327255445.git.shane.wang@intel.com>
References: <cover.1327255445.git.shane.wang@intel.com>
Subject: [PATCH 04/18] libxcb: upgrade to 1.8
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
X-List-Received-Date: Sun, 22 Jan 2012 17:57:29 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../xcb/{libxcb_1.7.bb => libxcb_1.8.bb}           |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xcb/{libxcb_1.7.bb => libxcb_1.8.bb} (56%)

diff --git a/meta/recipes-graphics/xcb/libxcb_1.7.bb b/meta/recipes-graphics/xcb/libxcb_1.8.bb
similarity index 56%
rename from meta/recipes-graphics/xcb/libxcb_1.7.bb
rename to meta/recipes-graphics/xcb/libxcb_1.8.bb
index daecf0f..fbf90c2 100644
--- a/meta/recipes-graphics/xcb/libxcb_1.7.bb
+++ b/meta/recipes-graphics/xcb/libxcb_1.8.bb
@@ -3,11 +3,11 @@ include libxcb.inc
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7"
 
-PR = "r2"
+PR = "r0"
 
 DEPENDS += "libpthread-stubs xcb-proto-native libxdmcp"
 
 PACKAGES =+ "libxcb-xinerama"
 
-SRC_URI[md5sum] = "925699df361b99491165ebc12068056b"
-SRC_URI[sha256sum] = "e776dc35e2a66094e7308ce2e045fb4e27cf3ca30ab1813a8fc08538140724df"
+SRC_URI[md5sum] = "eba59a8887ba6dbaa4cf337766f8d19d"
+SRC_URI[sha256sum] = "25c3600bec104c5aa6e9f559bfe0011b0e223bde726b849b58f758c2d4e6fc5e"
-- 
1.7.6



