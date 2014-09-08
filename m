Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id D4B01702D9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 11:59:10 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id hi2so2487658wib.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Sep 2014 04:59:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=I3UTpvk7NGHiXs3rnORGQ50b4gSPcc+CJqXq2UzqkEM=;
	b=Y+8DBBXu1WzyoWHuQ/g6UFAYdsztTJsqiPsuet8wFRy2eyFzRUpNFqflDI1r2ov+C3
	SjFwiaw6OJ73E9aZ6aC9oxB+GKbK6zOIjiR69fAmJ1pJU+ZI9kF0CokpOghUNPMLEaP/
	kJfwA8Yr+1X8a5reJdSQDBSgcMm546fpTpE3PswiZUK3fXCHH7aiDX8amcWHgohVnwfN
	PMW8rT5mo+GN+jDCkBVtSrMxajEK9dBBjeRckp90QGb28KBsty30FavxMxeUQOuFfd6F
	bBitI11Tm8tIHvw1mGS4OskR6Od0dMECc+7IWOPcbLvRnxUlwa2UHBNMWMUxdf7xmH5x
	mfOQ==
X-Gm-Message-State: ALoCoQnWV0LTO4xCfe3zaprh1CDJJXkrwNLFb0McOKBfk6Drvat7gEvfGH3/8yIZ2E7dBgzbzzZs
X-Received: by 10.194.94.73 with SMTP id da9mr12513510wjb.67.1410177551900;
	Mon, 08 Sep 2014 04:59:11 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	gl10sm11003928wib.1.2014.09.08.04.59.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Sep 2014 04:59:11 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Sep 2014 12:58:34 +0100
Message-Id: <4e11bb8deb9e0df5f3a939bc2185e4c3103d9aa4.1410177322.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
Subject: [PATCH 16/27] gtk+3: update to 3.12.2
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
X-List-Received-Date: Mon, 08 Sep 2014 11:59:11 -0000

From: Marko Lindqvist <cazfi74@gmail.com>

fix-build-when-wayland-backend-enabled.patch removed as the issue
is fixed in upstream.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gtk+/gtk+3.inc                  |    6 ++-
 .../fix-build-when-wayland-backend-enabled.patch   |   43 --------------------
 .../gtk+/{gtk+3_3.10.7.bb => gtk+3_3.12.2.bb}      |    5 +--
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
1.7.10.4


