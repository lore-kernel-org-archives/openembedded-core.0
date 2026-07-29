Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1EF8C55161
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 07:24:34 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6065.1785309865988834851
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 00:24:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=rucfcZZM;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=tcirGTv1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019facc2bd46-46b1bba2-5a4d-4afb-8532-bfc943e8c687-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785309871;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=YPmeKOZoICKyavsxuUWDhkfUWIkPded61Lu5b6fjoV8=;
	b=rucfcZZMB2wHoqOa7dqokeyahKX671fmLezOjo9z6Ez7ef8OQztrC9h7pfXSfaJf
	uD0B5nCotRQQOQKu0Qy6hfXXFIrjUM1ZjmVO9rUXqkkGaaaxCrMF8iI3gVO+PZ7Sa3T
	plrhPldk29Nvimj6aniCE32FulgWgJGMH8uvs6sQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785309871;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=YPmeKOZoICKyavsxuUWDhkfUWIkPded61Lu5b6fjoV8=;
	b=tcirGTv181sTTUZoEfYUFLB3WcJTfB+huBI8WMKoMMsZZ52+G2QUKxyOtd/OUYKs
	foSUwrOojQ4CecauIElFillRlDc4MiEOt/tIMrO+tJK/9sAYBZZLxj0+8ZTKRAwkEzw
	LH2yGDNJ7hyjWSM0HfY0PoJMAmWwsVUa8wvOpRrQ=
Content-Type: multipart/mixed; boundary="===============8859854693109851340=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libmicrohttpd: upgrading to 1.0.8 SUCCEEDED
Message-ID: <0101019facc2bd46-46b1bba2-5a4d-4afb-8532-bfc943e8c687-000000@us-west-2.amazonses.com>
Date: Wed, 29 Jul 2026 07:24:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.29-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 07:24:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242247

--===============8859854693109851340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libmicrohttpd* to *1.0.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libmicrohttpd-upgrade-1.0.6-1.0.8.patch
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
From 5a57e62aaf40cd4a657d70a5f9f0b190a10d420d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 29 Jul 2026 07:24:20 +0000
Subject: [PATCH] libmicrohttpd: upgrade 1.0.6 -> 1.0.8

Source: ChangeLog

Tue Jul 28 06:12:03 PM CEST 2026
    Fixing additional vulnerabilities inspired by reviewing the
    code for similar issues like the ones reported by A. Ramos;
    expand the test suite to cover these and other issues.
    Releasing GNU libmicrohttpd 1.0.8. -CG

Mon Jul 27 06:12:03 PM CEST 2026
    Fixing various vulnerabilities reported by A. Ramos resulting
    in possible crashes or out-of-bounds stack writes for certain
    requests in specific configurations.
    Releasing GNU libmicrohttpd 1.0.7. -CG
