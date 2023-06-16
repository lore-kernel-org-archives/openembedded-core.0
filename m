Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CEB7C04FDF
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:28 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.814.1686887482059982939
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=BdRXEkpP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010188c2543f10-caa58c35-e530-4337-9b29-b28b6775c111-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887481;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RYMh4mE9G8O6WSISC/7ItfnCna96x16ZtKNG5yhn3FI=;
	b=BdRXEkpPcgPSojpP7LIfDbSGw42PFtlpPspgKofqtmhU3PpJtLOOKQ+TYOZ/Twic
	5xQSWlzWi7FfUybdPvvmPp4N5NPHLRAvD3TTfo6RocqNlMCE1XYqdFZ2t5GsY4lTXdS
	qm5s9eC/ml/Srh1d2wSCNaEUjPWc7NYzYxvbYSuc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887481;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RYMh4mE9G8O6WSISC/7ItfnCna96x16ZtKNG5yhn3FI=;
	b=df0JZBl7+ib3h+SDQD8nyNXhLsT7IyJe36Qq8P5a6YtIiISe9S8bhLu40VfG6s0/
	m2l0CK/i0cY680dqZ2WMPFD3qbZ078yAPR6cZ9f8rT+iqP114eS9nqutDa61TZ0nbil
	0JnWULQP+wI0lXGxdOjL1i9qyTdY/KNJNicz7qFI=
Content-Type: multipart/mixed; boundary="===============0619074093242578311=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxcrypt-compat: upgrading to 4.4.35 SUCCEEDED
Message-ID: <01010188c2543f10-caa58c35-e530-4337-9b29-b28b6775c111-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:21 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182892

--===============0619074093242578311==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxcrypt-compat* to *4.4.35* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxcrypt-compat-upgrade-4.4.33-4.4.35.patch
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
From cfaf8324c33339ecd9e5fe29d577a0fc2fd42841 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 07:19:37 +0000
Subject: [PATCH] libxcrypt-compat: upgrade 4.4.33 -> 4.4.35

---
 ...{libxcrypt-compat_4.4.33.bb => libxcrypt-compat_4.4.35.bb} | 0
 meta/recipes-core/libxcrypt/libxcrypt.inc                     | 4 +++-
 2 files changed, 3 insertions(+), 1 deletion(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.33.bb => libxcrypt-compat_4.4.35.bb} (100%)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.33.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.35.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.33.bb
rename to meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.35.bb
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 61b0381076..e5fecd7b0c 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSING;md5=c0a30e2b1502c55a7f37e412cd6c6a4b \
 inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH};protocol=https"
-SRCREV = "d7fe1ac04c326dba7e0440868889d1dccb41a175"
+SRCREV = "321222c91c4060362b1085b3ca7c29867812ac0a"
 SRCBRANCH ?= "develop"
 
 SRC_URI += "file://fix_cflags_handling.patch"
@@ -33,3 +33,5 @@ API = "--disable-obsolete-api"
 EXTRA_OECONF += "${API}"
 
 BBCLASSEXTEND = "native nativesdk"
+
+SRCBRANCH = "master"
-- 
2.39.2


--===============0619074093242578311==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxcrypt-compat-upgrade-4.4.33-4.4.35.patch"

