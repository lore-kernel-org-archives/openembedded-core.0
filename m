Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6248AC5AE59
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:07 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.131105.1723748334719231761
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=WUyWmbGA;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=28CPf5A6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019157683998-4ede793c-6b26-4fea-9df7-eed0217afb13-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748334;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=amb2i0YhHgDBvbYua5l0sVmeiFwHQWhIWEQA5CkoeYQ=;
	b=WUyWmbGAVjgH8uTej7BTo69uIabBseONhgqTZ3W56Tf+a+WxkQfQHT6Gow36nOdM
	lSJ1epJaRi2cSUe8/ZAZRbiH/HipRZd+nAQZyq+KccywXgYrYOdZ9Y2gqnjkEExQnDD
	ZgvKZ2p9nkJkqx6AkZa9kScwj/R1M7xXbro3qBt8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748334;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=amb2i0YhHgDBvbYua5l0sVmeiFwHQWhIWEQA5CkoeYQ=;
	b=28CPf5A6chGinedUkbJJ0eKUQCz+ovYic+/YIybUd5bPldZULEBIwDpeiFrar0Tt
	Ya0wpCOVnnwzBNTvbtkOtNi/e3+IzcTt4ot42CVdPC7kWl+Gp4TO6GaAbA3h5Ul16yh
	rj4NJ8XqIuq9rwOqacE8MrnHkKNMEkYW8wSb9vHs=
Content-Type: multipart/mixed; boundary="===============7508408124853678647=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cffi: upgrading to 1.17.0 SUCCEEDED
Message-ID: <0101019157683998-4ede793c-6b26-4fea-9df7-eed0217afb13-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203388

--===============7508408124853678647==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-cffi* to *1.17.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cffi-upgrade-1.16.0-1.17.0.patch
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
From a3c95f7061ab6b0ad202df817a8f42baccbc5e09 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Aug 2024 11:19:13 +0000
Subject: [PATCH] python3-cffi: upgrade 1.16.0 -> 1.17.0

