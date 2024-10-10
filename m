Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01696D1A431
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:30 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.53351.1728588940997633635
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=HpHvSqOu;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=3r3a/IJA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019277eea686-0aa60bf7-d2ae-43c5-b253-17f36e3d4b9f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588982;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=a3dV0FjGnfuSnd0C+Jc/uf8mXsZXZfIFXLIm0oRX5DE=;
	b=HpHvSqOufsUMuZRQrCGE5ATOfxS03KFoTvTCS6x3++UKD9sk2ly7yjYwuS7wyy4t
	vNdQ0Q8nLtI+vryZzDkSEUthyfnfwzAFHk+S3bzekmOEAMSqULJ8LGIKy6bBqDEsZSw
	GQhXYun3M3hMK7m3cLZ/Surk72PKBA/dRXf/xrrY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588982;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=a3dV0FjGnfuSnd0C+Jc/uf8mXsZXZfIFXLIm0oRX5DE=;
	b=3r3a/IJAbR+t2jijFq6cZeeHtEJ6yuyOvqE4C4cg8WjR//LksaiOPDUCo4R1uk9o
	Njjox0hFUr5KfEh4SQJ7kzsaN/jv4pda6yMWokfRyOH84pUBGKeOD/nPXN0wK6j1rJL
	PXeutO/zSUGlVQYBD1j6hUJs4RhYHkiOzzOSIxMo=
Content-Type: multipart/mixed; boundary="===============0235611411436800277=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools-rust: upgrading to 1.10.2 SUCCEEDED
Message-ID: <0101019277eea686-0aa60bf7-d2ae-43c5-b253-17f36e3d4b9f-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:21 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205564

--===============0235611411436800277==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-setuptools-rust* to *1.10.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-rust-upgrade-1.10.1-1.10.2.patch
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
From c320ce41a4c79031441580023d54df705ef9ea06 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 02:22:51 +0000
Subject: [PATCH] python3-setuptools-rust: upgrade 1.10.1 -> 1.10.2

---
 ...uptools-rust_1.10.1.bb => python3-setuptools-rust_1.10.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-rust_1.10.1.bb => python3-setuptools-rust_1.10.2.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-rust_1.10.1.bb b/meta/recipes-devtools/python/python3-setuptools-rust_1.10.2.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-setuptools-rust_1.10.1.bb
rename to meta/recipes-devtools/python/python3-setuptools-rust_1.10.2.bb
index d2881e9101..a58d57ac70 100644
--- a/meta/recipes-devtools/python/python3-setuptools-rust_1.10.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-rust_1.10.2.bb
@@ -9,7 +9,7 @@ BUGTRACKER = "https://github.com/PyO3/setuptools-rust/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=011cd92e702dd9e6b1a26157b6fd53f5"
 
-SRC_URI[sha256sum] = "d79035fc54cdf9342e9edf4b009491ecab06c3a652b37c3c137c7ba85547d3e6"
+SRC_URI[sha256sum] = "5d73e7eee5f87a6417285b617c97088a7c20d1a70fcea60e3bdc94ff567c29dc"
 
 PYPI_PACKAGE = "setuptools_rust"
 
-- 
2.44.1


--===============0235611411436800277==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-setuptools-rust (sysroot):
  /usr/lib/python3.12/site-packages/setuptools_rust-1.10.1.dist-info moved to /usr/lib/python3.12/site-packages/setuptools_rust-1.10.2.dist-info

--===============0235611411436800277==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-rust-upgrade-1.10.1-1.10.2.patch"

