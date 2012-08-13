Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1T0ozI-0004PJ-So
	for openembedded-core@lists.linuxtogo.org;
	Mon, 13 Aug 2012 09:22:57 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Aug 2012 00:09:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,758,1336374000"; d="scan'208";a="179859354"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.33])
	by orsmga001.jf.intel.com with ESMTP; 13 Aug 2012 00:09:34 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Aug 2012 09:14:19 +0300
Message-Id: <1344838459-26178-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
Cc: openembedded-core@lists.linuxtogo.org,
	Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCH] libdrm: package update 2.4.35 -> 2.4.37
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
X-List-Received-Date: Mon, 13 Aug 2012 07:22:57 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../drm/{libdrm_2.4.35.bb => libdrm_2.4.37.bb}     |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.35.bb => libdrm_2.4.37.bb} (50%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.35.bb b/meta/recipes-graphics/drm/libdrm_2.4.37.bb
similarity index 50%
rename from meta/recipes-graphics/drm/libdrm_2.4.35.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.37.bb
index 58ee449..d704b90 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.35.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.37.bb
@@ -6,5 +6,5 @@ SRC_URI += "file://installtests.patch \
             file://GNU_SOURCE_definition.patch \
            "
 
-SRC_URI[md5sum] = "a40f5293dc0a7b49d2a1e959d7d60194"
-SRC_URI[sha256sum] = "c390aee132f05910edb09398b70e108c6b53f9b69b21914a9ea3165eed6f1b21"
+SRC_URI[md5sum] = "9765919c28d4a54887576db3680137cc"
+SRC_URI[sha256sum] = "e4ea39a901d4a8e59064f10f413bb037dad7790f7c16a5986e7cc1453b36488f"
-- 
1.7.9.5



