Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0763C54749
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:19 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.1303.1721071146400217605
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=hAund65P;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=q4nkbFtP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010190b7d596e5-9da9b1e1-d643-4442-9600-07280e7a486c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071146;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=Q7R4ZJZg4Ci6BM7p8FxX5ao1BKeM/oVgq4fjfLN7330=;
	b=hAund65PK6ZWg+GHM53BCV8d5EM3WjDvn72lV0mqRt+3mUJGrboijH/rtyjFtlQ1
	PAI9yARC5r4zfcjKqEc99VcQEurMdiDxMpsC7kVtKaBKkhPvD5miFesSk2uziBTJ3z4
	aTSFvPdtcJlGUqGIPCmZaqrw1UNfm+8sQyQXYo6o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071146;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=Q7R4ZJZg4Ci6BM7p8FxX5ao1BKeM/oVgq4fjfLN7330=;
	b=q4nkbFtPt9A6umQC24JIcdtRrSW9Wk7ScUKqn+Nsc8b3AHpioKKUcxhnW+B4wil9
	/X+912t7ax2pwdDCYYNMUL/HLGDEdohBV7IvvjytzL89tx9mKDh0Kqpl37/1iDeWUSU
	l0xaVYuf8FBPcWLvIPyzmmSYPu4UwkU22i8SrjeU=
Content-Type: multipart/mixed; boundary="===============4176221734049344499=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] repo: upgrading to 2.46 SUCCEEDED
Message-ID: <01010190b7d596e5-9da9b1e1-d643-4442-9600-07280e7a486c-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201987

--===============4176221734049344499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *repo* to *2.46* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.45-2.46.patch
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
From 9c559a8cc58b631dfd48624899d2850dea0afc98 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jul 2024 11:36:37 +0000
Subject: [PATCH] repo: upgrade 2.45 -> 2.46

---
 meta/recipes-devtools/repo/{repo_2.45.bb => repo_2.46.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.45.bb => repo_2.46.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.45.bb b/meta/recipes-devtools/repo/repo_2.46.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.45.bb
rename to meta/recipes-devtools/repo/repo_2.46.bb
index dd12373e3a..147b09ce85 100644
--- a/meta/recipes-devtools/repo/repo_2.45.bb
+++ b/meta/recipes-devtools/repo/repo_2.46.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            "
-SRCREV = "73356f1d5ccbebf5a33e5e9aa1ba06c5f5437fed"
+SRCREV = "0444ddf78e3026056ee3786119e595909c039ff2"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.44.0


--===============4176221734049344499==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-repo-upgrade-2.45-2.46.patch"

RnJvbSA5YzU1OWE4Y2M1OGI2MzFkZmQ0ODYyNDg5OWQyODUwZGVhMGFmYzk4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSnVsIDIwMjQgMTE6MzY6MzcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
ZXBvOiB1cGdyYWRlIDIuNDUgLT4gMi40NgoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVw
by97cmVwb18yLjQ1LmJiID0+IHJlcG9fMi40Ni5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcmVwby97cmVwb18yLjQ1LmJiID0+IHJlcG9fMi40Ni5iYn0gKDk0JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNDUuYmIgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcmVwby9yZXBvXzIuNDYuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjQ1LmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNDYuYmIKaW5kZXggZGQxMjM3M2UzYS4uMTQ3
YjA5Y2U4NSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjQ1
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi40Ni5iYgpAQCAtMTEs
NyArMTEsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0zYjgzZWY5
NjM4N2YxNDY1NWZjODU0ZGRjM2M2YmQ1NyIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9nZXJyaXQuZ29v
Z2xlc291cmNlLmNvbS9naXQtcmVwby5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW4gXAog
ICAgICAgICAgICAiCi1TUkNSRVYgPSAiNzMzNTZmMWQ1Y2NiZWJmNWEzM2U1ZTlhYTFiYTA2YzVm
NTQzN2ZlZCIKK1NSQ1JFViA9ICIwNDQ0ZGRmNzhlMzAyNjA1NmVlMzc4NjExOWU1OTU5MDljMDM5
ZmYyIgogCiBNSVJST1JTICs9ICJnaXQ6Ly9nZXJyaXQuZ29vZ2xlc291cmNlLmNvbS9naXQtcmVw
by5naXQgZ2l0Oi8vZ2l0aHViLmNvbS9HZXJyaXRDb2RlUmV2aWV3L2dpdC1yZXBvLmdpdCIKIAot
LSAKMi40NC4wCgo=

--===============4176221734049344499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/repo: PV changed from "2.45" to "2.46"
packages/core2-64-poky-linux/repo: PKGV changed from 2.45 [default] to 2.46 [default]
packages/core2-64-poky-linux/repo/repo-dbg: PV changed from "2.45" to "2.46"
packages/core2-64-poky-linux/repo/repo-dbg: PKGV changed from 2.45 [default] to 2.46 [default]
packages/core2-64-poky-linux/repo/repo-dev: PV changed from "2.45" to "2.46"
packages/core2-64-poky-linux/repo/repo-dev: PKGV changed from 2.45 [default] to 2.46 [default]
packages/core2-64-poky-linux/repo/repo-doc: PV changed from "2.45" to "2.46"
packages/core2-64-poky-linux/repo/repo-doc: PKGV changed from 2.45 [default] to 2.46 [default]
packages/core2-64-poky-linux/repo/repo-locale: PV changed from "2.45" to "2.46"
packages/core2-64-poky-linux/repo/repo-locale: PKGV changed from 2.45 [default] to 2.46 [default]
packages/core2-64-poky-linux/repo/repo-src: PV changed from "2.45" to "2.46"
packages/core2-64-poky-linux/repo/repo-src: PKGV changed from 2.45 [default] to 2.46 [default]
packages/core2-64-poky-linux/repo/repo-staticdev: PV changed from "2.45" to "2.46"
packages/core2-64-poky-linux/repo/repo-staticdev: PKGV changed from 2.45 [default] to 2.46 [default]
packages/core2-64-poky-linux/repo/repo: PKGSIZE changed from 46971 to 46943 (-0%)
packages/core2-64-poky-linux/repo/repo: PV changed from "2.45" to "2.46"
packages/core2-64-poky-linux/repo/repo: PKGV changed from 2.45 [default] to 2.46 [default]

--===============4176221734049344499==--

