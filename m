Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 37FBE731CB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 13:23:05 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 May 2016 06:23:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,627,1455004800"; d="scan'208";a="977873561"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 16 May 2016 06:23:05 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 May 2016 16:22:48 +0300
Message-Id: <d652b8f9aa9692e575d8e221dacbbef303f3752c.1463404035.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <25872fbe16b6f36bee45fec3e7f088cd72507351.1463404035.git.jussi.kukkonen@intel.com>
References: <25872fbe16b6f36bee45fec3e7f088cd72507351.1463404035.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1463404035.git.jussi.kukkonen@intel.com>
References: <cover.1463404035.git.jussi.kukkonen@intel.com>
Subject: [PATCH 11/13] wayland: Upgrade 1.9.0 -> 1.10.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 May 2016 13:23:05 -0000

Yes, Wayland now depends on another xml parser (just for build time
dtd validation).

Use HTTPS for tarball uri.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../wayland/{wayland_1.9.0.bb => wayland_1.10.0.bb}               | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/wayland/{wayland_1.9.0.bb => wayland_1.10.0.bb} (85%)

diff --git a/meta/recipes-graphics/wayland/wayland_1.9.0.bb b/meta/recipes-graphics/wayland/wayland_1.10.0.bb
similarity index 85%
rename from meta/recipes-graphics/wayland/wayland_1.9.0.bb
rename to meta/recipes-graphics/wayland/wayland_1.10.0.bb
index d12ac18..41d08b7 100644
--- a/meta/recipes-graphics/wayland/wayland_1.9.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.10.0.bb
@@ -10,9 +10,9 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b31d8f53b6aaf2b4985d7dd7810a70d1 \
                     file://src/wayland-server.c;endline=24;md5=b8e046164a766bb1ede8ba38e9dcd7ce"
 
-SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "5e141b3f2a7005d6c89d6f233c87c317"
-SRC_URI[sha256sum] = "9c8770720aa0034479735f58a4dc4ca9b172ecfede28f5134312e135b7301efa"
+SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "e7751c38807c231afaba9d6b68f2a2b7"
+SRC_URI[sha256sum] = "4bf6e790aa6f50ab3825676282ecd75850ec9c4767af96ecb7127b1f3c3d60dc"
 
 EXTRA_OECONF_class-native = "--disable-documentation --disable-libraries"
 
@@ -20,7 +20,7 @@ inherit autotools pkgconfig
 
 BBCLASSEXTEND = "native nativesdk"
 
-DEPENDS = "expat libffi wayland-native"
+DEPENDS = "expat libxml2 libffi wayland-native"
 
 EXTRA_OECONF = "--disable-documentation --with-host-scanner"
 
-- 
2.1.4


