Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2FDFD5CCB3
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:38 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17192.1765872145451731656
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=q9CCvhIN;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=q/6mLVo0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019b262eaa33-f3018cc5-2d65-4a27-b986-fd71d7902667-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872151;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LBTlWgiZfHGjxlkx9VNmoxGLgr3nQ9vYFZKmWK1kSGE=;
	b=q9CCvhINVKQgnMQMIZ385KBDGI1BFzws/TnQ30FLyaVbwDdt6J7ZXmwMA2bLpVir
	JH9x9XPcSWiDhOEv+hFQponpxXJx6n4gTWjqIB7MPVYKWK1IKOsmlmCD/VhEBpyA3hM
	/i+0qPgKKRjrlM6iwCQLhhkXaQhWeJkBj2UQrbE8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872151;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LBTlWgiZfHGjxlkx9VNmoxGLgr3nQ9vYFZKmWK1kSGE=;
	b=q/6mLVo0rJD6RCEPcOXMhAJxOEH7S4JyqhHvoL+ZzgDVfUtZCsC+buQgjvLPsWo9
	1dUQQkv4dgP1QwyrndY9EshXJiXg+ahMZ/JZFKxoagUsbb8RHHUYpmnkATJj/TKzH2B
	A2JWZA0drAOEsbPrmPvmXGJ5VwRqVwqUe18iI/WE=
Content-Type: multipart/mixed; boundary="===============6328805295594603311=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] repo: upgrading to 2.60 SUCCEEDED
Message-ID: <0101019b262eaa33-f3018cc5-2d65-4a27-b986-fd71d7902667-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227835

--===============6328805295594603311==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *repo* to *2.60* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.59-2.60.patch
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
From 6a02453b4b2b72da2ea7027b159f4372ddf4f825 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 01:47:36 +0000
Subject: [PATCH] repo: upgrade 2.59 -> 2.60

---
 meta/recipes-devtools/repo/{repo_2.59.bb => repo_2.60.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.59.bb => repo_2.60.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.59.bb b/meta/recipes-devtools/repo/repo_2.60.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.59.bb
rename to meta/recipes-devtools/repo/repo_2.60.bb
index e447fd9492..7d7d9be045 100644
--- a/meta/recipes-devtools/repo/repo_2.59.bb
+++ b/meta/recipes-devtools/repo/repo_2.60.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "1afe96a7e997ce7748f066b206a85ac648f7a87c"
+SRCREV = "b5991d71283c0c3a5d31e371d34c4d976bde63fd"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.47.1


--===============6328805295594603311==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-repo-upgrade-2.59-2.60.patch"

RnJvbSA2YTAyNDUzYjRiMmI3MmRhMmVhNzAyN2IxNTlmNDM3MmRkZjRmODI1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDE6NDc6MzYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
ZXBvOiB1cGdyYWRlIDIuNTkgLT4gMi42MAoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVw
by97cmVwb18yLjU5LmJiID0+IHJlcG9fMi42MC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcmVwby97cmVwb18yLjU5LmJiID0+IHJlcG9fMi42MC5iYn0gKDk0JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNTkuYmIgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcmVwby9yZXBvXzIuNjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjU5LmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNjAuYmIKaW5kZXggZTQ0N2ZkOTQ5Mi4uN2Q3
ZDliZTA0NSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjU5
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi42MC5iYgpAQCAtMTEs
NyArMTEsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0zYjgzZWY5
NjM4N2YxNDY1NWZjODU0ZGRjM2M2YmQ1NyIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9nZXJyaXQuZ29v
Z2xlc291cmNlLmNvbS9naXQtcmVwby5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW47dGFn
PXYke1BWfSBcCiAgICAgICAgICAgICIKLVNSQ1JFViA9ICIxYWZlOTZhN2U5OTdjZTc3NDhmMDY2
YjIwNmE4NWFjNjQ4ZjdhODdjIgorU1JDUkVWID0gImI1OTkxZDcxMjgzYzBjM2E1ZDMxZTM3MWQz
NGM0ZDk3NmJkZTYzZmQiCiAKIE1JUlJPUlMgKz0gImdpdDovL2dlcnJpdC5nb29nbGVzb3VyY2Uu
Y29tL2dpdC1yZXBvLmdpdCBnaXQ6Ly9naXRodWIuY29tL0dlcnJpdENvZGVSZXZpZXcvZ2l0LXJl
cG8uZ2l0IgogCi0tIAoyLjQ3LjEKCg==

--===============6328805295594603311==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/repo: SRC_URI changed from "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.59" to "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.60"
packages/x86-64-v3-poky-linux/repo: PV changed from "2.59" to "2.60"
packages/x86-64-v3-poky-linux/repo: PKGV changed from 2.59 [default] to 2.60 [default]
packages/x86-64-v3-poky-linux/repo/repo-dbg: PV changed from "2.59" to "2.60"
packages/x86-64-v3-poky-linux/repo/repo-dbg: PKGV changed from 2.59 [default] to 2.60 [default]
packages/x86-64-v3-poky-linux/repo/repo-dev: PV changed from "2.59" to "2.60"
packages/x86-64-v3-poky-linux/repo/repo-dev: PKGV changed from 2.59 [default] to 2.60 [default]
packages/x86-64-v3-poky-linux/repo/repo-doc: PV changed from "2.59" to "2.60"
packages/x86-64-v3-poky-linux/repo/repo-doc: PKGV changed from 2.59 [default] to 2.60 [default]
packages/x86-64-v3-poky-linux/repo/repo-locale: PV changed from "2.59" to "2.60"
packages/x86-64-v3-poky-linux/repo/repo-locale: PKGV changed from 2.59 [default] to 2.60 [default]
packages/x86-64-v3-poky-linux/repo/repo-src: PV changed from "2.59" to "2.60"
packages/x86-64-v3-poky-linux/repo/repo-src: PKGV changed from 2.59 [default] to 2.60 [default]
packages/x86-64-v3-poky-linux/repo/repo-staticdev: PV changed from "2.59" to "2.60"
packages/x86-64-v3-poky-linux/repo/repo-staticdev: PKGV changed from 2.59 [default] to 2.60 [default]
packages/x86-64-v3-poky-linux/repo/repo: PV changed from "2.59" to "2.60"
packages/x86-64-v3-poky-linux/repo/repo: PKGV changed from 2.59 [default] to 2.60 [default]

--===============6328805295594603311==--

