Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QKkdA-0001xk-Fu
	for openembedded-core@lists.openembedded.org;
	Fri, 13 May 2011 07:09:43 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 12 May 2011 22:06:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,362,1301900400"; d="scan'208";a="435406255"
Received: from unknown (HELO localhost) ([10.255.12.88])
	by azsmga001.ch.intel.com with ESMTP; 12 May 2011 22:06:42 -0700
Message-Id: <10bdb737c2c4c6996fd035849109a1e07580a6b9.1305263078.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305263078.git.sgw@linux.intel.com>
References: <cover.1305263078.git.sgw@linux.intel.com>
Old-Date: Thu, 12 May 2011 08:08:05 +0800
Date: Thu, 12 May 2011 22:06:42 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Ilya Yanok <yanok@emcraft.com>, Jingdong Lu <jingdong.lu@windriver.com>
Subject: [PATCH 4/8] recipes: Add Upstream-Status to multiple recipes
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
X-List-Received-Date: Fri, 13 May 2011 05:09:43 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

gtk+: Add Upstream-Status
ed: Add Upstream-Status
gnome-common: Add Upstream-Status
libmatchbox: Add Upstream-Status
matchbox-wm: Add Upstream-Status
x11vnc: Add Upstream-Status
xtscal: Add Upstream-Status
eds-dbus: Add Upstream-Status
matchbox-desktop: Add Upstream-Status
matchbox-keyboard: Add Upstream-Status
matchbox-stroke: Add Upstream-Status
matchbox-theme-sato: Add Upstream-Status
owl-video-widget: Add Upstream-Status
beecrypt: Add Upstream-Status
gnome-icon-theme: Add Upstream-Status
tslib: Add Upstream-Status
libowl-av: Add Upstream-Status
sato-icon-theme: Add Upstream-Status
web-webkit: Add Upstream-Status
metacity: Add Upstream-Status
apr: Add Upstream-Status
gdk-pixbuf: Add Upstream-Status
pcmanfm: Add Upstream-Status
gpgme: Add Upstream-Status
eee-acpi-scripts: Add Upstream-Status
libgalago: Add Upstream-Status
python-pygtk: Add Upstream-Status
gnome-mime-data: Add Upstream-Status
clutter: Add Upstream-Status
clutter-gtk: Add Upstream-Status
tidy: Add Upstream-Status
mutter: Add Upstream-Status
xcursor-transparent-theme: Add Upstream-Status
leafpad: Add Upstream-Status
matchbox-config-gtk: Add Upstream-Status
contacts: Add Upstream-Status
dates: Add Upstream-Status
web: Add Upstream-Status
webkit: Add Upstream-Status
 - Also removed empty fix_im.patch
apr-util: Add Upstream-Status
libcroco: Add Upstream-Status
liboil: Add Upstream-Status
libxslt: Add Upstream-Status
libglade: Add Upstream-Status
gnome-terminal: Add Upstream-Status
xev: Add Upstream-Status
claws-mail: Add Upstream-Status
clipboard-manager: Add Upstream-Status
epdfview: Add Upstream-Status
kf: Add Upstream-Status
qemu: Add Upstream-Status
clutter-gst: Add Upstream-Status
table: Add Upstream-Status
matchbox-panel-2: Add Upstream-Status

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../30f29e7d8e1b67c40cd18a7155ba30c4382692d5.patch |    2 +
 .../recipes-graphics/clutter/table/fixes.patch     |    2 +
 .../recipes-graphics/clutter/tidy/autofoo.patch    |    2 +
 .../clutter/tidy/tidy-enable-tests.patch           |    2 +
 .../recipes-graphics/xorg-app/xev/diet-x11.patch   |    2 +
 .../recipes-sato/claws-mail/files/desktop.patch    |    2 +
 .../recipes-sato/claws-mail/files/fix-build.patch  |    2 +
 .../claws-mail/files/owl-window-menu.patch         |    2 +
 .../claws-mail/files/streamline-ui.patch           |    2 +
 .../clipboard-manager/files/daemonize.patch        |    2 +
 .../clipboard-manager/files/makefile.patch         |    2 +
 .../clipboard-manager/files/script.patch           |    2 +
 .../recipes-sato/epdfview/epdfview/owl-menus.patch |    2 +
 .../recipes-sato/kf/files/fix-configure.patch      |    2 +
 .../recipes-sato/kf/files/fix-desktop-file.patch   |    2 +
 meta-demoapps/recipes-sato/kf/files/gcc4.patch     |    2 +
 .../eee-acpi-scripts/files/powerbtn.patch          |    2 +
 .../eee-acpi-scripts/files/remove-doc-check.patch  |    2 +
 .../galago/libgalago-0.5.2/mkdir.patch             |    2 +
 .../galago/libgalago-0.5.2/pkgconfig.patch         |    2 +
 .../python/python-pygtk/fix-gtkunixprint.patch     |    2 +
 .../python/python-pygtk/nodocs.patch               |    2 +
 .../prevent_to_get_display_during_import.patch     |    2 +
 ...t-and-use-GCC-atomic-builtins-for-locking.patch |    2 +
 .../qemu/qemu-0.14.0/enable-i386-linux-user.patch  |    2 +
 .../fallback-to-safe-mmap_min_addr.patch           |    2 +
 .../qemu/qemu-0.14.0/fix-configure-checks.patch    |    2 +
 .../qemu/qemu-0.14.0/fix-nogl.patch                |    2 +
 .../qemu/qemu-0.14.0/glflags.patch                 |    2 +
 .../qemu/qemu-0.14.0/init-info.patch               |    2 +
 .../qemu/qemu-0.14.0/larger_default_ram_size.patch |    2 +
 .../qemu/qemu-0.14.0/linker-flags.patch            |    3 ++
 .../qemu/qemu-0.14.0/no-strip.patch                |    2 +
 .../qemu/qemu-0.14.0/opengl-sdl-fix.patch          |    2 +
 .../qemu/qemu-0.14.0/qemu-git-qemugl-host.patch    |    2 +
 .../qemu/qemu-0.14.0/qemu-vmware-vga-depth.patch   |    3 ++
 .../qemugl-allow-glxcontext-release.patch          |    2 +
 .../qemu/qemu-0.14.0/qemugl-fix.patch              |    2 +
 .../spice-qxl-locking-fix-for-qemu-kvm.patch       |    2 +
 meta/recipes-extended/ed/ed-1.5/ed-1.2-build.patch |    2 +
 .../gdk-pixbuf-2.22.1/configure_fix.patch          |    2 +
 .../gdk-pixbuf-2.22.1/hardcoded_libtool.patch      |    2 +
 .../gnome/gnome-common-2.28.0/omf.patch            |    2 +
 .../gnome/gnome-icon-theme/iconpath-option.patch   |    3 ++
 .../gnome/gnome-mime-data/pkgconfig.patch          |    2 +
 .../gnome/metacity/crosscompile.patch              |    2 +
 .../gtk+/gtk+-2.12.7/cellrenderer-cairo.patch      |    2 +
 .../gtk+/gtk+-2.12.7/combo-arrow-size.patch        |    2 +
 .../gtk+/gtk+-2.12.7/disable-print.patch           |    2 +
 .../gtk+/gtk+-2.12.7/entry-cairo.patch             |    2 +
 .../gtk+/gtk+-2.12.7/filechooser-default.patch     |    2 +
 .../gtk+/gtk+-2.12.7/filechooser-sizefix.patch     |    2 +
 .../gtk+/gtk+-2.12.7/filesystem-volumes.patch      |    2 +
 .../gtk+/gtk+-2.12.7/gtklabel-resize-patch         |    2 +
 .../gtk+/gtk+-2.12.7/hardcoded_libtool.patch       |    2 +
 .../gtk+/gtk+-2.12.7/menu-deactivate.patch         |    2 +
 meta/recipes-gnome/gtk+/gtk+-2.12.7/no-demos.patch |    2 +
 .../gtk+/gtk+-2.12.7/pangoxft2.10.6.diff           |    2 +
 .../gtk+/gtk+-2.12.7/range-no-redraw.patch         |    3 ++
 .../gtk+/gtk+-2.12.7/run-iconcache.patch           |    2 +
 .../gtk+/gtk+-2.12.7/scrolled-placement.patch      |    2 +
 .../gtk+/gtk+-2.12.7/toggle-font.diff              |    2 +
 .../recipes-gnome/gtk+/gtk+-2.12.7/xsettings.patch |    2 +
 ...Duplicate-the-exec-string-returned-by-gtk.patch |    2 +
 .../gtk+/gtk+-2.16.6/cellrenderer-cairo.patch      |    2 +
 .../gtk+-2.16.6/disable-gio-png-sniff-test.diff    |    2 +
 .../gtk+/gtk+-2.16.6/entry-cairo.patch             |    2 +
 .../gtk+/gtk+-2.16.6/hardcoded_libtool.patch       |    2 +
 meta/recipes-gnome/gtk+/gtk+-2.16.6/no-demos.patch |    2 +
 .../gtk+/gtk+-2.16.6/run-iconcache.patch           |    2 +
 .../gtk+/gtk+-2.16.6/toggle-font.diff              |    2 +
 .../recipes-gnome/gtk+/gtk+-2.16.6/xsettings.patch |    2 +
 ...Duplicate-the-exec-string-returned-by-gtk.patch |    2 +
 .../gtk+/gtk+-2.22.1/cellrenderer-cairo.patch      |    2 +
 .../gtk+/gtk+-2.22.1/configurefix.patch            |    2 +
 .../recipes-gnome/gtk+/gtk+-2.22.1/doc-fixes.patch |    3 ++
 .../gtk+/gtk+-2.22.1/entry-cairo.patch             |    2 +
 .../gtk+/gtk+-2.22.1/hardcoded_libtool.patch       |    2 +
 meta/recipes-gnome/gtk+/gtk+-2.22.1/no-demos.patch |    2 +
 .../gtk+/gtk+-2.22.1/run-iconcache.patch           |    2 +
 .../gtk+/gtk+-2.22.1/toggle-font.diff              |    2 +
 .../recipes-gnome/gtk+/gtk+-2.22.1/xsettings.patch |    2 +
 .../libglade/libglade-2.6.4/glade-cruft.patch      |    2 +
 .../libglade/libglade-2.6.4/no-deprecation.patch   |    2 +
 .../libglade/libglade-2.6.4/no-xml2.patch          |    2 +
 .../clutter/clutter-gst/autofoo-0.4.patch          |    2 +
 ...-9db4a61a25677764bb927369c5c68ada958fb65c.patch |    2 +
 .../clutter/clutter-gst/autofoo.patch              |    2 +
 .../clutter/clutter-gtk/disable_deprecated.patch   |    2 +
 .../clutter/clutter-gtk/enable_tests.patch         |    2 +
 .../clutter/clutter/build-fix.patch                |    2 +
 .../clutter/clutter/enable_tests-0.6.patch         |    2 +
 .../clutter/clutter/enable_tests-0.8.patch         |    2 +
 .../clutter/clutter/enable_tests-1.0.patch         |    2 +
 .../clutter/clutter/enable_tests-1.4.patch         |    2 +
 ...-654c26a1301c9bc5f8e3e5e3b68af5eb1b2e0673.patch |    2 +
 .../clutter/clutter/enable_tests.patch             |    2 +
 .../clutter/clutter/symconflict.patch              |    2 +
 .../clutter/clutter/test-conformance-fix.patch     |    2 +
 .../libmatchbox/files/16bppfixes-2.patch           |    2 +
 .../libmatchbox/files/16bppfixes.patch             |    2 +
 .../libmatchbox/files/autofoo.patch                |    2 +
 .../libmatchbox/files/configure_fixes.patch        |    2 +
 .../libmatchbox/files/fix-configure-for-1.9.patch  |    2 +
 .../libmatchbox/files/matchbox-start-fix.patch     |    2 +
 .../matchbox-wm/matchbox-wm/configure_fix.patch    |    2 +
 .../mutter/mutter/crosscompile.patch               |    2 +
 ...-7adb574bb3fa3880eb85dbc86e580cf3452d57c4.patch |    2 +
 .../mutter/mutter/fix_pkgconfig.patch              |    2 +
 meta/recipes-graphics/mutter/mutter/nodocs.patch   |    2 +
 meta/recipes-graphics/mutter/mutter/nozenity.patch |    2 +
 .../tslib/tslib/32bitBE-support.patch              |    3 ++
 .../recipes-graphics/tslib/tslib/fix_version.patch |    2 +
 meta/recipes-graphics/tslib/tslib/multievent.patch |    2 +
 .../recipes-graphics/x11vnc/files/endian-fix.patch |    2 +
 .../x11vnc/files/starting-fix.patch                |    3 ++
 .../fix_watch_cursor.patch                         |    2 +
 .../use-relative-symlinks.patch                    |    2 +
 .../xtscal/xtscal/change-cross.patch               |    2 +
 meta/recipes-graphics/xtscal/xtscal/cleanup.patch  |    2 +
 .../xtscal/dso_linking_change_build_fix.patch      |    2 +
 .../eds/eds-dbus-2.20.0/no_iconv_test.patch        |    2 +
 .../eds/eds-dbus-2.20.0/oh-contact.patch           |    2 +
 .../eds/eds-dbus/new-contact-fix.patch             |    2 +
 meta/recipes-sato/eds/eds-dbus/nossl.patch         |    2 +
 meta/recipes-sato/eds/eds-dbus/oh-contact.patch    |    2 +
 meta/recipes-sato/eds/eds-dbus/old-gdk-api.patch   |    2 +
 .../eds/eds-dbus/optional_imapx_provider.patch     |    2 +
 meta/recipes-sato/eds/eds-dbus/parallelmake.patch  |    2 +
 meta/recipes-sato/leafpad/files/owl-menu.patch     |    2 +
 .../matchbox-config-gtk/files/no-handed.patch      |    2 +
 .../files/dso_linking_change_build_fix.patch       |    2 +
 .../matchbox-desktop/files/window-resize-fix.patch |    2 +
 .../matchbox-keyboard/files/configure_fix.patch    |    2 +
 .../matchbox-keyboard/files/single-instance.patch  |    1 +
 .../matchbox-panel-2/gcc-4.6.0-compile.patch       |    2 +
 .../recipes-sato/matchbox-panel-2/startup_fix.diff |    2 +
 .../matchbox-stroke/files/configure_fix.patch      |    2 +
 .../files/dso_linking_change_build_fix.patch       |    1 +
 .../matchbox-stroke/files/single-instance.patch    |    1 +
 .../matchbox-theme-sato-2/png_rename.patch         |    2 +
 .../libowl-av/gst_change_state.patch               |    2 +
 .../owl-video-widget/libowl-av/make-382.patch      |    2 +
 .../owl-video/gtk_multithread_safe.patch           |    2 +
 .../owl-video-widget/owl-video/make-382.patch      |    2 +
 .../pcmanfm/files/cross-compile-fix.patch          |    2 +
 .../pcmanfm/files/owl-window-menu.patch            |    2 +
 .../contacts/contacts-owl-window-menu.patch        |    2 +
 meta/recipes-sato/pimlico/contacts/make-382.patch  |    2 +
 .../pimlico/dates/dates-owl-window-menu.patch      |    2 +
 .../dates/dso_linking_change_build_fix.patch       |    2 +
 meta/recipes-sato/pimlico/dates/make-382.patch     |    2 +
 .../sato-icon-theme/iconpath-option.patch          |    2 +
 .../web/web-webkit/link-with-g++.patch             |    3 ++
 meta/recipes-sato/web/web-webkit/make-382.patch    |    2 +
 meta/recipes-sato/web/web/owl-window-menu.patch    |    2 +
 meta/recipes-sato/webkit/files/nodolt.patch        |    3 ++
 meta/recipes-support/apr/apr-util/configfix.patch  |    2 +
 .../apr/apr-util/configure_fixes.patch             |    2 +
 .../apr/apr-util/configure_fixes.patch.old         |   25 --------------------
 meta/recipes-support/apr/apr/buildconf_fix.patch   |    2 +
 meta/recipes-support/apr/apr/cleanup.patch         |    2 +
 meta/recipes-support/apr/apr/configfix.patch       |    2 +
 meta/recipes-support/apr/apr/configure_fixes.patch |    2 +
 .../beecrypt/beecrypt/disable-icu-check.patch      |    2 +
 .../beecrypt/beecrypt/fix-security.patch           |    3 ++
 .../gpgme/gpgme-1.3.0/disable_gpgconf_check.patch  |    1 +
 meta/recipes-support/libcroco/files/croco.patch    |    2 +
 .../liboil-0.3.17/fix-unaligned-whitelist.patch    |    2 +
 .../liboil/liboil-0.3.17/no-tests.patch            |    2 +
 .../libxslt/libxslt/pkgconfig_fix.patch            |    2 +
 171 files changed, 346 insertions(+), 25 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/files/fix_im.patch
 delete mode 100644 meta/recipes-support/apr/apr-util/configure_fixes.patch.old

