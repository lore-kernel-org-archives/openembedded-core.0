Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4365ED5E389
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:52 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17390.1765872134595423694
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=I60c8bPJ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=G+pUNj4c;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019b262ed484-f8c194c2-2b43-4519-9867-ed9e95c44e36-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872162;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DrxDjVYrfrBuuyBXiC8P9bKCfizgScCwnKVownsXTAk=;
	b=I60c8bPJ+TBhfk3KeAmLF6zVQJiO1ee7hqCPA3sMGBemubB3UP2QTCf73tc9KqKs
	MtiuzhWsLVk248v0GMs7rc0hsHwlxopwguGh9WURfHHWV3N9YmTLQeVxH7PpFjzR5nR
	nCHUKMhlLuwDfO/L/hPb+9tevYmQU+l/hwPIjajQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872162;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DrxDjVYrfrBuuyBXiC8P9bKCfizgScCwnKVownsXTAk=;
	b=G+pUNj4coXmLcpK3jY9VkvD9tSUDBLAv4OWkZP4DpasTrI8rtCGtv2qLgP7vB2Q3
	wcJlLwMPxA8BN6Ft1a0jQ9nH2PZzf4tR7CRftF0c3kwWj8lE/5Tvz0WaJkj+zToSzNx
	Dsx5ld/4hn48/pInvxAT46Y0B8Qw9GEUao8WKHmE=
Content-Type: multipart/mixed; boundary="===============8022051325119113819=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wayland-protocols: upgrading to 1.47 SUCCEEDED
Message-ID: <0101019b262ed484-f8c194c2-2b43-4519-9867-ed9e95c44e36-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227880

--===============8022051325119113819==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *wayland-protocols* to *1.47* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wayland-protocols-upgrade-1.45-1.47.patch
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
From c9c1bb4728ee01b6fb3a1b343613e16fd326322a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 05:17:52 +0000
Subject: [PATCH] wayland-protocols: upgrade 1.45 -> 1.47

---
 .../{wayland-protocols_1.45.bb => wayland-protocols_1.47.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.45.bb => wayland-protocols_1.47.bb} (91%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.47.bb
similarity index 91%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.45.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.47.bb
index d98ccf964f..e19045fed0 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.47.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
                     file://stable/presentation-time/presentation-time.xml;endline=26;md5=4646cd7d9edc9fa55db941f2d3a7dc53"
 
 SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/${PV}/downloads/wayland-protocols-${PV}.tar.xz"
-SRC_URI[sha256sum] = "4d2b2a9e3e099d017dc8107bf1c334d27bb87d9e4aff19a0c8d856d17cd41ef0"
+SRC_URI[sha256sum] = "5fd4349bcbc9bab9a46f8cf77d1f434296a7a052c87440a094f63fcf62a58e20"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>.+)"
-- 
2.47.1


--===============8022051325119113819==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wayland-protocols-upgrade-1.45-1.47.patch"

RnJvbSBjOWMxYmI0NzI4ZWUwMWI2ZmIzYTFiMzQzNjEzZTE2ZmQzMjYzMjJhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDU6MTc6NTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
YXlsYW5kLXByb3RvY29sczogdXBncmFkZSAxLjQ1IC0+IDEuNDcKCi0tLQogLi4uL3t3YXlsYW5k
LXByb3RvY29sc18xLjQ1LmJiID0+IHdheWxhbmQtcHJvdG9jb2xzXzEuNDcuYmJ9ICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQve3dheWxhbmQtcHJvdG9jb2xzXzEuNDUuYmIg
PT4gd2F5bGFuZC1wcm90b2NvbHNfMS40Ny5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93YXlsYW5kLXByb3RvY29sc18xLjQ1LmJiIGIvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2F5bGFuZC1wcm90b2NvbHNfMS40Ny5iYgpzaW1pbGFy
aXR5IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93
YXlsYW5kLXByb3RvY29sc18xLjQ1LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
d2F5bGFuZC93YXlsYW5kLXByb3RvY29sc18xLjQ3LmJiCmluZGV4IGQ5OGNjZjk2NGYuLmUxOTA0
NWZlZDAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dheWxhbmQt
cHJvdG9jb2xzXzEuNDUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2F5
bGFuZC1wcm90b2NvbHNfMS40Ny5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HO21kNT1jN2IxMmI2NzAyZGEzOGNhMDI4YWNlNTRhYWUzZDQ4NCBc
CiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9zdGFibGUvcHJlc2VudGF0aW9uLXRpbWUvcHJl
c2VudGF0aW9uLXRpbWUueG1sO2VuZGxpbmU9MjY7bWQ1PTQ2NDZjZDdkOWVkYzlmYTU1ZGI5NDFm
MmQzYTdkYzUzIgogCiBTUkNfVVJJID0gImh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy93
YXlsYW5kL3dheWxhbmQtcHJvdG9jb2xzLy0vcmVsZWFzZXMvJHtQVn0vZG93bmxvYWRzL3dheWxh
bmQtcHJvdG9jb2xzLSR7UFZ9LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0ZDJiMmE5
ZTNlMDk5ZDAxN2RjODEwN2JmMWMzMzRkMjdiYjg3ZDllNGFmZjE5YTBjOGQ4NTZkMTdjZDQxZWYw
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjVmZDQzNDliY2JjOWJhYjlhNDZmOGNmNzdkMWY0MzQy
OTZhN2EwNTJjODc0NDBhMDk0ZjYzZmNmNjJhNThlMjAiCiAKIFVQU1RSRUFNX0NIRUNLX1VSSSA9
ICJodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvd2F5bGFuZC93YXlsYW5kLXByb3RvY29s
cy8tL3RhZ3MiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJyZWxlYXNlcy8oP1A8cHZlcj4uKyki
Ci0tIAoyLjQ3LjEKCg==

