Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 953FAF428DA
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:51 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19812.1776261873807100432
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=VQkihD4O;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=kMMWfMq5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019d91757ad1-59225827-8223-4bbe-ba57-534719f20214-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261888;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IzMqosOMG8JTSQlNzn161T+QOKFGjWxxvgo5AHd7Bhk=;
	b=VQkihD4O2Sm7EJW6ll2z6dVBilw+w46CE+ksAOafgDK+ypLjuNHiYGl7u5jwOAD1
	u+lqX1s+9hJqXtY/42+t/fuMOJNYwc6NC4D7DR9h4fAvDJKGrt30ScgJOfwDn1qvoIL
	swITRvuQlK/3r1TiCDCaQ0VPEqx3QWezS24UwDRE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261888;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IzMqosOMG8JTSQlNzn161T+QOKFGjWxxvgo5AHd7Bhk=;
	b=kMMWfMq5SWApAWoncOSwM8lRXjCGvDjNQ+vEx2ZbqQgRpyLZTCPcihJvnkc74IL7
	eot86b0Kdu8PfBdFAWLSKSL4ePUSGUEAVRpNa/+TIlUE3Xp0vNWRfvZm16PycVa/uiX
	bkEvcrYuyt87d//hQo6JbYGD3LVJgX6SkpoQ9VMQ=
Content-Type: multipart/mixed; boundary="===============0853461305394871633=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gtk+3: upgrading to 3.24.52 FAILED
Message-ID: <0101019d91757ad1-59225827-8223-4bbe-ba57-534719f20214-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235273

--===============0853461305394871633==
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
From aacb0bee01b76c8a2d2c6bb955c1b1c6e138986c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 11:36:54 +0000
Subject: [PATCH] gtk+3: upgrade 3.24.51 -> 3.24.52

