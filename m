Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T1GDK-0001PS-66
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 14:27:15 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2012 05:15:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="186181648"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.12.219])
	by orsmga002.jf.intel.com with ESMTP; 14 Aug 2012 05:15:18 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2012 15:13:50 +0300
Message-Id: <f13f580728aaa44fef8b831b1fe2cbddb7c5e233.1344946189.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
References: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
In-Reply-To: <cover.1344946189.git.sgw@linux.intel.com>
References: <cover.1344946189.git.sgw@linux.intel.com>
Cc: Constantin Musca <constantinx.musca@intel.com>
Subject: [CONSOLIDATED REQUEST 63/64] libdrm: package update 2.4.35 -> 2.4.37
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
X-List-Received-Date: Tue, 14 Aug 2012 12:27:17 -0000

From: Constantin Musca <constantinx.musca@intel.com>

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../drm/{libdrm_2.4.35.bb => libdrm_2.4.37.bb}     |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
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
1.7.7.6



