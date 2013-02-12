Received: from mail-wg0-f45.google.com ([74.125.82.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U5Jup-0005xG-UQ
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 18:45:58 +0100
Received: by mail-wg0-f45.google.com with SMTP id dq12so266606wgb.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2013 09:29:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=XWd1I9wclRFbHCIBnnzjThxlPr3wZGF1w2yJVUVuJ3I=;
	b=VE01Ux1+TwVwrt8HdcOQnBA//JwRPT0dUzi0TBZnDgOq+1tJ+FQJw1fwQ7KpTeuTLe
	xy7VqILK/btOpIDOdUZ7EBorQtNK+sbv2Wn1hIz1kUbyl7awKe3p6u9vEw1ut6wdtJKA
	Rmo5PMsje2+sU/rdpxsvO5bRkwtLP1TCMlc1wmtFf23iwmJh6WrcjCx08yiRjDtNMfre
	FGgcjLX73CUWjGSjjNWxjtSEK2F1ljw8Gm68tT+QJ/4eo1jB/K2VsRmUs4DSym7MPtxM
	gMMRF/XefHGx91wwnxA5M/aZXD5VFd3hPB9DSorH0AELu27+54VP0c/r3kzYpiEflr51
	xX7A==
X-Received: by 10.180.14.166 with SMTP id q6mr4889411wic.22.1360690152209;
	Tue, 12 Feb 2013 09:29:12 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fx5sm41045683wib.11.2013.02.12.09.29.10
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 12 Feb 2013 09:29:11 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Feb 2013 17:26:55 +0000
Message-Id: <1360690016-30849-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQn/zNl0OwFoE3bMXrE3Z61uqySRa+h2GjjP/QmdZmhLMjEcM0eqUCLlZdLoi+k8gwTQ965f
Subject: [PATCH 1/2] web: remove gtkhtml2 version
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
X-List-Received-Date: Tue, 12 Feb 2013 17:45:59 -0000

The gtkhtml2 version of Web is even older than the webkitgtk port, remove it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-sato/web/web/fix_makefile.patch    |   20 -----
 meta/recipes-sato/web/web/owl-window-menu.patch |   98 -----------------------
 meta/recipes-sato/web/web_git.bb                |   28 -------
 3 files changed, 146 deletions(-)
 delete mode 100644 meta/recipes-sato/web/web/fix_makefile.patch
 delete mode 100644 meta/recipes-sato/web/web/owl-window-menu.patch
 delete mode 100644 meta/recipes-sato/web/web_git.bb

diff --git a/meta/recipes-sato/web/web/fix_makefile.patch b/meta/recipes-sato/web/web/fix_makefile.patch
deleted file mode 100644
index 3dd3b15..0000000
--- a/meta/recipes-sato/web/web/fix_makefile.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Upstream-Status: Pending
-
-Nitin A Kamble <nitin.a.kamble@intel.com> 2011/05/10
-Fix following build error:
-
-| NOTE: make -j 16
-| Makefile:719: *** missing separator (did you mean TAB instead of 8 spaces?).  Stop.
-| ERROR: oe_runmake failed
-
-Index: git/Makefile.am
-===================================================================
---- git.orig/Makefile.am
-+++ git/Makefile.am
-@@ -5,5 +5,5 @@ SUBDIRS = src data
- MAINTAINERCLEANFILES = aclocal.m4 compile config.guess config.sub configure depcomp install-sh ltmain.sh Makefile.in missing
- 
- snapshot:
--        $(MAKE) dist distdir=$(PACKAGE)-snap`date +"%Y%m%d"`
-+	$(MAKE) dist distdir=$(PACKAGE)-snap`date +"%Y%m%d"`
- 
diff --git a/meta/recipes-sato/web/web/owl-window-menu.patch b/meta/recipes-sato/web/web/owl-window-menu.patch
deleted file mode 100644
index 1e5916a..0000000
--- a/meta/recipes-sato/web/web/owl-window-menu.patch
+++ /dev/null
@@ -1,98 +0,0 @@
-Upstream-Status: Inappropriate [enable feature]
-
-Index: trunk/src/web_main.c
-===================================================================
---- trunk.orig/src/web_main.c	2007-12-18 15:04:13.000000000 -0800
-+++ trunk/src/web_main.c	2010-11-15 11:40:44.762994000 -0800
-@@ -20,6 +20,8 @@
- #include "web_bookmarks.h"
- #include "web_request.h"
- 
-+#include <libowl/owlwindowmenu.h>
-+
- static void
- copy_cb (GtkWindow *main_window)
- {
-@@ -833,10 +835,8 @@
- main (int argc, char **argv)
- {
- 	GtkWidget *widget;
--#ifdef WITH_HILDON
- 	GList *children, *c;
- 	GtkMenu *menu;
--#endif
- 	WebPages pages;
- 	GConfClient *client;
- 	GModule *module;
-@@ -889,33 +889,12 @@
- 			WEB_API_VERSION, pages.backend->api_version);
- 	pages.backend->init (&(pages.backend_data), &pages);
- 
--#ifdef WITH_HILDON
--	osso_initialize ("web", "0.0", FALSE, NULL);
--	pages.appview = hildon_appview_new ("");
--	pages.window = hildon_app_new_with_appview (pages.appview);
--	hildon_app_set_title (pages.window, "Web");
--	gtk_widget_show (pages.appview);
--	
--	/* Reparent widgets to hildon appview */
--	widget = glade_xml_get_widget (pages.xml, "main_vbox");
--	gtk_container_remove (
--		GTK_CONTAINER (gtk_widget_get_parent (widget)),
--		g_object_ref (widget));
--	gtk_container_add (GTK_CONTAINER (pages.appview), widget);
--	
--	widget = glade_xml_get_widget (pages.xml, "main_toolbar");
--	gtk_container_remove (
--		GTK_CONTAINER (gtk_widget_get_parent (widget)),
--		g_object_ref (widget));
--	gtk_box_pack_end (GTK_BOX (pages.appview->vbox),
--		widget, TRUE, TRUE, 0);
--	gtk_widget_show_all (GTK_WIDGET (pages.appview->vbox));
--	
--	gtk_widget_destroy (glade_xml_get_widget (pages.xml, "main_window"));
-+	pages.window = glade_xml_get_widget (pages.xml, "main_window");
- 	
- 	/* Reparent menu items */
- 	widget = glade_xml_get_widget (pages.xml, "main_menubar");
--	menu = hildon_appview_get_menu (pages.appview);
-+	menu = gtk_menu_new ();
-+
- 	children = gtk_container_get_children (GTK_CONTAINER (widget));
- 	for (c = children; c; c = c->next) {
- 		GtkWidget *menuitem = GTK_WIDGET (c->data);
-@@ -926,12 +905,6 @@
- 	gtk_widget_destroy (widget);
- 	g_list_free (children);	
- 	
--	g_signal_connect (G_OBJECT (pages.window),
--		"key_press_event", G_CALLBACK (web_key_press_cb), &pages);
--#else
--	pages.window = glade_xml_get_widget (pages.xml, "main_window");
--#endif
--
- 	web_bookmarks_init (&pages);
- 	
- 	/* Set history menus */
-@@ -1064,6 +1037,8 @@
- 	
- 	gtk_widget_show (pages.window);
- 
-+	owl_set_window_menu (GTK_WINDOW(pages.window), GTK_MENU(menu));
-+
- 	gtk_main ();
- 	
- 	g_module_close (module);
-Index: trunk/src/Makefile.am
-===================================================================
---- trunk.orig/src/Makefile.am	2007-12-18 15:04:13.000000000 -0800
-+++ trunk/src/Makefile.am	2010-11-15 11:41:15.754994000 -0800
-@@ -18,7 +18,7 @@
- 	      web.h web_history.h web_bookmarks.h web_request.h \
- 	      web_utils.h glibcurl.h
- 
--web_LDADD   = $(WEB_LIBS)
-+web_LDADD   = $(WEB_LIBS) -lowl
- 
- MAINTAINERCLEANFILES = config.h.in Makefile.in
- 
diff --git a/meta/recipes-sato/web/web_git.bb b/meta/recipes-sato/web/web_git.bb
deleted file mode 100644
index ac4810d..0000000
--- a/meta/recipes-sato/web/web_git.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-LICENSE = "GPLv2"
-SECTION = "x11"
-DEPENDS = "libxml2 glib-2.0 gtk+ libglade gtkhtml2 curl gconf js libowl"
-DESCRIPTION = "Web is a multi-platform web browsing application."
-PR = "r0"
-
-SRCREV = "e9a1c9433b9500feb7e3b9bb135debcea3a3e651"
-PV = "0.0+git${SRCPV}"
-
-SRC_URI = 	"git://git.yoctoproject.org/web-sato;protocol=git \
-		file://owl-window-menu.patch \
-		file://fix_makefile.patch \
-		"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-S = "${WORKDIR}/git"
-
-do_unpack_append () {
-    bb.build.exec_func('do_remove_patches', d)
-}
-
-do_remove_patches () {
-	rm -rf ${S}/patches
-}
-
-inherit autotools pkgconfig gconf
-
-- 
1.7.10.4



