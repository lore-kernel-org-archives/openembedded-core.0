Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Tn3iI-0003pg-Cs
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Dec 2012 09:48:46 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 24 Dec 2012 00:33:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,346,1355126400"; d="scan'208";a="266440634"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by fmsmga001.fm.intel.com with ESMTP; 24 Dec 2012 00:33:54 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Dec 2012 10:34:14 +0200
Message-Id: <b91f4ed37f09cc4ce68318d003acfa0525ece489.1356337650.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1356337650.git.constantinx.musca@intel.com>
References: <cover.1356337650.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1356337650.git.constantinx.musca@intel.com>
References: <cover.1356337650.git.constantinx.musca@intel.com>
Subject: [PATCH 02/15] freetype: upgrade to 2.4.11
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
X-List-Received-Date: Mon, 24 Dec 2012 08:48:46 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../freetype/{freetype-2.4.10 => freetype-2.4.11}/no-hardcode.patch   | 0
 .../freetype/{freetype_2.4.10.bb => freetype_2.4.11.bb}               | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/freetype/{freetype-2.4.10 => freetype-2.4.11}/no-hardcode.patch (100%)
 rename meta/recipes-graphics/freetype/{freetype_2.4.10.bb => freetype_2.4.11.bb} (91%)

diff --git a/meta/recipes-graphics/freetype/freetype-2.4.10/no-hardcode.patch b/meta/recipes-graphics/freetype/freetype-2.4.11/no-hardcode.patch
similarity index 100%
rename from meta/recipes-graphics/freetype/freetype-2.4.10/no-hardcode.patch
rename to meta/recipes-graphics/freetype/freetype-2.4.11/no-hardcode.patch
diff --git a/meta/recipes-graphics/freetype/freetype_2.4.10.bb b/meta/recipes-graphics/freetype/freetype_2.4.11.bb
similarity index 91%
rename from meta/recipes-graphics/freetype/freetype_2.4.10.bb
rename to meta/recipes-graphics/freetype/freetype_2.4.11.bb
index 9365475..8e8d273 100644
--- a/meta/recipes-graphics/freetype/freetype_2.4.10.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.4.11.bb
@@ -18,8 +18,8 @@ PR = "r0"
 SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
            file://no-hardcode.patch"
 
-SRC_URI[md5sum] = "13286702e9390a91661f980608adaff1"
-SRC_URI[sha256sum] = "0c8e242c33c45928de560d7d595db06feb41d1b22167e37260ceabe72f9e992f"
+SRC_URI[md5sum] = "b93435488942486c8d0ca22e8f768034"
+SRC_URI[sha256sum] = "ef9d0bcb64647d9e5125dc7534d7ca371c98310fec87677c410f397f71ffbe3f"
 
 S = "${WORKDIR}/freetype-${PV}"
 
-- 
1.7.11.7



