Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Sd0fN-0001vf-8l
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 16:59:57 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 08 Jun 2012 07:48:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="153552622"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by azsmga001.ch.intel.com with ESMTP; 08 Jun 2012 07:48:21 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jun 2012 17:48:15 +0300
Message-Id: <1339166898-11667-2-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1339166898-11667-1-git-send-email-laurentiu.palcu@intel.com>
References: <1339166898-11667-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [PATCH 1/4] freetype: upgrade to 2.4.9
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
X-List-Received-Date: Fri, 08 Jun 2012 14:59:57 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../no-hardcode.patch                              |    0
 .../{freetype_2.4.8.bb => freetype_2.4.9.bb}       |    4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/freetype/{freetype-2.4.8 => freetype-2.4.9}/no-hardcode.patch (100%)
 rename meta/recipes-graphics/freetype/{freetype_2.4.8.bb => freetype_2.4.9.bb} (91%)

diff --git a/meta/recipes-graphics/freetype/freetype-2.4.8/no-hardcode.patch b/meta/recipes-graphics/freetype/freetype-2.4.9/no-hardcode.patch
similarity index 100%
rename from meta/recipes-graphics/freetype/freetype-2.4.8/no-hardcode.patch
rename to meta/recipes-graphics/freetype/freetype-2.4.9/no-hardcode.patch
diff --git a/meta/recipes-graphics/freetype/freetype_2.4.8.bb b/meta/recipes-graphics/freetype/freetype_2.4.9.bb
similarity index 91%
rename from meta/recipes-graphics/freetype/freetype_2.4.8.bb
rename to meta/recipes-graphics/freetype/freetype_2.4.9.bb
index bce01cf..31bee80 100644
--- a/meta/recipes-graphics/freetype/freetype_2.4.8.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.4.9.bb
@@ -18,8 +18,8 @@ PR = "r0"
 SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
            file://no-hardcode.patch"
 
-SRC_URI[md5sum] = "dbf2caca1d3afd410a29217a9809d397"
-SRC_URI[sha256sum] = "a9eb7da3875fcb2f022a9c280c01b94ae45ac83d8102838c05dce1277948fb71"
+SRC_URI[md5sum] = "77a893dae81fd5b896632715ca041179"
+SRC_URI[sha256sum] = "c4204ac1d48e99d4375a2f32bf4f3f92780a9d9f015e64e57e852f6c004859b9"
 
 S = "${WORKDIR}/freetype-${PV}"
 
-- 
1.7.9.5



