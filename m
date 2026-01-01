Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A62EEB582
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 11:38:10 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.103055.1767267472433691631
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 03:38:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ac6z982Q;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=jXgbvdiN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019b7959c008-4cdd0020-a79a-464c-874c-450c80c52a9c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1767267483;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=A4pTiGl5NhtgAunmqmd58BBSAHOz+kdNizPyPOhySjA=;
	b=ac6z982QtYeMJf9f1BDrg1TukRO4ImrMzyUE0p3pYyr0ArLOfZfzR9d8GSWa62dF
	dYIq/efdT5Pjp16o/3XRQL6iJ/3LPjzb5mzU/fhsjb29ugCCnpGcjUNOGARo0BjbJkB
	t3hBk0LfxtCxsF5h3qRgM0BdKvZtrRkxDVePhhKk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1767267483;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=A4pTiGl5NhtgAunmqmd58BBSAHOz+kdNizPyPOhySjA=;
	b=jXgbvdiNsYTnKBQDWlxHIEJwq00rDFYXohBMUlvokZfjiUcO8AbQYdDSy1wMYYOe
	8p/oEM0LcFNdQmhCxiMD9Cyw3dW1cEEVG0O2x9sl39cblU7N8s/RScJnV0+DAx4U9Rv
	dnaKOGkGY7+Cc88t5VO7Ho5vX3Q+342r9MeHxgLA=
Content-Type: multipart/mixed; boundary="===============2483398963885344415=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] re2c: upgrading to 4.4 SUCCEEDED
Message-ID: <0101019b7959c008-4cdd0020-a79a-464c-874c-450c80c52a9c-000000@us-west-2.amazonses.com>
Date: Thu, 1 Jan 2026 11:38:03 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 11:38:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228813

--===============2483398963885344415==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *re2c* to *4.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-re2c-upgrade-4.3.1-4.4.patch
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
From ca57839db0a7cd3b392fef72cd65bf7f9b6c814a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Jan 2026 11:35:17 +0000
Subject: [PATCH] re2c: upgrade 4.3.1 -> 4.4

