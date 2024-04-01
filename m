Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A04C1CD13B4
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:31 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.1996.1711994601949391663
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=UXRmBMLJ;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=DBwKKTgp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018e9ad47f49-259ede36-db01-4c30-a85a-981d268058c3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994601;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dEmCOhYPwKVkxrhHQFahtQE7Xplffjo36ol94FEwNfo=;
	b=UXRmBMLJqCHd/Eli+CWqnqTjnBLLJx0BorNBRrljX5QOVji1JSw+6QTUYL6fFUJr
	Fa56ncvHfM8v8K4p9e7WD5m84w8m5aMiZhfXXcfYxKI0Yq7tmaRMEd6vKB8Py3oydL5
	Pju73Fjple2mkKgh7JItW40DMUV+pTIegnb15SLI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994601;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dEmCOhYPwKVkxrhHQFahtQE7Xplffjo36ol94FEwNfo=;
	b=DBwKKTgpltlhWLtcwLFjVQHOo0cIZOI2xELvP1NY+FhOHL/AMphVgw8t5c2T8lrG
	QR643DivOpZPpUMrtSMdTSxhs9tQl0fx08J6YNWaE4PtJmLS3N09oHOjVCMFmDJG9JY
	UGr0ZNFS2CHar5kgTl9TPtqrju8EXv8vpseGCHyg=
Content-Type: multipart/mixed; boundary="===============0194049284266072392=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-packaging: upgrading to 24.0 SUCCEEDED
Message-ID: <0101018e9ad47f49-259ede36-db01-4c30-a85a-981d268058c3-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:21 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197727

--===============0194049284266072392==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-packaging* to *24.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-packaging-upgrade-23.2-24.0.patch
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
From 1af394bf61b3d9e9a5e4ed15b048f158b875b7a8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 08:50:28 +0000
Subject: [PATCH] python3-packaging: upgrade 23.2 -> 24.0

