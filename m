Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.5905.1626056248917359611
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jul 2021 19:17:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-2.yocto.io (unknown [172.29.10.56])
	by mail.yoctoproject.org (Postfix) with ESMTP id 8407D38C1289
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 02:17:27 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gtk+3: upgrading to 3.24.30 FAILED
Message-ID: <MADEUP.1690E98B16C8CD56.19620@lists.openembedded.org>
X-Groupsio-MsgNum: 153750
Content-Type: multipart/mixed; boundary="===============9032927262066676361=="

--===============9032927262066676361==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gtk+3* to *3.24.30* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gtk-3-upgrade-3.24.29-3.24.30.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============9032927262066676361==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-gtk-3-upgrade-3.24.29-3.24.30.patch"

From 0ce19b8f8339656869598bac57e107c05618ba3a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 11 Jul 2021 20:29:41 +0000
Subject: [PATCH] gtk+3: upgrade 3.24.29 -> 3.24.30

---
 ...-Add-disable-opengl-configure-option.patch | 44 +++++++++----------
 .../{gtk+3_3.24.29.bb => gtk+3_3.24.30.bb}    |  2 +-
 2 files changed, 23 insertions(+), 23 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.24.29.bb => gtk+3_3.24.30.bb} (89%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch b/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
index 398c9bc36a..35cbab8761 100644
--- a/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
+++ b/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
@@ -1,4 +1,4 @@
-From f83fcf1991afad6d9c15546b2ccd775dad4e314c Mon Sep 17 00:00:00 2001
+From eef50c94587fc30cd624adb5eb213eb9fa663dc1 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 21 Jun 2016 15:11:39 +0300
 Subject: [PATCH] Add --disable-opengl configure option
@@ -47,7 +47,7 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  create mode 100644 gdk/x11/gdkx-without-gl-context.h
 
 diff --git a/configure.ac b/configure.ac
-index bd651bb..b4c061f 100644
+index 851bcbf..6cbf6a2 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -346,6 +346,15 @@ AC_ARG_ENABLE(cloudproviders,
@@ -210,7 +210,7 @@ index 932daf1..54239d6 100644
  
    return info;
 diff --git a/gdk/Makefile.am b/gdk/Makefile.am
-index 479d6a1..7edbee8 100644
+index 710a548..b45f631 100644
 --- a/gdk/Makefile.am
 +++ b/gdk/Makefile.am
 @@ -274,7 +274,6 @@ x11_introspection_files = 		\
@@ -243,10 +243,10 @@ index 479d6a1..7edbee8 100644
  GdkX11_3_0_gir_SCANNERFLAGS = 		\
  	--identifier-prefix=Gdk		\
 diff --git a/gdk/gdkdisplay.c b/gdk/gdkdisplay.c
-index 240c99f..9eb49bf 100644
+index 748f548..911ab2a 100644
 --- a/gdk/gdkdisplay.c
 +++ b/gdk/gdkdisplay.c
-@@ -2419,7 +2419,9 @@ gboolean
+@@ -2420,7 +2420,9 @@ gboolean
  gdk_display_make_gl_context_current (GdkDisplay   *display,
                                       GdkGLContext *context)
  {
@@ -258,7 +258,7 @@ index 240c99f..9eb49bf 100644
  
  GdkRenderingMode
 diff --git a/gdk/gdkgl.c b/gdk/gdkgl.c
-index 933e204..1767508 100644
+index 9690077..55f85ef 100644
 --- a/gdk/gdkgl.c
 +++ b/gdk/gdkgl.c
 @@ -26,7 +26,9 @@
@@ -334,7 +334,7 @@ index 933e204..1767508 100644
 +#endif
  }
 diff --git a/gdk/gdkglcontext.c b/gdk/gdkglcontext.c
-index dfbed63..556f0a3 100644
+index 3b23639..1f04f8e 100644
 --- a/gdk/gdkglcontext.c
 +++ b/gdk/gdkglcontext.c
 @@ -85,7 +85,9 @@
@@ -380,7 +380,7 @@ index dfbed63..556f0a3 100644
  
  /**
 diff --git a/gdk/gdkwindow.c b/gdk/gdkwindow.c
-index 6ae0f86..4e48a2a 100644
+index 2de8ba4..1883a79 100644
 --- a/gdk/gdkwindow.c
 +++ b/gdk/gdkwindow.c
 @@ -45,7 +45,9 @@
@@ -513,7 +513,7 @@ index 32b1f24..6352313 100644
 +
  -include $(top_srcdir)/git.mk
 diff --git a/gdk/x11/gdkdisplay-x11.c b/gdk/x11/gdkdisplay-x11.c
-index 817944e..e7a2947 100644
+index 7e08f47..30fd7b6 100644
 --- a/gdk/x11/gdkdisplay-x11.c
 +++ b/gdk/x11/gdkdisplay-x11.c
 @@ -37,7 +37,9 @@
@@ -526,7 +526,7 @@ index 817944e..e7a2947 100644
  #include "gdk-private.h"
  #include "gdkprofilerprivate.h"
  
-@@ -3188,7 +3190,9 @@ gdk_x11_display_class_init (GdkX11DisplayClass * class)
+@@ -3191,7 +3193,9 @@ gdk_x11_display_class_init (GdkX11DisplayClass * class)
    display_class->text_property_to_utf8_list = _gdk_x11_display_text_property_to_utf8_list;
    display_class->utf8_to_string_target = _gdk_x11_display_utf8_to_string_target;
  
@@ -538,10 +538,10 @@ index 817944e..e7a2947 100644
    display_class->get_default_seat = gdk_x11_display_get_default_seat;
  
 diff --git a/gdk/x11/gdkscreen-x11.c b/gdk/x11/gdkscreen-x11.c
-index 8939ae9..931bff9 100644
+index bb4df05..46f5349 100644
 --- a/gdk/x11/gdkscreen-x11.c
 +++ b/gdk/x11/gdkscreen-x11.c
-@@ -1723,3 +1723,8 @@ gdk_x11_screen_get_current_desktop (GdkScreen *screen)
+@@ -1827,3 +1827,8 @@ gdk_x11_screen_get_current_desktop (GdkScreen *screen)
  {
    return get_netwm_cardinal_property (screen, "_NET_CURRENT_DESKTOP");
  }
@@ -551,7 +551,7 @@ index 8939ae9..931bff9 100644
 +void _gdk_x11_screen_update_visuals_for_gl (GdkScreen *screen) {}
 +#endif
 diff --git a/gdk/x11/gdkwindow-x11.c b/gdk/x11/gdkwindow-x11.c
-index 1fe7b90..d23a347 100644
+index 721d9bb..8e87acc 100644
 --- a/gdk/x11/gdkwindow-x11.c
 +++ b/gdk/x11/gdkwindow-x11.c
 @@ -36,7 +36,9 @@
@@ -564,7 +564,7 @@ index 1fe7b90..d23a347 100644
  #include "gdkprivate-x11.h"
  #include "gdk-private.h"
  
-@@ -5861,7 +5863,9 @@ gdk_window_impl_x11_class_init (GdkWindowImplX11Class *klass)
+@@ -5881,7 +5883,9 @@ gdk_window_impl_x11_class_init (GdkWindowImplX11Class *klass)
    impl_class->set_opaque_region = gdk_x11_window_set_opaque_region;
    impl_class->set_shadow_width = gdk_x11_window_set_shadow_width;
    impl_class->show_window_menu = gdk_x11_window_show_window_menu;
@@ -668,10 +668,10 @@ index 0000000..c9e2617
 +
 +#endif /* __GDK_X_H__ */
 diff --git a/gtk/Makefile.am b/gtk/Makefile.am
-index eaca473..99352d1 100644
+index 074fb35..4fa9eb6 100644
 --- a/gtk/Makefile.am
 +++ b/gtk/Makefile.am
-@@ -1449,7 +1449,7 @@ gtktypefuncs.inc: stamp-gtktypebuiltins.h stamp-gtkprivatetypebuiltins.h $(top_s
+@@ -1457,7 +1457,7 @@ gtktypefuncs.inc: stamp-gtktypebuiltins.h stamp-gtkprivatetypebuiltins.h $(top_s
  	  ${CPP} $(DEFS) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) xgen-gtfsrc.c | \
  	  $(GREP) -o '\bg[td]k_[a-zA-Z0-9_]*_get_type\b' | \
  	  sort | uniq | \
@@ -681,7 +681,7 @@ index eaca473..99352d1 100644
  $(srcdir)/gtktestutils.c: gtktypefuncs.inc
  
 diff --git a/gtk/gtkglarea.c b/gtk/gtkglarea.c
-index 9a56443..7de0db2 100644
+index 802303e..33001cf 100644
 --- a/gtk/gtkglarea.c
 +++ b/gtk/gtkglarea.c
 @@ -29,7 +29,9 @@
@@ -724,8 +724,8 @@ index 9a56443..7de0db2 100644
  
    g_return_if_fail (GTK_IS_GL_AREA (area));
 @@ -533,11 +540,13 @@ gtk_gl_area_attach_buffers (GtkGLArea *area)
-         glFramebufferRenderbufferEXT (GL_FRAMEBUFFER_EXT, GL_STENCIL_ATTACHMENT_EXT,
-                                       GL_RENDERBUFFER_EXT, priv->depth_stencil_buffer);
+         glFramebufferRenderbuffer (GL_FRAMEBUFFER, GL_STENCIL_ATTACHMENT,
+                                    GL_RENDERBUFFER, priv->depth_stencil_buffer);
      }
 +#endif
  }
@@ -738,7 +738,7 @@ index 9a56443..7de0db2 100644
  
    if (priv->context == NULL)
 @@ -569,6 +578,7 @@ gtk_gl_area_delete_buffers (GtkGLArea *area)
-       glDeleteFramebuffersEXT (1, &priv->frame_buffer);
+       glDeleteFramebuffers (1, &priv->frame_buffer);
        priv->frame_buffer = 0;
      }
 +#endif
