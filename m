Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16B3AC05022
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:12 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.8504.1698848706698595502
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Om41YfMA;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=BhNX2pgU;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.29, mailfrom: 0101018b8b460d82-e464a5ff-077e-4feb-b0ef-144aa32164be-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848706;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=5Kg9QEYCD2uXaJlqaHZ7brcK/N51YTFG/DRdpLWHEQ4=;
	b=Om41YfMASniYmHa7luTKmMeKQOzvzFNiQ79k1TyK/fUmtTQnno5Fn8u6+v+/FY9N
	Atpo1umcU8DYMoL8c8p0OQ4jsxFJVatopklVL/eM2cduumw8eoz3PWECaNyBZvxoLkD
	G97jCHPBND0wcNHNVgKY494Bcv0QdlZATT4FXyQE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848706;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=5Kg9QEYCD2uXaJlqaHZ7brcK/N51YTFG/DRdpLWHEQ4=;
	b=BhNX2pgUytnR9NAtm4fqsmFpxpNW28dyNQtCOBABCFNY8QC1yZDXQiG5xDeckuGP
	CFvr8+0msCGmdUcTnv1qp3PNvd7pOlWNPa5uBUiPeRQ8uJrl3Sh42vwMDP1I6Kyxmvf
	13Z7wLMF0cd7KtKM2vS90TeG55hTsZbszy3D/G0Q=
Content-Type: multipart/mixed; boundary="===============1694497206580095299=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xwayland: upgrading to 23.2.2 SUCCEEDED
Message-ID: <0101018b8b460d82-e464a5ff-077e-4feb-b0ef-144aa32164be-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190025

--===============1694497206580095299==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xwayland* to *23.2.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xwayland-upgrade-23.2.1-23.2.2.patch
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
From ad0b482722899379e6c90511c7acc73fb713947a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 13:31:37 +0000
Subject: [PATCH] xwayland: upgrade 23.2.1 -> 23.2.2

