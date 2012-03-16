Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LUR-0002PQ-VQ
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:57:56 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Mar 2012 17:49:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="121480659"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by orsmga002.jf.intel.com with ESMTP; 15 Mar 2012 17:49:03 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:42 +0800
Message-Id: <ba5ee170bf1320b5cf40b34abc4663aeccd2e8a1.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 45/60] libfontenc: upgrade to 1.1.1
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
X-List-Received-Date: Fri, 16 Mar 2012 00:57:56 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../{libfontenc_1.1.0.bb => libfontenc_1.1.1.bb}   |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libfontenc_1.1.0.bb => libfontenc_1.1.1.bb} (70%)

diff --git a/meta/recipes-graphics/xorg-lib/libfontenc_1.1.0.bb b/meta/recipes-graphics/xorg-lib/libfontenc_1.1.1.bb
similarity index 70%
rename from meta/recipes-graphics/xorg-lib/libfontenc_1.1.0.bb
rename to meta/recipes-graphics/xorg-lib/libfontenc_1.1.1.bb
index 252fd22..1ff6065 100644
--- a/meta/recipes-graphics/xorg-lib/libfontenc_1.1.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libfontenc_1.1.1.bb
@@ -9,10 +9,10 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=96254c20ab81c63e65b26f0dbcd4a1c1"
 
 DEPENDS += "zlib xproto font-util"
-PR = "r3"
+PR = "r0"
 PE = "1"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "11d3c292f05a90f6f67840a9e9c3d9b8"
-SRC_URI[sha256sum] = "348a1b0142f61afeaafc9497e997d6f10074affed8682e202d019f10170b9cbf"
+SRC_URI[md5sum] = "a2a861f142c3b4367f14fc14239fc1f7"
+SRC_URI[sha256sum] = "de72812f1856bb63bd2226ec8c2e2301931d3c72bd0f08b0d63a0cdf0722017f"
-- 
1.7.6



