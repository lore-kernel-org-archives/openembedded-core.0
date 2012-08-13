Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1T0wgJ-0003v6-MG
	for openembedded-core@lists.linuxtogo.org;
	Mon, 13 Aug 2012 17:35:52 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 13 Aug 2012 08:22:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,761,1336374000"; d="scan'208";a="207670915"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.33])
	by fmsmga002.fm.intel.com with ESMTP; 13 Aug 2012 08:22:54 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Aug 2012 17:27:30 +0300
Message-Id: <1344868052-15607-2-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1344868052-15607-1-git-send-email-constantinx.musca@intel.com>
References: <1344868052-15607-1-git-send-email-constantinx.musca@intel.com>
Cc: openembedded-core@lists.linuxtogo.org,
	Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCH 1/3] pixman: upgrade to 0.27.2
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
X-List-Received-Date: Mon, 13 Aug 2012 15:35:52 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../{pixman_0.26.2.bb => pixman_0.27.2.bb}         |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{pixman_0.26.2.bb => pixman_0.27.2.bb} (86%)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.26.2.bb b/meta/recipes-graphics/xorg-lib/pixman_0.27.2.bb
similarity index 86%
rename from meta/recipes-graphics/xorg-lib/pixman_0.26.2.bb
rename to meta/recipes-graphics/xorg-lib/pixman_0.27.2.bb
index 337ac2b..e55276e 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.26.2.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.27.2.bb
@@ -24,5 +24,5 @@ LOONGSON_MMI = "--disable-loongson-mmi"
 
 EXTRA_OECONF="--disable-gtk ${IWMMXT} ${LOONGSON_MMI}"
 
-SRC_URI[md5sum] = "6b3e4c5300adb893a2baa9631c23efb2"
-SRC_URI[sha256sum] = "193b651c8ba89ecfacb8dc62a34d2bd305245163910cdbdf907e5d5ece92647c"
+SRC_URI[md5sum] = "dd67154b23d88e6a75ad3a83f3052198"
+SRC_URI[sha256sum] = "cae9dc13727a84f11beb150c88d3a06ba114f82c52d68073c663c027e099123b"
-- 
1.7.9.5



