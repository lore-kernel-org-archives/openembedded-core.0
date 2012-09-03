Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1T8ZtG-0001A9-16
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 18:52:46 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 03 Sep 2012 09:40:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,360,1344236400"; d="scan'208";a="188269356"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.156])
	by azsmga001.ch.intel.com with ESMTP; 03 Sep 2012 09:40:26 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2012 18:45:18 +0300
Message-Id: <fc27754cc96820c23b9f1fd961d99c2f462f0f01.1346686600.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1346686600.git.constantinx.musca@intel.com>
References: <cover.1346686600.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1346686600.git.constantinx.musca@intel.com>
References: <cover.1346686600.git.constantinx.musca@intel.com>
Subject: [PATCH 3/9] libdrm: upgrade to 2.4.39
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
X-List-Received-Date: Mon, 03 Sep 2012 16:52:46 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../drm/{libdrm_2.4.37.bb => libdrm_2.4.39.bb}     |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.37.bb => libdrm_2.4.39.bb} (50%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.37.bb b/meta/recipes-graphics/drm/libdrm_2.4.39.bb
similarity index 50%
rename from meta/recipes-graphics/drm/libdrm_2.4.37.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.39.bb
index d704b90..4e6a8d5 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.37.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.39.bb
@@ -6,5 +6,5 @@ SRC_URI += "file://installtests.patch \
             file://GNU_SOURCE_definition.patch \
            "
 
-SRC_URI[md5sum] = "9765919c28d4a54887576db3680137cc"
-SRC_URI[sha256sum] = "e4ea39a901d4a8e59064f10f413bb037dad7790f7c16a5986e7cc1453b36488f"
+SRC_URI[md5sum] = "9a299e021d81bab6c82307582c78319d"
+SRC_URI[sha256sum] = "386b17388980504bca16ede81ceed4c77b12c3488f46ecb7f4d48e48512a733d"
-- 
1.7.9.5



