Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB68AC4450A
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 05:42:17 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2333.1783489333251297195
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 22:42:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WxF6op2O;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=YBHj026U;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019f403f8405-747ed6f3-c53a-4363-8d66-77dab19ce424-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783489332;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=wx4NDb4pS74SGNfZDhIloNjwRzd+fGuizPn98wKYVmo=;
	b=WxF6op2OeXzCeh62ZDz9645/XIpNCyB/Gso43pfvOVteEkRvd02xXx4rpFwPAbo/
	/YnoA2V4nNUaunbNMQ8ZORblLJulhipuizwIBVIg6vZbxe82ELFSvXOjyc+nmqytqqH
	1c0rCBRDI8y5ejuVuwaAMf3PYaXq6T7kb2Rusl6I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783489332;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=wx4NDb4pS74SGNfZDhIloNjwRzd+fGuizPn98wKYVmo=;
	b=YBHj026Ur8vk7rz0bb4HNvCqFOvKvBzTXb9E3mK5Oy+/JEPrgbuNJmx8o9wAH72/
	qZhOerNZbqi53m95jfQPVCI/y5LpV++pqjwVx45uZr70HyF8xkBH1eCw8+SUdDNyioU
	RGcBsyMnNf5e7YKqu/IMPIeCVhXoJqetuVhEw3Ks=
Content-Type: multipart/mixed; boundary="===============4373053800585689490=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xwayland: upgrading to 24.1.13 SUCCEEDED
Message-ID: <0101019f403f8405-747ed6f3-c53a-4363-8d66-77dab19ce424-000000@us-west-2.amazonses.com>
Date: Wed, 8 Jul 2026 05:42:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.08-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 05:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240431

--===============4373053800585689490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xwayland* to *24.1.13* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xwayland-upgrade-24.1.12-24.1.13.patch
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
From f1fb87a389ef23a360a8a100b4e30d7306110097 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 8 Jul 2026 05:37:08 +0000
Subject: [PATCH] xwayland: upgrade 24.1.12 -> 24.1.13

