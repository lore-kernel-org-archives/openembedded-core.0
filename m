Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SmUJz-00056y-Ov
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 20:29:03 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 04 Jul 2012 11:18:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="164055210"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by azsmga001.ch.intel.com with ESMTP; 04 Jul 2012 11:18:01 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jul 2012 21:17:39 +0300
Message-Id: <89116ec9e0e1561c33a47ece7e7c71fbb1d82ede.1341425229.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1341425229.git.laurentiu.palcu@intel.com>
References: <cover.1341425229.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1341425229.git.laurentiu.palcu@intel.com>
References: <cover.1341425229.git.laurentiu.palcu@intel.com>
Subject: [PATCH 8/8] pixman: upgrade to 0.26.2
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
X-List-Received-Date: Wed, 04 Jul 2012 18:29:04 -0000

Also, disable Loongson MMI for now because Pixman's build system will
autodetect a Loongson2f architecture revision and the build will fail.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../{pixman_0.25.2.bb => pixman_0.26.2.bb}         |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{pixman_0.25.2.bb => pixman_0.26.2.bb} (75%)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.25.2.bb b/meta/recipes-graphics/xorg-lib/pixman_0.26.2.bb
similarity index 75%
rename from meta/recipes-graphics/xorg-lib/pixman_0.25.2.bb
rename to meta/recipes-graphics/xorg-lib/pixman_0.26.2.bb
index acfe727..337ac2b 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.25.2.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.26.2.bb
@@ -15,13 +15,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=14096c769ae0cbb5fcb94ec468be11b3 \
 DEPENDS += "zlib libpng"
 BBCLASSEXTEND = "native"
 
-PR = "r1"
+PR = "r0"
 
 PE = "1"
 
 IWMMXT = "--disable-arm-iwmmxt"
+LOONGSON_MMI = "--disable-loongson-mmi"
 
-EXTRA_OECONF="--disable-gtk ${IWMMXT}"
+EXTRA_OECONF="--disable-gtk ${IWMMXT} ${LOONGSON_MMI}"
 
-SRC_URI[md5sum] = "8d5722f6f61db50034303947a40f5e7b"
-SRC_URI[sha256sum] = "06d83ce5a5f2f8ab3761e88a2de1576b6596bb436190166a242b9d75a68bc1d8"
+SRC_URI[md5sum] = "6b3e4c5300adb893a2baa9631c23efb2"
+SRC_URI[sha256sum] = "193b651c8ba89ecfacb8dc62a34d2bd305245163910cdbdf907e5d5ece92647c"
-- 
1.7.9.5



