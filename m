Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDD05C55175
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 06:00:10 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18785.1785650406279996430
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2026 23:00:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Peqc1U1X;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Iq4M7/7B;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019fc10eeaa5-9a71a029-d929-4b85-82d2-3da8d1c7aed9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785650408;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=QUwfu37Mm7yNN1XJRUprDoR8QJVFQeHQDupZ7r7E484=;
	b=Peqc1U1XbsIMcnSDnnII6saCZsDAqktq6kMvlxDUgOFlc04oAxTIdxHZRsOcJdk6
	ai553RH8jbD1oRCDxTtFDtWBp7sH2PI2Tf8+ZLxSKoJWE8OxPN+saeN2uoMv+5lw8eH
	kV17MH1fV8ZeC2VRNALD0aH7mDT0tuIh9g/whFZw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785650408;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=QUwfu37Mm7yNN1XJRUprDoR8QJVFQeHQDupZ7r7E484=;
	b=Iq4M7/7BYeqOMdn6RxDhIQQzDd6/aJ/R73IWFinyv/flFEcQ1YmQuufMQBYDHhqN
	4sLqYG0sS4AV7U2r/CIqrj1XO6mEj+BDFTMdgyh3g2IfTZJKWbGfAzMRuzirh7UyX3C
	KM3h3utSOlUiJk09OupdVoiiImXeI8d3T/apGlOw=
Content-Type: multipart/mixed; boundary="===============2014752984923901212=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libmicrohttpd: upgrading to 1.0.9 SUCCEEDED
Message-ID: <0101019fc10eeaa5-9a71a029-d929-4b85-82d2-3da8d1c7aed9-000000@us-west-2.amazonses.com>
Date: Sun, 2 Aug 2026 06:00:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.02-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 06:00:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242519

--===============2014752984923901212==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libmicrohttpd* to *1.0.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libmicrohttpd-upgrade-1.0.8-1.0.9.patch
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
From 876ddaf7d382957e33e1941f0b00d1cddb9381a1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 2 Aug 2026 05:49:27 +0000
Subject: [PATCH] libmicrohttpd: upgrade 1.0.8 -> 1.0.9

Source: ChangeLog

Thu Jul 30 05:32:00 PM CEST 2026
    Enfocing a minimal size on the PSK.
    Fix support for red zones in memorypool.
    Fix rare over-writing of HTTP version string with network data
    after parsing header.
    Fix rare crash from adding connection manually followed by
    immediate daemon shutdown.
    Releasing GNU libmicrohttpd 1.0.9. -CG
