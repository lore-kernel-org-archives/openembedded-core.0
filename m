Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9917B7C8C1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 13:58:24 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id a62so2933114wmh.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 05:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1h1J+dh3ZZZT4KINGL3ZE+IHoqcr0snYP+nPfHB7C3o=;
	b=ML00D1ZkrJFNeYsPCU6M/5HGz1YgtwK6nCqTVJVfhse5cNpTa9WtJwijDkG6U4OAZu
	ZkIkFG58zncaE1G/jcEJY2ytrv+q35EP74KDjIUk2nj5r80ei6Et759VopnfI7GLMLMO
	yRm9zqYQyo8vkRTqCoruSxTarTqQCLZc/IIO5DVDaHWzgsj1l1mHjfYrQJw5vpn4PaHo
	Eu4sWjxhKF8VkSNIBRfBDC8j5ecEmTVW2fmi5pEsXG3pg7CPdRY1gATwHiUtEDP1q5Hq
	qwync7g54aSSVYtZZZDUGRReqcvlKgQjJ1igsFD+u9dg4j5rd+754LC20ZrMWei4Etbm
	gsmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1h1J+dh3ZZZT4KINGL3ZE+IHoqcr0snYP+nPfHB7C3o=;
	b=U5gCpkwQY+YExh6lwPLnrNiE4G9Px7nfqfXDEomERpQhyQhrCK+kVqh0M4IRlsyEoV
	ENCTW9SbffhsKqdW1FZoobWmn5z0zigV7OUYMVhVylJ8pxwMzYGz18rl2zNDCt0rldjH
	Gxlulpe1Y+U1p9qrS6dFAfi9jvI13m947SvCQzzZ1HSjTAN9tYDthHXuXbQ7FPYs/8e9
	6UacNZhro0an+ISUFHTEB8XCHmcQd9aUbjq9cnDbMATQmny0hQ3WyV2eP4bNdjyiHJwr
	VqOosQMQFnW3qoF1Fkf0mUgNqDYoTslTfp8blwGEqtG1eRg/pGaoC3cmytGXnABVhep6
	c7wg==
X-Gm-Message-State: AHQUAuYGdgW5Q1dMPaIGcdzf/+2bGRPWMTFXkqLN7ynBlkTe8Anhj9Tl
	rSj+wAf1+Mm/w56yFcXDqRQgpYaQ
X-Google-Smtp-Source: AHgI3Ia7xpPbOPwdwja7pFMPDsn9bcBFFgfPQ3Od84npVhbApuHCft/ksy8MD5Fiy522unHPDfjzAA==
X-Received: by 2002:a1c:2358:: with SMTP id j85mr2798004wmj.130.1550584705052; 
	Tue, 19 Feb 2019 05:58:25 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	q24sm1959656wmq.16.2019.02.19.05.58.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Feb 2019 05:58:24 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Feb 2019 14:58:10 +0100
Message-Id: <20190219135815.18177-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190219135815.18177-1-alex.kanavin@gmail.com>
References: <20190219135815.18177-1-alex.kanavin@gmail.com>
Subject: [PATCH 3/8] libsoup-2.4: convert from autotools to meson
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
X-List-Received-Date: Tue, 19 Feb 2019 13:58:24 -0000

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


