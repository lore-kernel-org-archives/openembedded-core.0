Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF164C30626
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:12 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.174019.1692224342104083955
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=G2ExUhCa;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=VBZlSHEQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018a006e6288-78aba27e-97af-492a-92a4-ba0bd7872499-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224348;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dQKW4OtBEHx4wbotRL8n4AkERPhMq5L0iK2dWtceppA=;
	b=G2ExUhCaoWwy436NPvZlarudMvBuwFKASsNrgFYHJicfSHTLBCfRAC8HQ+k/fzs3
	5aeRjS0A3Lh5zqquQYXkMAel301luxb+zMF66pbdouHaJqpiHWNH/QkPDtQ2tT/anQv
	obYxqTcTrhoOt9VPsBATPSN7fWQpa5SMWFGQ3gvk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224348;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dQKW4OtBEHx4wbotRL8n4AkERPhMq5L0iK2dWtceppA=;
	b=VBZlSHEQGt6GlD2xgYH6wJHqGBINnTUkARtF62BRbQSyN89xD+0iruLCQMZDi8HB
	9XDHeS5WTLHsA5S3tn6nIU035xRC3is71BCzuOEehuw/qg7GHsPfHDa1HilTfYQNDoJ
	TM+kgIbgC0+WJ18RxXuVigFrJhS9jFDuJrq6m0Ck=
Content-Type: multipart/mixed; boundary="===============6989932218551607789=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-wheel: upgrading to 0.41.1 SUCCEEDED
Message-ID: <0101018a006e6288-78aba27e-97af-492a-92a4-ba0bd7872499-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:08 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186193

--===============6989932218551607789==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-wheel* to *0.41.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-wheel-upgrade-0.41.0-0.41.1.patch
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
From f7e257619279382591af5fb2e813f1578fe15b41 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 16 Aug 2023 06:35:11 +0000
Subject: [PATCH] python3-wheel: upgrade 0.41.0 -> 0.41.1

