Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jiajun.xu@intel.com>) id 1QvWKs-0000vx-Jd
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Aug 2011 17:22:46 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 22 Aug 2011 08:18:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,263,1312182000"; d="scan'208";a="43856328"
Received: from unknown (HELO localhost) ([10.239.48.201])
	by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2011 08:18:01 -0700
From: Jiajun Xu <jiajun.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Aug 2011 23:36:50 +0800
Message-Id: <affcf82437bc5de4cc1fb470d09eb5fa5c6357f6.1314027196.git.jiajun.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1314027196.git.jiajun.xu@intel.com>
References: <cover.1314027196.git.jiajun.xu@intel.com>
Subject: [PATCH 1/2] libsdl: do not inherit nativesdk
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
X-List-Received-Date: Mon, 22 Aug 2011 15:22:46 -0000

We already enable target version for libsdl and use BBCLASSEXTEND
to enable nativesdk. No need to inherit nativesdk then.

Signed-off-by: Jiajun Xu <jiajun.xu@intel.com>
---
 meta/recipes-graphics/libsdl/libsdl_1.2.11.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.11.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.11.bb
index f08077d..80b291d 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.11.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.11.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
 DEPENDS = "${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)} virtual/libx11 libxext libxrandr libxrender"
 DEPENDS_virtclass-nativesdk = "libx11-nativesdk libxrandr-nativesdk libxrender-nativesdk libxext-nativesdk"
 
-PR = "r7"
+PR = "r8"
 
 SRC_URI = "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
 	   file://acinclude.m4 \
@@ -25,7 +25,7 @@ S = "${WORKDIR}/SDL-${PV}"
 SRC_URI[md5sum] = "418b42956b7cd103bfab1b9077ccc149"
 SRC_URI[sha256sum] = "6985823287b224b57390b1c1b6cbc54cc9a7d7757fbf9934ed20754b4cd23730"
 
-inherit autotools binconfig pkgconfig nativesdk
+inherit autotools binconfig pkgconfig
 
 EXTRA_OECONF = "--disable-static --disable-debug --disable-cdrom --enable-threads --enable-timers --enable-endian \
                 --enable-file --disable-oss --disable-alsa --disable-esd --disable-arts \
-- 
1.7.1



