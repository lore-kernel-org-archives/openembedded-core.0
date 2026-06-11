Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9842DCDE010
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:32:10 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50609.1781195500092651335
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=uSO4t44J;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=eNKPFiLI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019eb786b43b-8d7278c2-6c90-426c-b8aa-02a3ac1bfe20-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195519;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7zTVPJfQpttSYOKKN/4n1sj2ByojfNFC4xa1GBblHHU=;
	b=uSO4t44J+n9IsKmcIA664Gd2mJOo8WwPQNkoOvh6xdRCVWYdgyF7VZ3jGJ1vc7xa
	JK/r07L8M7ZQK02u6Oy0wmizXzs3uwTiATHCp9X5q4mhe8Ns88+da3LeoH1c58Ycu7o
	CoPLJ8Z6cn/SpuTY0ghRXhnKHhmfZaTwoG8GpR1Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195519;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7zTVPJfQpttSYOKKN/4n1sj2ByojfNFC4xa1GBblHHU=;
	b=eNKPFiLIGiuRFv5zwnKpF3pz9tjQMJZe7gNlSR2r05vVMkcPa4usbvqUQQmpbZo3
	ki91mp+YLlQ/s0CIMJdvGC84Bn7rkKll6QvsQSOX57TwDs7QQovdrk901Ifb7ejS9pT
	oIEomq4rk9cpYEo/8BQqNv1zN3NEMK8uF4em5Sgg=
Content-Type: multipart/mixed; boundary="===============5673641702670979251=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] xwayland: upgrading to 24.1.12 SUCCEEDED
Message-ID: <0101019eb786b43b-8d7278c2-6c90-426c-b8aa-02a3ac1bfe20-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:32:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238548

--===============5673641702670979251==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xwayland* to *24.1.12* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xwayland-upgrade-24.1.11-24.1.12.patch
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
From 034c1ded928410df80c35c976a9d828d6c11fbea Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 13:26:18 +0000
Subject: [PATCH] xwayland: upgrade 24.1.11 -> 24.1.12