---
 .../xwayland/{xwayland_24.1.12.bb => xwayland_24.1.13.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_24.1.12.bb => xwayland_24.1.13.bb} (96%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.12.bb b/meta/recipes-graphics/xwayland/xwayland_24.1.13.bb
similarity index 96%
rename from meta/recipes-graphics/xwayland/xwayland_24.1.12.bb
rename to meta/recipes-graphics/xwayland/xwayland_24.1.13.bb
index 52572bfd21..41bf1687a2 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.12.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.13.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT & Adobe-Display-PostScript & BSD-3-Clause & DEC-3-Clause & HPND &
 LIC_FILES_CHKSUM = "file://COPYING;md5=f8778cfcd90ece0e4b225f30182227ca"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "6df02c511b92c1b9848734d9d1b03a4c24f8375ba3cada44e9684a21b5f78e21"
+SRC_URI[sha256sum] = "173aea3d6f79609164c04528e1c8e4c9b60fcd59391c3c9dad4667297d727fb6"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.47.1


--===============4373053800585689490==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xwayland-upgrade-24.1.12-24.1.13.patch"

RnJvbSBmMWZiODdhMzg5ZWYyM2EzNjBhOGExMDBiNGUzMGQ3MzA2MTEwMDk3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgOCBKdWwgMjAyNiAwNTozNzowOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHh3
YXlsYW5kOiB1cGdyYWRlIDI0LjEuMTIgLT4gMjQuMS4xMwoKLS0tCiAuLi4veHdheWxhbmQve3h3
YXlsYW5kXzI0LjEuMTIuYmIgPT4geHdheWxhbmRfMjQuMS4xMy5iYn0gICAgICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZ3JhcGhpY3MveHdheWxhbmQve3h3YXlsYW5kXzI0LjEuMTIuYmIgPT4geHdheWxh
bmRfMjQuMS4xMy5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
eHdheWxhbmQveHdheWxhbmRfMjQuMS4xMi5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94d2F5
bGFuZC94d2F5bGFuZF8yNC4xLjEzLmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1ncmFwaGljcy94d2F5bGFuZC94d2F5bGFuZF8yNC4xLjEyLmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdheWxhbmQveHdheWxhbmRfMjQuMS4xMy5iYgpp
bmRleCA1MjU3MmJmZDIxLi40MWJmMTY4N2EyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MveHdheWxhbmQveHdheWxhbmRfMjQuMS4xMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MveHdheWxhbmQveHdheWxhbmRfMjQuMS4xMy5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNF
TlNFID0gIk1JVCAmIEFkb2JlLURpc3BsYXktUG9zdFNjcmlwdCAmIEJTRC0zLUNsYXVzZSAmIERF
Qy0zLUNsYXVzZSAmIEhQTkQgJgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORztt
ZDU9Zjg3NzhjZmNkOTBlY2UwZTRiMjI1ZjMwMTgyMjI3Y2EiCiAKIFNSQ19VUkkgPSAiaHR0cHM6
Ly93d3cueC5vcmcvYXJjaGl2ZS9pbmRpdmlkdWFsL3hzZXJ2ZXIveHdheWxhbmQtJHtQVn0udGFy
Lnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjZkZjAyYzUxMWI5MmMxYjk4NDg3MzRkOWQxYjAz
YTRjMjRmODM3NWJhM2NhZGE0NGU5Njg0YTIxYjVmNzhlMjEiCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiMTczYWVhM2Q2Zjc5NjA5MTY0YzA0NTI4ZTFjOGU0YzliNjBmY2Q1OTM5MWMzYzlkYWQ0NjY3
Mjk3ZDcyN2ZiNiIKIAogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAieHdheWxhbmQtKD9QPHB2ZXI+
XGQrKFwuKD8hOTBcZClcZCspKylcLnRhciIKIAotLSAKMi40Ny4xCgo=

--===============4373053800585689490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/xwayland: PV changed from "24.1.12" to "24.1.13"
packages/x86-64-v3-poky-linux/xwayland: SRC_URI changed from "https://www.x.org/archive/individual/xserver/xwayland-24.1.12.tar.xz" to "https://www.x.org/archive/individual/xserver/xwayland-24.1.13.tar.xz"
packages/x86-64-v3-poky-linux/xwayland: PKGV changed from 24.1.12 [default] to 24.1.13 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland-dbg: PV changed from "24.1.12" to "24.1.13"
packages/x86-64-v3-poky-linux/xwayland/xwayland-dbg: PKGV changed from 24.1.12 [default] to 24.1.13 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland-dbg: PKGSIZE changed from 12744880 to 12745488 (+0%)
packages/x86-64-v3-poky-linux/xwayland/xwayland-dev: PV changed from "24.1.12" to "24.1.13"
packages/x86-64-v3-poky-linux/xwayland/xwayland-dev: PKGV changed from 24.1.12 [default] to 24.1.13 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland-doc: PV changed from "24.1.12" to "24.1.13"
packages/x86-64-v3-poky-linux/xwayland/xwayland-doc: PKGV changed from 24.1.12 [default] to 24.1.13 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland-locale: PV changed from "24.1.12" to "24.1.13"
packages/x86-64-v3-poky-linux/xwayland/xwayland-locale: PKGV changed from 24.1.12 [default] to 24.1.13 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland-src: PV changed from "24.1.12" to "24.1.13"
packages/x86-64-v3-poky-linux/xwayland/xwayland-src: PKGV changed from 24.1.12 [default] to 24.1.13 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland-src: FILELIST: directory renamed /usr/src/debug/xwayland/24.1.12/miext/sync -> /usr/src/debug/xwayland/24.1.13/miext/sync, directory renamed /usr/src/debug/xwayland/24.1.12/mi -> /usr/src/debug/xwayland/24.1.13/mi, directory renamed /usr/src/debug/xwayland/24.1.12/miext/damage -> /usr/src/debug/xwayland/24.1.13/miext/damage, directory renamed /usr/src/debug/xwayland/24.1.12/xkb -> /usr/src/debug/xwayland/24.1.13/xkb, directory renamed /usr/src/debug/xwayland/24.1.12/os -> /usr/src/debug/xwayland/24.1.13/os, directory renamed /usr/src/debug/xwayland/24.1.12/record -> /usr/src/debug/xwayland/24.1.13/record, directory renamed /usr/src/debug/xwayland/24.1.12/fb -> /usr/src/debug/xwayland/24.1.13/fb, directory renamed /usr/src/debug/xwayland/24.1.12/hw/xwayland -> /usr/src/debug/xwayland/24.1.13/hw/xwayland, directory renamed /usr/src/debug/xwayland/24.1.12/xfixes -> /usr/src/debug/xwayland/24.1.13/xfixes, directory renamed /usr/src/debug/xw
 ayland/24.1.12/present -> /usr/src/debug/xwayland/24.1.13/present, directory renamed /usr/src/debug/xwayland/24.1.12/glamor -> /usr/src/debug/xwayland/24.1.13/glamor, directory renamed /usr/src/debug/xwayland/24.1.12/dix -> /usr/src/debug/xwayland/24.1.13/dix, directory renamed /usr/src/debug/xwayland/24.1.12/damageext -> /usr/src/debug/xwayland/24.1.13/damageext, directory renamed /usr/src/debug/xwayland/24.1.12/randr -> /usr/src/debug/xwayland/24.1.13/randr, directory renamed /usr/src/debug/xwayland/24.1.12/Xi -> /usr/src/debug/xwayland/24.1.13/Xi, directory renamed /usr/src/debug/xwayland/24.1.12/composite -> /usr/src/debug/xwayland/24.1.13/composite, directory renamed /usr/src/debug/xwayland/24.1.12/dri3 -> /usr/src/debug/xwayland/24.1.13/dri3, directory renamed /usr/src/debug/xwayland/24.1.12/glx -> /usr/src/debug/xwayland/24.1.13/glx, directory renamed /usr/src/debug/xwayland/24.1.12/include -> /usr/src/debug/xwayland/24.1.13/include, directory renamed /usr/src/debug/xwayland/
 24.1.12/dbe -> /usr/src/debug/xwayland/24.1.13/dbe, directory renamed /usr/src/debug/xwayland/24.1.12/render -> /usr/src/debug/xwayland/24.1.13/render, directory renamed /usr/src/debug/xwayland/24.1.12/Xext -> /usr/src/debug/xwayland/24.1.13/Xext, directory renamed /usr/src/debug/xwayland/24.1.12/hw/xwayland/Xwayland.p -> /usr/src/debug/xwayland/24.1.13/hw/xwayland/Xwayland.p
packages/x86-64-v3-poky-linux/xwayland/xwayland-src: PKGSIZE changed from 8912191 to 8913900 (+0%)
packages/x86-64-v3-poky-linux/xwayland/xwayland-staticdev: PV changed from "24.1.12" to "24.1.13"
packages/x86-64-v3-poky-linux/xwayland/xwayland-staticdev: PKGV changed from 24.1.12 [default] to 24.1.13 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland: PV changed from "24.1.12" to "24.1.13"
packages/x86-64-v3-poky-linux/xwayland/xwayland: PKGV changed from 24.1.12 [default] to 24.1.13 [default]

--===============4373053800585689490==--

