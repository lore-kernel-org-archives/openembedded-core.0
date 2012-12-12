Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tie5S-0005OZ-NA
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Dec 2012 05:38:28 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 11 Dec 2012 20:23:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,264,1355126400"; d="scan'208";a="230288800"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.105])
	by azsmga001.ch.intel.com with ESMTP; 11 Dec 2012 20:23:51 -0800
Message-ID: <50C806D7.4030606@linux.intel.com>
Date: Tue, 11 Dec 2012 20:23:51 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1355262869-4600-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1355262869-4600-1-git-send-email-ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libmatchbox: upgrade to 1.10, drop git
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
X-List-Received-Date: Wed, 12 Dec 2012 04:38:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/2012 01:54 PM, Ross Burton wrote:
> All patches have been upstreamed so drop them, and as upstream isn't heavily
> developed drop the git recipe.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   .../libmatchbox/files/16bppfixes-2.patch           |  260 --------------------
>   .../libmatchbox/files/16bppfixes.patch             |   38 ---
>   .../libmatchbox/files/autofoo.patch                |   21 --
>   .../libmatchbox/files/configure_fixes.patch        |   81 ------
>   .../libmatchbox/files/fix-configure-for-1.9.patch  |   16 --
>   .../libmatchbox/files/matchbox-start-fix.patch     |   23 --
>   meta/recipes-graphics/libmatchbox/libmatchbox.inc  |   17 --
>   .../libmatchbox/libmatchbox_1.10.bb                |   28 +++
>   .../libmatchbox/libmatchbox_1.9.bb                 |   16 --
>   .../libmatchbox/libmatchbox_git.bb                 |   16 --
>   10 files changed, 28 insertions(+), 488 deletions(-)
>   delete mode 100644 meta/recipes-graphics/libmatchbox/files/16bppfixes-2.patch
>   delete mode 100644 meta/recipes-graphics/libmatchbox/files/16bppfixes.patch
>   delete mode 100644 meta/recipes-graphics/libmatchbox/files/autofoo.patch
>   delete mode 100644 meta/recipes-graphics/libmatchbox/files/configure_fixes.patch
>   delete mode 100644 meta/recipes-graphics/libmatchbox/files/fix-configure-for-1.9.patch
>   delete mode 100644 meta/recipes-graphics/libmatchbox/files/matchbox-start-fix.patch
>   delete mode 100644 meta/recipes-graphics/libmatchbox/libmatchbox.inc
>   create mode 100644 meta/recipes-graphics/libmatchbox/libmatchbox_1.10.bb
>   delete mode 100644 meta/recipes-graphics/libmatchbox/libmatchbox_1.9.bb
>   delete mode 100644 meta/recipes-graphics/libmatchbox/libmatchbox_git.bb
>

