Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8667C54FAB
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:13 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.14617.1700059029474879731
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=etX2ghhf;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=qi180v/l;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018bd36a28cd-a9484991-0bb9-42d8-94ff-b91146587477-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059031;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ph7vVIT8BCVPXbh+AA41rVQmQMo8Kn+f6jsUW3Abt+E=;
	b=etX2ghhfnrDKg4VSh2mcwZi65QyQNM6UWCVt+A8TTnFc2TJ/+UqYybwRV6gf8i14
	h/zjOPyuNj5vGlrpuT/a7pUK3ClNfWfxJ4gGekV5jmv6E3D6sJjALNso+2757z+L9f9
	s6de8lLNIw7qbixtNN86GCYeujxr3R643xiHs6t4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059031;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ph7vVIT8BCVPXbh+AA41rVQmQMo8Kn+f6jsUW3Abt+E=;
	b=qi180v/l2rzb53rH4jHeN5LbMydRuizGNnElTQ782zvohHWrK51+64tvGSPLquw2
	Sl8e/O3FMc39LNVtOll6qn/ma65bzyVXcoC7ZcK3fEKyMG313MmATI82P7FFFbgEVB6
	b8hll09BbTm4KkFNPgE3R/3ntjsPD4FGH3UbjZsU=
Content-Type: multipart/mixed; boundary="===============3630247289626637431=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libdrm: upgrading to 2.4.117 SUCCEEDED
Message-ID: <0101018bd36a28cd-a9484991-0bb9-42d8-94ff-b91146587477-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190677

--===============3630247289626637431==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libdrm* to *2.4.117* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libdrm-upgrade-2.4.116-2.4.117.patch
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
From 3986719c0fb39a3cee774cd2302e53d61a5434e0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Nov 2023 10:39:47 +0000
Subject: [PATCH] libdrm: upgrade 2.4.116 -> 2.4.117

