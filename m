Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F8FC8303B
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:15:04 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.8896.1749993292071222519
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 06:15:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=eF+ER1NE;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=EKODz5V5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019773baa0b2-a1f00901-2f1c-4a15-936e-4bd27427b9ad-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749993300;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lSM5013XSeZT0PRGnj16Z1hbgbYTgq/FMtC27Fmion4=;
	b=eF+ER1NECFl/7Mfj0wk5rBRUdciBPwEeuUucfBrBvqzSm7j9nMv4BrxBCLCJqIcG
	WBNvUtVjSC+5fiz1o8JP/BDFo73SjtFXIMEV86wJmygY0srLuHX/dJIycpV33GBIcuK
	Okz6QgMlgJGnKVglx910QRx6vhSmCFxwomj0FVmc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749993300;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lSM5013XSeZT0PRGnj16Z1hbgbYTgq/FMtC27Fmion4=;
	b=EKODz5V5ZwlXKGngdL/vYQF4mda19xqgLxeK5qgbAxshQaNTseypfHwOMSw8kmxc
	9Abk2C28tlcz35aIDX+BxoJNSos2R9UtVXqoEb/TsxtGPhSEPM1+G840IC1bn7eOjEV
	mFPBWNNGohoLbc/7U8zaGybLM6zXyy3RUA5gkK3c=
Content-Type: multipart/mixed; boundary="===============0877384285285541204=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wayland-protocols: upgrading to 1.45 SUCCEEDED
Message-ID: <0101019773baa0b2-a1f00901-2f1c-4a15-936e-4bd27427b9ad-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jun 2025 13:15:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 13:15:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218725

--===============0877384285285541204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *wayland-protocols* to *1.45* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wayland-protocols-upgrade-1.44-1.45.patch
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
From b9af0c420a2f66c84e426493140758ce6ffd0572 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Jun 2025 11:56:04 +0000
Subject: [PATCH] wayland-protocols: upgrade 1.44 -> 1.45

---
 .../{wayland-protocols_1.44.bb => wayland-protocols_1.45.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.44.bb => wayland-protocols_1.45.bb} (91%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.44.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb
similarity index 91%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.44.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.45.bb
index c86f09eb7c..d98ccf964f 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.44.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
                     file://stable/presentation-time/presentation-time.xml;endline=26;md5=4646cd7d9edc9fa55db941f2d3a7dc53"
 
 SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/${PV}/downloads/wayland-protocols-${PV}.tar.xz"
-SRC_URI[sha256sum] = "3df1107ecf8bfd6ee878aeca5d3b7afd81248a48031e14caf6ae01f14eebb50e"
+SRC_URI[sha256sum] = "4d2b2a9e3e099d017dc8107bf1c334d27bb87d9e4aff19a0c8d856d17cd41ef0"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>.+)"
-- 
2.47.1


--===============0877384285285541204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/wayland-protocols: PV changed from "1.44" to "1.45"
packages/all-poky-linux/wayland-protocols: SRC_URI changed from "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/1.44/downloads/wayland-protocols-1.44.tar.xz" to "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/1.45/downloads/wayland-protocols-1.45.tar.xz"
packages/all-poky-linux/wayland-protocols: PKGV changed from 1.44 [default] to 1.45 [default]
Changes to packages/all-poky-linux/wayland-protocols (sysroot):
  /usr/include/wayland-protocols/ext-background-effect-v1-enum.h was added
  /usr/include/wayland-protocols/pointer-warp-v1-enum.h was added
  /usr/include/wayland-protocols/xx-session-management-v1-enum.h was added
  /usr/share/wayland-protocols/staging/ext-background-effect was added
  /usr/share/wayland-protocols/staging/ext-background-effect/ext-background-effect-v1.xml was added
  /usr/share/wayland-protocols/staging/pointer-warp was added
  /usr/share/wayland-protocols/staging/pointer-warp/pointer-warp-v1.xml was added
packages/all-poky-linux/wayland-protocols/wayland-protocols-dbg: PV changed from "1.44" to "1.45"
packages/all-poky-linux/wayland-protocols/wayland-protocols-dbg: PKGV changed from 1.44 [default] to 1.45 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-dev: PV changed from "1.44" to "1.45"
packages/all-poky-linux/wayland-protocols/wayland-protocols-dev: PKGV changed from 1.44 [default] to 1.45 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-dev: FILELIST: added "/usr/include/wayland-protocols/xx-session-management-v1-enum.h /usr/include/wayland-protocols/ext-background-effect-v1-enum.h /usr/include/wayland-protocols/pointer-warp-v1-enum.h"
packages/all-poky-linux/wayland-protocols/wayland-protocols-dev: PKGSIZE changed from 122303 to 126068 (+3%)
packages/all-poky-linux/wayland-protocols/wayland-protocols-doc: PV changed from "1.44" to "1.45"
packages/all-poky-linux/wayland-protocols/wayland-protocols-doc: PKGV changed from 1.44 [default] to 1.45 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-locale: PV changed from "1.44" to "1.45"
packages/all-poky-linux/wayland-protocols/wayland-protocols-locale: PKGV changed from 1.44 [default] to 1.45 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-src: PV changed from "1.44" to "1.45"
packages/all-poky-linux/wayland-protocols/wayland-protocols-src: PKGV changed from 1.44 [default] to 1.45 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-staticdev: PV changed from "1.44" to "1.45"
packages/all-poky-linux/wayland-protocols/wayland-protocols-staticdev: PKGV changed from 1.44 [default] to 1.45 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols: PV changed from "1.44" to "1.45"
packages/all-poky-linux/wayland-protocols/wayland-protocols: PKGV changed from 1.44 [default] to 1.45 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols: FILELIST: added "/usr/share/wayland-protocols/staging/ext-background-effect/ext-background-effect-v1.xml /usr/share/wayland-protocols/staging/pointer-warp/pointer-warp-v1.xml"
packages/all-poky-linux/wayland-protocols/wayland-protocols: PKGSIZE changed from 839193 to 848790 (+1%)

