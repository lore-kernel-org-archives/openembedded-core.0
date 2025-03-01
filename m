Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82FDAC3601A
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 11:25:50 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.7043.1740828315055188994
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 03:25:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ReVgPsw8;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=FGkxfTgR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101955174722a-fbd90667-9a94-439a-b410-f00be316c0d1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1740828340;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TfAvT9AGrJiJ4BJFaTN0I5JKczgk9TETINmLlxX8Hv0=;
	b=ReVgPsw8OfZHCtYlIowYWf4yE2dLO3t7I8lxx/tLt+XOnYNaWP7wqsnufd8uNr9T
	FRy04BSx3+Rz8zMJpziDMIy/MxbfExNjBKctn9ukAA1d7UBy3YBSmmc+zw5D7duJTFn
	0RLxgllQGtjItGGvRFEzDcvwjWOi5J6DGPDoc47I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1740828340;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TfAvT9AGrJiJ4BJFaTN0I5JKczgk9TETINmLlxX8Hv0=;
	b=FGkxfTgRqSF26/8L2ve/Aa39VhXOzyoga1fByhrmzIX81JIfaAWQCFbxFRg1HC6X
	iHBLXLjh8EjpUiHst9uldptf1bRw0AfqhE47egWHzDq7MDmwzCLAm0puvKu+czs0xT6
	7Qgr6FdO0EgVjpVrsdJdvDQsWGkAcwa3TEI0tDL0=
Content-Type: multipart/mixed; boundary="===============4856187204158156429=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] re2c: upgrading to 4.1 SUCCEEDED
Message-ID: <010101955174722a-fbd90667-9a94-439a-b410-f00be316c0d1-000000@us-west-2.amazonses.com>
Date: Sat, 1 Mar 2025 11:25:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 11:25:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212177

--===============4856187204158156429==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *re2c* to *4.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-re2c-upgrade-4.0.2-4.1.patch
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
From 2fd9458659a23d03d07001898b6886a875514718 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Mar 2025 11:21:39 +0000
Subject: [PATCH] re2c: upgrade 4.0.2 -> 4.1