--===============8022051325119113819==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/all-poky-linux/wayland-protocols (sysroot):
  /usr/include/wayland-protocols/xx-input-method-v2-enum.h was added
  /usr/include/wayland-protocols/xx-text-input-v3-enum.h was added
packages/all-poky-linux/wayland-protocols/wayland-protocols-dev: FILELIST: added "/usr/include/wayland-protocols/xx-input-method-v2-enum.h /usr/include/wayland-protocols/xx-text-input-v3-enum.h"

--===============8022051325119113819==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/wayland-protocols: SRC_URI changed from "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/1.45/downloads/wayland-protocols-1.45.tar.xz" to "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/1.47/downloads/wayland-protocols-1.47.tar.xz"
packages/all-poky-linux/wayland-protocols: PKGV changed from 1.45 [default] to 1.47 [default]
packages/all-poky-linux/wayland-protocols: PV changed from "1.45" to "1.47"
Changes to packages/all-poky-linux/wayland-protocols (sysroot):
  /usr/include/wayland-protocols/xx-input-method-v2-enum.h was added
  /usr/include/wayland-protocols/xx-text-input-v3-enum.h was added
packages/all-poky-linux/wayland-protocols/wayland-protocols-dbg: PKGV changed from 1.45 [default] to 1.47 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-dbg: PV changed from "1.45" to "1.47"
packages/all-poky-linux/wayland-protocols/wayland-protocols-dev: FILELIST: added "/usr/include/wayland-protocols/xx-input-method-v2-enum.h /usr/include/wayland-protocols/xx-text-input-v3-enum.h"
packages/all-poky-linux/wayland-protocols/wayland-protocols-dev: PKGV changed from 1.45 [default] to 1.47 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-dev: PKGSIZE changed from 126068 to 135988 (+8%)
packages/all-poky-linux/wayland-protocols/wayland-protocols-dev: PV changed from "1.45" to "1.47"
packages/all-poky-linux/wayland-protocols/wayland-protocols-doc: PKGV changed from 1.45 [default] to 1.47 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-doc: PV changed from "1.45" to "1.47"
packages/all-poky-linux/wayland-protocols/wayland-protocols-locale: PKGV changed from 1.45 [default] to 1.47 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-locale: PV changed from "1.45" to "1.47"
packages/all-poky-linux/wayland-protocols/wayland-protocols-src: PKGV changed from 1.45 [default] to 1.47 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-src: PV changed from "1.45" to "1.47"
packages/all-poky-linux/wayland-protocols/wayland-protocols-staticdev: PKGV changed from 1.45 [default] to 1.47 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols-staticdev: PV changed from "1.45" to "1.47"
packages/all-poky-linux/wayland-protocols/wayland-protocols: PKGV changed from 1.45 [default] to 1.47 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols: PKGSIZE changed from 848790 to 853052 (+1%)
packages/all-poky-linux/wayland-protocols/wayland-protocols: PV changed from "1.45" to "1.47"

--===============8022051325119113819==--

