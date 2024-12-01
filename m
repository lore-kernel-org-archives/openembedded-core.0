Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA602D49776
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 10:06:10 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.148768.1733047567763627579
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Dec 2024 02:06:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=fHruwCCD;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=oGtcF8BJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019381af4a67-657bcbb8-fc4e-431a-b8a1-d7c4da53ea8f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1733047569;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1SlWDDRDfD8pef3nnbvgt4l5zG3kASOPOXhXMj7xIjo=;
	b=fHruwCCDSxl9esvZgJYE9D4XJCnGx8/LvIpfBdbHWAlnCwou2DIUWTrSdojgxCQr
	U8tT9D7BrHFK+TPR7SgFB+ZQ1sz/KJURQvGe5VvPxbaCEwLoik2P/NuWMSUFnHwVPqV
	dAUn3jpeDIS3w8jB8yaUfkx2v349R+VsWuTxRyg4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1733047569;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1SlWDDRDfD8pef3nnbvgt4l5zG3kASOPOXhXMj7xIjo=;
	b=oGtcF8BJcLV5qoOUsFBxxqhhQdxcps41zrwXWwmgbhdcrZkB0sRnln4lfTP4oo4a
	uLDbYgeOe7e+T2X2sTtvGiAHpgy+HdI2QVeF2T6wRCSEQlCwQAUUIiFA/MBFbC93kbV
	VIofCLJ9bxrV7Q+40xa/9TJm3hadkJjnuudOYB6c=
Content-Type: multipart/mixed; boundary="===============6189398449947295987=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] re2c: upgrading to 4.0.1 SUCCEEDED
Message-ID: <0101019381af4a67-657bcbb8-fc4e-431a-b8a1-d7c4da53ea8f-000000@us-west-2.amazonses.com>
Date: Sun, 1 Dec 2024 10:06:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Dec 2024 10:06:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208102

--===============6189398449947295987==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *re2c* to *4.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-re2c-upgrade-4.0-4.0.1.patch
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
From 587e05edeafb63e19888f36a62a12cfc969c450c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Dec 2024 09:48:12 +0000
Subject: [PATCH] re2c: upgrade 4.0 -> 4.0.1

