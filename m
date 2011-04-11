Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1Q95rt-0005pl-V8
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Apr 2011 03:24:42 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 10 Apr 2011 18:21:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,336,1299484800"; d="scan'208";a="677398620"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.102])
	by fmsmga002.fm.intel.com with ESMTP; 10 Apr 2011 18:21:24 -0700
Message-Id: <f74e7c05450d92de63024f169bf60392ab8bcb74.1302485033.git.ke.yu@intel.com>
In-Reply-To: <cover.1302485033.git.ke.yu@intel.com>
References: <cover.1302485033.git.ke.yu@intel.com>
Old-Date: Thu, 7 Apr 2011 15:16:01 +0800
Date: Mon, 11 Apr 2011  9:28:35 +0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Yu Ke <ke.yu@intel.com>
Subject: [PATCH 1/9] libdrm: upgrade from 2.4.23 to 2.4.24
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
X-List-Received-Date: Mon, 11 Apr 2011 01:24:42 -0000

From: Yu Ke <ke.yu@intel.com>

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 .../distro/include/preferred-xorg-versions.inc     |    2 +-
 .../installtests.patch                             |    0
 .../drm/{libdrm_2.4.23.bb => libdrm_2.4.24.bb}     |    4 ++--
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm-2.4.23 => libdrm-2.4.24}/installtests.patch (100%)
 rename meta/recipes-graphics/drm/{libdrm_2.4.23.bb => libdrm_2.4.24.bb} (54%)

diff --git a/meta/conf/distro/include/preferred-xorg-versions.inc b/meta/conf/distro/include/preferred-xorg-versions.inc
index b164b77..092ba35 100644
--- a/meta/conf/distro/include/preferred-xorg-versions.inc
+++ b/meta/conf/distro/include/preferred-xorg-versions.inc
@@ -136,7 +136,7 @@ PREFERRED_VERSION_xtrans-nativesdk ?= "1.2.6"
 PREFERRED_VERSION_xvinfo ?= "1.1.1"
 PREFERRED_VERSION_xwininfo ?= "1.1.1"
 PREFERRED_VERSION_mesa-dri ?= "7.10"
-PREFERRED_VERSION_libdrm ?= "2.4.23"
+PREFERRED_VERSION_libdrm ?= "2.4.24"
 PREFERRED_VERSION_xcb-proto ?= "1.6"
 PREFERRED_VERSION_libxcb ?= "1.7"
 PREFERRED_VERSION_libxcb-nativesdk ?= "1.7"
diff --git a/meta/recipes-graphics/drm/libdrm-2.4.23/installtests.patch b/meta/recipes-graphics/drm/libdrm-2.4.24/installtests.patch
similarity index 100%
rename from meta/recipes-graphics/drm/libdrm-2.4.23/installtests.patch
rename to meta/recipes-graphics/drm/libdrm-2.4.24/installtests.patch
diff --git a/meta/recipes-graphics/drm/libdrm_2.4.23.bb b/meta/recipes-graphics/drm/libdrm_2.4.24.bb
similarity index 54%
rename from meta/recipes-graphics/drm/libdrm_2.4.23.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.24.bb
index 1546cea..c536a3b 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.23.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.24.bb
@@ -3,7 +3,7 @@ require libdrm.inc
 LIC_FILES_CHKSUM = "file://xf86drm.c;beginline=9;endline=32;md5=c8a3b961af7667c530816761e949dc71"
 
 SRC_URI += "file://installtests.patch"
-SRC_URI[md5sum] = "7577ff36ec364d88fae466d4f7fc5fc6"
-SRC_URI[sha256sum] = "c0f06d68c3edba7a1ad937f5481a8c287efd4cd368cee66cd9e678b06a911c18"
+SRC_URI[md5sum] = "8d802bf3b368f9fac0d7d17516a9436f"
+SRC_URI[sha256sum] = "c7012381f64458af9f291d913309448aac7dd23a28dc86c6970e4bf38effb6a5"
 
 PR = "r0"
-- 
1.7.0.4



