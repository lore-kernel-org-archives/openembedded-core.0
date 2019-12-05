Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 064887F829
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 15:44:14 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id a15so4156412wrf.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Dec 2019 07:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=y2pX17QJlCR6RHDDhS+iz6fM9gX/Pn8it/iRmPZdCVE=;
	b=bnF85egNFba/HAfBO5U7Y/IkFky6XcYjVxNcRFZtiKuWgSowyoB0SgNwM+u2vZ3atB
	2RKpckHw6woF1ej8/NAVpcRXbJJLbYYnnm73nkK597BuFdW4rJx/xNzo+KSX8pD6dvew
	rFANRXweJJ0zQL6GrF5y3lOz6kmLO+gFYyUovE0F2sOvyHmuaKzxYEfIewdxE2warKcp
	9QDcMWbTeveSORajXvlh5lYoeinqeWYK64CoR5AhpL31PW/k19plFKxBWNFDJhZjPmd1
	xmTzQrPm1HIf7bW34yInRf7uivNHVnI5ShUY6sCa/JwjiCnmNMNzijj0IzLcfBIuExws
	LJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=y2pX17QJlCR6RHDDhS+iz6fM9gX/Pn8it/iRmPZdCVE=;
	b=RnmWpPCBi4bNuBV6Wsv0J0abe6NrZfyRsUVqSTB4VVV7BQk/quDMcGarp9VjGqxAcJ
	bNercrZpxIR/BCEIdlJR1J+U05QMJ5n1OYwfjmk8TnCTuVRRLfkmcWIRtFKgb/1ILI/V
	0ocZUuEAJhqNg8QgbxnBPCSwET7VYf8FSckrFfrXBJEqqi1XNu3lxGyZBd8GwWikdYPJ
	8jFNo8ubALJvYn9zgAfVKmBmjR11U16Iy8M18S+roZN0tmJTPHRjn2qDQViw7uqV7RZS
	DvN7g3nlgoCY5uyhBU8WKFesySYPHEwvgq/tyX3Knw/NeAd/d5ZbcZAhyfCMvaxIJ4A+
	POiA==
X-Gm-Message-State: APjAAAXPaKNvgYMbnIEc6V88QTGF8MFfFbRxVeK1fWbytOpDtXW2AnWF
	BbUhXG3z6A7N4qlTVghpmmM58hPv
X-Google-Smtp-Source: APXvYqyeasMpFxnNP1398/YQuCVxwzg6OotrkThywxYy5VZE/IpzygmZ/6bSNlc1Pq+oAaT2ks9Ckw==
X-Received: by 2002:adf:f2d0:: with SMTP id d16mr10447079wrp.110.1575560655057;
	Thu, 05 Dec 2019 07:44:15 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id z64sm223330wmg.30.2019.12.05.07.44.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 07:44:14 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2019 16:43:46 +0100
Message-Id: <20191205154357.121346-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191205154357.121346-1-alex.kanavin@gmail.com>
References: <20191205154357.121346-1-alex.kanavin@gmail.com>
Subject: [PATCH 13/24] libsoup-2.4: update to 2.68.3
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
X-List-Received-Date: Thu, 05 Dec 2019 15:44:15 -0000

Drop backported patch.

tls-check merely checks at configure time whether glib-networking has tls
support enabled (by running a target executable which doesn't work for us);
it does not affect the actual build.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...no-introspection-when-cross-building.patch | 28 -------------------
 ...up-2.4_2.66.4.bb => libsoup-2.4_2.68.3.bb} | 15 +++++-----
 2 files changed, 8 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-support/libsoup/libsoup-2.4/0001-Do-not-enforce-no-introspection-when-cross-building.patch
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.66.4.bb => libsoup-2.4_2.68.3.bb} (78%)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/0001-Do-not-enforce-no-introspection-when-cross-building.patch b/meta/recipes-support/libsoup/libsoup-2.4/0001-Do-not-enforce-no-introspection-when-cross-building.patch
deleted file mode 100644
index d534457e72c..00000000000
--- a/meta/recipes-support/libsoup/libsoup-2.4/0001-Do-not-enforce-no-introspection-when-cross-building.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 85f7b74fc602214297928afe09347c31d696173d Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 15 Feb 2019 14:21:06 +0100
-Subject: [PATCH] Do not enforce no-introspection when cross-building
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/commit/7ef5ec60c33e254bcd915936bea3f04ba0fe2273]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-Signed-off-by: Alistair Francis <alistair@alistair23.me>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 25887f9..6261a7c 100644
---- a/meson.build
-+++ b/meson.build
-@@ -281,7 +281,7 @@ enable_gnome = get_option('gnome') and host_machine.system() != 'windows'
- # FIXME: once we start to require meson 0.49.0+ and gnome-introspection 1.58.1+
- # the we can enable the introspection even for the static build. See
- # https://github.com/mesonbuild/meson/pull/4478.
--enable_introspection = get_option('introspection') and find_program('g-ir-scanner', required: false).found() and not meson.is_cross_build() and not is_static_library
-+enable_introspection = get_option('introspection') and find_program('g-ir-scanner', required: false).found() and not is_static_library
- 
- ############
- # Vala API #
--- 
-2.20.1
-
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.66.4.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.68.3.bb
similarity index 78%
rename from meta/recipes-support/libsoup/libsoup-2.4_2.66.4.bb
rename to meta/recipes-support/libsoup/libsoup-2.4_2.68.3.bb
index 7f5f910d3d6..e8bc7d64705 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.66.4.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.68.3.bb
@@ -9,11 +9,9 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 intltool-native libpsl"
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
-SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
-           file://0001-Do-not-enforce-no-introspection-when-cross-building.patch \
-           "
-SRC_URI[md5sum] = "42016d80ecae4cf8eb416631049a273a"
-SRC_URI[sha256sum] = "8308984f1eee1c4f8c113a9c1763b2b22d981bd811b0cc82a9f3f1aa63228779"
+SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
+SRC_URI[md5sum] = "29ee2ee7017945b64ede063b1396011c"
+SRC_URI[sha256sum] = "534bb08e35b0ff3702f3adfde87d3441e27c12f9f5ec351f056fe04cba02bafb"
 
 CVE_PRODUCT = "libsoup"
 
@@ -21,12 +19,15 @@ S = "${WORKDIR}/libsoup-${PV}"
 
 inherit meson gettext pkgconfig upstream-version-is-even gobject-introspection gtk-doc
 
+GIR_MESON_ENABLE_FLAG = 'enabled'
+GIR_MESON_DISABLE_FLAG = 'disabled'
+
 # libsoup-gnome is entirely deprecated and just stubs in 2.42 onwards. Disable by default.
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gnome] = "-Dgnome=true,-Dgnome=false"
-PACKAGECONFIG[gssapi] = "-Dgssapi=true,-Dgssapi=false,krb5"
+PACKAGECONFIG[gssapi] = "-Dgssapi=enabled,-Dgssapi=disabled,krb5"
 
-EXTRA_OEMESON_append = " -Dvapi=false"
+EXTRA_OEMESON_append = " -Dvapi=disabled -Dtls_check=false"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-- 
2.17.1


