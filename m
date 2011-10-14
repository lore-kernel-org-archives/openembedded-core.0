Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1REaUf-0002TA-Aa
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 07:39:42 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 Oct 2011 22:33:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,344,1315206000"; d="scan'208";a="73540472"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.120])
	by fmsmga001.fm.intel.com with ESMTP; 13 Oct 2011 22:33:39 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 22:33:23 -0700
Message-Id: <8e81dbf9e02cb0ccb5f6bd6227cbd67129478143.1318570250.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1318570250.git.sgw@linux.intel.com>
References: <cover.1318570250.git.sgw@linux.intel.com>
In-Reply-To: <cover.1318570250.git.sgw@linux.intel.com>
References: <cover.1318570250.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 25/28] pcmanfm: Upgrade to 0.9.9
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
X-List-Received-Date: Fri, 14 Oct 2011 05:39:43 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Update owl-window-menu.patch.

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../pcmanfm/files/owl-window-menu.patch            |   53 ++++++++++----------
 .../pcmanfm/{pcmanfm_0.9.8.bb => pcmanfm_0.9.9.bb} |    6 +-
 2 files changed, 29 insertions(+), 30 deletions(-)
 rename meta/recipes-sato/pcmanfm/{pcmanfm_0.9.8.bb => pcmanfm_0.9.9.bb} (87%)

diff --git a/meta/recipes-sato/pcmanfm/files/owl-window-menu.patch b/meta/recipes-sato/pcmanfm/files/owl-window-menu.patch
index 0826a16..88b154e 100644
--- a/meta/recipes-sato/pcmanfm/files/owl-window-menu.patch
+++ b/meta/recipes-sato/pcmanfm/files/owl-window-menu.patch
@@ -5,10 +5,10 @@ Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
 
 Upstream-Status: Inappropriate [enable feature]
 
-Index: pcmanfm-0.9.7/configure.ac
+Index: pcmanfm-0.9.9/configure.ac
 ===================================================================
---- pcmanfm-0.9.7.orig/configure.ac	2010-07-27 10:28:12.000000000 +0800
-+++ pcmanfm-0.9.7/configure.ac	2010-07-27 18:03:42.000000000 +0800
+--- pcmanfm-0.9.9.orig/configure.ac	2011-08-10 05:28:31.000000000 +0800
++++ pcmanfm-0.9.9/configure.ac	2011-10-10 15:47:33.000000000 +0800
 @@ -70,6 +70,8 @@
  
  gtk_modules="gtk+-2.0 >= 2.16.0"
@@ -18,21 +18,21 @@ Index: pcmanfm-0.9.7/configure.ac
  AC_SUBST(GTK_CFLAGS)
  AC_SUBST(GTK_LIBS)
  
-Index: pcmanfm-0.9.7/src/main-win.c
+Index: pcmanfm-0.9.9/src/main-win.c
 ===================================================================
---- pcmanfm-0.9.7.orig/src/main-win.c	2010-07-27 10:56:08.000000000 +0800
-+++ pcmanfm-0.9.7/src/main-win.c	2010-07-27 17:28:59.000000000 +0800
-@@ -36,6 +36,8 @@
- #include "main-win.h"
+--- pcmanfm-0.9.9.orig/src/main-win.c	2011-08-10 05:28:32.000000000 +0800
++++ pcmanfm-0.9.9/src/main-win.c	2011-10-10 15:50:48.000000000 +0800
+@@ -37,6 +37,8 @@
  #include "pref.h"
+ #include "tab-page.h"
  
 +#include "libowl/owlwindowmenu.h"
 +
  static void fm_main_win_finalize              (GObject *object);
  G_DEFINE_TYPE(FmMainWin, fm_main_win, GTK_TYPE_WINDOW);
  
-@@ -466,9 +468,27 @@
-         fm_main_win_chdir(win, path);
+@@ -400,9 +402,27 @@
+     }
  }
  
 +/* Transfer gtk_ui_manager menubar to gtk menubar */