diff --git a/meta-demoapps/recipes-gnome/gnome/gnome-terminal/30f29e7d8e1b67c40cd18a7155ba30c4382692d5.patch b/meta-demoapps/recipes-gnome/gnome/gnome-terminal/30f29e7d8e1b67c40cd18a7155ba30c4382692d5.patch
index 0358ed8..435cb6a 100644
--- a/meta-demoapps/recipes-gnome/gnome/gnome-terminal/30f29e7d8e1b67c40cd18a7155ba30c4382692d5.patch
+++ b/meta-demoapps/recipes-gnome/gnome/gnome-terminal/30f29e7d8e1b67c40cd18a7155ba30c4382692d5.patch
@@ -3,6 +3,8 @@ From: Seán de Búrca <leftmostcat@gmail.com>
 Date: Fri, 07 Aug 2009 00:38:52 +0000
 Subject: Remove useless Plural-Forms line which breaks build with gnome-doc-utils master
 
+Upstream-Status: Inappropriate [configuration]
+
 ---
 diff --git a/help/el/el.po b/help/el/el.po
 index ab77264..635b68f 100644
diff --git a/meta-demoapps/recipes-graphics/clutter/table/fixes.patch b/meta-demoapps/recipes-graphics/clutter/table/fixes.patch
index a7cdc43..323bf13 100644
--- a/meta-demoapps/recipes-graphics/clutter/table/fixes.patch
+++ b/meta-demoapps/recipes-graphics/clutter/table/fixes.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: table/Makefile
 ===================================================================
 --- table.orig/Makefile	2007-07-10 13:24:18.000000000 +0100
diff --git a/meta-demoapps/recipes-graphics/clutter/tidy/autofoo.patch b/meta-demoapps/recipes-graphics/clutter/tidy/autofoo.patch
index 7f54a33..51b4eea 100644
--- a/meta-demoapps/recipes-graphics/clutter/tidy/autofoo.patch
+++ b/meta-demoapps/recipes-graphics/clutter/tidy/autofoo.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: tidy/doc/reference/Makefile.am
 ===================================================================
 --- tidy.orig/doc/reference/Makefile.am  2007-11-06 19:36:56.000000000 +0000
diff --git a/meta-demoapps/recipes-graphics/clutter/tidy/tidy-enable-tests.patch b/meta-demoapps/recipes-graphics/clutter/tidy/tidy-enable-tests.patch
index c5e1660..6942577 100644
--- a/meta-demoapps/recipes-graphics/clutter/tidy/tidy-enable-tests.patch
+++ b/meta-demoapps/recipes-graphics/clutter/tidy/tidy-enable-tests.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: trunk/tests/Makefile.am
 ===================================================================
 --- trunk.orig/tests/Makefile.am	2008-03-04 12:22:10.000000000 +0000
diff --git a/meta-demoapps/recipes-graphics/xorg-app/xev/diet-x11.patch b/meta-demoapps/recipes-graphics/xorg-app/xev/diet-x11.patch
index 9f515e8..139838c 100644
--- a/meta-demoapps/recipes-graphics/xorg-app/xev/diet-x11.patch
+++ b/meta-demoapps/recipes-graphics/xorg-app/xev/diet-x11.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [disable feature]
+
 ---
  xev.c |   16 ++++++++--------
  1 file changed, 8 insertions(+), 8 deletions(-)
diff --git a/meta-demoapps/recipes-sato/claws-mail/files/desktop.patch b/meta-demoapps/recipes-sato/claws-mail/files/desktop.patch
index c5ed7a9..d5ca3db 100644
--- a/meta-demoapps/recipes-sato/claws-mail/files/desktop.patch
+++ b/meta-demoapps/recipes-sato/claws-mail/files/desktop.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: claws-mail-2.9.1/claws-mail.desktop
 ===================================================================
 --- claws-mail-2.9.1.orig/claws-mail.desktop	2007-04-24 17:40:20.000000000 +0100
diff --git a/meta-demoapps/recipes-sato/claws-mail/files/fix-build.patch b/meta-demoapps/recipes-sato/claws-mail/files/fix-build.patch
index 2f30899..41ca1d6 100644
--- a/meta-demoapps/recipes-sato/claws-mail/files/fix-build.patch
+++ b/meta-demoapps/recipes-sato/claws-mail/files/fix-build.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Remove duplicate file entries as this breaks install with new Automake
 
 JL 19/03/10
diff --git a/meta-demoapps/recipes-sato/claws-mail/files/owl-window-menu.patch b/meta-demoapps/recipes-sato/claws-mail/files/owl-window-menu.patch
index 54c6166..97807b2 100644
--- a/meta-demoapps/recipes-sato/claws-mail/files/owl-window-menu.patch
+++ b/meta-demoapps/recipes-sato/claws-mail/files/owl-window-menu.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [enable feature]
+
 Index: claws-mail-2.9.1/src/addressbook.c
 ===================================================================
 --- claws-mail-2.9.1.orig/src/addressbook.c	2007-04-25 10:18:13.000000000 +0100
diff --git a/meta-demoapps/recipes-sato/claws-mail/files/streamline-ui.patch b/meta-demoapps/recipes-sato/claws-mail/files/streamline-ui.patch
index 29a52ff..81a2a6b 100644
--- a/meta-demoapps/recipes-sato/claws-mail/files/streamline-ui.patch
+++ b/meta-demoapps/recipes-sato/claws-mail/files/streamline-ui.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [disable feature]
+
 Index: claws-mail-2.9.1/src/mainwindow.c
 ===================================================================
 --- claws-mail-2.9.1.orig/src/mainwindow.c	2007-04-25 07:40:10.000000000 +0100
diff --git a/meta-demoapps/recipes-sato/clipboard-manager/files/daemonize.patch b/meta-demoapps/recipes-sato/clipboard-manager/files/daemonize.patch
index 51ce478..24c11a9 100644
--- a/meta-demoapps/recipes-sato/clipboard-manager/files/daemonize.patch
+++ b/meta-demoapps/recipes-sato/clipboard-manager/files/daemonize.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [enable feature]
+
 Index: 0.6.4/manager.c
 ===================================================================
 --- 0.6.4.orig/manager.c	2007-06-28 12:23:37.000000000 +0100
diff --git a/meta-demoapps/recipes-sato/clipboard-manager/files/makefile.patch b/meta-demoapps/recipes-sato/clipboard-manager/files/makefile.patch
index 6e48da0..17cd742 100644
--- a/meta-demoapps/recipes-sato/clipboard-manager/files/makefile.patch
+++ b/meta-demoapps/recipes-sato/clipboard-manager/files/makefile.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: 0.6.4/Makefile.am
 ===================================================================
 --- 0.6.4.orig/Makefile.am	2007-06-28 12:23:37.000000000 +0100
diff --git a/meta-demoapps/recipes-sato/clipboard-manager/files/script.patch b/meta-demoapps/recipes-sato/clipboard-manager/files/script.patch
index 09e6862..bdab05a 100644
--- a/meta-demoapps/recipes-sato/clipboard-manager/files/script.patch
+++ b/meta-demoapps/recipes-sato/clipboard-manager/files/script.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [disable feature]
+
 Index: 0.6.4/clipboard.sh
 ===================================================================
 --- 0.6.4.orig/clipboard.sh	2007-06-28 12:23:37.000000000 +0100
diff --git a/meta-demoapps/recipes-sato/epdfview/epdfview/owl-menus.patch b/meta-demoapps/recipes-sato/epdfview/epdfview/owl-menus.patch
index 755b71e..b7ca962 100644
--- a/meta-demoapps/recipes-sato/epdfview/epdfview/owl-menus.patch
+++ b/meta-demoapps/recipes-sato/epdfview/epdfview/owl-menus.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [enable feature]
+
 Index: epdfview-0.1.7/src/Makefile.am
 ===================================================================
 --- epdfview-0.1.7.orig/src/Makefile.am	2010-07-13 12:30:44.014172385 +0100
diff --git a/meta-demoapps/recipes-sato/kf/files/fix-configure.patch b/meta-demoapps/recipes-sato/kf/files/fix-configure.patch
index fc1ad9a..ae6bf71 100644
--- a/meta-demoapps/recipes-sato/kf/files/fix-configure.patch
+++ b/meta-demoapps/recipes-sato/kf/files/fix-configure.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 diff -urNd ../kf-0.5.4.1-r0/kf-0.5.4.1/configure.in kf-0.5.4.1/configure.in
 --- ../kf-0.5.4.1-r0/kf-0.5.4.1/configure.in	2005-04-27 19:42:49.000000000 +0100
 +++ kf-0.5.4.1/configure.in	2005-09-29 14:12:32.000000000 +0100
diff --git a/meta-demoapps/recipes-sato/kf/files/fix-desktop-file.patch b/meta-demoapps/recipes-sato/kf/files/fix-desktop-file.patch
index 7a0f7d1..c749616 100644
--- a/meta-demoapps/recipes-sato/kf/files/fix-desktop-file.patch
+++ b/meta-demoapps/recipes-sato/kf/files/fix-desktop-file.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Common subdirectories: kf-0.5.4.1.orig/data and kf-0.5.4.1/data
 diff -u kf-0.5.4.1.orig/kf.desktop kf-0.5.4.1/kf.desktop
 --- kf-0.5.4.1.orig/kf.desktop	2005-04-19 22:08:44.000000000 +0100
diff --git a/meta-demoapps/recipes-sato/kf/files/gcc4.patch b/meta-demoapps/recipes-sato/kf/files/gcc4.patch
index 58727ea..9e16529 100644
--- a/meta-demoapps/recipes-sato/kf/files/gcc4.patch
+++ b/meta-demoapps/recipes-sato/kf/files/gcc4.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: kf-0.5.4.1/src/jispman.c
 ===================================================================
 --- kf-0.5.4.1.orig/src/jispman.c	2006-12-03 15:33:47.000000000 +0100
diff --git a/meta/recipes-bsp/eee-acpi-scripts/files/powerbtn.patch b/meta/recipes-bsp/eee-acpi-scripts/files/powerbtn.patch
index 3f79c3e..403e556 100644
--- a/meta/recipes-bsp/eee-acpi-scripts/files/powerbtn.patch
+++ b/meta/recipes-bsp/eee-acpi-scripts/files/powerbtn.patch
@@ -3,6 +3,8 @@
  events/powerbtn  |    2 ++
  2 files changed, 5 insertions(+)
 
+Upstream-Status: Inappropriate [enable feature]
+
 Index: git/events/powerbtn
 ===================================================================
 --- /dev/null	1970-01-01 00:00:00.000000000 +0000
diff --git a/meta/recipes-bsp/eee-acpi-scripts/files/remove-doc-check.patch b/meta/recipes-bsp/eee-acpi-scripts/files/remove-doc-check.patch
index 3e80b7f..fc2c291 100644
--- a/meta/recipes-bsp/eee-acpi-scripts/files/remove-doc-check.patch
+++ b/meta/recipes-bsp/eee-acpi-scripts/files/remove-doc-check.patch
@@ -5,6 +5,8 @@
  actions/volume.sh     |    3 ---
  4 files changed, 12 deletions(-)
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: git/eeepc-acpi-scripts/hotkey.sh
 ===================================================================
 --- git.orig/eeepc-acpi-scripts/hotkey.sh	2010-11-28 16:02:17.000000000 +0800
diff --git a/meta/recipes-connectivity/galago/libgalago-0.5.2/mkdir.patch b/meta/recipes-connectivity/galago/libgalago-0.5.2/mkdir.patch
index f893bff..4f18686 100644
--- a/meta/recipes-connectivity/galago/libgalago-0.5.2/mkdir.patch
+++ b/meta/recipes-connectivity/galago/libgalago-0.5.2/mkdir.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: libgalago-0.5.2/po/Makefile.in.in
 ===================================================================
 --- libgalago-0.5.2.orig/po/Makefile.in.in	2006-06-06 09:59:17.000000000 +0100
diff --git a/meta/recipes-connectivity/galago/libgalago-0.5.2/pkgconfig.patch b/meta/recipes-connectivity/galago/libgalago-0.5.2/pkgconfig.patch
index 33d4daa..6fbf552 100644
--- a/meta/recipes-connectivity/galago/libgalago-0.5.2/pkgconfig.patch
+++ b/meta/recipes-connectivity/galago/libgalago-0.5.2/pkgconfig.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: libgalago-0.5.2/libgalago.pc.in
 ===================================================================
 --- libgalago-0.5.2.orig/libgalago.pc.in	2006-05-17 08:53:26.000000000 +0100
diff --git a/meta/recipes-devtools/python/python-pygtk/fix-gtkunixprint.patch b/meta/recipes-devtools/python/python-pygtk/fix-gtkunixprint.patch
index dca19ce..6d2f64b 100644
--- a/meta/recipes-devtools/python/python-pygtk/fix-gtkunixprint.patch
+++ b/meta/recipes-devtools/python/python-pygtk/fix-gtkunixprint.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: pygtk-2.10.0/gtk/gtkunixprint.override
 ===================================================================
 --- pygtk-2.10.0.orig/gtk/gtkunixprint.override
diff --git a/meta/recipes-devtools/python/python-pygtk/nodocs.patch b/meta/recipes-devtools/python/python-pygtk/nodocs.patch
index c358104..f07309a 100644
--- a/meta/recipes-devtools/python/python-pygtk/nodocs.patch
+++ b/meta/recipes-devtools/python/python-pygtk/nodocs.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: pygtk-2.17.0/Makefile.am
 ===================================================================
 --- pygtk-2.17.0.orig/Makefile.am
diff --git a/meta/recipes-devtools/python/python-pygtk/prevent_to_get_display_during_import.patch b/meta/recipes-devtools/python/python-pygtk/prevent_to_get_display_during_import.patch
index 9340f82..833038e 100644
--- a/meta/recipes-devtools/python/python-pygtk/prevent_to_get_display_during_import.patch
+++ b/meta/recipes-devtools/python/python-pygtk/prevent_to_get_display_during_import.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: pygtk-2.10.4/gtk/__init__.py
 ===================================================================
 --- pygtk-2.10.4.orig/gtk/__init__.py	2007-11-27 19:27:05.000000000 -0300
diff --git a/meta/recipes-devtools/qemu/qemu-0.14.0/Detect-and-use-GCC-atomic-builtins-for-locking.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/Detect-and-use-GCC-atomic-builtins-for-locking.patch
index dc69bfb..eb107b8 100644
--- a/meta/recipes-devtools/qemu/qemu-0.14.0/Detect-and-use-GCC-atomic-builtins-for-locking.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/Detect-and-use-GCC-atomic-builtins-for-locking.patch
@@ -8,6 +8,8 @@ Subject: [PATCH] Detect and use GCC atomic builtins for locking
  qemu-lock.h |   13 +++++++++++++
  2 files changed, 30 insertions(+), 0 deletions(-)
 
