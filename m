Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C72DDC369D6
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:35 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.18067.1743511391044015761
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=XOz/ONFn;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=VIks7f3b;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010195f160d135-a959a9b4-cbf7-4ce9-8a6f-aa48745fb75c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511409;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oC8sQtI+H3irR3H0SbYd9HksxqHvNX2+sgKX1BnGcKc=;
	b=XOz/ONFn4lfRvyekx7ixeXiwMWSlNXBxJhPcb8INVVpxeIArD5UVsDsN4AE+pbuA
	3nE+lByg9xO/Xgt/5h0TJ++WRN76C+Nc9WifSnbpKwMCuwYQYDH52tsTtpBCXV5/lQh
	Psze83Rg0Y/TSQtkZiFQCUrAOdvSxtF79nLezxT0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511409;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oC8sQtI+H3irR3H0SbYd9HksxqHvNX2+sgKX1BnGcKc=;
	b=VIks7f3bs/1k+85TcBCmatMnSMA9fi/CucrIuejfHXVF3pXy1fPr9y2WY0vycz9d
	QPf4GccTlo8JYjESU4CnUFQdcdAyhBWRs2tNrgF130MgKcyT97MNeDnXREVYe/hs6Lv
	08hC7YlLY9eZLlwmPiTLjdw7g9kRSADyiW/SDWIE=
Content-Type: multipart/mixed; boundary="===============2080723461868210926=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wayland-protocols: upgrading to 1.42 SUCCEEDED
Message-ID: <01010195f160d135-a959a9b4-cbf7-4ce9-8a6f-aa48745fb75c-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214105

--===============2080723461868210926==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *wayland-protocols* to *1.42* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wayland-protocols-upgrade-1.41-1.42.patch
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
From 4f70ef4cf174aefaaec039f1877a18927a68d6f1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Apr 2025 11:46:01 +0000
Subject: [PATCH] wayland-protocols: upgrade 1.41 -> 1.42

---
 .../{wayland-protocols_1.41.bb => wayland-protocols_1.42.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.41.bb => wayland-protocols_1.42.bb} (91%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.41.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb
similarity index 91%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.41.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.42.bb
index e8ab9d84fc..7cbb650cda 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.41.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
                     file://stable/presentation-time/presentation-time.xml;endline=26;md5=4646cd7d9edc9fa55db941f2d3a7dc53"
 
 SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/${PV}/downloads/wayland-protocols-${PV}.tar.xz"
-SRC_URI[sha256sum] = "2786b6b1b79965e313f2c289c12075b9ed700d41844810c51afda10ee329576b"
+SRC_URI[sha256sum] = "23ba80d410d1200a86fe29592c19766eae8f1c350b67289999e9e7ea12d9f7aa"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>.+)"
-- 
2.47.1


--===============2080723461868210926==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wayland-protocols-upgrade-1.41-1.42.patch"

