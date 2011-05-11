Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QK3mf-0003ef-Da
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 09:24:38 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 11 May 2011 00:21:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,350,1301900400"; 
   d="scan'208";a="171015"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.187])
	by fmsmga002.fm.intel.com with ESMTP; 11 May 2011 00:21:43 -0700
Message-Id: <ef3a505ca4ba71f08f245a24af4cefb41098a521.1305098201.git.ke.yu@intel.com>
In-Reply-To: <cover.1305098201.git.ke.yu@intel.com>
References: <cover.1305098201.git.ke.yu@intel.com>
Old-Date: Mon, 9 May 2011 15:13:14 +0800
Date: Wed, 11 May 2011 15:27:52 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Yu Ke <ke.yu@intel.com>
Subject: [PATCH 4/5] xserver-xf86-dri-lite_git: upgrade to 1.10.2 RC1 snapshot
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
X-List-Received-Date: Wed, 11 May 2011 07:24:38 -0000

From: Yu Ke <ke.yu@intel.com>

- the following patches are no longer used, so remove them
  doublefix.patch
  drmfix.patch
  fix_macros.patch
  libdri-xinerama-symbol.patch
  xorg-server-disable-dri_sarea.patch
  xorg-server-enable-dri2.patch
  xserver-1.5.0-bg-none-root.patch
  xserver-DRI2Swapbuffer.patch
  xserver-boottime.patch
  xserver-no-root-2.patch

- update the patch upstream status

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 .../cache-xkbcomp-output-for-fast-start-up.patch   |    2 +
 .../xserver-xf86-dri-lite/crosscompile.patch       |    2 +
 .../xserver-xf86-dri-lite/doublefix.patch          |   13 --
 .../xserver-xf86-dri-lite/drmfix.patch             |   13 --
 .../xserver-xf86-dri-lite/fix_macros.patch         |   21 ---
 .../xserver-xf86-dri-lite/fix_macros1.patch        |    2 +
 .../fix_open_max_preprocessor_error.patch          |    2 +
 .../libdri-xinerama-symbol.patch                   |   50 ------
 .../xorg-server-disable-dri_sarea.patch            |   12 --
 .../xorg-server-enable-dri2.patch                  |   23 ---
 .../xserver-1.5.0-bg-none-root.patch               |  156 -----------------
 .../xserver-DRI2Swapbuffer.patch                   |  179 --------------------
 .../xserver-xf86-dri-lite/xserver-boottime.patch   |   38 ----
 .../xserver-xf86-dri-lite/xserver-no-root-2.patch  |  105 ------------
 .../xorg-xserver/xserver-xf86-dri-lite_git.bb      |   21 +--
 15 files changed, 15 insertions(+), 624 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/doublefix.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/drmfix.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/fix_macros.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/libdri-xinerama-symbol.patch
 delete mode 100755 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/xorg-server-disable-dri_sarea.patch
 delete mode 100755 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/xorg-server-enable-dri2.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/xserver-1.5.0-bg-none-root.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/xserver-DRI2Swapbuffer.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/xserver-boottime.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/xserver-no-root-2.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/cache-xkbcomp-output-for-fast-start-up.patch b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/cache-xkbcomp-output-for-fast-start-up.patch
index b121bba..6b1b40f 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/cache-xkbcomp-output-for-fast-start-up.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/cache-xkbcomp-output-for-fast-start-up.patch
@@ -7,6 +7,8 @@ Organization: Intel
 xkbcomp outputs will be cached in files with hashed keymap as
 names. This saves boot time for around 1s on commodity netbooks.
 
+Upstream-Status: Pending
+
 Signed-off-by: Yan Li <yan.i.li@intel.com>
 ---
  configure.ac        |    6 +-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/crosscompile.patch b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/crosscompile.patch
