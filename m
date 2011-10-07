Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RCDzQ-0005tt-Mf
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 19:13:40 +0200
Received: by mail-gy0-f175.google.com with SMTP id 8so3931090gyg.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2011 10:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=RlxufQ1Onjzj/xssulL/YbrJd3oNd2/djaKXRvjB1LU=;
	b=ifVHPkm4ebNpVlW8WgaaestTkuof+ZEzLkiEzRzHM7DCYtFFU3o12b7YGD85AuNITf
	1AI0r21YqM6NAVJfbcmLvOVdj5vtB8+a8IPf8EfQXDEgsC4U5YrjXbSk6t1HTCs/gsdp
	s94oPidho/du7RLAel8xEMaBJrbnBdF4/+Kus=
Received: by 10.223.65.68 with SMTP id h4mr11337657fai.24.1318007285393;
	Fri, 07 Oct 2011 10:08:05 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u6sm13604110fan.17.2011.10.07.10.08.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Oct 2011 10:08:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Oct 2011 19:05:14 +0200
Message-Id: <99096f06bb4fab4cb6a8b614c1e6fd2666d523f3.1318007055.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
References: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318007055.git.Martin.Jansa@gmail.com>
References: <cover.1318007055.git.Martin.Jansa@gmail.com>
Subject: [PATCHv3 19/31] xserver-kdrive: drop unused files (same files are in xserver-kdrive-1.7.99.2 directory
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
X-List-Received-Date: Fri, 07 Oct 2011 17:13:41 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-xserver/xserver-kdrive/disable-apm.patch  |   24 ------
 .../xserver-kdrive/disable-xf86-dga-xorgcfg.patch  |   43 ----------
 .../xorg-xserver/xserver-kdrive/extra-kmodes.patch |   87 --------------------
 .../xserver-kdrive/fbdev_xrandr_ioctl.patch        |   63 --------------
 .../xserver-kdrive/no-serial-probing.patch         |   17 ----
 5 files changed, 0 insertions(+), 234 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive/disable-apm.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive/disable-xf86-dga-xorgcfg.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive/extra-kmodes.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive/fbdev_xrandr_ioctl.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive/no-serial-probing.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive/disable-apm.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive/disable-apm.patch
deleted file mode 100644
index c22b1c0..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive/disable-apm.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Upstream-Status: Inappropriate [disable feature]
-
-Signed-off-by: Yu Ke <ke.yu@intel.com>
-
---- xserver/hw/kdrive/linux/linux.c.orig	2005-04-23 15:56:13.988849232 +0000
-+++ xserver/hw/kdrive/linux/linux.c	2005-04-23 15:57:05.001094192 +0000
-@@ -342,7 +342,7 @@
-     /*
-      * Open the APM driver
-      */
--    LinuxApmFd = open ("/dev/apm_bios", 2);
-+    /*LinuxApmFd = open ("/dev/apm_bios", 2);
-     if (LinuxApmFd < 0 && errno == ENOENT)
- 	LinuxApmFd = open ("/dev/misc/apm_bios", 2); 
-     if (LinuxApmFd >= 0)
-@@ -352,7 +352,7 @@
- 	RegisterBlockAndWakeupHandlers (LinuxApmBlock, LinuxApmWakeup, 0);
- 	AddEnabledDevice (LinuxApmFd);
-     }
--	
-+    */	
-     /*
-      * now get the VT
-      */
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive/disable-xf86-dga-xorgcfg.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive/disable-xf86-dga-xorgcfg.patch
deleted file mode 100644
index 631c111..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive/disable-xf86-dga-xorgcfg.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-Upstream-Status: Inappropriate [disable feature]
-
-Signed-off-by: Yu Ke <ke.yu@intel.com>
-
-Index: xorg-server-1.3.0.0/configure.ac
-===================================================================
---- xorg-server-1.3.0.0.orig/configure.ac	2007-04-20 03:23:40.000000000 +0200
-+++ xorg-server-1.3.0.0/configure.ac	2007-05-09 16:51:34.000000000 +0200
-@@ -520,7 +520,11 @@
- XEXTXORG_LIB='$(top_builddir)/Xext/libXextbuiltin.la'
- 
- dnl Core modules for most extensions, et al.
-+if test "$KDRIVE" = yes; then
-+REQUIRED_MODULES="[randrproto >= 1.2] renderproto [fixesproto >= 4.0] [damageproto >= 1.1] xcmiscproto xextproto xproto xtrans xf86bigfontproto [scrnsaverproto >= 1.1] bigreqsproto resourceproto fontsproto inputproto [kbproto >= 1.0.3]"
-+else
- REQUIRED_MODULES="[randrproto >= 1.2] renderproto [fixesproto >= 4.0] [damageproto >= 1.1] xcmiscproto xextproto xproto xtrans xf86miscproto xf86vidmodeproto xf86bigfontproto [scrnsaverproto >= 1.1] bigreqsproto resourceproto fontsproto inputproto xf86dgaproto [kbproto >= 1.0.3]"
-+fi
- REQUIRED_LIBS="xfont xau fontenc"
- 
- AM_CONDITIONAL(XV, [test "x$XV" = xyes])
-@@ -1603,7 +1607,9 @@
- AC_SUBST(XKB_COMPILED_DIR)
- 
- dnl and the rest of these are generic, so they're in config.h
-+if test ! x"$KDRIVE" = xyes; then
- AC_DEFINE(XFreeXDGA, 1, [Build XDGA support])
-+fi
- AC_DEFINE(XResExtension, 1, [Build XRes extension])
- 
- AC_TRY_COMPILE([
-@@ -1616,10 +1622,12 @@
- 
- AC_DEFINE_DIR(PROJECTROOT, prefix, [Overall prefix])
- 
-+if test ! "x$KDRIVE" = xyes ; then
- dnl xorgconfig CLI configuration utility
- PKG_CHECK_MODULES([XORGCONFIG_DEP], [xkbfile x11])
- AC_SUBST(XORGCONFIG_DEP_CFLAGS)
- AC_SUBST(XORGCONFIG_DEP_LIBS)
-+fi
- 
- dnl xorgcfg GUI configuration utility
- AC_ARG_ENABLE(xorgcfg, AS_HELP_STRING([--enable-xorgcfg], 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive/extra-kmodes.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive/extra-kmodes.patch
deleted file mode 100644
index 896c033..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive/extra-kmodes.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-Add some extra video modes and change the default to VGA.
-
-Upstream-Status: Pending
-
-Signed-off-by: Yu Ke <ke.yu@intel.com>
-
----
- hw/kdrive/src/kmode.c |   41 +++++++++++++++++++++++++++++++++++++++--
- 1 file changed, 39 insertions(+), 2 deletions(-)
-
-Index: xorg-server-1.3.0.0/hw/kdrive/src/kmode.c
-===================================================================
---- xorg-server-1.3.0.0.orig/hw/kdrive/src/kmode.c	2008-01-11 14:20:47.000000000 +0000
-+++ xorg-server-1.3.0.0/hw/kdrive/src/kmode.c	2008-01-11 14:21:18.000000000 +0000
-@@ -32,6 +32,31 @@ const KdMonitorTiming  kdMonitorTimings[
-     /*	H	V	Hz	KHz */
- 		/*  FP	    BP	    BLANK   POLARITY */
- 
-+	/* Treo 650 */
-+
-+    {   320,	320,	64,	16256,
-+	            17,	    12,	    32,     KdSyncNegative,
-+	            1,      11,     14,     KdSyncNegative,
-+    },
-+    
-+    {   320,	320,	64,	    0,
-+	            0,	    0,	    0,     KdSyncNegative,
-+	            0,      0,      0,     KdSyncNegative,
-+    },
-+	
-+	/* LifeDrive/T3/TX modes */
-+
-+    {   320,	480,	64,	16256,
-+	            17,	    12,	    32,     KdSyncNegative,
-+	            1,      11,     14,     KdSyncNegative,
-+    },
-+    
-+    {   480,	320,	64,	    0,
-+	            0,	    0,	    0,     KdSyncNegative,
-+	            0,      0,      0,     KdSyncNegative,
-+    },
-+
-+
-     /* IPAQ modeline:
-      *
-      * Modeline "320x240"      5.7222 320 337 340 352   240 241 244 254"
-@@ -41,6 +66,11 @@ const KdMonitorTiming  kdMonitorTimings[
- 	            1,      11,     14,     KdSyncNegative,
-     },
-     
-+    {   240,	320,	64,	    0,
-+	            0,	    0,	    0,     KdSyncNegative,
-+	            0,      0,      0,     KdSyncNegative,
-+    },
-+
-     /* Other VESA modes */
-     {	640,	350,	85,	31500,			    /* VESA */
- 		    32,	    96,	    192,    KdSyncPositive, /* 26.413 */
-@@ -76,10 +106,19 @@ const KdMonitorTiming  kdMonitorTimings[
- 		    16,	    120,    176,    KdSyncNegative, /* 37.861 */
- 		    1,	    20,	    24,	    KdSyncNegative, /* 72.809 */
-     },
-+    /* DEFAULT */
-+#define MONITOR_TIMING_DEFAULT	13
-     {	640,	480,	60,	25175,			    /* VESA */
- 		   16,	    48,	    160,    KdSyncNegative, /* 31.469 */
- 		   10,	    33,	    45,	    KdSyncNegative, /* 59.940 */
-     },
-+
-+
-+  {   480,    640,    60,     0,                      /* VESA */
-+               0,      0,     0,    KdSyncNegative, /* 31.469 */
-+               0,      0,     0,     KdSyncNegative, /* 59.940 */
-+   },
-+  
-     
-     /* 800x600 modes */
-     {	800,	600,	85,	56250,			    /* VESA */
-@@ -90,8 +129,6 @@ const KdMonitorTiming  kdMonitorTimings[
- 		    16,	    160,    256,    KdSyncPositive, /* 46.875 */
- 		    1,	    21,	    25,	    KdSyncPositive, /* 75.000 */
-     },
--    /* DEFAULT */
--#define MONITOR_TIMING_DEFAULT	9
-     {	800,	600,	72,	50000,			    /* VESA */
- 		    56,	    64,	    240,    KdSyncPositive, /* 48.077 */
- 		    37,	    23,	    66,	    KdSyncPositive, /* 72.188 */
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive/fbdev_xrandr_ioctl.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive/fbdev_xrandr_ioctl.patch
deleted file mode 100644
index 07348dc..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive/fbdev_xrandr_ioctl.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-Upstream-Status: Pending
-
-Index: xorg-server-1.3.0.0/hw/kdrive/fbdev/fbdev.c
-===================================================================
---- xorg-server-1.3.0.0.orig/hw/kdrive/fbdev/fbdev.c	2008-09-25 21:55:12.000000000 +0100
-+++ xorg-server-1.3.0.0/hw/kdrive/fbdev/fbdev.c	2008-09-25 21:55:46.000000000 +0100
-@@ -498,6 +498,7 @@
-     KdScreenInfo	*screen = pScreenPriv->screen;
-     FbdevScrPriv	*scrpriv = screen->driver;
-     Bool		wasEnabled = pScreenPriv->enabled;
-+    FbdevPriv		*priv = screen->card->driver;
-     FbdevScrPriv	oldscr;
-     int			oldwidth;
-     int			oldheight;
-@@ -525,11 +526,46 @@
-     oldheight = screen->height;
-     oldmmwidth = pScreen->mmWidth;
-     oldmmheight = pScreen->mmHeight;
--    
-+
-     /*
-      * Set new configuration
-      */
--    
-+
-+    if (newwidth != oldwidth || newheight != oldheight)
-+    {
-+	struct fb_var_screeninfo var;
-+	int k;
-+
-+	k = ioctl (priv->fd, FBIOGET_VSCREENINFO, &var);
-+
-+	if (k < 0)
-+	{
-+	    ErrorF("Error with framebuffer ioctl FBIOGET_VSCREENINFO: %s", strerror (errno));
-+	    return FALSE;
-+	}
-+
-+	var.xres = newwidth;
-+	var.yres = newheight;
-+	var.activate = FB_ACTIVATE_NOW;
-+
-+	k = ioctl (priv->fd, FBIOPUT_VSCREENINFO, &var);
-+
-+	if (k >= 0)
-+	{
-+	    if ((k=ioctl(priv->fd, FBIOGET_FSCREENINFO, &priv->fix)) < 0)
-+	    {
-+		perror("Error with framebuffer ioctl FIOGET_FSCREENINFO");
-+		close (priv->fd);
-+		return FALSE;
-+	    }
-+	    if ((k=ioctl(priv->fd, FBIOGET_VSCREENINFO, &priv->var)) < 0) {
-+		perror("Error  framebuffer ioctl FIOGET_VSCREENINFO");
-+		close (priv->fd);
-+		return FALSE;
-+	    }
-+	}
-+    }
-+
-     scrpriv->randr = KdAddRotation (screen->randr, randr);
- 
-     KdOffscreenSwapOut (screen->pScreen);
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive/no-serial-probing.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive/no-serial-probing.patch
deleted file mode 100644
index 6acb834..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive/no-serial-probing.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Yu Ke <ke.yu@intel.com>
-
---- xserver/hw/kdrive/linux/mouse.c.orig	2004-05-13 14:25:51.000000000 -0700
-+++ xserver/hw/kdrive/linux/mouse.c	2005-09-22 12:20:47.000000000 -0700
-@@ -927,8 +927,10 @@ char *kdefaultMouse[] =  {
-     "/dev/psaux",
-     "/dev/input/mice",
-     "/dev/adbmouse",
-+#ifdef BREAK_MY_SERIAL_CONSOLE
-     "/dev/ttyS0",
-     "/dev/ttyS1",
-+#endif
- };
- 
- #define NUM_DEFAULT_MOUSE    (sizeof (kdefaultMouse) / sizeof (kdefaultMouse[0]))
-- 
1.7.7