---
 .../{libmicrohttpd_1.0.8.bb => libmicrohttpd_1.0.9.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libmicrohttpd/{libmicrohttpd_1.0.8.bb => libmicrohttpd_1.0.9.bb} (91%)

diff --git a/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.8.bb b/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.9.bb
similarity index 91%
rename from meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.8.bb
rename to meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.9.bb
index 998f282a35..4ce99da52a 100644
--- a/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.8.bb
+++ b/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.9.bb
@@ -7,7 +7,7 @@ SECTION = "net"
 DEPENDS = "file"
 
 SRC_URI = "${GNU_MIRROR}/libmicrohttpd/${BPN}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "0763970a0e39f8f382123366e3cf5d03f70aa1e2208d3101e84da3e2cd674703"
+SRC_URI[sha256sum] = "6e9adc446b08083ec03d40317fb66ca6f2e03e4f6170aef33a6e59bb08db2012"
 
 inherit autotools lib_package pkgconfig gettext
 
-- 
2.47.1


--===============2014752984923901212==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libmicrohttpd: PKGV changed from 1.0.8 [default] to 1.0.9 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd: SRC_URI changed from "https://ftpmirror.gnu.org/gnu/libmicrohttpd/libmicrohttpd-1.0.8.tar.gz" to "https://ftpmirror.gnu.org/gnu/libmicrohttpd/libmicrohttpd-1.0.9.tar.gz"
packages/x86-64-v3-poky-linux/libmicrohttpd: PV changed from "1.0.8" to "1.0.9"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-bin: PKGV changed from 1.0.8 [default] to 1.0.9 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-bin: PV changed from "1.0.8" to "1.0.9"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-dbg: FILELIST: removed "/usr/lib/.debug/libmicrohttpd.so.12.62.6", added "/usr/lib/.debug/libmicrohttpd.so.12.62.7"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-dbg: PKGV changed from 1.0.8 [default] to 1.0.9 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-dbg: PKGSIZE changed from 881688 to 881624 (-0%)
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-dbg: PV changed from "1.0.8" to "1.0.9"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-dev: PKGV changed from 1.0.8 [default] to 1.0.9 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-dev: PKGSIZE changed from 257703 to 257846 (+0%)
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-dev: PV changed from "1.0.8" to "1.0.9"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-doc: PKGV changed from 1.0.8 [default] to 1.0.9 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-doc: PKGSIZE changed from 536091 to 536237 (+0%)
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-doc: PV changed from "1.0.8" to "1.0.9"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-locale: PKGV changed from 1.0.8 [default] to 1.0.9 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-locale: PV changed from "1.0.8" to "1.0.9"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-src: FILELIST: directory renamed /usr/src/debug/libmicrohttpd/1.0.8/src/microhttpd -> /usr/src/debug/libmicrohttpd/1.0.9/src/microhttpd, directory renamed /usr/src/debug/libmicrohttpd/1.0.8/src/include -> /usr/src/debug/libmicrohttpd/1.0.9/src/include
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-src: PKGV changed from 1.0.8 [default] to 1.0.9 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-src: PKGSIZE changed from 1706441 to 1710854 (+0%)
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-src: PV changed from "1.0.8" to "1.0.9"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-staticdev: PKGV changed from 1.0.8 [default] to 1.0.9 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd-staticdev: PV changed from "1.0.8" to "1.0.9"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd: FILELIST: removed "/usr/lib/libmicrohttpd.so.12.62.6", added "/usr/lib/libmicrohttpd.so.12.62.7"
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd: PKGV changed from 1.0.8 [default] to 1.0.9 [default]
packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd: PV changed from "1.0.8" to "1.0.9"
Changes to packages/x86-64-v3-poky-linux/libmicrohttpd (sysroot):
  /usr/lib/libmicrohttpd.so.12 changed symlink target from libmicrohttpd.so.12.62.6 to libmicrohttpd.so.12.62.7
  /usr/lib/libmicrohttpd.so changed symlink target from libmicrohttpd.so.12.62.6 to libmicrohttpd.so.12.62.7
  /usr/lib/libmicrohttpd.so.12.62.6 moved to /usr/lib/libmicrohttpd.so.12.62.7
Changes to packages/x86_64-linux/libmicrohttpd-native (sysroot):
  /usr/lib/libmicrohttpd.so.12 changed symlink target from libmicrohttpd.so.12.62.6 to libmicrohttpd.so.12.62.7
  /usr/lib/libmicrohttpd.so changed symlink target from libmicrohttpd.so.12.62.6 to libmicrohttpd.so.12.62.7
  /usr/lib/libmicrohttpd.so.12.62.6 moved to /usr/lib/libmicrohttpd.so.12.62.7

--===============2014752984923901212==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libmicrohttpd-upgrade-1.0.8-1.0.9.patch"

RnJvbSA4NzZkZGFmN2QzODI5NTdlMzNlMTk0MWYwYjAwZDFjZGRiOTM4MWExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMiBBdWcgMjAyNiAwNTo0OToyNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
Ym1pY3JvaHR0cGQ6IHVwZ3JhZGUgMS4wLjggLT4gMS4wLjkKClNvdXJjZTogQ2hhbmdlTG9nCgpU
aHUgSnVsIDMwIDA1OjMyOjAwIFBNIENFU1QgMjAyNgogICAgRW5mb2NpbmcgYSBtaW5pbWFsIHNp
emUgb24gdGhlIFBTSy4KICAgIEZpeCBzdXBwb3J0IGZvciByZWQgem9uZXMgaW4gbWVtb3J5cG9v
bC4KICAgIEZpeCByYXJlIG92ZXItd3JpdGluZyBvZiBIVFRQIHZlcnNpb24gc3RyaW5nIHdpdGgg
bmV0d29yayBkYXRhCiAgICBhZnRlciBwYXJzaW5nIGhlYWRlci4KICAgIEZpeCByYXJlIGNyYXNo
IGZyb20gYWRkaW5nIGNvbm5lY3Rpb24gbWFudWFsbHkgZm9sbG93ZWQgYnkKICAgIGltbWVkaWF0
ZSBkYWVtb24gc2h1dGRvd24uCiAgICBSZWxlYXNpbmcgR05VIGxpYm1pY3JvaHR0cGQgMS4wLjku
IC1DRwotLS0KIC4uLi97bGlibWljcm9odHRwZF8xLjAuOC5iYiA9PiBsaWJtaWNyb2h0dHBkXzEu
MC45LmJifSAgICAgICAgICB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYm1pY3JvaHR0cGQv
e2xpYm1pY3JvaHR0cGRfMS4wLjguYmIgPT4gbGlibWljcm9odHRwZF8xLjAuOS5iYn0gKDkxJSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJtaWNyb2h0dHBkL2xpYm1pY3Jv
aHR0cGRfMS4wLjguYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJtaWNyb2h0dHBkL2xpYm1p
Y3JvaHR0cGRfMS4wLjkuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvbGlibWljcm9odHRwZC9saWJtaWNyb2h0dHBkXzEuMC44LmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJtaWNyb2h0dHBkL2xpYm1pY3JvaHR0cGRfMS4w
LjkuYmIKaW5kZXggOTk4ZjI4MmEzNS4uNGNlOTlkYTUyYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvbGlibWljcm9odHRwZC9saWJtaWNyb2h0dHBkXzEuMC44LmJiCisrKyBiL21l
dGEvcmVjaXBlcy1zdXBwb3J0L2xpYm1pY3JvaHR0cGQvbGlibWljcm9odHRwZF8xLjAuOS5iYgpA
QCAtNyw3ICs3LDcgQEAgU0VDVElPTiA9ICJuZXQiCiBERVBFTkRTID0gImZpbGUiCiAKIFNSQ19V
UkkgPSAiJHtHTlVfTUlSUk9SfS9saWJtaWNyb2h0dHBkLyR7QlBOfS0ke1BWfS50YXIuZ3oiCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiMDc2Mzk3MGEwZTM5ZjhmMzgyMTIzMzY2ZTNjZjVkMDNmNzBh
YTFlMjIwOGQzMTAxZTg0ZGEzZTJjZDY3NDcwMyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2ZTlh
ZGM0NDZiMDgwODNlYzAzZDQwMzE3ZmI2NmNhNmYyZTAzZTRmNjE3MGFlZjMzYTZlNTliYjA4ZGIy
MDEyIgogCiBpbmhlcml0IGF1dG90b29scyBsaWJfcGFja2FnZSBwa2djb25maWcgZ2V0dGV4dAog
Ci0tIAoyLjQ3LjEKCg==

--===============2014752984923901212==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libmicrohttpd-changelog.txt"

Changelog for libmicrohttpd: 1.0.8 -> 1.0.9
Source: ChangeLog

Thu Jul 30 05:32:00 PM CEST 2026
    Enfocing a minimal size on the PSK.
    Fix support for red zones in memorypool.
    Fix rare over-writing of HTTP version string with network data
    after parsing header.
    Fix rare crash from adding connection manually followed by
    immediate daemon shutdown.
    Releasing GNU libmicrohttpd 1.0.9. -CG

--===============2014752984923901212==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libmicrohttpd/libmicrohttpd: FILELIST: removed "/usr/lib/libmicrohttpd.so.12.62.6", added "/usr/lib/libmicrohttpd.so.12.62.7"
Changes to packages/x86-64-v3-poky-linux/libmicrohttpd (sysroot):
  /usr/lib/libmicrohttpd.so.12 changed symlink target from libmicrohttpd.so.12.62.6 to libmicrohttpd.so.12.62.7
  /usr/lib/libmicrohttpd.so changed symlink target from libmicrohttpd.so.12.62.6 to libmicrohttpd.so.12.62.7
  /usr/lib/libmicrohttpd.so.12.62.6 moved to /usr/lib/libmicrohttpd.so.12.62.7
Changes to packages/x86_64-linux/libmicrohttpd-native (sysroot):
  /usr/lib/libmicrohttpd.so.12 changed symlink target from libmicrohttpd.so.12.62.6 to libmicrohttpd.so.12.62.7
  /usr/lib/libmicrohttpd.so changed symlink target from libmicrohttpd.so.12.62.6 to libmicrohttpd.so.12.62.7
  /usr/lib/libmicrohttpd.so.12.62.6 moved to /usr/lib/libmicrohttpd.so.12.62.7

--===============2014752984923901212==--

