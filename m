Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D32B6C61DE5
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 05:33:02 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3850.1788067977553346827
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Aug 2026 22:32:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CdmM7pzw;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=HHDY4eU8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a05128156a-aa9f1397-9f4b-45e0-b041-98c7040e20ee-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1788067976;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zeK19hlQXtYlkOA24aIRjsBQk0MgcXpYdFGf3Nt/4gs=;
	b=CdmM7pzw3bLtTl76YajFbTKKNs2rhsLWCOeYHFURBG3Xnn633eQ21u52kfiGU6Ip
	CFS9yJT4ZNQWGlO/VYxKYJ263QJC3ToF4mPRc1BVx+o3jRDYx9kaLR4JO/t/ZFty5Yh
	2z3jQFpL/Tb9+06dPZQkmu0eheAl0cdHYINFlcMM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1788067976;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zeK19hlQXtYlkOA24aIRjsBQk0MgcXpYdFGf3Nt/4gs=;
	b=HHDY4eU823krm72m+9PyBy9kLEEo8el4cdtOvjkOxCbxskYr4hWZzvkuOaNKvgES
	KnR4JM6HU266UVjWFfXF3pju0dWOINsvMTQkcxmQ3CTztfTzO8tIMsIeDwgSFRspwjn
	k+1WVK4If5uHnsB19FeeVHF6zR16MLmF+HyNclZI=
Content-Type: multipart/mixed; boundary="===============8956261209584092616=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] re2c: upgrading to 4.6 SUCCEEDED
Message-ID: <010101a05128156a-aa9f1397-9f4b-45e0-b041-98c7040e20ee-000000@us-west-2.amazonses.com>
Date: Sun, 30 Aug 2026 05:32:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.30-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 05:33:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244641

--===============8956261209584092616==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *re2c* to *4.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-re2c-upgrade-4.5.1-4.6.patch
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
From 09fe024ab80f9634452046cf671c2f34fccc0853 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 30 Aug 2026 05:32:49 +0000
Subject: [PATCH] re2c: upgrade 4.5.1 -> 4.6

Source: CHANGELOG

4.6 (2026-08-29)
~~~~~~~~~~~~~~~~

- Added support for Zig labeled continue optimization.
  (`#580 <https://github.com/skvadrik/re2c/pull/580>`_).

