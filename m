Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E1A4CD13A1
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:30 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.2001.1711994602333162986
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ODb0Qcs2;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=m3oFh+a6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018e9ad48120-5819f829-f7b9-4e55-8992-eb03f3f90b1c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994601;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=BSswkLyIobYEmT9T1TsH/Cp/Y8SImCiJDKHahegi8to=;
	b=ODb0Qcs2M22/vqiiTzfA+68phQkGqJRlb8uu6Qew6rmfj9uJkc7tJt5vqJu5Y+eB
	SJmTTUnZsap5aXsK2+0o2DxmJfCKNObbo5m8DBE4CjJMFKticKIi67tv5Y7XnKU4mWl
	F0LTSoc/H31QLC8ALNnqVX+qZ9OQrDdcxhafvfv4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994601;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=BSswkLyIobYEmT9T1TsH/Cp/Y8SImCiJDKHahegi8to=;
	b=m3oFh+a6KEpUzbBeWG2yKmoX5lPVecP7/lXEiweaPtV2uU64C1GZ2KmL54299Kwq
	doBFU3t+pO7qSBMKp61aC8x66wQkX0G1JpCrljiExTW5P8DRlsZUr78TFBW0kCytD/F
	e50xxfGsP59B67qTiSA9Rk4q4nb5WnfTYLYSAmUQ=
Content-Type: multipart/mixed; boundary="===============7845473477176390276=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] repo: upgrading to 2.45 SUCCEEDED
Message-ID: <0101018e9ad48120-5819f829-f7b9-4e55-8992-eb03f3f90b1c-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:21 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197746

--===============7845473477176390276==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *repo* to *2.45* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.42-2.45.patch
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
From e924cb14ede74a558d8cf4435f5e62a10702a2eb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 09:55:44 +0000
Subject: [PATCH] repo: upgrade 2.42 -> 2.45

---
 meta/recipes-devtools/repo/{repo_2.42.bb => repo_2.45.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.42.bb => repo_2.45.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.42.bb b/meta/recipes-devtools/repo/repo_2.45.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.42.bb
rename to meta/recipes-devtools/repo/repo_2.45.bb
index 9bb5000fab..81bf31754b 100644
--- a/meta/recipes-devtools/repo/repo_2.42.bb
+++ b/meta/recipes-devtools/repo/repo_2.45.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            "
-SRCREV = "5554572f02537b8646139d59ab520e59e1d5f7b3"
+SRCREV = "73356f1d5ccbebf5a33e5e9aa1ba06c5f5437fed"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.42.0


--===============7845473477176390276==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-repo-upgrade-2.42-2.45.patch"

RnJvbSBlOTI0Y2IxNGVkZTc0YTU1OGQ4Y2Y0NDM1ZjVlNjJhMTA3MDJhMmViIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAwOTo1NTo0NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJl
cG86IHVwZ3JhZGUgMi40MiAtPiAyLjQ1CgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBv
L3tyZXBvXzIuNDIuYmIgPT4gcmVwb18yLjQ1LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9yZXBvL3tyZXBvXzIuNDIuYmIgPT4gcmVwb18yLjQ1LmJifSAoOTQlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi40Mi5iYiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9yZXBvL3JlcG9fMi40NS5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNDIuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi40NS5iYgppbmRleCA5YmI1MDAwZmFiLi44MWJm
MzE3NTRiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNDIu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjQ1LmJiCkBAIC0xMSw3
ICsxMSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTNiODNlZjk2
Mzg3ZjE0NjU1ZmM4NTRkZGMzYzZiZDU3IgogCiBTUkNfVVJJID0gImdpdDovL2dlcnJpdC5nb29n
bGVzb3VyY2UuY29tL2dpdC1yZXBvLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFpbiBcCiAg
ICAgICAgICAgICIKLVNSQ1JFViA9ICI1NTU0NTcyZjAyNTM3Yjg2NDYxMzlkNTlhYjUyMGU1OWUx
ZDVmN2IzIgorU1JDUkVWID0gIjczMzU2ZjFkNWNjYmViZjVhMzNlNWU5YWExYmEwNmM1ZjU0Mzdm
ZWQiCiAKIE1JUlJPUlMgKz0gImdpdDovL2dlcnJpdC5nb29nbGVzb3VyY2UuY29tL2dpdC1yZXBv
LmdpdCBnaXQ6Ly9naXRodWIuY29tL0dlcnJpdENvZGVSZXZpZXcvZ2l0LXJlcG8uZ2l0IgogCi0t
IAoyLjQyLjAKCg==

--===============7845473477176390276==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/repo: PKGV changed from 2.42 [default] to 2.45 [default]
packages/core2-64-poky-linux/repo: PV changed from "2.42" to "2.45"
packages/core2-64-poky-linux/repo/repo-dbg: PKGV changed from 2.42 [default] to 2.45 [default]
packages/core2-64-poky-linux/repo/repo-dbg: PV changed from "2.42" to "2.45"
packages/core2-64-poky-linux/repo/repo-dev: PKGV changed from 2.42 [default] to 2.45 [default]
packages/core2-64-poky-linux/repo/repo-dev: PV changed from "2.42" to "2.45"
packages/core2-64-poky-linux/repo/repo-doc: PKGV changed from 2.42 [default] to 2.45 [default]
packages/core2-64-poky-linux/repo/repo-doc: PV changed from "2.42" to "2.45"
packages/core2-64-poky-linux/repo/repo-locale: PKGV changed from 2.42 [default] to 2.45 [default]
packages/core2-64-poky-linux/repo/repo-locale: PV changed from "2.42" to "2.45"
packages/core2-64-poky-linux/repo/repo-src: PKGV changed from 2.42 [default] to 2.45 [default]
packages/core2-64-poky-linux/repo/repo-src: PV changed from "2.42" to "2.45"
packages/core2-64-poky-linux/repo/repo-staticdev: PKGV changed from 2.42 [default] to 2.45 [default]
packages/core2-64-poky-linux/repo/repo-staticdev: PV changed from "2.42" to "2.45"
packages/core2-64-poky-linux/repo/repo: PKGV changed from 2.42 [default] to 2.45 [default]
packages/core2-64-poky-linux/repo/repo: PKGSIZE changed from 46973 to 46971 (-0%)
packages/core2-64-poky-linux/repo/repo: PV changed from "2.42" to "2.45"

--===============7845473477176390276==--

