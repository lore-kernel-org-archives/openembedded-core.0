Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 792F1CA6004
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 05:48:43 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1964.1791352120807215848
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 22:48:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=hzEzp44e;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=EcirNszj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a114e82283-3d507dd1-990e-453f-8ea9-ce178cf6bd8f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791352120;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=Ale+ZkrQtEqs+ytXvHPykR6EnGgGx0Mybngj8jPZmSY=;
	b=hzEzp44ebQrNUiDZsKHuddms9GOFCMm5/Y3sDZErDv/3DfJkZ7+0jz1w+Bne7cMn
	lsr3voTywhchtjXKvpNYNd55TG8b5Q5ZgMsg3zIoZjmRzrfoHJYoDA5L0elQnnWy/JT
	NyTBPBZtA5OfBcmFag3KVFVPZbmmGm0GetiyjFVU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791352120;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=Ale+ZkrQtEqs+ytXvHPykR6EnGgGx0Mybngj8jPZmSY=;
	b=EcirNszjHjvWh484ga2HG0tNnrjtzHzsG+gIiohpjDfHWuFGiGl8ZyWrBhIJ4PFQ
	SfJ7tNqXUMkIafIHPKgAsNC0s4ChT0yMD1Ih0ysgq/VVbUzafL4hvPww2hCCKhTMAQX
	i7RXjfPyCDb9W1+KcKv6I6jFrzJEByQR5Td3pbUs=
Content-Type: multipart/mixed; boundary="===============0639986985400204007=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xwayland: upgrading to 24.1.14 SUCCEEDED
Message-ID: <010101a114e82283-3d507dd1-990e-453f-8ea9-ce178cf6bd8f-000000@us-west-2.amazonses.com>
Date: Wed, 7 Oct 2026 05:48:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.07-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 05:48:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247365

--===============0639986985400204007==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xwayland* to *24.1.14* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xwayland-upgrade-24.1.13-24.1.14.patch
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
From 99959fefbecae5e9c4696668b3e8172792e8c2af Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 7 Oct 2026 05:48:33 +0000
Subject: [PATCH] xwayland: upgrade 24.1.13 -> 24.1.14

