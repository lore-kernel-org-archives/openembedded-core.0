Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E07C3ABA3
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:33:06 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.20165.1744723971465185019
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 06:32:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=fQ97pTOv;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=oRcrgQi+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019639a7244a-60ac6e1c-6128-4e62-a787-3d913dc2b15f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1744723977;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9gDnOXyF0Q0iVBupBSV6J0a4OzRT3CC0KALgMnFZD34=;
	b=fQ97pTOvkBcKxagdQTacoipXMH5M87vSnSAz0iApWct3EyHttViUyOZU2ctS7tXC
	AyxuflH3Y2KnP96MeofaEp3EUx7pHm1JbVFbAhBGvia7XRFMYAwxHWp457MMCOtP5uF
	L9SbT2Ne11KIrR9qBG62MZGjf4raUIlBgJf2UV54=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1744723977;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9gDnOXyF0Q0iVBupBSV6J0a4OzRT3CC0KALgMnFZD34=;
	b=oRcrgQi+ZPj9p0fci42zBsZEWKZQi3YfIITkxzrw7yNgpHiSsa8IkNg9cvLnJxi1
	kct+QyaMD4QUveAPx2afwYrkGk85L6f04izyLKsembaHmaYNqYa4VOsuzpBDQwUHoO4
	a8z9fmTlUPOO1OSGNdaflNkDQEELvymj+e7QL0zg=
Content-Type: multipart/mixed; boundary="===============6361156901544244834=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools-rust: upgrading to 1.11.1 SUCCEEDED
Message-ID: <0101019639a7244a-60ac6e1c-6128-4e62-a787-3d913dc2b15f-000000@us-west-2.amazonses.com>
Date: Tue, 15 Apr 2025 13:32:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:33:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214882

--===============6361156901544244834==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-setuptools-rust* to *1.11.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-rust-upgrade-1.11.0-1.11.1.patch
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
From 466c55563b7f7110733e7d2f34487dbcda7134b5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Apr 2025 07:41:59 +0000
Subject: [PATCH] python3-setuptools-rust: upgrade 1.11.0 -> 1.11.1

---
 ...uptools-rust_1.11.0.bb => python3-setuptools-rust_1.11.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-rust_1.11.0.bb => python3-setuptools-rust_1.11.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-rust_1.11.0.bb b/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-setuptools-rust_1.11.0.bb
rename to meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb
index fd6ebf2f61..417ded009e 100644
--- a/meta/recipes-devtools/python/python3-setuptools-rust_1.11.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb
@@ -9,7 +9,7 @@ BUGTRACKER = "https://github.com/PyO3/setuptools-rust/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=011cd92e702dd9e6b1a26157b6fd53f5"
 
-SRC_URI[sha256sum] = "f765d66f3def6fdc85e1e6d889c6a812aea1430c8dadcf1c7b6779b45f874fb2"
+SRC_URI[sha256sum] = "7dabc4392252ced314b8050d63276e05fdc5d32398fc7d3cce1f6a6ac35b76c0"
 
 PYPI_PACKAGE = "setuptools_rust"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.47.1


--===============6361156901544244834==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-setuptools-rust: PV changed from "1.11.0" to "1.11.1"
packages/core2-64-poky-linux/python3-setuptools-rust: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools_rust/setuptools_rust-1.11.0.tar.gz;downloadfilename=setuptools_rust-1.11.0.tar.gz" to "https://files.pythonhosted.org/packages/source/s/setuptools_rust/setuptools_rust-1.11.1.tar.gz;downloadfilename=setuptools_rust-1.11.1.tar.gz"
packages/core2-64-poky-linux/python3-setuptools-rust: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dbg: PV changed from "1.11.0" to "1.11.1"
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dbg: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dev: PV changed from "1.11.0" to "1.11.1"
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dev: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-doc: PV changed from "1.11.0" to "1.11.1"
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-doc: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-locale: PV changed from "1.11.0" to "1.11.1"
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-locale: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-src: PV changed from "1.11.0" to "1.11.1"
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-src: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-staticdev: PV changed from "1.11.0" to "1.11.1"
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust-staticdev: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PV changed from "1.11.0" to "1.11.1"
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-64-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PKGSIZE changed from 165313 to 166806 (+1%)
Changes to packages/core2-64-poky-linux/python3-setuptools-rust (sysroot):
  /usr/lib/python3.13/site-packages/setuptools_rust-1.11.0.dist-info moved to /usr/lib/python3.13/site-packages/setuptools_rust-1.11.1.dist-info

--===============6361156901544244834==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-setuptools-rust (sysroot):
  /usr/lib/python3.13/site-packages/setuptools_rust-1.11.0.dist-info moved to /usr/lib/python3.13/site-packages/setuptools_rust-1.11.1.dist-info

--===============6361156901544244834==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-rust-upgrade-1.11.0-1.11.1.patch"

RnJvbSA0NjZjNTU1NjNiN2Y3MTEwNzMzZTdkMmYzNDQ4N2RiY2RhNzEzNGI1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgQXByIDIwMjUgMDc6NDE6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNldHVwdG9vbHMtcnVzdDogdXBncmFkZSAxLjExLjAgLT4gMS4xMS4xCgotLS0KIC4u
LnVwdG9vbHMtcnVzdF8xLjExLjAuYmIgPT4gcHl0aG9uMy1zZXR1cHRvb2xzLXJ1c3RfMS4xMS4x
LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtc2V0dXB0b29s
cy1ydXN0XzEuMTEuMC5iYiA9PiBweXRob24zLXNldHVwdG9vbHMtcnVzdF8xLjExLjEuYmJ9ICg5
MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNl
dHVwdG9vbHMtcnVzdF8xLjExLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtc2V0dXB0b29scy1ydXN0XzEuMTEuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDkxJQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy1y
dXN0XzEuMTEuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXNldHVwdG9vbHMtcnVzdF8xLjExLjEuYmIKaW5kZXggZmQ2ZWJmMmY2MS4uNDE3ZGVkMDA5
ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVw
dG9vbHMtcnVzdF8xLjExLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXNldHVwdG9vbHMtcnVzdF8xLjExLjEuYmIKQEAgLTksNyArOSw3IEBAIEJVR1RSQUNL
RVIgPSAiaHR0cHM6Ly9naXRodWIuY29tL1B5TzMvc2V0dXB0b29scy1ydXN0L2lzc3VlcyIKIExJ
Q0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MDEx
Y2Q5MmU3MDJkZDllNmIxYTI2MTU3YjZmZDUzZjUiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJm
NzY1ZDY2ZjNkZWY2ZmRjODVlMWU2ZDg4OWM2YTgxMmFlYTE0MzBjOGRhZGNmMWM3YjY3NzliNDVm
ODc0ZmIyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjdkYWJjNDM5MjI1MmNlZDMxNGI4MDUwZDYz
Mjc2ZTA1ZmRjNWQzMjM5OGZjN2QzY2NlMWY2YTZhYzM1Yjc2YzAiCiAKIFBZUElfUEFDS0FHRSA9
ICJzZXR1cHRvb2xzX3J1c3QiCiBVUFNUUkVBTV9DSEVDS19QWVBJX1BBQ0tBR0UgPSAiJHtQWVBJ
X1BBQ0tBR0V9IgotLSAKMi40Ny4xCgo=

--===============6361156901544244834==--

