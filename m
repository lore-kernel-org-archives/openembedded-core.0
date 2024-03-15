Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F4EC54EC6
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:00:13 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.1244.1710522012280318559
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:00:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=K3B+U7dl;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=h6diyhHC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018e430e8fe0-5ceaa6a4-098d-4fb7-944f-02a123fb350b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710522011;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/pRTeDZW3lwX0Q3d4H4chzGvzHWQ8BxqixMvMhtWWz0=;
	b=K3B+U7dleDyfeBcuFZprVb5CeKZW+zBuW5CTqNAdfqFqSqkape8skiKu0pyp0yLL
	aGllDoUqjwOkcCqLWBQCPugctNE/2VQNYp6RUhP6lnGvIgS9BY4xhwR6ygKCLJKeyvV
	tWz1PCqyu3EZ+Iu9p7+KZ66qxSacKwH+nm069Wzk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1710522011;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/pRTeDZW3lwX0Q3d4H4chzGvzHWQ8BxqixMvMhtWWz0=;
	b=h6diyhHCkrXCol/xkCnzXyjWd/FZaGlBTWrVcmGY8eItKeAGZoVVmFUGj6vVbpJ7
	fpYStXOT0A8z7l15W2ZRtiOnLHm5VBlw1Q94nKptXqWizVLMWmdarGuDFpIAxJz42bv
	b43lMMX85N/Aw+HqTB4/N/sD/b/LTkSbL94eBrXg=
Content-Type: multipart/mixed; boundary="===============8525999551128916986=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-wheel: upgrading to 0.43.0 SUCCEEDED
Message-ID: <0101018e430e8fe0-5ceaa6a4-098d-4fb7-944f-02a123fb350b-000000@us-west-2.amazonses.com>
Date: Fri, 15 Mar 2024 17:00:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:00:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197175

--===============8525999551128916986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-wheel* to *0.43.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-wheel-upgrade-0.42.0-0.43.0.patch
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
From aa2a9ceba1e90961762f3a9cc5ca98abf8d44afe Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Mar 2024 09:15:33 +0000
Subject: [PATCH] python3-wheel: upgrade 0.42.0 -> 0.43.0

