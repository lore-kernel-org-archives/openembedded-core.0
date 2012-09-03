Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1T8ZtL-0001H1-QF
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 18:52:52 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 03 Sep 2012 09:40:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,360,1344236400"; d="scan'208";a="188269389"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.156])
	by azsmga001.ch.intel.com with ESMTP; 03 Sep 2012 09:40:32 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2012 18:45:22 +0300
Message-Id: <9a2ae381274d18738f38075f1f8078ac83d30c81.1346686600.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1346686600.git.constantinx.musca@intel.com>
References: <cover.1346686600.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1346686600.git.constantinx.musca@intel.com>
References: <cover.1346686600.git.constantinx.musca@intel.com>
Subject: [PATCH 7/9] freetype: upgrade to 2.4.10
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
X-List-Received-Date: Mon, 03 Sep 2012 16:52:52 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../no-hardcode.patch                              |    0
 .../{freetype_2.4.9.bb => freetype_2.4.10.bb}      |    6 +++---
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/freetype/{freetype-2.4.9 => freetype-2.4.10}/no-hardcode.patch (100%)
 rename meta/recipes-graphics/freetype/{freetype_2.4.9.bb => freetype_2.4.10.bb} (90%)

diff --git a/meta/recipes-graphics/freetype/freetype-2.4.9/no-hardcode.patch b/meta/recipes-graphics/freetype/freetype-2.4.10/no-hardcode.patch
similarity index 100%
rename from meta/recipes-graphics/freetype/freetype-2.4.9/no-hardcode.patch
rename to meta/recipes-graphics/freetype/freetype-2.4.10/no-hardcode.patch
diff --git a/meta/recipes-graphics/freetype/freetype_2.4.9.bb b/meta/recipes-graphics/freetype/freetype_2.4.10.bb
similarity index 90%
rename from meta/recipes-graphics/freetype/freetype_2.4.9.bb
rename to meta/recipes-graphics/freetype/freetype_2.4.10.bb
index 199a529..cf2a78e 100644
--- a/meta/recipes-graphics/freetype/freetype_2.4.9.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.4.10.bb
@@ -13,13 +13,13 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=28d5381b1bef2649c59f20c20bae4f39
 
 SECTION = "libs"
 
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
            file://no-hardcode.patch"
 
-SRC_URI[md5sum] = "77a893dae81fd5b896632715ca041179"
-SRC_URI[sha256sum] = "c4204ac1d48e99d4375a2f32bf4f3f92780a9d9f015e64e57e852f6c004859b9"
+SRC_URI[md5sum] = "13286702e9390a91661f980608adaff1"
+SRC_URI[sha256sum] = "0c8e242c33c45928de560d7d595db06feb41d1b22167e37260ceabe72f9e992f"
 
 S = "${WORKDIR}/freetype-${PV}"
 
-- 
1.7.9.5



