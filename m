Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0FDB67F7DB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 02:14:48 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id w14so30024511qto.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 19:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=CpW8430p8vKoLV6itvBVDeVVUSITM6wVWHJkPwsWaCA=;
	b=YaJPJXUtZzdASPQWkXOIoB0VGzwTJOnS6gebpyZxxmGCmt1kbegrgQcLEZfRDoab8Y
	ErreA2DMGE5UYY0nGIp3j56/D+76nKezAOfRyfSAIaaKNYmoObRxFNJxgnk8pRXmbJel
	IrQfulakgZxDIZQxGgYUUVJdFGiJz8NGScNMJHSWDEdJhqNEfZ2ixyTJoX9aNvdhzkBe
	o6aj6MGKeu8wRgUUB1W1eoMwEYlcR1CJvjVsFPnjBTPk5awHgnM6N0Eci8Jw9Tvm5v00
	LcRcNWhKjLi91cxNfdbvLn5oBN/5VyySdiSojz8RNvK99eFOlZ5JEGvc5y7PkvXWwAtY
	HVyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CpW8430p8vKoLV6itvBVDeVVUSITM6wVWHJkPwsWaCA=;
	b=f1pzeZCDg6EDhshabXjj1ZoatwdkjOC5UfSRJ8yFflYZwtGWEngPshElLn0CzIljf6
	3TwejjeqNxX4i87sEsmz7GbiThTPVlus8K9LX0mC5GmWm7muZXJYdOuIZxEgoJnEcG1w
	8gU8O6WIAcdpqwBpoLod5cr0mKIjBjVjCUmk1FNi/Gnr9/vBw6SzRmHu4m+1QEfWVPM5
	Oh32Ybd0BbFLSuUidgZjS8L9Bc4740y4Z+FrZEIErF8JOHy4iO8FSShp0ihtR3Rx7fC2
	A0ISFYos0NSTQridOrXtAznmub35R5EmhmwJ21secF2lhSzCy7kmMWGdpvJCoeg3IAXr
	v+ew==
X-Gm-Message-State: APjAAAU/X/Nt5iHXMtDs0YjpaO80Lpi+gVmtHGjBfO0F/NO4eQJjrpJx
	LzFL/ScaK66Z/FQ4uMhS9HuJ+9YNul0=
X-Google-Smtp-Source: APXvYqyvkLv6RrXMifGGRRrivejLwQGM1ub2X1PfW0TuJnpq75m/2rYiRlvsGowogFC/MFEvMqziQw==
X-Received: by 2002:ac8:33fb:: with SMTP id d56mr6975834qtb.377.1571796889476; 
	Tue, 22 Oct 2019 19:14:49 -0700 (PDT)
Received: from mroussin.local.net
	(qubcpq0336w-lp140-02-174-92-197-147.dsl.bell.ca. [174.92.197.147])
	by smtp.gmail.com with ESMTPSA id
	u43sm12003531qte.19.2019.10.22.19.14.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Oct 2019 19:14:49 -0700 (PDT)
From: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Oct 2019 22:14:37 -0400
Message-Id: <20191023021437.33560-2-maxime.roussinbelanger@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191023021437.33560-1-maxime.roussinbelanger@gmail.com>
References: <20191023021437.33560-1-maxime.roussinbelanger@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] meta: add missing description in recipes-gnome
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
X-List-Received-Date: Wed, 23 Oct 2019 02:14:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Maxime Roussin-Belanger <maxime.roussinbelanger@gmail.com>

Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
---
 meta/recipes-gnome/gcr/gcr_3.28.1.bb                      | 3 +++
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.2.bb        | 3 +++
 meta/recipes-gnome/gnome/gconf_3.2.6.bb                   | 3 +++
 .../gobject-introspection/gobject-introspection_1.62.0.bb | 8 ++++++--
 .../gsettings-desktop-schemas_3.32.0.bb                   | 2 ++
 .../hicolor-icon-theme/hicolor-icon-theme_0.17.bb         | 2 ++
 meta/recipes-gnome/libdazzle/libdazzle_3.34.1.bb          | 3 +++
 meta/recipes-gnome/libgudev/libgudev_233.bb               | 4 ++++
 meta/recipes-gnome/librsvg/librsvg_2.40.20.bb             | 4 ++++
 meta/recipes-gnome/libsecret/libsecret_0.19.1.bb          | 4 ++++
 10 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gcr/gcr_3.28.1.bb b/meta/recipes-gnome/gcr/gcr_3.28.1.bb