---
 .../xwayland/{xwayland_24.1.13.bb => xwayland_24.1.14.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_24.1.13.bb => xwayland_24.1.14.bb} (96%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.13.bb b/meta/recipes-graphics/xwayland/xwayland_24.1.14.bb
similarity index 96%
rename from meta/recipes-graphics/xwayland/xwayland_24.1.13.bb
rename to meta/recipes-graphics/xwayland/xwayland_24.1.14.bb
index 1f32177ec5..41c5144783 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.13.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.14.bb
@@ -10,7 +10,7 @@ LICENSE = "Adobe-Display-PostScript AND BSD-3-Clause AND DEC-3-Clause AND HPND A
 LIC_FILES_CHKSUM = "file://COPYING;md5=f8778cfcd90ece0e4b225f30182227ca"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "173aea3d6f79609164c04528e1c8e4c9b60fcd59391c3c9dad4667297d727fb6"
+SRC_URI[sha256sum] = "4eb6b98d678299a4b96138d886345b294130695760345ef84596225a8224078a"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.47.1


--===============0639986985400204007==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xwayland-upgrade-24.1.13-24.1.14.patch"

RnJvbSA5OTk1OWZlZmJlY2FlNWU5YzQ2OTY2NjhiM2U4MTcyNzkyZThjMmFmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNyBPY3QgMjAyNiAwNTo0ODozMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHh3
YXlsYW5kOiB1cGdyYWRlIDI0LjEuMTMgLT4gMjQuMS4xNAoKLS0tCiAuLi4veHdheWxhbmQve3h3
YXlsYW5kXzI0LjEuMTMuYmIgPT4geHdheWxhbmRfMjQuMS4xNC5iYn0gICAgICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZ3JhcGhpY3MveHdheWxhbmQve3h3YXlsYW5kXzI0LjEuMTMuYmIgPT4geHdheWxh
bmRfMjQuMS4xNC5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
eHdheWxhbmQveHdheWxhbmRfMjQuMS4xMy5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94d2F5
bGFuZC94d2F5bGFuZF8yNC4xLjE0LmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1ncmFwaGljcy94d2F5bGFuZC94d2F5bGFuZF8yNC4xLjEzLmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdheWxhbmQveHdheWxhbmRfMjQuMS4xNC5iYgpp
bmRleCAxZjMyMTc3ZWM1Li40MWM1MTQ0NzgzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MveHdheWxhbmQveHdheWxhbmRfMjQuMS4xMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MveHdheWxhbmQveHdheWxhbmRfMjQuMS4xNC5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNF
TlNFID0gIkFkb2JlLURpc3BsYXktUG9zdFNjcmlwdCBBTkQgQlNELTMtQ2xhdXNlIEFORCBERUMt
My1DbGF1c2UgQU5EIEhQTkQgQQogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORztt
ZDU9Zjg3NzhjZmNkOTBlY2UwZTRiMjI1ZjMwMTgyMjI3Y2EiCiAKIFNSQ19VUkkgPSAiaHR0cHM6
Ly93d3cueC5vcmcvYXJjaGl2ZS9pbmRpdmlkdWFsL3hzZXJ2ZXIveHdheWxhbmQtJHtQVn0udGFy
Lnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjE3M2FlYTNkNmY3OTYwOTE2NGMwNDUyOGUxYzhl
NGM5YjYwZmNkNTkzOTFjM2M5ZGFkNDY2NzI5N2Q3MjdmYjYiCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiNGViNmI5OGQ2NzgyOTlhNGI5NjEzOGQ4ODYzNDViMjk0MTMwNjk1NzYwMzQ1ZWY4NDU5NjIy
NWE4MjI0MDc4YSIKIAogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAieHdheWxhbmQtKD9QPHB2ZXI+
XGQrKFwuKD8hOTBcZClcZCspKylcLnRhciIKIAotLSAKMi40Ny4xCgo=

--===============0639986985400204007==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/xwayland: PV changed from "24.1.13" to "24.1.14"
packages/x86-64-v3-poky-linux/xwayland: SRC_URI changed from "https://www.x.org/archive/individual/xserver/xwayland-24.1.13.tar.xz" to "https://www.x.org/archive/individual/xserver/xwayland-24.1.14.tar.xz"
packages/x86-64-v3-poky-linux/xwayland: PKGV changed from 24.1.13 [default] to 24.1.14 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland-dbg: PKGSIZE changed from 12743104 to 12746096 (+0%)
packages/x86-64-v3-poky-linux/xwayland/xwayland-dbg: PV changed from "24.1.13" to "24.1.14"
packages/x86-64-v3-poky-linux/xwayland/xwayland-dbg: PKGV changed from 24.1.13 [default] to 24.1.14 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland-dev: PV changed from "24.1.13" to "24.1.14"
packages/x86-64-v3-poky-linux/xwayland/xwayland-dev: PKGV changed from 24.1.13 [default] to 24.1.14 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland-doc: PV changed from "24.1.13" to "24.1.14"
packages/x86-64-v3-poky-linux/xwayland/xwayland-doc: PKGV changed from 24.1.13 [default] to 24.1.14 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland-locale: PV changed from "24.1.13" to "24.1.14"
packages/x86-64-v3-poky-linux/xwayland/xwayland-locale: PKGV changed from 24.1.13 [default] to 24.1.14 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland-src: PKGSIZE changed from 8916839 to 8922698 (+0%)
packages/x86-64-v3-poky-linux/xwayland/xwayland-src: PV changed from "24.1.13" to "24.1.14"
packages/x86-64-v3-poky-linux/xwayland/xwayland-src: FILELIST: directory renamed /usr/src/debug/xwayland/24.1.13/render -> /usr/src/debug/xwayland/24.1.14/render, directory renamed /usr/src/debug/xwayland/24.1.13/os -> /usr/src/debug/xwayland/24.1.14/os, directory renamed /usr/src/debug/xwayland/24.1.13/hw/xwayland/Xwayland.p -> /usr/src/debug/xwayland/24.1.14/hw/xwayland/Xwayland.p, directory renamed /usr/src/debug/xwayland/24.1.13/Xi -> /usr/src/debug/xwayland/24.1.14/Xi, directory renamed /usr/src/debug/xwayland/24.1.13/mi -> /usr/src/debug/xwayland/24.1.14/mi, directory renamed /usr/src/debug/xwayland/24.1.13/present -> /usr/src/debug/xwayland/24.1.14/present, directory renamed /usr/src/debug/xwayland/24.1.13/xfixes -> /usr/src/debug/xwayland/24.1.14/xfixes, directory renamed /usr/src/debug/xwayland/24.1.13/Xext -> /usr/src/debug/xwayland/24.1.14/Xext, directory renamed /usr/src/debug/xwayland/24.1.13/glamor -> /usr/src/debug/xwayland/24.1.14/glamor, directory renamed /usr/src/de
 bug/xwayland/24.1.13/miext/damage -> /usr/src/debug/xwayland/24.1.14/miext/damage, directory renamed /usr/src/debug/xwayland/24.1.13/record -> /usr/src/debug/xwayland/24.1.14/record, directory renamed /usr/src/debug/xwayland/24.1.13/fb -> /usr/src/debug/xwayland/24.1.14/fb, directory renamed /usr/src/debug/xwayland/24.1.13/damageext -> /usr/src/debug/xwayland/24.1.14/damageext, directory renamed /usr/src/debug/xwayland/24.1.13/include -> /usr/src/debug/xwayland/24.1.14/include, directory renamed /usr/src/debug/xwayland/24.1.13/glx -> /usr/src/debug/xwayland/24.1.14/glx, directory renamed /usr/src/debug/xwayland/24.1.13/hw/xwayland -> /usr/src/debug/xwayland/24.1.14/hw/xwayland, directory renamed /usr/src/debug/xwayland/24.1.13/dix -> /usr/src/debug/xwayland/24.1.14/dix, directory renamed /usr/src/debug/xwayland/24.1.13/xkb -> /usr/src/debug/xwayland/24.1.14/xkb, directory renamed /usr/src/debug/xwayland/24.1.13/dbe -> /usr/src/debug/xwayland/24.1.14/dbe, directory renamed /usr/src/d
 ebug/xwayland/24.1.13/miext/sync -> /usr/src/debug/xwayland/24.1.14/miext/sync, directory renamed /usr/src/debug/xwayland/24.1.13/dri3 -> /usr/src/debug/xwayland/24.1.14/dri3, directory renamed /usr/src/debug/xwayland/24.1.13/randr -> /usr/src/debug/xwayland/24.1.14/randr, directory renamed /usr/src/debug/xwayland/24.1.13/composite -> /usr/src/debug/xwayland/24.1.14/composite
packages/x86-64-v3-poky-linux/xwayland/xwayland-src: PKGV changed from 24.1.13 [default] to 24.1.14 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland-staticdev: PV changed from "24.1.13" to "24.1.14"
packages/x86-64-v3-poky-linux/xwayland/xwayland-staticdev: PKGV changed from 24.1.13 [default] to 24.1.14 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland: PKGSIZE changed from 2456163 to 2460259 (+0%)
packages/x86-64-v3-poky-linux/xwayland/xwayland: PV changed from "24.1.13" to "24.1.14"
packages/x86-64-v3-poky-linux/xwayland/xwayland: PKGV changed from 24.1.13 [default] to 24.1.14 [default]

--===============0639986985400204007==--

