Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7396C02198
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 10:26:19 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.17807.1736936776632543971
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 02:26:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=jPLuAy34;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=tVWDTYbw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010194697fe219-cfb1d93a-fff9-4861-8a0c-3620f88db414-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1736936776;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LC4gNwqeTyj+F+Kn5T2aGJURbVL0C6WitYpTVHW0DEo=;
	b=jPLuAy341h+j8RMT1wxKLFEATRlBR7aDxY8ZZfPz1TPnrI8a8Db9/4bnloKiIJCi
	E0H7L38E3bykAW7SyMnfawcrkLds8OYbVyCbHiQ+emOu990nyQCpSfbheyKiWkkKyUp
	NCtYhhzNy2wxqt0Z7/wC1MDakvI4HQz0pOT6ajzA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1736936776;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LC4gNwqeTyj+F+Kn5T2aGJURbVL0C6WitYpTVHW0DEo=;
	b=tVWDTYbwW6rowKTeb0Q2r2617EfX7m+l1EukwBoTFMmAZ7sTPxtwI+sCk8hvSeL3
	1/K1x+9QilFM1wgbc11Guv98cBt4sV47poywijEaVZxkPDKQQ5RqtQHDpKmGHYhl696
	upUSnUvuidzfCxpfOUbc9YJa/hc3rsTrmXP4XRKE=
Content-Type: multipart/mixed; boundary="===============6673173790250703056=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] harfbuzz: upgrading to 10.2.0 SUCCEEDED
Message-ID: <01010194697fe219-cfb1d93a-fff9-4861-8a0c-3620f88db414-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jan 2025 10:26:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 10:26:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209867

--===============6673173790250703056==
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
From 8dcc5e7a5fe265786d70fe2e713f73727ab4d949 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jan 2025 08:54:14 +0000
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


--===============6673173790250703056==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-harfbuzz-upgrade-10.1.0-10.2.0.patch"

RnJvbSA4ZGNjNWU3YTVmZTI2NTc4NmQ3MGZlMmU3MTNmNzM3MjdhYjRkOTQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgSmFuIDIwMjUgMDg6NTQ6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBo
YXJmYnV6ejogdXBncmFkZSAxMC4xLjAgLT4gMTAuMi4wCgotLS0KIC4uLi9oYXJmYnV6ei97aGFy
ZmJ1enpfMTAuMS4wLmJiID0+IGhhcmZidXp6XzEwLjIuMC5iYn0gICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6ei97aGFyZmJ1enpfMTAuMS4wLmJiID0+IGhhcmZidXp6
XzEwLjIuMC5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFy
ZmJ1enovaGFyZmJ1enpfMTAuMS4wLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hhcmZidXp6
L2hhcmZidXp6XzEwLjIuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enovaGFyZmJ1enpfMTAuMS4wLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enovaGFyZmJ1enpfMTAuMi4wLmJiCmluZGV4IDQ0
MjVkZDNlMWUuLjg3OWNhZDM2ZGMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9o
YXJmYnV6ei9oYXJmYnV6el8xMC4xLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hh
cmZidXp6L2hhcmZidXp6XzEwLjIuMC5iYgpAQCAtOSw3ICs5LDcgQEAgTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vQ09QWUlORzttZDU9Yjk4NDI5YjhlOGUzYzJhNjdjZmVmMDFlOTllNDg5M2Qg
XAogICAgICAgICAgICAgICAgICAgICAiCiAKIFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9
L2Rvd25sb2FkLyR7UFZ9LyR7QlBOfS0ke1BWfS50YXIueHoiCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiNmNlMzUyMGYyZDA4OWEzM2NlZjBmYzQ4MzIxMzM0YjhlMGI3MjE0MWY2YTc2MzcxOWFhYWVj
ZDI3NzllY2I4MiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2MjBlMzQ2OGZhZWMyZWE4Njg1ZDMy
YzQ2YTU4NDY5Yjg1MGVmNjMwNDBiMzU2NWNkZTA1OTU5ODI1YjQ4MjI3IgogCiBERVBFTkRTICs9
ICJnbGliLTIuMC1uYXRpdmUiCiAKLS0gCjIuNDQuMQoK