RnJvbSBjMzIwY2U0MWE0Yzc5MDMxNDQxNTgwMDIzZDU0ZGY3MDVlZjllYTA2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMDI6MjI6NTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNldHVwdG9vbHMtcnVzdDogdXBncmFkZSAxLjEwLjEgLT4gMS4xMC4yCgotLS0KIC4u
LnVwdG9vbHMtcnVzdF8xLjEwLjEuYmIgPT4gcHl0aG9uMy1zZXR1cHRvb2xzLXJ1c3RfMS4xMC4y
LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtc2V0dXB0b29s
cy1ydXN0XzEuMTAuMS5iYiA9PiBweXRob24zLXNldHVwdG9vbHMtcnVzdF8xLjEwLjIuYmJ9ICg5
MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNl
dHVwdG9vbHMtcnVzdF8xLjEwLjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtc2V0dXB0b29scy1ydXN0XzEuMTAuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDkwJQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy1y
dXN0XzEuMTAuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXNldHVwdG9vbHMtcnVzdF8xLjEwLjIuYmIKaW5kZXggZDI4ODFlOTEwMS4uYTU4ZDU3YWM3
MCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVw
dG9vbHMtcnVzdF8xLjEwLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXNldHVwdG9vbHMtcnVzdF8xLjEwLjIuYmIKQEAgLTksNyArOSw3IEBAIEJVR1RSQUNL
RVIgPSAiaHR0cHM6Ly9naXRodWIuY29tL1B5TzMvc2V0dXB0b29scy1ydXN0L2lzc3VlcyIKIExJ
Q0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MDEx
Y2Q5MmU3MDJkZDllNmIxYTI2MTU3YjZmZDUzZjUiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJk
NzkwMzVmYzU0Y2RmOTM0MmU5ZWRmNGIwMDk0OTFlY2FiMDZjM2E2NTJiMzdjM2MxMzdjN2JhODU1
NDdkM2U2IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjVkNzNlN2VlZTVmODdhNjQxNzI4NWI2MTdj
OTcwODhhN2MyMGQxYTcwZmNlYTYwZTNiZGM5NGZmNTY3YzI5ZGMiCiAKIFBZUElfUEFDS0FHRSA9
ICJzZXR1cHRvb2xzX3J1c3QiCiAKLS0gCjIuNDQuMQoK

--===============0235611411436800277==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-setuptools-rust: PKGV changed from 1.10.1 [default] to 1.10.2 [default]
packages/core2-64-poky-linux/python3-setuptools-rust: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools_rust/setuptools_rust-1.10.1.tar.gz;downloadfilename=setuptools_rust-1.10.1.tar.gz" to "https://files.pythonhosted.org/packages/source/s/setuptools_rust/setuptools_rust-1.10.2.tar.gz;downloadfilename=setuptools_rust-1.10.2.tar.gz"
packages/core2-64-poky-linux/python3-setuptools-rust: PV changed from "1.10.1" to "1.10.2"
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dbg: PKGV changed from 1.10.1 [default] to 1.10.2 [default]
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dbg: PV changed from "1.10.1" to "1.10.2"
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dev: PKGV changed from 1.10.1 [default] to 1.10.2 [default]
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dev: PV changed from "1.10.1" to "1.10.2"
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-doc: PKGV changed from 1.10.1 [default] to 1.10.2 [default]
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-doc: PV changed from "1.10.1" to "1.10.2"
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-locale: PKGV changed from 1.10.1 [default] to 1.10.2 [default]
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-locale: PV changed from "1.10.1" to "1.10.2"
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-src: PKGV changed from 1.10.1 [default] to 1.10.2 [default]
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-src: PV changed from "1.10.1" to "1.10.2"
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-staticdev: PKGV changed from 1.10.1 [default] to 1.10.2 [default]
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-staticdev: PV changed from "1.10.1" to "1.10.2"
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PKGV changed from 1.10.1 [default] to 1.10.2 [default]
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PKGSIZE changed from 157770 to 158264 (+0%)
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PV changed from "1.10.1" to "1.10.2"
Changes to packages/core2-64-poky-linux/python3-setuptools-rust (sysroot):
  /usr/lib/python3.12/site-packages/setuptools_rust-1.10.1.dist-info moved to /usr/lib/python3.12/site-packages/setuptools_rust-1.10.2.dist-info

--===============0235611411436800277==--