@@ -53,30 +53,29 @@ Index: pcmanfm-0.9.7/src/main-win.c
 +    return main_menu;
 +}
 +
- static void fm_main_win_init(FmMainWin *self)
+ static void fm_main_win_init(FmMainWin *win)
  {
--    GtkWidget *vbox, *menubar, *toolitem, *scroll;
-+    GtkWidget *vbox, *menubar, *owl_menubar, *toolitem, *scroll;
+-    GtkWidget *vbox, *menubar, *toolitem, *btn;
++    GtkWidget *vbox, *menubar, *owl_menubar, *toolitem, *btn;
      GtkUIManager* ui;
      GtkActionGroup* act_grp;
      GtkAction* act;
-@@ -537,7 +557,6 @@
- 
-     self->popup = gtk_ui_manager_get_widget(ui, "/popup");
+@@ -456,7 +476,6 @@
+     win->popup = gtk_ui_manager_get_widget(ui, "/popup");
+     gtk_menu_attach_to_widget(GTK_WIDGET(win->popup), win, NULL);
  
 -    gtk_box_pack_start( (GtkBox*)vbox, menubar, FALSE, TRUE, 0 );
-     gtk_box_pack_start( (GtkBox*)vbox, self->toolbar, FALSE, TRUE, 0 );
+     gtk_box_pack_start( (GtkBox*)vbox, win->toolbar, FALSE, TRUE, 0 );
  
      /* load bookmarks menu */
-@@ -586,6 +605,11 @@
-     gtk_container_add( (GtkContainer*)self, vbox );
-     gtk_widget_show_all(vbox);
+@@ -517,6 +536,10 @@
  
-+    owl_menubar = ui_menubar_to_menu(menubar);
-+    gtk_widget_show_all (owl_menubar);
-+    owl_set_window_menu (GTK_WINDOW(self),
-+			 GTK_MENU(owl_menubar));
+     gtk_container_add( (GtkContainer*)win, vbox );
+     gtk_widget_show_all(vbox);
 +
-     /* create new tab */
-     fm_main_win_add_tab(self, fm_path_get_home());
-     gtk_widget_grab_focus(self->folder_view);
++    owl_menubar = ui_menubar_to_menu(menubar);
++    gtk_widget_show_all(owl_menubar);
++    owl_set_window_menu(GTK_WINDOW(win), GTK_MENU(owl_menubar));
+ }
+ 
+ 
diff --git a/meta/recipes-sato/pcmanfm/pcmanfm_0.9.8.bb b/meta/recipes-sato/pcmanfm/pcmanfm_0.9.9.bb
similarity index 87%
rename from meta/recipes-sato/pcmanfm/pcmanfm_0.9.8.bb
rename to meta/recipes-sato/pcmanfm/pcmanfm_0.9.9.bb
index f48bb67..af283f6 100644
--- a/meta/recipes-sato/pcmanfm/pcmanfm_0.9.8.bb
+++ b/meta/recipes-sato/pcmanfm/pcmanfm_0.9.9.bb
@@ -11,7 +11,7 @@ SECTION = "x11"
 DEPENDS = "gtk+ startup-notification libfm"
 DEPENDS_append_poky = " libowl"
 
-PR = "r1"
+PR = "r0"
 
 COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|mips.*|powerpc.*)-(linux|freebsd.*)'
 
@@ -24,8 +24,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/pcmanfm-${PV}.tar.gz \
 
 SRC_URI_append_poky = " file://owl-window-menu.patch"
 
-SRC_URI[md5sum] = "4a7fdc0526ed14e3293d784c0ce27dea"
-SRC_URI[sha256sum] = "a9335baf127d133da1b2873b3065545bd278fadd4b33e4b91e3d10b165961b68"
+SRC_URI[md5sum] = "f31ed6defb600f7046a456220d8efa3a"
+SRC_URI[sha256sum] = "bc48af4ade638b47e4207cc274f6e38c2bd3786a811d20da47c3df9907c6fb6c"
 
 inherit autotools pkgconfig
 
-- 
1.7.6.2



