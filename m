Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SmUJx-000572-Of
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 20:29:01 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 04 Jul 2012 11:17:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="164055194"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by azsmga001.ch.intel.com with ESMTP; 04 Jul 2012 11:17:58 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jul 2012 21:17:36 +0300
Message-Id: <003bdc5c82a2ff6434097377c4a4db7a185dbfb2.1341425229.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1341425229.git.laurentiu.palcu@intel.com>
References: <cover.1341425229.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1341425229.git.laurentiu.palcu@intel.com>
References: <cover.1341425229.git.laurentiu.palcu@intel.com>
Subject: [PATCH 5/8] libx11-diet: upgrade to 1.5.0
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
X-List-Received-Date: Wed, 04 Jul 2012 18:29:02 -0000

The X18NCMSstubs.diff was modified to please the -Werror=return-type
compiler option. Otherwise, it will throw an error.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../X18NCMSstubs.diff                              |    2 +-
 .../fix-disable-xlocale.diff                       |    0
 .../fix-utf8-wrong-define.patch                    |    0
 .../keysymdef_include.patch                        |    0
 .../x11_disable_makekeys.patch                     |   20 ++++++++++----------
 .../{libx11-diet_1.4.4.bb => libx11-diet_1.5.0.bb} |    4 ++--
 6 files changed, 13 insertions(+), 13 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libx11-diet-1.4.4 => libx11-diet-1.5.0}/X18NCMSstubs.diff (99%)
 rename meta/recipes-graphics/xorg-lib/{libx11-diet-1.4.4 => libx11-diet-1.5.0}/fix-disable-xlocale.diff (100%)
 rename meta/recipes-graphics/xorg-lib/{libx11-diet-1.4.4 => libx11-diet-1.5.0}/fix-utf8-wrong-define.patch (100%)
 rename meta/recipes-graphics/xorg-lib/{libx11-diet-1.4.4 => libx11-diet-1.5.0}/keysymdef_include.patch (100%)
 rename meta/recipes-graphics/xorg-lib/{libx11-diet-1.4.4 => libx11-diet-1.5.0}/x11_disable_makekeys.patch (62%)
 rename meta/recipes-graphics/xorg-lib/{libx11-diet_1.4.4.bb => libx11-diet_1.5.0.bb} (86%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/X18NCMSstubs.diff b/meta/recipes-graphics/xorg-lib/libx11-diet-1.5.0/X18NCMSstubs.diff
similarity index 99%
rename from meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/X18NCMSstubs.diff
rename to meta/recipes-graphics/xorg-lib/libx11-diet-1.5.0/X18NCMSstubs.diff
index be71d44..8cd1870 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/X18NCMSstubs.diff
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet-1.5.0/X18NCMSstubs.diff
@@ -247,7 +247,7 @@ Index: libX11-1.3/src/X18NCMSstubs.c
 +    XRectangle         *max_ink_extents,
 +    XRectangle         *max_logical_extents)
 +{
-+  ;
++  return(XcmsFailure);
 +}
 +
 +int
diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/fix-disable-xlocale.diff b/meta/recipes-graphics/xorg-lib/libx11-diet-1.5.0/fix-disable-xlocale.diff
similarity index 100%
rename from meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/fix-disable-xlocale.diff
rename to meta/recipes-graphics/xorg-lib/libx11-diet-1.5.0/fix-disable-xlocale.diff
diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/fix-utf8-wrong-define.patch b/meta/recipes-graphics/xorg-lib/libx11-diet-1.5.0/fix-utf8-wrong-define.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/fix-utf8-wrong-define.patch
rename to meta/recipes-graphics/xorg-lib/libx11-diet-1.5.0/fix-utf8-wrong-define.patch
diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/keysymdef_include.patch b/meta/recipes-graphics/xorg-lib/libx11-diet-1.5.0/keysymdef_include.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/keysymdef_include.patch
rename to meta/recipes-graphics/xorg-lib/libx11-diet-1.5.0/keysymdef_include.patch
diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/x11_disable_makekeys.patch b/meta/recipes-graphics/xorg-lib/libx11-diet-1.5.0/x11_disable_makekeys.patch
similarity index 62%
rename from meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/x11_disable_makekeys.patch
rename to meta/recipes-graphics/xorg-lib/libx11-diet-1.5.0/x11_disable_makekeys.patch
index ab48193..69f9e6c 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/x11_disable_makekeys.patch
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet-1.5.0/x11_disable_makekeys.patch
@@ -1,20 +1,20 @@
-Upstream-Status: Inappropriate [configuration]
+Upstream-Status: Pending
 
-Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
----
- src/util/Makefile.am |   21 -----------------
- 1 file changed, 21 deletions(-)
-
---- a/src/util/Makefile.am
-+++ b/src/util/Makefile.am
-@@ -1,24 +1,3 @@
- 
+Index: libX11-1.5.0/src/util/Makefile.am
+===================================================================
+--- libX11-1.5.0.orig/src/util/Makefile.am
++++ libX11-1.5.0/src/util/Makefile.am
+@@ -1,27 +1,2 @@
+-
 -noinst_PROGRAMS=makekeys
 -
 -makekeys_CFLAGS = \
 -	$(X11_CFLAGS) \
 -	$(CWARNFLAGS)
 -
+-makekeys_CPPFLAGS = \
+-	-I$(top_srcdir)/include
+-
 -CC = @CC_FOR_BUILD@
 -CPPFLAGS = @CPPFLAGS_FOR_BUILD@
 -CFLAGS = @CFLAGS_FOR_BUILD@
diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet_1.4.4.bb b/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
similarity index 86%
rename from meta/recipes-graphics/xorg-lib/libx11-diet_1.4.4.bb
rename to meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
index 0a159d4..4ae8b29 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-diet_1.4.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
@@ -17,8 +17,8 @@ SRC_URI += "file://x11_disable_makekeys.patch \
 RPROVIDES_${PN}-dev = "libx11-dev"
 RPROVIDES_${PN}-locale = "libx11-locale"
 
-SRC_URI[md5sum] = "ed7c382cbf8c13425b6a66bcac0ca5d9"
-SRC_URI[sha256sum] = "7fe62180f08ef5f0a0062fb444591e349cae2ab5af6ad834599f5c654e6c840d"
+SRC_URI[md5sum] = "78b4b3bab4acbdf0abcfca30a8c70cc6"
+SRC_URI[sha256sum] = "c382efd7e92bfc3cef39a4b7f1ecf2744ba4414a705e3bc1e697f75502bd4d86"
 
 DEPENDS += "bigreqsproto xproto xextproto xtrans libxau xcmiscproto \
             libxdmcp xf86bigfontproto kbproto inputproto xproto-native"
-- 
1.7.9.5



