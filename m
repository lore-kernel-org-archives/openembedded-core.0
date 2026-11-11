Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3802.1794377113394590493
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 22:05:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Zv6BKiNU;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=URNFJbZj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a1c935dbd9-4e2ee062-0ed2-41b9-a3d1-1dbcc1565731-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794377112;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=q8iQrp+sZ2ordx2HdxotN1TUqALN3ECSoB668SA8Y+U=;
	b=Zv6BKiNU4uJ2mrQJ1w5kDveGVThqIKa3WOaF8gKe/+RqKLptgJpUcRPq3pqNB4j/
	DTiXje6h1nN0AatDjg5yPtmHCv634jjhyuoB2W6pXwP9eCuz2Utultnd+0rcfP8E+Hp
	JgK5kDcuIjvvZoR/2CAvqDnSThxUDgmHMlyZ2/u8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794377112;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=q8iQrp+sZ2ordx2HdxotN1TUqALN3ECSoB668SA8Y+U=;
	b=URNFJbZjnt7p5nQCLHa3BeYmLEIU8UxTTcipymHrbCHNwDR35DgRBHrYEzKBaqQi
	EvcDfXkVlfCrGvqB/Ew9OUcldpRqC45lIIT8z7O6TtM0HhdDgFlACgfrOtS/z4ogyIA
	dp/LgKvT0CIVlPiFvAr1av8awImTyIc0nFbXsjZI=
Content-Type: multipart/mixed; boundary="===============3011775208704240213=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xwayland: upgrading to 24.1.15 SUCCEEDED
Message-ID: <010101a1c935dbd9-4e2ee062-0ed2-41b9-a3d1-1dbcc1565731-000000@us-west-2.amazonses.com>
Date: Wed, 11 Nov 2026 06:05:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.11-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 06:05:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249961

--===============3011775208704240213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xwayland* to *24.1.15* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xwayland-upgrade-24.1.13-24.1.15.patch
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
From 24fc348949ec684a20393e59250e78170db7c5a7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 11 Nov 2026 05:54:44 +0000
Subject: [PATCH] xwayland: upgrade 24.1.13 -> 24.1.15

