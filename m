Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1394C282C4
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:21:14 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.42642.1738416063598157238
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:21:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=jCUQllOQ;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=dPx2Xt2A;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010194c1ac01ff-566866a7-eb1e-448b-9105-d37f310c3868-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416063;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ltWSIHkjUhOmtLb3KS05rtxPXXUhtm/UdAc0+t7b6H8=;
	b=jCUQllOQaRuO13lLa8LU5GZEgzaHez4DDxbfj80QcNsTMDkoIZJZQRZT/hs04Kod
	0I4zX+ssXaetfQEOt06klRFb4ERa18BMW3JfKw1LAQmWMocpkNGNToS/FnfB8ENdvKx
	xSU+LsynXZqKlM9Ts8IWqf1aZ1wgDZN3TRj4oLSU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416063;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ltWSIHkjUhOmtLb3KS05rtxPXXUhtm/UdAc0+t7b6H8=;
	b=dPx2Xt2AX8NFsp3Kqyy4RYoQqSyoGcz1hZNh1NT7dbVcciZTm5BmuoUJaFXd9aIR
	TZdQA2Lxh4yncQqA7vnW6n6v3+FjIwCaCR0dU9xEsaaSRmrxNuPJzUWGhrFlh+Ua4ND
	rFmHEnOj1LPPvd8CwM7xg73LBpUqNQ94eRMsoTUM=
Content-Type: multipart/mixed; boundary="===============2518372171849640641=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] harfbuzz: upgrading to 10.2.0 SUCCEEDED
Message-ID: <01010194c1ac01ff-566866a7-eb1e-448b-9105-d37f310c3868-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:21:02 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:21:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210575

--===============2518372171849640641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *harfbuzz* to *10.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-harfbuzz-upgrade-10.1.0-10.2.0.patch
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
From 40d7e74dd43e0d8efd1a7ddd7a0a660dddd862a8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Feb 2025 11:21:35 +0000
Subject: [PATCH] harfbuzz: upgrade 10.1.0 -> 10.2.0

