Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVWn2-0001ej-Ji
	for openembedded-core@openembedded.org; Wed, 30 Nov 2011 00:08:40 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Nov 2011 15:00:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,594,1315206000"; d="scan'208";a="96720782"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2011 15:00:28 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 29 Nov 2011 15:00:03 -0800
Message-Id: <11aa231f1b8bfb012905d7afcd97c684239c1ecb.1322607016.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
Subject: [PATCH 03/26] libdrm: Update to 2.4.27
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
X-List-Received-Date: Tue, 29 Nov 2011 23:08:40 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../drm/{libdrm_2.4.26.bb => libdrm_2.4.27.bb}     |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.26.bb => libdrm_2.4.27.bb} (51%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.26.bb b/meta/recipes-graphics/drm/libdrm_2.4.27.bb
similarity index 51%
rename from meta/recipes-graphics/drm/libdrm_2.4.26.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.27.bb
index f7a7307..473520e 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.26.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.27.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://xf86drm.c;beginline=9;endline=32;md5=c8a3b961af7667c5
 
 SRC_URI += "file://installtests.patch"
 
-SRC_URI[md5sum] = "062569426773f69b11a47a7712bba770"
-SRC_URI[sha256sum] = "b25b06ab5a077736044cbd9a3a05a9a23b873a0887ab1aaf93aa2b3218b2d3dc"
+SRC_URI[md5sum] = "0fba4f42735cd3d24dd7a8cde0023fbd"
+SRC_URI[sha256sum] = "ea6b04dd3298e36c7a43aadd5f80f48baeafe4caaabcf78b01dc919c5c757973"
 
-PR = "r1"
+PR = "r0"
-- 
1.7.6.4



