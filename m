Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UV7f5-0007V8-5w
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 23:55:39 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 24 Apr 2013 14:37:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,546,1363158000"; d="scan'208";a="300916462"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.85])
	by orsmga001.jf.intel.com with ESMTP; 24 Apr 2013 14:37:18 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2013 14:37:06 -0700
Message-Id: <a36521958969f61c9c7316af6d1960d131c6c81d.1366827512.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1366827512.git.sgw@linux.intel.com>
References: <cover.1366827512.git.sgw@linux.intel.com>
In-Reply-To: <cover.1366827512.git.sgw@linux.intel.com>
References: <cover.1366827512.git.sgw@linux.intel.com>
Subject: [PATCH 13/18] libxkbcommon: Update to 0.3.0
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
X-List-Received-Date: Wed, 24 Apr 2013 21:55:50 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../xorg-lib/{libxkbcommon_0.2.0.bb => libxkbcommon_0.3.0.bb} | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_0.2.0.bb => libxkbcommon_0.3.0.bb} (67%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.2.0.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.3.0.bb
similarity index 67%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_0.2.0.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_0.3.0.bb
index e8d16df..6e6dbfa 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.2.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.3.0.bb
@@ -2,18 +2,15 @@ SUMMARY = "Generic XKB keymap library"
 DESCRIPTION = "libxkbcommon is a keymap compiler and support library which \
 processes a reduced subset of keymaps as defined by the XKB specification."
 HOMEPAGE = "http://www.xkbcommon.org"
-
+LIC_FILES_CHKSUM = "file://COPYING;md5=9c0b824e72a22f9d2c40b9c93b1f0ddc"
 LICENSE = "MIT & MIT-style"
 
 DEPENDS = "util-macros flex-native bison-native"
 
-SRC_URI = "http://xkbcommon.org/download/${BPN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "2be3d4a255d02c7d46fc6a9486f21f6a"
-SRC_URI[sha256sum] = "74eb0a121ca3998015fd687591426bb15c524645a72cf602831b2e729172fb42"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=9c0b824e72a22f9d2c40b9c93b1f0ddc"
+SRC_URI = "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
 
-PR = "r1"
+SRC_URI[md5sum] = "22a046100738f99b4cc0297aa210f4e4"
+SRC_URI[sha256sum] = "866c0df88f806dff8fc859b6f082cf9f8b6c3b549f0a367541e12b1ca28a5d65"
 
 inherit autotools pkgconfig
 
-- 
1.8.0.2



