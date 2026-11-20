Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1171.1795158403849005204
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 23:06:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=NjM7KIWc;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=UwYx65I8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a1f7c76799-6d46a400-9e0d-436a-b147-3b652167b6bc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795158403;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=i83dx6ydyJ2NREfNIZVjyydNjeJdc6zq6hII7ScYo4M=;
	b=NjM7KIWcoxiNr8DXpKTAUHdeRfh/12cSZS07zohfMETHKgaKiY99IW97BxCjrIlc
	3hQqub0BhEktQfpaozbfMvWXtxZDDEOcvwDuHqn6MXWNpNZ3GAHa3eqtLaKpwpUyRiu
	D/etxVuSMvG9mDPB0DvBQ3QIaGx35moTskTvsgQs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795158403;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=i83dx6ydyJ2NREfNIZVjyydNjeJdc6zq6hII7ScYo4M=;
	b=UwYx65I8KX1MBkCv2AZ0X1/yTCSKyqo6iRiBxQVy8HurNAWVpLFESecA4cIATA9J
	pSPS1XPNR3VltbS/rxU5xz6eqgBp82+hnXxV4xrSOd30LlZcOgFzx/XprlXQxbB4ypx
	dwnE2LgwWkOdGKWgm1CKJLfVacFvCO7ZcgLWkRuY=
Content-Type: multipart/mixed; boundary="===============6527912549401865774=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] harfbuzz: upgrading to 15.2.0 SUCCEEDED
Message-ID: <010101a1f7c76799-6d46a400-9e0d-436a-b147-3b652167b6bc-000000@us-west-2.amazonses.com>
Date: Fri, 20 Nov 2026 07:06:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.20-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 07:06:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250737

--===============6527912549401865774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *harfbuzz* to *15.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-harfbuzz-upgrade-15.0.0-15.2.0.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 6df939b49357340569cf00633552bae7fa8fe52e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 20 Nov 2026 06:53:01 +0000
Subject: [PATCH] harfbuzz: upgrade 15.0.0 -> 15.2.0

Overview of changes leading to 15.2.0
Friday, November 20, 2026
=====================================
- Performance and hardening:

- New features:
- Shaping:
- Script-specific shaping:
- AAT shaping:
- Other shapers and font functions:
- Core library:
- Subsetting:
- Rendering libraries:
- Tools, documentation, and build:

- New API:
  +hb_font_create_without_funcs_or_fail()
  +hb_ot_layout_get_extender_glyphs()

Overview of changes leading to 15.1.0
Wednesday, November 4, 2026
=====================================
- Add buffer deserialization APIs that report progress as a byte offset, for
  use from introspection bindings.
- Fix Indic shaping of the Unicode 18 Devanagari and Bengali additions.
- Fix Arabic fallback shaping: wrong ligatures when a component is missing from
  the font, and disappearing marks in legacy fonts.
- Fix `COLR` glyph extents and mark positioning in fonts with empty layers.
- Fix AAT shaping: wrong `kerx` kerning (formats 1 and 2) and mark positioning
  (format 4, a 14.3.0 regression), and ignored `kern` and `mort` tables with a
  non-first initial state.
- Various fixes to the Graphite2 shaper.
- Report HarfRust shaping failures through `hb_buffer_allocation_successful()`.
- Fix wrong outlines in `gvar` fonts with intermediate tuples.
- Fix `hb_face_create_or_fail()` rejecting face indices with named-instance
  bits set.
- Fix wrong fallback metrics: the vertical descender in fonts without `vhea`,
  and the hanging baseline for some scripts.
- Fix `hb_ot_layout_lookup_collect_glyph_alternates()` collecting garbage from
  `AlternateSubst` and `SingleSubst` format 1 lookups.
- Speed up shaping on faces with many shape plans, `hb_language_from_string()`,
  vertical text with `hb-ft`, and `CBDT` and `sbix` fonts.
- Fix crashes and deadlocks with FreeType, including `hb_ft_font_set_funcs()` on
  immutable fonts and font queries from color paint callbacks.
- Fix crashes with NULL result pointers in
  `hb_ot_metrics_get_position_with_fallback()`,
  `hb_ot_layout_get_font_extents()`, and `hb_ot_layout_get_font_extents2()`.
- Fix use-after-free in `hb_map_update()` when updating a map from itself.
- Various fixes for crashes, hangs, and memory use with malformed fonts.
- Faster subsetting of large `GSUB` and `GPOS` tables, and smaller `CFF` output.
- Partially instancing or desubroutinizing `CFF2` fonts with nested blends now
  fails instead of changing the outlines.
- Subsetting now fails if a glyph mapping assigns another glyph to glyph 0.
- Fix `hb_subset_axis_range_from_string()` reading past the given length.
- Fix subsetting beyond-64k variable fonts losing `HVAR` advance deltas.
- Various subsetting and instancing fixes, mostly for `CFF`, `CFF2`, and `COLR`.
- Fix rotated and skewed rectangle clips hiding their contents in the raster
  library, and out-of-bounds access when extents change during painting.
- Fix the vector library mirroring path clips in SVG, and writing PDFs with
  wrong page bounds and misplaced or clipped `COLR` gradients.
- Fix wrong clipping of `COLR` layers in the GPU library.
- Various Cairo integration fixes, including a memory leak per scaled font.
- Fix `hb-info --list-*` crashes on unusual fonts.
- Various build and CI fixes.

- New API:
  +hb_buffer_deserialize_glyphs2()
  +hb_buffer_deserialize_unicode2()
