Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1E6B8783B0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 05:51:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.41,386,1498492800"; d="scan'208";a="23863698"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Aug 2017 13:51:05 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 655C0472438E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 13:51:02 +0800 (CST)
Received: from localhost.localdomain (10.167.235.93) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Thu, 17 Aug 2017 13:51:02 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Aug 2017 13:50:48 +0800
Message-ID: <1502949048-4092-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.235.93]
X-yoursite-MailScanner-ID: 655C0472438E.A52F6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] pango: 1.40.6 -> 1.40.10
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
X-List-Received-Date: Thu, 17 Aug 2017 05:51:06 -0000
Content-Type: text/plain

1) Upgrade pango from 1.40.6 to 1.40.10.
2) Modify 0001-Enforce-recreation-of-docs-pango.types-it-is-build-c.patch for pango 1.40.10.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 ...reation-of-docs-pango.types-it-is-build-c.patch | 104 ++-------------------
 .../pango/{pango_1.40.6.bb => pango_1.40.10.bb}    |   4 +-
 2 files changed, 10 insertions(+), 98 deletions(-)
 rename meta/recipes-graphics/pango/{pango_1.40.6.bb => pango_1.40.10.bb} (92%)

diff --git a/meta/recipes-graphics/pango/pango/0001-Enforce-recreation-of-docs-pango.types-it-is-build-c.patch b/meta/recipes-graphics/pango/pango/0001-Enforce-recreation-of-docs-pango.types-it-is-build-c.patch
index 6784a10..481f267 100644
--- a/meta/recipes-graphics/pango/pango/0001-Enforce-recreation-of-docs-pango.types-it-is-build-c.patch
+++ b/meta/recipes-graphics/pango/pango/0001-Enforce-recreation-of-docs-pango.types-it-is-build-c.patch
@@ -1,6 +1,3 @@
-From 526a6a9fc9a1cfe75c521c8bb39b61754fe42fe8 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 2 Sep 2016 14:00:24 +0300
 Subject: [PATCH] Enforce recreation of docs/pango.types; it is build
  configuration-specific.
 
@@ -8,14 +5,15 @@ In particular, it needs to exclude references to PangoXft if Xft is not availabl
 
 Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+Update for pango 1.40.10.
+Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
 ---
- docs/Makefile.am | 17 ++++--------
- docs/pango.types | 80 --------------------------------------------------------
- 2 files changed, 5 insertions(+), 92 deletions(-)
- delete mode 100644 docs/pango.types
+ docs/Makefile.am | 17 +++++------------
+ 1 file changed, 5 insertions(+), 12 deletions(-)
 
 diff --git a/docs/Makefile.am b/docs/Makefile.am
-index f5f1317..8947a99 100644
+index f5f1317..76b8661 100644
 --- a/docs/Makefile.am
 +++ b/docs/Makefile.am
 @@ -49,6 +49,10 @@ IGNORE_HFILES=			\
@@ -52,96 +50,10 @@ index f5f1317..8947a99 100644
  	version.xml.in			\
 -	check.docs			\
 -	pango.types
-+	check.docs
++        check.docs
  
  # force doc rebulid after configure
  dist-hook-local: dist-local-check-no-cross-references all-local
-diff --git a/docs/pango.types b/docs/pango.types
-deleted file mode 100644
-index 7d93cda..0000000
---- a/docs/pango.types
-+++ /dev/null
-@@ -1,80 +0,0 @@
--#include <pango/pango-attributes.h>
--#include <pango/pango-context.h>
--#include <pango/pango-engine.h>
--#include <pango/pango-enum-types.h>
--#include <pango/pango-font.h>
--#include <pango/pango-fontmap.h>
--#include <pango/pango-fontset.h>
--#include <pango/pango-glyph-item.h>
--#include <pango/pango-glyph.h>
--#include <pango/pango-item.h>
--#include <pango/pango-language.h>
--#include <pango/pango-layout.h>
--#include <pango/pango-matrix.h>
--#include <pango/pango-ot.h>
--#include <pango/pango-renderer.h>
--#include <pango/pango-tabs.h>
--#include <pango/pangocairo-fc.h>
--#include <pango/pangocairo.h>
--#include <pango/pangofc-decoder.h>
--#include <pango/pangofc-font.h>
--#include <pango/pangofc-fontmap.h>
--#include <pango/pangoft2.h>
--#include <pango/pangoxft-render.h>
--#include <pango/pangoxft.h>
--
--pango_alignment_get_type
--pango_attr_list_get_type
--pango_attr_type_get_type
--pango_bidi_type_get_type
--pango_cairo_fc_font_map_get_type
--pango_cairo_font_get_type
--pango_cairo_font_map_get_type
--pango_color_get_type
--pango_context_get_type
--pango_coverage_level_get_type
--pango_direction_get_type
--pango_ellipsize_mode_get_type
--pango_engine_get_type
--pango_engine_lang_get_type
--pango_engine_shape_get_type
--pango_fc_decoder_get_type
--pango_fc_font_get_type
--pango_fc_font_map_get_type
--pango_font_description_get_type
--pango_font_face_get_type
--pango_font_family_get_type
--pango_font_get_type
--pango_font_map_get_type
--pango_font_mask_get_type
--pango_font_metrics_get_type
--pango_fontset_get_type
--pango_fontset_simple_get_type
--pango_ft2_font_map_get_type
--pango_glyph_item_get_type
--pango_glyph_item_iter_get_type
--pango_glyph_string_get_type
--pango_gravity_get_type
--pango_gravity_hint_get_type
--pango_item_get_type
--pango_language_get_type
--pango_layout_get_type
--pango_layout_iter_get_type
--pango_layout_line_get_type
--pango_matrix_get_type
--pango_ot_info_get_type
--pango_ot_ruleset_get_type
--pango_render_part_get_type
--pango_renderer_get_type
--pango_script_get_type
--pango_stretch_get_type
--pango_style_get_type
--pango_tab_align_get_type
--pango_tab_array_get_type
--pango_underline_get_type
--pango_variant_get_type
--pango_weight_get_type
--pango_wrap_mode_get_type
--pango_xft_font_get_type
--pango_xft_font_map_get_type
--pango_xft_renderer_get_type
 -- 
-2.9.3
+2.7.4
 
diff --git a/meta/recipes-graphics/pango/pango_1.40.6.bb b/meta/recipes-graphics/pango/pango_1.40.10.bb
similarity index 92%
rename from meta/recipes-graphics/pango/pango_1.40.6.bb
rename to meta/recipes-graphics/pango/pango_1.40.10.bb
index 31c3d2a..e5ce6cd 100644
--- a/meta/recipes-graphics/pango/pango_1.40.6.bb
+++ b/meta/recipes-graphics/pango/pango_1.40.10.bb
@@ -17,8 +17,8 @@ SRC_URI += "file://run-ptest \
             file://0001-Drop-introspection-macros-from-acinclude.m4.patch \
             file://0001-Enforce-recreation-of-docs-pango.types-it-is-build-c.patch \
 "
-SRC_URI[archive.md5sum] = "507c6746fbf53fc9d48c577f1e265de3"
-SRC_URI[archive.sha256sum] = "ca152b7383a1e9f7fd74ae96023dc6770dc5043414793bfe768ff06b6759e573"
+SRC_URI[archive.md5sum] = "a612e445157c688a3efe878938e7f4c6"
+SRC_URI[archive.sha256sum] = "5d41d94a1f70e92ba5808e13f2bf3ef198901ddc0dc7e74e5afde994724466f6"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz"
 
-- 
2.7.4