--===============6673173790250703056==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/harfbuzz/harfbuzz-bin: PV changed from "10.1.0" to "10.2.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-bin: PKGV changed from 10.1.0 [default] to 10.2.0 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dbg: PKGSIZE changed from 78348424 to 80146504 (+2%)
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dbg: PV changed from "10.1.0" to "10.2.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dbg: FILELIST: removed "/usr/lib/.debug/libharfbuzz.so.0.61010.0 /usr/lib/.debug/libharfbuzz-subset.so.0.61010.0 /usr/lib/.debug/libharfbuzz-gobject.so.0.61010.0 /usr/lib/.debug/libharfbuzz-icu.so.0.61010.0 /usr/lib/.debug/libharfbuzz-cairo.so.0.61010.0", added "/usr/lib/.debug/libharfbuzz.so.0.61020.0 /usr/lib/.debug/libharfbuzz-cairo.so.0.61020.0 /usr/lib/.debug/libharfbuzz-subset.so.0.61020.0 /usr/lib/.debug/libharfbuzz-icu.so.0.61020.0 /usr/lib/.debug/libharfbuzz-gobject.so.0.61020.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dbg: PKGV changed from 10.1.0 [default] to 10.2.0 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dev: PKGSIZE changed from 1735496 to 1731693 (-0%)
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dev: PV changed from "10.1.0" to "10.2.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dev: FILELIST: removed "/usr/include/harfbuzz/hb-subset-repacker.h", added "/usr/include/harfbuzz/hb-subset-serialize.h"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dev: PKGV changed from 10.1.0 [default] to 10.2.0 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-doc: PV changed from "10.1.0" to "10.2.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-doc: PKGV changed from 10.1.0 [default] to 10.2.0 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu-dev: PV changed from "10.1.0" to "10.2.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu-dev: PKGV changed from 10.1.0 [default] to 10.2.0 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu: PV changed from "10.1.0" to "10.2.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.61010.0", added "/usr/lib/libharfbuzz-icu.so.0.61020.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu: PKGV changed from 10.1.0 [default] to 10.2.0 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-locale: PV changed from "10.1.0" to "10.2.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-locale: PKGV changed from 10.1.0 [default] to 10.2.0 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-src: PKGSIZE changed from 4942077 to 4952739 (+0%)
packages/core2-64-poky-linux/harfbuzz/harfbuzz-src: PV changed from "10.1.0" to "10.2.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-src: FILELIST: directory renamed /usr/src/debug/harfbuzz/10.1.0/src/OT/Color/sbix -> /usr/src/debug/harfbuzz/10.2.0/src/OT/Color/sbix, directory renamed /usr/src/debug/harfbuzz/10.1.0/src/OT/Layout/GSUB -> /usr/src/debug/harfbuzz/10.2.0/src/OT/Layout/GSUB, directory renamed /usr/src/debug/harfbuzz/10.1.0/src/graph -> /usr/src/debug/harfbuzz/10.2.0/src/graph, directory renamed /usr/src/debug/harfbuzz/10.1.0/util -> /usr/src/debug/harfbuzz/10.2.0/util, directory renamed /usr/src/debug/harfbuzz/10.1.0/src/OT/Layout -> /usr/src/debug/harfbuzz/10.2.0/src/OT/Layout, directory renamed /usr/src/debug/harfbuzz/10.1.0/src/OT/Layout/GDEF -> /usr/src/debug/harfbuzz/10.2.0/src/OT/Layout/GDEF, directory renamed /usr/src/debug/harfbuzz/10.1.0/src/OT/glyf -> /usr/src/debug/harfbuzz/10.2.0/src/OT/glyf, directory renamed /usr/src/debug/harfbuzz/10.1.0/src/OT/Color/svg -> /usr/src/debug/harfbuzz/10.2.0/src/OT/Color/svg, directory renamed /usr/src/debug/har
 fbuzz/10.1.0/src/OT/Color/COLR -> /usr/src/debug/harfbuzz/10.2.0/src/OT/Color/COLR, directory renamed /usr/src/debug/harfbuzz/10.1.0/src/OT/Layout/Common -> /usr/src/debug/harfbuzz/10.2.0/src/OT/Layout/Common, directory renamed /usr/src/debug/harfbuzz/10.1.0/src/OT/Color/CPAL -> /usr/src/debug/harfbuzz/10.2.0/src/OT/Color/CPAL, directory renamed /usr/src/debug/harfbuzz/10.1.0/src/OT/Layout/GPOS -> /usr/src/debug/harfbuzz/10.2.0/src/OT/Layout/GPOS, directory renamed /usr/src/debug/harfbuzz/10.1.0/src/OT/name -> /usr/src/debug/harfbuzz/10.2.0/src/OT/name, directory renamed /usr/src/debug/harfbuzz/10.1.0/src/OT/Color/CBDT -> /usr/src/debug/harfbuzz/10.2.0/src/OT/Color/CBDT, removed "/usr/src/debug/harfbuzz/10.1.0/src/hb-deprecated.h /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-metrics.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-aat-layout.h /usr/src/debug/harfbuzz/10.1.0/src/hb-shaper.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-subset-input.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-metrics.h /
 usr/src/debug/harfbuzz/10.1.0/src/hb-cplusplus.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shaper-arabic-fallback.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-blob.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-cff1-table.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-cff2-table.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-layout-common.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-map.h /usr/src/debug/harfbuzz/10.1.0/src/hb-iter.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-subset-instancer-solver.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-font.h /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shaper-syllabic.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-buffer.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-color.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shape.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-multimap.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shape.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shape-normalize.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-var-avar-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-o
 t-var-cvar-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-var-fvar-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-var-gvar-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-var-hvar-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-var-mvar-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-style.h /usr/src/debug/harfbuzz/10.1.0/src/hb-vector.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-number.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-cff-interp-cs-common.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shaper-thai.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-repacker.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-unicode.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-math.h /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shaper.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shaper-indic.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-paint.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-layout-gsubgpos.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-cairo.h /usr/src/debug/harfbuzz/10.1.0/src/hb-ft-colr.hh /usr/src/debug/harfbuzz/
 10.1.0/src/hb-gobject-enums.h /usr/src/debug/harfbuzz/10.1.0/src/hb-geometry.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-tag.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-atomic.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-draw.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-shape-plan.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-dispatch.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-subset.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-subset-instancer-iup.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-set-digest.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-aat-layout.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-cff1-std-str.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-style.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shape-fallback.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-os2-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ft.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-map.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-font.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-paint.h /usr/src/debug/harfbuzz/10.1.0/src/hb-map.cc /usr/src/debug/h
 arfbuzz/10.1.0/src/hb-font.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-var.h /usr/src/debug/harfbuzz/10.1.0/src/hb-ucd.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-cff-common.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-cff2-interp-cs.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-algs.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-subset-cff1.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-os2-unicode-ranges.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shaper-indic-table.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-hhea-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-hdmx-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-aat-map.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-head-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-font.h /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-hmtx-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-post-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-vorg-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-set.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-shape-plan.h /usr/src/debug/h
 arfbuzz/10.1.0/src/hb-ot-face.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shape-fallback.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-shaper-list.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-subset-instancer-solver.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-cache.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-version.h /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-name-language-static.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-face.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-aat-layout-feat-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-aat-layout-just-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-aat-layout-trak-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-gobject-structs.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-layout-gsub-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-string-array.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-meta.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-name.h /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-math.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-bit-set.hh /usr/src/debug/harfbuzz/
 10.1.0/src/hb-ot-shape.h /usr/src/debug/harfbuzz/10.1.0/src/hb-unicode-emoji-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-buffer.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-shaper.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-cairo-utils.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-aat-layout-common.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-outline.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-paint.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-subset-cff-common.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-map.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-aat-map.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-meta.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-paint-extents.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-subset.h /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-layout.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-post-macroman.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-mutex.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-cairo.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-aat-ltag-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-set.h 
 /usr/src/debug/harfbuzz/10.1.0/src/hb-fallback-shape.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-metrics.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-unicode.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-bit-set-invertible.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-layout.h /usr/src/debug/harfbuzz/10.1.0/src/hb-blob.h /usr/src/debug/harfbuzz/10.1.0/src/hb-buffer-serialize.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shaper-vowel-constraints.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-subset-plan.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-cairo-utils.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-bit-page.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-layout.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shaper-hangul.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shaper-hebrew.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-draw.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shape-normalize.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-outline.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-pool.hh /usr/src/debug/harfbuzz/10.1.0/src
 /hb-subset-cff-common.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-priority-queue.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-common.h /usr/src/debug/harfbuzz/10.1.0/src/hb-number.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-serialize.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-glib.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-name.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-post-table-v2subset.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shaper-khmer.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-map.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shaper-default.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-shape-plan.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-set.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ft.h /usr/src/debug/harfbuzz/10.1.0/src/hb-bimap.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-icu.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shaper-myanmar.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shaper-use-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-font.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-paint-ex
 tents.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-object.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-shape.h /usr/src/debug/harfbuzz/10.1.0/src/hb-subset-cff2.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-gobject-enums.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-machinery.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-subset-plan.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-meta.h /usr/src/debug/harfbuzz/10.1.0/src/hb-buffer-verify.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-face-table-list.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-kern.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shaper-arabic-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-tag-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-buffer.h /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-var.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-sanitize.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shaper-arabic.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-shape.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-var-common.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-cff-interp-c
 ommon.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-cff1-interp-cs.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-aat-layout.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-common.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-cff-interp-dict-common.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-draw.h /usr/src/debug/harfbuzz/10.1.0/src/hb-open-file.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-open-type.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-face.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shaper-arabic.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-static.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-subset-instancer-iup.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ucd-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-cff1-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-cff2-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-cmap-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-kern-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-math-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-maxp-table.hh /usr/src/debug/harfbuzz
 /10.1.0/src/hb-ot-meta-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-stat-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-subset-accelerator.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-subset-input.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-utf.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-layout-base-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-unicode.h /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-name-language.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shaper-arabic-pua.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-subset-plan-member-list.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-color.h /usr/src/debug/harfbuzz/10.1.0/src/hb-face-builder.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-blob.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shaper-use.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-null.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-face.h /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shaper-syllabic.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-subset.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-aat-layout-ankr
 -table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-aat-layout-morx-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-aat-layout-kerx-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-layout-gpos-table.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shaper-vowel-constraints.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shaper-arabic-joining-list.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-deprecated.h /usr/src/debug/harfbuzz/10.1.0/src/hb-face.cc /usr/src/debug/harfbuzz/10.1.0/src/hb-ot-shaper-indic.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-debug.hh /usr/src/debug/harfbuzz/10.1.0/src/hb-array.hh", added "/usr/src/debug/harfbuzz/10.2.0/src/hb-deprecated.h /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-metrics.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-aat-layout.h /usr/src/debug/harfbuzz/10.2.0/src/hb-shaper.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-subset-input.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-metrics.h /usr/src/debug/harfbuzz/10.2.0/src/hb-cplusplus.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-
 shaper-arabic-fallback.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-blob.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-cff1-table.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-cff2-table.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-layout-common.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-map.h /usr/src/debug/harfbuzz/10.2.0/src/hb-iter.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-subset-instancer-solver.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-font.h /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shaper-syllabic.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-buffer.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-color.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shape.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-multimap.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shape.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shape-normalize.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-var-avar-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-var-cvar-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-var-fvar-table.hh /usr/src/deb
 ug/harfbuzz/10.2.0/src/hb-ot-var-gvar-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-var-hvar-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-var-mvar-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-style.h /usr/src/debug/harfbuzz/10.2.0/src/hb-vector.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-number.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-cff-interp-cs-common.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shaper-thai.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-subset-serialize.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-repacker.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-unicode.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-math.h /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shaper.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shaper-indic.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-paint.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-layout-gsubgpos.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-cairo.h /usr/src/debug/harfbuzz/10.2.0/src/hb-ft-colr.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-gobject-enums.h /us
 r/src/debug/harfbuzz/10.2.0/src/hb-geometry.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-tag.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-atomic.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-draw.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-shape-plan.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-dispatch.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-subset.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-subset-instancer-iup.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-set-digest.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-aat-layout.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-cff1-std-str.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-style.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shape-fallback.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-os2-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ft.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-map.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-font.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-paint.h /usr/src/debug/harfbuzz/10.2.0/src/hb-map.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-font.cc /us
 r/src/debug/harfbuzz/10.2.0/src/hb-ot-var.h /usr/src/debug/harfbuzz/10.2.0/src/hb-ucd.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-cff-common.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-cff2-interp-cs.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-algs.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-subset-cff1.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-os2-unicode-ranges.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shaper-indic-table.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-hdmx-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-aat-map.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-head-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-font.h /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-hhea-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-hmtx-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-post-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-vorg-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-set.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-shape-plan.h /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-face.cc 
 /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shape-fallback.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-shaper-list.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-subset-instancer-solver.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-cache.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-version.h /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-name-language-static.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-face.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-aat-layout-feat-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-aat-layout-just-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-aat-layout-trak-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-gobject-structs.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-layout-gsub-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-string-array.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-meta.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-name.h /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-math.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-bit-set.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shape.h /usr/src
 /debug/harfbuzz/10.2.0/src/hb-unicode-emoji-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-buffer.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-shaper.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-cairo-utils.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-aat-layout-common.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-outline.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-paint.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-subset-cff-common.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-map.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-aat-map.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-meta.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-paint-extents.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-subset.h /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-layout.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-post-macroman.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-mutex.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-cairo.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-aat-ltag-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-set.h /usr/src/debug/harfbuzz/10.2.0/sr
 c/hb-fallback-shape.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-metrics.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-unicode.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-bit-set-invertible.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-layout.h /usr/src/debug/harfbuzz/10.2.0/src/hb-blob.h /usr/src/debug/harfbuzz/10.2.0/src/hb-buffer-serialize.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shaper-vowel-constraints.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-subset-plan.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-cairo-utils.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-bit-page.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-layout.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shaper-hangul.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shaper-hebrew.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-draw.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shape-normalize.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-outline.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-pool.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-subset-cff-common.hh /usr/src
 /debug/harfbuzz/10.2.0/src/hb-priority-queue.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-common.h /usr/src/debug/harfbuzz/10.2.0/src/hb-number.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-serialize.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-glib.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-name.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-post-table-v2subset.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shaper-khmer.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-map.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shaper-default.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-shape-plan.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-set.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ft.h /usr/src/debug/harfbuzz/10.2.0/src/hb-bimap.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-icu.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shaper-myanmar.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shaper-use-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-font.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-paint-extents.cc /usr/src/debug/harfbuzz/
 10.2.0/src/hb-object.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-shape.h /usr/src/debug/harfbuzz/10.2.0/src/hb-subset-cff2.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-gobject-enums.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-machinery.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-subset-plan.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-meta.h /usr/src/debug/harfbuzz/10.2.0/src/hb-buffer-verify.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-face-table-list.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-kern.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shaper-arabic-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-tag-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-buffer.h /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-var.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-subset-serialize.h /usr/src/debug/harfbuzz/10.2.0/src/hb-sanitize.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shaper-arabic.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-shape.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-var-common.hh /usr/src/debug/harfbuzz/10
 .2.0/src/hb-cff-interp-common.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-cff1-interp-cs.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-aat-layout.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-common.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-cff-interp-dict-common.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-draw.h /usr/src/debug/harfbuzz/10.2.0/src/hb-open-file.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-open-type.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-face.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shaper-arabic.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-static.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-subset-instancer-iup.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ucd-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-cff1-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-cff2-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-cmap-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-kern-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-math-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-maxp-table.hh
  /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-meta-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-stat-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-subset-accelerator.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-subset-input.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-utf.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-layout-base-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-unicode.h /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-name-language.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shaper-arabic-pua.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-subset-plan-member-list.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-color.h /usr/src/debug/harfbuzz/10.2.0/src/hb-face-builder.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-blob.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shaper-use.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-null.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-face.h /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shaper-syllabic.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-subset.cc /usr/src/debug/harfbuzz/10.2.
 0/src/hb-aat-layout-ankr-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-aat-layout-morx-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-aat-layout-kerx-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-layout-gpos-table.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shaper-vowel-constraints.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shaper-arabic-joining-list.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-deprecated.h /usr/src/debug/harfbuzz/10.2.0/src/hb-face.cc /usr/src/debug/harfbuzz/10.2.0/src/hb-ot-shaper-indic.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-debug.hh /usr/src/debug/harfbuzz/10.2.0/src/hb-array.hh"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-src: PKGV changed from 10.1.0 [default] to 10.2.0 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-staticdev: PV changed from "10.1.0" to "10.2.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-staticdev: PKGV changed from 10.1.0 [default] to 10.2.0 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-subset: PKGSIZE changed from 1509615 to 1525999 (+1%)
