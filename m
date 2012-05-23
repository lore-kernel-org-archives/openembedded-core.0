Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SXBWu-0003Gz-9I
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 15:23:08 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2012 06:11:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="147416754"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by orsmga002.jf.intel.com with ESMTP; 23 May 2012 06:11:29 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 16:11:05 +0300
Message-Id: <b8194bd7313e27ef774e706f1d62871d955874e0.1337777033.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1337777033.git.laurentiu.palcu@intel.com>
References: <cover.1337777033.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1337777033.git.laurentiu.palcu@intel.com>
References: <cover.1337777033.git.laurentiu.palcu@intel.com>
Subject: [PATCH 13/19] fontconfig: upgrade to 2.9.0
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
X-List-Received-Date: Wed, 23 May 2012 13:23:08 -0000

Other changes:
	- licence checksums because the licence headers changed slightly
	- rebased the fix-pkgconfig.patch to apply on 2.9.0
	- removed all sed instructions in do_configure_append() that were
	  changing fc-arch/Makefile. In the new version the fc-arch/ directory
	  has been removed in order to make the package cross-compiling safe

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../97_fontconfig                                  |    0
 .../fix-pkgconfig.patch                            |    4 ++--
 ...-native_2.8.0.bb => fontconfig-native_2.9.0.bb} |    0
 .../{fontconfig_2.8.0.bb => fontconfig_2.9.0.bb}   |   12 ++++--------
 4 files changed, 6 insertions(+), 10 deletions(-)
 rename meta/recipes-graphics/fontconfig/{fontconfig-2.8.0 => fontconfig-2.9.0}/97_fontconfig (100%)
 rename meta/recipes-graphics/fontconfig/{fontconfig-2.8.0 => fontconfig-2.9.0}/fix-pkgconfig.patch (84%)
 rename meta/recipes-graphics/fontconfig/{fontconfig-native_2.8.0.bb => fontconfig-native_2.9.0.bb} (100%)
 rename meta/recipes-graphics/fontconfig/{fontconfig_2.8.0.bb => fontconfig_2.9.0.bb} (84%)

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
similarity index 84%
rename from meta/recipes-graphics/fontconfig/fontconfig_2.8.0.bb
rename to meta/recipes-graphics/fontconfig/fontconfig_2.9.0.bb
index 55c04cc..b3d5bab 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.8.0.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.9.0.bb
@@ -12,15 +12,15 @@ HOMEPAGE = "http://www.fontconfig.org"
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



