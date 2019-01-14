Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 6EB907C03C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 15:03:28 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id t27so23223127wra.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 07:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=KwnF+s4yLjQT7pNSxMdquiyYetLGmuuSj9GJ0jbhMb4=;
	b=puyAov7AXTQNqthBOBnuJ8IpDEtgYzMXBR7XNkbdONLMPKeCy8ONCAU1EN31GZ70bv
	zKzk+epHAb6K0j7d2QafbjjLcVtC5jQ3Gja6Kuuseb6q0iyOYwwKMfT6qhBuIp/6Q2NK
	bUnlVT3rZwnzfsKHIwcCyvISoZPlrmZBpcJGVBhtWKU9IOTVZNOwYxJHOvs4LvcdJKwk
	XVHk/aAF/fS62YQYcoTQ6nYSiL5QPtH11HvZN1bdaKoAOdgaMsfMJqvB9WduGb0AbQiR
	dIz9kJkJCpcPBwC4+DBvNS+q9AZfycZC09w39nzbA0feYfXkaI0LBvYX5TI4F3WQE8g9
	DdhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=KwnF+s4yLjQT7pNSxMdquiyYetLGmuuSj9GJ0jbhMb4=;
	b=M3mGI4bJojVU4a7i21bvMht16dUQZw6zgKI3xaG7tOZZWvH6mFyJB6+RSyAUumfazV
	U334OOEs38+t15R+LEgl6Szdpi3k9JOJkxE68OGQXDvyO95u4Tkc6rl1nn+reHOkjhJQ
	iA3Ggee7ZXPzwFzmB8hwuKZ7msHcGDokWCo4QM+obF7586Ra2wn5E675/g8hOfzqIkSj
	ZTxK9NMHncCm2B2kIHRvNKJ/D22yUAzLY+HZz1H29dJPJdjBzbBTI8b1nml9nqz+yF0s
	INpGLnuVZzdukcoFh757NJkgzlj3K1oDrjkxvKA3wq/VZL2RJ/dXl7MD56ODEkuw2o5p
	A33g==
X-Gm-Message-State: AJcUukc2secqpfvIzyVno3r6/6URIoUdQc+APAnWlrqRotdUy8G/bzhN
	NPYjIV2YFm8DDKabmdMA4h7unKv0
X-Google-Smtp-Source: ALg8bN4Uqv6Bgc/DbLlC1K4Huo3auKMLImPd1VGLVVeFhIyH2JWbGwnKSFEPSJ6tZUxxO3/TfETjUQ==
X-Received: by 2002:a5d:6549:: with SMTP id z9mr23949960wrv.116.1547478208883; 
	Mon, 14 Jan 2019 07:03:28 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	y34sm201725236wrd.68.2019.01.14.07.03.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 07:03:28 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2019 16:03:00 +0100
Message-Id: <0d9bc6dd2c90bd1a76af6b793578aaa11a8b773f.1547477793.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547477793.git.alex.kanavin@gmail.com>
References: <cover.1547477793.git.alex.kanavin@gmail.com>
Subject: [PATCH 04/23] gtk+: drop support for choosing between 2.x and 3.x implementations of gtk-update-icon-cache
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
X-List-Received-Date: Mon, 14 Jan 2019 15:03:28 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-gnome/gtk+/gtk+.inc  |  5 +----
 meta/recipes-gnome/gtk+/gtk+3.inc | 10 ++--------
 2 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+.inc b/meta/recipes-gnome/gtk+/gtk+.inc
index 14ed8d812ca..eb67db20552 100644
--- a/meta/recipes-gnome/gtk+/gtk+.inc
+++ b/meta/recipes-gnome/gtk+/gtk+.inc
@@ -28,7 +28,7 @@ PACKAGECONFIG[x11] = "--with-x=yes --with-gdktarget=x11,--with-x=no,${X11DEPENDS
 PACKAGECONFIG[directfb] = "--with-gdktarget=directfb,,directfb"
 PACKAGECONFIG[manpages] = "--enable-man --with-xml-catalog=${STAGING_ETCDIR_NATIVE}/xml/catalog.xml, --disable-man, libxslt-native xmlto-native"
 
