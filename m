Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joelagnel@ti.com>) id 1QwkYb-00042P-3j
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 02:46:02 +0200
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id p7Q0fEYX004220
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2011 19:41:14 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep33.itg.ti.com (8.13.7/8.13.8) with ESMTP id p7Q0fE8g009729
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2011 19:41:14 -0500 (CDT)
Received: from DFLE70.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p7Q0fEVg005922
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2011 19:41:14 -0500 (CDT)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle70.ent.ti.com
	(128.247.5.40) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 25 Aug 2011 19:41:14 -0500
Received: from localhost.localdomain (chase-ubuntu.am.dhcp.ti.com
	[128.247.105.25])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	p7Q0fDFC012117;	Thu, 25 Aug 2011 19:41:14 -0500
From: Joel A Fernandes <joelagnel@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Aug 2011 19:32:22 -0500
Message-ID: <1314318742-9599-1-git-send-email-joelagnel@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [RFC meta-oe] mplayer: Imported from OE classic
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
X-List-Received-Date: Fri, 26 Aug 2011 00:46:02 -0000
Content-Type: text/plain

* Using only the svn recipe
* unified all mplayer patches into a "files/" directory
* Unified mplayer-common recipe with mplayer
* Corrected STAGING_DIR_KERNEL to point to correct location for kernel headers