index 8b82de2..2f98bb8 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/crosscompile.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/crosscompile.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 diff --git a/configure.ac b/configure.ac
 index b3b752c..600500b 100644
 --- a/configure.ac
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/doublefix.patch b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/doublefix.patch
deleted file mode 100644
index 092a712..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/doublefix.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: xorg-server-1.6.0/hw/xfree86/common/Makefile.am
-===================================================================
---- xorg-server-1.6.0.orig/hw/xfree86/common/Makefile.am	2010-02-01 14:04:53.247789918 +0000
-+++ xorg-server-1.6.0/hw/xfree86/common/Makefile.am	2010-02-01 14:05:27.787817002 +0000
-@@ -46,7 +46,7 @@
- sdk_HEADERS = compiler.h fourcc.h xf86.h xf86Module.h xf86Opt.h \
-               xf86PciInfo.h xf86Priv.h xf86Privstr.h xf86Resources.h \
-               xf86cmap.h xf86fbman.h xf86str.h xf86RAC.h xf86Xinput.h xisb.h \
--              $(XVSDKINCS) xorgVersion.h \
-+              xorgVersion.h \
-               xf86sbusBus.h xf86xv.h xf86xvmc.h xf86xvpriv.h
- 
- DISTCLEANFILES = xf86Build.h
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/drmfix.patch b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/drmfix.patch
deleted file mode 100644
index a62a767..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/drmfix.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: xorg-server-1.4/hw/xfree86/os-support/linux/Makefile.am
-===================================================================
---- xorg-server-1.4.orig/hw/xfree86/os-support/linux/Makefile.am	2007-08-23 21:04:53.000000000 +0200
-+++ xorg-server-1.4/hw/xfree86/os-support/linux/Makefile.am	2008-03-13 18:27:23.000000000 +0100
-@@ -41,7 +41,7 @@
- 
- AM_CFLAGS = -DUSESTDRES -DHAVE_SYSV_IPC $(DIX_CFLAGS) $(XORG_CFLAGS) $(PLATFORM_DEFINES)
- 
--INCLUDES = $(XORG_INCS) $(PLATFORM_INCLUDES) -I/usr/include/drm # FIXME this last part is crack
-+INCLUDES = $(XORG_INCS) $(PLATFORM_INCLUDES) $(LIBDRM_CFLAGS)
- 
- # FIXME: These need to be added to the build
- LNX_EXTRA_SRCS = \
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/fix_macros.patch b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/fix_macros.patch
deleted file mode 100644
index eed491b..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/fix_macros.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-We need to insert the sysroot path into compiler commandlines for this
-kind of variable use, otherwise we're looking into /usr/include/.
-
-RP - 26/11/09
-
-Index: git/xorg-server.m4
-===================================================================
---- git.orig/xorg-server.m4	2009-11-10 12:04:34.000000000 +0000
-+++ git/xorg-server.m4	2009-11-27 00:05:02.000000000 +0000
-@@ -28,9 +28,10 @@
- # Checks for the $1 define in xorg-server.h (from the sdk).  If it
- # is defined, then add $1 to $REQUIRED_MODULES.
- 
-+m4_pattern_allow([^PKG_CONFIG_SYSROOT_DIR$])
- AC_DEFUN([XORG_DRIVER_CHECK_EXT],[
- 	SAVE_CFLAGS="$CFLAGS"
--	CFLAGS="$CFLAGS -I`pkg-config --variable=sdkdir xorg-server`"
-+	CFLAGS="$CFLAGS -I$PKG_CONFIG_SYSROOT_DIR`pkg-config --variable=sdkdir xorg-server`"
- 	AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
- #include "xorg-server.h"
- #if !defined $1
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/fix_macros1.patch b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/fix_macros1.patch
index 94852f0..b2c8d58 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/fix_macros1.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/fix_macros1.patch
@@ -3,6 +3,8 @@ kind of variable use, otherwise we're looking into /usr/include/.
 
 RP - 26/11/09
 
+Upstream-Status: Pending
+
 Index: git/xorg-server.m4
 ===================================================================
 --- git.orig/xorg-server.m4	2010-02-05 10:00:55.000000000 +0000
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/fix_open_max_preprocessor_error.patch b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/fix_open_max_preprocessor_error.patch
index 565832e..9c33072 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/fix_open_max_preprocessor_error.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/fix_open_max_preprocessor_error.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [embedded specific]
+
 Index: git/os/osdep.h
 ===================================================================
 --- git.orig/os/osdep.h	2008-10-07 18:38:21.000000000 +0100
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/libdri-xinerama-symbol.patch b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/libdri-xinerama-symbol.patch
deleted file mode 100644
index db29da9..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/libdri-xinerama-symbol.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-Index: xorg-server-1.5.0/hw/xfree86/dri/dri.c
-===================================================================
---- xorg-server-1.5.0.orig/hw/xfree86/dri/dri.c	2008-09-24 17:43:04.000000000 +0100
-+++ xorg-server-1.5.0/hw/xfree86/dri/dri.c	2008-09-24 17:46:38.000000000 +0100
-@@ -73,10 +73,6 @@
- 
- #define PCI_BUS_NO_DOMAIN(bus) ((bus) & 0xffu)
- 
--#if !defined(PANORAMIX)
--extern Bool noPanoramiXExtension;
--#endif
--
- static int DRIEntPrivIndex = -1;
- static DevPrivateKey DRIScreenPrivKey = &DRIScreenPrivKey;
- static DevPrivateKey DRIWindowPrivKey = &DRIWindowPrivKey;
-@@ -307,7 +303,6 @@
-     drm_context_t *       reserved;
-     int                 reserved_count;
-     int                 i;
--    Bool                xineramaInCore = FALSE;
-     DRIEntPrivPtr       pDRIEntPriv;
-     ScrnInfoPtr         pScrn = xf86Screens[pScreen->myNum];
-     DRIContextFlags	flags    = 0;
-@@ -320,20 +315,13 @@
- 	return FALSE;
-     }
- 
--    /*
--     * If Xinerama is on, don't allow DRI to initialise.  It won't be usable
--     * anyway.
--     */
--    if (xf86LoaderCheckSymbol("noPanoramiXExtension"))
--	xineramaInCore = TRUE;
--
--    if (xineramaInCore) {
--	if (!noPanoramiXExtension) {
--	    DRIDrvMsg(pScreen->myNum, X_WARNING,
--		"Direct rendering is not supported when Xinerama is enabled\n");
--	    return FALSE;
--	}
-+#if defined(PANORAMIX)
-+    if (!noPanoramiXExtension) {
-+        DRIDrvMsg(pScreen->myNum, X_WARNING,
-+            "Direct rendering is not supported when Xinerama is enabled\n");
-+        return FALSE;
-     }
-+#endif
- 
-     if (!DRIOpenDRMMaster(pScrn, pDRIInfo->SAREASize,
- 			  pDRIInfo->busIdString,
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/xorg-server-disable-dri_sarea.patch b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/xorg-server-disable-dri_sarea.patch
deleted file mode 100755
index 3d2fa16..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/xorg-server-disable-dri_sarea.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -urN xorg-server-1.5.99.1/hw/xfree86/dri2/dri2.c xorg-server-1.5.99.1.new/hw/xfree86/dri2/dri2.c
---- xorg-server-1.5.99.1/hw/xfree86/dri2/dri2.c	2008-09-01 03:26:37.000000000 +0800
-+++ xorg-server-1.5.99.1.new/hw/xfree86/dri2/dri2.c	2008-09-18 00:28:16.000000000 +0800
-@@ -39,7 +39,7 @@
- #include "scrnintstr.h"
- #include "windowstr.h"
- #include "dri2.h"
--#include <GL/internal/dri_sarea.h>
-+//#include <GL/internal/dri_sarea.h>
- 
- #include "xf86.h"
- 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/xorg-server-enable-dri2.patch b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/xorg-server-enable-dri2.patch
deleted file mode 100755
index 7ff3658..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/xorg-server-enable-dri2.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-commit 67b9b3a77a8b86eef03af36a0f4be3a07411efee
-Author: Eric Anholt <eric@anholt.net>
-Date:   Thu Sep 11 16:18:17 2008 -0700
-
-    Enable DRI2 build.
-
-diff --git a/hw/xfree86/Makefile.am b/hw/xfree86/Makefile.am
-index eff2c31..98d7ec8 100644
---- a/hw/xfree86/Makefile.am
-+++ b/hw/xfree86/Makefile.am
-@@ -4,9 +4,9 @@ if DRI
- DRI_SUBDIR = dri
- endif
- 
--#if DRI2
--#DRI2_SUBDIR = dri2
--#endif
-+if DRI2
-+DRI2_SUBDIR = dri2
-+endif
- 
- if XF86UTILS
- XF86UTILS_SUBDIR = utils
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/xserver-1.5.0-bg-none-root.patch b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/xserver-1.5.0-bg-none-root.patch
deleted file mode 100644
index ef53689..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/xserver-1.5.0-bg-none-root.patch
+++ /dev/null
@@ -1,156 +0,0 @@
-From a3e15680da24cb8259f6a83dee0c930dab024290 Mon Sep 17 00:00:00 2001
-From: Kristian <krh@redhat.com>
-Date: Fri, 15 Aug 2008 15:15:14 +1000
-Subject: [PATCH] Add nr for background=none root
-
----
- dix/globals.c                |    1 +
- dix/window.c                 |   22 ++++++++++++----------
- hw/xfree86/common/xf86Init.c |   11 +++++++++++
- hw/xfree86/common/xf86str.h  |    5 ++++-
- include/opaque.h             |    1 +
- os/utils.c                   |    3 +++
- 6 files changed, 32 insertions(+), 11 deletions(-)
-
-diff --git a/dix/globals.c b/dix/globals.c
-index 973dc43..dbd76bb 100644
---- a/dix/globals.c
-+++ b/dix/globals.c
-@@ -141,6 +141,7 @@ FontPtr defaultFont;   /* not declared in dix.h to avoid including font.h in
- CursorPtr rootCursor;
- Bool party_like_its_1989 = FALSE;
- Bool whiteRoot = FALSE;
-+Bool bgNoneRoot = FALSE;
- 
- int cursorScreenDevPriv[MAXSCREENS];
- 
-diff --git a/dix/window.c b/dix/window.c
-index c31fa87..8bb178d 100644
---- a/dix/window.c
-+++ b/dix/window.c
-@@ -482,23 +482,24 @@ InitRootWindow(WindowPtr pWin)
-     pWin->cursorIsNone = FALSE;
-     pWin->optional->cursor = rootCursor;
-     rootCursor->refcnt++;
--
-+    pWin->backingStore = defaultBackingStore;
-+    pWin->forcedBS = (defaultBackingStore != NotUseful);
- 
-     if (party_like_its_1989) {
-         MakeRootTile(pWin);
-         backFlag |= CWBackPixmap;
-+        pScreen->ChangeWindowAttributes(pWin, backFlag);
-+    } else if (bgNoneRoot) {
-+	/* nothing, handled in xf86CreateRootWindow */
-     } else {
- 	if (whiteRoot)
-             pWin->background.pixel = pScreen->whitePixel;
-         else
-             pWin->background.pixel = pScreen->blackPixel;
-         backFlag |= CWBackPixel;
--    } 
- 
--    pWin->backingStore = defaultBackingStore;
--    pWin->forcedBS = (defaultBackingStore != NotUseful);
--    /* We SHOULD check for an error value here XXX */
--    (*pScreen->ChangeWindowAttributes)(pWin, backFlag);
-+        pScreen->ChangeWindowAttributes(pWin, backFlag);
-+    }
- 
-     MapWindow(pWin, serverClient);
- }
-diff --git a/hw/xfree86/common/xf86Init.c b/hw/xfree86/common/xf86Init.c
-index 236c00b..083a6ac 100644
---- a/hw/xfree86/common/xf86Init.c
-+++ b/hw/xfree86/common/xf86Init.c
-@@ -79,6 +79,7 @@
- #ifdef RENDER
- #include "picturestr.h"
- #endif
-+#include "xace.h"
- 
- #include "globals.h"
- 
-@@ -328,6 +329,7 @@ xf86CreateRootWindow(WindowPtr pWin)
-   int ret = TRUE;
-   int err = Success;
-   ScreenPtr pScreen = pWin->drawable.pScreen;
-+  ScrnInfoPtr pScrn = xf86Screens[pScreen->myNum];
-   RootWinPropPtr pProp;
-   CreateWindowProcPtr CreateWindow = (CreateWindowProcPtr)
-       dixLookupPrivate(&pScreen->devPrivates, xf86CreateRootWindowKey);
-@@ -381,6 +383,15 @@ xf86CreateRootWindow(WindowPtr pWin)
-     }
-   }
- 
-+  if (bgNoneRoot && pScrn->canDoBGNoneRoot || 1) {
-+      pWin->backgroundState = XaceBackgroundNoneState(pWin);
-+      pWin->background.pixel = pScreen->whitePixel;
-+      pScreen->ChangeWindowAttributes(pWin, CWBackPixmap | CWBorderPixel | CWCursor | CWBackingStore);
-+  } else {
-+      pWin->background.pixel = pScreen->blackPixel;
-+      pScreen->ChangeWindowAttributes(pWin, CWBackPixel | CWBorderPixel | CWCursor | CWBackingStore);
-+  }
-+
- #ifdef DEBUG
-   ErrorF("xf86CreateRootWindow() returns %d\n", ret);
- #endif
-diff --git a/hw/xfree86/common/xf86str.h b/hw/xfree86/common/xf86str.h
-index 904c369..8c38f69 100644
---- a/hw/xfree86/common/xf86str.h
-+++ b/hw/xfree86/common/xf86str.h
-@@ -531,7 +531,7 @@ typedef struct _confdrirec {
- } confDRIRec, *confDRIPtr;
- 
- /* These values should be adjusted when new fields are added to ScrnInfoRec */
--#define NUM_RESERVED_INTS		16
-+#define NUM_RESERVED_INTS		15
- #define NUM_RESERVED_POINTERS		15
- #define NUM_RESERVED_FUNCS		11
- 
-@@ -959,6 +959,9 @@ typedef struct _ScrnInfoRec {
-     ClockRangesPtr	clockRanges;
-     int			adjustFlags;
- 
-+    /* -nr support */
-+    int			canDoBGNoneRoot;
-+
-     /*
-      * These can be used when the minor ABI version is incremented.
-      * The NUM_* parameters must be reduced appropriately to keep the
-diff --git a/include/opaque.h b/include/opaque.h
-index 07a0715..be1577b 100644
---- a/include/opaque.h
-+++ b/include/opaque.h
-@@ -71,6 +71,7 @@ extern Bool defeatAccessControl;
- extern long maxBigRequestSize;
- extern Bool party_like_its_1989;
- extern Bool whiteRoot;
-+extern Bool bgNoneRoot;
- 
- extern Bool CoreDump;
- 
-diff --git a/os/utils.c b/os/utils.c
-index b100949..c41b45b 100644
---- a/os/utils.c
-+++ b/os/utils.c
-@@ -515,6 +515,7 @@ void UseMsg(void)
- #endif
-     ErrorF("-nolisten string       don't listen on protocol\n");
-     ErrorF("-noreset               don't reset after last client exists\n");
-+    ErrorF("-nr                    create root window with no background\n");
-     ErrorF("-reset                 reset after last client exists\n");
-     ErrorF("-p #                   screen-saver pattern duration (minutes)\n");
-     ErrorF("-pn                    accept failure to listen on all ports\n");
-@@ -859,6 +860,8 @@ ProcessCommandLine(int argc, char *argv[])
- 	    defaultBackingStore = WhenMapped;
-         else if ( strcmp( argv[i], "-wr") == 0)
-             whiteRoot = TRUE;
-+        else if ( strcmp( argv[i], "-nr") == 0)
-+            bgNoneRoot = TRUE;
-         else if ( strcmp( argv[i], "-maxbigreqsize") == 0) {
-              if(++i < argc) {
-                  long reqSizeArg = atol(argv[i]);
--- 
-1.5.3.4
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/xserver-DRI2Swapbuffer.patch b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/xserver-DRI2Swapbuffer.patch
deleted file mode 100644
index 2754170..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/xserver-DRI2Swapbuffer.patch
+++ /dev/null
@@ -1,179 +0,0 @@
-diff --git a/glx/glxdri2.c b/glx/glxdri2.c
-index 146ea82..3b5338b 100644
---- a/glx/glxdri2.c
-+++ b/glx/glxdri2.c
-@@ -70,6 +70,7 @@ struct __GLXDRIscreen {
- 
-     const __DRIcoreExtension *core;
-     const __DRIdri2Extension *dri2;
-+    const __DRI2flushExtension *flush;	
-     const __DRIcopySubBufferExtension *copySubBuffer;
-     const __DRIswapControlExtension *swapControl;
-     const __DRItexBufferExtension *texBuffer;
-@@ -135,10 +136,14 @@ __glXDRIdrawableCopySubBuffer(__GLXdrawable *drawable,
- static GLboolean
- __glXDRIdrawableSwapBuffers(__GLXdrawable *drawable)
- {
--    __GLXDRIdrawable *private = (__GLXDRIdrawable *) drawable;
-+    __GLXDRIdrawable *priv = (__GLXDRIdrawable *) drawable;
-+    __GLXDRIscreen *screen = priv->screen;
-+
-+    if (!DRI2SwapBuffers(drawable->pDraw))
-+		return FALSE;
- 
--    __glXDRIdrawableCopySubBuffer(drawable, 0, 0,
--				  private->width, private->height);
-+    if (screen->flush->flushInvalidate)
-+	(*screen->flush->flushInvalidate)(priv->driDrawable);
- 
-     return TRUE;
- }
-diff --git a/hw/xfree86/dri2/dri2.c b/hw/xfree86/dri2/dri2.c
-index 580383d..23e6467 100644
---- a/hw/xfree86/dri2/dri2.c
-+++ b/hw/xfree86/dri2/dri2.c
-@@ -70,6 +70,7 @@ typedef struct _DRI2Screen {
-     DRI2CreateBufferProcPtr	 CreateBuffer;
-     DRI2DestroyBufferProcPtr	 DestroyBuffer;
-     DRI2CopyRegionProcPtr	 CopyRegion;
-+    DRI2SwapBuffersProcPtr	 SwapBuffers;	
- 
-     HandleExposuresProcPtr       HandleExposures;
- } DRI2ScreenRec, *DRI2ScreenPtr;
-@@ -422,6 +423,49 @@ DRI2CopyRegion(DrawablePtr pDraw, RegionPtr pRegion,
-     return Success;
- }
- 
-+Bool
-+DRI2SwapBuffers(DrawablePtr pDraw)
-+{
-+    DRI2ScreenPtr   ds = DRI2GetScreen(pDraw->pScreen);
-+    DRI2DrawablePtr pPriv;
-+    DRI2BufferPtr   pDestBuffer, pSrcBuffer;
-+    int		    i;
-+
-+    pPriv = DRI2GetDrawable(pDraw);
-+    if (pPriv == NULL)
-+	return FALSE;
-+
-+    pDestBuffer = NULL;
-+    pSrcBuffer = NULL;
-+    for (i = 0; i < pPriv->bufferCount; i++)
-+    {
-+	if (pPriv->buffers[i]->attachment == DRI2BufferFrontLeft)
-+	    pDestBuffer = (DRI2BufferPtr) pPriv->buffers[i];
-+	if (pPriv->buffers[i]->attachment == DRI2BufferBackLeft)
-+	    pSrcBuffer = (DRI2BufferPtr) pPriv->buffers[i];
-+    }
-+    if (pSrcBuffer == NULL || pDestBuffer == NULL)
-+	return FALSE;
-+
-+    if (ds->SwapBuffers) {
-+	if ((*ds->SwapBuffers)(pDraw, pDestBuffer, pSrcBuffer))
-+	    return TRUE;
-+    }
-+
-+    BoxRec box;
-+    RegionRec region;
-+
-+    box.x1 = 0;
-+    box.y1 = 0;
-+    box.x2 = pDraw->width;
-+    box.y2 = pDraw->height;
-+    REGION_INIT(drawable->pDraw->pScreen, &region, &box, 0);
-+    if (DRI2CopyRegion(pDraw, &region, DRI2BufferFrontLeft, DRI2BufferBackLeft) != Success)
-+	return FALSE;
-+
-+    return TRUE;
-+}
-+
- void
- DRI2DestroyDrawable(DrawablePtr pDraw)
- {
-@@ -538,6 +582,9 @@ DRI2ScreenInit(ScreenPtr pScreen, DRI2InfoPtr info)
-     }
-     ds->CopyRegion     = info->CopyRegion;
- 
-+    if (info->version >= 3)
-+	ds->SwapBuffers    = info->SwapBuffers;
-+
-     dixSetPrivate(&pScreen->devPrivates, dri2ScreenPrivateKey, ds);
- 
-     xf86DrvMsg(pScreen->myNum, X_INFO, "[DRI2] Setup complete\n");
-diff --git a/hw/xfree86/dri2/dri2.h b/hw/xfree86/dri2/dri2.h
-index f369267..e2784dd 100644
---- a/hw/xfree86/dri2/dri2.h
-+++ b/hw/xfree86/dri2/dri2.h
-@@ -67,6 +67,10 @@ typedef void		(*DRI2CopyRegionProcPtr)(DrawablePtr pDraw,
- 						 DRI2BufferPtr pDestBuffer,
- 						 DRI2BufferPtr pSrcBuffer);
- 
-+typedef Bool		(*DRI2SwapBuffersProcPtr)(DrawablePtr pDraw,
-+						  DRI2BufferPtr pFrontBuffer,
-+						  DRI2BufferPtr pBackBuffer);
-+
- typedef void		(*DRI2WaitProcPtr)(WindowPtr pWin,
- 					   unsigned int sequence);
- 
-@@ -90,6 +94,7 @@ typedef struct {
-     DRI2CreateBuffersProcPtr	CreateBuffers;
-     DRI2DestroyBuffersProcPtr	DestroyBuffers;
-     DRI2CopyRegionProcPtr	CopyRegion;
-+    DRI2SwapBuffersProcPtr	SwapBuffers;	
-     DRI2WaitProcPtr		Wait;
- 
-     /**
-@@ -153,4 +158,6 @@ extern _X_EXPORT DRI2Buffer2Ptr *DRI2GetBuffersWithFormat(DrawablePtr pDraw,
- 	int *width, int *height, unsigned int *attachments, int count,
- 	int *out_count);
- 
-+extern _X_EXPORT Bool DRI2SwapBuffers(DrawablePtr pDraw);
-+
- #endif
-diff --git a/hw/xfree86/dri2/dri2ext.c b/hw/xfree86/dri2/dri2ext.c
-index 3c06174..67b419b 100644
---- a/hw/xfree86/dri2/dri2ext.c
-+++ b/hw/xfree86/dri2/dri2ext.c
-@@ -81,7 +81,7 @@ ProcDRI2QueryVersion(ClientPtr client)
-     rep.length = 0;
-     rep.sequenceNumber = client->sequence;
-     rep.majorVersion = 1;
--    rep.minorVersion = 1;
-+    rep.minorVersion = 2;
- 
-     if (client->swapped) {
-     	swaps(&rep.sequenceNumber, n);
-@@ -323,6 +323,24 @@ ProcDRI2CopyRegion(ClientPtr client)
- }
- 
- static int
-+ProcDRI2SwapBuffers(ClientPtr client)
-+{
-+    REQUEST(xDRI2SwapBuffersReq);
-+    DrawablePtr pDrawable;
-+    int status;
-+
-+    REQUEST_SIZE_MATCH(xDRI2SwapBuffersReq);
-+
-+    if (!validDrawable(client, stuff->drawable, &pDrawable, &status))
-+	return status;
-+
-+    if (!DRI2SwapBuffers(pDrawable))
-+	return BadAlloc;
-+
-+    return client->noClientException;
-+}
-+
-+static int
- ProcDRI2Dispatch (ClientPtr client)
- {
-     REQUEST(xReq);
-@@ -350,6 +368,8 @@ ProcDRI2Dispatch (ClientPtr client)
- 	return ProcDRI2CopyRegion(client);
-     case X_DRI2GetBuffersWithFormat:
- 	return ProcDRI2GetBuffersWithFormat(client);
-+    case X_DRI2SwapBuffers:
-+	return ProcDRI2SwapBuffers(client);	
-     default:
- 	return BadRequest;
-     }
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/xserver-boottime.patch b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/xserver-boottime.patch
deleted file mode 100644
index efc85a4..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/xserver-boottime.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-diff --git a/os/log.c b/os/log.c
-index 0860847..2c46f1a 100644
---- a/os/log.c
-+++ b/os/log.c
-@@ -255,6 +255,33 @@ LogVWrite(int verb, const char *f, va_list args)
-     static char tmpBuffer[1024];
-     int len = 0;
- 
-+    struct timeval time;
-+    time_t tv_sec;
-+    suseconds_t tv_usec;
-+    static Bool first = TRUE;
-+    static time_t start_tv_sec;
-+    static suseconds_t start_usec;
-+    int diff_sec, diff_usec;
-+
-+    gettimeofday(&time, NULL);
-+    tv_sec = time.tv_sec;
-+    tv_usec = time.tv_usec;
-+    if (first == TRUE) {
-+        start_tv_sec = tv_sec;
-+        start_usec = tv_usec;
-+        first = FALSE;
-+    }
-+    diff_sec = (int)difftime(tv_sec, start_tv_sec);
-+    diff_usec = (tv_usec - start_usec);
-+    if (diff_usec < 0) {
-+        diff_sec--;
-+        diff_usec += 1000000;
-+    }
-+    sprintf(tmpBuffer, "[%d sec: %06d usec]", diff_sec , diff_usec);
-+    len = strlen(tmpBuffer);
-+    if (logFile)
-+          fwrite(tmpBuffer, len, 1, logFile);
-+
-     /*
-      * Since a va_list can only be processed once, write the string to a
-      * buffer, and then write the buffer out to the appropriate output
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/xserver-no-root-2.patch b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/xserver-no-root-2.patch
deleted file mode 100644
index afc94dc..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/xserver-no-root-2.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-diff --git a/hw/xfree86/os-support/linux/lnx_init.c b/hw/xfree86/os-support/linux/lnx_init.c
-index 7f40857..cf58c01 100644
---- a/hw/xfree86/os-support/linux/lnx_init.c
-+++ b/hw/xfree86/os-support/linux/lnx_init.c
-@@ -49,6 +49,7 @@ static Bool KeepTty = FALSE;
- static int VTnum = -1;
- static Bool VTSwitch = TRUE;
- static Bool ShareVTs = FALSE;
-+Bool NoHwAccess = FALSE;
- static int activeVT = -1;
- 
- static int vtPermSave[4];
-@@ -80,9 +81,11 @@ saveVtPerms(void)
- static void
- restoreVtPerms(void)
- {
--    /* Set the terminal permissions back to before we started. */
--    chown("/dev/tty0", vtPermSave[0], vtPermSave[1]);
--    chown(vtname, vtPermSave[2], vtPermSave[3]);
-+    if (geteuid() == 0) {
-+	 /* Set the terminal permissions back to before we started. */
-+	 (void)chown("/dev/tty0", vtPermSave[0], vtPermSave[1]);
-+	 (void)chown(vtname, vtPermSave[2], vtPermSave[3]);
-+    }
- }
- 
- static void *console_handler;
-@@ -210,20 +213,22 @@ xf86OpenConsole(void)
- 	        xf86Msg(X_WARNING,
- 		        "xf86OpenConsole: Could not save ownership of VT\n");
- 
--	    /* change ownership of the vt */
--	    if (chown(vtname, getuid(), getgid()) < 0)
--	        xf86Msg(X_WARNING,"xf86OpenConsole: chown %s failed: %s\n",
--		        vtname, strerror(errno));
--
--	    /*
--	     * the current VT device we're running on is not "console", we want
--	     * to grab all consoles too
--	     *
--	     * Why is this needed??
--	     */
--	    if (chown("/dev/tty0", getuid(), getgid()) < 0)
--	        xf86Msg(X_WARNING,"xf86OpenConsole: chown /dev/tty0 failed: %s\n",
--                    strerror(errno));
-+	    if (geteuid() == 0) {
-+		    /* change ownership of the vt */
-+		    if (chown(vtname, getuid(), getgid()) < 0)
-+			    xf86Msg(X_WARNING,"xf86OpenConsole: chown %s failed: %s\n",
-+				    vtname, strerror(errno));
-+
-+		    /*
-+		     * the current VT device we're running on is not
-+		     * "console", we want to grab all consoles too
-+		     *
-+		     * Why is this needed??
-+		     */
-+		    if (chown("/dev/tty0", getuid(), getgid()) < 0)
-+			    xf86Msg(X_WARNING,"xf86OpenConsole: chown /dev/tty0 failed: %s\n",
-+				    strerror(errno));
-+	    }
-         }
- 
- 	/*
-@@ -433,6 +438,11 @@ xf86ProcessArgument(int argc, char *argv[], int i)
-                 ShareVTs = TRUE;
-                 return(1);
-         }
-+	if (!strcmp(argv[i], "-nohwaccess"))
-+	{
-+		NoHwAccess = TRUE;
-+		return(1);
-+	}
- 	if ((argv[i][0] == 'v') && (argv[i][1] == 't'))
- 	{
- 		if (sscanf(argv[i], "vt%2d", &VTnum) == 0)
-@@ -454,5 +464,6 @@ xf86UseMsg()
- 	ErrorF("don't detach controlling tty (for debugging only)\n");
-         ErrorF("-novtswitch            don't immediately switch to new VT\n");
-         ErrorF("-sharevts              share VTs with another X server\n");
-+	ErrorF("-nohwaccess            don't access hardware ports directly\n");
- 	return;
- }
-diff --git a/hw/xfree86/os-support/linux/lnx_video.c b/hw/xfree86/os-support/linux/lnx_video.c
-index 688106a..34a845b 100644
---- a/hw/xfree86/os-support/linux/lnx_video.c
-+++ b/hw/xfree86/os-support/linux/lnx_video.c
-@@ -51,6 +51,7 @@
- #define MAP_FAILED ((void *)-1)
- #endif
- 
-+extern Bool NoHwAccess;
- static Bool ExtendedEnabled = FALSE;
- 
- #ifdef __ia64__
-@@ -509,6 +510,9 @@ xf86EnableIO(void)
- 	int fd;
- 	unsigned int ioBase_phys;
- #endif
-+	/* Fake it... */
-+	if (NoHwAccess)
-+		return TRUE;
- 
- 	if (ExtendedEnabled)
- 		return TRUE;
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_git.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_git.bb
index 850db49..adefcdb 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_git.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_git.bb
@@ -1,9 +1,11 @@
 require xserver-xf86-dri-lite.inc
 
