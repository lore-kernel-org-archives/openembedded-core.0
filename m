Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2267CD8C96
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:45 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1551.1780328127355628892
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZLgmzjyq;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=AO8NqgZy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019e83d39721-cf91ea1b-425c-42ca-ac9f-c6f4e0355ac9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328142;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9NU3dmU5UrfDCr/YtiUhNk+haItlqSMxRm5V+RcLgKg=;
	b=ZLgmzjyqLqtsV4bIp9h7lINerE/znR+oS0AKG93yxI5/qTiJ+Fb+hBmbT4gtKs/C
	RN+n8z3aiDWV7ijJGGD+eDBIiwNi8bx0laZil91h2DsrJn/TOoNbkkH9BGd1O1YgFOx
	Uzirea9s6+ezOjU1jheF8gHljPAmfjiBk9oUGtPk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328142;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9NU3dmU5UrfDCr/YtiUhNk+haItlqSMxRm5V+RcLgKg=;
	b=AO8NqgZyXi5IQaPJMZ2ofVj3nw1dCHjEk+YlJ2Cqvfs4nm/pcpGgWp9eGILrhvhj
	81plPu7EVxYeZctH3BidkGxCNFP24ZTIXNanOlPiY3ivbxW5vOsNuGFpDe05wUQMYkj
	qmQHhmMMl2Ejg8W2JPm6EjAYGtt39Q1GXjg7BfLM=
Content-Type: multipart/mixed; boundary="===============6923552714674445069=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-trove-classifiers: upgrading to 2026.5.22.10 SUCCEEDED
Message-ID: <0101019e83d39721-cf91ea1b-425c-42ca-ac9f-c6f4e0355ac9-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237894

--===============6923552714674445069==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-trove-classifiers* to *2026.5.22.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-trove-classifiers-upgrade-2026.4.28.13-2026..patch
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
From 242010b5b33496fc5e968cae65f7a6397693d84d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 09:34:17 +0000
Subject: [PATCH] python3-trove-classifiers: upgrade 2026.4.28.13 ->
 2026.5.22.10

---
 ...026.4.28.13.bb => python3-trove-classifiers_2026.5.22.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2026.4.28.13.bb => python3-trove-classifiers_2026.5.22.10.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2026.4.28.13.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2026.5.22.10.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2026.4.28.13.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2026.5.22.10.bb
index 1ed81eccff..f4f1315ffa 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2026.4.28.13.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2026.5.22.10.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "c85bb8a53c3de7330d1699b844ed9fb809a602a09ac15dc79ad6d1a509be0676"
+SRC_URI[sha256sum] = "5477e9974e91904fb2cfa4a7581ab6e2f30c2c38d847fd00ed866080748101d5"
 
 PYPI_PACKAGE = "trove_classifiers"
 
-- 
2.47.1


--===============6923552714674445069==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers: FILELIST: directory renamed /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/licenses -> /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.22.10.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info -> /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.22.10.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info moved to /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.22.10.dist-info
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info moved to /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.22.10.dist-info

--===============6923552714674445069==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-trove-classifiers-upgrade-2026.4.28.13-2026..patch"

RnJvbSAyNDIwMTBiNWIzMzQ5NmZjNWU5NjhjYWU2NWY3YTYzOTc2OTNkODRkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAwOTozNDoxNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdHJvdmUtY2xhc3NpZmllcnM6IHVwZ3JhZGUgMjAyNi40LjI4LjEzIC0+CiAyMDI2LjUu
MjIuMTAKCi0tLQogLi4uMDI2LjQuMjguMTMuYmIgPT4gcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVy
c18yMDI2LjUuMjIuMTAuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0
aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI2LjQuMjguMTMuYmIgPT4gcHl0aG9uMy10cm92ZS1j
bGFzc2lmaWVyc18yMDI2LjUuMjIuMTAuYmJ9ICg4MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjYuNC4yOC4x
My5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lm
aWVyc18yMDI2LjUuMjIuMTAuYmIKc2ltaWxhcml0eSBpbmRleCA4MSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjYu
NC4yOC4xMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjYuNS4yMi4xMC5iYgppbmRleCAxZWQ4MWVjY2ZmLi5mNGYx
MzE1ZmZhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
dHJvdmUtY2xhc3NpZmllcnNfMjAyNi40LjI4LjEzLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI2LjUuMjIuMTAuYmIKQEAg
LTMsNyArMyw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9weXBhL3Ryb3ZlLWNs
YXNzaWZpZXJzIgogTElDRU5TRSA9ICJBcGFjaGUtMi4wIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vTElDRU5TRTttZDU9ODZkM2YzYTk1YzMyNGM5NDc5YmQ4OTg2OTY4ZjQzMjciCiAKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICJjODViYjhhNTNjM2RlNzMzMGQxNjk5Yjg0NGVkOWZiODA5YTYw
MmEwOWFjMTVkYzc5YWQ2ZDFhNTA5YmUwNjc2IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjU0Nzdl
OTk3NGU5MTkwNGZiMmNmYTRhNzU4MWFiNmUyZjMwYzJjMzhkODQ3ZmQwMGVkODY2MDgwNzQ4MTAx
ZDUiCiAKIFBZUElfUEFDS0FHRSA9ICJ0cm92ZV9jbGFzc2lmaWVycyIKIAotLSAKMi40Ny4xCgo=

--===============6923552714674445069==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-trove-classifiers: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2026.4.28.13.tar.gz;downloadfilename=trove_classifiers-2026.4.28.13.tar.gz" to "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2026.5.22.10.tar.gz;downloadfilename=trove_classifiers-2026.5.22.10.tar.gz"
packages/x86-64-v3-poky-linux/python3-trove-classifiers: PKGV changed from 2026.4.28.13 [default] to 2026.5.22.10 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers: PV changed from "2026.4.28.13" to "2026.5.22.10"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PKGV changed from 2026.4.28.13 [default] to 2026.5.22.10 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PV changed from "2026.4.28.13" to "2026.5.22.10"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PKGV changed from 2026.4.28.13 [default] to 2026.5.22.10 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PV changed from "2026.4.28.13" to "2026.5.22.10"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PKGV changed from 2026.4.28.13 [default] to 2026.5.22.10 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PV changed from "2026.4.28.13" to "2026.5.22.10"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PKGV changed from 2026.4.28.13 [default] to 2026.5.22.10 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PV changed from "2026.4.28.13" to "2026.5.22.10"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PKGV changed from 2026.4.28.13 [default] to 2026.5.22.10 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PV changed from "2026.4.28.13" to "2026.5.22.10"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PKGV changed from 2026.4.28.13 [default] to 2026.5.22.10 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PV changed from "2026.4.28.13" to "2026.5.22.10"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PKGV changed from 2026.4.28.13 [default] to 2026.5.22.10 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PV changed from "2026.4.28.13" to "2026.5.22.10"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGSIZE changed from 113532 to 113876 (+0%)
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers: FILELIST: directory renamed /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info/licenses -> /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.22.10.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info -> /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.22.10.dist-info
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGV changed from 2026.4.28.13 [default] to 2026.5.22.10 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PV changed from "2026.4.28.13" to "2026.5.22.10"
Changes to packages/x86-64-v3-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info moved to /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.22.10.dist-info
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.14/site-packages/trove_classifiers-2026.4.28.13.dist-info moved to /usr/lib/python3.14/site-packages/trove_classifiers-2026.5.22.10.dist-info

--===============6923552714674445069==--

