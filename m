Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ADDEC83F1C
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:23 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.1439.1751386811559340935
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=zPxjtAxu;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=FEOPUHeD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010197c6ca029a-aed325a1-0964-49dc-b30e-100d8500d27e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386817;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=r9bmeFaalpmd0iE80AgMPVfyGdzIeHNYuj8JVc6t3pk=;
	b=zPxjtAxuMkT5Npm88XokiAuy/6182cyG7IZskmtZZDFGURxyjXEbM/6nz5PUmmzg
	2yixL/1wVsyURxZNqwPI8rUuTAny3ijzCczzr2Uj0xX0iGfC9FkQBy7LURcSWbiPfHW
	B2NJ6X0Bv6BieIJc6zRIamSz0dKMTy7Y5S5AFwDM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386817;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=r9bmeFaalpmd0iE80AgMPVfyGdzIeHNYuj8JVc6t3pk=;
	b=FEOPUHeDNAZ+z3r0qdrGAMqMgauh6zAVsAMJXO5bdAe4VF7xfu2VgYFhSU0e0B23
	0ggLsKcvScXxkSy2a2nbg6Abu//+JNDNCIAzxHXxRfvO4v4ZXCSGt+FIomwUwSp8zWm
	ALgTyJEGJ1VQVGdKTOB4NyfUOZKxIiJ9rbKZz3AI=
Content-Type: multipart/mixed; boundary="===============7464382893515937681=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] repo: upgrading to 2.56 SUCCEEDED
Message-ID: <01010197c6ca029a-aed325a1-0964-49dc-b30e-100d8500d27e-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219649

--===============7464382893515937681==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *repo* to *2.56* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.55.2-2.56.patch
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
From fa315773f69804c99ecd01c0e73a6fefe17a62c8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 10:14:44 +0000
Subject: [PATCH] repo: upgrade 2.55.2 -> 2.56

---
 meta/recipes-devtools/repo/{repo_2.55.2.bb => repo_2.56.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.55.2.bb => repo_2.56.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.55.2.bb b/meta/recipes-devtools/repo/repo_2.56.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.55.2.bb
rename to meta/recipes-devtools/repo/repo_2.56.bb
index 882f3e6312..efdb9bd0c9 100644
--- a/meta/recipes-devtools/repo/repo_2.55.2.bb
+++ b/meta/recipes-devtools/repo/repo_2.56.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "b262d0e4619c406a2708856ed312091d21c5bf39"
+SRCREV = "99b5a17f2c951fe5979100c36e7e1dbb4c61b36c"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.47.1


--===============7464382893515937681==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-repo-upgrade-2.55.2-2.56.patch"

RnJvbSBmYTMxNTc3M2Y2OTgwNGM5OWVjZDAxYzBlNzNhNmZlZmUxN2E2MmM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAxMDoxNDo0NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJl
cG86IHVwZ3JhZGUgMi41NS4yIC0+IDIuNTYKCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Jl
cG8ve3JlcG9fMi41NS4yLmJiID0+IHJlcG9fMi41Ni5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcmVwby97cmVwb18yLjU1LjIuYmIgPT4gcmVwb18yLjU2LmJifSAoOTQlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi41NS4yLmJiIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjU2LmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi41NS4yLmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNTYuYmIKaW5kZXggODgyZjNl
NjMxMi4uZWZkYjliZDBjOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8v
cmVwb18yLjU1LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjU2
LmJiCkBAIC0xMSw3ICsxMSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7
bWQ1PTNiODNlZjk2Mzg3ZjE0NjU1ZmM4NTRkZGMzYzZiZDU3IgogCiBTUkNfVVJJID0gImdpdDov
L2dlcnJpdC5nb29nbGVzb3VyY2UuY29tL2dpdC1yZXBvLmdpdDtwcm90b2NvbD1odHRwczticmFu
Y2g9bWFpbjt0YWc9diR7UFZ9IFwKICAgICAgICAgICAgIgotU1JDUkVWID0gImIyNjJkMGU0NjE5
YzQwNmEyNzA4ODU2ZWQzMTIwOTFkMjFjNWJmMzkiCitTUkNSRVYgPSAiOTliNWExN2YyYzk1MWZl
NTk3OTEwMGMzNmU3ZTFkYmI0YzYxYjM2YyIKIAogTUlSUk9SUyArPSAiZ2l0Oi8vZ2Vycml0Lmdv
b2dsZXNvdXJjZS5jb20vZ2l0LXJlcG8uZ2l0IGdpdDovL2dpdGh1Yi5jb20vR2Vycml0Q29kZVJl
dmlldy9naXQtcmVwby5naXQiCiAKLS0gCjIuNDcuMQoK

--===============7464382893515937681==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/repo: SRC_URI changed from "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.55.2" to "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.56"
packages/core2-64-poky-linux/repo: PKGV changed from 2.55.2 [default] to 2.56 [default]
packages/core2-64-poky-linux/repo: PV changed from "2.55.2" to "2.56"
packages/core2-64-poky-linux/repo/repo-dbg: PKGV changed from 2.55.2 [default] to 2.56 [default]
packages/core2-64-poky-linux/repo/repo-dbg: PV changed from "2.55.2" to "2.56"
packages/core2-64-poky-linux/repo/repo-dev: PKGV changed from 2.55.2 [default] to 2.56 [default]
packages/core2-64-poky-linux/repo/repo-dev: PV changed from "2.55.2" to "2.56"
packages/core2-64-poky-linux/repo/repo-doc: PKGV changed from 2.55.2 [default] to 2.56 [default]
packages/core2-64-poky-linux/repo/repo-doc: PV changed from "2.55.2" to "2.56"
packages/core2-64-poky-linux/repo/repo-locale: PKGV changed from 2.55.2 [default] to 2.56 [default]
packages/core2-64-poky-linux/repo/repo-locale: PV changed from "2.55.2" to "2.56"
packages/core2-64-poky-linux/repo/repo-src: PKGV changed from 2.55.2 [default] to 2.56 [default]
packages/core2-64-poky-linux/repo/repo-src: PV changed from "2.55.2" to "2.56"
packages/core2-64-poky-linux/repo/repo-staticdev: PKGV changed from 2.55.2 [default] to 2.56 [default]
packages/core2-64-poky-linux/repo/repo-staticdev: PV changed from "2.55.2" to "2.56"
packages/core2-64-poky-linux/repo/repo: PKGV changed from 2.55.2 [default] to 2.56 [default]
packages/core2-64-poky-linux/repo/repo: PV changed from "2.55.2" to "2.56"

--===============7464382893515937681==--

