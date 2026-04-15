Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAAFAF43826
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:55 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19811.1776261873316093719
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=grt8zTCb;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=e/tVjQbY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019d91758295-4b2938cc-b0ea-4631-9b37-0721b41dd1ff-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261890;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rxjzHrCrkqw3IyBq8YcAboaC0non06/qod6y4L6WiKQ=;
	b=grt8zTCbnp0+ntF+b+z3NnYzT9n73gx30gCfmuKU6X8Zrsgt1z4fmJjdeL7IoJZa
	cZRNFBTApOV0M6aZ2gt8z5Xm9TKWzQezZY891pX64zDe2oTT/hJqgWj2opVsriwvsNJ
	z0xqrtl4e4q5QtsfKzVhuvPswnsJlBSJgLO2u/7c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261890;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rxjzHrCrkqw3IyBq8YcAboaC0non06/qod6y4L6WiKQ=;
	b=e/tVjQbYnSMPmRXf1KhtOdNMOoev8hhwIwrp24IIAyP1koJxnnxl3KJaTNCyQ0iu
	S19AeMTvbrFlElgSBVsgIwiDI7i0YVVhtOfd3gJY/bDnLKC2eCUBA2WG2/cRaBcQM/o
	D0aoysb45TGGZl4JuVZqqCvh8L/+Fh+6y50jddoo=
Content-Type: multipart/mixed; boundary="===============0362022621141713517=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] harfbuzz: upgrading to 14.1.0 SUCCEEDED
Message-ID: <0101019d91758295-4b2938cc-b0ea-4631-9b37-0721b41dd1ff-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235279

--===============0362022621141713517==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *harfbuzz* to *14.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-harfbuzz-upgrade-12.3.2-14.1.0.patch
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
From 1340aca4ea4d5397f761b1ba770de5e3477c4b90 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 12:00:12 +0000
Subject: [PATCH] harfbuzz: upgrade 12.3.2 -> 14.1.0

