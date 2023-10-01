Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2152E776D4
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 18:13:18 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.64736.1696183991351953039
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 11:13:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=e9KXiKHf;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=AQsBkw0e;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018aec71b9b0-e98b18a1-3140-4904-8c3b-652c7f8d31bb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1696183990;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=OwDAlVbj0YQiqp8Tgi8mQ2UzE+4BPzOQXjgcNjKYJ04=;
	b=e9KXiKHfbG9RnZA3ivtoFU3CDSEzqt42NXQsefecsCtD8Gavd0nyqBhUJDI3Mrol
	C/Pq0kTTEXPfnTuDZ0tu/Ie/iqbw1BHOLAN0gqHp3xt1zxLc2QJu6t/YpWUAKkhWBW8
	qtB7AWKwZCqPPiTMEI13eqpIvtKDJLQYF9kEnbLI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1696183990;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=OwDAlVbj0YQiqp8Tgi8mQ2UzE+4BPzOQXjgcNjKYJ04=;
	b=AQsBkw0eI+lJWMDKEytgCU12ilXCgb9wL9sFJ7AAfG6Okd2XeJ9Gg0nxjs/6cW/b
	LDCXLST9M03ft1YskBl6ionku2mEuQGq94+6vJg54dm1r+ylt7fx3SXifc/zBco6X9r
	FDsrn+bagOCPWeArulRlSAWOm5t0Iz+v9w5g519w=
Content-Type: multipart/mixed; boundary="===============6449083826279166200=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] repo: upgrading to 2.37 SUCCEEDED
Message-ID: <0101018aec71b9b0-e98b18a1-3140-4904-8c3b-652c7f8d31bb-000000@us-west-2.amazonses.com>
Date: Sun, 1 Oct 2023 18:13:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 18:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188545

--===============6449083826279166200==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *repo* to *2.37* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.36.1-2.37.patch
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
From a941d5982812a2109a25d2a7a0f74c41156172c5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Oct 2023 10:36:25 +0000
Subject: [PATCH] repo: upgrade 2.36.1 -> 2.37

---
 meta/recipes-devtools/repo/{repo_2.36.1.bb => repo_2.37.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.36.1.bb => repo_2.37.bb} (95%)

diff --git a/meta/recipes-devtools/repo/repo_2.36.1.bb b/meta/recipes-devtools/repo/repo_2.37.bb
similarity index 95%
rename from meta/recipes-devtools/repo/repo_2.36.1.bb
rename to meta/recipes-devtools/repo/repo_2.37.bb
index a3b43439f2..d6d3d03a62 100644
--- a/meta/recipes-devtools/repo/repo_2.36.1.bb
+++ b/meta/recipes-devtools/repo/repo_2.37.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            file://0001-python3-shebang.patch \
            "
-SRCREV = "1e9f7b9e9ef473305d10a26a48138bc6ad38ccf6"
+SRCREV = "83c66ec661e39e47795086a5d26d0f3782ac1d49"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.39.2


--===============6449083826279166200==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/repo: PKGV changed from 2.36.1 [default] to 2.37 [default]
packages/core2-32-poky-linux/repo: PV changed from "2.36.1" to "2.37"
packages/core2-32-poky-linux/repo/repo-dbg: PKGV changed from 2.36.1 [default] to 2.37 [default]
packages/core2-32-poky-linux/repo/repo-dbg: PV changed from "2.36.1" to "2.37"
packages/core2-32-poky-linux/repo/repo-dev: PKGV changed from 2.36.1 [default] to 2.37 [default]
packages/core2-32-poky-linux/repo/repo-dev: PV changed from "2.36.1" to "2.37"
packages/core2-32-poky-linux/repo/repo-doc: PKGV changed from 2.36.1 [default] to 2.37 [default]
packages/core2-32-poky-linux/repo/repo-doc: PV changed from "2.36.1" to "2.37"
packages/core2-32-poky-linux/repo/repo-locale: PKGV changed from 2.36.1 [default] to 2.37 [default]
packages/core2-32-poky-linux/repo/repo-locale: PV changed from "2.36.1" to "2.37"
packages/core2-32-poky-linux/repo/repo-src: PKGV changed from 2.36.1 [default] to 2.37 [default]
packages/core2-32-poky-linux/repo/repo-src: PV changed from "2.36.1" to "2.37"
packages/core2-32-poky-linux/repo/repo-staticdev: PKGV changed from 2.36.1 [default] to 2.37 [default]
packages/core2-32-poky-linux/repo/repo-staticdev: PV changed from "2.36.1" to "2.37"
packages/core2-32-poky-linux/repo/repo: PKGV changed from 2.36.1 [default] to 2.37 [default]
packages/core2-32-poky-linux/repo/repo: PV changed from "2.36.1" to "2.37"
packages/core2-32-poky-linux/repo/repo: PKGSIZE changed from 44506 to 48704 (+9%)

--===============6449083826279166200==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-repo-upgrade-2.36.1-2.37.patch"

RnJvbSBhOTQxZDU5ODI4MTJhMjEwOWEyNWQyYTdhMGY3NGM0MTE1NjE3MmM1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBPY3QgMjAyMyAxMDozNjoyNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJl
cG86IHVwZ3JhZGUgMi4zNi4xIC0+IDIuMzcKCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Jl
cG8ve3JlcG9fMi4zNi4xLmJiID0+IHJlcG9fMi4zNy5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcmVwby97cmVwb18yLjM2LjEuYmIgPT4gcmVwb18yLjM3LmJifSAoOTUlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi4zNi4xLmJiIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjM3LmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi4zNi4xLmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuMzcuYmIKaW5kZXggYTNiNDM0
MzlmMi4uZDZkM2QwM2E2MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8v
cmVwb18yLjM2LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjM3
LmJiCkBAIC0xMiw3ICsxMiw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7
bWQ1PTNiODNlZjk2Mzg3ZjE0NjU1ZmM4NTRkZGMzYzZiZDU3IgogU1JDX1VSSSA9ICJnaXQ6Ly9n
ZXJyaXQuZ29vZ2xlc291cmNlLmNvbS9naXQtcmVwby5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNo
PW1haW4gXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1weXRob24zLXNoZWJhbmcucGF0Y2ggXAog
ICAgICAgICAgICAiCi1TUkNSRVYgPSAiMWU5ZjdiOWU5ZWY0NzMzMDVkMTBhMjZhNDgxMzhiYzZh
ZDM4Y2NmNiIKK1NSQ1JFViA9ICI4M2M2NmVjNjYxZTM5ZTQ3Nzk1MDg2YTVkMjZkMGYzNzgyYWMx
ZDQ5IgogCiBNSVJST1JTICs9ICJnaXQ6Ly9nZXJyaXQuZ29vZ2xlc291cmNlLmNvbS9naXQtcmVw
by5naXQgZ2l0Oi8vZ2l0aHViLmNvbS9HZXJyaXRDb2RlUmV2aWV3L2dpdC1yZXBvLmdpdCIKIAot
LSAKMi4zOS4yCgo=

--===============6449083826279166200==--

