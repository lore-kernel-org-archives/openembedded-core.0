Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SmUJw-000572-W4
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 20:29:01 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 04 Jul 2012 11:17:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="164055191"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by azsmga001.ch.intel.com with ESMTP; 04 Jul 2012 11:17:57 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jul 2012 21:17:35 +0300
Message-Id: <e2ce7fef8db6c859a2808d5c335d2f54f8f58de6.1341425229.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1341425229.git.laurentiu.palcu@intel.com>
References: <cover.1341425229.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1341425229.git.laurentiu.palcu@intel.com>
References: <cover.1341425229.git.laurentiu.palcu@intel.com>
Subject: [PATCH 4/8] libx11-trim: upgrade to 1.5.0
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
X-List-Received-Date: Wed, 04 Jul 2012 18:29:01 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../keysymdef_include.patch                        |    0
 .../makekeys_crosscompile.patch                    |    0
 .../x11_disable_makekeys.patch                     |   13 ++++++++-----
 .../{libx11-trim_1.4.4.bb => libx11-trim_1.5.0.bb} |    6 +++---
 4 files changed, 11 insertions(+), 8 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libx11-trim-1.4.4 => libx11-trim-1.5.0}/keysymdef_include.patch (100%)
 rename meta/recipes-graphics/xorg-lib/{libx11-trim-1.4.4 => libx11-trim-1.5.0}/makekeys_crosscompile.patch (100%)
 rename meta/recipes-graphics/xorg-lib/{libx11-trim-1.4.4 => libx11-trim-1.5.0}/x11_disable_makekeys.patch (74%)
 rename meta/recipes-graphics/xorg-lib/{libx11-trim_1.4.4.bb => libx11-trim_1.5.0.bb} (79%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim-1.4.4/keysymdef_include.patch b/meta/recipes-graphics/xorg-lib/libx11-trim-1.5.0/keysymdef_include.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-lib/libx11-trim-1.4.4/keysymdef_include.patch
rename to meta/recipes-graphics/xorg-lib/libx11-trim-1.5.0/keysymdef_include.patch
diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim-1.4.4/makekeys_crosscompile.patch b/meta/recipes-graphics/xorg-lib/libx11-trim-1.5.0/makekeys_crosscompile.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-lib/libx11-trim-1.4.4/makekeys_crosscompile.patch
rename to meta/recipes-graphics/xorg-lib/libx11-trim-1.5.0/makekeys_crosscompile.patch
diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim-1.4.4/x11_disable_makekeys.patch b/meta/recipes-graphics/xorg-lib/libx11-trim-1.5.0/x11_disable_makekeys.patch
similarity index 74%
rename from meta/recipes-graphics/xorg-lib/libx11-trim-1.4.4/x11_disable_makekeys.patch
rename to meta/recipes-graphics/xorg-lib/libx11-trim-1.5.0/x11_disable_makekeys.patch
index e3782a5..69f9e6c 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-trim-1.4.4/x11_disable_makekeys.patch
+++ b/meta/recipes-graphics/xorg-lib/libx11-trim-1.5.0/x11_disable_makekeys.patch
@@ -1,10 +1,10 @@
 Upstream-Status: Pending
 
-Index: libX11-1.3.4/src/util/Makefile.am
+Index: libX11-1.5.0/src/util/Makefile.am
 ===================================================================
---- libX11-1.3.4.orig/src/util/Makefile.am
-+++ libX11-1.3.4/src/util/Makefile.am
-@@ -1,24 +1 @@
+--- libX11-1.5.0.orig/src/util/Makefile.am
++++ libX11-1.5.0/src/util/Makefile.am
+@@ -1,27 +1,2 @@
 -
 -noinst_PROGRAMS=makekeys
 -
@@ -12,13 +12,16 @@ Index: libX11-1.3.4/src/util/Makefile.am
 -	$(X11_CFLAGS) \
 -	$(CWARNFLAGS)
 -
+-makekeys_CPPFLAGS = \
+-	-I$(top_srcdir)/include
+-
 -CC = @CC_FOR_BUILD@
 -CPPFLAGS = @CPPFLAGS_FOR_BUILD@
 -CFLAGS = @CFLAGS_FOR_BUILD@
 -LDFLAGS = @LDFLAGS_FOR_BUILD@
 -
  EXTRA_DIST = mkks.sh
--
+ 
 -if LINT
 -# Check source code with tools like lint & sparse
 -
diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim_1.4.4.bb b/meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb
similarity index 79%
rename from meta/recipes-graphics/xorg-lib/libx11-trim_1.4.4.bb
rename to meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb
index a86e13a..89c4597 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-trim_1.4.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb
@@ -5,7 +5,7 @@ DESCRIPTION += " Support for XCMS is disabled in this version."
 LICENSE = "MIT & MIT-style & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
 
-PR = "r1"
+PR = "r0"
 
 DEPENDS += "libxcb xproto xextproto xtrans libxau kbproto inputproto xf86bigfontproto xproto-native"
 
@@ -16,7 +16,7 @@ SRC_URI += "file://x11_disable_makekeys.patch \
 RPROVIDES_${PN}-dev = "libx11-dev"
 RPROVIDES_${PN}-locale = "libx11-locale"
 
-SRC_URI[md5sum] = "ed7c382cbf8c13425b6a66bcac0ca5d9"
-SRC_URI[sha256sum] = "7fe62180f08ef5f0a0062fb444591e349cae2ab5af6ad834599f5c654e6c840d"
+SRC_URI[md5sum] = "78b4b3bab4acbdf0abcfca30a8c70cc6"
+SRC_URI[sha256sum] = "c382efd7e92bfc3cef39a4b7f1ecf2744ba4414a705e3bc1e697f75502bd4d86"
 
 EXTRA_OECONF += "--with-keysymdefdir=${STAGING_INCDIR}/X11/ --disable-xcms "
-- 
1.7.9.5



