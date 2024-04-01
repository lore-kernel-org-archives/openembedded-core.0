Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7572CD13B3
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:31 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.44649.1711994602160981819
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RJd9Iqkr;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=0CSVP3Cl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018e9ad47eb1-dae790c3-ddab-4abc-b325-8b9b922d59a4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994601;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mJhhtEnyypIDSDMehVHlXi1suLs+5Riujphfbf3KXP0=;
	b=RJd9IqkrAV1pkWdklfJo8bQaS09cJp+3YLz6BVGHinZS/lZcRb+REANDFIqUDLzW
	K/A84ktD57wiGyFQJXTRJwpLW7M3AU//IlF1yfv1XZcv1nxS+fYfBhQ+M0B78puthX0
	lLfBQmGn+ckerOzmwdgi7nqUiK8Q8rZnjK+bpVf8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994601;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mJhhtEnyypIDSDMehVHlXi1suLs+5Riujphfbf3KXP0=;
	b=0CSVP3Cl26hbGq+NN5a4wPsZ4OEQgJF4eFfMiFHMdeXuhHDtmB6UVCO83TRF5VnP
	L/7E+Yldb9tAwnBIj5i+AVmvs3Zn+5WB+ehmMD6WtvQPO6LhAmeUdnxmfAqL793BoTe
	87y2V1jN1UCpLxQXrhQQ3vVy/Q0JThfvXv08hfMA=
Content-Type: multipart/mixed; boundary="===============3865906943378324478=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-libarchive-c: upgrading to 5.1 SUCCEEDED
Message-ID: <0101018e9ad47eb1-dae790c3-ddab-4abc-b325-8b9b922d59a4-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:21 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197726

--===============3865906943378324478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-libarchive-c* to *5.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-libarchive-c-upgrade-5.0-5.1.patch
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
From 8403756f04ec7e90647f34c22130dc45de95332f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 08:09:20 +0000
Subject: [PATCH] python3-libarchive-c: upgrade 5.0 -> 5.1

