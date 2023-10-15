Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD245C04FE8
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:24 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.102665.1697399114235014355
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=IhjeagdI;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=KGvPnA5Y;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.31, mailfrom: 0101018b34df07a5-d9de4a72-686e-4718-9d60-c3c9a9bc75b8-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=a7FaO9v55V2EuK0C3DqSYkDa5tHwqR/9kaUUVh7Vdo8=;
	b=IhjeagdIMn1z4x7VMaXbzXVNkSjDv6eeywzRrqFk1K3yw6IOYxJ4UiiDPTA2T9/P
	hDQ1+arc+/hutKSmQS5Y+V2Q/N7oPsHK83BzgKE2Y4Zev+/cGx2HbMaj+1XdTZMVBXJ
	ZR3ok4IuYAWH/XK5P7OVEV/QQ5wYYFAaG/JeW5NU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=a7FaO9v55V2EuK0C3DqSYkDa5tHwqR/9kaUUVh7Vdo8=;
	b=KGvPnA5Yw/dn9G0+2rgxLuiWsHCE+s9d5ANQ//gSUm3xPHfWPZLOrdRioS4bKb3m
	fJ9h1nTDerr6HKt/doWThdZTg7hsqgUyfK24buwY99Nzr7i9A3pvbp92CUyfUKGiqW+
	h4W04z5zH3YfwXYs3ozQji5W7A1csmdy7NMrjMgI=
Content-Type: multipart/mixed; boundary="===============6065511334741297661=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.87.4 SUCCEEDED
Message-ID: <0101018b34df07a5-d9de4a72-686e-4718-9d60-c3c9a9bc75b8-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189175

--===============6065511334741297661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hypothesis* to *6.87.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.86.2-6.87.4.patch
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
From 90274dd1b23453d73bae1e9cf64cc1844bde8dbb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Oct 2023 11:08:36 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.86.2 -> 6.87.4

---
 ...ython3-hypothesis_6.86.2.bb => python3-hypothesis_6.87.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.86.2.bb => python3-hypothesis_6.87.4.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb b/meta/recipes-devtools/python/python3-hypothesis_6.87.4.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.87.4.bb
index 6ec1457e46..4f41e2ab1a 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.87.4.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "e5d75d70f5a4fc372cddf03ec6141237a0a270ed106aeb2156a4984f06d37b0f"
+SRC_URI[sha256sum] = "c508779be66e266c45dbf9c1b2713e560dfd89abb044d92eafe91e8b2728af01"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.39.2


--===============6065511334741297661==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.86.2-6.87.4.patch"

RnJvbSA5MDI3NGRkMWIyMzQ1M2Q3M2JhZTFlOWNmNjRjYzE4NDRiZGU4ZGJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgT2N0IDIwMjMgMTE6MDg6MzYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWh5cG90aGVzaXM6IHVwZ3JhZGUgNi44Ni4yIC0+IDYuODcuNAoKLS0tCiAuLi55dGhv
bjMtaHlwb3RoZXNpc182Ljg2LjIuYmIgPT4gcHl0aG9uMy1oeXBvdGhlc2lzXzYuODcuNC5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWh5cG90aGVzaXNfNi44
Ni4yLmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182Ljg3LjQuYmJ9ICg5MSUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi44Ni4y
LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi44
Ny40LmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuODYuMi5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi44Ny40LmJiCmluZGV4
IDZlYzE0NTdlNDYuLjRmNDFlMmFiMWEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuODYuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182Ljg3LjQuYmIKQEAgLTEzLDcgKzEz
LDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBmaWxlOi8vdGVzdF9ybGUucHkgXAogICAgICIKIAot
U1JDX1VSSVtzaGEyNTZzdW1dID0gImU1ZDc1ZDcwZjVhNGZjMzcyY2RkZjAzZWM2MTQxMjM3YTBh
MjcwZWQxMDZhZWIyMTU2YTQ5ODRmMDZkMzdiMGYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYzUw
ODc3OWJlNjZlMjY2YzQ1ZGJmOWMxYjI3MTNlNTYwZGZkODlhYmIwNDRkOTJlYWZlOTFlOGIyNzI4
YWYwMSIKIAogUkRFUEVORFM6JHtQTn0gKz0gIiBcCiAgICAgcHl0aG9uMy1hdHRycyBcCi0tIAoy
LjM5LjIKCg==

--===============6065511334741297661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.11/site-packages/hypothesis-6.86.2.dist-info -> /usr/lib/python3.11/site-packages/hypothesis-6.87.4.dist-info, removed "/usr/lib/python3.11/site-packages/hypothesis/__pycache__/executors.cpython-311.pyc /usr/lib/python3.11/site-packages/hypothesis/executors.py"
Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.11/site-packages/hypothesis-6.86.2.dist-info moved to /usr/lib/python3.11/site-packages/hypothesis-6.87.4.dist-info
  /usr/lib/python3.11/site-packages/hypothesis/executors.py was removed
  /usr/lib/python3.11/site-packages/hypothesis/__pycache__/executors.cpython-311.pyc was removed

--===============6065511334741297661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.86.2.tar.gz;downloadfilename=hypothesis-6.86.2.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.87.4.tar.gz;downloadfilename=hypothesis-6.87.4.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py"
packages/core2-32-poky-linux/python3-hypothesis: PKGV changed from 6.86.2 [default] to 6.87.4 [default]
packages/core2-32-poky-linux/python3-hypothesis: PV changed from "6.86.2" to "6.87.4"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.86.2 [default] to 6.87.4 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.86.2" to "6.87.4"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.86.2 [default] to 6.87.4 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.86.2" to "6.87.4"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.86.2 [default] to 6.87.4 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.86.2" to "6.87.4"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.86.2 [default] to 6.87.4 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.86.2" to "6.87.4"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.86.2 [default] to 6.87.4 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.86.2" to "6.87.4"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.86.2 [default] to 6.87.4 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.86.2" to "6.87.4"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.86.2 [default] to 6.87.4 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.86.2" to "6.87.4"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.11/site-packages/hypothesis-6.86.2.dist-info -> /usr/lib/python3.11/site-packages/hypothesis-6.87.4.dist-info, removed "/usr/lib/python3.11/site-packages/hypothesis/__pycache__/executors.cpython-311.pyc /usr/lib/python3.11/site-packages/hypothesis/executors.py"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 2923008 to 2919672 (-0%)
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.86.2 [default] to 6.87.4 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.86.2" to "6.87.4"
Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.11/site-packages/hypothesis-6.86.2.dist-info moved to /usr/lib/python3.11/site-packages/hypothesis-6.87.4.dist-info
  /usr/lib/python3.11/site-packages/hypothesis/executors.py was removed
  /usr/lib/python3.11/site-packages/hypothesis/__pycache__/executors.cpython-311.pyc was removed

--===============6065511334741297661==--

