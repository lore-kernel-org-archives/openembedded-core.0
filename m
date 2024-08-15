Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 347CDC5AD49
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:07 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.131420.1723748334035722244
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=DbK64b5z;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=z0A/jG6l;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019157683aab-47dd5629-49c4-47cd-9955-201954231e52-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748334;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YHMvO4YArOdsBvtQFMPgrV2ccSkeASoN6MB/LAxenJw=;
	b=DbK64b5z43b3g/dCvzxTE+rILEsNoXK/C34XT+8QYLJpdgZIMUxT0HaTTs8PMZ6T
	Q225NDDbwxWYMfPe9vYg0H/RSW2yHCH1fQtbTB36DxqBSxmrNFqYvAQ42TMlXc4hBs0
	TI+NXppnyzJy0p019UP8CDsWtJiSdyC9CgjCpgOE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748334;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YHMvO4YArOdsBvtQFMPgrV2ccSkeASoN6MB/LAxenJw=;
	b=z0A/jG6lVXbzKfKRn9kkdSe1Ww5Mp/mdM6j/uS81yLjxhd+qpu1FvtPOnv5JCpCA
	vzGW+tfKKKvDeys2k/ScN4UxCV0gi4uRunzrqXrUOXGRaI6fESfbr6e2tXu9sU08n8v
	JM4EjsuKrQav/d5sOwe+sh7d38vs3JcIp8niQAyo=
Content-Type: multipart/mixed; boundary="===============3698973927360608747=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-more-itertools: upgrading to 10.4.0 SUCCEEDED
Message-ID: <0101019157683aab-47dd5629-49c4-47cd-9955-201954231e52-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203370

--===============3698973927360608747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-more-itertools* to *10.4.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-more-itertools-upgrade-10.3.0-10.4.0.patch
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
From 15a1c4b4e81556848d6d3f5b48d2bc008bad6e99 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Aug 2024 11:47:57 +0000
Subject: [PATCH] python3-more-itertools: upgrade 10.3.0 -> 10.4.0

---
 ...ore-itertools_10.3.0.bb => python3-more-itertools_10.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-more-itertools_10.3.0.bb => python3-more-itertools_10.4.0.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-more-itertools_10.3.0.bb b/meta/recipes-devtools/python/python3-more-itertools_10.4.0.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-more-itertools_10.3.0.bb
rename to meta/recipes-devtools/python/python3-more-itertools_10.4.0.bb
index c2c9e89a64..6451e3e23c 100644
--- a/meta/recipes-devtools/python/python3-more-itertools_10.3.0.bb
+++ b/meta/recipes-devtools/python/python3-more-itertools_10.4.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/erikrose/more-itertools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
 
-SRC_URI[sha256sum] = "e5d93ef411224fbcef366a6e8ddc4c5781bc6359d43412a65dd5964e46111463"
+SRC_URI[sha256sum] = "fe0e63c4ab068eac62410ab05cccca2dc71ec44ba8ef29916a0090df061cf923"
 
 inherit pypi python_flit_core ptest
 
-- 
2.44.0


--===============3698973927360608747==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-more-itertools-upgrade-10.3.0-10.4.0.patch"

