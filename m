Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Steve Sakoman" <steve@sakoman.com>
Subject: [OE-core][kirkstone 16/31] webkitgtk: upgrade 2.36.0 -> 2.36.1
Date: Tue, 17 May 2022 08:24:02 -1000
Message-Id: <cf336712afc3899ef45c7f2ef5f6b081223a1269.1652811454.git.steve@sakoman.com>
In-Reply-To: <cover.1652811454.git.steve@sakoman.com>
References: <cover.1652811454.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

From: Alexander Kanavin <alex.kanavin@gmail.com>

This is the first bug fix release in the stable 2.36 series.

What’s new in the WebKitGTK 2.36.1 release?

- Fix the build with accessibility disabled.
- Fix several crashes and rendering issues.
- Translation updates: Croatian.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4ed608d33fe5f38bc172e0cc6d938ffab184a47a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../webkitgtk/add_missing_include.patch       | 19 -------------------
 ...ebkitgtk_2.36.0.bb => webkitgtk_2.36.1.bb} |  3 +--
 2 files changed, 1 insertion(+), 21 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/add_missing_include.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.36.0.bb => webkitgtk_2.36.1.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/add_missing_include.patch b/meta/recipes-sato/webkit/webkitgtk/add_missing_include.patch
deleted file mode 100644
index 8f59db3130..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/add_missing_include.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Include locale.h for LC_MESSAGE definition
-
-This fixes build error
-Source/WebCore/accessibility/atspi/AccessibilityRootAtspi.cpp:115:51: error: use of undeclared identifier 'LC_MESSAGES'
-            return g_variant_new_string(setlocale(LC_MESSAGES, nullptr));
-                                                  ^
-Upstream-Status: Submitted [https://bugs.webkit.org/show_bug.cgi?id=239030]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- a/Source/WebCore/accessibility/atspi/AccessibilityRootAtspi.cpp
-+++ b/Source/WebCore/accessibility/atspi/AccessibilityRootAtspi.cpp
-@@ -30,6 +30,7 @@
- #include "FrameView.h"
- #include "Page.h"
- #include <glib/gi18n-lib.h>
-+#include <locale.h>
- 
- namespace WebCore {
- 
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.1.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.36.0.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.36.1.bb
index db8a565511..65757c36a7 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.0.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.1.bb
@@ -15,10 +15,9 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-Fix-build-without-opengl-or-es.patch \
            file://reproducibility.patch \
            file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch \
-           file://add_missing_include.patch \
            "
 
-SRC_URI[sha256sum] = "b877cca1f105235f5dd57c7ac2b2c2be3c6b691ff444f93925c7254cf156c64d"
+SRC_URI[sha256sum] = "0149ea5fb1d20f2a9981677d45c952a047330001ea24a8dc29035239f12c0c8f"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
-- 
2.25.1

