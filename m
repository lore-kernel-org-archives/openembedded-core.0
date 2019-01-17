Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
	[209.85.167.44])
	by mail.openembedded.org (Postfix) with ESMTP id 78E507C164
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:40:25 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id c16so8291970lfj.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 08:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=AaJqmWMk+M3+Itn60dzs47txqp5hsMAMuem68JhrnGM=;
	b=nbBY7ZT/7YUDEUqVyhSCsxorR4ugd1HuTvW/NENlBQkRknkqNfGL1ObSzniZeCaoxO
	gHs9yG4KBwT+3dDYpKA76NJIxCRNOFGJqaEgJIrqLKZjRp3/H4qFkx49euW/0q4AZ8GH
	TosXdtqzklOk3c3+u1yQysEuYKNj59X11MbfL/Gth4+EHcd7agyjrp5aYGUvESIMEXSZ
	areZ+cXHiHIaC34hCBGLMp5aXgOvedIdXwMmCDApIEuRReUNC4b35bZe7j7C8TuqHrVh
	EztZ5CiVltnXjSBrL0byOOyFrz6kqgXzyNDQSuGagudN74a+2OR/1yY7Dhfu2TW+28U9
	AFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=AaJqmWMk+M3+Itn60dzs47txqp5hsMAMuem68JhrnGM=;
	b=d9Gg2Hbbvl/dIInak1/5lNf9HsDnkdh3z5/EA1DHj8BkBIGU2tspEjNsjRZbRUucWQ
	Gxm6lM/OEPKf+5RHH0IqzUL4msCalzrNRdYcrGooC5VTHd/pXwTvq3rdXOJlMyvnM0FO
	s6gDEnG2ZnJiGVaVs7Ag+zguvwfpof9MO3GUaxA1NIWsoEhJUOhvdA6U1erwbxdSvICb
	E0U963o183b2AMCrI/KMo0Fn4yUIZysf++uxNjPSz9foknQkQCZbO+x4Gq1iH+4vMSAH
	rqBafjPtk7NNpZmepckMAXvOlIUnyUxerW4OchEsmBQZwqDfNdsqAxKv7V50AXjtTSMn
	RdVw==
X-Gm-Message-State: AJcUukfajGGjrPNuSrrk/jEkuZjgKicxtPMLdaXjY/viQLfZVfBRA+KJ
	xKsrXlCPUJM5MHxgxZwk484PxvUl
X-Google-Smtp-Source: ALg8bN6SphQhxbYBEMJWOPDZqkOTrdCpR3oDjqdGPupAElT+349/Q1X7TULhzrbDWFImXXdB81svag==
X-Received: by 2002:a19:d90c:: with SMTP id q12mr10304439lfg.24.1547743225592; 
	Thu, 17 Jan 2019 08:40:25 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id k14sm373098lfc.70.2019.01.17.08.40.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jan 2019 08:40:25 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2019 17:39:46 +0100
Message-Id: <3f5ff567407d090032ef7ed06d547fe30b1be6a4.1547743126.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547743126.git.alex.kanavin@gmail.com>
References: <cover.1547743126.git.alex.kanavin@gmail.com>
Subject: [PATCHv3 01/27] gtk+3: enable native/nativesdk variant
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
X-List-Received-Date: Thu, 17 Jan 2019 16:40:25 -0000

Host-assisted GL in Qemu in theory works with both SDL
and GTK; in practice SDL shows an empty screen. This
prepares the switchover of graphical qemu to use
native gtk, which also provides a neat set of menus to
control the emulator.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-gnome/gtk+/gtk+3.inc | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index 1b0829de075..724aa5e399e 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -12,6 +12,8 @@ LICENSE = "LGPLv2 & LGPLv2+ & LGPLv2.1+"
 
 inherit autotools gettext pkgconfig gtk-doc update-alternatives gtk-immodules-cache gsettings distro_features_check gobject-introspection
 
+BBCLASSEXTEND = "native nativesdk"
+
 # versions >= 3.90 are development versions, otherwise like upstream-version-is-even
 UPSTREAM_CHECK_REGEX = "[^\d\.](?P<pver>3\.([1-8]?[02468])+(\.\d+)+)\.tar"
 
@@ -51,14 +53,27 @@ PACKAGECONFIG[glx] = "--enable-glx,--disable-glx,,libgl"
 PACKAGECONFIG[wayland] = "--enable-wayland-backend,--disable-wayland-backend,wayland wayland-protocols libxkbcommon virtual/mesa wayland-native"
 PACKAGECONFIG[cups] = "--enable-cups,--disable-cups,cups"
 
-do_install_append() {
-	mv ${D}${bindir}/gtk-update-icon-cache ${D}${bindir}/gtk-update-icon-cache-3.0
+prepare_gtk_scripts() {
+    mv ${D}${bindir}/gtk-update-icon-cache ${D}${bindir}/gtk-update-icon-cache-3.0
 
     # duplicate gtk-query-immodules for post install script update_gtk_immodules_cache
     mkdir -p ${D}${libexecdir}
     ln ${D}${bindir}/gtk-query-immodules-3.0 ${D}${libexecdir}/${MLPREFIX}gtk-query-immodules-3.0
 }
 
+do_install_append_class-target() {
+    prepare_gtk_scripts
+}
+
+do_install_append_class-nativesdk() {
+    prepare_gtk_scripts
+}
+
+do_install_append_class-native() {
+    # provided by gtk-icon-utils-native
+    rm ${D}${bindir}/gtk-encode-symbolic-svg
+}
+
 PACKAGES =+ "${PN}-demo"
 LIBV = "3.0.0"
 
@@ -104,6 +119,15 @@ GTKBASE_RRECOMMENDS ?= "liberation-fonts \
                         shared-mime-info \
                         adwaita-icon-theme-symbolic \
                         "
+
+GTKBASE_RRECOMMENDS_class-native ?= "\
+                        gdk-pixbuf-loader-png \
+                        gdk-pixbuf-loader-jpeg \
+                        gdk-pixbuf-loader-gif \
+                        gdk-pixbuf-loader-xpm \
+                        shared-mime-info \
+                        "
+
 GTKGLIBC_RRECOMMENDS ?= "${GTKBASE_RRECOMMENDS} glibc-gconv-iso8859-1"
 
 RRECOMMENDS_${PN} = "${GTKBASE_RRECOMMENDS}"
-- 
2.17.1


