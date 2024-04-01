Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58169CD13BE
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:32 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.1994.1711994601521107260
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=cqDOUXFx;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=oGktvTQL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018e9ad47e56-786cf239-0fb8-49c2-a5f2-8a678c59fef1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994601;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3JF1zBL7ckSi4TyqqCTNFh79eWcFG6AUGbLK14nC8NQ=;
	b=cqDOUXFxwjQJp28q5RgZWh+fkwF9VNgnLHWyFt+TaHs/eg1pqEPAG1bXkoxyM5eJ
	L61OPoBPyG3pLlPSiM31kLGwfhMg54JGSqtEFRSqa5nRb268ArONkA7SNgoE+mAfCci
	uAVkpY95NcSRTdN/wrUiTNouP8V/ekHSob5fpcAs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994601;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3JF1zBL7ckSi4TyqqCTNFh79eWcFG6AUGbLK14nC8NQ=;
	b=oGktvTQLOnTzjbWmvjilodscDSPylaC9FL03pGLs3JyjSXaFLQdd/jB4SgXYCPtj
	gN7QO4/fcO0KRADNRqYwKgjBIRkWAjOgdpsOOvNQiF91AxZH2mlzxTjef98QEsEc/uK
	0d0Kh1eNrW1xRE5N5LXyyXjqeiQJvUdWixV2fW6s=
Content-Type: multipart/mixed; boundary="===============6354490259177878775=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-git: upgrading to 3.1.43 SUCCEEDED
Message-ID: <0101018e9ad47e56-786cf239-0fb8-49c2-a5f2-8a678c59fef1-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:21 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197715

--===============6354490259177878775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-git* to *3.1.43* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-git-upgrade-3.1.42-3.1.43.patch
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
From 8c9ebe7c915096e4c8f70e7eee9fc95f08f76025 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 07:56:21 +0000
Subject: [PATCH] python3-git: upgrade 3.1.42 -> 3.1.43

---
 .../python/{python3-git_3.1.42.bb => python3-git_3.1.43.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.42.bb => python3-git_3.1.43.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.42.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.1.42.bb
rename to meta/recipes-devtools/python/python3-git_3.1.43.bb
index 19885a58c7..45c988117b 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.42.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "2d99869e0fef71a73cbd242528105af1d6c1b108c60dfabd994bf292f76c3ceb"
+SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
 DEPENDS += " python3-gitdb"
 
-- 
2.42.0


--===============6354490259177878775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-git (sysroot):
  /usr/lib/python3.12/site-packages/GitPython-3.1.42.dist-info moved to /usr/lib/python3.12/site-packages/GitPython-3.1.43.dist-info

--===============6354490259177878775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-git: PKGV changed from 3.1.42 [default] to 3.1.43 [default]
packages/core2-64-poky-linux/python3-git: SRC_URI changed from "https://files.pythonhosted.org/packages/source/G/GitPython/GitPython-3.1.42.tar.gz;downloadfilename=GitPython-3.1.42.tar.gz" to "https://files.pythonhosted.org/packages/source/G/GitPython/GitPython-3.1.43.tar.gz;downloadfilename=GitPython-3.1.43.tar.gz"
packages/core2-64-poky-linux/python3-git: PV changed from "3.1.42" to "3.1.43"
packages/core2-64-poky-linux/python3-git/python3-git-dbg: PKGV changed from 3.1.42 [default] to 3.1.43 [default]
packages/core2-64-poky-linux/python3-git/python3-git-dbg: PV changed from "3.1.42" to "3.1.43"
packages/core2-64-poky-linux/python3-git/python3-git-dev: PKGV changed from 3.1.42 [default] to 3.1.43 [default]
packages/core2-64-poky-linux/python3-git/python3-git-dev: PV changed from "3.1.42" to "3.1.43"
packages/core2-64-poky-linux/python3-git/python3-git-doc: PKGV changed from 3.1.42 [default] to 3.1.43 [default]
packages/core2-64-poky-linux/python3-git/python3-git-doc: PV changed from "3.1.42" to "3.1.43"
packages/core2-64-poky-linux/python3-git/python3-git-locale: PKGV changed from 3.1.42 [default] to 3.1.43 [default]
packages/core2-64-poky-linux/python3-git/python3-git-locale: PV changed from "3.1.42" to "3.1.43"
packages/core2-64-poky-linux/python3-git/python3-git-src: PKGV changed from 3.1.42 [default] to 3.1.43 [default]
packages/core2-64-poky-linux/python3-git/python3-git-src: PV changed from "3.1.42" to "3.1.43"
packages/core2-64-poky-linux/python3-git/python3-git-staticdev: PKGV changed from 3.1.42 [default] to 3.1.43 [default]
packages/core2-64-poky-linux/python3-git/python3-git-staticdev: PV changed from "3.1.42" to "3.1.43"
packages/core2-64-poky-linux/python3-git/python3-git: PKGV changed from 3.1.42 [default] to 3.1.43 [default]
packages/core2-64-poky-linux/python3-git/python3-git: PKGSIZE changed from 1304196 to 1385351 (+6%)
packages/core2-64-poky-linux/python3-git/python3-git: PV changed from "3.1.42" to "3.1.43"
Changes to packages/core2-64-poky-linux/python3-git (sysroot):
  /usr/lib/python3.12/site-packages/GitPython-3.1.42.dist-info moved to /usr/lib/python3.12/site-packages/GitPython-3.1.43.dist-info

--===============6354490259177878775==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-git-upgrade-3.1.42-3.1.43.patch"

RnJvbSA4YzllYmU3YzkxNTA5NmU0YzhmNzBlN2VlZTlmYzk1ZjA4Zjc2MDI1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAwNzo1NjoyMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtZ2l0OiB1cGdyYWRlIDMuMS40MiAtPiAzLjEuNDMKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy1naXRfMy4xLjQyLmJiID0+IHB5dGhvbjMtZ2l0XzMuMS40My5iYn0gICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1naXRfMy4xLjQyLmJiID0+IHB5dGhv
bjMtZ2l0XzMuMS40My5iYn0gKDkyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtZ2l0XzMuMS40Mi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1naXRfMy4xLjQzLmJiCnNpbWlsYXJpdHkgaW5kZXggOTIlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1naXRfMy4xLjQyLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZ2l0XzMuMS40My5i
YgppbmRleCAxOTg4NWE1OGM3Li40NWM5ODgxMTdiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZ2l0XzMuMS40Mi5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZ2l0XzMuMS40My5iYgpAQCAtMTIsNyArMTIsNyBAQCBQ
WVBJX1BBQ0tBR0UgPSAiR2l0UHl0aG9uIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9v
bHNfYnVpbGRfbWV0YQogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMmQ5OTg2OWUwZmVmNzFhNzNj
YmQyNDI1MjgxMDVhZjFkNmMxYjEwOGM2MGRmYWJkOTk0YmYyOTJmNzZjM2NlYiIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICIzNWYzMTRhOWY4Nzg0NjdmNTQ1M2NjMWZlZTI5NWMzZTE4ZTUyZjFiOTlm
MTBmNmNmNWIxNjgyZTk2OGE5ZTdjIgogCiBERVBFTkRTICs9ICIgcHl0aG9uMy1naXRkYiIKIAot
LSAKMi40Mi4wCgo=

--===============6354490259177878775==--

