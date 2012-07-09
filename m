Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SoGMh-000659-Ca
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 17:59:11 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jul 2012 08:47:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="190292882"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.157])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2012 08:47:58 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jul 2012 08:47:22 -0700
Message-Id: <84bf0ebc8ca45d5dcef5c5505174ba5258af932c.1341802889.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1341802889.git.sgw@linux.intel.com>
References: <cover.1341802889.git.sgw@linux.intel.com>
In-Reply-To: <cover.1341802889.git.sgw@linux.intel.com>
References: <cover.1341802889.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 08/41] pixman: upgrade to 0.26.2
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
X-List-Received-Date: Mon, 09 Jul 2012 15:59:11 -0000

From: Laurentiu Palcu <laurentiu.palcu@intel.com>

Also, disable Loongson MMI for now because Pixman's build system will
autodetect a Loongson2f architecture revision and the build will fail.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../{pixman_0.25.2.bb => pixman_0.26.2.bb}         |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)
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
1.7.7.6



