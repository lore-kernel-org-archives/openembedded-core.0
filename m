Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EF78165DEB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 00:19:55 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 06 Nov 2014 16:18:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,329,1413270000"; d="scan'208";a="632989789"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.13.21])
	by orsmga002.jf.intel.com with ESMTP; 06 Nov 2014 16:19:55 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Nov 2014 16:19:35 -0800
Message-Id: <3228b03d3e99a21c749efffef54dd3ab939a0800.1415319473.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1415319473.git.sgw@linux.intel.com>
References: <cover.1415319473.git.sgw@linux.intel.com>
In-Reply-To: <cover.1415319473.git.sgw@linux.intel.com>
References: <cover.1415319473.git.sgw@linux.intel.com>
Subject: [PATCH 10/19] libxkbcommon: Upgrade to 0.5.0
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
X-List-Received-Date: Fri, 07 Nov 2014 00:19:56 -0000

COPYING has additional MIT section

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../xorg-lib/{libxkbcommon_0.4.3.bb => libxkbcommon_0.5.0.bb}       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_0.4.3.bb => libxkbcommon_0.5.0.bb} (73%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.4.3.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.5.0.bb
similarity index 73%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_0.4.3.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_0.5.0.bb
index 0dd2956..a166b57 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.4.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.5.0.bb
@@ -2,15 +2,15 @@ SUMMARY = "Generic XKB keymap library"
 DESCRIPTION = "libxkbcommon is a keymap compiler and support library which \
 processes a reduced subset of keymaps as defined by the XKB specification."
 HOMEPAGE = "http://www.xkbcommon.org"
-LIC_FILES_CHKSUM = "file://COPYING;md5=9c0b824e72a22f9d2c40b9c93b1f0ddc"
+LIC_FILES_CHKSUM = "file://COPYING;md5=09457b156e3155972abebcaaaa0cb434"
 LICENSE = "MIT & MIT-style"
 
 DEPENDS = "util-macros flex-native bison-native"
 
 SRC_URI = "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "26c57ff21438ed45de2a4ca609177db9"
-SRC_URI[sha256sum] = "9a52d5d0419e76c49c0ece86208c205ffacb1cf0ff8ffbaba98d3d4dd40c4e41"
+SRC_URI[md5sum] = "2e1faeafcc609c30af3a561a91e84158"
+SRC_URI[sha256sum] = "90bd7824742b9a6f52a6cf80e2cadd6f5349cf600a358d08260772615b89d19c"
 
 inherit autotools pkgconfig
 
-- 
1.8.3.1