index 419396f049..0a9867451e 100644
--- a/meta/recipes-gnome/gcr/gcr_3.28.1.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.28.1.bb
@@ -1,4 +1,7 @@
 SUMMARY = "A library for bits of crypto UI and parsing etc"
+DESCRIPTION = "GCR is a library for displaying certificates, and crypto UI, \
+accessing key stores. It also provides the viewer for crypto files on the \
+GNOME desktop."
 HOMEPAGE = "https://gitlab.gnome.org/GNOME/gcr"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/gcr/issues"
 
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.2.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.2.bb
index 90196e8818..c99510609c 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.2.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.2.bb
@@ -1,4 +1,7 @@
 SUMMARY = "Image loading library for GTK+"
+DESCRIPTION = "The GDK Pixbuf library provides: Image loading and saving \
+facilities, fast scaling and compositing of pixbufs and Simple animation \
+loading (ie. animated GIFs)"
 HOMEPAGE = "https://wiki.gnome.org/Projects/GdkPixbuf"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/gdk-pixbuf/issues"
 
diff --git a/meta/recipes-gnome/gnome/gconf_3.2.6.bb b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
index e6742f37d8..b8466d4833 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.6.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
@@ -1,4 +1,7 @@
 SUMMARY = "GNOME configuration system"
+DESCRIPTION = "GConf is a system for storing application preferences. \
+It is intended for user preferences; not configuration of something like \
+Apache, or arbitrary data storage."
 SECTION = "x11/gnome"
 HOMEPAGE = "https://projects.gnome.org/gconf/"
 LICENSE = "LGPLv2+"
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.62.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.62.0.bb
index 1c3697b23d..a9739cc552 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.62.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.62.0.bb
@@ -1,4 +1,8 @@
 SUMMARY = "Middleware layer between GObject-using C libraries and language bindings"
+DESCRIPTION = "GObject Introspection is a project for providing machine \
+readable introspection data of the API of C libraries. This introspection \
+data can be used in several different use cases, for example automatic code \
+generation for bindings, API verification and documentation generation."
 HOMEPAGE = "https://wiki.gnome.org/action/show/Projects/GObjectIntrospection"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/gobject-introspection/issues"
 SECTION = "libs"
@@ -92,7 +96,7 @@ EOF
 
         # Write out a wrapper for g-ir-scanner itself, which will be used when building introspection files
         # for glib-based packages. This wrapper calls the native version of the scanner, and tells it to use
-        # a qemu wrapper for running transient target binaries produced by the scanner, and an include directory 
+        # a qemu wrapper for running transient target binaries produced by the scanner, and an include directory
         # from the target sysroot.
         cat > ${B}/g-ir-scanner-wrapper << EOF
 #!/bin/sh
@@ -132,7 +136,7 @@ do_compile_prepend() {
         export GIR_EXTRA_LIBS_PATH=$B/.libs
 }
 
