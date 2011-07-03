Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QdMOC-0003G6-PJ
	for openembedded-core@lists.openembedded.org;
	Sun, 03 Jul 2011 15:07:08 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Jul 2011 06:03:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,467,1304319600"; d="scan'208";a="21082089"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.187])
	by orsmga002.jf.intel.com with ESMTP; 03 Jul 2011 06:03:18 -0700
From: Yu Ke <ke.yu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Jul 2011 21:03:14 +0800
Message-Id: <8fb77cc6848ff67b3d07d36364d037e90d98b3cd.1309698011.git.ke.yu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1309698011.git.ke.yu@intel.com>
References: <cover.1309698011.git.ke.yu@intel.com>
In-Reply-To: <cover.1309698011.git.ke.yu@intel.com>
References: <cover.1309698011.git.ke.yu@intel.com>
Subject: [PATCH 2/5] libdrm: upgrade to 2.4.26
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
X-List-Received-Date: Sun, 03 Jul 2011 13:07:09 -0000

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 meta/recipes-graphics/drm/libdrm.inc               |    3 +++
 .../{libdrm-2.4.25 => libdrm}/installtests.patch   |    0
 .../drm/{libdrm_2.4.25.bb => libdrm_2.4.26.bb}     |    4 ++--
 3 files changed, 5 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm-2.4.25 => libdrm}/installtests.patch (100%)
 rename meta/recipes-graphics/drm/{libdrm_2.4.25.bb => libdrm_2.4.26.bb} (54%)

diff --git a/meta/recipes-graphics/drm/libdrm.inc b/meta/recipes-graphics/drm/libdrm.inc
index a66afad..1ad9dc3 100644
--- a/meta/recipes-graphics/drm/libdrm.inc
+++ b/meta/recipes-graphics/drm/libdrm.inc
@@ -10,6 +10,9 @@ SRC_URI = "http://dri.freedesktop.org/libdrm/libdrm-${PV}.tar.bz2"
 PROVIDES = "drm"
 DEPENDS = "libpthread-stubs udev cairo virtual/libx11"
 
+#libpciaccess is required starting from libdrm 2.4.26
+DEPENDS += " libpciaccess"
+
 inherit autotools pkgconfig
 
 PACKAGES =+ "libdrm-tests"
diff --git a/meta/recipes-graphics/drm/libdrm-2.4.25/installtests.patch b/meta/recipes-graphics/drm/libdrm/installtests.patch
similarity index 100%
rename from meta/recipes-graphics/drm/libdrm-2.4.25/installtests.patch
rename to meta/recipes-graphics/drm/libdrm/installtests.patch
diff --git a/meta/recipes-graphics/drm/libdrm_2.4.25.bb b/meta/recipes-graphics/drm/libdrm_2.4.26.bb
similarity index 54%
rename from meta/recipes-graphics/drm/libdrm_2.4.25.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.26.bb
index 177e444..e5aa6a4 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.25.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.26.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://xf86drm.c;beginline=9;endline=32;md5=c8a3b961af7667c5
 
 SRC_URI += "file://installtests.patch"
 
-SRC_URI[md5sum] = "f53dc4c72109b17908e4113c3b8addfe"
-SRC_URI[sha256sum] = "51f99a815a18876977991bbc6f190607791d25a6e47a3269880ce7679dbd0e9f"
+SRC_URI[md5sum] = "062569426773f69b11a47a7712bba770"
+SRC_URI[sha256sum] = "b25b06ab5a077736044cbd9a3a05a9a23b873a0887ab1aaf93aa2b3218b2d3dc"
 
 PR = "r0"
-- 
1.7.0.4