---
 meta/recipes-support/re2c/{re2c_4.0.2.bb => re2c_4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/re2c/{re2c_4.0.2.bb => re2c_4.1.bb} (90%)

diff --git a/meta/recipes-support/re2c/re2c_4.0.2.bb b/meta/recipes-support/re2c/re2c_4.1.bb
similarity index 90%
rename from meta/recipes-support/re2c/re2c_4.0.2.bb
rename to meta/recipes-support/re2c/re2c_4.1.bb
index 2a0fb197ff..238f95f745 100644
--- a/meta/recipes-support/re2c/re2c_4.0.2.bb
+++ b/meta/recipes-support/re2c/re2c_4.1.bb
@@ -7,7 +7,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=64eca4d8a3b67f9dc7656094731a2c8d"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "5e52ce0e26326115e41bc45d34dc2d5e10f2e44ed3a413fa2a826aa3500c8d56"
+SRC_URI[sha256sum] = "cd7d9bbadb3f04f20da25e20e155655de57beef48e0807266938069f0e322e8b"
 GITHUB_BASE_URI = "https://github.com/skvadrik/re2c/releases"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.44.1


--===============4856187204158156429==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/re2c: PV changed from "4.0.2" to "4.1"
packages/core2-64-poky-linux/re2c: PKGV changed from 4.0.2 [default] to 4.1 [default]
packages/core2-64-poky-linux/re2c: SRC_URI changed from "https://github.com/skvadrik/re2c/releases/download/4.0.2/re2c-4.0.2.tar.xz" to "https://github.com/skvadrik/re2c/releases/download/4.1/re2c-4.1.tar.xz"
packages/core2-64-poky-linux/re2c/re2c-dbg: PV changed from "4.0.2" to "4.1"
packages/core2-64-poky-linux/re2c/re2c-dbg: PKGSIZE changed from 176467104 to 178238232 (+1%)
packages/core2-64-poky-linux/re2c/re2c-dbg: PKGV changed from 4.0.2 [default] to 4.1 [default]
packages/core2-64-poky-linux/re2c/re2c-dev: PV changed from "4.0.2" to "4.1"
packages/core2-64-poky-linux/re2c/re2c-dev: PKGV changed from 4.0.2 [default] to 4.1 [default]
packages/core2-64-poky-linux/re2c/re2c-doc: PV changed from "4.0.2" to "4.1"
packages/core2-64-poky-linux/re2c/re2c-doc: PKGSIZE changed from 1631316 to 1648952 (+1%)
packages/core2-64-poky-linux/re2c/re2c-doc: PKGV changed from 4.0.2 [default] to 4.1 [default]
packages/core2-64-poky-linux/re2c/re2c-locale: PV changed from "4.0.2" to "4.1"
packages/core2-64-poky-linux/re2c/re2c-locale: PKGV changed from 4.0.2 [default] to 4.1 [default]
packages/core2-64-poky-linux/re2c/re2c-src: PV changed from "4.0.2" to "4.1"
packages/core2-64-poky-linux/re2c/re2c-src: PKGSIZE changed from 1675689 to 1689772 (+1%)
packages/core2-64-poky-linux/re2c/re2c-src: PKGV changed from 4.0.2 [default] to 4.1 [default]
packages/core2-64-poky-linux/re2c/re2c-staticdev: PV changed from "4.0.2" to "4.1"
packages/core2-64-poky-linux/re2c/re2c-staticdev: PKGV changed from 4.0.2 [default] to 4.1 [default]
packages/core2-64-poky-linux/re2c/re2c: PV changed from "4.0.2" to "4.1"
packages/core2-64-poky-linux/re2c/re2c: PKGSIZE changed from 11090908 to 11214280 (+1%)
packages/core2-64-poky-linux/re2c/re2c: PKGV changed from 4.0.2 [default] to 4.1 [default]

--===============4856187204158156429==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-re2c-upgrade-4.0.2-4.1.patch"

RnJvbSAyZmQ5NDU4NjU5YTIzZDAzZDA3MDAxODk4YjY4ODZhODc1NTE0NzE4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBNYXIgMjAyNSAxMToyMTozOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJl
MmM6IHVwZ3JhZGUgNC4wLjIgLT4gNC4xCgotLS0KIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3JlMmMv
e3JlMmNfNC4wLjIuYmIgPT4gcmUyY180LjEuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQv
cmUyYy97cmUyY180LjAuMi5iYiA9PiByZTJjXzQuMS5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9yZTJjL3JlMmNfNC4wLjIuYmIgYi9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9yZTJjL3JlMmNfNC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTAlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1zdXBwb3J0L3JlMmMvcmUyY180LjAuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvcmUyYy9yZTJjXzQuMS5iYgppbmRleCAyYTBmYjE5N2ZmLi4yMzhmOTVmNzQ1
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9yZTJjL3JlMmNfNC4wLjIuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvcmUyYy9yZTJjXzQuMS5iYgpAQCAtNyw3ICs3LDcgQEAg
TElDRU5TRSA9ICJQRCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTY0
ZWNhNGQ4YTNiNjdmOWRjNzY1NjA5NDczMWEyYzhkIgogCiBTUkNfVVJJID0gIiR7R0lUSFVCX0JB
U0VfVVJJfS9kb3dubG9hZC8ke1BWfS8ke0JQTn0tJHtQVn0udGFyLnh6IgotU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjVlNTJjZTBlMjYzMjYxMTVlNDFiYzQ1ZDM0ZGMyZDVlMTBmMmU0NGVkM2E0MTNm
YTJhODI2YWEzNTAwYzhkNTYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiY2Q3ZDliYmFkYjNmMDRm
MjBkYTI1ZTIwZTE1NTY1NWRlNTdiZWVmNDhlMDgwNzI2NjkzODA2OWYwZTMyMmU4YiIKIEdJVEhV
Ql9CQVNFX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20vc2t2YWRyaWsvcmUyYy9yZWxlYXNlcyIK
IAogQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgotLSAKMi40NC4xCgo=

--===============4856187204158156429==--

