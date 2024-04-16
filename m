Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1389FC52D7D
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:19 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.13594.1713248039024288200
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=IrOboLKr;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=y8rSVWpG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018ee58a96bd-1b6b85a7-5b38-4ffa-aaa3-9500d962b42a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248048;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=41zHyOWIPvfPt0QIgLmWZEQtLGXPO7VGNi894aaHF4E=;
	b=IrOboLKrbjvGKgUiwnORMjuN+H9vloEYGSMm7qQ0sSDRDH0cfjkjWIuZnO9aAZBy
	uosEMNyAS08ZvjNDzQ+Ryon3c/su+KWlBhNrBpXUeL6SMZFiwyeYYsdODuqa0CoLCsE
	3K2TVbXvqDHVZr4QxGbjjqNmZJ/CCPLXKI8g/Rz0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248048;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=41zHyOWIPvfPt0QIgLmWZEQtLGXPO7VGNi894aaHF4E=;
	b=y8rSVWpGSHHzkUubSVqzl+sDthucnr57orxJBBclwz+iS8hE+xTGEtN2q0h0QhUK
	bSpDlMBe15qEA/d3MGmPvB86Qz/p2I8VWC7SRClD5y7IVGoRTxp0UQc5Yt/6egGVq9h
	LPUtV4xGxCFqbFdMis2RgBR9dhnFeDM6easK1+mw=
Content-Type: multipart/mixed; boundary="===============0257977926705448171=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] harfbuzz: upgrading to 8.4.0 SUCCEEDED
Message-ID: <0101018ee58a96bd-1b6b85a7-5b38-4ffa-aaa3-9500d962b42a-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:14:08 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198353

--===============0257977926705448171==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *harfbuzz* to *8.4.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-harfbuzz-upgrade-8.3.0-8.4.0.patch
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
From 262a0d8bcc798bbbcaf990fe449207e2bc2fbe17 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 22:39:49 +0000
Subject: [PATCH] harfbuzz: upgrade 8.3.0 -> 8.4.0