---
 .../python/{python3-wheel_0.41.0.bb => python3-wheel_0.41.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wheel_0.41.0.bb => python3-wheel_0.41.1.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-wheel_0.41.0.bb b/meta/recipes-devtools/python/python3-wheel_0.41.1.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-wheel_0.41.0.bb
rename to meta/recipes-devtools/python/python3-wheel_0.41.1.bb
index 2d8742545d..8eb931b5c9 100644
--- a/meta/recipes-devtools/python/python3-wheel_0.41.0.bb
+++ b/meta/recipes-devtools/python/python3-wheel_0.41.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7ffb0db04527cfe380e4f2726bd05ebf"
 
-SRC_URI[sha256sum] = "55a0f0a5a84869bce5ba775abfd9c462e3a6b1b7b7ec69d72c0b83d673a5114d"
+SRC_URI[sha256sum] = "12b911f083e876e10c595779709f8a88a59f45aacc646492a67fe9ef796c1b47"
 
 inherit python_flit_core pypi
 
-- 
2.39.2


--===============6989932218551607789==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-wheel: SRC_URI changed from "https://files.pythonhosted.org/packages/source/w/wheel/wheel-0.41.0.tar.gz;downloadfilename=wheel-0.41.0.tar.gz" to "https://files.pythonhosted.org/packages/source/w/wheel/wheel-0.41.1.tar.gz;downloadfilename=wheel-0.41.1.tar.gz"
packages/core2-32-poky-linux/python3-wheel: PKGV changed from 0.41.0 [default] to 0.41.1 [default]
packages/core2-32-poky-linux/python3-wheel: PV changed from "0.41.0" to "0.41.1"
packages/core2-32-poky-linux/python3-wheel/python3-wheel-dbg: PKGV changed from 0.41.0 [default] to 0.41.1 [default]
packages/core2-32-poky-linux/python3-wheel/python3-wheel-dbg: PV changed from "0.41.0" to "0.41.1"
packages/core2-32-poky-linux/python3-wheel/python3-wheel-dev: PKGV changed from 0.41.0 [default] to 0.41.1 [default]
packages/core2-32-poky-linux/python3-wheel/python3-wheel-dev: PV changed from "0.41.0" to "0.41.1"
packages/core2-32-poky-linux/python3-wheel/python3-wheel-doc: PKGV changed from 0.41.0 [default] to 0.41.1 [default]
packages/core2-32-poky-linux/python3-wheel/python3-wheel-doc: PV changed from "0.41.0" to "0.41.1"
packages/core2-32-poky-linux/python3-wheel/python3-wheel-locale: PKGV changed from 0.41.0 [default] to 0.41.1 [default]
packages/core2-32-poky-linux/python3-wheel/python3-wheel-locale: PV changed from "0.41.0" to "0.41.1"
packages/core2-32-poky-linux/python3-wheel/python3-wheel-src: PKGV changed from 0.41.0 [default] to 0.41.1 [default]
packages/core2-32-poky-linux/python3-wheel/python3-wheel-src: PV changed from "0.41.0" to "0.41.1"
packages/core2-32-poky-linux/python3-wheel/python3-wheel-staticdev: PKGV changed from 0.41.0 [default] to 0.41.1 [default]
packages/core2-32-poky-linux/python3-wheel/python3-wheel-staticdev: PV changed from "0.41.0" to "0.41.1"
packages/core2-32-poky-linux/python3-wheel/python3-wheel: PKGV changed from 0.41.0 [default] to 0.41.1 [default]
packages/core2-32-poky-linux/python3-wheel/python3-wheel: PKGSIZE changed from 466390 to 466693 (+0%)
packages/core2-32-poky-linux/python3-wheel/python3-wheel: PV changed from "0.41.0" to "0.41.1"
Changes to packages/core2-32-poky-linux/python3-wheel (sysroot):
  /usr/lib/python3.11/site-packages/wheel-0.41.0.dist-info moved to /usr/lib/python3.11/site-packages/wheel-0.41.1.dist-info

--===============6989932218551607789==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-wheel-upgrade-0.41.0-0.41.1.patch"

RnJvbSBmN2UyNTc2MTkyNzkzODI1OTFhZjVmYjJlODEzZjE1NzhmZTE1YjQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTYgQXVnIDIwMjMgMDY6MzU6MTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXdoZWVsOiB1cGdyYWRlIDAuNDEuMCAtPiAwLjQxLjEKCi0tLQogLi4uL3B5dGhvbi97
cHl0aG9uMy13aGVlbF8wLjQxLjAuYmIgPT4gcHl0aG9uMy13aGVlbF8wLjQxLjEuYmJ9IHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy13aGVlbF8wLjQxLjAuYmIgPT4g
cHl0aG9uMy13aGVlbF8wLjQxLjEuYmJ9ICg4NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdoZWVsXzAuNDEuMC5iYiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy13aGVlbF8wLjQxLjEuYmIKc2ltaWxhcml0eSBpbmRleCA4
NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdoZWVs
XzAuNDEuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXdoZWVsXzAuNDEuMS5iYgppbmRleCAyZDg3NDI1NDVkLi44ZWI5MzFiNWM5IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2hlZWxfMC40MS4wLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13aGVlbF8wLjQxLjEuYmIK
QEAgLTQsNyArNCw3IEBAIFNFQ1RJT04gPSAiZGV2ZWwvcHl0aG9uIgogTElDRU5TRSA9ICJNSVQi
CiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9N2ZmYjBkYjA0NTI3
Y2ZlMzgwZTRmMjcyNmJkMDVlYmYiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1NWEwZjBhNWE4
NDg2OWJjZTViYTc3NWFiZmQ5YzQ2MmUzYTZiMWI3YjdlYzY5ZDcyYzBiODNkNjczYTUxMTRkIgor
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjEyYjkxMWYwODNlODc2ZTEwYzU5NTc3OTcwOWY4YTg4YTU5
ZjQ1YWFjYzY0NjQ5MmE2N2ZlOWVmNzk2YzFiNDciCiAKIGluaGVyaXQgcHl0aG9uX2ZsaXRfY29y
ZSBweXBpCiAKLS0gCjIuMzkuMgoK

--===============6989932218551607789==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-wheel (sysroot):
  /usr/lib/python3.11/site-packages/wheel-0.41.0.dist-info moved to /usr/lib/python3.11/site-packages/wheel-0.41.1.dist-info

--===============6989932218551607789==--

