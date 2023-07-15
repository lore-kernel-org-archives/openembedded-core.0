Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89CBEC27C52
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:39 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.5948.1689456455265522325
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Af6rubLC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101895b73ab3d-4070cf6f-5105-4ca0-8456-cee1445f590e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456454;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=xfvzOoPIFESvMfveebFPjiRosYNP0f07sfcuFDzvkhQ=;
	b=Af6rubLC9AmiVOIa6Ixpk4Vkj0XYGRyGhvVK2qOt+MbHs4MT1ewxc2lIwhiQSa80
	rgrc5h9Dm4+CkGKU1rEKT7L1HAtE8UyFCQXiH7K8ybYzs3MbpqA6ELTv+YHXPXtznv7
	/R6/QOrsgl8jYBaJCovlQeZFT7JJdGqA2zJ9xMnI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456454;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=xfvzOoPIFESvMfveebFPjiRosYNP0f07sfcuFDzvkhQ=;
	b=l3scGdoWP7RsTFCU89MP+2GC+ZyW2hQkSeiCSqpFSHoMLRYL10AwAuRf9mI8S7+K
	5z2gtCKqgtemkvz17Wt1pGM2to708x/sdtkTFhY/zfxdnNyseFLzEBpHHMC/ZSzm+3w
	ZroLBhr+aQubN4d2zVtJZ4L8UA23+6boNTQIIu3w=
Content-Type: multipart/mixed; boundary="===============0023229235143643913=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] repo: upgrading to 2.35 SUCCEEDED
Message-ID: <010101895b73ab3d-4070cf6f-5105-4ca0-8456-cee1445f590e-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184360

--===============0023229235143643913==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *repo* to *2.35* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.34.1-2.35.patch
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
From d33f41c55678a061093dfac94d913f3ccf9cd2ed Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 13:41:59 +0000
Subject: [PATCH] repo: upgrade 2.34.1 -> 2.35

---
 meta/recipes-devtools/repo/{repo_2.34.1.bb => repo_2.35.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.34.1.bb => repo_2.35.bb} (95%)

diff --git a/meta/recipes-devtools/repo/repo_2.34.1.bb b/meta/recipes-devtools/repo/repo_2.35.bb
similarity index 95%
rename from meta/recipes-devtools/repo/repo_2.34.1.bb
rename to meta/recipes-devtools/repo/repo_2.35.bb
index 1c5d1a08b3..d34c3db746 100644
--- a/meta/recipes-devtools/repo/repo_2.34.1.bb
+++ b/meta/recipes-devtools/repo/repo_2.35.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            file://0001-python3-shebang.patch \
            "
-SRCREV = "945c006f406550add8a3cad32ada0791f5a15c53"
+SRCREV = "c657844efe40b97700c3654989bdbe3a33e409d7"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.39.2


--===============0023229235143643913==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/repo: PV changed from "2.34.1" to "2.35"
packages/core2-32-poky-linux/repo: PKGV changed from 2.34.1 [default] to 2.35 [default]
packages/core2-32-poky-linux/repo/repo-dbg: PV changed from "2.34.1" to "2.35"
packages/core2-32-poky-linux/repo/repo-dbg: PKGV changed from 2.34.1 [default] to 2.35 [default]
packages/core2-32-poky-linux/repo/repo-dev: PV changed from "2.34.1" to "2.35"
packages/core2-32-poky-linux/repo/repo-dev: PKGV changed from 2.34.1 [default] to 2.35 [default]
packages/core2-32-poky-linux/repo/repo-doc: PV changed from "2.34.1" to "2.35"
packages/core2-32-poky-linux/repo/repo-doc: PKGV changed from 2.34.1 [default] to 2.35 [default]
packages/core2-32-poky-linux/repo/repo-locale: PV changed from "2.34.1" to "2.35"
packages/core2-32-poky-linux/repo/repo-locale: PKGV changed from 2.34.1 [default] to 2.35 [default]
packages/core2-32-poky-linux/repo/repo-src: PV changed from "2.34.1" to "2.35"
packages/core2-32-poky-linux/repo/repo-src: PKGV changed from 2.34.1 [default] to 2.35 [default]
packages/core2-32-poky-linux/repo/repo-staticdev: PV changed from "2.34.1" to "2.35"
packages/core2-32-poky-linux/repo/repo-staticdev: PKGV changed from 2.34.1 [default] to 2.35 [default]
packages/core2-32-poky-linux/repo/repo: PV changed from "2.34.1" to "2.35"
packages/core2-32-poky-linux/repo/repo: PKGV changed from 2.34.1 [default] to 2.35 [default]
packages/core2-32-poky-linux/repo/repo: PKGSIZE changed from 45840 to 45832 (-0%)

--===============0023229235143643913==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-repo-upgrade-2.34.1-2.35.patch"

RnJvbSBkMzNmNDFjNTU2NzhhMDYxMDkzZGZhYzk0ZDkxM2YzY2NmOWNkMmVkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMTM6NDE6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
ZXBvOiB1cGdyYWRlIDIuMzQuMSAtPiAyLjM1CgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9y
ZXBvL3tyZXBvXzIuMzQuMS5iYiA9PiByZXBvXzIuMzUuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3JlcG8ve3JlcG9fMi4zNC4xLmJiID0+IHJlcG9fMi4zNS5iYn0gKDk1JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuMzQuMS5iYiBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi4zNS5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuMzQuMS5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjM1LmJiCmluZGV4IDFjNWQx
YTA4YjMuLmQzNGMzZGI3NDYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBv
L3JlcG9fMi4zNC4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi4z
NS5iYgpAQCAtMTIsNyArMTIsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNF
O21kNT0zYjgzZWY5NjM4N2YxNDY1NWZjODU0ZGRjM2M2YmQ1NyIKIFNSQ19VUkkgPSAiZ2l0Oi8v
Z2Vycml0Lmdvb2dsZXNvdXJjZS5jb20vZ2l0LXJlcG8uZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5j
aD1tYWluIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtcHl0aG9uMy1zaGViYW5nLnBhdGNoIFwK
ICAgICAgICAgICAgIgotU1JDUkVWID0gIjk0NWMwMDZmNDA2NTUwYWRkOGEzY2FkMzJhZGEwNzkx
ZjVhMTVjNTMiCitTUkNSRVYgPSAiYzY1Nzg0NGVmZTQwYjk3NzAwYzM2NTQ5ODliZGJlM2EzM2U0
MDlkNyIKIAogTUlSUk9SUyArPSAiZ2l0Oi8vZ2Vycml0Lmdvb2dsZXNvdXJjZS5jb20vZ2l0LXJl
cG8uZ2l0IGdpdDovL2dpdGh1Yi5jb20vR2Vycml0Q29kZVJldmlldy9naXQtcmVwby5naXQiCiAK
LS0gCjIuMzkuMgoK

--===============0023229235143643913==--

