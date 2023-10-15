Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E5C8C04A94
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:22 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.102675.1697399115227529176
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=QnNyw8Kl;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Nord4tls;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.192, mailfrom: 0101018b34df0ad3-2d3a28d1-7b41-4d2f-8ad6-922dc9aa9cc3-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399114;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=NvQ42+yRDY5lcUn1PSIBdTIQoWJfM5krMoH9o0sz7ls=;
	b=QnNyw8Kl1lR1Y7yq+m5GsdVsOwUTKJp1fWGO78jGDWPDMsR1gNFPT8QZWF+Fggx7
	M02zY5wCcDIcTn4okPu35RUSliNp2zSp2kLikrzBFr9v0sUfNcgGSudliGIceKLqNDw
	LM6FkvQ6dqT70b2ASml3ULXaA6MCGUgY8Da7dHfM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399114;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=NvQ42+yRDY5lcUn1PSIBdTIQoWJfM5krMoH9o0sz7ls=;
	b=Nord4tlspiQF11QKIZxiDOzsZedBg+mCPYvqlVxxnouEy+JmFu8YJpk2Ju3B75fj
	UOwXDeDgetAYnZU/So6IW0EBhdDKA6dlHHhlUCQtUk8tK+cfeq/v0XeZMV4CUNfBaWX
	4uL25n1nkOsf1rcGhb4CZfYSJwVgNiB1Im2V/NfE=
Content-Type: multipart/mixed; boundary="===============2269756759298683499=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] repo: upgrading to 2.37 SUCCEEDED
Message-ID: <0101018b34df0ad3-2d3a28d1-7b41-4d2f-8ad6-922dc9aa9cc3-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189207

--===============2269756759298683499==
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
From f6c4ebe8d804e45f70f29e441456aad95aa6e7e9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Oct 2023 12:57:05 +0000
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


--===============2269756759298683499==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-repo-upgrade-2.36.1-2.37.patch"

RnJvbSBmNmM0ZWJlOGQ4MDRlNDVmNzBmMjllNDQxNDU2YWFkOTVhYTZlN2U5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgT2N0IDIwMjMgMTI6NTc6MDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
ZXBvOiB1cGdyYWRlIDIuMzYuMSAtPiAyLjM3CgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9y
ZXBvL3tyZXBvXzIuMzYuMS5iYiA9PiByZXBvXzIuMzcuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3JlcG8ve3JlcG9fMi4zNi4xLmJiID0+IHJlcG9fMi4zNy5iYn0gKDk1JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuMzYuMS5iYiBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi4zNy5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuMzYuMS5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjM3LmJiCmluZGV4IGEzYjQz
NDM5ZjIuLmQ2ZDNkMDNhNjIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBv
L3JlcG9fMi4zNi4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi4z
Ny5iYgpAQCAtMTIsNyArMTIsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNF
O21kNT0zYjgzZWY5NjM4N2YxNDY1NWZjODU0ZGRjM2M2YmQ1NyIKIFNSQ19VUkkgPSAiZ2l0Oi8v
Z2Vycml0Lmdvb2dsZXNvdXJjZS5jb20vZ2l0LXJlcG8uZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5j
aD1tYWluIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtcHl0aG9uMy1zaGViYW5nLnBhdGNoIFwK
ICAgICAgICAgICAgIgotU1JDUkVWID0gIjFlOWY3YjllOWVmNDczMzA1ZDEwYTI2YTQ4MTM4YmM2
YWQzOGNjZjYiCitTUkNSRVYgPSAiODNjNjZlYzY2MWUzOWU0Nzc5NTA4NmE1ZDI2ZDBmMzc4MmFj
MWQ0OSIKIAogTUlSUk9SUyArPSAiZ2l0Oi8vZ2Vycml0Lmdvb2dsZXNvdXJjZS5jb20vZ2l0LXJl
cG8uZ2l0IGdpdDovL2dpdGh1Yi5jb20vR2Vycml0Q29kZVJldmlldy9naXQtcmVwby5naXQiCiAK
LS0gCjIuMzkuMgoK

--===============2269756759298683499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/repo: PV changed from "2.36.1" to "2.37"
packages/core2-32-poky-linux/repo: PKGV changed from 2.36.1 [default] to 2.37 [default]
packages/core2-32-poky-linux/repo/repo-dbg: PV changed from "2.36.1" to "2.37"
packages/core2-32-poky-linux/repo/repo-dbg: PKGV changed from 2.36.1 [default] to 2.37 [default]
packages/core2-32-poky-linux/repo/repo-dev: PV changed from "2.36.1" to "2.37"
packages/core2-32-poky-linux/repo/repo-dev: PKGV changed from 2.36.1 [default] to 2.37 [default]
packages/core2-32-poky-linux/repo/repo-doc: PV changed from "2.36.1" to "2.37"
packages/core2-32-poky-linux/repo/repo-doc: PKGV changed from 2.36.1 [default] to 2.37 [default]
packages/core2-32-poky-linux/repo/repo-locale: PV changed from "2.36.1" to "2.37"
packages/core2-32-poky-linux/repo/repo-locale: PKGV changed from 2.36.1 [default] to 2.37 [default]
packages/core2-32-poky-linux/repo/repo-src: PV changed from "2.36.1" to "2.37"
packages/core2-32-poky-linux/repo/repo-src: PKGV changed from 2.36.1 [default] to 2.37 [default]
packages/core2-32-poky-linux/repo/repo-staticdev: PV changed from "2.36.1" to "2.37"
packages/core2-32-poky-linux/repo/repo-staticdev: PKGV changed from 2.36.1 [default] to 2.37 [default]
packages/core2-32-poky-linux/repo/repo: PV changed from "2.36.1" to "2.37"
packages/core2-32-poky-linux/repo/repo: PKGV changed from 2.36.1 [default] to 2.37 [default]
packages/core2-32-poky-linux/repo/repo: PKGSIZE changed from 44506 to 48704 (+9%)

--===============2269756759298683499==--