---
 meta/recipes-gnome/gtk+/gtk+3/opengl.patch    | 48 +++++++++----------
 .../{gtk+3_3.24.51.bb => gtk+3_3.24.52.bb}    |  2 +-
 2 files changed, 25 insertions(+), 25 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.24.51.bb => gtk+3_3.24.52.bb} (98%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3/opengl.patch b/meta/recipes-gnome/gtk+/gtk+3/opengl.patch
index 51d4c8e43a..ca2b9b6590 100644
--- a/meta/recipes-gnome/gtk+/gtk+3/opengl.patch
+++ b/meta/recipes-gnome/gtk+/gtk+3/opengl.patch
@@ -1,4 +1,4 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From 666c32bbd7a01a287abaea7f304dcb97c007a20d Mon Sep 17 00:00:00 2001
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
index 51a293c1d8..1fcc08443d 100644
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


--===============0853461305394871633==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1971 targets, 62 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-cfa8e6e6bab52c99689edc8c0a157a0523a3f6cd"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:cfa8e6e6bab52c99689edc8c0a157a0523a3f6cd"
meta-yocto-bsp       
meta-poky            = "master:49cbb01d52521bfe557395c9ebfae6b1c162581e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 901 Local 860 Mirrors 0 Missed 41 Current 557 (95% match, 97% complete)
done.
Removing 13 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 563 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 663 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 680 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_qa_setscene)
NOTE: Running setscene task 691 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 695 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_populate_lic_setscene)
NOTE: Running setscene task 704 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 705 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 706 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 707 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 708 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 709 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 717 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 725 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 753 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 754 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.94.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 757 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_populate_lic_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.94.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 760 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 766 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_create_spdx_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 768 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_create_spdx_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 769 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 770 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 772 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_create_spdx_setscene)
NOTE: recipe librsvg-2.61.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libstd-rs-1.94.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk+3-3.24.52-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 773 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.94.1.bb:do_packagedata_setscene)
NOTE: recipe at-spi2-core-2.60.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 776 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 779 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_create_spdx_setscene)
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe librsvg-2.61.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 780 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.94.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 785 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 786 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libstd-rs-1.94.1-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 788 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 789 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_create_spdx_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 790 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 794 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_recipe_spdx_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 796 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 797 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libstd-rs-1.94.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 798 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe vala-0.56.18-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 799 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.94.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.131-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 801 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe librsvg-2.61.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 807 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.47.bb:do_create_spdx_setscene)
NOTE: recipe at-spi2-core-2.60.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 814 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 815 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.131-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 816 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 817 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 819 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 820 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 821 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 824 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-protocols-1.47-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 826 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 827 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_packagedata_setscene)
NOTE: recipe at-spi2-core-2.60.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 829 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 835 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_create_recipe_spdx_setscene)
NOTE: recipe pango-1.57.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 836 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 837 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.57.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 840 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_create_spdx_setscene)
NOTE: recipe pango-1.57.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 842 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 843 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_packagedata_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe mesa-2_26.0.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 844 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_create_spdx_setscene)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 846 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 847 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_create_spdx_setscene)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 848 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_packagedata_setscene)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 849 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 850 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: recipe librsvg-2.61.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pango-1.57.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 851 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 852 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.10.bb:do_packagedata_setscene)
NOTE: recipe at-spi2-core-2.60.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_26.0.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libunwind-1.8.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 856 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 860 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_create_spdx_setscene)
NOTE: recipe python3-packaging-26.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 861 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_packagedata_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.94.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 865 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 866 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 868 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 870 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 873 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_recipe_qa_setscene)
NOTE: recipe libunwind-1.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 875 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-packaging-26.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 878 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_packagedata_setscene)
NOTE: recipe at-spi2-core-2.60.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 880 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 884 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_create_spdx_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 885 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_package_setscene)
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe at-spi2-core-2.60.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_recipe_qa_setscene: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk+3-3.24.52-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 887 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 890 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 891 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 895 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 896 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 899 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 900 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 904 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 906 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 908 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 910 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_packagedata_setscene)
NOTE: Running setscene task 911 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 912 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_create_spdx_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe mesa-2_26.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_26.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 917 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 921 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 923 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 926 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 930 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_packagedata_setscene)
NOTE: Running setscene task 935 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 936 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 938 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 939 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe harfbuzz-12.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 940 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 944 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-12.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 945 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.94.1.bb:do_recipe_qa_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 946 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pango-1.57.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxml2-2.15.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_26.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 947 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.56.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_26.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 950 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 952 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_create_spdx_setscene)
NOTE: recipe libstd-rs-1.94.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 954 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 957 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_populate_sysroot_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 958 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 967 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_package_setscene)
NOTE: Running setscene task 968 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.15.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 969 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 971 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 972 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.56-r0: task do_create_spdx_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 973 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libstd-rs-1.94.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 974 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 977 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_package_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.56-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 982 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 984 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_package_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 985 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-78.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 986 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 988 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.56.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 991 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_package_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 992 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_spdx_setscene)
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 998 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1000 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1001 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1005 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_packagedata_setscene)
NOTE: recipe icu-78.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.56-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1006 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1007 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-78.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1009 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1011 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1012 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe mesa-2_26.0.3-r0: task do_package_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.56-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1016 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1019 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1026 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1029 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1030 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1031 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-12.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1033 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1035 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-78.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1036 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_create_spdx_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1038 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1043 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1044 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1049 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_create_spdx_setscene)
NOTE: recipe harfbuzz-12.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1052 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1056 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.47-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1061 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_create_recipe_spdx_setscene)
NOTE: recipe at-spi2-core-2.60.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-78.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1066 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1069 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1073 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1074 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.60.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1076 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe icu-78.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1077 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1078 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1079 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1082 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_package_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1085 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1089 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1090 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1091 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1097 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1115 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1119 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1121 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1125 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1126 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1127 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1128 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1129 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1132 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1133 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1135 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1137 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1138 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1140 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1141 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.19.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1142 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1144 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe freetype-2.14.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1147 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1149 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1150 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1152 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.19.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1154 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1155 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1157 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.14.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1164 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe freetype-2.14.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.19.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.19.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1166 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1176 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_26.0.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1177 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1178 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1179 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_packagedata_setscene)
NOTE: Running setscene task 1180 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1181 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1182 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1183 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1184 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1185 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1186 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1187 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1188 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1189 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.131-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.131-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_26.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1010 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe mesa-2_26.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1190 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: Running setscene task 1195 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1196 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1197 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1199 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1201 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1205 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1206 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1207 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1209 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1210 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1211 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1212 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.131-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.131-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1214 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1216 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_26.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.19-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1217 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_26.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1218 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1149 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1221 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1222 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1165 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_fetch)
NOTE: Running task 1171 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_fetch)
NOTE: recipe libpciaccess-0.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1227 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1228 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1229 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1231 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1209 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_fetch)
NOTE: Running setscene task 1233 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.19-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1231 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.131-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1235 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.18-r0: task do_fetch: Started
NOTE: recipe vala-0.56.18-r0: task do_fetch: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.131-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1292 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_26.0.3-r0: task do_fetch: Started
NOTE: recipe librsvg-2.61.3-r0: task do_fetch: Started
NOTE: Running task 1305 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_26.0.3-r0: task do_fetch: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1239 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 1240 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1340 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1242 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1244 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1245 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librsvg-2.61.3-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1463 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running task 1471 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_unpack)
NOTE: Running task 1492 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: Running task 1508 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_write_config)
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_26.0.3-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1539 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_fetch)
NOTE: recipe libpciaccess-0.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1580 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1247 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1248 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: Running task 1641 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe gtk+3-3.24.52-r0: task do_fetch: Started
NOTE: Running task 1661 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe librsvg-2.61.3-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: Running task 1684 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_unpack)
NOTE: Running setscene task 1249 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1251 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1252 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_recipe_qa_setscene)
NOTE: recipe librsvg-2.61.3-r0: task do_write_config: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: Running task 1771 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_49.0.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe librsvg-2.61.3-r0: task do_write_config: Succeeded
NOTE: recipe gtk+3-3.24.52-r0: task do_write_config: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: Running task 1813 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_unpack: Started
NOTE: recipe vala-0.56.18-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1844 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_patch)
NOTE: Running task 1853 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_create_recipe_spdx)
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1854 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gtk+3-3.24.52-r0: task do_write_config: Succeeded
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_write_config: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_write_config: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_patch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1255 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1256 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1257 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1258 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe gtk+3-3.24.52-r0: task do_create_recipe_spdx: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: Running setscene task 1260 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1261 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1263 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1264 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.18-r0: task do_patch: Succeeded
NOTE: Running setscene task 1265 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1266 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1271 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1272 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1274 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1276 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1277 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1278 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1280 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe gtk+3-3.24.52-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1887 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1282 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running setscene task 1286 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1288 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_recipe_qa_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: Running task 1904 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1289 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.56.bb:do_packagedata_setscene)
NOTE: Running setscene task 1290 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1291 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1292 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.56.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1293 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1294 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1295 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk+3-3.24.52-r0: task do_unpack: Succeeded
NOTE: Running task 1906 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_patch)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe libpng-1.6.56-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.56-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gtk+3-3.24.52-r0: task do_patch: Started
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1296 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.56-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk+3-3.24.52-r0: task do_patch: Succeeded
NOTE: recipe libpng-1.6.56-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1300 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.56.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1302 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_recipe_qa_setscene)
NOTE: Running task 1923 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_deploy_source_date_epoch)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.56-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.52-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 56f86136d7a4cf1994dc4410aea1740546a49f4519d7112a9e473f8c6a2f81f4
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash cf9776b47d8513ab0122549ec4e8a4560e655f0c2c68f9d460a7f5e027e807b8 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '6d35c7ee2420d56a9a6eb80292dc1872e345be331e81cf6f0fb90a36e6b1fc85', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'cf9776b47d8513ab0122549ec4e8a4560e655f0c2c68f9d460a7f5e027e807b8'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 6d35c7ee2420d56a9a6eb80292dc1872e345be331e81cf6f0fb90a36e6b1fc85 -> cf9776b47d8513ab0122549ec4e8a4560e655f0c2c68f9d460a7f5e027e807b8 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.56-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1305 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1306 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1307 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1308 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1309 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_packagedata_setscene)
NOTE: recipe gtk+3-3.24.52-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_deploy_source_date_epoch unihash changed to 47be967cdaee18766efc07246e37f1fa17377d76e9d96c39d341db61273b95fc
NOTE: recipe libxml2-2.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1312 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_26.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 1952 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_patch)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1314 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1315 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1316 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1317 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_packagedata_setscene)
NOTE: Running setscene task 1319 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1320 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_26.0.3-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1322 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1325 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1327 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1330 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_26.0.3-r0: task do_patch: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1332 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1334 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1335 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1336 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1337 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 1338 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1339 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1340 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1341 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1342 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1343 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1344 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1347 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1349 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1350 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1351 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1352 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1353 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1357 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1358 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_packagedata_setscene)
NOTE: recipe expat-2.7.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1359 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1362 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1364 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1366 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1367 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1369 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1370 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1371 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1372 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1373 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1374 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1377 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1379 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1381 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1382 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1386 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1392 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1393 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1396 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1398 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1399 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.51.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1400 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1405 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1406 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1407 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1409 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1411 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1413 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1414 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2397 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1420 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1423 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1424 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1425 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1427 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1428 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1430 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1432 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1433 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1434 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1437 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 1438 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1439 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1443 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1445 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1446 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1452 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1454 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1456 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1458 of 1458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3113 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.61.3-r0: task do_unpack: Succeeded
NOTE: Running task 3167 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_patch)
NOTE: Running task 3200 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3326 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx)
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3380 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_create_spdx)
NOTE: recipe librsvg-2.61.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.61.3-r0: task do_patch: Started
NOTE: recipe mesa-2_26.0.3-r0: task do_create_spdx: Started
NOTE: recipe vala-0.56.18-r0: task do_create_spdx: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_patch: Succeeded
NOTE: Running task 3389 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running task 3391 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_rust_gen_targets)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.61.3-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 3392 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash cf9776b47d8513ab0122549ec4e8a4560e655f0c2c68f9d460a7f5e027e807b8 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '1bf8f449d5244d4a708b492c9edf3716f60713ec7c6aa822f30ab57d3a29a1ec', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'cf9776b47d8513ab0122549ec4e8a4560e655f0c2c68f9d460a7f5e027e807b8'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 1bf8f449d5244d4a708b492c9edf3716f60713ec7c6aa822f30ab57d3a29a1ec -> cf9776b47d8513ab0122549ec4e8a4560e655f0c2c68f9d460a7f5e027e807b8 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running task 3406 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_package_write_ipk)
NOTE: recipe vala-0.56.18-r0: task do_create_spdx: Succeeded
NOTE: Running task 3407 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_package_write_deb)
NOTE: Running task 3408 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_package_write_rpm)
NOTE: Running task 3409 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_package_qa)
NOTE: recipe mesa-2_26.0.3-r0: task do_create_spdx: Succeeded
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_package_write_ipk: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_package_write_deb: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_package_qa: Started
NOTE: recipe librsvg-2.61.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3410 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_rust_create_wrappers)
NOTE: recipe librsvg-2.61.3-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.61.3-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3411 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_configure)
NOTE: recipe librsvg-2.61.3-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Succeeded
NOTE: Running task 3412 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_compile)
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_package_write_ipk: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_configure: Succeeded
NOTE: Running task 3413 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_package_qa: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_package_qa unihash changed to 62c73290608456f78ea2670b48f51bf642d97561587dd55da16c4966ac0aaa7c
NOTE: recipe librsvg-2.61.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3414 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_compile)
NOTE: recipe librsvg-2.61.3-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_package_write_deb: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Succeeded
NOTE: Running task 3415 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_install)
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Succeeded
NOTE: Running task 3416 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot)
NOTE: Running task 3417 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_package)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3418 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.52-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3419 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Succeeded
NOTE: recipe gtk+3-3.24.52-r0: task do_configure: Started
NOTE: Running task 3420 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata unihash changed to c6ae3bbc197d663abb62b5d48c60824b1dec25170d6f56100d004cf5c4562309
NOTE: Setscene tasks completed
NOTE: Running task 3421 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Succeeded
NOTE: recipe gtk+3-3.24.52-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3422 of 3458 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_compile)
NOTE: recipe gtk+3-3.24.52-r0: task do_compile: Started
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
NOTE: Tasks Summary: Attempted 3427 tasks of which 3369 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260415113505.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260415113505.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_49.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/adwaita-icon-theme/49.0/temp/log.do_configure.1654069
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

ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/adwaita-icon-theme/49.0/temp/log.do_configure.1654069
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_49.0.bb:do_configure) failed with exit code '1'