-SRCREV = "251d0d8090322b2c9dc0c8b7bef001f338d19433"
+LIC_FILES_CHKSUM = "file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"
+
+SRCREV = "6689e8add183835274a70ee013e5d3bc8023681f"
 PE = "1"
 PR = "r0"
-PV = "1.7.99+git${SRCPV}"
+PV = "1.10+git${SRCPV}"
 
 PROTO_DEPS += "xf86driproto dri2proto"
 
@@ -11,21 +13,12 @@ DEPENDS += "font-util"
 
 RDEPENDS_${PN} += "xkeyboard-config"
 
-#           file://cache-xkbcomp-output-for-fast-start-up.patch;patch=1
-#           file://xserver-1.5.0-bg-none-root.patch;patch=1
-#           file://xserver-no-root-2.patch;patch=1
-#           file://xserver-boottime.patch;patch=1
-#           file://xserver-DRI2Swapbuffer.patch;patch=1
-
-
 SRC_URI = "git://anongit.freedesktop.org/git/xorg/xserver;protocol=git;branch=master \
-           file://nodolt.patch;patch=1 \
-           file://crosscompile.patch;patch=1 \
-           file://fix_macros1.patch;patch=1"
-#           file://libdri-xinerama-symbol.patch;patch=1
+           file://crosscompile.patch; \
+           file://fix_macros1.patch;"
 
 # Misc build failure for master HEAD
-SRC_URI += "file://fix_open_max_preprocessor_error.patch;patch=1"
+SRC_URI += "file://fix_open_max_preprocessor_error.patch;"
 
 EXTRA_OECONF += "--enable-dri --enable-dri2 --enable-dga"
 
-- 
1.7.0.4



