Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1U4tCW-0007cY-2f
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Feb 2013 14:13:46 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 11 Feb 2013 04:56:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,643,1355126400"; d="scan'208";a="284162167"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by orsmga002.jf.intel.com with ESMTP; 11 Feb 2013 04:57:40 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Feb 2013 14:58:33 +0200
Message-Id: <1360587513-3415-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH] pixman: upgrade to 0.29.2
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
X-List-Received-Date: Mon, 11 Feb 2013 13:13:47 -0000
X-List-Received-Date: Mon, 11 Feb 2013 13:13:47 -0000

obsolete_automake_macros.patch: removed
- included in the new version

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../xorg-lib/pixman/obsolete_automake_macros.patch         | 14 --------------
 .../xorg-lib/{pixman_0.28.2.bb => pixman_0.29.2.bb}        |  7 +++----
 2 files changed, 3 insertions(+), 18 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/pixman/obsolete_automake_macros.patch
 rename meta/recipes-graphics/xorg-lib/{pixman_0.28.2.bb => pixman_0.29.2.bb} (85%)

diff --git a/meta/recipes-graphics/xorg-lib/pixman/obsolete_automake_macros.patch b/meta/recipes-graphics/xorg-lib/pixman/obsolete_automake_macros.patch
deleted file mode 100644
index 7a4237c..0000000
--- a/meta/recipes-graphics/xorg-lib/pixman/obsolete_automake_macros.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Upstream-Status: Accepted
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd pixman-0.28.2/configure.ac pixman-0.28.2/configure.ac
---- pixman-0.28.2/configure.ac	2012-12-10 13:46:36.000000000 +0200
-+++ pixman-0.28.2/configure.ac	2013-01-03 06:31:07.574848073 +0200
-@@ -64,7 +64,7 @@
- # Suppress verbose compile lines
- m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
-
--AM_CONFIG_HEADER(config.h)
-+AC_CONFIG_HEADERS(config.h)
-
- AC_CANONICAL_HOST
diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.28.2.bb b/meta/recipes-graphics/xorg-lib/pixman_0.29.2.bb
similarity index 85%
rename from meta/recipes-graphics/xorg-lib/pixman_0.28.2.bb
rename to meta/recipes-graphics/xorg-lib/pixman_0.29.2.bb
index 59c2691..9140f4b 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.28.2.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.29.2.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=14096c769ae0cbb5fcb94ec468be11b3 \
 DEPENDS += "zlib libpng"
 BBCLASSEXTEND = "native nativesdk"
 
-PR = "r1"
+PR = "r0"
 
 PE = "1"
 
@@ -31,8 +31,7 @@ EXTRA_OECONF_class-native = "--disable-gtk"
 SRC_URI += "\
             file://0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch \
             file://Generic-C-implementation-of-pixman_blt-with-overlapp.patch \
-            file://obsolete_automake_macros.patch \
 "
 
-SRC_URI[md5sum] = "f6e3294c4edb7b6bca8459e604286348"
-SRC_URI[sha256sum] = "583686afbfa5a1dfc40a21e888a3eacf31fe0e02469d20b821b5d8f719165a51"
+SRC_URI[md5sum] = "6e64a6d73559973ef6a9f125b5161ad3"
+SRC_URI[sha256sum] = "aa3dca46f6c90ae7731929d4e12195a981c52c3a423669ec3329d5a9c469841f"
-- 
1.7.11.7



