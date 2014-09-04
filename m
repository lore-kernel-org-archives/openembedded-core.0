Return-Path: <cazfi74@gmail.com>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id B7EFB713E0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Sep 2014 00:48:23 +0000 (UTC)
Received: by mail-la0-f51.google.com with SMTP id gl10so10882036lab.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Sep 2014 17:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=2WOIPSu9ldkmIbFU94EEPe/zk4NL66zMP8XYXTivX84=;
	b=ghnnGcsAuSCln+w2h3beArQtU2sYY2tufrUgLBCYG4avyKgwsmTdXqVcyTXWvZXw7E
	7dXj2xZtibIdY6Hee2Z+NWC6SfjcEV5oAgbPnFx4PiTIKRlxVlqf+zAnwXEi+UIY2qJM
	ApoQSVoJ+sHtrJybiqqAdR8U6ylHd9UCy5KW8W8aAeUGPAKt8wbYoYaNuDJh/wxZfuvS
	q59TCt0+X6TMqhuIxuNS23RFvXl3VnBInQJELM9ptUbMFXLc4vNVawrNqHsWd+rsQJMN
	a1oFq6djW6yvC+LT3t9//0kw/W8zhXs5qljM06i4m17TVTXI7INRUCr/UeQUtHBOeC1i
	QXbg==
X-Received: by 10.112.138.39 with SMTP id qn7mr783382lbb.25.1409791704096;
	Wed, 03 Sep 2014 17:48:24 -0700 (PDT)
Received: from prime (a91-153-14-158.elisa-laajakaista.fi. [91.153.14.158])
	by mx.google.com with ESMTPSA id rl6sm397227lac.17.2014.09.03.17.48.21
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Sep 2014 17:48:22 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.84)
	(envelope-from <cazfi74@gmail.com>)
	id 1XPLDo-0008WM-M8; Thu, 04 Sep 2014 03:48:20 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Sep 2014 03:48:17 +0300
Message-Id: <1d09577ffa2838c6465f034555db36dd8fc3476a.1409791242.git.cazfi74@gmail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <01fc289dc196b0e1bff3359fcfff1a3f33691302.1409791242.git.cazfi74@gmail.com>
References: <01fc289dc196b0e1bff3359fcfff1a3f33691302.1409791242.git.cazfi74@gmail.com>
In-Reply-To: <cover.1409791241.git.cazfi74@gmail.com>
References: <cover.1409791241.git.cazfi74@gmail.com>
Subject: [PATCH 6/6] gtk+3: update to 3.12.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Sep 2014 00:48:26 -0000

fix-build-when-wayland-backend-enabled.patch removed as the issue
is fixed in upstream.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta/recipes-gnome/gtk+/gtk+3.inc                  |  6 ++-
 .../fix-build-when-wayland-backend-enabled.patch   | 43 ----------------------
 .../gtk+/{gtk+3_3.10.7.bb => gtk+3_3.12.2.bb}      |  5 +--
 3 files changed, 7 insertions(+), 47 deletions(-)
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/fix-build-when-wayland-backend-enabled.patch
 rename meta/recipes-gnome/gtk+/{gtk+3_3.10.7.bb => gtk+3_3.12.2.bb} (75%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index 9e96275..54ca77a 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -49,7 +49,11 @@ LIBV = "3.0.0"
 FILES_${PN}-demo = "${bindir}/gtk3-demo \
                     ${bindir}/gtk3-demo-application \
                     ${bindir}/gtk3-widget-factory \
-                    ${datadir}/gtk-3.0/demo"
+                    ${datadir}/gtk-3.0/demo \
+                    ${datadir}/applications/gtk3-demo.desktop \
+                    ${datadir}/applications/gtk3-widget-factory.desktop \
+                    ${datadir}/icons/hicolor/*/apps/gtk3-demo.png \
+                    ${datadir}/icons/hicolor/*/apps/gtk3-widget-factory.png"
 
 # The demo uses PNG files and mime type sniffing, so ensure that these
 # dependencies are present.
diff --git a/meta/recipes-gnome/gtk+/gtk+3/fix-build-when-wayland-backend-enabled.patch b/meta/recipes-gnome/gtk+/gtk+3/fix-build-when-wayland-backend-enabled.patch
deleted file mode 100644
index b4b1a09..0000000
--- a/meta/recipes-gnome/gtk+/gtk+3/fix-build-when-wayland-backend-enabled.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-Fix build when wayland backend enabled
-
-Upstream-Status: Submitted
-https://bugzilla.gnome.org/show_bug.cgi?id=710584
-
-Author: Emilio Pozuelo Monfort
-
---- gtk+-3.10.7/gtk/gtkapplication.c
-+++ gtk+-3.10.7/gtk/gtkapplication.c
-@@ -144,7 +144,6 @@
- 
-   gboolean register_session;
- 
--#ifdef GDK_WINDOWING_X11
-   guint next_id;
- 
-   GDBusConnection *session_bus;
-@@ -161,7 +160,6 @@
-   GDBusProxy *client_proxy;
-   gchar *app_id;
-   gchar *client_path;
--#endif
- 
- #ifdef GDK_WINDOWING_QUARTZ
-   GMenu *combined;
-@@ -299,6 +297,8 @@
-   g_free (application->priv->client_path);
- }
- 
-+#endif
-+
- const gchar *
- gtk_application_get_app_menu_object_path (GtkApplication *application)
- {
-@@ -311,8 +311,6 @@
-   return application->priv->menubar_path;
- }
- 
--#endif
--
- #ifdef GDK_WINDOWING_QUARTZ
- 
- typedef struct {
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.10.7.bb b/meta/recipes-gnome/gtk+/gtk+3_3.12.2.bb
similarity index 75%
rename from meta/recipes-gnome/gtk+/gtk+3_3.10.7.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.12.2.bb
index d0174f6..f4f1971 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.10.7.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.12.2.bb
@@ -4,12 +4,11 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz \
            file://hardcoded_libtool.patch \
-           file://fix-build-when-wayland-backend-enabled.patch \
            file://fix-flags-for-native.patch \
           "
 
-SRC_URI[md5sum] = "18a81944a8506231529a76bf2b68372b"
-SRC_URI[sha256sum] = "b7e9de15385031cff43897e7e59f6692eaabf500f36eef80e6b9d6486ad49427"
+SRC_URI[md5sum] = "0d6d8f9f79132b3b47475d047b369b1c"
+SRC_URI[sha256sum] = "61d74eea74231b1ea4b53084a9d6fc9917ab0e1d71b69d92cbf60a4b4fb385d0"
 
 S = "${WORKDIR}/gtk+-${PV}"
 
-- 
2.1.0


