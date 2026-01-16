Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 382A3D48995
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:25:53 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1443.1768526752194540509
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=nXW24pvg;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=REw1qlCB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019bc468a738-540d2989-2a65-4b11-adfe-2aa7eea8d760-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526751;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Lshj90M1qafz+e/9PPfF27DvLYq9ny0/RqPI7xKS31k=;
	b=nXW24pvgJ2GWI3i2Gd7+/x4V5wvJfzXyxRe+263cz2v407HZKuVv73xeDfzzzzHd
	Jq9EbNRkQfKDuqnOEN7lhhU6Utl6h9SkmA+ZXsza2Mu7qDOXPSDMsEStQKcw2Wn2ceu
	Cq1tqsleo6iRreaeSBXOGJK0P2JILrB5iED4A+fQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526751;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Lshj90M1qafz+e/9PPfF27DvLYq9ny0/RqPI7xKS31k=;
	b=REw1qlCBs8TmVjJ4mpultaMNvR7wk+R6vxPE42ZD6joU1rNDumdjuq+X4z3Ezy/D
	qnNxpuXazOMRx4jYDB30nHV8TkpUkYH8CprJDoo5SLRFdZbdPTtsAd5NU393bPam/li
	/60sH0WLg3OnS5ZwE4j39n+NGs167Y4PsIiyTxjI=
Content-Type: multipart/mixed; boundary="===============2244306082540308763=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] repo: upgrading to 2.61 SUCCEEDED
Message-ID: <0101019bc468a738-540d2989-2a65-4b11-adfe-2aa7eea8d760-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:25:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229480

--===============2244306082540308763==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *repo* to *2.61* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.60.1-2.61.patch
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
From ba8450712b67b288c5d4b8d2b2aed4964b6e2182 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jan 2026 22:19:36 +0000
Subject: [PATCH] repo: upgrade 2.60.1 -> 2.61

---
 meta/recipes-devtools/repo/{repo_2.60.1.bb => repo_2.61.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.60.1.bb => repo_2.61.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.60.1.bb b/meta/recipes-devtools/repo/repo_2.61.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.60.1.bb
rename to meta/recipes-devtools/repo/repo_2.61.bb
index 4a981e5270..2abe84f612 100644
--- a/meta/recipes-devtools/repo/repo_2.60.1.bb
+++ b/meta/recipes-devtools/repo/repo_2.61.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "871e4c7ed153682a77de44e300b5f5461eb08538"
+SRCREV = "e71a8c6dd85026c8861e675ed7ff468fc611df44"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.47.1


--===============2244306082540308763==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-repo-upgrade-2.60.1-2.61.patch"

RnJvbSBiYTg0NTA3MTJiNjdiMjg4YzVkNGI4ZDJiMmFlZDQ5NjRiNmUyMTgyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSmFuIDIwMjYgMjI6MTk6MzYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
ZXBvOiB1cGdyYWRlIDIuNjAuMSAtPiAyLjYxCgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9y
ZXBvL3tyZXBvXzIuNjAuMS5iYiA9PiByZXBvXzIuNjEuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3JlcG8ve3JlcG9fMi42MC4xLmJiID0+IHJlcG9fMi42MS5iYn0gKDk0JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNjAuMS5iYiBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi42MS5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNjAuMS5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjYxLmJiCmluZGV4IDRhOTgx
ZTUyNzAuLjJhYmU4NGY2MTIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBv
L3JlcG9fMi42MC4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi42
MS5iYgpAQCAtMTEsNyArMTEsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNF
O21kNT0zYjgzZWY5NjM4N2YxNDY1NWZjODU0ZGRjM2M2YmQ1NyIKIAogU1JDX1VSSSA9ICJnaXQ6
Ly9nZXJyaXQuZ29vZ2xlc291cmNlLmNvbS9naXQtcmVwby5naXQ7cHJvdG9jb2w9aHR0cHM7YnJh
bmNoPW1haW47dGFnPXYke1BWfSBcCiAgICAgICAgICAgICIKLVNSQ1JFViA9ICI4NzFlNGM3ZWQx
NTM2ODJhNzdkZTQ0ZTMwMGI1ZjU0NjFlYjA4NTM4IgorU1JDUkVWID0gImU3MWE4YzZkZDg1MDI2
Yzg4NjFlNjc1ZWQ3ZmY0NjhmYzYxMWRmNDQiCiAKIE1JUlJPUlMgKz0gImdpdDovL2dlcnJpdC5n
b29nbGVzb3VyY2UuY29tL2dpdC1yZXBvLmdpdCBnaXQ6Ly9naXRodWIuY29tL0dlcnJpdENvZGVS
ZXZpZXcvZ2l0LXJlcG8uZ2l0IgogCi0tIAoyLjQ3LjEKCg==

--===============2244306082540308763==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/repo: SRC_URI changed from "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.60.1" to "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.61"
packages/x86-64-v3-poky-linux/repo: PV changed from "2.60.1" to "2.61"
packages/x86-64-v3-poky-linux/repo: PKGV changed from 2.60.1 [default] to 2.61 [default]
packages/x86-64-v3-poky-linux/repo/repo-dbg: PV changed from "2.60.1" to "2.61"
packages/x86-64-v3-poky-linux/repo/repo-dbg: PKGV changed from 2.60.1 [default] to 2.61 [default]
packages/x86-64-v3-poky-linux/repo/repo-dev: PV changed from "2.60.1" to "2.61"
packages/x86-64-v3-poky-linux/repo/repo-dev: PKGV changed from 2.60.1 [default] to 2.61 [default]
packages/x86-64-v3-poky-linux/repo/repo-doc: PV changed from "2.60.1" to "2.61"
packages/x86-64-v3-poky-linux/repo/repo-doc: PKGV changed from 2.60.1 [default] to 2.61 [default]
packages/x86-64-v3-poky-linux/repo/repo-locale: PV changed from "2.60.1" to "2.61"
packages/x86-64-v3-poky-linux/repo/repo-locale: PKGV changed from 2.60.1 [default] to 2.61 [default]
packages/x86-64-v3-poky-linux/repo/repo-src: PV changed from "2.60.1" to "2.61"
packages/x86-64-v3-poky-linux/repo/repo-src: PKGV changed from 2.60.1 [default] to 2.61 [default]
packages/x86-64-v3-poky-linux/repo/repo-staticdev: PV changed from "2.60.1" to "2.61"
packages/x86-64-v3-poky-linux/repo/repo-staticdev: PKGV changed from 2.60.1 [default] to 2.61 [default]
packages/x86-64-v3-poky-linux/repo/repo: PV changed from "2.60.1" to "2.61"
packages/x86-64-v3-poky-linux/repo/repo: PKGV changed from 2.60.1 [default] to 2.61 [default]

--===============2244306082540308763==--

