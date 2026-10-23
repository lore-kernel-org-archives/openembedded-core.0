Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1102.1792734605747695167
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 22:50:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Hrl3RzyF;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=NJRGMFpc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a1674f2d6c-a2e3d22d-49d9-40e3-89f9-a433fce16f11-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792734604;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=bEVn2Gp0TWyJj5OAUpwGffzrCB7+KT2YovApBzRft34=;
	b=Hrl3RzyFncZFetBezj8SG4WxSTh03yyyjJG5eb8X+mK/KdghdiWxCXHZfdM9cZiq
	Wwb5Huc6h5e5Udw2GAE17taqt8JC7dfryq5XOl/3RtB1xJse8pRJIu6yU0FK4+h16fT
	AXv8Nivm1pyvM6dvzauOrad93vKL/CN2na6m5+Yg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792734604;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=bEVn2Gp0TWyJj5OAUpwGffzrCB7+KT2YovApBzRft34=;
	b=NJRGMFpcZ162Vo3zHX6HKqHnq+v6+gTrnJdOkK+a3DwK9fOPqYGHudh/6QoijqoW
	Rj/O5Oezx/RoUzHC6QmjbULiIZ6nS+fThXja1tiNaY7l8iNzsu+OzMMKcK3HpGdiaV7
	Sy2BXbItUDmtHChnPGR5K2hjO5LtD8yngQej3rm4=
Content-Type: multipart/mixed; boundary="===============0613011848510254305=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] harfbuzz: upgrading to 15.0.0 SUCCEEDED
Message-ID: <010101a1674f2d6c-a2e3d22d-49d9-40e3-89f9-a433fce16f11-000000@us-west-2.amazonses.com>
Date: Fri, 23 Oct 2026 05:50:04 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.23-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 05:50:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248482

--===============0613011848510254305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *harfbuzz* to *15.0.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-harfbuzz-upgrade-14.6.0-15.0.0.patch
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
From a288a1db01eecfd9a3b4dadd2ffe274847192ff7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 23 Oct 2026 05:47:37 +0000
Subject: [PATCH] harfbuzz: upgrade 14.6.0 -> 15.0.0

Overview of changes leading to 15.0.0
Thursday, October 22, 2026
=====================================
- Support for the new tables and formats in the ISO Open Font Format (OFF) 5th
  edition is now enabled by default:

- Deprecated API:
  -hb_font_set_face()