RnJvbSBjZmFmODMyNGMzMzMzOWVjZDllNWZlMjlkNTc3YTBmYzJmZDQyODQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMDc6MTk6MzcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ4Y3J5cHQtY29tcGF0OiB1cGdyYWRlIDQuNC4zMyAtPiA0LjQuMzUKCi0tLQogLi4ue2xpYnhj
cnlwdC1jb21wYXRfNC40LjMzLmJiID0+IGxpYnhjcnlwdC1jb21wYXRfNC40LjM1LmJifSB8IDAK
IG1ldGEvcmVjaXBlcy1jb3JlL2xpYnhjcnlwdC9saWJ4Y3J5cHQuaW5jICAgICAgICAgICAgICAg
ICAgICAgfCA0ICsrKy0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvbGlieGNyeXB0L3tsaWJ4Y3J5cHQtY29t
cGF0XzQuNC4zMy5iYiA9PiBsaWJ4Y3J5cHQtY29tcGF0XzQuNC4zNS5iYn0gKDEwMCUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvbGlieGNyeXB0L2xpYnhjcnlwdC1jb21wYXRfNC40
LjMzLmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvbGlieGNyeXB0L2xpYnhjcnlwdC1jb21wYXRfNC40
LjM1LmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29y
ZS9saWJ4Y3J5cHQvbGlieGNyeXB0LWNvbXBhdF80LjQuMzMuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1jb3JlL2xpYnhjcnlwdC9saWJ4Y3J5cHQtY29tcGF0XzQuNC4zNS5iYgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWNvcmUvbGlieGNyeXB0L2xpYnhjcnlwdC5pbmMgYi9tZXRhL3JlY2lw
ZXMtY29yZS9saWJ4Y3J5cHQvbGlieGNyeXB0LmluYwppbmRleCA2MWIwMzgxMDc2Li5lNWZlY2Q3
YjBjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9saWJ4Y3J5cHQvbGlieGNyeXB0Lmlu
YworKysgYi9tZXRhL3JlY2lwZXMtY29yZS9saWJ4Y3J5cHQvbGlieGNyeXB0LmluYwpAQCAtMTAs
NyArMTAsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNJTkc7bWQ1PWMwYTMw
ZTJiMTUwMmM1NWE3ZjM3ZTQxMmNkNmM2YTRiIFwKIGluaGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZp
ZwogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vYmVzc2VyODIvbGlieGNyeXB0LmdpdDti
cmFuY2g9JHtTUkNCUkFOQ0h9O3Byb3RvY29sPWh0dHBzIgotU1JDUkVWID0gImQ3ZmUxYWMwNGMz
MjZkYmE3ZTA0NDA4Njg4ODlkMWRjY2I0MWExNzUiCitTUkNSRVYgPSAiMzIxMjIyYzkxYzQwNjAz
NjJiMTA4NWIzY2E3YzI5ODY3ODEyYWMwYSIKIFNSQ0JSQU5DSCA/PSAiZGV2ZWxvcCIKIAogU1JD
X1VSSSArPSAiZmlsZTovL2ZpeF9jZmxhZ3NfaGFuZGxpbmcucGF0Y2giCkBAIC0zMywzICszMyw1
IEBAIEFQSSA9ICItLWRpc2FibGUtb2Jzb2xldGUtYXBpIgogRVhUUkFfT0VDT05GICs9ICIke0FQ
SX0iCiAKIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayIKKworU1JDQlJBTkNIID0g
Im1hc3RlciIKLS0gCjIuMzkuMgoK

--===============0619074093242578311==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libxcrypt-compat: SRC_URI changed from "git://github.com/besser82/libxcrypt.git;branch=develop;protocol=https file://fix_cflags_handling.patch" to "git://github.com/besser82/libxcrypt.git;branch=master;protocol=https file://fix_cflags_handling.patch"
packages/core2-32-poky-linux/libxcrypt-compat: PV changed from "4.4.33" to "4.4.35"
packages/core2-32-poky-linux/libxcrypt-compat: PKGV changed from 4.4.33 [default] to 4.4.35 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-dbg: PV changed from "4.4.33" to "4.4.35"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-dbg: PKGV changed from 4.4.33 [default] to 4.4.35 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-dbg: PKGSIZE changed from 508476 to 509836 (+0%)
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-dev: PV changed from "4.4.33" to "4.4.35"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-dev: PKGV changed from 4.4.33 [default] to 4.4.35 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-doc: PV changed from "4.4.33" to "4.4.35"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-doc: PKGV changed from 4.4.33 [default] to 4.4.35 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-locale: PV changed from "4.4.33" to "4.4.35"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-locale: PKGV changed from 4.4.33 [default] to 4.4.35 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-src: PV changed from "4.4.33" to "4.4.35"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-src: PKGV changed from 4.4.33 [default] to 4.4.35 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-src: PKGSIZE changed from 752348 to 753271 (+0%)
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-staticdev: PV changed from "4.4.33" to "4.4.35"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-staticdev: PKGV changed from 4.4.33 [default] to 4.4.35 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat: PV changed from "4.4.33" to "4.4.35"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat: PKGV changed from 4.4.33 [default] to 4.4.35 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat: PKGSIZE changed from 218534 to 222630 (+2%)

--===============0619074093242578311==--