+Upstream-Status: Pending
+
 Index: qemu-0.14.0/configure
 ===================================================================
 --- qemu-0.14.0.orig/configure
diff --git a/meta/recipes-devtools/qemu/qemu-0.14.0/enable-i386-linux-user.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/enable-i386-linux-user.patch
index 3cf0953..bb0d6a3 100644
--- a/meta/recipes-devtools/qemu/qemu-0.14.0/enable-i386-linux-user.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/enable-i386-linux-user.patch
@@ -2,6 +2,8 @@ Enable i386-linux-user
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: qemu-0.14.0/Makefile.target
 ===================================================================
 --- qemu-0.14.0.orig/Makefile.target
diff --git a/meta/recipes-devtools/qemu/qemu-0.14.0/fallback-to-safe-mmap_min_addr.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/fallback-to-safe-mmap_min_addr.patch
index 4b1a64f..2075386 100644
--- a/meta/recipes-devtools/qemu/qemu-0.14.0/fallback-to-safe-mmap_min_addr.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/fallback-to-safe-mmap_min_addr.patch
@@ -8,6 +8,8 @@ Subject: [PATCH] linux-user: use default mmap_min_addr 65536 when /proc/sys/vm/m
  linux-user/main.c |    5 +++++
  1 files changed, 5 insertions(+), 0 deletions(-)
 
+Upstream-Status: Pending
+
 Index: qemu-0.14.0/linux-user/main.c
 ===================================================================
 --- qemu-0.14.0.orig/linux-user/main.c
diff --git a/meta/recipes-devtools/qemu/qemu-0.14.0/fix-configure-checks.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/fix-configure-checks.patch
index 574b430..96881bb 100644
--- a/meta/recipes-devtools/qemu/qemu-0.14.0/fix-configure-checks.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/fix-configure-checks.patch
@@ -6,6 +6,8 @@ added and files in the sysroot can be found.
 
 Patch from Paul Eggleton, Comments by RP 28/11/10
 
+Upstream-Status: Inappropriate [embedded specific]
+
 Index: qemu-0.14.0/configure
 ===================================================================
 --- qemu-0.14.0.orig/configure
diff --git a/meta/recipes-devtools/qemu/qemu-0.14.0/fix-nogl.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/fix-nogl.patch
index 0219cc8..83b2752 100644
--- a/meta/recipes-devtools/qemu/qemu-0.14.0/fix-nogl.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/fix-nogl.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: qemu-0.14.0/Makefile.target
 ===================================================================
 --- qemu-0.14.0.orig/Makefile.target
diff --git a/meta/recipes-devtools/qemu/qemu-0.14.0/glflags.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/glflags.patch
index f99c6d1..0ad5551 100644
--- a/meta/recipes-devtools/qemu/qemu-0.14.0/glflags.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/glflags.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: qemu-0.14.0/Makefile.target
 ===================================================================
 --- qemu-0.14.0.orig/Makefile.target	2011-04-04 12:12:19.142871742 +0100
diff --git a/meta/recipes-devtools/qemu/qemu-0.14.0/init-info.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/init-info.patch
index 8df60e8..2250444 100644
--- a/meta/recipes-devtools/qemu/qemu-0.14.0/init-info.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/init-info.patch
@@ -2,6 +2,8 @@
 # makes info.info.x11.display zero and avoids the calls to
 # opengl_exec_set_parent_window, one of which is crashing.
 
+Upstream-Status: Pending
+
 Index: qemu-0.14.0/ui/sdl.c
 ===================================================================
 --- qemu-0.14.0.orig/ui/sdl.c
diff --git a/meta/recipes-devtools/qemu/qemu-0.14.0/larger_default_ram_size.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/larger_default_ram_size.patch
index 8928bd5..711c360 100644
--- a/meta/recipes-devtools/qemu/qemu-0.14.0/larger_default_ram_size.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/larger_default_ram_size.patch
@@ -5,6 +5,8 @@ It has not been applied to upstream qemu
 
 Khem Raj <raj.khem@gmail.com>
 
+Upstream-Status: Pending
+
 Index: qemu-0.14.0/vl.c
 ===================================================================
 --- qemu-0.14.0.orig/vl.c
diff --git a/meta/recipes-devtools/qemu/qemu-0.14.0/linker-flags.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/linker-flags.patch
index 470cf80..c0d1e55 100644
--- a/meta/recipes-devtools/qemu/qemu-0.14.0/linker-flags.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/linker-flags.patch
@@ -7,6 +7,9 @@ More information is available on the Fedora Wiki:
 https://fedoraproject.org/wiki/UnderstandingDSOLinkChange
 
 JL - 15/06/10
+
+Upstream-Status: Inappropriate [configuration]
+
 Index: qemu-0.14.0/Makefile.target
 ===================================================================
 --- qemu-0.14.0.orig/Makefile.target
diff --git a/meta/recipes-devtools/qemu/qemu-0.14.0/no-strip.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/no-strip.patch
index cf0d659..d6a4377 100644
--- a/meta/recipes-devtools/qemu/qemu-0.14.0/no-strip.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/no-strip.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: qemu-0.14.0/Makefile
 ===================================================================
 --- qemu-0.14.0.orig/Makefile
diff --git a/meta/recipes-devtools/qemu/qemu-0.14.0/opengl-sdl-fix.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/opengl-sdl-fix.patch
index 1f34f07..e73bb7b 100644
--- a/meta/recipes-devtools/qemu/qemu-0.14.0/opengl-sdl-fix.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/opengl-sdl-fix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 diff -u -r qemu-0.14.0/Makefile.target qemu-0.14.0-fixed/Makefile.target
 --- qemu-0.14.0/Makefile.target 2011-04-26 21:22:17.627637741 -0700
 +++ qemu-0.14.0-fixed/Makefile.target   2011-04-26 21:23:02.767637747 -0700
diff --git a/meta/recipes-devtools/qemu/qemu-0.14.0/qemu-git-qemugl-host.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/qemu-git-qemugl-host.patch
index 92467a7..bbc9c9e 100644
--- a/meta/recipes-devtools/qemu/qemu-0.14.0/qemu-git-qemugl-host.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/qemu-git-qemugl-host.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [other] - qemugl patch need huge changes for upstream
+
 Index: qemu-0.14.0/Makefile.target
 ===================================================================
 --- qemu-0.14.0.orig/Makefile.target
diff --git a/meta/recipes-devtools/qemu/qemu-0.14.0/qemu-vmware-vga-depth.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/qemu-vmware-vga-depth.patch
index 42ec98f..c4c5424 100644
--- a/meta/recipes-devtools/qemu/qemu-0.14.0/qemu-vmware-vga-depth.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/qemu-vmware-vga-depth.patch
@@ -1,6 +1,9 @@
 # fix VMware VGA driver depth calculation error, which may cause segmentation fault
 #
 # ktian1, 06/29/2010
+
+Upstream-Status: Pending
+
 Index: qemu-0.14.0/console.h
 ===================================================================
 --- qemu-0.14.0.orig/console.h
diff --git a/meta/recipes-devtools/qemu/qemu-0.14.0/qemugl-allow-glxcontext-release.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/qemugl-allow-glxcontext-release.patch
index 478b204..d808eaa 100644
--- a/meta/recipes-devtools/qemu/qemu-0.14.0/qemugl-allow-glxcontext-release.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/qemugl-allow-glxcontext-release.patch
@@ -10,6 +10,8 @@ committer Andrzej Zaborowski <andrew.zaborowski@intel.com> Tue, 16 Jun 2009 22:2
  target-i386/opengl_exec.c |   31 ++++++++++++++++---------------
  1 files changed, 16 insertions(+), 15 deletions(-)
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: qemu-0.14.0/target-i386/opengl_exec.c
 ===================================================================
 --- qemu-0.14.0.orig/target-i386/opengl_exec.c
diff --git a/meta/recipes-devtools/qemu/qemu-0.14.0/qemugl-fix.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/qemugl-fix.patch
index 029aacf..76aae2f 100644
--- a/meta/recipes-devtools/qemu/qemu-0.14.0/qemugl-fix.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/qemugl-fix.patch
@@ -9,6 +9,8 @@ Upstream-Status: other (logical part of qemu-git-qemugl-host.patch)
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
 
+Upstream-Status: Inappropriate [other] - depends on qemu gl patch
+
 Index: qemu-0.14.0/target-i386/opengl_func.h
 ===================================================================
 --- qemu-0.14.0.orig/target-i386/opengl_func.h	2011-04-08 16:43:46.000000000 +0800
diff --git a/meta/recipes-devtools/qemu/qemu-0.14.0/spice-qxl-locking-fix-for-qemu-kvm.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/spice-qxl-locking-fix-for-qemu-kvm.patch
index 87d5927..4113fc2 100644
--- a/meta/recipes-devtools/qemu/qemu-0.14.0/spice-qxl-locking-fix-for-qemu-kvm.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/spice-qxl-locking-fix-for-qemu-kvm.patch
@@ -3,6 +3,8 @@ Author: Gerd Hoffmann <kraxel@redhat.com>
 Source: upstream, http://patchwork.ozlabs.org/patch/84704/
 Forwarding: not-needed
 
+Upstream-Status: Pending
+
 Index: qemu-0.14.0/hw/qxl.c
 ===================================================================
 --- qemu-0.14.0.orig/hw/qxl.c
diff --git a/meta/recipes-extended/ed/ed-1.5/ed-1.2-build.patch b/meta/recipes-extended/ed/ed-1.5/ed-1.2-build.patch
index 4c92aa2..d30b393 100644
--- a/meta/recipes-extended/ed/ed-1.5/ed-1.2-build.patch
+++ b/meta/recipes-extended/ed/ed-1.5/ed-1.2-build.patch
@@ -9,6 +9,8 @@ http://lists.gnu.org/archive/html/bug-ed/2008-12/msg00001.html
 ed had already taken GPLv3 when this patch out, so it should be GPLv3.
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
 
+Upstream-Status: Pending
+
 Index: ed-1.5/configure
 ===================================================================
 --- ed-1.5.orig/configure	2010-08-30 07:34:49.000000000 -0700
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.22.1/configure_fix.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.22.1/configure_fix.patch
index bbf239c..b141690 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.22.1/configure_fix.patch
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.22.1/configure_fix.patch
@@ -4,6 +4,8 @@ This patch simple disables it.
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
 
+Upstream-Status: Inappropriate [embedded specific]
+
 Index: gdk-pixbuf-2.22.1/configure.ac
 ===================================================================
 --- gdk-pixbuf-2.22.1.orig/configure.ac	2010-11-25 16:26:41.000000000 +0800
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.22.1/hardcoded_libtool.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.22.1/hardcoded_libtool.patch
index ae16927..ecca62a 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.22.1/hardcoded_libtool.patch
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.22.1/hardcoded_libtool.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: gdk-pixbuf-2.22.1/configure.ac
 ===================================================================
 --- gdk-pixbuf-2.22.1.orig/configure.ac	2010-11-26 09:06:34.000000000 +0800
diff --git a/meta/recipes-gnome/gnome/gnome-common-2.28.0/omf.patch b/meta/recipes-gnome/gnome/gnome-common-2.28.0/omf.patch
index 0d85b00..0f9b13c 100644
--- a/meta/recipes-gnome/gnome/gnome-common-2.28.0/omf.patch
+++ b/meta/recipes-gnome/gnome/gnome-common-2.28.0/omf.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- gnome-common-2.4.0/doc-build/omf.make	2003-05-24 08:16:25.000000000 -0700
 +++ gnome-common-2.4.0.new/doc-build/omf.make	2004-11-15 14:01:12.185155192 -0700
 @@ -43,7 +43,9 @@
diff --git a/meta/recipes-gnome/gnome/gnome-icon-theme/iconpath-option.patch b/meta/recipes-gnome/gnome/gnome-icon-theme/iconpath-option.patch
index 8a16d00..f840fca 100644
--- a/meta/recipes-gnome/gnome/gnome-icon-theme/iconpath-option.patch
+++ b/meta/recipes-gnome/gnome/gnome-icon-theme/iconpath-option.patch
@@ -4,6 +4,9 @@ pkg-config will only search the target sysroot and we want the native script. Th
 patch adds an option to allow the path to the tool to be specified.
 
 RP - 12/8/10"
+
+Upstream-Status: Pending
+
 Index: gnome-icon-theme-2.31.0/configure.ac
 ===================================================================
 --- gnome-icon-theme-2.31.0.orig/configure.ac	2010-12-01 11:00:22.000000000 +0800
diff --git a/meta/recipes-gnome/gnome/gnome-mime-data/pkgconfig.patch b/meta/recipes-gnome/gnome/gnome-mime-data/pkgconfig.patch
index de287e5..0903425 100644
--- a/meta/recipes-gnome/gnome/gnome-mime-data/pkgconfig.patch
+++ b/meta/recipes-gnome/gnome/gnome-mime-data/pkgconfig.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: gnome-mime-data-2.18.0/Makefile.am
 ===================================================================
 --- gnome-mime-data-2.18.0.orig/Makefile.am	2009-06-11 17:27:48.000000000 +0100
diff --git a/meta/recipes-gnome/gnome/metacity/crosscompile.patch b/meta/recipes-gnome/gnome/metacity/crosscompile.patch
index 8d86134..7a1942a 100644
--- a/meta/recipes-gnome/gnome/metacity/crosscompile.patch
+++ b/meta/recipes-gnome/gnome/metacity/crosscompile.patch
@@ -3,6 +3,8 @@ rather than target binary in cross-compile environment.
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
 
