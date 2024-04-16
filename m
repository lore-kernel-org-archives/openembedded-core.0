Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BECFC25B7A
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:09 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.13443.1713248039939065833
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=dBduO3hu;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=iiy1yR+p;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018ee58a7123-5385a98c-929e-422e-9aa5-d39a13889231-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248039;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9MHcH6sxxU00WX0rPFjlebWuOwEOJsc9aM7Ll3eARoM=;
	b=dBduO3hu/pB7+6bK/wiBpd8jFBal2ZF+WHtN5M8s5UOqozoNvO4NREIfCsbcUpWn
	pe5rAJs7yATbRu34Oh9n2cbGErpCscw4fvtDECC5jQfzF7AfWKg0t1El7rcYj+KtvVm
	yI0vcMeu0A31oqsnZs8mKIsEzlDVgPqcw8Tn+NK8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248039;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9MHcH6sxxU00WX0rPFjlebWuOwEOJsc9aM7Ll3eARoM=;
	b=iiy1yR+pqHATisloD274ChR7TOD/v8Aj4DlOB+2DwVVgRFVAm77J3jzxkIKeDup5
	lPqBr50vAgfHMVZfpbYgzQJrsG1wTuvWgstfvCpIrGCAozrjpEPFh36ErtoKCZaQxT7
	b1RihCkZAU/KPcT7Kn7J6CL7a/ooi+30VBT0a8MM=
Content-Type: multipart/mixed; boundary="===============5638044422236350900=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-referencing: upgrading to 0.34.0 SUCCEEDED
Message-ID: <0101018ee58a7123-5385a98c-929e-422e-9aa5-d39a13889231-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:13:59 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198311

--===============5638044422236350900==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-referencing* to *0.34.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-referencing-upgrade-0.33.0-0.34.0.patch
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
From e2cc36b95edc006459ad761968dba6e277864b12 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 19:59:20 +0000
Subject: [PATCH] python3-referencing: upgrade 0.33.0 -> 0.34.0

---
 ...hon3-referencing_0.33.0.bb => python3-referencing_0.34.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-referencing_0.33.0.bb => python3-referencing_0.34.0.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-referencing_0.33.0.bb b/meta/recipes-devtools/python/python3-referencing_0.34.0.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-referencing_0.33.0.bb
rename to meta/recipes-devtools/python/python3-referencing_0.34.0.bb
index f675bbc67d..6fbd10d9cf 100644
--- a/meta/recipes-devtools/python/python3-referencing_0.33.0.bb
+++ b/meta/recipes-devtools/python/python3-referencing_0.34.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/python-jsonschema/referencing"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=93eb9740964b59e9ba30281255b044e2"
 
-SRC_URI[sha256sum] = "c775fedf74bc0f9189c2a3be1c12fd03e8c23f4d371dce795df44e06c5b412f7"
+SRC_URI[sha256sum] = "5773bd84ef41799a5a8ca72dc34590c041eb01bf9aa02632b4a973fb0181a844"
 
 inherit pypi python_hatchling
 
-- 
2.42.0


--===============5638044422236350900==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-referencing (sysroot):
  /usr/lib/python3.12/site-packages/referencing-0.33.0.dist-info moved to /usr/lib/python3.12/site-packages/referencing-0.34.0.dist-info

--===============5638044422236350900==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-referencing-upgrade-0.33.0-0.34.0.patch"