RnJvbSA0ZjcwZWY0Y2YxNzRhZWZhYWVjMDM5ZjE4NzdhMTg5MjdhNjhkNmYxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAxMTo0NjowMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHdh
eWxhbmQtcHJvdG9jb2xzOiB1cGdyYWRlIDEuNDEgLT4gMS40MgoKLS0tCiAuLi4ve3dheWxhbmQt
cHJvdG9jb2xzXzEuNDEuYmIgPT4gd2F5bGFuZC1wcm90b2NvbHNfMS40Mi5iYn0gICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC97d2F5bGFuZC1wcm90b2NvbHNfMS40MS5iYiA9
PiB3YXlsYW5kLXByb3RvY29sc18xLjQyLmJifSAoOTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1ncmFwaGljcy93YXlsYW5kL3dheWxhbmQtcHJvdG9jb2xzXzEuNDEuYmIgYi9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93YXlsYW5kLXByb3RvY29sc18xLjQyLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dh
eWxhbmQtcHJvdG9jb2xzXzEuNDEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy93
YXlsYW5kL3dheWxhbmQtcHJvdG9jb2xzXzEuNDIuYmIKaW5kZXggZThhYjlkODRmYy4uN2NiYjY1
MGNkYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2F5bGFuZC1w
cm90b2NvbHNfMS40MS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93YXls
YW5kLXByb3RvY29sc18xLjQyLmJiCkBAIC0xMCw3ICsxMCw3IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkc7bWQ1PWM3YjEyYjY3MDJkYTM4Y2EwMjhhY2U1NGFhZTNkNDg0IFwK
ICAgICAgICAgICAgICAgICAgICAgZmlsZTovL3N0YWJsZS9wcmVzZW50YXRpb24tdGltZS9wcmVz
ZW50YXRpb24tdGltZS54bWw7ZW5kbGluZT0yNjttZDU9NDY0NmNkN2Q5ZWRjOWZhNTVkYjk0MWYy
ZDNhN2RjNTMiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3dh
eWxhbmQvd2F5bGFuZC1wcm90b2NvbHMvLS9yZWxlYXNlcy8ke1BWfS9kb3dubG9hZHMvd2F5bGFu
ZC1wcm90b2NvbHMtJHtQVn0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjI3ODZiNmIx
Yjc5OTY1ZTMxM2YyYzI4OWMxMjA3NWI5ZWQ3MDBkNDE4NDQ4MTBjNTFhZmRhMTBlZTMyOTU3NmIi
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjNiYTgwZDQxMGQxMjAwYTg2ZmUyOTU5MmMxOTc2NmVh
ZThmMWMzNTBiNjcyODk5OTllOWU3ZWExMmQ5ZjdhYSIKIAogVVBTVFJFQU1fQ0hFQ0tfVVJJID0g
Imh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy93YXlsYW5kL3dheWxhbmQtcHJvdG9jb2xz
Ly0vdGFncyIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gInJlbGVhc2VzLyg/UDxwdmVyPi4rKSIK
LS0gCjIuNDcuMQoK

--===============2080723461868210926==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/wayland-protocols: PV changed from "1.41" to "1.42"
packages/all-poky-linux/wayland-protocols: SRC_URI changed from "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/1.41/downloads/wayland-protocols-1.41.tar.xz" to "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/1.42/downloads/wayland-protocols-1.42.tar.xz"
packages/all-poky-linux/wayland-protocols: PKGV changed from 1.41 [default] to 1.42 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-dbg: PV changed from "1.41" to "1.42"
packages/all-poky-linux/wayland-protocols/wayland-protocols-dbg: PKGV changed from 1.41 [default] to 1.42 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-dev: PV changed from "1.41" to "1.42"
packages/all-poky-linux/wayland-protocols/wayland-protocols-dev: PKGSIZE changed from 109807 to 111330 (+1%)
packages/all-poky-linux/wayland-protocols/wayland-protocols-dev: PKGV changed from 1.41 [default] to 1.42 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-doc: PV changed from "1.41" to "1.42"
packages/all-poky-linux/wayland-protocols/wayland-protocols-doc: PKGV changed from 1.41 [default] to 1.42 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-locale: PV changed from "1.41" to "1.42"
packages/all-poky-linux/wayland-protocols/wayland-protocols-locale: PKGV changed from 1.41 [default] to 1.42 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-src: PV changed from "1.41" to "1.42"
packages/all-poky-linux/wayland-protocols/wayland-protocols-src: PKGV changed from 1.41 [default] to 1.42 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-staticdev: PV changed from "1.41" to "1.42"
packages/all-poky-linux/wayland-protocols/wayland-protocols-staticdev: PKGV changed from 1.41 [default] to 1.42 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols: PV changed from "1.41" to "1.42"
packages/all-poky-linux/wayland-protocols/wayland-protocols: PKGSIZE changed from 809860 to 815357 (+1%)
packages/all-poky-linux/wayland-protocols/wayland-protocols: PKGV changed from 1.41 [default] to 1.42 [default]

--===============2080723461868210926==--

