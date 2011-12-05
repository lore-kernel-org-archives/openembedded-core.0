Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RXbHz-0006Ih-6l
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Dec 2011 17:21:12 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 05 Dec 2011 08:14:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,299,1320652800"; d="scan'208";a="98748561"
Received: from unknown (HELO [10.255.12.195]) ([10.255.12.195])
	by fmsmga002.fm.intel.com with ESMTP; 05 Dec 2011 08:14:12 -0800
Message-ID: <4EDCEDD4.10204@linux.intel.com>
Date: Mon, 05 Dec 2011 08:14:12 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1322803309.git.xiaofeng.yan@windriver.com>
	<9bbd4cf3c020f147d8c3b27273f91a1ffee45aa4.1322803309.git.xiaofeng.yan@windriver.com>
In-Reply-To: <9bbd4cf3c020f147d8c3b27273f91a1ffee45aa4.1322803309.git.xiaofeng.yan@windriver.com>
Subject: Re: [PATCH 2/2] xserver-kdrive: update to 1.11.2
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
X-List-Received-Date: Mon, 05 Dec 2011 16:21:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/01/2011 09:27 PM, Xiaofeng Yan wrote:
> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>
> I didn't remove the old one because it is possible for the new version to \
> have some bugs during using or testing.
>

Please work to test the new version better so that we can remove the old 
version.

> Patches are commented by "#". Some of them are obsolete.
>
If there are obsolete patches, they should be removed. And not just 
commented out in the recipe.

Sau!