---
 .../{libmicrohttpd_1.0.6.bb => libmicrohttpd_1.0.8.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libmicrohttpd/{libmicrohttpd_1.0.6.bb => libmicrohttpd_1.0.8.bb} (91%)

diff --git a/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.6.bb b/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.8.bb
similarity index 91%
rename from meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.6.bb
rename to meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.8.bb
index 30344bf13f..998f282a35 100644
--- a/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.6.bb
+++ b/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.8.bb
@@ -7,7 +7,7 @@ SECTION = "net"
 DEPENDS = "file"
 
 SRC_URI = "${GNU_MIRROR}/libmicrohttpd/${BPN}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "bb5cfcadfc52dbd5eb512d6e2995e0361351c33e97a87aba426d3a4a7ba6cf70"
+SRC_URI[sha256sum] = "0763970a0e39f8f382123366e3cf5d03f70aa1e2208d3101e84da3e2cd674703"
 
 inherit autotools lib_package pkgconfig gettext
 
-- 
2.47.1


--===============8859854693109851340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd: FILELIST: removed "/usr/lib/libmicrohttpd.so.12.62.4", added "/usr/lib/libmicrohttpd.so.12.62.6"
Changes to packages/x86-64-v3-poky-linux/libmicrohttpd (sysroot):
  /usr/lib/libmicrohttpd.so.12 changed symlink target from libmicrohttpd.so.12.62.4 to libmicrohttpd.so.12.62.6
  /usr/lib/libmicrohttpd.so changed symlink target from libmicrohttpd.so.12.62.4 to libmicrohttpd.so.12.62.6
  /usr/lib/libmicrohttpd.so.12.62.4 moved to /usr/lib/libmicrohttpd.so.12.62.6
Changes to packages/x86_64-linux/libmicrohttpd-native (sysroot):
  /usr/lib/libmicrohttpd.so.12 changed symlink target from libmicrohttpd.so.12.62.4 to libmicrohttpd.so.12.62.6
  /usr/lib/libmicrohttpd.so changed symlink target from libmicrohttpd.so.12.62.4 to libmicrohttpd.so.12.62.6
  /usr/lib/libmicrohttpd.so.12.62.4 moved to /usr/lib/libmicrohttpd.so.12.62.6

--===============8859854693109851340==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libmicrohttpd-upgrade-1.0.6-1.0.8.patch"

RnJvbSA1YTU3ZTYyYWFmNDBjZDRhNjU3ZDcwYTVmOWYwYjE5MGExMGQ0MjBkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjkgSnVsIDIwMjYgMDc6MjQ6MjAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJtaWNyb2h0dHBkOiB1cGdyYWRlIDEuMC42IC0+IDEuMC44CgpTb3VyY2U6IENoYW5nZUxvZwoK
VHVlIEp1bCAyOCAwNjoxMjowMyBQTSBDRVNUIDIwMjYKICAgIEZpeGluZyBhZGRpdGlvbmFsIHZ1
bG5lcmFiaWxpdGllcyBpbnNwaXJlZCBieSByZXZpZXdpbmcgdGhlCiAgICBjb2RlIGZvciBzaW1p
bGFyIGlzc3VlcyBsaWtlIHRoZSBvbmVzIHJlcG9ydGVkIGJ5IEEuIFJhbW9zOwogICAgZXhwYW5k
IHRoZSB0ZXN0IHN1aXRlIHRvIGNvdmVyIHRoZXNlIGFuZCBvdGhlciBpc3N1ZXMuCiAgICBSZWxl
YXNpbmcgR05VIGxpYm1pY3JvaHR0cGQgMS4wLjguIC1DRwoKTW9uIEp1bCAyNyAwNjoxMjowMyBQ
TSBDRVNUIDIwMjYKICAgIEZpeGluZyB2YXJpb3VzIHZ1bG5lcmFiaWxpdGllcyByZXBvcnRlZCBi
eSBBLiBSYW1vcyByZXN1bHRpbmcKICAgIGluIHBvc3NpYmxlIGNyYXNoZXMgb3Igb3V0LW9mLWJv
dW5kcyBzdGFjayB3cml0ZXMgZm9yIGNlcnRhaW4KICAgIHJlcXVlc3RzIGluIHNwZWNpZmljIGNv
bmZpZ3VyYXRpb25zLgogICAgUmVsZWFzaW5nIEdOVSBsaWJtaWNyb2h0dHBkIDEuMC43LiAtQ0cK
LS0tCiAuLi4ve2xpYm1pY3JvaHR0cGRfMS4wLjYuYmIgPT4gbGlibWljcm9odHRwZF8xLjAuOC5i
Yn0gICAgICAgICAgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJtaWNyb2h0dHBkL3tsaWJt
aWNyb2h0dHBkXzEuMC42LmJiID0+IGxpYm1pY3JvaHR0cGRfMS4wLjguYmJ9ICg5MSUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlibWljcm9odHRwZC9saWJtaWNyb2h0dHBk
XzEuMC42LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlibWljcm9odHRwZC9saWJtaWNyb2h0
dHBkXzEuMC44LmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1zdXBwb3J0L2xpYm1pY3JvaHR0cGQvbGlibWljcm9odHRwZF8xLjAuNi5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlibWljcm9odHRwZC9saWJtaWNyb2h0dHBkXzEuMC44LmJi
CmluZGV4IDMwMzQ0YmYxM2YuLjk5OGYyODJhMzUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1z
dXBwb3J0L2xpYm1pY3JvaHR0cGQvbGlibWljcm9odHRwZF8xLjAuNi5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJtaWNyb2h0dHBkL2xpYm1pY3JvaHR0cGRfMS4wLjguYmIKQEAgLTcs
NyArNyw3IEBAIFNFQ1RJT04gPSAibmV0IgogREVQRU5EUyA9ICJmaWxlIgogCiBTUkNfVVJJID0g
IiR7R05VX01JUlJPUn0vbGlibWljcm9odHRwZC8ke0JQTn0tJHtQVn0udGFyLmd6IgotU1JDX1VS
SVtzaGEyNTZzdW1dID0gImJiNWNmY2FkZmM1MmRiZDVlYjUxMmQ2ZTI5OTVlMDM2MTM1MWMzM2U5
N2E4N2FiYTQyNmQzYTRhN2JhNmNmNzAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDc2Mzk3MGEw
ZTM5ZjhmMzgyMTIzMzY2ZTNjZjVkMDNmNzBhYTFlMjIwOGQzMTAxZTg0ZGEzZTJjZDY3NDcwMyIK
IAogaW5oZXJpdCBhdXRvdG9vbHMgbGliX3BhY2thZ2UgcGtnY29uZmlnIGdldHRleHQKIAotLSAK
Mi40Ny4xCgo=

--===============8859854693109851340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libmicrohttpd-changelog.txt"

Changelog for libmicrohttpd: 1.0.6 -> 1.0.8
Source: ChangeLog

Tue Jul 28 06:12:03 PM CEST 2026
    Fixing additional vulnerabilities inspired by reviewing the
    code for similar issues like the ones reported by A. Ramos;
    expand the test suite to cover these and other issues.
    Releasing GNU libmicrohttpd 1.0.8. -CG

Mon Jul 27 06:12:03 PM CEST 2026
    Fixing various vulnerabilities reported by A. Ramos resulting
    in possible crashes or out-of-bounds stack writes for certain
    requests in specific configurations.
    Releasing GNU libmicrohttpd 1.0.7. -CG

--===============8859854693109851340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libmicrohttpd: SRC_URI changed from "https://ftpmirror.gnu.org/gnu/libmicrohttpd/libmicrohttpd-1.0.6.tar.gz" to "https://ftpmirror.gnu.org/gnu/libmicrohttpd/libmicrohttpd-1.0.8.tar.gz"
packages/x86-64-v3-poky-linux/libmicrohttpd: PKGV changed from 1.0.6 [default] to 1.0.8 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd: PV changed from "1.0.6" to "1.0.8"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-bin: PKGV changed from 1.0.6 [default] to 1.0.8 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-bin: PV changed from "1.0.6" to "1.0.8"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-dbg: FILELIST: removed "/usr/lib/.debug/libmicrohttpd.so.12.62.4", added "/usr/lib/.debug/libmicrohttpd.so.12.62.6"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-dbg: PKGV changed from 1.0.6 [default] to 1.0.8 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-dbg: PKGSIZE changed from 874808 to 881648 (+1%)
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-dbg: PV changed from "1.0.6" to "1.0.8"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-dev: PKGV changed from 1.0.6 [default] to 1.0.8 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-dev: PKGSIZE changed from 256462 to 257703 (+0%)
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-dev: PV changed from "1.0.6" to "1.0.8"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-doc: PKGV changed from 1.0.6 [default] to 1.0.8 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-doc: PKGSIZE changed from 512850 to 536091 (+5%)
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-doc: PV changed from "1.0.6" to "1.0.8"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-locale: PKGV changed from 1.0.6 [default] to 1.0.8 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-locale: PV changed from "1.0.6" to "1.0.8"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-src: FILELIST: directory renamed /usr/src/debug/libmicrohttpd/1.0.6/src/include -> /usr/src/debug/libmicrohttpd/1.0.8/src/include, directory renamed /usr/src/debug/libmicrohttpd/1.0.6/src/microhttpd -> /usr/src/debug/libmicrohttpd/1.0.8/src/microhttpd
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-src: PKGV changed from 1.0.6 [default] to 1.0.8 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-src: PKGSIZE changed from 1688718 to 1706441 (+1%)
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-src: PV changed from "1.0.6" to "1.0.8"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-staticdev: PKGV changed from 1.0.6 [default] to 1.0.8 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-staticdev: PV changed from "1.0.6" to "1.0.8"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd: FILELIST: removed "/usr/lib/libmicrohttpd.so.12.62.4", added "/usr/lib/libmicrohttpd.so.12.62.6"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd: PKGV changed from 1.0.6 [default] to 1.0.8 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd: PKGSIZE changed from 251912 to 256008 (+2%)
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd: PV changed from "1.0.6" to "1.0.8"
Changes to packages/x86-64-v3-poky-linux/libmicrohttpd (sysroot):
  /usr/lib/libmicrohttpd.so.12 changed symlink target from libmicrohttpd.so.12.62.4 to libmicrohttpd.so.12.62.6
  /usr/lib/libmicrohttpd.so changed symlink target from libmicrohttpd.so.12.62.4 to libmicrohttpd.so.12.62.6
  /usr/lib/libmicrohttpd.so.12.62.4 moved to /usr/lib/libmicrohttpd.so.12.62.6
Changes to packages/x86_64-linux/libmicrohttpd-native (sysroot):
  /usr/lib/libmicrohttpd.so.12 changed symlink target from libmicrohttpd.so.12.62.4 to libmicrohttpd.so.12.62.6
  /usr/lib/libmicrohttpd.so changed symlink target from libmicrohttpd.so.12.62.4 to libmicrohttpd.so.12.62.6
  /usr/lib/libmicrohttpd.so.12.62.4 moved to /usr/lib/libmicrohttpd.so.12.62.6

--===============8859854693109851340==--

