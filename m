Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9E44D172C0
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:12:56 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29053.1769951564839847440
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=kbQOXjFM;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=jK1vHReR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019c1955a3f1-02d0d019-8c3a-4ab1-aeb8-8328961cd2bf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951569;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5DGG4MpcEmKBznl+NocfKnrEJnDB/jTiPIn85+Cgsxo=;
	b=kbQOXjFMt+8omfJp6sPQoHi/a9lH+B0SkXrMpRL7S/rwkvSwFt0O20RD0wI1duWE
	JOTK5XFcb0PfOptRB2+c7GJy/WHsi6E8Ck8Ux4OOC8hiePyewGysWjOg1HyX+HmU+xv
	mymzeY9+WiGE9ZNCmIaG/XiCzOX4TrqKkAcjz40I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951569;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5DGG4MpcEmKBznl+NocfKnrEJnDB/jTiPIn85+Cgsxo=;
	b=jK1vHReRXsHnOHdM4uMTyNsk0RpRLxyJZHYMq187CXs57BYkMqX6QRXSADvbvM31
	5y3CcMBvv5GZ1o7hAbJI7Dqqbxfj1RSbKiD6zBxohuQ4VdynmyQ4qTZrVRt0AyqDE+l
	VSKqqZgM/qkkIu3AYJKSMI51lMBwnxHQs8O8h300=
Content-Type: multipart/mixed; boundary="===============4402691034020127162=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.151.4 SUCCEEDED
Message-ID: <0101019c1955a3f1-02d0d019-8c3a-4ab1-aeb8-8328961cd2bf-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:12:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230281

--===============4402691034020127162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hypothesis* to *6.151.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.150.3-6.151.4.patch
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
From 62379d56546e115a9d5b6a9dc59c7a6ac1fca8b6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Feb 2026 08:14:53 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.150.3 -> 6.151.4

---
 ...hon3-hypothesis_6.150.3.bb => python3-hypothesis_6.151.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.150.3.bb => python3-hypothesis_6.151.4.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.150.3.bb b/meta/recipes-devtools/python/python3-hypothesis_6.151.4.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.150.3.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.151.4.bb
index 889f86de81..425b2e6441 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.150.3.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.151.4.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "32c88d4b7df3a8483e69877561b520320bf7779b0709c11869e392025e9279d4"
+SRC_URI[sha256sum] = "658a62da1c3ccb36746ac2f7dc4bb1a6e76bd314e0dc54c4e1aaba2503d5545c"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.47.1


--===============4402691034020127162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.150.3.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.151.4.dist-info, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.150.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.151.4.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.150.3.dist-info moved to /usr/lib/python3.14/site-packages/hypothesis-6.151.4.dist-info

--===============4402691034020127162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.150.3.tar.gz;downloadfilename=hypothesis-6.150.3.tar.gz file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.151.4.tar.gz;downloadfilename=hypothesis-6.151.4.tar.gz file://test_binary_search.py file://test_rle.py"
packages/x86-64-v3-poky-linux/python3-hypothesis: PKGV changed from 6.150.3 [default] to 6.151.4 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis: PV changed from "6.150.3" to "6.151.4"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.150.3 [default] to 6.151.4 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.150.3" to "6.151.4"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.150.3 [default] to 6.151.4 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.150.3" to "6.151.4"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.150.3 [default] to 6.151.4 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.150.3" to "6.151.4"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.150.3 [default] to 6.151.4 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.150.3" to "6.151.4"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.150.3 [default] to 6.151.4 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.150.3" to "6.151.4"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.150.3 [default] to 6.151.4 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.150.3" to "6.151.4"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.150.3 [default] to 6.151.4 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.150.3" to "6.151.4"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 3920609 to 3924129 (+0%)
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.150.3.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.151.4.dist-info, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.150.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.151.4.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.150.3 [default] to 6.151.4 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.150.3" to "6.151.4"
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.150.3.dist-info moved to /usr/lib/python3.14/site-packages/hypothesis-6.151.4.dist-info

--===============4402691034020127162==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.150.3-6.151.4.patch"

RnJvbSA2MjM3OWQ1NjU0NmUxMTVhOWQ1YjZhOWRjNTljN2E2YWMxZmNhOGI2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBGZWIgMjAyNiAwODoxNDo1MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaHlwb3RoZXNpczogdXBncmFkZSA2LjE1MC4zIC0+IDYuMTUxLjQKCi0tLQogLi4uaG9u
My1oeXBvdGhlc2lzXzYuMTUwLjMuYmIgPT4gcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTUxLjQuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1oeXBvdGhlc2lzXzYu
MTUwLjMuYmIgPT4gcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTUxLjQuYmJ9ICg5MSUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4x
NTAuMy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lz
XzYuMTUxLjQuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xNTAuMy5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xNTEuNC5i
YgppbmRleCA4ODlmODZkZTgxLi40MjViMmU2NDQxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjE1MC4zLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTUxLjQuYmIKQEAg
LTEzLDcgKzEzLDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBmaWxlOi8vdGVzdF9ybGUucHkgXAog
ICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjMyYzg4ZDRiN2RmM2E4NDgzZTY5ODc3NTYx
YjUyMDMyMGJmNzc3OWIwNzA5YzExODY5ZTM5MjAyNWU5Mjc5ZDQiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiNjU4YTYyZGExYzNjY2IzNjc0NmFjMmY3ZGM0YmIxYTZlNzZiZDMxNGUwZGM1NGM0ZTFh
YWJhMjUwM2Q1NTQ1YyIKIAogUkRFUEVORFM6JHtQTn0gKz0gIiBcCiAgICAgcHl0aG9uMy1hdHRy
cyBcCi0tIAoyLjQ3LjEKCg==

--===============4402691034020127162==--

