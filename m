Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SYsyB-000762-9H
	for openembedded-core@lists.openembedded.org;
	Mon, 28 May 2012 07:58:19 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 27 May 2012 22:48:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="149128196"
Received: from lpalcu-laptop.sh.intel.com ([10.239.196.129])
	by orsmga002.jf.intel.com with ESMTP; 27 May 2012 22:48:01 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 May 2012 08:47:58 +0300
Message-Id: <1338184080-18892-2-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1338184080-18892-1-git-send-email-laurentiu.palcu@intel.com>
References: <1338184080-18892-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [PATCH 1/3] fontconfig: upgrade to 2.9.0
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
X-List-Received-Date: Mon, 28 May 2012 05:58:19 -0000

Other changes:
	- licence checksums because the licence headers changed slightly:
	  several other authors were added and Keith Packard's name has been
	  replaced with "author(s)". That's it.
	- rebased the fix-pkgconfig.patch to apply on 2.9.0
	- removed all sed instructions in do_configure_append() that were
	  changing fc-arch/Makefile. In the new version the fc-arch/ directory
	  has been removed in order to make the package cross-compiling safe

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../97_fontconfig                                  |    0
 .../fix-pkgconfig.patch                            |    4 ++--
 ...-native_2.8.0.bb => fontconfig-native_2.9.0.bb} |    0
 .../{fontconfig_2.8.0.bb => fontconfig_2.9.0.bb}   |   16 ++++++----------
 4 files changed, 8 insertions(+), 12 deletions(-)
 rename meta/recipes-graphics/fontconfig/{fontconfig-2.8.0 => fontconfig-2.9.0}/97_fontconfig (100%)
 rename meta/recipes-graphics/fontconfig/{fontconfig-2.8.0 => fontconfig-2.9.0}/fix-pkgconfig.patch (84%)
 rename meta/recipes-graphics/fontconfig/{fontconfig-native_2.8.0.bb => fontconfig-native_2.9.0.bb} (100%)
 rename meta/recipes-graphics/fontconfig/{fontconfig_2.8.0.bb => fontconfig_2.9.0.bb} (80%)

diff --git a/meta/recipes-graphics/fontconfig/fontconfig-2.8.0/97_fontconfig b/meta/recipes-graphics/fontconfig/fontconfig-2.9.0/97_fontconfig
similarity index 100%
rename from meta/recipes-graphics/fontconfig/fontconfig-2.8.0/97_fontconfig
rename to meta/recipes-graphics/fontconfig/fontconfig-2.9.0/97_fontconfig
diff --git a/meta/recipes-graphics/fontconfig/fontconfig-2.8.0/fix-pkgconfig.patch b/meta/recipes-graphics/fontconfig/fontconfig-2.9.0/fix-pkgconfig.patch
similarity index 84%
rename from meta/recipes-graphics/fontconfig/fontconfig-2.8.0/fix-pkgconfig.patch
rename to meta/recipes-graphics/fontconfig/fontconfig-2.9.0/fix-pkgconfig.patch
index 30415fc..6be04a1 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig-2.8.0/fix-pkgconfig.patch
+++ b/meta/recipes-graphics/fontconfig/fontconfig-2.9.0/fix-pkgconfig.patch
@@ -4,8 +4,8 @@ Upstream-Status: Inappropriate [configuration]
  fontconfig.pc.in |    2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
---- fontconfig-2.8.0.orig/fontconfig.pc.in
-+++ fontconfig-2.8.0/fontconfig.pc.in
+--- fontconfig-2.9.0.orig/fontconfig.pc.in
++++ fontconfig-2.9.0/fontconfig.pc.in
 @@ -7,5 +7,5 @@
  Description: Font configuration and customization library
  Version: @VERSION@
