Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1762E10F9313
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:20 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14666.1775054170143172757
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:36:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=tP5wn5zU;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=FsyFZQRI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019d49792c1b-166dd6f3-c0b9-48a7-9b09-4349cb002eb7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054171;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3AsfZ0yoSFd675jcqiFQby9T2kw5uROe5vpZWUWlv6g=;
	b=tP5wn5zUuT1Cn8P5dEL4qpkfYSPYgyK9MWnuQtV7c7M+v//CtMTl/8NfcMqjami6
	M6gYsOtigRF0u8fOQfaPOjcR2e2AttYprFlqrd49mapXAoYGRS7/5+iLlZJ9o0NVL50
	iK7itbfi7h3vCJ8SqE1WrBVG5vJbbDK4MgmbQoH0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054171;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3AsfZ0yoSFd675jcqiFQby9T2kw5uROe5vpZWUWlv6g=;
	b=FsyFZQRISL0FKOB5bELk7kS2zbZL/SOoKaQmuqaEj2nxoS4D6Jc4pLJi+HzEFqoN
	bfEMmYHxHzSYjy+5H/7IUkfqawCzGD3EfXEH3RJ2pkq6EnyihFGfJQYgRuU9ACNaMe9
	4OHXJJeF7V7ytP0XeNwsbDQJ4593b3OouWMC/8j4=
Content-Type: multipart/mixed; boundary="===============2421927274616634664=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gtk+3: upgrading to 3.24.52 FAILED
Message-ID: <0101019d49792c1b-166dd6f3-c0b9-48a7-9b09-4349cb002eb7-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:36:11 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234413

--===============2421927274616634664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gtk+3* to *3.24.52* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gtk-3-upgrade-3.24.51-3.24.52.patch
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

-- >8 --
From dbe07cb0161b88ab677b570eb91d6f1836a5f818 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Apr 2026 12:43:10 +0000
Subject: [PATCH] gtk+3: upgrade 3.24.51 -> 3.24.52