-# Our wrappers need to be available system-wide, because they will be used 
+# Our wrappers need to be available system-wide, because they will be used
 # to build introspection files for all other gobject-based packages
 do_install_append_class-target() {
         install -d ${D}${bindir}/
diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.32.0.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.32.0.bb
index 2163260a02..8d19aed2bf 100644
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.32.0.bb
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.32.0.bb
@@ -1,4 +1,6 @@
 SUMMARY = "GNOME desktop-wide GSettings schemas"
+DESCRIPTION = "GSettings desktop-wide schemas contains a collection of \
+GSettings schemas for settings shared by various components of a desktop."
 HOMEPAGE = "https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas/issues"
 
diff --git a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb
index 6ae8032710..0ade41a1ba 100644
--- a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb
+++ b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb
@@ -1,4 +1,6 @@
 SUMMARY = "Default icon theme that all icon themes automatically inherit from"
+DESCRIPTION = "The hicolor-icon-theme package contains a default fallback \
+theme for implementations of the icon theme specification."
 HOMEPAGE = "https://www.freedesktop.org/wiki/Software/icon-theme/"
 BUGTRACKER = "https://bugs.freedesktop.org/"
 
diff --git a/meta/recipes-gnome/libdazzle/libdazzle_3.34.1.bb b/meta/recipes-gnome/libdazzle/libdazzle_3.34.1.bb
index 56678255fd..e2973905f8 100644
--- a/meta/recipes-gnome/libdazzle/libdazzle_3.34.1.bb
+++ b/meta/recipes-gnome/libdazzle/libdazzle_3.34.1.bb
@@ -1,4 +1,7 @@
 SUMMARY = "The libdazzle library is a companion library to GObject and Gtk+."
+DESCRIPTION = "A wide range of components from utilities for GIO, widgets for \
+GTK+, an animation framework, state machines, paneling and high-performance \
+counters are included."
 LICENSE = "GPLv3+"
 HOMEPAGE = "https://gitlab.gnome.org/GNOME/libdazzle"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/libdazzle/issues"
diff --git a/meta/recipes-gnome/libgudev/libgudev_233.bb b/meta/recipes-gnome/libgudev/libgudev_233.bb
index 04efc89212..8bc379ff62 100644
--- a/meta/recipes-gnome/libgudev/libgudev_233.bb
+++ b/meta/recipes-gnome/libgudev/libgudev_233.bb
@@ -1,4 +1,8 @@
 SUMMARY = "GObject wrapper for libudev"
+DESCRIPTION = "This library makes it much simpler to use libudev from programs \
+already using GObject. It also makes it possible to easily use libudev from \
+other programming languages, such as Javascript, because of GObject \
+introspection support."
 HOMEPAGE = "https://wiki.gnome.org/Projects/libgudev"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/libgudev/issues"
 SRC_URI[archive.sha256sum] = "587c4970eb23f4e2deee2cb1fb7838c94a78c578f41ce12cac0a3f4a80dabb03"
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb b/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb
index 38532834dd..7f98127fd0 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb
@@ -1,4 +1,8 @@
 SUMMARY = "Library for rendering SVG files"
+DESCRIPTION = "A small library to render Scalable Vector Graphics (SVG), \
+associated with the GNOME Project. It renders SVG files to Cairo surfaces. \
+Cairo is the 2D, antialiased drawing library that GNOME uses to draw things to \
+the screen or to generate output for printing."
 HOMEPAGE = "https://gitlab.gnome.org/GNOME/librsvg"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/librsvg/issues"
 
diff --git a/meta/recipes-gnome/libsecret/libsecret_0.19.1.bb b/meta/recipes-gnome/libsecret/libsecret_0.19.1.bb
index 9145c04412..5adda9a329 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.19.1.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.19.1.bb
@@ -1,4 +1,8 @@
 SUMMARY = "libsecret is a library for storing and retrieving passwords and other secrets"
+DESCRIPTION = "A GObject-based library for accessing the Secret Service API of the
+freedesktop.org project, a cross-desktop effort to access passwords, tokens
+and other types of secrets. libsecret provides a convenient wrapper for these
+methods so consumers do not have to call the low-level DBus methods."
 LICENSE = "LGPLv2.1"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/libsecret/issues"
 LIC_FILES_CHKSUM = "file://COPYING;md5=23c2a5e0106b99d75238986559bb5fc6"
-- 
2.23.0