+Upstream-Status: Inappropriate [embedded specific]
+
 Index: metacity-2.30.3/src/Makefile.am
 ===================================================================
 --- metacity-2.30.3.orig/src/Makefile.am	2010-09-05 00:09:52.000000000 +0800
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.12.7/cellrenderer-cairo.patch b/meta/recipes-gnome/gtk+/gtk+-2.12.7/cellrenderer-cairo.patch
index 4439e69..2524b99 100644
--- a/meta/recipes-gnome/gtk+/gtk+-2.12.7/cellrenderer-cairo.patch
+++ b/meta/recipes-gnome/gtk+/gtk+-2.12.7/cellrenderer-cairo.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: gtk/gtkcellrenderer.c
 ===================================================================
 RCS file: /cvs/gnome/gtk+/gtk/gtkcellrenderer.c,v
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.12.7/combo-arrow-size.patch b/meta/recipes-gnome/gtk+/gtk+-2.12.7/combo-arrow-size.patch
index d44c454..62d2355 100644
--- a/meta/recipes-gnome/gtk+/gtk+-2.12.7/combo-arrow-size.patch
+++ b/meta/recipes-gnome/gtk+/gtk+-2.12.7/combo-arrow-size.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [enable feature]
+
 Index: gtk/gtkcombobox.c
 ===================================================================
 RCS file: /cvs/gnome/gtk+/gtk/gtkcombobox.c,v
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.12.7/disable-print.patch b/meta/recipes-gnome/gtk+/gtk+-2.12.7/disable-print.patch
index 13cbd91..78903cf 100644
--- a/meta/recipes-gnome/gtk+/gtk+-2.12.7/disable-print.patch
+++ b/meta/recipes-gnome/gtk+/gtk+-2.12.7/disable-print.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 --- gtk+-2.12.0/configure.in~	2006-07-05 18:11:44.000000000 +0200
 +++ gtk+-2.12.0/configure.in	2006-07-05 18:11:44.000000000 +0200
 @@ -1554,22 +1554 @@
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.12.7/entry-cairo.patch b/meta/recipes-gnome/gtk+/gtk+-2.12.7/entry-cairo.patch
index 3313e7f..3083b77 100644
--- a/meta/recipes-gnome/gtk+/gtk+-2.12.7/entry-cairo.patch
+++ b/meta/recipes-gnome/gtk+/gtk+-2.12.7/entry-cairo.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: gtk/gtkentry.c
 ===================================================================
 RCS file: /cvs/gnome/gtk+/gtk/gtkentry.c,v
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.12.7/filechooser-default.patch b/meta/recipes-gnome/gtk+/gtk+-2.12.7/filechooser-default.patch
index 146316c..816594f 100644
--- a/meta/recipes-gnome/gtk+/gtk+-2.12.7/filechooser-default.patch
+++ b/meta/recipes-gnome/gtk+/gtk+-2.12.7/filechooser-default.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [enable feature]
+
 Index: gtk+-2.12.5/gtk/gtkfilechooserdefault.c
 ================ ===================================================
 --- gtk+-2.12.5/gtk/gtkfilechooserdefault.c	(revision 19337)
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.12.7/filechooser-sizefix.patch b/meta/recipes-gnome/gtk+/gtk+-2.12.7/filechooser-sizefix.patch
index 694b059..0973eca 100644
--- a/meta/recipes-gnome/gtk+/gtk+-2.12.7/filechooser-sizefix.patch
+++ b/meta/recipes-gnome/gtk+/gtk+-2.12.7/filechooser-sizefix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [enable feature]
+
 --- gtk+-2.12.7.orig/gtk/gtkfilechooserdialog.c 
 +++ gtk+-2.12.7/gtk/gtkfilechooserdialog.c 
 @@ -165,10 +165,10 @@
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.12.7/filesystem-volumes.patch b/meta/recipes-gnome/gtk+/gtk+-2.12.7/filesystem-volumes.patch
index 826fd6b..3330f7b 100644
--- a/meta/recipes-gnome/gtk+/gtk+-2.12.7/filesystem-volumes.patch
+++ b/meta/recipes-gnome/gtk+/gtk+-2.12.7/filesystem-volumes.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [enable feature]
+
 Index: gtk+-2.12.3/gtk/gtkfilesystemunix.c
 ===================================================================
 --- gtk+-2.12.3.orig/gtk/gtkfilesystemunix.c	2007-12-04 16:52:08.000000000 +0000
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.12.7/gtklabel-resize-patch b/meta/recipes-gnome/gtk+/gtk+-2.12.7/gtklabel-resize-patch
index df29656..40af10c 100644
--- a/meta/recipes-gnome/gtk+/gtk+-2.12.7/gtklabel-resize-patch
+++ b/meta/recipes-gnome/gtk+/gtk+-2.12.7/gtklabel-resize-patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- gtk+-2.4.3/gtk/gtklabel.c~	2004-06-11 13:50:34.000000000 +0100
 +++ gtk+-2.4.3/gtk/gtklabel.c	2004-07-05 13:33:57.000000000 +0100
 @@ -1623,6 +1623,7 @@
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.12.7/hardcoded_libtool.patch b/meta/recipes-gnome/gtk+/gtk+-2.12.7/hardcoded_libtool.patch
index 1c2cd05..09ced4b 100644
--- a/meta/recipes-gnome/gtk+/gtk+-2.12.7/hardcoded_libtool.patch
+++ b/meta/recipes-gnome/gtk+/gtk+-2.12.7/hardcoded_libtool.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [embedded specific]
+
 --- /tmp/configure.in	2007-01-08 17:50:49.000000000 +0100
 +++ gtk+-2.10.7/configure.in	2007-01-08 17:52:33.495251000 +0100
 @@ -371,7 +371,7 @@
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.12.7/menu-deactivate.patch b/meta/recipes-gnome/gtk+/gtk+-2.12.7/menu-deactivate.patch
index cfb8849..e8bc370 100644
--- a/meta/recipes-gnome/gtk+/gtk+-2.12.7/menu-deactivate.patch
+++ b/meta/recipes-gnome/gtk+/gtk+-2.12.7/menu-deactivate.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [enable feature]
+
 --- gtk+-2.10.0/gtk/gtkmenushell.c.orig	2006-07-05 17:17:34.000000000 +0200
 +++ gtk+-2.10.0/gtk/gtkmenushell.c	2006-07-05 17:19:01.000000000 +0200
 @@ -42,7 +42,7 @@
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.12.7/no-demos.patch b/meta/recipes-gnome/gtk+/gtk+-2.12.7/no-demos.patch
index 0fc4c48..67d4f74 100644
--- a/meta/recipes-gnome/gtk+/gtk+-2.12.7/no-demos.patch
+++ b/meta/recipes-gnome/gtk+/gtk+-2.12.7/no-demos.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 --- gtk+-2.10.1/Makefile.am.orig	2006-08-08 12:37:30.000000000 +0100
 +++ gtk+-2.10.1/Makefile.am	2006-08-08 12:37:48.000000000 +0100
 @@ -1,6 +1,6 @@
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.12.7/pangoxft2.10.6.diff b/meta/recipes-gnome/gtk+/gtk+-2.12.7/pangoxft2.10.6.diff
index 63828ce..fa5e4fc 100644
--- a/meta/recipes-gnome/gtk+/gtk+-2.12.7/pangoxft2.10.6.diff
+++ b/meta/recipes-gnome/gtk+/gtk+-2.12.7/pangoxft2.10.6.diff
@@ -13,6 +13,8 @@ performance figures compared to GTK+ 2.10.6 with pangocairo too
 a python/cairo script to get some nice graphics from a torture test
 session with several GTK+s, hope to get it ready soon.
 
+Upstream-Status: Inappropriate [enable feature]
+
 Index: gtk+-2.10.6/configure.in
 ===================================================================
 --- gtk+-2.10.6.orig/configure.in	2006-10-30 12:59:28.000000000 +0000
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.12.7/range-no-redraw.patch b/meta/recipes-gnome/gtk+/gtk+-2.12.7/range-no-redraw.patch
index 14387b8..d577dc6 100644
--- a/meta/recipes-gnome/gtk+/gtk+-2.12.7/range-no-redraw.patch
+++ b/meta/recipes-gnome/gtk+/gtk+-2.12.7/range-no-redraw.patch
@@ -1,4 +1,7 @@
 5f084ea0849d5967a3c22821542ecaaa8accb398
+
+Upstream-Status: Inappropriate [enable feature]
+
 diff --git a/gtk/gtkrange.c b/gtk/gtkrange.c
 index bd95351..64e0e59 100644
 --- gtk/gtkrange.c
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.12.7/run-iconcache.patch b/meta/recipes-gnome/gtk+/gtk+-2.12.7/run-iconcache.patch
index ac15e9a..f35884c 100644
--- a/meta/recipes-gnome/gtk+/gtk+-2.12.7/run-iconcache.patch
+++ b/meta/recipes-gnome/gtk+/gtk+-2.12.7/run-iconcache.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 --- /tmp/Makefile.am	2007-01-08 17:44:47.000000000 +0100
 +++ gtk+-2.10.7/gtk/Makefile.am	2007-01-08 17:45:17.025251000 +0100
 @@ -1128,11 +1128,11 @@
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.12.7/scrolled-placement.patch b/meta/recipes-gnome/gtk+/gtk+-2.12.7/scrolled-placement.patch
index a0b50c8..1e3ab52 100644
--- a/meta/recipes-gnome/gtk+/gtk+-2.12.7/scrolled-placement.patch
+++ b/meta/recipes-gnome/gtk+/gtk+-2.12.7/scrolled-placement.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [enable feature]
+
 Index: gdk/x11/gdksettings.c
 ===================================================================
 --- gdk/x11/gdksettings.c	(revision 18493)
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.12.7/toggle-font.diff b/meta/recipes-gnome/gtk+/gtk+-2.12.7/toggle-font.diff
index 59ad150..e1050bd 100644
--- a/meta/recipes-gnome/gtk+/gtk+-2.12.7/toggle-font.diff
+++ b/meta/recipes-gnome/gtk+/gtk+-2.12.7/toggle-font.diff
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: gtk/gtkcellrenderertoggle.c
 ===================================================================
 --- gtk/gtkcellrenderertoggle.c	(revision 18523)
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.12.7/xsettings.patch b/meta/recipes-gnome/gtk+/gtk+-2.12.7/xsettings.patch
index b63e262..98d3353 100644
--- a/meta/recipes-gnome/gtk+/gtk+-2.12.7/xsettings.patch
+++ b/meta/recipes-gnome/gtk+/gtk+-2.12.7/xsettings.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- gtk+-2.4.4/gdk/x11/gdkevents-x11.c.old	Sun Aug 22 17:14:00 2004
 +++ gtk+-2.4.4/gdk/x11/gdkevents-x11.c	Sun Aug 22 17:14:00 2004
 @@ -2827,10 +2827,9 @@
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.16.6/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch b/meta/recipes-gnome/gtk+/gtk+-2.16.6/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch
index e0d6ab9..7d39a77 100644
--- a/meta/recipes-gnome/gtk+/gtk+-2.16.6/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch
+++ b/meta/recipes-gnome/gtk+/gtk+-2.16.6/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch
@@ -13,6 +13,8 @@ since the internal value is returned without being duplicated.
  gtk/gtkrecentmanager.c |    2 +-
  1 files changed, 1 insertions(+), 1 deletions(-)
 
+Upstream-Status: Pending
+
 diff --git a/gtk/gtkrecentmanager.c b/gtk/gtkrecentmanager.c
 index 317b3d5..d062572 100644
 --- a/gtk/gtkrecentmanager.c
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.16.6/cellrenderer-cairo.patch b/meta/recipes-gnome/gtk+/gtk+-2.16.6/cellrenderer-cairo.patch
index 4439e69..2524b99 100644
--- a/meta/recipes-gnome/gtk+/gtk+-2.16.6/cellrenderer-cairo.patch
+++ b/meta/recipes-gnome/gtk+/gtk+-2.16.6/cellrenderer-cairo.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: gtk/gtkcellrenderer.c
 ===================================================================
 RCS file: /cvs/gnome/gtk+/gtk/gtkcellrenderer.c,v
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.16.6/disable-gio-png-sniff-test.diff b/meta/recipes-gnome/gtk+/gtk+-2.16.6/disable-gio-png-sniff-test.diff
index 5c64ac0..c777b8e 100644
--- a/meta/recipes-gnome/gtk+/gtk+-2.16.6/disable-gio-png-sniff-test.diff
+++ b/meta/recipes-gnome/gtk+/gtk+-2.16.6/disable-gio-png-sniff-test.diff
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [embedded specific]
+
 Index: gtk+-2.14.2/configure.in
 ===================================================================
 --- gtk+-2.14.2.orig/configure.in	2008-09-23 16:32:42.000000000 +0100
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.16.6/entry-cairo.patch b/meta/recipes-gnome/gtk+/gtk+-2.16.6/entry-cairo.patch
index 3313e7f..3083b77 100644
--- a/meta/recipes-gnome/gtk+/gtk+-2.16.6/entry-cairo.patch
+++ b/meta/recipes-gnome/gtk+/gtk+-2.16.6/entry-cairo.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: gtk/gtkentry.c
 ===================================================================
 RCS file: /cvs/gnome/gtk+/gtk/gtkentry.c,v
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.16.6/hardcoded_libtool.patch b/meta/recipes-gnome/gtk+/gtk+-2.16.6/hardcoded_libtool.patch
index 82fbbac..e5bbe73 100644
--- a/meta/recipes-gnome/gtk+/gtk+-2.16.6/hardcoded_libtool.patch
+++ b/meta/recipes-gnome/gtk+/gtk+-2.16.6/hardcoded_libtool.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [embedded specific]
+
 Index: gtk+-2.14.2/configure.in
 ===================================================================
 --- gtk+-2.14.2.orig/configure.in	2008-09-23 15:52:44.000000000 +0100
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.16.6/no-demos.patch b/meta/recipes-gnome/gtk+/gtk+-2.16.6/no-demos.patch
index 0fc4c48..67d4f74 100644
--- a/meta/recipes-gnome/gtk+/gtk+-2.16.6/no-demos.patch
+++ b/meta/recipes-gnome/gtk+/gtk+-2.16.6/no-demos.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 --- gtk+-2.10.1/Makefile.am.orig	2006-08-08 12:37:30.000000000 +0100
 +++ gtk+-2.10.1/Makefile.am	2006-08-08 12:37:48.000000000 +0100
 @@ -1,6 +1,6 @@
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.16.6/run-iconcache.patch b/meta/recipes-gnome/gtk+/gtk+-2.16.6/run-iconcache.patch
index ac15e9a..f35884c 100644
--- a/meta/recipes-gnome/gtk+/gtk+-2.16.6/run-iconcache.patch
+++ b/meta/recipes-gnome/gtk+/gtk+-2.16.6/run-iconcache.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 --- /tmp/Makefile.am	2007-01-08 17:44:47.000000000 +0100
 +++ gtk+-2.10.7/gtk/Makefile.am	2007-01-08 17:45:17.025251000 +0100
 @@ -1128,11 +1128,11 @@
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.16.6/toggle-font.diff b/meta/recipes-gnome/gtk+/gtk+-2.16.6/toggle-font.diff
index 59ad150..e1050bd 100644
--- a/meta/recipes-gnome/gtk+/gtk+-2.16.6/toggle-font.diff
+++ b/meta/recipes-gnome/gtk+/gtk+-2.16.6/toggle-font.diff
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: gtk/gtkcellrenderertoggle.c
 ===================================================================
 --- gtk/gtkcellrenderertoggle.c	(revision 18523)
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.16.6/xsettings.patch b/meta/recipes-gnome/gtk+/gtk+-2.16.6/xsettings.patch
index b63e262..98d3353 100644
--- a/meta/recipes-gnome/gtk+/gtk+-2.16.6/xsettings.patch
+++ b/meta/recipes-gnome/gtk+/gtk+-2.16.6/xsettings.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- gtk+-2.4.4/gdk/x11/gdkevents-x11.c.old	Sun Aug 22 17:14:00 2004
 +++ gtk+-2.4.4/gdk/x11/gdkevents-x11.c	Sun Aug 22 17:14:00 2004
 @@ -2827,10 +2827,9 @@
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.22.1/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch b/meta/recipes-gnome/gtk+/gtk+-2.22.1/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch
index ee55f9c..354f0ab 100644
--- a/meta/recipes-gnome/gtk+/gtk+-2.22.1/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch
+++ b/meta/recipes-gnome/gtk+/gtk+-2.22.1/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch
@@ -13,6 +13,8 @@ since the internal value is returned without being duplicated.
  gtk/gtkrecentmanager.c |    2 +-
  1 files changed, 1 insertions(+), 1 deletions(-)
 
