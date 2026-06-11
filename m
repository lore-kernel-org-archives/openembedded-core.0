Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C70ECDE006
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:32:09 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50610.1781195501901811018
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=oajU5JMz;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=056r6iGa;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019eb786b322-595579ef-2e24-48bc-9a20-37408a332ee1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195518;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IMuqYtD5qW5joqwg2rN0GjEQWDS2/6Va8GjifPsr+Bk=;
	b=oajU5JMzgB+TcUONJUM4vgCXYL897VvNLdDLKziQiLzZLzoVd4yRkxX7j8/7QqFU
	48Gss4AOecL479GqY8SVc7J8B9xddswBbF0SyWA9IrJPJS5IdWoHor7dvKu1UuJeee3
	rNzYYtbhMftcx/1tOF7Hots7GmXN3kB3S+YOLLIA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195518;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IMuqYtD5qW5joqwg2rN0GjEQWDS2/6Va8GjifPsr+Bk=;
	b=056r6iGarKGvDvq3J91JaRhd2HYPpaxicoUPIiZe1LHy+89xeCwA4UAqbGXqEhrf
	EH1n7pbRwCKNnPlNS9mS6HGJY43Wg+L2RJ9rcK8lBocbMCbrYPi3e9k6THVUZgb3ChT
	IAK0lU0Npjf755g9a31ldibjtwXBmnTTGtp9knYs=
Content-Type: multipart/mixed; boundary="===============2431700852999636718=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wayland-protocols: upgrading to 1.49 SUCCEEDED
Message-ID: <0101019eb786b322-595579ef-2e24-48bc-9a20-37408a332ee1-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:32:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238544

--===============2431700852999636718==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *wayland-protocols* to *1.49* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wayland-protocols-upgrade-1.48-1.49.patch
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
From 180a45488c4080ef7ac2aa7878033742e5af0d3d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 13:13:35 +0000
Subject: [PATCH] wayland-protocols: upgrade 1.48 -> 1.49

---
 .../{wayland-protocols_1.48.bb => wayland-protocols_1.49.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.48.bb => wayland-protocols_1.49.bb} (91%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.48.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.49.bb
similarity index 91%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.48.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.49.bb
index c6b5da44ba..f06e75fe8a 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.48.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.49.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
                     file://stable/presentation-time/presentation-time.xml;endline=26;md5=4646cd7d9edc9fa55db941f2d3a7dc53"
 
 SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/${PV}/downloads/wayland-protocols-${PV}.tar.xz"
-SRC_URI[sha256sum] = "398036ac0eb6484982ddbde7ff86848d753231f9cdeeae983f06b52946625aa1"
+SRC_URI[sha256sum] = "ec4c8f74942d6dff7ace8b4ce4764f0ef9ff618a935d974ea77edee2ad240b14"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>.+)"
-- 
2.47.1


--===============2431700852999636718==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/wayland-protocols: SRC_URI changed from "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/1.48/downloads/wayland-protocols-1.48.tar.xz" to "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/1.49/downloads/wayland-protocols-1.49.tar.xz"
packages/all-poky-linux/wayland-protocols: PV changed from "1.48" to "1.49"
packages/all-poky-linux/wayland-protocols: PKGV changed from 1.48 [default] to 1.49 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-dbg: PV changed from "1.48" to "1.49"
packages/all-poky-linux/wayland-protocols/wayland-protocols-dbg: PKGV changed from 1.48 [default] to 1.49 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-dev: PV changed from "1.48" to "1.49"
packages/all-poky-linux/wayland-protocols/wayland-protocols-dev: PKGV changed from 1.48 [default] to 1.49 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-dev: PKGSIZE changed from 147610 to 148792 (+1%)
packages/all-poky-linux/wayland-protocols/wayland-protocols-doc: PV changed from "1.48" to "1.49"
packages/all-poky-linux/wayland-protocols/wayland-protocols-doc: PKGV changed from 1.48 [default] to 1.49 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-locale: PV changed from "1.48" to "1.49"
packages/all-poky-linux/wayland-protocols/wayland-protocols-locale: PKGV changed from 1.48 [default] to 1.49 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-src: PV changed from "1.48" to "1.49"
packages/all-poky-linux/wayland-protocols/wayland-protocols-src: PKGV changed from 1.48 [default] to 1.49 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-staticdev: PV changed from "1.48" to "1.49"
packages/all-poky-linux/wayland-protocols/wayland-protocols-staticdev: PKGV changed from 1.48 [default] to 1.49 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols: PV changed from "1.48" to "1.49"
packages/all-poky-linux/wayland-protocols/wayland-protocols: PKGV changed from 1.48 [default] to 1.49 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols: PKGSIZE changed from 877380 to 882098 (+1%)