---
 .../harfbuzz/{harfbuzz_10.1.0.bb => harfbuzz_10.2.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_10.1.0.bb => harfbuzz_10.2.0.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_10.1.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_10.1.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb
index 4425dd3e1e..879cad36dc 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_10.1.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "6ce3520f2d089a33cef0fc48321334b8e0b72141f6a763719aaaecd2779ecb82"
+SRC_URI[sha256sum] = "620e3468faec2ea8685d32c46a58469b850ef63040b3565cde05959825b48227"
 
 DEPENDS += "glib-2.0-native"
 
-- 
2.44.1


--===============2518372171849640641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/harfbuzz/harfbuzz-bin: PV changed from "10.1.0" to "10.2.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-bin: PKGV changed from 10.1.0 [default] to 10.2.0 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dbg: FILELIST: removed "/usr/lib/.debug/libharfbuzz.so.0.61010.0 /usr/lib/.debug/libharfbuzz-subset.so.0.61010.0 /usr/lib/.debug/libharfbuzz-icu.so.0.61010.0 /usr/lib/.debug/libharfbuzz-gobject.so.0.61010.0 /usr/lib/.debug/libharfbuzz-cairo.so.0.61010.0", added "/usr/lib/.debug/libharfbuzz-icu.so.0.61020.0 /usr/lib/.debug/libharfbuzz.so.0.61020.0 /usr/lib/.debug/libharfbuzz-gobject.so.0.61020.0 /usr/lib/.debug/libharfbuzz-subset.so.0.61020.0 /usr/lib/.debug/libharfbuzz-cairo.so.0.61020.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dbg: PV changed from "10.1.0" to "10.2.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dbg: PKGV changed from 10.1.0 [default] to 10.2.0 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dbg: PKGSIZE changed from 78348424 to 80146504 (+2%)
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dev: FILELIST: removed "/usr/include/harfbuzz/hb-subset-repacker.h", added "/usr/include/harfbuzz/hb-subset-serialize.h"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dev: PV changed from "10.1.0" to "10.2.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dev: PKGV changed from 10.1.0 [default] to 10.2.0 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dev: PKGSIZE changed from 1735496 to 1731693 (-0%)
packages/core2-64-poky-linux/harfbuzz/harfbuzz-doc: PV changed from "10.1.0" to "10.2.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-doc: PKGV changed from 10.1.0 [default] to 10.2.0 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu-dev: PV changed from "10.1.0" to "10.2.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu-dev: PKGV changed from 10.1.0 [default] to 10.2.0 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.61010.0", added "/usr/lib/libharfbuzz-icu.so.0.61020.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu: PV changed from "10.1.0" to "10.2.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu: PKGV changed from 10.1.0 [default] to 10.2.0 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-locale: PV changed from "10.1.0" to "10.2.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-locale: PKGV changed from 10.1.0 [default] to 10.2.0 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-src: FILELIST: directory renamed /usr/src/debug/harfbuzz/10.1.0/src/OT/Color/svg -> /usr/src/debug/harfbuzz/10.2.0/src/OT/Color/svg, directory renamed /usr/src/debug/harfbuzz/10.1.0/src/OT/Color/sbix -> /usr/src/debug/harfbuzz/10.2.0/src/OT/Color/sbix, directory renamed /usr/src/debug/harfbuzz/10.1.0/src/OT/Color/CPAL -> /usr/src/debug/harfbuzz/10.2.0/src/OT/Color/CPAL, directory renamed /usr/src/debug/harfbuzz/10.1.0/src/OT/Color/COLR -> /usr/src/debug/harfbuzz/10.2.0/src/OT/Color/COLR, directory renamed /usr/src/debug/harfbuzz/10.1.0/src/OT/Layout/Common -> /usr/src/debug/harfbuzz/10.2.0/src/OT/Layout/Common, directory renamed /usr/src/debug/harfbuzz/10.1.0/src/OT/Layout/GSUB -> /usr/src/debug/harfbuzz/10.2.0/src/OT/Layout/GSUB, directory renamed /usr/src/debug/harfbuzz/10.1.0/src/OT/name -> /usr/src/debug/harfbuzz/10.2.0/src/OT/name, directory renamed /usr/src/debug/harfbuzz/10.1.0/src/OT/Layout/GDEF -> /usr/src/debug/harfbuzz/10.2.0/
 src/OT/Layout/GDEF, directory renamed /usr/src/debug/harfbuzz/10.1.0/src/OT/Layout -> /usr/src/debug/harfbuzz/10.2.0/src/OT/Layout, directory renamed /usr/src/debug/harfbuzz/10.1.0/src/OT/Color/CBDT -> /usr/src/debug/harfbuzz/10.2.0/src/OT/Color/CBDT, directory renamed /usr/src/debug/harfbuzz/10.1.0/src/OT/glyf -> /usr/src/debug/harfbuzz/10.2.0/src/OT/glyf, directory renamed /usr/src/debug/harfbuzz/10.1.0/src/graph -> /usr/src/debug/harfbuzz/10.2.0/src/graph, directory renamed /usr/src/debug/harfbuzz/10.1.0/src/OT/Layout/GPOS -> /usr/src/debug/harfbuzz/10.2.0/src/OT/Layout/GPOS, directory renamed /usr/src/debug/harfbuzz/10.1.0/util -> /usr/src/debug/harfbuzz/10.2.0/util, removed "/usr/src/debug/harfbuzz/10.1.0/src/hb-cairo-utils.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-var-fvar-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-var-avar-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-var-cvar-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-bit-page.hh /usr/src/debug/harfbuzz/10.1
 .0/src/hb-bit-set-invertible.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shape-normalize.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-machinery.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shaper-syllabic.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-math-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-maxp-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-cff-interp-dict-common.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-font.h /usr/src/debug/harfbuzz/10.1.0/src/hb-gobject-structs.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-os2-unicode-ranges.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-subset-cff-common.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shaper-use-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-buffer.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-tag-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-bimap.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-priority-queue.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-buffer-serialize.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shape-normalize.hh /usr/src/deb
 ug/harfbuzz/10.1.0/src/hb-cairo.h /usr/src/debug/harfbuzz/10.1.0/src/hb-face-builder.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-color.h /usr/src/debug/harfbuzz/10.1.0/src/hb-outline.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-face.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-shape.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-layout-gpos-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-subset.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-cff1-interp-cs.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ft.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-cache.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-metrics.h /usr/src/debug/harfbuzz/10.1.0/src/hb-ucd.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shaper-syllabic.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-blob.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-paint.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-array.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-cairo-utils.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-cff-interp-cs-common.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-icu.cc /u
 sr/src/debug/harfbuzz/10.1.0/src/hb-ot-shaper-myanmar.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shaper-arabic-joining-list.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-set.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-font.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-math.h /usr/src/debug/harfbuzz/10.1.0/src/hb-subset-plan-member-list.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-blob.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-var-common.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-subset-plan.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-unicode.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shaper-khmer.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-metrics.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shaper-default.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-number.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-gobject-enums.h /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-layout-common.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-subset-instancer-solver.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-subset.h /usr/src/debug/harfbuz
 z/10.1.0/src/hb-ot-shape-fallback.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-draw.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-cff-interp-common.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-shape-plan.h /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-cff1-std-str.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-post-table-v2subset.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-aat-layout.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-layout.h /usr/src/debug/harfbuzz/10.1.0/src/hb-sanitize.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-buffer-verify.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-subset-cff1.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shaper.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-subset.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-null.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-face.h /usr/src/debug/harfbuzz/10.1.0/src/hb-face.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-name.h /usr/src/debug/harfbuzz/10.1.0/src/hb-outline.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-meta.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-blo
 b.h /usr/src/debug/harfbuzz/10.1.0/src/hb-aat-layout-common.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-name.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-common.h /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shape-fallback.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-fallback-shape.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-subset-accelerator.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-shape.h /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-map.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-math.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-font.h /usr/src/debug/harfbuzz/10.1.0/src/hb-aat-layout-trak-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-aat-layout-just-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-aat-layout-feat-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-cairo.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-deprecated.h /usr/src/debug/harfbuzz/10.1.0/src/hb-set.h /usr/src/debug/harfbuzz/10.1.0/src/hb-paint-extents.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-glib.cc /usr/src/debug/harfbuzz/10.1.0/src/hb
 -subset-instancer-iup.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-paint.h /usr/src/debug/harfbuzz/10.1.0/src/hb-aat-map.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shaper-arabic-pua.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-subset-input.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shaper-arabic.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-unicode.h /usr/src/debug/harfbuzz/10.1.0/src/hb-draw.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shaper-indic.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shaper-arabic-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-shaper.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shaper-arabic.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-subset-cff-common.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-hdmx-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-head-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-hhea-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-hmtx-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-post-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-face.hh /u
 sr/src/debug/harfbuzz/10.1.0/src/hb-ot-name-language-static.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-vorg-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-kern.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shaper-indic-table.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-unicode.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-cff1-table.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-cff2-table.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-bit-set.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-subset-instancer-solver.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-aat-map.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ucd-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-name-language.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-metrics.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-open-file.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-open-type.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-multimap.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-map.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-tag.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-l
 ayout-gsubgpos.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-aat-ltag-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-os2-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-gobject-enums.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-version.h /usr/src/debug/harfbuzz/10.1.0/src/hb-aat-layout.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-dispatch.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-object.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shaper-indic.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-serialize.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-set-digest.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-layout-gsub-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shaper-vowel-constraints.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-cff2-interp-cs.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-string-array.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-shape-plan.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shape.h /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-var.h /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-stat-table.hh /usr/src/deb
 ug/harfbuzz/10.1.0/src/hb-ot-face-table-list.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-mutex.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-face.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-cff-common.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-utf.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-geometry.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-map.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-repacker.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ft.h /usr/src/debug/harfbuzz/10.1.0/src/hb-vector.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-iter.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-layout.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-post-macroman.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-deprecated.h /usr/src/debug/harfbuzz/10.1.0/src/hb-set.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-meta.h /usr/src/debug/harfbuzz/10.1.0/src/hb-paint.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-shaper.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shaper-vowel-constraints.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-color.cc /usr
 /src/debug/harfbuzz/10.1.0/src/hb-ot-shape.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-number.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-var-gvar-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-map.h /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-kern-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-var-hvar-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shape.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-var-mvar-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-meta.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-static.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ft-colr.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-layout.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shaper-hangul.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shaper-hebrew.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-atomic.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-algs.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-unicode-emoji-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-subset-plan.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-buffer.h /usr/src/deb
 ug/harfbuzz/10.1.0/src/hb-aat-layout.h /usr/src/debug/harfbuzz/10.1.0/src/hb-pool.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-paint-extents.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-subset-instancer-iup.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-subset-input.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-font.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-var.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-shaper-list.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-style.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-common.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shaper-thai.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-font.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-aat-layout-kerx-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-aat-layout-ankr-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-aat-layout-morx-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-buffer.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-cplusplus.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-cff1-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-cff2-table
 .hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-cmap-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shaper-arabic-fallback.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shaper-use.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-map.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-subset-cff2.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-draw.h /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-layout-base-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-shape-plan.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-debug.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-style.h /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-meta-table.hh", added "/usr/src/debug/harfbuzz/10.2.0/src/hb-cairo-utils.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-var-fvar-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-var-avar-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-var-cvar-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-bit-page.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-bit-set-invertible.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shape-normalize.cc
  /usr/src/debug/harfbuzz/10.2.0/src/hb-machinery.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shaper-syllabic.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-math-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-maxp-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-cff-interp-dict-common.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-font.h /usr/src/debug/harfbuzz/10.2.0/src/hb-gobject-structs.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-os2-unicode-ranges.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-subset-cff-common.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shaper-use-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-buffer.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-tag-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-bimap.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-priority-queue.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-buffer-serialize.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shape-normalize.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-cairo.h /usr/src/debug/harfbuzz/10.2.0/src/hb-face-builder.cc /us
 r/src/debug/harfbuzz/10.2.0/src/hb-ot-color.h /usr/src/debug/harfbuzz/10.2.0/src/hb-outline.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-face.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-shape.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-layout-gpos-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-subset.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-cff1-interp-cs.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ft.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-cache.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-metrics.h /usr/src/debug/harfbuzz/10.2.0/src/hb-ucd.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shaper-syllabic.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-blob.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-paint.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-array.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-cairo-utils.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-cff-interp-cs-common.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-icu.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shaper-myanmar.cc /usr/src/debug/harfbuzz/10.2.0/src
 /hb-ot-shaper-arabic-joining-list.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-set.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-font.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-math.h /usr/src/debug/harfbuzz/10.2.0/src/hb-subset-plan-member-list.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-blob.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-var-common.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-subset-plan.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-unicode.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shaper-khmer.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-metrics.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shaper-default.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-number.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-gobject-enums.h /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-layout-common.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-subset-instancer-solver.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-subset.h /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shape-fallback.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-draw.hh /usr/src
 /debug/harfbuzz/10.2.0/src/hb-cff-interp-common.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-shape-plan.h /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-cff1-std-str.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-post-table-v2subset.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-aat-layout.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-layout.h /usr/src/debug/harfbuzz/10.2.0/src/hb-sanitize.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-buffer-verify.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-subset-cff1.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shaper.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-subset.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-null.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-face.h /usr/src/debug/harfbuzz/10.2.0/src/hb-face.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-name.h /usr/src/debug/harfbuzz/10.2.0/src/hb-outline.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-meta.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-blob.h /usr/src/debug/harfbuzz/10.2.0/src/hb-aat-layout-common.hh /usr/src/debug/harfbuzz/10.2
 .0/src/hb-ot-name.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-common.h /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shape-fallback.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-fallback-shape.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-subset-accelerator.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-shape.h /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-map.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-math.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-font.h /usr/src/debug/harfbuzz/10.2.0/src/hb-aat-layout-trak-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-aat-layout-just-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-aat-layout-feat-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-cairo.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-deprecated.h /usr/src/debug/harfbuzz/10.2.0/src/hb-set.h /usr/src/debug/harfbuzz/10.2.0/src/hb-paint-extents.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-glib.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-subset-instancer-iup.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-paint.h /usr/src/debug/harfb
 uzz/10.2.0/src/hb-aat-map.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shaper-arabic-pua.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-subset-input.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shaper-arabic.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-unicode.h /usr/src/debug/harfbuzz/10.2.0/src/hb-draw.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shaper-indic.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shaper-arabic-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-shaper.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shaper-arabic.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-subset-cff-common.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-hdmx-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-head-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-hhea-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-hmtx-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-post-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-face.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-name-language-static.hh /usr/src/debug/harfbuzz/10.2
 .0/src/hb-ot-vorg-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-kern.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shaper-indic-table.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-unicode.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-cff1-table.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-cff2-table.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-bit-set.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-subset-instancer-solver.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-aat-map.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-subset-serialize.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ucd-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-name-language.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-metrics.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-open-file.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-open-type.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-multimap.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-map.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-tag.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-layout-gsubgpos.hh /usr/src/debug/
 harfbuzz/10.2.0/src/hb-aat-ltag-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-os2-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-gobject-enums.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-version.h /usr/src/debug/harfbuzz/10.2.0/src/hb-aat-layout.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-dispatch.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-object.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shaper-indic.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-serialize.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-set-digest.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-layout-gsub-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shaper-vowel-constraints.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-cff2-interp-cs.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-string-array.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-shape-plan.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shape.h /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-var.h /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-stat-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-face
 -table-list.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-mutex.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-face.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-cff-common.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-utf.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-geometry.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-map.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-repacker.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ft.h /usr/src/debug/harfbuzz/10.2.0/src/hb-vector.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-iter.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-layout.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-post-macroman.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-deprecated.h /usr/src/debug/harfbuzz/10.2.0/src/hb-set.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-meta.h /usr/src/debug/harfbuzz/10.2.0/src/hb-paint.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-subset-serialize.h /usr/src/debug/harfbuzz/10.2.0/src/hb-shaper.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shaper-vowel-constraints.hh /usr/src/debug/harfbuzz/10.2.0
 /src/hb-ot-color.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shape.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-number.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-var-gvar-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-map.h /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-kern-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-var-hvar-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shape.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-var-mvar-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-meta.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-static.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ft-colr.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-layout.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shaper-hangul.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shaper-hebrew.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-atomic.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-algs.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-unicode-emoji-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-subset-plan.cc /usr/src/debug/harfbuzz/10.2.0/src/
 hb-buffer.h /usr/src/debug/harfbuzz/10.2.0/src/hb-aat-layout.h /usr/src/debug/harfbuzz/10.2.0/src/hb-pool.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-paint-extents.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-subset-instancer-iup.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-subset-input.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-font.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-var.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-shaper-list.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-style.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-common.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shaper-thai.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-font.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-aat-layout-kerx-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-aat-layout-ankr-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-aat-layout-morx-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-buffer.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-cplusplus.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-cff1-table.hh /usr/src/debug/harfbuzz/10.
 2.0/src/hb-ot-cff2-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-cmap-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shaper-arabic-fallback.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shaper-use.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-map.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-subset-cff2.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-draw.h /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-layout-base-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-shape-plan.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-debug.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-style.h /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-meta-table.hh"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-src: PV changed from "10.1.0" to "10.2.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-src: PKGV changed from 10.1.0 [default] to 10.2.0 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-src: PKGSIZE changed from 4942077 to 4952739 (+0%)
packages/core2-64-poky-linux/harfbuzz/harfbuzz-staticdev: PV changed from "10.1.0" to "10.2.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-staticdev: PKGV changed from 10.1.0 [default] to 10.2.0 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.61010.0", added "/usr/lib/libharfbuzz-subset.so.0.61020.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-subset: PV changed from "10.1.0" to "10.2.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-subset: PKGV changed from 10.1.0 [default] to 10.2.0 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-subset: PKGSIZE changed from 1509615 to 1525999 (+1%)
packages/core2-64-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz-cairo.so.0.61010.0 /usr/lib/libharfbuzz-gobject.so.0.61010.0 /usr/lib/libharfbuzz.so.0.61010.0", added "/usr/lib/libharfbuzz-cairo.so.0.61020.0 /usr/lib/libharfbuzz-gobject.so.0.61020.0 /usr/lib/libharfbuzz.so.0.61020.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz: PV changed from "10.1.0" to "10.2.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz: PKGV changed from 10.1.0 [default] to 10.2.0 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz: PKGSIZE changed from 1656198 to 1664094 (+0%)
packages/core2-64-poky-linux/harfbuzz: SRC_URI changed from "https://github.com/harfbuzz/harfbuzz/releases//download/10.1.0/harfbuzz-10.1.0.tar.xz" to "https://github.com/harfbuzz/harfbuzz/releases//download/10.2.0/harfbuzz-10.2.0.tar.xz"
packages/core2-64-poky-linux/harfbuzz: PV changed from "10.1.0" to "10.2.0"
packages/core2-64-poky-linux/harfbuzz: PKGV changed from 10.1.0 [default] to 10.2.0 [default]
Changes to packages/core2-64-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-cairo.so.0 changed symlink target from libharfbuzz-cairo.so.0.61010.0 to libharfbuzz-cairo.so.0.61020.0
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.61010.0 to libharfbuzz-gobject.so.0.61020.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.61010.0 to libharfbuzz-icu.so.0.61020.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.61010.0 to libharfbuzz.so.0.61020.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.61010.0 to libharfbuzz-subset.so.0.61020.0
  /usr/lib/libharfbuzz-cairo.so.0.61010.0 moved to /usr/lib/libharfbuzz-cairo.so.0.61020.0
  /usr/lib/libharfbuzz-gobject.so.0.61010.0 moved to /usr/lib/libharfbuzz-gobject.so.0.61020.0
  /usr/lib/libharfbuzz-icu.so.0.61010.0 moved to /usr/lib/libharfbuzz-icu.so.0.61020.0
  /usr/lib/libharfbuzz.so.0.61010.0 moved to /usr/lib/libharfbuzz.so.0.61020.0
  /usr/lib/libharfbuzz-subset.so.0.61010.0 moved to /usr/lib/libharfbuzz-subset.so.0.61020.0
  /usr/include/harfbuzz/hb-subset-serialize.h was added
  /usr/include/harfbuzz/hb-subset-repacker.h was removed

--===============2518372171849640641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/harfbuzz/harfbuzz-dev: FILELIST: removed "/usr/include/harfbuzz/hb-subset-repacker.h", added "/usr/include/harfbuzz/hb-subset-serialize.h"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.61010.0", added "/usr/lib/libharfbuzz-icu.so.0.61020.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.61010.0", added "/usr/lib/libharfbuzz-subset.so.0.61020.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz-cairo.so.0.61010.0 /usr/lib/libharfbuzz.so.0.61010.0 /usr/lib/libharfbuzz-gobject.so.0.61010.0", added "/usr/lib/libharfbuzz-cairo.so.0.61020.0 /usr/lib/libharfbuzz.so.0.61020.0 /usr/lib/libharfbuzz-gobject.so.0.61020.0"
Changes to packages/core2-64-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-cairo.so.0 changed symlink target from libharfbuzz-cairo.so.0.61010.0 to libharfbuzz-cairo.so.0.61020.0
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.61010.0 to libharfbuzz-gobject.so.0.61020.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.61010.0 to libharfbuzz-icu.so.0.61020.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.61010.0 to libharfbuzz.so.0.61020.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.61010.0 to libharfbuzz-subset.so.0.61020.0
  /usr/lib/libharfbuzz-cairo.so.0.61010.0 moved to /usr/lib/libharfbuzz-cairo.so.0.61020.0
  /usr/lib/libharfbuzz-gobject.so.0.61010.0 moved to /usr/lib/libharfbuzz-gobject.so.0.61020.0
  /usr/lib/libharfbuzz-icu.so.0.61010.0 moved to /usr/lib/libharfbuzz-icu.so.0.61020.0
  /usr/lib/libharfbuzz.so.0.61010.0 moved to /usr/lib/libharfbuzz.so.0.61020.0
  /usr/lib/libharfbuzz-subset.so.0.61010.0 moved to /usr/lib/libharfbuzz-subset.so.0.61020.0
  /usr/include/harfbuzz/hb-subset-serialize.h was added
  /usr/include/harfbuzz/hb-subset-repacker.h was removed

--===============2518372171849640641==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-harfbuzz-upgrade-10.1.0-10.2.0.patch"

RnJvbSA0MGQ3ZTc0ZGQ0M2UwZDhlZmQxYTdkZGQ3YTBhNjYwZGRkZDg2MmE4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBGZWIgMjAyNSAxMToyMTozNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGhh
cmZidXp6OiB1cGdyYWRlIDEwLjEuMCAtPiAxMC4yLjAKCi0tLQogLi4uL2hhcmZidXp6L3toYXJm
YnV6el8xMC4xLjAuYmIgPT4gaGFyZmJ1enpfMTAuMi4wLmJifSAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL2hhcmZidXp6L3toYXJmYnV6el8xMC4xLjAuYmIgPT4gaGFyZmJ1enpf
MTAuMi4wLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9oYXJm
YnV6ei9oYXJmYnV6el8xMC4xLjAuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enov
aGFyZmJ1enpfMTAuMi4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6ei9oYXJmYnV6el8xMC4xLjAuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6ei9oYXJmYnV6el8xMC4yLjAuYmIKaW5kZXggNDQy
NWRkM2UxZS4uODc5Y2FkMzZkYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hh
cmZidXp6L2hhcmZidXp6XzEwLjEuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFy
ZmJ1enovaGFyZmJ1enpfMTAuMi4wLmJiCkBAIC05LDcgKzksNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HO21kNT1iOTg0MjliOGU4ZTNjMmE2N2NmZWYwMWU5OWU0ODkzZCBc
CiAgICAgICAgICAgICAgICAgICAgICIKIAogU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0v
ZG93bmxvYWQvJHtQVn0vJHtCUE59LSR7UFZ9LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICI2Y2UzNTIwZjJkMDg5YTMzY2VmMGZjNDgzMjEzMzRiOGUwYjcyMTQxZjZhNzYzNzE5YWFhZWNk
Mjc3OWVjYjgyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjYyMGUzNDY4ZmFlYzJlYTg2ODVkMzJj
NDZhNTg0NjliODUwZWY2MzA0MGIzNTY1Y2RlMDU5NTk4MjViNDgyMjciCiAKIERFUEVORFMgKz0g
ImdsaWItMi4wLW5hdGl2ZSIKIAotLSAKMi40NC4xCgo=

--===============2518372171849640641==--