Still get a build error,
| /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux/usr/libexec/armv7a-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.5.4/ld: : invalid DSO for symbol `XShmQueryExtension' definition
| /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/lib/libXext.so.6: could not read symbols: Bad value
| collect2: ld returned 1 exit status
| make: *** [mplayer] Error 1
| + die 'oe_runmake failed'
| + bbfatal 'oe_runmake failed'
| + echo 'ERROR: oe_runmake failed'
| ERROR: oe_runmake failed
| + exit 1
| ERROR: Function 'do_compile' failed (see /home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/mplayer-0.0+1.0rc3+svnr32735-r29/temp/log.do_compile.26579 for further information)
NOTE: package mplayer-0.0+1.0rc3+svnr32735-r29: task do_compile: Failed

Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
---
 ...peg-VP8-encode-decode-patches-using-libvp.patch |   45 ++
 .../mplayer/files/0001-omapfb.patch                |  823 ++++++++++++++++++++
 .../mplayer/files/codecs_conf-VP8.diff             |   19 +
 .../mplayer/files/configure-libvpx_test.diff       |   72 ++
 .../files/demux_mkv-V_VP8__webm_doctype.diff       |   33 +
 .../mplayer/files/fix-addrinfo.patch               |  101 +++
 .../mplayer/files/fix-avconfig.diff                |   50 ++
 .../mplayer/files/fix-emu_qtx_api.diff             |   33 +
 .../recipes-multimedia/mplayer/files/fix-exp.diff  |   38 +
 .../mplayer/files/makefile-nostrip-svn.patch       |   11 +
 .../mplayer/files/mplayer-arm-pld.patch            |   18 +
 .../mplayer/files/mplayer-lavc-arm.patch           |   17 +
 .../recipes-multimedia/mplayer/files/offset.patch  |   11 +
 .../recipes-multimedia/mplayer/files/omapfb.patch  |   29 +
 .../recipes-multimedia/mplayer/files/vo_omapfb.c   |  591 ++++++++++++++
 .../mplayer/files/vofw-swscale.diff                |   16 +
 meta-oe/recipes-multimedia/mplayer/files/yuv.S     |  170 ++++
 ...peg-VP8-encode-decode-patches-using-libvp.patch |   45 ++
 .../mplayer/mplayer/0001-omapfb.patch              |  823 ++++++++++++++++++++
 .../0001-video-out-for-omapfb-support.patch        |  823 ++++++++++++++++++++
 .../mplayer/mplayer/codecs_conf-VP8.diff           |   19 +
 .../mplayer/mplayer/configure-libvpx_test.diff     |   72 ++
 .../mplayer/demux_mkv-V_VP8__webm_doctype.diff     |   33 +
 .../mplayer/mplayer/mplayer.conf                   |   15 +
 .../mplayer/mplayer/offset.patch                   |   11 +
 .../mplayer/mplayer/vofw-swscale.diff              |   16 +
 meta-oe/recipes-multimedia/mplayer/mplayer_svn.bb  |  250 ++++++
 27 files changed, 4184 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/mplayer/files/0001-MPlayer-FFmpeg-VP8-encode-decode-patches-using-libvp.patch
 create mode 100644 meta-oe/recipes-multimedia/mplayer/files/0001-omapfb.patch
 create mode 100644 meta-oe/recipes-multimedia/mplayer/files/codecs_conf-VP8.diff
 create mode 100644 meta-oe/recipes-multimedia/mplayer/files/configure-libvpx_test.diff
 create mode 100644 meta-oe/recipes-multimedia/mplayer/files/demux_mkv-V_VP8__webm_doctype.diff
 create mode 100644 meta-oe/recipes-multimedia/mplayer/files/fix-addrinfo.patch
 create mode 100644 meta-oe/recipes-multimedia/mplayer/files/fix-avconfig.diff
 create mode 100644 meta-oe/recipes-multimedia/mplayer/files/fix-emu_qtx_api.diff
 create mode 100644 meta-oe/recipes-multimedia/mplayer/files/fix-exp.diff
 create mode 100644 meta-oe/recipes-multimedia/mplayer/files/makefile-nostrip-svn.patch
 create mode 100644 meta-oe/recipes-multimedia/mplayer/files/mplayer-arm-pld.patch
 create mode 100644 meta-oe/recipes-multimedia/mplayer/files/mplayer-lavc-arm.patch
 create mode 100644 meta-oe/recipes-multimedia/mplayer/files/offset.patch
 create mode 100644 meta-oe/recipes-multimedia/mplayer/files/omapfb.patch
 create mode 100644 meta-oe/recipes-multimedia/mplayer/files/vo_omapfb.c
 create mode 100644 meta-oe/recipes-multimedia/mplayer/files/vofw-swscale.diff
 create mode 100644 meta-oe/recipes-multimedia/mplayer/files/yuv.S
 create mode 100644 meta-oe/recipes-multimedia/mplayer/mplayer/0001-MPlayer-FFmpeg-VP8-encode-decode-patches-using-libvp.patch
 create mode 100644 meta-oe/recipes-multimedia/mplayer/mplayer/0001-omapfb.patch
 create mode 100644 meta-oe/recipes-multimedia/mplayer/mplayer/0001-video-out-for-omapfb-support.patch
 create mode 100644 meta-oe/recipes-multimedia/mplayer/mplayer/codecs_conf-VP8.diff
 create mode 100644 meta-oe/recipes-multimedia/mplayer/mplayer/configure-libvpx_test.diff
 create mode 100644 meta-oe/recipes-multimedia/mplayer/mplayer/demux_mkv-V_VP8__webm_doctype.diff
 create mode 100644 meta-oe/recipes-multimedia/mplayer/mplayer/mplayer.conf
 create mode 100644 meta-oe/recipes-multimedia/mplayer/mplayer/offset.patch
 create mode 100644 meta-oe/recipes-multimedia/mplayer/mplayer/vofw-swscale.diff
 create mode 100644 meta-oe/recipes-multimedia/mplayer/mplayer_svn.bb

diff --git a/meta-oe/recipes-multimedia/mplayer/files/0001-MPlayer-FFmpeg-VP8-encode-decode-patches-using-libvp.patch b/meta-oe/recipes-multimedia/mplayer/files/0001-MPlayer-FFmpeg-VP8-encode-decode-patches-using-libvp.patch
new file mode 100644
index 0000000..89c4f4e
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/files/0001-MPlayer-FFmpeg-VP8-encode-decode-patches-using-libvp.patch
@@ -0,0 +1,45 @@
+From e01313b9d1aef66ba63e1e10dc8b6c069e935eb0 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Thu, 30 Dec 2010 10:13:23 +0100
+Subject: [PATCH] MPlayer/FFmpeg VP8 encode/decode patches - using libvpx.git@6cd4a10 or later (includes 0.9.1 and onward)
+
+---
+ libmpcodecs/ve_lavc.c |    8 +++++---
+ 1 files changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/libmpcodecs/ve_lavc.c b/libmpcodecs/ve_lavc.c
+index 139396c..35206d9 100644
+--- a/libmpcodecs/ve_lavc.c
++++ b/libmpcodecs/ve_lavc.c
+@@ -826,6 +826,9 @@ static int encode_frame(struct vf_instance *vf, AVFrame *pic, double pts){
+     assert(MP_NOPTS_VALUE == AV_NOPTS_VALUE);
+ #endif
+ //fprintf(stderr, "ve_lavc %f/%f\n", dts, pts);
++    /* store stats if there are any */
++    if(lavc_venc_context->stats_out && stats_file)
++        fprintf(stats_file, "%s", lavc_venc_context->stats_out);
+     if(out_size == 0 && lavc_param_skip_threshold==0 && lavc_param_skip_factor==0){
+         ++mux_v->encoder_delay;
+         return 0;
+@@ -887,9 +890,6 @@ static int encode_frame(struct vf_instance *vf, AVFrame *pic, double pts){
+             pict_type_char[lavc_venc_context->coded_frame->pict_type]
+             );
+     }
+-    /* store stats if there are any */
+-    if(lavc_venc_context->stats_out && stats_file)
+-        fprintf(stats_file, "%s", lavc_venc_context->stats_out);
+     return out_size;
+ }
+ 
+@@ -1022,6 +1022,8 @@ static int vf_open(vf_instance_t *vf, char* args){
+ 	mux_v->bih->biCompression = mmioFOURCC('d', 'r', 'a', 'c');
+     else if (!strcasecmp(lavc_param_vcodec, "libdirac"))
+ 	mux_v->bih->biCompression = mmioFOURCC('d', 'r', 'a', 'c');
++    else if (!strcasecmp(lavc_param_vcodec, "libvpx"))
++	mux_v->bih->biCompression = mmioFOURCC('V', 'P', '8', '0');
+     else
+ 	mux_v->bih->biCompression = mmioFOURCC(lavc_param_vcodec[0],
+ 		lavc_param_vcodec[1], lavc_param_vcodec[2], lavc_param_vcodec[3]); /* FIXME!!! */
+-- 
+1.6.6.1
+
diff --git a/meta-oe/recipes-multimedia/mplayer/files/0001-omapfb.patch b/meta-oe/recipes-multimedia/mplayer/files/0001-omapfb.patch
new file mode 100644
index 0000000..93ecce2
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/files/0001-omapfb.patch
@@ -0,0 +1,823 @@
+From a080f024fcb8a79fc5d93b6dafeaba4fa4b989a6 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Thu, 25 Nov 2010 16:49:53 +0100
+Subject: [PATCH] video out for omapfb support
+
+---
+ Makefile          |    2 +-
+ libvo/video_out.c |    2 +
+ libvo/vo_omapfb.c |  591 +++++++++++++++++++++++++++++++++++++++++++++++++++++
+ libvo/yuv.S       |  170 +++++++++++++++
+ 4 files changed, 764 insertions(+), 1 deletions(-)
+ create mode 100644 libvo/vo_omapfb.c
+ create mode 100644 libvo/yuv.S
+
+diff --git a/Makefile b/Makefile
+index 5108b97..19edfd9 100644
+--- a/Makefile
++++ b/Makefile
+@@ -545,7 +545,7 @@ SRCS_MPLAYER-$(DIRECTX)      += libao2/ao_dsound.c libvo/vo_directx.c
+ SRCS_MPLAYER-$(DXR2)         += libao2/ao_dxr2.c libvo/vo_dxr2.c
+ SRCS_MPLAYER-$(DXR3)         += libvo/vo_dxr3.c
+ SRCS_MPLAYER-$(ESD)          += libao2/ao_esd.c
+-SRCS_MPLAYER-$(FBDEV)        += libvo/vo_fbdev.c libvo/vo_fbdev2.c
++SRCS_MPLAYER-$(FBDEV)        += libvo/vo_fbdev.c libvo/vo_fbdev2.c libvo/vo_omapfb.c libvo/yuv.S
+ SRCS_MPLAYER-$(FFMPEG)       += libvo/vo_png.c
+ SRCS_MPLAYER-$(GGI)          += libvo/vo_ggi.c
+ SRCS_MPLAYER-$(GIF)          += libvo/vo_gif89a.c
+diff --git a/libvo/video_out.c b/libvo/video_out.c
+index 83f2a24..5f4c1ac 100644
+--- a/libvo/video_out.c
++++ b/libvo/video_out.c
+@@ -111,6 +111,7 @@ extern const vo_functions_t video_out_zr;
+ extern const vo_functions_t video_out_zr2;
+ extern const vo_functions_t video_out_bl;
+ extern const vo_functions_t video_out_fbdev2;
++extern const vo_functions_t video_out_omapfb;
+ extern const vo_functions_t video_out_png;
+ extern const vo_functions_t video_out_ggi;
+ extern const vo_functions_t video_out_aa;
+@@ -216,6 +217,7 @@ const vo_functions_t* const video_out_drivers[] =
+ #ifdef CONFIG_FBDEV
+         &video_out_fbdev,
+         &video_out_fbdev2,
++		&video_out_omapfb,
+ #endif
+ #ifdef CONFIG_SVGALIB
+         &video_out_svga,
+diff --git a/libvo/vo_omapfb.c b/libvo/vo_omapfb.c
+new file mode 100644
+index 0000000..b26ee3a
+--- /dev/null
++++ b/libvo/vo_omapfb.c
+@@ -0,0 +1,591 @@
++/*
++ 
++Copyright (C) 2008 Gregoire Gentil <gregoire@gentil.com>
++Portions Copyright (C) 2009 Howard Chu <hyc@symas.com>
++This file adds an optimized vo output to mplayer for the OMAP platform. This is a first pass and an attempt to help to improve
++media playing on the OMAP platform. The usual disclaimer comes here: this code is provided without any warranty.
++Many bugs and issues still exist. Feed-back is welcome.
++
++This output uses the yuv420_to_yuv422 conversion from Mans Rullgard, and is heavily inspired from the work of Siarhei Siamashka.
++I would like to thank those two persons here, without them this code would certainly not exist.
++
++Two options of the output are available:
++fb_overlay_only (disabled by default): only the overlay is drawn. X11 stuff is ignored.
++dbl_buffer (disabled by default): add double buffering. Some tearsync flags are probably missing in the code.
++
++Syntax is the following:
++mplayer -ao alsa -vo omapfb /test.avi
++mplayer -nosound -vo omapfb:fb_overlay_only:dbl_buffer /test.avi
++
++You need to have two planes on your system. On beagleboard, it means something like: video=omapfb:vram:2M,vram:4M
++
++Known issues:
++1) A green line or some vertical lines (if mplayer decides to draw bands instead of frame) may appear.
++It's an interpolation bug in the color conversion that needs to be fixed
++
++2) The color conversion accepts only 16-pixel multiple for width and height.
++
++3) The scaling down is disabled as the scaling down kernel patch for the OMAP3 platform doesn't seem to work yet.
++
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 2 of the License, or
++ * (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
++*/
++ 
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++#include <fcntl.h>
++#include <unistd.h>
++#include <errno.h>
++
++#include <sys/mman.h>
++#include <sys/ioctl.h>
++#include <linux/fb.h>
++
++#include "config.h"
++#include "video_out.h"
++#include "video_out_internal.h"
++#include "fastmemcpy.h"
++#include "sub/sub.h"
++#include "mp_msg.h"
++#include "omapfb.h"
++#include "x11_common.h"
++
++#include "libswscale/swscale.h"
++#include "libmpcodecs/vf_scale.h"
++#include "libavcodec/avcodec.h"
++
++#include "aspect.h"
++
++#include "subopt-helper.h"
++
++#include <X11/Xlib.h>
++#include <X11/Xutil.h>
++#include <X11/Xatom.h>
++#include "wskeys.h"
++
++static vo_info_t info = {
++	"omapfb video driver",
++	"omapfb",
++	"",
++	""
++};
++
++LIBVO_EXTERN(omapfb)
++
++static int fb_overlay_only = 0; // if set, we need only framebuffer overlay, but do not need any x11 code
++static int dbl_buffer = 0;
++static int fullscreen_flag = 0;
++static int plane_ready = 0;
++static uint32_t drwX, drwY;
++
++extern void yuv420_to_yuv422(uint8_t *yuv, uint8_t *y, uint8_t *u, uint8_t *v, int w, int h, int yw, int cw, int dw);
++static struct fb_var_screeninfo sinfo_p0;
++static struct fb_var_screeninfo sinfo;
++static struct fb_var_screeninfo sinfo2;
++static struct fb_fix_screeninfo finfo;
++static struct omapfb_mem_info minfo;
++static struct omapfb_plane_info pinfo;
++static int xoff, yoff;
++
++static struct {
++    unsigned x;
++    unsigned y;
++    uint8_t *buf;
++} fb_pages[2];
++static int dev_fd = -1;
++static int fb_page_flip = 0;
++static int page = 0;
++static void omapfb_update(int x, int y, int out_w, int out_h, int show);
++
++extern void mplayer_put_key( int code );
++#include "osdep/keycodes.h"
++
++#define TRANSPARENT_COLOR_KEY 0xff0
++
++static Display *display = NULL; // pointer to X Display structure.
++static int screen_num; // number of screen to place the window on.
++static Window win = 0;
++static Window parent = 0; // pointer to the newly created window.
++
++/* This is used to intercept window closing requests.  */
++static Atom wm_delete_window;
++
++
++void vo_calc_drwXY(uint32_t *drwX, uint32_t *drwY)
++{
++    *drwX = *drwY = 0;
++    if (vo_fs) {
++        aspect(&vo_dwidth, &vo_dheight, A_ZOOM);
++        vo_dwidth  = FFMIN(vo_dwidth, vo_screenwidth);
++        vo_dheight = FFMIN(vo_dheight, vo_screenheight);
++        *drwX      = (vo_screenwidth - vo_dwidth) / 2;
++        *drwY      = (vo_screenheight - vo_dheight) / 2;
++        mp_msg(MSGT_VO, MSGL_V, "[vo-fs] dx: %d dy: %d dw: %d dh: %d\n",
++               *drwX, *drwY, vo_dwidth, vo_dheight);
++    } else if (WinID == 0) {
++        *drwX = vo_dx;
++        *drwY = vo_dy;
++    }
++}
++
++static void getPrimaryPlaneInfo()
++{
++    int dev_fd = open("/dev/fb0", O_RDWR);
++
++    if (dev_fd == -1) {
++        mp_msg(MSGT_VO, MSGL_FATAL, "[omapfb] Error /dev/fb0\n");
++        return -1;
++    }
++
++    ioctl(dev_fd, FBIOGET_VSCREENINFO, &sinfo_p0);
++    close(dev_fd);
++}
++
++/**
++ * Function to get the offset to be used when in windowed mode
++ * or when using -wid option
++ */
++static void x11_get_window_abs_position(Display *display, Window window,
++                                             int *wx, int *wy, int *ww, int *wh)
++{
++    Window root, parent;
++    Window *child;
++    unsigned int n_children;
++    XWindowAttributes attribs;
++
++    /* Get window attributes */
++    XGetWindowAttributes(display, window, &attribs);
++
++    /* Get relative position of given window */
++    *wx = attribs.x;
++    *wy = attribs.y;
++    if (ww)
++        *ww = attribs.width;
++    if (wh)
++        *wh = attribs.height;
++
++    /* Query window tree information */
++    XQueryTree(display, window, &root, &parent, &child, &n_children);
++    if (parent)
++    {
++      int x, y;
++      /* If we have a parent we must go there and discover his position*/
++      x11_get_window_abs_position(display, parent, &x, &y, NULL, NULL);
++      *wx += x;
++      *wy += y;
++    }
++
++    /* If we had children, free it */
++    if(n_children)
++        XFree(child);
++}
++
++static void x11_check_events(void)
++{
++    int e = vo_x11_check_events(mDisplay);
++
++    if (e & VO_EVENT_RESIZE)
++        vo_calc_drwXY(&drwX, &drwY);
++
++    if (e & VO_EVENT_EXPOSE || e & VO_EVENT_RESIZE)
++    {
++        vo_xv_draw_colorkey(drwX, drwY, vo_dwidth - 1, vo_dheight - 1);
++        omapfb_update(0, 0, 0, 0, 1);
++    }
++}
++
++static void x11_uninit()
++{
++    if (display) {
++        XCloseDisplay(display);
++        display = NULL;
++    }
++}
++
++/**
++ * Initialize framebuffer
++ */
++static int preinit(const char *arg)
++{
++    opt_t subopts[] = {
++        {"fb_overlay_only", OPT_ARG_BOOL, &fb_overlay_only, NULL},
++        {"dbl_buffer", OPT_ARG_BOOL, &dbl_buffer, NULL},
++        {NULL}
++    };
++
++    if (subopt_parse(arg, subopts) != 0) {
++        mp_msg(MSGT_VO, MSGL_FATAL, "[omapfb] unknown suboptions: %s\n", arg);
++        return -1;
++    }
++
++    getPrimaryPlaneInfo();
++    dev_fd = open("/dev/fb1", O_RDWR);
++
++    if (dev_fd == -1) {
++        mp_msg(MSGT_VO, MSGL_FATAL, "[omapfb] Error /dev/fb1\n");
++        return -1;
++    }
++
++    ioctl(dev_fd, FBIOGET_VSCREENINFO, &sinfo);
++    ioctl(dev_fd, OMAPFB_QUERY_PLANE, &pinfo);
++    ioctl(dev_fd, OMAPFB_QUERY_MEM, &minfo);
++
++    if (!fb_overlay_only && !vo_init())
++    {
++        mp_msg(MSGT_VO, MSGL_FATAL, "[omapfb] Could not open X, overlay only...\n");        
++        fb_overlay_only = 1;
++    }
++
++    return 0;
++}
++
++static void omapfb_update(int x, int y, int out_w, int out_h, int show)
++{
++    int xres, yres;
++    if (!fb_overlay_only)
++        x11_get_window_abs_position(mDisplay, vo_window, &x, &y, &out_w, &out_h);
++
++    /* Check for new screen rotation */
++    ioctl(dev_fd, FBIOGET_VSCREENINFO, &sinfo2);
++    if (sinfo2.rotate != sinfo_p0.rotate)
++        getPrimaryPlaneInfo();
++
++    if ( (!x && !y && !out_w && !out_h) ||
++        (out_w < sinfo.xres_virtual / 4) || (out_h < sinfo.yres_virtual / 4) ||  /* HW can't scale down by more than 4x */
++        (out_w > sinfo.xres_virtual * 8) || (out_h > sinfo.yres_virtual * 8) ) { /* HW can't scale up by more than 8x */
++        pinfo.enabled = 0;
++        pinfo.pos_x = 0;
++        pinfo.pos_y = 0;
++        ioctl(dev_fd, OMAPFB_SETUP_PLANE, &pinfo);
++        return;
++    }
++
++    xres = sinfo.xres_virtual;
++    yres = sinfo.yres_virtual;
++
++    /* Handle clipping: if the left or top edge of the window goes
++     * offscreen, clamp the overlay to the left or top edge of the
++     * screen, and set the difference into the frame offset. Also
++     * decrease the overlay size by the offset. The offset must
++     * take window scaling into account as well.
++     *
++     * Likewise, if the right or bottom edge of the window goes
++     * offscreen, clamp the overlay to the right or bottom edge of
++     * the screen, and decrease the overlay size accordingly. The
++     * hardware will truncate the output accordingly, so no offset
++     * is needed. Also take window scaling into account.  -- hyc
++     */
++    if (x < 0) {
++        /* clamp to left edge */
++        xoff = -x;
++        if (out_w != sinfo.xres_virtual) {
++            /* account for scaling */
++            xoff *= sinfo.xres_virtual;
++            xoff /= out_w;
++        }
++        xres -= xoff;
++        out_w += x;
++        x = 0;
++    } else {
++        xoff = 0;
++        if (x + out_w > sinfo_p0.xres) {
++            /* clamp to right edge */
++            int diff = sinfo_p0.xres - x;
++            if (out_w != sinfo.xres_virtual) {
++                /* account for scaling */
++                xres = diff * sinfo.xres_virtual;
++                xres /= out_w;
++            } else {
++                xres = diff;
++            }
++            out_w = diff;
++        }
++    }
++
++    if (y < 0) {
++        /* clamp to top edge - this seldom occurs since the window
++         * titlebar is usually forced to stay visible
++         */
++        yoff = -y;
++        if (out_h != sinfo.yres_virtual) {
++            /* account for scaling */
++            yoff *= sinfo.yres_virtual;
++            yoff /= out_h;
++        }
++        yres -= yoff;
++        out_h += y;
++        y = 0;
++    } else {
++        yoff = 0;
++        if (y + out_h > sinfo_p0.yres) {
++            /* clamp to bottom edge */
++            int diff = sinfo_p0.yres - y;
++            if (out_h != sinfo.yres_virtual) {
++                /* account for scaling */
++                yres = diff * sinfo.yres_virtual;
++                yres /= out_h;
++            } else {
++                yres = diff;
++            }
++            out_h = diff;
++        }
++    }
++
++    if (xoff & 1)
++        xoff++;
++    if (xres & 1)
++        xres--;
++
++    pinfo.enabled = show;
++    pinfo.pos_x = x;
++    pinfo.pos_y = y;
++    pinfo.out_width  = out_w;
++    pinfo.out_height = out_h;
++
++    sinfo.xoffset = fb_pages[page].x + xoff;
++    sinfo.yoffset = fb_pages[page].y + yoff;
++    /* If we had to change the overlay dimensions, update it */
++    if (xres != sinfo2.xres || yres != sinfo2.yres ||
++        sinfo.xoffset != sinfo2.xoffset ||
++        sinfo.yoffset != sinfo2.yoffset) {
++        sinfo.xres = xres;
++        sinfo.yres = yres;
++        sinfo.rotate = sinfo2.rotate;
++        ioctl(dev_fd, FBIOPUT_VSCREENINFO, &sinfo);
++    }
++
++    ioctl(dev_fd, OMAPFB_SETUP_PLANE, &pinfo);
++}
++
++static int config(uint32_t width, uint32_t height, uint32_t d_width,
++		uint32_t d_height, uint32_t flags, char *title,
++		uint32_t format)
++{
++    uint8_t *fbmem;
++    int i;
++    struct omapfb_color_key color_key;
++
++    XVisualInfo vinfo;
++    XSetWindowAttributes xswa;
++    XWindowAttributes attribs;
++    unsigned long xswamask;
++    int depth;
++
++    Window root, parent;
++    Window *child;
++    unsigned int n_children;
++
++    fullscreen_flag = flags & VOFLAG_FULLSCREEN;
++    if (!fb_overlay_only)
++    {
++        if (!title)
++            title = "MPlayer OMAPFB (X11/FB) render";
++
++        XGetWindowAttributes(mDisplay, mRootWin, &attribs);
++        depth = attribs.depth;
++        if (depth != 15 && depth != 16 && depth != 24 && depth != 32)
++            depth = 24;
++        XMatchVisualInfo(mDisplay, mScreen, depth, TrueColor, &vinfo);
++
++        xswa.border_pixel = 0;
++        xswa.background_pixel = xv_colorkey = TRANSPARENT_COLOR_KEY;
++
++        xswamask = CWBackPixel | CWBorderPixel;
++        xv_ck_info.method = CK_METHOD_BACKGROUND;
++
++        vo_x11_create_vo_window(&vinfo, vo_dx, vo_dy, vo_dwidth, vo_dheight,
++                                flags, CopyFromParent, "omapfb", title);
++        XChangeWindowAttributes(mDisplay, vo_window, xswamask, &xswa);
++
++        /* Need to receive events on the parent window -- so when it is
++           moved / resized / etc., we know. */
++        if(WinID > 0)
++        {
++            /* Query window tree information */
++            XQueryTree(mDisplay, vo_window, &root, &parent, &child, &n_children);
++            if (n_children)
++                XFree(child);
++
++            XUnmapWindow(mDisplay, vo_window);
++            if (parent)
++                XSelectInput(mDisplay, parent, StructureNotifyMask);
++            XMapWindow(mDisplay, vo_window);
++        }
++
++        vo_calc_drwXY(&drwX, &drwY);
++        vo_xv_draw_colorkey(drwX, drwY, vo_dwidth - 1, vo_dheight - 1);
++    }
++
++    fbmem = mmap(NULL, minfo.size, PROT_READ|PROT_WRITE, MAP_SHARED, dev_fd, 0);
++    if (fbmem == MAP_FAILED) {
++        mp_msg(MSGT_VO, MSGL_FATAL, "[omapfb] Error mmap\n");
++        return -1;
++    }
++
++    for (i = 0; i < minfo.size / 4; i++)
++        ((uint32_t*)fbmem)[i] = 0x80008000;
++
++    sinfo.xres = width & ~15;
++    sinfo.yres = height & ~15;
++    sinfo.xoffset = 0;
++    sinfo.yoffset = 0;
++    sinfo.nonstd = OMAPFB_COLOR_YUY422;
++
++    fb_pages[0].x = 0;
++    fb_pages[0].y = 0;
++    fb_pages[0].buf = fbmem;
++
++    if (dbl_buffer && minfo.size >= sinfo.xres * sinfo.yres * 2) {
++        sinfo.xres_virtual = sinfo.xres;
++        sinfo.yres_virtual = sinfo.yres * 2;
++        fb_pages[1].x = 0;
++        fb_pages[1].y = sinfo.yres;
++        fb_pages[1].buf = fbmem + sinfo.xres * sinfo.yres * 2;
++        fb_page_flip = 1;
++    } else {
++        sinfo.xres_virtual = sinfo.xres;
++        sinfo.yres_virtual = sinfo.yres;
++        fb_page_flip = 0;
++    }
++
++    ioctl(dev_fd, FBIOPUT_VSCREENINFO, &sinfo);
++    ioctl(dev_fd, FBIOGET_FSCREENINFO, &finfo);
++
++    if (WinID <= 0) {
++        if (fullscreen_flag) {
++            omapfb_update(0, 0, sinfo_p0.xres, sinfo_p0.yres, 1);
++        } else {
++            omapfb_update(sinfo_p0.xres / 2 - sinfo.xres / 2, sinfo_p0.yres / 2 - sinfo.yres / 2, sinfo.xres, sinfo.yres, 1);
++        }
++    }
++
++    color_key.channel_out = OMAPFB_CHANNEL_OUT_LCD;
++    color_key.background = 0x0;
++    color_key.trans_key = TRANSPARENT_COLOR_KEY;
++    if (fb_overlay_only)
++        color_key.key_type = OMAPFB_COLOR_KEY_DISABLED;
++    else
++        color_key.key_type = OMAPFB_COLOR_KEY_GFX_DST;
++    ioctl(dev_fd, OMAPFB_SET_COLOR_KEY, &color_key);
++
++    plane_ready = 1;
++    return 0;
++}
++
++static void draw_alpha(int x0, int y0, int w, int h, unsigned char *src, unsigned char *srca, int stride)
++{
++    vo_draw_alpha_yuy2(w, h, src, srca, stride, fb_pages[page].buf + y0 * finfo.line_length + x0 * 2, finfo.line_length);
++}
++
++static void draw_osd(void)
++{
++    vo_draw_text(sinfo.xres, sinfo.yres, draw_alpha);
++}
++
++static int draw_frame(uint8_t *src[])
++{
++    return 1;
++}
++
++static int draw_slice(uint8_t *src[], int stride[], int w, int h, int x, int y)
++{
++    if (x!=0)
++        return 0;
++
++    if (!plane_ready)
++        return 0;
++
++    ioctl(dev_fd, OMAPFB_SYNC_GFX);
++
++    yuv420_to_yuv422(fb_pages[page].buf + y * finfo.line_length, src[0], src[1], src[2], w & ~15, h, stride[0], stride[1], finfo.line_length);
++    return 0;
++}
++
++static void flip_page(void)
++{
++    if (fb_page_flip) {
++        sinfo.xoffset = fb_pages[page].x + xoff;
++        sinfo.yoffset = fb_pages[page].y + yoff;
++        ioctl(dev_fd, FBIOPAN_DISPLAY, &sinfo);
++        page ^= fb_page_flip;
++    }
++}
++
++static int query_format(uint32_t format)
++{
++    // For simplicity pretend that we can only do YV12, support for
++    // other formats can be added quite easily if/when needed
++    if (format != IMGFMT_YV12)
++        return 0;
++
++    return VFCAP_CSP_SUPPORTED | VFCAP_CSP_SUPPORTED_BY_HW | VFCAP_OSD | VFCAP_SWSCALE | VFCAP_ACCEPT_STRIDE;
++}
++
++
++/**
++ * Uninitialize framebuffer
++ */
++static void uninit()
++{
++    pinfo.enabled = 0;
++    ioctl(dev_fd, OMAPFB_SETUP_PLANE, &pinfo);
++
++    if (!fb_overlay_only) {
++        struct omapfb_color_key color_key;
++        color_key.channel_out = OMAPFB_CHANNEL_OUT_LCD;
++        color_key.key_type = OMAPFB_COLOR_KEY_DISABLED;
++        ioctl(dev_fd, OMAPFB_SET_COLOR_KEY, &color_key);
++    }
++
++    close(dev_fd);
++
++    if (!fb_overlay_only)
++        x11_uninit();
++}
++
++
++static int control(uint32_t request, void *data, ...)
++{
++    switch (request) {
++        case VOCTRL_QUERY_FORMAT:
++            return query_format(*((uint32_t*)data));
++        case VOCTRL_FULLSCREEN: {
++            if (WinID > 0) return VO_FALSE;
++            if (fullscreen_flag) {
++                if (!fb_overlay_only)
++                    vo_x11_fullscreen();
++                fullscreen_flag = 0;
++                omapfb_update(sinfo_p0.xres / 2 - sinfo.xres / 2, sinfo_p0.yres / 2 - sinfo.yres / 2, sinfo.xres, sinfo.yres, 1);
++            } else {
++                if (!fb_overlay_only)
++                    vo_x11_fullscreen();
++                fullscreen_flag = 1;
++                omapfb_update(0, 0, sinfo_p0.xres, sinfo_p0.yres, 1);
++            }
++            return VO_TRUE;
++        }
++        case VOCTRL_UPDATE_SCREENINFO:
++            update_xinerama_info();
++            return VO_TRUE;
++    }
++    return VO_NOTIMPL;
++}
++
++
++static void check_events(void)
++{
++    if (!fb_overlay_only)
++        x11_check_events();
++}
+diff --git a/libvo/yuv.S b/libvo/yuv.S
+new file mode 100644
+index 0000000..1cd2c1d
+--- /dev/null
++++ b/libvo/yuv.S
+@@ -0,0 +1,170 @@
++/*
++    Copyright (C) 2008 Mans Rullgard
++
++    Permission is hereby granted, free of charge, to any person
++    obtaining a copy of this software and associated documentation
++    files (the "Software"), to deal in the Software without
++    restriction, including without limitation the rights to use, copy,
++    modify, merge, publish, distribute, sublicense, and/or sell copies
++    of the Software, and to permit persons to whom the Software is
++    furnished to do so, subject to the following conditions:
++
++    The above copyright notice and this permission notice shall be
++    included in all copies or substantial portions of the Software.
++
++    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
++    EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
++    NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
++    HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
++    WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
++    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
++    DEALINGS IN THE SOFTWARE.
++ */
++
++        .macro mov32    rd, val
++        movw            \rd, #:lower16:\val
++        movt            \rd, #:upper16:\val
++        .endm
++
++        .fpu neon
++        .text
++
++@ yuv420_to_yuv422(uint8_t *yuv, uint8_t *y, uint8_t *u, uint8_t *v,
++@                  int w, int h, int yw, int cw, int dw)
++
++#define yuv  r0
++#define y    r1
++#define u    r2
++#define v    r3
++#define w    r4
++#define h    r5
++#define yw   r6
++#define cw   r7
++#define dw   r8
++
++#define tyuv r9
++#define ty   r10
++#define tu   r11
++#define tv   r12
++#define i    lr
++
++        .global yuv420_to_yuv422
++        .func   yuv420_to_yuv422
++yuv420_to_yuv422:
++        push            {r4-r11,lr}
++        add             r4,  sp,  #36
++.Ldo_conv:
++        ldm             r4, {r4-r8}
++        push            {r4}
++1:
++        mov             tu,   u
++        mov             tv,   v
++        vld1.64         {d2}, [u,:64], cw               @ u0
++        vld1.64         {d3}, [v,:64], cw               @ v0
++        mov             tyuv, yuv
++        mov             ty,   y
++        vzip.8          d2,   d3                        @ u0v0
++        mov             i,    #16
++2:                      
++        pld             [y, #64]
++        vld1.64         {d0, d1},   [y,:128], yw        @ y0
++        pld             [u, #64]
++        subs            i,    i,    #4
++        vld1.64         {d6},       [u,:64],  cw        @ u2
++        pld             [y, #64]
++        vld1.64         {d4, d5},   [y,:128], yw        @ y1
++        pld             [v, #64]
++        vld1.64         {d7},       [v,:64],  cw        @ v2
++        pld             [y, #64]
++        vld1.64         {d16,d17},  [y,:128], yw        @ y2
++        vzip.8          d6,   d7                        @ u2v2
++        pld             [u, #64]
++        vld1.64         {d22},      [u,:64],  cw        @ u4
++        pld             [v, #64]
++        vld1.64         {d23},      [v,:64],  cw        @ v4
++        pld             [y, #64]
++        vld1.64         {d20,d21},  [y,:128], yw        @ y3
++        vmov            q9,   q3                        @ u2v2
++        vzip.8          d22,  d23                       @ u4v4
++        vrhadd.u8       q3,   q1,   q3                  @ u1v1
++        vzip.8          q0,   q1                        @ y0u0y0v0
++        vmov            q12,  q11                       @ u4v4
++        vzip.8          q2,   q3                        @ y1u1y1v1
++        vrhadd.u8       q11,  q9,   q11                 @ u3v3
++        vst1.64         {d0-d3},    [yuv,:128], dw      @ y0u0y0v0
++        vzip.8          q8,   q9                        @ y2u2y2v2
++        vst1.64         {d4-d7},    [yuv,:128], dw      @ y1u1y1v1
++        vzip.8          q10,  q11                       @ y3u3y3v3
++        vst1.64         {d16-d19},  [yuv,:128], dw      @ y2u2y2v2
++        vmov            q1,   q12
++        vst1.64         {d20-d23},  [yuv,:128], dw      @ y3u3y3v3
++        bgt             2b
++
++        subs            w,    w,    #16
++        add             yuv,  tyuv, #32
++        add             y,    ty,   #16
++        add             u,    tu,   #8
++        add             v,    tv,   #8
++        bgt             1b
++
++        ldr             w,    [sp]
++        subs            h,    h,    #16
++        add             yuv,  yuv,  dw, lsl #4
++        sub             yuv,  yuv,  w,  lsl #1
++        add             y,    y,    yw, lsl #4
++        sub             y,    y,    w
++        add             u,    u,    cw, lsl #3
++        sub             u,    u,    w,  asr #1
++        add             v,    v,    cw, lsl #3
++        sub             v,    v,    w,  asr #1
++        bgt             1b
++
++        pop             {r3-r11,pc}
++        .endfunc
++
++        .func   neon_open
++neon_open:
++        push            {r4-r8,lr}
++        ldrd            r4,  r5,  [r0, #16]
++        ldrd            r6,  r7,  [r0, #24]
++        lsl             r8,  r4,  #1
++        mov32           r0,  conv_params
++        stm             r0,  {r4-r8}
++        mov             r0,  #0
++        pop             {r4-r8,pc}
++        .endfunc
++
++        .func   neon_convert
++neon_convert:
++        push            {r4-r11,lr}
++        ldr             r0,  [r0]
++        mov32           r4,  conv_params
++        ldm             r1,  {r1-r3}
++        b               .Ldo_conv
++        .endfunc
++
++        .func   neon_nop
++neon_nop:
++        bx              lr
++        .endfunc
++
++        .section .bss
++conv_params:
++        .skip           5*4
++        .size           conv_params, . - conv_params
++
++        .section        .rodata
++.Lname: .asciz          "neon"
++ofb_pixconv_neon:
++        .word           .Lname
++        .word           0               @ flags
++        .word           neon_open
++        .word           neon_convert
++        .word           neon_nop        @ finish
++        .word           neon_nop        @ close
++        .size           ofb_pixconv_neon, . - ofb_pixconv_neon
++
++        .section        .ofb_pixconv, "a"
++ofb_pixconv_neon_p:
++        .word           ofb_pixconv_neon
+-- 
+1.6.6.1
+
diff --git a/meta-oe/recipes-multimedia/mplayer/files/codecs_conf-VP8.diff b/meta-oe/recipes-multimedia/mplayer/files/codecs_conf-VP8.diff
new file mode 100644
index 0000000..ef923dd
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/files/codecs_conf-VP8.diff
@@ -0,0 +1,19 @@
+Index: etc/codecs.conf
+===================================================================
+--- etc/codecs.conf	(revision 29308)
++++ etc/codecs.conf	(working copy)
+@@ -1942,6 +1942,14 @@
+   out YUY2
+   out BGR32,BGR24
+ 
++videocodec fflibvpxvp8
++  info "FFmpeg wrapper for libvpx/VP8"
++  status working
++  fourcc VP80
++  driver ffmpeg
++  dll "libvpx_vp8"
++  out YV12
++
+ videocodec mwv1
+   info "Motion Wavelets"
+   status working
diff --git a/meta-oe/recipes-multimedia/mplayer/files/configure-libvpx_test.diff b/meta-oe/recipes-multimedia/mplayer/files/configure-libvpx_test.diff
new file mode 100644
index 0000000..35250c3
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/files/configure-libvpx_test.diff
@@ -0,0 +1,72 @@
+--- /tmp/configure	2010-06-23 12:12:45.000000000 +0200
++++ trunk/configure	2010-06-23 12:13:53.000000000 +0200
+@@ -302,6 +302,7 @@
+   --disable-libdirac-lavc   disable Dirac in libavcodec [autodetect]
+   --disable-libschroedinger-lavc   disable Dirac in libavcodec (Schroedinger
+                                    decoder) [autodetect]
++  --disable-libvpx-vp8-lavc disable VP8 in libavcodec [autodetect]
+   --disable-libnut          disable libnut [autodetect]
+   --disable-libavutil_a     disable static libavutil [autodetect]
+   --disable-libavcodec_a    disable static libavcodec [autodetect]
+@@ -689,6 +690,7 @@
+ _x264_lavc=auto
+ _libdirac_lavc=auto
+ _libschroedinger_lavc=auto
++_libvpx_vp8_lavc=auto
+ _libnut=auto
+ _lirc=auto
+ _lircc=auto
+@@ -1142,6 +1144,8 @@
+   --disable-libdirac-lavc)  _libdirac_lavc=no   ;;
+   --enable-libschroedinger-lavc)   _libschroedinger_lavc=yes  ;;
+   --disable-libschroedinger-lavc)  _libschroedinger_lavc=no   ;;
++  --enable-libvpx-vp8-lavc)   _libvpx_vp8_lavc=yes  ;;
++  --disable-libvpx-vp8-lavc)  _libvpx_vp8_lavc=no   ;;
+   --enable-libnut)	_libnut=yes	;;
+   --disable-libnut)	_libnut=no	;;
+   --enable-libavutil_a)		_libavutil_a=yes	;;
+@@ -7425,6 +7429,44 @@
+ fi
+ echores "$_libschroedinger_lavc"
+ 
++echocheck "libvpx_vp8"
++if test "$_libvpx_vp8_lavc" = auto; then
++  _libvpx_vp8_lavc=no
++  if test "$_libavcodec_a" != yes; then
++    res_comment="libavcodec (static) is required by libvpx_vp8, sorry"
++  else
++    cat > $TMPC << EOF
++#define HAVE_STDINT_H 1
++#include <vpx_decoder.h>
++#include <vp8dx.h>
++#include <vpx_encoder.h>
++#include <vp8cx.h>
++int main(void)
++{
++    vpx_codec_dec_init(NULL,&vpx_codec_vp8_dx_algo,NULL,0);
++    vpx_codec_enc_init(NULL,&vpx_codec_vp8_cx_algo,NULL,0);
++    return 0;
++}
++EOF
++    _inc_vpx_vp8=
++    _ld_vpx_vp8=-lvpx
++    cc_check $_inc_vpx_vp8 $_ld_vpx_vp8        &&
++    _libvpx_vp8_lavc=yes                       &&
++    extra_cflags="$extra_cflags $_inc_vpx_vp8" &&
++    extra_ldflags="$extra_ldflags $_ld_vpx_vp8"
++  fi
++fi
++if test "$_libvpx_vp8_lavc" = yes ; then
++  def_libvpx_vp8_lavc='#define CONFIG_LIBVPX_VP8 1'
++  _libavencoders="$_libavencoders LIBVPX_VP8_ENCODER"
++  _libavdecoders="$_libavdecoders LIBVPX_VP8_DECODER"
++  codecmodules="libvpx_vp8 $codecmodules"
++else
++  def_libvpx_vp8_lavc='#define CONFIG_LIBVPX_VP8 0'
++  nocodecmodules="libvpx_vp8 $nocodecmodules"
++fi
++echores "$_libvpx_vp8_lavc"
++
+ echocheck "libnut"
+ if test "$_libnut" = auto ; then
+   cat > $TMPC << EOF
diff --git a/meta-oe/recipes-multimedia/mplayer/files/demux_mkv-V_VP8__webm_doctype.diff b/meta-oe/recipes-multimedia/mplayer/files/demux_mkv-V_VP8__webm_doctype.diff
new file mode 100644
index 0000000..58b6e70
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/files/demux_mkv-V_VP8__webm_doctype.diff
@@ -0,0 +1,33 @@
+Index: libmpdemux/demux_mkv.c
+===================================================================
+--- libmpdemux/demux_mkv.c	(revision 31032)
++++ libmpdemux/demux_mkv.c	(working copy)
+@@ -1519,6 +1519,7 @@ static const videocodec_info_t vinfo[] =
+   { MKV_V_MPEG4_AP,  mmioFOURCC('m', 'p', '4', 'v'), 1 },
+   { MKV_V_MPEG4_AVC, mmioFOURCC('a', 'v', 'c', '1'), 1 },
+   { MKV_V_THEORA,    mmioFOURCC('t', 'h', 'e', 'o'), 1 },
++  { MKV_V_VP8,       mmioFOURCC('V', 'P', '8', '0'), 0 },
+   { NULL, 0, 0 }
+ };
+ 
+@@ -2053,7 +2054,7 @@ demux_mkv_open (demuxer_t *demuxer)
+ 
+   stream_seek(s, s->start_pos);
+   str = ebml_read_header (s, &version);
+-  if (str == NULL || strcmp (str, "matroska") || version > 2)
++  if (str == NULL || (strcmp (str, "matroska") && strcmp (str, "webm")) || version > 2)
+     {
+       mp_msg (MSGT_DEMUX, MSGL_DBG2, "[mkv] no head found\n");
+       return 0;
+Index: libmpdemux/matroska.h
+===================================================================
+--- libmpdemux/matroska.h	(revision 31032)
++++ libmpdemux/matroska.h	(working copy)
+@@ -69,6 +69,7 @@
+ #define MKV_V_MPEG4_AP   "V_MPEG4/ISO/AP"
+ #define MKV_V_MPEG4_AVC  "V_MPEG4/ISO/AVC"
+ #define MKV_V_THEORA     "V_THEORA"
++#define MKV_V_VP8        "V_VP8"
+ 
+ #define MKV_S_TEXTASCII  "S_TEXT/ASCII"
+ #define MKV_S_TEXTUTF8   "S_TEXT/UTF8"
diff --git a/meta-oe/recipes-multimedia/mplayer/files/fix-addrinfo.patch b/meta-oe/recipes-multimedia/mplayer/files/fix-addrinfo.patch
new file mode 100644
index 0000000..af254e4
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/files/fix-addrinfo.patch
@@ -0,0 +1,101 @@
+From d15b488e1d0945766da37c9c0f3e286833ecea20 Mon Sep 17 00:00:00 2001
+From: cehoyos <cehoyos@b3059339-0415-0410-9bf9-f77b7e298cf2>
+Date: Thu, 14 Jan 2010 12:06:38 +0000
+Subject: Fix compilation after recent changes in FFmpeg.
+
+Patch by Etienne Buira, etienne D buira A free D fr
+
+
+git-svn-id: svn://svn.mplayerhq.hu/mplayer/trunk@30302 b3059339-0415-0410-9bf9-f77b7e298cf2
+---
+diff --git a/configure b/configure
+index 3dab6ba..ed5d89c 100755
+--- a/configure
++++ b/configure
+@@ -680,6 +680,9 @@ _tv_dshow=auto
+ _pvr=auto
+ _network=yes
+ _winsock2_h=auto
++_struct_addrinfo=auto
++_getaddrinfo=auto
++_struct_sockaddr_storage=auto
+ _smb=auto
+ _vidix=auto
+ _vidix_pcidb=yes
+@@ -3100,6 +3103,64 @@ else
+ fi
+ 
+ 
++echocheck "netdb.h, struct addrinfo"
++if test "$_struct_addrinfo" = auto; then
++  _struct_addrinfo=no
++  cat > $TMPC << EOF
++#include <sys/types.h>
++#include <sys/socket.h>
++#include <netdb.h>
++int main(void) { struct addrinfo ai; return 0; }
++EOF
++  cc_check && _struct_addrinfo=yes
++fi
++echores "$_struct_addrinfo"
++
++if test "$_struct_addrinfo" = yes; then
++  def_addrinfo="#define HAVE_STRUCT_ADDRINFO 1"
++else
++  def_addrinfo="#define HAVE_STRUCT_ADDRINFO 0"
++fi
++
++
++echocheck "netdb.h, getaddrinfo()"
++if test "$_getaddrinfo" = auto; then
++  _getaddrinfo=no
++  cat > $TMPC << EOF
++#include <sys/types.h>
++#include <sys/socket.h>
++#include <netdb.h>
++int main(void) { (void) getaddrinfo(0, 0, 0, 0); return 0; }
++EOF
++  cc_check && _getaddrinfo=yes
++fi
++echores "$_getaddrinfo"
++
++if test "$_getaddrinfo" = yes; then
++  def_getaddrinfo="#define HAVE_GETADDRINFO 1"
++else
++  def_getaddrinfo="define HAVE_GETADDRINFO 0"
++fi
++
++
++echocheck "sockaddr_storage"
++if test "$_struct_sockaddr_storage" = auto; then
++  _struct_sockaddr_storage=no
++  cat > $TMPC << EOF
++#include <sys/socket.h>
++int main(void) { struct sockaddr_storage sas; return 0; }
++EOF
++  cc_check && _struct_sockaddr_storage=yes
++fi
++echores "$_struct_sockaddr_storage"
++
++if test "$_struct_sockaddr_storage" = yes; then
++  def_sockaddr_storage="#define HAVE_STRUCT_SOCKADDR_STORAGE 1"
++else
++  def_sockaddr_storage="#define HAVE_STRUCT_SOCKADDR_STORAGE 0"
++fi
++
++
+ echocheck "arpa/inet.h"
+ arpa_inet_h=no
+ def_arpa_inet_h='#define HAVE_ARPA_INET_H 0'
+@@ -8907,6 +8968,9 @@ $def_network
+ $def_smb
+ $def_socklen_t
+ $def_vstream
++$def_addrinfo
++$def_getaddrinfo
++$def_sockaddr_storage
+ 
+ 
+ /* libvo options */
+--
+cgit v0.8.2.1-10-g45e7
diff --git a/meta-oe/recipes-multimedia/mplayer/files/fix-avconfig.diff b/meta-oe/recipes-multimedia/mplayer/files/fix-avconfig.diff
new file mode 100644
index 0000000..80f2962
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/files/fix-avconfig.diff
@@ -0,0 +1,50 @@
+From 0d0bae1e1e24410b9ead821c4450bb2b136ae325 Mon Sep 17 00:00:00 2001
+From: diego <diego@b3059339-0415-0410-9bf9-f77b7e298cf2>
+Date: Tue, 19 Jan 2010 18:53:16 +0000
+Subject: Create libavutil/avconfig.h, required for FFmpeg compilation.
+
+based on a patch by Etienne Buira, etienne.buira free fr
+
+
+git-svn-id: svn://svn.mplayerhq.hu/mplayer/trunk@30376 b3059339-0415-0410-9bf9-f77b7e298cf2
+---
+diff --git a/configure b/configure
+index 1feed88..85a3b7a 100755
+--- a/configure
++++ b/configure
+@@ -2432,10 +2432,12 @@ if test "$_big_endian" = yes ; then
+   _byte_order='big-endian'
+   def_words_endian='#define WORDS_BIGENDIAN 1'
+   def_bigendian='#define HAVE_BIGENDIAN 1'
++  def_av_bigendian='#define AV_HAVE_BIGENDIAN 1'
+ else
+   _byte_order='little-endian'
+   def_words_endian='#undef WORDS_BIGENDIAN'
+   def_bigendian='#define HAVE_BIGENDIAN 0'
++  def_av_bigendian='#define AV_HAVE_BIGENDIAN 0'
+ fi
+ echores "$_byte_order"
+ 
+@@ -9225,6 +9227,20 @@ EOF
+ # Do not overwrite an unchanged config.h to avoid superfluous rebuilds.
+ cmp -s "$TMPH" config.h || mv -f "$TMPH" config.h
+ 
++############################################################################
++
++# Create avconfig.h for FFmpeg.
++cat > "$TMPH" << EOF
++/* Generated by mpconfigure */
++#ifndef AVUTIL_AVCONFIG_H
++#define AVUTIL_AVCONFIG_H
++$def_av_bigendian
++#endif /* AVUTIL_AVCONFIG_H */
++EOF
++
++# Do not overwrite an unchanged avconfig.h to avoid superfluous rebuilds.
++cmp -s "$TMPH" libavutil/avconfig.h || mv -f "$TMPH" libavutil/avconfig.h
++
+ #############################################################################
+ 
+ cat << EOF
+--
+cgit v0.8.2.1-10-g45e7
diff --git a/meta-oe/recipes-multimedia/mplayer/files/fix-emu_qtx_api.diff b/meta-oe/recipes-multimedia/mplayer/files/fix-emu_qtx_api.diff
new file mode 100644
index 0000000..e657475
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/files/fix-emu_qtx_api.diff
@@ -0,0 +1,33 @@
+http://bugs.gentoo.org/213836
+
+Fix the following error :
+
+| loader/module.o: In function `MODULE_GetProcAddress':
+| module.c:(.text+0x125): undefined reference to `report_entry'
+| module.c:(.text+0x12f): undefined reference to `report_ret'
+| module.c:(.text+0x139): undefined reference to `wrapper_target'
+| module.c:(.text+0x13e): undefined reference to `wrapper'
+| loader/module.o: In function `LoadLibraryExA':
+| module.c:(.text+0x10d4): undefined reference to `report_entry'
+| module.c:(.text+0x10de): undefined reference to `report_ret'
+| module.c:(.text+0x10ea): undefined reference to `wrapper_target'
+| module.c:(.text+0x10f0): undefined reference to `wrapper'
+| collect2: ld returned 1 exit status
+| make: *** [mplayer] Error 1
+
+---
+diff --git a/loader/module.c b/loader/module.c
+index e316cf0..2023acb 100644
+--- a/loader/module.c
++++ b/loader/module.c
+@@ -9,8 +9,8 @@
+  */
+ 
+ // define for quicktime calls debugging and/or MacOS-level emulation:
+-#ifndef __APPLE__
+-#define EMU_QTX_API
++#ifdef __APPLE__
++#undef EMU_QTX_API
+ #endif /* __APPLE__ */
+ 
+ // define for quicktime debugging (verbose logging):
diff --git a/meta-oe/recipes-multimedia/mplayer/files/fix-exp.diff b/meta-oe/recipes-multimedia/mplayer/files/fix-exp.diff
new file mode 100644
index 0000000..bd8ac88
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/files/fix-exp.diff
@@ -0,0 +1,38 @@
+From da70ef3840dff5972ca5d10c387d58c126eee94c Mon Sep 17 00:00:00 2001
+From: reimar <reimar@b3059339-0415-0410-9bf9-f77b7e298cf2>
+Date: Tue, 12 Jan 2010 19:41:44 +0000
+Subject: Add checks for exp2, exp2 and log2f required by FFmpeg.
+
+git-svn-id: svn://svn.mplayerhq.hu/mplayer/trunk@30291 b3059339-0415-0410-9bf9-f77b7e298cf2
+---
+diff --git a/configure b/configure
+index fb69ac8..23da910 100755
+--- a/configure
++++ b/configure
+@@ -3006,7 +3006,7 @@ if test "$_posix4" = yes ; then
+ fi
+ echores "$_posix4"
+ 
+-for func in llrint log2 lrint lrintf round roundf truncf; do
++for func in exp2 exp2f llrint log2 log2f lrint lrintf round roundf truncf; do
+ echocheck $func
+ cat > $TMPC << EOF
+ #include <math.h>
+@@ -8682,12 +8682,15 @@ $def_winsock2_h
+ 
+ 
+ /* system functions */
++$def_exp2
++$def_exp2f
+ $def_gethostbyname2
+ $def_gettimeofday
+ $def_glob
+ $def_langinfo
+ $def_llrint
+ $def_log2
++$def_log2f
+ $def_lrint
+ $def_lrintf
+ $def_map_memalign
+--
+cgit v0.8.2.1-10-g45e7
diff --git a/meta-oe/recipes-multimedia/mplayer/files/makefile-nostrip-svn.patch b/meta-oe/recipes-multimedia/mplayer/files/makefile-nostrip-svn.patch
new file mode 100644
index 0000000..c684001
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/files/makefile-nostrip-svn.patch
@@ -0,0 +1,11 @@
+--- /tmp/Makefile	2008-06-10 21:05:55.613676241 +0200
++++ trunk/Makefile	2008-06-10 21:06:30.701172833 +0200
+@@ -797,7 +797,7 @@
+ 	$(INSTALL) -d $(BINDIR) $(CONFDIR)
+ 
+ install-%: %$(EXESUF) install-dirs
+-	$(INSTALL) -m 755 $(INSTALLSTRIP) $< $(BINDIR)
++	$(INSTALL) -m 755 $< $(BINDIR)
+ 
+ install-mplayer-man: $(foreach lang,$(MAN_LANG_ALL),install-mplayer-man-$(lang))
+ install-mencoder-man: $(foreach lang,$(MAN_LANG_ALL),install-mencoder-man-$(lang))
diff --git a/meta-oe/recipes-multimedia/mplayer/files/mplayer-arm-pld.patch b/meta-oe/recipes-multimedia/mplayer/files/mplayer-arm-pld.patch
new file mode 100644
index 0000000..b10117e
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/files/mplayer-arm-pld.patch
@@ -0,0 +1,18 @@
+Index: trunk/libmpeg2/motion_comp_arm_s.S
+===================================================================
+--- trunk.orig/libmpeg2/motion_comp_arm_s.S	2009-11-11 20:49:15.376079099 +0300
++++ trunk/libmpeg2/motion_comp_arm_s.S	2009-11-11 20:51:46.468064654 +0300
+@@ -18,6 +18,13 @@
+ @ along with mpeg2dec; if not, write to the Free Software
+ @ Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ 
++#include "../config.h"
++
++#if !HAVE_PLD
++.macro pld reg
++.endm
++#endif
++
+ 
+ 	.text
+ 
diff --git a/meta-oe/recipes-multimedia/mplayer/files/mplayer-lavc-arm.patch b/meta-oe/recipes-multimedia/mplayer/files/mplayer-lavc-arm.patch
new file mode 100644
index 0000000..8c2c832
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/files/mplayer-lavc-arm.patch
@@ -0,0 +1,17 @@
+Index: trunk/libavcodec/arm/dsputil_arm.S
+===================================================================
+--- trunk.orig/libavcodec/arm/dsputil_arm.S	2009-11-11 22:16:37.216062301 +0300
++++ trunk/libavcodec/arm/dsputil_arm.S	2009-11-11 22:22:00.908058155 +0300
+@@ -29,6 +29,12 @@
+ .endm
+ #endif
+ 
++#ifndef __THUMB_INTERWORK__
++.macro bx reg
++	mov pc, \reg
++.endm
++#endif
++
+ #if HAVE_ARMV5TE
+ function ff_prefetch_arm, export=1
+         subs            r2,  r2,  #1
diff --git a/meta-oe/recipes-multimedia/mplayer/files/offset.patch b/meta-oe/recipes-multimedia/mplayer/files/offset.patch
new file mode 100644
index 0000000..3b90867
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/files/offset.patch
@@ -0,0 +1,11 @@
+--- /tmp/asm-offsets.h	2010-12-29 18:25:51.000000000 +0100
++++ trunk/ffmpeg/libavcodec/arm/asm-offsets.h	2010-12-29 18:26:21.000000000 +0100
+@@ -35,7 +35,7 @@
+ #define AC_PRED                  0xa80
+ #define BLOCK_LAST_INDEX         0x2160
+ #define INTER_SCANTAB_RASTER_END 0x2360
+-#define H263_AIC                 0x2610
++#define H263_AIC                 0x2618
+ #elif defined(__APPLE__)
+ #define Y_DC_SCALE               0xa30
+ #define C_DC_SCALE               0xa34
diff --git a/meta-oe/recipes-multimedia/mplayer/files/omapfb.patch b/meta-oe/recipes-multimedia/mplayer/files/omapfb.patch
new file mode 100644
index 0000000..2356d80
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/files/omapfb.patch
@@ -0,0 +1,29 @@
+--- /tmp/video_out.c	2009-01-14 16:39:38.000000000 +0100
++++ trunk/libvo/video_out.c	2009-01-14 16:40:11.000000000 +0100
+@@ -86,6 +86,7 @@
+ extern vo_functions_t video_out_bl;
+ extern vo_functions_t video_out_fbdev;
+ extern vo_functions_t video_out_fbdev2;
++extern vo_functions_t video_out_omapfb;
+ extern vo_functions_t video_out_svga;
+ extern vo_functions_t video_out_png;
+ extern vo_functions_t video_out_ggi;
+@@ -177,6 +178,7 @@
+ #ifdef CONFIG_FBDEV
+         &video_out_fbdev,
+         &video_out_fbdev2,
++        &video_out_omapfb,
+ #endif
+ #ifdef CONFIG_SVGALIB
+         &video_out_svga,
+--- a/Makefile	2009-02-03 13:45:48.000000000 -0800
++++ b/Makefile	2009-02-03 13:45:50.000000000 -0800
+@@ -551,7 +551,7 @@
+ SRCS_MPLAYER-$(DXR2)         += libao2/ao_dxr2.c libvo/vo_dxr2.c
+ SRCS_MPLAYER-$(DXR3)         += libvo/vo_dxr3.c
+ SRCS_MPLAYER-$(ESD)          += libao2/ao_esd.c
+-SRCS_MPLAYER-$(FBDEV)        += libvo/vo_fbdev.c libvo/vo_fbdev2.c
++SRCS_MPLAYER-$(FBDEV)        += libvo/vo_fbdev.c libvo/vo_fbdev2.c libvo/vo_omapfb.c libvo/yuv.S
+ SRCS_MPLAYER-$(GGI)          += libvo/vo_ggi.c
+ SRCS_MPLAYER-$(GIF)          += libvo/vo_gif89a.c
+ SRCS_MPLAYER-$(GL)           += libvo/gl_common.c libvo/vo_gl.c libvo/vo_gl2.c
diff --git a/meta-oe/recipes-multimedia/mplayer/files/vo_omapfb.c b/meta-oe/recipes-multimedia/mplayer/files/vo_omapfb.c
new file mode 100644
index 0000000..cb4daff
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/files/vo_omapfb.c
@@ -0,0 +1,591 @@
+/*
+ 
+Copyright (C) 2008 Gregoire Gentil <gregoire@gentil.com>
+Portions Copyright (C) 2009 Howard Chu <hyc@symas.com>
+This file adds an optimized vo output to mplayer for the OMAP platform. This is a first pass and an attempt to help to improve
+media playing on the OMAP platform. The usual disclaimer comes here: this code is provided without any warranty.
+Many bugs and issues still exist. Feed-back is welcome.
+
+This output uses the yuv420_to_yuv422 conversion from Mans Rullgard, and is heavily inspired from the work of Siarhei Siamashka.
+I would like to thank those two persons here, without them this code would certainly not exist.
+
+Two options of the output are available:
+fb_overlay_only (disabled by default): only the overlay is drawn. X11 stuff is ignored.
+dbl_buffer (disabled by default): add double buffering. Some tearsync flags are probably missing in the code.
+
+Syntax is the following:
+mplayer -ao alsa -vo omapfb /test.avi
+mplayer -nosound -vo omapfb:fb_overlay_only:dbl_buffer /test.avi
+
+You need to have two planes on your system. On beagleboard, it means something like: video=omapfb:vram:2M,vram:4M
+
+Known issues:
+1) A green line or some vertical lines (if mplayer decides to draw bands instead of frame) may appear.
+It's an interpolation bug in the color conversion that needs to be fixed
+
+2) The color conversion accepts only 16-pixel multiple for width and height.
+
+3) The scaling down is disabled as the scaling down kernel patch for the OMAP3 platform doesn't seem to work yet.
+
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
+*/
+ 
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <fcntl.h>
+#include <unistd.h>
+#include <errno.h>
+
+#include <sys/mman.h>
+#include <sys/ioctl.h>
+#include <linux/fb.h>
+
+#include "config.h"
+#include "video_out.h"
+#include "video_out_internal.h"
+#include "fastmemcpy.h"
+#include "sub.h"
+#include "mp_msg.h"
+#include "omapfb.h"
+#include "x11_common.h"
+
+#include "libswscale/swscale.h"
+#include "libmpcodecs/vf_scale.h"
+#include "libavcodec/avcodec.h"
+
+#include "aspect.h"
+
+#include "subopt-helper.h"
+
+#include <X11/Xlib.h>
+#include <X11/Xutil.h>
+#include <X11/Xatom.h>
+#include "wskeys.h"
+
+static vo_info_t info = {
+	"omapfb video driver",
+	"omapfb",
+	"",
+	""
+};
+
+LIBVO_EXTERN(omapfb)
+
+static int fb_overlay_only = 0; // if set, we need only framebuffer overlay, but do not need any x11 code
+static int dbl_buffer = 0;
+static int fullscreen_flag = 0;
+static int plane_ready = 0;
+static uint32_t drwX, drwY;
+
+extern void yuv420_to_yuv422(uint8_t *yuv, uint8_t *y, uint8_t *u, uint8_t *v, int w, int h, int yw, int cw, int dw);
+static struct fb_var_screeninfo sinfo_p0;
+static struct fb_var_screeninfo sinfo;
+static struct fb_var_screeninfo sinfo2;
+static struct fb_fix_screeninfo finfo;
+static struct omapfb_mem_info minfo;
+static struct omapfb_plane_info pinfo;
+static int xoff, yoff;
+
+static struct {
+    unsigned x;
+    unsigned y;
+    uint8_t *buf;
+} fb_pages[2];
+static int dev_fd = -1;
+static int fb_page_flip = 0;
+static int page = 0;
+static void omapfb_update(int x, int y, int out_w, int out_h, int show);
+
+extern void mplayer_put_key( int code );
+#include "osdep/keycodes.h"
+
+#define TRANSPARENT_COLOR_KEY 0xff0
+
+static Display *display = NULL; // pointer to X Display structure.
+static int screen_num; // number of screen to place the window on.
+static Window win = 0;
+static Window parent = 0; // pointer to the newly created window.
+
+/* This is used to intercept window closing requests.  */
+static Atom wm_delete_window;
+
+
+void vo_calc_drwXY(uint32_t *drwX, uint32_t *drwY)
+{
+    *drwX = *drwY = 0;
+    if (vo_fs) {
+        aspect(&vo_dwidth, &vo_dheight, A_ZOOM);
+        vo_dwidth  = FFMIN(vo_dwidth, vo_screenwidth);
+        vo_dheight = FFMIN(vo_dheight, vo_screenheight);
+        *drwX      = (vo_screenwidth - vo_dwidth) / 2;
+        *drwY      = (vo_screenheight - vo_dheight) / 2;
+        mp_msg(MSGT_VO, MSGL_V, "[vo-fs] dx: %d dy: %d dw: %d dh: %d\n",
+               *drwX, *drwY, vo_dwidth, vo_dheight);
+    } else if (WinID == 0) {
+        *drwX = vo_dx;
+        *drwY = vo_dy;
+    }
+}
+
+static void getPrimaryPlaneInfo()
+{
+    int dev_fd = open("/dev/fb0", O_RDWR);
+
+    if (dev_fd == -1) {
+        mp_msg(MSGT_VO, MSGL_FATAL, "[omapfb] Error /dev/fb0\n");
+        return -1;
+    }
+
+    ioctl(dev_fd, FBIOGET_VSCREENINFO, &sinfo_p0);
+    close(dev_fd);
+}
+
+/**
+ * Function to get the offset to be used when in windowed mode
+ * or when using -wid option
+ */
+static void x11_get_window_abs_position(Display *display, Window window,
+                                             int *wx, int *wy, int *ww, int *wh)
+{
+    Window root, parent;
+    Window *child;
+    unsigned int n_children;
+    XWindowAttributes attribs;
+
+    /* Get window attributes */
+    XGetWindowAttributes(display, window, &attribs);
+
+    /* Get relative position of given window */
+    *wx = attribs.x;
+    *wy = attribs.y;
+    if (ww)
+        *ww = attribs.width;
+    if (wh)
+        *wh = attribs.height;
+
+    /* Query window tree information */
+    XQueryTree(display, window, &root, &parent, &child, &n_children);
+    if (parent)
+    {
+      int x, y;
+      /* If we have a parent we must go there and discover his position*/
+      x11_get_window_abs_position(display, parent, &x, &y, NULL, NULL);
+      *wx += x;
+      *wy += y;
+    }
+
+    /* If we had children, free it */
+    if(n_children)
+        XFree(child);
+}
+
+static void x11_check_events(void)
+{
+    int e = vo_x11_check_events(mDisplay);
+
+    if (e & VO_EVENT_RESIZE)
+        vo_calc_drwXY(&drwX, &drwY);
+
+    if (e & VO_EVENT_EXPOSE || e & VO_EVENT_RESIZE)
+    {
+        vo_xv_draw_colorkey(drwX, drwY, vo_dwidth - 1, vo_dheight - 1);
+        omapfb_update(0, 0, 0, 0, 1);
+    }
+}
+
+static void x11_uninit()
+{
+    if (display) {
+        XCloseDisplay(display);
+        display = NULL;
+    }
+}
+
+/**
+ * Initialize framebuffer
+ */
+static int preinit(const char *arg)
+{
+    opt_t subopts[] = {
+        {"fb_overlay_only", OPT_ARG_BOOL, &fb_overlay_only, NULL},
+        {"dbl_buffer", OPT_ARG_BOOL, &dbl_buffer, NULL},
+        {NULL}
+    };
+
+    if (subopt_parse(arg, subopts) != 0) {
+        mp_msg(MSGT_VO, MSGL_FATAL, "[omapfb] unknown suboptions: %s\n", arg);
+        return -1;
+    }
+
+    getPrimaryPlaneInfo();
+    dev_fd = open("/dev/fb1", O_RDWR);
+
+    if (dev_fd == -1) {
+        mp_msg(MSGT_VO, MSGL_FATAL, "[omapfb] Error /dev/fb1\n");
+        return -1;
+    }
+
+    ioctl(dev_fd, FBIOGET_VSCREENINFO, &sinfo);
+    ioctl(dev_fd, OMAPFB_QUERY_PLANE, &pinfo);
+    ioctl(dev_fd, OMAPFB_QUERY_MEM, &minfo);
+
+    if (!fb_overlay_only && !vo_init())
+    {
+        mp_msg(MSGT_VO, MSGL_FATAL, "[omapfb] Could not open X, overlay only...\n");        
+        fb_overlay_only = 1;
+    }
+
+    return 0;
+}
+
+static void omapfb_update(int x, int y, int out_w, int out_h, int show)
+{
+    int xres, yres;
+    if (!fb_overlay_only)
+        x11_get_window_abs_position(mDisplay, vo_window, &x, &y, &out_w, &out_h);
+
+    /* Check for new screen rotation */
+    ioctl(dev_fd, FBIOGET_VSCREENINFO, &sinfo2);
+    if (sinfo2.rotate != sinfo_p0.rotate)
+        getPrimaryPlaneInfo();
+
+    if ( (!x && !y && !out_w && !out_h) ||
+        (out_w < sinfo.xres_virtual / 4) || (out_h < sinfo.yres_virtual / 4) ||  /* HW can't scale down by more than 4x */
+        (out_w > sinfo.xres_virtual * 8) || (out_h > sinfo.yres_virtual * 8) ) { /* HW can't scale up by more than 8x */
+        pinfo.enabled = 0;
+        pinfo.pos_x = 0;
+        pinfo.pos_y = 0;
+        ioctl(dev_fd, OMAPFB_SETUP_PLANE, &pinfo);
+        return;
+    }
+
+    xres = sinfo.xres_virtual;
+    yres = sinfo.yres_virtual;
+
+    /* Handle clipping: if the left or top edge of the window goes
+     * offscreen, clamp the overlay to the left or top edge of the
+     * screen, and set the difference into the frame offset. Also
+     * decrease the overlay size by the offset. The offset must
+     * take window scaling into account as well.
+     *
+     * Likewise, if the right or bottom edge of the window goes
+     * offscreen, clamp the overlay to the right or bottom edge of
+     * the screen, and decrease the overlay size accordingly. The
+     * hardware will truncate the output accordingly, so no offset
+     * is needed. Also take window scaling into account.  -- hyc
+     */
+    if (x < 0) {
+        /* clamp to left edge */
+        xoff = -x;
+        if (out_w != sinfo.xres_virtual) {
+            /* account for scaling */
+            xoff *= sinfo.xres_virtual;
+            xoff /= out_w;
+        }
+        xres -= xoff;
+        out_w += x;
+        x = 0;
+    } else {
+        xoff = 0;
+        if (x + out_w > sinfo_p0.xres) {
+            /* clamp to right edge */
+            int diff = sinfo_p0.xres - x;
+            if (out_w != sinfo.xres_virtual) {
+                /* account for scaling */
+                xres = diff * sinfo.xres_virtual;
+                xres /= out_w;
+            } else {
+                xres = diff;
+            }
+            out_w = diff;
+        }
+    }
+
+    if (y < 0) {
+        /* clamp to top edge - this seldom occurs since the window
+         * titlebar is usually forced to stay visible
+         */
+        yoff = -y;
+        if (out_h != sinfo.yres_virtual) {
+            /* account for scaling */
+            yoff *= sinfo.yres_virtual;
+            yoff /= out_h;
+        }
+        yres -= yoff;
+        out_h += y;
+        y = 0;
+    } else {
+        yoff = 0;
+        if (y + out_h > sinfo_p0.yres) {
+            /* clamp to bottom edge */
+            int diff = sinfo_p0.yres - y;
+            if (out_h != sinfo.yres_virtual) {
+                /* account for scaling */
+                yres = diff * sinfo.yres_virtual;
+                yres /= out_h;
+            } else {
+                yres = diff;
+            }
+            out_h = diff;
+        }
+    }
+
+    if (xoff & 1)
+        xoff++;
+    if (xres & 1)
+        xres--;
+
+    pinfo.enabled = show;
+    pinfo.pos_x = x;
+    pinfo.pos_y = y;
+    pinfo.out_width  = out_w;
+    pinfo.out_height = out_h;
+
+    sinfo.xoffset = fb_pages[page].x + xoff;
+    sinfo.yoffset = fb_pages[page].y + yoff;
+    /* If we had to change the overlay dimensions, update it */
+    if (xres != sinfo2.xres || yres != sinfo2.yres ||
+        sinfo.xoffset != sinfo2.xoffset ||
+        sinfo.yoffset != sinfo2.yoffset) {
+        sinfo.xres = xres;
+        sinfo.yres = yres;
+        sinfo.rotate = sinfo2.rotate;
+        ioctl(dev_fd, FBIOPUT_VSCREENINFO, &sinfo);
+    }
+
+    ioctl(dev_fd, OMAPFB_SETUP_PLANE, &pinfo);
+}
+
+static int config(uint32_t width, uint32_t height, uint32_t d_width,
+		uint32_t d_height, uint32_t flags, char *title,
+		uint32_t format)
+{
+    uint8_t *fbmem;
+    int i;
+    struct omapfb_color_key color_key;
+
+    XVisualInfo vinfo;
+    XSetWindowAttributes xswa;
+    XWindowAttributes attribs;
+    unsigned long xswamask;
+    int depth;
+
+    Window root, parent;
+    Window *child;
+    unsigned int n_children;
+
+    fullscreen_flag = flags & VOFLAG_FULLSCREEN;
+    if (!fb_overlay_only)
+    {
+        if (!title)
+            title = "MPlayer OMAPFB (X11/FB) render";
+
+        XGetWindowAttributes(mDisplay, mRootWin, &attribs);
+        depth = attribs.depth;
+        if (depth != 15 && depth != 16 && depth != 24 && depth != 32)
+            depth = 24;
+        XMatchVisualInfo(mDisplay, mScreen, depth, TrueColor, &vinfo);
+
+        xswa.border_pixel = 0;
+        xswa.background_pixel = xv_colorkey = TRANSPARENT_COLOR_KEY;
+
+        xswamask = CWBackPixel | CWBorderPixel;
+        xv_ck_info.method = CK_METHOD_BACKGROUND;
+
+        vo_x11_create_vo_window(&vinfo, vo_dx, vo_dy, vo_dwidth, vo_dheight,
+                                flags, CopyFromParent, "omapfb", title);
+        XChangeWindowAttributes(mDisplay, vo_window, xswamask, &xswa);
+
+        /* Need to receive events on the parent window -- so when it is
+           moved / resized / etc., we know. */
+        if(WinID > 0)
+        {
+            /* Query window tree information */
+            XQueryTree(mDisplay, vo_window, &root, &parent, &child, &n_children);
+            if (n_children)
+                XFree(child);
+
+            XUnmapWindow(mDisplay, vo_window);
+            if (parent)
+                XSelectInput(mDisplay, parent, StructureNotifyMask);
+            XMapWindow(mDisplay, vo_window);
+        }
+
+        vo_calc_drwXY(&drwX, &drwY);
+        vo_xv_draw_colorkey(drwX, drwY, vo_dwidth - 1, vo_dheight - 1);
+    }
+
+    fbmem = mmap(NULL, minfo.size, PROT_READ|PROT_WRITE, MAP_SHARED, dev_fd, 0);
+    if (fbmem == MAP_FAILED) {
+        mp_msg(MSGT_VO, MSGL_FATAL, "[omapfb] Error mmap\n");
+        return -1;
+    }
+
+    for (i = 0; i < minfo.size / 4; i++)
+        ((uint32_t*)fbmem)[i] = 0x80008000;
+
+    sinfo.xres = width & ~15;
+    sinfo.yres = height & ~15;
+    sinfo.xoffset = 0;
+    sinfo.yoffset = 0;
+    sinfo.nonstd = OMAPFB_COLOR_YUY422;
+
+    fb_pages[0].x = 0;
+    fb_pages[0].y = 0;
+    fb_pages[0].buf = fbmem;
+
+    if (dbl_buffer && minfo.size >= sinfo.xres * sinfo.yres * 2) {
+        sinfo.xres_virtual = sinfo.xres;
+        sinfo.yres_virtual = sinfo.yres * 2;
+        fb_pages[1].x = 0;
+        fb_pages[1].y = sinfo.yres;
+        fb_pages[1].buf = fbmem + sinfo.xres * sinfo.yres * 2;
+        fb_page_flip = 1;
+    } else {
+        sinfo.xres_virtual = sinfo.xres;
+        sinfo.yres_virtual = sinfo.yres;
+        fb_page_flip = 0;
+    }
+
+    ioctl(dev_fd, FBIOPUT_VSCREENINFO, &sinfo);
+    ioctl(dev_fd, FBIOGET_FSCREENINFO, &finfo);
+
+    if (WinID <= 0) {
+        if (fullscreen_flag) {
+            omapfb_update(0, 0, sinfo_p0.xres, sinfo_p0.yres, 1);
+        } else {
+            omapfb_update(sinfo_p0.xres / 2 - sinfo.xres / 2, sinfo_p0.yres / 2 - sinfo.yres / 2, sinfo.xres, sinfo.yres, 1);
+        }
+    }
+
+    color_key.channel_out = OMAPFB_CHANNEL_OUT_LCD;
+    color_key.background = 0x0;
+    color_key.trans_key = TRANSPARENT_COLOR_KEY;
+    if (fb_overlay_only)
+        color_key.key_type = OMAPFB_COLOR_KEY_DISABLED;
+    else
+        color_key.key_type = OMAPFB_COLOR_KEY_GFX_DST;
+    ioctl(dev_fd, OMAPFB_SET_COLOR_KEY, &color_key);
+
+    plane_ready = 1;
+    return 0;
+}
+
+static void draw_alpha(int x0, int y0, int w, int h, unsigned char *src, unsigned char *srca, int stride)
+{
+    vo_draw_alpha_yuy2(w, h, src, srca, stride, fb_pages[page].buf + y0 * finfo.line_length + x0 * 2, finfo.line_length);
+}
+
+static void draw_osd(void)
+{
+    vo_draw_text(sinfo.xres, sinfo.yres, draw_alpha);
+}
+
+static int draw_frame(uint8_t *src[])
+{
+    return 1;
+}
+
+static int draw_slice(uint8_t *src[], int stride[], int w, int h, int x, int y)
+{
+    if (x!=0)
+        return 0;
+
+    if (!plane_ready)
+        return 0;
+
+    ioctl(dev_fd, OMAPFB_SYNC_GFX);
+
+    yuv420_to_yuv422(fb_pages[page].buf + y * finfo.line_length, src[0], src[1], src[2], w & ~15, h, stride[0], stride[1], finfo.line_length);
+    return 0;
+}
+
+static void flip_page(void)
+{
+    if (fb_page_flip) {
+        sinfo.xoffset = fb_pages[page].x + xoff;
+        sinfo.yoffset = fb_pages[page].y + yoff;
+        ioctl(dev_fd, FBIOPAN_DISPLAY, &sinfo);
+        page ^= fb_page_flip;
+    }
+}
+
+static int query_format(uint32_t format)
+{
+    // For simplicity pretend that we can only do YV12, support for
+    // other formats can be added quite easily if/when needed
+    if (format != IMGFMT_YV12)
+        return 0;
+
+    return VFCAP_CSP_SUPPORTED | VFCAP_CSP_SUPPORTED_BY_HW | VFCAP_OSD | VFCAP_SWSCALE | VFCAP_ACCEPT_STRIDE;
+}
+
+
+/**
+ * Uninitialize framebuffer
+ */
+static void uninit()
+{
+    pinfo.enabled = 0;
+    ioctl(dev_fd, OMAPFB_SETUP_PLANE, &pinfo);
+
+    if (!fb_overlay_only) {
+        struct omapfb_color_key color_key;
+        color_key.channel_out = OMAPFB_CHANNEL_OUT_LCD;
+        color_key.key_type = OMAPFB_COLOR_KEY_DISABLED;
+        ioctl(dev_fd, OMAPFB_SET_COLOR_KEY, &color_key);
+    }
+
+    close(dev_fd);
+
+    if (!fb_overlay_only)
+        x11_uninit();
+}
+
+
+static int control(uint32_t request, void *data, ...)
+{
+    switch (request) {
+        case VOCTRL_QUERY_FORMAT:
+            return query_format(*((uint32_t*)data));
+        case VOCTRL_FULLSCREEN: {
+            if (WinID > 0) return VO_FALSE;
+            if (fullscreen_flag) {
+                if (!fb_overlay_only)
+                    vo_x11_fullscreen();
+                fullscreen_flag = 0;
+                omapfb_update(sinfo_p0.xres / 2 - sinfo.xres / 2, sinfo_p0.yres / 2 - sinfo.yres / 2, sinfo.xres, sinfo.yres, 1);
+            } else {
+                if (!fb_overlay_only)
+                    vo_x11_fullscreen();
+                fullscreen_flag = 1;
+                omapfb_update(0, 0, sinfo_p0.xres, sinfo_p0.yres, 1);
+            }
+            return VO_TRUE;
+        }
+        case VOCTRL_UPDATE_SCREENINFO:
+            update_xinerama_info();
+            return VO_TRUE;
+    }
+    return VO_NOTIMPL;
+}
+
+
+static void check_events(void)
+{
+    if (!fb_overlay_only)
+        x11_check_events();
+}
diff --git a/meta-oe/recipes-multimedia/mplayer/files/vofw-swscale.diff b/meta-oe/recipes-multimedia/mplayer/files/vofw-swscale.diff
new file mode 100644
index 0000000..6a6b82c
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/files/vofw-swscale.diff
@@ -0,0 +1,16 @@
+Needed for encoding large images with mencoder or grabbing large image from a v4l src
+
+--- /tmp/swscale_internal.h	2010-10-05 09:15:42.000000000 +0200
++++ trunk/libswscale/swscale_internal.h	2010-10-05 09:16:07.000000000 +0200
+@@ -33,11 +33,7 @@
+ 
+ #define MAX_FILTER_SIZE 256
+ 
+-#if ARCH_X86
+ #define VOFW 5120
+-#else
+-#define VOFW 2048 // faster on PPC and not tested on others
+-#endif
+ 
+ #define VOF  (VOFW*2)
+ 
diff --git a/meta-oe/recipes-multimedia/mplayer/files/yuv.S b/meta-oe/recipes-multimedia/mplayer/files/yuv.S
new file mode 100644
index 0000000..1cd2c1d
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/files/yuv.S
@@ -0,0 +1,170 @@
+/*
+    Copyright (C) 2008 Mans Rullgard
+
+    Permission is hereby granted, free of charge, to any person
+    obtaining a copy of this software and associated documentation
+    files (the "Software"), to deal in the Software without
+    restriction, including without limitation the rights to use, copy,
+    modify, merge, publish, distribute, sublicense, and/or sell copies
+    of the Software, and to permit persons to whom the Software is
+    furnished to do so, subject to the following conditions:
+
+    The above copyright notice and this permission notice shall be
+    included in all copies or substantial portions of the Software.
+
+    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+    EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+    NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+    HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+    WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+    DEALINGS IN THE SOFTWARE.
+ */
+
+        .macro mov32    rd, val
+        movw            \rd, #:lower16:\val
+        movt            \rd, #:upper16:\val
+        .endm
+
+        .fpu neon
+        .text
+
+@ yuv420_to_yuv422(uint8_t *yuv, uint8_t *y, uint8_t *u, uint8_t *v,
+@                  int w, int h, int yw, int cw, int dw)
+
+#define yuv  r0
+#define y    r1
+#define u    r2
+#define v    r3
+#define w    r4
+#define h    r5
+#define yw   r6
+#define cw   r7
+#define dw   r8
+
+#define tyuv r9
+#define ty   r10
+#define tu   r11
+#define tv   r12
+#define i    lr
+
+        .global yuv420_to_yuv422
+        .func   yuv420_to_yuv422
+yuv420_to_yuv422:
+        push            {r4-r11,lr}
+        add             r4,  sp,  #36
+.Ldo_conv:
+        ldm             r4, {r4-r8}
+        push            {r4}
+1:
+        mov             tu,   u
+        mov             tv,   v
+        vld1.64         {d2}, [u,:64], cw               @ u0
+        vld1.64         {d3}, [v,:64], cw               @ v0
+        mov             tyuv, yuv
+        mov             ty,   y
+        vzip.8          d2,   d3                        @ u0v0
+        mov             i,    #16
+2:                      
+        pld             [y, #64]
+        vld1.64         {d0, d1},   [y,:128], yw        @ y0
+        pld             [u, #64]
+        subs            i,    i,    #4
+        vld1.64         {d6},       [u,:64],  cw        @ u2
+        pld             [y, #64]
+        vld1.64         {d4, d5},   [y,:128], yw        @ y1
+        pld             [v, #64]
+        vld1.64         {d7},       [v,:64],  cw        @ v2
+        pld             [y, #64]
+        vld1.64         {d16,d17},  [y,:128], yw        @ y2
+        vzip.8          d6,   d7                        @ u2v2
+        pld             [u, #64]
+        vld1.64         {d22},      [u,:64],  cw        @ u4
+        pld             [v, #64]
+        vld1.64         {d23},      [v,:64],  cw        @ v4
+        pld             [y, #64]
+        vld1.64         {d20,d21},  [y,:128], yw        @ y3
+        vmov            q9,   q3                        @ u2v2
+        vzip.8          d22,  d23                       @ u4v4
+        vrhadd.u8       q3,   q1,   q3                  @ u1v1
+        vzip.8          q0,   q1                        @ y0u0y0v0
+        vmov            q12,  q11                       @ u4v4
+        vzip.8          q2,   q3                        @ y1u1y1v1
+        vrhadd.u8       q11,  q9,   q11                 @ u3v3
+        vst1.64         {d0-d3},    [yuv,:128], dw      @ y0u0y0v0
+        vzip.8          q8,   q9                        @ y2u2y2v2
+        vst1.64         {d4-d7},    [yuv,:128], dw      @ y1u1y1v1
+        vzip.8          q10,  q11                       @ y3u3y3v3
+        vst1.64         {d16-d19},  [yuv,:128], dw      @ y2u2y2v2
+        vmov            q1,   q12
+        vst1.64         {d20-d23},  [yuv,:128], dw      @ y3u3y3v3
+        bgt             2b
+
+        subs            w,    w,    #16
+        add             yuv,  tyuv, #32
+        add             y,    ty,   #16
+        add             u,    tu,   #8
+        add             v,    tv,   #8
+        bgt             1b
+
+        ldr             w,    [sp]
+        subs            h,    h,    #16
+        add             yuv,  yuv,  dw, lsl #4
+        sub             yuv,  yuv,  w,  lsl #1
+        add             y,    y,    yw, lsl #4
+        sub             y,    y,    w
+        add             u,    u,    cw, lsl #3
+        sub             u,    u,    w,  asr #1
+        add             v,    v,    cw, lsl #3
+        sub             v,    v,    w,  asr #1
+        bgt             1b
+
+        pop             {r3-r11,pc}
+        .endfunc
+
+        .func   neon_open
+neon_open:
+        push            {r4-r8,lr}
+        ldrd            r4,  r5,  [r0, #16]
+        ldrd            r6,  r7,  [r0, #24]
+        lsl             r8,  r4,  #1
+        mov32           r0,  conv_params
+        stm             r0,  {r4-r8}
+        mov             r0,  #0
+        pop             {r4-r8,pc}
+        .endfunc
+
+        .func   neon_convert
+neon_convert:
+        push            {r4-r11,lr}
+        ldr             r0,  [r0]
+        mov32           r4,  conv_params
+        ldm             r1,  {r1-r3}
+        b               .Ldo_conv
+        .endfunc
+
+        .func   neon_nop
+neon_nop:
+        bx              lr
+        .endfunc
+
+        .section .bss
+conv_params:
+        .skip           5*4
+        .size           conv_params, . - conv_params
+
+        .section        .rodata
+.Lname: .asciz          "neon"
+ofb_pixconv_neon:
+        .word           .Lname
+        .word           0               @ flags
+        .word           neon_open
+        .word           neon_convert
+        .word           neon_nop        @ finish
+        .word           neon_nop        @ close
+        .size           ofb_pixconv_neon, . - ofb_pixconv_neon
+
+        .section        .ofb_pixconv, "a"
+ofb_pixconv_neon_p:
+        .word           ofb_pixconv_neon
diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer/0001-MPlayer-FFmpeg-VP8-encode-decode-patches-using-libvp.patch b/meta-oe/recipes-multimedia/mplayer/mplayer/0001-MPlayer-FFmpeg-VP8-encode-decode-patches-using-libvp.patch
new file mode 100644
index 0000000..89c4f4e
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer/0001-MPlayer-FFmpeg-VP8-encode-decode-patches-using-libvp.patch
@@ -0,0 +1,45 @@
+From e01313b9d1aef66ba63e1e10dc8b6c069e935eb0 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Thu, 30 Dec 2010 10:13:23 +0100
+Subject: [PATCH] MPlayer/FFmpeg VP8 encode/decode patches - using libvpx.git@6cd4a10 or later (includes 0.9.1 and onward)
+
+---
+ libmpcodecs/ve_lavc.c |    8 +++++---
+ 1 files changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/libmpcodecs/ve_lavc.c b/libmpcodecs/ve_lavc.c
+index 139396c..35206d9 100644
+--- a/libmpcodecs/ve_lavc.c
++++ b/libmpcodecs/ve_lavc.c
+@@ -826,6 +826,9 @@ static int encode_frame(struct vf_instance *vf, AVFrame *pic, double pts){
+     assert(MP_NOPTS_VALUE == AV_NOPTS_VALUE);
+ #endif
+ //fprintf(stderr, "ve_lavc %f/%f\n", dts, pts);
++    /* store stats if there are any */
++    if(lavc_venc_context->stats_out && stats_file)
++        fprintf(stats_file, "%s", lavc_venc_context->stats_out);
+     if(out_size == 0 && lavc_param_skip_threshold==0 && lavc_param_skip_factor==0){
+         ++mux_v->encoder_delay;
+         return 0;
+@@ -887,9 +890,6 @@ static int encode_frame(struct vf_instance *vf, AVFrame *pic, double pts){
+             pict_type_char[lavc_venc_context->coded_frame->pict_type]
+             );
+     }
+-    /* store stats if there are any */
+-    if(lavc_venc_context->stats_out && stats_file)
+-        fprintf(stats_file, "%s", lavc_venc_context->stats_out);
+     return out_size;
+ }
+ 
+@@ -1022,6 +1022,8 @@ static int vf_open(vf_instance_t *vf, char* args){
+ 	mux_v->bih->biCompression = mmioFOURCC('d', 'r', 'a', 'c');
+     else if (!strcasecmp(lavc_param_vcodec, "libdirac"))
+ 	mux_v->bih->biCompression = mmioFOURCC('d', 'r', 'a', 'c');
++    else if (!strcasecmp(lavc_param_vcodec, "libvpx"))
++	mux_v->bih->biCompression = mmioFOURCC('V', 'P', '8', '0');
+     else
+ 	mux_v->bih->biCompression = mmioFOURCC(lavc_param_vcodec[0],
+ 		lavc_param_vcodec[1], lavc_param_vcodec[2], lavc_param_vcodec[3]); /* FIXME!!! */
+-- 
+1.6.6.1
+
diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer/0001-omapfb.patch b/meta-oe/recipes-multimedia/mplayer/mplayer/0001-omapfb.patch
new file mode 100644
index 0000000..93ecce2
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer/0001-omapfb.patch
@@ -0,0 +1,823 @@
+From a080f024fcb8a79fc5d93b6dafeaba4fa4b989a6 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Thu, 25 Nov 2010 16:49:53 +0100
+Subject: [PATCH] video out for omapfb support
+
+---
+ Makefile          |    2 +-
+ libvo/video_out.c |    2 +
+ libvo/vo_omapfb.c |  591 +++++++++++++++++++++++++++++++++++++++++++++++++++++
+ libvo/yuv.S       |  170 +++++++++++++++
+ 4 files changed, 764 insertions(+), 1 deletions(-)
+ create mode 100644 libvo/vo_omapfb.c
+ create mode 100644 libvo/yuv.S
+
+diff --git a/Makefile b/Makefile
+index 5108b97..19edfd9 100644
+--- a/Makefile
++++ b/Makefile
+@@ -545,7 +545,7 @@ SRCS_MPLAYER-$(DIRECTX)      += libao2/ao_dsound.c libvo/vo_directx.c
+ SRCS_MPLAYER-$(DXR2)         += libao2/ao_dxr2.c libvo/vo_dxr2.c
+ SRCS_MPLAYER-$(DXR3)         += libvo/vo_dxr3.c
+ SRCS_MPLAYER-$(ESD)          += libao2/ao_esd.c
+-SRCS_MPLAYER-$(FBDEV)        += libvo/vo_fbdev.c libvo/vo_fbdev2.c
++SRCS_MPLAYER-$(FBDEV)        += libvo/vo_fbdev.c libvo/vo_fbdev2.c libvo/vo_omapfb.c libvo/yuv.S
+ SRCS_MPLAYER-$(FFMPEG)       += libvo/vo_png.c
+ SRCS_MPLAYER-$(GGI)          += libvo/vo_ggi.c
+ SRCS_MPLAYER-$(GIF)          += libvo/vo_gif89a.c
+diff --git a/libvo/video_out.c b/libvo/video_out.c
+index 83f2a24..5f4c1ac 100644
+--- a/libvo/video_out.c
++++ b/libvo/video_out.c
+@@ -111,6 +111,7 @@ extern const vo_functions_t video_out_zr;
+ extern const vo_functions_t video_out_zr2;
+ extern const vo_functions_t video_out_bl;
+ extern const vo_functions_t video_out_fbdev2;
++extern const vo_functions_t video_out_omapfb;
+ extern const vo_functions_t video_out_png;
+ extern const vo_functions_t video_out_ggi;
+ extern const vo_functions_t video_out_aa;
+@@ -216,6 +217,7 @@ const vo_functions_t* const video_out_drivers[] =
+ #ifdef CONFIG_FBDEV
+         &video_out_fbdev,
+         &video_out_fbdev2,
++		&video_out_omapfb,
+ #endif
+ #ifdef CONFIG_SVGALIB
+         &video_out_svga,
+diff --git a/libvo/vo_omapfb.c b/libvo/vo_omapfb.c
+new file mode 100644
+index 0000000..b26ee3a
+--- /dev/null
++++ b/libvo/vo_omapfb.c
+@@ -0,0 +1,591 @@
++/*
++ 
++Copyright (C) 2008 Gregoire Gentil <gregoire@gentil.com>
++Portions Copyright (C) 2009 Howard Chu <hyc@symas.com>
++This file adds an optimized vo output to mplayer for the OMAP platform. This is a first pass and an attempt to help to improve
++media playing on the OMAP platform. The usual disclaimer comes here: this code is provided without any warranty.
++Many bugs and issues still exist. Feed-back is welcome.
++
++This output uses the yuv420_to_yuv422 conversion from Mans Rullgard, and is heavily inspired from the work of Siarhei Siamashka.
++I would like to thank those two persons here, without them this code would certainly not exist.
++
++Two options of the output are available:
++fb_overlay_only (disabled by default): only the overlay is drawn. X11 stuff is ignored.
++dbl_buffer (disabled by default): add double buffering. Some tearsync flags are probably missing in the code.
++
++Syntax is the following:
++mplayer -ao alsa -vo omapfb /test.avi
++mplayer -nosound -vo omapfb:fb_overlay_only:dbl_buffer /test.avi
++
++You need to have two planes on your system. On beagleboard, it means something like: video=omapfb:vram:2M,vram:4M
++
++Known issues:
++1) A green line or some vertical lines (if mplayer decides to draw bands instead of frame) may appear.
++It's an interpolation bug in the color conversion that needs to be fixed
++
++2) The color conversion accepts only 16-pixel multiple for width and height.
++
++3) The scaling down is disabled as the scaling down kernel patch for the OMAP3 platform doesn't seem to work yet.
++
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 2 of the License, or
++ * (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
++*/
++ 
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++#include <fcntl.h>
++#include <unistd.h>
++#include <errno.h>
++
++#include <sys/mman.h>
++#include <sys/ioctl.h>
++#include <linux/fb.h>
++
++#include "config.h"
++#include "video_out.h"
++#include "video_out_internal.h"
++#include "fastmemcpy.h"
++#include "sub/sub.h"
++#include "mp_msg.h"
++#include "omapfb.h"
++#include "x11_common.h"
++
++#include "libswscale/swscale.h"
++#include "libmpcodecs/vf_scale.h"
++#include "libavcodec/avcodec.h"
++
++#include "aspect.h"
++
++#include "subopt-helper.h"
++
++#include <X11/Xlib.h>
++#include <X11/Xutil.h>
++#include <X11/Xatom.h>
++#include "wskeys.h"
++
++static vo_info_t info = {
++	"omapfb video driver",
++	"omapfb",
++	"",
++	""
++};
++
++LIBVO_EXTERN(omapfb)
++
++static int fb_overlay_only = 0; // if set, we need only framebuffer overlay, but do not need any x11 code
++static int dbl_buffer = 0;
++static int fullscreen_flag = 0;
++static int plane_ready = 0;
++static uint32_t drwX, drwY;
++
++extern void yuv420_to_yuv422(uint8_t *yuv, uint8_t *y, uint8_t *u, uint8_t *v, int w, int h, int yw, int cw, int dw);
++static struct fb_var_screeninfo sinfo_p0;
++static struct fb_var_screeninfo sinfo;
++static struct fb_var_screeninfo sinfo2;
++static struct fb_fix_screeninfo finfo;
++static struct omapfb_mem_info minfo;
++static struct omapfb_plane_info pinfo;
++static int xoff, yoff;
++
++static struct {
++    unsigned x;
++    unsigned y;
++    uint8_t *buf;
++} fb_pages[2];
++static int dev_fd = -1;
++static int fb_page_flip = 0;
++static int page = 0;
++static void omapfb_update(int x, int y, int out_w, int out_h, int show);
++
++extern void mplayer_put_key( int code );
++#include "osdep/keycodes.h"
++
++#define TRANSPARENT_COLOR_KEY 0xff0
++
++static Display *display = NULL; // pointer to X Display structure.
++static int screen_num; // number of screen to place the window on.
++static Window win = 0;
++static Window parent = 0; // pointer to the newly created window.
++
++/* This is used to intercept window closing requests.  */
++static Atom wm_delete_window;
++
++
++void vo_calc_drwXY(uint32_t *drwX, uint32_t *drwY)
++{
++    *drwX = *drwY = 0;
++    if (vo_fs) {
++        aspect(&vo_dwidth, &vo_dheight, A_ZOOM);
++        vo_dwidth  = FFMIN(vo_dwidth, vo_screenwidth);
++        vo_dheight = FFMIN(vo_dheight, vo_screenheight);
++        *drwX      = (vo_screenwidth - vo_dwidth) / 2;
++        *drwY      = (vo_screenheight - vo_dheight) / 2;
++        mp_msg(MSGT_VO, MSGL_V, "[vo-fs] dx: %d dy: %d dw: %d dh: %d\n",
++               *drwX, *drwY, vo_dwidth, vo_dheight);
++    } else if (WinID == 0) {
++        *drwX = vo_dx;
++        *drwY = vo_dy;
++    }
++}
++
++static void getPrimaryPlaneInfo()
++{
++    int dev_fd = open("/dev/fb0", O_RDWR);
++
++    if (dev_fd == -1) {
++        mp_msg(MSGT_VO, MSGL_FATAL, "[omapfb] Error /dev/fb0\n");
++        return -1;
++    }
++
++    ioctl(dev_fd, FBIOGET_VSCREENINFO, &sinfo_p0);
++    close(dev_fd);
++}
++
++/**
++ * Function to get the offset to be used when in windowed mode
++ * or when using -wid option
++ */
++static void x11_get_window_abs_position(Display *display, Window window,
++                                             int *wx, int *wy, int *ww, int *wh)
++{
++    Window root, parent;
++    Window *child;
++    unsigned int n_children;
++    XWindowAttributes attribs;
++
++    /* Get window attributes */
++    XGetWindowAttributes(display, window, &attribs);
++
++    /* Get relative position of given window */
++    *wx = attribs.x;
++    *wy = attribs.y;
++    if (ww)
++        *ww = attribs.width;
++    if (wh)
++        *wh = attribs.height;
++
++    /* Query window tree information */
++    XQueryTree(display, window, &root, &parent, &child, &n_children);
++    if (parent)
++    {
++      int x, y;
++      /* If we have a parent we must go there and discover his position*/
++      x11_get_window_abs_position(display, parent, &x, &y, NULL, NULL);
++      *wx += x;
++      *wy += y;
++    }
++
++    /* If we had children, free it */
++    if(n_children)
++        XFree(child);
++}
++
++static void x11_check_events(void)
++{
++    int e = vo_x11_check_events(mDisplay);
++
++    if (e & VO_EVENT_RESIZE)
++        vo_calc_drwXY(&drwX, &drwY);
++
++    if (e & VO_EVENT_EXPOSE || e & VO_EVENT_RESIZE)
++    {
++        vo_xv_draw_colorkey(drwX, drwY, vo_dwidth - 1, vo_dheight - 1);
++        omapfb_update(0, 0, 0, 0, 1);
++    }
++}
++
++static void x11_uninit()
++{
++    if (display) {
++        XCloseDisplay(display);
++        display = NULL;
++    }
++}
++
++/**
++ * Initialize framebuffer
++ */
++static int preinit(const char *arg)
++{
++    opt_t subopts[] = {
++        {"fb_overlay_only", OPT_ARG_BOOL, &fb_overlay_only, NULL},
++        {"dbl_buffer", OPT_ARG_BOOL, &dbl_buffer, NULL},
++        {NULL}
++    };
++
++    if (subopt_parse(arg, subopts) != 0) {
++        mp_msg(MSGT_VO, MSGL_FATAL, "[omapfb] unknown suboptions: %s\n", arg);
++        return -1;
++    }
++
++    getPrimaryPlaneInfo();
++    dev_fd = open("/dev/fb1", O_RDWR);
++
++    if (dev_fd == -1) {
++        mp_msg(MSGT_VO, MSGL_FATAL, "[omapfb] Error /dev/fb1\n");
++        return -1;
++    }
++
++    ioctl(dev_fd, FBIOGET_VSCREENINFO, &sinfo);
++    ioctl(dev_fd, OMAPFB_QUERY_PLANE, &pinfo);
++    ioctl(dev_fd, OMAPFB_QUERY_MEM, &minfo);
++
++    if (!fb_overlay_only && !vo_init())
++    {
++        mp_msg(MSGT_VO, MSGL_FATAL, "[omapfb] Could not open X, overlay only...\n");        
++        fb_overlay_only = 1;
++    }
++
++    return 0;
++}
++
++static void omapfb_update(int x, int y, int out_w, int out_h, int show)
++{
++    int xres, yres;
++    if (!fb_overlay_only)
++        x11_get_window_abs_position(mDisplay, vo_window, &x, &y, &out_w, &out_h);
++
++    /* Check for new screen rotation */
++    ioctl(dev_fd, FBIOGET_VSCREENINFO, &sinfo2);
++    if (sinfo2.rotate != sinfo_p0.rotate)
++        getPrimaryPlaneInfo();
++
++    if ( (!x && !y && !out_w && !out_h) ||
++        (out_w < sinfo.xres_virtual / 4) || (out_h < sinfo.yres_virtual / 4) ||  /* HW can't scale down by more than 4x */
++        (out_w > sinfo.xres_virtual * 8) || (out_h > sinfo.yres_virtual * 8) ) { /* HW can't scale up by more than 8x */
++        pinfo.enabled = 0;
++        pinfo.pos_x = 0;
++        pinfo.pos_y = 0;
++        ioctl(dev_fd, OMAPFB_SETUP_PLANE, &pinfo);
++        return;
++    }
++
++    xres = sinfo.xres_virtual;
++    yres = sinfo.yres_virtual;
++
++    /* Handle clipping: if the left or top edge of the window goes
++     * offscreen, clamp the overlay to the left or top edge of the
++     * screen, and set the difference into the frame offset. Also
++     * decrease the overlay size by the offset. The offset must
++     * take window scaling into account as well.
++     *
++     * Likewise, if the right or bottom edge of the window goes
++     * offscreen, clamp the overlay to the right or bottom edge of
++     * the screen, and decrease the overlay size accordingly. The
++     * hardware will truncate the output accordingly, so no offset
++     * is needed. Also take window scaling into account.  -- hyc
++     */
++    if (x < 0) {
++        /* clamp to left edge */
++        xoff = -x;
++        if (out_w != sinfo.xres_virtual) {
++            /* account for scaling */
++            xoff *= sinfo.xres_virtual;
++            xoff /= out_w;
++        }
++        xres -= xoff;
++        out_w += x;
++        x = 0;
++    } else {
++        xoff = 0;
++        if (x + out_w > sinfo_p0.xres) {
++            /* clamp to right edge */
++            int diff = sinfo_p0.xres - x;
++            if (out_w != sinfo.xres_virtual) {
++                /* account for scaling */
++                xres = diff * sinfo.xres_virtual;
++                xres /= out_w;
++            } else {
++                xres = diff;
++            }
++            out_w = diff;
++        }
++    }
++
++    if (y < 0) {
++        /* clamp to top edge - this seldom occurs since the window
++         * titlebar is usually forced to stay visible
++         */
++        yoff = -y;
++        if (out_h != sinfo.yres_virtual) {
++            /* account for scaling */
++            yoff *= sinfo.yres_virtual;
++            yoff /= out_h;
++        }
++        yres -= yoff;
++        out_h += y;
++        y = 0;
++    } else {
++        yoff = 0;
++        if (y + out_h > sinfo_p0.yres) {
++            /* clamp to bottom edge */
++            int diff = sinfo_p0.yres - y;
++            if (out_h != sinfo.yres_virtual) {
++                /* account for scaling */
++                yres = diff * sinfo.yres_virtual;
++                yres /= out_h;
++            } else {
++                yres = diff;
++            }
++            out_h = diff;
++        }
++    }
++
++    if (xoff & 1)
++        xoff++;
++    if (xres & 1)
++        xres--;
++
++    pinfo.enabled = show;
++    pinfo.pos_x = x;
++    pinfo.pos_y = y;
++    pinfo.out_width  = out_w;
++    pinfo.out_height = out_h;
++
++    sinfo.xoffset = fb_pages[page].x + xoff;
++    sinfo.yoffset = fb_pages[page].y + yoff;
++    /* If we had to change the overlay dimensions, update it */
++    if (xres != sinfo2.xres || yres != sinfo2.yres ||
++        sinfo.xoffset != sinfo2.xoffset ||
++        sinfo.yoffset != sinfo2.yoffset) {
++        sinfo.xres = xres;
++        sinfo.yres = yres;
++        sinfo.rotate = sinfo2.rotate;
++        ioctl(dev_fd, FBIOPUT_VSCREENINFO, &sinfo);
++    }
++
++    ioctl(dev_fd, OMAPFB_SETUP_PLANE, &pinfo);
++}
++
++static int config(uint32_t width, uint32_t height, uint32_t d_width,
++		uint32_t d_height, uint32_t flags, char *title,
++		uint32_t format)
++{
++    uint8_t *fbmem;
++    int i;
++    struct omapfb_color_key color_key;
++
++    XVisualInfo vinfo;
++    XSetWindowAttributes xswa;
++    XWindowAttributes attribs;
++    unsigned long xswamask;
++    int depth;
++
++    Window root, parent;
++    Window *child;
++    unsigned int n_children;
++
++    fullscreen_flag = flags & VOFLAG_FULLSCREEN;
++    if (!fb_overlay_only)
++    {
++        if (!title)
++            title = "MPlayer OMAPFB (X11/FB) render";
++
++        XGetWindowAttributes(mDisplay, mRootWin, &attribs);
++        depth = attribs.depth;
++        if (depth != 15 && depth != 16 && depth != 24 && depth != 32)
++            depth = 24;
++        XMatchVisualInfo(mDisplay, mScreen, depth, TrueColor, &vinfo);
++
++        xswa.border_pixel = 0;
++        xswa.background_pixel = xv_colorkey = TRANSPARENT_COLOR_KEY;
++
++        xswamask = CWBackPixel | CWBorderPixel;
++        xv_ck_info.method = CK_METHOD_BACKGROUND;
++
++        vo_x11_create_vo_window(&vinfo, vo_dx, vo_dy, vo_dwidth, vo_dheight,
++                                flags, CopyFromParent, "omapfb", title);
++        XChangeWindowAttributes(mDisplay, vo_window, xswamask, &xswa);
++
++        /* Need to receive events on the parent window -- so when it is
++           moved / resized / etc., we know. */
++        if(WinID > 0)
++        {
++            /* Query window tree information */
++            XQueryTree(mDisplay, vo_window, &root, &parent, &child, &n_children);
++            if (n_children)
++                XFree(child);
++
++            XUnmapWindow(mDisplay, vo_window);
++            if (parent)
++                XSelectInput(mDisplay, parent, StructureNotifyMask);
++            XMapWindow(mDisplay, vo_window);
++        }
++
++        vo_calc_drwXY(&drwX, &drwY);
++        vo_xv_draw_colorkey(drwX, drwY, vo_dwidth - 1, vo_dheight - 1);
++    }
++
++    fbmem = mmap(NULL, minfo.size, PROT_READ|PROT_WRITE, MAP_SHARED, dev_fd, 0);
++    if (fbmem == MAP_FAILED) {
++        mp_msg(MSGT_VO, MSGL_FATAL, "[omapfb] Error mmap\n");
++        return -1;
++    }
++
++    for (i = 0; i < minfo.size / 4; i++)
++        ((uint32_t*)fbmem)[i] = 0x80008000;
++
++    sinfo.xres = width & ~15;
++    sinfo.yres = height & ~15;
++    sinfo.xoffset = 0;
++    sinfo.yoffset = 0;
++    sinfo.nonstd = OMAPFB_COLOR_YUY422;
++
++    fb_pages[0].x = 0;
++    fb_pages[0].y = 0;
++    fb_pages[0].buf = fbmem;
++
++    if (dbl_buffer && minfo.size >= sinfo.xres * sinfo.yres * 2) {
++        sinfo.xres_virtual = sinfo.xres;
++        sinfo.yres_virtual = sinfo.yres * 2;
++        fb_pages[1].x = 0;
++        fb_pages[1].y = sinfo.yres;
++        fb_pages[1].buf = fbmem + sinfo.xres * sinfo.yres * 2;
++        fb_page_flip = 1;
++    } else {
++        sinfo.xres_virtual = sinfo.xres;
++        sinfo.yres_virtual = sinfo.yres;
++        fb_page_flip = 0;
++    }
++
++    ioctl(dev_fd, FBIOPUT_VSCREENINFO, &sinfo);
++    ioctl(dev_fd, FBIOGET_FSCREENINFO, &finfo);
++
++    if (WinID <= 0) {
++        if (fullscreen_flag) {
++            omapfb_update(0, 0, sinfo_p0.xres, sinfo_p0.yres, 1);
++        } else {
++            omapfb_update(sinfo_p0.xres / 2 - sinfo.xres / 2, sinfo_p0.yres / 2 - sinfo.yres / 2, sinfo.xres, sinfo.yres, 1);
++        }
++    }
++
++    color_key.channel_out = OMAPFB_CHANNEL_OUT_LCD;
++    color_key.background = 0x0;
++    color_key.trans_key = TRANSPARENT_COLOR_KEY;
++    if (fb_overlay_only)
++        color_key.key_type = OMAPFB_COLOR_KEY_DISABLED;
++    else
++        color_key.key_type = OMAPFB_COLOR_KEY_GFX_DST;
++    ioctl(dev_fd, OMAPFB_SET_COLOR_KEY, &color_key);
++
++    plane_ready = 1;
++    return 0;
++}
++
++static void draw_alpha(int x0, int y0, int w, int h, unsigned char *src, unsigned char *srca, int stride)
++{
++    vo_draw_alpha_yuy2(w, h, src, srca, stride, fb_pages[page].buf + y0 * finfo.line_length + x0 * 2, finfo.line_length);
++}
++
++static void draw_osd(void)
++{
++    vo_draw_text(sinfo.xres, sinfo.yres, draw_alpha);
++}
++
++static int draw_frame(uint8_t *src[])
++{
++    return 1;
++}
++
++static int draw_slice(uint8_t *src[], int stride[], int w, int h, int x, int y)
++{
++    if (x!=0)
++        return 0;
++
++    if (!plane_ready)
++        return 0;
++
++    ioctl(dev_fd, OMAPFB_SYNC_GFX);
++
++    yuv420_to_yuv422(fb_pages[page].buf + y * finfo.line_length, src[0], src[1], src[2], w & ~15, h, stride[0], stride[1], finfo.line_length);
++    return 0;
++}
++
++static void flip_page(void)
++{
++    if (fb_page_flip) {
++        sinfo.xoffset = fb_pages[page].x + xoff;
++        sinfo.yoffset = fb_pages[page].y + yoff;
++        ioctl(dev_fd, FBIOPAN_DISPLAY, &sinfo);
++        page ^= fb_page_flip;
++    }
++}
++
++static int query_format(uint32_t format)
++{
++    // For simplicity pretend that we can only do YV12, support for
++    // other formats can be added quite easily if/when needed
++    if (format != IMGFMT_YV12)
++        return 0;
++
++    return VFCAP_CSP_SUPPORTED | VFCAP_CSP_SUPPORTED_BY_HW | VFCAP_OSD | VFCAP_SWSCALE | VFCAP_ACCEPT_STRIDE;
++}
++
++
++/**
++ * Uninitialize framebuffer
++ */
++static void uninit()
++{
++    pinfo.enabled = 0;
++    ioctl(dev_fd, OMAPFB_SETUP_PLANE, &pinfo);
++
++    if (!fb_overlay_only) {
++        struct omapfb_color_key color_key;
++        color_key.channel_out = OMAPFB_CHANNEL_OUT_LCD;
++        color_key.key_type = OMAPFB_COLOR_KEY_DISABLED;
++        ioctl(dev_fd, OMAPFB_SET_COLOR_KEY, &color_key);
++    }
++
++    close(dev_fd);
++
++    if (!fb_overlay_only)
++        x11_uninit();
++}
++
++
++static int control(uint32_t request, void *data, ...)
++{
++    switch (request) {
++        case VOCTRL_QUERY_FORMAT:
++            return query_format(*((uint32_t*)data));
++        case VOCTRL_FULLSCREEN: {
++            if (WinID > 0) return VO_FALSE;
++            if (fullscreen_flag) {
++                if (!fb_overlay_only)
++                    vo_x11_fullscreen();
++                fullscreen_flag = 0;
++                omapfb_update(sinfo_p0.xres / 2 - sinfo.xres / 2, sinfo_p0.yres / 2 - sinfo.yres / 2, sinfo.xres, sinfo.yres, 1);
++            } else {
++                if (!fb_overlay_only)
++                    vo_x11_fullscreen();
++                fullscreen_flag = 1;
++                omapfb_update(0, 0, sinfo_p0.xres, sinfo_p0.yres, 1);
++            }
++            return VO_TRUE;
++        }
++        case VOCTRL_UPDATE_SCREENINFO:
++            update_xinerama_info();
++            return VO_TRUE;
++    }
++    return VO_NOTIMPL;
++}
++
++
++static void check_events(void)
++{
++    if (!fb_overlay_only)
++        x11_check_events();
++}
+diff --git a/libvo/yuv.S b/libvo/yuv.S
+new file mode 100644
+index 0000000..1cd2c1d
+--- /dev/null
++++ b/libvo/yuv.S
+@@ -0,0 +1,170 @@
++/*
++    Copyright (C) 2008 Mans Rullgard
++
++    Permission is hereby granted, free of charge, to any person
++    obtaining a copy of this software and associated documentation
++    files (the "Software"), to deal in the Software without
++    restriction, including without limitation the rights to use, copy,
++    modify, merge, publish, distribute, sublicense, and/or sell copies
++    of the Software, and to permit persons to whom the Software is
++    furnished to do so, subject to the following conditions:
++
++    The above copyright notice and this permission notice shall be
++    included in all copies or substantial portions of the Software.
++
++    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
++    EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
++    NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
++    HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
++    WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
++    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
++    DEALINGS IN THE SOFTWARE.
++ */
++
++        .macro mov32    rd, val
++        movw            \rd, #:lower16:\val
++        movt            \rd, #:upper16:\val
++        .endm
++
++        .fpu neon
++        .text
++
++@ yuv420_to_yuv422(uint8_t *yuv, uint8_t *y, uint8_t *u, uint8_t *v,
++@                  int w, int h, int yw, int cw, int dw)
++
++#define yuv  r0
++#define y    r1
++#define u    r2
++#define v    r3
++#define w    r4
++#define h    r5
++#define yw   r6
++#define cw   r7
++#define dw   r8
++
++#define tyuv r9
++#define ty   r10
++#define tu   r11
++#define tv   r12
++#define i    lr
++
++        .global yuv420_to_yuv422
++        .func   yuv420_to_yuv422
++yuv420_to_yuv422:
++        push            {r4-r11,lr}
++        add             r4,  sp,  #36
++.Ldo_conv:
++        ldm             r4, {r4-r8}
++        push            {r4}
++1:
++        mov             tu,   u
++        mov             tv,   v
++        vld1.64         {d2}, [u,:64], cw               @ u0
++        vld1.64         {d3}, [v,:64], cw               @ v0
++        mov             tyuv, yuv
++        mov             ty,   y
++        vzip.8          d2,   d3                        @ u0v0
++        mov             i,    #16
++2:                      
++        pld             [y, #64]
++        vld1.64         {d0, d1},   [y,:128], yw        @ y0
++        pld             [u, #64]
++        subs            i,    i,    #4
++        vld1.64         {d6},       [u,:64],  cw        @ u2
++        pld             [y, #64]
++        vld1.64         {d4, d5},   [y,:128], yw        @ y1
++        pld             [v, #64]
++        vld1.64         {d7},       [v,:64],  cw        @ v2
++        pld             [y, #64]
++        vld1.64         {d16,d17},  [y,:128], yw        @ y2
++        vzip.8          d6,   d7                        @ u2v2
++        pld             [u, #64]
++        vld1.64         {d22},      [u,:64],  cw        @ u4
++        pld             [v, #64]
++        vld1.64         {d23},      [v,:64],  cw        @ v4
++        pld             [y, #64]
++        vld1.64         {d20,d21},  [y,:128], yw        @ y3
++        vmov            q9,   q3                        @ u2v2
++        vzip.8          d22,  d23                       @ u4v4
++        vrhadd.u8       q3,   q1,   q3                  @ u1v1
++        vzip.8          q0,   q1                        @ y0u0y0v0
++        vmov            q12,  q11                       @ u4v4
++        vzip.8          q2,   q3                        @ y1u1y1v1
++        vrhadd.u8       q11,  q9,   q11                 @ u3v3
++        vst1.64         {d0-d3},    [yuv,:128], dw      @ y0u0y0v0
++        vzip.8          q8,   q9                        @ y2u2y2v2
++        vst1.64         {d4-d7},    [yuv,:128], dw      @ y1u1y1v1
++        vzip.8          q10,  q11                       @ y3u3y3v3
++        vst1.64         {d16-d19},  [yuv,:128], dw      @ y2u2y2v2
++        vmov            q1,   q12
++        vst1.64         {d20-d23},  [yuv,:128], dw      @ y3u3y3v3
++        bgt             2b
++
++        subs            w,    w,    #16
++        add             yuv,  tyuv, #32
++        add             y,    ty,   #16
++        add             u,    tu,   #8
++        add             v,    tv,   #8
++        bgt             1b
++
++        ldr             w,    [sp]
++        subs            h,    h,    #16
++        add             yuv,  yuv,  dw, lsl #4
++        sub             yuv,  yuv,  w,  lsl #1
++        add             y,    y,    yw, lsl #4
++        sub             y,    y,    w
++        add             u,    u,    cw, lsl #3
++        sub             u,    u,    w,  asr #1
++        add             v,    v,    cw, lsl #3
++        sub             v,    v,    w,  asr #1
++        bgt             1b
++
++        pop             {r3-r11,pc}
++        .endfunc
++
++        .func   neon_open
++neon_open:
++        push            {r4-r8,lr}
++        ldrd            r4,  r5,  [r0, #16]
++        ldrd            r6,  r7,  [r0, #24]
++        lsl             r8,  r4,  #1
++        mov32           r0,  conv_params
++        stm             r0,  {r4-r8}
++        mov             r0,  #0
++        pop             {r4-r8,pc}
++        .endfunc
++
++        .func   neon_convert
++neon_convert:
++        push            {r4-r11,lr}
++        ldr             r0,  [r0]
++        mov32           r4,  conv_params
++        ldm             r1,  {r1-r3}
++        b               .Ldo_conv
++        .endfunc
++
++        .func   neon_nop
++neon_nop:
++        bx              lr
++        .endfunc
++
++        .section .bss
++conv_params:
++        .skip           5*4
++        .size           conv_params, . - conv_params
++
++        .section        .rodata
++.Lname: .asciz          "neon"
++ofb_pixconv_neon:
++        .word           .Lname
++        .word           0               @ flags
++        .word           neon_open
++        .word           neon_convert
++        .word           neon_nop        @ finish
++        .word           neon_nop        @ close
++        .size           ofb_pixconv_neon, . - ofb_pixconv_neon
++
++        .section        .ofb_pixconv, "a"
++ofb_pixconv_neon_p:
++        .word           ofb_pixconv_neon
+-- 
+1.6.6.1
+
diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer/0001-video-out-for-omapfb-support.patch b/meta-oe/recipes-multimedia/mplayer/mplayer/0001-video-out-for-omapfb-support.patch
new file mode 100644
index 0000000..dd1bd2a
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer/0001-video-out-for-omapfb-support.patch
@@ -0,0 +1,823 @@
+From b86ce816a3a3aedcf63bf513ce268c93abc5fd11 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Thu, 25 Nov 2010 16:49:53 +0100
+Subject: [PATCH] video out for omapfb support
+
+---
+ Makefile          |    2 +-
+ libvo/video_out.c |    2 +
+ libvo/vo_omapfb.c |  591 +++++++++++++++++++++++++++++++++++++++++++++++++++++
+ libvo/yuv.S       |  170 +++++++++++++++
+ 4 files changed, 764 insertions(+), 1 deletions(-)
+ create mode 100644 libvo/vo_omapfb.c
+ create mode 100644 libvo/yuv.S
+
+diff --git a/Makefile b/Makefile
+index d025f4f..44ed9d1 100644
+--- a/Makefile
++++ b/Makefile
+@@ -538,7 +538,7 @@ SRCS_MPLAYER-$(DIRECTX)      += libao2/ao_dsound.c libvo/vo_directx.c
+ SRCS_MPLAYER-$(DXR2)         += libao2/ao_dxr2.c libvo/vo_dxr2.c
+ SRCS_MPLAYER-$(DXR3)         += libvo/vo_dxr3.c
+ SRCS_MPLAYER-$(ESD)          += libao2/ao_esd.c
+-SRCS_MPLAYER-$(FBDEV)        += libvo/vo_fbdev.c libvo/vo_fbdev2.c
++SRCS_MPLAYER-$(FBDEV)        += libvo/vo_fbdev.c libvo/vo_fbdev2.c libvo/vo_omapfb.c libvo/yuv.S
+ SRCS_MPLAYER-$(FFMPEG)       += libvo/vo_png.c
+ SRCS_MPLAYER-$(GGI)          += libvo/vo_ggi.c
+ SRCS_MPLAYER-$(GIF)          += libvo/vo_gif89a.c
+diff --git a/libvo/video_out.c b/libvo/video_out.c
+index 74b7c52..7b3c01a 100644
+--- a/libvo/video_out.c
++++ b/libvo/video_out.c
+@@ -97,6 +97,7 @@ extern struct vo_driver video_out_zr2;
+ extern struct vo_driver video_out_bl;
+ extern struct vo_driver video_out_fbdev;
+ extern struct vo_driver video_out_fbdev2;
++extern struct vo_driver video_out_omapfb;
+ extern struct vo_driver video_out_svga;
+ extern struct vo_driver video_out_png;
+ extern struct vo_driver video_out_ggi;
+@@ -198,6 +199,7 @@ const struct vo_driver *video_out_drivers[] =
+ #ifdef CONFIG_FBDEV
+         &video_out_fbdev,
+         &video_out_fbdev2,
++        &video_out_omapfb,
+ #endif
+ #ifdef CONFIG_SVGALIB
+         &video_out_svga,
+diff --git a/libvo/vo_omapfb.c b/libvo/vo_omapfb.c
+new file mode 100644
+index 0000000..b26ee3a
+--- /dev/null
++++ b/libvo/vo_omapfb.c
+@@ -0,0 +1,591 @@
++/*
++ 
++Copyright (C) 2008 Gregoire Gentil <gregoire@gentil.com>
++Portions Copyright (C) 2009 Howard Chu <hyc@symas.com>
++This file adds an optimized vo output to mplayer for the OMAP platform. This is a first pass and an attempt to help to improve
++media playing on the OMAP platform. The usual disclaimer comes here: this code is provided without any warranty.
++Many bugs and issues still exist. Feed-back is welcome.
++
++This output uses the yuv420_to_yuv422 conversion from Mans Rullgard, and is heavily inspired from the work of Siarhei Siamashka.
++I would like to thank those two persons here, without them this code would certainly not exist.
++
++Two options of the output are available:
++fb_overlay_only (disabled by default): only the overlay is drawn. X11 stuff is ignored.
++dbl_buffer (disabled by default): add double buffering. Some tearsync flags are probably missing in the code.
++
++Syntax is the following:
++mplayer -ao alsa -vo omapfb /test.avi
++mplayer -nosound -vo omapfb:fb_overlay_only:dbl_buffer /test.avi
++
++You need to have two planes on your system. On beagleboard, it means something like: video=omapfb:vram:2M,vram:4M
++
++Known issues:
++1) A green line or some vertical lines (if mplayer decides to draw bands instead of frame) may appear.
++It's an interpolation bug in the color conversion that needs to be fixed
++
++2) The color conversion accepts only 16-pixel multiple for width and height.
++
++3) The scaling down is disabled as the scaling down kernel patch for the OMAP3 platform doesn't seem to work yet.
++
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 2 of the License, or
++ * (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
++*/
++ 
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++#include <fcntl.h>
++#include <unistd.h>
++#include <errno.h>
++
++#include <sys/mman.h>
++#include <sys/ioctl.h>
++#include <linux/fb.h>
++
++#include "config.h"
++#include "video_out.h"
++#include "video_out_internal.h"
++#include "fastmemcpy.h"
++#include "sub/sub.h"
++#include "mp_msg.h"
++#include "omapfb.h"
++#include "x11_common.h"
++
++#include "libswscale/swscale.h"
++#include "libmpcodecs/vf_scale.h"
++#include "libavcodec/avcodec.h"
++
++#include "aspect.h"
++
++#include "subopt-helper.h"
++
++#include <X11/Xlib.h>
++#include <X11/Xutil.h>
++#include <X11/Xatom.h>
++#include "wskeys.h"
++
++static vo_info_t info = {
++	"omapfb video driver",
++	"omapfb",
++	"",
++	""
++};
++
++LIBVO_EXTERN(omapfb)
++
++static int fb_overlay_only = 0; // if set, we need only framebuffer overlay, but do not need any x11 code
++static int dbl_buffer = 0;
++static int fullscreen_flag = 0;
++static int plane_ready = 0;
++static uint32_t drwX, drwY;
++
++extern void yuv420_to_yuv422(uint8_t *yuv, uint8_t *y, uint8_t *u, uint8_t *v, int w, int h, int yw, int cw, int dw);
++static struct fb_var_screeninfo sinfo_p0;
++static struct fb_var_screeninfo sinfo;
++static struct fb_var_screeninfo sinfo2;
++static struct fb_fix_screeninfo finfo;
++static struct omapfb_mem_info minfo;
++static struct omapfb_plane_info pinfo;
++static int xoff, yoff;
++
++static struct {
++    unsigned x;
++    unsigned y;
++    uint8_t *buf;
++} fb_pages[2];
++static int dev_fd = -1;
++static int fb_page_flip = 0;
++static int page = 0;
++static void omapfb_update(int x, int y, int out_w, int out_h, int show);
++
++extern void mplayer_put_key( int code );
++#include "osdep/keycodes.h"
++
++#define TRANSPARENT_COLOR_KEY 0xff0
++
++static Display *display = NULL; // pointer to X Display structure.
++static int screen_num; // number of screen to place the window on.
++static Window win = 0;
++static Window parent = 0; // pointer to the newly created window.
++
++/* This is used to intercept window closing requests.  */
++static Atom wm_delete_window;
++
++
++void vo_calc_drwXY(uint32_t *drwX, uint32_t *drwY)
++{
++    *drwX = *drwY = 0;
++    if (vo_fs) {
++        aspect(&vo_dwidth, &vo_dheight, A_ZOOM);
++        vo_dwidth  = FFMIN(vo_dwidth, vo_screenwidth);
++        vo_dheight = FFMIN(vo_dheight, vo_screenheight);
++        *drwX      = (vo_screenwidth - vo_dwidth) / 2;
++        *drwY      = (vo_screenheight - vo_dheight) / 2;
++        mp_msg(MSGT_VO, MSGL_V, "[vo-fs] dx: %d dy: %d dw: %d dh: %d\n",
++               *drwX, *drwY, vo_dwidth, vo_dheight);
++    } else if (WinID == 0) {
++        *drwX = vo_dx;
++        *drwY = vo_dy;
++    }
++}
++
++static void getPrimaryPlaneInfo()
++{
++    int dev_fd = open("/dev/fb0", O_RDWR);
++
++    if (dev_fd == -1) {
++        mp_msg(MSGT_VO, MSGL_FATAL, "[omapfb] Error /dev/fb0\n");
++        return -1;
++    }
++
++    ioctl(dev_fd, FBIOGET_VSCREENINFO, &sinfo_p0);
++    close(dev_fd);
++}
++
++/**
++ * Function to get the offset to be used when in windowed mode
++ * or when using -wid option
++ */
++static void x11_get_window_abs_position(Display *display, Window window,
++                                             int *wx, int *wy, int *ww, int *wh)
++{
++    Window root, parent;
++    Window *child;
++    unsigned int n_children;
++    XWindowAttributes attribs;
++
++    /* Get window attributes */
++    XGetWindowAttributes(display, window, &attribs);
++
++    /* Get relative position of given window */
++    *wx = attribs.x;
++    *wy = attribs.y;
++    if (ww)
++        *ww = attribs.width;
++    if (wh)
++        *wh = attribs.height;
++
++    /* Query window tree information */
++    XQueryTree(display, window, &root, &parent, &child, &n_children);
++    if (parent)
++    {
++      int x, y;
++      /* If we have a parent we must go there and discover his position*/
++      x11_get_window_abs_position(display, parent, &x, &y, NULL, NULL);
++      *wx += x;
++      *wy += y;
++    }
++
++    /* If we had children, free it */
++    if(n_children)
++        XFree(child);
++}
++
++static void x11_check_events(void)
++{
++    int e = vo_x11_check_events(mDisplay);
++
++    if (e & VO_EVENT_RESIZE)
++        vo_calc_drwXY(&drwX, &drwY);
++
++    if (e & VO_EVENT_EXPOSE || e & VO_EVENT_RESIZE)
++    {
++        vo_xv_draw_colorkey(drwX, drwY, vo_dwidth - 1, vo_dheight - 1);
++        omapfb_update(0, 0, 0, 0, 1);
++    }
++}
++
++static void x11_uninit()
++{
++    if (display) {
++        XCloseDisplay(display);
++        display = NULL;
++    }
++}
++
++/**
++ * Initialize framebuffer
++ */
++static int preinit(const char *arg)
++{
++    opt_t subopts[] = {
++        {"fb_overlay_only", OPT_ARG_BOOL, &fb_overlay_only, NULL},
++        {"dbl_buffer", OPT_ARG_BOOL, &dbl_buffer, NULL},
++        {NULL}
++    };
++
++    if (subopt_parse(arg, subopts) != 0) {
++        mp_msg(MSGT_VO, MSGL_FATAL, "[omapfb] unknown suboptions: %s\n", arg);
++        return -1;
++    }
++
++    getPrimaryPlaneInfo();
++    dev_fd = open("/dev/fb1", O_RDWR);
++
++    if (dev_fd == -1) {
++        mp_msg(MSGT_VO, MSGL_FATAL, "[omapfb] Error /dev/fb1\n");
++        return -1;
++    }
++
++    ioctl(dev_fd, FBIOGET_VSCREENINFO, &sinfo);
++    ioctl(dev_fd, OMAPFB_QUERY_PLANE, &pinfo);
++    ioctl(dev_fd, OMAPFB_QUERY_MEM, &minfo);
++
++    if (!fb_overlay_only && !vo_init())
++    {
++        mp_msg(MSGT_VO, MSGL_FATAL, "[omapfb] Could not open X, overlay only...\n");        
++        fb_overlay_only = 1;
++    }
++
++    return 0;
++}
++
++static void omapfb_update(int x, int y, int out_w, int out_h, int show)
++{
++    int xres, yres;
++    if (!fb_overlay_only)
++        x11_get_window_abs_position(mDisplay, vo_window, &x, &y, &out_w, &out_h);
++
++    /* Check for new screen rotation */
++    ioctl(dev_fd, FBIOGET_VSCREENINFO, &sinfo2);
++    if (sinfo2.rotate != sinfo_p0.rotate)
++        getPrimaryPlaneInfo();
++
++    if ( (!x && !y && !out_w && !out_h) ||
++        (out_w < sinfo.xres_virtual / 4) || (out_h < sinfo.yres_virtual / 4) ||  /* HW can't scale down by more than 4x */
++        (out_w > sinfo.xres_virtual * 8) || (out_h > sinfo.yres_virtual * 8) ) { /* HW can't scale up by more than 8x */
++        pinfo.enabled = 0;
++        pinfo.pos_x = 0;
++        pinfo.pos_y = 0;
++        ioctl(dev_fd, OMAPFB_SETUP_PLANE, &pinfo);
++        return;
++    }
++
++    xres = sinfo.xres_virtual;
++    yres = sinfo.yres_virtual;
++
++    /* Handle clipping: if the left or top edge of the window goes
++     * offscreen, clamp the overlay to the left or top edge of the
++     * screen, and set the difference into the frame offset. Also
++     * decrease the overlay size by the offset. The offset must
++     * take window scaling into account as well.
++     *
++     * Likewise, if the right or bottom edge of the window goes
++     * offscreen, clamp the overlay to the right or bottom edge of
++     * the screen, and decrease the overlay size accordingly. The
++     * hardware will truncate the output accordingly, so no offset
++     * is needed. Also take window scaling into account.  -- hyc
++     */
++    if (x < 0) {
++        /* clamp to left edge */
++        xoff = -x;
++        if (out_w != sinfo.xres_virtual) {
++            /* account for scaling */
++            xoff *= sinfo.xres_virtual;
++            xoff /= out_w;
++        }
++        xres -= xoff;
++        out_w += x;
++        x = 0;
++    } else {
++        xoff = 0;
++        if (x + out_w > sinfo_p0.xres) {
++            /* clamp to right edge */
++            int diff = sinfo_p0.xres - x;
++            if (out_w != sinfo.xres_virtual) {
++                /* account for scaling */
++                xres = diff * sinfo.xres_virtual;
++                xres /= out_w;
++            } else {
++                xres = diff;
++            }
++            out_w = diff;
++        }
++    }
++
++    if (y < 0) {
++        /* clamp to top edge - this seldom occurs since the window
++         * titlebar is usually forced to stay visible
++         */
++        yoff = -y;
++        if (out_h != sinfo.yres_virtual) {
++            /* account for scaling */
++            yoff *= sinfo.yres_virtual;
++            yoff /= out_h;
++        }
++        yres -= yoff;
++        out_h += y;
++        y = 0;
++    } else {
++        yoff = 0;
++        if (y + out_h > sinfo_p0.yres) {
++            /* clamp to bottom edge */
++            int diff = sinfo_p0.yres - y;
++            if (out_h != sinfo.yres_virtual) {
++                /* account for scaling */
++                yres = diff * sinfo.yres_virtual;
++                yres /= out_h;
++            } else {
++                yres = diff;
++            }
++            out_h = diff;
++        }
++    }
++
++    if (xoff & 1)
++        xoff++;
++    if (xres & 1)
++        xres--;
++
++    pinfo.enabled = show;
++    pinfo.pos_x = x;
++    pinfo.pos_y = y;
++    pinfo.out_width  = out_w;
++    pinfo.out_height = out_h;
++
++    sinfo.xoffset = fb_pages[page].x + xoff;
++    sinfo.yoffset = fb_pages[page].y + yoff;
++    /* If we had to change the overlay dimensions, update it */
++    if (xres != sinfo2.xres || yres != sinfo2.yres ||
++        sinfo.xoffset != sinfo2.xoffset ||
++        sinfo.yoffset != sinfo2.yoffset) {
++        sinfo.xres = xres;
++        sinfo.yres = yres;
++        sinfo.rotate = sinfo2.rotate;
++        ioctl(dev_fd, FBIOPUT_VSCREENINFO, &sinfo);
++    }
++
++    ioctl(dev_fd, OMAPFB_SETUP_PLANE, &pinfo);
++}
++
++static int config(uint32_t width, uint32_t height, uint32_t d_width,
++		uint32_t d_height, uint32_t flags, char *title,
++		uint32_t format)
++{
++    uint8_t *fbmem;
++    int i;
++    struct omapfb_color_key color_key;
++
++    XVisualInfo vinfo;
++    XSetWindowAttributes xswa;
++    XWindowAttributes attribs;
++    unsigned long xswamask;
++    int depth;
++
++    Window root, parent;
++    Window *child;
++    unsigned int n_children;
++
++    fullscreen_flag = flags & VOFLAG_FULLSCREEN;
++    if (!fb_overlay_only)
++    {
++        if (!title)
++            title = "MPlayer OMAPFB (X11/FB) render";
++
++        XGetWindowAttributes(mDisplay, mRootWin, &attribs);
++        depth = attribs.depth;
++        if (depth != 15 && depth != 16 && depth != 24 && depth != 32)
++            depth = 24;
++        XMatchVisualInfo(mDisplay, mScreen, depth, TrueColor, &vinfo);
++
++        xswa.border_pixel = 0;
++        xswa.background_pixel = xv_colorkey = TRANSPARENT_COLOR_KEY;
++
++        xswamask = CWBackPixel | CWBorderPixel;
++        xv_ck_info.method = CK_METHOD_BACKGROUND;
++
++        vo_x11_create_vo_window(&vinfo, vo_dx, vo_dy, vo_dwidth, vo_dheight,
++                                flags, CopyFromParent, "omapfb", title);
++        XChangeWindowAttributes(mDisplay, vo_window, xswamask, &xswa);
++
++        /* Need to receive events on the parent window -- so when it is
++           moved / resized / etc., we know. */
++        if(WinID > 0)
++        {
++            /* Query window tree information */
++            XQueryTree(mDisplay, vo_window, &root, &parent, &child, &n_children);
++            if (n_children)
++                XFree(child);
++
++            XUnmapWindow(mDisplay, vo_window);
++            if (parent)
++                XSelectInput(mDisplay, parent, StructureNotifyMask);
++            XMapWindow(mDisplay, vo_window);
++        }
++
++        vo_calc_drwXY(&drwX, &drwY);
++        vo_xv_draw_colorkey(drwX, drwY, vo_dwidth - 1, vo_dheight - 1);
++    }
++
++    fbmem = mmap(NULL, minfo.size, PROT_READ|PROT_WRITE, MAP_SHARED, dev_fd, 0);
++    if (fbmem == MAP_FAILED) {
++        mp_msg(MSGT_VO, MSGL_FATAL, "[omapfb] Error mmap\n");
++        return -1;
++    }
++
++    for (i = 0; i < minfo.size / 4; i++)
++        ((uint32_t*)fbmem)[i] = 0x80008000;
++
++    sinfo.xres = width & ~15;
++    sinfo.yres = height & ~15;
++    sinfo.xoffset = 0;
++    sinfo.yoffset = 0;
++    sinfo.nonstd = OMAPFB_COLOR_YUY422;
++
++    fb_pages[0].x = 0;
++    fb_pages[0].y = 0;
++    fb_pages[0].buf = fbmem;
++
++    if (dbl_buffer && minfo.size >= sinfo.xres * sinfo.yres * 2) {
++        sinfo.xres_virtual = sinfo.xres;
++        sinfo.yres_virtual = sinfo.yres * 2;
++        fb_pages[1].x = 0;
++        fb_pages[1].y = sinfo.yres;
++        fb_pages[1].buf = fbmem + sinfo.xres * sinfo.yres * 2;
++        fb_page_flip = 1;
++    } else {
++        sinfo.xres_virtual = sinfo.xres;
++        sinfo.yres_virtual = sinfo.yres;
++        fb_page_flip = 0;
++    }
++
++    ioctl(dev_fd, FBIOPUT_VSCREENINFO, &sinfo);
++    ioctl(dev_fd, FBIOGET_FSCREENINFO, &finfo);
++
++    if (WinID <= 0) {
++        if (fullscreen_flag) {
++            omapfb_update(0, 0, sinfo_p0.xres, sinfo_p0.yres, 1);
++        } else {
++            omapfb_update(sinfo_p0.xres / 2 - sinfo.xres / 2, sinfo_p0.yres / 2 - sinfo.yres / 2, sinfo.xres, sinfo.yres, 1);
++        }
++    }
++
++    color_key.channel_out = OMAPFB_CHANNEL_OUT_LCD;
++    color_key.background = 0x0;
++    color_key.trans_key = TRANSPARENT_COLOR_KEY;
++    if (fb_overlay_only)
++        color_key.key_type = OMAPFB_COLOR_KEY_DISABLED;
++    else
++        color_key.key_type = OMAPFB_COLOR_KEY_GFX_DST;
++    ioctl(dev_fd, OMAPFB_SET_COLOR_KEY, &color_key);
++
++    plane_ready = 1;
++    return 0;
++}
++
++static void draw_alpha(int x0, int y0, int w, int h, unsigned char *src, unsigned char *srca, int stride)
++{
++    vo_draw_alpha_yuy2(w, h, src, srca, stride, fb_pages[page].buf + y0 * finfo.line_length + x0 * 2, finfo.line_length);
++}
++
++static void draw_osd(void)
++{
++    vo_draw_text(sinfo.xres, sinfo.yres, draw_alpha);
++}
++
++static int draw_frame(uint8_t *src[])
++{
++    return 1;
++}
++
++static int draw_slice(uint8_t *src[], int stride[], int w, int h, int x, int y)
++{
++    if (x!=0)
++        return 0;
++
++    if (!plane_ready)
++        return 0;
++
++    ioctl(dev_fd, OMAPFB_SYNC_GFX);
++
++    yuv420_to_yuv422(fb_pages[page].buf + y * finfo.line_length, src[0], src[1], src[2], w & ~15, h, stride[0], stride[1], finfo.line_length);
++    return 0;
++}
++
++static void flip_page(void)
++{
++    if (fb_page_flip) {
++        sinfo.xoffset = fb_pages[page].x + xoff;
++        sinfo.yoffset = fb_pages[page].y + yoff;
++        ioctl(dev_fd, FBIOPAN_DISPLAY, &sinfo);
++        page ^= fb_page_flip;
++    }
++}
++
++static int query_format(uint32_t format)
++{
++    // For simplicity pretend that we can only do YV12, support for
++    // other formats can be added quite easily if/when needed
++    if (format != IMGFMT_YV12)
++        return 0;
++
++    return VFCAP_CSP_SUPPORTED | VFCAP_CSP_SUPPORTED_BY_HW | VFCAP_OSD | VFCAP_SWSCALE | VFCAP_ACCEPT_STRIDE;
++}
++
++
++/**
++ * Uninitialize framebuffer
++ */
++static void uninit()
++{
++    pinfo.enabled = 0;
++    ioctl(dev_fd, OMAPFB_SETUP_PLANE, &pinfo);
++
++    if (!fb_overlay_only) {
++        struct omapfb_color_key color_key;
++        color_key.channel_out = OMAPFB_CHANNEL_OUT_LCD;
++        color_key.key_type = OMAPFB_COLOR_KEY_DISABLED;
++        ioctl(dev_fd, OMAPFB_SET_COLOR_KEY, &color_key);
++    }
++
++    close(dev_fd);
++
++    if (!fb_overlay_only)
++        x11_uninit();
++}
++
++
++static int control(uint32_t request, void *data)
++{
++    switch (request) {
++        case VOCTRL_QUERY_FORMAT:
++            return query_format(*((uint32_t*)data));
++        case VOCTRL_FULLSCREEN: {
++            if (WinID > 0) return VO_FALSE;
++            if (fullscreen_flag) {
++                if (!fb_overlay_only)
++                    vo_x11_fullscreen();
++                fullscreen_flag = 0;
++                omapfb_update(sinfo_p0.xres / 2 - sinfo.xres / 2, sinfo_p0.yres / 2 - sinfo.yres / 2, sinfo.xres, sinfo.yres, 1);
++            } else {
++                if (!fb_overlay_only)
++                    vo_x11_fullscreen();
++                fullscreen_flag = 1;
++                omapfb_update(0, 0, sinfo_p0.xres, sinfo_p0.yres, 1);
++            }
++            return VO_TRUE;
++        }
++        case VOCTRL_UPDATE_SCREENINFO:
++            update_xinerama_info();
++            return VO_TRUE;
++    }
++    return VO_NOTIMPL;
++}
++
++
++static void check_events(void)
++{
++    if (!fb_overlay_only)
++        x11_check_events();
++}
+diff --git a/libvo/yuv.S b/libvo/yuv.S
+new file mode 100644
+index 0000000..1cd2c1d
+--- /dev/null
++++ b/libvo/yuv.S
+@@ -0,0 +1,170 @@
++/*
++    Copyright (C) 2008 Mans Rullgard
++
++    Permission is hereby granted, free of charge, to any person
++    obtaining a copy of this software and associated documentation
++    files (the "Software"), to deal in the Software without
++    restriction, including without limitation the rights to use, copy,
++    modify, merge, publish, distribute, sublicense, and/or sell copies
++    of the Software, and to permit persons to whom the Software is
++    furnished to do so, subject to the following conditions:
++
++    The above copyright notice and this permission notice shall be
++    included in all copies or substantial portions of the Software.
++
++    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
++    EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
++    NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
++    HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
++    WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
++    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
++    DEALINGS IN THE SOFTWARE.
++ */
++
++        .macro mov32    rd, val
++        movw            \rd, #:lower16:\val
++        movt            \rd, #:upper16:\val
++        .endm
++
++        .fpu neon
++        .text
++
++@ yuv420_to_yuv422(uint8_t *yuv, uint8_t *y, uint8_t *u, uint8_t *v,
++@                  int w, int h, int yw, int cw, int dw)
++
++#define yuv  r0
++#define y    r1
++#define u    r2
++#define v    r3
++#define w    r4
++#define h    r5
++#define yw   r6
++#define cw   r7
++#define dw   r8
++
++#define tyuv r9
++#define ty   r10
++#define tu   r11
++#define tv   r12
++#define i    lr
++
++        .global yuv420_to_yuv422
++        .func   yuv420_to_yuv422
++yuv420_to_yuv422:
++        push            {r4-r11,lr}
++        add             r4,  sp,  #36
++.Ldo_conv:
++        ldm             r4, {r4-r8}
++        push            {r4}
++1:
++        mov             tu,   u
++        mov             tv,   v
++        vld1.64         {d2}, [u,:64], cw               @ u0
++        vld1.64         {d3}, [v,:64], cw               @ v0
++        mov             tyuv, yuv
++        mov             ty,   y
++        vzip.8          d2,   d3                        @ u0v0
++        mov             i,    #16
++2:                      
++        pld             [y, #64]
++        vld1.64         {d0, d1},   [y,:128], yw        @ y0
++        pld             [u, #64]
++        subs            i,    i,    #4
++        vld1.64         {d6},       [u,:64],  cw        @ u2
++        pld             [y, #64]
++        vld1.64         {d4, d5},   [y,:128], yw        @ y1
++        pld             [v, #64]
++        vld1.64         {d7},       [v,:64],  cw        @ v2
++        pld             [y, #64]
++        vld1.64         {d16,d17},  [y,:128], yw        @ y2
++        vzip.8          d6,   d7                        @ u2v2
++        pld             [u, #64]
++        vld1.64         {d22},      [u,:64],  cw        @ u4
++        pld             [v, #64]
++        vld1.64         {d23},      [v,:64],  cw        @ v4
++        pld             [y, #64]
++        vld1.64         {d20,d21},  [y,:128], yw        @ y3
++        vmov            q9,   q3                        @ u2v2
++        vzip.8          d22,  d23                       @ u4v4
++        vrhadd.u8       q3,   q1,   q3                  @ u1v1
++        vzip.8          q0,   q1                        @ y0u0y0v0
++        vmov            q12,  q11                       @ u4v4
++        vzip.8          q2,   q3                        @ y1u1y1v1
++        vrhadd.u8       q11,  q9,   q11                 @ u3v3
++        vst1.64         {d0-d3},    [yuv,:128], dw      @ y0u0y0v0
++        vzip.8          q8,   q9                        @ y2u2y2v2
++        vst1.64         {d4-d7},    [yuv,:128], dw      @ y1u1y1v1
++        vzip.8          q10,  q11                       @ y3u3y3v3
++        vst1.64         {d16-d19},  [yuv,:128], dw      @ y2u2y2v2
++        vmov            q1,   q12
++        vst1.64         {d20-d23},  [yuv,:128], dw      @ y3u3y3v3
++        bgt             2b
++
++        subs            w,    w,    #16
++        add             yuv,  tyuv, #32
++        add             y,    ty,   #16
++        add             u,    tu,   #8
++        add             v,    tv,   #8
++        bgt             1b
++
++        ldr             w,    [sp]
++        subs            h,    h,    #16
++        add             yuv,  yuv,  dw, lsl #4
++        sub             yuv,  yuv,  w,  lsl #1
++        add             y,    y,    yw, lsl #4
++        sub             y,    y,    w
++        add             u,    u,    cw, lsl #3
++        sub             u,    u,    w,  asr #1
++        add             v,    v,    cw, lsl #3
++        sub             v,    v,    w,  asr #1
++        bgt             1b
++
++        pop             {r3-r11,pc}
++        .endfunc
++
++        .func   neon_open
++neon_open:
++        push            {r4-r8,lr}
++        ldrd            r4,  r5,  [r0, #16]
++        ldrd            r6,  r7,  [r0, #24]
++        lsl             r8,  r4,  #1
++        mov32           r0,  conv_params
++        stm             r0,  {r4-r8}
++        mov             r0,  #0
++        pop             {r4-r8,pc}
++        .endfunc
++
++        .func   neon_convert
++neon_convert:
++        push            {r4-r11,lr}
++        ldr             r0,  [r0]
++        mov32           r4,  conv_params
++        ldm             r1,  {r1-r3}
++        b               .Ldo_conv
++        .endfunc
++
++        .func   neon_nop
++neon_nop:
++        bx              lr
++        .endfunc
++
++        .section .bss
++conv_params:
++        .skip           5*4
++        .size           conv_params, . - conv_params
++
++        .section        .rodata
++.Lname: .asciz          "neon"
++ofb_pixconv_neon:
++        .word           .Lname
++        .word           0               @ flags
++        .word           neon_open
++        .word           neon_convert
++        .word           neon_nop        @ finish
++        .word           neon_nop        @ close
++        .size           ofb_pixconv_neon, . - ofb_pixconv_neon
++
++        .section        .ofb_pixconv, "a"
++ofb_pixconv_neon_p:
++        .word           ofb_pixconv_neon
+-- 
+1.7.3.2
+
diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer/codecs_conf-VP8.diff b/meta-oe/recipes-multimedia/mplayer/mplayer/codecs_conf-VP8.diff
new file mode 100644
index 0000000..ef923dd
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer/codecs_conf-VP8.diff
@@ -0,0 +1,19 @@
+Index: etc/codecs.conf
+===================================================================
+--- etc/codecs.conf	(revision 29308)
++++ etc/codecs.conf	(working copy)
+@@ -1942,6 +1942,14 @@
+   out YUY2
+   out BGR32,BGR24
+ 
++videocodec fflibvpxvp8
++  info "FFmpeg wrapper for libvpx/VP8"
++  status working
++  fourcc VP80
++  driver ffmpeg
++  dll "libvpx_vp8"
++  out YV12
++
+ videocodec mwv1
+   info "Motion Wavelets"
+   status working
diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer/configure-libvpx_test.diff b/meta-oe/recipes-multimedia/mplayer/mplayer/configure-libvpx_test.diff
new file mode 100644
index 0000000..35250c3
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer/configure-libvpx_test.diff
@@ -0,0 +1,72 @@
+--- /tmp/configure	2010-06-23 12:12:45.000000000 +0200
++++ trunk/configure	2010-06-23 12:13:53.000000000 +0200
+@@ -302,6 +302,7 @@
+   --disable-libdirac-lavc   disable Dirac in libavcodec [autodetect]
+   --disable-libschroedinger-lavc   disable Dirac in libavcodec (Schroedinger
+                                    decoder) [autodetect]
++  --disable-libvpx-vp8-lavc disable VP8 in libavcodec [autodetect]
+   --disable-libnut          disable libnut [autodetect]
+   --disable-libavutil_a     disable static libavutil [autodetect]
+   --disable-libavcodec_a    disable static libavcodec [autodetect]
+@@ -689,6 +690,7 @@
+ _x264_lavc=auto
+ _libdirac_lavc=auto
+ _libschroedinger_lavc=auto
++_libvpx_vp8_lavc=auto
+ _libnut=auto
+ _lirc=auto
+ _lircc=auto
+@@ -1142,6 +1144,8 @@
+   --disable-libdirac-lavc)  _libdirac_lavc=no   ;;
+   --enable-libschroedinger-lavc)   _libschroedinger_lavc=yes  ;;
+   --disable-libschroedinger-lavc)  _libschroedinger_lavc=no   ;;
++  --enable-libvpx-vp8-lavc)   _libvpx_vp8_lavc=yes  ;;
++  --disable-libvpx-vp8-lavc)  _libvpx_vp8_lavc=no   ;;
+   --enable-libnut)	_libnut=yes	;;
+   --disable-libnut)	_libnut=no	;;
+   --enable-libavutil_a)		_libavutil_a=yes	;;
+@@ -7425,6 +7429,44 @@
+ fi
+ echores "$_libschroedinger_lavc"
+ 
++echocheck "libvpx_vp8"
++if test "$_libvpx_vp8_lavc" = auto; then
++  _libvpx_vp8_lavc=no
++  if test "$_libavcodec_a" != yes; then
++    res_comment="libavcodec (static) is required by libvpx_vp8, sorry"
++  else
++    cat > $TMPC << EOF
++#define HAVE_STDINT_H 1
++#include <vpx_decoder.h>
++#include <vp8dx.h>
++#include <vpx_encoder.h>
++#include <vp8cx.h>
++int main(void)
++{
++    vpx_codec_dec_init(NULL,&vpx_codec_vp8_dx_algo,NULL,0);
++    vpx_codec_enc_init(NULL,&vpx_codec_vp8_cx_algo,NULL,0);
++    return 0;
++}
++EOF
++    _inc_vpx_vp8=
++    _ld_vpx_vp8=-lvpx
++    cc_check $_inc_vpx_vp8 $_ld_vpx_vp8        &&
++    _libvpx_vp8_lavc=yes                       &&
++    extra_cflags="$extra_cflags $_inc_vpx_vp8" &&
++    extra_ldflags="$extra_ldflags $_ld_vpx_vp8"
++  fi
++fi
++if test "$_libvpx_vp8_lavc" = yes ; then
++  def_libvpx_vp8_lavc='#define CONFIG_LIBVPX_VP8 1'
++  _libavencoders="$_libavencoders LIBVPX_VP8_ENCODER"
++  _libavdecoders="$_libavdecoders LIBVPX_VP8_DECODER"
++  codecmodules="libvpx_vp8 $codecmodules"
++else
++  def_libvpx_vp8_lavc='#define CONFIG_LIBVPX_VP8 0'
++  nocodecmodules="libvpx_vp8 $nocodecmodules"
++fi
++echores "$_libvpx_vp8_lavc"
++
+ echocheck "libnut"
+ if test "$_libnut" = auto ; then
+   cat > $TMPC << EOF
diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer/demux_mkv-V_VP8__webm_doctype.diff b/meta-oe/recipes-multimedia/mplayer/mplayer/demux_mkv-V_VP8__webm_doctype.diff
new file mode 100644
index 0000000..58b6e70
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer/demux_mkv-V_VP8__webm_doctype.diff
@@ -0,0 +1,33 @@
+Index: libmpdemux/demux_mkv.c
+===================================================================
+--- libmpdemux/demux_mkv.c	(revision 31032)
++++ libmpdemux/demux_mkv.c	(working copy)
+@@ -1519,6 +1519,7 @@ static const videocodec_info_t vinfo[] =
+   { MKV_V_MPEG4_AP,  mmioFOURCC('m', 'p', '4', 'v'), 1 },
+   { MKV_V_MPEG4_AVC, mmioFOURCC('a', 'v', 'c', '1'), 1 },
+   { MKV_V_THEORA,    mmioFOURCC('t', 'h', 'e', 'o'), 1 },
++  { MKV_V_VP8,       mmioFOURCC('V', 'P', '8', '0'), 0 },
+   { NULL, 0, 0 }
+ };
+ 
+@@ -2053,7 +2054,7 @@ demux_mkv_open (demuxer_t *demuxer)
+ 
+   stream_seek(s, s->start_pos);
+   str = ebml_read_header (s, &version);
+-  if (str == NULL || strcmp (str, "matroska") || version > 2)
++  if (str == NULL || (strcmp (str, "matroska") && strcmp (str, "webm")) || version > 2)
+     {
+       mp_msg (MSGT_DEMUX, MSGL_DBG2, "[mkv] no head found\n");
+       return 0;
+Index: libmpdemux/matroska.h
+===================================================================
+--- libmpdemux/matroska.h	(revision 31032)
++++ libmpdemux/matroska.h	(working copy)
+@@ -69,6 +69,7 @@
+ #define MKV_V_MPEG4_AP   "V_MPEG4/ISO/AP"
+ #define MKV_V_MPEG4_AVC  "V_MPEG4/ISO/AVC"
+ #define MKV_V_THEORA     "V_THEORA"
++#define MKV_V_VP8        "V_VP8"
+ 
+ #define MKV_S_TEXTASCII  "S_TEXT/ASCII"
+ #define MKV_S_TEXTUTF8   "S_TEXT/UTF8"
diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer/mplayer.conf b/meta-oe/recipes-multimedia/mplayer/mplayer/mplayer.conf
new file mode 100644
index 0000000..92aeb15
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer/mplayer.conf
@@ -0,0 +1,15 @@
+
+# You probably shouldn't touch these
+ac=mad,
+ao=oss,
+
+# Required on SL-Cxxxx for correct rotation in the *VT*,
+# breaks rotation in X!
+# vf=rotate=1
+
+# Enable fullscreen display by default
+# fs=true
+
+# Drop frames to keep audio and video in sync
+framedrop=true
+
diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer/offset.patch b/meta-oe/recipes-multimedia/mplayer/mplayer/offset.patch
new file mode 100644
index 0000000..3b90867
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer/offset.patch
@@ -0,0 +1,11 @@
+--- /tmp/asm-offsets.h	2010-12-29 18:25:51.000000000 +0100
++++ trunk/ffmpeg/libavcodec/arm/asm-offsets.h	2010-12-29 18:26:21.000000000 +0100
+@@ -35,7 +35,7 @@
+ #define AC_PRED                  0xa80
+ #define BLOCK_LAST_INDEX         0x2160
+ #define INTER_SCANTAB_RASTER_END 0x2360
+-#define H263_AIC                 0x2610
++#define H263_AIC                 0x2618
+ #elif defined(__APPLE__)
+ #define Y_DC_SCALE               0xa30
+ #define C_DC_SCALE               0xa34
diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer/vofw-swscale.diff b/meta-oe/recipes-multimedia/mplayer/mplayer/vofw-swscale.diff
new file mode 100644
index 0000000..6a6b82c
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer/vofw-swscale.diff
@@ -0,0 +1,16 @@
+Needed for encoding large images with mencoder or grabbing large image from a v4l src
+
+--- /tmp/swscale_internal.h	2010-10-05 09:15:42.000000000 +0200
++++ trunk/libswscale/swscale_internal.h	2010-10-05 09:16:07.000000000 +0200
+@@ -33,11 +33,7 @@
+ 
+ #define MAX_FILTER_SIZE 256
+ 
+-#if ARCH_X86
+ #define VOFW 5120
+-#else
+-#define VOFW 2048 // faster on PPC and not tested on others
+-#endif
+ 
+ #define VOF  (VOFW*2)
+ 
diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer_svn.bb b/meta-oe/recipes-multimedia/mplayer/mplayer_svn.bb
new file mode 100644
index 0000000..5a59963
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer_svn.bb
@@ -0,0 +1,250 @@
+DESCRIPTION = "Open Source multimedia player."
+SECTION = "multimedia"
+PRIORITY = "optional"
+HOMEPAGE = "http://www.mplayerhq.hu/"
+DEPENDS = "libvpx live555 libdvdread libdvdcss libtheora virtual/libsdl xsp zlib libpng jpeg liba52 freetype fontconfig alsa-lib lzo ncurses libxv virtual/libx11 virtual/kernel\
+	   ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad liba52 lame ffmpeg', d)}"
+
+RRECOMMENDS_${PN} = "libdvdcss"
+
+LICENSE = "GPL"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=91f1cb870c1cc2d31351a4d2595441cb"
+SRC_URI = "svn://svn.mplayerhq.hu/mplayer;module=trunk \
+	   file://makefile-nostrip-svn.patch \
+	   file://mplayer-arm-pld.patch \
+	   file://mplayer-lavc-arm.patch;maxrev=30166 \
+       file://fix-exp.diff;maxrev=30291 \
+	   file://fix-addrinfo.patch;maxrev=30302 \
+       file://fix-avconfig.diff;maxrev=30376 \
+	   file://fix-emu_qtx_api.diff;maxrev=30165 \
+       file://codecs_conf-VP8.diff;striplevel=0;maxrev=30166 \
+       file://demux_mkv-V_VP8__webm_doctype.diff;striplevel=0;maxrev=30166 \
+       file://configure-libvpx_test.diff;maxrev=30166 \
+       file://vofw-swscale.diff \
+       file://offset.patch;minrev=32735 \
+       file://0001-MPlayer-FFmpeg-VP8-encode-decode-patches-using-libvp.patch;minrev=32735 \
+"
+
+SRCREV = "32735"
+SRC_URI_append_armv7a = " \
+       file://omapfb.patch;maxrev=30166 \
+       file://vo_omapfb.c \
+       file://yuv.S \
+       file://0001-omapfb.patch;minrev=30166 \
+	  "
+
+# This is required for the collie machine only as all stacks in that
+# machine seem to be set to executable by the toolchain. If someone
+# discovers this is more general than please make this more general
+# ie. for all armv4 machines.
+SRC_URI_append_collie = "file://disable-executable-stack-test.patch"
+
+PACKAGE_ARCH_collie = "collie"
+PACKAGE_ARCH_c7x0 = "c7x0"
+PACKAGE_ARCH_hx4700 = "hx4700"
+
+ARM_INSTRUCTION_SET = "ARM"
+
+RCONFLICTS_${PN} = "mplayer-atty"
+RREPLACES_${PN} = "mplayer-atty"
+
+PV = "0.0+1.0rc3+svnr${SRCPV}"
+PR = "r29"
+DEFAULT_PREFERENCE = "-1"
+DEFAULT_PREFERENCE_angstrom = "1"
+DEFAULT_PREFERENCE_shr = "1"
+
+PARALLEL_MAKE = ""
+
+S = "${WORKDIR}/trunk"
+
+PACKAGES =+ "mencoder"
+
+FILES_${PN} = "${bindir}/mplayer ${libdir} /usr${sysconfdir}/mplayer"
+FILES_mencoder = "${bindir}/mencoder"
+
+inherit autotools pkgconfig
+
+# We want a kernel header for armv7a, but we don't want to make mplayer machine specific for that
+STAGING_KERNEL_DIR = "${STAGING_DIR}/${MACHINE_ARCH}/kernel"
+
+EXTRA_OECONF = " \
+	--prefix=/usr \
+	--mandir=${mandir} \
+	--target=${SIMPLE_TARGET_SYS} \
+	\
+	--enable-mencoder \
+	--disable-gui \
+	--enable-largefiles \
+	--disable-lirc \
+	--disable-lircc \
+	--disable-joystick \
+	--disable-vm \
+	--disable-xf86keysym \
+	--enable-tv \
+	--disable-tv-v4l1 \	 
+	--enable-tv-v4l2 \
+	--disable-tv-bsdbt848 \
+	--enable-networking \
+	--enable-rtc \
+	--disable-smb \
+	--enable-live \
+	--disable-dvdnav \
+	--enable-dvdread \
+	--disable-dvdread-internal \
+	--enable-libdvdcss-internal \
+	--disable-cdparanoia \
+	--enable-freetype \
+	--enable-menu \
+	--enable-sortsub \
+	--disable-fribidi \
+	--disable-enca \
+	--disable-ftp \
+	--disable-vstream \
+	\
+	--disable-gif \
+	--enable-png \
+	--enable-jpeg \
+	--disable-libcdio \
+	--disable-liblzo \
+	--disable-qtx \
+	--disable-xanim \
+	--disable-real \
+	--disable-xvid \
+	--disable-x264 \
+	\
+	--disable-ffmpeg_so \
+	\
+	--enable-tremor-low \
+	\
+	--disable-speex \
+	--enable-theora \
+	--disable-faac \
+	--disable-ladspa \
+	--disable-libdv \
+	--disable-mad \
+	--disable-toolame \
+	--disable-twolame \
+	--disable-xmms \
+	--disable-mp3lib \
+	--enable-libmpeg2 \
+	--disable-musepack \
+	\
+	--disable-gl \
+	--disable-vesa \
+	--disable-svga \
+	--enable-sdl \
+	--disable-aa \
+	--disable-caca \
+	--disable-ggi \
+	--disable-ggiwmh \
+	--disable-directx \
+	--disable-dxr2 \
+	--disable-dxr3 \
+	--enable-dvb \
+	--disable-mga \
+	--disable-xmga \
+	--enable-xv \
+	--disable-xvmc \
+	--disable-vm \
+	--disable-xinerama \
+	--enable-x11 \
+	--enable-fbdev \
+	--disable-mlib \
+	--disable-3dfx \
+	--disable-tdfxfb \
+	--disable-s3fb \
+	--disable-directfb \
+	--disable-zr \
+	--disable-bl \
+	--disable-tdfxvid \
+	--disable-tga \
+	--disable-pnm \
+	--disable-md5sum \
+	--disable-xss \
+	--disable-dga1 \
+	--disable-dga2 \
+	\
+	--enable-alsa \
+	--enable-ossaudio \
+	--disable-arts \
+	--disable-esd \
+	--disable-pulse \
+	--disable-jack \
+	--disable-openal \
+	--disable-nas \
+	--disable-sgiaudio \
+	--disable-sunaudio \
+	--disable-win32waveout \
+	--enable-select \
+	--enable-libvpx-lavc \
+	\
+	--extra-libs=' -lvpx -lBasicUsageEnvironment -lUsageEnvironment -lgroupsock -lliveMedia -lstdc++' \
+    --enable-protocol='file_protocol pipe_protocol http_protocol rtmp_protocol tcp_protocol udp_protocol' \
+"
+
+EXTRA_OECONF_append_arm = " --disable-decoder=vorbis_decoder \
+				--disable-encoder=vorbis_encoder"
+
+EXTRA_OECONF_append_armv6 = " --enable-armv6"
+EXTRA_OECONF_append_armv7a = " --enable-armv6 --enable-neon"
+
+
+#build with support for the iwmmxt instruction and pxa270fb overlay support (pxa270 and up)
+#not every iwmmxt machine has the lcd connected to pxafb, but building the module doesn't hurt 
+MY_ARCH := "${PACKAGE_ARCH}"
+PACKAGE_ARCH = "${@base_contains('MACHINE_FEATURES', 'iwmmxt', 'iwmmxt', '${MY_ARCH}',d)}"
+
+MY_TARGET_CC_ARCH := "${TARGET_CC_ARCH}"
+TARGET_CC_ARCH = "${@base_contains('MACHINE_FEATURES', 'iwmmxt', '-march=iwmmxt -mtune=iwmmxt', '${MY_TARGET_CC_ARCH}',d)}"
+
+EXTRA_OECONF_append = " ${@base_contains('MACHINE_FEATURES', 'iwmmxt', ' --enable-iwmmxt', '',d)} "
+EXTRA_OECONF_append = " ${@base_contains('MACHINE_FEATURES', 'x86', '--enable-runtime-cpudetection', '',d)} "
+
+FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O4 -ffast-math"
+FULL_OPTIMIZATION_armv7a = "-fno-tree-vectorize -fomit-frame-pointer -O4 -frename-registers -ffast-math"
+BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
+# FIXME: Temporarily disable debugging to work-around http://gcc.gnu.org/bugzilla/show_bug.cgi?id=37987
+DEBUG_OPTIMIZATION_spitz = "-O -fomit-frame-pointer -g"
+DEBUG_OPTIMIZATION_akita = "-O -fomit-frame-pointer -g"
+
+do_configure_prepend_armv7a() {
+	if [ -e ${S}/libvo/yuv.S ] ; then
+		echo "files already present"
+	else
+		cp ${WORKDIR}/yuv.S ${S}/libvo
+	 	cp ${WORKDIR}/vo_omapfb.c ${S}/libvo
+	fi
+	cp ${STAGING_KERNEL_DIR}/arch/arm/plat-omap/include/mach/omapfb.h ${S}/libvo/omapfb.h || true
+ 	cp ${STAGING_KERNEL_DIR}/include/asm-arm/arch-omap/omapfb.h ${S}/libvo/omapfb.h || true
+	cp ${STAGING_KERNEL_DIR}/include/linux/omapfb.h ${S}/libvo/omapfb.h || true
+ 	sed -e 's/__user//g' -i ${S}/libvo/omapfb.h || true
+
+	# Don't use hardfp args when using softfp
+	sed -i -e 's:if HAVE_VFP_ARGS:ifdef __ARM_PCS_VFP:' ${S}/ffmpeg/libavcodec/arm/asm.S
+}
+
+CFLAGS_append = " -I${S}/libdvdread4 "
+
+do_configure() {
+	sed -i 's|/usr/include|${STAGING_INCDIR}|g' ${S}/configure
+	sed -i 's|/usr/lib|${STAGING_LIBDIR}|g' ${S}/configure
+	sed -i 's|/usr/\S*include[\w/]*||g' ${S}/configure
+	sed -i 's|/usr/\S*lib[\w/]*||g' ${S}/configure
+	sed -i 's|HOST_CC|BUILD_CC|' ${S}/Makefile
+
+	export SIMPLE_TARGET_SYS="$(echo ${TARGET_SYS} | sed s:${TARGET_VENDOR}::g)"
+	./configure ${EXTRA_OECONF}
+	
+}
+
+do_compile () {
+	oe_runmake
+}
+
+do_install() {
+install -d "${D}/usr${sysconfdir}/mplayer"
+
+install -m 0644 ${WORKDIR}/mplayer.conf "${D}/usr${sysconfdir}/mplayer"
+}
+
-- 
1.7.0.4



