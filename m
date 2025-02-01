Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CBC9C021A9
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:21:13 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.42715.1738416048586333496
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:21:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=PAp2kZr1;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=ZeC+BRoo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010194c1ac188d-77f75433-e354-48a4-bfbd-da2378076bfa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416068;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5mR2CqAmfGvM0MowPLs4uic0gIjeK6apxI7nziBPFcU=;
	b=PAp2kZr1DIhX9mzXnD5JZSLxnbv0XGuaSQywiegaNkhlu7A6JP4osrtsA1YcTBe/
	0Yy/BML/6IYHpf6X3tW3ONYUrBnGE8wSfqP/+4eMHHsyC+3P1B0sFMPef0WKEQR47pg
	UgUgHsnlLrP39o3z2oVXloa5RgCbu+SipYKYMsFg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416068;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5mR2CqAmfGvM0MowPLs4uic0gIjeK6apxI7nziBPFcU=;
	b=ZeC+BRooXGqw7TySI8a5NZn4kg85Pv8PGQu1M1nJ9DGsb4qmBT5RgXSg3KhQO6/x
	Jbx1hWC3X98BCo2Xba2sMq8r01iSgbVLRkbKAfM3DSVBSJyCZn8sxhdnh+KgT4PQYzc
	fN6bC5Y5RhuGqAIbio5Q7wCYPj94wjM+uwdUeHBE=
Content-Type: multipart/mixed; boundary="===============3081835190005710170=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wayland-protocols: upgrading to 1.40 SUCCEEDED
Message-ID: <01010194c1ac188d-77f75433-e354-48a4-bfbd-da2378076bfa-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:21:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:21:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210591

--===============3081835190005710170==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *wayland-protocols* to *1.40* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wayland-protocols-upgrade-1.39-1.40.patch
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
From e5e4af7f17e24dfe6251170fed5b8af03f24b347 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Feb 2025 12:22:11 +0000
Subject: [PATCH] wayland-protocols: upgrade 1.39 -> 1.40

---
 .../{wayland-protocols_1.39.bb => wayland-protocols_1.40.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.39.bb => wayland-protocols_1.40.bb} (91%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.39.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.40.bb
similarity index 91%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.39.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.40.bb
index 82c373df21..4efc1bd548 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.39.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.40.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
                     file://stable/presentation-time/presentation-time.xml;endline=26;md5=4646cd7d9edc9fa55db941f2d3a7dc53"
 
 SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/${PV}/downloads/wayland-protocols-${PV}.tar.xz"
-SRC_URI[sha256sum] = "e1dcdcbbf08e2e0a8a02ee5d9a0be3a6aafc39a4b51fa7e0d2f1a16411cb72fa"
+SRC_URI[sha256sum] = "b21711793247c2c42763914392dfa9fcb9e3728ca4b4aa110adb8d915fc00689"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>.+)"
-- 
2.44.1


--===============3081835190005710170==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/wayland-protocols: PV changed from "1.39" to "1.40"
packages/all-poky-linux/wayland-protocols: SRC_URI changed from "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/1.39/downloads/wayland-protocols-1.39.tar.xz" to "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/1.40/downloads/wayland-protocols-1.40.tar.xz"
packages/all-poky-linux/wayland-protocols: PKGV changed from 1.39 [default] to 1.40 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-dbg: PV changed from "1.39" to "1.40"
packages/all-poky-linux/wayland-protocols/wayland-protocols-dbg: PKGV changed from 1.39 [default] to 1.40 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-dev: PV changed from "1.39" to "1.40"
packages/all-poky-linux/wayland-protocols/wayland-protocols-dev: PKGV changed from 1.39 [default] to 1.40 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-doc: PV changed from "1.39" to "1.40"
packages/all-poky-linux/wayland-protocols/wayland-protocols-doc: PKGV changed from 1.39 [default] to 1.40 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-locale: PV changed from "1.39" to "1.40"
packages/all-poky-linux/wayland-protocols/wayland-protocols-locale: PKGV changed from 1.39 [default] to 1.40 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-src: PV changed from "1.39" to "1.40"
packages/all-poky-linux/wayland-protocols/wayland-protocols-src: PKGV changed from 1.39 [default] to 1.40 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-staticdev: PV changed from "1.39" to "1.40"
packages/all-poky-linux/wayland-protocols/wayland-protocols-staticdev: PKGV changed from 1.39 [default] to 1.40 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols: PKGSIZE changed from 733690 to 735021 (+0%)
packages/all-poky-linux/wayland-protocols/wayland-protocols: PV changed from "1.39" to "1.40"
packages/all-poky-linux/wayland-protocols/wayland-protocols: PKGV changed from 1.39 [default] to 1.40 [default]