---
 meta/recipes-gnome/gtk+/gtk+3/opengl.patch    | 48 +++++++++----------
 .../{gtk+3_3.24.51.bb => gtk+3_3.24.52.bb}    |  2 +-
 2 files changed, 25 insertions(+), 25 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.24.51.bb => gtk+3_3.24.52.bb} (98%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3/opengl.patch b/meta/recipes-gnome/gtk+/gtk+3/opengl.patch
index 51d4c8e43a..7102fd439b 100644
--- a/meta/recipes-gnome/gtk+/gtk+3/opengl.patch
+++ b/meta/recipes-gnome/gtk+/gtk+3/opengl.patch
@@ -1,4 +1,4 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From b98872167b946ecedf2fd2042c495fb937afdc2f Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Fri, 16 Oct 2015 16:35:16 +0300
 Subject: [PATCH] Do not try to initialize GL without libGL
@@ -40,7 +40,7 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  21 files changed, 131 insertions(+), 13 deletions(-)
 
 diff --git a/demos/gtk-demo/meson.build b/demos/gtk-demo/meson.build
-index 252da16d05..4b57cff6ac 100644
+index 252da16..4b57cff 100644
 --- a/demos/gtk-demo/meson.build
 +++ b/demos/gtk-demo/meson.build
 @@ -28,7 +28,6 @@ demos = files([
@@ -63,7 +63,7 @@ index 252da16d05..4b57cff6ac 100644
    demos += files('pagesetup.c')
  endif
 diff --git a/docs/tools/meson.build b/docs/tools/meson.build
-index 05621ee7ed..3d0a333b32 100644
+index 05621ee..3d0a333 100644
 --- a/docs/tools/meson.build
 +++ b/docs/tools/meson.build
 @@ -2,10 +2,13 @@ if x11_enabled
@@ -83,7 +83,7 @@ index 05621ee7ed..3d0a333b32 100644
                             include_directories: [ confinc, gdkinc, gtkinc, testinc, ],
                             dependencies: libgtk_dep)
 diff --git a/docs/tools/widgets.c b/docs/tools/widgets.c
-index 932daf1746..348807e133 100644
+index 932daf1..348807e 100644
 --- a/docs/tools/widgets.c
 +++ b/docs/tools/widgets.c
 @@ -8,7 +8,9 @@
@@ -110,7 +110,7 @@ index 932daf1746..348807e133 100644
  
    return info;
 diff --git a/gdk/gdkconfig.h.meson b/gdk/gdkconfig.h.meson
-index 7db19e0470..088651bafa 100644
+index 7db19e0..088651b 100644
 --- a/gdk/gdkconfig.h.meson
 +++ b/gdk/gdkconfig.h.meson
 @@ -15,6 +15,7 @@ G_BEGIN_DECLS
@@ -122,7 +122,7 @@ index 7db19e0470..088651bafa 100644
  G_END_DECLS
  
 diff --git a/gdk/gdkdisplay.c b/gdk/gdkdisplay.c
-index 5c41a48fd0..920bb18ce8 100644
+index 5c41a48..920bb18 100644
 --- a/gdk/gdkdisplay.c
 +++ b/gdk/gdkdisplay.c
 @@ -2412,7 +2412,11 @@ gboolean
@@ -150,7 +150,7 @@ index 5c41a48fd0..920bb18ce8 100644
  
  GdkRenderingMode
 diff --git a/gdk/gdkgl.c b/gdk/gdkgl.c
-index 0940c06c71..4b56614f9f 100644
+index 0940c06..4b56614 100644
 --- a/gdk/gdkgl.c
 +++ b/gdk/gdkgl.c
 @@ -21,8 +21,9 @@
@@ -227,7 +227,7 @@ index 0940c06c71..4b56614f9f 100644
 +#endif
  }
 diff --git a/gdk/gdkglcontext.c b/gdk/gdkglcontext.c
-index 52c7bce692..fa544794ac 100644
+index 52c7bce..fa54479 100644
 --- a/gdk/gdkglcontext.c
 +++ b/gdk/gdkglcontext.c
 @@ -85,7 +85,9 @@
@@ -273,7 +273,7 @@ index 52c7bce692..fa544794ac 100644
  
  /**
 diff --git a/gdk/gdkwindow.c b/gdk/gdkwindow.c
-index 62e0cf816f..b8bda7140d 100644
+index 2f5501f..37122f9 100644
 --- a/gdk/gdkwindow.c
 +++ b/gdk/gdkwindow.c
 @@ -45,7 +45,9 @@
@@ -333,7 +333,7 @@ index 62e0cf816f..b8bda7140d 100644
            cairo_region_destroy (opaque_region);
  
 diff --git a/gdk/meson.build b/gdk/meson.build
-index 297c38c68e..fc71f8f49d 100644
+index 297c38c..fc71f8f 100644
 --- a/gdk/meson.build
 +++ b/gdk/meson.build
 @@ -56,7 +56,6 @@ gdk_gir_public_headers = files(
@@ -366,7 +366,7 @@ index 297c38c68e..fc71f8f49d 100644
  gdkconfig = configure_file(
    input  : 'gdkconfig.h.meson',
 diff --git a/gdk/x11/gdkdisplay-x11.c b/gdk/x11/gdkdisplay-x11.c
-index c6d1f53d70..9793cb4329 100644
+index c6d1f53..9793cb4 100644
 --- a/gdk/x11/gdkdisplay-x11.c
 +++ b/gdk/x11/gdkdisplay-x11.c
 @@ -37,7 +37,9 @@
@@ -391,7 +391,7 @@ index c6d1f53d70..9793cb4329 100644
    display_class->get_default_seat = gdk_x11_display_get_default_seat;
  
 diff --git a/gdk/x11/gdkvisual-x11.c b/gdk/x11/gdkvisual-x11.c
-index 81479d81f4..3c8c5c02ff 100644
+index 81479d8..3c8c5c0 100644
 --- a/gdk/x11/gdkvisual-x11.c
 +++ b/gdk/x11/gdkvisual-x11.c
 @@ -306,7 +306,12 @@ _gdk_x11_screen_init_visuals (GdkScreen *screen)
@@ -408,7 +408,7 @@ index 81479d81f4..3c8c5c02ff 100644
  
  gint
 diff --git a/gdk/x11/gdkwindow-x11.c b/gdk/x11/gdkwindow-x11.c
-index 0c59ad464e..ad3244f152 100644
+index c60cecd..28f008b 100644
 --- a/gdk/x11/gdkwindow-x11.c
 +++ b/gdk/x11/gdkwindow-x11.c
 @@ -36,7 +36,9 @@
@@ -432,7 +432,7 @@ index 0c59ad464e..ad3244f152 100644
    impl_class->get_unscaled_size = gdk_x11_window_get_unscaled_size;
  }
 diff --git a/gdk/x11/gdkx-autocleanups.h b/gdk/x11/gdkx-autocleanups.h
-index edb0ea7dbf..a317d61cca 100644
+index edb0ea7..a317d61 100644
 --- a/gdk/x11/gdkx-autocleanups.h
 +++ b/gdk/x11/gdkx-autocleanups.h
 @@ -30,7 +30,9 @@ G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11DeviceXI2, g_object_unref)
@@ -446,7 +446,7 @@ index edb0ea7dbf..a317d61cca 100644
  G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11Screen, g_object_unref)
  G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11Visual, g_object_unref)
 diff --git a/gdk/x11/gdkx.h b/gdk/x11/gdkx.h
-index 1f64bccb6d..4db6c18351 100644
+index 1f64bcc..4db6c18 100644
 --- a/gdk/x11/gdkx.h
 +++ b/gdk/x11/gdkx.h
 @@ -43,7 +43,9 @@
@@ -460,7 +460,7 @@ index 1f64bccb6d..4db6c18351 100644
  #include <gdk/x11/gdkx11monitor.h>
  #include <gdk/x11/gdkx11property.h>
 diff --git a/gdk/x11/meson.build b/gdk/x11/meson.build
-index 754ae0a615..0318c83877 100644
+index 754ae0a..0318c83 100644
 --- a/gdk/x11/meson.build
 +++ b/gdk/x11/meson.build
 @@ -14,7 +14,6 @@ gdk_x11_sources = files(
@@ -492,7 +492,7 @@ index 754ae0a615..0318c83877 100644
  install_headers('gdkx.h', subdir: 'gtk-3.0/gdk/')
  
 diff --git a/gtk/gtkglarea.c b/gtk/gtkglarea.c
-index 802303ea9f..6439d7745d 100644
+index 802303e..6439d77 100644
 --- a/gtk/gtkglarea.c
 +++ b/gtk/gtkglarea.c
 @@ -29,7 +29,9 @@
@@ -580,7 +580,7 @@ index 802303ea9f..6439d7745d 100644
  
  static gboolean
 diff --git a/gtk/inspector/general.c b/gtk/inspector/general.c
-index a3a341956b..274600e74a 100644
+index a3a3419..274600e 100644
 --- a/gtk/inspector/general.c
 +++ b/gtk/inspector/general.c
 @@ -35,8 +35,10 @@
@@ -627,7 +627,7 @@ index a3a341956b..274600e74a 100644
    if (GDK_IS_WAYLAND_DISPLAY (gdk_display_get_default ()))
      {
 diff --git a/meson.build b/meson.build
-index 04d54a8e2c..324915c9ee 100644
+index f7d3f8e..ce6b31f 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -137,6 +137,7 @@ wayland_enabled        = get_option('wayland_backend')
@@ -658,7 +658,7 @@ index 04d54a8e2c..324915c9ee 100644
  if iso_codes_dep.found()
    cdata.set_quoted('ISO_CODES_PREFIX', iso_codes_dep.get_variable(pkgconfig: 'prefix'))
  else
-@@ -914,9 +919,15 @@ else
+@@ -917,9 +922,15 @@ else
    gio_packages = ['gio-2.0', glib_req]
  endif
  
@@ -675,7 +675,7 @@ index 04d54a8e2c..324915c9ee 100644
                       ['fribidi', fribidi_req]))
  
  gtk_packages = ' '.join([
-@@ -930,7 +941,7 @@ pkgconf.set('GTK_PACKAGES', gtk_packages)
+@@ -933,7 +944,7 @@ pkgconf.set('GTK_PACKAGES', gtk_packages)
  # Requires.private
  pc_gdk_extra_libs += cairo_libs
  
@@ -685,7 +685,7 @@ index 04d54a8e2c..324915c9ee 100644
    gtk_private_packages += ['pangoft2']
  endif
 diff --git a/meson_options.txt b/meson_options.txt
-index 94099aa01e..8bd096896d 100644
+index 94099aa..8bd0968 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
 @@ -19,6 +19,8 @@ option('profiler', type: 'boolean', value: false,
@@ -698,7 +698,7 @@ index 94099aa01e..8bd096896d 100644
  # Print backends
  option('print_backends', type : 'string', value : 'auto',
 diff --git a/tests/meson.build b/tests/meson.build
-index 6ff249f8a1..f2a9fbad6d 100644
+index 6ff249f..f2a9fba 100644
 --- a/tests/meson.build
 +++ b/tests/meson.build
 @@ -5,7 +5,6 @@ gtk_tests = [
@@ -732,7 +732,7 @@ index 6ff249f8a1..f2a9fbad6d 100644
    gtk_tests += [['testfontchooserdialog']]
  endif
 diff --git a/testsuite/gtk/objects-finalize.c b/testsuite/gtk/objects-finalize.c
-index 95b565c591..7f340c3775 100644
+index 95b565c..7f340c3 100644
 --- a/testsuite/gtk/objects-finalize.c
 +++ b/testsuite/gtk/objects-finalize.c
 @@ -109,7 +109,9 @@ main (int argc, char **argv)
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb b/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb
similarity index 98%
rename from meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb
index 35f99b2de0..cb3c544c7e 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb
@@ -22,7 +22,7 @@ inherit gettext gnomebase gtk-doc update-alternatives gtk-immodules-cache gsetti
 SRC_URI += "\
            file://opengl.patch \
            "
-SRC_URI[archive.sha256sum] = "0013877c6bd23c2dbe42ad7c70a053d0e449be66736574e37867c49c5f905a4f"
+SRC_URI[archive.sha256sum] = "80931fa472a77b9a164f6740e3c0b444fac6770054632d35a7ff9d679e5e7b9f"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.47.1


--===============2421927274616634664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/all-poky-linux/adwaita-icon-theme (sysroot):
  /usr/share/icons/Adwaita/scalable/status/folder-open.svg changed type from symlink to file
  /usr/share/icons/Adwaita/scalable/status/folder-open.svg changed permissions from rwxrwxrwx to rw-r--r--
  /usr/share/icons/Adwaita/symbolic/legacy/emblem-important-symbolic.svg was removed
  /usr/share/icons/Adwaita/symbolic/legacy/emblem-system-symbolic.svg was removed
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-kk: PKGSIZE changed from 149609 to 396077 (+165%)
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ug: PKGSIZE changed from 304176 to 399876 (+31%)
packages/x86-64-v3-poky-linux/gtk+3/gtk+3: FILELIST: removed "/usr/lib/libgdk-3.so.0.2419.32 /usr/lib/libgtk-3.so.0.2419.32", added "/usr/lib/libgtk-3.so.0.2420.32 /usr/lib/libgdk-3.so.0.2420.32"
Changes to packages/x86-64-v3-poky-linux/gtk+3 (sysroot):
  /usr/lib/libgdk-3.so.0 changed symlink target from libgdk-3.so.0.2419.32 to libgdk-3.so.0.2420.32
  /usr/lib/libgtk-3.so.0 changed symlink target from libgtk-3.so.0.2419.32 to libgtk-3.so.0.2420.32
  /usr/lib/libgdk-3.so.0.2419.32 moved to /usr/lib/libgdk-3.so.0.2420.32
  /usr/lib/libgtk-3.so.0.2419.32 moved to /usr/lib/libgtk-3.so.0.2420.32
Changes to packages/x86_64-linux/gtk+3-native (sysroot):
  /usr/lib/libgdk-3.so.0 changed symlink target from libgdk-3.so.0.2419.32 to libgdk-3.so.0.2420.32
  /usr/lib/libgtk-3.so.0 changed symlink target from libgtk-3.so.0.2419.32 to libgtk-3.so.0.2420.32
  /usr/lib/libgdk-3.so.0.2419.32 moved to /usr/lib/libgdk-3.so.0.2420.32
  /usr/lib/libgtk-3.so.0.2419.32 moved to /usr/lib/libgtk-3.so.0.2420.32

--===============2421927274616634664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1970 targets, 64 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-79cb7f5bad46a4c8fb498e799f197b13b6fb5e78"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:79cb7f5bad46a4c8fb498e799f197b13b6fb5e78"
meta-yocto-bsp       
meta-poky            = "master:ac300baea7314ea3c80f2330b2a993f729f32150"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 907 Local 858 Mirrors 0 Missed 49 Current 551 (94% match, 96% complete)
done.
Removing 13 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 613 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 628 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 637 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 643 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 644 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 645 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 646 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_populate_lic_setscene)
NOTE: Running setscene task 657 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 662 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 690 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 714 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_qa_setscene)
NOTE: Running setscene task 727 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 746 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 750 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 752 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 766 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_create_spdx_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe coreutils-9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-26.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_populate_lic_setscene: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 767 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_create_spdx_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 770 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 774 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 775 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx_setscene)
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 776 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.94.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 778 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_create_spdx_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 780 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gtk+3-3.24.52-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 782 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 789 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 790 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 793 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-26.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 796 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 799 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 800 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_packagedata_setscene)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.94.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 802 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_create_recipe_spdx_setscene)
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe at-spi2-core-2.60.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 811 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 820 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 822 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 824 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_populate_sysroot_setscene)
NOTE: recipe desktop-file-utils-0.28-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 825 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.94.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 826 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 827 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.94.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 829 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: recipe pango-1.57.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 830 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe coreutils-9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 832 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 834 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 835 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_recipe_spdx_setscene)
NOTE: recipe vala-0.56.18-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 837 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.61.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe at-spi2-core-2.60.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 840 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.94.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_26.0.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 842 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_package_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_26.0.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe pango-1.57.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe at-spi2-core-2.60.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.57.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 845 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 849 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 850 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 852 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 853 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 854 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 858 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_packagedata_setscene)
NOTE: Running setscene task 859 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 861 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 862 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 863 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.94.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 865 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 869 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_packagedata_setscene)
NOTE: Running setscene task 872 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.94.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 876 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libstd-rs-1.94.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_26.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_26.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 881 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 882 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 884 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.94.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 886 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx_setscene)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libstd-rs-1.94.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 888 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 890 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_create_spdx_setscene)
NOTE: recipe at-spi2-core-2.60.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 899 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_create_spdx_setscene)
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 901 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.47.bb:do_create_spdx_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 902 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 904 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.47-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.94.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_26.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 910 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 912 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_26.0.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_26.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 914 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-protocols-1.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_package_setscene: Started
NOTE: Running setscene task 919 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 921 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 923 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 924 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 926 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 928 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 931 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.94.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_26.0.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 932 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_create_spdx_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 933 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 935 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xkeyboard-config-2.47-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 937 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 939 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 940 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 941 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 945 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 946 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-12.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 949 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe at-spi2-core-2.60.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 951 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 952 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 953 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 956 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-12.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 958 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 962 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.131-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 967 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 968 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.15.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-12.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 969 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 972 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.55.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 973 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 974 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.131-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 980 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 981 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_create_spdx_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.131-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 982 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxml2-2.15.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 987 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_create_spdx_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 991 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 994 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.55-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 997 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.94.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 998 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1000 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1001 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.131-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1002 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libpng-1.6.55-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1005 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1006 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libstd-rs-1.94.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1007 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libunwind-1.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1009 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1010 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_package_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1013 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1014 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.18-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1016 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1017 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1018 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.94.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1019 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_recipe_qa_setscene)
NOTE: recipe icu-78.3-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1021 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1023 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1025 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.19-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_26.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1026 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_package_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1027 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_recipe_qa_setscene)
NOTE: recipe icu-78.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1028 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_spdx_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1030 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1031 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe mesa-2_26.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1032 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1033 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libpciaccess-0.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe at-spi2-core-2.60.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1035 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1036 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1040 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1041 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1042 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1044 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1045 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1048 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpciaccess-0.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1052 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe icu-78.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1055 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1057 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1059 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1062 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1063 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1064 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1067 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1068 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1073 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1074 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.55.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1076 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1077 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1079 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.131-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.55-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1080 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1082 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1083 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.131-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1084 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_packagedata_setscene)
NOTE: recipe icu-78.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1093 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1094 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1096 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1099 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1100 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1106 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1107 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.55-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1109 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1112 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1114 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1115 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1121 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1124 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1126 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_recipe_qa_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1130 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1138 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1140 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1142 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1144 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1147 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1148 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1151 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1152 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1154 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpciaccess-0.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1155 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-78.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1158 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1160 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1162 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1167 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe libunwind-1.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1174 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1176 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1177 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1185 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1186 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-78.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1187 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1189 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1190 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1191 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1196 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1198 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1201 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1203 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-4.19.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1207 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1210 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1212 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1214 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1216 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1217 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1219 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1220 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1221 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe shadow-4.19.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1223 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1224 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1225 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1227 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.19.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1234 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1235 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.19.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1237 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1238 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1240 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1242 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1244 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1245 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1255 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1256 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1257 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1258 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1259 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1260 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1261 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1263 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1264 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1266 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1041 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1270 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1271 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: Running setscene task 1274 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1276 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1277 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1279 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1280 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1282 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1185 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1213 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_fetch)
NOTE: Running task 1220 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_fetch)
NOTE: Running task 1283 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_fetch: Started
NOTE: recipe vala-0.56.18-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1388 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1467 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1286 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1288 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_unpack: Started
NOTE: Running task 1557 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_write_config)
NOTE: Running task 1591 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_recipe_qa)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librsvg-2.61.3-r0: task do_fetch: Succeeded
NOTE: Running task 1679 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1685 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_unpack)
NOTE: Running task 1693 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gtk+3-3.24.52-r0: task do_recipe_qa: Started
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe librsvg-2.61.3-r0: task do_write_config: Started
NOTE: Running task 1820 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_49.0.bb:do_write_config)
NOTE: Running task 1829 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_fetch)
NOTE: Running task 1830 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_fetch)
NOTE: recipe gtk+3-3.24.52-r0: task do_write_config: Started
NOTE: Running task 1886 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_write_config)
NOTE: Running task 1894 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_create_recipe_spdx)
NOTE: recipe librsvg-2.61.3-r0: task do_write_config: Succeeded
NOTE: Running task 1907 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_create_recipe_spdx)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_write_config: Succeeded
NOTE: Running task 1910 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_write_config: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_fetch: Succeeded
NOTE: Running task 1911 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_unpack)
NOTE: recipe gtk+3-3.24.52-r0: task do_recipe_qa: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_write_config: Started
NOTE: Running task 1912 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_fetch)
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_write_config: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_unpack: Succeeded
NOTE: recipe gtk+3-3.24.52-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1913 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_write_config: Succeeded
NOTE: Running task 1914 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1915 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe desktop-file-utils-0.28-r0: task do_unpack: Started
NOTE: recipe librsvg-2.61.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_fetch: Started
NOTE: recipe vala-0.56.18-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_fetch: Succeeded
NOTE: Running task 1916 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_unpack)
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_unpack: Started
NOTE: recipe vala-0.56.18-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_unpack: Succeeded
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_unpack: Succeeded
NOTE: Running task 1918 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_patch)
NOTE: Running task 1919 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_patch)
NOTE: recipe gtk+3-3.24.52-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_patch: Succeeded
NOTE: Running task 1921 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_deploy_source_date_epoch)
NOTE: recipe librsvg-2.61.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_patch: Succeeded
NOTE: Running task 1922 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.28-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1923 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_package_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_deploy_source_date_epoch unihash changed to 73e76bf06240a91e0b6c22691db78d3dde06dfba8b7b2bd2dc4d89c99b409f41
NOTE: Running setscene task 1289 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1290 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1291 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1292 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.55.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1293 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.55.bb:do_packagedata_setscene)
NOTE: Running setscene task 1294 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1295 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata_setscene)
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_deploy_source_date_epoch unihash changed to bedd710279c31aa6cbf4c3b8dbf9bfb944b43bd2b984cb20c560106c8db70e8c
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.55-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.55-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1296 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_recipe_qa_setscene)
NOTE: recipe gtk+3-3.24.52-r0: task do_unpack: Succeeded
NOTE: Running task 1925 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_patch)
NOTE: recipe libpng-1.6.55-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1300 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.55-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1302 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.55.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_patch: Started
NOTE: recipe libpng-1.6.55-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 56f86136d7a4cf1994dc4410aea1740546a49f4519d7112a9e473f8c6a2f81f4
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash d2eeea033d5dc3c32e67b95c47f03f8b08e2a5815d5cca38fe47c3c36de78b9b to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '350a53691aa4e1ad305e6edc9913fc2e54a0345ddbdfd5afc119c94ecaa7fd47', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'd2eeea033d5dc3c32e67b95c47f03f8b08e2a5815d5cca38fe47c3c36de78b9b'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 350a53691aa4e1ad305e6edc9913fc2e54a0345ddbdfd5afc119c94ecaa7fd47 -> d2eeea033d5dc3c32e67b95c47f03f8b08e2a5815d5cca38fe47c3c36de78b9b as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.55-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gtk+3-3.24.52-r0: task do_patch: Succeeded
NOTE: Running task 1942 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1305 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1306 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1307 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1308 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1309 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk+3-3.24.52-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1312 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_recipe_qa_setscene)
NOTE: recipe gtk+3-3.24.52-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1313 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_package_setscene)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package_setscene: Started
NOTE: recipe librsvg-2.61.3-r0: task do_unpack: Succeeded
NOTE: Running task 1955 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_patch)
NOTE: recipe librsvg-2.61.3-r0: task do_patch: Started
NOTE: recipe librsvg-2.61.3-r0: task do_patch: Succeeded
NOTE: Running task 1956 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1957 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_rust_gen_targets)
NOTE: recipe librsvg-2.61.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.61.3-r0: task do_rust_gen_targets: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package_setscene: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_rust_gen_targets: Succeeded
NOTE: Running setscene task 1314 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1315 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1316 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1317 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_packagedata_setscene)
NOTE: Running setscene task 1318 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1319 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.61.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1320 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_recipe_qa_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_deploy_source_date_epoch unihash changed to daa1e36eda1a128a569fc10d594fd3a9626a9a488e507d5daba9ea6b7607ec07
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1320 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1321 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1324 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1326 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1332 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1334 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1335 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1336 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 1337 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1338 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1339 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1340 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1341 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1342 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1343 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1344 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1345 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1346 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1347 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1348 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1352 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1353 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1355 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1356 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1358 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1359 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1360 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1362 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1363 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1364 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1365 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1368 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1369 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.7.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1371 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1376 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1377 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.51.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1379 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1382 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.14.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1384 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1386 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.51.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1387 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1392 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1393 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1395 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1396 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1399 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1402 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1405 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1407 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1409 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1411 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1412 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1417 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2400 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1420 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1422 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1424 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: Running setscene task 1425 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1427 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1429 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1430 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1432 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1434 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 1435 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1436 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1437 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1438 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1443 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1444 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1449 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1450 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1455 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1456 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1458 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3116 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3265 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3347 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3348 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3379 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_create_spdx)
NOTE: recipe librsvg-2.61.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.18-r0: task do_create_spdx: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 3389 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3390 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_configure)
NOTE: recipe desktop-file-utils-0.28-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3391 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_configure: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash d2eeea033d5dc3c32e67b95c47f03f8b08e2a5815d5cca38fe47c3c36de78b9b to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '4df3911d9f09a5953197a18e7c632a4394d4f462bf2658650b0a8fe3b6e41bb7', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'd2eeea033d5dc3c32e67b95c47f03f8b08e2a5815d5cca38fe47c3c36de78b9b'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 4df3911d9f09a5953197a18e7c632a4394d4f462bf2658650b0a8fe3b6e41bb7 -> d2eeea033d5dc3c32e67b95c47f03f8b08e2a5815d5cca38fe47c3c36de78b9b as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running task 3401 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_package_write_ipk)
NOTE: recipe vala-0.56.18-r0: task do_create_spdx: Succeeded
NOTE: Running task 3402 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_package_write_deb)
NOTE: Running task 3403 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_package_write_rpm)
NOTE: recipe desktop-file-utils-0.28-r0: task do_configure: Started
NOTE: Running task 3404 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_package_qa)
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_configure: Succeeded
NOTE: Running task 3405 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_package_write_ipk: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_package_write_deb: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_package_qa: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_compile: Started
NOTE: recipe librsvg-2.61.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3406 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_rust_create_wrappers)
NOTE: recipe gtk+3-3.24.52-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3407 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_configure)
NOTE: recipe gtk+3-3.24.52-r0: task do_configure: Started
NOTE: recipe librsvg-2.61.3-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.61.3-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3408 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_configure)
NOTE: recipe librsvg-2.61.3-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_configure: Succeeded
NOTE: Running task 3409 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_compile)
NOTE: recipe desktop-file-utils-0.28-r0: task do_compile: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_compile: Succeeded
NOTE: Running task 3410 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_install)
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_install: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_install: Succeeded
NOTE: Running task 3411 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_package)
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_compile: Succeeded
NOTE: Running task 3412 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_install)
NOTE: recipe desktop-file-utils-0.28-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_package_write_ipk: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_install: Succeeded
NOTE: Running task 3413 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_package)
NOTE: recipe desktop-file-utils-0.28-r0: task do_package: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_package: Succeeded
NOTE: Running task 3414 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_packagedata)
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.61.3-r0: task do_configure: Succeeded
NOTE: Running task 3415 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_package_qa: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_packagedata: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_packagedata unihash changed to 00a8d7c67f4c3329a61e92d5f753a97fbf9bc7a3d3030a06e2e47335a04b6e6d
NOTE: Setscene tasks completed
NOTE: Running task 3416 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_compile)
NOTE: recipe librsvg-2.61.3-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_package_write_deb: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_package: Succeeded
NOTE: Running task 3417 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.28-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_packagedata: Succeeded
NOTE: Running task 3418 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_package_write_ipk)
NOTE: Running task 3419 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_package_write_deb)
NOTE: Running task 3420 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_package_write_rpm)
NOTE: Running task 3421 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_package_qa)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package_write_ipk: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package_write_deb: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package_qa: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_configure: Succeeded
NOTE: Running task 3422 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_compile)
NOTE: recipe gtk+3-3.24.52-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package_qa: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe gtk+3-3.24.52-r0: task do_compile: Succeeded
NOTE: Running task 3423 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_install)
NOTE: recipe gtk+3-3.24.52-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_install: Succeeded
NOTE: Running task 3424 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_package)
NOTE: Running task 3425 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.52-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3427 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_49.0.bb:do_configure)
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_configure: Started
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_configure: Failed
NOTE: recipe gtk+3-3.24.52-r0: task do_package: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 3427 tasks of which 3357 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260401124115.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260401124115.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_49.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/adwaita-icon-theme/49.0/temp/log.do_configure.2822918
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: adwaita-icon-theme-49.0-r0 do_configure: Error executing a python function in exec_func_python() autogenerated:

The stack trace of python calls that resulted in this exception/failure was:
File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:extend_recipe_sysroot(d)
     0003:
File: '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/classes-global/staging.bbclass', lineno: 619, function: extend_recipe_sysroot
     0615:                    if "/bin/" in l or "/sbin/" in l:
     0616:                        # defer /*bin/* files until last in case they need libs
     0617:                        binfiles[l] = (targetdir, dest)
     0618:                    else:
 *** 0619:                        staging_copyfile(l, targetdir, dest, postinsts, seendirs)
     0620:
     0621:    # Handle deferred binfiles
     0622:    for l in binfiles:
     0623:        (targetdir, dest) = binfiles[l]
File: '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/classes-global/staging.bbclass', lineno: 165, function: staging_copyfile
     0161:        os.symlink(linkto, dest)
     0162:        #bb.warn(c)
     0163:    else:
     0164:        try:
 *** 0165:            os.link(c, dest)
     0166:        except OSError as err:
     0167:            if err.errno == errno.EXDEV:
     0168:                bb.utils.copyfile(c, dest)
     0169:            else:
Exception: FileExistsError: [Errno 17] File exists: '/srv/pokybuild/yocto-worker/auh/build/build/tmp/sysroots-components/cortexa15t2hf-neon/bsd-headers/usr/include/sys/queue.h' -> '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/adwaita-icon-theme/49.0/recipe-sysroot/usr/include/sys/queue.h'

ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/adwaita-icon-theme/49.0/temp/log.do_configure.2822918
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_49.0.bb:do_configure) failed with exit code '1'

--===============2421927274616634664==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gtk-3-upgrade-3.24.51-3.24.52.patch"

RnJvbSBkYmUwN2NiMDE2MWI4OGFiNjc3YjU3MGViOTFkNmYxODM2YTVmODE4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBBcHIgMjAyNiAxMjo0MzoxMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGd0
ayszOiB1cGdyYWRlIDMuMjQuNTEgLT4gMy4yNC41MgoKLS0tCiBtZXRhL3JlY2lwZXMtZ25vbWUv
Z3RrKy9ndGsrMy9vcGVuZ2wucGF0Y2ggICAgfCA0OCArKysrKysrKystLS0tLS0tLS0tCiAuLi4v
e2d0ayszXzMuMjQuNTEuYmIgPT4gZ3RrKzNfMy4yNC41Mi5iYn0gICAgfCAgMiArLQogMiBmaWxl
cyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAyNSBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZ25vbWUvZ3RrKy97Z3RrKzNfMy4yNC41MS5iYiA9PiBndGsrM18zLjI0LjUyLmJi
fSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0ayszL29wZW5n
bC5wYXRjaCBiL21ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0ayszL29wZW5nbC5wYXRjaAppbmRl
eCA1MWQ0YzhlNDNhLi43MTAyZmQ0MzliIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUv
Z3RrKy9ndGsrMy9vcGVuZ2wucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2d0aysvZ3Rr
KzMvb3BlbmdsLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiOTg4
NzIxNjdiOTQ2ZWNlZGYyZmQyMDQyYzQ5NWZiOTM3YWZkYzJmIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogSnVzc2kgS3Vra29uZW4gPGp1c3NpLmt1a2tvbmVuQGludGVsLmNvbT4KIERh
dGU6IEZyaSwgMTYgT2N0IDIwMTUgMTY6MzU6MTYgKzAzMDAKIFN1YmplY3Q6IFtQQVRDSF0gRG8g
bm90IHRyeSB0byBpbml0aWFsaXplIEdMIHdpdGhvdXQgbGliR0wKQEAgLTQwLDcgKzQwLDcgQEAg
U2lnbmVkLW9mZi1ieTogSnVzc2kgS3Vra29uZW4gPGp1c3NpLmt1a2tvbmVuQGludGVsLmNvbT4K
ICAyMSBmaWxlcyBjaGFuZ2VkLCAxMzEgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCiAK
IGRpZmYgLS1naXQgYS9kZW1vcy9ndGstZGVtby9tZXNvbi5idWlsZCBiL2RlbW9zL2d0ay1kZW1v
L21lc29uLmJ1aWxkCi1pbmRleCAyNTJkYTE2ZDA1Li40YjU3Y2ZmNmFjIDEwMDY0NAoraW5kZXgg
MjUyZGExNi4uNGI1N2NmZiAxMDA2NDQKIC0tLSBhL2RlbW9zL2d0ay1kZW1vL21lc29uLmJ1aWxk
CiArKysgYi9kZW1vcy9ndGstZGVtby9tZXNvbi5idWlsZAogQEAgLTI4LDcgKzI4LDYgQEAgZGVt
b3MgPSBmaWxlcyhbCkBAIC02Myw3ICs2Myw3IEBAIGluZGV4IDI1MmRhMTZkMDUuLjRiNTdjZmY2
YWMgMTAwNjQ0CiAgICBkZW1vcyArPSBmaWxlcygncGFnZXNldHVwLmMnKQogIGVuZGlmCiBkaWZm
IC0tZ2l0IGEvZG9jcy90b29scy9tZXNvbi5idWlsZCBiL2RvY3MvdG9vbHMvbWVzb24uYnVpbGQK
LWluZGV4IDA1NjIxZWU3ZWQuLjNkMGEzMzNiMzIgMTAwNjQ0CitpbmRleCAwNTYyMWVlLi4zZDBh
MzMzIDEwMDY0NAogLS0tIGEvZG9jcy90b29scy9tZXNvbi5idWlsZAogKysrIGIvZG9jcy90b29s
cy9tZXNvbi5idWlsZAogQEAgLTIsMTAgKzIsMTMgQEAgaWYgeDExX2VuYWJsZWQKQEAgLTgzLDcg
KzgzLDcgQEAgaW5kZXggMDU2MjFlZTdlZC4uM2QwYTMzM2IzMiAxMDA2NDQKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBpbmNsdWRlX2RpcmVjdG9yaWVzOiBbIGNvbmZpbmMsIGdka2luYywg
Z3RraW5jLCB0ZXN0aW5jLCBdLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRlcGVuZGVu
Y2llczogbGliZ3RrX2RlcCkKIGRpZmYgLS1naXQgYS9kb2NzL3Rvb2xzL3dpZGdldHMuYyBiL2Rv
Y3MvdG9vbHMvd2lkZ2V0cy5jCi1pbmRleCA5MzJkYWYxNzQ2Li4zNDg4MDdlMTMzIDEwMDY0NAor
aW5kZXggOTMyZGFmMS4uMzQ4ODA3ZSAxMDA2NDQKIC0tLSBhL2RvY3MvdG9vbHMvd2lkZ2V0cy5j
CiArKysgYi9kb2NzL3Rvb2xzL3dpZGdldHMuYwogQEAgLTgsNyArOCw5IEBACkBAIC0xMTAsNyAr
MTEwLDcgQEAgaW5kZXggOTMyZGFmMTc0Ni4uMzQ4ODA3ZTEzMyAxMDA2NDQKICAKICAgIHJldHVy
biBpbmZvOwogZGlmZiAtLWdpdCBhL2dkay9nZGtjb25maWcuaC5tZXNvbiBiL2dkay9nZGtjb25m
aWcuaC5tZXNvbgotaW5kZXggN2RiMTllMDQ3MC4uMDg4NjUxYmFmYSAxMDA2NDQKK2luZGV4IDdk
YjE5ZTAuLjA4ODY1MWIgMTAwNjQ0CiAtLS0gYS9nZGsvZ2RrY29uZmlnLmgubWVzb24KICsrKyBi
L2dkay9nZGtjb25maWcuaC5tZXNvbgogQEAgLTE1LDYgKzE1LDcgQEAgR19CRUdJTl9ERUNMUwpA
QCAtMTIyLDcgKzEyMiw3IEBAIGluZGV4IDdkYjE5ZTA0NzAuLjA4ODY1MWJhZmEgMTAwNjQ0CiAg
R19FTkRfREVDTFMKICAKIGRpZmYgLS1naXQgYS9nZGsvZ2RrZGlzcGxheS5jIGIvZ2RrL2dka2Rp
c3BsYXkuYwotaW5kZXggNWM0MWE0OGZkMC4uOTIwYmIxOGNlOCAxMDA2NDQKK2luZGV4IDVjNDFh
NDguLjkyMGJiMTggMTAwNjQ0CiAtLS0gYS9nZGsvZ2RrZGlzcGxheS5jCiArKysgYi9nZGsvZ2Rr
ZGlzcGxheS5jCiBAQCAtMjQxMiw3ICsyNDEyLDExIEBAIGdib29sZWFuCkBAIC0xNTAsNyArMTUw
LDcgQEAgaW5kZXggNWM0MWE0OGZkMC4uOTIwYmIxOGNlOCAxMDA2NDQKICAKICBHZGtSZW5kZXJp
bmdNb2RlCiBkaWZmIC0tZ2l0IGEvZ2RrL2dka2dsLmMgYi9nZGsvZ2RrZ2wuYwotaW5kZXggMDk0
MGMwNmM3MS4uNGI1NjYxNGY5ZiAxMDA2NDQKK2luZGV4IDA5NDBjMDYuLjRiNTY2MTQgMTAwNjQ0
CiAtLS0gYS9nZGsvZ2RrZ2wuYwogKysrIGIvZ2RrL2dka2dsLmMKIEBAIC0yMSw4ICsyMSw5IEBA
CkBAIC0yMjcsNyArMjI3LDcgQEAgaW5kZXggMDk0MGMwNmM3MS4uNGI1NjYxNGY5ZiAxMDA2NDQK
ICsjZW5kaWYKICB9CiBkaWZmIC0tZ2l0IGEvZ2RrL2dka2dsY29udGV4dC5jIGIvZ2RrL2dka2ds
Y29udGV4dC5jCi1pbmRleCA1MmM3YmNlNjkyLi5mYTU0NDc5NGFjIDEwMDY0NAoraW5kZXggNTJj
N2JjZS4uZmE1NDQ3OSAxMDA2NDQKIC0tLSBhL2dkay9nZGtnbGNvbnRleHQuYwogKysrIGIvZ2Rr
L2dka2dsY29udGV4dC5jCiBAQCAtODUsNyArODUsOSBAQApAQCAtMjczLDcgKzI3Myw3IEBAIGlu
ZGV4IDUyYzdiY2U2OTIuLmZhNTQ0Nzk0YWMgMTAwNjQ0CiAgCiAgLyoqCiBkaWZmIC0tZ2l0IGEv
Z2RrL2dka3dpbmRvdy5jIGIvZ2RrL2dka3dpbmRvdy5jCi1pbmRleCA2MmUwY2Y4MTZmLi5iOGJk
YTcxNDBkIDEwMDY0NAoraW5kZXggMmY1NTAxZi4uMzcxMjJmOSAxMDA2NDQKIC0tLSBhL2dkay9n
ZGt3aW5kb3cuYwogKysrIGIvZ2RrL2dka3dpbmRvdy5jCiBAQCAtNDUsNyArNDUsOSBAQApAQCAt
MzMzLDcgKzMzMyw3IEBAIGluZGV4IDYyZTBjZjgxNmYuLmI4YmRhNzE0MGQgMTAwNjQ0CiAgICAg
ICAgICAgIGNhaXJvX3JlZ2lvbl9kZXN0cm95IChvcGFxdWVfcmVnaW9uKTsKICAKIGRpZmYgLS1n
aXQgYS9nZGsvbWVzb24uYnVpbGQgYi9nZGsvbWVzb24uYnVpbGQKLWluZGV4IDI5N2MzOGM2OGUu
LmZjNzFmOGY0OWQgMTAwNjQ0CitpbmRleCAyOTdjMzhjLi5mYzcxZjhmIDEwMDY0NAogLS0tIGEv
Z2RrL21lc29uLmJ1aWxkCiArKysgYi9nZGsvbWVzb24uYnVpbGQKIEBAIC01Niw3ICs1Niw2IEBA
IGdka19naXJfcHVibGljX2hlYWRlcnMgPSBmaWxlcygKQEAgLTM2Niw3ICszNjYsNyBAQCBpbmRl
eCAyOTdjMzhjNjhlLi5mYzcxZjhmNDlkIDEwMDY0NAogIGdka2NvbmZpZyA9IGNvbmZpZ3VyZV9m
aWxlKAogICAgaW5wdXQgIDogJ2dka2NvbmZpZy5oLm1lc29uJywKIGRpZmYgLS1naXQgYS9nZGsv
eDExL2dka2Rpc3BsYXkteDExLmMgYi9nZGsveDExL2dka2Rpc3BsYXkteDExLmMKLWluZGV4IGM2
ZDFmNTNkNzAuLjk3OTNjYjQzMjkgMTAwNjQ0CitpbmRleCBjNmQxZjUzLi45NzkzY2I0IDEwMDY0
NAogLS0tIGEvZ2RrL3gxMS9nZGtkaXNwbGF5LXgxMS5jCiArKysgYi9nZGsveDExL2dka2Rpc3Bs
YXkteDExLmMKIEBAIC0zNyw3ICszNyw5IEBACkBAIC0zOTEsNyArMzkxLDcgQEAgaW5kZXggYzZk
MWY1M2Q3MC4uOTc5M2NiNDMyOSAxMDA2NDQKICAgIGRpc3BsYXlfY2xhc3MtPmdldF9kZWZhdWx0
X3NlYXQgPSBnZGtfeDExX2Rpc3BsYXlfZ2V0X2RlZmF1bHRfc2VhdDsKICAKIGRpZmYgLS1naXQg
YS9nZGsveDExL2dka3Zpc3VhbC14MTEuYyBiL2dkay94MTEvZ2RrdmlzdWFsLXgxMS5jCi1pbmRl
eCA4MTQ3OWQ4MWY0Li4zYzhjNWMwMmZmIDEwMDY0NAoraW5kZXggODE0NzlkOC4uM2M4YzVjMCAx
MDA2NDQKIC0tLSBhL2dkay94MTEvZ2RrdmlzdWFsLXgxMS5jCiArKysgYi9nZGsveDExL2dka3Zp
c3VhbC14MTEuYwogQEAgLTMwNiw3ICszMDYsMTIgQEAgX2dka194MTFfc2NyZWVuX2luaXRfdmlz
dWFscyAoR2RrU2NyZWVuICpzY3JlZW4pCkBAIC00MDgsNyArNDA4LDcgQEAgaW5kZXggODE0Nzlk
ODFmNC4uM2M4YzVjMDJmZiAxMDA2NDQKICAKICBnaW50CiBkaWZmIC0tZ2l0IGEvZ2RrL3gxMS9n
ZGt3aW5kb3cteDExLmMgYi9nZGsveDExL2dka3dpbmRvdy14MTEuYwotaW5kZXggMGM1OWFkNDY0
ZS4uYWQzMjQ0ZjE1MiAxMDA2NDQKK2luZGV4IGM2MGNlY2QuLjI4ZjAwOGIgMTAwNjQ0CiAtLS0g
YS9nZGsveDExL2dka3dpbmRvdy14MTEuYwogKysrIGIvZ2RrL3gxMS9nZGt3aW5kb3cteDExLmMK
IEBAIC0zNiw3ICszNiw5IEBACkBAIC00MzIsNyArNDMyLDcgQEAgaW5kZXggMGM1OWFkNDY0ZS4u
YWQzMjQ0ZjE1MiAxMDA2NDQKICAgIGltcGxfY2xhc3MtPmdldF91bnNjYWxlZF9zaXplID0gZ2Rr
X3gxMV93aW5kb3dfZ2V0X3Vuc2NhbGVkX3NpemU7CiAgfQogZGlmZiAtLWdpdCBhL2dkay94MTEv
Z2RreC1hdXRvY2xlYW51cHMuaCBiL2dkay94MTEvZ2RreC1hdXRvY2xlYW51cHMuaAotaW5kZXgg
ZWRiMGVhN2RiZi4uYTMxN2Q2MWNjYSAxMDA2NDQKK2luZGV4IGVkYjBlYTcuLmEzMTdkNjEgMTAw
NjQ0CiAtLS0gYS9nZGsveDExL2dka3gtYXV0b2NsZWFudXBzLmgKICsrKyBiL2dkay94MTEvZ2Rr
eC1hdXRvY2xlYW51cHMuaAogQEAgLTMwLDcgKzMwLDkgQEAgR19ERUZJTkVfQVVUT1BUUl9DTEVB
TlVQX0ZVTkMoR2RrWDExRGV2aWNlWEkyLCBnX29iamVjdF91bnJlZikKQEAgLTQ0Niw3ICs0NDYs
NyBAQCBpbmRleCBlZGIwZWE3ZGJmLi5hMzE3ZDYxY2NhIDEwMDY0NAogIEdfREVGSU5FX0FVVE9Q
VFJfQ0xFQU5VUF9GVU5DKEdka1gxMVNjcmVlbiwgZ19vYmplY3RfdW5yZWYpCiAgR19ERUZJTkVf
QVVUT1BUUl9DTEVBTlVQX0ZVTkMoR2RrWDExVmlzdWFsLCBnX29iamVjdF91bnJlZikKIGRpZmYg
LS1naXQgYS9nZGsveDExL2dka3guaCBiL2dkay94MTEvZ2RreC5oCi1pbmRleCAxZjY0YmNjYjZk
Li40ZGI2YzE4MzUxIDEwMDY0NAoraW5kZXggMWY2NGJjYy4uNGRiNmMxOCAxMDA2NDQKIC0tLSBh
L2dkay94MTEvZ2RreC5oCiArKysgYi9nZGsveDExL2dka3guaAogQEAgLTQzLDcgKzQzLDkgQEAK
QEAgLTQ2MCw3ICs0NjAsNyBAQCBpbmRleCAxZjY0YmNjYjZkLi40ZGI2YzE4MzUxIDEwMDY0NAog
ICNpbmNsdWRlIDxnZGsveDExL2dka3gxMW1vbml0b3IuaD4KICAjaW5jbHVkZSA8Z2RrL3gxMS9n
ZGt4MTFwcm9wZXJ0eS5oPgogZGlmZiAtLWdpdCBhL2dkay94MTEvbWVzb24uYnVpbGQgYi9nZGsv
eDExL21lc29uLmJ1aWxkCi1pbmRleCA3NTRhZTBhNjE1Li4wMzE4YzgzODc3IDEwMDY0NAoraW5k
ZXggNzU0YWUwYS4uMDMxOGM4MyAxMDA2NDQKIC0tLSBhL2dkay94MTEvbWVzb24uYnVpbGQKICsr
KyBiL2dkay94MTEvbWVzb24uYnVpbGQKIEBAIC0xNCw3ICsxNCw2IEBAIGdka194MTFfc291cmNl
cyA9IGZpbGVzKApAQCAtNDkyLDcgKzQ5Miw3IEBAIGluZGV4IDc1NGFlMGE2MTUuLjAzMThjODM4
NzcgMTAwNjQ0CiAgaW5zdGFsbF9oZWFkZXJzKCdnZGt4LmgnLCBzdWJkaXI6ICdndGstMy4wL2dk
ay8nKQogIAogZGlmZiAtLWdpdCBhL2d0ay9ndGtnbGFyZWEuYyBiL2d0ay9ndGtnbGFyZWEuYwot
aW5kZXggODAyMzAzZWE5Zi4uNjQzOWQ3NzQ1ZCAxMDA2NDQKK2luZGV4IDgwMjMwM2UuLjY0Mzlk
NzcgMTAwNjQ0CiAtLS0gYS9ndGsvZ3RrZ2xhcmVhLmMKICsrKyBiL2d0ay9ndGtnbGFyZWEuYwog
QEAgLTI5LDcgKzI5LDkgQEAKQEAgLTU4MCw3ICs1ODAsNyBAQCBpbmRleCA4MDIzMDNlYTlmLi42
NDM5ZDc3NDVkIDEwMDY0NAogIAogIHN0YXRpYyBnYm9vbGVhbgogZGlmZiAtLWdpdCBhL2d0ay9p
bnNwZWN0b3IvZ2VuZXJhbC5jIGIvZ3RrL2luc3BlY3Rvci9nZW5lcmFsLmMKLWluZGV4IGEzYTM0
MTk1NmIuLjI3NDYwMGU3NGEgMTAwNjQ0CitpbmRleCBhM2EzNDE5Li4yNzQ2MDBlIDEwMDY0NAog
LS0tIGEvZ3RrL2luc3BlY3Rvci9nZW5lcmFsLmMKICsrKyBiL2d0ay9pbnNwZWN0b3IvZ2VuZXJh
bC5jCiBAQCAtMzUsOCArMzUsMTAgQEAKQEAgLTYyNyw3ICs2MjcsNyBAQCBpbmRleCBhM2EzNDE5
NTZiLi4yNzQ2MDBlNzRhIDEwMDY0NAogICAgaWYgKEdES19JU19XQVlMQU5EX0RJU1BMQVkgKGdk
a19kaXNwbGF5X2dldF9kZWZhdWx0ICgpKSkKICAgICAgewogZGlmZiAtLWdpdCBhL21lc29uLmJ1
aWxkIGIvbWVzb24uYnVpbGQKLWluZGV4IDA0ZDU0YThlMmMuLjMyNDkxNWM5ZWUgMTAwNjQ0Citp
bmRleCBmN2QzZjhlLi5jZTZiMzFmIDEwMDY0NAogLS0tIGEvbWVzb24uYnVpbGQKICsrKyBiL21l
c29uLmJ1aWxkCiBAQCAtMTM3LDYgKzEzNyw3IEBAIHdheWxhbmRfZW5hYmxlZCAgICAgICAgPSBn
ZXRfb3B0aW9uKCd3YXlsYW5kX2JhY2tlbmQnKQpAQCAtNjU4LDcgKzY1OCw3IEBAIGluZGV4IDA0
ZDU0YThlMmMuLjMyNDkxNWM5ZWUgMTAwNjQ0CiAgaWYgaXNvX2NvZGVzX2RlcC5mb3VuZCgpCiAg
ICBjZGF0YS5zZXRfcXVvdGVkKCdJU09fQ09ERVNfUFJFRklYJywgaXNvX2NvZGVzX2RlcC5nZXRf
dmFyaWFibGUocGtnY29uZmlnOiAncHJlZml4JykpCiAgZWxzZQotQEAgLTkxNCw5ICs5MTksMTUg
QEAgZWxzZQorQEAgLTkxNyw5ICs5MjIsMTUgQEAgZWxzZQogICAgZ2lvX3BhY2thZ2VzID0gWydn
aW8tMi4wJywgZ2xpYl9yZXFdCiAgZW5kaWYKICAKQEAgLTY3NSw3ICs2NzUsNyBAQCBpbmRleCAw
NGQ1NGE4ZTJjLi4zMjQ5MTVjOWVlIDEwMDY0NAogICAgICAgICAgICAgICAgICAgICAgIFsnZnJp
YmlkaScsIGZyaWJpZGlfcmVxXSkpCiAgCiAgZ3RrX3BhY2thZ2VzID0gJyAnLmpvaW4oWwotQEAg
LTkzMCw3ICs5NDEsNyBAQCBwa2djb25mLnNldCgnR1RLX1BBQ0tBR0VTJywgZ3RrX3BhY2thZ2Vz
KQorQEAgLTkzMyw3ICs5NDQsNyBAQCBwa2djb25mLnNldCgnR1RLX1BBQ0tBR0VTJywgZ3RrX3Bh
Y2thZ2VzKQogICMgUmVxdWlyZXMucHJpdmF0ZQogIHBjX2dka19leHRyYV9saWJzICs9IGNhaXJv
X2xpYnMKICAKQEAgLTY4NSw3ICs2ODUsNyBAQCBpbmRleCAwNGQ1NGE4ZTJjLi4zMjQ5MTVjOWVl
IDEwMDY0NAogICAgZ3RrX3ByaXZhdGVfcGFja2FnZXMgKz0gWydwYW5nb2Z0MiddCiAgZW5kaWYK
IGRpZmYgLS1naXQgYS9tZXNvbl9vcHRpb25zLnR4dCBiL21lc29uX29wdGlvbnMudHh0Ci1pbmRl
eCA5NDA5OWFhMDFlLi44YmQwOTY4OTZkIDEwMDY0NAoraW5kZXggOTQwOTlhYS4uOGJkMDk2OCAx
MDA2NDQKIC0tLSBhL21lc29uX29wdGlvbnMudHh0CiArKysgYi9tZXNvbl9vcHRpb25zLnR4dAog
QEAgLTE5LDYgKzE5LDggQEAgb3B0aW9uKCdwcm9maWxlcicsIHR5cGU6ICdib29sZWFuJywgdmFs
dWU6IGZhbHNlLApAQCAtNjk4LDcgKzY5OCw3IEBAIGluZGV4IDk0MDk5YWEwMWUuLjhiZDA5Njg5
NmQgMTAwNjQ0CiAgIyBQcmludCBiYWNrZW5kcwogIG9wdGlvbigncHJpbnRfYmFja2VuZHMnLCB0
eXBlIDogJ3N0cmluZycsIHZhbHVlIDogJ2F1dG8nLAogZGlmZiAtLWdpdCBhL3Rlc3RzL21lc29u
LmJ1aWxkIGIvdGVzdHMvbWVzb24uYnVpbGQKLWluZGV4IDZmZjI0OWY4YTEuLmYyYTlmYmFkNmQg
MTAwNjQ0CitpbmRleCA2ZmYyNDlmLi5mMmE5ZmJhIDEwMDY0NAogLS0tIGEvdGVzdHMvbWVzb24u
YnVpbGQKICsrKyBiL3Rlc3RzL21lc29uLmJ1aWxkCiBAQCAtNSw3ICs1LDYgQEAgZ3RrX3Rlc3Rz
ID0gWwpAQCAtNzMyLDcgKzczMiw3IEBAIGluZGV4IDZmZjI0OWY4YTEuLmYyYTlmYmFkNmQgMTAw
NjQ0CiAgICBndGtfdGVzdHMgKz0gW1sndGVzdGZvbnRjaG9vc2VyZGlhbG9nJ11dCiAgZW5kaWYK
IGRpZmYgLS1naXQgYS90ZXN0c3VpdGUvZ3RrL29iamVjdHMtZmluYWxpemUuYyBiL3Rlc3RzdWl0
ZS9ndGsvb2JqZWN0cy1maW5hbGl6ZS5jCi1pbmRleCA5NWI1NjVjNTkxLi43ZjM0MGMzNzc1IDEw
MDY0NAoraW5kZXggOTViNTY1Yy4uN2YzNDBjMyAxMDA2NDQKIC0tLSBhL3Rlc3RzdWl0ZS9ndGsv
b2JqZWN0cy1maW5hbGl6ZS5jCiArKysgYi90ZXN0c3VpdGUvZ3RrL29iamVjdHMtZmluYWxpemUu
YwogQEAgLTEwOSw3ICsxMDksOSBAQCBtYWluIChpbnQgYXJnYywgY2hhciAqKmFyZ3YpCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGsrM18zLjI0LjUxLmJiIGIvbWV0YS9y
ZWNpcGVzLWdub21lL2d0aysvZ3RrKzNfMy4yNC41Mi5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGsrM18zLjI0LjUxLmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGsrM18zLjI0LjUyLmJiCmluZGV4IDM1Zjk5
YjJkZTAuLmNiM2M1NDRjN2UgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0
ayszXzMuMjQuNTEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2d0aysvZ3RrKzNfMy4yNC41
Mi5iYgpAQCAtMjIsNyArMjIsNyBAQCBpbmhlcml0IGdldHRleHQgZ25vbWViYXNlIGd0ay1kb2Mg
dXBkYXRlLWFsdGVybmF0aXZlcyBndGstaW1tb2R1bGVzLWNhY2hlIGdzZXR0aQogU1JDX1VSSSAr
PSAiXAogICAgICAgICAgICBmaWxlOi8vb3BlbmdsLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JD
X1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiMDAxMzg3N2M2YmQyM2MyZGJlNDJhZDdjNzBhMDUz
ZDBlNDQ5YmU2NjczNjU3NGUzNzg2N2M0OWM1ZjkwNWE0ZiIKK1NSQ19VUklbYXJjaGl2ZS5zaGEy
NTZzdW1dID0gIjgwOTMxZmE0NzJhNzdiOWExNjRmNjc0MGUzYzBiNDQ0ZmFjNjc3MDA1NDYzMmQz
NWE3ZmY5ZDY3OWU1ZTdiOWYiCiAKIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayIK
IAotLSAKMi40Ny4xCgo=

--===============2421927274616634664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

Changes to packages/all-poky-linux/adwaita-icon-theme (sysroot):
  /usr/share/icons/Adwaita/scalable/status/folder-open.svg changed type from symlink to file
  /usr/share/icons/Adwaita/scalable/status/folder-open.svg changed permissions from rwxrwxrwx to rw-r--r--
  /usr/share/icons/Adwaita/symbolic/legacy/emblem-important-symbolic.svg was removed
  /usr/share/icons/Adwaita/symbolic/legacy/emblem-system-symbolic.svg was removed
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-dbg: PKGSIZE changed from 35590928 to 35595568 (+0%)
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-dbg: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-dbg: FILELIST: removed "/usr/lib/.debug/libgtk-3.so.0.2419.32 /usr/lib/.debug/libgdk-3.so.0.2419.32", added "/usr/lib/.debug/libgtk-3.so.0.2420.32 /usr/lib/.debug/libgdk-3.so.0.2420.32"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-dbg: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-demo: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-demo: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-dev: PKGSIZE changed from 14155128 to 14155213 (+0%)
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-dev: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-dev: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-doc: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-doc: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ab: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ab: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-af: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-af: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-am: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-am: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-an: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-an: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ang: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ang: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ar: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ar: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-as: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-as: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ast: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ast: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-az-ir: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-az-ir: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-az: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-az: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-be+latin: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-be+latin: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-be: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-be: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-bg: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-bg: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-bn-in: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-bn-in: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-bn: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-bn: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-br: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-br: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-bs: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-bs: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ca+valencia: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ca+valencia: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ca: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ca: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ckb: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ckb: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-crh: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-crh: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-cs: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-cs: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-cy: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-cy: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-da: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-da: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-de: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-de: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-dz: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-dz: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-el: PKGSIZE changed from 399420 to 400496 (+0%)
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-el: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-el: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-en+shaw: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-en+shaw: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-en-ca: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-en-ca: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-en-gb: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-en-gb: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-en: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-en: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-eo: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-eo: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-es: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-es: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-et: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-et: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-eu: PKGSIZE changed from 319194 to 319198 (+0%)
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-eu: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-eu: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-fa: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-fa: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-fi: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-fi: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-fr: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-fr: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-fur: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-fur: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ga: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ga: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-gd: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-gd: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-gl: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-gl: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-gu: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-gu: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-he: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-he: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-hi: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-hi: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-hr: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-hr: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-hu: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-hu: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-hy: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-hy: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ia: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ia: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-id: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-id: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ie: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ie: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-io: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-io: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-is: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-is: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-it: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-it: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ja: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ja: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ka: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ka: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-kab: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-kab: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-kg: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-kg: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-kk: PKGSIZE changed from 149609 to 396077 (+165%)
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-kk: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-kk: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-km: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-km: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-kn: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-kn: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ko: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ko: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ku: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ku: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ky: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ky: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-lg: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-lg: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-li: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-li: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-lt: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-lt: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-lv: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-lv: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-mai: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-mai: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-mi: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-mi: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-mk: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-mk: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ml: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ml: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-mn: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-mn: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-mr: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-mr: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ms: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ms: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-my: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-my: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-nb: PKGSIZE changed from 231591 to 233318 (+1%)
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-nb: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-nb: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-nds: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-nds: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ne: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ne: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-nl: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-nl: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-nn: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-nn: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-nso: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-nso: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-oc: PKGSIZE changed from 316909 to 318114 (+0%)
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-oc: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-oc: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-or: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-or: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-pa: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-pa: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-pl: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-pl: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ps: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ps: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-pt-br: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-pt-br: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-pt: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-pt: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ro: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ro: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ru: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ru: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-rw: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-rw: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-si: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-si: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-sk: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-sk: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-sl: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-sl: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-sq: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-sq: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-sr+ije: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-sr+ije: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-sr+latin: PKGSIZE changed from 290887 to 311883 (+7%)
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-sr+latin: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-sr+latin: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-sr: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-sr: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-sv: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-sv: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ta: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ta: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-te: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-te: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-tg: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-tg: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-th: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-th: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-tk: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-tk: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-tr: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-tr: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-tt: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-tt: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ug: PKGSIZE changed from 304176 to 399876 (+31%)
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ug: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ug: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-uk: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-uk: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ur: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ur: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-uz+cyrillic: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-uz+cyrillic: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-uz: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-uz: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-vi: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-vi: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-wa: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-wa: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-xh: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-xh: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-yi: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-yi: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-zh-cn: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-zh-cn: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-zh-hk: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-zh-hk: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-zh-tw: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-zh-tw: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-src: PKGSIZE changed from 46589835 to 46598161 (+0%)
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-src: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-src: FILELIST: directory renamed /usr/src/debug/gtk+3/3.24.51/gdk/x11 -> /usr/src/debug/gtk+3/3.24.52/gdk/x11, directory renamed /usr/src/debug/gtk+3/3.24.51/demos/gtk-demo -> /usr/src/debug/gtk+3/3.24.52/demos/gtk-demo, directory renamed /usr/src/debug/gtk+3/3.24.51/modules/printbackends/file -> /usr/src/debug/gtk+3/3.24.52/modules/printbackends/file, directory renamed /usr/src/debug/gtk+3/3.24.51/gdk -> /usr/src/debug/gtk+3/3.24.52/gdk, directory renamed /usr/src/debug/gtk+3/3.24.51/modules/input -> /usr/src/debug/gtk+3/3.24.52/modules/input, directory renamed /usr/src/debug/gtk+3/3.24.51/gdk/wayland -> /usr/src/debug/gtk+3/3.24.52/gdk/wayland, directory renamed /usr/src/debug/gtk+3/3.24.51 -> /usr/src/debug/gtk+3/3.24.52, directory renamed /usr/src/debug/gtk+3/3.24.51/demos/widget-factory -> /usr/src/debug/gtk+3/3.24.52/demos/widget-factory, directory renamed /usr/src/debug/gtk+3/3.24.51/gdk/deprecated -> /usr/src/debug/gtk+3/3.24.52/gdk/d
 eprecated, directory renamed /usr/src/debug/gtk+3/3.24.51/gtk/deprecated -> /usr/src/debug/gtk+3/3.24.52/gtk/deprecated, directory renamed /usr/src/debug/gtk+3/3.24.51/gtk/inspector -> /usr/src/debug/gtk+3/3.24.52/gtk/inspector, directory renamed /usr/src/debug/gtk+3/3.24.51/gtk -> /usr/src/debug/gtk+3/3.24.52/gtk, directory renamed /usr/src/debug/gtk+3/3.24.51/demos/icon-browser -> /usr/src/debug/gtk+3/3.24.52/demos/icon-browser, directory renamed /usr/src/debug/gtk+3/3.24.51/libgail-util -> /usr/src/debug/gtk+3/3.24.52/libgail-util, directory renamed /usr/src/debug/gtk+3/3.24.51/modules/printbackends/lpr -> /usr/src/debug/gtk+3/3.24.52/modules/printbackends/lpr, directory renamed /usr/src/debug/gtk+3/3.24.51/gtk/a11y -> /usr/src/debug/gtk+3/3.24.52/gtk/a11y
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-src: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-staticdev: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-staticdev: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3: PKGSIZE changed from 13500173 to 13554489 (+0%)
packages/x86-64-v3-poky-linux/gtk+3/gtk+3: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3: FILELIST: removed "/usr/lib/libgdk-3.so.0.2419.32 /usr/lib/libgtk-3.so.0.2419.32", added "/usr/lib/libgtk-3.so.0.2420.32 /usr/lib/libgdk-3.so.0.2420.32"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-am-et: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-am-et: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-cedilla: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-cedilla: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-cyrillic-translit: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-cyrillic-translit: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-inuktitut: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-inuktitut: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-ipa: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-ipa: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-multipress: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-multipress: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-thai: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-thai: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-ti-er: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-ti-er: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-ti-et: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-ti-et: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-viqr: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-viqr: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-wayland: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-wayland: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-xim: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-xim: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk3-printbackend-file: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk3-printbackend-file: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk3-printbackend-lpr: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk3-printbackend-lpr: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3: SRC_URI changed from "https://download.gnome.org/sources//gtk/3.24/gtk-3.24.51.tar.xz;name=archive file://opengl.patch" to "https://download.gnome.org/sources//gtk/3.24/gtk-3.24.52.tar.xz;name=archive file://opengl.patch"
Changes to packages/x86-64-v3-poky-linux/gtk+3 (sysroot):
  /usr/lib/libgdk-3.so.0 changed symlink target from libgdk-3.so.0.2419.32 to libgdk-3.so.0.2420.32
  /usr/lib/libgtk-3.so.0 changed symlink target from libgtk-3.so.0.2419.32 to libgtk-3.so.0.2420.32
  /usr/lib/libgdk-3.so.0.2419.32 moved to /usr/lib/libgdk-3.so.0.2420.32
  /usr/lib/libgtk-3.so.0.2419.32 moved to /usr/lib/libgtk-3.so.0.2420.32
Changes to packages/x86_64-linux/gtk+3-native (sysroot):
  /usr/lib/libgdk-3.so.0 changed symlink target from libgdk-3.so.0.2419.32 to libgdk-3.so.0.2420.32
  /usr/lib/libgtk-3.so.0 changed symlink target from libgtk-3.so.0.2419.32 to libgtk-3.so.0.2420.32
  /usr/lib/libgdk-3.so.0.2419.32 moved to /usr/lib/libgdk-3.so.0.2420.32
  /usr/lib/libgtk-3.so.0.2419.32 moved to /usr/lib/libgtk-3.so.0.2420.32

--===============2421927274616634664==--