--===============0853461305394871633==
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
packages/x86-64-v3-poky-linux/gtk+3/gtk+3: FILELIST: removed "/usr/lib/libgtk-3.so.0.2419.32 /usr/lib/libgdk-3.so.0.2419.32", added "/usr/lib/libgdk-3.so.0.2420.32 /usr/lib/libgtk-3.so.0.2420.32"
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

--===============0853461305394871633==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gtk-3-upgrade-3.24.51-3.24.52.patch"

RnJvbSBhYWNiMGJlZTAxYjc2YzhhMmQyYzZiYjk1NWMxYjFjNmUxMzg5ODZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMTE6MzY6NTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
dGsrMzogdXBncmFkZSAzLjI0LjUxIC0+IDMuMjQuNTIKCi0tLQogbWV0YS9yZWNpcGVzLWdub21l
L2d0aysvZ3RrKzMvb3BlbmdsLnBhdGNoICAgIHwgNDggKysrKysrKysrLS0tLS0tLS0tLQogLi4u
L3tndGsrM18zLjI0LjUxLmJiID0+IGd0ayszXzMuMjQuNTIuYmJ9ICAgIHwgIDIgKy0KIDIgZmls
ZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWdub21lL2d0aysve2d0ayszXzMuMjQuNTEuYmIgPT4gZ3RrKzNfMy4yNC41Mi5i
Yn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGsrMy9vcGVu
Z2wucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGsrMy9vcGVuZ2wucGF0Y2gKaW5k
ZXggNTFkNGM4ZTQzYS4uY2EyYjliNjU5MCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21l
L2d0aysvZ3RrKzMvb3BlbmdsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0
ayszL29wZW5nbC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNjY2
YzMyYmJkN2EwMWEyODdhYmFlYTdmMzA0ZGNiOTdjMDA3YTIwZCBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IEp1c3NpIEt1a2tvbmVuIDxqdXNzaS5rdWtrb25lbkBpbnRlbC5jb20+CiBE
YXRlOiBGcmksIDE2IE9jdCAyMDE1IDE2OjM1OjE2ICswMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIERv
IG5vdCB0cnkgdG8gaW5pdGlhbGl6ZSBHTCB3aXRob3V0IGxpYkdMCkBAIC00MCw3ICs0MCw3IEBA
IFNpZ25lZC1vZmYtYnk6IEp1c3NpIEt1a2tvbmVuIDxqdXNzaS5rdWtrb25lbkBpbnRlbC5jb20+
CiAgMjEgZmlsZXMgY2hhbmdlZCwgMTMxIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQog
CiBkaWZmIC0tZ2l0IGEvZGVtb3MvZ3RrLWRlbW8vbWVzb24uYnVpbGQgYi9kZW1vcy9ndGstZGVt
by9tZXNvbi5idWlsZAotaW5kZXggMjUyZGExNmQwNS4uNGI1N2NmZjZhYyAxMDA2NDQKK2luZGV4
IDI1MmRhMTYuLjRiNTdjZmYgMTAwNjQ0CiAtLS0gYS9kZW1vcy9ndGstZGVtby9tZXNvbi5idWls
ZAogKysrIGIvZGVtb3MvZ3RrLWRlbW8vbWVzb24uYnVpbGQKIEBAIC0yOCw3ICsyOCw2IEBAIGRl
bW9zID0gZmlsZXMoWwpAQCAtNjMsNyArNjMsNyBAQCBpbmRleCAyNTJkYTE2ZDA1Li40YjU3Y2Zm
NmFjIDEwMDY0NAogICAgZGVtb3MgKz0gZmlsZXMoJ3BhZ2VzZXR1cC5jJykKICBlbmRpZgogZGlm
ZiAtLWdpdCBhL2RvY3MvdG9vbHMvbWVzb24uYnVpbGQgYi9kb2NzL3Rvb2xzL21lc29uLmJ1aWxk
Ci1pbmRleCAwNTYyMWVlN2VkLi4zZDBhMzMzYjMyIDEwMDY0NAoraW5kZXggMDU2MjFlZS4uM2Qw
YTMzMyAxMDA2NDQKIC0tLSBhL2RvY3MvdG9vbHMvbWVzb24uYnVpbGQKICsrKyBiL2RvY3MvdG9v
bHMvbWVzb24uYnVpbGQKIEBAIC0yLDEwICsyLDEzIEBAIGlmIHgxMV9lbmFibGVkCkBAIC04Myw3
ICs4Myw3IEBAIGluZGV4IDA1NjIxZWU3ZWQuLjNkMGEzMzNiMzIgMTAwNjQ0CiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgaW5jbHVkZV9kaXJlY3RvcmllczogWyBjb25maW5jLCBnZGtpbmMs
IGd0a2luYywgdGVzdGluYywgXSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkZXBlbmRl
bmNpZXM6IGxpYmd0a19kZXApCiBkaWZmIC0tZ2l0IGEvZG9jcy90b29scy93aWRnZXRzLmMgYi9k
b2NzL3Rvb2xzL3dpZGdldHMuYwotaW5kZXggOTMyZGFmMTc0Ni4uMzQ4ODA3ZTEzMyAxMDA2NDQK
K2luZGV4IDkzMmRhZjEuLjM0ODgwN2UgMTAwNjQ0CiAtLS0gYS9kb2NzL3Rvb2xzL3dpZGdldHMu
YwogKysrIGIvZG9jcy90b29scy93aWRnZXRzLmMKIEBAIC04LDcgKzgsOSBAQApAQCAtMTEwLDcg
KzExMCw3IEBAIGluZGV4IDkzMmRhZjE3NDYuLjM0ODgwN2UxMzMgMTAwNjQ0CiAgCiAgICByZXR1
cm4gaW5mbzsKIGRpZmYgLS1naXQgYS9nZGsvZ2RrY29uZmlnLmgubWVzb24gYi9nZGsvZ2RrY29u
ZmlnLmgubWVzb24KLWluZGV4IDdkYjE5ZTA0NzAuLjA4ODY1MWJhZmEgMTAwNjQ0CitpbmRleCA3
ZGIxOWUwLi4wODg2NTFiIDEwMDY0NAogLS0tIGEvZ2RrL2dka2NvbmZpZy5oLm1lc29uCiArKysg
Yi9nZGsvZ2RrY29uZmlnLmgubWVzb24KIEBAIC0xNSw2ICsxNSw3IEBAIEdfQkVHSU5fREVDTFMK
QEAgLTEyMiw3ICsxMjIsNyBAQCBpbmRleCA3ZGIxOWUwNDcwLi4wODg2NTFiYWZhIDEwMDY0NAog
IEdfRU5EX0RFQ0xTCiAgCiBkaWZmIC0tZ2l0IGEvZ2RrL2dka2Rpc3BsYXkuYyBiL2dkay9nZGtk
aXNwbGF5LmMKLWluZGV4IDVjNDFhNDhmZDAuLjkyMGJiMThjZTggMTAwNjQ0CitpbmRleCA1YzQx
YTQ4Li45MjBiYjE4IDEwMDY0NAogLS0tIGEvZ2RrL2dka2Rpc3BsYXkuYwogKysrIGIvZ2RrL2dk
a2Rpc3BsYXkuYwogQEAgLTI0MTIsNyArMjQxMiwxMSBAQCBnYm9vbGVhbgpAQCAtMTUwLDcgKzE1
MCw3IEBAIGluZGV4IDVjNDFhNDhmZDAuLjkyMGJiMThjZTggMTAwNjQ0CiAgCiAgR2RrUmVuZGVy
aW5nTW9kZQogZGlmZiAtLWdpdCBhL2dkay9nZGtnbC5jIGIvZ2RrL2dka2dsLmMKLWluZGV4IDA5
NDBjMDZjNzEuLjRiNTY2MTRmOWYgMTAwNjQ0CitpbmRleCAwOTQwYzA2Li40YjU2NjE0IDEwMDY0
NAogLS0tIGEvZ2RrL2dka2dsLmMKICsrKyBiL2dkay9nZGtnbC5jCiBAQCAtMjEsOCArMjEsOSBA
QApAQCAtMjI3LDcgKzIyNyw3IEBAIGluZGV4IDA5NDBjMDZjNzEuLjRiNTY2MTRmOWYgMTAwNjQ0
CiArI2VuZGlmCiAgfQogZGlmZiAtLWdpdCBhL2dkay9nZGtnbGNvbnRleHQuYyBiL2dkay9nZGtn
bGNvbnRleHQuYwotaW5kZXggNTJjN2JjZTY5Mi4uZmE1NDQ3OTRhYyAxMDA2NDQKK2luZGV4IDUy
YzdiY2UuLmZhNTQ0NzkgMTAwNjQ0CiAtLS0gYS9nZGsvZ2RrZ2xjb250ZXh0LmMKICsrKyBiL2dk
ay9nZGtnbGNvbnRleHQuYwogQEAgLTg1LDcgKzg1LDkgQEAKQEAgLTI3Myw3ICsyNzMsNyBAQCBp
bmRleCA1MmM3YmNlNjkyLi5mYTU0NDc5NGFjIDEwMDY0NAogIAogIC8qKgogZGlmZiAtLWdpdCBh
L2dkay9nZGt3aW5kb3cuYyBiL2dkay9nZGt3aW5kb3cuYwotaW5kZXggNjJlMGNmODE2Zi4uYjhi
ZGE3MTQwZCAxMDA2NDQKK2luZGV4IDJmNTUwMWYuLjM3MTIyZjkgMTAwNjQ0CiAtLS0gYS9nZGsv
Z2Rrd2luZG93LmMKICsrKyBiL2dkay9nZGt3aW5kb3cuYwogQEAgLTQ1LDcgKzQ1LDkgQEAKQEAg
LTMzMyw3ICszMzMsNyBAQCBpbmRleCA2MmUwY2Y4MTZmLi5iOGJkYTcxNDBkIDEwMDY0NAogICAg
ICAgICAgICBjYWlyb19yZWdpb25fZGVzdHJveSAob3BhcXVlX3JlZ2lvbik7CiAgCiBkaWZmIC0t
Z2l0IGEvZ2RrL21lc29uLmJ1aWxkIGIvZ2RrL21lc29uLmJ1aWxkCi1pbmRleCAyOTdjMzhjNjhl
Li5mYzcxZjhmNDlkIDEwMDY0NAoraW5kZXggMjk3YzM4Yy4uZmM3MWY4ZiAxMDA2NDQKIC0tLSBh
L2dkay9tZXNvbi5idWlsZAogKysrIGIvZ2RrL21lc29uLmJ1aWxkCiBAQCAtNTYsNyArNTYsNiBA
QCBnZGtfZ2lyX3B1YmxpY19oZWFkZXJzID0gZmlsZXMoCkBAIC0zNjYsNyArMzY2LDcgQEAgaW5k
ZXggMjk3YzM4YzY4ZS4uZmM3MWY4ZjQ5ZCAxMDA2NDQKICBnZGtjb25maWcgPSBjb25maWd1cmVf
ZmlsZSgKICAgIGlucHV0ICA6ICdnZGtjb25maWcuaC5tZXNvbicsCiBkaWZmIC0tZ2l0IGEvZ2Rr
L3gxMS9nZGtkaXNwbGF5LXgxMS5jIGIvZ2RrL3gxMS9nZGtkaXNwbGF5LXgxMS5jCi1pbmRleCBj
NmQxZjUzZDcwLi45NzkzY2I0MzI5IDEwMDY0NAoraW5kZXggYzZkMWY1My4uOTc5M2NiNCAxMDA2
NDQKIC0tLSBhL2dkay94MTEvZ2RrZGlzcGxheS14MTEuYwogKysrIGIvZ2RrL3gxMS9nZGtkaXNw
bGF5LXgxMS5jCiBAQCAtMzcsNyArMzcsOSBAQApAQCAtMzkxLDcgKzM5MSw3IEBAIGluZGV4IGM2
ZDFmNTNkNzAuLjk3OTNjYjQzMjkgMTAwNjQ0CiAgICBkaXNwbGF5X2NsYXNzLT5nZXRfZGVmYXVs
dF9zZWF0ID0gZ2RrX3gxMV9kaXNwbGF5X2dldF9kZWZhdWx0X3NlYXQ7CiAgCiBkaWZmIC0tZ2l0
IGEvZ2RrL3gxMS9nZGt2aXN1YWwteDExLmMgYi9nZGsveDExL2dka3Zpc3VhbC14MTEuYwotaW5k
ZXggODE0NzlkODFmNC4uM2M4YzVjMDJmZiAxMDA2NDQKK2luZGV4IDgxNDc5ZDguLjNjOGM1YzAg
MTAwNjQ0CiAtLS0gYS9nZGsveDExL2dka3Zpc3VhbC14MTEuYwogKysrIGIvZ2RrL3gxMS9nZGt2
aXN1YWwteDExLmMKIEBAIC0zMDYsNyArMzA2LDEyIEBAIF9nZGtfeDExX3NjcmVlbl9pbml0X3Zp
c3VhbHMgKEdka1NjcmVlbiAqc2NyZWVuKQpAQCAtNDA4LDcgKzQwOCw3IEBAIGluZGV4IDgxNDc5
ZDgxZjQuLjNjOGM1YzAyZmYgMTAwNjQ0CiAgCiAgZ2ludAogZGlmZiAtLWdpdCBhL2dkay94MTEv
Z2Rrd2luZG93LXgxMS5jIGIvZ2RrL3gxMS9nZGt3aW5kb3cteDExLmMKLWluZGV4IDBjNTlhZDQ2
NGUuLmFkMzI0NGYxNTIgMTAwNjQ0CitpbmRleCBjNjBjZWNkLi4yOGYwMDhiIDEwMDY0NAogLS0t
IGEvZ2RrL3gxMS9nZGt3aW5kb3cteDExLmMKICsrKyBiL2dkay94MTEvZ2Rrd2luZG93LXgxMS5j
CiBAQCAtMzYsNyArMzYsOSBAQApAQCAtNDMyLDcgKzQzMiw3IEBAIGluZGV4IDBjNTlhZDQ2NGUu
LmFkMzI0NGYxNTIgMTAwNjQ0CiAgICBpbXBsX2NsYXNzLT5nZXRfdW5zY2FsZWRfc2l6ZSA9IGdk
a194MTFfd2luZG93X2dldF91bnNjYWxlZF9zaXplOwogIH0KIGRpZmYgLS1naXQgYS9nZGsveDEx
L2dka3gtYXV0b2NsZWFudXBzLmggYi9nZGsveDExL2dka3gtYXV0b2NsZWFudXBzLmgKLWluZGV4
IGVkYjBlYTdkYmYuLmEzMTdkNjFjY2EgMTAwNjQ0CitpbmRleCBlZGIwZWE3Li5hMzE3ZDYxIDEw
MDY0NAogLS0tIGEvZ2RrL3gxMS9nZGt4LWF1dG9jbGVhbnVwcy5oCiArKysgYi9nZGsveDExL2dk
a3gtYXV0b2NsZWFudXBzLmgKIEBAIC0zMCw3ICszMCw5IEBAIEdfREVGSU5FX0FVVE9QVFJfQ0xF
QU5VUF9GVU5DKEdka1gxMURldmljZVhJMiwgZ19vYmplY3RfdW5yZWYpCkBAIC00NDYsNyArNDQ2
LDcgQEAgaW5kZXggZWRiMGVhN2RiZi4uYTMxN2Q2MWNjYSAxMDA2NDQKICBHX0RFRklORV9BVVRP
UFRSX0NMRUFOVVBfRlVOQyhHZGtYMTFTY3JlZW4sIGdfb2JqZWN0X3VucmVmKQogIEdfREVGSU5F
X0FVVE9QVFJfQ0xFQU5VUF9GVU5DKEdka1gxMVZpc3VhbCwgZ19vYmplY3RfdW5yZWYpCiBkaWZm
IC0tZ2l0IGEvZ2RrL3gxMS9nZGt4LmggYi9nZGsveDExL2dka3guaAotaW5kZXggMWY2NGJjY2I2
ZC4uNGRiNmMxODM1MSAxMDA2NDQKK2luZGV4IDFmNjRiY2MuLjRkYjZjMTggMTAwNjQ0CiAtLS0g
YS9nZGsveDExL2dka3guaAogKysrIGIvZ2RrL3gxMS9nZGt4LmgKIEBAIC00Myw3ICs0Myw5IEBA
CkBAIC00NjAsNyArNDYwLDcgQEAgaW5kZXggMWY2NGJjY2I2ZC4uNGRiNmMxODM1MSAxMDA2NDQK
ICAjaW5jbHVkZSA8Z2RrL3gxMS9nZGt4MTFtb25pdG9yLmg+CiAgI2luY2x1ZGUgPGdkay94MTEv
Z2RreDExcHJvcGVydHkuaD4KIGRpZmYgLS1naXQgYS9nZGsveDExL21lc29uLmJ1aWxkIGIvZ2Rr
L3gxMS9tZXNvbi5idWlsZAotaW5kZXggNzU0YWUwYTYxNS4uMDMxOGM4Mzg3NyAxMDA2NDQKK2lu
ZGV4IDc1NGFlMGEuLjAzMThjODMgMTAwNjQ0CiAtLS0gYS9nZGsveDExL21lc29uLmJ1aWxkCiAr
KysgYi9nZGsveDExL21lc29uLmJ1aWxkCiBAQCAtMTQsNyArMTQsNiBAQCBnZGtfeDExX3NvdXJj
ZXMgPSBmaWxlcygKQEAgLTQ5Miw3ICs0OTIsNyBAQCBpbmRleCA3NTRhZTBhNjE1Li4wMzE4Yzgz
ODc3IDEwMDY0NAogIGluc3RhbGxfaGVhZGVycygnZ2RreC5oJywgc3ViZGlyOiAnZ3RrLTMuMC9n
ZGsvJykKICAKIGRpZmYgLS1naXQgYS9ndGsvZ3RrZ2xhcmVhLmMgYi9ndGsvZ3RrZ2xhcmVhLmMK
LWluZGV4IDgwMjMwM2VhOWYuLjY0MzlkNzc0NWQgMTAwNjQ0CitpbmRleCA4MDIzMDNlLi42NDM5
ZDc3IDEwMDY0NAogLS0tIGEvZ3RrL2d0a2dsYXJlYS5jCiArKysgYi9ndGsvZ3RrZ2xhcmVhLmMK
IEBAIC0yOSw3ICsyOSw5IEBACkBAIC01ODAsNyArNTgwLDcgQEAgaW5kZXggODAyMzAzZWE5Zi4u
NjQzOWQ3NzQ1ZCAxMDA2NDQKICAKICBzdGF0aWMgZ2Jvb2xlYW4KIGRpZmYgLS1naXQgYS9ndGsv
aW5zcGVjdG9yL2dlbmVyYWwuYyBiL2d0ay9pbnNwZWN0b3IvZ2VuZXJhbC5jCi1pbmRleCBhM2Ez
NDE5NTZiLi4yNzQ2MDBlNzRhIDEwMDY0NAoraW5kZXggYTNhMzQxOS4uMjc0NjAwZSAxMDA2NDQK
IC0tLSBhL2d0ay9pbnNwZWN0b3IvZ2VuZXJhbC5jCiArKysgYi9ndGsvaW5zcGVjdG9yL2dlbmVy
YWwuYwogQEAgLTM1LDggKzM1LDEwIEBACkBAIC02MjcsNyArNjI3LDcgQEAgaW5kZXggYTNhMzQx
OTU2Yi4uMjc0NjAwZTc0YSAxMDA2NDQKICAgIGlmIChHREtfSVNfV0FZTEFORF9ESVNQTEFZIChn
ZGtfZGlzcGxheV9nZXRfZGVmYXVsdCAoKSkpCiAgICAgIHsKIGRpZmYgLS1naXQgYS9tZXNvbi5i
dWlsZCBiL21lc29uLmJ1aWxkCi1pbmRleCAwNGQ1NGE4ZTJjLi4zMjQ5MTVjOWVlIDEwMDY0NAor
aW5kZXggZjdkM2Y4ZS4uY2U2YjMxZiAxMDA2NDQKIC0tLSBhL21lc29uLmJ1aWxkCiArKysgYi9t
ZXNvbi5idWlsZAogQEAgLTEzNyw2ICsxMzcsNyBAQCB3YXlsYW5kX2VuYWJsZWQgICAgICAgID0g
Z2V0X29wdGlvbignd2F5bGFuZF9iYWNrZW5kJykKQEAgLTY1OCw3ICs2NTgsNyBAQCBpbmRleCAw
NGQ1NGE4ZTJjLi4zMjQ5MTVjOWVlIDEwMDY0NAogIGlmIGlzb19jb2Rlc19kZXAuZm91bmQoKQog
ICAgY2RhdGEuc2V0X3F1b3RlZCgnSVNPX0NPREVTX1BSRUZJWCcsIGlzb19jb2Rlc19kZXAuZ2V0
X3ZhcmlhYmxlKHBrZ2NvbmZpZzogJ3ByZWZpeCcpKQogIGVsc2UKLUBAIC05MTQsOSArOTE5LDE1
IEBAIGVsc2UKK0BAIC05MTcsOSArOTIyLDE1IEBAIGVsc2UKICAgIGdpb19wYWNrYWdlcyA9IFsn
Z2lvLTIuMCcsIGdsaWJfcmVxXQogIGVuZGlmCiAgCkBAIC02NzUsNyArNjc1LDcgQEAgaW5kZXgg
MDRkNTRhOGUyYy4uMzI0OTE1YzllZSAxMDA2NDQKICAgICAgICAgICAgICAgICAgICAgICBbJ2Zy
aWJpZGknLCBmcmliaWRpX3JlcV0pKQogIAogIGd0a19wYWNrYWdlcyA9ICcgJy5qb2luKFsKLUBA
IC05MzAsNyArOTQxLDcgQEAgcGtnY29uZi5zZXQoJ0dUS19QQUNLQUdFUycsIGd0a19wYWNrYWdl
cykKK0BAIC05MzMsNyArOTQ0LDcgQEAgcGtnY29uZi5zZXQoJ0dUS19QQUNLQUdFUycsIGd0a19w
YWNrYWdlcykKICAjIFJlcXVpcmVzLnByaXZhdGUKICBwY19nZGtfZXh0cmFfbGlicyArPSBjYWly
b19saWJzCiAgCkBAIC02ODUsNyArNjg1LDcgQEAgaW5kZXggMDRkNTRhOGUyYy4uMzI0OTE1Yzll
ZSAxMDA2NDQKICAgIGd0a19wcml2YXRlX3BhY2thZ2VzICs9IFsncGFuZ29mdDInXQogIGVuZGlm
CiBkaWZmIC0tZ2l0IGEvbWVzb25fb3B0aW9ucy50eHQgYi9tZXNvbl9vcHRpb25zLnR4dAotaW5k
ZXggOTQwOTlhYTAxZS4uOGJkMDk2ODk2ZCAxMDA2NDQKK2luZGV4IDk0MDk5YWEuLjhiZDA5Njgg
MTAwNjQ0CiAtLS0gYS9tZXNvbl9vcHRpb25zLnR4dAogKysrIGIvbWVzb25fb3B0aW9ucy50eHQK
IEBAIC0xOSw2ICsxOSw4IEBAIG9wdGlvbigncHJvZmlsZXInLCB0eXBlOiAnYm9vbGVhbicsIHZh
bHVlOiBmYWxzZSwKQEAgLTY5OCw3ICs2OTgsNyBAQCBpbmRleCA5NDA5OWFhMDFlLi44YmQwOTY4
OTZkIDEwMDY0NAogICMgUHJpbnQgYmFja2VuZHMKICBvcHRpb24oJ3ByaW50X2JhY2tlbmRzJywg
dHlwZSA6ICdzdHJpbmcnLCB2YWx1ZSA6ICdhdXRvJywKIGRpZmYgLS1naXQgYS90ZXN0cy9tZXNv
bi5idWlsZCBiL3Rlc3RzL21lc29uLmJ1aWxkCi1pbmRleCA2ZmYyNDlmOGExLi5mMmE5ZmJhZDZk
IDEwMDY0NAoraW5kZXggNmZmMjQ5Zi4uZjJhOWZiYSAxMDA2NDQKIC0tLSBhL3Rlc3RzL21lc29u
LmJ1aWxkCiArKysgYi90ZXN0cy9tZXNvbi5idWlsZAogQEAgLTUsNyArNSw2IEBAIGd0a190ZXN0
cyA9IFsKQEAgLTczMiw3ICs3MzIsNyBAQCBpbmRleCA2ZmYyNDlmOGExLi5mMmE5ZmJhZDZkIDEw
MDY0NAogICAgZ3RrX3Rlc3RzICs9IFtbJ3Rlc3Rmb250Y2hvb3NlcmRpYWxvZyddXQogIGVuZGlm
CiBkaWZmIC0tZ2l0IGEvdGVzdHN1aXRlL2d0ay9vYmplY3RzLWZpbmFsaXplLmMgYi90ZXN0c3Vp
dGUvZ3RrL29iamVjdHMtZmluYWxpemUuYwotaW5kZXggOTViNTY1YzU5MS4uN2YzNDBjMzc3NSAx
MDA2NDQKK2luZGV4IDk1YjU2NWMuLjdmMzQwYzMgMTAwNjQ0CiAtLS0gYS90ZXN0c3VpdGUvZ3Rr
L29iamVjdHMtZmluYWxpemUuYwogKysrIGIvdGVzdHN1aXRlL2d0ay9vYmplY3RzLWZpbmFsaXpl
LmMKIEBAIC0xMDksNyArMTA5LDkgQEAgbWFpbiAoaW50IGFyZ2MsIGNoYXIgKiphcmd2KQpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2d0aysvZ3RrKzNfMy4yNC41MS5iYiBiL21ldGEv
cmVjaXBlcy1nbm9tZS9ndGsrL2d0ayszXzMuMjQuNTIuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUK
cmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdub21lL2d0aysvZ3RrKzNfMy4yNC41MS5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWdub21lL2d0aysvZ3RrKzNfMy4yNC41Mi5iYgppbmRleCA1MWEy
OTNjMWQ4Li4xZmNjMDg0NDNkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9n
dGsrM18zLjI0LjUxLmJiCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0ayszXzMuMjQu
NTIuYmIKQEAgLTIyLDcgKzIyLDcgQEAgaW5oZXJpdCBnZXR0ZXh0IGdub21lYmFzZSBndGstZG9j
IHVwZGF0ZS1hbHRlcm5hdGl2ZXMgZ3RrLWltbW9kdWxlcy1jYWNoZSBnc2V0dGkKIFNSQ19VUkkg
Kz0gIlwKICAgICAgICAgICAgZmlsZTovL29wZW5nbC5wYXRjaCBcCiAgICAgICAgICAgICIKLVNS
Q19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjAwMTM4NzdjNmJkMjNjMmRiZTQyYWQ3YzcwYTA1
M2QwZTQ0OWJlNjY3MzY1NzRlMzc4NjdjNDljNWY5MDVhNGYiCitTUkNfVVJJW2FyY2hpdmUuc2hh
MjU2c3VtXSA9ICI4MDkzMWZhNDcyYTc3YjlhMTY0ZjY3NDBlM2MwYjQ0NGZhYzY3NzAwNTQ2MzJk
MzVhN2ZmOWQ2NzllNWU3YjlmIgogCiBCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsi
CiAKLS0gCjIuNDcuMQoK

