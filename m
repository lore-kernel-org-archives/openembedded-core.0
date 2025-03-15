Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05912C35FF7
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:31 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.10350.1742048286063781878
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=hnXEtEhC;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=VS2yzKXK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101959a2b9085-137ab4cb-6ca9-4f0a-919a-3009721e4513-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048301;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gYnY8OPKJiqnHQNw2SitCmFnKoGu9XI+c8jFczJCwvU=;
	b=hnXEtEhCcFlvB7jH1QTeNBZN7f1CBqN3gVqeuY/KviVU8gZ5d9Ql3O1tbDx/feas
	NwLpnj40QcYzlGZcsX/XTS6QZqD1HOD4Gt+L90aggtD2txdve0kUs7zv4ttnpWZqa8n
	zQczSWoC9ewywI4X/vMPDuL0pBlytdjM/a7hHToQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048301;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gYnY8OPKJiqnHQNw2SitCmFnKoGu9XI+c8jFczJCwvU=;
	b=VS2yzKXKzvpdk2p2GZGrctRnIio8zUwUIY3E1SdlYe4cVhiYm8tVeN3SEUZesEGV
	atTj58hNlaewtJ9aPXUVD4ujqe/1KFO4uLS0/WQ9P+PSG00qAEeF6PiE6TMbdGkZFZF
	jn9G5zlYgL5HGs5tEOJ1gANIbmpeXjrjzi+I+biE=
Content-Type: multipart/mixed; boundary="===============4507341608089705316=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools-rust: upgrading to 1.11.0 SUCCEEDED
Message-ID: <010101959a2b9085-137ab4cb-6ca9-4f0a-919a-3009721e4513-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:21 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212918

--===============4507341608089705316==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-setuptools-rust* to *1.11.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-rust-upgrade-1.10.2-1.11.0.patch
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
From c7f8bd15feb2652aeba5429ebdfaba27a4c446fb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Mar 2025 09:37:00 +0000
Subject: [PATCH] python3-setuptools-rust: upgrade 1.10.2 -> 1.11.0

---
 ...uptools-rust_1.10.2.bb => python3-setuptools-rust_1.11.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-rust_1.10.2.bb => python3-setuptools-rust_1.11.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-rust_1.10.2.bb b/meta/recipes-devtools/python/python3-setuptools-rust_1.11.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-setuptools-rust_1.10.2.bb
rename to meta/recipes-devtools/python/python3-setuptools-rust_1.11.0.bb
index df39d61d86..fd6ebf2f61 100644
--- a/meta/recipes-devtools/python/python3-setuptools-rust_1.10.2.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-rust_1.11.0.bb
@@ -9,7 +9,7 @@ BUGTRACKER = "https://github.com/PyO3/setuptools-rust/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=011cd92e702dd9e6b1a26157b6fd53f5"
 
-SRC_URI[sha256sum] = "5d73e7eee5f87a6417285b617c97088a7c20d1a70fcea60e3bdc94ff567c29dc"
+SRC_URI[sha256sum] = "f765d66f3def6fdc85e1e6d889c6a812aea1430c8dadcf1c7b6779b45f874fb2"
 
 PYPI_PACKAGE = "setuptools_rust"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.44.1


--===============4507341608089705316==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-rust-upgrade-1.10.2-1.11.0.patch"

