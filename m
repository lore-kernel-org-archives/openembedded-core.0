Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DC0DCDB467
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:54 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50416.1781195501832314968
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=NSID2sR7;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=xG0SGOUI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019eb7868fa0-4837c1ef-05ed-4f7c-91f5-4af1a6da6407-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195509;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2+CFDuV57i/EUv3Ro8Cb9gWUoVxVIE+F83TdBqhNJ9c=;
	b=NSID2sR7g72kCjc+fiD6Rh0+zDKkjYRHhM60oNXqDXxe0vERn7UY6GY3RzQxqGkC
	JlN6Aed/UrY4yqh8HJBb0HF4tOqYMbrTHxWoB+DDNOA5gExist3/0CQ74jaVtTpvIUF
	yHobekC8vEg4tyOZqHEXbvcVr5Nkw/wws1BS2HQo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195509;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2+CFDuV57i/EUv3Ro8Cb9gWUoVxVIE+F83TdBqhNJ9c=;
	b=xG0SGOUIm91cE/UQw9gFCSq3sgd+nbB1/qzYvUG15kbMNGytvVOlaPGY0gsn+akk
	0w6gSA91sn+Y4zKjeEu3d4MufZm7FFzefTG6loKkwNBR4ppDvqnZfuaXtTxiA35JO92
	VOZUb7KhZ07kwIzfiLL9Qz5x4DEWBu225SqbGjTc=
Content-Type: multipart/mixed; boundary="===============3682116246254619603=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] repo: upgrading to 2.64 SUCCEEDED
Message-ID: <0101019eb7868fa0-4837c1ef-05ed-4f7c-91f5-4af1a6da6407-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238507

--===============3682116246254619603==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *repo* to *2.64* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.63-2.64.patch
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
From 3185139234c62ac8597334228fdf2437aba29b7e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 10:35:10 +0000
Subject: [PATCH] repo: upgrade 2.63 -> 2.64

---
 meta/recipes-devtools/repo/{repo_2.63.bb => repo_2.64.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.63.bb => repo_2.64.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.63.bb b/meta/recipes-devtools/repo/repo_2.64.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.63.bb
rename to meta/recipes-devtools/repo/repo_2.64.bb
index c3cb5a88a9..8cbf223571 100644
--- a/meta/recipes-devtools/repo/repo_2.63.bb
+++ b/meta/recipes-devtools/repo/repo_2.64.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "baa281d99e59dbf1447524e6fd95b384cadbc06e"
+SRCREV = "2d54384a5e59fddd0626ec091cc0ad11511d834e"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.47.1


--===============3682116246254619603==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-repo-upgrade-2.63-2.64.patch"

RnJvbSAzMTg1MTM5MjM0YzYyYWM4NTk3MzM0MjI4ZmRmMjQzN2FiYTI5YjdlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTA6MzU6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
ZXBvOiB1cGdyYWRlIDIuNjMgLT4gMi42NAoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVw
by97cmVwb18yLjYzLmJiID0+IHJlcG9fMi42NC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcmVwby97cmVwb18yLjYzLmJiID0+IHJlcG9fMi42NC5iYn0gKDk0JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNjMuYmIgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcmVwby9yZXBvXzIuNjQuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjYzLmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNjQuYmIKaW5kZXggYzNjYjVhODhhOS4uOGNi
ZjIyMzU3MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjYz
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi42NC5iYgpAQCAtMTEs
NyArMTEsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0zYjgzZWY5
NjM4N2YxNDY1NWZjODU0ZGRjM2M2YmQ1NyIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9nZXJyaXQuZ29v
Z2xlc291cmNlLmNvbS9naXQtcmVwby5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW47dGFn
PXYke1BWfSBcCiAgICAgICAgICAgICIKLVNSQ1JFViA9ICJiYWEyODFkOTllNTlkYmYxNDQ3NTI0
ZTZmZDk1YjM4NGNhZGJjMDZlIgorU1JDUkVWID0gIjJkNTQzODRhNWU1OWZkZGQwNjI2ZWMwOTFj
YzBhZDExNTExZDgzNGUiCiAKIE1JUlJPUlMgKz0gImdpdDovL2dlcnJpdC5nb29nbGVzb3VyY2Uu
Y29tL2dpdC1yZXBvLmdpdCBnaXQ6Ly9naXRodWIuY29tL0dlcnJpdENvZGVSZXZpZXcvZ2l0LXJl
cG8uZ2l0IgogCi0tIAoyLjQ3LjEKCg==

--===============3682116246254619603==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/repo: PKGV changed from 2.63 [default] to 2.64 [default]
packages/x86-64-v3-poky-linux/repo: PV changed from "2.63" to "2.64"
packages/x86-64-v3-poky-linux/repo: SRC_URI changed from "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.63" to "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.64"
packages/x86-64-v3-poky-linux/repo/repo-dbg: PKGV changed from 2.63 [default] to 2.64 [default]
packages/x86-64-v3-poky-linux/repo/repo-dbg: PV changed from "2.63" to "2.64"
packages/x86-64-v3-poky-linux/repo/repo-dev: PKGV changed from 2.63 [default] to 2.64 [default]
packages/x86-64-v3-poky-linux/repo/repo-dev: PV changed from "2.63" to "2.64"
packages/x86-64-v3-poky-linux/repo/repo-doc: PKGV changed from 2.63 [default] to 2.64 [default]
packages/x86-64-v3-poky-linux/repo/repo-doc: PV changed from "2.63" to "2.64"
packages/x86-64-v3-poky-linux/repo/repo-locale: PKGV changed from 2.63 [default] to 2.64 [default]
packages/x86-64-v3-poky-linux/repo/repo-locale: PV changed from "2.63" to "2.64"
packages/x86-64-v3-poky-linux/repo/repo-src: PKGV changed from 2.63 [default] to 2.64 [default]
packages/x86-64-v3-poky-linux/repo/repo-src: PV changed from "2.63" to "2.64"
packages/x86-64-v3-poky-linux/repo/repo-staticdev: PKGV changed from 2.63 [default] to 2.64 [default]
packages/x86-64-v3-poky-linux/repo/repo-staticdev: PV changed from "2.63" to "2.64"
packages/x86-64-v3-poky-linux/repo/repo: PKGV changed from 2.63 [default] to 2.64 [default]
packages/x86-64-v3-poky-linux/repo/repo: PV changed from "2.63" to "2.64"

--===============3682116246254619603==--