---
 ...{python3-libarchive-c_5.0.bb => python3-libarchive-c_5.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-libarchive-c_5.0.bb => python3-libarchive-c_5.1.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-libarchive-c_5.0.bb b/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-libarchive-c_5.0.bb
rename to meta/recipes-devtools/python/python3-libarchive-c_5.1.bb
index 6ac86fc7a1..4e318e52f4 100644
--- a/meta/recipes-devtools/python/python3-libarchive-c_5.0.bb
+++ b/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb
@@ -9,7 +9,7 @@ PYPI_PACKAGE = "libarchive-c"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "d673f56673d87ec740d1a328fa205cafad1d60f5daca4685594deb039d32b159"
+SRC_URI[sha256sum] = "7bcce24ea6c0fa3bc62468476c6d2f6264156db2f04878a372027c10615a2721"
 
 RDEPENDS:${PN} += "\
   libarchive \
-- 
2.42.0


--===============3865906943378324478==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-libarchive-c-upgrade-5.0-5.1.patch"

RnJvbSA4NDAzNzU2ZjA0ZWM3ZTkwNjQ3ZjM0YzIyMTMwZGM0NWRlOTUzMzJmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAwODowOToyMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbGliYXJjaGl2ZS1jOiB1cGdyYWRlIDUuMCAtPiA1LjEKCi0tLQogLi4ue3B5dGhvbjMt
bGliYXJjaGl2ZS1jXzUuMC5iYiA9PiBweXRob24zLWxpYmFyY2hpdmUtY181LjEuYmJ9IHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1saWJhcmNoaXZlLWNfNS4wLmJi
ID0+IHB5dGhvbjMtbGliYXJjaGl2ZS1jXzUuMS5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbGliYXJjaGl2ZS1jXzUuMC5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1saWJhcmNoaXZlLWNfNS4xLmJiCnNp
bWlsYXJpdHkgaW5kZXggODUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1saWJhcmNoaXZlLWNfNS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtbGliYXJjaGl2ZS1jXzUuMS5iYgppbmRleCA2YWM4NmZjN2Ex
Li40ZTMxOGU1MmY0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtbGliYXJjaGl2ZS1jXzUuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtbGliYXJjaGl2ZS1jXzUuMS5iYgpAQCAtOSw3ICs5LDcgQEAgUFlQSV9QQUNL
QUdFID0gImxpYmFyY2hpdmUtYyIKIAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICJkNjczZjU2NjczZDg3ZWM3NDBkMWEzMjhmYTIwNWNhZmFkMWQ2MGY1
ZGFjYTQ2ODU1OTRkZWIwMzlkMzJiMTU5IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjdiY2NlMjRl
YTZjMGZhM2JjNjI0Njg0NzZjNmQyZjYyNjQxNTZkYjJmMDQ4NzhhMzcyMDI3YzEwNjE1YTI3MjEi
CiAKIFJERVBFTkRTOiR7UE59ICs9ICJcCiAgIGxpYmFyY2hpdmUgXAotLSAKMi40Mi4wCgo=

--===============3865906943378324478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-libarchive-c (sysroot):
  /usr/lib/python3.12/site-packages/libarchive_c-5.0.dist-info moved to /usr/lib/python3.12/site-packages/libarchive_c-5.1.dist-info

--===============3865906943378324478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-libarchive-c: SRC_URI changed from "https://files.pythonhosted.org/packages/source/l/libarchive-c/libarchive-c-5.0.tar.gz;downloadfilename=libarchive-c-5.0.tar.gz" to "https://files.pythonhosted.org/packages/source/l/libarchive-c/libarchive-c-5.1.tar.gz;downloadfilename=libarchive-c-5.1.tar.gz"
packages/core2-64-poky-linux/python3-libarchive-c: PKGV changed from 5.0 [default] to 5.1 [default]
packages/core2-64-poky-linux/python3-libarchive-c: PV changed from "5.0" to "5.1"
packages/core2-64-poky-linux/python3-libarchive-c/python3-libarchive-c-dbg: PKGV changed from 5.0 [default] to 5.1 [default]
packages/core2-64-poky-linux/python3-libarchive-c/python3-libarchive-c-dbg: PV changed from "5.0" to "5.1"
packages/core2-64-poky-linux/python3-libarchive-c/python3-libarchive-c-dev: PKGV changed from 5.0 [default] to 5.1 [default]
packages/core2-64-poky-linux/python3-libarchive-c/python3-libarchive-c-dev: PV changed from "5.0" to "5.1"
packages/core2-64-poky-linux/python3-libarchive-c/python3-libarchive-c-doc: PKGV changed from 5.0 [default] to 5.1 [default]
packages/core2-64-poky-linux/python3-libarchive-c/python3-libarchive-c-doc: PV changed from "5.0" to "5.1"
packages/core2-64-poky-linux/python3-libarchive-c/python3-libarchive-c-locale: PKGV changed from 5.0 [default] to 5.1 [default]
packages/core2-64-poky-linux/python3-libarchive-c/python3-libarchive-c-locale: PV changed from "5.0" to "5.1"
packages/core2-64-poky-linux/python3-libarchive-c/python3-libarchive-c-src: PKGV changed from 5.0 [default] to 5.1 [default]
packages/core2-64-poky-linux/python3-libarchive-c/python3-libarchive-c-src: PV changed from "5.0" to "5.1"
packages/core2-64-poky-linux/python3-libarchive-c/python3-libarchive-c-staticdev: PKGV changed from 5.0 [default] to 5.1 [default]
packages/core2-64-poky-linux/python3-libarchive-c/python3-libarchive-c-staticdev: PV changed from "5.0" to "5.1"
packages/core2-64-poky-linux/python3-libarchive-c/python3-libarchive-c: PKGV changed from 5.0 [default] to 5.1 [default]
packages/core2-64-poky-linux/python3-libarchive-c/python3-libarchive-c: PKGSIZE changed from 118730 to 118715 (-0%)
packages/core2-64-poky-linux/python3-libarchive-c/python3-libarchive-c: PV changed from "5.0" to "5.1"
Changes to packages/core2-64-poky-linux/python3-libarchive-c (sysroot):
  /usr/lib/python3.12/site-packages/libarchive_c-5.0.dist-info moved to /usr/lib/python3.12/site-packages/libarchive_c-5.1.dist-info

--===============3865906943378324478==--

