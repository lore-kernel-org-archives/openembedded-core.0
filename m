Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A10DCD13B2
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:31 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.44648.1711994602003862130
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WmDyD6RI;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=zeCBVMg9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018e9ad47f9a-b4096aaf-e1d2-40a2-a1ba-ed15953a2808-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994601;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DJGzQIvNf8ThKjU3/mdsl3Hf2hYXo5IEmXKmxJdiJsY=;
	b=WmDyD6RIdzU3784eFsw8Fa9xAgK/htu9WU4zOQi642RGaHhMzDd+FWxoSLCTjQYB
	G5X0wh/hpqwIkBoIXDSrCYlnCOlLWbmJ0KDa3N3dpyECPPDmKEGjmtvBz1L9h9wJAHx
	z3iyzxgkUgqV0XofG09JsuP4Z4m0DTLgQZEYKseY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994601;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DJGzQIvNf8ThKjU3/mdsl3Hf2hYXo5IEmXKmxJdiJsY=;
	b=zeCBVMg9DuWRLLa9hcOSGKZYl6CYymYgNkWtW1CHx/qhfattFyXo5tDv1hmGS1zH
	gz3gCnKEPSOsDpMbLb+DPCQDkDBtiEZGurd3ZuEmPwBwKu/+sbrnBvsiFDnSKcgAzgB
	G9DAnOGtRBPBz533gPe5aAZGjC/t59V6B/29qM2g=
Content-Type: multipart/mixed; boundary="===============8289448306700471712=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyelftools: upgrading to 0.31 SUCCEEDED
Message-ID: <0101018e9ad47f9a-b4096aaf-e1d2-40a2-a1ba-ed15953a2808-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:21 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197729

--===============8289448306700471712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pyelftools* to *0.31* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyelftools-upgrade-0.30-0.31.patch
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
From 398246832a7b9702fa7ade9c8ecda4c4804677f5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 09:00:16 +0000
Subject: [PATCH] python3-pyelftools: upgrade 0.30 -> 0.31

