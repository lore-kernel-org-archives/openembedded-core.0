Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94BAEC2B9FB
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:21 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.1288.1715794338941919798
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=athQpjOM;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=kyDBzNcW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018f7d4fdfe3-6d2d3166-d618-4691-abfe-3a394ec9cd69-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=l37yezT7XENRcPtJoqmsZ+uTQQOJyNETYagnRCRa3c0=;
	b=athQpjOMam1Z3N5u8pnJrBaBx2iOCrl7HPUXTv819dACZb2cpfI+09CGQwCc6iFb
	VvQPnoKsksxKrejYvtRqdJ7ZxdWftLPkvGyzobO1hKT2W49MrMEmSiWqykyyoQKuBeh
	AlI71zuAI4zjmUMidY1ontBNfrxnVT+RSN4YBkfk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=l37yezT7XENRcPtJoqmsZ+uTQQOJyNETYagnRCRa3c0=;
	b=kyDBzNcWuyUDpuYv8QQGh/eEfLikN0ue7j/XjT8KHZu0wKsxLNBEc6k1qs+PP03T
	Nf2HHuoknR/qjQmIQyANnZvcxSuBpbnnEsroerVCxYwcXpIh2Pt+AmdyStFvI2Blaws
	Ar2AyYtPN/SeyPT+b+Qb0bb9rqKO1Ez25QFA2a1E=
Content-Type: multipart/mixed; boundary="===============0524370456265680323=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pygments: upgrading to 2.18.0 SUCCEEDED
Message-ID: <0101018f7d4fdfe3-6d2d3166-d618-4691-abfe-3a394ec9cd69-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199362

--===============0524370456265680323==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pygments* to *2.18.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pygments-upgrade-2.17.2-2.18.0.patch
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
From 6cdf2399b26e1a50a09eab63f365bbad859f655e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 10:00:46 +0000
Subject: [PATCH] python3-pygments: upgrade 2.17.2 -> 2.18.0