---
 .../python/{python3-cffi_1.16.0.bb => python3-cffi_1.17.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cffi_1.16.0.bb => python3-cffi_1.17.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-cffi_1.16.0.bb b/meta/recipes-devtools/python/python3-cffi_1.17.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-cffi_1.16.0.bb
rename to meta/recipes-devtools/python/python3-cffi_1.17.0.bb
index e740ef45be..28200f9b43 100644
--- a/meta/recipes-devtools/python/python3-cffi_1.16.0.bb
+++ b/meta/recipes-devtools/python/python3-cffi_1.17.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
 DEPENDS += "libffi python3-pycparser"
 
-SRC_URI[sha256sum] = "bcb3ef43e58665bbda2fb198698fcae6776483e0c4a631aa5647806c25e02cc0"
+SRC_URI[sha256sum] = "f3157624b7558b914cb039fd1af735e5e8049a87c817cc215109ad1c8779df76"
 
 SRC_URI += "file://run-ptest"
 
-- 
2.44.0


--===============7508408124853678647==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-cffi (sysroot):
  /usr/lib/python3.12/site-packages/cffi-1.16.0.dist-info moved to /usr/lib/python3.12/site-packages/cffi-1.17.0.dist-info

--===============7508408124853678647==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-cffi: PV changed from "1.16.0" to "1.17.0"
packages/core2-64-poky-linux/python3-cffi: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cffi/cffi-1.16.0.tar.gz;downloadfilename=cffi-1.16.0.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/c/cffi/cffi-1.17.0.tar.gz;downloadfilename=cffi-1.17.0.tar.gz file://run-ptest"
packages/core2-64-poky-linux/python3-cffi: PKGV changed from 1.16.0 [default] to 1.17.0 [default]
packages/core2-64-poky-linux/python3-cffi/python3-cffi-dbg: PKGSIZE changed from 514408 to 517360 (+1%)
packages/core2-64-poky-linux/python3-cffi/python3-cffi-dbg: PV changed from "1.16.0" to "1.17.0"
packages/core2-64-poky-linux/python3-cffi/python3-cffi-dbg: PKGV changed from 1.16.0 [default] to 1.17.0 [default]
packages/core2-64-poky-linux/python3-cffi/python3-cffi-dev: PV changed from "1.16.0" to "1.17.0"
packages/core2-64-poky-linux/python3-cffi/python3-cffi-dev: PKGV changed from 1.16.0 [default] to 1.17.0 [default]
packages/core2-64-poky-linux/python3-cffi/python3-cffi-doc: PV changed from "1.16.0" to "1.17.0"
packages/core2-64-poky-linux/python3-cffi/python3-cffi-doc: PKGV changed from 1.16.0 [default] to 1.17.0 [default]
packages/core2-64-poky-linux/python3-cffi/python3-cffi-locale: PV changed from "1.16.0" to "1.17.0"
packages/core2-64-poky-linux/python3-cffi/python3-cffi-locale: PKGV changed from 1.16.0 [default] to 1.17.0 [default]
packages/core2-64-poky-linux/python3-cffi/python3-cffi-ptest: PKGSIZE changed from 671574 to 676787 (+1%)
packages/core2-64-poky-linux/python3-cffi/python3-cffi-ptest: PV changed from "1.16.0" to "1.17.0"
packages/core2-64-poky-linux/python3-cffi/python3-cffi-ptest: PKGV changed from 1.16.0 [default] to 1.17.0 [default]
packages/core2-64-poky-linux/python3-cffi/python3-cffi-src: PKGSIZE changed from 485651 to 488407 (+1%)
packages/core2-64-poky-linux/python3-cffi/python3-cffi-src: PV changed from "1.16.0" to "1.17.0"
packages/core2-64-poky-linux/python3-cffi/python3-cffi-src: PKGV changed from 1.16.0 [default] to 1.17.0 [default]
packages/core2-64-poky-linux/python3-cffi/python3-cffi-staticdev: PV changed from "1.16.0" to "1.17.0"
packages/core2-64-poky-linux/python3-cffi/python3-cffi-staticdev: PKGV changed from 1.16.0 [default] to 1.17.0 [default]
packages/core2-64-poky-linux/python3-cffi/python3-cffi: PKGSIZE changed from 982501 to 985391 (+0%)
packages/core2-64-poky-linux/python3-cffi/python3-cffi: PV changed from "1.16.0" to "1.17.0"
packages/core2-64-poky-linux/python3-cffi/python3-cffi: PKGV changed from 1.16.0 [default] to 1.17.0 [default]
Changes to packages/core2-64-poky-linux/python3-cffi (sysroot):
  /usr/lib/python3.12/site-packages/cffi-1.16.0.dist-info moved to /usr/lib/python3.12/site-packages/cffi-1.17.0.dist-info

--===============7508408124853678647==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cffi-upgrade-1.16.0-1.17.0.patch"

RnJvbSBhM2M5NWY3MDYxYWI2YjBhZDIwMmRmODE3YThmNDJiYWNjYmM1ZTA5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgQXVnIDIwMjQgMTE6MTk6MTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNmZmk6IHVwZ3JhZGUgMS4xNi4wIC0+IDEuMTcuMAoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLWNmZmlfMS4xNi4wLmJiID0+IHB5dGhvbjMtY2ZmaV8xLjE3LjAuYmJ9ICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWNmZmlfMS4xNi4wLmJiID0+IHB5
dGhvbjMtY2ZmaV8xLjE3LjAuYmJ9ICg5MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWNmZmlfMS4xNi4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWNmZmlfMS4xNy4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jZmZpXzEuMTYu
MC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNmZmlf
MS4xNy4wLmJiCmluZGV4IGU3NDBlZjQ1YmUuLjI4MjAwZjliNDMgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jZmZpXzEuMTYuMC5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2ZmaV8xLjE3LjAuYmIKQEAgLTQsNyAr
NCw3IEBAIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5T
RTttZDU9NTY3N2UyZmRiZjdjZGRhNjFkNmRkMmI1N2RmNTQ3YmYiCiBERVBFTkRTICs9ICJsaWJm
ZmkgcHl0aG9uMy1weWNwYXJzZXIiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiY2IzZWY0M2U1
ODY2NWJiZGEyZmIxOTg2OThmY2FlNjc3NjQ4M2UwYzRhNjMxYWE1NjQ3ODA2YzI1ZTAyY2MwIgor
U1JDX1VSSVtzaGEyNTZzdW1dID0gImYzMTU3NjI0Yjc1NThiOTE0Y2IwMzlmZDFhZjczNWU1ZTgw
NDlhODdjODE3Y2MyMTUxMDlhZDFjODc3OWRmNzYiCiAKIFNSQ19VUkkgKz0gImZpbGU6Ly9ydW4t
cHRlc3QiCiAKLS0gCjIuNDQuMAoK

--===============7508408124853678647==--