---
 .../{python3-pyelftools_0.30.bb => python3-pyelftools_0.31.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyelftools_0.30.bb => python3-pyelftools_0.31.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-pyelftools_0.30.bb b/meta/recipes-devtools/python/python3-pyelftools_0.31.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-pyelftools_0.30.bb
rename to meta/recipes-devtools/python/python3-pyelftools_0.31.bb
index 837edb7165..551fed6876 100644
--- a/meta/recipes-devtools/python/python3-pyelftools_0.30.bb
+++ b/meta/recipes-devtools/python/python3-pyelftools_0.31.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5ce2a2b07fca326bc7c146d10105ccfc"
 
-SRC_URI[sha256sum] = "2fc92b0d534f8b081f58c7c370967379123d8e00984deb53c209364efd575b40"
+SRC_URI[sha256sum] = "c774416b10310156879443b81187d182d8d9ee499660380e645918b50bc88f99"
 
 PYPI_PACKAGE = "pyelftools"
 
-- 
2.42.0


--===============8289448306700471712==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyelftools-upgrade-0.30-0.31.patch"

RnJvbSAzOTgyNDY4MzJhN2I5NzAyZmE3YWRlOWM4ZWNkYTRjNDgwNDY3N2Y1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAwOTowMDoxNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHllbGZ0b29sczogdXBncmFkZSAwLjMwIC0+IDAuMzEKCi0tLQogLi4uL3tweXRob24z
LXB5ZWxmdG9vbHNfMC4zMC5iYiA9PiBweXRob24zLXB5ZWxmdG9vbHNfMC4zMS5iYn0gIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1weWVsZnRvb2xzXzAuMzAuYmIg
PT4gcHl0aG9uMy1weWVsZnRvb2xzXzAuMzEuYmJ9ICg4MiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5ZWxmdG9vbHNfMC4zMC5iYiBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWVsZnRvb2xzXzAuMzEuYmIKc2ltaWxh
cml0eSBpbmRleCA4MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXB5ZWxmdG9vbHNfMC4zMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXB5ZWxmdG9vbHNfMC4zMS5iYgppbmRleCA4MzdlZGI3MTY1Li41NTFm
ZWQ2ODc2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
cHllbGZ0b29sc18wLjMwLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1weWVsZnRvb2xzXzAuMzEuYmIKQEAgLTQsNyArNCw3IEBAIFNFQ1RJT04gPSAiZGV2ZWwv
cHl0aG9uIgogTElDRU5TRSA9ICJQRCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VO
U0U7bWQ1PTVjZTJhMmIwN2ZjYTMyNmJjN2MxNDZkMTAxMDVjY2ZjIgogCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiMmZjOTJiMGQ1MzRmOGIwODFmNThjN2MzNzA5NjczNzkxMjNkOGUwMDk4NGRlYjUz
YzIwOTM2NGVmZDU3NWI0MCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJjNzc0NDE2YjEwMzEwMTU2
ODc5NDQzYjgxMTg3ZDE4MmQ4ZDllZTQ5OTY2MDM4MGU2NDU5MThiNTBiYzg4Zjk5IgogCiBQWVBJ
X1BBQ0tBR0UgPSAicHllbGZ0b29scyIKIAotLSAKMi40Mi4wCgo=

--===============8289448306700471712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools: FILELIST: directory renamed /usr/lib/python3.12/site-packages/pyelftools-0.30.dist-info -> /usr/lib/python3.12/site-packages/pyelftools-0.31.dist-info, added "/usr/lib/python3.12/site-packages/elftools/py.typed"
Changes to packages/core2-64-poky-linux/python3-pyelftools (sysroot):
  /usr/lib/python3.12/site-packages/pyelftools-0.30.dist-info moved to /usr/lib/python3.12/site-packages/pyelftools-0.31.dist-info
  /usr/lib/python3.12/site-packages/elftools/py.typed was added

--===============8289448306700471712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pyelftools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyelftools/pyelftools-0.30.tar.gz;downloadfilename=pyelftools-0.30.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyelftools/pyelftools-0.31.tar.gz;downloadfilename=pyelftools-0.31.tar.gz"
packages/core2-64-poky-linux/python3-pyelftools: PV changed from "0.30" to "0.31"
packages/core2-64-poky-linux/python3-pyelftools: PKGV changed from 0.30 [default] to 0.31 [default]
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools-dbg: PV changed from "0.30" to "0.31"
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools-dbg: PKGV changed from 0.30 [default] to 0.31 [default]
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools-dev: PV changed from "0.30" to "0.31"
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools-dev: PKGV changed from 0.30 [default] to 0.31 [default]
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools-doc: PV changed from "0.30" to "0.31"
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools-doc: PKGV changed from 0.30 [default] to 0.31 [default]
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools-locale: PV changed from "0.30" to "0.31"
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools-locale: PKGV changed from 0.30 [default] to 0.31 [default]
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools-src: PV changed from "0.30" to "0.31"
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools-src: PKGV changed from 0.30 [default] to 0.31 [default]
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools-staticdev: PV changed from "0.30" to "0.31"
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools-staticdev: PKGV changed from 0.30 [default] to 0.31 [default]
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools: FILELIST: directory renamed /usr/lib/python3.12/site-packages/pyelftools-0.30.dist-info -> /usr/lib/python3.12/site-packages/pyelftools-0.31.dist-info, added "/usr/lib/python3.12/site-packages/elftools/py.typed"
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools: PV changed from "0.30" to "0.31"
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools: PKGV changed from 0.30 [default] to 0.31 [default]
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools: PKGSIZE changed from 1366400 to 1388559 (+2%)
Changes to packages/core2-64-poky-linux/python3-pyelftools (sysroot):
  /usr/lib/python3.12/site-packages/pyelftools-0.30.dist-info moved to /usr/lib/python3.12/site-packages/pyelftools-0.31.dist-info
  /usr/lib/python3.12/site-packages/elftools/py.typed was added

--===============8289448306700471712==--