+Upstream-Status: Pending
+
 Index: gtk+-2.21.2/gtk/gtkrecentmanager.c
 ===================================================================
 --- gtk+-2.21.2.orig/gtk/gtkrecentmanager.c	2010-06-22 18:11:30.000000000 +0800
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.22.1/cellrenderer-cairo.patch b/meta/recipes-gnome/gtk+/gtk+-2.22.1/cellrenderer-cairo.patch
index 92ce643..ba89329 100644
--- a/meta/recipes-gnome/gtk+/gtk+-2.22.1/cellrenderer-cairo.patch
+++ b/meta/recipes-gnome/gtk+/gtk+-2.22.1/cellrenderer-cairo.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: gtk/gtkcellrenderer.c
 ===================================================================
 --- gtk/gtkcellrenderer.c.orig	2010-06-22 17:21:22.000000000 +0800
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.22.1/configurefix.patch b/meta/recipes-gnome/gtk+/gtk+-2.22.1/configurefix.patch
index 7f6c73b..2803691 100644
--- a/meta/recipes-gnome/gtk+/gtk+-2.22.1/configurefix.patch
+++ b/meta/recipes-gnome/gtk+/gtk+-2.22.1/configurefix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: gtk+-2.21.2/docs/faq/Makefile.am
 ===================================================================
 --- gtk+-2.21.2.orig/docs/faq/Makefile.am	2010-04-09 10:29:53.000000000 +0800
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.22.1/doc-fixes.patch b/meta/recipes-gnome/gtk+/gtk+-2.22.1/doc-fixes.patch
index c2e3ae7..74e479f 100644
--- a/meta/recipes-gnome/gtk+/gtk+-2.22.1/doc-fixes.patch
+++ b/meta/recipes-gnome/gtk+/gtk+-2.22.1/doc-fixes.patch
@@ -5,6 +5,9 @@ embedded applications, just don't build them.
 Thanks to Joshua Lock for suggesting this approach.
 
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
+Upstream-Status: Inappropriate [embedded specific]
+
 diff -urN gtk+-2.22.1.orig/docs/Makefile.am gtk+-2.22.1/docs/Makefile.am
 --- gtk+-2.22.1.orig/docs/Makefile.am	2010-11-15 04:13:09.000000000 -0800
 +++ gtk+-2.22.1/docs/Makefile.am	2011-02-23 19:25:16.914815097 -0800
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.22.1/entry-cairo.patch b/meta/recipes-gnome/gtk+/gtk+-2.22.1/entry-cairo.patch
index 3313e7f..3083b77 100644
--- a/meta/recipes-gnome/gtk+/gtk+-2.22.1/entry-cairo.patch
+++ b/meta/recipes-gnome/gtk+/gtk+-2.22.1/entry-cairo.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: gtk/gtkentry.c
 ===================================================================
 RCS file: /cvs/gnome/gtk+/gtk/gtkentry.c,v
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.22.1/hardcoded_libtool.patch b/meta/recipes-gnome/gtk+/gtk+-2.22.1/hardcoded_libtool.patch
index 7937ef2..e32ce3f 100644
--- a/meta/recipes-gnome/gtk+/gtk+-2.22.1/hardcoded_libtool.patch
+++ b/meta/recipes-gnome/gtk+/gtk+-2.22.1/hardcoded_libtool.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [embedded specific]
+
 Index: gtk+-2.23.2/configure.in
 ===================================================================
 --- gtk+-2.23.2.orig/configure.in	2010-11-10 22:22:47.000000000 +0800
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.22.1/no-demos.patch b/meta/recipes-gnome/gtk+/gtk+-2.22.1/no-demos.patch
index 2170016..abd348e 100644
--- a/meta/recipes-gnome/gtk+/gtk+-2.22.1/no-demos.patch
+++ b/meta/recipes-gnome/gtk+/gtk+-2.22.1/no-demos.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: gtk+-2.23.2/Makefile.am
 ===================================================================
 --- gtk+-2.23.2.orig/Makefile.am	2010-11-10 20:34:42.000000000 +0800
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.22.1/run-iconcache.patch b/meta/recipes-gnome/gtk+/gtk+-2.22.1/run-iconcache.patch
index 518875e..597ba32 100644
--- a/meta/recipes-gnome/gtk+/gtk+-2.22.1/run-iconcache.patch
+++ b/meta/recipes-gnome/gtk+/gtk+-2.22.1/run-iconcache.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: gtk+-2.21.2/gtk/Makefile.am
 ===================================================================
 --- gtk+-2.21.2.orig/gtk/Makefile.am	2010-06-22 17:21:41.000000000 +0800
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.22.1/toggle-font.diff b/meta/recipes-gnome/gtk+/gtk+-2.22.1/toggle-font.diff
index 4853628..340d120 100644
--- a/meta/recipes-gnome/gtk+/gtk+-2.22.1/toggle-font.diff
+++ b/meta/recipes-gnome/gtk+/gtk+-2.22.1/toggle-font.diff
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: gtk/gtkcellrenderertoggle.c
 ===================================================================
 --- gtk/gtkcellrenderertoggle.c.orig	2010-06-22 18:11:33.000000000 +0800
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.22.1/xsettings.patch b/meta/recipes-gnome/gtk+/gtk+-2.22.1/xsettings.patch
index 84231e9..d0a970a 100644
--- a/meta/recipes-gnome/gtk+/gtk+-2.22.1/xsettings.patch
+++ b/meta/recipes-gnome/gtk+/gtk+-2.22.1/xsettings.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: gtk+-2.21.2/gdk/x11/gdkevents-x11.c
 ===================================================================
 --- gtk+-2.21.2.orig/gdk/x11/gdkevents-x11.c	2010-06-22 17:28:04.000000000 +0800
diff --git a/meta/recipes-gnome/libglade/libglade-2.6.4/glade-cruft.patch b/meta/recipes-gnome/libglade/libglade-2.6.4/glade-cruft.patch
index 0fceccf..c5d5864 100644
--- a/meta/recipes-gnome/libglade/libglade-2.6.4/glade-cruft.patch
+++ b/meta/recipes-gnome/libglade/libglade-2.6.4/glade-cruft.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff -ur libglade-2.4.0~/configure.in libglade-2.4.0/configure.in
 --- libglade-2.4.0~/configure.in	2004-05-17 12:38:31.000000000 +0100
 +++ libglade-2.4.0/configure.in	2004-07-28 16:53:09.000000000 +0100
diff --git a/meta/recipes-gnome/libglade/libglade-2.6.4/no-deprecation.patch b/meta/recipes-gnome/libglade/libglade-2.6.4/no-deprecation.patch
index 514c761..fdea2b0 100644
--- a/meta/recipes-gnome/libglade/libglade-2.6.4/no-deprecation.patch
+++ b/meta/recipes-gnome/libglade/libglade-2.6.4/no-deprecation.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 --- libglade-2.5.1/glade/Makefile.am.old	2006-04-25 21:03:25.000000000 +0100
 +++ libglade-2.5.1/glade/Makefile.am	2006-04-25 21:03:45.000000000 +0100
 @@ -30,10 +30,6 @@
diff --git a/meta/recipes-gnome/libglade/libglade-2.6.4/no-xml2.patch b/meta/recipes-gnome/libglade/libglade-2.6.4/no-xml2.patch
index 1c2e215..dc4c092 100644
--- a/meta/recipes-gnome/libglade/libglade-2.6.4/no-xml2.patch
+++ b/meta/recipes-gnome/libglade/libglade-2.6.4/no-xml2.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 diff -urN libglade-2.4.2.orig/configure.in libglade-2.4.2/configure.in
 --- libglade-2.4.2.orig/configure.in	2005-02-11 12:42:58.000000000 +0100
 +++ libglade-2.4.2/configure.in	2005-03-22 01:22:00.000000000 +0100
diff --git a/meta/recipes-graphics/clutter/clutter-gst/autofoo-0.4.patch b/meta/recipes-graphics/clutter/clutter-gst/autofoo-0.4.patch
index 4f2d50c..e22d2db 100644
--- a/meta/recipes-graphics/clutter/clutter-gst/autofoo-0.4.patch
+++ b/meta/recipes-graphics/clutter/clutter-gst/autofoo-0.4.patch
@@ -5,6 +5,8 @@ Upstream-Status: Inappropriate [not used]
  examples/Makefile.am      |    2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: clutter-gst/examples/Makefile.am
 ===================================================================
 --- clutter-gst.orig/examples/Makefile.am	2007-11-06 12:31:36.000000000 +0000
diff --git a/meta/recipes-graphics/clutter/clutter-gst/autofoo-9db4a61a25677764bb927369c5c68ada958fb65c.patch b/meta/recipes-graphics/clutter/clutter-gst/autofoo-9db4a61a25677764bb927369c5c68ada958fb65c.patch
index 2b43c80..8b3d84d 100644
--- a/meta/recipes-graphics/clutter/clutter-gst/autofoo-9db4a61a25677764bb927369c5c68ada958fb65c.patch
+++ b/meta/recipes-graphics/clutter/clutter-gst/autofoo-9db4a61a25677764bb927369c5c68ada958fb65c.patch
@@ -5,6 +5,8 @@ Upstream-Status: Inappropriate [not used]
  examples/Makefile.am      |    2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: clutter-gst/examples/Makefile.am
 ===================================================================
 --- clutter-gst.orig/examples/Makefile.am	2007-11-06 12:31:36.000000000 +0000
diff --git a/meta/recipes-graphics/clutter/clutter-gst/autofoo.patch b/meta/recipes-graphics/clutter/clutter-gst/autofoo.patch
index 7d50624..b557c6e 100644
--- a/meta/recipes-graphics/clutter/clutter-gst/autofoo.patch
+++ b/meta/recipes-graphics/clutter/clutter-gst/autofoo.patch
@@ -5,6 +5,8 @@ Upstream-Status: Inappropriate [not used]
  examples/Makefile.am      |    2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: git/examples/Makefile.am
 ===================================================================
 --- git.orig/examples/Makefile.am	2009-06-30 16:41:53.000000000 +0100
diff --git a/meta/recipes-graphics/clutter/clutter-gtk/disable_deprecated.patch b/meta/recipes-graphics/clutter/clutter-gtk/disable_deprecated.patch
index d11c34e..f44755b 100644
--- a/meta/recipes-graphics/clutter/clutter-gtk/disable_deprecated.patch
+++ b/meta/recipes-graphics/clutter/clutter-gtk/disable_deprecated.patch
@@ -4,6 +4,8 @@ This patch enables the macros that clutter-gtk is still using
 
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: git/clutter-gtk/Makefile.am
 ===================================================================
 --- git.orig/clutter-gtk/Makefile.am	2011-05-04 14:07:20.000000000 -0700
diff --git a/meta/recipes-graphics/clutter/clutter-gtk/enable_tests.patch b/meta/recipes-graphics/clutter/clutter-gtk/enable_tests.patch
index 8e3e552..bedf80e 100644
--- a/meta/recipes-graphics/clutter/clutter-gtk/enable_tests.patch
+++ b/meta/recipes-graphics/clutter/clutter-gtk/enable_tests.patch
@@ -2,6 +2,8 @@ Install the test binary needed for core-image-clutter
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: git/examples/Makefile.am
 ===================================================================
 --- git.orig/examples/Makefile.am	2011-05-04 14:07:20.000000000 -0700
diff --git a/meta/recipes-graphics/clutter/clutter/build-fix.patch b/meta/recipes-graphics/clutter/clutter/build-fix.patch
index 68cf84e..08c1845 100644
--- a/meta/recipes-graphics/clutter/clutter/build-fix.patch
+++ b/meta/recipes-graphics/clutter/clutter/build-fix.patch
@@ -2,6 +2,8 @@ Installing the same file twice causes an error in Automake 1.11
 
 JL 19/03/10
 
+Upstream-Status: Pending
+
 Index: git/clutter/Makefile.am
 ===================================================================
 --- git.orig/clutter/Makefile.am	2010-03-19 11:37:51.000000000 +0000
diff --git a/meta/recipes-graphics/clutter/clutter/enable_tests-0.6.patch b/meta/recipes-graphics/clutter/clutter/enable_tests-0.6.patch
index 544a7e5..8cff0c5 100644
--- a/meta/recipes-graphics/clutter/clutter/enable_tests-0.6.patch
+++ b/meta/recipes-graphics/clutter/clutter/enable_tests-0.6.patch
@@ -4,6 +4,8 @@
  tests/test-text.c   |    2 +-
  3 files changed, 8 insertions(+), 3 deletions(-)
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: clutter-0-6/tests/Makefile.am
 ===================================================================
 --- clutter.orig/tests/Makefile.am	2007-11-06 12:29:17.000000000 +0000
diff --git a/meta/recipes-graphics/clutter/clutter/enable_tests-0.8.patch b/meta/recipes-graphics/clutter/clutter/enable_tests-0.8.patch
index 4f449b1..d3c196f 100644
--- a/meta/recipes-graphics/clutter/clutter/enable_tests-0.8.patch
+++ b/meta/recipes-graphics/clutter/clutter/enable_tests-0.8.patch
@@ -4,6 +4,8 @@
  tests/test-text.c   |    2 +-
  3 files changed, 8 insertions(+), 3 deletions(-)
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: clutter/tests/Makefile.am
 ===================================================================
 --- clutter.orig/tests/Makefile.am	2008-06-26 16:46:26.000000000 +0100
diff --git a/meta/recipes-graphics/clutter/clutter/enable_tests-1.0.patch b/meta/recipes-graphics/clutter/clutter/enable_tests-1.0.patch
index 953edf6..16460b1 100644
--- a/meta/recipes-graphics/clutter/clutter/enable_tests-1.0.patch
+++ b/meta/recipes-graphics/clutter/clutter/enable_tests-1.0.patch
@@ -4,6 +4,8 @@
  tests/test-text.c   |    2 +-
  3 files changed, 8 insertions(+), 3 deletions(-)
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: git/tests/interactive/Makefile.am
 ===================================================================
 --- git.orig/tests/interactive/Makefile.am	2009-03-12 11:01:36.000000000 +0000
diff --git a/meta/recipes-graphics/clutter/clutter/enable_tests-1.4.patch b/meta/recipes-graphics/clutter/clutter/enable_tests-1.4.patch
index 52fdcb4..2ff7697 100644
--- a/meta/recipes-graphics/clutter/clutter/enable_tests-1.4.patch
+++ b/meta/recipes-graphics/clutter/clutter/enable_tests-1.4.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: git/tests/interactive/Makefile.am
 ===================================================================
 --- git.orig/tests/interactive/Makefile.am	2011-01-28 14:06:29.000000000 +0800
diff --git a/meta/recipes-graphics/clutter/clutter/enable_tests-654c26a1301c9bc5f8e3e5e3b68af5eb1b2e0673.patch b/meta/recipes-graphics/clutter/clutter/enable_tests-654c26a1301c9bc5f8e3e5e3b68af5eb1b2e0673.patch
index 953edf6..16460b1 100644
--- a/meta/recipes-graphics/clutter/clutter/enable_tests-654c26a1301c9bc5f8e3e5e3b68af5eb1b2e0673.patch
+++ b/meta/recipes-graphics/clutter/clutter/enable_tests-654c26a1301c9bc5f8e3e5e3b68af5eb1b2e0673.patch
@@ -4,6 +4,8 @@
  tests/test-text.c   |    2 +-
  3 files changed, 8 insertions(+), 3 deletions(-)
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: git/tests/interactive/Makefile.am
 ===================================================================
 --- git.orig/tests/interactive/Makefile.am	2009-03-12 11:01:36.000000000 +0000
diff --git a/meta/recipes-graphics/clutter/clutter/enable_tests.patch b/meta/recipes-graphics/clutter/clutter/enable_tests.patch
index f4af7c9..480b208 100644
--- a/meta/recipes-graphics/clutter/clutter/enable_tests.patch
+++ b/meta/recipes-graphics/clutter/clutter/enable_tests.patch
@@ -4,6 +4,8 @@
  tests/test-text.c   |    2 +-
  3 files changed, 8 insertions(+), 3 deletions(-)
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: git/tests/interactive/Makefile.am
 ===================================================================
 --- git.orig/tests/interactive/Makefile.am	2009-11-30 17:39:46.000000000 +0000
diff --git a/meta/recipes-graphics/clutter/clutter/symconflict.patch b/meta/recipes-graphics/clutter/clutter/symconflict.patch
index 7685c21..05f3d27 100644
--- a/meta/recipes-graphics/clutter/clutter/symconflict.patch
+++ b/meta/recipes-graphics/clutter/clutter/symconflict.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: git/tests/test-depth.c
 ===================================================================
 --- git.orig/tests/test-depth.c	2009-05-24 14:54:40.000000000 +0100
