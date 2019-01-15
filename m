Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 52B896BE46
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 16:39:04 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id p4so3699885wrt.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 08:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=S6AJCIdY9rxCLQcUA4qIxRrb/WQDqVrU91cullub3Mc=;
	b=Jsgs+u027Br8dPUAsuTX2I4cXLmc3eq2F0v0ZmWgNPm6hb/HXO/bNtQU/7NUX4bGDU
	+ZUp7OjmZ87BS0Cd2D+I3QF6jxe9hAa1htkAtaFvIS79X4z6ZdOWxyvKmE6TA/sETDgE
	1xh+x1XYhKITpJOZzVXKyBQNLgwk4qJy4EL9+/wP1jvFH9fnYaaZZWXjD3kWKU2Gw7Uo
	OLVPQUVVBy6uw/gBHR4+dAlV9p0YlPwvBohHYoo/4VoRsAF+7ujsXVFbyoxGpr0YIbN1
	hQpF7+dTMtGoGJbApuMzcO1ck0CoF+tvWkH6czpjt/tyKm9FYpy5Afa6rLG3XgL1lqHP
	LgUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=S6AJCIdY9rxCLQcUA4qIxRrb/WQDqVrU91cullub3Mc=;
	b=HoFE5t3uLIxWWpeuG41cbSWKbnNw95R1wOZkBA6eNrg4Pfp8WihQLdSq+8JVjqrLdy
	vkJJHDuP7Xzq9aj1DollymMs0ZEfD38uXB3GPwDmHgapY9bYxG57/ozK8A/jW+tGqk7P
	K0kc520WyxE1PqMR0VVn2+NI2v7qulUQi7/LNPeVjon+dYe46QyGeebMBdyYokFvAyPw
	LKGUA7/qZ17/kP4vtlSPfg1JZM2JuIOs3brgRXMIR/opAkxYp8xY9Hpy8j2cdgFDKuL3
	E/IQSSvvdbzXXRMdXbQGESNd7i/tl+ZuAjKXCiJlHysZ3jx7cDTOLGWJwMgddyJadp9S
	RCRg==
X-Gm-Message-State: AJcUukfDyXEErmL59ueImuz/vuRlhMnDsyXo9AcRJHu2x+YMdZM5Qv2m
	H7xFJ7cUIrUYOI7uYxBczmedEF96NvM=
X-Google-Smtp-Source: ALg8bN5arUyt8kjZHftyjS99OkRe1poPWcfiEyfpBxAgJ5QJn6xbvsRrvwBpIxShT24IITv4vpxHDg==
X-Received: by 2002:adf:8143:: with SMTP id 61mr3731289wrm.47.1547570344736;
	Tue, 15 Jan 2019 08:39:04 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	f15sm77594927wrt.10.2019.01.15.08.39.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jan 2019 08:39:03 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2019 17:38:36 +0100
Message-Id: <a6c30e25d99218f2d5ffd7cf94645db166f00ec3.1547570285.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547570285.git.alex.kanavin@gmail.com>
References: <cover.1547570285.git.alex.kanavin@gmail.com>
Subject: [PATCHv2 01/22] gtk+3: enable native/nativesdk variant
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
X-List-Received-Date: Tue, 15 Jan 2019 16:39:04 -0000

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
index 519a9840f42..e76fe17776b 100644
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


