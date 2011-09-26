Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1R89wC-00047z-DT
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Sep 2011 14:05:33 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 26 Sep 2011 05:00:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="56497921"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by orsmga002.jf.intel.com with ESMTP; 26 Sep 2011 05:00:05 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Sep 2011 19:55:47 +0800
Message-Id: <933bacf8def65b14016b1543915357cc5ea3ebd1.1317037371.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1317037371.git.edwin.zhai@intel.com>
References: <cover.1317037371.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1317037371.git.edwin.zhai@intel.com>
References: <cover.1317037371.git.edwin.zhai@intel.com>
Subject: [PATCH 1/1] matchbox: Upgrade SRCREV to reflect recent accpeted patches by upstream
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
X-List-Received-Date: Mon, 26 Sep 2011 12:05:33 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../libmatchbox/files/16bppfixes.patch             |    2 +-
 .../libmatchbox/files/matchbox-start-fix.patch     |    2 +-
 .../libmatchbox/libmatchbox_git.bb                 |    6 +--
 .../matchbox-wm-2/matchbox-wm-2/fix_makefile.patch |    4 +-
 .../files/dso_linking_change_build_fix.patch       |    2 +-
 .../matchbox-desktop/files/window-resize-fix.patch |   50 --------------------
 .../matchbox-desktop/matchbox-desktop_git.bb       |    8 +--
 .../matchbox-panel-2/matchbox-panel-2_git.bb       |    7 +--
 .../recipes-sato/matchbox-panel-2/startup_fix.diff |   19 -------
 .../files/dso_linking_change_build_fix.patch       |   37 --------------
 .../matchbox-stroke/matchbox-stroke_git.bb         |    3 +-
 .../matchbox-theme-sato-2/png_rename.patch         |   16 ------
 .../matchbox-theme-sato-2_git.bb                   |    5 +-
 13 files changed, 17 insertions(+), 144 deletions(-)
 delete mode 100644 meta/recipes-sato/matchbox-desktop/files/window-resize-fix.patch
 delete mode 100644 meta/recipes-sato/matchbox-panel-2/startup_fix.diff
 delete mode 100644 meta/recipes-sato/matchbox-stroke/files/dso_linking_change_build_fix.patch
 delete mode 100644 meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato-2/png_rename.patch

diff --git a/meta/recipes-graphics/libmatchbox/files/16bppfixes.patch b/meta/recipes-graphics/libmatchbox/files/16bppfixes.patch
index 284318c..ac22b99 100644
--- a/meta/recipes-graphics/libmatchbox/files/16bppfixes.patch
+++ b/meta/recipes-graphics/libmatchbox/files/16bppfixes.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Pending
+Upstream-Status: Accepted
 
 Index: libmb/mbpixbuf.c
 ===================================================================
diff --git a/meta/recipes-graphics/libmatchbox/files/matchbox-start-fix.patch b/meta/recipes-graphics/libmatchbox/files/matchbox-start-fix.patch
index 058342c..88f5d70 100644
--- a/meta/recipes-graphics/libmatchbox/files/matchbox-start-fix.patch
+++ b/meta/recipes-graphics/libmatchbox/files/matchbox-start-fix.patch
@@ -6,7 +6,7 @@ on x86-64. This patch forces a NULL pointer as terminator to fix it.
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
 
-Upstream-Status: Pending
+Upstream-Status: Accepted
 
 Index: libmatchbox-1.9/libmb/mbexp.c
 ===================================================================
diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_git.bb b/meta/recipes-graphics/libmatchbox/libmatchbox_git.bb
index d9d4535..ac329e5 100644
--- a/meta/recipes-graphics/libmatchbox/libmatchbox_git.bb
+++ b/meta/recipes-graphics/libmatchbox/libmatchbox_git.bb
@@ -1,15 +1,13 @@
 require libmatchbox.inc
 