diff --git a/meta/recipes-graphics/clutter/clutter/test-conformance-fix.patch b/meta/recipes-graphics/clutter/clutter/test-conformance-fix.patch
index ce412ff..ccc6c2a 100644
--- a/meta/recipes-graphics/clutter/clutter/test-conformance-fix.patch
+++ b/meta/recipes-graphics/clutter/clutter/test-conformance-fix.patch
@@ -30,6 +30,8 @@ Date:   Mon Oct 11 16:16:45 2010 +0100
     
     http://bugzilla.clutter-project.org/show_bug.cgi?id=2363
 
+Upstream-Status: Backport
+
 diff --git a/tests/conform/Makefile.am b/tests/conform/Makefile.am
 index 3036639..1e723e7 100644
 --- a/tests/conform/Makefile.am
diff --git a/meta/recipes-graphics/libmatchbox/files/16bppfixes-2.patch b/meta/recipes-graphics/libmatchbox/files/16bppfixes-2.patch
index ab9cdc7..9bcd582 100644
--- a/meta/recipes-graphics/libmatchbox/files/16bppfixes-2.patch
+++ b/meta/recipes-graphics/libmatchbox/files/16bppfixes-2.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- libmatchbox/libmb/mbpixbuf.c.orig	2007-05-04 14:41:55.000000000 +0100
 +++ libmatchbox/libmb/mbpixbuf.c	2007-05-04 14:41:55.000000000 +0100
 @@ -710,46 +710,19 @@
diff --git a/meta/recipes-graphics/libmatchbox/files/16bppfixes.patch b/meta/recipes-graphics/libmatchbox/files/16bppfixes.patch
index 09a0347..284318c 100644
--- a/meta/recipes-graphics/libmatchbox/files/16bppfixes.patch
+++ b/meta/recipes-graphics/libmatchbox/files/16bppfixes.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: libmb/mbpixbuf.c
 ===================================================================
 --- libmatchbox/libmb.orig/mbpixbuf.c	2006-02-01 12:45:55.000000000 +0000
diff --git a/meta/recipes-graphics/libmatchbox/files/autofoo.patch b/meta/recipes-graphics/libmatchbox/files/autofoo.patch
index ad3be57..78849a4 100644
--- a/meta/recipes-graphics/libmatchbox/files/autofoo.patch
+++ b/meta/recipes-graphics/libmatchbox/files/autofoo.patch
@@ -3,6 +3,8 @@
 # Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
 #
 
+Upstream-Status: Inappropriate [configuration]
+
 --- libmatchbox-1.5/configure.ac~autofoo	2004-12-21 12:56:46.000000000 -0500
 +++ libmatchbox-1.5/configure.ac	2005-01-18 16:40:04.421179624 -0500
 @@ -1,10 +1,10 @@
diff --git a/meta/recipes-graphics/libmatchbox/files/configure_fixes.patch b/meta/recipes-graphics/libmatchbox/files/configure_fixes.patch
index 083d32a..30fd67b 100644
--- a/meta/recipes-graphics/libmatchbox/files/configure_fixes.patch
+++ b/meta/recipes-graphics/libmatchbox/files/configure_fixes.patch
@@ -3,6 +3,8 @@
  libmb.pc.in  |    2 +-
  2 files changed, 8 insertions(+), 9 deletions(-)
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: libmatchbox-1.9/configure.ac
 ===================================================================
 --- libmatchbox-1.9.orig/configure.ac	2007-11-11 22:26:43.000000000 +0000
diff --git a/meta/recipes-graphics/libmatchbox/files/fix-configure-for-1.9.patch b/meta/recipes-graphics/libmatchbox/files/fix-configure-for-1.9.patch
index 990b738..2f147eb 100644
--- a/meta/recipes-graphics/libmatchbox/files/fix-configure-for-1.9.patch
+++ b/meta/recipes-graphics/libmatchbox/files/fix-configure-for-1.9.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 diff -urNd ../libmatchbox-1.6-r1/libmatchbox-1.6/configure.ac libmatchbox-1.6/configure.ac
 --- ../libmatchbox-1.6-r1/libmatchbox-1.6/configure.ac	2005-01-11 21:47:39 +00:00
 +++ libmatchbox-1.6/configure.ac	2005-03-14 03:06:25 +00:00
diff --git a/meta/recipes-graphics/libmatchbox/files/matchbox-start-fix.patch b/meta/recipes-graphics/libmatchbox/files/matchbox-start-fix.patch
index 04460a3..058342c 100644
--- a/meta/recipes-graphics/libmatchbox/files/matchbox-start-fix.patch
+++ b/meta/recipes-graphics/libmatchbox/files/matchbox-start-fix.patch
@@ -6,6 +6,8 @@ on x86-64. This patch forces a NULL pointer as terminator to fix it.
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
 
+Upstream-Status: Pending
+
 Index: libmatchbox-1.9/libmb/mbexp.c
 ===================================================================
 --- libmatchbox-1.9.orig/libmb/mbexp.c	2010-08-28 06:33:25.000000000 +0800
diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm/configure_fix.patch b/meta/recipes-graphics/matchbox-wm/matchbox-wm/configure_fix.patch
index 52cea0e..800bf3b 100644
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm/configure_fix.patch
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm/configure_fix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: matchbox-window-manager/configure.ac
 ===================================================================
 --- matchbox-window-manager.orig/configure.ac	2007-11-14 12:02:28.000000000 +0000
diff --git a/meta/recipes-graphics/mutter/mutter/crosscompile.patch b/meta/recipes-graphics/mutter/mutter/crosscompile.patch
index b27383b..da73e7b 100644
--- a/meta/recipes-graphics/mutter/mutter/crosscompile.patch
+++ b/meta/recipes-graphics/mutter/mutter/crosscompile.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [embedded specific]
+
 Index: git/configure.in
 ===================================================================
 --- git.orig/configure.in	2009-01-27 14:49:10.000000000 +0000
diff --git a/meta/recipes-graphics/mutter/mutter/fix_pkgconfig-7adb574bb3fa3880eb85dbc86e580cf3452d57c4.patch b/meta/recipes-graphics/mutter/mutter/fix_pkgconfig-7adb574bb3fa3880eb85dbc86e580cf3452d57c4.patch
index 3714383..695f94c 100644
--- a/meta/recipes-graphics/mutter/mutter/fix_pkgconfig-7adb574bb3fa3880eb85dbc86e580cf3452d57c4.patch
+++ b/meta/recipes-graphics/mutter/mutter/fix_pkgconfig-7adb574bb3fa3880eb85dbc86e580cf3452d57c4.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: git/src/metacity-plugins.pc.in
 ===================================================================
 --- git.orig/src/metacity-plugins.pc.in	2008-12-17 22:42:19.000000000 +0000
diff --git a/meta/recipes-graphics/mutter/mutter/fix_pkgconfig.patch b/meta/recipes-graphics/mutter/mutter/fix_pkgconfig.patch
index 5ac5ecc..de0dded 100644
--- a/meta/recipes-graphics/mutter/mutter/fix_pkgconfig.patch
+++ b/meta/recipes-graphics/mutter/mutter/fix_pkgconfig.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: git/src/mutter-plugins.pc.in
 ===================================================================
 --- git.orig/src/mutter-plugins.pc.in	2009-07-03 17:30:39.000000000 +0100
diff --git a/meta/recipes-graphics/mutter/mutter/nodocs.patch b/meta/recipes-graphics/mutter/mutter/nodocs.patch
index 98f43be..ceb0609 100644
--- a/meta/recipes-graphics/mutter/mutter/nodocs.patch
+++ b/meta/recipes-graphics/mutter/mutter/nodocs.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: git/Makefile.am
 ===================================================================
 --- git.orig/Makefile.am	2009-01-27 13:26:12.000000000 +0000
diff --git a/meta/recipes-graphics/mutter/mutter/nozenity.patch b/meta/recipes-graphics/mutter/mutter/nozenity.patch
index 06f5909..fa32b63 100644
--- a/meta/recipes-graphics/mutter/mutter/nozenity.patch
+++ b/meta/recipes-graphics/mutter/mutter/nozenity.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: git/configure.in
 ===================================================================
 --- git.orig/configure.in	2009-06-16 13:12:17.000000000 +0100
diff --git a/meta/recipes-graphics/tslib/tslib/32bitBE-support.patch b/meta/recipes-graphics/tslib/tslib/32bitBE-support.patch
index 3262f16..49232ef 100644
--- a/meta/recipes-graphics/tslib/tslib/32bitBE-support.patch
+++ b/meta/recipes-graphics/tslib/tslib/32bitBE-support.patch
@@ -5,6 +5,9 @@
 ## DP: See bug #496759 - being tested upstream for 32bit BE devices
 
 @DPATCH@
+
+Upstream-Status: Pending
+
 diff -urNad tslib-1.0~/plugins/input-raw.c tslib-1.0/plugins/input-raw.c
 --- tslib-1.0~/plugins/input-raw.c	2008-12-09 10:56:47.000000000 +0000
 +++ tslib-1.0/plugins/input-raw.c	2008-12-09 11:05:41.000000000 +0000
diff --git a/meta/recipes-graphics/tslib/tslib/fix_version.patch b/meta/recipes-graphics/tslib/tslib/fix_version.patch
index d6a0ebd..c3d658e 100644
--- a/meta/recipes-graphics/tslib/tslib/fix_version.patch
+++ b/meta/recipes-graphics/tslib/tslib/fix_version.patch
@@ -2,6 +2,8 @@
  configure.ac |   10 +++++-----
  1 file changed, 5 insertions(+), 5 deletions(-)
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: tslib-1.0/configure.ac
 ===================================================================
 --- tslib-1.0.orig/configure.ac	2006-08-24 22:02:55.000000000 +0100
diff --git a/meta/recipes-graphics/tslib/tslib/multievent.patch b/meta/recipes-graphics/tslib/tslib/multievent.patch
index 854e7af..e6803f5 100644
--- a/meta/recipes-graphics/tslib/tslib/multievent.patch
+++ b/meta/recipes-graphics/tslib/tslib/multievent.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- tslib/plugins/linear.c~multievent
 +++ tslib/plugins/linear.c
 @@ -39,14 +39,12 @@
diff --git a/meta/recipes-graphics/x11vnc/files/endian-fix.patch b/meta/recipes-graphics/x11vnc/files/endian-fix.patch
index 0b5e470..f2a538b 100644
--- a/meta/recipes-graphics/x11vnc/files/endian-fix.patch
+++ b/meta/recipes-graphics/x11vnc/files/endian-fix.patch
@@ -6,6 +6,8 @@ instead of LIBVNCSERVER_WORDS_BIGENDIAN, which cuase issue in mips.
 
 Signed-off-by: Yu Ke <ke.yu@intel.com>
 
+Upstream-Status: Pending
+
 diff --git a/libvncserver/main.c b/libvncserver/main.c
 index b6bd930..8bbb7bf 100644
 --- a/libvncserver/main.c
diff --git a/meta/recipes-graphics/x11vnc/files/starting-fix.patch b/meta/recipes-graphics/x11vnc/files/starting-fix.patch
index f59e801..11c55e6 100644
--- a/meta/recipes-graphics/x11vnc/files/starting-fix.patch
+++ b/meta/recipes-graphics/x11vnc/files/starting-fix.patch
@@ -3,6 +3,9 @@ Removing these 2 parameters makes x11vnc works well on poky sato image.
 
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
+
+Upstream-Status: Inappropriate [configuration]
+
 Index: x11vnc-0.9.12/x11vnc/x11vnc.desktop
 ===================================================================
 --- x11vnc-0.9.12.orig/x11vnc/x11vnc.desktop	2011-03-03 10:33:18.000000000 +0800
diff --git a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/fix_watch_cursor.patch b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/fix_watch_cursor.patch
index 73a5b2a..722bda3 100644
--- a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/fix_watch_cursor.patch
+++ b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/fix_watch_cursor.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 diff -NurP xcursor-transparent-theme-0.1.1-orig/cursors/Makefile.am xcursor-transparent-theme-0.1.1/cursors/Makefile.am
 --- xcursor-transparent-theme-0.1.1-orig/cursors/Makefile.am	2003-10-30 13:13:59.000000000 +0100
 +++ xcursor-transparent-theme-0.1.1/cursors/Makefile.am	2005-12-20 23:35:17.000000000 +0100
diff --git a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/use-relative-symlinks.patch b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/use-relative-symlinks.patch
index df28dfb..ae9640c 100644
--- a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/use-relative-symlinks.patch
+++ b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/use-relative-symlinks.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 diff -ur xcursor-transparent-theme-0.1.1~/cursors/Makefile.am xcursor-transparent-theme-0.1.1/cursors/Makefile.am
 --- xcursor-transparent-theme-0.1.1~/cursors/Makefile.am	2003-10-30 12:13:59.000000000 +0000
 +++ xcursor-transparent-theme-0.1.1/cursors/Makefile.am	2004-07-27 12:56:24.000000000 +0100
diff --git a/meta/recipes-graphics/xtscal/xtscal/change-cross.patch b/meta/recipes-graphics/xtscal/xtscal/change-cross.patch
index 3ecd36b..1da7717 100644
--- a/meta/recipes-graphics/xtscal/xtscal/change-cross.patch
+++ b/meta/recipes-graphics/xtscal/xtscal/change-cross.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- tmp/main.c.orig	2007-01-02 15:39:54.000000000 +0000
 +++ tmp/main.c	2007-01-02 15:39:54.000000000 +0000
 @@ -131,9 +131,10 @@
diff --git a/meta/recipes-graphics/xtscal/xtscal/cleanup.patch b/meta/recipes-graphics/xtscal/xtscal/cleanup.patch
index ce674ed..f7b0854 100644
--- a/meta/recipes-graphics/xtscal/xtscal/cleanup.patch
+++ b/meta/recipes-graphics/xtscal/xtscal/cleanup.patch
@@ -7,6 +7,8 @@
  xtscal.in    |   19 -----
  6 files changed, 14 insertions(+), 455 deletions(-)
 
+Upstream-Status: Pending
+
 Index: xtscal-0.6.3/xtscal.in
 ===================================================================
 --- xtscal-0.6.3.orig/xtscal.in	2004-09-10 20:10:36.000000000 +0100
diff --git a/meta/recipes-graphics/xtscal/xtscal/dso_linking_change_build_fix.patch b/meta/recipes-graphics/xtscal/xtscal/dso_linking_change_build_fix.patch
index 3ca14d7..3e4533f 100644
--- a/meta/recipes-graphics/xtscal/xtscal/dso_linking_change_build_fix.patch
+++ b/meta/recipes-graphics/xtscal/xtscal/dso_linking_change_build_fix.patch
@@ -10,6 +10,8 @@ This patch avoids this linking error:
 Nitin A Kamble <nitin.a.kamble@intel.com>
 Date: 2011/01/11
 
+Upstream-Status: Pending
+
 Index: xtscal-0.6.3/configure.ac
 ===================================================================
 --- xtscal-0.6.3.orig/configure.ac
diff --git a/meta/recipes-sato/eds/eds-dbus-2.20.0/no_iconv_test.patch b/meta/recipes-sato/eds/eds-dbus-2.20.0/no_iconv_test.patch
index 4a034b6..493b70d 100644
--- a/meta/recipes-sato/eds/eds-dbus-2.20.0/no_iconv_test.patch
+++ b/meta/recipes-sato/eds/eds-dbus-2.20.0/no_iconv_test.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: trunk/configure.in
 ===================================================================
 --- trunk.orig/configure.in	2005-09-28 17:34:08.000000000 +0000
