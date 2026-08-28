Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2CA0C61DD3
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 05:57:52 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.421.1787896671370317528
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 22:57:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=aE1p/8EH;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=H27i9/Xr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a046f228d5-8aec7949-a2b9-4107-9667-3284b8568242-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787896670;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jc5rGZ/3L6QY+I1U1+QgbI9D8492p0pvjDktOYSCX0I=;
	b=aE1p/8EHtASA7X6xJTgaraKotIDXkMw7v5ZoWorBYDpZbHfGU8H734+O+zTN+r81
	/QeTqzkLgRHEFhHpwF5XLjPN1IFyWIRat/OWWaQMRcfRxps7QLugJnFvFMjEUyes4YG
	SaORRWG0IuflpFhRtStE3SX9V/BDCgk2L6mixPV8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787896670;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jc5rGZ/3L6QY+I1U1+QgbI9D8492p0pvjDktOYSCX0I=;
	b=H27i9/Xry558Q4hFaBiMEQcdo34ijOy1DP/RWi1ELkkPlSayaPZ0TYelD5qbcP8R
	B9T3XAgVTmbFc6xyhEAH8uczgVI95KE1jH+P1KuwNHWDBnqb2wrImzahRai7C2gYDTY
	NjMTSPwIEA1wSWawEO9MbW/LttHhl0dWyAMhrkfM=
Content-Type: multipart/mixed; boundary="===============5321857065705793495=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dos2unix: upgrading to 7.5.7 SUCCEEDED
Message-ID: <010101a046f228d5-8aec7949-a2b9-4107-9667-3284b8568242-000000@us-west-2.amazonses.com>
Date: Fri, 28 Aug 2026 05:57:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.28-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 05:57:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244512

--===============5321857065705793495==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *dos2unix* to *7.5.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dos2unix-upgrade-7.5.6-7.5.7.patch
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
From 27bd621468e6cd12860f4dd40d7a1bc2e4f90a77 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 28 Aug 2026 05:57:43 +0000
Subject: [PATCH] dos2unix: upgrade 7.5.6 -> 7.5.7

Source: dos2unix/ChangeLog.txt

2026-08-27 Erwin Waterlander <waterlan@xs4all.nl>
	* Version 7.5.7

2026-08-18 Erwin Waterlander <waterlan@xs4all.nl>
	* Safer way to read BOM using a lookahead buffer.
	  No more use of consecutive ungetc() calls.
	  dos2unix is now ungetc() free.

2026-08-16 Erwin Waterlander <waterlan@xs4all.nl>
	* Refactored code. Simpler mac2unix algorithm.
	  ungetc() is no longer used.

2026-08-02 Erwin Waterlander <waterlan@xs4all.nl>
	* Fixed possible memory leak in handling Unicode
	  arguments on Windows.

2026-07-29 Erwin Waterlander <waterlan@xs4all.nl>
	* Removed the use of strcpy()

2026-07-25 Erwin Waterlander <waterlan@xs4all.nl>
	* mac2unix/unix2mac: Fixed counting line breaks
	  in verbose mode of files with mixed line break
	  types.

2026-07-09 <acts1631kjv@proton.me>
	* Fixed the processing of files containing only
	  half a BOM (Found by AI).
	* unix2dos: Fixed conversion of a DOS line break
	  immediately after a Mac line break (Found by AI).

2026-07-07 <acts1631kjv@proton.me>
	* Detect a missing UTF-16 low surrogate
	  at the end of a file (Found by AI).

	  ungetc() is no longer used.