Seems to introduce and issue with matchbox_keyboard:
> ERROR: Function failed: do_compile (see /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/work/ppc603e-poky-linux/matchbox-keyboard/0.0+git1+b38f24036cff3be6c2fbcf9ca9881803e69003ac-r3/temp/log.do_compile.8278 for further information)
> ERROR: Logfile of failure stored in: /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/work/ppc603e-poky-linux/matchbox-keyboard/0.0+git1+b38f24036cff3be6c2fbcf9ca9881803e69003ac-r3/temp/log.do_compile.8278
> Log data follows:
> | DEBUG: SITE files ['endian-big', 'bit-32', 'powerpc-common', 'common-linux', 'common-glibc', 'powerpc32-linux', 'powerpc-linux', 'common']
> | DEBUG: Executing shell function do_compile
> | NOTE: make -j 16
> | make  all-recursive
> | make[1]: Entering directory `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/work/ppc603e-poky-linux/matchbox-keyboard/0.0+git1+b38f24036cff3be6c2fbcf9ca9881803e69003ac-r3/git'
> | Making all in src
> | make[2]: Entering directory `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/work/ppc603e-poky-linux/matchbox-keyboard/0.0+git1+b38f24036cff3be6c2fbcf9ca9881803e69003ac-r3/git/src'
> | powerpc-poky-linux-gcc  -m32 -mhard-float  -mcpu=603e --sysroot=/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/sysroots/qemuppc -DHAVE_CONFIG_H -I. -I.. -DDATADIR=\"/usr/share\" -DPKGDATADIR=\"/usr/share/matchbox-keyboard\" -DPREFIX=\"/usr\" -g -Wall -fno-strict-aliasing   -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/sysroots/qemuppc/usr/include/freetype2         -O2 -pipe -g -feliminate-unused-debug-types -c matchbox-keyboard.c
> | powerpc-poky-linux-gcc  -m32 -mhard-float  -mcpu=603e --sysroot=/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/sysroots/qemuppc -DHAVE_CONFIG_H -I. -I.. -DDATADIR=\"/usr/share\" -DPKGDATADIR=\"/usr/share/matchbox-keyboard\" -DPREFIX=\"/usr\" -g -Wall -fno-strict-aliasing   -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/sysroots/qemuppc/usr/include/freetype2         -O2 -pipe -g -feliminate-unused-debug-types -c matchbox-keyboard-image.c
> | powerpc-poky-linux-gcc  -m32 -mhard-float  -mcpu=603e --sysroot=/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/sysroots/qemuppc -DHAVE_CONFIG_H -I. -I.. -DDATADIR=\"/usr/share\" -DPKGDATADIR=\"/usr/share/matchbox-keyboard\" -DPREFIX=\"/usr\" -g -Wall -fno-strict-aliasing   -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/sysroots/qemuppc/usr/include/freetype2         -O2 -pipe -g -feliminate-unused-debug-types -c matchbox-keyboard-layout.c
> | powerpc-poky-linux-gcc  -m32 -mhard-float  -mcpu=603e --sysroot=/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/sysroots/qemuppc -DHAVE_CONFIG_H -I. -I.. -DDATADIR=\"/usr/share\" -DPKGDATADIR=\"/usr/share/matchbox-keyboard\" -DPREFIX=\"/usr\" -g -Wall -fno-strict-aliasing   -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/sysroots/qemuppc/usr/include/freetype2         -O2 -pipe -g -feliminate-unused-debug-types -c matchbox-keyboard-row.c
> | powerpc-poky-linux-gcc  -m32 -mhard-float  -mcpu=603e --sysroot=/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/sysroots/qemuppc -DHAVE_CONFIG_H -I. -I.. -DDATADIR=\"/usr/share\" -DPKGDATADIR=\"/usr/share/matchbox-keyboard\" -DPREFIX=\"/usr\" -g -Wall -fno-strict-aliasing   -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/sysroots/qemuppc/usr/include/freetype2         -O2 -pipe -g -feliminate-unused-debug-types -c matchbox-keyboard-key.c
> | powerpc-poky-linux-gcc  -m32 -mhard-float  -mcpu=603e --sysroot=/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/sysroots/qemuppc -DHAVE_CONFIG_H -I. -I.. -DDATADIR=\"/usr/share\" -DPKGDATADIR=\"/usr/share/matchbox-keyboard\" -DPREFIX=\"/usr\" -g -Wall -fno-strict-aliasing   -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/sysroots/qemuppc/usr/include/freetype2         -O2 -pipe -g -feliminate-unused-debug-types -c matchbox-keyboard-ui.c
> | powerpc-poky-linux-gcc  -m32 -mhard-float  -mcpu=603e --sysroot=/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/sysroots/qemuppc -DHAVE_CONFIG_H -I. -I.. -DDATADIR=\"/usr/share\" -DPKGDATADIR=\"/usr/share/matchbox-keyboard\" -DPREFIX=\"/usr\" -g -Wall -fno-strict-aliasing   -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/sysroots/qemuppc/usr/include/freetype2         -O2 -pipe -g -feliminate-unused-debug-types -c matchbox-keyboard-xembed.c
> | powerpc-poky-linux-gcc  -m32 -mhard-float  -mcpu=603e --sysroot=/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/sysroots/qemuppc -DHAVE_CONFIG_H -I. -I.. -DDATADIR=\"/usr/share\" -DPKGDATADIR=\"/usr/share/matchbox-keyboard\" -DPREFIX=\"/usr\" -g -Wall -fno-strict-aliasing   -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/sysroots/qemuppc/usr/include/freetype2         -O2 -pipe -g -feliminate-unused-debug-types -c matchbox-keyboard-remote.c
> | powerpc-poky-linux-gcc  -m32 -mhard-float  -mcpu=603e --sysroot=/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/sysroots/qemuppc -DHAVE_CONFIG_H -I. -I.. -DDATADIR=\"/usr/share\" -DPKGDATADIR=\"/usr/share/matchbox-keyboard\" -DPREFIX=\"/usr\" -g -Wall -fno-strict-aliasing   -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/sysroots/qemuppc/usr/include/freetype2         -O2 -pipe -g -feliminate-unused-debug-types -c config-parser.c
> | powerpc-poky-linux-gcc  -m32 -mhard-float  -mcpu=603e --sysroot=/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/sysroots/qemuppc -DHAVE_CONFIG_H -I. -I.. -DDATADIR=\"/usr/share\" -DPKGDATADIR=\"/usr/share/matchbox-keyboard\" -DPREFIX=\"/usr\" -g -Wall -fno-strict-aliasing   -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/sysroots/qemuppc/usr/include/freetype2         -O2 -pipe -g -feliminate-unused-debug-types -c util-list.c
> | powerpc-poky-linux-gcc  -m32 -mhard-float  -mcpu=603e --sysroot=/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/sysroots/qemuppc -DHAVE_CONFIG_H -I. -I.. -DDATADIR=\"/usr/share\" -DPKGDATADIR=\"/usr/share/matchbox-keyboard\" -DPREFIX=\"/usr\" -g -Wall -fno-strict-aliasing   -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/sysroots/qemuppc/usr/include/freetype2         -O2 -pipe -g -feliminate-unused-debug-types -c util.c
> | powerpc-poky-linux-gcc  -m32 -mhard-float  -mcpu=603e --sysroot=/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/sysroots/qemuppc -DHAVE_CONFIG_H -I. -I.. -DDATADIR=\"/usr/share\" -DPKGDATADIR=\"/usr/share/matchbox-keyboard\" -DPREFIX=\"/usr\" -g -Wall -fno-strict-aliasing   -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/sysroots/qemuppc/usr/include/freetype2         -O2 -pipe -g -feliminate-unused-debug-types -c matchbox-keyboard-ui-xft-backend.c
> | matchbox-keyboard-image.c: In function 'png_file_load':
> | matchbox-keyboard-image.c:68:8: error: dereferencing pointer to incomplete type
> | make[2]: *** [matchbox-keyboard-image.o] Error 1
> | make[2]: *** Waiting for unfinished jobs....
> | util.c: In function 'util_utf8_char_cnt':
> | util.c:87:15: warning: variable 'mask' set but not used [-Wunused-but-set-variable]
> | config-parser.c: In function 'mb_kbd_config_load':
> | config-parser.c:605:6: warning: format '%d' expects argument of type 'int', but argument 4 has type 'XML_Size' [-Wformat]
> | matchbox-keyboard-ui.c: In function 'mb_kbd_ui_resources_create':
> | matchbox-keyboard-ui.c:629:6: warning: variable 'atom_NET_WM_WINDOW_TYPE_DOCK' set but not used [-Wunused-but-set-variable]
> | matchbox-keyboard-ui.c: In function 'mb_kbd_ui_event_loop':
> | matchbox-keyboard-ui.c:1106:20: warning: variable 'press_y' set but not used [-Wunused-but-set-variable]
> | matchbox-keyboard-ui.c:1106:7: warning: variable 'press_x' set but not used [-Wunused-but-set-variable]
> | make[2]: Leaving directory `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/work/ppc603e-poky-linux/matchbox-keyboard/0.0+git1+b38f24036cff3be6c2fbcf9ca9881803e69003ac-r3/git/src'
> | make[1]: *** [all-recursive] Error 1
> | make[1]: Leaving directory `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/work/ppc603e-poky-linux/matchbox-keyboard/0.0+git1+b38f24036cff3be6c2fbcf9ca9881803e69003ac-r3/git'
> | make: *** [all] Error 2
> | ERROR: oe_runmake failed
> | ERROR: Function failed: do_compile (see /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/work/ppc603e-poky-linux/matchbox-keyboard/0.0+git1+b38f24036cff3be6c2fbcf9ca9881803e69003ac-r3/temp/log.do_compile.8278 for further information)
> NOTE: recipe matchbox-keyboard-0.0+git1+b38f24036cff3be6c2fbcf9ca9881803e69003ac-r3: task do_compile: Failed