diff --git a/meta/recipes-sato/eds/eds-dbus-2.20.0/oh-contact.patch b/meta/recipes-sato/eds/eds-dbus-2.20.0/oh-contact.patch
index e5c0f51..fd83b57 100644
--- a/meta/recipes-sato/eds/eds-dbus-2.20.0/oh-contact.patch
+++ b/meta/recipes-sato/eds/eds-dbus-2.20.0/oh-contact.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: addressbook/libedata-book/ximian-vcard.h
 ===================================================================
 --- addressbook/libedata-book/ximian-vcard.h	(revision 578)
diff --git a/meta/recipes-sato/eds/eds-dbus/new-contact-fix.patch b/meta/recipes-sato/eds/eds-dbus/new-contact-fix.patch
index d34cc55..22c293d 100644
--- a/meta/recipes-sato/eds/eds-dbus/new-contact-fix.patch
+++ b/meta/recipes-sato/eds/eds-dbus/new-contact-fix.patch
@@ -5,6 +5,8 @@ the data base if not exist, but use it without proper initialization.
 
 This patch fix it.
 
+Upstream-Status: Submitted
+
 Signed-off-by: Edwin Zhai <edwin.zhai@intel.com>
 Index: git/addressbook/backends/file/e-book-backend-file.c
 ===================================================================
diff --git a/meta/recipes-sato/eds/eds-dbus/nossl.patch b/meta/recipes-sato/eds/eds-dbus/nossl.patch
index 30568ff..67b6d07 100644
--- a/meta/recipes-sato/eds/eds-dbus/nossl.patch
+++ b/meta/recipes-sato/eds/eds-dbus/nossl.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [disable feature]
+
 Index: git/camel/Makefile.am
 ===================================================================
 --- git.orig/camel/Makefile.am	2010-02-05 15:25:09.000000000 +0000
diff --git a/meta/recipes-sato/eds/eds-dbus/oh-contact.patch b/meta/recipes-sato/eds/eds-dbus/oh-contact.patch
index fdd7e4b..9817991 100644
--- a/meta/recipes-sato/eds/eds-dbus/oh-contact.patch
+++ b/meta/recipes-sato/eds/eds-dbus/oh-contact.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: addressbook/libedata-book/ximian-vcard.h
 ===================================================================
 --- addressbook/libedata-book/ximian-vcard.h.orig	2010-02-05 14:57:14.000000000 +0000
diff --git a/meta/recipes-sato/eds/eds-dbus/old-gdk-api.patch b/meta/recipes-sato/eds/eds-dbus/old-gdk-api.patch
index 8b60069..7ef2956 100644
--- a/meta/recipes-sato/eds/eds-dbus/old-gdk-api.patch
+++ b/meta/recipes-sato/eds/eds-dbus/old-gdk-api.patch
@@ -3,6 +3,8 @@ This avoid build error due to defination missing.
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: git/configure.ac
 ===================================================================
 --- git.orig/configure.ac	2010-12-16 10:25:24.000000000 +0800
diff --git a/meta/recipes-sato/eds/eds-dbus/optional_imapx_provider.patch b/meta/recipes-sato/eds/eds-dbus/optional_imapx_provider.patch
index 128307a..d9b0940 100644
--- a/meta/recipes-sato/eds/eds-dbus/optional_imapx_provider.patch
+++ b/meta/recipes-sato/eds/eds-dbus/optional_imapx_provider.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [disable feature]
+
 Index: git/camel/providers/Makefile.am
 ===================================================================
 --- git.orig/camel/providers/Makefile.am	2010-07-06 18:49:34.000000000 +0800
diff --git a/meta/recipes-sato/eds/eds-dbus/parallelmake.patch b/meta/recipes-sato/eds/eds-dbus/parallelmake.patch
index 08cfac0..ee004a9 100644
--- a/meta/recipes-sato/eds/eds-dbus/parallelmake.patch
+++ b/meta/recipes-sato/eds/eds-dbus/parallelmake.patch
@@ -4,6 +4,8 @@ commit 6118d5891fee776a087855c335a73c79fdaf036c
 
 RP 16/3/10
 
+Upstream-Status: Pending
+
 Index: git/git.mk
 ===================================================================
 --- git.orig/git.mk	2010-02-05 14:57:15.000000000 +0000
diff --git a/meta/recipes-sato/leafpad/files/owl-menu.patch b/meta/recipes-sato/leafpad/files/owl-menu.patch
index acfc880..2ebf74a 100644
--- a/meta/recipes-sato/leafpad/files/owl-menu.patch
+++ b/meta/recipes-sato/leafpad/files/owl-menu.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [enable feature]
+
 --- tmp/src/menu.c.orig	2007-04-23 12:08:41.000000000 +0100
 +++ tmp/src/menu.c	2007-04-23 12:08:41.000000000 +0100
 @@ -152,7 +152,7 @@
diff --git a/meta/recipes-sato/matchbox-config-gtk/files/no-handed.patch b/meta/recipes-sato/matchbox-config-gtk/files/no-handed.patch
index 9ab51ec..8256949 100644
--- a/meta/recipes-sato/matchbox-config-gtk/files/no-handed.patch
+++ b/meta/recipes-sato/matchbox-config-gtk/files/no-handed.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: appearance/mb-appearance.c
 ===================================================================
 --- appearance/mb-appearance.c	(revision 1614)
diff --git a/meta/recipes-sato/matchbox-desktop/files/dso_linking_change_build_fix.patch b/meta/recipes-sato/matchbox-desktop/files/dso_linking_change_build_fix.patch
index 54f3670..0edb55e 100644
--- a/meta/recipes-sato/matchbox-desktop/files/dso_linking_change_build_fix.patch
+++ b/meta/recipes-sato/matchbox-desktop/files/dso_linking_change_build_fix.patch
@@ -11,6 +11,8 @@ This patch avoids this linking error:
 Nitin A Kamble <nitin.a.kamble@intel.com>
 Date: 2011/01/11
 
+Upstream-Status: Pending
+
 Index: matchbox-desktop-2/configure.ac
 ===================================================================
 --- matchbox-desktop-2.orig/configure.ac
diff --git a/meta/recipes-sato/matchbox-desktop/files/window-resize-fix.patch b/meta/recipes-sato/matchbox-desktop/files/window-resize-fix.patch
index 87fbd50..8970ac8 100644
--- a/meta/recipes-sato/matchbox-desktop/files/window-resize-fix.patch
+++ b/meta/recipes-sato/matchbox-desktop/files/window-resize-fix.patch
@@ -16,6 +16,8 @@ Date:   Sun Mar 6 17:58:45 2011 +0800
     
     Signed-off-by: Yu Ke <ke.yu@intel.com>
 
+Upstream-Status: Pending
+
 diff --git a/src/desktop.c b/src/desktop.c
 index d4fc2fb..5aa2cfc 100644
 --- a/src/desktop.c
diff --git a/meta/recipes-sato/matchbox-keyboard/files/configure_fix.patch b/meta/recipes-sato/matchbox-keyboard/files/configure_fix.patch
index 52cea0e..800bf3b 100644
--- a/meta/recipes-sato/matchbox-keyboard/files/configure_fix.patch
+++ b/meta/recipes-sato/matchbox-keyboard/files/configure_fix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: matchbox-window-manager/configure.ac
 ===================================================================
 --- matchbox-window-manager.orig/configure.ac	2007-11-14 12:02:28.000000000 +0000
diff --git a/meta/recipes-sato/matchbox-keyboard/files/single-instance.patch b/meta/recipes-sato/matchbox-keyboard/files/single-instance.patch
index d0adc47..18b6c41 100644
--- a/meta/recipes-sato/matchbox-keyboard/files/single-instance.patch
+++ b/meta/recipes-sato/matchbox-keyboard/files/single-instance.patch
@@ -9,6 +9,7 @@ on demand.
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
 
+Upstream-Status: Inappropriate [configuration]
 
 Index: matchbox-keyboard/matchbox-keyboard.desktop
 ===================================================================
diff --git a/meta/recipes-sato/matchbox-panel-2/gcc-4.6.0-compile.patch b/meta/recipes-sato/matchbox-panel-2/gcc-4.6.0-compile.patch
index 54ca74d..71a4727 100644
--- a/meta/recipes-sato/matchbox-panel-2/gcc-4.6.0-compile.patch
+++ b/meta/recipes-sato/matchbox-panel-2/gcc-4.6.0-compile.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [other] - need clean up
+
 diff -ur git.ORIG/applets/startup/startup.c git/applets/startup/startup.c
 --- git.ORIG/applets/startup/startup.c	2011-04-28 08:13:25.000000000 -0600
 +++ git/applets/startup/startup.c	2011-04-28 09:36:48.521990746 -0600
diff --git a/meta/recipes-sato/matchbox-panel-2/startup_fix.diff b/meta/recipes-sato/matchbox-panel-2/startup_fix.diff
index 9262d33..d9a0876 100644
--- a/meta/recipes-sato/matchbox-panel-2/startup_fix.diff
+++ b/meta/recipes-sato/matchbox-panel-2/startup_fix.diff
@@ -2,6 +2,8 @@ Fixed the compile error caused by typo, upstream also need this.
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
 
+Upstream-Status: Pending
+
 Index: matchbox-panel-2/applets/startup/startup.c
 ===================================================================
 --- matchbox-panel-2/applets/startup/startup.c	(revision 2109)
diff --git a/meta/recipes-sato/matchbox-stroke/files/configure_fix.patch b/meta/recipes-sato/matchbox-stroke/files/configure_fix.patch
index 52cea0e..800bf3b 100644
--- a/meta/recipes-sato/matchbox-stroke/files/configure_fix.patch
+++ b/meta/recipes-sato/matchbox-stroke/files/configure_fix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: matchbox-window-manager/configure.ac
 ===================================================================
 --- matchbox-window-manager.orig/configure.ac	2007-11-14 12:02:28.000000000 +0000
diff --git a/meta/recipes-sato/matchbox-stroke/files/dso_linking_change_build_fix.patch b/meta/recipes-sato/matchbox-stroke/files/dso_linking_change_build_fix.patch
index dd45341..cbfa7de 100644
--- a/meta/recipes-sato/matchbox-stroke/files/dso_linking_change_build_fix.patch
+++ b/meta/recipes-sato/matchbox-stroke/files/dso_linking_change_build_fix.patch
@@ -13,6 +13,7 @@ This patch avoids these linking errors:
 Nitin A Kamble <nitin.a.kamble@intel.com>
 Date: 2011/01/11
 
+Upstream-Status: Pending
 
 Index: matchbox-stroke/configure.ac
 ===================================================================
diff --git a/meta/recipes-sato/matchbox-stroke/files/single-instance.patch b/meta/recipes-sato/matchbox-stroke/files/single-instance.patch
index f4fec07..239aadb 100644
--- a/meta/recipes-sato/matchbox-stroke/files/single-instance.patch
+++ b/meta/recipes-sato/matchbox-stroke/files/single-instance.patch
@@ -6,6 +6,7 @@ in matchbox-desktop.
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
 
+Upstream-Status: Inappropriate [configuration]
 
 Index: matchbox-stroke/matchbox-stroke.desktop
 ===================================================================
diff --git a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato-2/png_rename.patch b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato-2/png_rename.patch
index b12e920..d8f264f 100644
--- a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato-2/png_rename.patch
+++ b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato-2/png_rename.patch
@@ -2,6 +2,8 @@ Background Image name was changed from background.png to template.png
 
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
 
+Upstream-Status: Pending
+
 Index: matchbox-sato/Sato/matchbox2/Makefile.am
 ===================================================================
 --- matchbox-sato.orig/Sato/matchbox2/Makefile.am	2010-12-29 13:08:43.000000000 -0800
diff --git a/meta/recipes-sato/owl-video-widget/libowl-av/gst_change_state.patch b/meta/recipes-sato/owl-video-widget/libowl-av/gst_change_state.patch
index cc09587..5bc279a 100644
--- a/meta/recipes-sato/owl-video-widget/libowl-av/gst_change_state.patch
+++ b/meta/recipes-sato/owl-video-widget/libowl-av/gst_change_state.patch
@@ -9,6 +9,8 @@ We will revisit it in next period.
 
 Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
 
+Upstream-Status: Pending
+
 diff -ruN libowl-av-orig/libowl-av/owl-tag-reader.c libowl-av/libowl-av/owl-tag-reader.c
 --- libowl-av-orig/libowl-av/owl-tag-reader.c	2010-10-12 14:30:26.000000000 +0800
 +++ libowl-av/libowl-av/owl-tag-reader.c	2010-10-12 14:32:39.000000000 +0800
diff --git a/meta/recipes-sato/owl-video-widget/libowl-av/make-382.patch b/meta/recipes-sato/owl-video-widget/libowl-av/make-382.patch
index 6ba37fb..a8be781 100644
--- a/meta/recipes-sato/owl-video-widget/libowl-av/make-382.patch
+++ b/meta/recipes-sato/owl-video-widget/libowl-av/make-382.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: libowl-av/Makefile.am
 ===================================================================
 --- libowl-av.orig/Makefile.am
diff --git a/meta/recipes-sato/owl-video-widget/owl-video/gtk_multithread_safe.patch b/meta/recipes-sato/owl-video-widget/owl-video/gtk_multithread_safe.patch
index e153c5e..437f72b 100644
--- a/meta/recipes-sato/owl-video-widget/owl-video/gtk_multithread_safe.patch
+++ b/meta/recipes-sato/owl-video-widget/owl-video/gtk_multithread_safe.patch
@@ -7,6 +7,8 @@ multi-thread operation.
 
 Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
 
+Upstream-Status: Pending
+
 diff -ruN video-orig/src/video.c video/src/video.c
 --- video-orig/src/video.c	2010-10-15 16:07:26.522346398 +0800
 +++ video/src/video.c	2010-10-15 16:25:51.780296717 +0800
diff --git a/meta/recipes-sato/owl-video-widget/owl-video/make-382.patch b/meta/recipes-sato/owl-video-widget/owl-video/make-382.patch
index 7d8aff7..d219c31 100644
--- a/meta/recipes-sato/owl-video-widget/owl-video/make-382.patch
+++ b/meta/recipes-sato/owl-video-widget/owl-video/make-382.patch
@@ -2,6 +2,8 @@ Make 3.82 is much stricter and demands tabs. Obey.
 
 JL - 15/12/10
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: video/Makefile.am
 ===================================================================
 --- video.orig/Makefile.am
diff --git a/meta/recipes-sato/pcmanfm/files/cross-compile-fix.patch b/meta/recipes-sato/pcmanfm/files/cross-compile-fix.patch
index 2f654a5..0118081 100644
--- a/meta/recipes-sato/pcmanfm/files/cross-compile-fix.patch
+++ b/meta/recipes-sato/pcmanfm/files/cross-compile-fix.patch
@@ -4,6 +4,8 @@ remove it to work aound this issue.
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
 
+Upstream-Status: Inappropriate [embedded specific]
+
 Index: pcmanfm-0.9.7/data/ui/Makefile.am
 ===================================================================
 --- pcmanfm-0.9.7.orig/data/ui/Makefile.am	2010-07-29 15:10:18.000000000 +0800
diff --git a/meta/recipes-sato/pcmanfm/files/owl-window-menu.patch b/meta/recipes-sato/pcmanfm/files/owl-window-menu.patch
index f3d4e61..0826a16 100644
--- a/meta/recipes-sato/pcmanfm/files/owl-window-menu.patch
+++ b/meta/recipes-sato/pcmanfm/files/owl-window-menu.patch
@@ -3,6 +3,8 @@ enable owl menu
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
 
+Upstream-Status: Inappropriate [enable feature]
+
 Index: pcmanfm-0.9.7/configure.ac
 ===================================================================
 --- pcmanfm-0.9.7.orig/configure.ac	2010-07-27 10:28:12.000000000 +0800