---
 .../python/{python3-wheel_0.42.0.bb => python3-wheel_0.43.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wheel_0.42.0.bb => python3-wheel_0.43.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-wheel_0.42.0.bb b/meta/recipes-devtools/python/python3-wheel_0.43.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-wheel_0.42.0.bb
rename to meta/recipes-devtools/python/python3-wheel_0.43.0.bb
index 807888e6c0..ba309ae5fc 100644
--- a/meta/recipes-devtools/python/python3-wheel_0.42.0.bb
+++ b/meta/recipes-devtools/python/python3-wheel_0.43.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7ffb0db04527cfe380e4f2726bd05ebf"
 
-SRC_URI[sha256sum] = "c45be39f7882c9d34243236f2d63cbd58039e360f85d0913425fbd7ceea617a8"
+SRC_URI[sha256sum] = "465ef92c69fa5c5da2d1cf8ac40559a8c940886afcef87dcf14b9470862f1d85"
 
 inherit python_flit_core pypi
 
-- 
2.42.0


--===============8525999551128916986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-wheel: SRC_URI changed from "https://files.pythonhosted.org/packages/source/w/wheel/wheel-0.42.0.tar.gz;downloadfilename=wheel-0.42.0.tar.gz" to "https://files.pythonhosted.org/packages/source/w/wheel/wheel-0.43.0.tar.gz;downloadfilename=wheel-0.43.0.tar.gz"
packages/core2-64-poky-linux/python3-wheel: PV changed from "0.42.0" to "0.43.0"
packages/core2-64-poky-linux/python3-wheel: PKGV changed from 0.42.0 [default] to 0.43.0 [default]
packages/core2-64-poky-linux/python3-wheel/python3-wheel-dbg: PV changed from "0.42.0" to "0.43.0"
packages/core2-64-poky-linux/python3-wheel/python3-wheel-dbg: PKGV changed from 0.42.0 [default] to 0.43.0 [default]
packages/core2-64-poky-linux/python3-wheel/python3-wheel-dev: PV changed from "0.42.0" to "0.43.0"
packages/core2-64-poky-linux/python3-wheel/python3-wheel-dev: PKGV changed from 0.42.0 [default] to 0.43.0 [default]
packages/core2-64-poky-linux/python3-wheel/python3-wheel-doc: PV changed from "0.42.0" to "0.43.0"
packages/core2-64-poky-linux/python3-wheel/python3-wheel-doc: PKGV changed from 0.42.0 [default] to 0.43.0 [default]
packages/core2-64-poky-linux/python3-wheel/python3-wheel-locale: PV changed from "0.42.0" to "0.43.0"
packages/core2-64-poky-linux/python3-wheel/python3-wheel-locale: PKGV changed from 0.42.0 [default] to 0.43.0 [default]
packages/core2-64-poky-linux/python3-wheel/python3-wheel-src: PV changed from "0.42.0" to "0.43.0"
packages/core2-64-poky-linux/python3-wheel/python3-wheel-src: PKGV changed from 0.42.0 [default] to 0.43.0 [default]
packages/core2-64-poky-linux/python3-wheel/python3-wheel-staticdev: PV changed from "0.42.0" to "0.43.0"
packages/core2-64-poky-linux/python3-wheel/python3-wheel-staticdev: PKGV changed from 0.42.0 [default] to 0.43.0 [default]
packages/core2-64-poky-linux/python3-wheel/python3-wheel: PKGSIZE changed from 444428 to 446976 (+1%)
packages/core2-64-poky-linux/python3-wheel/python3-wheel: PV changed from "0.42.0" to "0.43.0"
packages/core2-64-poky-linux/python3-wheel/python3-wheel: PKGV changed from 0.42.0 [default] to 0.43.0 [default]
Changes to packages/core2-64-poky-linux/python3-wheel (sysroot):
  /usr/lib/python3.12/site-packages/wheel-0.42.0.dist-info moved to /usr/lib/python3.12/site-packages/wheel-0.43.0.dist-info

--===============8525999551128916986==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-wheel-upgrade-0.42.0-0.43.0.patch"

RnJvbSBhYTJhOWNlYmExZTkwOTYxNzYyZjNhOWNjNWNhOThhYmY4ZDQ0YWZlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWFyIDIwMjQgMDk6MTU6MzMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXdoZWVsOiB1cGdyYWRlIDAuNDIuMCAtPiAwLjQzLjAKCi0tLQogLi4uL3B5dGhvbi97
cHl0aG9uMy13aGVlbF8wLjQyLjAuYmIgPT4gcHl0aG9uMy13aGVlbF8wLjQzLjAuYmJ9IHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy13aGVlbF8wLjQyLjAuYmIgPT4g
cHl0aG9uMy13aGVlbF8wLjQzLjAuYmJ9ICg4NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdoZWVsXzAuNDIuMC5iYiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy13aGVlbF8wLjQzLjAuYmIKc2ltaWxhcml0eSBpbmRleCA4
NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdoZWVs
XzAuNDIuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXdoZWVsXzAuNDMuMC5iYgppbmRleCA4MDc4ODhlNmMwLi5iYTMwOWFlNWZjIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2hlZWxfMC40Mi4wLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13aGVlbF8wLjQzLjAuYmIK
QEAgLTQsNyArNCw3IEBAIFNFQ1RJT04gPSAiZGV2ZWwvcHl0aG9uIgogTElDRU5TRSA9ICJNSVQi
CiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9N2ZmYjBkYjA0NTI3
Y2ZlMzgwZTRmMjcyNmJkMDVlYmYiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjNDViZTM5Zjc4
ODJjOWQzNDI0MzIzNmYyZDYzY2JkNTgwMzllMzYwZjg1ZDA5MTM0MjVmYmQ3Y2VlYTYxN2E4Igor
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjQ2NWVmOTJjNjlmYTVjNWRhMmQxY2Y4YWM0MDU1OWE4Yzk0
MDg4NmFmY2VmODdkY2YxNGI5NDcwODYyZjFkODUiCiAKIGluaGVyaXQgcHl0aG9uX2ZsaXRfY29y
ZSBweXBpCiAKLS0gCjIuNDIuMAoK

--===============8525999551128916986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-wheel (sysroot):
  /usr/lib/python3.12/site-packages/wheel-0.42.0.dist-info moved to /usr/lib/python3.12/site-packages/wheel-0.43.0.dist-info

--===============8525999551128916986==--