---
 .../{python3-packaging_23.2.bb => python3-packaging_24.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-packaging_23.2.bb => python3-packaging_24.0.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-packaging_23.2.bb b/meta/recipes-devtools/python/python3-packaging_24.0.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-packaging_23.2.bb
rename to meta/recipes-devtools/python/python3-packaging_24.0.bb
index 2d35936615..0942eeb15e 100644
--- a/meta/recipes-devtools/python/python3-packaging_23.2.bb
+++ b/meta/recipes-devtools/python/python3-packaging_24.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/packaging"
 LICENSE = "Apache-2.0 | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
 
-SRC_URI[sha256sum] = "048fb0e9405036518eaaf48a55953c750c11e1a1b68e0dd1a9d62ed0c092cfc5"
+SRC_URI[sha256sum] = "eb82c5e3e56209074766e6885bb04b8c38a0c015d0a30036ebe7ece34c9989e9"
 
 inherit pypi python_flit_core
 
-- 
2.42.0


--===============0194049284266072392==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-packaging (sysroot):
  /usr/lib/python3.12/site-packages/packaging-23.2.dist-info moved to /usr/lib/python3.12/site-packages/packaging-24.0.dist-info
Changes to packages/x86_64-linux/python3-packaging-native (sysroot):
  /usr/lib/python3.12/site-packages/packaging-23.2.dist-info moved to /usr/lib/python3.12/site-packages/packaging-24.0.dist-info

--===============0194049284266072392==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-packaging: PKGV changed from 23.2 [default] to 24.0 [default]
packages/core2-64-poky-linux/python3-packaging: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/packaging/packaging-23.2.tar.gz;downloadfilename=packaging-23.2.tar.gz" to "https://files.pythonhosted.org/packages/source/p/packaging/packaging-24.0.tar.gz;downloadfilename=packaging-24.0.tar.gz"
packages/core2-64-poky-linux/python3-packaging: PV changed from "23.2" to "24.0"
packages/core2-64-poky-linux/python3-packaging/python3-packaging-dbg: PKGV changed from 23.2 [default] to 24.0 [default]
packages/core2-64-poky-linux/python3-packaging/python3-packaging-dbg: PV changed from "23.2" to "24.0"
packages/core2-64-poky-linux/python3-packaging/python3-packaging-dev: PKGV changed from 23.2 [default] to 24.0 [default]
packages/core2-64-poky-linux/python3-packaging/python3-packaging-dev: PV changed from "23.2" to "24.0"
packages/core2-64-poky-linux/python3-packaging/python3-packaging-doc: PKGV changed from 23.2 [default] to 24.0 [default]
packages/core2-64-poky-linux/python3-packaging/python3-packaging-doc: PV changed from "23.2" to "24.0"
packages/core2-64-poky-linux/python3-packaging/python3-packaging-locale: PKGV changed from 23.2 [default] to 24.0 [default]
packages/core2-64-poky-linux/python3-packaging/python3-packaging-locale: PV changed from "23.2" to "24.0"
packages/core2-64-poky-linux/python3-packaging/python3-packaging-src: PKGV changed from 23.2 [default] to 24.0 [default]
packages/core2-64-poky-linux/python3-packaging/python3-packaging-src: PV changed from "23.2" to "24.0"
packages/core2-64-poky-linux/python3-packaging/python3-packaging-staticdev: PKGV changed from 23.2 [default] to 24.0 [default]
packages/core2-64-poky-linux/python3-packaging/python3-packaging-staticdev: PV changed from "23.2" to "24.0"
packages/core2-64-poky-linux/python3-packaging/python3-packaging: PKGV changed from 23.2 [default] to 24.0 [default]
packages/core2-64-poky-linux/python3-packaging/python3-packaging: PKGSIZE changed from 346287 to 349385 (+1%)
packages/core2-64-poky-linux/python3-packaging/python3-packaging: PV changed from "23.2" to "24.0"
Changes to packages/core2-64-poky-linux/python3-packaging (sysroot):
  /usr/lib/python3.12/site-packages/packaging-23.2.dist-info moved to /usr/lib/python3.12/site-packages/packaging-24.0.dist-info
Changes to packages/x86_64-linux/python3-packaging-native (sysroot):
  /usr/lib/python3.12/site-packages/packaging-23.2.dist-info moved to /usr/lib/python3.12/site-packages/packaging-24.0.dist-info

--===============0194049284266072392==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-packaging-upgrade-23.2-24.0.patch"

RnJvbSAxYWYzOTRiZjYxYjNkOWU5YTVlNGVkMTViMDQ4ZjE1OGI4NzViN2E4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAwODo1MDoyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcGFja2FnaW5nOiB1cGdyYWRlIDIzLjIgLT4gMjQuMAoKLS0tCiAuLi4ve3B5dGhvbjMt
cGFja2FnaW5nXzIzLjIuYmIgPT4gcHl0aG9uMy1wYWNrYWdpbmdfMjQuMC5iYn0gICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXBhY2thZ2luZ18yMy4yLmJiID0+
IHB5dGhvbjMtcGFja2FnaW5nXzI0LjAuYmJ9ICg4MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBhY2thZ2luZ18yMy4yLmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBhY2thZ2luZ18yNC4wLmJiCnNpbWlsYXJpdHkg
aW5kZXggODMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1wYWNrYWdpbmdfMjMuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXBhY2thZ2luZ18yNC4wLmJiCmluZGV4IDJkMzU5MzY2MTUuLjA5NDJlZWIxNWUg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wYWNrYWdp
bmdfMjMuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGFj
a2FnaW5nXzI0LjAuYmIKQEAgLTMsNyArMyw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHVi
LmNvbS9weXBhL3BhY2thZ2luZyIKIExJQ0VOU0UgPSAiQXBhY2hlLTIuMCB8IEJTRC0yLUNsYXVz
ZSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWZhYWRhZWRjYTkyNTFh
OTBiMjA1YzkxNjc1NzhjZTkxIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDQ4ZmIwZTk0MDUw
MzY1MThlYWFmNDhhNTU5NTNjNzUwYzExZTFhMWI2OGUwZGQxYTlkNjJlZDBjMDkyY2ZjNSIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICJlYjgyYzVlM2U1NjIwOTA3NDc2NmU2ODg1YmIwNGI4YzM4YTBj
MDE1ZDBhMzAwMzZlYmU3ZWNlMzRjOTk4OWU5IgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX2ZsaXRf
Y29yZQogCi0tIAoyLjQyLjAKCg==

--===============0194049284266072392==--

