Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C850CC3062F
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:12 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.174026.1692224343416766716
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HZyLfAOl;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Q1GzlfSO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018a006e4feb-9ba96a8c-d47f-4231-9379-d26cfcf7cb19-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CUybjGkMQEzOIIm7S4uvGpBQDlbWRBw5WrnQiwL/2ok=;
	b=HZyLfAOl4noNOlMhYN4ptjAVKzsh5oiRxbEpWoUBWJYsRyBwkxLAa0iwqi6atPZr
	cqOkJv0m+48qwkWikeKsMXTVJRAFgxTUWHU348bcP3xviSxHUC8m6XEOM196pAcDnl1
	vPPlpnUoJnzZMglzh6R0U0BlxWWUTzAm+MoWS2Fs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CUybjGkMQEzOIIm7S4uvGpBQDlbWRBw5WrnQiwL/2ok=;
	b=Q1GzlfSOHH74u/mOKcWuuE4+xkbhWttq5S9JycMQyjqBxFHvvvyXk3tF0zx6oAzc
	JFk32bQUeF0E1V7jNQVpHEXdnf1KXoPj+lpkD45za/1IGFvzNO6E3RDXszwXXSSzdGC
	5F0VaMkT0tba71N3ae3kfa0z3sHivGdRdA9Eof/o=
Content-Type: multipart/mixed; boundary="===============8758600501709571082=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-more-itertools: upgrading to 10.1.0 SUCCEEDED
Message-ID: <0101018a006e4feb-9ba96a8c-d47f-4231-9379-d26cfcf7cb19-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:04 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186187

--===============8758600501709571082==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-more-itertools* to *10.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-more-itertools-upgrade-10.0.0-10.1.0.patch
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
From 5698f1f0add4b1e496df9d40bd4f1c1503fb6200 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 16 Aug 2023 05:40:10 +0000
Subject: [PATCH] python3-more-itertools: upgrade 10.0.0 -> 10.1.0

---
 ...ore-itertools_10.0.0.bb => python3-more-itertools_10.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-more-itertools_10.0.0.bb => python3-more-itertools_10.1.0.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-more-itertools_10.0.0.bb b/meta/recipes-devtools/python/python3-more-itertools_10.1.0.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-more-itertools_10.0.0.bb
rename to meta/recipes-devtools/python/python3-more-itertools_10.1.0.bb
index e07d4b7860..be2a73c369 100644
--- a/meta/recipes-devtools/python/python3-more-itertools_10.0.0.bb
+++ b/meta/recipes-devtools/python/python3-more-itertools_10.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/erikrose/more-itertools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
 
-SRC_URI[sha256sum] = "cd65437d7c4b615ab81c0640c0480bc29a550ea032891977681efd28344d51e1"
+SRC_URI[sha256sum] = "626c369fa0eb37bac0291bce8259b332fd59ac792fa5497b59837309cd5b114a"
 
 inherit pypi python_flit_core ptest
 
-- 
2.39.2


--===============8758600501709571082==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-more-itertools: PV changed from "10.0.0" to "10.1.0"
packages/core2-32-poky-linux/python3-more-itertools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/more-itertools/more-itertools-10.0.0.tar.gz;downloadfilename=more-itertools-10.0.0.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/m/more-itertools/more-itertools-10.1.0.tar.gz;downloadfilename=more-itertools-10.1.0.tar.gz file://run-ptest"
packages/core2-32-poky-linux/python3-more-itertools: PKGV changed from 10.0.0 [default] to 10.1.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-dbg: PV changed from "10.0.0" to "10.1.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-dbg: PKGV changed from 10.0.0 [default] to 10.1.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-dev: PV changed from "10.0.0" to "10.1.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-dev: PKGV changed from 10.0.0 [default] to 10.1.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-doc: PV changed from "10.0.0" to "10.1.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-doc: PKGV changed from 10.0.0 [default] to 10.1.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-locale: PV changed from "10.0.0" to "10.1.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-locale: PKGV changed from 10.0.0 [default] to 10.1.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-ptest: PKGSIZE changed from 219011 to 222224 (+1%)
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-ptest: PV changed from "10.0.0" to "10.1.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-ptest: PKGV changed from 10.0.0 [default] to 10.1.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-src: PV changed from "10.0.0" to "10.1.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-src: PKGV changed from 10.0.0 [default] to 10.1.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-staticdev: PV changed from "10.0.0" to "10.1.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-staticdev: PKGV changed from 10.0.0 [default] to 10.1.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools: PKGSIZE changed from 440733 to 444527 (+1%)
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools: PV changed from "10.0.0" to "10.1.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools: PKGV changed from 10.0.0 [default] to 10.1.0 [default]
Changes to packages/core2-32-poky-linux/python3-more-itertools (sysroot):
  /usr/lib/python3.11/site-packages/more_itertools-10.0.0.dist-info moved to /usr/lib/python3.11/site-packages/more_itertools-10.1.0.dist-info
