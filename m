Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79EF9C982DA
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 05:40:15 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43181.1789969212312645802
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Sep 2026 22:40:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=hoVOnZHC;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=YrIsUUJQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a0c27a9d90-300aaae9-c1d4-4589-8e7c-0e4376ab2a8c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789969211;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=o69lqR2U7dj7/dgCF2dQYok6UUXZFVachgzzacqgCjk=;
	b=hoVOnZHCbpz9WyUfpVMhVcFALhquk66E5a5xLi6CLR1T3X/NmiyTjiO24dKgsvsm
	8CLfuv2woxya5RhHIWDu2KNY20q/x2ei9xqSrYYaFDXBiFU9A10VoiSdqMWw8XakEWk
	oDvr+L3HNiHDkc9rwdX2/oCYloyicLBmSN1K7+ZU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789969211;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=o69lqR2U7dj7/dgCF2dQYok6UUXZFVachgzzacqgCjk=;
	b=YrIsUUJQzwBbD0UC8N3fyGmG7h51ZnzZIG1I0n/LJ0+xfEaTck3WFaKjLBQT49/k
	pe7vgVKZDoFuhvtKNZRemqfaY/Jb8j94pa0ECXnQanBXZ1aDuMmAZHNAZEJrolhXvTL
	FX7e5RXz2r534zFknt2GR6FO7l5dMCL8Jwty6Sqk=
Content-Type: multipart/mixed; boundary="===============6484989311068658190=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] harfbuzz: upgrading to 14.5.0 SUCCEEDED
Message-ID: <010101a0c27a9d90-300aaae9-c1d4-4589-8e7c-0e4376ab2a8c-000000@us-west-2.amazonses.com>
Date: Mon, 21 Sep 2026 05:40:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.21-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 05:40:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246285

--===============6484989311068658190==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *harfbuzz* to *14.5.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-harfbuzz-upgrade-14.4.0-14.5.0.patch
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
From fbf338ed0c73bddbdadf0f0ad37408de0f1af0e9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 21 Sep 2026 05:34:30 +0000
Subject: [PATCH] harfbuzz: upgrade 14.4.0 -> 14.5.0

Source: NEWS

Overview of changes leading to 14.5.0
Monday, September 21, 2026
=====================================
- Update Unicode 18.0 data and script support, including script values for
  Jurchen, Proto-Cuneiform, and Seal, and the corresponding shaping support.
- Add support for VARC table subsetting, including pruning auxiliary data,
  remapping glyph IDs, and guarding the feature in lean builds.
- Add rendering work budgets to the draw and paint APIs and share them across
  the raster, vector, GPU, and Cairo renderers so nested outline work remains
  bounded.
- Improve performance in set iteration, lookup traversal, and the repacker, and
  add coverage for new benchmarks and fuzzing seeds.
- Fix various correctness and robustness issues across the CFF, Graphite,
  DirectWrite, and repacker code paths, including memory leaks, overflow checks,
  bounds issues, and malformed-font handling.
- Various build, portability, and CI fixes.

- New API:
  * Common:
    +HB_BUDGET_DEFAULT
    +HB_BUDGET_UNLIMITED
    +HB_SCRIPT_JURCHEN
    +HB_SCRIPT_PROTO_CUNEIFORM
    +HB_SCRIPT_SEAL
  * Draw:
    +hb_draw_set_budget_func_t
    +hb_draw_get_budget_func_t
    +hb_draw_get_budget_remaining_func_t
    +hb_draw_funcs_set_set_budget_func()
    +hb_draw_funcs_set_get_budget_func()
    +hb_draw_funcs_set_get_budget_remaining_func()
    +hb_draw_set_budget()
    +hb_draw_get_budget()
    +hb_draw_get_budget_remaining()
  * Paint:
    +hb_paint_set_budget_func_t
    +hb_paint_get_budget_func_t
    +hb_paint_get_budget_remaining_func_t
    +hb_paint_funcs_set_set_budget_func()
    +hb_paint_funcs_set_get_budget_func()
    +hb_paint_funcs_set_get_budget_remaining_func()
    +hb_paint_set_budget()
    +hb_paint_get_budget()
    +hb_paint_get_budget_remaining()
