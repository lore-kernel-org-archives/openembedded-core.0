Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6166C04EB5
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:23 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.102670.1697399114526847374
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=YHpW5amU;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=kIBg3heV;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.192, mailfrom: 0101018b34df076f-34b7d73d-1b19-4fbe-bd3e-0c1415622d12-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Tv7kyBEOUb/NmT+IhDF3dCnVC/itQvOoxzemhwUJHe0=;
	b=YHpW5amUOqMyUakWOCoEePIsU++sZ7VhPAavqBfMGG/o8MrVT9Dg6zEUL/oDGkNf
	eG/V/LHBtl37QNJs5NmfoigkLTPb90nbQSdRtsq55dv+jquJxFwDpBtZKsfyUbb8BHo
	94uxdaUwyktXGSctrRhY4pUYUCduRNvQ/iG8ZR8s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Tv7kyBEOUb/NmT+IhDF3dCnVC/itQvOoxzemhwUJHe0=;
	b=kIBg3heV0WG3NvVT+qN/nU+EHYSWpPCGQzl/5W3q+mFBKqQKpjrOJS4Jz2mGr/Jp
	/+6kYwUDHcAiJdk/upHqqzMbD6fEWDZlJrRUqbCia4YmI+MXJJ3nI8wD4M+mgEgECIf
	7sGUrxbbw3jLD7c8Z+Vmd2XRmKecpaiv3hK9rv0w=
Content-Type: multipart/mixed; boundary="===============8583627332120469782=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-babel: upgrading to 2.13.0 SUCCEEDED
Message-ID: <0101018b34df076f-34b7d73d-1b19-4fbe-bd3e-0c1415622d12-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189183

--===============8583627332120469782==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-babel* to *2.13.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-babel-upgrade-2.12.1-2.13.0.patch
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
From 4f512c96da8fb7faae9cf2235842943bd098ee7d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Oct 2023 10:13:28 +0000
Subject: [PATCH] python3-babel: upgrade 2.12.1 -> 2.13.0