--===============0877384285285541204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/all-poky-linux/wayland-protocols (sysroot):
  /usr/include/wayland-protocols/ext-background-effect-v1-enum.h was added
  /usr/include/wayland-protocols/pointer-warp-v1-enum.h was added
  /usr/include/wayland-protocols/xx-session-management-v1-enum.h was added
  /usr/share/wayland-protocols/staging/ext-background-effect was added
  /usr/share/wayland-protocols/staging/ext-background-effect/ext-background-effect-v1.xml was added
  /usr/share/wayland-protocols/staging/pointer-warp was added
  /usr/share/wayland-protocols/staging/pointer-warp/pointer-warp-v1.xml was added
packages/all-poky-linux/wayland-protocols/wayland-protocols-dev: FILELIST: added "/usr/include/wayland-protocols/pointer-warp-v1-enum.h /usr/include/wayland-protocols/ext-background-effect-v1-enum.h /usr/include/wayland-protocols/xx-session-management-v1-enum.h"
packages/all-poky-linux/wayland-protocols/wayland-protocols: FILELIST: added "/usr/share/wayland-protocols/staging/pointer-warp/pointer-warp-v1.xml /usr/share/wayland-protocols/staging/ext-background-effect/ext-background-effect-v1.xml"

--===============0877384285285541204==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wayland-protocols-upgrade-1.44-1.45.patch"

RnJvbSBiOWFmMGM0MjBhMmY2NmM4NGU0MjY0OTMxNDA3NThjZTZmZmQwNTcyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSnVuIDIwMjUgMTE6NTY6MDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
YXlsYW5kLXByb3RvY29sczogdXBncmFkZSAxLjQ0IC0+IDEuNDUKCi0tLQogLi4uL3t3YXlsYW5k
LXByb3RvY29sc18xLjQ0LmJiID0+IHdheWxhbmQtcHJvdG9jb2xzXzEuNDUuYmJ9ICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQve3dheWxhbmQtcHJvdG9jb2xzXzEuNDQuYmIg
PT4gd2F5bGFuZC1wcm90b2NvbHNfMS40NS5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93YXlsYW5kLXByb3RvY29sc18xLjQ0LmJiIGIvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2F5bGFuZC1wcm90b2NvbHNfMS40NS5iYgpzaW1pbGFy
aXR5IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93
YXlsYW5kLXByb3RvY29sc18xLjQ0LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
d2F5bGFuZC93YXlsYW5kLXByb3RvY29sc18xLjQ1LmJiCmluZGV4IGM4NmYwOWViN2MuLmQ5OGNj
Zjk2NGYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dheWxhbmQt
cHJvdG9jb2xzXzEuNDQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2F5
bGFuZC1wcm90b2NvbHNfMS40NS5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HO21kNT1jN2IxMmI2NzAyZGEzOGNhMDI4YWNlNTRhYWUzZDQ4NCBc
CiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9zdGFibGUvcHJlc2VudGF0aW9uLXRpbWUvcHJl
c2VudGF0aW9uLXRpbWUueG1sO2VuZGxpbmU9MjY7bWQ1PTQ2NDZjZDdkOWVkYzlmYTU1ZGI5NDFm
MmQzYTdkYzUzIgogCiBTUkNfVVJJID0gImh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy93
YXlsYW5kL3dheWxhbmQtcHJvdG9jb2xzLy0vcmVsZWFzZXMvJHtQVn0vZG93bmxvYWRzL3dheWxh
bmQtcHJvdG9jb2xzLSR7UFZ9LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIzZGYxMTA3
ZWNmOGJmZDZlZTg3OGFlY2E1ZDNiN2FmZDgxMjQ4YTQ4MDMxZTE0Y2FmNmFlMDFmMTRlZWJiNTBl
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjRkMmIyYTllM2UwOTlkMDE3ZGM4MTA3YmYxYzMzNGQy
N2JiODdkOWU0YWZmMTlhMGM4ZDg1NmQxN2NkNDFlZjAiCiAKIFVQU1RSRUFNX0NIRUNLX1VSSSA9
ICJodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvd2F5bGFuZC93YXlsYW5kLXByb3RvY29s
cy8tL3RhZ3MiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJyZWxlYXNlcy8oP1A8cHZlcj4uKyki
Ci0tIAoyLjQ3LjEKCg==

--===============0877384285285541204==--

