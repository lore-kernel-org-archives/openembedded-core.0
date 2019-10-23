Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 12C057F7A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 02:14:47 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id m15so30135030qtq.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 19:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sAFR/57mbg/mbjhWmPhhIqH2Jj9CxFXY/lpebsrPgYk=;
	b=C74U/pLOw0Er6rTnZUD4t4T/eug6VZVWD5ef2gstgmIxCcqwvaTdG6usHuoF/HT59z
	zLqTpZHPTUkygQ4F8+06OOMVyQQnke9vfbx0+2qagVW1uGGc67V+K4Ypb3Zj7W1dRZqE
	aPcF7/J33D/+1t8ugHhTurNF8SM6FJI+iKGFGMmAZ3wUCnUSKq5WKH27gZv4TSYcO1qh
	UYU+AF4kzxsdlWq9y/2OOHUM7c0A38O2MrKHpNoRuFLm4cydFL3dO8BBSIX9MFLolUqg
	VS7Ku/6HU5p4rXWLenOT3jpgxENApuhky0OLjWbZlI+K9vs48Nn4cVYZJw5x1bB47dZf
	oN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sAFR/57mbg/mbjhWmPhhIqH2Jj9CxFXY/lpebsrPgYk=;
	b=RzEaMr4oYWXCwZ+4q9nbMsmbR27L/griAFeFhl9KBtn4NZe6W6y7KutpdeZAOjeUGB
	R4JqhaGzrmEkEoMyCdP0WS39xIOW0MuVyIb1tkiN7jBkqY8ajTDGOW7a9+QSWCX91n2h
	D4hyoHQhgpzo2Ry/bmgBo7YbSoCnOC9v5KP+bcNgdSZaBoUUImqKo2x4FGjh9rQhGZUh
	VFkHvrlBiocVoKsh9oBzKK0eQ1tzHz1C+Mnbnok6mQ3rhvut2W//VIHjD3bcAqzrgUZl
	m92Nbowm2gu91VAqsRIUJgvj6m2kjCxfuNN77U3mLT37XrQsOWds6UGWnSI4nDuUoBVP
	F7sw==
X-Gm-Message-State: APjAAAUBz4x6hfr6qxv3A3VKUFewJkEeSUBE4FI3IVmFqEUyhMZ0Hw0p
	ahd2Dvdn9/ZdPW0XHYSNRj3Ugwffrng=
X-Google-Smtp-Source: APXvYqxV3yhYINMk6OD8hhmIHN3vURDLHzrJRKMPIZl1PiQ/RQ9XpKJdrWIS/4rKorSPc66Uj5kPmg==
X-Received: by 2002:aed:3f21:: with SMTP id p30mr7097077qtf.236.1571796888475; 
	Tue, 22 Oct 2019 19:14:48 -0700 (PDT)
Received: from mroussin.local.net
	(qubcpq0336w-lp140-02-174-92-197-147.dsl.bell.ca. [174.92.197.147])
	by smtp.gmail.com with ESMTPSA id
	u43sm12003531qte.19.2019.10.22.19.14.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Oct 2019 19:14:47 -0700 (PDT)
From: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Oct 2019 22:14:36 -0400
Message-Id: <20191023021437.33560-1-maxime.roussinbelanger@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH 1/2] meta: update and add missing homepage/bugtracker links for gnome recipes
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
X-List-Received-Date: Wed, 23 Oct 2019 02:14:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Maxime Roussin-Belanger <maxime.roussinbelanger@gmail.com>

Gnome has moved to gitlab in 2018.
Some of the homepage urls didn't exist anymore.

Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
---
 meta/recipes-gnome/epiphany/epiphany_3.34.1.bb                | 1 +
 meta/recipes-gnome/gcr/gcr_3.28.1.bb                          | 4 ++--
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.2.bb            | 4 ++--
 meta/recipes-gnome/gnome/adwaita-icon-theme_3.32.0.bb         | 4 ++--
 .../gobject-introspection/gobject-introspection_1.62.0.bb     | 2 +-
 .../gsettings-desktop-schemas_3.32.0.bb                       | 4 ++--
 .../hicolor-icon-theme/hicolor-icon-theme_0.17.bb             | 2 +-
 meta/recipes-gnome/json-glib/json-glib_1.4.4.bb               | 3 ++-
 meta/recipes-gnome/libdazzle/libdazzle_3.34.1.bb              | 2 ++
 meta/recipes-gnome/libgudev/libgudev_233.bb                   | 1 +
 meta/recipes-gnome/libnotify/libnotify_0.7.8.bb               | 3 ++-
 meta/recipes-gnome/librsvg/librsvg_2.40.20.bb                 | 4 ++--
 meta/recipes-gnome/libsecret/libsecret_0.19.1.bb              | 1 +
 13 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.34.1.bb b/meta/recipes-gnome/epiphany/epiphany_3.34.1.bb
