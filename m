Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Steve Sakoman" <steve@sakoman.com>
Subject: [OE-core][kirkstone 25/27] glib-2.0: upgrade 2.72.2 -> 2.72.3
Date: Wed, 13 Jul 2022 18:35:45 -1000
Message-Id: <0d9a2d4d659acf1747bf4ad328754579143fa07a.1657772638.git.steve@sakoman.com>
In-Reply-To: <cover.1657772638.git.steve@sakoman.com>
References: <cover.1657772638.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

From: Alexander Kanavin <alex.kanavin@gmail.com>

Bugs fixed:

1941 disposing a non-cancelled inotify GFileMonitor causes deadlocks
2597 Crash in g_socket_client_enumerator_callback when proxy resolving
2639 xdgmime update breaks webkit2gtk file:// requests
2670 Growing memory when using cancellable in g_socket_client_connect_async
2703 glocalfilemonitor: Avoid file monitor destruction from event thread
2709 Backport !2707 “credentials: macos: check for existence of LOCAL_PEERPID” to glib-2-72
2720 Backport !2708 “xdgmime: Fix broken file:// content type lookups for webkitgtk” to glib-2-72
2750 Backport !2745 “gsocketclient: Fix still-reachable references to cancellables” to glib-2-72
2787 Backport !2742 “proxyaddressenumerator: set error parameter more thoughtfully” to glib-2-72

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3c4b0196be98fa2dad92f59ead6dd74b26be8ffd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch      | 2 +-
 .../glib-2.0/{glib-2.0_2.72.2.bb => glib-2.0_2.72.3.bb}         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.72.2.bb => glib-2.0_2.72.3.bb} (96%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
index fb50fff6a5..c0114397d8 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -1,4 +1,4 @@
-From a30eb17c20e070124b55523d86729348f2929f95 Mon Sep 17 00:00:00 2001
+From 9a66887179d28d696562dcac43ad05d67580cfdb Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
similarity index 96%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
index c4a8a4b8ad..dd1ea508d2 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
@@ -19,7 +19,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 
-SRC_URI[sha256sum] = "78d599a133dba7fe2036dfa8db8fb6131ab9642783fc9578b07a20995252d2de"
+SRC_URI[sha256sum] = "4a39a2f624b8512d500d5840173eda7fa85f51c109052eae806acece85d345f0"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.25.1