---
 meta/recipes-support/re2c/{re2c_4.0.bb => re2c_4.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/re2c/{re2c_4.0.bb => re2c_4.0.1.bb} (90%)

diff --git a/meta/recipes-support/re2c/re2c_4.0.bb b/meta/recipes-support/re2c/re2c_4.0.1.bb
similarity index 90%
rename from meta/recipes-support/re2c/re2c_4.0.bb
rename to meta/recipes-support/re2c/re2c_4.0.1.bb
index fd7d36b632..b876d2b844 100644
--- a/meta/recipes-support/re2c/re2c_4.0.bb
+++ b/meta/recipes-support/re2c/re2c_4.0.1.bb
@@ -7,7 +7,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=64eca4d8a3b67f9dc7656094731a2c8d"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "6281c6bf52e684d5727ac293667c8031a4aa9010636512da5aee45f19987c1ee"
+SRC_URI[sha256sum] = "7c35d54fdf2c4b5981b80362d1c742aec4d011589673e02f2e9566f7e66c44af"
 GITHUB_BASE_URI = "https://github.com/skvadrik/re2c/releases"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.44.1


--===============6189398449947295987==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-re2c-upgrade-4.0-4.0.1.patch"

RnJvbSA1ODdlMDVlZGVhZmI2M2UxOTg4OGYzNmE2MmExMmNmYzk2OWM0NTBjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBEZWMgMjAyNCAwOTo0ODoxMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJl
MmM6IHVwZ3JhZGUgNC4wIC0+IDQuMC4xCgotLS0KIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3JlMmMv
e3JlMmNfNC4wLmJiID0+IHJlMmNfNC4wLjEuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQv
cmUyYy97cmUyY180LjAuYmIgPT4gcmUyY180LjAuMS5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9yZTJjL3JlMmNfNC4wLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvcmUyYy9yZTJjXzQuMC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTAlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1zdXBwb3J0L3JlMmMvcmUyY180LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1zdXBwb3J0L3JlMmMvcmUyY180LjAuMS5iYgppbmRleCBmZDdkMzZiNjMyLi5iODc2ZDJiODQ0
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9yZTJjL3JlMmNfNC4wLmJiCisrKyBi
L21ldGEvcmVjaXBlcy1zdXBwb3J0L3JlMmMvcmUyY180LjAuMS5iYgpAQCAtNyw3ICs3LDcgQEAg
TElDRU5TRSA9ICJQRCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTY0
ZWNhNGQ4YTNiNjdmOWRjNzY1NjA5NDczMWEyYzhkIgogCiBTUkNfVVJJID0gIiR7R0lUSFVCX0JB
U0VfVVJJfS9kb3dubG9hZC8ke1BWfS8ke0JQTn0tJHtQVn0udGFyLnh6IgotU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjYyODFjNmJmNTJlNjg0ZDU3MjdhYzI5MzY2N2M4MDMxYTRhYTkwMTA2MzY1MTJk
YTVhZWU0NWYxOTk4N2MxZWUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiN2MzNWQ1NGZkZjJjNGI1
OTgxYjgwMzYyZDFjNzQyYWVjNGQwMTE1ODk2NzNlMDJmMmU5NTY2ZjdlNjZjNDRhZiIKIEdJVEhV
Ql9CQVNFX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20vc2t2YWRyaWsvcmUyYy9yZWxlYXNlcyIK
IAogQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgotLSAKMi40NC4xCgo=

--===============6189398449947295987==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gcc-runtime/gcc-runtime-src: PKGSIZE changed from 9424302 to 9622467 (+2%)
packages/core2-64-poky-linux/re2c: PKGV changed from 4.0 [default] to 4.0.1 [default]
packages/core2-64-poky-linux/re2c: SRC_URI changed from "https://github.com/skvadrik/re2c/releases/download/4.0/re2c-4.0.tar.xz" to "https://github.com/skvadrik/re2c/releases/download/4.0.1/re2c-4.0.1.tar.xz"
packages/core2-64-poky-linux/re2c: PV changed from "4.0" to "4.0.1"
packages/core2-64-poky-linux/re2c/re2c-dbg: PKGSIZE changed from 174622560 to 174624408 (+0%)
packages/core2-64-poky-linux/re2c/re2c-dbg: PKGV changed from 4.0 [default] to 4.0.1 [default]
packages/core2-64-poky-linux/re2c/re2c-dbg: PV changed from "4.0" to "4.0.1"
packages/core2-64-poky-linux/re2c/re2c-dev: PKGV changed from 4.0 [default] to 4.0.1 [default]
packages/core2-64-poky-linux/re2c/re2c-dev: PV changed from "4.0" to "4.0.1"
packages/core2-64-poky-linux/re2c/re2c-doc: PKGSIZE changed from 1630547 to 1631316 (+0%)
packages/core2-64-poky-linux/re2c/re2c-doc: PKGV changed from 4.0 [default] to 4.0.1 [default]
packages/core2-64-poky-linux/re2c/re2c-doc: PV changed from "4.0" to "4.0.1"
packages/core2-64-poky-linux/re2c/re2c-locale: PKGV changed from 4.0 [default] to 4.0.1 [default]
packages/core2-64-poky-linux/re2c/re2c-locale: PV changed from "4.0" to "4.0.1"
packages/core2-64-poky-linux/re2c/re2c-src: PKGSIZE changed from 1675903 to 1675916 (+0%)
packages/core2-64-poky-linux/re2c/re2c-src: PKGV changed from 4.0 [default] to 4.0.1 [default]
packages/core2-64-poky-linux/re2c/re2c-src: PV changed from "4.0" to "4.0.1"
packages/core2-64-poky-linux/re2c/re2c-staticdev: PKGV changed from 4.0 [default] to 4.0.1 [default]
packages/core2-64-poky-linux/re2c/re2c-staticdev: PV changed from "4.0" to "4.0.1"
packages/core2-64-poky-linux/re2c/re2c: PKGSIZE changed from 11091786 to 11091788 (+0%)
packages/core2-64-poky-linux/re2c/re2c: PKGV changed from 4.0 [default] to 4.0.1 [default]
packages/core2-64-poky-linux/re2c/re2c: PV changed from "4.0" to "4.0.1"

--===============6189398449947295987==--

