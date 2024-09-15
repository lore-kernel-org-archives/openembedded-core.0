Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E03BC3601C
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 14:34:21 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.115397.1726410841213133007
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 07:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=g9YSrsRh;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=mNmy8/0V;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010191f61ad9a6-0482948f-3e4b-477a-8ca0-84ec289e1142-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1726410840;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Dp2xJxe6TWxltDG4+trT8qyZ+FGwikKIiMEimCjiJJk=;
	b=g9YSrsRhs28+rx8rS6w2uC/UkSkV0+e0pbabEq+dSh13RL9NNXuU61sl+3bh2nKI
	eeUkkSoi5DhCZbCeS9TTKa1KRblY3/8lIYjq6oilhEDpDT7DvtdcQMe+KtkrEsGZnLr
	g1IbebBGfmTbAa2y+Zmng6biEB/KalyLZU3JX33Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1726410840;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Dp2xJxe6TWxltDG4+trT8qyZ+FGwikKIiMEimCjiJJk=;
	b=mNmy8/0VLW3lWGgdQvfOg/xhQjkIWlgpCy7FyDx9kzUpzgZyePf0fHBbhwT7FF3m
	GL6poEeZ7tFdnb1pcgCv4GszTGKZCUetn6LMt2nHnW9MhUyaMAzFjwKMOj5oe/aQR+v
	XsUbzV/qQeeuTuYOoeYGLlsie0halmWQ2Plg8178=
Content-Type: multipart/mixed; boundary="===============3429549117210681661=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-more-itertools: upgrading to 10.5.0 SUCCEEDED
Message-ID: <01010191f61ad9a6-0482948f-3e4b-477a-8ca0-84ec289e1142-000000@us-west-2.amazonses.com>
Date: Sun, 15 Sep 2024 14:34:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 14:34:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204539

--===============3429549117210681661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-more-itertools* to *10.5.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-more-itertools-upgrade-10.4.0-10.5.0.patch
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
From 1f3c16c06d29f78363042f516a44dfd0b4c819db Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Sep 2024 08:42:25 +0000
Subject: [PATCH] python3-more-itertools: upgrade 10.4.0 -> 10.5.0

---
 ...ore-itertools_10.4.0.bb => python3-more-itertools_10.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-more-itertools_10.4.0.bb => python3-more-itertools_10.5.0.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-more-itertools_10.4.0.bb b/meta/recipes-devtools/python/python3-more-itertools_10.5.0.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-more-itertools_10.4.0.bb
rename to meta/recipes-devtools/python/python3-more-itertools_10.5.0.bb
index 6451e3e23c..a98b412b5d 100644
--- a/meta/recipes-devtools/python/python3-more-itertools_10.4.0.bb
+++ b/meta/recipes-devtools/python/python3-more-itertools_10.5.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/erikrose/more-itertools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
 
-SRC_URI[sha256sum] = "fe0e63c4ab068eac62410ab05cccca2dc71ec44ba8ef29916a0090df061cf923"
+SRC_URI[sha256sum] = "5482bfef7849c25dc3c6dd53a6173ae4795da2a41a80faea6700d9f5846c5da6"
 
 inherit pypi python_flit_core ptest
 
-- 
2.44.0


--===============3429549117210681661==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-more-itertools-upgrade-10.4.0-10.5.0.patch"