-inherit autotools gtk-doc pkgconfig update-alternatives gtk-immodules-cache gobject-introspection manpages
+inherit autotools gtk-doc pkgconfig gtk-immodules-cache gobject-introspection manpages
 
 PACKAGES += "libgail gtk-demo"
 
@@ -70,9 +70,6 @@ GTKGLIBC_RRECOMMENDS ?= "${GTKBASE_RRECOMMENDS} glibc-gconv-iso8859-1"
 RRECOMMENDS_${PN} = "${GTKBASE_RRECOMMENDS}"
 RRECOMMENDS_${PN}_libc-glibc = "${GTKGLIBC_RRECOMMENDS}"
 
-ALTERNATIVE_${PN} = "gtk-update-icon-cache"
-ALTERNATIVE_TARGET[gtk-update-icon-cache] = "${bindir}/gtk-update-icon-cache-2.0"
-
 do_compile_prepend() {
         export GIR_EXTRA_LIBS_PATH="${B}/gdk/.libs"
 }
diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index ecb6abe4b5b..93f19e69944 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -10,7 +10,7 @@ DEPENDS = "glib-2.0 cairo pango atk jpeg libpng gdk-pixbuf \
 
 LICENSE = "LGPLv2 & LGPLv2+ & LGPLv2.1+"
 
-inherit autotools gettext pkgconfig gtk-doc update-alternatives gtk-immodules-cache gsettings distro_features_check gobject-introspection
+inherit autotools gettext pkgconfig gtk-doc gtk-immodules-cache gsettings distro_features_check gobject-introspection
 
 BBCLASSEXTEND = "native nativesdk"
 
@@ -54,8 +54,6 @@ PACKAGECONFIG[wayland] = "--enable-wayland-backend,--disable-wayland-backend,way
 PACKAGECONFIG[cups] = "--enable-cups,--disable-cups,cups"
 
 do_install_append() {
-	mv ${D}${bindir}/gtk-update-icon-cache ${D}${bindir}/gtk-update-icon-cache-3.0
-
     # duplicate gtk-query-immodules for post install script update_gtk_immodules_cache
     mkdir -p ${D}${libexecdir}
     ln ${D}${bindir}/gtk-query-immodules-3.0 ${D}${libexecdir}/${MLPREFIX}gtk-query-immodules-3.0
@@ -83,7 +81,7 @@ FILES_${PN}-demo = "${bindir}/gtk3-demo \
                     ${datadir}/icons/hicolor/*/apps/gtk3-demo*.png \
                     ${datadir}/icons/hicolor/*/apps/gtk3-widget-factory*.png"
 
-FILES_${PN}_append = " ${bindir}/gtk-update-icon-cache-3.0 \
+FILES_${PN}_append = " ${bindir}/gtk-update-icon-cache \
                ${bindir}/gtk-query-immodules-3.0 \
                ${bindir}/gtk-launch \
                ${datadir}/themes ${sysconfdir} ${datadir}/glib-2.0/schemas/ \
@@ -131,10 +129,6 @@ RDEPENDS_${PN}-dev += "${@bb.utils.contains("PACKAGECONFIG", "wayland", "wayland
 
 PACKAGES_DYNAMIC += "^gtk3-immodule-.* ^gtk3-printbackend-.*"
 
-ALTERNATIVE_${PN} = "gtk-update-icon-cache"
-ALTERNATIVE_TARGET[gtk-update-icon-cache] = "${bindir}/gtk-update-icon-cache-3.0"
-ALTERNATIVE_PRIORITY = "30"
-
 python populate_packages_prepend () {
     import os.path
 
-- 
2.17.1


