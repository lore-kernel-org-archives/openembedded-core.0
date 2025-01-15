Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6969BC02192
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 10:26:08 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.17794.1736936764051874500
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 02:26:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=N7C89N9H;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=VJ3aGYkV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010194697fbf8d-10cbe280-125f-4849-82b4-8f2e76e5c65a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1736936767;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=txebpMh+5Xi/J0qCeYbCJkUEsV2ww+vvQdVhYtIjELU=;
	b=N7C89N9HgtmG/sAiAjshUaloAEjDtwAYn98aezoetBhVuuHmqwADiPBORm6i1WMx
	kLbJFqBV1UWJ+P0+hH11O5BrTnyABCEUe+hRjmuN0e6wqPe6nZz3DqpECIP9vUmXpz1
	jpvdIxpNlQVTdlJNlSOPstMpyqrok4ivGksbPCeU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1736936767;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=txebpMh+5Xi/J0qCeYbCJkUEsV2ww+vvQdVhYtIjELU=;
	b=VJ3aGYkV7Qt0OzYsimFlEwiy+KDcNaOqsR1DGtiYvkhMfu9dlLz90qUp1RwvtOaJ
	SGTabE/unLA3kvsdYO7bsIPWlspnAOsAzFpljyB665E1z6/eYSRmg7ErjpZlkmu+bqY
	2uVL7OJMr0mK9kGUOA8asfW3sESByz31ng6uXVjE=
Content-Type: multipart/mixed; boundary="===============1625243803069442353=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-more-itertools: upgrading to 10.6.0 SUCCEEDED
Message-ID: <01010194697fbf8d-10cbe280-125f-4849-82b4-8f2e76e5c65a-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jan 2025 10:26:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 10:26:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209837

--===============1625243803069442353==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-more-itertools* to *10.6.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-more-itertools-upgrade-10.5.0-10.6.0.patch
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
From 21fbd4b18ef190438b6da1f290bf9b2bbb50df51 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jan 2025 07:33:25 +0000
Subject: [PATCH] python3-more-itertools: upgrade 10.5.0 -> 10.6.0

---
 ...ore-itertools_10.5.0.bb => python3-more-itertools_10.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-more-itertools_10.5.0.bb => python3-more-itertools_10.6.0.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-more-itertools_10.5.0.bb b/meta/recipes-devtools/python/python3-more-itertools_10.6.0.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-more-itertools_10.5.0.bb
rename to meta/recipes-devtools/python/python3-more-itertools_10.6.0.bb
index eda9bf1004..5447a7af8e 100644
--- a/meta/recipes-devtools/python/python3-more-itertools_10.5.0.bb
+++ b/meta/recipes-devtools/python/python3-more-itertools_10.6.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/erikrose/more-itertools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
 
-SRC_URI[sha256sum] = "5482bfef7849c25dc3c6dd53a6173ae4795da2a41a80faea6700d9f5846c5da6"
+SRC_URI[sha256sum] = "2cd7fad1009c31cc9fb6a035108509e6547547a7a738374f10bd49a09eb3ee3b"
 
 inherit pypi python_flit_core ptest-python-pytest
 
-- 
2.44.1