---
 .../xwayland/{xwayland_23.2.1.bb => xwayland_23.2.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_23.2.1.bb => xwayland_23.2.2.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.1.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.2.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_23.2.1.bb
rename to meta/recipes-graphics/xwayland/xwayland_23.2.2.bb
index e97a921a96..9feac147db 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.1.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.2.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "eebc2692c3aa80617d78428bc6ec7b91b254a98214d2a70e997098503cd6ef90"
+SRC_URI[sha256sum] = "9f7c0938d2a41e941ffa04f99c35e5db2bcd3eec034afe8d35d5c810a22eb0a8"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.39.2


--===============1694497206580095299==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xwayland: SRC_URI changed from "https://www.x.org/archive/individual/xserver/xwayland-23.2.1.tar.xz" to "https://www.x.org/archive/individual/xserver/xwayland-23.2.2.tar.xz"
packages/core2-64-poky-linux/xwayland: PKGV changed from 23.2.1 [default] to 23.2.2 [default]
packages/core2-64-poky-linux/xwayland: PV changed from "23.2.1" to "23.2.2"
packages/core2-64-poky-linux/xwayland/xwayland-dbg: PKGV changed from 23.2.1 [default] to 23.2.2 [default]
packages/core2-64-poky-linux/xwayland/xwayland-dbg: PKGSIZE changed from 11677976 to 11678448 (+0%)
packages/core2-64-poky-linux/xwayland/xwayland-dbg: PV changed from "23.2.1" to "23.2.2"
packages/core2-64-poky-linux/xwayland/xwayland-dev: PKGV changed from 23.2.1 [default] to 23.2.2 [default]
packages/core2-64-poky-linux/xwayland/xwayland-dev: PKGSIZE changed from 478 to 506 (+6%)
packages/core2-64-poky-linux/xwayland/xwayland-dev: PV changed from "23.2.1" to "23.2.2"
packages/core2-64-poky-linux/xwayland/xwayland-doc: PKGV changed from 23.2.1 [default] to 23.2.2 [default]
packages/core2-64-poky-linux/xwayland/xwayland-doc: PKGSIZE changed from 30269 to 30589 (+1%)
packages/core2-64-poky-linux/xwayland/xwayland-doc: PV changed from "23.2.1" to "23.2.2"
packages/core2-64-poky-linux/xwayland/xwayland-locale: PKGV changed from 23.2.1 [default] to 23.2.2 [default]
packages/core2-64-poky-linux/xwayland/xwayland-locale: PV changed from "23.2.1" to "23.2.2"
packages/core2-64-poky-linux/xwayland/xwayland-src: PKGV changed from 23.2.1 [default] to 23.2.2 [default]
packages/core2-64-poky-linux/xwayland/xwayland-src: PKGSIZE changed from 8750674 to 8751561 (+0%)
packages/core2-64-poky-linux/xwayland/xwayland-src: PV changed from "23.2.1" to "23.2.2"
packages/core2-64-poky-linux/xwayland/xwayland-staticdev: PKGV changed from 23.2.1 [default] to 23.2.2 [default]
packages/core2-64-poky-linux/xwayland/xwayland-staticdev: PV changed from "23.2.1" to "23.2.2"
packages/core2-64-poky-linux/xwayland/xwayland: PKGV changed from 23.2.1 [default] to 23.2.2 [default]
packages/core2-64-poky-linux/xwayland/xwayland: PV changed from "23.2.1" to "23.2.2"

--===============1694497206580095299==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xwayland-upgrade-23.2.1-23.2.2.patch"

RnJvbSBhZDBiNDgyNzIyODk5Mzc5ZTZjOTA1MTFjN2FjYzczZmI3MTM5NDdhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAxMzozMTozNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHh3
YXlsYW5kOiB1cGdyYWRlIDIzLjIuMSAtPiAyMy4yLjIKCi0tLQogLi4uL3h3YXlsYW5kL3t4d2F5
bGFuZF8yMy4yLjEuYmIgPT4geHdheWxhbmRfMjMuMi4yLmJifSAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3h3YXlsYW5kL3t4d2F5bGFuZF8yMy4yLjEuYmIgPT4geHdheWxhbmRf
MjMuMi4yLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94d2F5
bGFuZC94d2F5bGFuZF8yMy4yLjEuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdheWxhbmQv
eHdheWxhbmRfMjMuMi4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy94d2F5bGFuZC94d2F5bGFuZF8yMy4yLjEuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1ncmFwaGljcy94d2F5bGFuZC94d2F5bGFuZF8yMy4yLjIuYmIKaW5kZXggZTk3
YTkyMWE5Ni4uOWZlYWMxNDdkYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3h3
YXlsYW5kL3h3YXlsYW5kXzIzLjIuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdh
eWxhbmQveHdheWxhbmRfMjMuMi4yLmJiCkBAIC0xMCw3ICsxMCw3IEBAIExJQ0VOU0UgPSAiTUlU
IgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NWRmODc5NTBhZjUxYWMy
YzU4MjIwOTQ1NTNlYTE4ODAiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly93d3cueC5vcmcvYXJjaGl2
ZS9pbmRpdmlkdWFsL3hzZXJ2ZXIveHdheWxhbmQtJHtQVn0udGFyLnh6IgotU1JDX1VSSVtzaGEy
NTZzdW1dID0gImVlYmMyNjkyYzNhYTgwNjE3ZDc4NDI4YmM2ZWM3YjkxYjI1NGE5ODIxNGQyYTcw
ZTk5NzA5ODUwM2NkNmVmOTAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOWY3YzA5MzhkMmE0MWU5
NDFmZmEwNGY5OWMzNWU1ZGIyYmNkM2VlYzAzNGFmZThkMzVkNWM4MTBhMjJlYjBhOCIKIAogVVBT
VFJFQU1fQ0hFQ0tfUkVHRVggPSAieHdheWxhbmQtKD9QPHB2ZXI+XGQrKFwuKD8hOTBcZClcZCsp
KylcLnRhciIKIAotLSAKMi4zOS4yCgo=

--===============1694497206580095299==--