diff --git a/meta/recipes-graphics/fontconfig/fontconfig-native_2.8.0.bb b/meta/recipes-graphics/fontconfig/fontconfig-native_2.9.0.bb
similarity index 100%
rename from meta/recipes-graphics/fontconfig/fontconfig-native_2.8.0.bb
rename to meta/recipes-graphics/fontconfig/fontconfig-native_2.9.0.bb
diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.8.0.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.9.0.bb
similarity index 80%
rename from meta/recipes-graphics/fontconfig/fontconfig_2.8.0.bb
rename to meta/recipes-graphics/fontconfig/fontconfig_2.9.0.bb
index 55c04cc..7f3f111 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.8.0.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.9.0.bb
@@ -12,22 +12,22 @@ HOMEPAGE = "http://www.fontconfig.org"
 BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=fontconfig"
 
 LICENSE = "MIT-style & MIT & PD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f3ad4145dea6ca7efa2f1bee8165a7a1 \
-                    file://src/fcfreetype.c;endline=45;md5=bc3dd139e2f7245a02fde5545b203a6f \
-                    file://src/fccache.c;beginline=1020;endline=1035;md5=0326cfeb4a7333dd4dd25fbbc4b9f27f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=dc5b39c592e47a22dbec44855988d2a0 \
+                    file://src/fcfreetype.c;endline=45;md5=5d9513e3196a1fbfdfa94051c09dfc84 \
+                    file://src/fccache.c;beginline=1077;endline=1092;md5=0326cfeb4a7333dd4dd25fbbc4b9f27f"
 
 SECTION = "libs"
 
 DEPENDS = "expat freetype zlib"
 
-PR = "r4"
+PR = "r0"
 
 SRC_URI = "http://fontconfig.org/release/fontconfig-${PV}.tar.gz \
            file://fix-pkgconfig.patch \
            file://97_fontconfig"
 
-SRC_URI[md5sum] = "77e15a92006ddc2adbb06f840d591c0e"
-SRC_URI[sha256sum] = "fa2a1c6eea654d9fce7a4b1220f10c99cdec848dccaf1625c01f076b31382335"
+SRC_URI[md5sum] = "26c83855ed256b5c032baae032fadc4f"
+SRC_URI[sha256sum] = "ca7e25071cf044bdcdaf7c48845243c115b9269b4e369c6bd78a29e71f01b41a"
 
 PACKAGES =+ "fontconfig-utils-dbg fontconfig-utils "
 FILES_fontconfig-utils-dbg = "${bindir}/*.dbg"
@@ -66,22 +66,18 @@ do_configure_append () {
 	sed -i 's|LDFLAGS =.*|LDFLAGS =|' fc-case/Makefile
 	sed -i 's|LDFLAGS =.*|LDFLAGS =|' fc-glyphname/Makefile
 	sed -i 's|LDFLAGS =.*|LDFLAGS =|' fc-lang/Makefile
-	sed -i 's|LDFLAGS =.*|LDFLAGS =|' fc-arch/Makefile
 
 	sed -i 's|CFLAGS =.*|CFLAGS =${BUILD_CFLAGS}|' fc-case/Makefile
 	sed -i 's|CFLAGS =.*|CFLAGS =${BUILD_CFLAGS}|' fc-glyphname/Makefile
 	sed -i 's|CFLAGS =.*|CFLAGS =${BUILD_CFLAGS}|' fc-lang/Makefile
-	sed -i 's|CFLAGS =.*|CFLAGS =${BUILD_CFLAGS}|' fc-arch/Makefile
 
 	sed -i 's|CPPFLAGS =.*|CPPFLAGS =${BUILD_CPPFLAGS}|' fc-case/Makefile
 	sed -i 's|CPPFLAGS =.*|CPPFLAGS =${BUILD_CPPFLAGS}|' fc-glyphname/Makefile
 	sed -i 's|CPPFLAGS =.*|CPPFLAGS =${BUILD_CPPFLAGS}|' fc-lang/Makefile
-	sed -i 's|CPPFLAGS =.*|CPPFLAGS =${BUILD_CPPFLAGS}|' fc-arch/Makefile
 
 	sed -i 's|CXXFLAGS =.*|CFLAGS =${BUILD_CXXFLAGS}|' fc-case/Makefile
 	sed -i 's|CXXFLAGS =.*|CFLAGS =${BUILD_CXXFLAGS}|' fc-glyphname/Makefile
 	sed -i 's|CXXFLAGS =.*|CFLAGS =${BUILD_CXXFLAGS}|' fc-lang/Makefile
-	sed -i 's|CXXFLAGS =.*|CFLAGS =${BUILD_CXXFLAGS}|' fc-arch/Makefile
 
 }
 
-- 
1.7.9.5