-SRCREV = "c81f8f444b83b187727f046432b186d67a42c732"
+SRCREV = "d9dd0ac810de4f0b93cd813ce14aee34c722c2cf"
 PV = "1.9+git${SRCPV}"
 PR = "r0"
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
            file://configure_fixes.patch \
-	   file://check.m4 \
-	   file://16bppfixes.patch \
-	   file://matchbox-start-fix.patch"
+	   file://check.m4"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2/fix_makefile.patch b/meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2/fix_makefile.patch
index 8c40e85..1f877d7 100644
--- a/meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2/fix_makefile.patch
+++ b/meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2/fix_makefile.patch
@@ -1,4 +1,6 @@
-Upstream-Status: Pending
+Upstream-Status: Accepted
+Instead matchbox-window-manager-2, it is in libmatchboxwm2, which has build
+failure as partial gtk-doc implementation.
 
 Nitin A Kamble <nitin.a.kamble@intel.com> 2011/05/10
 Fix following build error:
diff --git a/meta/recipes-sato/matchbox-desktop/files/dso_linking_change_build_fix.patch b/meta/recipes-sato/matchbox-desktop/files/dso_linking_change_build_fix.patch
index 0edb55e..388f51f 100644
--- a/meta/recipes-sato/matchbox-desktop/files/dso_linking_change_build_fix.patch
+++ b/meta/recipes-sato/matchbox-desktop/files/dso_linking_change_build_fix.patch
@@ -11,7 +11,7 @@ This patch avoids this linking error:
 Nitin A Kamble <nitin.a.kamble@intel.com>
 Date: 2011/01/11
 
-Upstream-Status: Pending
+Upstream-Status: Accepted
 
 Index: matchbox-desktop-2/configure.ac
 ===================================================================
diff --git a/meta/recipes-sato/matchbox-desktop/files/window-resize-fix.patch b/meta/recipes-sato/matchbox-desktop/files/window-resize-fix.patch
deleted file mode 100644
index 8970ac8..0000000
--- a/meta/recipes-sato/matchbox-desktop/files/window-resize-fix.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-commit 2ef9a98cbda46b5a52e20ce292eebd6ba1f3c3a8
-Author: Yu Ke <ke.yu@intel.com>
-Date:   Sun Mar 6 17:58:45 2011 +0800
-
-    desktop: Add configure event handler for desktop resize
-    
-    desktop need to resize its work area when window manager decorate its
-    window. Originally it is done by the hook in root window PropertyNotify
-    event handler, i.e. net_workarea_changed () routine. However, for unknown
-    reason, the PropertyNotify event does not deliver to the root window,
-    thus this routine does not work.
-    
-    this patch fix this issue from another side. Since window manager will also
-    send configure event to desktop window after decoration, it also works to do
-    it in configure event handler.
-    
-    Signed-off-by: Yu Ke <ke.yu@intel.com>
-
-Upstream-Status: Pending
-
-diff --git a/src/desktop.c b/src/desktop.c
-index d4fc2fb..5aa2cfc 100644
---- a/src/desktop.c
-+++ b/src/desktop.c
-@@ -130,6 +130,15 @@ workarea_changed (int x, int y, int w, int h)
-   gtk_fixed_move (GTK_FIXED (fixed), box, x, y);
- }
- 
-+static gboolean
-+desktop_configure_callback(GtkWindow *window,
-+		GdkEvent *event, gpointer data)
-+{
-+	gtk_widget_set_size_request (box, event->configure.width, event->configure.height);
-+	gtk_widget_queue_resize (box);
-+	return FALSE;
-+}
-+
- GtkWidget *
- create_desktop (void)
- {
-@@ -176,6 +185,9 @@ create_desktop (void)
-   /* Set a sane default in case there is no work area defined yet */
-   workarea_changed (0, 0, screen_w, screen_h);
- 
-+  g_signal_connect(G_OBJECT(window), "configure-event",
-+		  G_CALLBACK(desktop_configure_callback), NULL);
-+
- #ifdef STANDALONE
-   /* TODO: fake workarea_changed calls on window resize */
- #else
diff --git a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb
index a3dcec3..e2e3047 100644
--- a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb
+++ b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb
@@ -10,13 +10,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 DEPENDS = "gtk+ startup-notification dbus"
 SECTION = "x11/wm"
-SRCREV = "af7ed6775487380be73160aa0298bf6019765fad"
+SRCREV = "71e3e6e04271e9d5a14f1c231ef100c7f320134d"
 PV = "2.0+git${SRCPV}"
-PR = "r1"
+PR = "r0"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN}-2;protocol=git \
-           file://dso_linking_change_build_fix.patch \
-           file://window-resize-fix.patch"
+SRC_URI = "git://git.yoctoproject.org/${BPN}-2;protocol=git"
 
 EXTRA_OECONF = "--enable-startup-notification --with-dbus"
 
diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
index 98b3447..c1da0cf 100644
--- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
+++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
@@ -11,17 +11,16 @@ DEPENDS = "gtk+ startup-notification dbus dbus-glib"
 DEPENDS += " ${@base_contains("MACHINE_FEATURES", "acpi", "libacpi", "",d)}"
 DEPENDS += " ${@base_contains("MACHINE_FEATURES", "apm", "apmd", "",d)}"
 
-SRCREV = "982d9ea173dc87a84db2303d1a6a12607fc4d539"
+SRCREV = "cdf7a22716b87468f10573f622d5c7a58a684e35"
 PV = "0.0+git${SRCPV}"
-PR = "r1"
+PR = "r0"
 
 RPROVIDES_${PN} = "matchbox-panel"
 RREPLACES_${PN} = "matchbox-panel"
 RCONFLICTS_${PN} = "matchbox-panel"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \	
-	   file://gcc-4.6.0-compile.patch \
-           file://startup_fix.diff"
+	   file://gcc-4.6.0-compile.patch"
 
 EXTRA_OECONF = "--enable-startup-notification --enable-dbus"
 EXTRA_OECONF += " ${@base_contains("MACHINE_FEATURES", "acpi", "--with-battery=acpi", "",d)}"
diff --git a/meta/recipes-sato/matchbox-panel-2/startup_fix.diff b/meta/recipes-sato/matchbox-panel-2/startup_fix.diff
deleted file mode 100644
index d9a0876..0000000
--- a/meta/recipes-sato/matchbox-panel-2/startup_fix.diff
+++ /dev/null
@@ -1,19 +0,0 @@
-Fixed the compile error caused by typo, upstream also need this.
-
-Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
-
-Upstream-Status: Pending
-
-Index: matchbox-panel-2/applets/startup/startup.c
-===================================================================
---- matchbox-panel-2/applets/startup/startup.c	(revision 2109)
-+++ matchbox-panel-2/applets/startup/startup.c	(working copy)
-@@ -229,7 +229,7 @@
-         applet = g_slice_new0 (StartupApplet);
- 
-         applet->launch_list = NULL;
--        applet->hourglass_show = FALSE;
-+        applet->hourglass_shown = FALSE;
- 
-         /* Create image */
-         applet->image = MB_PANEL_SCALING_IMAGE
diff --git a/meta/recipes-sato/matchbox-stroke/files/dso_linking_change_build_fix.patch b/meta/recipes-sato/matchbox-stroke/files/dso_linking_change_build_fix.patch
deleted file mode 100644
index cbfa7de..0000000
--- a/meta/recipes-sato/matchbox-stroke/files/dso_linking_change_build_fix.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-after gcc linking has changed, all the libraries must be explicitely specified 
-This patch avoids these linking errors:
-
-| make[1]: Entering directory `/disk0/pokybuild/build1/tmp/work/i586-poky-linux/matchbox-stroke-0.0+svnr1820-r0/matchbox-stroke'^M
-| Making all in src^M
-| make[2]: Entering directory `/disk0/pokybuild/build1/tmp/work/i586-poky-linux/matchbox-stroke-0.0+svnr1820-r0/matchbox-stroke/src'^M
-| ccache i586-poky-linux-gcc -march=i586 --sysroot=/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux  -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o matchbox-stroke matchbox-stroke.o matchbox-stroke-ui.o matchbox-stroke-recog.o matchbox-stroke-mode.o matchbox-stroke-action.o config-parser.o util-hash.o util.o -lXft -lX11 -lXtst -lfakekey   -lexpat -lm^M
-| /disk0/pokybuild/build1/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.5.1/ld: u: invalid DSO for symbol `XRenderFindVisualFormat' definition^M
-| /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libXrender.so.1: could not read symbols: Bad value^M
-| collect2: ld returned 1 exit status^M
-| make[2]: *** [matchbox-stroke] Error 1
-
-Nitin A Kamble <nitin.a.kamble@intel.com>
-Date: 2011/01/11
-
-Upstream-Status: Pending
-
-Index: matchbox-stroke/configure.ac
-===================================================================
---- matchbox-stroke.orig/configure.ac
-+++ matchbox-stroke/configure.ac
-@@ -38,7 +38,7 @@ AC_ARG_WITH(expat-lib,         
- 	   expat_lib=$withval, expat_lib=yes)
- 
- 
--PKG_CHECK_MODULES(MBSTROKE, xft libfakekey,,
-+PKG_CHECK_MODULES(MBSTROKE, xft libfakekey xrender,,
- 	         AC_MSG_ERROR([*** Required Librarys not found ***]))
- 
- dnl ------ Expat ------------------------------------------------------------
-@@ -160,4 +160,4 @@ echo "
-         compiler:               ${CC} 
- 
-         Building with Debug:    ${enable_debug}
--"
-\ No newline at end of file
-+"
diff --git a/meta/recipes-sato/matchbox-stroke/matchbox-stroke_git.bb b/meta/recipes-sato/matchbox-stroke/matchbox-stroke_git.bb
index 10388f4..44b316d 100644
--- a/meta/recipes-sato/matchbox-stroke/matchbox-stroke_git.bb
+++ b/meta/recipes-sato/matchbox-stroke/matchbox-stroke_git.bb
@@ -13,8 +13,7 @@ PR = "r0"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
            file://single-instance.patch \
-           file://configure_fix.patch;maxrev=1819 \
-           file://dso_linking_change_build_fix.patch "
+           file://configure_fix.patch;maxrev=1819"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato-2/png_rename.patch b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato-2/png_rename.patch
deleted file mode 100644
index d8f264f..0000000
--- a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato-2/png_rename.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Background Image name was changed from background.png to template.png
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-Upstream-Status: Pending
-
-Index: matchbox-sato/Sato/matchbox2/Makefile.am
-===================================================================
---- matchbox-sato.orig/Sato/matchbox2/Makefile.am	2010-12-29 13:08:43.000000000 -0800
-+++ matchbox-sato/Sato/matchbox2/Makefile.am	2010-12-29 22:14:45.690428881 -0800
-@@ -1,4 +1,4 @@
--pngs = background.png
-+pngs = template.png
- 
- themesdir = $(datadir)/themes/Sato/matchbox2
- themes_DATA = theme.xml $(pngs)
diff --git a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato-2_git.bb b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato-2_git.bb
index d6bfb2f..3edc3a3 100644
--- a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato-2_git.bb
+++ b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato-2_git.bb
@@ -1,11 +1,10 @@
 require matchbox-theme-sato.inc
 
 DEPENDS = "matchbox-wm-2"
-SRCREV = "f72cf4ed7d71ad9e47b0f2d3dbc593bc2f3e76f8"
+SRCREV = "e3ccc08d4a680d70fd4891fca966aa6ce503065c"
 PV = "0.2+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/matchbox-sato;protocol=git \
-          file://png_rename.patch"
+SRC_URI = "git://git.yoctoproject.org/matchbox-sato;protocol=git"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.1