---
 .../python/{python3-babel_2.12.1.bb => python3-babel_2.13.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-babel_2.12.1.bb => python3-babel_2.13.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-babel_2.12.1.bb b/meta/recipes-devtools/python/python3-babel_2.13.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-babel_2.12.1.bb
rename to meta/recipes-devtools/python/python3-babel_2.13.0.bb
index 794e1652cd..408f3344bb 100644
--- a/meta/recipes-devtools/python/python3-babel_2.12.1.bb
+++ b/meta/recipes-devtools/python/python3-babel_2.13.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://babel.edgewall.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0f97d9a63e91407b4c0d01efde91cfc0"
 
-SRC_URI[sha256sum] = "cc2d99999cd01d44420ae725a21c9e3711b3aadc7976d6147f622d8581963455"
+SRC_URI[sha256sum] = "04c3e2d28d2b7681644508f836be388ae49e0cfe91465095340395b60d00f210"
 
 PYPI_PACKAGE = "Babel"
 
-- 
2.39.2


--===============8583627332120469782==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-babel (sysroot):
  /usr/lib/python3.11/site-packages/Babel-2.12.1.dist-info moved to /usr/lib/python3.11/site-packages/Babel-2.13.0.dist-info

--===============8583627332120469782==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-babel-upgrade-2.12.1-2.13.0.patch"

RnJvbSA0ZjUxMmM5NmRhOGZiN2ZhYWU5Y2YyMjM1ODQyOTQzYmQwOThlZTdkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgT2N0IDIwMjMgMTA6MTM6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWJhYmVsOiB1cGdyYWRlIDIuMTIuMSAtPiAyLjEzLjAKCi0tLQogLi4uL3B5dGhvbi97
cHl0aG9uMy1iYWJlbF8yLjEyLjEuYmIgPT4gcHl0aG9uMy1iYWJlbF8yLjEzLjAuYmJ9IHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1iYWJlbF8yLjEyLjEuYmIgPT4g
cHl0aG9uMy1iYWJlbF8yLjEzLjAuYmJ9ICg4NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJhYmVsXzIuMTIuMS5iYiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1iYWJlbF8yLjEzLjAuYmIKc2ltaWxhcml0eSBpbmRleCA4
NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJhYmVs
XzIuMTIuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LWJhYmVsXzIuMTMuMC5iYgppbmRleCA3OTRlMTY1MmNkLi40MDhmMzM0NGJiIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmFiZWxfMi4xMi4xLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iYWJlbF8yLjEzLjAuYmIK
QEAgLTMsNyArMyw3IEBAIEhPTUVQQUdFID0gImh0dHA6Ly9iYWJlbC5lZGdld2FsbC5vcmcvIgog
TElDRU5TRSA9ICJCU0QtMy1DbGF1c2UiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNF
TlNFO21kNT0wZjk3ZDlhNjNlOTE0MDdiNGMwZDAxZWZkZTkxY2ZjMCIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gImNjMmQ5OTk5OWNkMDFkNDQ0MjBhZTcyNWEyMWM5ZTM3MTFiM2FhZGM3OTc2ZDYx
NDdmNjIyZDg1ODE5NjM0NTUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDRjM2UyZDI4ZDJiNzY4
MTY0NDUwOGY4MzZiZTM4OGFlNDllMGNmZTkxNDY1MDk1MzQwMzk1YjYwZDAwZjIxMCIKIAogUFlQ
SV9QQUNLQUdFID0gIkJhYmVsIgogCi0tIAoyLjM5LjIKCg==

--===============8583627332120469782==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-babel: PV changed from "2.12.1" to "2.13.0"
packages/core2-32-poky-linux/python3-babel: SRC_URI changed from "https://files.pythonhosted.org/packages/source/B/Babel/Babel-2.12.1.tar.gz;downloadfilename=Babel-2.12.1.tar.gz" to "https://files.pythonhosted.org/packages/source/B/Babel/Babel-2.13.0.tar.gz;downloadfilename=Babel-2.13.0.tar.gz"
packages/core2-32-poky-linux/python3-babel: PKGV changed from 2.12.1 [default] to 2.13.0 [default]
packages/core2-32-poky-linux/python3-babel/python3-babel-dbg: PV changed from "2.12.1" to "2.13.0"
packages/core2-32-poky-linux/python3-babel/python3-babel-dbg: PKGV changed from 2.12.1 [default] to 2.13.0 [default]
packages/core2-32-poky-linux/python3-babel/python3-babel-dev: PV changed from "2.12.1" to "2.13.0"
packages/core2-32-poky-linux/python3-babel/python3-babel-dev: PKGV changed from 2.12.1 [default] to 2.13.0 [default]
packages/core2-32-poky-linux/python3-babel/python3-babel-doc: PV changed from "2.12.1" to "2.13.0"
packages/core2-32-poky-linux/python3-babel/python3-babel-doc: PKGV changed from 2.12.1 [default] to 2.13.0 [default]
packages/core2-32-poky-linux/python3-babel/python3-babel-locale: PV changed from "2.12.1" to "2.13.0"
packages/core2-32-poky-linux/python3-babel/python3-babel-locale: PKGV changed from 2.12.1 [default] to 2.13.0 [default]
packages/core2-32-poky-linux/python3-babel/python3-babel-src: PV changed from "2.12.1" to "2.13.0"
packages/core2-32-poky-linux/python3-babel/python3-babel-src: PKGV changed from 2.12.1 [default] to 2.13.0 [default]
packages/core2-32-poky-linux/python3-babel/python3-babel-staticdev: PV changed from "2.12.1" to "2.13.0"
packages/core2-32-poky-linux/python3-babel/python3-babel-staticdev: PKGV changed from 2.12.1 [default] to 2.13.0 [default]
packages/core2-32-poky-linux/python3-babel/python3-babel: PV changed from "2.12.1" to "2.13.0"
packages/core2-32-poky-linux/python3-babel/python3-babel: PKGSIZE changed from 32454056 to 32464871 (+0%)
packages/core2-32-poky-linux/python3-babel/python3-babel: PKGV changed from 2.12.1 [default] to 2.13.0 [default]
Changes to packages/core2-32-poky-linux/python3-babel (sysroot):
  /usr/lib/python3.11/site-packages/Babel-2.12.1.dist-info moved to /usr/lib/python3.11/site-packages/Babel-2.13.0.dist-info

--===============8583627332120469782==--