@@ -777,7 +777,7 @@ index 9a56443..7de0db2 100644
  
  static gboolean
 diff --git a/gtk/inspector/general.c b/gtk/inspector/general.c
-index c241ec8..24576dd 100644
+index 48237d1..1f9b9be 100644
 --- a/gtk/inspector/general.c
 +++ b/gtk/inspector/general.c
 @@ -33,8 +33,10 @@
@@ -824,7 +824,7 @@ index c241ec8..24576dd 100644
    if (GDK_IS_WAYLAND_DISPLAY (gdk_display_get_default ()))
      {
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index ee1e8b5..e6c6502 100644
+index f283e89..5e7180e 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
 @@ -80,8 +80,6 @@ noinst_PROGRAMS =  $(TEST_PROGS)	\
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb b/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb
similarity index 89%
rename from meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb
index 031fbb6d66..7e7566f9af 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
            file://0003-Add-disable-opengl-configure-option.patch \
            file://link_fribidi.patch \
            "
-SRC_URI[sha256sum] = "f57ec4ade8f15cab0c23a80dcaee85b876e70a8823d9105f067ce335a8268caa"
+SRC_URI[sha256sum] = "ba75bfff320ad1f4cfbee92ba813ec336322cc3c660d406aad014b07087a3ba9"
 
 S = "${WORKDIR}/gtk+-${PV}"
 
-- 
2.20.1


--===============9032927262066676361==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1458 entries from dependency cache.
Parsing recipes...done.
Parsing of 821 .bb files complete (820 cached, 1 parsed). 1458 targets, 34 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-593b535c2c9f868eb194901652da7f2555efe043"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:593b535c2c9f868eb194901652da7f2555efe043"
workspace            = "master:aa26842ec3d25094636979a3283f2236c582b747"

Initialising tasks...done.
Sstate summary: Wanted 218 Local 205 Network 0 Missed 13 Current 812 (94% match, 98% complete)
Removing 1 stale sstate objects for arch qemux86...done.
Removing 2 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2330 of 3286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_fetch)
NOTE: Running task 2527 of 3286 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_fetch)
NOTE: recipe gtk+3-3.24.30-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_fetch: Succeeded
NOTE: Running task 2671 of 3286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_unpack)
NOTE: Running task 2672 of 3286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-native-3.24.30-r0: task do_fetch: Started
NOTE: recipe gtk+3-native-3.24.30-r0: task do_fetch: Succeeded
NOTE: Running task 2821 of 3286 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_unpack)
NOTE: recipe gtk+3-3.24.30-r0: task do_unpack: Started
NOTE: Running task 2859 of 3286 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.30-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-native-3.24.30-r0: task do_unpack: Started
NOTE: recipe gtk+3-native-3.24.30-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-native-3.24.30-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.30-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.30-r0: task do_unpack: Succeeded
NOTE: Running task 3262 of 3286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_patch)
NOTE: recipe gtk+3-3.24.30-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_patch: Succeeded
NOTE: Running task 3263 of 3286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_deploy_source_date_epoch)
NOTE: Running task 3264 of 3286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_populate_lic)
NOTE: recipe gtk+3-3.24.30-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_populate_lic: Started
NOTE: recipe gtk+3-3.24.30-r0: task do_populate_lic: Succeeded
NOTE: recipe gtk+3-3.24.30-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3265 of 3286 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_configure)
NOTE: recipe gtk+3-3.24.30-r0: task do_configure: Started
NOTE: recipe gtk+3-native-3.24.30-r0: task do_unpack: Succeeded
NOTE: Running task 3266 of 3286 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_patch)
NOTE: recipe gtk+3-native-3.24.30-r0: task do_patch: Started
NOTE: recipe gtk+3-native-3.24.30-r0: task do_patch: Succeeded
NOTE: Running task 3267 of 3286 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk+3-native-3.24.30-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk+3-native-3.24.30-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3268 of 3286 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_configure)
NOTE: recipe gtk+3-native-3.24.30-r0: task do_configure: Started
ERROR: gtk+3-native-3.24.30-r0 do_configure: QA Issue: gtk+3-native: configure was passed unrecognised options: --disable-cloudprint [unknown-configure-option]
ERROR: gtk+3-native-3.24.30-r0 do_configure: Fatal QA errors found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gtk+3-native/3.24.30-r0/temp/log.do_configure.22311
NOTE: recipe gtk+3-native-3.24.30-r0: task do_configure: Failed
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_configure) failed with exit code '1'
ERROR: gtk+3-3.24.30-r0 do_configure: QA Issue: gtk+3: configure was passed unrecognised options: --disable-cloudprint [unknown-configure-option]
ERROR: gtk+3-3.24.30-r0 do_configure: Fatal QA errors found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gtk+3/3.24.30-r0/temp/log.do_configure.21916
NOTE: recipe gtk+3-3.24.30-r0: task do_configure: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_configure) failed with exit code '1'
NOTE: Tasks Summary: Attempted 3268 tasks of which 3255 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 2 tasks failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_configure
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb:do_configure
Summary: There were 4 ERROR messages shown, returning a non-zero exit code.

--===============9032927262066676361==--
