Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QvcUP-0006ye-VP
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Aug 2011 23:57:02 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 22 Aug 2011 14:52:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,265,1312182000"; d="scan'208";a="43970299"
Received: from unknown (HELO swold-MOBL.lan) ([10.255.13.234])
	by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2011 14:52:16 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Aug 2011 14:52:02 -0700
Message-Id: <b92e9da3cfa8097b4e026f7f81fe2c112278d614.1314043945.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1314043945.git.sgw@linux.intel.com>
References: <cover.1314043945.git.sgw@linux.intel.com>
In-Reply-To: <cover.1314043945.git.sgw@linux.intel.com>
References: <cover.1314043945.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 17/19] libsdl: do not inherit nativesdk
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
X-List-Received-Date: Mon, 22 Aug 2011 21:57:02 -0000

From: Jiajun Xu <jiajun.xu@intel.com>

We already enable target version for libsdl and use BBCLASSEXTEND
to enable nativesdk. No need to inherit nativesdk then.

Signed-off-by: Jiajun Xu <jiajun.xu@intel.com>
---
 meta/recipes-graphics/libsdl/libsdl_1.2.11.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.11.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.11.bb
index 8b0d3c2..74489b0 100644
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
1.7.6