diff --git a/meta/recipes-sato/pimlico/contacts/contacts-owl-window-menu.patch b/meta/recipes-sato/pimlico/contacts/contacts-owl-window-menu.patch
index 4b9238b..5323876 100644
--- a/meta/recipes-sato/pimlico/contacts/contacts-owl-window-menu.patch
+++ b/meta/recipes-sato/pimlico/contacts/contacts-owl-window-menu.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [enable feature]
+
 Index: contacts-0.9/src/contacts-gtk.c
 ===================================================================
 --- contacts-0.9.orig/src/contacts-gtk.c	2008-06-06 12:56:08.000000000 +0100
diff --git a/meta/recipes-sato/pimlico/contacts/make-382.patch b/meta/recipes-sato/pimlico/contacts/make-382.patch
index f85d6b2..a7cfee3 100644
--- a/meta/recipes-sato/pimlico/contacts/make-382.patch
+++ b/meta/recipes-sato/pimlico/contacts/make-382.patch
@@ -2,6 +2,8 @@ Fix for stricter parser in make 3.82. This fix has been pushed to upstream git.
 
 JL - 15/12/10
 
+Upstream-Status: Accepted
+
 Index: git/Makefile.am
 ===================================================================
 --- git.orig/Makefile.am
diff --git a/meta/recipes-sato/pimlico/dates/dates-owl-window-menu.patch b/meta/recipes-sato/pimlico/dates/dates-owl-window-menu.patch
index d590165..714623e 100644
--- a/meta/recipes-sato/pimlico/dates/dates-owl-window-menu.patch
+++ b/meta/recipes-sato/pimlico/dates/dates-owl-window-menu.patch
@@ -4,6 +4,8 @@
  src/dates_platform.h |    2 +-
  3 files changed, 7 insertions(+), 7 deletions(-)
 
+Upstream-Status: Inappropriate [enable feature]
+
 Index: git/src/dates_gtk.c
 ===================================================================
 --- git.orig/src/dates_gtk.c	2009-08-18 12:44:56.000000000 +0100
diff --git a/meta/recipes-sato/pimlico/dates/dso_linking_change_build_fix.patch b/meta/recipes-sato/pimlico/dates/dso_linking_change_build_fix.patch
index 07a0264..eccc782 100644
--- a/meta/recipes-sato/pimlico/dates/dso_linking_change_build_fix.patch
+++ b/meta/recipes-sato/pimlico/dates/dso_linking_change_build_fix.patch
@@ -30,6 +30,8 @@ file, libtool should have added these needed libraries in there.
 Nitin A Kamble <nitin.a.kamble@intel.com>
 Date: 2011/01/19
 
+Upstream-Status: Pending
+
 Index: git/src/Makefile.am
 ===================================================================
 --- git.orig/src/Makefile.am
diff --git a/meta/recipes-sato/pimlico/dates/make-382.patch b/meta/recipes-sato/pimlico/dates/make-382.patch
index 9147361..fad3c58 100644
--- a/meta/recipes-sato/pimlico/dates/make-382.patch
+++ b/meta/recipes-sato/pimlico/dates/make-382.patch
@@ -3,6 +3,8 @@ in upstream git.
 
 JL - 15/12/10
 
+Upstream-Status: Accepted
+
 Index: git/Makefile.am
 ===================================================================
 --- git.orig/Makefile.am
diff --git a/meta/recipes-sato/sato-icon-theme/sato-icon-theme/iconpath-option.patch b/meta/recipes-sato/sato-icon-theme/sato-icon-theme/iconpath-option.patch
index cfa6a0d..b392a93 100644
--- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme/iconpath-option.patch
+++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme/iconpath-option.patch
@@ -3,6 +3,8 @@ patch adds an option to allow the path to the tool to be specified.
 
 RP - 12/8/10
 
+Upstream-Status: Pending
+
 Index: sato-icon-theme-0.4.1/configure.ac
 ===================================================================
 --- sato-icon-theme-0.4.1.orig/configure.ac	2010-08-12 12:23:25.000000000 +0100
diff --git a/meta/recipes-sato/web/web-webkit/link-with-g++.patch b/meta/recipes-sato/web/web-webkit/link-with-g++.patch
index 50d6e93..e0c6784 100644
--- a/meta/recipes-sato/web/web-webkit/link-with-g++.patch
+++ b/meta/recipes-sato/web/web-webkit/link-with-g++.patch
@@ -3,6 +3,9 @@ linking. The easiest way to achieve this is to add a dummy cpp file.
 This also means we have to add AC_PROG_CXX else libtool 2.2.2 gets upset.
 
 RP - 14/4/08 
+
+Upstream-Status: Inappropriate [configuration]
+
 --- webkit.orig/src/Makefile.am
 +++ webkit/src/Makefile.am
 @@ -1,11 +1,11 @@
diff --git a/meta/recipes-sato/web/web-webkit/make-382.patch b/meta/recipes-sato/web/web-webkit/make-382.patch
index 253743d..3689435 100644
--- a/meta/recipes-sato/web/web-webkit/make-382.patch
+++ b/meta/recipes-sato/web/web-webkit/make-382.patch
@@ -2,6 +2,8 @@ Make 3.82 does not allow 8 spaces instead of a tab
 
 JL - 15/12/10
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: webkit/Makefile.am
 ===================================================================
 --- webkit.orig/Makefile.am
diff --git a/meta/recipes-sato/web/web/owl-window-menu.patch b/meta/recipes-sato/web/web/owl-window-menu.patch
index 8b46c32..1e5916a 100644
--- a/meta/recipes-sato/web/web/owl-window-menu.patch
+++ b/meta/recipes-sato/web/web/owl-window-menu.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [enable feature]
+
 Index: trunk/src/web_main.c
 ===================================================================
 --- trunk.orig/src/web_main.c	2007-12-18 15:04:13.000000000 -0800
diff --git a/meta/recipes-sato/webkit/files/fix_im.patch b/meta/recipes-sato/webkit/files/fix_im.patch
deleted file mode 100644
index e69de29..0000000
diff --git a/meta/recipes-sato/webkit/files/nodolt.patch b/meta/recipes-sato/webkit/files/nodolt.patch
index 5331367..e713e8b 100644
--- a/meta/recipes-sato/webkit/files/nodolt.patch
+++ b/meta/recipes-sato/webkit/files/nodolt.patch
@@ -1,6 +1,9 @@
 Dolt cause build error on some platform, so disable it.
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
+
+Upstream-Status: Inappropriate [configuration]
+
 Index: webkit-gtk-1.3.7+svnr72836-r72836-r0/configure.ac
 ===================================================================
 --- webkit-gtk-1.3.7+svnr72836-r72836-r0.orig/configure.ac	2011-01-21 11:11:07.000000000 +0800
diff --git a/meta/recipes-support/apr/apr-util/configfix.patch b/meta/recipes-support/apr/apr-util/configfix.patch
index a8953e5..dbb1148 100644
--- a/meta/recipes-support/apr/apr-util/configfix.patch
+++ b/meta/recipes-support/apr/apr-util/configfix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: apr-util-1.3.4/apu-config.in
 ===================================================================
 --- apr-util-1.3.4.orig/apu-config.in	2009-01-12 17:08:06.000000000 +0000
diff --git a/meta/recipes-support/apr/apr-util/configure_fixes.patch b/meta/recipes-support/apr/apr-util/configure_fixes.patch
index 0b2a090..1925236 100644
--- a/meta/recipes-support/apr/apr-util/configure_fixes.patch
+++ b/meta/recipes-support/apr/apr-util/configure_fixes.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: apr-util-1.3.4/configure.in
 ===================================================================
 --- apr-util-1.3.4.orig/configure.in
diff --git a/meta/recipes-support/apr/apr-util/configure_fixes.patch.old b/meta/recipes-support/apr/apr-util/configure_fixes.patch.old
deleted file mode 100644
index 16f88b3..0000000
--- a/meta/recipes-support/apr/apr-util/configure_fixes.patch.old
+++ /dev/null
@@ -1,25 +0,0 @@
-Index: apr-util-1.2.12/configure.in
-===================================================================
---- apr-util-1.2.12.orig/configure.in	2008-03-08 19:15:00.000000000 +0000
-+++ apr-util-1.2.12/configure.in	2008-03-08 19:15:13.000000000 +0000
-@@ -8,13 +8,13 @@
- AC_CONFIG_HEADER(include/private/apu_config.h)
- AC_CONFIG_AUX_DIR(build)
- 
--sinclude(build/apu-conf.m4)
--sinclude(build/apu-iconv.m4)
--sinclude(build/apu-hints.m4)
--sinclude(build/apr_common.m4)
--sinclude(build/find_apr.m4)
--sinclude(build/dbm.m4)
--sinclude(build/dbd.m4)
-+#sinclude(build/apu-conf.m4)
-+#sinclude(build/apu-iconv.m4)
-+#sinclude(build/apu-hints.m4)
-+#sinclude(build/apr_common.m4)
-+#sinclude(build/find_apr.m4)
-+#sinclude(build/dbm.m4)
-+#sinclude(build/dbd.m4)
- 
- dnl Generate ./config.nice for reproducing runs of configure
- dnl 
diff --git a/meta/recipes-support/apr/apr/buildconf_fix.patch b/meta/recipes-support/apr/apr/buildconf_fix.patch
index 641340b..2c9d62e 100644
--- a/meta/recipes-support/apr/apr/buildconf_fix.patch
+++ b/meta/recipes-support/apr/apr/buildconf_fix.patch
@@ -4,6 +4,8 @@ so fall back to old detection.
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: apr-1.4.2/buildconf
 ===================================================================
 --- apr-1.4.2.orig/buildconf	2009-11-13 06:19:49.000000000 +0800
diff --git a/meta/recipes-support/apr/apr/cleanup.patch b/meta/recipes-support/apr/apr/cleanup.patch
index 47f1c42..b6784e0 100644
--- a/meta/recipes-support/apr/apr/cleanup.patch
+++ b/meta/recipes-support/apr/apr/cleanup.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: apr-1.4.2/build/buildcheck.sh
 ===================================================================
 --- apr-1.4.2.orig/build/buildcheck.sh	2009-11-13 08:27:16.000000000 +0800
diff --git a/meta/recipes-support/apr/apr/configfix.patch b/meta/recipes-support/apr/apr/configfix.patch
index 995555e..605c4f6 100644
--- a/meta/recipes-support/apr/apr/configfix.patch
+++ b/meta/recipes-support/apr/apr/configfix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: apr-1.3.3/apr-config.in
 ===================================================================
 --- apr-1.3.3.orig/apr-config.in	2009-01-12 15:16:31.000000000 +0000
diff --git a/meta/recipes-support/apr/apr/configure_fixes.patch b/meta/recipes-support/apr/apr/configure_fixes.patch
index 86ceb8c..0514000 100644
--- a/meta/recipes-support/apr/apr/configure_fixes.patch
+++ b/meta/recipes-support/apr/apr/configure_fixes.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: apr-1.3.3/configure.in
 ===================================================================
 --- apr-1.3.3.orig/configure.in
diff --git a/meta/recipes-support/beecrypt/beecrypt/disable-icu-check.patch b/meta/recipes-support/beecrypt/beecrypt/disable-icu-check.patch
index 4a2f414..91b1fa6 100644
--- a/meta/recipes-support/beecrypt/beecrypt/disable-icu-check.patch
+++ b/meta/recipes-support/beecrypt/beecrypt/disable-icu-check.patch
@@ -1,6 +1,8 @@
 We are unable to run code at configure time in a cross environemnt, but as we
 control the build we can be fairly certain this dependency is met.
 
+Upstream-Status: Inappropriate [embedded specific]
+
 JL 05/07/10
 Index: beecrypt-4.2.1/configure.ac
 ===================================================================
diff --git a/meta/recipes-support/beecrypt/beecrypt/fix-security.patch b/meta/recipes-support/beecrypt/beecrypt/fix-security.patch
index f28e393..6cb0c00 100644
--- a/meta/recipes-support/beecrypt/beecrypt/fix-security.patch
+++ b/meta/recipes-support/beecrypt/beecrypt/fix-security.patch
@@ -3,6 +3,9 @@ project:
 http://www.mail-archive.com/fink-commits@lists.sourceforge.net/msg75742.html
 
 JL 05/07/10 
+
+Upstream-Status: Pending
+
 Index: beecrypt-4.2.1/include/beecrypt/c++/beeyond/BeeCertificate.h
 ===================================================================
 --- beecrypt-4.2.1.orig/include/beecrypt/c++/beeyond/BeeCertificate.h	2010-11-26 17:22:57.000000000 +0800
diff --git a/meta/recipes-support/gpgme/gpgme-1.3.0/disable_gpgconf_check.patch b/meta/recipes-support/gpgme/gpgme-1.3.0/disable_gpgconf_check.patch
index f56f35b..df09530 100644
--- a/meta/recipes-support/gpgme/gpgme-1.3.0/disable_gpgconf_check.patch
+++ b/meta/recipes-support/gpgme/gpgme-1.3.0/disable_gpgconf_check.patch
@@ -13,6 +13,7 @@ non-cross-compile environment.
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
 
+Upstream-Status: Inappropriate [embedded specific]
 
 Index: gpgme-1.3.0/configure.ac
 ===================================================================
diff --git a/meta/recipes-support/libcroco/files/croco.patch b/meta/recipes-support/libcroco/files/croco.patch
index 572f9de..88bdb09 100644
--- a/meta/recipes-support/libcroco/files/croco.patch
+++ b/meta/recipes-support/libcroco/files/croco.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 --- opie/configure.in.old	2006-05-19 20:57:30.000000000 +0100
 +++ opie/configure.in	2006-05-19 20:57:56.000000000 +0100
 @@ -131,8 +131,8 @@
diff --git a/meta/recipes-support/liboil/liboil-0.3.17/fix-unaligned-whitelist.patch b/meta/recipes-support/liboil/liboil-0.3.17/fix-unaligned-whitelist.patch
index 79d53b6..c8e3c1f 100644
--- a/meta/recipes-support/liboil/liboil-0.3.17/fix-unaligned-whitelist.patch
+++ b/meta/recipes-support/liboil/liboil-0.3.17/fix-unaligned-whitelist.patch
@@ -4,6 +4,8 @@ configure: fix whitelisting of x86_64 unaligned memory access
 
 Fix typo in whitelist so cross-compile works for x86_64.
 
+Upstream-Status: Inappropriate [configuration]
+
 --- liboil-0.3.17/m4/as-unaligned-access.m4.orig	2009-02-26 14:40:08.000000000 -0500
 +++ liboil-0.3.17/m4/as-unaligned-access.m4	2010-11-03 12:19:55.000000000 -0400
 @@ -9,7 +9,7 @@
diff --git a/meta/recipes-support/liboil/liboil-0.3.17/no-tests.patch b/meta/recipes-support/liboil/liboil-0.3.17/no-tests.patch
index 00cf5d7..892d441 100644
--- a/meta/recipes-support/liboil/liboil-0.3.17/no-tests.patch
+++ b/meta/recipes-support/liboil/liboil-0.3.17/no-tests.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [disable feature]
+
 --- liboil-0.3.9/liboil/liboilfunction.c.old	2006-09-18 13:03:20.000000000 +0100
 +++ liboil-0.3.9/liboil/liboilfunction.c	2006-09-18 13:04:10.000000000 +0100
 @@ -345,7 +345,9 @@
diff --git a/meta/recipes-support/libxslt/libxslt/pkgconfig_fix.patch b/meta/recipes-support/libxslt/libxslt/pkgconfig_fix.patch
index d216638..6386889 100644
--- a/meta/recipes-support/libxslt/libxslt/pkgconfig_fix.patch
+++ b/meta/recipes-support/libxslt/libxslt/pkgconfig_fix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: libxslt-1.1.22/libexslt.pc.in
 ===================================================================
 --- libxslt-1.1.22.orig/libexslt.pc.in	2008-03-19 16:52:20.000000000 +0000
-- 
1.7.1.1