---
 .../harfbuzz/{harfbuzz_8.3.0.bb => harfbuzz_8.4.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_8.3.0.bb => harfbuzz_8.4.0.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_8.4.0.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_8.4.0.bb
index d733342682..fc6951d9ed 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_8.4.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "109501eaeb8bde3eadb25fab4164e993fbace29c3d775bcaa1c1e58e2f15f847"
+SRC_URI[sha256sum] = "af4ea73e25ab748c8c063b78c2f88e48833db9b2ac369e29bd115702e789755e"
 
 DEPENDS += "glib-2.0-native"
 
-- 
2.42.0


--===============0257977926705448171==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.60830.0", added "/usr/lib/libharfbuzz-icu.so.0.60840.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.60830.0", added "/usr/lib/libharfbuzz-subset.so.0.60840.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.60830.0 /usr/lib/libharfbuzz-cairo.so.0.60830.0 /usr/lib/libharfbuzz.so.0.60830.0", added "/usr/lib/libharfbuzz-gobject.so.0.60840.0 /usr/lib/libharfbuzz-cairo.so.0.60840.0 /usr/lib/libharfbuzz.so.0.60840.0"
Changes to packages/core2-64-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-cairo.so.0 changed symlink target from libharfbuzz-cairo.so.0.60830.0 to libharfbuzz-cairo.so.0.60840.0
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.60830.0 to libharfbuzz-gobject.so.0.60840.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.60830.0 to libharfbuzz-icu.so.0.60840.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.60830.0 to libharfbuzz.so.0.60840.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.60830.0 to libharfbuzz-subset.so.0.60840.0
  /usr/lib/libharfbuzz-cairo.so.0.60830.0 moved to /usr/lib/libharfbuzz-cairo.so.0.60840.0
  /usr/lib/libharfbuzz-gobject.so.0.60830.0 moved to /usr/lib/libharfbuzz-gobject.so.0.60840.0
  /usr/lib/libharfbuzz-icu.so.0.60830.0 moved to /usr/lib/libharfbuzz-icu.so.0.60840.0
  /usr/lib/libharfbuzz.so.0.60830.0 moved to /usr/lib/libharfbuzz.so.0.60840.0
  /usr/lib/libharfbuzz-subset.so.0.60830.0 moved to /usr/lib/libharfbuzz-subset.so.0.60840.0

--===============0257977926705448171==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/harfbuzz/harfbuzz-bin: PKGV changed from 8.3.0 [default] to 8.4.0 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-bin: PV changed from "8.3.0" to "8.4.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dbg: PKGSIZE changed from 64187192 to 65241560 (+2%)
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dbg: PKGV changed from 8.3.0 [default] to 8.4.0 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dbg: FILELIST: removed "/usr/lib/.debug/libharfbuzz-cairo.so.0.60830.0 /usr/lib/.debug/libharfbuzz-subset.so.0.60830.0 /usr/lib/.debug/libharfbuzz-gobject.so.0.60830.0 /usr/lib/.debug/libharfbuzz.so.0.60830.0 /usr/lib/.debug/libharfbuzz-icu.so.0.60830.0", added "/usr/lib/.debug/libharfbuzz-icu.so.0.60840.0 /usr/lib/.debug/libharfbuzz-subset.so.0.60840.0 /usr/lib/.debug/libharfbuzz-gobject.so.0.60840.0 /usr/lib/.debug/libharfbuzz-cairo.so.0.60840.0 /usr/lib/.debug/libharfbuzz.so.0.60840.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dbg: PV changed from "8.3.0" to "8.4.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dev: PKGSIZE changed from 1716269 to 1719750 (+0%)
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dev: PKGV changed from 8.3.0 [default] to 8.4.0 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dev: PV changed from "8.3.0" to "8.4.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-doc: PKGV changed from 8.3.0 [default] to 8.4.0 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-doc: PV changed from "8.3.0" to "8.4.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu-dev: PKGSIZE changed from 295 to 304 (+3%)
packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu-dev: PKGV changed from 8.3.0 [default] to 8.4.0 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu-dev: PV changed from "8.3.0" to "8.4.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu: PKGV changed from 8.3.0 [default] to 8.4.0 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.60830.0", added "/usr/lib/libharfbuzz-icu.so.0.60840.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu: PV changed from "8.3.0" to "8.4.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-locale: PKGV changed from 8.3.0 [default] to 8.4.0 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-locale: PV changed from "8.3.0" to "8.4.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-src: PKGSIZE changed from 4792406 to 4848289 (+1%)
packages/core2-64-poky-linux/harfbuzz/harfbuzz-src: PKGV changed from 8.3.0 [default] to 8.4.0 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-src: FILELIST: directory renamed /usr/src/debug/harfbuzz/8.3.0/src/OT/Color/CPAL -> /usr/src/debug/harfbuzz/8.4.0/src/OT/Color/CPAL, directory renamed /usr/src/debug/harfbuzz/8.3.0/src/OT/Color/svg -> /usr/src/debug/harfbuzz/8.4.0/src/OT/Color/svg, directory renamed /usr/src/debug/harfbuzz/8.3.0/src/OT/name -> /usr/src/debug/harfbuzz/8.4.0/src/OT/name, directory renamed /usr/src/debug/harfbuzz/8.3.0/src/OT/Layout/GDEF -> /usr/src/debug/harfbuzz/8.4.0/src/OT/Layout/GDEF, directory renamed /usr/src/debug/harfbuzz/8.3.0/src/OT/glyf -> /usr/src/debug/harfbuzz/8.4.0/src/OT/glyf, directory renamed /usr/src/debug/harfbuzz/8.3.0/src/OT/Color/COLR -> /usr/src/debug/harfbuzz/8.4.0/src/OT/Color/COLR, directory renamed /usr/src/debug/harfbuzz/8.3.0/src/OT/Color/CBDT -> /usr/src/debug/harfbuzz/8.4.0/src/OT/Color/CBDT, directory renamed /usr/src/debug/harfbuzz/8.3.0/src/graph -> /usr/src/debug/harfbuzz/8.4.0/src/graph, directory renamed /usr/src/debug
 /harfbuzz/8.3.0/src/OT/Layout/GSUB -> /usr/src/debug/harfbuzz/8.4.0/src/OT/Layout/GSUB, directory renamed /usr/src/debug/harfbuzz/8.3.0/src/OT/Layout/GPOS -> /usr/src/debug/harfbuzz/8.4.0/src/OT/Layout/GPOS, directory renamed /usr/src/debug/harfbuzz/8.3.0/src/OT/Color/sbix -> /usr/src/debug/harfbuzz/8.4.0/src/OT/Color/sbix, directory renamed /usr/src/debug/harfbuzz/8.3.0/src/OT/Layout/Common -> /usr/src/debug/harfbuzz/8.4.0/src/OT/Layout/Common, directory renamed /usr/src/debug/harfbuzz/8.3.0/src/OT/Layout -> /usr/src/debug/harfbuzz/8.4.0/src/OT/Layout, removed "/usr/src/debug/harfbuzz/8.3.0/src/hb-ot-var.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-subset-plan-member-list.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-meta.h /usr/src/debug/harfbuzz/8.3.0/src/hb-buffer.h /usr/src/debug/harfbuzz/8.3.0/src/hb-subset-instancer-solver.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-vorg-table.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-aat-layout-trak-table.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-depr
 ecated.h /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-layout-base-table.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-shape-normalize.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-set-digest.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-shaper-khmer.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-debug.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-aat-layout.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-map.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-algs.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-shape-normalize.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-aat-layout.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-cff-interp-common.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-cff-interp-dict-common.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-var-common.hh /usr/src/debug/harfbuzz/8.3.0/util/batch.hh /usr/src/debug/harfbuzz/8.3.0/util/helper-cairo.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-layout.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-layout-gpos-table.hh /usr/src/debug/harfbuzz/8.3.0/util/shape-options.hh /usr/src/debug/harfbuzz/8.3.0
 /src/hb-ot-layout.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-gobject-enums.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-buffer.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-icu.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-map.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-set.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-ucd.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-null.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-pool.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-layout-common.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-paint.h /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-shaper-arabic-joining-list.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-mutex.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-shape-plan.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-cff2-interp-cs.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-bit-page.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-style.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-deprecated.h /usr/src/debug/harfbuzz/8.3.0/src/hb-cairo.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-cff1-interp-cs.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-pa
 int-extents.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-tag-table.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-outline.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-buffer.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-static.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-cff2-table.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-subset.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-cff1-table.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-post-table-v2subset.hh /usr/src/debug/harfbuzz/8.3.0/util/hb-subset.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-bit-set.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-shaper-syllabic.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-head-table.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-hmtx-table.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-draw.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-name.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-name.h /usr/src/debug/harfbuzz/8.3.0/src/hb-unicode.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-font.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-open-file.hh /usr/src/debug/harfbuzz
 /8.3.0/src/hb-kern.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-open-type.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-aat-layout.h /usr/src/debug/harfbuzz/8.3.0/src/hb-ucd-table.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-face.h /usr/src/debug/harfbuzz/8.3.0/src/hb-face-builder.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-cplusplus.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-aat-layout-ankr-table.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-aat-layout-feat-table.hh /usr/src/debug/harfbuzz/8.3.0/util/hb-ot-shape-closure.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-shaper-myanmar.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-sanitize.hh /usr/src/debug/harfbuzz/8.3.0/util/shape-output.hh /usr/src/debug/harfbuzz/8.3.0/util/hb-view.cc /usr/src/debug/harfbuzz/8.3.0/util/helper-cairo-ansi.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-cairo-utils.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-layout-gsubgpos.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-color.h /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-shaper-use-table.hh /usr/src/debug/ha
 rfbuzz/8.3.0/src/hb-ot-shaper-use.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-shaper-arabic-pua.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-bit-set-invertible.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-shaper-vowel-constraints.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-meta.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-shaper-list.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-metrics.h /usr/src/debug/harfbuzz/8.3.0/src/hb-shaper.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-blob.hh /usr/src/debug/harfbuzz/8.3.0/util/helper-cairo-ft.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-array.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-atomic.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-paint.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-face.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-multimap.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-object.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-face.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-font.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-math.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-shaper-arabic-t
 able.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-var.h /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-shape-fallback.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-blob.h /usr/src/debug/harfbuzz/8.3.0/src/hb-subset-input.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-subset-plan.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ft.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-shape-fallback.cc /usr/src/debug/harfbuzz/8.3.0/util/output-options.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-shape.h /usr/src/debug/harfbuzz/8.3.0/util/view-cairo.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-stat-table.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-shaper-indic-table.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-cache.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-map.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-shaper-arabic-fallback.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-set.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-aat-map.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-unicode.h /usr/src/debug/harfbuzz/8.3.0/src/hb-utf.hh /usr/src/debug/harfbuzz/8.3.0/src
 /hb-ot-cff1-std-str.hh /usr/src/debug/harfbuzz/8.3.0/util/hb-shape.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-cairo-utils.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-kern-table.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-aat-layout-common.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-fallback-shape.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-shaper.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-subset-cff-common.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-buffer-serialize.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-face.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-shape.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-subset-cff-common.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-shaper-hebrew.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-os2-unicode-ranges.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-meta.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-machinery.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-draw.h /usr/src/debug/harfbuzz/8.3.0/src/hb-subset.h /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-math.h /usr/src/debug/harfbuzz/8.3.0/src/hb-
 paint-extents.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-gobject-enums.h /usr/src/debug/harfbuzz/8.3.0/src/hb-font.h /usr/src/debug/harfbuzz/8.3.0/src/hb-ft.h /usr/src/debug/harfbuzz/8.3.0/src/hb-draw.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-number.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-map.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-aat-map.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-shaper-indic.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-paint.hh /usr/src/debug/harfbuzz/8.3.0/util/ansi-print.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-shaper-default.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-cff-common.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-cff1-table.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-cff2-table.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-os2-table.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-subset.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-metrics.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-cairo.h /usr/src/debug/harfbuzz/8.3.0/src/hb-aat-ltag-table.hh /usr/src/debug/harfbuzz/8.3.0/sr
 c/hb-ot-metrics.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-subset-instancer-solver.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-unicode-emoji-table.hh /usr/src/debug/harfbuzz/8.3.0/util/shape-consumer.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-name-language-static.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-common.h /usr/src/debug/harfbuzz/8.3.0/src/hb-aat-layout-morx-table.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-layout-gsub-table.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-font.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-shape.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-number.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-map.h /usr/src/debug/harfbuzz/8.3.0/src/hb-set.h /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-cmap-table.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-shaper-vowel-constraints.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-shape-plan.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-post-table.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-shaper-arabic.hh /usr/src/debug/harfbuzz/8.3.0/util/main-font-text.hh /usr
 /src/debug/harfbuzz/8.3.0/src/hb-ot-name-language.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-post-macroman.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-hdmx-table.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-hhea-table.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-shaper.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-tag.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-vector.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-common.cc /usr/src/debug/harfbuzz/8.3.0/util/hb-info.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-version.h /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-shaper-indic.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-color.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-math-table.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-maxp-table.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-meta-table.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-outline.cc /usr/src/debug/harfbuzz/8.3.0/util/shape-format.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-face-table-list.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-layout.h /usr/src/debug/harfbuzz/
 8.3.0/src/hb-priority-queue.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-repacker.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-blob.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-glib.cc /usr/src/debug/harfbuzz/8.3.0/util/face-options.hh /usr/src/debug/harfbuzz/8.3.0/util/font-options.hh /usr/src/debug/harfbuzz/8.3.0/util/text-options.hh /usr/src/debug/harfbuzz/8.3.0/util/view-options.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-font.h /usr/src/debug/harfbuzz/8.3.0/src/hb-iter.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-face.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-shaper-hangul.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-string-array.hh /usr/src/debug/harfbuzz/8.3.0/util/options.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-dispatch.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-shape.h /usr/src/debug/harfbuzz/8.3.0/src/hb-buffer-verify.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-shaper-syllabic.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-cff-interp-cs-common.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-style.h /usr/src/debug
 /harfbuzz/8.3.0/src/hb-aat-layout-kerx-table.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-aat-layout-just-table.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-var-avar-table.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-var-cvar-table.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-var-fvar-table.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-shaper-thai.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-var-gvar-table.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ft-colr.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-var-hvar-table.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-var-mvar-table.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-serialize.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-subset-cff1.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-subset-cff2.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-subset-plan.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-unicode.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-bimap.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-subset-input.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-gobject-structs.cc /usr/src/debug/harfbuzz/8.3
 .0/src/hb-subset-accelerator.hh /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-shaper-arabic.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-ot-shape.cc /usr/src/debug/harfbuzz/8.3.0/src/hb-shape-plan.h", added "/usr/src/debug/harfbuzz/8.4.0/src/hb-ot-var.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-subset-plan-member-list.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-meta.h /usr/src/debug/harfbuzz/8.4.0/src/hb-buffer.h /usr/src/debug/harfbuzz/8.4.0/src/hb-subset-instancer-solver.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-vorg-table.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-aat-layout-trak-table.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-deprecated.h /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-layout-base-table.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-shape-normalize.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-set-digest.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-shaper-khmer.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-debug.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-aat-layout.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot
 -map.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-algs.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-shape-normalize.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-aat-layout.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-cff-interp-common.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-cff-interp-dict-common.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-var-common.hh /usr/src/debug/harfbuzz/8.4.0/util/batch.hh /usr/src/debug/harfbuzz/8.4.0/util/helper-cairo.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-layout.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-layout-gpos-table.hh /usr/src/debug/harfbuzz/8.4.0/util/shape-options.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-layout.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-gobject-enums.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-buffer.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-icu.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-map.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-set.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-ucd.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-null.hh /usr/src/debug/harfbuzz/8.4.0
 /src/hb-pool.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-layout-common.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-paint.h /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-shaper-arabic-joining-list.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-mutex.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-shape-plan.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-cff2-interp-cs.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-bit-page.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-style.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-deprecated.h /usr/src/debug/harfbuzz/8.4.0/src/hb-cairo.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-cff1-interp-cs.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-paint-extents.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-tag-table.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-outline.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-buffer.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-subset-instancer-iup.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-static.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-cff2-table.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-subset.cc 
 /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-cff1-table.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-post-table-v2subset.hh /usr/src/debug/harfbuzz/8.4.0/util/hb-subset.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-bit-set.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-shaper-syllabic.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-head-table.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-hmtx-table.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-draw.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-name.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-name.h /usr/src/debug/harfbuzz/8.4.0/src/hb-unicode.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-font.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-open-file.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-kern.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-open-type.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-aat-layout.h /usr/src/debug/harfbuzz/8.4.0/src/hb-ucd-table.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-face.h /usr/src/debug/harfbuzz/8.4.0/src/hb-face-builder.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-cplus
 plus.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-aat-layout-ankr-table.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-aat-layout-feat-table.hh /usr/src/debug/harfbuzz/8.4.0/util/hb-ot-shape-closure.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-shaper-myanmar.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-sanitize.hh /usr/src/debug/harfbuzz/8.4.0/util/shape-output.hh /usr/src/debug/harfbuzz/8.4.0/util/hb-view.cc /usr/src/debug/harfbuzz/8.4.0/util/helper-cairo-ansi.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-cairo-utils.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-layout-gsubgpos.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-color.h /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-shaper-use-table.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-shaper-use.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-shaper-arabic-pua.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-bit-set-invertible.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-shaper-vowel-constraints.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-meta.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-s
 haper-list.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-metrics.h /usr/src/debug/harfbuzz/8.4.0/src/hb-shaper.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-blob.hh /usr/src/debug/harfbuzz/8.4.0/util/helper-cairo-ft.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-array.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-atomic.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-paint.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-face.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-multimap.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-object.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-face.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-font.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-math.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-shaper-arabic-table.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-var.h /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-shape-fallback.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-blob.h /usr/src/debug/harfbuzz/8.4.0/src/hb-subset-input.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-subset-plan.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ft.cc /usr/sr
 c/debug/harfbuzz/8.4.0/src/hb-ot-shape-fallback.cc /usr/src/debug/harfbuzz/8.4.0/util/output-options.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-shape.h /usr/src/debug/harfbuzz/8.4.0/util/view-cairo.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-stat-table.hh /usr/src/debug/harfbuzz/8.4.0/util/helper-subset.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-shaper-indic-table.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-cache.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-map.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-shaper-arabic-fallback.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-set.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-aat-map.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-unicode.h /usr/src/debug/harfbuzz/8.4.0/src/hb-utf.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-cff1-std-str.hh /usr/src/debug/harfbuzz/8.4.0/util/hb-shape.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-cairo-utils.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-kern-table.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-aat-layout-common.hh /usr/src/debug/harfbuzz/8
 .4.0/src/hb-fallback-shape.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-shaper.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-subset-cff-common.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-buffer-serialize.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-face.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-shape.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-subset-cff-common.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-shaper-hebrew.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-os2-unicode-ranges.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-meta.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-machinery.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-draw.h /usr/src/debug/harfbuzz/8.4.0/src/hb-subset.h /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-math.h /usr/src/debug/harfbuzz/8.4.0/src/hb-paint-extents.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-gobject-enums.h /usr/src/debug/harfbuzz/8.4.0/src/hb-font.h /usr/src/debug/harfbuzz/8.4.0/src/hb-ft.h /usr/src/debug/harfbuzz/8.4.0/src/hb-draw.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-number.hh /usr/src/de
 bug/harfbuzz/8.4.0/src/hb-ot-map.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-aat-map.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-shaper-indic.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-paint.hh /usr/src/debug/harfbuzz/8.4.0/util/ansi-print.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-shaper-default.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-cff-common.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-cff1-table.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-cff2-table.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-os2-table.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-subset.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-metrics.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-cairo.h /usr/src/debug/harfbuzz/8.4.0/src/hb-aat-ltag-table.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-metrics.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-subset-instancer-solver.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-unicode-emoji-table.hh /usr/src/debug/harfbuzz/8.4.0/util/shape-consumer.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-name-language-static.hh
  /usr/src/debug/harfbuzz/8.4.0/src/hb-common.h /usr/src/debug/harfbuzz/8.4.0/src/hb-aat-layout-morx-table.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-layout-gsub-table.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-font.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-shape.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-number.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-map.h /usr/src/debug/harfbuzz/8.4.0/src/hb-set.h /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-cmap-table.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-shaper-vowel-constraints.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-shape-plan.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-post-table.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-shaper-arabic.hh /usr/src/debug/harfbuzz/8.4.0/util/main-font-text.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-name-language.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-post-macroman.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-hdmx-table.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-hhea-table.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-shap
 er.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-tag.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-vector.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-common.cc /usr/src/debug/harfbuzz/8.4.0/util/hb-info.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-version.h /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-shaper-indic.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-subset-instancer-iup.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-color.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-math-table.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-maxp-table.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-meta-table.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-outline.cc /usr/src/debug/harfbuzz/8.4.0/util/shape-format.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-face-table-list.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-layout.h /usr/src/debug/harfbuzz/8.4.0/src/hb-priority-queue.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-repacker.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-blob.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-glib.cc /usr/src/debug/harfbuzz/8.4.
 0/util/face-options.hh /usr/src/debug/harfbuzz/8.4.0/util/font-options.hh /usr/src/debug/harfbuzz/8.4.0/util/text-options.hh /usr/src/debug/harfbuzz/8.4.0/util/view-options.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-font.h /usr/src/debug/harfbuzz/8.4.0/src/hb-iter.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-face.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-shaper-hangul.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-string-array.hh /usr/src/debug/harfbuzz/8.4.0/util/options.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-dispatch.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-shape.h /usr/src/debug/harfbuzz/8.4.0/src/hb-buffer-verify.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-shaper-syllabic.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-cff-interp-cs-common.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-style.h /usr/src/debug/harfbuzz/8.4.0/src/hb-aat-layout-kerx-table.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-aat-layout-just-table.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-var-avar-table.hh /usr/src/debug/harfbuzz/8.4.0/
 src/hb-ot-var-cvar-table.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-var-fvar-table.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-shaper-thai.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-var-gvar-table.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ft-colr.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-var-hvar-table.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-var-mvar-table.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-serialize.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-subset-cff1.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-subset-cff2.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-subset-plan.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-unicode.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-bimap.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-subset-input.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-gobject-structs.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-subset-accelerator.hh /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-shaper-arabic.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-ot-shape.cc /usr/src/debug/harfbuzz/8.4.0/src/hb-shape-plan.h"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-src: PV changed from "8.3.0" to "8.4.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-staticdev: PKGV changed from 8.3.0 [default] to 8.4.0 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-staticdev: PV changed from "8.3.0" to "8.4.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-subset: PKGSIZE changed from 1341679 to 1390831 (+4%)
packages/core2-64-poky-linux/harfbuzz/harfbuzz-subset: PKGV changed from 8.3.0 [default] to 8.4.0 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.60830.0", added "/usr/lib/libharfbuzz-subset.so.0.60840.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-subset: PV changed from "8.3.0" to "8.4.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz: PKGSIZE changed from 1589338 to 1589618 (+0%)
packages/core2-64-poky-linux/harfbuzz/harfbuzz: PKGV changed from 8.3.0 [default] to 8.4.0 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz.so.0.60830.0 /usr/lib/libharfbuzz-cairo.so.0.60830.0 /usr/lib/libharfbuzz-gobject.so.0.60830.0", added "/usr/lib/libharfbuzz.so.0.60840.0 /usr/lib/libharfbuzz-cairo.so.0.60840.0 /usr/lib/libharfbuzz-gobject.so.0.60840.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz: PV changed from "8.3.0" to "8.4.0"
packages/core2-64-poky-linux/harfbuzz: SRC_URI changed from "https://github.com/harfbuzz/harfbuzz/releases//download/8.3.0/harfbuzz-8.3.0.tar.xz" to "https://github.com/harfbuzz/harfbuzz/releases//download/8.4.0/harfbuzz-8.4.0.tar.xz"
packages/core2-64-poky-linux/harfbuzz: PKGV changed from 8.3.0 [default] to 8.4.0 [default]
packages/core2-64-poky-linux/harfbuzz: PV changed from "8.3.0" to "8.4.0"
Changes to packages/core2-64-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-cairo.so.0 changed symlink target from libharfbuzz-cairo.so.0.60830.0 to libharfbuzz-cairo.so.0.60840.0
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.60830.0 to libharfbuzz-gobject.so.0.60840.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.60830.0 to libharfbuzz-icu.so.0.60840.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.60830.0 to libharfbuzz.so.0.60840.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.60830.0 to libharfbuzz-subset.so.0.60840.0
  /usr/lib/libharfbuzz-cairo.so.0.60830.0 moved to /usr/lib/libharfbuzz-cairo.so.0.60840.0
  /usr/lib/libharfbuzz-gobject.so.0.60830.0 moved to /usr/lib/libharfbuzz-gobject.so.0.60840.0
  /usr/lib/libharfbuzz-icu.so.0.60830.0 moved to /usr/lib/libharfbuzz-icu.so.0.60840.0
  /usr/lib/libharfbuzz.so.0.60830.0 moved to /usr/lib/libharfbuzz.so.0.60840.0
  /usr/lib/libharfbuzz-subset.so.0.60830.0 moved to /usr/lib/libharfbuzz-subset.so.0.60840.0

--===============0257977926705448171==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-harfbuzz-upgrade-8.3.0-8.4.0.patch"

RnJvbSAyNjJhMGQ4YmNjNzk4YmJiY2FmOTkwZmU0NDkyMDdlMmJjMmZiZTE3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMjI6Mzk6NDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBo
YXJmYnV6ejogdXBncmFkZSA4LjMuMCAtPiA4LjQuMAoKLS0tCiAuLi4vaGFyZmJ1enove2hhcmZi
dXp6XzguMy4wLmJiID0+IGhhcmZidXp6XzguNC4wLmJifSAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enove2hhcmZidXp6XzguMy4wLmJiID0+IGhhcmZidXp6Xzgu
NC4wLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6
ei9oYXJmYnV6el84LjMuMC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6ei9oYXJm
YnV6el84LjQuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvaGFyZmJ1enovaGFyZmJ1enpfOC4zLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1ncmFwaGljcy9oYXJmYnV6ei9oYXJmYnV6el84LjQuMC5iYgppbmRleCBkNzMzMzQyNjgy
Li5mYzY5NTFkOWVkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enov
aGFyZmJ1enpfOC4zLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hhcmZidXp6L2hh
cmZidXp6XzguNC4wLmJiCkBAIC05LDcgKzksNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9DT1BZSU5HO21kNT1iOTg0MjliOGU4ZTNjMmE2N2NmZWYwMWU5OWU0ODkzZCBcCiAgICAgICAg
ICAgICAgICAgICAgICIKIAogU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQv
JHtQVn0vJHtCUE59LSR7UFZ9LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIxMDk1MDFl
YWViOGJkZTNlYWRiMjVmYWI0MTY0ZTk5M2ZiYWNlMjljM2Q3NzViY2FhMWMxZTU4ZTJmMTVmODQ3
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImFmNGVhNzNlMjVhYjc0OGM4YzA2M2I3OGMyZjg4ZTQ4
ODMzZGI5YjJhYzM2OWUyOWJkMTE1NzAyZTc4OTc1NWUiCiAKIERFUEVORFMgKz0gImdsaWItMi4w
LW5hdGl2ZSIKIAotLSAKMi40Mi4wCgo=

--===============0257977926705448171==--

