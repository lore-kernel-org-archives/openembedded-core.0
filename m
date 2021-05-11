Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web12.8435.1620709060449606123
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 21:57:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.183.197, mailfrom: robert.joslyn@redrectangle.org)
X-Originating-IP: 173.197.191.182
Received: from localhost.localdomain (rrcs-173-197-191-182.west.biz.rr.com [173.197.191.182])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 6C7361C0005;
	Tue, 11 May 2021 04:57:36 +0000 (UTC)
From: "Robert Joslyn" <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [PATCH] epiphany: Update to 40.1
Date: Mon, 10 May 2021 21:57:12 -0700
Message-Id: <20210511045712.241660-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refresh patch and adjust version directory for new version numbering
scheme. Add new dependency on libarchive.
---
 .../epiphany/{epiphany_3.38.3.bb => epiphany_40.1.bb}     | 7 ++++---
 .../0002-help-meson.build-disable-the-use-of-yelp.patch   | 8 ++++----
 2 files changed, 8 insertions(+), 7 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_3.38.3.bb => epiphany_40.1.bb} (82%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.38.3.bb b/meta/recipes-gnome/epiphany/epiphany_40.1.bb
similarity index 82%
rename from meta/recipes-gnome/epiphany/epiphany_3.38.3.bb
rename to meta/recipes-gnome/epiphany/epiphany_40.1.bb
index ce24336ace..e1e3ad7868 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.38.3.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_40.1.bb
@@ -8,18 +8,19 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS = "libsoup-2.4 webkitgtk gtk+3 iso-codes avahi libnotify gcr gnutls \
 	   gsettings-desktop-schemas libxml2-native \
-	   glib-2.0 glib-2.0-native json-glib libdazzle libhandy libportal"
+	   glib-2.0 glib-2.0-native json-glib libdazzle libhandy libportal \
+	   libarchive"
 
 GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gsettings features_check upstream-version-is-even gettext mime-xdg
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
-SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
+SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
            file://0002-help-meson.build-disable-the-use-of-yelp.patch \
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "ce62c1fa3e442a9d6131fc884a6bc9a65cf06224c30d649c49624c2ebcb0d275"
+SRC_URI[archive.sha256sum] = "696a426b1702774af8d0f056828f5d9ff9350507aba7f4c7e3e499f07a581ad0"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
diff --git a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
index 118b5d1825..a6c4f92c86 100644
--- a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
+++ b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
@@ -1,4 +1,4 @@
-From 3725c254f1d1d8204fa299e71c1e2bfd0ff6a634 Mon Sep 17 00:00:00 2001
+From 77c9f87dc2b3ad0854a678e234e22dfb31902b82 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Jan 2018 15:50:38 +0200
 Subject: [PATCH] help/meson.build: disable the use of yelp
@@ -13,11 +13,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/help/meson.build b/help/meson.build
-index 484860c..d9b2e80 100644
+index ff324dd..f5e421d 100644
 --- a/help/meson.build
 +++ b/help/meson.build
-@@ -32,7 +32,7 @@ help_media = [
-   'media/epiphany-private-3-36.png'
+@@ -31,7 +31,7 @@ help_media = [
+   'media/org.gnome.Epiphany.svg'
  ]
  
 -gnome.yelp(meson.project_name(),
-- 
2.26.3