---
 .../harfbuzz/{harfbuzz_15.0.0.bb => harfbuzz_15.2.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_15.0.0.bb => harfbuzz_15.2.0.bb} (96%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_15.0.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_15.2.0.bb
similarity index 96%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_15.0.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_15.2.0.bb
index ec829e0a24..fac63c9cb3 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_15.0.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_15.2.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "968536e9abd782f07f7954044c0c4020199fcdd39b41d221ec42d2a3be4a44df"
+SRC_URI[sha256sum] = "e2ec49090744383cdbe7df808c1cedaafba06a97be8dc4211fe546ba585f12cb"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection github-releases
 
-- 
2.47.1


--===============6527912549401865774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-bin: PKGSIZE changed from 226056 to 230152 (+2%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-bin: PKGV changed from 15.0.0 [default] to 15.2.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-bin: PV changed from "15.0.0" to "15.2.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: FILES: removed "/usr/lib/libharfbuzz-cairo.so.0.61500.0", added "/usr/lib/libharfbuzz-cairo.so.0.61520.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: PKGV changed from 15.0.0 [default] to 15.2.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: FILELIST: removed "/usr/lib/libharfbuzz-cairo.so.0.61500.0", added "/usr/lib/libharfbuzz-cairo.so.0.61520.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: PV changed from "15.0.0" to "15.2.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: PKGSIZE changed from 127202240 to 128131064 (+1%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: PKGV changed from 15.0.0 [default] to 15.2.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: FILELIST: removed "/usr/lib/.debug/libharfbuzz-subset.so.0.61500.0 /usr/lib/.debug/libharfbuzz-cairo.so.0.61500.0 /usr/lib/.debug/libharfbuzz-gobject.so.0.61500.0 /usr/lib/.debug/libharfbuzz.so.0.61500.0 /usr/lib/.debug/libharfbuzz-icu.so.0.61500.0", added "/usr/lib/.debug/libharfbuzz.so.0.61520.0 /usr/lib/.debug/libharfbuzz-subset.so.0.61520.0 /usr/lib/.debug/libharfbuzz-icu.so.0.61520.0 /usr/lib/.debug/libharfbuzz-cairo.so.0.61520.0 /usr/lib/.debug/libharfbuzz-gobject.so.0.61520.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: PV changed from "15.0.0" to "15.2.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: PKGSIZE changed from 1944979 to 1957695 (+1%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: PKGV changed from 15.0.0 [default] to 15.2.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: PV changed from "15.0.0" to "15.2.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-doc: PKGV changed from 15.0.0 [default] to 15.2.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-doc: PV changed from "15.0.0" to "15.2.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: FILES: removed "/usr/lib/libharfbuzz-gobject.so.0.61500.0", added "/usr/lib/libharfbuzz-gobject.so.0.61520.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: PKGV changed from 15.0.0 [default] to 15.2.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.61500.0", added "/usr/lib/libharfbuzz-gobject.so.0.61520.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: PV changed from "15.0.0" to "15.2.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: FILES: removed "/usr/lib/libharfbuzz-icu.so.0.61500.0", added "/usr/lib/libharfbuzz-icu.so.0.61520.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: PKGV changed from 15.0.0 [default] to 15.2.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.61500.0", added "/usr/lib/libharfbuzz-icu.so.0.61520.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: PV changed from "15.0.0" to "15.2.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-locale: PKGV changed from 15.0.0 [default] to 15.2.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-locale: PV changed from "15.0.0" to "15.2.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: PKGSIZE changed from 5862885 to 6067592 (+3%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: PKGV changed from 15.0.0 [default] to 15.2.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: FILELIST: directory renamed /usr/src/debug/harfbuzz/15.0.0/src/OT/Layout/GDEF -> /usr/src/debug/harfbuzz/15.2.0/src/OT/Layout/GDEF, directory renamed /usr/src/debug/harfbuzz/15.0.0/src/OT/Color/CBDT -> /usr/src/debug/harfbuzz/15.2.0/src/OT/Color/CBDT, directory renamed /usr/src/debug/harfbuzz/15.0.0/src/OT/Layout/GSUB -> /usr/src/debug/harfbuzz/15.2.0/src/OT/Layout/GSUB, directory renamed /usr/src/debug/harfbuzz/15.0.0/src/OT/Color/svg -> /usr/src/debug/harfbuzz/15.2.0/src/OT/Color/svg, directory renamed /usr/src/debug/harfbuzz/15.0.0/src/OT/Layout/Common -> /usr/src/debug/harfbuzz/15.2.0/src/OT/Layout/Common, directory renamed /usr/src/debug/harfbuzz/15.0.0/src/OT/Color/sbix -> /usr/src/debug/harfbuzz/15.2.0/src/OT/Color/sbix, directory renamed /usr/src/debug/harfbuzz/15.0.0/src/OT/Color/CPAL -> /usr/src/debug/harfbuzz/15.2.0/src/OT/Color/CPAL, directory renamed /usr/src/debug/harfbuzz/15.0.0/util -> /usr/src/debug/harfbuzz/15.2.0
 /util, directory renamed /usr/src/debug/harfbuzz/15.0.0/src/OT/Color/COLR -> /usr/src/debug/harfbuzz/15.2.0/src/OT/Color/COLR, directory renamed /usr/src/debug/harfbuzz/15.0.0/src/OT/Layout/GPOS -> /usr/src/debug/harfbuzz/15.2.0/src/OT/Layout/GPOS, directory renamed /usr/src/debug/harfbuzz/15.0.0/src/OT/name -> /usr/src/debug/harfbuzz/15.2.0/src/OT/name, directory renamed /usr/src/debug/harfbuzz/15.0.0/src/OT/glyf -> /usr/src/debug/harfbuzz/15.2.0/src/OT/glyf, directory renamed /usr/src/debug/harfbuzz/15.0.0/src/graph -> /usr/src/debug/harfbuzz/15.2.0/src/graph, directory renamed /usr/src/debug/harfbuzz/15.0.0/src/OT/Var/VARC -> /usr/src/debug/harfbuzz/15.2.0/src/OT/Var/VARC, removed "/usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shaper-arabic.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-name.h /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-dual.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-cff1-table.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-atomic.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-cff2
 -table.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shape-fallback.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-number.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-map.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shaper-arabic.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-buffer-serialize.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-gobject-enums.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-plan.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-draw.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-accelerator.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-cache.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-shape-plan.h /usr/src/debug/harfbuzz/15.0.0/src/hb-geometry.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-shaper-list.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-subset.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-cff-interp-common.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shaper-indic.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-map.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-utf.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-hdmx-t
 able.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-head-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-hhea-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-hmtx-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-cairo-utils.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-null.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-post-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-vorg-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-layout-gpos-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-cff-interp-cs-common.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-input.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-cff2-to-cff1.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-version.h /usr/src/debug/harfbuzz/15.0.0/src/hb-cairo.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-set.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-plan-layout.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-cff2.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-number-parser.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-table-color.cc /usr/src
 /debug/harfbuzz/15.0.0/src/hb-subset-table-other.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-var-common.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-paint.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-shape.h /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-font.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shaper-vowel-constraints.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-sanitize.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-script-list.h /usr/src/debug/harfbuzz/15.0.0/src/hb-style.h /usr/src/debug/harfbuzz/15.0.0/src/hb-glib.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-priority-queue.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-name-language.hh /usr/src/debug/harfbuzz/15.0.0/src/hb.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-subset.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-depend.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-shape-plan.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-meta.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-var.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shaper-khmer.cc /usr/src/debug/harfbuzz/15.0.0/
 src/hb-object.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-bit-set-invertible.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-dispatch.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-var-avar-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-var-cvar-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shaper-syllabic.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-var-fvar-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-var-gvar-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-var-hvar-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-machinery.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-depend.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-instancer-iup.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-var-mvar-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-blob.h /usr/src/debug/harfbuzz/15.0.0/src/hb-depend-data.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-deprecated.h /usr/src/debug/harfbuzz/15.0.0/src/hb-aat-layout-ankr-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-aat-layout-morx-table.hh /usr/src/debug/ha
 rfbuzz/15.0.0/src/hb-aat-layout-kerx-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-cplusplus.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-subset.h /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-layout-common.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-serialize.h /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shaper-arabic-pua.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-cff-specializer.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-cff1-interp-cs.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-paint.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ft.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-aat-layout.h /usr/src/debug/harfbuzz/15.0.0/src/hb-map.h /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-instancer-iup.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-fetch.h /usr/src/debug/harfbuzz/15.0.0/src/hb-paint-extents.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ucd-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-common.h /usr/src/debug/harfbuzz/15.0.0/src/hb-deprecated.h /usr/src/debug/harfbuzz/15.0.0/src/hb-free-pool.hh /usr/src/de
 bug/harfbuzz/15.0.0/src/hb-string-array.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-cff-common.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-paint-bounded.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-aat-layout.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shaper-arabic-joining-list.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-icu.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-limits.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-bit-page.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-set-digest.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-static.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-vector.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-gobject-structs.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-instancer-solver.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shaper.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-layout.h /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-plan-member-list.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shaper-default.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-instancer-solver.cc /usr/src/debug
 /harfbuzz/15.0.0/src/hb-subset-input.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-fetch.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-gobject-enums.h /usr/src/debug/harfbuzz/15.0.0/src/hb-draw.h /usr/src/debug/harfbuzz/15.0.0/src/hb-blob.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ft-colr.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-face.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-buffer.h /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shaper-arabic-fallback.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-os2-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-aat-ltag-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-cff1-std-str.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ucd.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-var.h /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-tag-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-metrics.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-aat-layout.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-alloc-pool.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shape-fallback.hh /usr/src/debug/harfbuzz/1
 5.0.0/src/hb-ot-layout-base-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-unicode.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-font.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-metrics.h /usr/src/debug/harfbuzz/15.0.0/src/hb-shaper.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shaper-vowel-constraints.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shaper-syllabic.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-decycler.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-cff1-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-buffer-verify.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-cff2-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-cmap-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-kern-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-math-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-maxp-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-layout-gsub-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-face-builder.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shaper-myanmar.cc /usr/src/debug/harfbuzz/15.
 0.0/src/hb-repacker.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-cff2-round.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-layout-gsubgpos.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-name.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-os2-unicode-ranges.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-serialize.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-cff-common.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-tag.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-plan.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-table-layout.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shaper-indic.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-fallback-shape.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-math.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shaper-use.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-number.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-paint-extents.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shape-normalize.hh /usr/src/debug/harfbuzz/15.0.0/src
 /hb-subset-plan-var.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shaper-indic-table.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-font.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-font.h /usr/src/debug/harfbuzz/15.0.0/src/hb-algs.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-shape.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-cff-common.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-common.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-outline.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-unicode.h /usr/src/debug/harfbuzz/15.0.0/src/hb-ft.h /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-stat-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-cairo-utils.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-math.h /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-table-cff.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-table-var.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-paint.h /usr/src/debug/harfbuzz/15.0.0/src/hb-map.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-aat-layout-trak-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-aat-layout-ju
 st-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-aat-layout-feat-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-aat-layout-common.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-font.h /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shape-normalize.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-name-language-static.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-layout.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-post-macroman.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shaper-arabic-win1256.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shaper-use-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-shape-plan.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-aat-map.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-cff2-interp-cs.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-map.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-mutex.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-blob.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-debug.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-meta.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-cff1.cc /usr/src/d
 ebug/harfbuzz/15.0.0/src/hb-set.h /usr/src/debug/harfbuzz/15.0.0/src/hb-cairo.h /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-meta-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-bit-set.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-open-file.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-open-type.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-buffer.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-iter.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-depend.h /usr/src/debug/harfbuzz/15.0.0/src/hb-cff-width-optimizer.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-face.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-unicode-emoji-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-face-table-list.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-post-table-v2subset.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shaper-arabic-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-aat-map.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-metrics.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-draw.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shaper-thai.cc /
 usr/src/debug/harfbuzz/15.0.0/src/hb-outline.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-face.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-unicode.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-buffer.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-face.h /usr/src/debug/harfbuzz/15.0.0/src/hb-set.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-meta.h /usr/src/debug/harfbuzz/15.0.0/src/hb-array.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-kern.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-face.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-layout.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shape.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shaper-hangul.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shaper-hebrew.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-cff-interp-dict-common.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-paint-bounded.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-multimap.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-color.h /usr/src/debug/harfbuzz/15.0.0/src/hb-bimap.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-col
 or.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shape.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-style.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-result.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-serialize.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-shaper.hh", added "/usr/src/debug/harfbuzz/15.2.0/src/hb-ot-shaper-arabic.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-name.h /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-dual.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-cff1-table.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-atomic.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-cff2-table.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-shape-fallback.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-number.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-map.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-shaper-arabic.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-buffer-serialize.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-gobject-enums.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-subset-plan.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-draw.cc 
 /usr/src/debug/harfbuzz/15.2.0/src/hb-subset-accelerator.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-cache.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-shape-plan.h /usr/src/debug/harfbuzz/15.2.0/src/hb-geometry.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-shaper-list.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-subset.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-cff-interp-common.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-shaper-indic.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-map.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-utf.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-hdmx-table.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-head-table.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-hhea-table.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-hmtx-table.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-cairo-utils.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-null.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-post-table.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-vorg-table.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-layout-gpos-
 table.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-cff-interp-cs-common.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-subset-input.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-subset-cff2-to-cff1.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-version.h /usr/src/debug/harfbuzz/15.2.0/src/hb-cairo.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-set.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-subset-plan-layout.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-subset-cff2.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-number-parser.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-subset-table-color.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-subset-table-other.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-var-common.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-paint.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-shape.h /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-font.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-shaper-vowel-constraints.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-sanitize.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-script-list.h /usr/src/debug/
 harfbuzz/15.2.0/src/hb-style.h /usr/src/debug/harfbuzz/15.2.0/src/hb-glib.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-priority-queue.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-name-language.hh /usr/src/debug/harfbuzz/15.2.0/src/hb.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-subset.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-depend.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-shape-plan.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-meta.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-var.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-shaper-khmer.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-object.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-bit-set-invertible.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-dispatch.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-var-avar-table.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-var-cvar-table.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-shaper-syllabic.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-var-fvar-table.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-var-gvar-table.hh /usr/src/deb
 ug/harfbuzz/15.2.0/src/hb-ot-var-hvar-table.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-machinery.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-depend.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-subset-instancer-iup.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-var-mvar-table.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-blob.h /usr/src/debug/harfbuzz/15.2.0/src/hb-depend-data.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-deprecated.h /usr/src/debug/harfbuzz/15.2.0/src/hb-aat-layout-ankr-table.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-aat-layout-morx-table.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-aat-layout-kerx-table.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-cplusplus.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-subset.h /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-layout-common.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-subset-serialize.h /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-shaper-arabic-pua.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-cff-specializer.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-cff1-interp-cs.hh /
 usr/src/debug/harfbuzz/15.2.0/src/hb-paint.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ft.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-aat-layout.h /usr/src/debug/harfbuzz/15.2.0/src/hb-map.h /usr/src/debug/harfbuzz/15.2.0/src/hb-subset-instancer-iup.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-fetch.h /usr/src/debug/harfbuzz/15.2.0/src/hb-paint-extents.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-ucd-table.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-common.h /usr/src/debug/harfbuzz/15.2.0/src/hb-deprecated.h /usr/src/debug/harfbuzz/15.2.0/src/hb-free-pool.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-string-array.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-subset-cff-common.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-paint-bounded.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-aat-layout.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-bit-vector.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-icu.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-limits.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-bit-page.hh /usr/src/debug/harfbuzz/15.2.0/
 src/hb-ot-shaper-arabic-joining-list.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-set-digest.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-static.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-vector.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-gobject-structs.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-subset-instancer-solver.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-shaper.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-layout.h /usr/src/debug/harfbuzz/15.2.0/src/hb-subset-plan-member-list.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-shaper-default.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-subset-instancer-solver.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-subset-input.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-fetch.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-gobject-enums.h /usr/src/debug/harfbuzz/15.2.0/src/hb-draw.h /usr/src/debug/harfbuzz/15.2.0/src/hb-blob.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ft-colr.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-face.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-buffer.h /usr/s
 rc/debug/harfbuzz/15.2.0/src/hb-ot-shaper-arabic-fallback.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-os2-table.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-subset-hinting.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-aat-ltag-table.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-cff1-std-str.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ucd.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-var.h /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-tag-table.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-metrics.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-aat-layout.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-alloc-pool.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-shape-fallback.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-layout-base-table.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-unicode.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-font.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-metrics.h /usr/src/debug/harfbuzz/15.2.0/src/hb-shaper.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-shaper-vowel-constraints.cc /usr/src/debug/harfbuzz/15.
 2.0/src/hb-ot-shaper-syllabic.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-decycler.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-cff1-table.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-buffer-verify.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-cff2-table.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-cmap-table.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-kern-table.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-math-table.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-maxp-table.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-layout-gsub-table.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-face-builder.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-shaper-myanmar.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-repacker.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-subset-cff2-round.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-layout-gsubgpos.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-name.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-os2-unicode-ranges.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-subset-serialize.cc /usr/src/debug/
 harfbuzz/15.2.0/src/hb-subset-table.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-cff-common.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-tag.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-subset-plan.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-subset-table-layout.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-shaper-indic.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-fallback-shape.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-math.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-shaper-use.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-number.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-paint-extents.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-shape-normalize.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-subset-plan-var.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-shaper-indic-table.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-font.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-font.h /usr/src/debug/harfbuzz/15.2.0/src/hb-algs.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-shape.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-subset-cff-commo
 n.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-common.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-layout-jstf-table.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-outline.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-unicode.h /usr/src/debug/harfbuzz/15.2.0/src/hb-ft.h /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-stat-table.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-cairo-utils.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-math.h /usr/src/debug/harfbuzz/15.2.0/src/hb-subset-table-cff.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-subset-table-var.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-paint.h /usr/src/debug/harfbuzz/15.2.0/src/hb-map.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-aat-layout-trak-table.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-aat-layout-just-table.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-aat-layout-feat-table.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-aat-layout-common.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-font.h /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-shape-normalize.cc /usr/src/debug/harfbuzz/15
 .2.0/src/hb-ot-name-language-static.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-layout.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-post-macroman.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-shaper-arabic-win1256.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-shaper-use-table.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-shape-plan.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-aat-map.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-cff2-interp-cs.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-map.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-mutex.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-blob.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-debug.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-meta.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-subset-cff1.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-set.h /usr/src/debug/harfbuzz/15.2.0/src/hb-cairo.h /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-meta-table.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-bit-set.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-open-file.hh /usr/src/debug/harfbuzz/15.2.0
 /src/hb-open-type.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-buffer.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-iter.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-subset-depend.h /usr/src/debug/harfbuzz/15.2.0/src/hb-cff-width-optimizer.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-face.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-unicode-emoji-table.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-face-table-list.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-post-table-v2subset.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-shaper-arabic-table.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-aat-map.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-metrics.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-draw.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-shaper-thai.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-outline.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-face.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-unicode.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-buffer.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-face.h /usr/src/debug/harfbuzz/15
 .2.0/src/hb-set.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-meta.h /usr/src/debug/harfbuzz/15.2.0/src/hb-array.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-kern.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-face.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-layout.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-shape.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-shaper-hangul.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-shaper-hebrew.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-cff-interp-dict-common.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-paint-bounded.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-multimap.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-color.h /usr/src/debug/harfbuzz/15.2.0/src/hb-bimap.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-color.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-ot-shape.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-style.cc /usr/src/debug/harfbuzz/15.2.0/src/hb-result.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-serialize.hh /usr/src/debug/harfbuzz/15.2.0/src/hb-shaper.hh"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: PV changed from "15.0.0" to "15.2.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-staticdev: PKGV changed from 15.0.0 [default] to 15.2.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-staticdev: PV changed from "15.0.0" to "15.2.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: PKGSIZE changed from 1427655 to 1472711 (+3%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: FILES: removed "/usr/lib/libharfbuzz-subset.so.0.61500.0", added "/usr/lib/libharfbuzz-subset.so.0.61520.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: PKGV changed from 15.0.0 [default] to 15.2.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.61500.0", added "/usr/lib/libharfbuzz-subset.so.0.61520.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: PV changed from "15.0.0" to "15.2.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: PKGSIZE changed from 1186592 to 1236512 (+4%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: PKGV changed from 15.0.0 [default] to 15.2.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz.so.0.61500.0", added "/usr/lib/libharfbuzz.so.0.61520.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: PV changed from "15.0.0" to "15.2.0"
packages/x86-64-v3-poky-linux/harfbuzz: SRC_URI changed from "https://github.com/harfbuzz/harfbuzz/releases//download/15.0.0/harfbuzz-15.0.0.tar.xz" to "https://github.com/harfbuzz/harfbuzz/releases//download/15.2.0/harfbuzz-15.2.0.tar.xz"
packages/x86-64-v3-poky-linux/harfbuzz: PKGV changed from 15.0.0 [default] to 15.2.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz: PV changed from "15.0.0" to "15.2.0"
Changes to packages/x86-64-v3-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-cairo.so.0 changed symlink target from libharfbuzz-cairo.so.0.61500.0 to libharfbuzz-cairo.so.0.61520.0
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.61500.0 to libharfbuzz-gobject.so.0.61520.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.61500.0 to libharfbuzz-icu.so.0.61520.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.61500.0 to libharfbuzz.so.0.61520.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.61500.0 to libharfbuzz-subset.so.0.61520.0
  /usr/lib/libharfbuzz-cairo.so.0.61500.0 moved to /usr/lib/libharfbuzz-cairo.so.0.61520.0
  /usr/lib/libharfbuzz-gobject.so.0.61500.0 moved to /usr/lib/libharfbuzz-gobject.so.0.61520.0
  /usr/lib/libharfbuzz-icu.so.0.61500.0 moved to /usr/lib/libharfbuzz-icu.so.0.61520.0
  /usr/lib/libharfbuzz.so.0.61500.0 moved to /usr/lib/libharfbuzz.so.0.61520.0
  /usr/lib/libharfbuzz-subset.so.0.61500.0 moved to /usr/lib/libharfbuzz-subset.so.0.61520.0

--===============6527912549401865774==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-harfbuzz-upgrade-15.0.0-15.2.0.patch"

RnJvbSA2ZGY5MzliNDkzNTczNDA1NjljZjAwNjMzNTUyYmFlN2ZhOGZlNTJlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMjAgTm92IDIwMjYgMDY6NTM6MDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBo
YXJmYnV6ejogdXBncmFkZSAxNS4wLjAgLT4gMTUuMi4wCgpPdmVydmlldyBvZiBjaGFuZ2VzIGxl
YWRpbmcgdG8gMTUuMi4wCkZyaWRheSwgTm92ZW1iZXIgMjAsIDIwMjYKPT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PQotIFBlcmZvcm1hbmNlIGFuZCBoYXJkZW5pbmc6CgotIE5l
dyBmZWF0dXJlczoKLSBTaGFwaW5nOgotIFNjcmlwdC1zcGVjaWZpYyBzaGFwaW5nOgotIEFBVCBz
aGFwaW5nOgotIE90aGVyIHNoYXBlcnMgYW5kIGZvbnQgZnVuY3Rpb25zOgotIENvcmUgbGlicmFy
eToKLSBTdWJzZXR0aW5nOgotIFJlbmRlcmluZyBsaWJyYXJpZXM6Ci0gVG9vbHMsIGRvY3VtZW50
YXRpb24sIGFuZCBidWlsZDoKCi0gTmV3IEFQSToKICAraGJfZm9udF9jcmVhdGVfd2l0aG91dF9m
dW5jc19vcl9mYWlsKCkKICAraGJfb3RfbGF5b3V0X2dldF9leHRlbmRlcl9nbHlwaHMoKQoKT3Zl
cnZpZXcgb2YgY2hhbmdlcyBsZWFkaW5nIHRvIDE1LjEuMApXZWRuZXNkYXksIE5vdmVtYmVyIDQs
IDIwMjYKPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQotIEFkZCBidWZmZXIg
ZGVzZXJpYWxpemF0aW9uIEFQSXMgdGhhdCByZXBvcnQgcHJvZ3Jlc3MgYXMgYSBieXRlIG9mZnNl
dCwgZm9yCiAgdXNlIGZyb20gaW50cm9zcGVjdGlvbiBiaW5kaW5ncy4KLSBGaXggSW5kaWMgc2hh
cGluZyBvZiB0aGUgVW5pY29kZSAxOCBEZXZhbmFnYXJpIGFuZCBCZW5nYWxpIGFkZGl0aW9ucy4K
LSBGaXggQXJhYmljIGZhbGxiYWNrIHNoYXBpbmc6IHdyb25nIGxpZ2F0dXJlcyB3aGVuIGEgY29t
cG9uZW50IGlzIG1pc3NpbmcgZnJvbQogIHRoZSBmb250LCBhbmQgZGlzYXBwZWFyaW5nIG1hcmtz
IGluIGxlZ2FjeSBmb250cy4KLSBGaXggYENPTFJgIGdseXBoIGV4dGVudHMgYW5kIG1hcmsgcG9z
aXRpb25pbmcgaW4gZm9udHMgd2l0aCBlbXB0eSBsYXllcnMuCi0gRml4IEFBVCBzaGFwaW5nOiB3
cm9uZyBga2VyeGAga2VybmluZyAoZm9ybWF0cyAxIGFuZCAyKSBhbmQgbWFyayBwb3NpdGlvbmlu
ZwogIChmb3JtYXQgNCwgYSAxNC4zLjAgcmVncmVzc2lvbiksIGFuZCBpZ25vcmVkIGBrZXJuYCBh
bmQgYG1vcnRgIHRhYmxlcyB3aXRoIGEKICBub24tZmlyc3QgaW5pdGlhbCBzdGF0ZS4KLSBWYXJp
b3VzIGZpeGVzIHRvIHRoZSBHcmFwaGl0ZTIgc2hhcGVyLgotIFJlcG9ydCBIYXJmUnVzdCBzaGFw
aW5nIGZhaWx1cmVzIHRocm91Z2ggYGhiX2J1ZmZlcl9hbGxvY2F0aW9uX3N1Y2Nlc3NmdWwoKWAu
Ci0gRml4IHdyb25nIG91dGxpbmVzIGluIGBndmFyYCBmb250cyB3aXRoIGludGVybWVkaWF0ZSB0
dXBsZXMuCi0gRml4IGBoYl9mYWNlX2NyZWF0ZV9vcl9mYWlsKClgIHJlamVjdGluZyBmYWNlIGlu
ZGljZXMgd2l0aCBuYW1lZC1pbnN0YW5jZQogIGJpdHMgc2V0LgotIEZpeCB3cm9uZyBmYWxsYmFj
ayBtZXRyaWNzOiB0aGUgdmVydGljYWwgZGVzY2VuZGVyIGluIGZvbnRzIHdpdGhvdXQgYHZoZWFg
LAogIGFuZCB0aGUgaGFuZ2luZyBiYXNlbGluZSBmb3Igc29tZSBzY3JpcHRzLgotIEZpeCBgaGJf
b3RfbGF5b3V0X2xvb2t1cF9jb2xsZWN0X2dseXBoX2FsdGVybmF0ZXMoKWAgY29sbGVjdGluZyBn
YXJiYWdlIGZyb20KICBgQWx0ZXJuYXRlU3Vic3RgIGFuZCBgU2luZ2xlU3Vic3RgIGZvcm1hdCAx
IGxvb2t1cHMuCi0gU3BlZWQgdXAgc2hhcGluZyBvbiBmYWNlcyB3aXRoIG1hbnkgc2hhcGUgcGxh
bnMsIGBoYl9sYW5ndWFnZV9mcm9tX3N0cmluZygpYCwKICB2ZXJ0aWNhbCB0ZXh0IHdpdGggYGhi
LWZ0YCwgYW5kIGBDQkRUYCBhbmQgYHNiaXhgIGZvbnRzLgotIEZpeCBjcmFzaGVzIGFuZCBkZWFk
bG9ja3Mgd2l0aCBGcmVlVHlwZSwgaW5jbHVkaW5nIGBoYl9mdF9mb250X3NldF9mdW5jcygpYCBv
bgogIGltbXV0YWJsZSBmb250cyBhbmQgZm9udCBxdWVyaWVzIGZyb20gY29sb3IgcGFpbnQgY2Fs
bGJhY2tzLgotIEZpeCBjcmFzaGVzIHdpdGggTlVMTCByZXN1bHQgcG9pbnRlcnMgaW4KICBgaGJf
b3RfbWV0cmljc19nZXRfcG9zaXRpb25fd2l0aF9mYWxsYmFjaygpYCwKICBgaGJfb3RfbGF5b3V0
X2dldF9mb250X2V4dGVudHMoKWAsIGFuZCBgaGJfb3RfbGF5b3V0X2dldF9mb250X2V4dGVudHMy
KClgLgotIEZpeCB1c2UtYWZ0ZXItZnJlZSBpbiBgaGJfbWFwX3VwZGF0ZSgpYCB3aGVuIHVwZGF0
aW5nIGEgbWFwIGZyb20gaXRzZWxmLgotIFZhcmlvdXMgZml4ZXMgZm9yIGNyYXNoZXMsIGhhbmdz
LCBhbmQgbWVtb3J5IHVzZSB3aXRoIG1hbGZvcm1lZCBmb250cy4KLSBGYXN0ZXIgc3Vic2V0dGlu
ZyBvZiBsYXJnZSBgR1NVQmAgYW5kIGBHUE9TYCB0YWJsZXMsIGFuZCBzbWFsbGVyIGBDRkZgIG91
dHB1dC4KLSBQYXJ0aWFsbHkgaW5zdGFuY2luZyBvciBkZXN1YnJvdXRpbml6aW5nIGBDRkYyYCBm
b250cyB3aXRoIG5lc3RlZCBibGVuZHMgbm93CiAgZmFpbHMgaW5zdGVhZCBvZiBjaGFuZ2luZyB0
aGUgb3V0bGluZXMuCi0gU3Vic2V0dGluZyBub3cgZmFpbHMgaWYgYSBnbHlwaCBtYXBwaW5nIGFz
c2lnbnMgYW5vdGhlciBnbHlwaCB0byBnbHlwaCAwLgotIEZpeCBgaGJfc3Vic2V0X2F4aXNfcmFu
Z2VfZnJvbV9zdHJpbmcoKWAgcmVhZGluZyBwYXN0IHRoZSBnaXZlbiBsZW5ndGguCi0gRml4IHN1
YnNldHRpbmcgYmV5b25kLTY0ayB2YXJpYWJsZSBmb250cyBsb3NpbmcgYEhWQVJgIGFkdmFuY2Ug
ZGVsdGFzLgotIFZhcmlvdXMgc3Vic2V0dGluZyBhbmQgaW5zdGFuY2luZyBmaXhlcywgbW9zdGx5
IGZvciBgQ0ZGYCwgYENGRjJgLCBhbmQgYENPTFJgLgotIEZpeCByb3RhdGVkIGFuZCBza2V3ZWQg
cmVjdGFuZ2xlIGNsaXBzIGhpZGluZyB0aGVpciBjb250ZW50cyBpbiB0aGUgcmFzdGVyCiAgbGli
cmFyeSwgYW5kIG91dC1vZi1ib3VuZHMgYWNjZXNzIHdoZW4gZXh0ZW50cyBjaGFuZ2UgZHVyaW5n
IHBhaW50aW5nLgotIEZpeCB0aGUgdmVjdG9yIGxpYnJhcnkgbWlycm9yaW5nIHBhdGggY2xpcHMg
aW4gU1ZHLCBhbmQgd3JpdGluZyBQREZzIHdpdGgKICB3cm9uZyBwYWdlIGJvdW5kcyBhbmQgbWlz
cGxhY2VkIG9yIGNsaXBwZWQgYENPTFJgIGdyYWRpZW50cy4KLSBGaXggd3JvbmcgY2xpcHBpbmcg
b2YgYENPTFJgIGxheWVycyBpbiB0aGUgR1BVIGxpYnJhcnkuCi0gVmFyaW91cyBDYWlybyBpbnRl
Z3JhdGlvbiBmaXhlcywgaW5jbHVkaW5nIGEgbWVtb3J5IGxlYWsgcGVyIHNjYWxlZCBmb250Lgot
IEZpeCBgaGItaW5mbyAtLWxpc3QtKmAgY3Jhc2hlcyBvbiB1bnVzdWFsIGZvbnRzLgotIFZhcmlv
dXMgYnVpbGQgYW5kIENJIGZpeGVzLgoKLSBOZXcgQVBJOgogICtoYl9idWZmZXJfZGVzZXJpYWxp
emVfZ2x5cGhzMigpCiAgK2hiX2J1ZmZlcl9kZXNlcmlhbGl6ZV91bmljb2RlMigpCi0tLQogLi4u
L2hhcmZidXp6L3toYXJmYnV6el8xNS4wLjAuYmIgPT4gaGFyZmJ1enpfMTUuMi4wLmJifSAgICAg
ICAgIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hhcmZidXp6L3toYXJmYnV6el8xNS4wLjAu
YmIgPT4gaGFyZmJ1enpfMTUuMi4wLmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1ncmFwaGljcy9oYXJmYnV6ei9oYXJmYnV6el8xNS4wLjAuYmIgYi9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvaGFyZmJ1enovaGFyZmJ1enpfMTUuMi4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6ei9oYXJmYnV6el8xNS4wLjAu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6ei9oYXJmYnV6el8xNS4y
LjAuYmIKaW5kZXggZWM4MjllMGEyNC4uZmFjNjNjOWNiMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL2hhcmZidXp6L2hhcmZidXp6XzE1LjAuMC5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvaGFyZmJ1enovaGFyZmJ1enpfMTUuMi4wLmJiCkBAIC05LDcgKzksNyBAQCBM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1iOTg0MjliOGU4ZTNjMmE2N2Nm
ZWYwMWU5OWU0ODkzZCBcCiAgICAgICAgICAgICAgICAgICAgICIKIAogU1JDX1VSSSA9ICIke0dJ
VEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvJHtQVn0vJHtCUE59LSR7UFZ9LnRhci54eiIKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICI5Njg1MzZlOWFiZDc4MmYwN2Y3OTU0MDQ0YzBjNDAyMDE5OWZjZGQz
OWI0MWQyMjFlYzQyZDJhM2JlNGE0NGRmIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImUyZWM0OTA5
MDc0NDM4M2NkYmU3ZGY4MDhjMWNlZGFhZmJhMDZhOTdiZThkYzQyMTFmZTU0NmJhNTg1ZjEyY2Ii
CiAKIGluaGVyaXQgbWVzb24gcGtnY29uZmlnIGxpYl9wYWNrYWdlIGd0ay1kb2MgZ29iamVjdC1p
bnRyb3NwZWN0aW9uIGdpdGh1Yi1yZWxlYXNlcwogCi0tIAoyLjQ3LjEKCg==

--===============6527912549401865774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: FILELIST: removed "/usr/lib/libharfbuzz-cairo.so.0.61500.0", added "/usr/lib/libharfbuzz-cairo.so.0.61520.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.61500.0", added "/usr/lib/libharfbuzz-gobject.so.0.61520.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.61500.0", added "/usr/lib/libharfbuzz-icu.so.0.61520.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.61500.0", added "/usr/lib/libharfbuzz-subset.so.0.61520.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz.so.0.61500.0", added "/usr/lib/libharfbuzz.so.0.61520.0"
Changes to packages/x86-64-v3-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-cairo.so.0 changed symlink target from libharfbuzz-cairo.so.0.61500.0 to libharfbuzz-cairo.so.0.61520.0
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.61500.0 to libharfbuzz-gobject.so.0.61520.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.61500.0 to libharfbuzz-icu.so.0.61520.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.61500.0 to libharfbuzz.so.0.61520.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.61500.0 to libharfbuzz-subset.so.0.61520.0
  /usr/lib/libharfbuzz-cairo.so.0.61500.0 moved to /usr/lib/libharfbuzz-cairo.so.0.61520.0
  /usr/lib/libharfbuzz-gobject.so.0.61500.0 moved to /usr/lib/libharfbuzz-gobject.so.0.61520.0
  /usr/lib/libharfbuzz-icu.so.0.61500.0 moved to /usr/lib/libharfbuzz-icu.so.0.61520.0
  /usr/lib/libharfbuzz.so.0.61500.0 moved to /usr/lib/libharfbuzz.so.0.61520.0
  /usr/lib/libharfbuzz-subset.so.0.61500.0 moved to /usr/lib/libharfbuzz-subset.so.0.61520.0

--===============6527912549401865774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="harfbuzz-changelog.txt"

Overview of changes leading to 15.2.0
Friday, November 20, 2026
=====================================
- Performance and hardening:

- New features:
- Shaping:
- Script-specific shaping:
- AAT shaping:
- Other shapers and font functions:
- Core library:
- Subsetting:
- Rendering libraries:
- Tools, documentation, and build:

- New API:
  +hb_font_create_without_funcs_or_fail()
  +hb_ot_layout_get_extender_glyphs()

Overview of changes leading to 15.1.0
Wednesday, November 4, 2026
=====================================
- Add buffer deserialization APIs that report progress as a byte offset, for
  use from introspection bindings.
- Fix Indic shaping of the Unicode 18 Devanagari and Bengali additions.
- Fix Arabic fallback shaping: wrong ligatures when a component is missing from
  the font, and disappearing marks in legacy fonts.
- Fix `COLR` glyph extents and mark positioning in fonts with empty layers.
- Fix AAT shaping: wrong `kerx` kerning (formats 1 and 2) and mark positioning
  (format 4, a 14.3.0 regression), and ignored `kern` and `mort` tables with a
  non-first initial state.
- Various fixes to the Graphite2 shaper.
- Report HarfRust shaping failures through `hb_buffer_allocation_successful()`.
- Fix wrong outlines in `gvar` fonts with intermediate tuples.
- Fix `hb_face_create_or_fail()` rejecting face indices with named-instance
  bits set.
- Fix wrong fallback metrics: the vertical descender in fonts without `vhea`,
  and the hanging baseline for some scripts.
- Fix `hb_ot_layout_lookup_collect_glyph_alternates()` collecting garbage from
  `AlternateSubst` and `SingleSubst` format 1 lookups.
- Speed up shaping on faces with many shape plans, `hb_language_from_string()`,
  vertical text with `hb-ft`, and `CBDT` and `sbix` fonts.
- Fix crashes and deadlocks with FreeType, including `hb_ft_font_set_funcs()` on
  immutable fonts and font queries from color paint callbacks.
- Fix crashes with NULL result pointers in
  `hb_ot_metrics_get_position_with_fallback()`,
  `hb_ot_layout_get_font_extents()`, and `hb_ot_layout_get_font_extents2()`.
- Fix use-after-free in `hb_map_update()` when updating a map from itself.
- Various fixes for crashes, hangs, and memory use with malformed fonts.
- Faster subsetting of large `GSUB` and `GPOS` tables, and smaller `CFF` output.
- Partially instancing or desubroutinizing `CFF2` fonts with nested blends now
  fails instead of changing the outlines.
- Subsetting now fails if a glyph mapping assigns another glyph to glyph 0.
- Fix `hb_subset_axis_range_from_string()` reading past the given length.
- Fix subsetting beyond-64k variable fonts losing `HVAR` advance deltas.
- Various subsetting and instancing fixes, mostly for `CFF`, `CFF2`, and `COLR`.
- Fix rotated and skewed rectangle clips hiding their contents in the raster
  library, and out-of-bounds access when extents change during painting.
- Fix the vector library mirroring path clips in SVG, and writing PDFs with
  wrong page bounds and misplaced or clipped `COLR` gradients.
- Fix wrong clipping of `COLR` layers in the GPU library.
- Various Cairo integration fixes, including a memory leak per scaled font.
- Fix `hb-info --list-*` crashes on unusual fonts.
- Various build and CI fixes.

- New API:
  +hb_buffer_deserialize_glyphs2()
  +hb_buffer_deserialize_unicode2()

--===============6527912549401865774==--
