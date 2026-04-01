Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51CA010F6FA5
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:20 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14756.1775054162642108036
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:36:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=agAmTfa7;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=a/qQJD4s;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019d497941c4-6884146e-4465-4ead-8bdd-de19959eb2c2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054176;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5miXYOKlO8kMpFeiaSlhj07Ccf6bC/U+GyLA8HNxf+Y=;
	b=agAmTfa7Lgo+u4pNd9mTbxR2lDc48l3U9IZxFnUW+ENHJfHk9VDap/Whl3opiYYU
	sqHamVb/rzZpn/yKwOwZqr/mjt8nBECDKNGDrLoW4r0ZoTD4ZlFcIO4F2LX0F/dhLgB
	+QiPpZIROM1EUQe6fKkxxGsS/o2rhwCUG84UmZeA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054176;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5miXYOKlO8kMpFeiaSlhj07Ccf6bC/U+GyLA8HNxf+Y=;
	b=a/qQJD4saCETws+jYOsG8c3soeKbchEWhW6tefCmZZyW8rMGY1XTZHRH+o+9nzS1
	9FwM7528VVUhMzqGLI0XXZ0tqdUxn0cN3AmBrnETZQpGnjU01LqYr5/0O6DxGzJPJrP
	IErRkno/5FUc++gdjetqsM2NZ7F7GeekKSIlw8xs=
Content-Type: multipart/mixed; boundary="===============6902374407942899725=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] re2c: upgrading to 4.5.1 SUCCEEDED
Message-ID: <0101019d497941c4-6884146e-4465-4ead-8bdd-de19959eb2c2-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:36:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234436

--===============6902374407942899725==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *re2c* to *4.5.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-re2c-upgrade-4.4-4.5.1.patch
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
From 58ea414a4c520448f23eb137af62447e72cc19c8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Apr 2026 14:32:56 +0000
Subject: [PATCH] re2c: upgrade 4.4 -> 4.5.1

