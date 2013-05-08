Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ionutx.radu@intel.com>) id 1Ua5rX-0001e5-AP
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 17:02:07 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 08 May 2013 07:40:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,635,1363158000"; d="scan'208";a="330858779"
Received: from work.rb.intel.com ([10.237.105.51])
	by fmsmga001.fm.intel.com with ESMTP; 08 May 2013 07:40:32 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2013 17:41:58 +0300
Message-Id: <1368024119-4149-9-git-send-email-ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1368024119-4149-1-git-send-email-ionutx.radu@intel.com>
References: <1368024119-4149-1-git-send-email-ionutx.radu@intel.com>
Subject: [PATCH 8/9] pixman: Update from 0.29.2 to 0.29.4
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
X-List-Received-Date: Wed, 08 May 2013 15:02:26 -0000

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
---
 .../xorg-lib/{pixman_0.29.2.bb => pixman_0.29.4.bb}              |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{pixman_0.29.2.bb => pixman_0.29.4.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.29.2.bb b/meta/recipes-graphics/xorg-lib/pixman_0.29.4.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/pixman_0.29.2.bb
rename to meta/recipes-graphics/xorg-lib/pixman_0.29.4.bb
index 9140f4b..b1bd557 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.29.2.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.29.4.bb
@@ -15,8 +15,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=14096c769ae0cbb5fcb94ec468be11b3 \
 DEPENDS += "zlib libpng"
 BBCLASSEXTEND = "native nativesdk"
 
-PR = "r0"
-
 PE = "1"
 
 IWMMXT = "--disable-arm-iwmmxt"
@@ -33,5 +31,5 @@ SRC_URI += "\
             file://Generic-C-implementation-of-pixman_blt-with-overlapp.patch \
 "
 
-SRC_URI[md5sum] = "6e64a6d73559973ef6a9f125b5161ad3"
-SRC_URI[sha256sum] = "aa3dca46f6c90ae7731929d4e12195a981c52c3a423669ec3329d5a9c469841f"
+SRC_URI[md5sum] = "7ae4104aa9fcd46c4fb7fe01080b8b56"
+SRC_URI[sha256sum] = "56fe8f5d1bb3e63013a4bb6b114bdf174df4c041b03b1965147b9f40d2f4c88e"
-- 
1.7.10.4