Sau!


> diff --git a/meta/recipes-graphics/libmatchbox/files/16bppfixes-2.patch b/meta/recipes-graphics/libmatchbox/files/16bppfixes-2.patch
> deleted file mode 100644
> index 9bcd582..0000000
> --- a/meta/recipes-graphics/libmatchbox/files/16bppfixes-2.patch
> +++ /dev/null
> @@ -1,260 +0,0 @@
> -Upstream-Status: Pending
> -
> ---- libmatchbox/libmb/mbpixbuf.c.orig	2007-05-04 14:41:55.000000000 +0100
> -+++ libmatchbox/libmb/mbpixbuf.c	2007-05-04 14:41:55.000000000 +0100
> -@@ -710,46 +710,19 @@
> -   return colnum;
> - }
> -
> --
> --static unsigned long
> --mb_pixbuf_get_pixel(MBPixbuf *pb, int r, int g, int b, int a)
> -+/*
> -+ * Split the mb_pixbuf_get_pixel() function into several specialized
> -+ * functions which we will inline; this allows us to optimize
> -+ * mb_pixbuf_img_render_to_drawable_with_gc () by taking some of the
> -+ * decision taking outside of the double loop
> -+ */
> -+
> -+/*
> -+ * Get pixel value for rgb values and pixel depth <= 8
> -+ */
> -+static inline unsigned long
> -+mb_pixbuf_get_pixel_le8_rgb (MBPixbuf *pb, int r, int g, int b)
> - {
> --  if (pb->depth > 8)
> --    {
> --      switch (pb->depth)
> --	{
> --	case 15:
> --	  return ((r & 0xf8) << 7) | ((g & 0xf8) << 2) | ((b & 0xf8) >> 3);
> --	case 16:
> --	  return ((r & 0xf8) << 8) | ((g & 0xfc) << 3) | ((b & 0xf8) >> 3);
> --	case 24:
> --	case 32:
> --	  switch (pb->byte_order)
> --	    {
> --	    case BYTE_ORD_24_RGB:
> --	      return ((r & 0xff) << 16) | ((g & 0xff) << 8) | (b & 0xff);
> --	    case BYTE_ORD_24_RBG:
> --	      return ((r & 0xff) << 16) | ((b & 0xff) << 8) | (g & 0xff);
> --	    case BYTE_ORD_24_BRG:
> --	      return ((b & 0xff) << 16) | ((r & 0xff) << 8) | (g & 0xff);
> --	    case BYTE_ORD_24_BGR:
> --	      return ((b & 0xff) << 16) | ((g & 0xff) << 8) | (r & 0xff);
> --	    case BYTE_ORD_24_GRB:
> --	      return ((g & 0xff) << 16) | ((r & 0xff) << 8) | (b & 0xff);
> --	    case BYTE_ORD_24_GBR:
> --	      return ((g & 0xff) << 16) | ((b & 0xff) << 8) | (r & 0xff);
> --	    case BYTE_ORD_32_ARGB:
> --	      return  (a << 24) | (r << 16) | (g << 8) | b;
> --	    default:
> --	      return 0;
> --	    }
> --	default:
> --	  return 0;
> --	}
> --      return 0;
> --    }
> --
> --  /* pb->depth <= 8 */
> -   switch(pb->vis->class)
> -     {
> -     case PseudoColor:
> -@@ -794,6 +767,111 @@
> -   return 0;
> - }
> -
> -+/*
> -+ * Get pixel value from a pointer to 16bbp value for pixel depth <= 8
> -+ * and advance the pointer
> -+ */
> -+static inline unsigned long
> -+mb_pixbuf_get_pixel_le8_16bpp_advance (MBPixbuf *pb, unsigned char ** p)
> -+{
> -+  unsigned short s = SHORT_FROM_2BYTES(*p);
> -+  int r, b, g;
> -+
> -+  r = (s & 0xf800) >> 8;
> -+  g = (s & 0x07e0) >> 3;
> -+  b = (s & 0x001f) << 3;
> -+
> -+  *p += 2;
> -+
> -+  return mb_pixbuf_get_pixel_le8_rgb (pb, r, g, b);
> -+}
> -+
> -+/*
> -+ * Get pixel value for rgba values and pixel depth > 8
> -+ *
> -+ */
> -+static inline unsigned long
> -+mb_pixbuf_get_pixel_gt8_rgba (MBPixbuf *pb, int r, int g, int b, int a)
> -+{
> -+  switch (pb->depth)
> -+    {
> -+    case 15:
> -+      switch (pb->byte_order)
> -+	{
> -+	case BYTE_ORD_24_RGB:
> -+	  return ((r & 0xf8) << 7) | ((g & 0xf8) << 2) | ((b & 0xf8) >> 3);
> -+	case BYTE_ORD_24_BGR:
> -+	  return ((b & 0xf8) << 7) | ((g & 0xf8) << 2) | ((r & 0xf8) >> 3);
> -+	}
> -+    case 16:
> -+      switch (pb->byte_order)
> -+	{
> -+	case BYTE_ORD_24_RGB:
> -+	  return ((r & 0xf8) << 8) | ((g & 0xfc) << 3) | ((b & 0xf8) >> 3);
> -+	case BYTE_ORD_24_BGR:
> -+	  return ((b & 0xf8) << 8) | ((g & 0xfc) << 3) | ((r & 0xf8) >> 3);
> -+	}
> -+    case 24:
> -+    case 32:
> -+      switch (pb->byte_order)
> -+	{
> -+	case BYTE_ORD_24_RGB:
> -+	  return ((r & 0xff) << 16) | ((g & 0xff) << 8) | (b & 0xff);
> -+	case BYTE_ORD_24_RBG:
> -+	  return ((r & 0xff) << 16) | ((b & 0xff) << 8) | (g & 0xff);
> -+	case BYTE_ORD_24_BRG:
> -+	  return ((b & 0xff) << 16) | ((r & 0xff) << 8) | (g & 0xff);
> -+	case BYTE_ORD_24_BGR:
> -+	  return ((b & 0xff) << 16) | ((g & 0xff) << 8) | (r & 0xff);
> -+	case BYTE_ORD_24_GRB:
> -+	  return ((g & 0xff) << 16) | ((r & 0xff) << 8) | (b & 0xff);
> -+	case BYTE_ORD_24_GBR:
> -+	  return ((g & 0xff) << 16) | ((b & 0xff) << 8) | (r & 0xff);
> -+	case BYTE_ORD_32_ARGB:
> -+	  return  (a << 24) | (r << 16) | (g << 8) | b;
> -+	default:
> -+	  return 0;
> -+	}
> -+    default:
> -+      return 0;
> -+    }
> -+}
> -+
> -+/*
> -+ * Get pixel value from pointer to 16bpp data for pixel depth > 8
> -+ * and advance the pointer
> -+ *
> -+ * TODO ? We could take the 32bit case out of here, which would allow
> -+ * to ignore the alpha value for <15, 24>, but we might not gain that
> -+ * much by this on arm due to the conditional execution.
> -+ */
> -+static inline unsigned long
> -+mb_pixbuf_get_pixel_gt8_16bpp_advance (MBPixbuf *pb, unsigned char ** p,
> -+				       int has_alpha)
> -+{
> -+  unsigned short s = SHORT_FROM_2BYTES(*p);
> -+  int r, b, g, a;
> -+
> -+  r = (s & 0xf800) >> 8;
> -+  g = (s & 0x07e0) >> 3;
> -+  b = (s & 0x001f) << 3;
> -+
> -+  *p += 2;
> -+
> -+  a = has_alpha ?  *(*p)++ : 0xff;
> -+
> -+  return mb_pixbuf_get_pixel_gt8_rgba (pb, r, g, b, a);
> -+}
> -+
> -+static inline unsigned long
> -+mb_pixbuf_get_pixel(MBPixbuf *pb, int r, int g, int b, int a)
> -+{
> -+  if (pb->depth > 8)
> -+    return mb_pixbuf_get_pixel_gt8_rgba (pb, r, g, b, a);
> -+
> -+  return mb_pixbuf_get_pixel_le8_rgb (pb, r, g, b);
> -+}
> -+
> - unsigned long
> - mb_pixbuf_lookup_x_pixel(MBPixbuf *pb, int r, int g, int b, int a)
> - {
> -@@ -1825,7 +1903,6 @@
> -   mb_pixbuf_img_render_to_drawable_with_gc(pb, img, drw, drw_x, drw_y, pb->gc);
> - }
> -
> --
> - void
> - mb_pixbuf_img_render_to_drawable_with_gc(MBPixbuf    *pb,
> - 					 MBPixbufImage *img,
> -@@ -1883,31 +1960,57 @@
> -
> -       if (pb->internal_bytespp == 2)
> - 	{
> --	  for(y=0; y<img->height; y++)
> --	    for(x=0; x<img->width; x++)
> --	      {
> --		/* Below is potentially dangerous.
> --		 */
> --		pixel =  ( *p | (*(p+1) << 8));
> --
> --		p +=  ((img->has_alpha) ?  3 : 2);
> --		
> --		XPutPixel(img->ximg, x, y, pixel);
> --	      }
> -+	  if (pb->depth > 8)
> -+	    {
> -+	      for(y=0; y<img->height; y++)
> -+		for(x=0; x<img->width; x++)
> -+		  {
> -+		    pixel = mb_pixbuf_get_pixel_gt8_16bpp_advance(pb, &p,
> -+								  img->has_alpha);
> -+		    XPutPixel(img->ximg, x, y, pixel);
> -+		  }
> -+	    }
> -+	  else
> -+	    {
> -+	      for(y=0; y<img->height; y++)
> -+		for(x=0; x<img->width; x++)
> -+		  {
> -+		    pixel = mb_pixbuf_get_pixel_le8_16bpp_advance(pb, &p);
> -+		    XPutPixel(img->ximg, x, y, pixel);
> -+		  }
> -+	    }
> - 	}
> -       else
> - 	{
> --	  for(y=0; y<img->height; y++)
> -+	  if (pb->depth > 8)
> - 	    {
> --	      for(x=0; x<img->width; x++)
> -+	      for(y=0; y<img->height; y++)
> - 		{
> --		  r = ( *p++ );
> --		  g = ( *p++ );
> --		  b = ( *p++ );
> --		  a = ((img->has_alpha) ?  *p++ : 0xff);
> -+		  for(x=0; x<img->width; x++)
> -+		    {
> -+		      r = ( *p++ );
> -+		      g = ( *p++ );
> -+		      b = ( *p++ );
> -+		      a = ((img->has_alpha) ?  *p++ : 0xff);
> - 		
> --		  pixel = mb_pixbuf_get_pixel(pb, r, g, b, a);
> --		  XPutPixel(img->ximg, x, y, pixel);
> -+		      pixel = mb_pixbuf_get_pixel_gt8_rgba(pb, r, g, b, a);
> -+		      XPutPixel(img->ximg, x, y, pixel);
> -+		    }
> -+		}
> -+	    }
> -+	  else
> -+	    {
> -+	      for(y=0; y<img->height; y++)
> -+		{
> -+		  for(x=0; x<img->width; x++)
> -+		    {
> -+		      r = ( *p++ );
> -+		      g = ( *p++ );
> -+		      b = ( *p++ );
> -+		
> -+		      pixel = mb_pixbuf_get_pixel_le8_rgb(pb, r, g, b);
> -+		      XPutPixel(img->ximg, x, y, pixel);
> -+		    }
> - 		}
> - 	    }
> - 	}
> diff --git a/meta/recipes-graphics/libmatchbox/files/16bppfixes.patch b/meta/recipes-graphics/libmatchbox/files/16bppfixes.patch
> deleted file mode 100644
> index ac22b99..0000000
> --- a/meta/recipes-graphics/libmatchbox/files/16bppfixes.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -Upstream-Status: Accepted
> -
> -Index: libmb/mbpixbuf.c
> -===================================================================
> ---- libmatchbox/libmb.orig/mbpixbuf.c	2006-02-01 12:45:55.000000000 +0000
> -+++ libmatchbox/libmb/mbpixbuf.c	2006-03-11 15:20:47.000000000 +0000
> -@@ -716,7 +716,13 @@
> - 	case 15:
> - 	  return ((r & 0xf8) << 7) | ((g & 0xf8) << 2) | ((b & 0xf8) >> 3);
> - 	case 16:
> --	  return ((r & 0xf8) << 8) | ((g & 0xfc) << 3) | ((b & 0xf8) >> 3);
> -+	  switch (pb->byte_order)
> -+	    {
> -+	    case BYTE_ORD_24_RGB:
> -+	      return ((r & 0xf8) << 8) | ((g & 0xfc) << 3) | ((b & 0xf8) >> 3);
> -+	    case BYTE_ORD_24_BGR:
> -+	      return ((b & 0xf8) << 8) | ((g & 0xfc) << 3) | ((r & 0xf8) >> 3);
> -+	    }
> - 	case 24:
> - 	case 32:
> - 	  switch (pb->byte_order)
> -@@ -1880,12 +1886,11 @@
> - 	  for(y=0; y<img->height; y++)
> - 	    for(x=0; x<img->width; x++)
> - 	      {
> --		/* Below is potentially dangerous.
> --		 */
> --		pixel =  ( *p | (*(p+1) << 8));
> -+		internal_16bpp_pixel_to_rgb(p, r, g, b);
> -+		internal_16bpp_pixel_next(p);
> -+		a = ((img->has_alpha) ?  *p++ : 0xff);
> -
> --		p +=  ((img->has_alpha) ?  3 : 2);
> --		
> -+		pixel = mb_pixbuf_get_pixel(pb, r, g, b, a);
> - 		XPutPixel(img->ximg, x, y, pixel);
> - 	      }
> - 	}
> diff --git a/meta/recipes-graphics/libmatchbox/files/autofoo.patch b/meta/recipes-graphics/libmatchbox/files/autofoo.patch
> deleted file mode 100644
> index 78849a4..0000000
> --- a/meta/recipes-graphics/libmatchbox/files/autofoo.patch
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -
> -#
> -# Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
> -#
> -
> -Upstream-Status: Inappropriate [configuration]
> -
> ---- libmatchbox-1.5/configure.ac~autofoo	2004-12-21 12:56:46.000000000 -0500
> -+++ libmatchbox-1.5/configure.ac	2005-01-18 16:40:04.421179624 -0500
> -@@ -1,10 +1,10 @@
> - AC_PREREQ(2.53)
> - AC_INIT([libmatchbox], 1.5, [mallum@handhelds.org])
> - AC_CONFIG_SRCDIR([libmb/mbtray.c])
> -+AC_CONFIG_AUX_DIR(.)
> -
> - AM_INIT_AUTOMAKE()
> - AM_CONFIG_HEADER([config.h])
> --AC_CONFIG_AUX_DIR(.)
> -
> - # Checks for programs.
> - AC_GNU_SOURCE
> diff --git a/meta/recipes-graphics/libmatchbox/files/configure_fixes.patch b/meta/recipes-graphics/libmatchbox/files/configure_fixes.patch
> deleted file mode 100644
> index 30fd67b..0000000
> --- a/meta/recipes-graphics/libmatchbox/files/configure_fixes.patch
> +++ /dev/null
> @@ -1,81 +0,0 @@
> ----
> - configure.ac |   15 +++++++--------
> - libmb.pc.in  |    2 +-
> - 2 files changed, 8 insertions(+), 9 deletions(-)
> -
> -Upstream-Status: Inappropriate [configuration]
> -
> -Index: libmatchbox-1.9/configure.ac
> -===================================================================
> ---- libmatchbox-1.9.orig/configure.ac	2007-11-11 22:26:43.000000000 +0000
> -+++ libmatchbox-1.9/configure.ac	2007-11-11 22:52:09.000000000 +0000
> -@@ -84,6 +84,7 @@ if test $have_libx11pc = yes; then
> -       xft_pkg=xft
> -       SUPPORTS_XFT=1
> -       AC_DEFINE(USE_XFT, [1], [Use Xft])	
> -+      XFT_REQUIRED="xft"
> -    fi
> - # XXX : xau is missing from x11.pc - workaround is too add here
> -    PKG_CHECK_MODULES(XLIBS, x11 xext  $xft_pkg)
> -@@ -108,6 +109,7 @@ if test x$enable_xft != xno; then
> -     AC_DEFINE(USE_XFT, [1], [Use Xft])
> -     SUPPORTS_XFT=1
> -     AC_MSG_RESULT(yes)
> -+    XFT_REQUIRED="xft"
> -   else
> -
> -     AC_PATH_PROG(XFT_CONFIG, xft-config, no)
> -@@ -122,21 +124,17 @@ if test x$enable_xft != xno; then
> -       AC_DEFINE(USE_XFT, [1], [Use Xft])
> -       SUPPORTS_XFT=1
> -       AC_MSG_RESULT(yes)
> -+      MB_EXTRA_CFLAGS="$MB_EXTRA_CFLAGS $XFT_CFLAGS"
> -+      MB_EXTRA_LIBS="$MB_EXTRA_LIBS $XFT_LIBS"
> -     fi
> -   fi
> - fi
> -
> - XLIBS_CFLAGS="$XLIBS_CLAGS $XFT_CFLAGS"
> --XLIBS_LIBS="$X_LIBS $XFT_LIBS -lX11 -lXext"
> --
> --MB_EXTRA_LIBS="$MB_EXTRA_LIBS $XLIBS_LIBS"
> -+XLIBS_LIBS="$XLIBS_LIBS $XFT_LIBS -lX11 -lXext"
> -
> - fi
> -
> --# do this here for freetype include
> --MB_EXTRA_CFLAGS="$MB_EXTRA_CFLAGS $XLIBS_CFLAGS"
> --
> --
> - dnl ------ Check for Pango ---------------------------------------------------
> -
> - if test x$enable_pango != xno; then
> -@@ -172,7 +170,7 @@ if test x$enable_png != xno; then
> -             AC_DEFINE(USE_PNG, [1], [Use Png])
> - 	    SUPPORTS_PNG=1
> -             PNG_LIBS="-lpng -lz"
> --            MB_EXTRA_LIBS="$MB_EXTRA_LIBS $XLIBS_LIBS $PNG_LIBS"
> -+            MB_EXTRA_LIBS="$MB_EXTRA_LIBS $PNG_LIBS"
> -         else
> - 	    AC_MSG_WARN([*** Cannot find PNG, disabling support])
> -             enable_png=no
> -@@ -340,6 +338,7 @@ AC_SUBST(MB_EXTRA_CFLAGS)
> - AC_SUBST(XLIBS_REQUIRED)
> - AC_SUBST(PANGO_REQUIRED)
> - AC_SUBST(PNG_REQUIRED)
> -+AC_SUBST(XFT_REQUIRED)
> -
> - dnl ------ Below used for mbconfig.h ----------------------------------------
> -
> -Index: libmatchbox-1.9/libmb.pc.in
> -===================================================================
> ---- libmatchbox-1.9.orig/libmb.pc.in	2007-11-11 22:30:47.000000000 +0000
> -+++ libmatchbox-1.9/libmb.pc.in	2007-11-11 22:31:01.000000000 +0000
> -@@ -7,6 +7,6 @@ Name: libmb
> - Description: Utility Library used by Matchbox utilities.
> - Version: @VERSION@
> -
> --Requires: @XLIBS_REQUIRED@ @PANGO_REQUIRED@ @PNG_REQUIRED@
> -+Requires: @XLIBS_REQUIRED@ @PANGO_REQUIRED@ @PNG_REQUIRED@ @XFT_REQUIRED@
> - Libs: -L${libdir} -lmb @MB_EXTRA_LIBS@
> - Cflags: -I${includedir} @MB_EXTRA_CFLAGS@
> diff --git a/meta/recipes-graphics/libmatchbox/files/fix-configure-for-1.9.patch b/meta/recipes-graphics/libmatchbox/files/fix-configure-for-1.9.patch
> deleted file mode 100644
> index 2f147eb..0000000
> --- a/meta/recipes-graphics/libmatchbox/files/fix-configure-for-1.9.patch
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -Upstream-Status: Inappropriate [configuration]
> -
> -diff -urNd ../libmatchbox-1.6-r1/libmatchbox-1.6/configure.ac libmatchbox-1.6/configure.ac
> ---- ../libmatchbox-1.6-r1/libmatchbox-1.6/configure.ac	2005-01-11 21:47:39 +00:00
> -+++ libmatchbox-1.6/configure.ac	2005-03-14 03:06:25 +00:00
> -@@ -2,9 +2,9 @@
> - AC_INIT([libmatchbox], 1.6, [mallum@handhelds.org])
> - AC_CONFIG_SRCDIR([libmb/mbtray.c])
> -
> -+AC_CONFIG_AUX_DIR(.)
> - AM_INIT_AUTOMAKE()
> - AM_CONFIG_HEADER([config.h])
> --AC_CONFIG_AUX_DIR(.)
> -
> - # Checks for programs.
> - AC_GNU_SOURCE
> diff --git a/meta/recipes-graphics/libmatchbox/files/matchbox-start-fix.patch b/meta/recipes-graphics/libmatchbox/files/matchbox-start-fix.patch
> deleted file mode 100644
> index 88f5d70..0000000
> --- a/meta/recipes-graphics/libmatchbox/files/matchbox-start-fix.patch
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -matchbox environment start fail on x86-64 target, while ok on x86 target. Root
> -cause is libmatchbox use "0"(int) as termination indicator when calling
> -XftFontOpen, which in turn called FcPatternVapBuild(in fontconfig). It try to
> -get the "0" as char* and fetch wrong value, as int and char* has different size
> -on x86-64. This patch forces a NULL pointer as terminator to fix it.
> -
> -Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
> -
> -Upstream-Status: Accepted
> -
> -Index: libmatchbox-1.9/libmb/mbexp.c
> -===================================================================
> ---- libmatchbox-1.9.orig/libmb/mbexp.c	2010-08-28 06:33:25.000000000 +0800
> -+++ libmatchbox-1.9/libmb/mbexp.c	2010-08-28 06:30:05.000000000 +0800
> -@@ -348,7 +348,7 @@
> - 			    XFT_SIZE, XftTypeDouble   , (double)font->pt_size,
> - 			    XFT_WEIGHT, XftTypeInteger, weight,
> - 			    XFT_SLANT, XftTypeInteger , slant,
> --			    0);
> -+			    NULL);
> -
> -   if (font->font != NULL ) result = 2;
> -
> diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox.inc b/meta/recipes-graphics/libmatchbox/libmatchbox.inc
> deleted file mode 100644
> index fdc866f..0000000
> --- a/meta/recipes-graphics/libmatchbox/libmatchbox.inc
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -DESCRIPTION = "Matchbox window manager core library"
> -HOMEPAGE = "http://matchbox-project.org/"
> -BUGTRACKER = "http://bugzilla.openedhand.com/"
> -
> -LICENSE = "LGPLv2+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
> -                    file://libmb/mbexp.c;endline=20;md5=28c0aef3b23e308464f5dae6a11b0d2f \
> -                    file://libmb/mbdotdesktop.c;endline=21;md5=5a287156b3207e851c1d68d09c439b51"
> -
> -SECTION = "x11/libs"
> -DEPENDS = "virtual/libx11 libxext expat libxft jpeg libpng zlib libxsettings-client startup-notification"
> -
> -inherit autotools pkgconfig
> -
> -EXTRA_OECONF = "--enable-jpeg --enable-expat --enable-xsettings --enable-startup-notification"
> -
> -S = "${WORKDIR}/libmatchbox-${PV}"
> diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_1.10.bb b/meta/recipes-graphics/libmatchbox/libmatchbox_1.10.bb
> new file mode 100644
> index 0000000..a1531b8
> --- /dev/null
> +++ b/meta/recipes-graphics/libmatchbox/libmatchbox_1.10.bb
> @@ -0,0 +1,28 @@
> +DESCRIPTION = "Matchbox window manager core library"
> +SECTION = "x11/libs"
> +HOMEPAGE = "http://matchbox-project.org/"
> +BUGTRACKER = "http://bugzilla.yoctoproject.com/"
> +
> +LICENSE = "LGPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
> +                    file://libmb/mbexp.c;endline=20;md5=28c0aef3b23e308464f5dae6a11b0d2f \
> +                    file://libmb/mbdotdesktop.c;endline=21;md5=5a287156b3207e851c1d68d09c439b51"
> +
> +DEPENDS = "virtual/libx11 libxext expat libxft jpeg libpng zlib libxsettings-client startup-notification"
> +
> +SRC_URI = "http://downloads.yoctoproject.org/releases/matchbox/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
> +           file://check.m4"
> +SRC_URI[md5sum] = "042c5874631dfb95151aa793dc1434b8"
> +SRC_URI[sha256sum] = "d14d4844840e3e1e4faa9f9e90060915d39b6033f6979464ab3ea3fe1c4f9293"
> +
> +PR = "r0"
> +
> +inherit autotools pkgconfig
> +
> +S = "${WORKDIR}/libmatchbox-${PV}"
> +
> +do_configure_prepend () {
> +	cp ${WORKDIR}/check.m4 ${S}/
> +}
> +
> +EXTRA_OECONF = "--enable-jpeg --enable-expat --enable-xsettings --enable-startup-notification"
> diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_1.9.bb b/meta/recipes-graphics/libmatchbox/libmatchbox_1.9.bb
> deleted file mode 100644
> index 2fcd1b0..0000000
> --- a/meta/recipes-graphics/libmatchbox/libmatchbox_1.9.bb
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -require libmatchbox.inc
> -
> -PR = "r10"
> -
> -SRC_URI = "http://downloads.yoctoproject.org/releases/matchbox/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
> -           file://16bppfixes.patch \
> -           file://configure_fixes.patch \
> -           file://check.m4 \
> -           file://matchbox-start-fix.patch"
> -
> -SRC_URI[md5sum] = "465fa15c43bf0091a3810e7702fe143f"
> -SRC_URI[sha256sum] = "f7054f93c57ba6b758d0e4f47d4d2dd96a7fe487e1157eb70a4d642910275aea"
> -
> -do_configure_prepend () {
> -	cp ${WORKDIR}/check.m4 ${S}/
> -}
> diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_git.bb b/meta/recipes-graphics/libmatchbox/libmatchbox_git.bb
> deleted file mode 100644
> index ac329e5..0000000
> --- a/meta/recipes-graphics/libmatchbox/libmatchbox_git.bb
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -require libmatchbox.inc
> -
> -SRCREV = "d9dd0ac810de4f0b93cd813ce14aee34c722c2cf"
> -PV = "1.9+git${SRCPV}"
> -PR = "r0"
> -DEFAULT_PREFERENCE = "-1"
> -
> -SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
> -           file://configure_fixes.patch \
> -	   file://check.m4"
> -
> -S = "${WORKDIR}/git"
> -
> -do_configure_prepend () {
> -        cp ${WORKDIR}/check.m4 ${S}/
> -}
>


