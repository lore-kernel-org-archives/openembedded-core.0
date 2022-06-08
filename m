Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Steve Sakoman" <steve@sakoman.com>
Subject: [OE-core][kirkstone 09/22] gtk+3: upgrade 3.24.33 -> 3.24.34
Date: Wed,  8 Jun 2022 04:39:22 -1000
Message-Id: <daf12b551c7bb43c5a3245e8d90ab7908b5fecf8.1654698895.git.steve@sakoman.com>
In-Reply-To: <cover.1654698895.git.steve@sakoman.com>
References: <cover.1654698895.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Overview of Changes in GTK+ 3.24.34, 05-18-2022
===============================================
* Include legacy hicolor icons
* Fix the build with gcc 12
* MacOS:
 - Restore QUARTZ_RELOCATION support
* X11:
 - Trap errors when getting output properties
* Wayland:
 - Ignore empty preedit updates This fixes a problem with
   textview scrolling
* Translation updates
 Danish
 Dutch
 French
 German
 Hungarian
 Italian
 Kazakh
 Latvian
 Lithuanian
 Norwegian Bokmål
 Swedish

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a652d392a47aa7c0652aac941fb7d550aea192ae)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-gnome/gtk+/{gtk+3_3.24.33.bb => gtk+3_3.24.34.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.24.33.bb => gtk+3_3.24.34.bb} (89%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb b/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb
similarity index 89%
rename from meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb
index fb9e29dd8c..f862e143d4 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb
@@ -7,7 +7,7 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
            file://0003-Add-disable-opengl-configure-option.patch \
            file://link_fribidi.patch \
            "
-SRC_URI[sha256sum] = "588b06522e25d1579e989b6f9d8a1bdbf2fe13cde01a04e904ff346a225e7801"
+SRC_URI[sha256sum] = "dbc69f90ddc821b8d1441f00374dc1da4323a2eafa9078e61edbe5eeefa852ec"
 
 S = "${WORKDIR}/gtk+-${PV}"
 
-- 
2.25.1