--===============2431700852999636718==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wayland-protocols-upgrade-1.48-1.49.patch"

RnJvbSAxODBhNDU0ODhjNDA4MGVmN2FjMmFhNzg3ODAzMzc0MmU1YWYwZDNkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTM6MTM6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
YXlsYW5kLXByb3RvY29sczogdXBncmFkZSAxLjQ4IC0+IDEuNDkKCi0tLQogLi4uL3t3YXlsYW5k
LXByb3RvY29sc18xLjQ4LmJiID0+IHdheWxhbmQtcHJvdG9jb2xzXzEuNDkuYmJ9ICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQve3dheWxhbmQtcHJvdG9jb2xzXzEuNDguYmIg
PT4gd2F5bGFuZC1wcm90b2NvbHNfMS40OS5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93YXlsYW5kLXByb3RvY29sc18xLjQ4LmJiIGIvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2F5bGFuZC1wcm90b2NvbHNfMS40OS5iYgpzaW1pbGFy
aXR5IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93
YXlsYW5kLXByb3RvY29sc18xLjQ4LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
d2F5bGFuZC93YXlsYW5kLXByb3RvY29sc18xLjQ5LmJiCmluZGV4IGM2YjVkYTQ0YmEuLmYwNmU3
NWZlOGEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dheWxhbmQt
cHJvdG9jb2xzXzEuNDguYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2F5
bGFuZC1wcm90b2NvbHNfMS40OS5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HO21kNT1jN2IxMmI2NzAyZGEzOGNhMDI4YWNlNTRhYWUzZDQ4NCBc
CiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9zdGFibGUvcHJlc2VudGF0aW9uLXRpbWUvcHJl
c2VudGF0aW9uLXRpbWUueG1sO2VuZGxpbmU9MjY7bWQ1PTQ2NDZjZDdkOWVkYzlmYTU1ZGI5NDFm
MmQzYTdkYzUzIgogCiBTUkNfVVJJID0gImh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy93
YXlsYW5kL3dheWxhbmQtcHJvdG9jb2xzLy0vcmVsZWFzZXMvJHtQVn0vZG93bmxvYWRzL3dheWxh
bmQtcHJvdG9jb2xzLSR7UFZ9LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIzOTgwMzZh
YzBlYjY0ODQ5ODJkZGJkZTdmZjg2ODQ4ZDc1MzIzMWY5Y2RlZWFlOTgzZjA2YjUyOTQ2NjI1YWEx
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImVjNGM4Zjc0OTQyZDZkZmY3YWNlOGI0Y2U0NzY0ZjBl
ZjlmZjYxOGE5MzVkOTc0ZWE3N2VkZWUyYWQyNDBiMTQiCiAKIFVQU1RSRUFNX0NIRUNLX1VSSSA9
ICJodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvd2F5bGFuZC93YXlsYW5kLXByb3RvY29s
cy8tL3RhZ3MiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJyZWxlYXNlcy8oP1A8cHZlcj4uKyki
Ci0tIAoyLjQ3LjEKCg==

--===============2431700852999636718==--