---
 .../dos2unix/{dos2unix_7.5.6.bb => dos2unix_7.5.7.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/dos2unix/{dos2unix_7.5.6.bb => dos2unix_7.5.7.bb} (95%)

diff --git a/meta/recipes-support/dos2unix/dos2unix_7.5.6.bb b/meta/recipes-support/dos2unix/dos2unix_7.5.7.bb
similarity index 95%
rename from meta/recipes-support/dos2unix/dos2unix_7.5.6.bb
rename to meta/recipes-support/dos2unix/dos2unix_7.5.7.bb
index 8ef1d427e3..d081ed2bc8 100644
--- a/meta/recipes-support/dos2unix/dos2unix_7.5.6.bb
+++ b/meta/recipes-support/dos2unix/dos2unix_7.5.7.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=af1174fd3d1a254eec3a4a1d1da170a9"
 SRC_URI = "git://git.code.sf.net/p/dos2unix/dos2unix;branch=master;protocol=https;tag=${BPN}-${PV}"
 UPSTREAM_CHECK_GITTAGREGEX = "dos2unix-(?P<pver>(\d+(\.\d+)+))"
 
-SRCREV = "9c2ea173af3bc49324f8288d81c5a2bbfc0884d0"
+SRCREV = "5a6f3306165567e9828d694d73705ad86366cc61"
 
 S = "${UNPACKDIR}/${BP}/dos2unix"
 
-- 
2.47.1


--===============5321857065705793495==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/dos2unix/dos2unix-doc: FILELIST: directory renamed /usr/share/doc/dos2unix-7.5.6 -> /usr/share/doc/dos2unix-7.5.7

--===============5321857065705793495==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/dos2unix/dos2unix-dbg: PKGSIZE changed from 284232 to 299848 (+5%)
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-dbg: PKGV changed from 7.5.6 [default] to 7.5.7 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-dbg: PV changed from "7.5.6" to "7.5.7"
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-dev: PKGV changed from 7.5.6 [default] to 7.5.7 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-dev: PV changed from "7.5.6" to "7.5.7"
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-doc: PKGSIZE changed from 209374 to 211100 (+1%)
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-doc: FILELIST: directory renamed /usr/share/doc/dos2unix-7.5.6 -> /usr/share/doc/dos2unix-7.5.7
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-doc: PKGV changed from 7.5.6 [default] to 7.5.7 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-doc: PV changed from "7.5.6" to "7.5.7"
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-locale: PKGV changed from 7.5.6 [default] to 7.5.7 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-locale: PV changed from "7.5.6" to "7.5.7"
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-src: PKGSIZE changed from 201906 to 209534 (+4%)
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-src: FILELIST: directory renamed /usr/src/debug/dos2unix/7.5.6 -> /usr/src/debug/dos2unix/7.5.7
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-src: PKGV changed from 7.5.6 [default] to 7.5.7 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-src: PV changed from "7.5.6" to "7.5.7"
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-staticdev: PKGV changed from 7.5.6 [default] to 7.5.7 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-staticdev: PV changed from "7.5.6" to "7.5.7"
packages/x86-64-v3-poky-linux/dos2unix/dos2unix: PKGSIZE changed from 118928 to 127120 (+7%)
packages/x86-64-v3-poky-linux/dos2unix/dos2unix: PKGV changed from 7.5.6 [default] to 7.5.7 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix: PV changed from "7.5.6" to "7.5.7"
packages/x86-64-v3-poky-linux/dos2unix: SRC_URI changed from "git://git.code.sf.net/p/dos2unix/dos2unix;branch=master;protocol=https;tag=dos2unix-7.5.6" to "git://git.code.sf.net/p/dos2unix/dos2unix;branch=master;protocol=https;tag=dos2unix-7.5.7"
packages/x86-64-v3-poky-linux/dos2unix: PKGV changed from 7.5.6 [default] to 7.5.7 [default]
packages/x86-64-v3-poky-linux/dos2unix: PV changed from "7.5.6" to "7.5.7"

--===============5321857065705793495==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="dos2unix-changelog.txt"

Changelog for dos2unix: 7.5.6 -> 7.5.7
Source: dos2unix/ChangeLog.txt

2026-08-27 Erwin Waterlander <waterlan@xs4all.nl>
	* Version 7.5.7

2026-08-18 Erwin Waterlander <waterlan@xs4all.nl>
	* Safer way to read BOM using a lookahead buffer.
	  No more use of consecutive ungetc() calls.
	  dos2unix is now ungetc() free.

2026-08-16 Erwin Waterlander <waterlan@xs4all.nl>
	* Refactored code. Simpler mac2unix algorithm.
	  ungetc() is no longer used.

2026-08-02 Erwin Waterlander <waterlan@xs4all.nl>
	* Fixed possible memory leak in handling Unicode
	  arguments on Windows.

2026-07-29 Erwin Waterlander <waterlan@xs4all.nl>
	* Removed the use of strcpy()

2026-07-25 Erwin Waterlander <waterlan@xs4all.nl>
	* mac2unix/unix2mac: Fixed counting line breaks
	  in verbose mode of files with mixed line break
	  types.

2026-07-09 <acts1631kjv@proton.me>
	* Fixed the processing of files containing only
	  half a BOM (Found by AI).
	* unix2dos: Fixed conversion of a DOS line break
	  immediately after a Mac line break (Found by AI).

2026-07-07 <acts1631kjv@proton.me>
	* Detect a missing UTF-16 low surrogate
	  at the end of a file (Found by AI).

	  ungetc() is no longer used.

--===============5321857065705793495==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dos2unix-upgrade-7.5.6-7.5.7.patch"

RnJvbSAyN2JkNjIxNDY4ZTZjZDEyODYwZjRkZDQwZDdhMWJjMmU0ZjkwYTc3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMjggQXVnIDIwMjYgMDU6NTc6NDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
b3MydW5peDogdXBncmFkZSA3LjUuNiAtPiA3LjUuNwoKU291cmNlOiBkb3MydW5peC9DaGFuZ2VM
b2cudHh0CgoyMDI2LTA4LTI3IEVyd2luIFdhdGVybGFuZGVyIDx3YXRlcmxhbkB4czRhbGwubmw+
CgkqIFZlcnNpb24gNy41LjcKCjIwMjYtMDgtMTggRXJ3aW4gV2F0ZXJsYW5kZXIgPHdhdGVybGFu
QHhzNGFsbC5ubD4KCSogU2FmZXIgd2F5IHRvIHJlYWQgQk9NIHVzaW5nIGEgbG9va2FoZWFkIGJ1
ZmZlci4KCSAgTm8gbW9yZSB1c2Ugb2YgY29uc2VjdXRpdmUgdW5nZXRjKCkgY2FsbHMuCgkgIGRv
czJ1bml4IGlzIG5vdyB1bmdldGMoKSBmcmVlLgoKMjAyNi0wOC0xNiBFcndpbiBXYXRlcmxhbmRl
ciA8d2F0ZXJsYW5AeHM0YWxsLm5sPgoJKiBSZWZhY3RvcmVkIGNvZGUuIFNpbXBsZXIgbWFjMnVu
aXggYWxnb3JpdGhtLgoJICB1bmdldGMoKSBpcyBubyBsb25nZXIgdXNlZC4KCjIwMjYtMDgtMDIg
RXJ3aW4gV2F0ZXJsYW5kZXIgPHdhdGVybGFuQHhzNGFsbC5ubD4KCSogRml4ZWQgcG9zc2libGUg
bWVtb3J5IGxlYWsgaW4gaGFuZGxpbmcgVW5pY29kZQoJICBhcmd1bWVudHMgb24gV2luZG93cy4K
CjIwMjYtMDctMjkgRXJ3aW4gV2F0ZXJsYW5kZXIgPHdhdGVybGFuQHhzNGFsbC5ubD4KCSogUmVt
b3ZlZCB0aGUgdXNlIG9mIHN0cmNweSgpCgoyMDI2LTA3LTI1IEVyd2luIFdhdGVybGFuZGVyIDx3
YXRlcmxhbkB4czRhbGwubmw+CgkqIG1hYzJ1bml4L3VuaXgybWFjOiBGaXhlZCBjb3VudGluZyBs
aW5lIGJyZWFrcwoJICBpbiB2ZXJib3NlIG1vZGUgb2YgZmlsZXMgd2l0aCBtaXhlZCBsaW5lIGJy
ZWFrCgkgIHR5cGVzLgoKMjAyNi0wNy0wOSA8YWN0czE2MzFranZAcHJvdG9uLm1lPgoJKiBGaXhl
ZCB0aGUgcHJvY2Vzc2luZyBvZiBmaWxlcyBjb250YWluaW5nIG9ubHkKCSAgaGFsZiBhIEJPTSAo
Rm91bmQgYnkgQUkpLgoJKiB1bml4MmRvczogRml4ZWQgY29udmVyc2lvbiBvZiBhIERPUyBsaW5l
IGJyZWFrCgkgIGltbWVkaWF0ZWx5IGFmdGVyIGEgTWFjIGxpbmUgYnJlYWsgKEZvdW5kIGJ5IEFJ
KS4KCjIwMjYtMDctMDcgPGFjdHMxNjMxa2p2QHByb3Rvbi5tZT4KCSogRGV0ZWN0IGEgbWlzc2lu
ZyBVVEYtMTYgbG93IHN1cnJvZ2F0ZQoJICBhdCB0aGUgZW5kIG9mIGEgZmlsZSAoRm91bmQgYnkg
QUkpLgoKCSAgdW5nZXRjKCkgaXMgbm8gbG9uZ2VyIHVzZWQuCi0tLQogLi4uL2RvczJ1bml4L3tk
b3MydW5peF83LjUuNi5iYiA9PiBkb3MydW5peF83LjUuNy5iYn0gICAgICAgICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLXN1cHBvcnQvZG9zMnVuaXgve2RvczJ1bml4XzcuNS42LmJiID0+IGRvczJ1bml4
XzcuNS43LmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RvczJ1
bml4L2RvczJ1bml4XzcuNS42LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZG9zMnVuaXgvZG9z
MnVuaXhfNy41LjcuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZG9zMnVuaXgvZG9zMnVuaXhfNy41LjYuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L2RvczJ1bml4L2RvczJ1bml4XzcuNS43LmJiCmluZGV4IDhlZjFkNDI3ZTMu
LmQwODFlZDJiYzggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RvczJ1bml4L2Rv
czJ1bml4XzcuNS42LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RvczJ1bml4L2RvczJ1
bml4XzcuNS43LmJiCkBAIC0xMSw3ICsxMSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0NPUFlJTkcudHh0O21kNT1hZjExNzRmZDNkMWEyNTRlZWMzYTRhMWQxZGExNzBhOSIKIFNSQ19V
UkkgPSAiZ2l0Oi8vZ2l0LmNvZGUuc2YubmV0L3AvZG9zMnVuaXgvZG9zMnVuaXg7YnJhbmNoPW1h
c3Rlcjtwcm90b2NvbD1odHRwczt0YWc9JHtCUE59LSR7UFZ9IgogVVBTVFJFQU1fQ0hFQ0tfR0lU
VEFHUkVHRVggPSAiZG9zMnVuaXgtKD9QPHB2ZXI+KFxkKyhcLlxkKykrKSkiCiAKLVNSQ1JFViA9
ICI5YzJlYTE3M2FmM2JjNDkzMjRmODI4OGQ4MWM1YTJiYmZjMDg4NGQwIgorU1JDUkVWID0gIjVh
NmYzMzA2MTY1NTY3ZTk4MjhkNjk0ZDczNzA1YWQ4NjM2NmNjNjEiCiAKIFMgPSAiJHtVTlBBQ0tE
SVJ9LyR7QlB9L2RvczJ1bml4IgogCi0tIAoyLjQ3LjEKCg==

--===============5321857065705793495==--

