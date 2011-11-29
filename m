Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVWn4-0001ej-ES
	for openembedded-core@openembedded.org; Wed, 30 Nov 2011 00:08:42 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Nov 2011 15:00:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,594,1315206000"; d="scan'208";a="96720785"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2011 15:00:28 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 29 Nov 2011 15:00:05 -0800
Message-Id: <30582835b44a474416dcc8b887bfc2bc32e0e3f8.1322607016.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
Subject: [PATCH 05/26] xdpyinfo: Update to 1.3.0
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
X-List-Received-Date: Tue, 29 Nov 2011 23:08:42 -0000

* Rebase patch to update code

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../xorg-app/xdpyinfo/disable-xkb.patch            |   14 ++++++++------
 .../{xdpyinfo_1.2.0.bb => xdpyinfo_1.3.0.bb}       |    4 ++--
 2 files changed, 10 insertions(+), 8 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xdpyinfo_1.2.0.bb => xdpyinfo_1.3.0.bb} (82%)

diff --git a/meta/recipes-graphics/xorg-app/xdpyinfo/disable-xkb.patch b/meta/recipes-graphics/xorg-app/xdpyinfo/disable-xkb.patch
index b10143d..1e8199c 100644
--- a/meta/recipes-graphics/xorg-app/xdpyinfo/disable-xkb.patch
+++ b/meta/recipes-graphics/xorg-app/xdpyinfo/disable-xkb.patch
@@ -1,20 +1,22 @@
 Upstream-Status: Pending
 
---- xdpyinfo-1.0.1/configure.ac.orig	2006-03-08 16:33:05.000000000 +0100
-+++ xdpyinfo-1.0.1/configure.ac	2006-03-08 16:41:59.000000000 +0100
-@@ -45,11 +45,15 @@
+Index: xdpyinfo-1.3.0/configure.ac
+===================================================================
+--- xdpyinfo-1.3.0.orig/configure.ac	2011-10-21 21:34:21.000000000 -0700
++++ xdpyinfo-1.3.0/configure.ac	2011-11-28 20:06:56.554056935 -0800
+@@ -47,11 +47,15 @@
  	AC_CHECK_HEADERS([X11/extensions/multibuf.h X11/extensions/XShm.h],,,[#include <X11/Xlib.h>])
  	CPPFLAGS="$SAVE_CPPFLAGS"],[echo "not found"])
  
 +AC_ARG_ENABLE(xkb, AC_HELP_STRING([--disable-xkb], [Disable XKB support]),
-+        XKB="$enableval", XKB="yes")
++	XKB="$enableval", XKB="yes")
 +if test "x$XKB" = "xyes" ; then
- PKG_CHECK_MODULES(DPY_XKB, x11, 
+ PKG_CHECK_MODULES(DPY_XKB, x11,
  	[SAVE_CPPFLAGS="$CPPFLAGS"
  	CPPFLAGS="$CPPFLAGS $DPY_XKB_CFLAGS $DPY_X11_CFLAGS"
  	AC_CHECK_HEADERS([X11/extensions/XKB.h X11/XKBlib.h],,,[#include <X11/Xlib.h>])
  	CPPFLAGS="$SAVE_CPPFLAGS"],[echo "not found"])
 +fi
  
- PKG_CHECK_MODULES(DPY_XF86VIDMODE, xxf86vm, 
+ PKG_CHECK_MODULES(DPY_XF86VIDMODE, xxf86vm,
  	[SAVE_CPPFLAGS="$CPPFLAGS"
diff --git a/meta/recipes-graphics/xorg-app/xdpyinfo_1.2.0.bb b/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.0.bb
similarity index 82%
rename from meta/recipes-graphics/xorg-app/xdpyinfo_1.2.0.bb
rename to meta/recipes-graphics/xorg-app/xdpyinfo_1.3.0.bb
index d975d82..a118d0d 100644
--- a/meta/recipes-graphics/xorg-app/xdpyinfo_1.2.0.bb
+++ b/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.0.bb
@@ -15,7 +15,7 @@ PE = "1"
 
 SRC_URI += "file://disable-xkb.patch"
 
-SRC_URI[md5sum] = "c52fda7bbc80e74b7839f29298cb1d77"
-SRC_URI[sha256sum] = "fe5bad498ecfbf21f9a2a18eee5ece9de5d52f68878f250db8f575c9b872b5ce"
+SRC_URI[md5sum] = "1ef08f4c8d0e669c2edd49e4a1bf650d"
+SRC_URI[sha256sum] = "23ee4944a32b5701b4379cb420729eb7a4dde54de2b5b006d4747855efd6d73f"
 
 EXTRA_OECONF = "--disable-xkb"
-- 
1.7.6.4



