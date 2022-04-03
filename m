Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Subject: [PATCH] vte: upgrade 0.66.2 -> 0.68.0
Date: Sun,  3 Apr 2022 19:47:36 +0200
Message-Id: <20220403174736.3463609-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/recipes-support/vte/{vte_0.66.2.bb => vte_0.68.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/vte/{vte_0.66.2.bb => vte_0.68.0.bb} (95%)

diff --git a/meta/recipes-support/vte/vte_0.66.2.bb b/meta/recipes-support/vte/vte_0.68.0.bb
similarity index 95%
rename from meta/recipes-support/vte/vte_0.66.2.bb
rename to meta/recipes-support/vte/vte_0.68.0.bb
index af1c47cf80..fc4324872d 100644
--- a/meta/recipes-support/vte/vte_0.66.2.bb
+++ b/meta/recipes-support/vte/vte_0.68.0.bb
@@ -21,7 +21,7 @@ inherit gnomebase gtk-doc features_check upstream-version-is-even gobject-intros
 # vapigen.m4 is required when vala is not present (but the one from vala should be used normally)
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
             file://0001-Makefile.docs-correctly-substitute-gtkdoc-qemu-wrapp.patch"
-SRC_URI[archive.sha256sum] = "e89974673a72a0a06edac6d17830b82bb124decf0cb3b52cebc92ec3ff04d976"
+SRC_URI[archive.sha256sum] = "13e7d4789ca216a33780030d246c9b13ddbfd04094c6316eea7ff92284dd1749"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.34.1