RnJvbSBlMmNjMzZiOTVlZGMwMDY0NTlhZDc2MTk2OGRiYTZlMjc3ODY0YjEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMTk6NTk6MjAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXJlZmVyZW5jaW5nOiB1cGdyYWRlIDAuMzMuMCAtPiAwLjM0LjAKCi0tLQogLi4uaG9u
My1yZWZlcmVuY2luZ18wLjMzLjAuYmIgPT4gcHl0aG9uMy1yZWZlcmVuY2luZ18wLjM0LjAuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1yZWZlcmVuY2luZ18w
LjMzLjAuYmIgPT4gcHl0aG9uMy1yZWZlcmVuY2luZ18wLjM0LjAuYmJ9ICg4MSUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJlZmVyZW5jaW5nXzAu
MzMuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1yZWZlcmVuY2lu
Z18wLjM0LjAuYmIKc2ltaWxhcml0eSBpbmRleCA4MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJlZmVyZW5jaW5nXzAuMzMuMC5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJlZmVyZW5jaW5nXzAuMzQuMC5i
YgppbmRleCBmNjc1YmJjNjdkLi42ZmJkMTBkOWNmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcmVmZXJlbmNpbmdfMC4zMy4wLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1yZWZlcmVuY2luZ18wLjM0LjAuYmIKQEAg
LTMsNyArMyw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9weXRob24tanNvbnNj
aGVtYS9yZWZlcmVuY2luZyIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vQ09QWUlORzttZDU9OTNlYjk3NDA5NjRiNTllOWJhMzAyODEyNTViMDQ0ZTIiCiAKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICJjNzc1ZmVkZjc0YmMwZjkxODljMmEzYmUxYzEyZmQwM2U4YzIz
ZjRkMzcxZGNlNzk1ZGY0NGUwNmM1YjQxMmY3IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjU3NzNi
ZDg0ZWY0MTc5OWE1YThjYTcyZGMzNDU5MGMwNDFlYjAxYmY5YWEwMjYzMmI0YTk3M2ZiMDE4MWE4
NDQiCiAKIGluaGVyaXQgcHlwaSBweXRob25faGF0Y2hsaW5nCiAKLS0gCjIuNDIuMAoK

--===============5638044422236350900==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-referencing: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/referencing/referencing-0.33.0.tar.gz;downloadfilename=referencing-0.33.0.tar.gz" to "https://files.pythonhosted.org/packages/source/r/referencing/referencing-0.34.0.tar.gz;downloadfilename=referencing-0.34.0.tar.gz"
packages/core2-64-poky-linux/python3-referencing: PV changed from "0.33.0" to "0.34.0"
packages/core2-64-poky-linux/python3-referencing: PKGV changed from 0.33.0 [default] to 0.34.0 [default]
packages/core2-64-poky-linux/python3-referencing/python3-referencing-dbg: PV changed from "0.33.0" to "0.34.0"
packages/core2-64-poky-linux/python3-referencing/python3-referencing-dbg: PKGV changed from 0.33.0 [default] to 0.34.0 [default]
packages/core2-64-poky-linux/python3-referencing/python3-referencing-dev: PV changed from "0.33.0" to "0.34.0"
packages/core2-64-poky-linux/python3-referencing/python3-referencing-dev: PKGV changed from 0.33.0 [default] to 0.34.0 [default]
packages/core2-64-poky-linux/python3-referencing/python3-referencing-doc: PV changed from "0.33.0" to "0.34.0"
packages/core2-64-poky-linux/python3-referencing/python3-referencing-doc: PKGV changed from 0.33.0 [default] to 0.34.0 [default]
packages/core2-64-poky-linux/python3-referencing/python3-referencing-locale: PV changed from "0.33.0" to "0.34.0"
packages/core2-64-poky-linux/python3-referencing/python3-referencing-locale: PKGV changed from 0.33.0 [default] to 0.34.0 [default]
packages/core2-64-poky-linux/python3-referencing/python3-referencing-src: PV changed from "0.33.0" to "0.34.0"
packages/core2-64-poky-linux/python3-referencing/python3-referencing-src: PKGV changed from 0.33.0 [default] to 0.34.0 [default]
packages/core2-64-poky-linux/python3-referencing/python3-referencing-staticdev: PV changed from "0.33.0" to "0.34.0"
packages/core2-64-poky-linux/python3-referencing/python3-referencing-staticdev: PKGV changed from 0.33.0 [default] to 0.34.0 [default]
packages/core2-64-poky-linux/python3-referencing/python3-referencing: PV changed from "0.33.0" to "0.34.0"
packages/core2-64-poky-linux/python3-referencing/python3-referencing: PKGV changed from 0.33.0 [default] to 0.34.0 [default]
packages/core2-64-poky-linux/python3-referencing/python3-referencing: PKGSIZE changed from 262664 to 263024 (+0%)
Changes to packages/core2-64-poky-linux/python3-referencing (sysroot):
  /usr/lib/python3.12/site-packages/referencing-0.33.0.dist-info moved to /usr/lib/python3.12/site-packages/referencing-0.34.0.dist-info

--===============5638044422236350900==--

