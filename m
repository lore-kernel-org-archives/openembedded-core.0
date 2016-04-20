Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id B3085700F0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 13:38:47 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id v188so204042218wme.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 06:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=VqrxvofBVPnuvbYHjSPED0rSSRoHNyi7vnZiKyp5Mts=;
	b=ygId8uGvA0O60RHIFF0d5m1u9Ega4xRb3/hFUY5uXUFAug/Yek1akVo4E2+0RpWDsW
	qFyfOZDXsOwubXhv/S1DCI7b4VVEII40fBLscO4xcjqnMSl7WjQ2CpEHC41elLDxe0qx
	1MksYWLSKHoyEmYWiSF5UnM+ugtLbK4wyrQ8sOyU8DetiOqCWQ5DG8hWUFg9Mb9XZWA8
	JuFlaIcWiRDjLnZE4LdVO5xs1t6WoFXE+hmMr6ItPakWqd3Iew3ZtGYAI2k1CxjyEE/B
	zGB5iFvZmgwITYUq+1V0mKWvcA8zd08KAP+fx7Z79V6FL2vP7/HM0MYc0LSdDHKdR5WB
	dflQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=VqrxvofBVPnuvbYHjSPED0rSSRoHNyi7vnZiKyp5Mts=;
	b=FVCvfS18Wr4QngA1Wq3o11v26AAdl0s0tQIq24nFe0CywPclE9hlE3ToUO1D/C/Aaf
	1VkTDerTCVquxcvliC+oNjHLkNJlcQVDvWUF4sJjJWMG7D6Czn2JBB2cEdFuV92kgSUZ
	R6NhY4liU4LEqDU0Jc9/UhcSlHlPtq/V6W5QeXi4qIEapzyrdx4sqAqxBsoFENZv2Jj/
	resfZluHxR8iRd7YxZ26a6JCJAgeuGDiJpPtc7O68HFPskeeH1wYYcsb+TIJrBdzHVAM
	xO2dfooluf6JIdP9M3hA/TJeRdRdHmpw6onsIu6nPEjcJj/ia5/OOl9KYy7IHAr7TEFK
	88Dg==
X-Gm-Message-State: AOPr4FX/S4h/YrZg3aqvI/DBWQqoBMnSgoQZ6SADh6QsrYn6xxlgb39YhLvkk9OoYwjUSAf3
X-Received: by 10.28.99.6 with SMTP id x6mr28679811wmb.25.1461159527282;
	Wed, 20 Apr 2016 06:38:47 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id u4sm5721732wjz.4.2016.04.20.06.38.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Apr 2016 06:38:46 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Apr 2016 14:38:43 +0100
Message-Id: <1461159523-23539-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH] meta: add missing intltool-native dependency
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
X-List-Received-Date: Wed, 20 Apr 2016 13:38:47 -0000

Recipes that use intltool need to depend on intltool-native.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gcr/gcr_3.18.0.bb                      | 3 +--
 meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.18.2.bb | 3 +--
 meta/recipes-gnome/gnome/gnome-doc-utils.inc              | 3 +--
 meta/recipes-gnome/libwnck/libwnck3_3.14.1.bb             | 3 +--
 meta/recipes-graphics/mx/mx.inc                           | 2 +-
 5 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-gnome/gcr/gcr_3.18.0.bb b/meta/recipes-gnome/gcr/gcr_3.18.0.bb
index 32523a6..35dadbe 100644
--- a/meta/recipes-gnome/gcr/gcr_3.18.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.18.0.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "https://bugzilla.gnome.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 
-DEPENDS = "gtk+3 p11-kit glib-2.0 libgcrypt"
+DEPENDS = "intltool-native gtk+3 p11-kit glib-2.0 libgcrypt"
 
 inherit autotools gnomebase gtk-icon-cache gtk-doc distro_features_check upstream-version-is-even vala gobject-introspection
 # depends on gtk+3, but also x11 through gtk+-x11
@@ -38,4 +38,3 @@ EXTRA_OECONF_append_x86-64 = " --disable-introspection"
 # Gcr-3.broken: poky/build-mips64/tmp/work/mips64-poky-linux/libgpg-error/1.19-r0/libgpg-error-1.19/src/posix-lock.c:119: get_lock_object: Assertion `!"sizeof lock obj"' failed.
 # qemu: uncaught target signal 6 (Aborted) - core dumped
 EXTRA_OECONF_append_mips64 = " --disable-introspection"