Changes to packages/x86_64-linux/python3-more-itertools-native (sysroot):
  /usr/lib/python3.11/site-packages/more_itertools-10.0.0.dist-info moved to /usr/lib/python3.11/site-packages/more_itertools-10.1.0.dist-info

--===============8758600501709571082==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-more-itertools (sysroot):
  /usr/lib/python3.11/site-packages/more_itertools-10.0.0.dist-info moved to /usr/lib/python3.11/site-packages/more_itertools-10.1.0.dist-info
Changes to packages/x86_64-linux/python3-more-itertools-native (sysroot):
  /usr/lib/python3.11/site-packages/more_itertools-10.0.0.dist-info moved to /usr/lib/python3.11/site-packages/more_itertools-10.1.0.dist-info

--===============8758600501709571082==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-more-itertools-upgrade-10.0.0-10.1.0.patch"

RnJvbSA1Njk4ZjFmMGFkZDRiMWU0OTZkZjlkNDBiZDRmMWMxNTAzZmI2MjAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTYgQXVnIDIwMjMgMDU6NDA6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW1vcmUtaXRlcnRvb2xzOiB1cGdyYWRlIDEwLjAuMCAtPiAxMC4xLjAKCi0tLQogLi4u
b3JlLWl0ZXJ0b29sc18xMC4wLjAuYmIgPT4gcHl0aG9uMy1tb3JlLWl0ZXJ0b29sc18xMC4xLjAu
YmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1tb3JlLWl0ZXJ0
b29sc18xMC4wLjAuYmIgPT4gcHl0aG9uMy1tb3JlLWl0ZXJ0b29sc18xMC4xLjAuYmJ9ICg4NyUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1vcmUt
aXRlcnRvb2xzXzEwLjAuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1tb3JlLWl0ZXJ0b29sc18xMC4xLjAuYmIKc2ltaWxhcml0eSBpbmRleCA4NyUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1vcmUtaXRlcnRvb2xzXzEw
LjAuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1v
cmUtaXRlcnRvb2xzXzEwLjEuMC5iYgppbmRleCBlMDdkNGI3ODYwLi5iZTJhNzNjMzY5IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbW9yZS1pdGVydG9v
bHNfMTAuMC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1t
b3JlLWl0ZXJ0b29sc18xMC4xLjAuYmIKQEAgLTMsNyArMyw3IEBAIEhPTUVQQUdFID0gImh0dHBz
Oi8vZ2l0aHViLmNvbS9lcmlrcm9zZS9tb3JlLWl0ZXJ0b29scyIKIExJQ0VOU0UgPSAiTUlUIgog
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MzM5NmVhMzBmOWQyMTM4OWQ3
ODU3NzE5ODE2ZjgzYjUiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjZDY1NDM3ZDdjNGI2MTVh
YjgxYzA2NDBjMDQ4MGJjMjlhNTUwZWEwMzI4OTE5Nzc2ODFlZmQyODM0NGQ1MWUxIgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjYyNmMzNjlmYTBlYjM3YmFjMDI5MWJjZTgyNTliMzMyZmQ1OWFjNzky
ZmE1NDk3YjU5ODM3MzA5Y2Q1YjExNGEiCiAKIGluaGVyaXQgcHlwaSBweXRob25fZmxpdF9jb3Jl
IHB0ZXN0CiAKLS0gCjIuMzkuMgoK

--===============8758600501709571082==--