---
 .../xwayland/{xwayland_24.1.11.bb => xwayland_24.1.12.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_24.1.11.bb => xwayland_24.1.12.bb} (96%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb b/meta/recipes-graphics/xwayland/xwayland_24.1.12.bb
similarity index 96%
rename from meta/recipes-graphics/xwayland/xwayland_24.1.11.bb
rename to meta/recipes-graphics/xwayland/xwayland_24.1.12.bb
index eabf66ffec..52572bfd21 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.12.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT & Adobe-Display-PostScript & BSD-3-Clause & DEC-3-Clause & HPND &
 LIC_FILES_CHKSUM = "file://COPYING;md5=f8778cfcd90ece0e4b225f30182227ca"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "27115a1a8819078409bf6fecfeb7724e8137bd36426de7005a5b3aae0a2138ff"
+SRC_URI[sha256sum] = "6df02c511b92c1b9848734d9d1b03a4c24f8375ba3cada44e9684a21b5f78e21"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.47.1


--===============5673641702670979251==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/xwayland: PKGV changed from 24.1.11 [default] to 24.1.12 [default]
packages/x86-64-v3-poky-linux/xwayland: SRC_URI changed from "https://www.x.org/archive/individual/xserver/xwayland-24.1.11.tar.xz" to "https://www.x.org/archive/individual/xserver/xwayland-24.1.12.tar.xz"
packages/x86-64-v3-poky-linux/xwayland: PV changed from "24.1.11" to "24.1.12"
packages/x86-64-v3-poky-linux/xwayland/xwayland-dbg: PKGSIZE changed from 12742976 to 12744872 (+0%)
packages/x86-64-v3-poky-linux/xwayland/xwayland-dbg: PKGV changed from 24.1.11 [default] to 24.1.12 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland-dbg: PV changed from "24.1.11" to "24.1.12"
packages/x86-64-v3-poky-linux/xwayland/xwayland-dev: PKGV changed from 24.1.11 [default] to 24.1.12 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland-dev: PV changed from "24.1.11" to "24.1.12"
packages/x86-64-v3-poky-linux/xwayland/xwayland-doc: PKGV changed from 24.1.11 [default] to 24.1.12 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland-doc: PV changed from "24.1.11" to "24.1.12"
packages/x86-64-v3-poky-linux/xwayland/xwayland-locale: PKGV changed from 24.1.11 [default] to 24.1.12 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland-locale: PV changed from "24.1.11" to "24.1.12"
packages/x86-64-v3-poky-linux/xwayland/xwayland-src: PKGSIZE changed from 8908064 to 8911800 (+0%)
packages/x86-64-v3-poky-linux/xwayland/xwayland-src: FILELIST: directory renamed /usr/src/debug/xwayland/24.1.11/dix -> /usr/src/debug/xwayland/24.1.12/dix, directory renamed /usr/src/debug/xwayland/24.1.11/miext/sync -> /usr/src/debug/xwayland/24.1.12/miext/sync, directory renamed /usr/src/debug/xwayland/24.1.11/hw/xwayland/Xwayland.p -> /usr/src/debug/xwayland/24.1.12/hw/xwayland/Xwayland.p, directory renamed /usr/src/debug/xwayland/24.1.11/composite -> /usr/src/debug/xwayland/24.1.12/composite, directory renamed /usr/src/debug/xwayland/24.1.11/randr -> /usr/src/debug/xwayland/24.1.12/randr, directory renamed /usr/src/debug/xwayland/24.1.11/xkb -> /usr/src/debug/xwayland/24.1.12/xkb, directory renamed /usr/src/debug/xwayland/24.1.11/hw/xwayland -> /usr/src/debug/xwayland/24.1.12/hw/xwayland, directory renamed /usr/src/debug/xwayland/24.1.11/Xext -> /usr/src/debug/xwayland/24.1.12/Xext, directory renamed /usr/src/debug/xwayland/24.1.11/dri3 -> /usr/src/debug/xwayland/24.1.12/dri3, d
 irectory renamed /usr/src/debug/xwayland/24.1.11/Xi -> /usr/src/debug/xwayland/24.1.12/Xi, directory renamed /usr/src/debug/xwayland/24.1.11/record -> /usr/src/debug/xwayland/24.1.12/record, directory renamed /usr/src/debug/xwayland/24.1.11/fb -> /usr/src/debug/xwayland/24.1.12/fb, directory renamed /usr/src/debug/xwayland/24.1.11/include -> /usr/src/debug/xwayland/24.1.12/include, directory renamed /usr/src/debug/xwayland/24.1.11/damageext -> /usr/src/debug/xwayland/24.1.12/damageext, directory renamed /usr/src/debug/xwayland/24.1.11/xfixes -> /usr/src/debug/xwayland/24.1.12/xfixes, directory renamed /usr/src/debug/xwayland/24.1.11/dbe -> /usr/src/debug/xwayland/24.1.12/dbe, directory renamed /usr/src/debug/xwayland/24.1.11/glx -> /usr/src/debug/xwayland/24.1.12/glx, directory renamed /usr/src/debug/xwayland/24.1.11/glamor -> /usr/src/debug/xwayland/24.1.12/glamor, directory renamed /usr/src/debug/xwayland/24.1.11/render -> /usr/src/debug/xwayland/24.1.12/render, directory renamed 
 /usr/src/debug/xwayland/24.1.11/os -> /usr/src/debug/xwayland/24.1.12/os, directory renamed /usr/src/debug/xwayland/24.1.11/mi -> /usr/src/debug/xwayland/24.1.12/mi, directory renamed /usr/src/debug/xwayland/24.1.11/present -> /usr/src/debug/xwayland/24.1.12/present, directory renamed /usr/src/debug/xwayland/24.1.11/miext/damage -> /usr/src/debug/xwayland/24.1.12/miext/damage
packages/x86-64-v3-poky-linux/xwayland/xwayland-src: PKGV changed from 24.1.11 [default] to 24.1.12 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland-src: PV changed from "24.1.11" to "24.1.12"
packages/x86-64-v3-poky-linux/xwayland/xwayland-staticdev: PKGV changed from 24.1.11 [default] to 24.1.12 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland-staticdev: PV changed from "24.1.11" to "24.1.12"
packages/x86-64-v3-poky-linux/xwayland/xwayland: PKGV changed from 24.1.11 [default] to 24.1.12 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland: PV changed from "24.1.11" to "24.1.12"

--===============5673641702670979251==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xwayland-upgrade-24.1.11-24.1.12.patch"

RnJvbSAwMzRjMWRlZDkyODQxMGRmODBjMzVjOTc2YTlkODI4ZDZjMTFmYmVhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTM6MjY6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
d2F5bGFuZDogdXBncmFkZSAyNC4xLjExIC0+IDI0LjEuMTIKCi0tLQogLi4uL3h3YXlsYW5kL3t4
d2F5bGFuZF8yNC4xLjExLmJiID0+IHh3YXlsYW5kXzI0LjEuMTIuYmJ9ICAgICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3h3YXlsYW5kL3t4d2F5bGFuZF8yNC4xLjExLmJiID0+IHh3YXls
YW5kXzI0LjEuMTIuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3h3YXlsYW5kL3h3YXlsYW5kXzI0LjEuMTEuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdh
eWxhbmQveHdheWxhbmRfMjQuMS4xMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdheWxhbmQveHdheWxhbmRfMjQuMS4xMS5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3h3YXlsYW5kL3h3YXlsYW5kXzI0LjEuMTIuYmIK
aW5kZXggZWFiZjY2ZmZlYy4uNTI1NzJiZmQyMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3h3YXlsYW5kL3h3YXlsYW5kXzI0LjEuMTEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3h3YXlsYW5kL3h3YXlsYW5kXzI0LjEuMTIuYmIKQEAgLTEwLDcgKzEwLDcgQEAgTElD
RU5TRSA9ICJNSVQgJiBBZG9iZS1EaXNwbGF5LVBvc3RTY3JpcHQgJiBCU0QtMy1DbGF1c2UgJiBE
RUMtMy1DbGF1c2UgJiBIUE5EICYKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7
bWQ1PWY4Nzc4Y2ZjZDkwZWNlMGU0YjIyNWYzMDE4MjIyN2NhIgogCiBTUkNfVVJJID0gImh0dHBz
Oi8vd3d3Lngub3JnL2FyY2hpdmUvaW5kaXZpZHVhbC94c2VydmVyL3h3YXlsYW5kLSR7UFZ9LnRh
ci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyNzExNWExYTg4MTkwNzg0MDliZjZmZWNmZWI3
NzI0ZTgxMzdiZDM2NDI2ZGU3MDA1YTViM2FhZTBhMjEzOGZmIgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjZkZjAyYzUxMWI5MmMxYjk4NDg3MzRkOWQxYjAzYTRjMjRmODM3NWJhM2NhZGE0NGU5Njg0
YTIxYjVmNzhlMjEiCiAKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gInh3YXlsYW5kLSg/UDxwdmVy
PlxkKyhcLig/ITkwXGQpXGQrKSspXC50YXIiCiAKLS0gCjIuNDcuMQoK

--===============5673641702670979251==--