index f5f086391e..d1cb515a58 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.34.1.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.34.1.bb
@@ -1,4 +1,5 @@
 SUMMARY = "WebKit based web browser for GNOME"
+BUGTRACKER = "https://gitlab.gnome.org/GNOME/epiphany"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
diff --git a/meta/recipes-gnome/gcr/gcr_3.28.1.bb b/meta/recipes-gnome/gcr/gcr_3.28.1.bb
index 2299199c31..419396f049 100644
--- a/meta/recipes-gnome/gcr/gcr_3.28.1.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.28.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "A library for bits of crypto UI and parsing etc"
-HOMEPAGE = "http://www.gnome.org/"
-BUGTRACKER = "https://bugzilla.gnome.org/"
+HOMEPAGE = "https://gitlab.gnome.org/GNOME/gcr"
+BUGTRACKER = "https://gitlab.gnome.org/GNOME/gcr/issues"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.2.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.2.bb
index 0f3a63d891..90196e8818 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.2.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Image loading library for GTK+"
-HOMEPAGE = "http://www.gtk.org/"
-BUGTRACKER = "https://bugzilla.gnome.org/"
+HOMEPAGE = "https://wiki.gnome.org/Projects/GdkPixbuf"
+BUGTRACKER = "https://gitlab.gnome.org/GNOME/gdk-pixbuf/issues"
 
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.32.0.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.32.0.bb
index 02676f4401..2f3ce25d42 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.32.0.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.32.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "GTK+ icon theme"
-HOMEPAGE = "http://ftp.gnome.org/pub/GNOME/sources/adwaita-icon-theme/"
-BUGTRACKER = "https://bugzilla.gnome.org/"
+HOMEPAGE = "https://gitlab.gnome.org/GNOME/adwaita-icon-theme"
+BUGTRACKER = "https://gitlab.gnome.org/GNOME/adwaita-icon-theme/issues"
 SECTION = "x11/gnome"
 
 LICENSE = "LGPL-3.0 | CC-BY-SA-3.0"
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.62.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.62.0.bb
index c925115fb7..1c3697b23d 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.62.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.62.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Middleware layer between GObject-using C libraries and language bindings"
 HOMEPAGE = "https://wiki.gnome.org/action/show/Projects/GObjectIntrospection"
-BUGTRACKER = "https://bugzilla.gnome.org/"
+BUGTRACKER = "https://gitlab.gnome.org/GNOME/gobject-introspection/issues"
 SECTION = "libs"
 LICENSE = "LGPLv2+ & GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c434e8128a68bedd59b80b2ac1eb1c4a \
diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.32.0.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.32.0.bb
index 859f70466b..2163260a02 100644
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.32.0.bb
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.32.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "GNOME desktop-wide GSettings schemas"
-HOMEPAGE = "http://live.gnome.org/gsettings-desktop-schemas"
-BUGTRACKER = "https://bugzilla.gnome.org/"
+HOMEPAGE = "https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas"
+BUGTRACKER = "https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas/issues"
 
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
diff --git a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb
index fb8033448d..6ae8032710 100644
--- a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb
+++ b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Default icon theme that all icon themes automatically inherit from"
-HOMEPAGE = "http://icon-theme.freedesktop.org/wiki/HicolorTheme"
+HOMEPAGE = "https://www.freedesktop.org/wiki/Software/icon-theme/"
 BUGTRACKER = "https://bugs.freedesktop.org/"
 
 LICENSE = "GPLv2"
