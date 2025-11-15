Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 251D8CEBF92
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:38:52 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12106.1763224707847198131
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:38:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Dg+JY9cU;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=BAEcU1DV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019a886234b9-fda2da4f-bc36-4edc-931a-9b0007790ba8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224728;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zTdbwb2+18W3BQYxsA5vFZ0eXQCiqZdm65IB2caWVeM=;
	b=Dg+JY9cUwe1Ue+AQqSNdHSaS/nQ8KVOBAf7Tt0Dej0xZTZWR2bR2mrjpmJv1w7P6
	X+sQi086dMLLBhWsMz1bJTEfx6/LeCu887gIxvL2FQ4hswaPeprqgSsDjoOgURpwZWH
	T1Nfwo1mlX9gmqb9sCzI7aYMAUyYL3xD1qmyNZus=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224728;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zTdbwb2+18W3BQYxsA5vFZ0eXQCiqZdm65IB2caWVeM=;
	b=BAEcU1DVjhfITtqB6fdqAEcLiqGnnOvWmrIjovRokOE8uAZxT3h6zyrGEm92qYkE
	K1WhnP/q0nBYCI13oZitqKdAYWEnP8SgDdi+fTgOwnGjyReyzBZnCWI0em2gg239tEY
	OFEfTrqXOdaBGtrQ+xifKT0rBbLxjq1yOWZCUWv8=
Content-Type: multipart/mixed; boundary="===============8676111924296512858=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pdm: upgrading to 2.26.1 SUCCEEDED
Message-ID: <0101019a886234b9-fda2da4f-bc36-4edc-931a-9b0007790ba8-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:38:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:38:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226363

--===============8676111924296512858==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pdm* to *2.26.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pdm-upgrade-2.25.9-2.26.1.patch
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
From cd2cb5c641a9ea1a75d5ee51c57b9e4f10fea29f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 10:41:41 +0000
Subject: [PATCH] python3-pdm: upgrade 2.25.9 -> 2.26.1

---
 .../python/{python3-pdm_2.25.9.bb => python3-pdm_2.26.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.25.9.bb => python3-pdm_2.26.1.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.25.9.bb b/meta/recipes-devtools/python/python3-pdm_2.26.1.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pdm_2.25.9.bb
rename to meta/recipes-devtools/python/python3-pdm_2.26.1.bb
index 6938edb82f..bd25f141f0 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.25.9.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.26.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "fb5fcd561986db1d83255d01e97e2e16f80debf743934d891a62ff2933ccc80c"
+SRC_URI[sha256sum] = "60a568201424a7193b661f6fed6e446e39695b52edc5e0904ba0b07fcaf2e787"
 
 inherit pypi python_pdm
 
-- 
2.47.1


--===============8676111924296512858==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pdm: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.25.9.tar.gz;downloadfilename=pdm-2.25.9.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.26.1.tar.gz;downloadfilename=pdm-2.26.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-pdm: PV changed from "2.25.9" to "2.26.1"
packages/x86-64-v3-poky-linux/python3-pdm: PKGV changed from 2.25.9 [default] to 2.26.1 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dbg: PV changed from "2.25.9" to "2.26.1"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dbg: PKGV changed from 2.25.9 [default] to 2.26.1 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dev: PV changed from "2.25.9" to "2.26.1"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dev: PKGV changed from 2.25.9 [default] to 2.26.1 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-doc: PV changed from "2.25.9" to "2.26.1"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-doc: PKGV changed from 2.25.9 [default] to 2.26.1 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-locale: PV changed from "2.25.9" to "2.26.1"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-locale: PKGV changed from 2.25.9 [default] to 2.26.1 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-src: PV changed from "2.25.9" to "2.26.1"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-src: PKGV changed from 2.25.9 [default] to 2.26.1 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-staticdev: PV changed from "2.25.9" to "2.26.1"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-staticdev: PKGV changed from 2.25.9 [default] to 2.26.1 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PKGSIZE changed from 2242786 to 2248256 (+0%)
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PV changed from "2.25.9" to "2.26.1"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PKGV changed from 2.25.9 [default] to 2.26.1 [default]
Changes to packages/x86-64-v3-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.13/site-packages/pdm-2.25.9.dist-info moved to /usr/lib/python3.13/site-packages/pdm-2.26.1.dist-info

--===============8676111924296512858==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pdm-upgrade-2.25.9-2.26.1.patch"

RnJvbSBjZDJjYjVjNjQxYTllYTFhNzVkNWVlNTFjNTdiOWU0ZjEwZmVhMjlmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMTA6NDE6NDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBkbTogdXBncmFkZSAyLjI1LjkgLT4gMi4yNi4xCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtcGRtXzIuMjUuOS5iYiA9PiBweXRob24zLXBkbV8yLjI2LjEuYmJ9ICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcGRtXzIuMjUuOS5iYiA9PiBweXRo
b24zLXBkbV8yLjI2LjEuYmJ9ICg4MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjI1LjkuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcGRtXzIuMjYuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDgwJQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjUuOS5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjI2LjEu
YmIKaW5kZXggNjkzOGVkYjgyZi4uYmQyNWYxNDFmMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjI1LjkuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjI2LjEuYmIKQEAgLTQsNyArNCw3IEBAIExJ
Q0VOU0UgPSAiTUlUIgogU0VDVElPTiA9ICJkZXZlbC9weXRob24iCiBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFO21kNT0yZWIzMWEyY2MxYTc1OGMzNGI0OTlmMjg3ZGQwNGVmMiIK
IAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImZiNWZjZDU2MTk4NmRiMWQ4MzI1NWQwMWU5N2UyZTE2
ZjgwZGViZjc0MzkzNGQ4OTFhNjJmZjI5MzNjY2M4MGMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
NjBhNTY4MjAxNDI0YTcxOTNiNjYxZjZmZWQ2ZTQ0NmUzOTY5NWI1MmVkYzVlMDkwNGJhMGIwN2Zj
YWYyZTc4NyIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9wZG0KIAotLSAKMi40Ny4xCgo=

--===============8676111924296512858==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.13/site-packages/pdm-2.25.9.dist-info moved to /usr/lib/python3.13/site-packages/pdm-2.26.1.dist-info

--===============8676111924296512858==--