---
 .../xwayland/{xwayland_24.1.13.bb => xwayland_24.1.15.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_24.1.13.bb => xwayland_24.1.15.bb} (96%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.13.bb b/meta/recipes-graphics/xwayland/xwayland_24.1.15.bb
similarity index 96%
rename from meta/recipes-graphics/xwayland/xwayland_24.1.13.bb
rename to meta/recipes-graphics/xwayland/xwayland_24.1.15.bb
index 1f32177ec5..0bf8866457 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.13.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.15.bb
@@ -10,7 +10,7 @@ LICENSE = "Adobe-Display-PostScript AND BSD-3-Clause AND DEC-3-Clause AND HPND A
 LIC_FILES_CHKSUM = "file://COPYING;md5=f8778cfcd90ece0e4b225f30182227ca"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "173aea3d6f79609164c04528e1c8e4c9b60fcd59391c3c9dad4667297d727fb6"
+SRC_URI[sha256sum] = "7311b4bcda22cfc19cb99680eb1c35cfc1ea885981310639f0429fe2948c122e"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.47.1


--===============3011775208704240213==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xwayland-upgrade-24.1.13-24.1.15.patch"

RnJvbSAyNGZjMzQ4OTQ5ZWM2ODRhMjAzOTNlNTkyNTBlNzgxNzBkYjdjNWE3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTEgTm92IDIwMjYgMDU6NTQ6NDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
d2F5bGFuZDogdXBncmFkZSAyNC4xLjEzIC0+IDI0LjEuMTUKCi0tLQogLi4uL3h3YXlsYW5kL3t4
d2F5bGFuZF8yNC4xLjEzLmJiID0+IHh3YXlsYW5kXzI0LjEuMTUuYmJ9ICAgICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3h3YXlsYW5kL3t4d2F5bGFuZF8yNC4xLjEzLmJiID0+IHh3YXls
YW5kXzI0LjEuMTUuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3h3YXlsYW5kL3h3YXlsYW5kXzI0LjEuMTMuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdh
eWxhbmQveHdheWxhbmRfMjQuMS4xNS5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdheWxhbmQveHdheWxhbmRfMjQuMS4xMy5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3h3YXlsYW5kL3h3YXlsYW5kXzI0LjEuMTUuYmIK
aW5kZXggMWYzMjE3N2VjNS4uMGJmODg2NjQ1NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3h3YXlsYW5kL3h3YXlsYW5kXzI0LjEuMTMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3h3YXlsYW5kL3h3YXlsYW5kXzI0LjEuMTUuYmIKQEAgLTEwLDcgKzEwLDcgQEAgTElD
RU5TRSA9ICJBZG9iZS1EaXNwbGF5LVBvc3RTY3JpcHQgQU5EIEJTRC0zLUNsYXVzZSBBTkQgREVD
LTMtQ2xhdXNlIEFORCBIUE5EIEEKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7
bWQ1PWY4Nzc4Y2ZjZDkwZWNlMGU0YjIyNWYzMDE4MjIyN2NhIgogCiBTUkNfVVJJID0gImh0dHBz
Oi8vd3d3Lngub3JnL2FyY2hpdmUvaW5kaXZpZHVhbC94c2VydmVyL3h3YXlsYW5kLSR7UFZ9LnRh
ci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIxNzNhZWEzZDZmNzk2MDkxNjRjMDQ1MjhlMWM4
ZTRjOWI2MGZjZDU5MzkxYzNjOWRhZDQ2NjcyOTdkNzI3ZmI2IgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjczMTFiNGJjZGEyMmNmYzE5Y2I5OTY4MGViMWMzNWNmYzFlYTg4NTk4MTMxMDYzOWYwNDI5
ZmUyOTQ4YzEyMmUiCiAKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gInh3YXlsYW5kLSg/UDxwdmVy
PlxkKyhcLig/ITkwXGQpXGQrKSspXC50YXIiCiAKLS0gCjIuNDcuMQoK

--===============3011775208704240213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/xwayland: SRC_URI changed from "https://www.x.org/archive/individual/xserver/xwayland-24.1.13.tar.xz" to "https://www.x.org/archive/individual/xserver/xwayland-24.1.15.tar.xz"
packages/x86-64-v3-poky-linux/xwayland: PKGV changed from 24.1.13 [default] to 24.1.15 [default]
packages/x86-64-v3-poky-linux/xwayland: PV changed from "24.1.13" to "24.1.15"
packages/x86-64-v3-poky-linux/xwayland/xwayland-dbg: PKGV changed from 24.1.13 [default] to 24.1.15 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland-dbg: PKGSIZE changed from 12743104 to 12746192 (+0%)
packages/x86-64-v3-poky-linux/xwayland/xwayland-dbg: PV changed from "24.1.13" to "24.1.15"
packages/x86-64-v3-poky-linux/xwayland/xwayland-dev: PKGV changed from 24.1.13 [default] to 24.1.15 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland-dev: PV changed from "24.1.13" to "24.1.15"
packages/x86-64-v3-poky-linux/xwayland/xwayland-doc: PKGV changed from 24.1.13 [default] to 24.1.15 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland-doc: PV changed from "24.1.13" to "24.1.15"
packages/x86-64-v3-poky-linux/xwayland/xwayland-locale: PKGV changed from 24.1.13 [default] to 24.1.15 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland-locale: PV changed from "24.1.13" to "24.1.15"
packages/x86-64-v3-poky-linux/xwayland/xwayland-src: PKGV changed from 24.1.13 [default] to 24.1.15 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland-src: FILELIST: directory renamed /usr/src/debug/xwayland/24.1.13/Xext -> /usr/src/debug/xwayland/24.1.15/Xext, directory renamed /usr/src/debug/xwayland/24.1.13/present -> /usr/src/debug/xwayland/24.1.15/present, directory renamed /usr/src/debug/xwayland/24.1.13/miext/damage -> /usr/src/debug/xwayland/24.1.15/miext/damage, directory renamed /usr/src/debug/xwayland/24.1.13/Xi -> /usr/src/debug/xwayland/24.1.15/Xi, directory renamed /usr/src/debug/xwayland/24.1.13/dbe -> /usr/src/debug/xwayland/24.1.15/dbe, directory renamed /usr/src/debug/xwayland/24.1.13/glamor -> /usr/src/debug/xwayland/24.1.15/glamor, directory renamed /usr/src/debug/xwayland/24.1.13/record -> /usr/src/debug/xwayland/24.1.15/record, directory renamed /usr/src/debug/xwayland/24.1.13/hw/xwayland -> /usr/src/debug/xwayland/24.1.15/hw/xwayland, directory renamed /usr/src/debug/xwayland/24.1.13/hw/xwayland/Xwayland.p -> /usr/src/debug/xwayland/24.1.15/hw/xwayland/Xwayland.
 p, directory renamed /usr/src/debug/xwayland/24.1.13/damageext -> /usr/src/debug/xwayland/24.1.15/damageext, directory renamed /usr/src/debug/xwayland/24.1.13/dix -> /usr/src/debug/xwayland/24.1.15/dix, directory renamed /usr/src/debug/xwayland/24.1.13/dri3 -> /usr/src/debug/xwayland/24.1.15/dri3, directory renamed /usr/src/debug/xwayland/24.1.13/include -> /usr/src/debug/xwayland/24.1.15/include, directory renamed /usr/src/debug/xwayland/24.1.13/fb -> /usr/src/debug/xwayland/24.1.15/fb, directory renamed /usr/src/debug/xwayland/24.1.13/randr -> /usr/src/debug/xwayland/24.1.15/randr, directory renamed /usr/src/debug/xwayland/24.1.13/xfixes -> /usr/src/debug/xwayland/24.1.15/xfixes, directory renamed /usr/src/debug/xwayland/24.1.13/mi -> /usr/src/debug/xwayland/24.1.15/mi, directory renamed /usr/src/debug/xwayland/24.1.13/miext/sync -> /usr/src/debug/xwayland/24.1.15/miext/sync, directory renamed /usr/src/debug/xwayland/24.1.13/render -> /usr/src/debug/xwayland/24.1.15/render, direct
 ory renamed /usr/src/debug/xwayland/24.1.13/glx -> /usr/src/debug/xwayland/24.1.15/glx, directory renamed /usr/src/debug/xwayland/24.1.13/xkb -> /usr/src/debug/xwayland/24.1.15/xkb, directory renamed /usr/src/debug/xwayland/24.1.13/os -> /usr/src/debug/xwayland/24.1.15/os, directory renamed /usr/src/debug/xwayland/24.1.13/composite -> /usr/src/debug/xwayland/24.1.15/composite
packages/x86-64-v3-poky-linux/xwayland/xwayland-src: PKGSIZE changed from 8916830 to 8923803 (+0%)
packages/x86-64-v3-poky-linux/xwayland/xwayland-src: PV changed from "24.1.13" to "24.1.15"
packages/x86-64-v3-poky-linux/xwayland/xwayland-staticdev: PKGV changed from 24.1.13 [default] to 24.1.15 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland-staticdev: PV changed from "24.1.13" to "24.1.15"
packages/x86-64-v3-poky-linux/xwayland/xwayland: PKGV changed from 24.1.13 [default] to 24.1.15 [default]
packages/x86-64-v3-poky-linux/xwayland/xwayland: PKGSIZE changed from 2456163 to 2460259 (+0%)
packages/x86-64-v3-poky-linux/xwayland/xwayland: PV changed from "24.1.13" to "24.1.15"

--===============3011775208704240213==--