---
 .../{python3-pygments_2.17.2.bb => python3-pygments_2.18.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygments_2.17.2.bb => python3-pygments_2.18.0.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-pygments_2.17.2.bb b/meta/recipes-devtools/python/python3-pygments_2.18.0.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-pygments_2.17.2.bb
rename to meta/recipes-devtools/python/python3-pygments_2.18.0.bb
index 8b98064b78..fd37365681 100644
--- a/meta/recipes-devtools/python/python3-pygments_2.17.2.bb
+++ b/meta/recipes-devtools/python/python3-pygments_2.18.0.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=36a13c90514e2899f1eba7f41c3ee592"
 
 inherit python_hatchling
-SRC_URI[sha256sum] = "da46cec9fd2de5be3a8a784f434e4c4ab670b4ff54d605c4c2717e9d49c4c367"
+SRC_URI[sha256sum] = "786ff802f32e91311bff3889f6e9a86e81505fe99f2735bb6d60ae0c5004f199"
 
 UPSTREAM_CHECK_PYPI_PACKAGE = "Pygments"
 inherit pypi
-- 
2.44.0


--===============0524370456265680323==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pygments: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pygments/pygments-2.17.2.tar.gz;downloadfilename=pygments-2.17.2.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pygments/pygments-2.18.0.tar.gz;downloadfilename=pygments-2.18.0.tar.gz"
packages/core2-64-poky-linux/python3-pygments: PKGV changed from 2.17.2 [default] to 2.18.0 [default]
packages/core2-64-poky-linux/python3-pygments: PV changed from "2.17.2" to "2.18.0"
packages/core2-64-poky-linux/python3-pygments/python3-pygments-dbg: PKGV changed from 2.17.2 [default] to 2.18.0 [default]
packages/core2-64-poky-linux/python3-pygments/python3-pygments-dbg: PV changed from "2.17.2" to "2.18.0"
packages/core2-64-poky-linux/python3-pygments/python3-pygments-dev: PKGV changed from 2.17.2 [default] to 2.18.0 [default]
packages/core2-64-poky-linux/python3-pygments/python3-pygments-dev: PV changed from "2.17.2" to "2.18.0"
packages/core2-64-poky-linux/python3-pygments/python3-pygments-doc: PKGV changed from 2.17.2 [default] to 2.18.0 [default]
packages/core2-64-poky-linux/python3-pygments/python3-pygments-doc: PV changed from "2.17.2" to "2.18.0"
packages/core2-64-poky-linux/python3-pygments/python3-pygments-locale: PKGV changed from 2.17.2 [default] to 2.18.0 [default]
packages/core2-64-poky-linux/python3-pygments/python3-pygments-locale: PV changed from "2.17.2" to "2.18.0"
packages/core2-64-poky-linux/python3-pygments/python3-pygments-src: PKGV changed from 2.17.2 [default] to 2.18.0 [default]
packages/core2-64-poky-linux/python3-pygments/python3-pygments-src: PV changed from "2.17.2" to "2.18.0"
packages/core2-64-poky-linux/python3-pygments/python3-pygments-staticdev: PKGV changed from 2.17.2 [default] to 2.18.0 [default]
packages/core2-64-poky-linux/python3-pygments/python3-pygments-staticdev: PV changed from "2.17.2" to "2.18.0"
packages/core2-64-poky-linux/python3-pygments/python3-pygments: PKGSIZE changed from 7992926 to 8190900 (+2%)
packages/core2-64-poky-linux/python3-pygments/python3-pygments: PKGV changed from 2.17.2 [default] to 2.18.0 [default]
packages/core2-64-poky-linux/python3-pygments/python3-pygments: FILELIST: directory renamed /usr/lib/python3.12/site-packages/pygments-2.17.2.dist-info -> /usr/lib/python3.12/site-packages/pygments-2.18.0.dist-info, directory renamed /usr/lib/python3.12/site-packages/pygments-2.17.2.dist-info/licenses -> /usr/lib/python3.12/site-packages/pygments-2.18.0.dist-info/licenses, added "/usr/lib/python3.12/site-packages/pygments/lexers/__pycache__/soong.cpython-312.pyc /usr/lib/python3.12/site-packages/pygments/styles/__pycache__/coffee.cpython-312.pyc /usr/lib/python3.12/site-packages/pygments/lexers/__pycache__/_luau_builtins.cpython-312.pyc /usr/lib/python3.12/site-packages/pygments/lexers/__pycache__/mojo.cpython-312.pyc /usr/lib/python3.12/site-packages/pygments/lexers/typst.py /usr/lib/python3.12/site-packages/pygments/lexers/_luau_builtins.py /usr/lib/python3.12/site-packages/pygments/styles/coffee.py /usr/lib/python3.12/site-packages/pygments/lexers/tact.py /usr/lib/python3.12/site-
 packages/pygments/lexers/soong.py /usr/lib/python3.12/site-packages/pygments/lexers/mojo.py /usr/lib/python3.12/site-packages/pygments/lexers/__pycache__/tact.cpython-312.pyc /usr/lib/python3.12/site-packages/pygments/lexers/__pycache__/typst.cpython-312.pyc"
packages/core2-64-poky-linux/python3-pygments/python3-pygments: PV changed from "2.17.2" to "2.18.0"
Changes to packages/core2-64-poky-linux/python3-pygments (sysroot):
  /usr/lib/python3.12/site-packages/pygments-2.17.2.dist-info moved to /usr/lib/python3.12/site-packages/pygments-2.18.0.dist-info
  /usr/lib/python3.12/site-packages/pygments/lexers/_luau_builtins.py was added
  /usr/lib/python3.12/site-packages/pygments/lexers/mojo.py was added
  /usr/lib/python3.12/site-packages/pygments/lexers/__pycache__/_luau_builtins.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/pygments/lexers/__pycache__/mojo.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/pygments/lexers/__pycache__/soong.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/pygments/lexers/__pycache__/tact.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/pygments/lexers/__pycache__/typst.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/pygments/lexers/soong.py was added
  /usr/lib/python3.12/site-packages/pygments/lexers/tact.py was added
  /usr/lib/python3.12/site-packages/pygments/lexers/typst.py was added
  /usr/lib/python3.12/site-packages/pygments/styles/coffee.py was added
  /usr/lib/python3.12/site-packages/pygments/styles/__pycache__/coffee.cpython-312.pyc was added

--===============0524370456265680323==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pygments-upgrade-2.17.2-2.18.0.patch"

RnJvbSA2Y2RmMjM5OWIyNmUxYTUwYTA5ZWFiNjNmMzY1YmJhZDg1OWY2NTVlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMTA6MDA6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5Z21lbnRzOiB1cGdyYWRlIDIuMTcuMiAtPiAyLjE4LjAKCi0tLQogLi4uL3tweXRo
b24zLXB5Z21lbnRzXzIuMTcuMi5iYiA9PiBweXRob24zLXB5Z21lbnRzXzIuMTguMC5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1weWdtZW50c18yLjE3LjIu
YmIgPT4gcHl0aG9uMy1weWdtZW50c18yLjE4LjAuYmJ9ICg4MSUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Z21lbnRzXzIuMTcuMi5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWdtZW50c18yLjE4LjAuYmIKc2lt
aWxhcml0eSBpbmRleCA4MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXB5Z21lbnRzXzIuMTcuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXB5Z21lbnRzXzIuMTguMC5iYgppbmRleCA4Yjk4MDY0Yjc4Li5m
ZDM3MzY1NjgxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcHlnbWVudHNfMi4xNy4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1weWdtZW50c18yLjE4LjAuYmIKQEAgLTUsNyArNSw3IEBAIExJQ0VOU0UgPSAiQlNE
LTItQ2xhdXNlIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MzZhMTNj
OTA1MTRlMjg5OWYxZWJhN2Y0MWMzZWU1OTIiCiAKIGluaGVyaXQgcHl0aG9uX2hhdGNobGluZwot
U1JDX1VSSVtzaGEyNTZzdW1dID0gImRhNDZjZWM5ZmQyZGU1YmUzYThhNzg0ZjQzNGU0YzRhYjY3
MGI0ZmY1NGQ2MDVjNGMyNzE3ZTlkNDljNGMzNjciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzg2
ZmY4MDJmMzJlOTEzMTFiZmYzODg5ZjZlOWE4NmU4MTUwNWZlOTlmMjczNWJiNmQ2MGFlMGM1MDA0
ZjE5OSIKIAogVVBTVFJFQU1fQ0hFQ0tfUFlQSV9QQUNLQUdFID0gIlB5Z21lbnRzIgogaW5oZXJp
dCBweXBpCi0tIAoyLjQ0LjAKCg==

--===============0524370456265680323==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-pygments/python3-pygments: FILELIST: directory renamed /usr/lib/python3.12/site-packages/pygments-2.17.2.dist-info/licenses -> /usr/lib/python3.12/site-packages/pygments-2.18.0.dist-info/licenses, directory renamed /usr/lib/python3.12/site-packages/pygments-2.17.2.dist-info -> /usr/lib/python3.12/site-packages/pygments-2.18.0.dist-info, added "/usr/lib/python3.12/site-packages/pygments/lexers/__pycache__/soong.cpython-312.pyc /usr/lib/python3.12/site-packages/pygments/lexers/tact.py /usr/lib/python3.12/site-packages/pygments/lexers/mojo.py /usr/lib/python3.12/site-packages/pygments/lexers/typst.py /usr/lib/python3.12/site-packages/pygments/lexers/soong.py /usr/lib/python3.12/site-packages/pygments/lexers/_luau_builtins.py /usr/lib/python3.12/site-packages/pygments/styles/coffee.py /usr/lib/python3.12/site-packages/pygments/lexers/__pycache__/mojo.cpython-312.pyc /usr/lib/python3.12/site-packages/pygments/styles/__pycache__/coffee.cpython-312.pyc /
 usr/lib/python3.12/site-packages/pygments/lexers/__pycache__/tact.cpython-312.pyc /usr/lib/python3.12/site-packages/pygments/lexers/__pycache__/_luau_builtins.cpython-312.pyc /usr/lib/python3.12/site-packages/pygments/lexers/__pycache__/typst.cpython-312.pyc"
Changes to packages/core2-64-poky-linux/python3-pygments (sysroot):
  /usr/lib/python3.12/site-packages/pygments-2.17.2.dist-info moved to /usr/lib/python3.12/site-packages/pygments-2.18.0.dist-info
  /usr/lib/python3.12/site-packages/pygments/lexers/_luau_builtins.py was added
  /usr/lib/python3.12/site-packages/pygments/lexers/mojo.py was added
  /usr/lib/python3.12/site-packages/pygments/lexers/__pycache__/_luau_builtins.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/pygments/lexers/__pycache__/mojo.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/pygments/lexers/__pycache__/soong.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/pygments/lexers/__pycache__/tact.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/pygments/lexers/__pycache__/typst.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/pygments/lexers/soong.py was added
  /usr/lib/python3.12/site-packages/pygments/lexers/tact.py was added
  /usr/lib/python3.12/site-packages/pygments/lexers/typst.py was added
  /usr/lib/python3.12/site-packages/pygments/styles/coffee.py was added
  /usr/lib/python3.12/site-packages/pygments/styles/__pycache__/coffee.cpython-312.pyc was added

--===============0524370456265680323==--

