Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Steve Sakoman" <steve@sakoman.com>
Subject: [OE-core][kirkstone 17/28] webkitgtk: upgrade 2.36.4 -> 2.36.5
Date: Tue, 23 Aug 2022 12:35:29 -1000
Message-Id: <c13a40b162fba43f167e5841f6cd15c2c1ed1ab6.1661293746.git.steve@sakoman.com>
In-Reply-To: <cover.1661293745.git.steve@sakoman.com>
References: <cover.1661293745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

From: Alexander Kanavin <alex.kanavin@gmail.com>

This is a bug fix release in the stable 2.36 series.

What’s new in the WebKitGTK 2.36.5 release?

- Add support for PAC proxy in the WebDriver implementation.
- Fix video playback when loaded through custom URIs, this fixes video playback in the Yelp documentation browser.
- Fix WebKitWebView::context-menu when using GTK4.
- Fix LTO builds with GCC.
- Fix several crashes and rendering issues.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 31e57deaed0fd46396d22dd6fcb75e955c1aa2f6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../webkit/{webkitgtk_2.36.4.bb => webkitgtk_2.36.5.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.36.4.bb => webkitgtk_2.36.5.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.36.4.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.36.5.bb
index df4ff63121..b3fe357010 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch \
            "
 
-SRC_URI[sha256sum] = "b6bebe1f85a479d968c19e44a4704622ef8cef61636ad1b2406b77d16ae2e2a8"
+SRC_URI[sha256sum] = "d5532fa884c943dc48f1911473dd663aba407a3b35caa7b04bac1419b41e5908"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
-- 
2.25.1