---
 meta/recipes-support/re2c/{re2c_4.3.1.bb => re2c_4.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/re2c/{re2c_4.3.1.bb => re2c_4.4.bb} (90%)

diff --git a/meta/recipes-support/re2c/re2c_4.3.1.bb b/meta/recipes-support/re2c/re2c_4.4.bb
similarity index 90%
rename from meta/recipes-support/re2c/re2c_4.3.1.bb
rename to meta/recipes-support/re2c/re2c_4.4.bb
index bead73279f..3be66d1388 100644
--- a/meta/recipes-support/re2c/re2c_4.3.1.bb
+++ b/meta/recipes-support/re2c/re2c_4.4.bb
@@ -7,7 +7,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=64eca4d8a3b67f9dc7656094731a2c8d"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "5f5e8a618960f68bb46ee8728ecd4132e1275b595cfc7a48476f977afd01d0cc"
+SRC_URI[sha256sum] = "6b6b865924447ef992d5db4e52fb9307e5f65f26edd43efa91395da810f4280a"
 GITHUB_BASE_URI = "https://github.com/skvadrik/re2c/releases"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.1


--===============2483398963885344415==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/re2c: PKGV changed from 4.3.1 [default] to 4.4 [default]
packages/x86-64-v3-poky-linux/re2c: PV changed from "4.3.1" to "4.4"
packages/x86-64-v3-poky-linux/re2c: SRC_URI changed from "https://github.com/skvadrik/re2c/releases/download/4.3.1/re2c-4.3.1.tar.xz" to "https://github.com/skvadrik/re2c/releases/download/4.4/re2c-4.4.tar.xz"
packages/x86-64-v3-poky-linux/re2c/re2c-dbg: PKGSIZE changed from 198303864 to 197102112 (-1%)
packages/x86-64-v3-poky-linux/re2c/re2c-dbg: PKGV changed from 4.3.1 [default] to 4.4 [default]
packages/x86-64-v3-poky-linux/re2c/re2c-dbg: PV changed from "4.3.1" to "4.4"
packages/x86-64-v3-poky-linux/re2c/re2c-dev: PKGV changed from 4.3.1 [default] to 4.4 [default]
packages/x86-64-v3-poky-linux/re2c/re2c-dev: PV changed from "4.3.1" to "4.4"
packages/x86-64-v3-poky-linux/re2c/re2c-doc: PKGSIZE changed from 1841767 to 1850085 (+0%)
packages/x86-64-v3-poky-linux/re2c/re2c-doc: PKGV changed from 4.3.1 [default] to 4.4 [default]
packages/x86-64-v3-poky-linux/re2c/re2c-doc: PV changed from "4.3.1" to "4.4"
packages/x86-64-v3-poky-linux/re2c/re2c-locale: PKGV changed from 4.3.1 [default] to 4.4 [default]
packages/x86-64-v3-poky-linux/re2c/re2c-locale: PV changed from "4.3.1" to "4.4"
packages/x86-64-v3-poky-linux/re2c/re2c-src: PKGSIZE changed from 1763991 to 1769258 (+0%)
packages/x86-64-v3-poky-linux/re2c/re2c-src: FILELIST: directory renamed /usr/src/debug/re2c/4.3.1/src/dfa -> /usr/src/debug/re2c/4.4/src/dfa, directory renamed /usr/src/debug/re2c/4.3.1/src/nfa -> /usr/src/debug/re2c/4.4/src/nfa, directory renamed /usr/src/debug/re2c/4.3.1/src/cfg -> /usr/src/debug/re2c/4.4/src/cfg, directory renamed /usr/src/debug/re2c/4.3.1/src -> /usr/src/debug/re2c/4.4/src, directory renamed /usr/src/debug/re2c/4.3.1/src/msg -> /usr/src/debug/re2c/4.4/src/msg, directory renamed /usr/src/debug/re2c/4.3.1/src/parse -> /usr/src/debug/re2c/4.4/src/parse, directory renamed /usr/src/debug/re2c/4.3.1/src/encoding -> /usr/src/debug/re2c/4.4/src/encoding, directory renamed /usr/src/debug/re2c/4.3.1/src/options -> /usr/src/debug/re2c/4.4/src/options, directory renamed /usr/src/debug/re2c/4.3.1/src/regexp -> /usr/src/debug/re2c/4.4/src/regexp, directory renamed /usr/src/debug/re2c/4.3.1/src/adfa -> /usr/src/debug/re2c/4.4/src/adfa, directory renamed /usr/src/debug/re2c/4.3
 .1/src/skeleton -> /usr/src/debug/re2c/4.4/src/skeleton, directory renamed /usr/src/debug/re2c/4.3.1/src/util -> /usr/src/debug/re2c/4.4/src/util, directory renamed /usr/src/debug/re2c/4.3.1/src/test/range -> /usr/src/debug/re2c/4.4/src/test/range, directory renamed /usr/src/debug/re2c/4.3.1/src/codegen -> /usr/src/debug/re2c/4.4/src/codegen, directory renamed /usr/src/debug/re2c/4.3.1/src/debug -> /usr/src/debug/re2c/4.4/src/debug
packages/x86-64-v3-poky-linux/re2c/re2c-src: PKGV changed from 4.3.1 [default] to 4.4 [default]
packages/x86-64-v3-poky-linux/re2c/re2c-src: PV changed from "4.3.1" to "4.4"
packages/x86-64-v3-poky-linux/re2c/re2c-staticdev: PKGV changed from 4.3.1 [default] to 4.4 [default]
packages/x86-64-v3-poky-linux/re2c/re2c-staticdev: PV changed from "4.3.1" to "4.4"
packages/x86-64-v3-poky-linux/re2c/re2c: PKGSIZE changed from 12643460 to 12645009 (+0%)
packages/x86-64-v3-poky-linux/re2c/re2c: PKGV changed from 4.3.1 [default] to 4.4 [default]
packages/x86-64-v3-poky-linux/re2c/re2c: PV changed from "4.3.1" to "4.4"

--===============2483398963885344415==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-re2c-upgrade-4.3.1-4.4.patch"

RnJvbSBjYTU3ODM5ZGIwYTdjZDNiMzkyZmVmNzJjZDY1YmY3ZjliNmM4MTRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKYW4gMjAyNiAxMTozNToxNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJl
MmM6IHVwZ3JhZGUgNC4zLjEgLT4gNC40CgotLS0KIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3JlMmMv
e3JlMmNfNC4zLjEuYmIgPT4gcmUyY180LjQuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQv
cmUyYy97cmUyY180LjMuMS5iYiA9PiByZTJjXzQuNC5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9yZTJjL3JlMmNfNC4zLjEuYmIgYi9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9yZTJjL3JlMmNfNC40LmJiCnNpbWlsYXJpdHkgaW5kZXggOTAlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1zdXBwb3J0L3JlMmMvcmUyY180LjMuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvcmUyYy9yZTJjXzQuNC5iYgppbmRleCBiZWFkNzMyNzlmLi4zYmU2NmQxMzg4
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9yZTJjL3JlMmNfNC4zLjEuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvcmUyYy9yZTJjXzQuNC5iYgpAQCAtNyw3ICs3LDcgQEAg
TElDRU5TRSA9ICJQRCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTY0
ZWNhNGQ4YTNiNjdmOWRjNzY1NjA5NDczMWEyYzhkIgogCiBTUkNfVVJJID0gIiR7R0lUSFVCX0JB
U0VfVVJJfS9kb3dubG9hZC8ke1BWfS8ke0JQTn0tJHtQVn0udGFyLnh6IgotU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjVmNWU4YTYxODk2MGY2OGJiNDZlZTg3MjhlY2Q0MTMyZTEyNzViNTk1Y2ZjN2E0
ODQ3NmY5NzdhZmQwMWQwY2MiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNmI2Yjg2NTkyNDQ0N2Vm
OTkyZDVkYjRlNTJmYjkzMDdlNWY2NWYyNmVkZDQzZWZhOTEzOTVkYTgxMGY0MjgwYSIKIEdJVEhV
Ql9CQVNFX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20vc2t2YWRyaWsvcmUyYy9yZWxlYXNlcyIK
IAogQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgotLSAKMi40Ny4xCgo=

--===============2483398963885344415==--

