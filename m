Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE7BC54E7E
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:00:13 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.1269.1710522011395964736
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:00:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=SOIiY82L;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=lV8mYSON;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018e430e8c80-e04e84f0-0b8c-44df-95f8-6129dfaa6dfe-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710522011;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Od09SP3538XfKVkGecnzVJiY61PlJ3BFO1VXywpusD4=;
	b=SOIiY82LJykluPI735AC61F18w0y06CHU3WuJizZohhrXI2cdthVTYiWRuguDlOE
	Pk6lFdaHNqiXJw52EbmX7tYvMAqNBPa3suQiEWVWyaWjrw6PyalKPiHAuxk22qt+8Yp
	4PCBO6hsPqcdaQKCzJmPwbxbqnBl51/Dtsx21YfM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1710522011;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Od09SP3538XfKVkGecnzVJiY61PlJ3BFO1VXywpusD4=;
	b=lV8mYSONogoCiahn9EYGrtIamIF6UeZ2WI/bnBlhzlaIvbG9PCdivPbXspUOQ5rY
	+nbZRLVF6ci6lbDVhqVkKFFr987rjHQ5WUS4t3SkyvaWlQFTev3t6RvNxrfCehUQzaO
	zPt7DQKDOIEk4pB6Lz0XtHXCnfF0irzkeM1f106Q=
Content-Type: multipart/mixed; boundary="===============1943922743246047832=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mmc-utils: upgrading to
 e1281d4de9166b7254ba30bb58f9191fc2c9e7fb SUCCEEDED
Message-ID: <0101018e430e8c80-e04e84f0-0b8c-44df-95f8-6129dfaa6dfe-000000@us-west-2.amazonses.com>
Date: Fri, 15 Mar 2024 17:00:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:00:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197162

--===============1943922743246047832==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mmc-utils* to *e1281d4de9166b7254ba30bb58f9191fc2c9e7fb* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mmc-utils-upgrade-to-latest-revision.patch
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
From 1ecb259f86122a2c56f749dd5f44b83b6a130191 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Mar 2024 07:42:03 +0000
Subject: [PATCH] mmc-utils: upgrade to latest revision

---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index a7e4d369ff..d01da00b57 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "b5ca140312d279ad2f22068fd72a6230eea13436"
+SRCREV = "e1281d4de9166b7254ba30bb58f9191fc2c9e7fb"
 
 PV = "0.1+git"
 
-- 
2.42.0


--===============1943922743246047832==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/mmc-utils/mmc-utils-dbg: PKGV changed from 0.1+git0+b5ca140312 to 0.1+git0+e1281d4de9
packages/core2-64-poky-linux/mmc-utils/mmc-utils-dbg: PKGSIZE changed from 291552 to 291520 (-0%)
packages/core2-64-poky-linux/mmc-utils/mmc-utils-dev: PKGV changed from 0.1+git0+b5ca140312 to 0.1+git0+e1281d4de9
packages/core2-64-poky-linux/mmc-utils/mmc-utils-doc: PKGV changed from 0.1+git0+b5ca140312 to 0.1+git0+e1281d4de9
packages/core2-64-poky-linux/mmc-utils/mmc-utils-locale: PKGV changed from 0.1+git0+b5ca140312 to 0.1+git0+e1281d4de9
packages/core2-64-poky-linux/mmc-utils/mmc-utils-src: PKGV changed from 0.1+git0+b5ca140312 to 0.1+git0+e1281d4de9
packages/core2-64-poky-linux/mmc-utils/mmc-utils-src: PKGSIZE changed from 213396 to 213510 (+0%)
packages/core2-64-poky-linux/mmc-utils/mmc-utils-staticdev: PKGV changed from 0.1+git0+b5ca140312 to 0.1+git0+e1281d4de9
packages/core2-64-poky-linux/mmc-utils/mmc-utils: PKGV changed from 0.1+git0+b5ca140312 to 0.1+git0+e1281d4de9

--===============1943922743246047832==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/mmc-utils/mmc-utils-dbg: PKGV changed from 0.1+git0+b5ca140312 to 0.1+git0+e1281d4de9
packages/core2-64-poky-linux/mmc-utils/mmc-utils-dev: PKGV changed from 0.1+git0+b5ca140312 to 0.1+git0+e1281d4de9
packages/core2-64-poky-linux/mmc-utils/mmc-utils-doc: PKGV changed from 0.1+git0+b5ca140312 to 0.1+git0+e1281d4de9
packages/core2-64-poky-linux/mmc-utils/mmc-utils-locale: PKGV changed from 0.1+git0+b5ca140312 to 0.1+git0+e1281d4de9
packages/core2-64-poky-linux/mmc-utils/mmc-utils-src: PKGV changed from 0.1+git0+b5ca140312 to 0.1+git0+e1281d4de9
packages/core2-64-poky-linux/mmc-utils/mmc-utils-staticdev: PKGV changed from 0.1+git0+b5ca140312 to 0.1+git0+e1281d4de9
packages/core2-64-poky-linux/mmc-utils/mmc-utils: PKGV changed from 0.1+git0+b5ca140312 to 0.1+git0+e1281d4de9

--===============1943922743246047832==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mmc-utils-upgrade-to-latest-revision.patch"

RnJvbSAxZWNiMjU5Zjg2MTIyYTJjNTZmNzQ5ZGQ1ZjQ0YjgzYjZhMTMwMTkxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWFyIDIwMjQgMDc6NDI6MDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
bWMtdXRpbHM6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9tbWMvbW1jLXV0aWxzX2dpdC5iYiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9tbWMvbW1jLXV0aWxzX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tbWMvbW1j
LXV0aWxzX2dpdC5iYgppbmRleCBhN2U0ZDM2OWZmLi5kMDFkYTAwYjU3IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvbW1jL21tYy11dGlsc19naXQuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL21tYy9tbWMtdXRpbHNfZ2l0LmJiCkBAIC01LDcgKzUsNyBAQCBMSUNFTlNF
ID0gIkdQTC0yLjAtb25seSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL21tYy5jO2JlZ2lu
bGluZT0xO2VuZGxpbmU9MjA7bWQ1PWZhZTMyNzkyZTIwZjRkMjdhZGUxYzVhNzYyZDE2YjdkIgog
CiBTUkNCUkFOQ0ggPz0gIm1hc3RlciIKLVNSQ1JFViA9ICJiNWNhMTQwMzEyZDI3OWFkMmYyMjA2
OGZkNzJhNjIzMGVlYTEzNDM2IgorU1JDUkVWID0gImUxMjgxZDRkZTkxNjZiNzI1NGJhMzBiYjU4
ZjkxOTFmYzJjOWU3ZmIiCiAKIFBWID0gIjAuMStnaXQiCiAKLS0gCjIuNDIuMAoK

--===============1943922743246047832==--

