Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QKTgH-0000Fs-74
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:03:46 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 12 May 2011 04:00:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; d="scan'208";a="434860271"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by azsmga001.ch.intel.com with ESMTP; 12 May 2011 04:00:49 -0700
Message-Id: <5af0df36a7a274e97fb4d7368047d082bb30d1ce.1305197864.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
Old-Date: Thu, 12 May 2011 08:08:05 +0800
Date: Thu, 12 May 2011 19:00:46 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 01/54] gtk+: Add Upstream-Status
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
X-List-Received-Date: Thu, 12 May 2011 11:03:46 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../gtk+/gtk+-2.12.7/cellrenderer-cairo.patch      |    2 ++
 .../gtk+/gtk+-2.12.7/combo-arrow-size.patch        |    2 ++
 .../gtk+/gtk+-2.12.7/disable-print.patch           |    2 ++
 .../gtk+/gtk+-2.12.7/entry-cairo.patch             |    2 ++
 .../gtk+/gtk+-2.12.7/filechooser-default.patch     |    2 ++
 .../gtk+/gtk+-2.12.7/filechooser-sizefix.patch     |    2 ++
 .../gtk+/gtk+-2.12.7/filesystem-volumes.patch      |    2 ++
 .../gtk+/gtk+-2.12.7/gtklabel-resize-patch         |    2 ++
 .../gtk+/gtk+-2.12.7/hardcoded_libtool.patch       |    2 ++
 .../gtk+/gtk+-2.12.7/menu-deactivate.patch         |    2 ++
 meta/recipes-gnome/gtk+/gtk+-2.12.7/no-demos.patch |    2 ++
 .../gtk+/gtk+-2.12.7/pangoxft2.10.6.diff           |    2 ++
 .../gtk+/gtk+-2.12.7/range-no-redraw.patch         |    3 +++
 .../gtk+/gtk+-2.12.7/run-iconcache.patch           |    2 ++
 .../gtk+/gtk+-2.12.7/scrolled-placement.patch      |    2 ++
 .../gtk+/gtk+-2.12.7/toggle-font.diff              |    2 ++
 .../recipes-gnome/gtk+/gtk+-2.12.7/xsettings.patch |    2 ++
 ...Duplicate-the-exec-string-returned-by-gtk.patch |    2 ++
 .../gtk+/gtk+-2.16.6/cellrenderer-cairo.patch      |    2 ++
 .../gtk+-2.16.6/disable-gio-png-sniff-test.diff    |    2 ++
 .../gtk+/gtk+-2.16.6/entry-cairo.patch             |    2 ++
 .../gtk+/gtk+-2.16.6/hardcoded_libtool.patch       |    2 ++
 meta/recipes-gnome/gtk+/gtk+-2.16.6/no-demos.patch |    2 ++
 .../gtk+/gtk+-2.16.6/run-iconcache.patch           |    2 ++
 .../gtk+/gtk+-2.16.6/toggle-font.diff              |    2 ++
 .../recipes-gnome/gtk+/gtk+-2.16.6/xsettings.patch |    2 ++
 ...Duplicate-the-exec-string-returned-by-gtk.patch |    2 ++
 .../gtk+/gtk+-2.22.1/cellrenderer-cairo.patch      |    2 ++
 .../gtk+/gtk+-2.22.1/configurefix.patch            |    2 ++
 .../recipes-gnome/gtk+/gtk+-2.22.1/doc-fixes.patch |    3 +++
 .../gtk+/gtk+-2.22.1/entry-cairo.patch             |    2 ++
 .../gtk+/gtk+-2.22.1/hardcoded_libtool.patch       |    2 ++
 meta/recipes-gnome/gtk+/gtk+-2.22.1/no-demos.patch |    2 ++
 .../gtk+/gtk+-2.22.1/run-iconcache.patch           |    2 ++
 .../gtk+/gtk+-2.22.1/toggle-font.diff              |    2 ++
 .../recipes-gnome/gtk+/gtk+-2.22.1/xsettings.patch |    2 ++
 36 files changed, 74 insertions(+), 0 deletions(-)

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
-- 
1.7.1