-
diff --git a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.18.2.bb b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.18.2.bb
index ee460d9..374101f 100644
--- a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.18.2.bb
+++ b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.18.2.bb
@@ -10,7 +10,7 @@ inherit gnome pkgconfig upstream-version-is-even gobject-introspection
 SRC_URI[archive.md5sum] = "9a5875247abdb99bad93f1c4230d1d6d"
 SRC_URI[archive.sha256sum] = "ddd46d022de137543a71f50c7392b32f9b98d5d3f2b53040b35f5802de2e7b56"
 
-DEPENDS += "gsettings-desktop-schemas gconf libxrandr virtual/libx11 gtk+3 glib-2.0 gnome-doc-utils gnome-common startup-notification xkeyboard-config iso-codes"
+DEPENDS += "intltool-native gsettings-desktop-schemas gconf libxrandr virtual/libx11 gtk+3 glib-2.0 gnome-doc-utils gnome-common startup-notification xkeyboard-config iso-codes"
 
 inherit distro_features_check
 REQUIRED_DISTRO_FEATURES = "x11"
@@ -21,4 +21,3 @@ PACKAGES =+ "libgnome-desktop3"
 FILES_libgnome-desktop3 = "${libdir}/lib*${SOLIBS} ${datadir}/libgnome-desktop*/pnp.ids ${datadir}/gnome/*xml"
 
 RRECOMMENDS_libgnome-desktop3 += "gsettings-desktop-schemas"
-
diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils.inc b/meta/recipes-gnome/gnome/gnome-doc-utils.inc
index 8adfac7..0d212c7 100644
--- a/meta/recipes-gnome/gnome/gnome-doc-utils.inc
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils.inc
@@ -5,8 +5,7 @@ include and create documentation in their releases. They include the \
 xml2po tool which makes it easier to translate and keep up to date \
 translations of documentation."
 LICENSE = "GPLv2 & LGPLv2.1"
-DEPENDS = "libxml2 libxslt libxslt-native gnome-doc-utils-native glib-2.0"
-DEPENDS_class-native = "libxml2-native libxslt-native intltool-native glib-2.0-native"
+DEPENDS = "intltool-native libxml2 libxslt libxslt-native gnome-doc-utils-native glib-2.0"
 
 inherit gnomebase gettext python-dir pythonnative autotools-brokensep
 
diff --git a/meta/recipes-gnome/libwnck/libwnck3_3.14.1.bb b/meta/recipes-gnome/libwnck/libwnck3_3.14.1.bb
index 495894b..6f09533 100644
--- a/meta/recipes-gnome/libwnck/libwnck3_3.14.1.bb
+++ b/meta/recipes-gnome/libwnck/libwnck3_3.14.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 BPN = "libwnck"
 
 SECTION = "x11/libs"
-DEPENDS = "gtk+3 gdk-pixbuf-native libxres"
+DEPENDS = "intltool-native gtk+3 gdk-pixbuf-native libxres"
 
 PACKAGECONFIG ??= "startup-notification"
 PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-startup-notification,startup-notification"
@@ -17,4 +17,3 @@ SRC_URI[archive.sha256sum] = "bb643c9c423c8aa79c59973ce27ce91d3b180d1e9907902278
 inherit distro_features_check
 # libxres means x11 only
 REQUIRED_DISTRO_FEATURES = "x11"
-
diff --git a/meta/recipes-graphics/mx/mx.inc b/meta/recipes-graphics/mx/mx.inc
index 4f10957..b6f5b7c 100644
--- a/meta/recipes-graphics/mx/mx.inc
+++ b/meta/recipes-graphics/mx/mx.inc
@@ -5,7 +5,7 @@ inherit clutter autotools-brokensep distro_features_check gobject-introspection
 # depends on clutter-1.0 which depends on cogl-1.0
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-DEPENDS = "clutter-1.0 dbus-glib gdk-pixbuf"
+DEPENDS = "intltool-native clutter-1.0 dbus-glib gdk-pixbuf"
 
 SRC_URI = "http://source.clutter-project.org/sources/mx/${@get_verdir("${PV}")}/mx-${PV}.tar.xz"
 
-- 
2.8.0.rc3