packages/core2-64-poky-linux/harfbuzz/harfbuzz-subset: PV changed from "10.1.0" to "10.2.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.61010.0", added "/usr/lib/libharfbuzz-subset.so.0.61020.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-subset: PKGV changed from 10.1.0 [default] to 10.2.0 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz: PKGSIZE changed from 1656198 to 1664094 (+0%)
packages/core2-64-poky-linux/harfbuzz/harfbuzz: PV changed from "10.1.0" to "10.2.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.61010.0 /usr/lib/libharfbuzz-cairo.so.0.61010.0 /usr/lib/libharfbuzz.so.0.61010.0", added "/usr/lib/libharfbuzz-gobject.so.0.61020.0 /usr/lib/libharfbuzz-cairo.so.0.61020.0 /usr/lib/libharfbuzz.so.0.61020.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz: PKGV changed from 10.1.0 [default] to 10.2.0 [default]
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

--===============6673173790250703056==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (0 cached, 919 parsed). 1875 targets, 52 skipped, 0 masked, 0 errors.
Removing 128 recipes from the core2-64 sysroot...done.
Removing 128 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:6ba20dfba44c71382d1aac41c83c4d69c5cfd4f3"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 380 Local 369 Mirrors 0 Missed 11 Current 250 (97% match, 98% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 271 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 313 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 327 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_create_spdx_setscene)
NOTE: Running task 920 of 1764 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb:do_write_config)
NOTE: recipe harfbuzz-10.2.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe icu-76-1-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.18.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe harfbuzz-10.2.0-r0: task do_write_config: Started
NOTE: recipe harfbuzz-10.2.0-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-10.2.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running task 957 of 1764 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb:do_recipe_qa)
NOTE: recipe icu-76-1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cairo-1.18.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 332 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 333 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_packagedata_setscene)
NOTE: Running setscene task 338 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 339 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 341 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_create_spdx_setscene)
NOTE: recipe harfbuzz-10.2.0-r0: task do_recipe_qa: Started
NOTE: recipe icu-76-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-76-1-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.18.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 355 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_create_spdx_setscene)
NOTE: recipe icu-76-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.18.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 361 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 363 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 364 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 365 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-10.2.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe cairo-1.18.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 981 of 1764 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb:do_fetch)
NOTE: Running setscene task 366 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 367 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 368 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 369 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 371 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 372 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-76-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 374 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.44.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 395 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-10.2.0-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-76-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 398 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-10.2.0-r0: task do_fetch: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 983 of 1764 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb:do_unpack)
NOTE: Running setscene task 400 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.44.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-76-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.18.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-10.2.0-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 403 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 405 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.44.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 406 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 408 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 410 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 411 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 413 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libx11-1_1.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 415 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 418 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.44.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.44.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.44.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.44-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 422 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe libx11-1_1.8.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 424 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 425 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 426 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 428 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 429 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.44.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 431 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 432 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 433 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 434 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 435 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 437 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpng-1.6.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 445 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 446 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 447 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 448 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 450 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 451 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 452 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 454 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 455 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 456 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 458 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.44.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 461 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.6.0.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 464 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 465 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.44-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 468 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 470 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 474 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-75.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-75.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-setuptools/75.6.0/temp/log.do_packagedata_setscene.999531
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.6.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 475 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.6.0.bb:do_package_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-setuptools-75.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 479 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 482 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 484 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 485 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 487 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 488 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 489 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 492 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 493 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 494 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 495 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 496 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 497 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 498 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-10.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1076 of 1764 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb:do_patch)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-10.2.0-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 500 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 502 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-10.2.0-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1108 of 1764 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 506 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 508 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-10.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-75.6.0-r0: task do_package_setscene: Started
NOTE: recipe harfbuzz-10.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 511 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-75.6.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 513 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 514 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 515 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-75.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-75.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 517 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 518 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 519 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 520 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 521 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 522 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 523 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 524 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 525 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 526 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 527 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 528 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 529 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 531 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 532 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 533 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 534 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 535 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 536 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 537 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 538 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 539 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 540 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 549 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 551 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 554 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 555 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 557 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 560 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 561 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 564 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 566 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 567 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 569 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 572 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 574 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 576 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 578 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 580 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 582 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 585 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 587 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 590 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 592 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 593 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 595 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 597 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 599 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 600 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 602 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 603 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 604 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 608 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 610 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 611 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 613 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 615 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 619 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 620 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 622 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 624 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 627 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 629 of 630 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1617 of 1764 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.6.0.bb:do_packagedata)
NOTE: Running task 1686 of 1764 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-75.6.0-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-10.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-75.6.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1751 of 1764 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb:do_collect_spdx_deps)
NOTE: recipe harfbuzz-10.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe harfbuzz-10.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe harfbuzz-10.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1752 of 1764 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb:do_configure)
NOTE: recipe harfbuzz-10.2.0-r0: task do_configure: Started
NOTE: recipe harfbuzz-10.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1753 of 1764 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb:do_compile)
NOTE: recipe harfbuzz-10.2.0-r0: task do_compile: Started
NOTE: recipe harfbuzz-10.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1754 of 1764 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb:do_install)
NOTE: recipe harfbuzz-10.2.0-r0: task do_install: Started
NOTE: recipe harfbuzz-10.2.0-r0: task do_install: Succeeded
NOTE: Running task 1755 of 1764 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb:do_package)
NOTE: Running task 1756 of 1764 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb:do_populate_sysroot)
NOTE: recipe harfbuzz-10.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-10.2.0-r0: task do_package: Started
NOTE: recipe harfbuzz-10.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-10.2.0-r0: task do_package: Succeeded
NOTE: Running task 1757 of 1764 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb:do_packagedata)
NOTE: recipe harfbuzz-10.2.0-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-10.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1758 of 1764 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb:do_create_spdx)
NOTE: Running task 1759 of 1764 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb:do_package_write_ipk)
NOTE: Running task 1760 of 1764 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb:do_package_write_deb)
NOTE: Running task 1761 of 1764 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb:do_package_write_rpm)
NOTE: Running task 1762 of 1764 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb:do_package_qa)
NOTE: recipe harfbuzz-10.2.0-r0: task do_create_spdx: Started
NOTE: recipe harfbuzz-10.2.0-r0: task do_package_write_ipk: Started
NOTE: recipe harfbuzz-10.2.0-r0: task do_package_write_deb: Started
NOTE: recipe harfbuzz-10.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe harfbuzz-10.2.0-r0: task do_package_qa: Started
NOTE: recipe harfbuzz-10.2.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1763 of 1764 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb:do_create_package_spdx)
NOTE: recipe harfbuzz-10.2.0-r0: task do_create_package_spdx: Started
NOTE: recipe harfbuzz-10.2.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe harfbuzz-10.2.0-r0: task do_package_qa: Succeeded
NOTE: recipe harfbuzz-10.2.0-r0: task do_create_package_spdx: Succeeded
NOTE: recipe harfbuzz-10.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe harfbuzz-10.2.0-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 1764 of 1764 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1764 tasks of which 1742 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-setuptools-75.6.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-src went backwards which would break package feeds (from 0:75.8.0-r0 to 0:75.6.0-r0) [version-going-backwards]
ERROR: python3-setuptools-75.6.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dbg went backwards which would break package feeds (from 0:75.8.0-r0 to 0:75.6.0-r0) [version-going-backwards]
ERROR: python3-setuptools-75.6.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkg-resources went backwards which would break package feeds (from 0:75.8.0-r0 to 0:75.6.0-r0) [version-going-backwards]
ERROR: python3-setuptools-75.6.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-staticdev went backwards which would break package feeds (from 0:75.8.0-r0 to 0:75.6.0-r0) [version-going-backwards]
ERROR: python3-setuptools-75.6.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dev went backwards which would break package feeds (from 0:75.8.0-r0 to 0:75.6.0-r0) [version-going-backwards]
ERROR: python3-setuptools-75.6.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-doc went backwards which would break package feeds (from 0:75.8.0-r0 to 0:75.6.0-r0) [version-going-backwards]
ERROR: python3-setuptools-75.6.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-locale went backwards which would break package feeds (from 0:75.8.0-r0 to 0:75.6.0-r0) [version-going-backwards]
ERROR: python3-setuptools-75.6.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools went backwards which would break package feeds (from 0:75.8.0-r0 to 0:75.6.0-r0) [version-going-backwards]
ERROR: python3-setuptools-75.6.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6673173790250703056==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/harfbuzz/harfbuzz-dev: FILELIST: removed "/usr/include/harfbuzz/hb-subset-repacker.h", added "/usr/include/harfbuzz/hb-subset-serialize.h"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.61010.0", added "/usr/lib/libharfbuzz-icu.so.0.61020.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.61010.0", added "/usr/lib/libharfbuzz-subset.so.0.61020.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz.so.0.61010.0 /usr/lib/libharfbuzz-gobject.so.0.61010.0 /usr/lib/libharfbuzz-cairo.so.0.61010.0", added "/usr/lib/libharfbuzz.so.0.61020.0 /usr/lib/libharfbuzz-cairo.so.0.61020.0 /usr/lib/libharfbuzz-gobject.so.0.61020.0"
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

--===============6673173790250703056==--

