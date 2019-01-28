Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1A9337C041
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:47:07 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id y139so13735680wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 04:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Q1m0RUkVgkd9i6xSszDlUByPXn8ybYbhICSTaUne1YM=;
	b=E4RBFZZYnzPGGRyXM3jdScd4BKcbmoiIPRIwUNvraGxQYIabhKj+f9ja7ykyUH0/eM
	EqmZSlmF9DVE+63PlvdpDAMyjkDK5ow8a9e5TjBhtj19LQQWUa9efKLMhlgMot8KLlFp
	3TT3U5IBDkhVJ3k3JBS/TyLwlWlkYS5gNcESBeb+nofNkeK73YC9G7UN0pynekXYuUyy
	sNLyegPC3GqRbGOOQ/WYXPv8BEMhMiNsfVG3uS7jE2kkOPpUeMN8ON0ylxmTlAIO2+rq
	Ndb/ZRpOIP39R43X1nG3gNAEhPI/mrLhrFn/aqHYaxEa2XeBOmJffzzbzcRfzdkMTbpQ
	m+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Q1m0RUkVgkd9i6xSszDlUByPXn8ybYbhICSTaUne1YM=;
	b=gxl81KZNWOGWi/8tPnSzdnoM9XkVSxC5Kwnw7Ie29r9Jw7VXu4ohKQQphrVN7MWwN3
	4AqFzYqECUFqexesZqB6vRvkhyr1lv2KtCjQfoM/w0MyH0VoZJqlTSd8b3t3zZCaAfXK
	6PKGR0+eRyj6VyD08vvOilXixTeT5m1RdS2rwVoZvh7ri2KYyBSsvwfuHP/dDALQJwhx
	9shQpobnsKFE73pnLJaj+mHW0M/5W0yzzm0nAm99V/5cuV8lrls7gNaCWUuRYTKsb6Hl
	PUuPZFOjKqUqtRGVhVFPGKGUFhiSc+iL7HI2cABsb6AJeyhDyt3iya0UUgq+nUDnrEO6
	IwkA==
X-Gm-Message-State: AJcUukcUCPONhTIgcbAJGVrfi5JRtBHczVtMwe441iMYeGeQGsmZlHKW
	LGoetXuzhEcTMEF4SlYuPkcH4Fk2
X-Google-Smtp-Source: ALg8bN5+HMBCpRSYKpSjsmFUjDNIHPwjcSDdB7769q4UFyV/Mi9FlFghcshixWwTjPcTO2Iw2XllVA==
X-Received: by 2002:a1c:a401:: with SMTP id n1mr17845473wme.101.1548679628275; 
	Mon, 28 Jan 2019 04:47:08 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	j33sm186026218wre.91.2019.01.28.04.47.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 04:47:07 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2019 13:46:32 +0100
Message-Id: <5caf6a00f469db5d450e9bcc1849656977548ce4.1548679462.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1548679462.git.alex.kanavin@gmail.com>
References: <cover.1548679462.git.alex.kanavin@gmail.com>
Subject: [PATCH 01/24] gtk+3: enable native/nativesdk variant
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
X-List-Received-Date: Mon, 28 Jan 2019 12:47:08 -0000

Host-assisted GL in Qemu in theory works with both SDL
and GTK; in practice SDL shows an empty screen. This
prepares the switchover of graphical qemu to use
native gtk, which also provides a neat set of menus to
control the emulator.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-gnome/gtk+/gtk+3.inc | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index 1b0829de075..0b5fffb752f 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -12,6 +12,10 @@ LICENSE = "LGPLv2 & LGPLv2+ & LGPLv2.1+"
 
 inherit autotools gettext pkgconfig gtk-doc update-alternatives gtk-immodules-cache gsettings distro_features_check gobject-introspection
 
+BBCLASSEXTEND = "native nativesdk"
+
+GSETTINGS_PACKAGE_class-native = ""
+
 # versions >= 3.90 are development versions, otherwise like upstream-version-is-even
 UPSTREAM_CHECK_REGEX = "[^\d\.](?P<pver>3\.([1-8]?[02468])+(\.\d+)+)\.tar"
 
@@ -51,14 +55,27 @@ PACKAGECONFIG[glx] = "--enable-glx,--disable-glx,,libgl"
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
 
@@ -104,6 +121,10 @@ GTKBASE_RRECOMMENDS ?= "liberation-fonts \
                         shared-mime-info \
                         adwaita-icon-theme-symbolic \
                         "
+
+GTKBASE_RRECOMMENDS_class-native ?= "\
+                        "
+
 GTKGLIBC_RRECOMMENDS ?= "${GTKBASE_RRECOMMENDS} glibc-gconv-iso8859-1"
 
 RRECOMMENDS_${PN} = "${GTKBASE_RRECOMMENDS}"
-- 
2.17.1