RnJvbSAxZjNjMTZjMDZkMjlmNzgzNjMwNDJmNTE2YTQ0ZGZkMGI0YzgxOWRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgU2VwIDIwMjQgMDg6NDI6MjUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW1vcmUtaXRlcnRvb2xzOiB1cGdyYWRlIDEwLjQuMCAtPiAxMC41LjAKCi0tLQogLi4u
b3JlLWl0ZXJ0b29sc18xMC40LjAuYmIgPT4gcHl0aG9uMy1tb3JlLWl0ZXJ0b29sc18xMC41LjAu
YmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1tb3JlLWl0ZXJ0
b29sc18xMC40LjAuYmIgPT4gcHl0aG9uMy1tb3JlLWl0ZXJ0b29sc18xMC41LjAuYmJ9ICg4NyUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1vcmUt
aXRlcnRvb2xzXzEwLjQuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1tb3JlLWl0ZXJ0b29sc18xMC41LjAuYmIKc2ltaWxhcml0eSBpbmRleCA4NyUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1vcmUtaXRlcnRvb2xzXzEw
LjQuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1v
cmUtaXRlcnRvb2xzXzEwLjUuMC5iYgppbmRleCA2NDUxZTNlMjNjLi5hOThiNDEyYjVkIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbW9yZS1pdGVydG9v
bHNfMTAuNC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1t
b3JlLWl0ZXJ0b29sc18xMC41LjAuYmIKQEAgLTMsNyArMyw3IEBAIEhPTUVQQUdFID0gImh0dHBz
Oi8vZ2l0aHViLmNvbS9lcmlrcm9zZS9tb3JlLWl0ZXJ0b29scyIKIExJQ0VOU0UgPSAiTUlUIgog
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MzM5NmVhMzBmOWQyMTM4OWQ3
ODU3NzE5ODE2ZjgzYjUiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJmZTBlNjNjNGFiMDY4ZWFj
NjI0MTBhYjA1Y2NjY2EyZGM3MWVjNDRiYThlZjI5OTE2YTAwOTBkZjA2MWNmOTIzIgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjU0ODJiZmVmNzg0OWMyNWRjM2M2ZGQ1M2E2MTczYWU0Nzk1ZGEyYTQx
YTgwZmFlYTY3MDBkOWY1ODQ2YzVkYTYiCiAKIGluaGVyaXQgcHlwaSBweXRob25fZmxpdF9jb3Jl
IHB0ZXN0CiAKLS0gCjIuNDQuMAoK

--===============3429549117210681661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-more-itertools (sysroot):
  /usr/lib/python3.12/site-packages/more_itertools-10.4.0.dist-info moved to /usr/lib/python3.12/site-packages/more_itertools-10.5.0.dist-info

--===============3429549117210681661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-more-itertools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/more-itertools/more-itertools-10.4.0.tar.gz;downloadfilename=more-itertools-10.4.0.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/m/more-itertools/more-itertools-10.5.0.tar.gz;downloadfilename=more-itertools-10.5.0.tar.gz file://run-ptest"
packages/core2-64-poky-linux/python3-more-itertools: PV changed from "10.4.0" to "10.5.0"
packages/core2-64-poky-linux/python3-more-itertools: PKGV changed from 10.4.0 [default] to 10.5.0 [default]
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-dbg: PV changed from "10.4.0" to "10.5.0"
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-dbg: PKGV changed from 10.4.0 [default] to 10.5.0 [default]
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-dev: PV changed from "10.4.0" to "10.5.0"
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-dev: PKGV changed from 10.4.0 [default] to 10.5.0 [default]
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-doc: PV changed from "10.4.0" to "10.5.0"
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-doc: PKGV changed from 10.4.0 [default] to 10.5.0 [default]
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-locale: PV changed from "10.4.0" to "10.5.0"
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-locale: PKGV changed from 10.4.0 [default] to 10.5.0 [default]
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-ptest: PV changed from "10.4.0" to "10.5.0"
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-ptest: PKGV changed from 10.4.0 [default] to 10.5.0 [default]
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-ptest: PKGSIZE changed from 241172 to 241737 (+0%)
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-src: PV changed from "10.4.0" to "10.5.0"
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-src: PKGV changed from 10.4.0 [default] to 10.5.0 [default]
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-staticdev: PV changed from "10.4.0" to "10.5.0"
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools-staticdev: PKGV changed from 10.4.0 [default] to 10.5.0 [default]
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools: PV changed from "10.4.0" to "10.5.0"
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools: PKGV changed from 10.4.0 [default] to 10.5.0 [default]
packages/core2-64-poky-linux/python3-more-itertools/python3-more-itertools: PKGSIZE changed from 468352 to 468429 (+0%)
Changes to packages/core2-64-poky-linux/python3-more-itertools (sysroot):
  /usr/lib/python3.12/site-packages/more_itertools-10.4.0.dist-info moved to /usr/lib/python3.12/site-packages/more_itertools-10.5.0.dist-info

--===============3429549117210681661==--