---
 .../drm/{libdrm_2.4.116.bb => libdrm_2.4.117.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.116.bb => libdrm_2.4.117.bb} (97%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.116.bb b/meta/recipes-graphics/drm/libdrm_2.4.117.bb
similarity index 97%
rename from meta/recipes-graphics/drm/libdrm_2.4.116.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.117.bb
index f0aaf314c6..3e6fb16e15 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.116.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.117.bb
@@ -13,7 +13,7 @@ DEPENDS = "libpthread-stubs"
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz \
           "
 
-SRC_URI[sha256sum] = "46c53f40735ea3d26d614297f155f6131a510624a24274f654f6469ca905339a"
+SRC_URI[sha256sum] = "a2888d69e3eb1c8a77adc08a75a60fbae01f0d208d26f034d1a12e362361242b"
 
 inherit meson pkgconfig manpages
 
-- 
2.39.2


--===============3630247289626637431==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libdrm: PV changed from "2.4.116" to "2.4.117"
packages/core2-64-poky-linux/libdrm: PKGV changed from 2.4.116 [default] to 2.4.117 [default]
packages/core2-64-poky-linux/libdrm: SRC_URI changed from "http://dri.freedesktop.org/libdrm/libdrm-2.4.116.tar.xz" to "http://dri.freedesktop.org/libdrm/libdrm-2.4.117.tar.xz"
packages/core2-64-poky-linux/libdrm/libdrm-amdgpu: PV changed from "2.4.116" to "2.4.117"
packages/core2-64-poky-linux/libdrm/libdrm-amdgpu: PKGSIZE changed from 59888 to 60138 (+0%)
packages/core2-64-poky-linux/libdrm/libdrm-amdgpu: PKGV changed from 2.4.116 [default] to 2.4.117 [default]
packages/core2-64-poky-linux/libdrm/libdrm-dbg: PV changed from "2.4.116" to "2.4.117"
packages/core2-64-poky-linux/libdrm/libdrm-dbg: PKGSIZE changed from 1496512 to 1508768 (+1%)
packages/core2-64-poky-linux/libdrm/libdrm-dbg: PKGV changed from 2.4.116 [default] to 2.4.117 [default]
packages/core2-64-poky-linux/libdrm/libdrm-dev: PV changed from "2.4.116" to "2.4.117"
packages/core2-64-poky-linux/libdrm/libdrm-dev: PKGSIZE changed from 746743 to 751707 (+1%)
packages/core2-64-poky-linux/libdrm/libdrm-dev: PKGV changed from 2.4.116 [default] to 2.4.117 [default]
packages/core2-64-poky-linux/libdrm/libdrm-doc: PV changed from "2.4.116" to "2.4.117"
packages/core2-64-poky-linux/libdrm/libdrm-doc: PKGV changed from 2.4.116 [default] to 2.4.117 [default]
packages/core2-64-poky-linux/libdrm/libdrm-drivers: PV changed from "2.4.116" to "2.4.117"
packages/core2-64-poky-linux/libdrm/libdrm-drivers: PKGV changed from 2.4.116 [default] to 2.4.117 [default]
packages/core2-64-poky-linux/libdrm/libdrm-etnaviv: PV changed from "2.4.116" to "2.4.117"
packages/core2-64-poky-linux/libdrm/libdrm-etnaviv: PKGV changed from 2.4.116 [default] to 2.4.117 [default]
packages/core2-64-poky-linux/libdrm/libdrm-exynos: PV changed from "2.4.116" to "2.4.117"
packages/core2-64-poky-linux/libdrm/libdrm-exynos: PKGV changed from 2.4.116 [default] to 2.4.117 [default]
packages/core2-64-poky-linux/libdrm/libdrm-freedreno: PV changed from "2.4.116" to "2.4.117"
packages/core2-64-poky-linux/libdrm/libdrm-freedreno: PKGV changed from 2.4.116 [default] to 2.4.117 [default]
packages/core2-64-poky-linux/libdrm/libdrm-intel: PV changed from "2.4.116" to "2.4.117"
packages/core2-64-poky-linux/libdrm/libdrm-intel: PKGV changed from 2.4.116 [default] to 2.4.117 [default]
packages/core2-64-poky-linux/libdrm/libdrm-locale: PV changed from "2.4.116" to "2.4.117"
packages/core2-64-poky-linux/libdrm/libdrm-locale: PKGV changed from 2.4.116 [default] to 2.4.117 [default]
packages/core2-64-poky-linux/libdrm/libdrm-nouveau: PV changed from "2.4.116" to "2.4.117"
packages/core2-64-poky-linux/libdrm/libdrm-nouveau: PKGV changed from 2.4.116 [default] to 2.4.117 [default]
packages/core2-64-poky-linux/libdrm/libdrm-omap: PV changed from "2.4.116" to "2.4.117"
packages/core2-64-poky-linux/libdrm/libdrm-omap: PKGV changed from 2.4.116 [default] to 2.4.117 [default]
packages/core2-64-poky-linux/libdrm/libdrm-radeon: PV changed from "2.4.116" to "2.4.117"
packages/core2-64-poky-linux/libdrm/libdrm-radeon: PKGV changed from 2.4.116 [default] to 2.4.117 [default]
packages/core2-64-poky-linux/libdrm/libdrm-src: PV changed from "2.4.116" to "2.4.117"
packages/core2-64-poky-linux/libdrm/libdrm-src: PKGSIZE changed from 1651637 to 1662545 (+1%)
packages/core2-64-poky-linux/libdrm/libdrm-src: PKGV changed from 2.4.116 [default] to 2.4.117 [default]
packages/core2-64-poky-linux/libdrm/libdrm-staticdev: PV changed from "2.4.116" to "2.4.117"
packages/core2-64-poky-linux/libdrm/libdrm-staticdev: PKGV changed from 2.4.116 [default] to 2.4.117 [default]
packages/core2-64-poky-linux/libdrm/libdrm-tests: PV changed from "2.4.116" to "2.4.117"
packages/core2-64-poky-linux/libdrm/libdrm-tests: PKGV changed from 2.4.116 [default] to 2.4.117 [default]
packages/core2-64-poky-linux/libdrm/libdrm: PV changed from "2.4.116" to "2.4.117"
packages/core2-64-poky-linux/libdrm/libdrm: PKGV changed from 2.4.116 [default] to 2.4.117 [default]

--===============3630247289626637431==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libdrm-upgrade-2.4.116-2.4.117.patch"

RnJvbSAzOTg2NzE5YzBmYjM5YTNjZWU3NzRjZDIzMDJlNTNkNjFhNTQzNGUwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTm92IDIwMjMgMTA6Mzk6NDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJkcm06IHVwZ3JhZGUgMi40LjExNiAtPiAyLjQuMTE3CgotLS0KIC4uLi9kcm0ve2xpYmRybV8y
LjQuMTE2LmJiID0+IGxpYmRybV8yLjQuMTE3LmJifSAgICAgICAgICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy9kcm0ve2xpYmRybV8yLjQuMTE2LmJiID0+IGxpYmRybV8yLjQuMTE3
LmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9kcm0vbGliZHJt
XzIuNC4xMTYuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZHJtL2xpYmRybV8yLjQuMTE3LmJi
CnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9k
cm0vbGliZHJtXzIuNC4xMTYuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9kcm0v
bGliZHJtXzIuNC4xMTcuYmIKaW5kZXggZjBhYWYzMTRjNi4uM2U2ZmIxNmUxNSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2RybS9saWJkcm1fMi40LjExNi5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvZHJtL2xpYmRybV8yLjQuMTE3LmJiCkBAIC0xMyw3ICsxMyw3IEBA
IERFUEVORFMgPSAibGlicHRocmVhZC1zdHVicyIKIFNSQ19VUkkgPSAiaHR0cDovL2RyaS5mcmVl
ZGVza3RvcC5vcmcvbGliZHJtLyR7QlB9LnRhci54eiBcCiAgICAgICAgICAgIgogCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiNDZjNTNmNDA3MzVlYTNkMjZkNjE0Mjk3ZjE1NWY2MTMxYTUxMDYyNGEy
NDI3NGY2NTRmNjQ2OWNhOTA1MzM5YSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJhMjg4OGQ2OWUz
ZWIxYzhhNzdhZGMwOGE3NWE2MGZiYWUwMWYwZDIwOGQyNmYwMzRkMWExMmUzNjIzNjEyNDJiIgog
CiBpbmhlcml0IG1lc29uIHBrZ2NvbmZpZyBtYW5wYWdlcwogCi0tIAoyLjM5LjIKCg==

--===============3630247289626637431==--