> crosscompile.patch is to avoid to seach "/etc/X11/fontpath.d" of host \
> during configuring of cross-compiling. It is no use in the version.
>
> enable-xcalibrate.patch is to avoid error of compiling tslib. \
> No use in the new version.
>
> nodolt.patch is no use too.
> other patches are retained.
>
> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
> ---
>   .../xserver-kdrive-1.11.2/disable-apm.patch        |   22 +
>   .../enable-builtin-fonts.patch                     |   16 +
>   .../xserver-kdrive-1.11.2/extra-kmodes.patch       |   82 +++
>   .../xserver-kdrive-1.11.2/fbdev_xrandr_ioctl.patch |   57 +++
>   .../fix-newer-xorg-headers.patch                   |   13 +
>   .../hide-cursor-and-ppm-root.patch                 |  298 +++++++++++
>   .../xserver-kdrive-1.11.2/kdrive-evdev.patch       |  520 ++++++++++++++++++++
>   .../xserver-kdrive-1.11.2/kdrive-use-evdev.patch   |   58 +++
>   .../keyboard-resume-workaround.patch               |   26 +
>   .../xserver-kdrive-1.11.2/no-serial-probing.patch  |   16 +
>   .../xserver-kdrive-1.11.2/optional-xkb.patch       |   62 +++
>   .../xorg-xserver/xserver-kdrive_1.11.2.bb          |   35 ++
>   12 files changed, 1205 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/disable-apm.patch
>   create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/enable-builtin-fonts.patch
>   create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/extra-kmodes.patch
>   create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/fbdev_xrandr_ioctl.patch
>   create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/fix-newer-xorg-headers.patch
>   create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/hide-cursor-and-ppm-root.patch
>   create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/kdrive-evdev.patch
>   create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/kdrive-use-evdev.patch
>   create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/keyboard-resume-workaround.patch
>   create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/no-serial-probing.patch
>   create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/optional-xkb.patch
>   create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.11.2.bb
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/disable-apm.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/disable-apm.patch
> new file mode 100644
> index 0000000..e1d5622
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/disable-apm.patch
> @@ -0,0 +1,22 @@
> +Upstream-Status: Inappropriate [disable feature]
> +
> +Signed-off-by: Yu Ke<ke.yu@intel.com>
> +
> +--- xorg-server-1.11.1.901/hw/kdrive/linux/linux.c	2011-07-15 21:26:40.000000000 +0800
> ++++ xorg-server-1.11.1.901/hw/kdrive/linux/linux.c.new	2011-10-24 16:15:12.000000000 +0800
> +@@ -251,6 +251,7 @@
> +     /*
> +      * Open the APM driver
> +      */
> ++    /*
> +     LinuxApmFd = open ("/dev/apm_bios", 2);
> +     if (LinuxApmFd<  0&&  errno == ENOENT)
> + 	LinuxApmFd = open ("/dev/misc/apm_bios", 2);
> +@@ -261,6 +262,7 @@
> + 	RegisterBlockAndWakeupHandlers (LinuxApmBlock, LinuxApmWakeup, 0);
> + 	AddEnabledDevice (LinuxApmFd);
> +     }
> ++    */
> +
> +     /*
> +      * now get the VT
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/enable-builtin-fonts.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/enable-builtin-fonts.patch
> new file mode 100644
> index 0000000..98d5176
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/enable-builtin-fonts.patch
> @@ -0,0 +1,16 @@
> +Upstream-Status: Pending
> +
> +Signed-off-by: Yu Ke<ke.yu@intel.com>
> +
> +--- xorg-server-X11R7.1-1.1.0/dix/dixfonts.c.orig	2006-06-08 14:49:12.158684250 +0200
> ++++ xorg-server-X11R7.1-1.1.0/dix/dixfonts.c	2006-06-08 14:49:52.493205000 +0200
> +@@ -52,8 +52,8 @@
> + /* $Xorg: dixfonts.c,v 1.4 2000/08/17 19:48:18 cpqbld Exp $ */
> +
> + #define NEED_REPLIES
> + #ifdef HAVE_DIX_CONFIG_H
> +-#include<dix-config.h>
> ++#include<kdrive-config.h>
> + #endif
> +
> + #include<X11/X.h>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/extra-kmodes.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/extra-kmodes.patch
> new file mode 100644
> index 0000000..40298d0
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/extra-kmodes.patch
> @@ -0,0 +1,82 @@
> +Add some extra video modes and change the default to VGA.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Yu Ke<ke.yu@intel.com>
> +
> +--- xorg-server-1.11.1.901/hw/kdrive/src/kmode.c	2011-03-02 12:09:32.000000000 +0800
> ++++ xorg-server-1.11.1.901/hw/kdrive/src/kmode.c.new	2011-10-24 15:58:43.000000000 +0800
> +@@ -29,6 +29,29 @@
> + const KdMonitorTiming  kdMonitorTimings[] = {
> +     /*	H	V	Hz	KHz */
> + 		/*  FP	    BP	    BLANK   POLARITY */
> ++       /* Treo 650 */
> ++
> ++    {   320,   320,    64,     16256,
> ++                   17,     12,     32,     KdSyncNegative,
> ++                   1,      11,     14,     KdSyncNegative,
> ++    },
> ++
> ++    {   320,   320,    64,         0,
> ++                   0,      0,      0,     KdSyncNegative,
> ++                   0,      0,      0,     KdSyncNegative,
> ++    },
> ++
> ++       /* LifeDrive/T3/TX modes */
> ++
> ++    {   320,   480,    64,     16256,
> ++                   17,     12,     32,     KdSyncNegative,
> ++                   1,      11,     14,     KdSyncNegative,
> ++    },
> ++
> ++    {   480,   320,    64,         0,
> ++                   0,      0,      0,     KdSyncNegative,
> ++                   0,      0,      0,     KdSyncNegative,
> ++    },
> +
> +     /* IPAQ modeline:
> +      *
> +@@ -39,6 +62,12 @@
> + 	            1,      11,     14,     KdSyncNegative,
> +     },
> +
> ++    {   240,   320,    64,         0,
> ++                   0,      0,      0,     KdSyncNegative,
> ++                   0,      0,      0,     KdSyncNegative,
> ++    },
> ++
> ++
> +     /* Other VESA modes */
> +     {	640,	350,	85,	31500,			    /* VESA */
> + 		    32,	    96,	    192,    KdSyncPositive, /* 26.413 */
> +@@ -74,11 +103,18 @@
> + 		    16,	    120,    176,    KdSyncNegative, /* 37.861 */
> + 		    1,	    20,	    24,	    KdSyncNegative, /* 72.809 */
> +     },
> +-    {	640,	480,	60,	25175,			    /* VESA */
> ++    /* DEFAULT */
> ++#define MONITOR_TIMING_DEFAULT 13
> ++
> ++   {	640,	480,	60,	25175,			    /* VESA */
> + 		   16,	    48,	    160,    KdSyncNegative, /* 31.469 */
> + 		   10,	    33,	    45,	    KdSyncNegative, /* 59.940 */
> +-    },
> ++   },
> +
> ++   {   480,    640,    60,     0,                      /* VESA */
> ++               0,      0,     0,    KdSyncNegative, /* 31.469 */
> ++               0,      0,     0,     KdSyncNegative, /* 59.940 */
> ++   },
> +     /* 800x600 modes */
> +     {	800,	600,	85,	56250,			    /* VESA */
> + 		    32,	    152,    248,    KdSyncPositive, /* 53.674 */
> +@@ -88,8 +124,7 @@
> + 		    16,	    160,    256,    KdSyncPositive, /* 46.875 */
> + 		    1,	    21,	    25,	    KdSyncPositive, /* 75.000 */
> +     },
> +-    /* DEFAULT */
> +-#define MONITOR_TIMING_DEFAULT	9
> ++
> +     {	800,	600,	72,	50000,			    /* VESA */
> + 		    56,	    64,	    240,    KdSyncPositive, /* 48.077 */
> + 		    37,	    23,	    66,	    KdSyncPositive, /* 72.188 */
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/fbdev_xrandr_ioctl.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/fbdev_xrandr_ioctl.patch
> new file mode 100644
> index 0000000..7f4998e
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/fbdev_xrandr_ioctl.patch
> @@ -0,0 +1,57 @@
> +Upstream-Status: Pending
> +
> +Signed-off-by: Yu Ke<ke.yu@intel.com>
> +Index: xorg-server-1.11.1.901/hw/kdrive/fbdev/fbdev.c
> +===================================================================
> +--- xorg-server-1.11.1.901/hw/kdrive/fbdev/fbdev.c	2011-10-25 14:48:04.000000000 +0800
> ++++ xorg-server-1.11.1.901/hw/kdrive/fbdev/fbdev.c	2011-10-25 14:50:16.000000000 +0800
> +@@ -485,6 +485,7 @@
> +     KdScreenInfo	*screen = pScreenPriv->screen;
> +     FbdevScrPriv	*scrpriv = screen->driver;
> +     Bool		wasEnabled = pScreenPriv->enabled;
> ++    FbdevPriv          *priv = screen->card->driver;
> +     FbdevScrPriv	oldscr;
> +     int			oldwidth;
> +     int			oldheight;
> +@@ -517,6 +518,41 @@
> +      * Set new configuration
> +      */
> +
> ++    if (newwidth != oldwidth || newheight != oldheight)
> ++    {
> ++       struct fb_var_screeninfo var;
> ++       int k;
> ++
> ++       k = ioctl (priv->fd, FBIOGET_VSCREENINFO,&var);
> ++
> ++       if (k<  0)
> ++       {
> ++           ErrorF("Error with framebuffer ioctl FBIOGET_VSCREENINFO: %s", strerror (errno));
> ++           return FALSE;
> ++       }
> ++
> ++       var.xres = newwidth;
> ++       var.yres = newheight;
> ++       var.activate = FB_ACTIVATE_NOW;
> ++
> ++       k = ioctl (priv->fd, FBIOPUT_VSCREENINFO,&var);
> ++
> ++       if (k>= 0)
> ++       {
> ++           if ((k=ioctl(priv->fd, FBIOGET_FSCREENINFO,&priv->fix))<  0)
> ++           {
> ++               perror("Error with framebuffer ioctl FIOGET_FSCREENINFO");
> ++               close (priv->fd);
> ++               return FALSE;
> ++           }
> ++           if ((k=ioctl(priv->fd, FBIOGET_VSCREENINFO,&priv->var))<  0) {
> ++               perror("Error  framebuffer ioctl FIOGET_VSCREENINFO");
> ++               close (priv->fd);
> ++               return FALSE;
> ++           }
> ++       }
> ++    }
> ++
> +     scrpriv->randr = KdAddRotation (screen->randr, randr);
> +
> +     fbdevUnmapFramebuffer (screen);
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/fix-newer-xorg-headers.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/fix-newer-xorg-headers.patch
> new file mode 100644
> index 0000000..18781b3
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/fix-newer-xorg-headers.patch
> @@ -0,0 +1,13 @@
> +Upstream-Status: Pending
> +
> +Signed-off-by: Yu Ke<ke.yu@intel.com>
> +--- xorg-server-1.11.1.901/render/glyphstr.h	2011-03-02 12:09:33.000000000 +0800
> ++++ xorg-server-1.11.1.901/render/glyphstr.h.new	2011-10-24 16:19:32.000000000 +0800
> +@@ -25,6 +25,7 @@
> + #ifndef _GLYPHSTR_H_
> + #define _GLYPHSTR_H_
> +
> ++#include<X11/X.h>
> + #include<X11/extensions/renderproto.h>
> + #include "picture.h"
> + #include "screenint.h"
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/hide-cursor-and-ppm-root.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/hide-cursor-and-ppm-root.patch
> new file mode 100644
> index 0000000..37e0efe
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/hide-cursor-and-ppm-root.patch
> @@ -0,0 +1,298 @@
> +Upstream-Status: Pending
> +
> +Signed-off-by: Yu Ke<ke.yu@intel.com>
> +Index: xorg-server-1.11.1.901/dix/window.c
> +===================================================================
> +--- xorg-server-1.11.1.901/dix/window.c	2011-07-15 21:26:40.000000000 +0800
> ++++ xorg-server-1.11.1.901/dix/window.c.new	2011-10-25 13:57:50.000000000 +0800
> +@@ -182,10 +182,123 @@
> +
> + #define SubStrSend(pWin,pParent) (StrSend(pWin) || SubSend(pParent))
> +
> ++char* RootPPM = NULL;
> ++
> + #ifdef COMPOSITE
> + static const char *overlay_win_name = "<composite overlay>";
> + #endif
> +
> ++static int
> ++get_int(FILE *fp)
> ++{
> ++  int c = 0;
> ++
> ++  while ((c = getc(fp)) != EOF)
> ++    {
> ++      if (isspace(c))
> ++       continue;
> ++
> ++      if (c == '#')
> ++       while (c = getc(fp))
> ++         if (c == EOF)
> ++           return 0;
> ++         else if (c == '\n')
> ++           break;
> ++
> ++      if (isdigit(c))
> ++       {
> ++         int val = c - '0';
> ++         while ((c = getc(fp))&&  isdigit(c))
> ++           val = (val * 10) + (c - '0');
> ++         return val;
> ++       }
> ++    }
> ++
> ++  return 0;
> ++}
> ++
> ++static unsigned char*
> ++ppm_load (const char* path, int depth, int *width, int *height)
> ++{
> ++  FILE *fp;
> ++  int   max, n = 0, w, h, i, j, bytes_per_line;
> ++  unsigned char *data, *res, h1, h2;
> ++
> ++  if (depth<  16 || depth>  32)
> ++    return NULL;
> ++
> ++  if (depth>  16)
> ++    depth = 32;
> ++
> ++  fp = fopen (path, "r");
> ++  if (fp == NULL)
> ++    return FALSE;
> ++
> ++  h1 = getc(fp);
> ++  h2 = getc(fp);
> ++
> ++  /* magic is 'P6' for raw ppm */
> ++  if (h1 != 'P'&&  h2 != '6')
> ++      goto fail;
> ++
> ++  w = get_int(fp);
> ++  h = get_int(fp);
> ++
> ++  if (w == 0 || h == 0)
> ++    goto fail;
> ++
> ++  max = get_int(fp);
> ++
> ++  if (max != 255)
> ++      goto fail;
> ++
> ++  bytes_per_line = ((w * depth + 31)>>  5)<<  2;
> ++
> ++  res = data = malloc(bytes_per_line * h);
> ++
> ++  for (i=0; i<h; i++)
> ++    {
> ++      for (j=0; j<w; j++)
> ++       {
> ++         unsigned char buf[3];
> ++         fread(buf, 1, 3, fp);
> ++
> ++         switch (depth)
> ++           {
> ++           case 24:
> ++           case 32:
> ++             *data     = buf[2];
> ++             *(data+1) = buf[1];
> ++             *(data+2) = buf[0];
> ++             data += 4;
> ++             break;
> ++           case 16:
> ++           default:
> ++             *(unsigned short*)data
> ++               = ((buf[0]>>  3)<<  11) | ((buf[1]>>  2)<<  5) | (buf[2]>>  3);
> ++             data += 2;
> ++             break;
> ++           }
> ++       }
> ++      data += (bytes_per_line - (w*(depth>>3)));
> ++    }
> ++
> ++  data = res;
> ++
> ++  *width  = w;
> ++  *height = h;
> ++
> ++  fclose(fp);
> ++
> ++  return res;
> ++
> ++ fail:
> ++  fclose(fp);
> ++  return NULL;
> ++}
> ++
> ++
> ++
> + static const char *
> + get_window_name(WindowPtr pWin)
> + {
> +@@ -409,6 +522,35 @@
> +     int len = BitmapBytePad(sizeof(long));
> +     unsigned char *from, *to;
> +     int i, j;
> ++    if (RootPPM != NULL)
> ++      {
> ++       int            w, h;
> ++       unsigned char *data;
> ++
> ++       if ((data = ppm_load (RootPPM, pScreen->rootDepth,&w,&h)) != NULL)
> ++         {
> ++           pWin->background.pixmap
> ++             = (*pScreen->CreatePixmap)(pScreen, w, h, pScreen->rootDepth, 0);
> ++
> ++           pWin->backgroundState = BackgroundPixmap;
> ++           pGC = GetScratchGC(pScreen->rootDepth, pScreen);
> ++           if (!pWin->background.pixmap || !pGC)
> ++             FatalError("could not create root tile");
> ++
> ++           ValidateGC((DrawablePtr)pWin->background.pixmap, pGC);
> ++
> ++           (*pGC->ops->PutImage)((DrawablePtr)pWin->background.pixmap,
> ++                                 pGC,
> ++                                 pScreen->rootDepth,
> ++                                 0, 0, w, h, 0, ZPixmap, (char *)data);
> ++           FreeScratchGC(pGC);
> ++
> ++           free(data);
> ++           return;
> ++         }
> ++       else
> ++         ErrorF("Unable to load root window image.");
> ++      }
> +
> +     pWin->background.pixmap = (*pScreen->CreatePixmap)(pScreen, 4, 4,
> + 						    pScreen->rootDepth, 0);
> +
> +Index: xorg-server-1.11.1.901/hw/kdrive/src/kdrive.c
> +===================================================================
> +--- xorg-server-1.11.1.901/hw/kdrive/src/kdrive.c	2011-08-01 07:44:54.000000000 +0800
> ++++ xorg-server-1.11.1.901/hw/kdrive/src/kdrive.c.new	2011-10-25 14:04:38.000000000 +0800
> +@@ -60,6 +60,9 @@
> +     { 32, 32 }
> + };
> +
> ++int
> ++ProcXFixesHideCursor (ClientPtr client) ;
> ++
> + #define NUM_KD_DEPTHS (sizeof (kdDepths) / sizeof (kdDepths[0]))
> +
> + #define KD_DEFAULT_BUTTONS 5
> +@@ -90,6 +93,9 @@
> +  */
> +
> + KdOsFuncs	*kdOsFuncs;
> ++extern Bool CursorInitiallyHidden; /* See Xfixes cursor.c */
> ++extern char* RootPPM;             /* dix/window.c */
> ++
> +
> + void
> + KdDisableScreen (ScreenPtr pScreen)
> +@@ -454,6 +460,9 @@
> +     ErrorF("-switchCmd       Command to execute on vt switch\n");
> +     ErrorF("-zap             Terminate server on Ctrl+Alt+Backspace\n");
> +     ErrorF("vtxx             Use virtual terminal xx instead of the next available\n");
> ++    ErrorF("-hide-cursor     Start with cursor hidden\n");
> ++    ErrorF("-root-ppm [path] Specify ppm file to use as root window background.\n");
> ++
> + }
> +
> + int
> +@@ -517,6 +526,20 @@
> + 	kdSoftCursor = TRUE;
> + 	return 1;
> +     }
> ++    if (!strcmp (argv[i], "-hide-cursor"))
> ++    {
> ++      CursorInitiallyHidden = TRUE;
> ++      return 1;
> ++    }
> ++    if (!strcmp (argv[i], "-root-ppm"))
> ++    {
> ++      if ((i+1)<  argc)
> ++       RootPPM =  argv[i+1];
> ++      else
> ++       UseMsg ();
> ++      return 2;
> ++    }
> ++
> +     if (!strcmp (argv[i], "-videoTest"))
> +     {
> + 	kdVideoTest = TRUE;
> +
> +Index: xorg-server-1.11.1.901/xfixes/cursor.c
> +===================================================================
> +--- xorg-server-1.11.1.901/xfixes/cursor.c	2011-07-15 21:26:40.000000000 +0800
> ++++ xorg-server-1.11.1.901/xfixes/cursor.c.new	2011-10-25 14:13:09.000000000 +0800
> +@@ -60,6 +60,7 @@
> + static RESTYPE		CursorClientType;
> + static RESTYPE		CursorHideCountType;
> + static RESTYPE		CursorWindowType;
> ++static Bool             CursorGloballyHidden;
> + RESTYPE			PointerBarrierType;
> + static CursorPtr	CursorCurrent[MAXDEVICES];
> +
> +@@ -68,6 +69,8 @@
> +
> + static void deleteCursorHideCountsForScreen (ScreenPtr pScreen);
> +
> ++Bool CursorInitiallyHidden = FALSE;
> ++
> + #define VERIFY_CURSOR(pCursor, cursor, client, access)			\
> +     do {								\
> + 	int err;							\
> +@@ -160,7 +163,7 @@
> +     if (ConnectionInfo)
> + 	CursorVisible = EnableCursor;
> +
> +-    if (cs->pCursorHideCounts != NULL || !CursorVisible) {
> ++    if (cs->pCursorHideCounts != NULL || !CursorVisible || CursorGloballyHidden) {
> + 	ret = (*pScreen->DisplayCursor) (pDev, pScreen, NullCursor);
> +     } else {
> + 	ret = (*pScreen->DisplayCursor) (pDev, pScreen, pCursor);
> +@@ -896,6 +899,13 @@
> + 	return ret;
> +     }
> +
> ++    /* Is cursor set to be initially hidden ?, if so reset this
> ++     * flag as now visibility assumed under control of client.
> ++    */
> ++    if (CursorGloballyHidden)
> ++      CursorGloballyHidden = FALSE;
> ++
> ++
> +     /*
> +      * Has client hidden the cursor before on this screen?
> +      * If so, just increment the count.
> +@@ -959,9 +969,19 @@
> + 	return rc;
> +     }
> +
> ++    /* X was started with cursor hidden, therefore just reset our flag
> ++     * (returning to normal client control) and cause cursor to now be
> ++     * shown.
> ++    */
> ++    if (CursorGloballyHidden == TRUE)
> ++      {
> ++       CursorGloballyHidden = FALSE;
> ++       return (client->noClientException);
> ++      }
> ++
> +     /*
> +      * Has client hidden the cursor on this screen?
> +-     * If not, generate an error.
> ++     * If so, generate an error.
> +      */
> +     pChc = findCursorHideCount(client, pWin->drawable.pScreen);
> +     if (pChc == NULL) {
> +@@ -1426,6 +1446,8 @@
> + {
> +     int	i;
> +
> ++    CursorGloballyHidden = CursorInitiallyHidden;
> ++
> +     if (party_like_its_1989)
> + 	CursorVisible = EnableCursor;
> +
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/kdrive-evdev.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/kdrive-evdev.patch
> new file mode 100644
> index 0000000..5d876af
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/kdrive-evdev.patch
> @@ -0,0 +1,520 @@
> +# Kdrive evdev support patch, posted by Ander Conselvan de Oliveira at
> +# http://lists.freedesktop.org/archives/xorg/2005-December/011635.html
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Yu Ke<ke.yu@intel.com>
> +
> +diff -u -r --exclude=CVS --exclude=Makefile --exclude='*.o' --exclude=ephyr --exclude='*.Po' xserver.original/hw/kdrive/linux/evdev.c xserver/hw/kdrive/linux/evdev.c
> +--- xserver.original/hw/kdrive/linux/evdev.c	2005-12-16 10:36:05.000000000 -0200
> ++++ xserver/hw/kdrive/linux/evdev.c	2005-12-16 10:40:51.077410192 -0200
> +@@ -31,9 +31,11 @@
> + #include<X11/X.h>
> + #include<X11/Xproto.h>
> + #include<X11/Xpoll.h>
> ++#include<X11/keysym.h>
> + #include "inputstr.h"
> + #include "scrnintstr.h"
> + #include "kdrive.h"
> ++#include "kkeymap.h"
> +
> + #define NUM_EVENTS  128
> + #define ABS_UNSET   -65535
> +@@ -105,9 +107,10 @@
> + {
> +     KdMouseInfo		*mi = closure;
> +     Kevdev		*ke = mi->driver;
> +-    int			i;
> ++    int			i, j;
> +     struct input_event	events[NUM_EVENTS];
> +     int			n;
> ++    int                 flags;
> +
> +     n = read (evdevPort,&events, NUM_EVENTS * sizeof (struct input_event));
> +     if (n<= 0)
> +@@ -115,22 +118,64 @@
> +     n /= sizeof (struct input_event);
> +     for (i = 0; i<  n; i++)
> +     {
> ++	flags = KD_MOUSE_DELTA | kdMouseInfo->buttonState;
> + 	switch (events[i].type) {
> + 	case EV_SYN:
> + 	    break;
> + 	case EV_KEY:
> +-	    EvdevMotion (mi);
> +-	    ASSIGNBIT(ke->key,events[i].code, events[i].value);
> +-	    if (events[i].code<  0x100)
> +-		ErrorF ("key %d %d\n", events[i].code, events[i].value);
> +-	    else
> +-		ErrorF ("key 0x%x %d\n", events[i].code, events[i].value);
> ++	  if (events[i].code>= BTN_MOUSE&&  events[i].code<  BTN_JOYSTICK) {
> ++	        switch (events[i].code) {
> ++		case BTN_LEFT:
> ++		  if (events[i].value == 1)
> ++		    flags |= KD_BUTTON_1;
> ++		  else
> ++		    flags&= ~KD_BUTTON_1;
> ++		  break;
> ++		case BTN_MIDDLE:
> ++		  if (events[i].value == 1)
> ++		    flags |= KD_BUTTON_2;
> ++		  else
> ++		    flags&= ~KD_BUTTON_2;
> ++		  break;
> ++		case BTN_RIGHT:
> ++		  if (events[i].value == 1)
> ++		    flags |= KD_BUTTON_3;
> ++		  else
> ++		    flags&= ~KD_BUTTON_3;
> ++		  break;
> ++		default:
> ++		  /* Unknow button */
> ++		  break;
> ++       	        }
> ++		KdEnqueueMouseEvent (kdMouseInfo, flags, 0, 0);
> ++	    }
> + 	    break;
> + 	case EV_REL:
> +-	    ke->rel[events[i].code] += events[i].value;
> ++	    if (events[i].code == REL_X) {
> ++	      KdEnqueueMouseEvent (kdMouseInfo, flags, events[i].value, 0);
> ++	    }
> ++	    else if (events[i].code == REL_Y) {
> ++	      KdEnqueueMouseEvent (kdMouseInfo, flags, 0, events[i].value);
> ++	    }
> ++	    else if (events[i].code == REL_WHEEL) {	
> ++	      for (j = 0; j<  abs (events[i].value); j++) {
> ++		if (events[i].value>  0)
> ++		  flags |= KD_BUTTON_4;
> ++		else
> ++		  flags |= KD_BUTTON_5;
> ++
> ++		KdEnqueueMouseEvent (kdMouseInfo, flags, 0, 0);
> ++
> ++		if (events[i].value>  0)
> ++		  flags&= ~KD_BUTTON_4;
> ++		else
> ++		  flags&= ~KD_BUTTON_5;
> ++
> ++		KdEnqueueMouseEvent (kdMouseInfo, flags, 0, 0);
> ++	      } /* events[i].code == REL_WHEEL */
> ++	    }
> + 	    break;
> + 	case EV_ABS:
> +-	    ke->abs[events[i].code] = events[i].value;
> + 	    break;
> + 	}
> +     }
> +@@ -173,6 +218,12 @@
> + 		fd = open (kdefaultEvdev[i], 2);
> + 		if (fd>= 0)
> + 		{
> ++                    if (ioctl (fd, EVIOCGRAB, 1)<  0)
> ++                    {
> ++                        close (fd);
> ++                        continue;
> ++                    }
> ++
> + 		    mi->name = KdSaveString (kdefaultEvdev[i]);
> + 		    break;
> + 		}
> +@@ -287,7 +338,319 @@
> +     EvdevFini,
> + };
> +
> +-#if 0
> ++/* Keyboard */
> ++
> ++int kbd_fd = -1;
> ++int EvdevInputType = 0;
> ++
> ++KeySym evdevKeymap[(194 - 1 + 1) * 2] = {
> ++/* These are directly mapped from DOS scanset 0 */
> ++/*      1     8 */       XK_Escape, NoSymbol,
> ++/*      2     9 */       XK_1,  XK_exclam,
> ++/*      3    10 */       XK_2,  XK_at,
> ++/*      4    11 */       XK_3,  XK_numbersign,
> ++/*      5    12 */       XK_4,  XK_dollar,
> ++/*      6    13 */       XK_5,  XK_percent,
> ++/*      7    14 */       XK_6,  XK_asciicircum,
> ++/*      8    15 */       XK_7,  XK_ampersand,
> ++/*      9    16 */       XK_8,  XK_asterisk,
> ++/*     10    17 */       XK_9,  XK_parenleft,
> ++/*     11    18 */       XK_0,  XK_parenright,
> ++/*     12    19 */       XK_minus,      XK_underscore,
> ++/*     13    20 */       XK_equal,      XK_plus,
> ++/*     14    21 */       XK_BackSpace,  NoSymbol,
> ++/*     15    22 */       XK_Tab,        NoSymbol,
> ++/*     16    23 */       XK_Q,  NoSymbol,
> ++/*     17    24 */       XK_W,  NoSymbol,
> ++/*     18    25 */       XK_E,  NoSymbol,
> ++/*     19    26 */       XK_R,  NoSymbol,
> ++/*     20    27 */       XK_T,  NoSymbol,
> ++/*     21    28 */       XK_Y,  NoSymbol,
> ++/*     22    29 */       XK_U,  NoSymbol,
> ++/*     23    30 */       XK_I,  NoSymbol,
> ++/*     24    31 */       XK_O,  NoSymbol,
> ++/*     25    32 */       XK_P,  NoSymbol,
> ++/*     26    33 */       XK_bracketleft,        XK_braceleft,
> ++/*     27    34 */       XK_bracketright,       XK_braceright,
> ++/*     28    35 */       XK_Return,     NoSymbol,
> ++/*     29    36 */       XK_Control_L,  NoSymbol,
> ++/*     30    37 */       XK_A,  NoSymbol,
> ++/*     31    38 */       XK_S,  NoSymbol,
> ++/*     32    39 */       XK_D,  NoSymbol,
> ++/*     33    40 */       XK_F,  NoSymbol,
> ++/*     34    41 */       XK_G,  NoSymbol,
> ++/*     35    42 */       XK_H,  NoSymbol,
> ++/*     36    43 */       XK_J,  NoSymbol,
> ++/*     37    44 */       XK_K,  NoSymbol,
> ++/*     38    45 */       XK_L,  NoSymbol,
> ++/*     39    46 */       XK_semicolon,  XK_colon,
> ++/*     40    47 */       XK_apostrophe, XK_quotedbl,
> ++/*     41    48 */       XK_grave,      XK_asciitilde,
> ++/*     42    49 */       XK_Shift_L,    NoSymbol,
> ++/*     43    50 */       XK_backslash,  XK_bar,
> ++/*     44    51 */       XK_Z,  NoSymbol,
> ++/*     45    52 */       XK_X,  NoSymbol,
> ++/*     46    53 */       XK_C,  NoSymbol,
> ++/*     47    54 */       XK_V,  NoSymbol,
> ++/*     48    55 */       XK_B,  NoSymbol,
> ++/*     49    56 */       XK_N,  NoSymbol,
> ++/*     50    57 */       XK_M,  NoSymbol,
> ++/*     51    58 */       XK_comma,      XK_less,
> ++/*     52    59 */       XK_period,     XK_greater,
> ++/*     53    60 */       XK_slash,      XK_question,
> ++/*     54    61 */       XK_Shift_R,    NoSymbol,
> ++/*     55    62 */       XK_KP_Multiply,        NoSymbol,
> ++/*     56    63 */       XK_Alt_L,      XK_Meta_L,
> ++/*     57    64 */       XK_space,      NoSymbol,
> ++/*     58    65 */       XK_Caps_Lock,  NoSymbol,
> ++/*     59    66 */       XK_F1, NoSymbol,
> ++/*     60    67 */       XK_F2, NoSymbol,
> ++/*     61    68 */       XK_F3, NoSymbol,
> ++/*     62    69 */       XK_F4, NoSymbol,
> ++/*     63    70 */       XK_F5, NoSymbol,
> ++/*     64    71 */       XK_F6, NoSymbol,
> ++/*     65    72 */       XK_F7, NoSymbol,
> ++/*     66    73 */       XK_F8, NoSymbol,
> ++/*     67    74 */       XK_F9, NoSymbol,
> ++/*     68    75 */       XK_F10,        NoSymbol,
> ++/*     69    76 */       XK_Break,      XK_Pause,
> ++/*     70    77 */       XK_Scroll_Lock,        NoSymbol,
> ++/*     71    78 */       XK_KP_Home,    XK_KP_7,
> ++/*     72    79 */       XK_KP_Up,      XK_KP_8,
> ++/*     73    80 */       XK_KP_Page_Up, XK_KP_9,
> ++/*     74    81 */       XK_KP_Subtract,        NoSymbol,
> ++/*     75    82 */       XK_KP_Left,    XK_KP_4,
> ++/*     76    83 */       XK_KP_5,       NoSymbol,
> ++/*     77    84 */       XK_KP_Right,   XK_KP_6,
> ++/*     78    85 */       XK_KP_Add,     NoSymbol,
> ++/*     79    86 */       XK_KP_End,     XK_KP_1,
> ++/*     80    87 */       XK_KP_Down,    XK_KP_2,
> ++/*     81    88 */       XK_KP_Page_Down,       XK_KP_3,
> ++/*     82    89 */       XK_KP_Insert,  XK_KP_0,
> ++/*     83    90 */       XK_KP_Delete,  XK_KP_Decimal,
> ++/*     84    91 */     NoSymbol,        NoSymbol,
> ++/*     85    92 */     NoSymbol,        NoSymbol,
> ++/*     86    93 */     NoSymbol,        NoSymbol,
> ++/*     87    94 */       XK_F11,        NoSymbol,
> ++/*     88    95 */       XK_F12,        NoSymbol,
> ++
> ++/* These are remapped from the extended set (using ExtendMap) */
> ++
> ++/*     89    96 */       XK_Control_R,  NoSymbol,
> ++/*     90    97 */       XK_KP_Enter,   NoSymbol,
> ++/*     91    98 */       XK_KP_Divide,  NoSymbol,
> ++/*     92    99 */       XK_Sys_Req,    XK_Print,
> ++/*     93   100 */       XK_Alt_R,      XK_Meta_R,
> ++/*     94   101 */       XK_Num_Lock,   NoSymbol,
> ++/*     95   102 */       XK_Home,       NoSymbol,
> ++/*     96   103 */       XK_Up,         NoSymbol,
> ++/*     97   104 */       XK_Page_Up,    NoSymbol,
> ++/*     98   105 */       XK_Left,       NoSymbol,
> ++/*     99   106 */       XK_Right,      NoSymbol,
> ++/*    100   107 */       XK_End,        NoSymbol,
> ++/*    101   108 */       XK_Down,       NoSymbol,
> ++/*    102   109 */       XK_Page_Down,  NoSymbol,
> ++/*    103   110 */       XK_Insert,     NoSymbol,
> ++/*    104   111 */       XK_Delete,     NoSymbol,
> ++/*    105   112 */       XK_Super_L,    NoSymbol,
> ++/*    106   113 */       XK_Super_R,    NoSymbol,
> ++/*    107   114 */       XK_Menu,       NoSymbol,
> ++/*    108   115 */       NoSymbol,      NoSymbol,
> ++/*    109   116 */       NoSymbol,      NoSymbol,
> ++/*    110   117 */       NoSymbol,      NoSymbol,
> ++/*    111   118 */       NoSymbol,      NoSymbol,
> ++/*    112   119 */       NoSymbol,      NoSymbol,
> ++
> ++/*    113   120 */      NoSymbol,     NoSymbol,
> ++/*    114   121 */      NoSymbol,     NoSymbol,
> ++/*    115   122 */      NoSymbol,     NoSymbol,
> ++/*    116   123 */      NoSymbol,     NoSymbol,
> ++/*    117   124 */      NoSymbol,     NoSymbol,
> ++/*    118   125 */      NoSymbol,     NoSymbol,
> ++/*    119   126 */      NoSymbol,     NoSymbol,
> ++/*    120   127 */      NoSymbol,     NoSymbol,
> ++/*    121   128 */      NoSymbol,     NoSymbol,
> ++/*    122   129 */      NoSymbol,     NoSymbol,
> ++/*    123   130 */      NoSymbol,     NoSymbol,
> ++/*    124   131 */      NoSymbol,     NoSymbol,
> ++/*    125   132 */      NoSymbol,     NoSymbol,
> ++/*    126   133 */      NoSymbol,     NoSymbol,
> ++/*    127   134 */      NoSymbol,     NoSymbol,
> ++/*    128   135 */      NoSymbol,     NoSymbol,
> ++/*    129   136 */      NoSymbol,     NoSymbol,
> ++/*    130   137 */      NoSymbol,     NoSymbol,
> ++/*    131   138 */      NoSymbol,     NoSymbol,
> ++/*    132   139 */      NoSymbol,     NoSymbol,
> ++/*    133   140 */      NoSymbol,     NoSymbol,
> ++/*    134   141 */      NoSymbol,     NoSymbol,
> ++/*    135   142 */      NoSymbol,     NoSymbol,
> ++/*    136   143 */      NoSymbol,     NoSymbol,
> ++/*    137   144 */      NoSymbol,     NoSymbol,
> ++/*    138   145 */      NoSymbol,     NoSymbol,
> ++/*    139   146 */      NoSymbol,     NoSymbol,
> ++/*    140   147 */      NoSymbol,     NoSymbol,
> ++/*    141   148 */      NoSymbol,     NoSymbol,
> ++/*    142   149 */      NoSymbol,     NoSymbol,
> ++/*    143   150 */      NoSymbol,     NoSymbol,
> ++/*    144   151 */      NoSymbol,     NoSymbol,
> ++/*    145   152 */      NoSymbol,     NoSymbol,
> ++/*    146   153 */      NoSymbol,     NoSymbol,
> ++/*    147   154 */      NoSymbol,     NoSymbol,
> ++/*    148   155 */      NoSymbol,     NoSymbol,
> ++/*    149   156 */      NoSymbol,     NoSymbol,
> ++/*    150   157 */      NoSymbol,     NoSymbol,
> ++/*    151   158 */      NoSymbol,     NoSymbol,
> ++/*    152   159 */      NoSymbol,     NoSymbol,
> ++/*    153   160 */      NoSymbol,     NoSymbol,
> ++/*    154   161 */      NoSymbol,     NoSymbol,
> ++/*    155   162 */      NoSymbol,     NoSymbol,
> ++/*    156   163 */      NoSymbol,     NoSymbol,
> ++/*    157   164 */      NoSymbol,     NoSymbol,
> ++/*    158   165 */      NoSymbol,     NoSymbol,
> ++/*    159   166 */      NoSymbol,     NoSymbol,
> ++/*    160   167 */      NoSymbol,     NoSymbol,
> ++/*    161   168 */      NoSymbol,     NoSymbol,
> ++/*    162   169 */      NoSymbol,     NoSymbol,
> ++/*    163   170 */      NoSymbol,     NoSymbol,
> ++/*    164   171 */      NoSymbol,     NoSymbol,
> ++/*    165   172 */      NoSymbol,     NoSymbol,
> ++/*    166   173 */      NoSymbol,     NoSymbol,
> ++/*    167   174 */      NoSymbol,     NoSymbol,
> ++/*    168   175 */      NoSymbol,     NoSymbol,
> ++/*    169   176 */      NoSymbol,     NoSymbol,
> ++/*    170   177 */      NoSymbol,     NoSymbol,
> ++/*    171   178 */      NoSymbol,     NoSymbol,
> ++/*    172   179 */      NoSymbol,     NoSymbol,
> ++/*    173   180 */      NoSymbol,     NoSymbol,
> ++/*    174   181 */      NoSymbol,     NoSymbol,
> ++/*    175   182 */      NoSymbol,     NoSymbol,
> ++/*    176   183 */      NoSymbol,     NoSymbol,
> ++/*    177   184 */      NoSymbol,     NoSymbol,
> ++/*    178   185 */      NoSymbol,     NoSymbol,
> ++/*    179   186 */      NoSymbol,     NoSymbol,
> ++/*    180   187 */      NoSymbol,     NoSymbol,
> ++/*    181   188 */      NoSymbol,     NoSymbol,
> ++/*    182   189 */      NoSymbol,     NoSymbol,
> ++/*    183   190 */      NoSymbol,     NoSymbol,
> ++/*    184   191 */      NoSymbol,     NoSymbol,
> ++/*    185   192 */      NoSymbol,     NoSymbol,
> ++/*    186   193 */      NoSymbol,     NoSymbol,
> ++/*    187   194 */      NoSymbol,     NoSymbol,
> ++/*    188   195 */      NoSymbol,     NoSymbol,
> ++/*    189   196 */      NoSymbol,     NoSymbol,
> ++/*    190   197 */      NoSymbol,     NoSymbol,
> ++/*    191   198 */      NoSymbol,     NoSymbol,
> ++/*    192   199 */      NoSymbol,     NoSymbol,
> ++/*    193   200 */      NoSymbol,     NoSymbol,
> ++/*    194   201 */      NoSymbol,     NoSymbol,
> ++};
> ++
> ++static void
> ++EvdevKbdRead (int fd, void *closure)
> ++{
> ++    int i, n;
> ++    struct input_event events[NUM_EVENTS];
> ++
> ++    n = read (fd,&events, NUM_EVENTS * sizeof (struct input_event));
> ++    if (n<= 0)
> ++      return;
> ++
> ++    n /= sizeof (struct input_event);
> ++
> ++    for (i = 0; i<  n; i++)
> ++    {
> ++        if (events[i].type == EV_KEY)
> ++      	    KdEnqueueKeyboardEvent (events[i].code, !events[i].value);
> ++    }
> ++}
> ++
> ++static void
> ++EvdevKbdLoad (void)
> ++{
> ++    kdMinScanCode = 0;
> ++    kdMaxScanCode = 193;
> ++    kdKeymapWidth = 2;
> ++    memcpy (kdKeymap, evdevKeymap, sizeof (evdevKeymap));
> ++}
> ++
> ++static int
> ++EvdevKbdInit (void)
> ++{
> ++    int fd, i;
> ++
> ++    if (!EvdevInputType)
> ++        EvdevInputType = KdAllocInputType ();
> ++
> ++    if (!kdKeyboard)
> ++    {
> ++        for (i = 0; i<  NUM_DEFAULT_EVDEV; i++)
> ++        {
> ++            fd = open (kdefaultEvdev[i], 2);
> ++            if (fd>= 0)
> ++            {
> ++                kdKeyboard = KdSaveString (kdefaultEvdev[i]);
> ++                break;
> ++            }
> ++	}
> ++    }
> ++    else
> ++    {
> ++        fd = open (kdKeyboard, O_RDWR);
> ++        if (fd<  0)
> ++            return FALSE;
> ++    }
> ++
> ++    if (ioctl (fd, EVIOCGRAB, 1)<  0)
> ++    {
> ++        close (fd);
> ++	return FALSE;
> ++    }
> ++
> ++    if (!KdRegisterFd (EvdevInputType, fd, EvdevKbdRead, NULL))
> ++        return FALSE;
> ++
> ++    kbd_fd = fd;
> ++    return TRUE;
> ++}
> ++
> ++static void
> ++EvdevKbdFini (void)
> ++{
> ++}
> ++
> ++static void
> ++EvdevKbdLeds (int leds)
> ++{
> ++    struct input_event event;
> ++
> ++    memset(&event, 0, sizeof(event));
> ++
> ++    event.type = EV_LED;
> ++    event.code = LED_CAPSL;
> ++    event.value = leds&  (1<<  0) ? 1 : 0;
> ++    write(kbd_fd, (char *)&event, sizeof(event));
> ++
> ++    event.type = EV_LED;
> ++    event.code = LED_NUML;
> ++    event.value = leds&  (1<<  1) ? 1 : 0;
> ++    write(kbd_fd, (char *)&event, sizeof(event));
> ++
> ++    event.type = EV_LED;
> ++    event.code = LED_SCROLLL;
> ++    event.value = leds&  (1<<  2) ? 1 : 0;
> ++    write(kbd_fd, (char *)&event, sizeof(event));
> ++
> ++    event.type = EV_LED;
> ++    event.code = LED_COMPOSE;
> ++    event.value = leds&  (1<<  3) ? 1 : 0;
> ++    write(kbd_fd, (char *)&event, sizeof(event));
> ++}
> ++
> ++static void
> ++EvdevKbdBell (int volume, int frequency, int duration)
> ++{
> ++}
> ++
> + KdKeyboardFuncs LinuxEvdevKeyboardFuncs = {
> +     EvdevKbdLoad,
> +     EvdevKbdInit,
> +@@ -296,4 +659,4 @@
> +     EvdevKbdFini,
> +     0,
> + };
> +-#endif
> ++
> +diff -u -r --exclude=CVS --exclude=Makefile --exclude='*.o' --exclude=ephyr --exclude='*.Po' xserver.original/hw/kdrive/src/kdrive.c xserver/hw/kdrive/src/kdrive.c
> +--- xserver.original/hw/kdrive/src/kdrive.c	2005-12-16 10:36:07.000000000 -0200
> ++++ xserver/hw/kdrive/src/kdrive.c	2005-12-16 10:37:09.000000000 -0200
> +@@ -73,6 +73,7 @@
> + Bool		    kdEnabled;
> + int		    kdSubpixelOrder;
> + int		    kdVirtualTerminal = -1;
> ++char		    *kdKeyboard = 0;
> + Bool		    kdSwitchPending;
> + char		    *kdSwitchCmd;
> + DDXPointRec	    kdOrigin;
> +@@ -795,6 +796,14 @@
> + 	    UseMsg ();
> + 	return 2;
> +     }
> ++    if (!strcmp (argv[i], "-keyboard"))
> ++    {
> ++	if ((i+1)<  argc)
> ++	    kdKeyboard = argv[i+1];
> ++	else
> ++	    UseMsg ();
> ++	return 2;
> ++    }
> +     if (!strcmp (argv[i], "-rgba"))
> +     {
> + 	if ((i+1)<  argc)
> +diff -u -r --exclude=CVS --exclude=Makefile --exclude='*.o' --exclude=ephyr --exclude='*.Po' xserver.original/hw/kdrive/src/kdrive.h xserver/hw/kdrive/src/kdrive.h
> +--- xserver.original/hw/kdrive/src/kdrive.h	2005-12-16 10:36:07.000000000 -0200
> ++++ xserver/hw/kdrive/src/kdrive.h	2005-12-16 10:37:09.000000000 -0200
> +@@ -416,6 +416,7 @@
> + extern Bool		kdDisableZaphod;
> + extern Bool		kdDontZap;
> + extern int		kdVirtualTerminal;
> ++extern char		*kdKeyboard;
> + extern char		*kdSwitchCmd;
> + extern KdOsFuncs	*kdOsFuncs;
> +
> +@@ -769,7 +770,7 @@
> + ProcessInputEvents (void);
> +
> + extern KdMouseFuncs	LinuxMouseFuncs;
> +-extern KdMouseFuncs	LinuxEvdevFuncs;
> ++extern KdMouseFuncs	LinuxEvdevMouseFuncs;
> + extern KdMouseFuncs	Ps2MouseFuncs;
> + extern KdMouseFuncs	BusMouseFuncs;
> + extern KdMouseFuncs	MsMouseFuncs;
> +@@ -777,6 +778,7 @@
> + extern KdMouseFuncs	TsFuncs;
> + #endif
> + extern KdKeyboardFuncs	LinuxKeyboardFuncs;
> ++extern KdKeyboardFuncs	LinuxEvdevKeyboardFuncs;
> + extern KdOsFuncs	LinuxFuncs;
> +
> + extern KdMouseFuncs	VxWorksMouseFuncs;
> +diff -u -r --exclude=CVS --exclude=Makefile --exclude='*.o' --exclude=ephyr --exclude='*.Po' xserver.original/hw/kdrive/src/kinput.c xserver/hw/kdrive/src/kinput.c
> +--- xserver.original/hw/kdrive/src/kinput.c	2005-12-16 10:36:07.000000000 -0200
> ++++ xserver/hw/kdrive/src/kinput.c	2005-12-16 10:37:09.000000000 -0200
> +@@ -1300,6 +1300,7 @@
> + 	    xE.u.u.type = KeyPress;
> + 	xE.u.u.detail = key_code;
> + 	
> ++#ifndef XKB
> + 	switch (KEYCOL1(key_code))
> + 	{
> + 	case XK_Num_Lock:
> +@@ -1313,6 +1314,7 @@
> + 	    else
> + 		xE.u.u.type = KeyPress;
> + 	}
> ++#endif
> + 	
> + 	/*
> + 	 * Check pressed keys which are already down
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/kdrive-use-evdev.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/kdrive-use-evdev.patch
> new file mode 100644
> index 0000000..8a480dc
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/kdrive-use-evdev.patch
> @@ -0,0 +1,58 @@
> +Upstream-Status: Pending
> +
> +Signed-off-by: Yu Ke<ke.yu@intel.com>
> +
> +--- xserver/hw/kdrive/fbdev/fbinit.c~	2006-01-31 17:09:33.000000000 +0100
> ++++ xserver/hw/kdrive/fbdev/fbinit.c	2006-01-31 17:11:55.000000000 +0100
> +@@ -28,6 +28,8 @@
> + #endif
> + #include<fbdev.h>
> +
> ++extern int use_evdev;
> ++
> + void
> + InitCard (char *name)
> + {
> +@@ -45,7 +47,10 @@
> + void
> + InitInput (int argc, char **argv)
> + {
> +-    KdInitInput (&LinuxMouseFuncs,&LinuxKeyboardFuncs);
> ++    if (use_evdev)
> ++        KdInitInput (&LinuxEvdevMouseFuncs,&LinuxEvdevKeyboardFuncs);
> ++    else
> ++        KdInitInput (&LinuxMouseFuncs,&LinuxKeyboardFuncs);
> + #ifdef TOUCHSCREEN
> +     KdAddMouseDriver (&TsFuncs);
> + #endif
> +--- xserver/hw/kdrive/src/kdrive.c.orig	2006-01-31 17:13:28.000000000 +0100
> ++++ xserver/hw/kdrive/src/kdrive.c	2006-01-31 17:15:28.000000000 +0100
> +@@ -44,6 +44,8 @@
> + #include "dpmsproc.h"
> + #endif
> +
> ++int use_evdev = 0;
> ++
> + typedef struct _kdDepths {
> +     CARD8   depth;
> +     CARD8   bpp;
> +@@ -687,6 +689,7 @@
> +     ErrorF("-videoTest       Start the server, pause momentarily and exit\n");
> +     ErrorF("-origin X,Y      Locates the next screen in the the virtual screen (Xinerama)\n");
> +     ErrorF("-mouse path[,n]  Filename of mouse device, n is number of buttons\n");
> ++    ErrorF("-use-evdev       Use Linux evdev input\n");
> +     ErrorF("-switchCmd       Command to execute on vt switch\n");
> +     ErrorF("-nozap           Don't terminate server on Ctrl+Alt+Backspace\n");
> +     ErrorF("vtxx             Use virtual terminal xx instead of the next available\n");
> +@@ -796,6 +799,11 @@
> + 	    UseMsg ();
> + 	return 2;
> +     }
> ++    if (!strcmp (argv[i], "-use-evdev"))
> ++    {
> ++	use_evdev = 1;
> ++	return 1;
> ++    }
> +     if (!strcmp (argv[i], "-keyboard"))
> +     {
> + 	if ((i+1)<  argc)
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/keyboard-resume-workaround.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/keyboard-resume-workaround.patch
> new file mode 100644
> index 0000000..bdf22ba
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/keyboard-resume-workaround.patch
> @@ -0,0 +1,26 @@
> +Upstream-Status: Pending
> +
> +Signed-off-by: Yu Ke<ke.yu@intel.com>
> +--- xorg-server-1.11.1.901/hw/kdrive/linux/keyboard.c	2011-10-24 16:44:10.000000000 +0800
> ++++ xorg-server-1.11.1.901/hw/kdrive/linux/keyboard.c.new	2011-10-24 16:41:27.000000000 +0800
> +@@ -486,6 +486,8 @@
> +     ki->minScanCode = minKeyCode;
> +     ki->maxScanCode = maxKeyCode;
> + #endif
> ++    ki->minScanCode = 0;
> ++    ki->maxScanCode = NR_KEYS;
> + }
> +
> + /*
> +@@ -707,11 +709,6 @@
> +     cfsetispeed(&nTty, 9600);
> +     cfsetospeed(&nTty, 9600);
> +     tcsetattr(fd, TCSANOW,&nTty);
> +-    /*
> +-     * Flush any pending keystrokes
> +-     */
> +-    while ((n = read (fd, buf, sizeof (buf)))>  0)
> +-	;
> +     KdRegisterFd (fd, LinuxKeyboardRead, ki);
> +     return Success;
> + }
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/no-serial-probing.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/no-serial-probing.patch
> new file mode 100644
> index 0000000..dbc2bf8
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/no-serial-probing.patch
> @@ -0,0 +1,16 @@
> +Upstream-Status: Pending
> +
> +Signed-off-by: Yu Ke<ke.yu@intel.com>
> +--- xorg-server-1.11.1.901/hw/kdrive/linux/mouse.c	2011-10-24 16:33:08.000000000 +0800
> ++++ xorg-server-1.11.1.901/hw/kdrive/linux/mouse.c.new	2011-10-24 16:23:23.000000000 +0800
> +@@ -924,8 +924,10 @@
> +     "/dev/mouse",
> +     "/dev/psaux",
> +     "/dev/adbmouse",
> ++#ifdef BREAK_MY_SERIAL_CONSOLE
> +     "/dev/ttyS0",
> +     "/dev/ttyS1",
> ++#endif
> + };
> +
> + #define NUM_DEFAULT_MOUSE    (sizeof (kdefaultMouse) / sizeof (kdefaultMouse[0]))
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/optional-xkb.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/optional-xkb.patch
> new file mode 100644
> index 0000000..af3c16c
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.11.2/optional-xkb.patch
> @@ -0,0 +1,62 @@
> +Upstream-Status: Pending
> +
> +Signed-off-by: Yu Ke<ke.yu@intel.com>
> +
> +Index: xorg-server-1.2.0/Makefile.am
> +===================================================================
> +--- xorg-server-1.2.0.orig/Makefile.am	2007-01-23 06:39:15.000000000 +0100
> ++++ xorg-server-1.2.0/Makefile.am	2007-03-28 20:26:19.000000000 +0200
> +@@ -30,6 +30,10 @@
> + XINPUT_DIR=Xi
> + endif
> +
> ++if XKB
> ++XKB_DIR=xkb
> ++endif
> ++
> + if DBE
> + DBE_DIR=dbe
> + endif
> +@@ -46,7 +50,7 @@
> + 	randr \
> + 	render  \
> + 	$(XINPUT_DIR) \
> +-	xkb \
> ++	$(XKB_DIR) \
> + 	$(DBE_DIR) \
> + 	$(MFB_DIR) \
> + 	$(AFB_DIR) \
> +Index: xorg-server-1.2.0/configure.ac
> +===================================================================
> +--- xorg-server-1.2.0.orig/configure.ac	2007-01-23 06:39:15.000000000 +0100
> ++++ xorg-server-1.2.0/configure.ac	2007-03-28 20:27:13.000000000 +0200
> +@@ -428,6 +428,7 @@
> + AC_ARG_ENABLE(dpms,           AS_HELP_STRING([--disable-dpms], [Build DPMS extension (default: enabled)]), [DPMSExtension=$enableval], [DPMSExtension=yes])
> + AC_ARG_ENABLE(xinput,         AS_HELP_STRING([--disable-xinput], [Build XInput Extension (default: enabled)]), [XINPUT=$enableval], [XINPUT=yes])
> + AC_ARG_ENABLE(xfree86-utils,     AS_HELP_STRING([--enable-xfree86-utils], [Build xfree86 DDX utilities (default: enabled)]), [XF86UTILS=$enableval], [XF86UTILS=yes])
> ++AC_ARG_ENABLE(xkb,            AS_HELP_STRING([--disable-xkb], [Build XKB (default: enabled)]), [XKB=$enableval], [XKB=yes])
> +
> + dnl DDXes.
> + AC_ARG_ENABLE(xorg,    	      AS_HELP_STRING([--enable-xorg], [Build Xorg server (default: auto)]), [XORG=$enableval], [XORG=auto])
> +@@ -754,12 +755,15 @@
> +
> + AC_DEFINE(SHAPE, 1, [Support SHAPE extension])
> +
> +-AC_DEFINE(XKB, 1, [Build XKB])
> +-AC_DEFINE(XKB_IN_SERVER, 1, [Build XKB server])
> +-AC_DEFINE(XKB_DFLT_DISABLED, 0, [Disable XKB per default])
> +-REQUIRED_MODULES="$REQUIRED_MODULES xkbfile"
> +-XKB_LIB='$(top_builddir)/xkb/libxkb.la'
> +-XKB_STUB_LIB='$(top_builddir)/xkb/libxkbstubs.la'
> ++AM_CONDITIONAL(XKB, [test "x$XKB" = xyes])
> ++if test "x$XKB" = xyes; then
> ++	AC_DEFINE(XKB, 1, [Build XKB])
> ++	AC_DEFINE(XKB_IN_SERVER, 1, [Build XKB server])
> ++	AC_DEFINE(XKB_DFLT_DISABLED, 0, [Disable XKB per default])
> ++	REQUIRED_MODULES="$REQUIRED_MODULES xkbfile"
> ++	XKB_LIB='$(top_builddir)/xkb/libxkb.la'
> ++	XKB_STUB_LIB='$(top_builddir)/xkb/libxkbstubs.la'
> ++fi
> +
> + AC_CHECK_FUNC(strcasecmp, [], AC_DEFINE([NEED_STRCASECMP], 1,
> +                                         [Do not have `strcasecmp'.]))
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.11.2.bb b/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.11.2.bb
> new file mode 100644
> index 0000000..b4e2d0c
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.11.2.bb
> @@ -0,0 +1,35 @@
> +require xserver-kdrive.inc
> +
> +DEPENDS += "libxkbfile libxcalibrate font-util pixman"
> +
> +RDEPENDS_${PN} += "xkeyboard-config"
> +
> +EXTRA_OECONF += "--disable-glx --enable-unit-tests=no  --enable-kdrive-kbd=yes --enable-kdrive-evdev=yes --enable-config-udev=yes"
> +
> +PE = "1"
> +PR = "r0"
> +
> +LIC_FILES_CHKSUM  = "file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"
> +
> +SRC_URI = "${XORG_MIRROR}/individual/xserver/xorg-server-${PV}.tar.bz2 \
> +          file://extra-kmodes.patch \
> +          file://disable-apm.patch \
> +	  file://no-serial-probing.patch \
> +	  file://keyboard-resume-workaround.patch \
> +	  file://hide-cursor-and-ppm-root.patch \
> +	  file://fbdev_xrandr_ioctl.patch \
> +	  file://fix-newer-xorg-headers.patch"
> +							
> +#file://keyboard-resume-workaround.patch
> +#file://enable-xcalibrate.patch
> +#file://crosscompile.patch
> +#file://nodolt.patch
> +#file://kdrive-evdev.patch
> +#file://kdrive-use-evdev.patch
> +#file://enable-builtin-fonts.patch
> +#file://optional-xkb.patch
> +
> +SRC_URI[md5sum] = "8796fff441e5435ee36a72579008af24"
> +SRC_URI[sha256sum] = "fa415decf02027ca278b06254ccfbcceba2a83c2741405257ebf749da4a73cf2"
> +
> +S = "${WORKDIR}/xorg-server-${PV}"