---
 .../harfbuzz/{harfbuzz_14.4.0.bb => harfbuzz_14.5.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_14.4.0.bb => harfbuzz_14.5.0.bb} (96%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_14.4.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.0.bb
similarity index 96%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_14.4.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_14.5.0.bb
index a5c601b1de..438aa23133 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_14.4.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "2357ed966c6ced7bfa720b0640c0231065af01158fbea215093ffa15aed44371"
+SRC_URI[sha256sum] = "b7132e148358a45185c9feafd049dbaf243649d3c44414b3534d9c95d18592b9"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection github-releases
 
-- 
2.47.1


--===============6484989311068658190==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-bin: PV changed from "14.4.0" to "14.5.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-bin: PKGV changed from 14.4.0 [default] to 14.5.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: PV changed from "14.4.0" to "14.5.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: FILELIST: removed "/usr/lib/libharfbuzz-cairo.so.0.61440.0", added "/usr/lib/libharfbuzz-cairo.so.0.61450.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: FILES: removed "/usr/lib/libharfbuzz-cairo.so.0.61440.0", added "/usr/lib/libharfbuzz-cairo.so.0.61450.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: PKGV changed from 14.4.0 [default] to 14.5.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: PKGSIZE changed from 93279360 to 97929352 (+5%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: PV changed from "14.4.0" to "14.5.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: FILELIST: removed "/usr/lib/.debug/libharfbuzz-gobject.so.0.61440.0 /usr/lib/.debug/libharfbuzz-icu.so.0.61440.0 /usr/lib/.debug/libharfbuzz.so.0.61440.0 /usr/lib/.debug/libharfbuzz-subset.so.0.61440.0 /usr/lib/.debug/libharfbuzz-cairo.so.0.61440.0", added "/usr/lib/.debug/libharfbuzz.so.0.61450.0 /usr/lib/.debug/libharfbuzz-subset.so.0.61450.0 /usr/lib/.debug/libharfbuzz-gobject.so.0.61450.0 /usr/lib/.debug/libharfbuzz-cairo.so.0.61450.0 /usr/lib/.debug/libharfbuzz-icu.so.0.61450.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: PKGV changed from 14.4.0 [default] to 14.5.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: PKGSIZE changed from 1901691 to 1943766 (+2%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: PV changed from "14.4.0" to "14.5.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: PKGV changed from 14.4.0 [default] to 14.5.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-doc: PV changed from "14.4.0" to "14.5.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-doc: PKGV changed from 14.4.0 [default] to 14.5.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: PV changed from "14.4.0" to "14.5.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.61440.0", added "/usr/lib/libharfbuzz-gobject.so.0.61450.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: FILES: removed "/usr/lib/libharfbuzz-gobject.so.0.61440.0", added "/usr/lib/libharfbuzz-gobject.so.0.61450.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: PKGV changed from 14.4.0 [default] to 14.5.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: PV changed from "14.4.0" to "14.5.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.61440.0", added "/usr/lib/libharfbuzz-icu.so.0.61450.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: FILES: removed "/usr/lib/libharfbuzz-icu.so.0.61440.0", added "/usr/lib/libharfbuzz-icu.so.0.61450.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: PKGV changed from 14.4.0 [default] to 14.5.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-locale: PV changed from "14.4.0" to "14.5.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-locale: PKGV changed from 14.4.0 [default] to 14.5.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: PKGSIZE changed from 5580319 to 5711926 (+2%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: PV changed from "14.4.0" to "14.5.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: FILELIST: directory renamed /usr/src/debug/harfbuzz/14.4.0/src/OT/Layout/GDEF -> /usr/src/debug/harfbuzz/14.5.0/src/OT/Layout/GDEF, directory renamed /usr/src/debug/harfbuzz/14.4.0/src/OT/Layout/GSUB -> /usr/src/debug/harfbuzz/14.5.0/src/OT/Layout/GSUB, directory renamed /usr/src/debug/harfbuzz/14.4.0/src/OT/name -> /usr/src/debug/harfbuzz/14.5.0/src/OT/name, directory renamed /usr/src/debug/harfbuzz/14.4.0/src/OT/Layout/Common -> /usr/src/debug/harfbuzz/14.5.0/src/OT/Layout/Common, directory renamed /usr/src/debug/harfbuzz/14.4.0/util -> /usr/src/debug/harfbuzz/14.5.0/util, directory renamed /usr/src/debug/harfbuzz/14.4.0/src/OT/Color/CBDT -> /usr/src/debug/harfbuzz/14.5.0/src/OT/Color/CBDT, directory renamed /usr/src/debug/harfbuzz/14.4.0/src/OT/Color/COLR -> /usr/src/debug/harfbuzz/14.5.0/src/OT/Color/COLR, directory renamed /usr/src/debug/harfbuzz/14.4.0/src/OT/Color/svg -> /usr/src/debug/harfbuzz/14.5.0/src/OT/Color/svg, direc
 tory renamed /usr/src/debug/harfbuzz/14.4.0/src/OT/Layout/GPOS -> /usr/src/debug/harfbuzz/14.5.0/src/OT/Layout/GPOS, directory renamed /usr/src/debug/harfbuzz/14.4.0/src/OT/Color/sbix -> /usr/src/debug/harfbuzz/14.5.0/src/OT/Color/sbix, directory renamed /usr/src/debug/harfbuzz/14.4.0/src/OT/Layout -> /usr/src/debug/harfbuzz/14.5.0/src/OT/Layout, directory renamed /usr/src/debug/harfbuzz/14.4.0/src/OT/glyf -> /usr/src/debug/harfbuzz/14.5.0/src/OT/glyf, directory renamed /usr/src/debug/harfbuzz/14.4.0/src/OT/Color/CPAL -> /usr/src/debug/harfbuzz/14.5.0/src/OT/Color/CPAL, removed "/usr/src/debug/harfbuzz/14.4.0/src/hb-buffer.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-depend-data.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shaper-vowel-constraints.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-tag-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-map.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-instancer-solver.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-depend.h /usr/src/debug/harfb
 uzz/14.4.0/src/hb-ot-layout-gsub-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-font.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-cff-specializer.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-free-pool.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-aat-layout.h /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-cff1-std-str.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shaper-arabic-fallback.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shaper-myanmar.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-multimap.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-gobject-enums.h /usr/src/debug/harfbuzz/14.4.0/src/hb-aat-map.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-map.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-font.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shape.hh /usr/src/debug/harfbuzz/14.4.0/src/hb.hh /usr/src/debug/harfbuzz/14.4.0/src/OT/Var/VARC/VARC.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-buffer.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-meta.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-color.cc /usr/src/debug/harfbuzz/14.4.0
 /src/hb-ot-shape.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-accelerator.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shaper-thai.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-array.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shaper-arabic-pua.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-cairo.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-font.cc /usr/src/debug/harfbuzz/14.4.0/src/OT/Var/VARC/VARC.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-table-color.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-table-other.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-buffer.h /usr/src/debug/harfbuzz/14.4.0/src/graph/coverage-graph.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-face-table-list.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-set.hh /usr/src/debug/harfbuzz/14.4.0/src/graph/pairpos-graph.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-metrics.h /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-map.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-bit-set-invertible.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-blob.cc /usr/sr
 c/debug/harfbuzz/14.4.0/src/hb-outline.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-var-avar-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-var-cvar-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-var-fvar-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-var-gvar-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-var-hvar-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-var-mvar-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-var.h /usr/src/debug/harfbuzz/14.4.0/src/hb-repacker.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-bimap.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-var.cc /usr/src/debug/harfbuzz/14.4.0/src/graph/markbasepos-graph.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-cff-interp-cs-common.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-aat-layout.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-layout-common.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-draw.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-subset.h /usr/src/debug/harfbuzz/14.4.0/src/graph/serialize.hh /usr/src/debug/harfbuzz/14.4
 .0/src/hb-ot-shaper.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-layout-gsubgpos.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-cplusplus.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shape-normalize.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-decycler.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-math.h /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-instancer-solver.cc /usr/src/debug/harfbuzz/14.4.0/src/graph/graph.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-cairo-utils.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-buffer-serialize.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-face-builder.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-table-layout.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-unicode.h /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shaper-indic.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-input.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-vector.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-depend.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shaper-use.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-serialize
 .h /usr/src/debug/harfbuzz/14.4.0/src/hb-version.h /usr/src/debug/harfbuzz/14.4.0/src/hb-paint.h /usr/src/debug/harfbuzz/14.4.0/src/hb-gobject-structs.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-outline.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-paint-bounded.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-serialize.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-map.h /usr/src/debug/harfbuzz/14.4.0/src/hb-style.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-aat-layout-common.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-deprecated.h /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-var-common.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-unicode.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-bit-set.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-hdmx-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-head-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-hhea-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-hmtx-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-post-table.hh /usr/src/debug/harfbuzz/14.4.0/src/graph/split-helpers.hh /
 usr/src/debug/harfbuzz/14.4.0/src/hb-ot-vorg-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-paint-extents.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-aat-layout-feat-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-aat-layout-just-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-aat-layout-trak-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-deprecated.h /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-input.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-map.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-cff-interp-dict-common.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-plan.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-null.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-metrics.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shaper-arabic.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-shaper.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-cff2-interp-cs.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-cff-common.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shape-fallback.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shaper-ara
 bic.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-shaper-list.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-face.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-aat-ltag-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shaper-arabic-joining-list.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-set.h /usr/src/debug/harfbuzz/14.4.0/src/hb-common.h /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-cff1-table.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-cff2-table.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-os2-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-color.h /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-layout-gpos-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-shape-plan.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-table-var.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-table-cff.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-os2-unicode-ranges.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-shaper.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-open-file.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-open-type.hh /usr/src/debug/ha
 rfbuzz/14.4.0/src/hb-ot-shaper-syllabic.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-draw.h /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-name-language-static.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-name-language.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-cff2-to-cff1.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-face.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-instancer-iup.cc /usr/src/debug/harfbuzz/14.4.0/src/graph/classdef-graph.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-kern.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-paint-extents.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-plan-member-list.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-layout.h /usr/src/debug/harfbuzz/14.4.0/src/hb-number.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ucd.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-unicode.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-icu.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shaper-arabic-win1256.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-fetch.cc /usr/src/debug/harfbuzz/14.4.0/src/h
 b-cache.hh /usr/src/debug/harfbuzz/14.4.0/src/graph/gsubgpos-context.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-atomic.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-shape.h /usr/src/debug/harfbuzz/14.4.0/src/hb-subset.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-blob.h /usr/src/debug/harfbuzz/14.4.0/src/graph/gsubgpos-context.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-paint.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-unicode-emoji-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-face.cc /usr/src/debug/harfbuzz/14.4.0/src/graph/ligature-graph.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-aat-layout.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-fetch.h /usr/src/debug/harfbuzz/14.4.0/src/hb-set-digest.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-cff-interp-common.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shaper-default.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-algs.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-shape-plan.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-string-array.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-
 ot-math.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-face.h /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-metrics.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-shape.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-cff2.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-subset.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-name.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-bit-page.hh /usr/src/debug/harfbuzz/14.4.0/src/OT/Var/VARC/coord-setter.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-cairo.h /usr/src/debug/harfbuzz/14.4.0/src/hb-geometry.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-set.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-utf.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-plan-var.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-iter.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-name.h /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-instancer-iup.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shaper-indic-table.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-layout.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-post-macroman.hh /usr/src
 /debug/harfbuzz/14.4.0/src/hb-ot-shape-fallback.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-mutex.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-cff1.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shaper-khmer.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ft-colr.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-layout.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shaper-hangul.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shaper-hebrew.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-meta.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-draw.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shaper-indic.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-tag.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-static.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-shape-plan.h /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shaper-arabic-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-post-table-v2subset.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-face.hh /usr/src/debug/harfbuzz/14.4.0/src/graph/gsubgpos-graph.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-met
 a.h /usr/src/debug/harfbuzz/14.4.0/src/hb-dispatch.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-cff-width-optimizer.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-sanitize.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-font.h /usr/src/debug/harfbuzz/14.4.0/src/hb-buffer-verify.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-fallback-shape.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-script-list.h /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-object.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-common.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-alloc-pool.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-blob.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-glib.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-font.h /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shape-normalize.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-cairo-utils.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-plan.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-aat-map.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shaper-use-table.hh /usr/s
 rc/debug/harfbuzz/14.4.0/src/hb-debug.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-cff-common.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-cff-common.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-layout-base-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-stat-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-depend.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-cff1-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-serialize.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-cff2-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-cmap-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-kern-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-math-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-maxp-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-meta-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-aat-layout-ankr-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-aat-layout-kerx-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-aat-layout-morx-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-machine
 ry.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-paint-bounded.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-number.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-plan-layout.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-style.h /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shaper-vowel-constraints.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ft.h /usr/src/debug/harfbuzz/14.4.0/src/hb-priority-queue.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ft.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-gobject-enums.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-cff1-interp-cs.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shaper-syllabic.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ucd-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-paint.cc", added "/usr/src/debug/harfbuzz/14.5.0/src/hb-buffer.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-depend-data.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-shaper-vowel-constraints.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-tag-table.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-map.cc /usr/src/debug/harfb
 uzz/14.5.0/src/hb-subset-instancer-solver.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-subset-depend.h /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-layout-gsub-table.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-font.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-cff-specializer.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-free-pool.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-aat-layout.h /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-cff1-std-str.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-shaper-arabic-fallback.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-shaper-myanmar.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-multimap.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-gobject-enums.h /usr/src/debug/harfbuzz/14.5.0/src/hb-aat-map.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-map.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-font.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-shape.hh /usr/src/debug/harfbuzz/14.5.0/src/hb.hh /usr/src/debug/harfbuzz/14.5.0/src/OT/Var/VARC/VARC.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-buffer.hh /usr/src/d
 ebug/harfbuzz/14.5.0/src/hb-ot-meta.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-color.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-shape.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-subset-accelerator.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-shaper-thai.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-array.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-shaper-arabic-pua.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-cairo.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-font.cc /usr/src/debug/harfbuzz/14.5.0/src/OT/Var/VARC/VARC.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-subset-table-color.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-subset-table-other.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-buffer.h /usr/src/debug/harfbuzz/14.5.0/src/graph/coverage-graph.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-face-table-list.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-set.hh /usr/src/debug/harfbuzz/14.5.0/src/graph/pairpos-graph.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-metrics.h /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-m
 ap.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-bit-set-invertible.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-blob.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-outline.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-var-avar-table.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-var-cvar-table.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-var-fvar-table.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-var-gvar-table.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-var-hvar-table.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-var-mvar-table.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-var.h /usr/src/debug/harfbuzz/14.5.0/src/hb-repacker.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-bimap.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-var.cc /usr/src/debug/harfbuzz/14.5.0/src/graph/markbasepos-graph.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-cff-interp-cs-common.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-aat-layout.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-layout-common.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-draw.hh /usr/src/d
 ebug/harfbuzz/14.5.0/src/hb-subset.h /usr/src/debug/harfbuzz/14.5.0/src/graph/serialize.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-shaper.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-layout-gsubgpos.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-cplusplus.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-shape-normalize.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-decycler.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-math.h /usr/src/debug/harfbuzz/14.5.0/src/hb-subset-instancer-solver.cc /usr/src/debug/harfbuzz/14.5.0/src/graph/graph.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-cairo-utils.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-buffer-serialize.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-face-builder.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-subset-table-layout.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-unicode.h /usr/src/debug/harfbuzz/14.5.0/src/OT/Var/VARC/VARC-subset.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-shaper-indic.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-subset-input.cc /usr/src/debug/harfbuzz/
 14.5.0/src/hb-vector.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-depend.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-shaper-use.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-result.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-subset-serialize.h /usr/src/debug/harfbuzz/14.5.0/src/hb-version.h /usr/src/debug/harfbuzz/14.5.0/src/hb-paint.h /usr/src/debug/harfbuzz/14.5.0/src/hb-gobject-structs.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-outline.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-paint-bounded.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-serialize.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-map.h /usr/src/debug/harfbuzz/14.5.0/src/hb-style.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-aat-layout-common.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-deprecated.h /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-var-common.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-unicode.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-bit-set.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-hdmx-table.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-head-tabl
 e.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-hhea-table.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-hmtx-table.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-post-table.hh /usr/src/debug/harfbuzz/14.5.0/src/graph/split-helpers.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-vorg-table.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-paint-extents.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-aat-layout-feat-table.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-aat-layout-just-table.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-aat-layout-trak-table.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-deprecated.h /usr/src/debug/harfbuzz/14.5.0/src/hb-subset-input.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-map.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-cff-interp-dict-common.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-subset-plan.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-null.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-metrics.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-shaper-arabic.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-shaper
 .hh /usr/src/debug/harfbuzz/14.5.0/src/hb-cff2-interp-cs.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-subset-cff-common.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-shape-fallback.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-shaper-arabic.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-shaper-list.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-face.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-aat-ltag-table.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-shaper-arabic-joining-list.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-set.h /usr/src/debug/harfbuzz/14.5.0/src/hb-common.h /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-cff1-table.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-cff2-table.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-os2-table.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-color.h /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-layout-gpos-table.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-shape-plan.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-subset-table-var.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-subset-table-cff.cc /
 usr/src/debug/harfbuzz/14.5.0/src/hb-ot-os2-unicode-ranges.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-shaper.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-open-file.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-open-type.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-shaper-syllabic.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-draw.h /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-name-language-static.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-name-language.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-subset-cff2-to-cff1.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-face.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-subset-instancer-iup.cc /usr/src/debug/harfbuzz/14.5.0/src/graph/classdef-graph.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-kern.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-paint-extents.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-subset-plan-member-list.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-layout.h /usr/src/debug/harfbuzz/14.5.0/src/hb-number.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-ucd.cc /usr/src/debug/ha
 rfbuzz/14.5.0/src/hb-unicode.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-icu.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-shaper-arabic-win1256.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-fetch.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-cache.hh /usr/src/debug/harfbuzz/14.5.0/src/graph/gsubgpos-context.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-atomic.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-shape.h /usr/src/debug/harfbuzz/14.5.0/src/hb-subset.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-blob.h /usr/src/debug/harfbuzz/14.5.0/src/graph/gsubgpos-context.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-paint.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-unicode-emoji-table.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-face.cc /usr/src/debug/harfbuzz/14.5.0/src/graph/ligature-graph.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-aat-layout.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-fetch.h /usr/src/debug/harfbuzz/14.5.0/src/hb-set-digest.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-cff-interp-common.hh /usr/src/debug/harfb
 uzz/14.5.0/src/hb-limits.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-shaper-default.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-algs.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-shape-plan.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-string-array.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-math.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-face.h /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-metrics.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-shape.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-subset-cff2.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-subset.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-name.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-bit-page.hh /usr/src/debug/harfbuzz/14.5.0/src/OT/Var/VARC/coord-setter.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-cairo.h /usr/src/debug/harfbuzz/14.5.0/src/hb-geometry.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-set.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-utf.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-subset-plan-var.cc /usr/src/debug/harfbuzz/14.5.0/src/graph/graph-result.hh /u
 sr/src/debug/harfbuzz/14.5.0/src/hb-iter.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-name.h /usr/src/debug/harfbuzz/14.5.0/src/hb-subset-instancer-iup.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-shaper-indic-table.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-layout.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-post-macroman.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-shape-fallback.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-mutex.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-subset-cff1.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-shaper-khmer.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-ft-colr.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-layout.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-shaper-hangul.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-shaper-hebrew.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-meta.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-draw.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-shaper-indic.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-tag.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-stat
 ic.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-shape-plan.h /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-shaper-arabic-table.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-post-table-v2subset.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-face.hh /usr/src/debug/harfbuzz/14.5.0/src/graph/gsubgpos-graph.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-meta.h /usr/src/debug/harfbuzz/14.5.0/src/hb-dispatch.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-cff-width-optimizer.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-sanitize.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-font.h /usr/src/debug/harfbuzz/14.5.0/src/hb-buffer-verify.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-fallback-shape.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-script-list.h /usr/src/debug/harfbuzz/14.5.0/src/hb-subset-table.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-object.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-common.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-alloc-pool.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-blob.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-glib
 .cc /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-font.h /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-shape-normalize.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-cairo-utils.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-subset-plan.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-aat-map.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-shaper-use-table.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-debug.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-subset-cff-common.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-cff-common.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-layout-base-table.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-stat-table.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-depend.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-cff1-table.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-subset-serialize.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-cff2-table.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-cmap-table.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-kern-table.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-math-table.hh /usr/src/d
 ebug/harfbuzz/14.5.0/src/hb-ot-maxp-table.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-meta-table.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-aat-layout-ankr-table.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-aat-layout-kerx-table.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-aat-layout-morx-table.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-machinery.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-paint-bounded.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-number.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-subset-plan-layout.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-style.h /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-shaper-vowel-constraints.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-ft.h /usr/src/debug/harfbuzz/14.5.0/src/hb-priority-queue.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ft.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-gobject-enums.cc /usr/src/debug/harfbuzz/14.5.0/src/hb-cff1-interp-cs.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ot-shaper-syllabic.hh /usr/src/debug/harfbuzz/14.5.0/src/hb-ucd-table.hh /usr/src/debug
 /harfbuzz/14.5.0/src/hb-paint.cc"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: PKGV changed from 14.4.0 [default] to 14.5.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-staticdev: PV changed from "14.4.0" to "14.5.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-staticdev: PKGV changed from 14.4.0 [default] to 14.5.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: PKGSIZE changed from 1042591 to 1091751 (+5%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: PV changed from "14.4.0" to "14.5.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.61440.0", added "/usr/lib/libharfbuzz-subset.so.0.61450.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: FILES: removed "/usr/lib/libharfbuzz-subset.so.0.61440.0", added "/usr/lib/libharfbuzz-subset.so.0.61450.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: PKGV changed from 14.4.0 [default] to 14.5.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: PKGSIZE changed from 1060784 to 1084192 (+2%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: PV changed from "14.4.0" to "14.5.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz.so.0.61440.0", added "/usr/lib/libharfbuzz.so.0.61450.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: PKGV changed from 14.4.0 [default] to 14.5.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz: PV changed from "14.4.0" to "14.5.0"
packages/x86-64-v3-poky-linux/harfbuzz: SRC_URI changed from "https://github.com/harfbuzz/harfbuzz/releases//download/14.4.0/harfbuzz-14.4.0.tar.xz" to "https://github.com/harfbuzz/harfbuzz/releases//download/14.5.0/harfbuzz-14.5.0.tar.xz"
packages/x86-64-v3-poky-linux/harfbuzz: PKGV changed from 14.4.0 [default] to 14.5.0 [default]
Changes to packages/x86-64-v3-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-cairo.so.0 changed symlink target from libharfbuzz-cairo.so.0.61440.0 to libharfbuzz-cairo.so.0.61450.0
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.61440.0 to libharfbuzz-gobject.so.0.61450.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.61440.0 to libharfbuzz-icu.so.0.61450.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.61440.0 to libharfbuzz.so.0.61450.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.61440.0 to libharfbuzz-subset.so.0.61450.0
  /usr/lib/libharfbuzz-cairo.so.0.61440.0 moved to /usr/lib/libharfbuzz-cairo.so.0.61450.0
  /usr/lib/libharfbuzz-gobject.so.0.61440.0 moved to /usr/lib/libharfbuzz-gobject.so.0.61450.0
  /usr/lib/libharfbuzz-icu.so.0.61440.0 moved to /usr/lib/libharfbuzz-icu.so.0.61450.0
  /usr/lib/libharfbuzz.so.0.61440.0 moved to /usr/lib/libharfbuzz.so.0.61450.0
  /usr/lib/libharfbuzz-subset.so.0.61440.0 moved to /usr/lib/libharfbuzz-subset.so.0.61450.0

--===============6484989311068658190==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-harfbuzz-upgrade-14.4.0-14.5.0.patch"

RnJvbSBmYmYzMzhlZDBjNzNiZGRiZGFkZjBmMGFkMzc0MDhkZTBmMWFmMGU5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMjEgU2VwIDIwMjYgMDU6MzQ6MzAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBo
YXJmYnV6ejogdXBncmFkZSAxNC40LjAgLT4gMTQuNS4wCgpTb3VyY2U6IE5FV1MKCk92ZXJ2aWV3
IG9mIGNoYW5nZXMgbGVhZGluZyB0byAxNC41LjAKTW9uZGF5LCBTZXB0ZW1iZXIgMjEsIDIwMjYK
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQotIFVwZGF0ZSBVbmljb2RlIDE4
LjAgZGF0YSBhbmQgc2NyaXB0IHN1cHBvcnQsIGluY2x1ZGluZyBzY3JpcHQgdmFsdWVzIGZvcgog
IEp1cmNoZW4sIFByb3RvLUN1bmVpZm9ybSwgYW5kIFNlYWwsIGFuZCB0aGUgY29ycmVzcG9uZGlu
ZyBzaGFwaW5nIHN1cHBvcnQuCi0gQWRkIHN1cHBvcnQgZm9yIFZBUkMgdGFibGUgc3Vic2V0dGlu
ZywgaW5jbHVkaW5nIHBydW5pbmcgYXV4aWxpYXJ5IGRhdGEsCiAgcmVtYXBwaW5nIGdseXBoIElE
cywgYW5kIGd1YXJkaW5nIHRoZSBmZWF0dXJlIGluIGxlYW4gYnVpbGRzLgotIEFkZCByZW5kZXJp
bmcgd29yayBidWRnZXRzIHRvIHRoZSBkcmF3IGFuZCBwYWludCBBUElzIGFuZCBzaGFyZSB0aGVt
IGFjcm9zcwogIHRoZSByYXN0ZXIsIHZlY3RvciwgR1BVLCBhbmQgQ2Fpcm8gcmVuZGVyZXJzIHNv
IG5lc3RlZCBvdXRsaW5lIHdvcmsgcmVtYWlucwogIGJvdW5kZWQuCi0gSW1wcm92ZSBwZXJmb3Jt
YW5jZSBpbiBzZXQgaXRlcmF0aW9uLCBsb29rdXAgdHJhdmVyc2FsLCBhbmQgdGhlIHJlcGFja2Vy
LCBhbmQKICBhZGQgY292ZXJhZ2UgZm9yIG5ldyBiZW5jaG1hcmtzIGFuZCBmdXp6aW5nIHNlZWRz
LgotIEZpeCB2YXJpb3VzIGNvcnJlY3RuZXNzIGFuZCByb2J1c3RuZXNzIGlzc3VlcyBhY3Jvc3Mg
dGhlIENGRiwgR3JhcGhpdGUsCiAgRGlyZWN0V3JpdGUsIGFuZCByZXBhY2tlciBjb2RlIHBhdGhz
LCBpbmNsdWRpbmcgbWVtb3J5IGxlYWtzLCBvdmVyZmxvdyBjaGVja3MsCiAgYm91bmRzIGlzc3Vl
cywgYW5kIG1hbGZvcm1lZC1mb250IGhhbmRsaW5nLgotIFZhcmlvdXMgYnVpbGQsIHBvcnRhYmls
aXR5LCBhbmQgQ0kgZml4ZXMuCgotIE5ldyBBUEk6CiAgKiBDb21tb246CiAgICArSEJfQlVER0VU
X0RFRkFVTFQKICAgICtIQl9CVURHRVRfVU5MSU1JVEVECiAgICArSEJfU0NSSVBUX0pVUkNIRU4K
ICAgICtIQl9TQ1JJUFRfUFJPVE9fQ1VORUlGT1JNCiAgICArSEJfU0NSSVBUX1NFQUwKICAqIERy
YXc6CiAgICAraGJfZHJhd19zZXRfYnVkZ2V0X2Z1bmNfdAogICAgK2hiX2RyYXdfZ2V0X2J1ZGdl
dF9mdW5jX3QKICAgICtoYl9kcmF3X2dldF9idWRnZXRfcmVtYWluaW5nX2Z1bmNfdAogICAgK2hi
X2RyYXdfZnVuY3Nfc2V0X3NldF9idWRnZXRfZnVuYygpCiAgICAraGJfZHJhd19mdW5jc19zZXRf
Z2V0X2J1ZGdldF9mdW5jKCkKICAgICtoYl9kcmF3X2Z1bmNzX3NldF9nZXRfYnVkZ2V0X3JlbWFp
bmluZ19mdW5jKCkKICAgICtoYl9kcmF3X3NldF9idWRnZXQoKQogICAgK2hiX2RyYXdfZ2V0X2J1
ZGdldCgpCiAgICAraGJfZHJhd19nZXRfYnVkZ2V0X3JlbWFpbmluZygpCiAgKiBQYWludDoKICAg
ICtoYl9wYWludF9zZXRfYnVkZ2V0X2Z1bmNfdAogICAgK2hiX3BhaW50X2dldF9idWRnZXRfZnVu
Y190CiAgICAraGJfcGFpbnRfZ2V0X2J1ZGdldF9yZW1haW5pbmdfZnVuY190CiAgICAraGJfcGFp
bnRfZnVuY3Nfc2V0X3NldF9idWRnZXRfZnVuYygpCiAgICAraGJfcGFpbnRfZnVuY3Nfc2V0X2dl
dF9idWRnZXRfZnVuYygpCiAgICAraGJfcGFpbnRfZnVuY3Nfc2V0X2dldF9idWRnZXRfcmVtYWlu
aW5nX2Z1bmMoKQogICAgK2hiX3BhaW50X3NldF9idWRnZXQoKQogICAgK2hiX3BhaW50X2dldF9i
dWRnZXQoKQogICAgK2hiX3BhaW50X2dldF9idWRnZXRfcmVtYWluaW5nKCkKLS0tCiAuLi4vaGFy
ZmJ1enove2hhcmZidXp6XzE0LjQuMC5iYiA9PiBoYXJmYnV6el8xNC41LjAuYmJ9ICAgICAgICAg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enove2hhcmZidXp6XzE0LjQuMC5iYiA9
PiBoYXJmYnV6el8xNC41LjAuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL2hhcmZidXp6L2hhcmZidXp6XzE0LjQuMC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9oYXJmYnV6ei9oYXJmYnV6el8xNC41LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hhcmZidXp6L2hhcmZidXp6XzE0LjQuMC5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hhcmZidXp6L2hhcmZidXp6XzE0LjUuMC5i
YgppbmRleCBhNWM2MDFiMWRlLi40MzhhYTIzMTMzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvaGFyZmJ1enovaGFyZmJ1enpfMTQuNC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1n
cmFwaGljcy9oYXJmYnV6ei9oYXJmYnV6el8xNC41LjAuYmIKQEAgLTksNyArOSw3IEBAIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWI5ODQyOWI4ZThlM2MyYTY3Y2ZlZjAx
ZTk5ZTQ4OTNkIFwKICAgICAgICAgICAgICAgICAgICAgIgogCiBTUkNfVVJJID0gIiR7R0lUSFVC
X0JBU0VfVVJJfS9kb3dubG9hZC8ke1BWfS8ke0JQTn0tJHtQVn0udGFyLnh6IgotU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjIzNTdlZDk2NmM2Y2VkN2JmYTcyMGIwNjQwYzAyMzEwNjVhZjAxMTU4ZmJl
YTIxNTA5M2ZmYTE1YWVkNDQzNzEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjcxMzJlMTQ4MzU4
YTQ1MTg1YzlmZWFmZDA0OWRiYWYyNDM2NDlkM2M0NDQxNGIzNTM0ZDljOTVkMTg1OTJiOSIKIAog
aW5oZXJpdCBtZXNvbiBwa2djb25maWcgbGliX3BhY2thZ2UgZ3RrLWRvYyBnb2JqZWN0LWludHJv
c3BlY3Rpb24gZ2l0aHViLXJlbGVhc2VzCiAKLS0gCjIuNDcuMQoK

--===============6484989311068658190==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 959 .bb files complete (0 cached, 959 parsed). 1993 targets, 66 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-5bff77aa988b1e90fd2dca5bbb6c15f5f5a37256"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:5bff77aa988b1e90fd2dca5bbb6c15f5f5a37256"
meta-yocto-bsp       
meta-poky            = "master:d36c827e02ab138b446386792fd7588b5a041507"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 503 Local 491 Mirrors 0 Missed 12 Current 217 (97% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 306 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 332 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 337 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_create_spdx_setscene)
NOTE: Running task 421 of 1747 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.0.bb:do_write_config)
NOTE: recipe harfbuzz-14.5.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe harfbuzz-14.5.0-r0: task do_write_config: Started
NOTE: recipe icu-78.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe harfbuzz-14.5.0-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-14.5.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running task 437 of 1747 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.0.bb:do_recipe_qa)
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 346 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 348 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 351 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 353 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 354 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_create_spdx_setscene)
NOTE: recipe icu-78.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 365 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 366 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 367 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-14.5.0-r0: task do_recipe_qa: Started
NOTE: recipe cairo-1.18.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-78.3-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-78.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe icu-78.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 384 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe icu-78.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 387 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 389 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_spdx_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/cairo/1.18.4/temp/log.do_packagedata_setscene.558044
NOTE: recipe icu-78.3-r0: task do_packagedata_setscene: Succeeded
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 393 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_package_setscene)
NOTE: recipe freetype-2.14.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-78.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 400 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 432 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 435 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe icu-78.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe icu-78.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 464 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 465 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe harfbuzz-14.5.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 481 of 1747 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.0.bb:do_fetch)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe harfbuzz-14.5.0-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 480 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe harfbuzz-14.5.0-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_package_setscene: Started
NOTE: Running task 751 of 1747 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.0.bb:do_unpack)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe harfbuzz-14.5.0-r0: task do_unpack: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 903 of 1747 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.0.bb:do_create_recipe_spdx)
NOTE: recipe harfbuzz-14.5.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe harfbuzz-14.5.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 490 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 492 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 493 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 494 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 495 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 496 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 497 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 498 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 499 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 500 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 501 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 504 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.18.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 507 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 509 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 511 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 513 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 514 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.18.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 516 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 517 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.18.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 519 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 520 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 522 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 523 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 526 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 528 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.14.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 531 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 532 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.58-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.58-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 534 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 536 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 537 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 538 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 539 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 540 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.58-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 544 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.48-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.58-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 546 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 548 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 549 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 551 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 552 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 554 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.42.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.42.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 556 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 558 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 559 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.42.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 564 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 566 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 567 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 572 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 574 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.58-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 576 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-14.5.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 578 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 581 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 584 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running task 979 of 1747 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.0.bb:do_patch)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.58-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-14.5.0-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 586 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-14.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1015 of 1747 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 589 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.48-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-14.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre2-10.48-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 591 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 592 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 593 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 595 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 596 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 597 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 598 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 599 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 600 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 603 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 604 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 606 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 607 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.42.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-4.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.8.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 608 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-4.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-14.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 610 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 613 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 614 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 616 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 617 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 618 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-4.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 621 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 622 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 623 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 624 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 625 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.3.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 626 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 628 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 632 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.9.6-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 636 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-4.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 638 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.9.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 640 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.42.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 641 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 644 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 645 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 647 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 648 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 651 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 653 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 656 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.42.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 659 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 660 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.9.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 664 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 665 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 666 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-4.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 667 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 669 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-4.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 675 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 678 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 681 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 682 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 683 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 685 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 687 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 688 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 690 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 692 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 693 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 694 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 696 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 697 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 702 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 704 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 710 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 711 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 713 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 715 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 720 of 720 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1703 of 1747 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_packagedata)
NOTE: Running task 1706 of 1747 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe cairo-1.18.4-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-14.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairo-1.18.4-r0: task do_packagedata: Succeeded
NOTE: recipe harfbuzz-14.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1735 of 1747 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.0.bb:do_configure)
NOTE: recipe harfbuzz-14.5.0-r0: task do_configure: Started
NOTE: recipe harfbuzz-14.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1736 of 1747 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.0.bb:do_compile)
NOTE: recipe harfbuzz-14.5.0-r0: task do_compile: Started
NOTE: recipe harfbuzz-14.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1737 of 1747 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.0.bb:do_install)
NOTE: recipe harfbuzz-14.5.0-r0: task do_install: Started
NOTE: recipe harfbuzz-14.5.0-r0: task do_install: Succeeded
NOTE: Running task 1738 of 1747 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.0.bb:do_package)
NOTE: Running task 1739 of 1747 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.0.bb:do_populate_sysroot)
NOTE: recipe harfbuzz-14.5.0-r0: task do_package: Started
NOTE: recipe harfbuzz-14.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-14.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-14.5.0-r0: task do_package: Succeeded
NOTE: Running task 1740 of 1747 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.0.bb:do_packagedata)
NOTE: recipe harfbuzz-14.5.0-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-14.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1741 of 1747 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.0.bb:do_create_spdx)
NOTE: Running task 1742 of 1747 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.0.bb:do_package_write_ipk)
NOTE: Running task 1743 of 1747 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.0.bb:do_package_write_deb)
NOTE: Running task 1744 of 1747 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.0.bb:do_package_write_rpm)
NOTE: Running task 1745 of 1747 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.0.bb:do_package_qa)
NOTE: recipe harfbuzz-14.5.0-r0: task do_create_spdx: Started
NOTE: recipe harfbuzz-14.5.0-r0: task do_package_write_ipk: Started
NOTE: recipe harfbuzz-14.5.0-r0: task do_package_write_deb: Started
NOTE: recipe harfbuzz-14.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe harfbuzz-14.5.0-r0: task do_package_qa: Started
NOTE: recipe harfbuzz-14.5.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe harfbuzz-14.5.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1746 of 1747 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.0.bb:do_create_package_spdx)
NOTE: recipe harfbuzz-14.5.0-r0: task do_create_package_spdx: Started
NOTE: recipe harfbuzz-14.5.0-r0: task do_package_qa: Succeeded
NOTE: recipe harfbuzz-14.5.0-r0: task do_create_package_spdx: Succeeded
NOTE: recipe harfbuzz-14.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe harfbuzz-14.5.0-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 1747 of 1747 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1747 tasks of which 1725 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 11 ERROR messages, returning a non-zero exit code.
ERROR: cairo-1.18.4-r0 do_packagedata_setscene: QA Issue: Package version for package cairo-src went backwards which would break package feeds (from 0:1.18.6-r0 to 0:1.18.4-r0) [version-going-backwards]
ERROR: cairo-1.18.4-r0 do_packagedata_setscene: QA Issue: Package version for package cairo-dbg went backwards which would break package feeds (from 0:1.18.6-r0 to 0:1.18.4-r0) [version-going-backwards]
ERROR: cairo-1.18.4-r0 do_packagedata_setscene: QA Issue: Package version for package cairo-gobject went backwards which would break package feeds (from 0:1.18.6-r0 to 0:1.18.4-r0) [version-going-backwards]
ERROR: cairo-1.18.4-r0 do_packagedata_setscene: QA Issue: Package version for package cairo-script-interpreter went backwards which would break package feeds (from 0:1.18.6-r0 to 0:1.18.4-r0) [version-going-backwards]
ERROR: cairo-1.18.4-r0 do_packagedata_setscene: QA Issue: Package version for package cairo-perf-utils went backwards which would break package feeds (from 0:1.18.6-r0 to 0:1.18.4-r0) [version-going-backwards]
ERROR: cairo-1.18.4-r0 do_packagedata_setscene: QA Issue: Package version for package cairo-staticdev went backwards which would break package feeds (from 0:1.18.6-r0 to 0:1.18.4-r0) [version-going-backwards]
ERROR: cairo-1.18.4-r0 do_packagedata_setscene: QA Issue: Package version for package cairo-dev went backwards which would break package feeds (from 0:1.18.6-r0 to 0:1.18.4-r0) [version-going-backwards]
ERROR: cairo-1.18.4-r0 do_packagedata_setscene: QA Issue: Package version for package cairo-doc went backwards which would break package feeds (from 0:1.18.6-r0 to 0:1.18.4-r0) [version-going-backwards]
ERROR: cairo-1.18.4-r0 do_packagedata_setscene: QA Issue: Package version for package cairo-locale went backwards which would break package feeds (from 0:1.18.6-r0 to 0:1.18.4-r0) [version-going-backwards]
ERROR: cairo-1.18.4-r0 do_packagedata_setscene: QA Issue: Package version for package cairo went backwards which would break package feeds (from 0:1.18.6-r0 to 0:1.18.4-r0) [version-going-backwards]
ERROR: cairo-1.18.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6484989311068658190==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: FILELIST: removed "/usr/lib/libharfbuzz-cairo.so.0.61440.0", added "/usr/lib/libharfbuzz-cairo.so.0.61450.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.61440.0", added "/usr/lib/libharfbuzz-gobject.so.0.61450.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.61440.0", added "/usr/lib/libharfbuzz-icu.so.0.61450.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.61440.0", added "/usr/lib/libharfbuzz-subset.so.0.61450.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz.so.0.61440.0", added "/usr/lib/libharfbuzz.so.0.61450.0"
Changes to packages/x86-64-v3-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-cairo.so.0 changed symlink target from libharfbuzz-cairo.so.0.61440.0 to libharfbuzz-cairo.so.0.61450.0
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.61440.0 to libharfbuzz-gobject.so.0.61450.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.61440.0 to libharfbuzz-icu.so.0.61450.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.61440.0 to libharfbuzz.so.0.61450.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.61440.0 to libharfbuzz-subset.so.0.61450.0
  /usr/lib/libharfbuzz-cairo.so.0.61440.0 moved to /usr/lib/libharfbuzz-cairo.so.0.61450.0
  /usr/lib/libharfbuzz-gobject.so.0.61440.0 moved to /usr/lib/libharfbuzz-gobject.so.0.61450.0
  /usr/lib/libharfbuzz-icu.so.0.61440.0 moved to /usr/lib/libharfbuzz-icu.so.0.61450.0
  /usr/lib/libharfbuzz.so.0.61440.0 moved to /usr/lib/libharfbuzz.so.0.61450.0
  /usr/lib/libharfbuzz-subset.so.0.61440.0 moved to /usr/lib/libharfbuzz-subset.so.0.61450.0

