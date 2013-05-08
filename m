Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ionutx.radu@intel.com>) id 1Ua5r6-0001e5-FE
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 17:00:43 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 08 May 2013 07:40:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,635,1363158000"; d="scan'208";a="330858707"
Received: from work.rb.intel.com ([10.237.105.51])
	by fmsmga001.fm.intel.com with ESMTP; 08 May 2013 07:40:25 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2013 17:41:55 +0300
Message-Id: <1368024119-4149-6-git-send-email-ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1368024119-4149-1-git-send-email-ionutx.radu@intel.com>
References: <1368024119-4149-1-git-send-email-ionutx.radu@intel.com>
Subject: [PATCH 5/9] libfontenc: Updated from 1.1.1 to 1.1.2
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
X-List-Received-Date: Wed, 08 May 2013 15:02:15 -0000

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
---
 .../xorg-lib/{libfontenc_1.1.1.bb => libfontenc_1.1.2.bb}         |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libfontenc_1.1.1.bb => libfontenc_1.1.2.bb} (70%)

diff --git a/meta/recipes-graphics/xorg-lib/libfontenc_1.1.1.bb b/meta/recipes-graphics/xorg-lib/libfontenc_1.1.2.bb
similarity index 70%
rename from meta/recipes-graphics/xorg-lib/libfontenc_1.1.1.bb
rename to meta/recipes-graphics/xorg-lib/libfontenc_1.1.2.bb
index 1ff6065..b79ab8f 100644
--- a/meta/recipes-graphics/xorg-lib/libfontenc_1.1.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libfontenc_1.1.2.bb
@@ -9,10 +9,9 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=96254c20ab81c63e65b26f0dbcd4a1c1"
 
 DEPENDS += "zlib xproto font-util"
-PR = "r0"
 PE = "1"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "a2a861f142c3b4367f14fc14239fc1f7"
-SRC_URI[sha256sum] = "de72812f1856bb63bd2226ec8c2e2301931d3c72bd0f08b0d63a0cdf0722017f"
+SRC_URI[md5sum] = "ad2919764933e075bb0361ad5caa3d19"
+SRC_URI[sha256sum] = "a9a4efed3359b2e80161bb66b65038fac145137fa134e71335264cbc23b02f62"
-- 
1.7.10.4