--===============3081835190005710170==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wayland-protocols-upgrade-1.39-1.40.patch"

RnJvbSBlNWU0YWY3ZjE3ZTI0ZGZlNjI1MTE3MGZlZDViOGFmMDNmMjRiMzQ3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBGZWIgMjAyNSAxMjoyMjoxMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHdh
eWxhbmQtcHJvdG9jb2xzOiB1cGdyYWRlIDEuMzkgLT4gMS40MAoKLS0tCiAuLi4ve3dheWxhbmQt
cHJvdG9jb2xzXzEuMzkuYmIgPT4gd2F5bGFuZC1wcm90b2NvbHNfMS40MC5iYn0gICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC97d2F5bGFuZC1wcm90b2NvbHNfMS4zOS5iYiA9
PiB3YXlsYW5kLXByb3RvY29sc18xLjQwLmJifSAoOTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1ncmFwaGljcy93YXlsYW5kL3dheWxhbmQtcHJvdG9jb2xzXzEuMzkuYmIgYi9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93YXlsYW5kLXByb3RvY29sc18xLjQwLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dh
eWxhbmQtcHJvdG9jb2xzXzEuMzkuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy93
YXlsYW5kL3dheWxhbmQtcHJvdG9jb2xzXzEuNDAuYmIKaW5kZXggODJjMzczZGYyMS4uNGVmYzFi
ZDU0OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2F5bGFuZC1w
cm90b2NvbHNfMS4zOS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93YXls
YW5kLXByb3RvY29sc18xLjQwLmJiCkBAIC0xMCw3ICsxMCw3IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkc7bWQ1PWM3YjEyYjY3MDJkYTM4Y2EwMjhhY2U1NGFhZTNkNDg0IFwK
ICAgICAgICAgICAgICAgICAgICAgZmlsZTovL3N0YWJsZS9wcmVzZW50YXRpb24tdGltZS9wcmVz
ZW50YXRpb24tdGltZS54bWw7ZW5kbGluZT0yNjttZDU9NDY0NmNkN2Q5ZWRjOWZhNTVkYjk0MWYy
ZDNhN2RjNTMiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3dh
eWxhbmQvd2F5bGFuZC1wcm90b2NvbHMvLS9yZWxlYXNlcy8ke1BWfS9kb3dubG9hZHMvd2F5bGFu
ZC1wcm90b2NvbHMtJHtQVn0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImUxZGNkY2Ji
ZjA4ZTJlMGE4YTAyZWU1ZDlhMGJlM2E2YWFmYzM5YTRiNTFmYTdlMGQyZjFhMTY0MTFjYjcyZmEi
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjIxNzExNzkzMjQ3YzJjNDI3NjM5MTQzOTJkZmE5ZmNi
OWUzNzI4Y2E0YjRhYTExMGFkYjhkOTE1ZmMwMDY4OSIKIAogVVBTVFJFQU1fQ0hFQ0tfVVJJID0g
Imh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy93YXlsYW5kL3dheWxhbmQtcHJvdG9jb2xz
Ly0vdGFncyIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gInJlbGVhc2VzLyg/UDxwdmVyPi4rKSIK
LS0gCjIuNDQuMQoK

--===============3081835190005710170==--