--===============6484989311068658190==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="harfbuzz-changelog.txt"

Changelog for harfbuzz: 14.4.0 -> 14.5.0
Source: NEWS

Overview of changes leading to 14.5.0
Monday, September 21, 2026
=====================================
- Update Unicode 18.0 data and script support, including script values for
  Jurchen, Proto-Cuneiform, and Seal, and the corresponding shaping support.
- Add support for VARC table subsetting, including pruning auxiliary data,
  remapping glyph IDs, and guarding the feature in lean builds.
- Add rendering work budgets to the draw and paint APIs and share them across
  the raster, vector, GPU, and Cairo renderers so nested outline work remains
  bounded.
- Improve performance in set iteration, lookup traversal, and the repacker, and
  add coverage for new benchmarks and fuzzing seeds.
- Fix various correctness and robustness issues across the CFF, Graphite,
  DirectWrite, and repacker code paths, including memory leaks, overflow checks,
  bounds issues, and malformed-font handling.
- Various build, portability, and CI fixes.

- New API:
  * Common:
    +HB_BUDGET_DEFAULT
    +HB_BUDGET_UNLIMITED
    +HB_SCRIPT_JURCHEN
    +HB_SCRIPT_PROTO_CUNEIFORM
    +HB_SCRIPT_SEAL
  * Draw:
    +hb_draw_set_budget_func_t
    +hb_draw_get_budget_func_t
    +hb_draw_get_budget_remaining_func_t
    +hb_draw_funcs_set_set_budget_func()
    +hb_draw_funcs_set_get_budget_func()
    +hb_draw_funcs_set_get_budget_remaining_func()
    +hb_draw_set_budget()
    +hb_draw_get_budget()
    +hb_draw_get_budget_remaining()
  * Paint:
    +hb_paint_set_budget_func_t
    +hb_paint_get_budget_func_t
    +hb_paint_get_budget_remaining_func_t
    +hb_paint_funcs_set_set_budget_func()
    +hb_paint_funcs_set_get_budget_func()
    +hb_paint_funcs_set_get_budget_remaining_func()
    +hb_paint_set_budget()
    +hb_paint_get_budget()
    +hb_paint_get_budget_remaining()

--===============6484989311068658190==--

