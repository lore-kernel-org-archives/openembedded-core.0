Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
	[209.85.208.178])
	by mail.openembedded.org (Postfix) with ESMTP id 485477C87D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 12:41:18 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id f24-v6so14245852ljk.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 04:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1h1J+dh3ZZZT4KINGL3ZE+IHoqcr0snYP+nPfHB7C3o=;
	b=f7lCAOdukAm4XDAgMnVFDemcGezmr9FuYld1iMlWjOV5TwDqR/oxT90L95/nSnd0AP
	eLvzCQJWg9HStvLThVW2otqhPGfB9QhbuEWSvy3jeFa/MtWxqei1fqPLYzDMH1Y6jy0Z
	KNe7FJbCAF59PgC6kMOJOlK3orT9jGDfDcoEW54bbltBK7Z51JmjvI5BBUfiyYgHF0+S
	dy7CHJJi5WA6xc31iNO7rsjO2FA81biHWhyf/HLTlcYv7OK+frLAhZLnVS/Pfg6S4W18
	Du8+U+tg/hfbfLPqmgFWonQDQAyIf4XgEH+/pTRATCZJdlR63pwYEiBQ29m4Z/CIOJzM
	X6Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1h1J+dh3ZZZT4KINGL3ZE+IHoqcr0snYP+nPfHB7C3o=;
	b=Hm/0pUZYl6kwmiE7AbAcX90UCIjAaHjNKKThQoWwx7llPgHSWaOSEUdRwtVYQBcD/J
	DatqEYjTqv74cGvZYKUNtKpp60YPz0nSWYDwtKdgbadyn2C4DO4MBYxJbgyRLINJDXBV
	3Z1qxbu0N0r89cxqJyJc7Lqcg81EOng92oazmJOuDsNViiP6gNsB7BoAQK6q5skoNifn
	7QEyUN1Ibr5P9ZXdBCmEYDnUFEmCx8K+JVDuL7sLHSTx9BM5KraZbJgIHms61rAV6dLO
	KFot1abzLuU96uMeX5ZqPJYbvfQtrUN+b7V4xTeZDDG20E3Z7BjxFOexZg4N3Y5sYgnH
	EDWA==
X-Gm-Message-State: AHQUAuYIzi17e0AQ79XBYaO0fvhbTrMT9XhnlHTdvHAOCpTcBnuxb7EB
	c6zgoU+ihk0R6oOG78Q04WbP6bUX
X-Google-Smtp-Source: AHgI3Ibc66q+EB/MUTFJh5/xaE6ZI3H9QGEnG6JzMN5mISCLOoOmbv5ciXKMLVGitwHSJ88OBwjY9A==
X-Received: by 2002:a2e:858e:: with SMTP id
	b14-v6mr15127082lji.43.1550493678443; 
	Mon, 18 Feb 2019 04:41:18 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id h3sm3733898lfj.25.2019.02.18.04.41.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Feb 2019 04:41:17 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Feb 2019 13:41:04 +0100
Message-Id: <20190218124108.7846-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190218124108.7846-1-alex.kanavin@gmail.com>
References: <20190218124108.7846-1-alex.kanavin@gmail.com>
Subject: [PATCH 4/8] libsoup-2.4: convert from autotools to meson
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
X-List-Received-Date: Mon, 18 Feb 2019 12:41:18 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...no-introspection-when-cross-building.patch | 24 +++++++++++++++++
 .../libsoup/libsoup-2.4_2.64.2.bb             | 27 +++++++++++++++----
 2 files changed, 46 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/0001-Do-not-enforce-no-introspection-when-cross-building.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/0001-Do-not-enforce-no-introspection-when-cross-building.patch b/meta/recipes-support/libsoup/libsoup-2.4/0001-Do-not-enforce-no-introspection-when-cross-building.patch
new file mode 100644
index 00000000000..72b029a80b6
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/0001-Do-not-enforce-no-introspection-when-cross-building.patch
@@ -0,0 +1,24 @@
+From 921888affe66953c92a08ae440e911b016b124be Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 15 Feb 2019 14:21:06 +0100
+Subject: [PATCH] Do not enforce no-introspection when cross-building
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 5a92cda..cfb3520 100644
+--- a/meson.build
++++ b/meson.build
+@@ -262,7 +262,7 @@ enable_gnome = get_option('gnome') and host_machine.system() != 'windows'
+ #########################
+ # GObject introspection #
+ #########################
+-enable_introspection = get_option('introspection') and find_program('g-ir-scanner', required: false).found() and not meson.is_cross_build()
++enable_introspection = get_option('introspection') and find_program('g-ir-scanner', required: false).found()
+ 
+ ############
+ # Vala API #
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.64.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.64.2.bb
index 9f852d5c054..ae7c1a68636 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.64.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.64.2.bb
@@ -9,20 +9,37 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 intltool-native libpsl"
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
-SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
+SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
+           file://0001-Do-not-enforce-no-introspection-when-cross-building.patch \
+           "
 SRC_URI[md5sum] = "cac755dc6c6acd6e0c70007f547548f5"
 SRC_URI[sha256sum] = "75ddc194a5b1d6f25033bb9d355f04bfe5c03e0e1c71ed0774104457b3a786c6"
 
 S = "${WORKDIR}/libsoup-${PV}"
 
-inherit autotools gettext pkgconfig upstream-version-is-even gobject-introspection gtk-doc
+inherit meson gettext pkgconfig upstream-version-is-even gobject-introspection gtk-doc
 
 # libsoup-gnome is entirely deprecated and just stubs in 2.42 onwards. Disable by default.
 PACKAGECONFIG ??= ""
-PACKAGECONFIG[gnome] = "--with-gnome,--without-gnome"
-PACKAGECONFIG[gssapi] = "--with-gssapi,--without-gssapi,krb5"
+PACKAGECONFIG[gnome] = "-Dgnome=true,-Dgnome=false"
+PACKAGECONFIG[gssapi] = "-Dgssapi=true,-Dgssapi=false,krb5"
+
+EXTRA_OEMESON_append = " -Dvapi=false"
+
+GTKDOC_ENABLE_FLAG = "-Ddoc=true"
+GTKDOC_DISABLE_FLAG = "-Ddoc=false"
+
+GI_ENABLE_FLAG = "-Dintrospection=true"
+GI_DISABLE_FLAG = "-Dintrospection=false"
+
+EXTRA_OEMESON_append_class-nativesdk = " ${GI_DISABLE_FLAG}"
+
+EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '${GI_ENABLE_FLAG}', \
+                                                                                       '${GI_DISABLE_FLAG}', d)} "
+
+EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GTKDOC_ENABLED', 'True', '${GTKDOC_ENABLE_FLAG}', \
+                                                                                     '${GTKDOC_DISABLE_FLAG}', d)} "
 
-EXTRA_OECONF = "--disable-vala"
 
 # When built without gnome support, libsoup-2.4 will contain only one shared lib
 # and will therefore become subject to renaming by debian.bbclass. Prevent
-- 
2.17.1