--===============0853461305394871633==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

Changes to packages/all-poky-linux/adwaita-icon-theme (sysroot):
  /usr/share/icons/Adwaita/scalable/status/folder-open.svg changed type from symlink to file
  /usr/share/icons/Adwaita/scalable/status/folder-open.svg changed permissions from rwxrwxrwx to rw-r--r--
  /usr/share/icons/Adwaita/symbolic/legacy/emblem-important-symbolic.svg was removed
  /usr/share/icons/Adwaita/symbolic/legacy/emblem-system-symbolic.svg was removed
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-dbg: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-dbg: PKGSIZE changed from 35590928 to 35595568 (+0%)
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-dbg: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-dbg: FILELIST: removed "/usr/lib/.debug/libgdk-3.so.0.2419.32 /usr/lib/.debug/libgtk-3.so.0.2419.32", added "/usr/lib/.debug/libgdk-3.so.0.2420.32 /usr/lib/.debug/libgtk-3.so.0.2420.32"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-demo: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-demo: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-dev: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-dev: PKGSIZE changed from 14155128 to 14155213 (+0%)
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-dev: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-doc: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-doc: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ab: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ab: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-af: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-af: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-am: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-am: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-an: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-an: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ang: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ang: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ar: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ar: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-as: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-as: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ast: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ast: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-az-ir: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-az-ir: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-az: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-az: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-be+latin: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-be+latin: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-be: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-be: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-bg: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-bg: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-bn-in: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-bn-in: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-bn: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-bn: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-br: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-br: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-bs: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-bs: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ca+valencia: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ca+valencia: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ca: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ca: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ckb: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ckb: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-crh: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-crh: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-cs: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-cs: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-cy: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-cy: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-da: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-da: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-de: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-de: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-dz: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-dz: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-el: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-el: PKGSIZE changed from 399420 to 400496 (+0%)
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-el: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-en+shaw: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-en+shaw: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-en-ca: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-en-ca: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-en-gb: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-en-gb: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-en: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-en: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-eo: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-eo: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-es: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-es: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-et: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-et: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-eu: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-eu: PKGSIZE changed from 319194 to 319198 (+0%)
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-eu: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-fa: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-fa: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-fi: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-fi: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-fr: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-fr: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-fur: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-fur: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ga: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ga: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-gd: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-gd: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-gl: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-gl: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-gu: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-gu: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-he: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-he: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-hi: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-hi: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-hr: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-hr: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-hu: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-hu: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-hy: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-hy: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ia: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ia: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-id: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-id: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ie: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ie: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-io: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-io: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-is: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-is: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-it: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-it: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ja: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ja: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ka: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ka: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-kab: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-kab: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-kg: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-kg: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-kk: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-kk: PKGSIZE changed from 149609 to 396077 (+165%)
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-kk: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-km: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-km: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-kn: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-kn: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ko: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ko: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ku: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ku: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ky: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ky: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-lg: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-lg: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-li: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-li: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-lt: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-lt: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-lv: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-lv: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-mai: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-mai: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-mi: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-mi: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-mk: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-mk: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ml: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ml: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-mn: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-mn: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-mr: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-mr: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ms: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ms: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-my: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-my: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-nb: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-nb: PKGSIZE changed from 231591 to 233318 (+1%)
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-nb: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-nds: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-nds: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ne: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ne: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-nl: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-nl: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-nn: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-nn: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-nso: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-nso: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-oc: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-oc: PKGSIZE changed from 316909 to 318114 (+0%)
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-oc: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-or: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-or: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-pa: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-pa: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-pl: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-pl: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ps: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ps: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-pt-br: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-pt-br: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-pt: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-pt: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ro: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ro: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ru: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ru: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-rw: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-rw: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-si: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-si: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-sk: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-sk: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-sl: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-sl: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-sq: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-sq: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-sr+ije: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-sr+ije: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-sr+latin: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-sr+latin: PKGSIZE changed from 290887 to 311883 (+7%)
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-sr+latin: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-sr: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-sr: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-sv: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-sv: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ta: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ta: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-te: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-te: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-tg: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-tg: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-th: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-th: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-tk: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-tk: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-tr: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-tr: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-tt: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-tt: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ug: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ug: PKGSIZE changed from 304176 to 399876 (+31%)
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ug: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-uk: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-uk: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ur: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-ur: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-uz+cyrillic: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-uz+cyrillic: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-uz: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-uz: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-vi: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-vi: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-wa: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-wa: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-xh: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-xh: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-yi: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-yi: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-zh-cn: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-zh-cn: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-zh-hk: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-zh-hk: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-zh-tw: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-locale-zh-tw: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-src: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-src: PKGSIZE changed from 46589835 to 46598161 (+0%)
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-src: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-src: FILELIST: directory renamed /usr/src/debug/gtk+3/3.24.51/gdk/wayland -> /usr/src/debug/gtk+3/3.24.52/gdk/wayland, directory renamed /usr/src/debug/gtk+3/3.24.51/gdk/x11 -> /usr/src/debug/gtk+3/3.24.52/gdk/x11, directory renamed /usr/src/debug/gtk+3/3.24.51/gtk/a11y -> /usr/src/debug/gtk+3/3.24.52/gtk/a11y, directory renamed /usr/src/debug/gtk+3/3.24.51/modules/printbackends/file -> /usr/src/debug/gtk+3/3.24.52/modules/printbackends/file, directory renamed /usr/src/debug/gtk+3/3.24.51/demos/widget-factory -> /usr/src/debug/gtk+3/3.24.52/demos/widget-factory, directory renamed /usr/src/debug/gtk+3/3.24.51/demos/icon-browser -> /usr/src/debug/gtk+3/3.24.52/demos/icon-browser, directory renamed /usr/src/debug/gtk+3/3.24.51/gdk -> /usr/src/debug/gtk+3/3.24.52/gdk, directory renamed /usr/src/debug/gtk+3/3.24.51/gtk/inspector -> /usr/src/debug/gtk+3/3.24.52/gtk/inspector, directory renamed /usr/src/debug/gtk+3/3.24.51/libgail-util -> /usr/src/d
 ebug/gtk+3/3.24.52/libgail-util, directory renamed /usr/src/debug/gtk+3/3.24.51/modules/input -> /usr/src/debug/gtk+3/3.24.52/modules/input, directory renamed /usr/src/debug/gtk+3/3.24.51 -> /usr/src/debug/gtk+3/3.24.52, directory renamed /usr/src/debug/gtk+3/3.24.51/demos/gtk-demo -> /usr/src/debug/gtk+3/3.24.52/demos/gtk-demo, directory renamed /usr/src/debug/gtk+3/3.24.51/gtk -> /usr/src/debug/gtk+3/3.24.52/gtk, directory renamed /usr/src/debug/gtk+3/3.24.51/gdk/deprecated -> /usr/src/debug/gtk+3/3.24.52/gdk/deprecated, directory renamed /usr/src/debug/gtk+3/3.24.51/modules/printbackends/lpr -> /usr/src/debug/gtk+3/3.24.52/modules/printbackends/lpr, directory renamed /usr/src/debug/gtk+3/3.24.51/gtk/deprecated -> /usr/src/debug/gtk+3/3.24.52/gtk/deprecated
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-staticdev: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3-staticdev: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk+3: PKGSIZE changed from 13500173 to 13554489 (+0%)
packages/x86-64-v3-poky-linux/gtk+3/gtk+3: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk+3: FILELIST: removed "/usr/lib/libgtk-3.so.0.2419.32 /usr/lib/libgdk-3.so.0.2419.32", added "/usr/lib/libgdk-3.so.0.2420.32 /usr/lib/libgtk-3.so.0.2420.32"
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-am-et: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-am-et: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-cedilla: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-cedilla: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-cyrillic-translit: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-cyrillic-translit: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-inuktitut: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-inuktitut: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-ipa: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-ipa: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-multipress: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-multipress: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-thai: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-thai: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-ti-er: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-ti-er: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-ti-et: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-ti-et: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-viqr: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-viqr: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-wayland: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-wayland: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-xim: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk3-immodule-xim: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk3-printbackend-file: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk3-printbackend-file: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3/gtk3-printbackend-lpr: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3/gtk3-printbackend-lpr: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
packages/x86-64-v3-poky-linux/gtk+3: PV changed from "3.24.51" to "3.24.52"
packages/x86-64-v3-poky-linux/gtk+3: SRC_URI changed from "https://download.gnome.org/sources//gtk/3.24/gtk-3.24.51.tar.xz;name=archive file://opengl.patch" to "https://download.gnome.org/sources//gtk/3.24/gtk-3.24.52.tar.xz;name=archive file://opengl.patch"
packages/x86-64-v3-poky-linux/gtk+3: PKGV changed from 3.24.51 [default] to 3.24.52 [default]
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

--===============0853461305394871633==--

