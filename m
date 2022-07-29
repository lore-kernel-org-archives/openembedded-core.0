Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Steve Sakoman" <steve@sakoman.com>
Subject: [OE-core][kirkstone 17/29] webkitgtk: upgrade 2.36.3 -> 2.36.4
Date: Fri, 29 Jul 2022 04:46:33 -1000
Message-Id: <fde20b5b6bb030b6c5538938ac9a6e178576d9dd.1659105705.git.steve@sakoman.com>
In-Reply-To: <cover.1659105705.git.steve@sakoman.com>
References: <cover.1659105705.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

From: Alexander Kanavin <alex.kanavin@gmail.com>

Changes:

Fix the new ATSPI accessibility implementation to add the missing Collection interface for the loaded document.
Fix the MediaSession implementation to make the MPRIS object names more sandbox friendly, which plays better with Flatpak and WebKit’s own Bubblwrap-based sandboxing.
Fix leaked Web Processes in some particular situations.
Fix the build with media capture support enabled.
Fix cross-compilation when targeting 64-bit ARM.
Fix several crashes and rendering issues.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2396f8de9b6b9690dd70961084514da7d237f2ad)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../webkit/{webkitgtk_2.36.3.bb => webkitgtk_2.36.4.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.36.3.bb => webkitgtk_2.36.4.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.4.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.36.3.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.36.4.bb
index 83b6f8a6ee..df4ff63121 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.3.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.4.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch \
            "
 
-SRC_URI[sha256sum] = "732fcf8c4ec644b8ed28b46ebbd7c1ebab9d9e0afea9bdf5e5d12786afc478d1"
+SRC_URI[sha256sum] = "b6bebe1f85a479d968c19e44a4704622ef8cef61636ad1b2406b77d16ae2e2a8"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
-- 
2.25.1

