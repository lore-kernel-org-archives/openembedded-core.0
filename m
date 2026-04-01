Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 508AD10FCACC
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:06 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14760.1775054165853205811
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:36:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=OarsxjDy;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Iox5M+UD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019d497914ea-ca30ad9e-de95-44ee-88a0-0d5f653cbd0c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054165;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1MwWkO019AiQGcyCwIS6K0ajR0ElyGsgKFAwMitVaxs=;
	b=OarsxjDyuDmikxu3tYE7NSESyKjjgUew3P8cx6qtW3UfzrM08PRNtG8eVVzyGEA4
	5o3nR4SFB7ApE65oFiPR0pvUVX16yq8Hw/MNbPPEC581zobisYzk3+ADxPYpiUIumyY
	1L/1q6VWlAM3RsWJrDX+6i0TLyJYA2qFqWxNgLWA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054165;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1MwWkO019AiQGcyCwIS6K0ajR0ElyGsgKFAwMitVaxs=;
	b=Iox5M+UDdZPYp6pWKhBUXMhFlTnXr9FtrNr5kdqKvWZoZefp+iRX3lEDVLCCgQ88
	zXB/YJrehMbkhQmfqqLSs2Z4MJMSERU2ScWKOlhByk2Y8lk9kNJFxiVVI80HHSAld7K
	4M9KChPKBx5dj4OLGgMIRtqVZHXPWA7kXhyx3+QQ=
Content-Type: multipart/mixed; boundary="===============4236433583827844304=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] repo: upgrading to 2.62 SUCCEEDED
Message-ID: <0101019d497914ea-ca30ad9e-de95-44ee-88a0-0d5f653cbd0c-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:36:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234392

--===============4236433583827844304==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *repo* to *2.62* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.61.1-2.62.patch
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
From 77c539ca51032505c2b11ed14faa3af445421276 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Apr 2026 10:49:28 +0000
Subject: [PATCH] repo: upgrade 2.61.1 -> 2.62

---
 meta/recipes-devtools/repo/{repo_2.61.1.bb => repo_2.62.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.61.1.bb => repo_2.62.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.61.1.bb b/meta/recipes-devtools/repo/repo_2.62.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.61.1.bb
rename to meta/recipes-devtools/repo/repo_2.62.bb
index 456f3ad556..769c7e16ef 100644
--- a/meta/recipes-devtools/repo/repo_2.61.1.bb
+++ b/meta/recipes-devtools/repo/repo_2.62.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "5d88972390295e229ee940992cb33ce8cfd39cd5"
+SRCREV = "ade45de7707e25d8a11b3beedf754caa44aba34d"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.47.1


--===============4236433583827844304==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/repo: SRC_URI changed from "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.61.1" to "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.62"
packages/x86-64-v3-poky-linux/repo: PKGV changed from 2.61.1 [default] to 2.62 [default]
packages/x86-64-v3-poky-linux/repo: PV changed from "2.61.1" to "2.62"
packages/x86-64-v3-poky-linux/repo/repo-dbg: PV changed from "2.61.1" to "2.62"
packages/x86-64-v3-poky-linux/repo/repo-dbg: PKGV changed from 2.61.1 [default] to 2.62 [default]
packages/x86-64-v3-poky-linux/repo/repo-dev: PV changed from "2.61.1" to "2.62"
packages/x86-64-v3-poky-linux/repo/repo-dev: PKGV changed from 2.61.1 [default] to 2.62 [default]
packages/x86-64-v3-poky-linux/repo/repo-doc: PV changed from "2.61.1" to "2.62"
packages/x86-64-v3-poky-linux/repo/repo-doc: PKGV changed from 2.61.1 [default] to 2.62 [default]
packages/x86-64-v3-poky-linux/repo/repo-locale: PV changed from "2.61.1" to "2.62"
packages/x86-64-v3-poky-linux/repo/repo-locale: PKGV changed from 2.61.1 [default] to 2.62 [default]
packages/x86-64-v3-poky-linux/repo/repo-src: PV changed from "2.61.1" to "2.62"
packages/x86-64-v3-poky-linux/repo/repo-src: PKGV changed from 2.61.1 [default] to 2.62 [default]
packages/x86-64-v3-poky-linux/repo/repo-staticdev: PV changed from "2.61.1" to "2.62"
packages/x86-64-v3-poky-linux/repo/repo-staticdev: PKGV changed from 2.61.1 [default] to 2.62 [default]
packages/x86-64-v3-poky-linux/repo/repo: PV changed from "2.61.1" to "2.62"
packages/x86-64-v3-poky-linux/repo/repo: PKGV changed from 2.61.1 [default] to 2.62 [default]

--===============4236433583827844304==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-repo-upgrade-2.61.1-2.62.patch"

RnJvbSA3N2M1MzljYTUxMDMyNTA1YzJiMTFlZDE0ZmFhM2FmNDQ1NDIxMjc2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBBcHIgMjAyNiAxMDo0OToyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJl
cG86IHVwZ3JhZGUgMi42MS4xIC0+IDIuNjIKCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Jl
cG8ve3JlcG9fMi42MS4xLmJiID0+IHJlcG9fMi42Mi5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcmVwby97cmVwb18yLjYxLjEuYmIgPT4gcmVwb18yLjYyLmJifSAoOTQlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi42MS4xLmJiIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjYyLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi42MS4xLmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNjIuYmIKaW5kZXggNDU2ZjNh
ZDU1Ni4uNzY5YzdlMTZlZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8v
cmVwb18yLjYxLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjYy
LmJiCkBAIC0xMSw3ICsxMSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7
bWQ1PTNiODNlZjk2Mzg3ZjE0NjU1ZmM4NTRkZGMzYzZiZDU3IgogCiBTUkNfVVJJID0gImdpdDov
L2dlcnJpdC5nb29nbGVzb3VyY2UuY29tL2dpdC1yZXBvLmdpdDtwcm90b2NvbD1odHRwczticmFu
Y2g9bWFpbjt0YWc9diR7UFZ9IFwKICAgICAgICAgICAgIgotU1JDUkVWID0gIjVkODg5NzIzOTAy
OTVlMjI5ZWU5NDA5OTJjYjMzY2U4Y2ZkMzljZDUiCitTUkNSRVYgPSAiYWRlNDVkZTc3MDdlMjVk
OGExMWIzYmVlZGY3NTRjYWE0NGFiYTM0ZCIKIAogTUlSUk9SUyArPSAiZ2l0Oi8vZ2Vycml0Lmdv
b2dsZXNvdXJjZS5jb20vZ2l0LXJlcG8uZ2l0IGdpdDovL2dpdGh1Yi5jb20vR2Vycml0Q29kZVJl
dmlldy9naXQtcmVwby5naXQiCiAKLS0gCjIuNDcuMQoK

--===============4236433583827844304==--