---
 .../harfbuzz/{harfbuzz_14.6.0.bb => harfbuzz_15.0.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_14.6.0.bb => harfbuzz_15.0.0.bb} (96%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_14.6.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_15.0.0.bb
similarity index 96%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_14.6.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_15.0.0.bb
index 7ef0897a18..ec829e0a24 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_14.6.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_15.0.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "d07a007327277708a2a73ae437887cdbaf282937f6d03ca5467723e9099af586"
+SRC_URI[sha256sum] = "968536e9abd782f07f7954044c0c4020199fcdd39b41d221ec42d2a3be4a44df"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection github-releases
 
-- 
2.47.1


--===============0613011848510254305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-bin: PKGV changed from 14.6.0 [default] to 15.0.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-bin: PV changed from "14.6.0" to "15.0.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: FILES: removed "/usr/lib/libharfbuzz-cairo.so.0.61460.0", added "/usr/lib/libharfbuzz-cairo.so.0.61500.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: FILELIST: removed "/usr/lib/libharfbuzz-cairo.so.0.61460.0", added "/usr/lib/libharfbuzz-cairo.so.0.61500.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: PKGV changed from 14.6.0 [default] to 15.0.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: PKGSIZE changed from 47046 to 51142 (+9%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: PV changed from "14.6.0" to "15.0.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: FILELIST: removed "/usr/lib/.debug/libharfbuzz-gobject.so.0.61460.0 /usr/lib/.debug/libharfbuzz.so.0.61460.0 /usr/lib/.debug/libharfbuzz-subset.so.0.61460.0 /usr/lib/.debug/libharfbuzz-icu.so.0.61460.0 /usr/lib/.debug/libharfbuzz-cairo.so.0.61460.0", added "/usr/lib/.debug/libharfbuzz-cairo.so.0.61500.0 /usr/lib/.debug/libharfbuzz.so.0.61500.0 /usr/lib/.debug/libharfbuzz-icu.so.0.61500.0 /usr/lib/.debug/libharfbuzz-subset.so.0.61500.0 /usr/lib/.debug/libharfbuzz-gobject.so.0.61500.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: PKGV changed from 14.6.0 [default] to 15.0.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: PKGSIZE changed from 99305920 to 127202192 (+28%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: PV changed from "14.6.0" to "15.0.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: PKGV changed from 14.6.0 [default] to 15.0.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: PKGSIZE changed from 1943766 to 1944979 (+0%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: PV changed from "14.6.0" to "15.0.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-doc: PKGV changed from 14.6.0 [default] to 15.0.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-doc: PV changed from "14.6.0" to "15.0.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: FILES: removed "/usr/lib/libharfbuzz-gobject.so.0.61460.0", added "/usr/lib/libharfbuzz-gobject.so.0.61500.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.61460.0", added "/usr/lib/libharfbuzz-gobject.so.0.61500.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: PKGV changed from 14.6.0 [default] to 15.0.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: PV changed from "14.6.0" to "15.0.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: FILES: removed "/usr/lib/libharfbuzz-icu.so.0.61460.0", added "/usr/lib/libharfbuzz-icu.so.0.61500.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.61460.0", added "/usr/lib/libharfbuzz-icu.so.0.61500.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: PKGV changed from 14.6.0 [default] to 15.0.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: PV changed from "14.6.0" to "15.0.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-locale: PKGV changed from 14.6.0 [default] to 15.0.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-locale: PV changed from "14.6.0" to "15.0.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: FILELIST: directory renamed /usr/src/debug/harfbuzz/14.6.0/src/OT/glyf -> /usr/src/debug/harfbuzz/15.0.0/src/OT/glyf, directory renamed /usr/src/debug/harfbuzz/14.6.0/util -> /usr/src/debug/harfbuzz/15.0.0/util, directory renamed /usr/src/debug/harfbuzz/14.6.0/src/OT/name -> /usr/src/debug/harfbuzz/15.0.0/src/OT/name, directory renamed /usr/src/debug/harfbuzz/14.6.0/src/OT/Layout/GPOS -> /usr/src/debug/harfbuzz/15.0.0/src/OT/Layout/GPOS, directory renamed /usr/src/debug/harfbuzz/14.6.0/src/OT/Color/CPAL -> /usr/src/debug/harfbuzz/15.0.0/src/OT/Color/CPAL, directory renamed /usr/src/debug/harfbuzz/14.6.0/src/OT/Color/svg -> /usr/src/debug/harfbuzz/15.0.0/src/OT/Color/svg, directory renamed /usr/src/debug/harfbuzz/14.6.0/src/OT/Color/sbix -> /usr/src/debug/harfbuzz/15.0.0/src/OT/Color/sbix, directory renamed /usr/src/debug/harfbuzz/14.6.0/src/OT/Color/COLR -> /usr/src/debug/harfbuzz/15.0.0/src/OT/Color/COLR, directory renamed /usr/sr
 c/debug/harfbuzz/14.6.0/src/graph -> /usr/src/debug/harfbuzz/15.0.0/src/graph, directory renamed /usr/src/debug/harfbuzz/14.6.0/src/OT/Layout/Common -> /usr/src/debug/harfbuzz/15.0.0/src/OT/Layout/Common, directory renamed /usr/src/debug/harfbuzz/14.6.0/src/OT/Var/VARC -> /usr/src/debug/harfbuzz/15.0.0/src/OT/Var/VARC, directory renamed /usr/src/debug/harfbuzz/14.6.0/src/OT/Layout/GDEF -> /usr/src/debug/harfbuzz/15.0.0/src/OT/Layout/GDEF, directory renamed /usr/src/debug/harfbuzz/14.6.0/src/OT/Color/CBDT -> /usr/src/debug/harfbuzz/15.0.0/src/OT/Color/CBDT, directory renamed /usr/src/debug/harfbuzz/14.6.0/src/OT/Layout/GSUB -> /usr/src/debug/harfbuzz/15.0.0/src/OT/Layout/GSUB, removed "/usr/src/debug/harfbuzz/14.6.0/src/hb-cairo-utils.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shaper-default.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-repacker.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-aat-layout-ankr-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-aat-layout-kerx-table.hh /usr/src/debug/
 harfbuzz/14.6.0/src/hb-aat-layout-morx-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-buffer.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-cff-specializer.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-tag-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-style.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-accelerator.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-unicode.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shape-fallback.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-aat-layout-common.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-cff1.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-dual.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-serialize.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-aat-map.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-cff-common.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-alloc-pool.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shaper-indic-table.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-array.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-instancer-solver.hh /usr/src/debug/harfbu
 zz/14.6.0/src/hb-cairo.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-paint-bounded.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ucd-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-font.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-set.h /usr/src/debug/harfbuzz/14.6.0/src/hb-blob.h /usr/src/debug/harfbuzz/14.6.0/src/hb-buffer.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ft.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-depend.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-deprecated.h /usr/src/debug/harfbuzz/14.6.0/src/hb.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-number.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-paint.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-shaper.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-open-file.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-open-type.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-name.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-plan.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-multimap.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shape.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shaper-
 arabic.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-dispatch.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-set.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-icu.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-color.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shape.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shaper-arabic.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-plan-member-list.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-shape-plan.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-map.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-gobject-enums.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-unicode.h /usr/src/debug/harfbuzz/14.6.0/src/hb-result.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-deprecated.h /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shaper-use.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-draw.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ft-colr.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-map.h /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-color.h /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-name-language.hh /usr/src/debug/harfbu
 zz/14.6.0/src/hb-limits.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-meta.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-var-avar-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-var-cvar-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-var-fvar-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-var-gvar-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-var-hvar-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-cff2-interp-cs.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-font.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-var-mvar-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-plan-var.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-map.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-set.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-fallback-shape.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-buffer.h /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-cff-common.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-stat-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-math-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-maxp-tab
 le.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-meta-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-cff1-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-cff2-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-cmap-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-algs.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-face-builder.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-kern-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-geometry.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-face.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-layout-gsub-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-layout-base-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-name-language-static.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-shape-plan.h /usr/src/debug/harfbuzz/14.6.0/src/hb-static.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-subset.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-metrics.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-depend-data.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-subset.h /usr/src/debug/harfbuzz/14.6.
 0/src/hb-shape.h /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shaper-arabic-fallback.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-iter.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shape-normalize.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-instancer-iup.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ucd.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shaper-syllabic.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-map.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-map.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-math.h /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-var.h /usr/src/debug/harfbuzz/14.6.0/src/hb-subset.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-layout.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-post-macroman.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-tag.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-sanitize.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-input.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-cff2-to-cff1.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-unicode.hh /usr/src/debug/harfbuzz/14.6.0/sr
 c/hb-glib.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-gobject-structs.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-cairo-utils.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-style.h /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shaper-arabic-joining-list.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-bit-set-invertible.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-bimap.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-var-common.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-gobject-enums.h /usr/src/debug/harfbuzz/14.6.0/src/hb-face.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-priority-queue.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-layout.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shaper-hangul.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shaper-hebrew.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shaper-indic.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-mutex.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-instancer-iup.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-cff1-std-str.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-debug.hh /u
 sr/src/debug/harfbuzz/14.6.0/src/hb-ot-fetch.h /usr/src/debug/harfbuzz/14.6.0/src/hb-vector.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-cff-interp-common.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shaper-arabic-win1256.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shaper-use-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-outline.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-aat-layout-just-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-aat-layout-feat-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-aat-layout-trak-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-bit-set.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-blob.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-common.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ft.h /usr/src/debug/harfbuzz/14.6.0/src/hb-buffer-serialize.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-os2-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-bit-page.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-meta.h /usr/src/debug/harfbuzz/14.6.0/src/hb-paint-extents.hh /usr/src/debug/harfbuzz/14.
 6.0/src/hb-atomic.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-serialize.h /usr/src/debug/harfbuzz/14.6.0/src/hb-machinery.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-table-cff.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-table-var.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-plan.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-name.h /usr/src/debug/harfbuzz/14.6.0/src/hb-aat-layout.h /usr/src/debug/harfbuzz/14.6.0/src/hb-face.h /usr/src/debug/harfbuzz/14.6.0/src/hb-kern.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-version.h /usr/src/debug/harfbuzz/14.6.0/src/hb-font.h /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-metrics.h /usr/src/debug/harfbuzz/14.6.0/src/hb-string-array.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-shaper-list.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-depend.h /usr/src/debug/harfbuzz/14.6.0/src/hb-utf.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shaper-myanmar.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-plan-layout.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-fr
 ee-pool.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-meta.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-aat-layout.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-set-digest.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-cff-interp-cs-common.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-draw.h /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-font.h /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-layout.h /usr/src/debug/harfbuzz/14.6.0/src/hb-number.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-fetch.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-depend.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-cff-interp-dict-common.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-os2-unicode-ranges.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-decycler.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shaper-arabic-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-serialize.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-input.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-unicode-emoji-table.hh /usr/src/debug/harfbu
 zz/14.6.0/src/hb-ot-shaper-vowel-constraints.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shaper-arabic-pua.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shape-normalize.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-paint-extents.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-script-list.h /usr/src/debug/harfbuzz/14.6.0/src/hb-paint.h /usr/src/debug/harfbuzz/14.6.0/src/hb-cairo.h /usr/src/debug/harfbuzz/14.6.0/src/hb-cff1-interp-cs.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-font.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shaper-vowel-constraints.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-common.h /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-layout-gsubgpos.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-hdmx-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-head-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-hhea-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-aat-layout.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-hmtx-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-face.hh /usr/src/debug/harfbuzz/14.6.
 0/src/hb-ot-layout-gpos-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-draw.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-post-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-aat-map.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-paint-bounded.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-var.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-vorg-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-cff-width-optimizer.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-null.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-table-color.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-table-other.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-object.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-blob.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-table-layout.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shape-fallback.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-math.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-metrics.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-post-table-v2subset.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-cff1-tabl
 e.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-cff2-table.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-face.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-aat-ltag-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-layout-common.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-cache.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-face-table-list.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shaper-thai.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-shape-plan.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shaper-indic.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-shape.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-outline.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shaper-syllabic.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-paint.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-cff-common.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shaper-khmer.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shaper.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-shaper.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-instancer-solver.cc /usr/src/debug/harfbuzz
 /14.6.0/src/hb-cplusplus.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-cff2.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-buffer-verify.cc", added "/usr/src/debug/harfbuzz/15.0.0/src/hb-cff-interp-common.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shaper-arabic-win1256.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shaper-use-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-outline.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-aat-layout-feat-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-aat-layout-just-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-common.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-aat-layout-trak-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-bit-set.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-blob.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ft.h /usr/src/debug/harfbuzz/15.0.0/src/hb-buffer-serialize.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-os2-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-bit-page.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-paint-extents.hh /usr/src/debug/harfbuzz/1
 5.0.0/src/hb-ot-meta.h /usr/src/debug/harfbuzz/15.0.0/src/hb-atomic.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-serialize.h /usr/src/debug/harfbuzz/15.0.0/src/hb-machinery.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-table-cff.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-table-var.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-plan.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-name.h /usr/src/debug/harfbuzz/15.0.0/src/hb-aat-layout.h /usr/src/debug/harfbuzz/15.0.0/src/hb-face.h /usr/src/debug/harfbuzz/15.0.0/src/hb-kern.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-version.h /usr/src/debug/harfbuzz/15.0.0/src/hb-font.h /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-metrics.h /usr/src/debug/harfbuzz/15.0.0/src/hb-string-array.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-shaper-list.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-depend.h /usr/src/debug/harfbuzz/15.0.0/src/hb-utf.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shaper-myanmar.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-plan-
 layout.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-free-pool.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-meta.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-aat-layout.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-set-digest.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-cff-interp-cs-common.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-draw.h /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-font.h /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-layout.h /usr/src/debug/harfbuzz/15.0.0/src/hb-number.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-fetch.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-depend.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-cff-interp-dict-common.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-os2-unicode-ranges.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-decycler.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shaper-arabic-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-serialize.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-input.cc /usr/src/debug/harfbuzz/15.0.0/s
 rc/hb-ot-shaper-vowel-constraints.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shaper-arabic-pua.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shape-normalize.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-cff2-round.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-paint-extents.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-script-list.h /usr/src/debug/harfbuzz/15.0.0/src/hb-paint.h /usr/src/debug/harfbuzz/15.0.0/src/hb-cairo.h /usr/src/debug/harfbuzz/15.0.0/src/hb-cff1-interp-cs.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-font.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shaper-vowel-constraints.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-common.h /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-layout-gsubgpos.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-hdmx-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-head-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-hhea-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-aat-layout.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-hmtx-table.hh /usr/src/debug/harfbuzz/15.
 0.0/src/hb-face.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-layout-gpos-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-draw.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-post-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-aat-map.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-paint-bounded.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-var.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-cff-width-optimizer.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-null.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-table-color.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-table-other.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-object.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-blob.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-number-parser.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-table-layout.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shape-fallback.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-math.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-metrics.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-post-table-v2subset.hh /u
 sr/src/debug/harfbuzz/15.0.0/src/hb-ot-cff1-table.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-cff2-table.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-face.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-aat-ltag-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-layout-common.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-cache.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-face-table-list.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shaper-thai.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-vorg-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shaper-indic.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-shape-plan.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-shape.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-outline.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shaper-syllabic.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-paint.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-cff-common.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shaper-khmer.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shaper.hh /usr/src/debug/harfbuzz/15.0.0/sr
 c/hb-shaper.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-instancer-solver.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-cplusplus.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-cff2.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-buffer-verify.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-cairo-utils.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shaper-default.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-repacker.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-aat-layout-kerx-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-aat-layout-ankr-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-aat-layout-morx-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-cff-specializer.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-buffer.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-tag-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-style.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-accelerator.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-unicode.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shape-fallback.cc /usr/src/debug/harfbuzz/15.0.0/sr
 c/hb-aat-layout-common.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-dual.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-cff1.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-serialize.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-aat-map.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-cff-common.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-alloc-pool.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shaper-indic-table.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-array.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-instancer-solver.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-cairo.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-paint-bounded.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ucd-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-font.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-set.h /usr/src/debug/harfbuzz/15.0.0/src/hb-blob.h /usr/src/debug/harfbuzz/15.0.0/src/hb-buffer.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ft.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-depend.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-depreca
 ted.h /usr/src/debug/harfbuzz/15.0.0/src/hb.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-number.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-paint.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-shaper.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-open-file.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-open-type.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-name.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-plan.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-multimap.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shape.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shaper-arabic.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-dispatch.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-set.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-icu.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-color.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shape.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shaper-arabic.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-plan-member-list.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-shape-plan.cc /usr/src/debug/harfbuzz/15.0.0
 /src/hb-ot-map.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-gobject-enums.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-unicode.h /usr/src/debug/harfbuzz/15.0.0/src/hb-result.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-deprecated.h /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shaper-use.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-draw.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ft-colr.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-map.h /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-color.h /usr/src/debug/harfbuzz/15.0.0/src/hb-limits.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-name-language.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-meta.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-var-avar-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-var-cvar-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-var-fvar-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-var-gvar-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-var-hvar-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-cff2-interp-cs.hh /usr/src/debug/harfbuzz/15.0.0/
 src/hb-font.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-var-mvar-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-plan-var.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-map.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-kern-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-set.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-fallback-shape.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-buffer.h /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-cff-common.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-stat-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shape-normalize.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-math-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-maxp-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-meta-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-cff1-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-cff2-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-cmap-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-algs.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-face-builder.cc /usr/src/debug
 /harfbuzz/15.0.0/src/hb-geometry.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-face.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-layout-gsub-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-layout-base-table.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-name-language-static.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-shape-plan.h /usr/src/debug/harfbuzz/15.0.0/src/hb-static.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-subset.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-metrics.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-depend-data.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-subset.h /usr/src/debug/harfbuzz/15.0.0/src/hb-shape.h /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shaper-arabic-fallback.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-iter.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-instancer-iup.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ucd.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shaper-syllabic.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-map.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-map.hh /usr/
 src/debug/harfbuzz/15.0.0/src/hb-ot-math.h /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-var.h /usr/src/debug/harfbuzz/15.0.0/src/hb-subset.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-layout.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-post-macroman.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-tag.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-sanitize.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-input.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-cff2-to-cff1.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-unicode.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-glib.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-gobject-structs.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-cairo-utils.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-style.h /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-fetch.h /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shaper-arabic-joining-list.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-bit-set-invertible.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-bimap.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-unicode-emoji-table.h
 h /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-var-common.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-gobject-enums.h /usr/src/debug/harfbuzz/15.0.0/src/hb-face.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-priority-queue.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-layout.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shaper-hangul.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shaper-hebrew.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-shaper-indic.cc /usr/src/debug/harfbuzz/15.0.0/src/hb-mutex.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-subset-instancer-iup.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-ot-cff1-std-str.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-debug.hh /usr/src/debug/harfbuzz/15.0.0/src/hb-vector.hh"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: PKGV changed from 14.6.0 [default] to 15.0.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: PKGSIZE changed from 5786657 to 5862885 (+1%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: PV changed from "14.6.0" to "15.0.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-staticdev: PKGV changed from 14.6.0 [default] to 15.0.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-staticdev: PV changed from "14.6.0" to "15.0.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: FILES: removed "/usr/lib/libharfbuzz-subset.so.0.61460.0", added "/usr/lib/libharfbuzz-subset.so.0.61500.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.61460.0", added "/usr/lib/libharfbuzz-subset.so.0.61500.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: PKGV changed from 14.6.0 [default] to 15.0.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: PKGSIZE changed from 1116327 to 1427655 (+28%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: PV changed from "14.6.0" to "15.0.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz.so.0.61460.0", added "/usr/lib/libharfbuzz.so.0.61500.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: PKGV changed from 14.6.0 [default] to 15.0.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: PKGSIZE changed from 1088288 to 1186592 (+9%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: PV changed from "14.6.0" to "15.0.0"
packages/x86-64-v3-poky-linux/harfbuzz: SRC_URI changed from "https://github.com/harfbuzz/harfbuzz/releases//download/14.6.0/harfbuzz-14.6.0.tar.xz" to "https://github.com/harfbuzz/harfbuzz/releases//download/15.0.0/harfbuzz-15.0.0.tar.xz"
packages/x86-64-v3-poky-linux/harfbuzz: PKGV changed from 14.6.0 [default] to 15.0.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz: PV changed from "14.6.0" to "15.0.0"
Changes to packages/x86-64-v3-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-cairo.so.0 changed symlink target from libharfbuzz-cairo.so.0.61460.0 to libharfbuzz-cairo.so.0.61500.0
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.61460.0 to libharfbuzz-gobject.so.0.61500.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.61460.0 to libharfbuzz-icu.so.0.61500.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.61460.0 to libharfbuzz.so.0.61500.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.61460.0 to libharfbuzz-subset.so.0.61500.0
  /usr/lib/libharfbuzz-cairo.so.0.61460.0 moved to /usr/lib/libharfbuzz-cairo.so.0.61500.0
  /usr/lib/libharfbuzz-gobject.so.0.61460.0 moved to /usr/lib/libharfbuzz-gobject.so.0.61500.0
  /usr/lib/libharfbuzz-icu.so.0.61460.0 moved to /usr/lib/libharfbuzz-icu.so.0.61500.0
  /usr/lib/libharfbuzz.so.0.61460.0 moved to /usr/lib/libharfbuzz.so.0.61500.0
  /usr/lib/libharfbuzz-subset.so.0.61460.0 moved to /usr/lib/libharfbuzz-subset.so.0.61500.0

--===============0613011848510254305==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-harfbuzz-upgrade-14.6.0-15.0.0.patch"

RnJvbSBhMjg4YTFkYjAxZWVjZmQ5YTNiNGRhZGQyZmZlMjc0ODQ3MTkyZmY3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMjMgT2N0IDIwMjYgMDU6NDc6MzcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBo
YXJmYnV6ejogdXBncmFkZSAxNC42LjAgLT4gMTUuMC4wCgpPdmVydmlldyBvZiBjaGFuZ2VzIGxl
YWRpbmcgdG8gMTUuMC4wClRodXJzZGF5LCBPY3RvYmVyIDIyLCAyMDI2Cj09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT0KLSBTdXBwb3J0IGZvciB0aGUgbmV3IHRhYmxlcyBhbmQg
Zm9ybWF0cyBpbiB0aGUgSVNPIE9wZW4gRm9udCBGb3JtYXQgKE9GRikgNXRoCiAgZWRpdGlvbiBp
cyBub3cgZW5hYmxlZCBieSBkZWZhdWx0OgoKLSBEZXByZWNhdGVkIEFQSToKICAtaGJfZm9udF9z
ZXRfZmFjZSgpCi0tLQogLi4uL2hhcmZidXp6L3toYXJmYnV6el8xNC42LjAuYmIgPT4gaGFyZmJ1
enpfMTUuMC4wLmJifSAgICAgICAgIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hhcmZidXp6
L3toYXJmYnV6el8xNC42LjAuYmIgPT4gaGFyZmJ1enpfMTUuMC4wLmJifSAoOTYlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6ei9oYXJmYnV6el8xNC42LjAuYmIg
Yi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enovaGFyZmJ1enpfMTUuMC4wLmJiCnNpbWls
YXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6
ei9oYXJmYnV6el8xNC42LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9oYXJm
YnV6ei9oYXJmYnV6el8xNS4wLjAuYmIKaW5kZXggN2VmMDg5N2ExOC4uZWM4MjllMGEyNCAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hhcmZidXp6L2hhcmZidXp6XzE0LjYuMC5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enovaGFyZmJ1enpfMTUuMC4wLmJi
CkBAIC05LDcgKzksNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1i
OTg0MjliOGU4ZTNjMmE2N2NmZWYwMWU5OWU0ODkzZCBcCiAgICAgICAgICAgICAgICAgICAgICIK
IAogU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvJHtQVn0vJHtCUE59LSR7
UFZ9LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJkMDdhMDA3MzI3Mjc3NzA4YTJhNzNh
ZTQzNzg4N2NkYmFmMjgyOTM3ZjZkMDNjYTU0Njc3MjNlOTA5OWFmNTg2IgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjk2ODUzNmU5YWJkNzgyZjA3Zjc5NTQwNDRjMGM0MDIwMTk5ZmNkZDM5YjQxZDIy
MWVjNDJkMmEzYmU0YTQ0ZGYiCiAKIGluaGVyaXQgbWVzb24gcGtnY29uZmlnIGxpYl9wYWNrYWdl
IGd0ay1kb2MgZ29iamVjdC1pbnRyb3NwZWN0aW9uIGdpdGh1Yi1yZWxlYXNlcwogCi0tIAoyLjQ3
LjEKCg==

--===============0613011848510254305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: FILELIST: removed "/usr/lib/libharfbuzz-cairo.so.0.61460.0", added "/usr/lib/libharfbuzz-cairo.so.0.61500.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: PKGSIZE changed from 99305920 to 127202192 (+28%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.61460.0", added "/usr/lib/libharfbuzz-gobject.so.0.61500.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.61460.0", added "/usr/lib/libharfbuzz-icu.so.0.61500.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.61460.0", added "/usr/lib/libharfbuzz-subset.so.0.61500.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: PKGSIZE changed from 1116327 to 1427655 (+28%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz.so.0.61460.0", added "/usr/lib/libharfbuzz.so.0.61500.0"
Changes to packages/x86-64-v3-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-cairo.so.0 changed symlink target from libharfbuzz-cairo.so.0.61460.0 to libharfbuzz-cairo.so.0.61500.0
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.61460.0 to libharfbuzz-gobject.so.0.61500.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.61460.0 to libharfbuzz-icu.so.0.61500.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.61460.0 to libharfbuzz.so.0.61500.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.61460.0 to libharfbuzz-subset.so.0.61500.0
  /usr/lib/libharfbuzz-cairo.so.0.61460.0 moved to /usr/lib/libharfbuzz-cairo.so.0.61500.0
  /usr/lib/libharfbuzz-gobject.so.0.61460.0 moved to /usr/lib/libharfbuzz-gobject.so.0.61500.0
  /usr/lib/libharfbuzz-icu.so.0.61460.0 moved to /usr/lib/libharfbuzz-icu.so.0.61500.0
  /usr/lib/libharfbuzz.so.0.61460.0 moved to /usr/lib/libharfbuzz.so.0.61500.0
  /usr/lib/libharfbuzz-subset.so.0.61460.0 moved to /usr/lib/libharfbuzz-subset.so.0.61500.0

--===============0613011848510254305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="harfbuzz-changelog.txt"

Overview of changes leading to 15.0.0
Thursday, October 22, 2026
=====================================
- Support for the new tables and formats in the ISO Open Font Format (OFF) 5th
  edition is now enabled by default:

- Deprecated API:
  -hb_font_set_face()

--===============0613011848510254305==--