RnJvbSBjN2Y4YmQxNWZlYjI2NTJhZWJhNTQyOWViZGZhYmEyN2E0YzQ0NmZiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTWFyIDIwMjUgMDk6Mzc6MDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNldHVwdG9vbHMtcnVzdDogdXBncmFkZSAxLjEwLjIgLT4gMS4xMS4wCgotLS0KIC4u
LnVwdG9vbHMtcnVzdF8xLjEwLjIuYmIgPT4gcHl0aG9uMy1zZXR1cHRvb2xzLXJ1c3RfMS4xMS4w
LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtc2V0dXB0b29s
cy1ydXN0XzEuMTAuMi5iYiA9PiBweXRob24zLXNldHVwdG9vbHMtcnVzdF8xLjExLjAuYmJ9ICg5
MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNl
dHVwdG9vbHMtcnVzdF8xLjEwLjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtc2V0dXB0b29scy1ydXN0XzEuMTEuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDkxJQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy1y
dXN0XzEuMTAuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXNldHVwdG9vbHMtcnVzdF8xLjExLjAuYmIKaW5kZXggZGYzOWQ2MWQ4Ni4uZmQ2ZWJmMmY2
MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVw
dG9vbHMtcnVzdF8xLjEwLjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXNldHVwdG9vbHMtcnVzdF8xLjExLjAuYmIKQEAgLTksNyArOSw3IEBAIEJVR1RSQUNL
RVIgPSAiaHR0cHM6Ly9naXRodWIuY29tL1B5TzMvc2V0dXB0b29scy1ydXN0L2lzc3VlcyIKIExJ
Q0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MDEx
Y2Q5MmU3MDJkZDllNmIxYTI2MTU3YjZmZDUzZjUiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1
ZDczZTdlZWU1Zjg3YTY0MTcyODViNjE3Yzk3MDg4YTdjMjBkMWE3MGZjZWE2MGUzYmRjOTRmZjU2
N2MyOWRjIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImY3NjVkNjZmM2RlZjZmZGM4NWUxZTZkODg5
YzZhODEyYWVhMTQzMGM4ZGFkY2YxYzdiNjc3OWI0NWY4NzRmYjIiCiAKIFBZUElfUEFDS0FHRSA9
ICJzZXR1cHRvb2xzX3J1c3QiCiBVUFNUUkVBTV9DSEVDS19QWVBJX1BBQ0tBR0UgPSAiJHtQWVBJ
X1BBQ0tBR0V9IgotLSAKMi40NC4xCgo=

--===============4507341608089705316==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-setuptools-rust: PKGV changed from 1.10.2 [default] to 1.11.0 [default]
packages/core2-64-poky-linux/python3-setuptools-rust: PV changed from "1.10.2" to "1.11.0"
packages/core2-64-poky-linux/python3-setuptools-rust: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools_rust/setuptools_rust-1.10.2.tar.gz;downloadfilename=setuptools_rust-1.10.2.tar.gz" to "https://files.pythonhosted.org/packages/source/s/setuptools_rust/setuptools_rust-1.11.0.tar.gz;downloadfilename=setuptools_rust-1.11.0.tar.gz"
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dbg: PKGV changed from 1.10.2 [default] to 1.11.0 [default]
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dbg: PV changed from "1.10.2" to "1.11.0"
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dev: PKGV changed from 1.10.2 [default] to 1.11.0 [default]
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dev: PV changed from "1.10.2" to "1.11.0"
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-doc: PKGV changed from 1.10.2 [default] to 1.11.0 [default]
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-doc: PV changed from "1.10.2" to "1.11.0"
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-locale: PKGV changed from 1.10.2 [default] to 1.11.0 [default]
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-locale: PV changed from "1.10.2" to "1.11.0"
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-src: PKGV changed from 1.10.2 [default] to 1.11.0 [default]
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-src: PV changed from "1.10.2" to "1.11.0"
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-staticdev: PKGV changed from 1.10.2 [default] to 1.11.0 [default]
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-staticdev: PV changed from "1.10.2" to "1.11.0"
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PKGSIZE changed from 158143 to 165291 (+5%)
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PKGV changed from 1.10.2 [default] to 1.11.0 [default]
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PV changed from "1.10.2" to "1.11.0"
Changes to packages/core2-64-poky-linux/python3-setuptools-rust (sysroot):
  /usr/lib/python3.13/site-packages/setuptools_rust-1.10.2.dist-info moved to /usr/lib/python3.13/site-packages/setuptools_rust-1.11.0.dist-info

--===============4507341608089705316==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-setuptools-rust (sysroot):
  /usr/lib/python3.13/site-packages/setuptools_rust-1.10.2.dist-info moved to /usr/lib/python3.13/site-packages/setuptools_rust-1.11.0.dist-info

--===============4507341608089705316==--