RnJvbSAxNWExYzRiNGU4MTU1Njg0OGQ2ZDNmNWI0OGQyYmMwMDhiYWQ2ZTk5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgQXVnIDIwMjQgMTE6NDc6NTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW1vcmUtaXRlcnRvb2xzOiB1cGdyYWRlIDEwLjMuMCAtPiAxMC40LjAKCi0tLQogLi4u
b3JlLWl0ZXJ0b29sc18xMC4zLjAuYmIgPT4gcHl0aG9uMy1tb3JlLWl0ZXJ0b29sc18xMC40LjAu
YmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1tb3JlLWl0ZXJ0
b29sc18xMC4zLjAuYmIgPT4gcHl0aG9uMy1tb3JlLWl0ZXJ0b29sc18xMC40LjAuYmJ9ICg4NyUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1vcmUt
aXRlcnRvb2xzXzEwLjMuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1tb3JlLWl0ZXJ0b29sc18xMC40LjAuYmIKc2ltaWxhcml0eSBpbmRleCA4NyUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1vcmUtaXRlcnRvb2xzXzEw
LjMuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1v
cmUtaXRlcnRvb2xzXzEwLjQuMC5iYgppbmRleCBjMmM5ZTg5YTY0Li42NDUxZTNlMjNjIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbW9yZS1pdGVydG9v
bHNfMTAuMy4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1t
b3JlLWl0ZXJ0b29sc18xMC40LjAuYmIKQEAgLTMsNyArMyw3IEBAIEhPTUVQQUdFID0gImh0dHBz
Oi8vZ2l0aHViLmNvbS9lcmlrcm9zZS9tb3JlLWl0ZXJ0b29scyIKIExJQ0VOU0UgPSAiTUlUIgog
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MzM5NmVhMzBmOWQyMTM4OWQ3
ODU3NzE5ODE2ZjgzYjUiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJlNWQ5M2VmNDExMjI0ZmJj
ZWYzNjZhNmU4ZGRjNGM1NzgxYmM2MzU5ZDQzNDEyYTY1ZGQ1OTY0ZTQ2MTExNDYzIgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gImZlMGU2M2M0YWIwNjhlYWM2MjQxMGFiMDVjY2NjYTJkYzcxZWM0NGJh
OGVmMjk5MTZhMDA5MGRmMDYxY2Y5MjMiCiAKIGluaGVyaXQgcHlwaSBweXRob25fZmxpdF9jb3Jl
IHB0ZXN0CiAKLS0gCjIuNDQuMAoK

--===============3698973927360608747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-more-itertools (sysroot):
  /usr/lib/python3.12/site-packages/more_itertools-10.3.0.dist-info moved to /usr/lib/python3.12/site-packages/more_itertools-10.4.0.dist-info

--===============3698973927360608747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-more-itertools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/more-itertools/more-itertools-10.3.0.tar.gz;downloadfilename=more-itertools-10.3.0.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/m/more-itertools/more-itertools-10.4.0.tar.gz;downloadfilename=more-itertools-10.4.0.tar.gz file://run-ptest"
packages/core2-64-poky-linux/python3-more-itertools: PV changed from "10.3.0" to "10.4.0"
packages/core2-64-poky-linux/python3-more-itertools: PKGV changed from 10.3.0 [default] to 10.4.0 [default]
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-dbg: PV changed from "10.3.0" to "10.4.0"
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-dbg: PKGV changed from 10.3.0 [default] to 10.4.0 [default]
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-dev: PV changed from "10.3.0" to "10.4.0"
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-dev: PKGV changed from 10.3.0 [default] to 10.4.0 [default]
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-doc: PV changed from "10.3.0" to "10.4.0"
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-doc: PKGV changed from 10.3.0 [default] to 10.4.0 [default]
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-locale: PV changed from "10.3.0" to "10.4.0"
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-locale: PKGV changed from 10.3.0 [default] to 10.4.0 [default]
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-ptest: PV changed from "10.3.0" to "10.4.0"
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-ptest: PKGV changed from 10.3.0 [default] to 10.4.0 [default]
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-ptest: PKGSIZE changed from 237461 to 241172 (+2%)
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-src: PV changed from "10.3.0" to "10.4.0"
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-src: PKGV changed from 10.3.0 [default] to 10.4.0 [default]
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-staticdev: PV changed from "10.3.0" to "10.4.0"
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-staticdev: PKGV changed from 10.3.0 [default] to 10.4.0 [default]
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools: PV changed from "10.3.0" to "10.4.0"
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools: PKGV changed from 10.3.0 [default] to 10.4.0 [default]
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools: PKGSIZE changed from 452335 to 468825 (+4%)
Changes to packages/core2-64-poky-linux/python3-more-itertools (sysroot):
  /usr/lib/python3.12/site-packages/more_itertools-10.3.0.dist-info moved to /usr/lib/python3.12/site-packages/more_itertools-10.4.0.dist-info

--===============3698973927360608747==--