---
 .../harfbuzz/{harfbuzz_12.3.2.bb => harfbuzz_14.1.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_12.3.2.bb => harfbuzz_14.1.0.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_14.1.0.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_14.1.0.bb
index 12bebc4bee..dcc3469fee 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_14.1.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "6f6db164359a2da5a84ef826615b448b33e6306067ad829d85d5b0bf936f1bb8"
+SRC_URI[sha256sum] = "ee0eb3a1da2c5a28147f12dff55f6c7d60aeeeb29ac7ef334eabe84c8476c105"
 
 DEPENDS += "glib-2.0-native"
 
-- 
2.47.1


--===============0362022621141713517==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-bin: FILELIST: added "/usr/bin/hb-vector /usr/bin/hb-raster"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-bin: RDEPENDS: added "libstdc++ (['>= 15.2.0'])"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-bin: PKGSIZE changed from 217576 to 378088 (+74%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: RRECOMMENDS: added "libpng-dbg libstdc++-dbg zlib-dbg"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: PKGSIZE changed from 82965480 to 102567064 (+24%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: FILELIST: added "/usr/lib/libharfbuzz-raster.so /usr/lib/pkgconfig/harfbuzz-gpu.pc /usr/lib/libharfbuzz-gpu.so /usr/lib/libharfbuzz-vector.so /usr/include/harfbuzz/hb-raster.h /usr/include/harfbuzz/hb-vector.h /usr/lib/pkgconfig/harfbuzz-raster.pc /usr/lib/pkgconfig/harfbuzz-vector.pc /usr/include/harfbuzz/hb-gpu.h"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: RDEPENDS: added "libpng-dev zlib-dev"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: RRECOMMENDS: added "libpng-dev zlib-dev"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.61232.0", added "/usr/lib/libharfbuzz-icu.so.0.61410.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: PKGSIZE changed from 5177058 to 5858188 (+13%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.61232.0", added "/usr/lib/libharfbuzz-subset.so.0.61410.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz-cairo.so.0.61232.0 /usr/lib/libharfbuzz.so.0.61232.0 /usr/lib/libharfbuzz-gobject.so.0.61232.0", added "/usr/lib/libharfbuzz-cairo.so.0.61410.0 /usr/lib/libharfbuzz-raster.so.0 /usr/lib/libharfbuzz.so.0.61410.0 /usr/lib/libharfbuzz-gpu.so.0.61410.0 /usr/lib/libharfbuzz-gobject.so.0.61410.0 /usr/lib/libharfbuzz-vector.so.0.61410.0 /usr/lib/libharfbuzz-vector.so.0 /usr/lib/libharfbuzz-gpu.so.0 /usr/lib/libharfbuzz-raster.so.0.61410.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: RDEPENDS: added "libpng (['>= 1.6.56']) zlib (['>= 1.3.2'])"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: PKGSIZE changed from 1189214 to 1544264 (+30%)
Changes to packages/x86-64-v3-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-cairo.so.0 changed symlink target from libharfbuzz-cairo.so.0.61232.0 to libharfbuzz-cairo.so.0.61410.0
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.61232.0 to libharfbuzz-gobject.so.0.61410.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.61232.0 to libharfbuzz-icu.so.0.61410.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.61232.0 to libharfbuzz.so.0.61410.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.61232.0 to libharfbuzz-subset.so.0.61410.0
  /usr/lib/libharfbuzz-cairo.so.0.61232.0 moved to /usr/lib/libharfbuzz-cairo.so.0.61410.0
  /usr/lib/libharfbuzz-gobject.so.0.61232.0 moved to /usr/lib/libharfbuzz-gobject.so.0.61410.0
  /usr/lib/libharfbuzz-icu.so.0.61232.0 moved to /usr/lib/libharfbuzz-icu.so.0.61410.0
  /usr/lib/libharfbuzz.so.0.61232.0 moved to /usr/lib/libharfbuzz.so.0.61410.0
  /usr/lib/libharfbuzz-subset.so.0.61232.0 moved to /usr/lib/libharfbuzz-subset.so.0.61410.0
  /usr/include/harfbuzz/hb-gpu.h was added
  /usr/include/harfbuzz/hb-raster.h was added
  /usr/include/harfbuzz/hb-vector.h was added
  /usr/lib/libharfbuzz-gpu.so.0.61410.0 was added
  /usr/lib/libharfbuzz-gpu.so.0 was added
  /usr/lib/libharfbuzz-gpu.so was added
  /usr/lib/libharfbuzz-raster.so.0.61410.0 was added
  /usr/lib/libharfbuzz-raster.so.0 was added
  /usr/lib/libharfbuzz-raster.so was added
  /usr/lib/libharfbuzz-vector.so.0.61410.0 was added
  /usr/lib/libharfbuzz-vector.so.0 was added
  /usr/lib/libharfbuzz-vector.so was added
  /usr/lib/pkgconfig/harfbuzz-gpu.pc was added
  /usr/lib/pkgconfig/harfbuzz-raster.pc was added
  /usr/lib/pkgconfig/harfbuzz-vector.pc was added

--===============0362022621141713517==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-harfbuzz-upgrade-12.3.2-14.1.0.patch"

RnJvbSAxMzQwYWNhNGVhNGQ1Mzk3Zjc2MWIxYmE3NzBkZTVlMzQ3N2M0YjkwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMTI6MDA6MTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBo
YXJmYnV6ejogdXBncmFkZSAxMi4zLjIgLT4gMTQuMS4wCgotLS0KIC4uLi9oYXJmYnV6ei97aGFy
ZmJ1enpfMTIuMy4yLmJiID0+IGhhcmZidXp6XzE0LjEuMC5iYn0gICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6ei97aGFyZmJ1enpfMTIuMy4yLmJiID0+IGhhcmZidXp6
XzE0LjEuMC5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFy
ZmJ1enovaGFyZmJ1enpfMTIuMy4yLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hhcmZidXp6
L2hhcmZidXp6XzE0LjEuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enovaGFyZmJ1enpfMTIuMy4yLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enovaGFyZmJ1enpfMTQuMS4wLmJiCmluZGV4IDEy
YmViYzRiZWUuLmRjYzM0NjlmZWUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9o
YXJmYnV6ei9oYXJmYnV6el8xMi4zLjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hh
cmZidXp6L2hhcmZidXp6XzE0LjEuMC5iYgpAQCAtOSw3ICs5LDcgQEAgTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vQ09QWUlORzttZDU9Yjk4NDI5YjhlOGUzYzJhNjdjZmVmMDFlOTllNDg5M2Qg
XAogICAgICAgICAgICAgICAgICAgICAiCiAKIFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9
L2Rvd25sb2FkLyR7UFZ9LyR7QlBOfS0ke1BWfS50YXIueHoiCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiNmY2ZGIxNjQzNTlhMmRhNWE4NGVmODI2NjE1YjQ0OGIzM2U2MzA2MDY3YWQ4MjlkODVkNWIw
YmY5MzZmMWJiOCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJlZTBlYjNhMWRhMmM1YTI4MTQ3ZjEy
ZGZmNTVmNmM3ZDYwYWVlZWIyOWFjN2VmMzM0ZWFiZTg0Yzg0NzZjMTA1IgogCiBERVBFTkRTICs9
ICJnbGliLTIuMC1uYXRpdmUiCiAKLS0gCjIuNDcuMQoK

--===============0362022621141713517==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-bin: RDEPENDS: added "libstdc++ (['>= 15.2.0'])"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-bin: PV changed from "12.3.2" to "14.1.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-bin: PKGSIZE changed from 217576 to 378088 (+74%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-bin: PKGV changed from 12.3.2 [default] to 14.1.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-bin: FILELIST: added "/usr/bin/hb-raster /usr/bin/hb-vector"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: PV changed from "12.3.2" to "14.1.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: PKGSIZE changed from 82965480 to 102567064 (+24%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: PKGV changed from 12.3.2 [default] to 14.1.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: FILELIST: removed "/usr/lib/.debug/libharfbuzz-cairo.so.0.61232.0 /usr/lib/.debug/libharfbuzz-gobject.so.0.61232.0 /usr/lib/.debug/libharfbuzz-subset.so.0.61232.0 /usr/lib/.debug/libharfbuzz.so.0.61232.0 /usr/lib/.debug/libharfbuzz-icu.so.0.61232.0", added "/usr/lib/.debug/libharfbuzz.so.0.61410.0 /usr/lib/.debug/libharfbuzz-cairo.so.0.61410.0 /usr/lib/.debug/libharfbuzz-subset.so.0.61410.0 /usr/lib/.debug/libharfbuzz-raster.so.0.61410.0 /usr/bin/.debug/hb-vector /usr/bin/.debug/hb-raster /usr/lib/.debug/libharfbuzz-gpu.so.0.61410.0 /usr/lib/.debug/libharfbuzz-icu.so.0.61410.0 /usr/lib/.debug/libharfbuzz-gobject.so.0.61410.0 /usr/lib/.debug/libharfbuzz-vector.so.0.61410.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: RRECOMMENDS: added "zlib-dbg libstdc++-dbg libpng-dbg"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: RDEPENDS: added "libpng-dev zlib-dev"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: PV changed from "12.3.2" to "14.1.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: PKGSIZE changed from 1809161 to 1840888 (+2%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: PKGV changed from 12.3.2 [default] to 14.1.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: FILELIST: added "/usr/include/harfbuzz/hb-raster.h /usr/include/harfbuzz/hb-vector.h /usr/lib/pkgconfig/harfbuzz-vector.pc /usr/lib/pkgconfig/harfbuzz-raster.pc /usr/lib/libharfbuzz-gpu.so /usr/lib/libharfbuzz-vector.so /usr/include/harfbuzz/hb-gpu.h /usr/lib/libharfbuzz-raster.so /usr/lib/pkgconfig/harfbuzz-gpu.pc"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: RRECOMMENDS: added "libpng-dev zlib-dev"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-doc: PV changed from "12.3.2" to "14.1.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-doc: PKGV changed from 12.3.2 [default] to 14.1.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu-dev: PV changed from "12.3.2" to "14.1.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu-dev: PKGV changed from 12.3.2 [default] to 14.1.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: PV changed from "12.3.2" to "14.1.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: PKGV changed from 12.3.2 [default] to 14.1.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.61232.0", added "/usr/lib/libharfbuzz-icu.so.0.61410.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-locale: PV changed from "12.3.2" to "14.1.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-locale: PKGV changed from 12.3.2 [default] to 14.1.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: PV changed from "12.3.2" to "14.1.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: PKGSIZE changed from 5177058 to 5858188 (+13%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: PKGV changed from 12.3.2 [default] to 14.1.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: FILELIST: directory renamed /usr/src/debug/harfbuzz/12.3.2/src/OT/Layout/GSUB -> /usr/src/debug/harfbuzz/14.1.0/src/OT/Layout/GSUB, directory renamed /usr/src/debug/harfbuzz/12.3.2/src/OT/Color/CBDT -> /usr/src/debug/harfbuzz/14.1.0/src/OT/Color/CBDT, directory renamed /usr/src/debug/harfbuzz/12.3.2/src/OT/Layout/GDEF -> /usr/src/debug/harfbuzz/14.1.0/src/OT/Layout/GDEF, directory renamed /usr/src/debug/harfbuzz/12.3.2/src/OT/Var/VARC -> /usr/src/debug/harfbuzz/14.1.0/src/OT/Var/VARC, directory renamed /usr/src/debug/harfbuzz/12.3.2/src/OT/Color/COLR -> /usr/src/debug/harfbuzz/14.1.0/src/OT/Color/COLR, directory renamed /usr/src/debug/harfbuzz/12.3.2/src/OT/Color/sbix -> /usr/src/debug/harfbuzz/14.1.0/src/OT/Color/sbix, directory renamed /usr/src/debug/harfbuzz/12.3.2/src/OT/Layout/Common -> /usr/src/debug/harfbuzz/14.1.0/src/OT/Layout/Common, directory renamed /usr/src/debug/harfbuzz/12.3.2/src/graph -> /usr/src/debug/harfbuzz/14.
 1.0/src/graph, directory renamed /usr/src/debug/harfbuzz/12.3.2/src/OT/Layout -> /usr/src/debug/harfbuzz/14.1.0/src/OT/Layout, directory renamed /usr/src/debug/harfbuzz/12.3.2/src/OT/Color/svg -> /usr/src/debug/harfbuzz/14.1.0/src/OT/Color/svg, directory renamed /usr/src/debug/harfbuzz/12.3.2/src/OT/Color/CPAL -> /usr/src/debug/harfbuzz/14.1.0/src/OT/Color/CPAL, directory renamed /usr/src/debug/harfbuzz/12.3.2/src/OT/Layout/GPOS -> /usr/src/debug/harfbuzz/14.1.0/src/OT/Layout/GPOS, directory renamed /usr/src/debug/harfbuzz/12.3.2/src/OT/name -> /usr/src/debug/harfbuzz/14.1.0/src/OT/name, directory renamed /usr/src/debug/harfbuzz/12.3.2/src/OT/glyf -> /usr/src/debug/harfbuzz/14.1.0/src/OT/glyf, removed "/usr/src/debug/harfbuzz/12.3.2/src/hb-ot-metrics.h /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-var.h /usr/src/debug/harfbuzz/12.3.2/src/hb-icu.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-glib.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-ucd.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-set.hh /usr/s
 rc/debug/harfbuzz/12.3.2/src/hb-sanitize.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-shaper-khmer.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-gobject-enums.h /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-font.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-open-type.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-open-file.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-shape-plan.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-cairo.h /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-shaper-syllabic.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-map.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-string-array.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-layout-common.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-layout-gsubgpos.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-os2-table.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-map.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-set.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-subset-table-cff.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-bit-set-invertible.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-shaper-ara
 bic-table.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-number.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-face.hh /usr/src/debug/harfbuzz/12.3.2/util/hb-info.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-shaper-indic.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-shaper-use.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-ft-colr.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-buffer.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-face.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-ft.h /usr/src/debug/harfbuzz/12.3.2/src/hb-subset-instancer-iup.cc /usr/src/debug/harfbuzz/12.3.2/util/main-font-text.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-aat-layout-feat-table.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-aat-layout-just-table.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-aat-layout-trak-table.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-cff1-table.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-cff2-table.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-shaper-indic-table.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-unicode-emoji-table.hh /us
 r/src/debug/harfbuzz/12.3.2/src/hb-alloc-pool.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-shaper-thai.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-aat-layout-common.hh /usr/src/debug/harfbuzz/12.3.2/util/batch.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-subset-instancer-iup.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-tag.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-face.h /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-shaper.hh /usr/src/debug/harfbuzz/12.3.2/util/shape-consumer.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-shaper-default.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-name.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-cff-common.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-cff1-interp-cs.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-metrics.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-shaper-vowel-constraints.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-shaper-myanmar.cc /usr/src/debug/harfbuzz/12.3.2/util/options.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-subset-serialize.h /usr/src/debug/harfbuzz/1
 2.3.2/src/hb-ot-shape-normalize.hh /usr/src/debug/harfbuzz/12.3.2/util/helper-cairo-ansi.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-color.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-shape.cc /usr/src/debug/harfbuzz/12.3.2/util/hb-shape.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-cplusplus.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-shape.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-set.h /usr/src/debug/harfbuzz/12.3.2/src/hb-subset-table-layout.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-blob.h /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-shaper-syllabic.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-buffer-verify.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-subset-plan-member-list.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-subset-serialize.cc /usr/src/debug/harfbuzz/12.3.2/util/shape-options.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-layout-gsub-table.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-face-table-list.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ft.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-meta.h /
 usr/src/debug/harfbuzz/12.3.2/src/hb-ot-face.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-machinery.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-kern.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-multimap.hh /usr/src/debug/harfbuzz/12.3.2/util/hb-subset.cc /usr/src/debug/harfbuzz/12.3.2/util/ansi-print.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-subset-plan.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-shaper.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-style.h /usr/src/debug/harfbuzz/12.3.2/src/hb-meta.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-atomic.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-math.h /usr/src/debug/harfbuzz/12.3.2/src/hb-subset-cff1.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-paint-extents.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-utf.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-subset.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-geometry.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-subset-input.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-draw.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-aat-ltag-table.hh /usr/sr
 c/debug/harfbuzz/12.3.2/src/hb-common.h /usr/src/debug/harfbuzz/12.3.2/src/hb-repacker.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-subset-plan-layout.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-gobject-structs.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-hdmx-table.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-head-table.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-dispatch.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-hhea-table.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-hmtx-table.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-post-table.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-vorg-table.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-paint-bounded.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-map.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-subset.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-ucd-table.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-unicode.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-cairo-utils.cc /usr/src/debug/harfbuzz/12.3.2/util/helper-subset.hh /usr/src/debug/harfbuzz/12.3.2/util/shape-format.hh /usr
 /src/debug/harfbuzz/12.3.2/src/hb-shape.h /usr/src/debug/harfbuzz/12.3.2/util/shape-output.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-metrics.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-gobject-enums.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-shape-fallback.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-face.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-font.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-bimap.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-priority-queue.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-subset-instancer-solver.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-aat-layout.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-set-digest.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-free-pool.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-var-avar-table.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-var-cvar-table.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-var-fvar-table.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-var-gvar-table.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-var-hvar-table.hh /usr/src/debug/harfbuzz/12.
 3.2/src/hb-ot-var-mvar-table.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-cff-interp-dict-common.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-paint.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-font.h /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-shaper-indic.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-cache.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-aat-layout.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-debug.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-face-builder.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-paint-bounded.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-layout.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-post-macroman.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-tag-table.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-buffer.h /usr/src/debug/harfbuzz/12.3.2/src/hb-object.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-subset-cff-common.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-array.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-var.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-shape-plan.hh /usr/src/debug/harfbuzz/12.3.2/sr
 c/hb-shape.cc /usr/src/debug/harfbuzz/12.3.2/util/helper-cairo-ft.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-shaper-vowel-constraints.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-bit-set.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-shaper.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-meta.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-aat-layout-kerx-table.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-aat-layout-ankr-table.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-aat-layout-morx-table.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-subset-plan-var.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-font.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-paint.h /usr/src/debug/harfbuzz/12.3.2/src/hb-aat-map.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-math.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-name-language-static.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-shape-plan.h /usr/src/debug/harfbuzz/12.3.2/src/hb-vector.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-cff1-std-str.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-paint-extents.hh /
 usr/src/debug/harfbuzz/12.3.2/src/hb-number.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-blob.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-shaper-arabic-pua.hh /usr/src/debug/harfbuzz/12.3.2/util/face-options.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-font.h /usr/src/debug/harfbuzz/12.3.2/src/hb-common.cc /usr/src/debug/harfbuzz/12.3.2/util/font-options.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-layout.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-iter.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-shaper-hangul.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-shaper-hebrew.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-var-common.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-cff2-interp-cs.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-script-list.h /usr/src/debug/harfbuzz/12.3.2/src/hb-outline.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-cairo-utils.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-map.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-deprecated.h /usr/src/debug/harfbuzz/12.3.2/src/hb-aat-map.hh /usr/src/debu
 g/harfbuzz/12.3.2/src/hb-map.h /usr/src/debug/harfbuzz/12.3.2/src/hb-unicode.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-layout.h /usr/src/debug/harfbuzz/12.3.2/src/hb-buffer.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-mutex.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-deprecated.h /usr/src/debug/harfbuzz/12.3.2/src/hb-fallback-shape.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-color.h /usr/src/debug/harfbuzz/12.3.2/src/hb-cff-interp-cs-common.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-aat-layout.h /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-name.h /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-shaper-arabic-fallback.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-outline.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-subset-accelerator.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-shaper-arabic-joining-list.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-subset-input.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-unicode.h /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-shape-fallback.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-shaper
 -arabic.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-layout-gpos-table.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-algs.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-bit-page.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-shaper-arabic.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-subset-instancer-solver.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-buffer-serialize.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-shape-normalize.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-blob.hh /usr/src/debug/harfbuzz/12.3.2/util/output-options.hh /usr/src/debug/harfbuzz/12.3.2/util/view-cairo.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-subset.h /usr/src/debug/harfbuzz/12.3.2/src/hb-cff-interp-common.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-name-language.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-draw.h /usr/src/debug/harfbuzz/12.3.2/src/hb-cairo.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-subset-plan.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-serialize.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-shaper-use-table.hh /usr/src/debug/h
 arfbuzz/12.3.2/src/hb-paint.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-null.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-post-table-v2subset.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-subset-cff-common.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-decycler.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-shaper-list.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-subset-cff2.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-draw.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-static.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-layout-base-table.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-version.h /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-cff1-table.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-cff2-table.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-cmap-table.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-kern-table.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-math-table.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-maxp-table.hh /usr/src/debug/harfbuzz/12.3.2/util/text-options.hh /usr/src/debug/harfbuzz/12.3.2/util/view-options.hh /us
 r/src/debug/harfbuzz/12.3.2/src/hb-ot-meta-table.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-stat-table.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-style.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-subset-table-color.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-subset-table-var.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-subset-table-other.cc /usr/src/debug/harfbuzz/12.3.2/util/helper-cairo.hh /usr/src/debug/harfbuzz/12.3.2/src/hb-subset-table.hh /usr/src/debug/harfbuzz/12.3.2/util/hb-view.cc /usr/src/debug/harfbuzz/12.3.2/src/hb-ot-os2-unicode-ranges.hh", added "/usr/src/debug/harfbuzz/14.1.0/src/hb-ot-var.h /usr/src/debug/harfbuzz/14.1.0/src/hb-set.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-font.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-open-type.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-open-file.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-shape-plan.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-string-array.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-layout-common.hh /usr/src/debug/harfbuzz/14.1.0/sr
 c/hb-ot-layout-gsubgpos.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-os2-table.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-map.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-raster-svg-defs.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-set.cc /usr/src/debug/harfbuzz/14.1.0/util/main-font-text.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-aat-layout-trak-table.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-cff1-table.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-cff2-table.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-raster-svg-base.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-tag.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-raster-svg-fill.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-face.h /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-shaper-default.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-cff-common.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-vector-svg-subset.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-vector-svg.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-subset-serialize.h /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-shape-nor
 malize.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-cplusplus.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-subset-table-layout.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-vector-svg-subset.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-raster-svg-gradient.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-raster-svg-bbox.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-raster-svg-gradient.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-subset-plan-member-list.hh /usr/src/debug/harfbuzz/14.1.0/util/shape-options.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-multimap.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-meta.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-math.h /usr/src/debug/harfbuzz/14.1.0/src/hb-subset.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-draw.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-aat-ltag-table.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-gobject-structs.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-dispatch.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-unicode.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-gpu-vertex-glsl.hh /usr/src/deb
 ug/harfbuzz/14.1.0/src/hb-subset.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-ucd-table.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-shape-fallback.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-face.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-font.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-priority-queue.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-aat-layout.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-set-digest.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-gpu-shaders.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-paint.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-cache.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-aat-layout.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-face-builder.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-raster-image.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-var.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-shaper.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-math.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-vector.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-number.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-font.h /us
 r/src/debug/harfbuzz/14.1.0/src/hb-ot-shaper-hebrew.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-script-list.h /usr/src/debug/harfbuzz/14.1.0/src/hb-cairo-utils.hh /usr/src/debug/harfbuzz/14.1.0/util/hb-vector.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-color.h /usr/src/debug/harfbuzz/14.1.0/src/hb-subset-input.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-shaper-arabic.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-shaper-arabic.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-blob.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-subset.h /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-name-language.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-draw.h /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-shaper-use-table.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-post-table-v2subset.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-decycler.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-style.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-subset-table-cff.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-subset-table-var.cc /usr/src/debug/harfbuzz/14.1.0/src/
 hb-cff-width-optimizer.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-machinery.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-metrics.h /usr/src/debug/harfbuzz/14.1.0/src/hb-icu.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-gobject-enums.h /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-shaper-syllabic.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-raster-svg-defs-scan.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-bit-set-invertible.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-face.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-shaper-indic.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-zlib.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ft.h /usr/src/debug/harfbuzz/14.1.0/src/hb-aat-layout-just-table.hh /usr/src/debug/harfbuzz/14.1.0/util/shape-consumer.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-metrics.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-gpu-fragment-hlsl.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-gpu-fragment-wgsl.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-gpu-fragment-glsl.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-blob.h /u
 sr/src/debug/harfbuzz/14.1.0/util/hb-raster.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-ft.cc /usr/src/debug/harfbuzz/14.1.0/util/ansi-print.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-vector-svg-path.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-shaper.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-atomic.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-subset-cff1.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-vector-svg-path.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-geometry.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-common.h /usr/src/debug/harfbuzz/14.1.0/src/hb-vector-svg-utils.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-vector-svg-utils.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-vector-svg-draw.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-shape.h /usr/src/debug/harfbuzz/14.1.0/src/hb-raster-svg-context.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-shaper-indic.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-debug.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-paint-bounded.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-buffer.h /usr/src/de
 bug/harfbuzz/14.1.0/src/hb-object.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-subset-cff-common.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-raster-svg-use.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-shape.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-raster-svg-bbox.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-bit-set.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-aat-layout-morx-table.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-subset-plan-var.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-raster-svg-defs.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-name-language-static.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-common.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-iter.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-deprecated.h /usr/src/debug/harfbuzz/14.1.0/src/hb-aat-map.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-subset-accelerator.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-name.h /usr/src/debug/harfbuzz/14.1.0/src/hb-unicode.h /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-shaper-arabic-joining-list.hh /usr/src/debug/harfbuzz/14
 .1.0/src/hb-raster-svg-parse.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-raster-svg-parse.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-bit-page.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-subset-instancer-solver.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-buffer-serialize.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-shape-normalize.cc /usr/src/debug/harfbuzz/14.1.0/util/output-options.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-serialize.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-vector.h /usr/src/debug/harfbuzz/14.1.0/src/hb-subset-cff2.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-draw.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-math-table.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-maxp-table.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-meta-table.hh /usr/src/debug/harfbuzz/14.1.0/util/face-options.hh /usr/src/debug/harfbuzz/14.1.0/util/font-options.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-vector-svg-paint.cc /usr/src/debug/harfbuzz/14.1.0/util/text-options.hh /usr/src/debug/harfbuzz/14.1.0/util/view-opt
 ions.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-gobject-enums.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-ucd.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-sanitize.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-raster-svg-use.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-gpu-vertex-msl.hh /usr/src/debug/harfbuzz/14.1.0/util/hb-info.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-ft-colr.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-buffer.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-face.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-subset-instancer-iup.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-shaper-indic-table.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-gpu-draw.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-aat-layout-common.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-shaper-thai.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-subset-instancer-iup.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-gpu-draw.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-name.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-shaper-vowel-constraints.hh /usr/src/debug/ha
 rfbuzz/14.1.0/src/hb-ot-shaper-myanmar.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-gpu-vertex-wgsl.hh /usr/src/debug/harfbuzz/14.1.0/util/helper-cairo-ansi.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-color.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-shape.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-shape.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-buffer-verify.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-raster-svg-color.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-subset-serialize.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-layout-gsub-table.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-raster-svg-color.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-subset-plan.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-style.h /usr/src/debug/harfbuzz/14.1.0/src/hb-utf.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-subset-input.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-raster-svg-base.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-repacker.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-subset-plan-layout.cc /usr/src/debug/harfbuzz/14.1.0/src/
 hb-raster-paint.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-hdmx-table.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-head-table.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-hhea-table.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-hmtx-table.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-paint-bounded.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-post-table.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-raster-draw.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-cairo-utils.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-gpu.h /usr/src/debug/harfbuzz/14.1.0/src/hb-free-pool.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-var-avar-table.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-var-cvar-table.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-var-fvar-table.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-var-gvar-table.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-var-hvar-table.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-var-mvar-table.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-cff-interp-dict-common.hh /usr/src/debug/harfbuzz/14.1.
 0/src/hb-ot-layout.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-tag-table.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-raster-svg-fill.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-raster-utils.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-aat-layout-kerx-table.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-font.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-shape-plan.h /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-cff1-std-str.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-paint-extents.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-shaper-arabic-pua.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-blob.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-layout.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-shaper-hangul.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-var-common.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-map.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-unicode.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-layout.h /usr/src/debug/harfbuzz/14.1.0/src/hb-buffer.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-deprecated.h /usr/src/debug/harfb
 uzz/14.1.0/src/hb-fallback-shape.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-cff-interp-cs-common.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-aat-layout.h /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-shaper-arabic-fallback.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-shape-fallback.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-layout-gpos-table.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-algs.hh /usr/src/debug/harfbuzz/14.1.0/util/view-cairo.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-raster-image.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-gpu-cu2qu.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-raster-paint.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-cairo.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-paint.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-null.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-static.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-layout-base-table.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-stat-table.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-cmap-table.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-kern
 -table.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-cff1-table.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-cff2-table.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-subset-table-color.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-subset-table-other.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-subset-table.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-os2-unicode-ranges.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-glib.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-zlib.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-shaper-khmer.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-cairo.h /usr/src/debug/harfbuzz/14.1.0/src/hb-map.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-shaper-arabic-table.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-number.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-raster-svg.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-shaper-use.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-raster-svg-clip.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-aat-layout-feat-table.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-unicode-emoji-table.hh 
 /usr/src/debug/harfbuzz/14.1.0/src/hb-alloc-pool.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-raster-svg-clip.cc /usr/src/debug/harfbuzz/14.1.0/util/batch.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-shaper.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-cff1-interp-cs.hh /usr/src/debug/harfbuzz/14.1.0/util/options.hh /usr/src/debug/harfbuzz/14.1.0/util/hb-shape.cc /usr/src/debug/harfbuzz/14.1.0/util/vector-output.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-set.h /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-shaper-syllabic.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-face-table-list.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-meta.h /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-face.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-kern.hh /usr/src/debug/harfbuzz/14.1.0/util/hb-subset.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-paint-extents.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-subset-cff2-to-cff1.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-vorg-table.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-map.hh /usr/src/debug/h
 arfbuzz/14.1.0/util/helper-subset.hh /usr/src/debug/harfbuzz/14.1.0/util/raster-output.hh /usr/src/debug/harfbuzz/14.1.0/util/shape-format.hh /usr/src/debug/harfbuzz/14.1.0/util/shape-output.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-metrics.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-gpu-vertex-hlsl.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-bimap.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-subset-instancer-solver.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-font.h /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-post-macroman.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-array.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-shape-plan.hh /usr/src/debug/harfbuzz/14.1.0/util/helper-cairo-ft.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-shaper-vowel-constraints.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-gpu-fragment-msl.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-ot-meta.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-aat-layout-ankr-table.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-paint.h /usr/src/debug/harfbuzz/14.1.0/src/hb-aa
 t-map.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-raster-svg-render.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-cff2-interp-cs.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-outline.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-map.h /usr/src/debug/harfbuzz/14.1.0/src/hb-mutex.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-raster-svg-defs-scan.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-outline.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-raster.h /usr/src/debug/harfbuzz/14.1.0/src/hb-cff-interp-common.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-cff-specializer.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-subset-plan.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-subset-cff-common.cc /usr/src/debug/harfbuzz/14.1.0/src/hb-shaper-list.hh /usr/src/debug/harfbuzz/14.1.0/src/hb-version.h /usr/src/debug/harfbuzz/14.1.0/util/helper-image-output.hh /usr/src/debug/harfbuzz/14.1.0/util/helper-cairo.hh /usr/src/debug/harfbuzz/14.1.0/util/hb-view.cc"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-staticdev: PV changed from "12.3.2" to "14.1.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-staticdev: PKGV changed from 12.3.2 [default] to 14.1.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: PV changed from "12.3.2" to "14.1.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: PKGSIZE changed from 919711 to 948383 (+3%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: PKGV changed from 12.3.2 [default] to 14.1.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.61232.0", added "/usr/lib/libharfbuzz-subset.so.0.61410.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: RDEPENDS: added "zlib (['>= 1.3.2']) libpng (['>= 1.6.56'])"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: PV changed from "12.3.2" to "14.1.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: PKGSIZE changed from 1189214 to 1544264 (+30%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: PKGV changed from 12.3.2 [default] to 14.1.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.61232.0 /usr/lib/libharfbuzz.so.0.61232.0 /usr/lib/libharfbuzz-cairo.so.0.61232.0", added "/usr/lib/libharfbuzz-gpu.so.0 /usr/lib/libharfbuzz-vector.so.0 /usr/lib/libharfbuzz-raster.so.0 /usr/lib/libharfbuzz-gpu.so.0.61410.0 /usr/lib/libharfbuzz-raster.so.0.61410.0 /usr/lib/libharfbuzz-vector.so.0.61410.0 /usr/lib/libharfbuzz-cairo.so.0.61410.0 /usr/lib/libharfbuzz.so.0.61410.0 /usr/lib/libharfbuzz-gobject.so.0.61410.0"
packages/x86-64-v3-poky-linux/harfbuzz: PV changed from "12.3.2" to "14.1.0"
packages/x86-64-v3-poky-linux/harfbuzz: SRC_URI changed from "https://github.com/harfbuzz/harfbuzz/releases//download/12.3.2/harfbuzz-12.3.2.tar.xz" to "https://github.com/harfbuzz/harfbuzz/releases//download/14.1.0/harfbuzz-14.1.0.tar.xz"
packages/x86-64-v3-poky-linux/harfbuzz: PKGV changed from 12.3.2 [default] to 14.1.0 [default]
Changes to packages/x86-64-v3-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-cairo.so.0 changed symlink target from libharfbuzz-cairo.so.0.61232.0 to libharfbuzz-cairo.so.0.61410.0
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.61232.0 to libharfbuzz-gobject.so.0.61410.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.61232.0 to libharfbuzz-icu.so.0.61410.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.61232.0 to libharfbuzz.so.0.61410.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.61232.0 to libharfbuzz-subset.so.0.61410.0
  /usr/lib/libharfbuzz-cairo.so.0.61232.0 moved to /usr/lib/libharfbuzz-cairo.so.0.61410.0
  /usr/lib/libharfbuzz-gobject.so.0.61232.0 moved to /usr/lib/libharfbuzz-gobject.so.0.61410.0
  /usr/lib/libharfbuzz-icu.so.0.61232.0 moved to /usr/lib/libharfbuzz-icu.so.0.61410.0
  /usr/lib/libharfbuzz.so.0.61232.0 moved to /usr/lib/libharfbuzz.so.0.61410.0
  /usr/lib/libharfbuzz-subset.so.0.61232.0 moved to /usr/lib/libharfbuzz-subset.so.0.61410.0
  /usr/include/harfbuzz/hb-gpu.h was added
  /usr/include/harfbuzz/hb-raster.h was added
  /usr/include/harfbuzz/hb-vector.h was added
  /usr/lib/libharfbuzz-gpu.so.0.61410.0 was added
  /usr/lib/libharfbuzz-gpu.so.0 was added
  /usr/lib/libharfbuzz-gpu.so was added
  /usr/lib/libharfbuzz-raster.so.0.61410.0 was added
  /usr/lib/libharfbuzz-raster.so.0 was added
  /usr/lib/libharfbuzz-raster.so was added
  /usr/lib/libharfbuzz-vector.so.0.61410.0 was added
  /usr/lib/libharfbuzz-vector.so.0 was added
  /usr/lib/libharfbuzz-vector.so was added
  /usr/lib/pkgconfig/harfbuzz-gpu.pc was added
  /usr/lib/pkgconfig/harfbuzz-raster.pc was added
  /usr/lib/pkgconfig/harfbuzz-vector.pc was added

--===============0362022621141713517==--