---
 meta/recipes-support/re2c/{re2c_4.4.bb => re2c_4.5.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/re2c/{re2c_4.4.bb => re2c_4.5.1.bb} (90%)

diff --git a/meta/recipes-support/re2c/re2c_4.4.bb b/meta/recipes-support/re2c/re2c_4.5.1.bb
similarity index 90%
rename from meta/recipes-support/re2c/re2c_4.4.bb
rename to meta/recipes-support/re2c/re2c_4.5.1.bb
index 3be66d1388..08b62dc6a7 100644
--- a/meta/recipes-support/re2c/re2c_4.4.bb
+++ b/meta/recipes-support/re2c/re2c_4.5.1.bb
@@ -7,7 +7,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=64eca4d8a3b67f9dc7656094731a2c8d"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "6b6b865924447ef992d5db4e52fb9307e5f65f26edd43efa91395da810f4280a"
+SRC_URI[sha256sum] = "ffea067c11aa668bcb42885be6e6cd000302000b7747d2bb213299ec66b7864e"
 GITHUB_BASE_URI = "https://github.com/skvadrik/re2c/releases"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.1


--===============6902374407942899725==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/re2c/re2c: FILELIST: added "/usr/share/re2c/stdlib/unicode_blocks.re /usr/share/re2c/stdlib/unicode_properties.re"
Changes to packages/x86-64-v3-poky-linux/re2c (sysroot):
  /usr/share/re2c/stdlib/unicode_blocks.re was added
  /usr/share/re2c/stdlib/unicode_properties.re was added
Changes to packages/x86_64-linux/re2c-native (sysroot):
  /usr/share/re2c/stdlib/unicode_blocks.re was added
  /usr/share/re2c/stdlib/unicode_properties.re was added

--===============6902374407942899725==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/re2c: SRC_URI changed from "https://github.com/skvadrik/re2c/releases/download/4.4/re2c-4.4.tar.xz" to "https://github.com/skvadrik/re2c/releases/download/4.5.1/re2c-4.5.1.tar.xz"
packages/x86-64-v3-poky-linux/re2c: PKGV changed from 4.4 [default] to 4.5.1 [default]
packages/x86-64-v3-poky-linux/re2c: PV changed from "4.4" to "4.5.1"
packages/x86-64-v3-poky-linux/re2c/re2c-dbg: PKGSIZE changed from 197102904 to 198021632 (+0%)
packages/x86-64-v3-poky-linux/re2c/re2c-dbg: PKGV changed from 4.4 [default] to 4.5.1 [default]
packages/x86-64-v3-poky-linux/re2c/re2c-dbg: PV changed from "4.4" to "4.5.1"
packages/x86-64-v3-poky-linux/re2c/re2c-dev: PKGV changed from 4.4 [default] to 4.5.1 [default]
packages/x86-64-v3-poky-linux/re2c/re2c-dev: PV changed from "4.4" to "4.5.1"
packages/x86-64-v3-poky-linux/re2c/re2c-doc: PKGSIZE changed from 1850085 to 1851284 (+0%)
packages/x86-64-v3-poky-linux/re2c/re2c-doc: PKGV changed from 4.4 [default] to 4.5.1 [default]
packages/x86-64-v3-poky-linux/re2c/re2c-doc: PV changed from "4.4" to "4.5.1"
packages/x86-64-v3-poky-linux/re2c/re2c-locale: PKGV changed from 4.4 [default] to 4.5.1 [default]
packages/x86-64-v3-poky-linux/re2c/re2c-locale: PV changed from "4.4" to "4.5.1"
packages/x86-64-v3-poky-linux/re2c/re2c-src: PKGSIZE changed from 1769258 to 1836662 (+4%)
packages/x86-64-v3-poky-linux/re2c/re2c-src: FILELIST: directory renamed /usr/src/debug/re2c/4.4/src/debug -> /usr/src/debug/re2c/4.5.1/src/debug, directory renamed /usr/src/debug/re2c/4.4/src/options -> /usr/src/debug/re2c/4.5.1/src/options, directory renamed /usr/src/debug/re2c/4.4/src/cfg -> /usr/src/debug/re2c/4.5.1/src/cfg, directory renamed /usr/src/debug/re2c/4.4/src/parse -> /usr/src/debug/re2c/4.5.1/src/parse, directory renamed /usr/src/debug/re2c/4.4/src/skeleton -> /usr/src/debug/re2c/4.5.1/src/skeleton, directory renamed /usr/src/debug/re2c/4.4/src/regexp -> /usr/src/debug/re2c/4.5.1/src/regexp, directory renamed /usr/src/debug/re2c/4.4/src/util -> /usr/src/debug/re2c/4.5.1/src/util, directory renamed /usr/src/debug/re2c/4.4/src/nfa -> /usr/src/debug/re2c/4.5.1/src/nfa, directory renamed /usr/src/debug/re2c/4.4/src/test/range -> /usr/src/debug/re2c/4.5.1/src/test/range, directory renamed /usr/src/debug/re2c/4.4/src -> /usr/src/debug/re2c/4.5.1/src, directory renamed /usr/
 src/debug/re2c/4.4/src/dfa -> /usr/src/debug/re2c/4.5.1/src/dfa, directory renamed /usr/src/debug/re2c/4.4/src/codegen -> /usr/src/debug/re2c/4.5.1/src/codegen, directory renamed /usr/src/debug/re2c/4.4/src/msg -> /usr/src/debug/re2c/4.5.1/src/msg, directory renamed /usr/src/debug/re2c/4.4/src/adfa -> /usr/src/debug/re2c/4.5.1/src/adfa, removed "/usr/src/debug/re2c/4.4/src/encoding/utf8.cc /usr/src/debug/re2c/4.4/src/encoding/utf16.cc /usr/src/debug/re2c/4.4/src/encoding/ebcdic.cc /usr/src/debug/re2c/4.4/src/encoding/range_suffix.cc /usr/src/debug/re2c/4.4/src/encoding/utf16.h /usr/src/debug/re2c/4.4/src/encoding/range_suffix.h /usr/src/debug/re2c/4.4/src/encoding/enc.cc /usr/src/debug/re2c/4.4/src/encoding/ebcdic.h /usr/src/debug/re2c/4.4/src/encoding/enc.h /usr/src/debug/re2c/4.4/src/encoding/utf8.h", added "/usr/src/debug/re2c/4.5.1/src/encoding/range_suffix.h /usr/src/debug/re2c/4.5.1/src/encoding/enc.cc /usr/src/debug/re2c/4.5.1/src/encoding/unicode_casemap.cc /usr/src/debug/re
 2c/4.5.1/src/encoding/utf8.cc /usr/src/debug/re2c/4.5.1/src/encoding/utf8.h /usr/src/debug/re2c/4.5.1/src/encoding/enc.h /usr/src/debug/re2c/4.5.1/src/encoding/utf16.cc /usr/src/debug/re2c/4.5.1/src/encoding/ebcdic.h /usr/src/debug/re2c/4.5.1/src/encoding/ebcdic.cc /usr/src/debug/re2c/4.5.1/src/encoding/range_suffix.cc /usr/src/debug/re2c/4.5.1/src/encoding/utf16.h"
packages/x86-64-v3-poky-linux/re2c/re2c-src: PKGV changed from 4.4 [default] to 4.5.1 [default]
packages/x86-64-v3-poky-linux/re2c/re2c-src: PV changed from "4.4" to "4.5.1"
packages/x86-64-v3-poky-linux/re2c/re2c-staticdev: PKGV changed from 4.4 [default] to 4.5.1 [default]
packages/x86-64-v3-poky-linux/re2c/re2c-staticdev: PV changed from "4.4" to "4.5.1"
packages/x86-64-v3-poky-linux/re2c/re2c: PKGSIZE changed from 12645009 to 13103375 (+4%)
packages/x86-64-v3-poky-linux/re2c/re2c: FILELIST: added "/usr/share/re2c/stdlib/unicode_blocks.re /usr/share/re2c/stdlib/unicode_properties.re"
packages/x86-64-v3-poky-linux/re2c/re2c: PKGV changed from 4.4 [default] to 4.5.1 [default]
packages/x86-64-v3-poky-linux/re2c/re2c: PV changed from "4.4" to "4.5.1"
Changes to packages/x86-64-v3-poky-linux/re2c (sysroot):
  /usr/share/re2c/stdlib/unicode_blocks.re was added
  /usr/share/re2c/stdlib/unicode_properties.re was added
Changes to packages/x86_64-linux/re2c-native (sysroot):
  /usr/share/re2c/stdlib/unicode_blocks.re was added
  /usr/share/re2c/stdlib/unicode_properties.re was added

--===============6902374407942899725==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-re2c-upgrade-4.4-4.5.1.patch"

RnJvbSA1OGVhNDE0YTRjNTIwNDQ4ZjIzZWIxMzdhZjYyNDQ3ZTcyY2MxOWM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBBcHIgMjAyNiAxNDozMjo1NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJl
MmM6IHVwZ3JhZGUgNC40IC0+IDQuNS4xCgotLS0KIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3JlMmMv
e3JlMmNfNC40LmJiID0+IHJlMmNfNC41LjEuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQv
cmUyYy97cmUyY180LjQuYmIgPT4gcmUyY180LjUuMS5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9yZTJjL3JlMmNfNC40LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvcmUyYy9yZTJjXzQuNS4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTAlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1zdXBwb3J0L3JlMmMvcmUyY180LjQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1zdXBwb3J0L3JlMmMvcmUyY180LjUuMS5iYgppbmRleCAzYmU2NmQxMzg4Li4wOGI2MmRjNmE3
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9yZTJjL3JlMmNfNC40LmJiCisrKyBi
L21ldGEvcmVjaXBlcy1zdXBwb3J0L3JlMmMvcmUyY180LjUuMS5iYgpAQCAtNyw3ICs3LDcgQEAg
TElDRU5TRSA9ICJQRCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTY0
ZWNhNGQ4YTNiNjdmOWRjNzY1NjA5NDczMWEyYzhkIgogCiBTUkNfVVJJID0gIiR7R0lUSFVCX0JB
U0VfVVJJfS9kb3dubG9hZC8ke1BWfS8ke0JQTn0tJHtQVn0udGFyLnh6IgotU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjZiNmI4NjU5MjQ0NDdlZjk5MmQ1ZGI0ZTUyZmI5MzA3ZTVmNjVmMjZlZGQ0M2Vm
YTkxMzk1ZGE4MTBmNDI4MGEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZmZlYTA2N2MxMWFhNjY4
YmNiNDI4ODViZTZlNmNkMDAwMzAyMDAwYjc3NDdkMmJiMjEzMjk5ZWM2NmI3ODY0ZSIKIEdJVEhV
Ql9CQVNFX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20vc2t2YWRyaWsvcmUyYy9yZWxlYXNlcyIK
IAogQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgotLSAKMi40Ny4xCgo=

--===============6902374407942899725==--

