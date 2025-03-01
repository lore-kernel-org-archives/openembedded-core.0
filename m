Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ACECC35FFF
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 11:25:39 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.7060.1740828329051213110
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 03:25:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=F98ORKru;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=xwVWbabi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019551743ff9-36a80c86-466f-4056-b6b8-cfe62a9838b1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1740828328;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jZK2e0w+0xRn2ePGQgsvQ7CYxGQrpqMiT6acFf76UpI=;
	b=F98ORKruDLqgUkjRL89zRYrBkeU8t+0HFlnv6t1aQna9rmY9tRQ7/EL9PmXoVqH0
	dTJFl2oNlR4/CU4X2STBx77KZf+2sNLiviBVDkjsRgaZRY44mjuUcXU12L3nkDPVX1S
	ft1H6j5dQXJej8ZefJWmuqHC4FCzMb3H0suNzHv4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1740828328;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jZK2e0w+0xRn2ePGQgsvQ7CYxGQrpqMiT6acFf76UpI=;
	b=xwVWbabiOQssGwH2hFH1jLsOUuBCUZLQzZScRB6wBvTiKHyeQUlMHSfBh8JIoZl8
	EalFmc6moxEaVdRpQjeTUNYq+yiPKMsjT5y2y98Abf43ZETN4GsvVBKsRXNT+ug42fm
	AUweg4Y0QRuCmFhwX1jsuE3lmFF8TFrGMKLVJR5I=
Content-Type: multipart/mixed; boundary="===============0186257923637589214=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] repo: upgrading to 2.52 SUCCEEDED
Message-ID: <0101019551743ff9-36a80c86-466f-4056-b6b8-cfe62a9838b1-000000@us-west-2.amazonses.com>
Date: Sat, 1 Mar 2025 11:25:27 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 11:25:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212136

--===============0186257923637589214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *repo* to *2.52* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.51-2.52.patch
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
From 926b49d91ad97af5eb7c901c510b20194bf20a3e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Mar 2025 08:21:58 +0000
Subject: [PATCH] repo: upgrade 2.51 -> 2.52

---
 meta/recipes-devtools/repo/{repo_2.51.bb => repo_2.52.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.51.bb => repo_2.52.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.51.bb b/meta/recipes-devtools/repo/repo_2.52.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.51.bb
rename to meta/recipes-devtools/repo/repo_2.52.bb
index b78b4867f1..2e877c1847 100644
--- a/meta/recipes-devtools/repo/repo_2.51.bb
+++ b/meta/recipes-devtools/repo/repo_2.52.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            "
-SRCREV = "db111d392407797e170355e1c0ec98e71d4a8278"
+SRCREV = "8d5f03261164f3cd65af0576dfa7d4edded96c67"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.44.1


--===============0186257923637589214==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-repo-upgrade-2.51-2.52.patch"

RnJvbSA5MjZiNDlkOTFhZDk3YWY1ZWI3YzkwMWM1MTBiMjAxOTRiZjIwYTNlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBNYXIgMjAyNSAwODoyMTo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJl
cG86IHVwZ3JhZGUgMi41MSAtPiAyLjUyCgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBv
L3tyZXBvXzIuNTEuYmIgPT4gcmVwb18yLjUyLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9yZXBvL3tyZXBvXzIuNTEuYmIgPT4gcmVwb18yLjUyLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi41MS5iYiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9yZXBvL3JlcG9fMi41Mi5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNTEuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi41Mi5iYgppbmRleCBiNzhiNDg2N2YxLi4yZTg3
N2MxODQ3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNTEu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjUyLmJiCkBAIC0xMSw3
ICsxMSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTNiODNlZjk2
Mzg3ZjE0NjU1ZmM4NTRkZGMzYzZiZDU3IgogCiBTUkNfVVJJID0gImdpdDovL2dlcnJpdC5nb29n
bGVzb3VyY2UuY29tL2dpdC1yZXBvLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFpbiBcCiAg
ICAgICAgICAgICIKLVNSQ1JFViA9ICJkYjExMWQzOTI0MDc3OTdlMTcwMzU1ZTFjMGVjOThlNzFk
NGE4Mjc4IgorU1JDUkVWID0gIjhkNWYwMzI2MTE2NGYzY2Q2NWFmMDU3NmRmYTdkNGVkZGVkOTZj
NjciCiAKIE1JUlJPUlMgKz0gImdpdDovL2dlcnJpdC5nb29nbGVzb3VyY2UuY29tL2dpdC1yZXBv
LmdpdCBnaXQ6Ly9naXRodWIuY29tL0dlcnJpdENvZGVSZXZpZXcvZ2l0LXJlcG8uZ2l0IgogCi0t
IAoyLjQ0LjEKCg==

--===============0186257923637589214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/repo: PV changed from "2.51" to "2.52"
packages/core2-64-poky-linux/repo: PKGV changed from 2.51 [default] to 2.52 [default]
packages/core2-64-poky-linux/repo/repo-dbg: PV changed from "2.51" to "2.52"
packages/core2-64-poky-linux/repo/repo-dbg: PKGV changed from 2.51 [default] to 2.52 [default]
packages/core2-64-poky-linux/repo/repo-dev: PV changed from "2.51" to "2.52"
packages/core2-64-poky-linux/repo/repo-dev: PKGV changed from 2.51 [default] to 2.52 [default]
packages/core2-64-poky-linux/repo/repo-doc: PV changed from "2.51" to "2.52"
packages/core2-64-poky-linux/repo/repo-doc: PKGV changed from 2.51 [default] to 2.52 [default]
packages/core2-64-poky-linux/repo/repo-locale: PV changed from "2.51" to "2.52"
packages/core2-64-poky-linux/repo/repo-locale: PKGV changed from 2.51 [default] to 2.52 [default]
packages/core2-64-poky-linux/repo/repo-src: PV changed from "2.51" to "2.52"
packages/core2-64-poky-linux/repo/repo-src: PKGV changed from 2.51 [default] to 2.52 [default]
packages/core2-64-poky-linux/repo/repo-staticdev: PV changed from "2.51" to "2.52"
packages/core2-64-poky-linux/repo/repo-staticdev: PKGV changed from 2.51 [default] to 2.52 [default]
packages/core2-64-poky-linux/repo/repo: PV changed from "2.51" to "2.52"
packages/core2-64-poky-linux/repo/repo: PKGV changed from 2.51 [default] to 2.52 [default]

--===============0186257923637589214==--

