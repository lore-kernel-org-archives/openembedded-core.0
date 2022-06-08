Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Steve Sakoman" <steve@sakoman.com>
Subject: [OE-core][kirkstone 07/22] glib-2.0: upgrade 2.72.1 -> 2.72.2
Date: Wed,  8 Jun 2022 04:39:20 -1000
Message-Id: <a471cc829ced8d15a5b008514caf7b0f6839382c.1654698895.git.steve@sakoman.com>
In-Reply-To: <cover.1654698895.git.steve@sakoman.com>
References: <cover.1654698895.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Bugs fixed:

2640 UWP warnings about extensions and verbs with glib 2.72.1
2605 Backport !2449 and !2600 mingw test fixes to glib-2-72
2616 Backport !2615 “Meson: Fix gio-windows-2.0 override name” to glib-2-72
2629 Backport !2626, !2627 minor leak fixes to glib-2-72
2643 Backport !2642 “meson: Check rres.compiled() before calling rres.returncode()” to glib-2-72
2644 Backport !2631 “Cast to guintptr instead of subtracting by null” to glib-2-72
2662 Backport !2654 “gtask: use g_strconcat() in g_task_return() only if needed” to glib-2-72
2691 Backport !2661 “win32appinfo: change log level from warning to debug” to glib-2-72

Translation updates:

Croatian
Danish
English (United Kingdom)
French
Galician
German
Nepali
Portuguese (Brazil)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 780d40c9cc98fd5e9369be974acbbb60d7531a60)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch      | 2 +-
 .../glib-2.0/{glib-2.0_2.72.1.bb => glib-2.0_2.72.2.bb}         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.72.1.bb => glib-2.0_2.72.2.bb} (96%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
index 816b790ce7..fb50fff6a5 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -1,4 +1,4 @@
-From d52b1b530c5d8a1e70ae45d6e2139e9d3f25207f Mon Sep 17 00:00:00 2001
+From a30eb17c20e070124b55523d86729348f2929f95 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb
similarity index 96%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb
index c9ccedd81f..c4a8a4b8ad 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb
@@ -19,7 +19,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 
-SRC_URI[sha256sum] = "c07e57147b254cef92ce80a0378dc0c02a4358e7de4702e9f403069781095fe2"
+SRC_URI[sha256sum] = "78d599a133dba7fe2036dfa8db8fb6131ab9642783fc9578b07a20995252d2de"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.25.1