- Updated C/C++ examples to use re2c features available in version 4.0 or higher.
---
 meta/recipes-support/re2c/{re2c_4.5.1.bb => re2c_4.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/re2c/{re2c_4.5.1.bb => re2c_4.6.bb} (90%)

diff --git a/meta/recipes-support/re2c/re2c_4.5.1.bb b/meta/recipes-support/re2c/re2c_4.6.bb
similarity index 90%
rename from meta/recipes-support/re2c/re2c_4.5.1.bb
rename to meta/recipes-support/re2c/re2c_4.6.bb
index ad33ef6a0b..70ce9c82e8 100644
--- a/meta/recipes-support/re2c/re2c_4.5.1.bb
+++ b/meta/recipes-support/re2c/re2c_4.6.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=64eca4d8a3b67f9dc7656094731a2c8d"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "ffea067c11aa668bcb42885be6e6cd000302000b7747d2bb213299ec66b7864e"
+SRC_URI[sha256sum] = "75bf2696445e831d0d44e0d9f2909eeffc18c09757f222b2fb025f7e59fe130b"
 GITHUB_BASE_URI = "https://github.com/skvadrik/re2c/releases"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.1


--===============8956261209584092616==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/re2c: SRC_URI changed from "https://github.com/skvadrik/re2c/releases/download/4.5.1/re2c-4.5.1.tar.xz" to "https://github.com/skvadrik/re2c/releases/download/4.6/re2c-4.6.tar.xz"
packages/x86-64-v3-poky-linux/re2c: PV changed from "4.5.1" to "4.6"
packages/x86-64-v3-poky-linux/re2c: PKGV changed from 4.5.1 [default] to 4.6 [default]
packages/x86-64-v3-poky-linux/re2c/re2c-dbg: PV changed from "4.5.1" to "4.6"
packages/x86-64-v3-poky-linux/re2c/re2c-dbg: PKGSIZE changed from 197744008 to 198085208 (+0%)
packages/x86-64-v3-poky-linux/re2c/re2c-dbg: PKGV changed from 4.5.1 [default] to 4.6 [default]
packages/x86-64-v3-poky-linux/re2c/re2c-dev: PV changed from "4.5.1" to "4.6"
packages/x86-64-v3-poky-linux/re2c/re2c-dev: PKGV changed from 4.5.1 [default] to 4.6 [default]
packages/x86-64-v3-poky-linux/re2c/re2c-doc: PV changed from "4.5.1" to "4.6"
packages/x86-64-v3-poky-linux/re2c/re2c-doc: PKGSIZE changed from 1851284 to 1858106 (+0%)
packages/x86-64-v3-poky-linux/re2c/re2c-doc: PKGV changed from 4.5.1 [default] to 4.6 [default]
packages/x86-64-v3-poky-linux/re2c/re2c-locale: PV changed from "4.5.1" to "4.6"
packages/x86-64-v3-poky-linux/re2c/re2c-locale: PKGV changed from 4.5.1 [default] to 4.6 [default]
packages/x86-64-v3-poky-linux/re2c/re2c-src: PV changed from "4.5.1" to "4.6"
packages/x86-64-v3-poky-linux/re2c/re2c-src: PKGSIZE changed from 1836662 to 1847372 (+1%)
packages/x86-64-v3-poky-linux/re2c/re2c-src: FILELIST: directory renamed /usr/src/debug/re2c/4.5.1/src/adfa -> /usr/src/debug/re2c/4.6/src/adfa, directory renamed /usr/src/debug/re2c/4.5.1/src/encoding -> /usr/src/debug/re2c/4.6/src/encoding, directory renamed /usr/src/debug/re2c/4.5.1/src/util -> /usr/src/debug/re2c/4.6/src/util, directory renamed /usr/src/debug/re2c/4.5.1/src/debug -> /usr/src/debug/re2c/4.6/src/debug, directory renamed /usr/src/debug/re2c/4.5.1/src/cfg -> /usr/src/debug/re2c/4.6/src/cfg, directory renamed /usr/src/debug/re2c/4.5.1/src -> /usr/src/debug/re2c/4.6/src, directory renamed /usr/src/debug/re2c/4.5.1/src/msg -> /usr/src/debug/re2c/4.6/src/msg, directory renamed /usr/src/debug/re2c/4.5.1/src/regexp -> /usr/src/debug/re2c/4.6/src/regexp, directory renamed /usr/src/debug/re2c/4.5.1/src/dfa -> /usr/src/debug/re2c/4.6/src/dfa, directory renamed /usr/src/debug/re2c/4.5.1/src/nfa -> /usr/src/debug/re2c/4.6/src/nfa, directory renamed /usr/src/debug/re2c/4.5.1/src
 /parse -> /usr/src/debug/re2c/4.6/src/parse, directory renamed /usr/src/debug/re2c/4.5.1/src/options -> /usr/src/debug/re2c/4.6/src/options, directory renamed /usr/src/debug/re2c/4.5.1/src/skeleton -> /usr/src/debug/re2c/4.6/src/skeleton, directory renamed /usr/src/debug/re2c/4.5.1/src/test/range -> /usr/src/debug/re2c/4.6/src/test/range, directory renamed /usr/src/debug/re2c/4.5.1/src/codegen -> /usr/src/debug/re2c/4.6/src/codegen
packages/x86-64-v3-poky-linux/re2c/re2c-src: PKGV changed from 4.5.1 [default] to 4.6 [default]
packages/x86-64-v3-poky-linux/re2c/re2c-staticdev: PV changed from "4.5.1" to "4.6"
packages/x86-64-v3-poky-linux/re2c/re2c-staticdev: PKGV changed from 4.5.1 [default] to 4.6 [default]
packages/x86-64-v3-poky-linux/re2c/re2c: PV changed from "4.5.1" to "4.6"
packages/x86-64-v3-poky-linux/re2c/re2c: PKGSIZE changed from 13373711 to 13419165 (+0%)
packages/x86-64-v3-poky-linux/re2c/re2c: PKGV changed from 4.5.1 [default] to 4.6 [default]

--===============8956261209584092616==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-re2c-upgrade-4.5.1-4.6.patch"

RnJvbSAwOWZlMDI0YWI4MGY5NjM0NDUyMDQ2Y2Y2NzFjMmYzNGZjY2MwODUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMzAgQXVnIDIwMjYgMDU6MzI6NDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
ZTJjOiB1cGdyYWRlIDQuNS4xIC0+IDQuNgoKU291cmNlOiBDSEFOR0VMT0cKCjQuNiAoMjAyNi0w
OC0yOSkKfn5+fn5+fn5+fn5+fn5+fgoKLSBBZGRlZCBzdXBwb3J0IGZvciBaaWcgbGFiZWxlZCBj
b250aW51ZSBvcHRpbWl6YXRpb24uCiAgKGAjNTgwIDxodHRwczovL2dpdGh1Yi5jb20vc2t2YWRy
aWsvcmUyYy9wdWxsLzU4MD5gXykuCgotIFVwZGF0ZWQgQy9DKysgZXhhbXBsZXMgdG8gdXNlIHJl
MmMgZmVhdHVyZXMgYXZhaWxhYmxlIGluIHZlcnNpb24gNC4wIG9yIGhpZ2hlci4KLS0tCiBtZXRh
L3JlY2lwZXMtc3VwcG9ydC9yZTJjL3tyZTJjXzQuNS4xLmJiID0+IHJlMmNfNC42LmJifSB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1zdXBwb3J0L3JlMmMve3JlMmNfNC41LjEuYmIgPT4gcmUyY180LjYuYmJ9
ICg5MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvcmUyYy9yZTJjXzQuNS4x
LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvcmUyYy9yZTJjXzQuNi5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDkwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9yZTJjL3JlMmNfNC41LjEu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3JlMmMvcmUyY180LjYuYmIKaW5kZXgg
YWQzM2VmNmEwYi4uNzBjZTljODJlOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
cmUyYy9yZTJjXzQuNS4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3JlMmMvcmUyY180
LjYuYmIKQEAgLTgsNyArOCw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7
bWQ1PTY0ZWNhNGQ4YTNiNjdmOWRjNzY1NjA5NDczMWEyYzhkIgogCiBTUkNfVVJJID0gIiR7R0lU
SFVCX0JBU0VfVVJJfS9kb3dubG9hZC8ke1BWfS8ke0JQTn0tJHtQVn0udGFyLnh6IgogCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiZmZlYTA2N2MxMWFhNjY4YmNiNDI4ODViZTZlNmNkMDAwMzAyMDAw
Yjc3NDdkMmJiMjEzMjk5ZWM2NmI3ODY0ZSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI3NWJmMjY5
NjQ0NWU4MzFkMGQ0NGUwZDlmMjkwOWVlZmZjMThjMDk3NTdmMjIyYjJmYjAyNWY3ZTU5ZmUxMzBi
IgogR0lUSFVCX0JBU0VfVVJJID0gImh0dHBzOi8vZ2l0aHViLmNvbS9za3ZhZHJpay9yZTJjL3Jl
bGVhc2VzIgogCiBCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCi0tIAoyLjQ3LjEK
Cg==

--===============8956261209584092616==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="re2c-changelog.txt"

Changelog for re2c: 4.5.1 -> 4.6
Source: CHANGELOG

4.6 (2026-08-29)
~~~~~~~~~~~~~~~~

- Added support for Zig labeled continue optimization.
  (`#580 <https://github.com/skvadrik/re2c/pull/580>`_).

- Updated C/C++ examples to use re2c features available in version 4.0 or higher.

--===============8956261209584092616==--