--===============1625243803069442353==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-more-itertools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/more-itertools/more-itertools-10.5.0.tar.gz;downloadfilename=more-itertools-10.5.0.tar.gz" to "https://files.pythonhosted.org/packages/source/m/more-itertools/more-itertools-10.6.0.tar.gz;downloadfilename=more-itertools-10.6.0.tar.gz"
packages/core2-64-poky-linux/python3-more-itertools: PKGV changed from 10.5.0 [default] to 10.6.0 [default]
packages/core2-64-poky-linux/python3-more-itertools: PV changed from "10.5.0" to "10.6.0"
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-dbg: PKGV changed from 10.5.0 [default] to 10.6.0 [default]
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-dbg: PV changed from "10.5.0" to "10.6.0"
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-dev: PKGV changed from 10.5.0 [default] to 10.6.0 [default]
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-dev: PV changed from "10.5.0" to "10.6.0"
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-doc: PKGV changed from 10.5.0 [default] to 10.6.0 [default]
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-doc: PV changed from "10.5.0" to "10.6.0"
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-locale: PKGV changed from 10.5.0 [default] to 10.6.0 [default]
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-locale: PV changed from "10.5.0" to "10.6.0"
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-ptest: PKGV changed from 10.5.0 [default] to 10.6.0 [default]
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-ptest: PV changed from "10.5.0" to "10.6.0"
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-ptest: PKGSIZE changed from 241736 to 246980 (+2%)
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-src: PKGV changed from 10.5.0 [default] to 10.6.0 [default]
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-src: PV changed from "10.5.0" to "10.6.0"
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-staticdev: PKGV changed from 10.5.0 [default] to 10.6.0 [default]
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-staticdev: PV changed from "10.5.0" to "10.6.0"
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools: PKGV changed from 10.5.0 [default] to 10.6.0 [default]
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools: PV changed from "10.5.0" to "10.6.0"
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools: PKGSIZE changed from 460232 to 472003 (+3%)
Changes to packages/core2-64-poky-linux/python3-more-itertools (sysroot):
  /usr/lib/python3.13/site-packages/more_itertools-10.5.0.dist-info moved to /usr/lib/python3.13/site-packages/more_itertools-10.6.0.dist-info

--===============1625243803069442353==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-more-itertools (sysroot):
  /usr/lib/python3.13/site-packages/more_itertools-10.5.0.dist-info moved to /usr/lib/python3.13/site-packages/more_itertools-10.6.0.dist-info

--===============1625243803069442353==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-more-itertools-upgrade-10.5.0-10.6.0.patch"

RnJvbSAyMWZiZDRiMThlZjE5MDQzOGI2ZGExZjI5MGJmOWIyYmJiNTBkZjUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgSmFuIDIwMjUgMDc6MzM6MjUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW1vcmUtaXRlcnRvb2xzOiB1cGdyYWRlIDEwLjUuMCAtPiAxMC42LjAKCi0tLQogLi4u
b3JlLWl0ZXJ0b29sc18xMC41LjAuYmIgPT4gcHl0aG9uMy1tb3JlLWl0ZXJ0b29sc18xMC42LjAu
YmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1tb3JlLWl0ZXJ0
b29sc18xMC41LjAuYmIgPT4gcHl0aG9uMy1tb3JlLWl0ZXJ0b29sc18xMC42LjAuYmJ9ICg4MiUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1vcmUt
aXRlcnRvb2xzXzEwLjUuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1tb3JlLWl0ZXJ0b29sc18xMC42LjAuYmIKc2ltaWxhcml0eSBpbmRleCA4MiUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1vcmUtaXRlcnRvb2xzXzEw
LjUuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1v
cmUtaXRlcnRvb2xzXzEwLjYuMC5iYgppbmRleCBlZGE5YmYxMDA0Li41NDQ3YTdhZjhlIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbW9yZS1pdGVydG9v
bHNfMTAuNS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1t
b3JlLWl0ZXJ0b29sc18xMC42LjAuYmIKQEAgLTMsNyArMyw3IEBAIEhPTUVQQUdFID0gImh0dHBz
Oi8vZ2l0aHViLmNvbS9lcmlrcm9zZS9tb3JlLWl0ZXJ0b29scyIKIExJQ0VOU0UgPSAiTUlUIgog
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MzM5NmVhMzBmOWQyMTM4OWQ3
ODU3NzE5ODE2ZjgzYjUiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1NDgyYmZlZjc4NDljMjVk
YzNjNmRkNTNhNjE3M2FlNDc5NWRhMmE0MWE4MGZhZWE2NzAwZDlmNTg0NmM1ZGE2IgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjJjZDdmYWQxMDA5YzMxY2M5ZmI2YTAzNTEwODUwOWU2NTQ3NTQ3YTdh
NzM4Mzc0ZjEwYmQ0OWEwOWViM2VlM2IiCiAKIGluaGVyaXQgcHlwaSBweXRob25fZmxpdF9jb3Jl
IHB0ZXN0LXB5dGhvbi1weXRlc3QKIAotLSAKMi40NC4xCgo=

--===============1625243803069442353==--