diff --git a/meta/recipes-gnome/json-glib/json-glib_1.4.4.bb b/meta/recipes-gnome/json-glib/json-glib_1.4.4.bb
index 1c663f93e1..5143d73ed7 100644
--- a/meta/recipes-gnome/json-glib/json-glib_1.4.4.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_1.4.4.bb
@@ -3,7 +3,8 @@ DESCRIPTION = "Use JSON-GLib it is possible to parse and generate valid JSON\
  data structures, using a DOM-like API. JSON-GLib also offers GObject \
 integration, providing the ability to serialize and deserialize GObject \
 instances to and from JSON data types."
-HOMEPAGE = "http://live.gnome.org/JsonGlib"
+HOMEPAGE = "https://wiki.gnome.org/Projects/JsonGlib"
+BUGTRACKER = "https://gitlab.gnome.org/GNOME/json-glib/issues"
 
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
diff --git a/meta/recipes-gnome/libdazzle/libdazzle_3.34.1.bb b/meta/recipes-gnome/libdazzle/libdazzle_3.34.1.bb
index cf61ed5016..56678255fd 100644
--- a/meta/recipes-gnome/libdazzle/libdazzle_3.34.1.bb
+++ b/meta/recipes-gnome/libdazzle/libdazzle_3.34.1.bb
@@ -1,5 +1,7 @@
 SUMMARY = "The libdazzle library is a companion library to GObject and Gtk+."
 LICENSE = "GPLv3+"
+HOMEPAGE = "https://gitlab.gnome.org/GNOME/libdazzle"
+BUGTRACKER = "https://gitlab.gnome.org/GNOME/libdazzle/issues"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8f0e2cd40e05189ec81232da84bd6e1a"
 
 GNOMEBASEBUILDCLASS = "meson"
diff --git a/meta/recipes-gnome/libgudev/libgudev_233.bb b/meta/recipes-gnome/libgudev/libgudev_233.bb
index a9f6bdd65b..04efc89212 100644
--- a/meta/recipes-gnome/libgudev/libgudev_233.bb
+++ b/meta/recipes-gnome/libgudev/libgudev_233.bb
@@ -1,5 +1,6 @@
 SUMMARY = "GObject wrapper for libudev"
 HOMEPAGE = "https://wiki.gnome.org/Projects/libgudev"
+BUGTRACKER = "https://gitlab.gnome.org/GNOME/libgudev/issues"
 SRC_URI[archive.sha256sum] = "587c4970eb23f4e2deee2cb1fb7838c94a78c578f41ce12cac0a3f4a80dabb03"
 SRC_URI[archive.md5sum] = "d59a317a40aaa02a2226056c0bb4d3e1"
 
diff --git a/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb b/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
index 1c9084d919..f4cda7bc74 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Library for sending desktop notifications to a notification daemon"
-HOMEPAGE = "http://www.gnome.org"
+HOMEPAGE = "https://gitlab.gnome.org/GNOME/libnotify"
+BUGTRACKER = "https://gitlab.gnome.org/GNOME/libnotify/issues"
 SECTION = "libs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb b/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb
index 6a798e6a91..38532834dd 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Library for rendering SVG files"
-HOMEPAGE = "http://ftp.gnome.org/pub/GNOME/sources/librsvg/"
-BUGTRACKER = "https://bugzilla.gnome.org/"
+HOMEPAGE = "https://gitlab.gnome.org/GNOME/librsvg"
+BUGTRACKER = "https://gitlab.gnome.org/GNOME/librsvg/issues"
 
 RECIPE_NO_UPDATE_REASON = "Versions from 2.41.0 requires Rust compiler to build it"
 
diff --git a/meta/recipes-gnome/libsecret/libsecret_0.19.1.bb b/meta/recipes-gnome/libsecret/libsecret_0.19.1.bb
index 0d76075239..9145c04412 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.19.1.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.19.1.bb
@@ -1,5 +1,6 @@
 SUMMARY = "libsecret is a library for storing and retrieving passwords and other secrets"
 LICENSE = "LGPLv2.1"
+BUGTRACKER = "https://gitlab.gnome.org/GNOME/libsecret/issues"
 LIC_FILES_CHKSUM = "file://COPYING;md5=23c2a5e0106b99d75238986559bb5fc6"
 
 inherit gnomebase gtk-doc vala gobject-introspection manpages
-- 
2.23.0


