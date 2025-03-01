Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 609DDC35FF2
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 11:25:28 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.7171.1740828326047358583
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 03:25:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=L22J6koM;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=3Hm1Ul87;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019551743e6d-fb7aee1a-9570-494d-909d-56e458f6f383-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1740828327;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=F61/Q1mwNP5QgiHkZpwmVFxz43z4HvmfMB5ITRJafso=;
	b=L22J6koMLHuV1UVe1Zja+5/yGPuMCr+3DPX4QBubdt7n6qz7C79A6tzawCiY+kLw
	YQBn3fIYbaTJHv1TiBaIPUpI+T4m9Pz/nViFjuFlRamKvtvwo1o4bsbE4aqChOMkyLZ
	VHF6HL2d4Hf5LHkjRX+zNAge3i/2KcyjTtYddgGg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1740828327;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=F61/Q1mwNP5QgiHkZpwmVFxz43z4HvmfMB5ITRJafso=;
	b=3Hm1Ul8713nUGQc1yrmaOu60buhgEJ1LzXOKxwGSkNqvx4oT4/bpECynipuZ0nMg
	PRzfp29F0gBSY5ULhrfj39TSLDQmjc4HvzYrfrbqiEcdkTGQH4lbSn6/LpP3kDEAgKJ
	LnXxeGlXuJz4InGQEIHW2UqzxEcDSl7zt2Y5D43E=
Content-Type: multipart/mixed; boundary="===============1222240476883721191=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-trove-classifiers: upgrading to 2025.2.18.16 SUCCEEDED
Message-ID: <0101019551743e6d-fb7aee1a-9570-494d-909d-56e458f6f383-000000@us-west-2.amazonses.com>
Date: Sat, 1 Mar 2025 11:25:27 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 11:25:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212129

--===============1222240476883721191==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-trove-classifiers* to *2025.2.18.16* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-trove-classifiers-upgrade-2025.1.15.22-2025..patch
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
From 6e0aa2a388729141b7be228fd67de3e21ddb8d81 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Mar 2025 08:15:08 +0000
Subject: [PATCH] python3-trove-classifiers: upgrade 2025.1.15.22 ->
 2025.2.18.16

---
 ...025.1.15.22.bb => python3-trove-classifiers_2025.2.18.16.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2025.1.15.22.bb => python3-trove-classifiers_2025.2.18.16.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2025.1.15.22.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2025.2.18.16.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2025.1.15.22.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2025.2.18.16.bb
index eb7eb30554..6bdce9dc79 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2025.1.15.22.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2025.2.18.16.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "90af74358d3a01b3532bc7b3c88d8c6a094c2fd50a563d13d9576179326d7ed9"
+SRC_URI[sha256sum] = "b1ee2e1668589217d4edf506743e28b1834da128f8a122bad522c02d837006e1"
 
 PYPI_PACKAGE = "trove_classifiers"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.44.1


--===============1222240476883721191==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-trove-classifiers: PKGV changed from 2025.1.15.22 [default] to 2025.2.18.16 [default]
packages/core2-64-poky-linux/python3-trove-classifiers: PV changed from "2025.1.15.22" to "2025.2.18.16"
packages/core2-64-poky-linux/python3-trove-classifiers: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2025.1.15.22.tar.gz;downloadfilename=trove_classifiers-2025.1.15.22.tar.gz" to "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2025.2.18.16.tar.gz;downloadfilename=trove_classifiers-2025.2.18.16.tar.gz"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PKGV changed from 2025.1.15.22 [default] to 2025.2.18.16 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PV changed from "2025.1.15.22" to "2025.2.18.16"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PKGV changed from 2025.1.15.22 [default] to 2025.2.18.16 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PV changed from "2025.1.15.22" to "2025.2.18.16"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PKGV changed from 2025.1.15.22 [default] to 2025.2.18.16 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PV changed from "2025.1.15.22" to "2025.2.18.16"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PKGV changed from 2025.1.15.22 [default] to 2025.2.18.16 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PV changed from "2025.1.15.22" to "2025.2.18.16"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PKGV changed from 2025.1.15.22 [default] to 2025.2.18.16 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PV changed from "2025.1.15.22" to "2025.2.18.16"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PKGV changed from 2025.1.15.22 [default] to 2025.2.18.16 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PV changed from "2025.1.15.22" to "2025.2.18.16"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PKGV changed from 2025.1.15.22 [default] to 2025.2.18.16 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PV changed from "2025.1.15.22" to "2025.2.18.16"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGV changed from 2025.1.15.22 [default] to 2025.2.18.16 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PV changed from "2025.1.15.22" to "2025.2.18.16"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGSIZE changed from 93155 to 93215 (+0%)
Changes to packages/core2-64-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.1.15.22.dist-info moved to /usr/lib/python3.13/site-packages/trove_classifiers-2025.2.18.16.dist-info
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.1.15.22.dist-info moved to /usr/lib/python3.13/site-packages/trove_classifiers-2025.2.18.16.dist-info

--===============1222240476883721191==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-trove-classifiers-upgrade-2025.1.15.22-2025..patch"

RnJvbSA2ZTBhYTJhMzg4NzI5MTQxYjdiZTIyOGZkNjdkZTNlMjFkZGI4ZDgxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBNYXIgMjAyNSAwODoxNTowOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdHJvdmUtY2xhc3NpZmllcnM6IHVwZ3JhZGUgMjAyNS4xLjE1LjIyIC0+CiAyMDI1LjIu
MTguMTYKCi0tLQogLi4uMDI1LjEuMTUuMjIuYmIgPT4gcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVy
c18yMDI1LjIuMTguMTYuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0
aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI1LjEuMTUuMjIuYmIgPT4gcHl0aG9uMy10cm92ZS1j
bGFzc2lmaWVyc18yMDI1LjIuMTguMTYuYmJ9ICg4MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjUuMS4xNS4y
Mi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lm
aWVyc18yMDI1LjIuMTguMTYuYmIKc2ltaWxhcml0eSBpbmRleCA4MyUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjUu
MS4xNS4yMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjUuMi4xOC4xNi5iYgppbmRleCBlYjdlYjMwNTU0Li42YmRj
ZTlkYzc5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
dHJvdmUtY2xhc3NpZmllcnNfMjAyNS4xLjE1LjIyLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI1LjIuMTguMTYuYmIKQEAg
LTMsNyArMyw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9weXBhL3Ryb3ZlLWNs
YXNzaWZpZXJzIgogTElDRU5TRSA9ICJBcGFjaGUtMi4wIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vTElDRU5TRTttZDU9ODZkM2YzYTk1YzMyNGM5NDc5YmQ4OTg2OTY4ZjQzMjciCiAKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICI5MGFmNzQzNThkM2EwMWIzNTMyYmM3YjNjODhkOGM2YTA5NGMy
ZmQ1MGE1NjNkMTNkOTU3NjE3OTMyNmQ3ZWQ5IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImIxZWUy
ZTE2Njg1ODkyMTdkNGVkZjUwNjc0M2UyOGIxODM0ZGExMjhmOGExMjJiYWQ1MjJjMDJkODM3MDA2
ZTEiCiAKIFBZUElfUEFDS0FHRSA9ICJ0cm92ZV9jbGFzc2lmaWVycyIKIFVQU1RSRUFNX0NIRUNL
X1BZUElfUEFDS0FHRSA9ICIke1BZUElfUEFDS0FHRX0iCi0tIAoyLjQ0LjEKCg==

--===============1222240476883721191==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.1.15.22.dist-info moved to /usr/lib/python3.13/site-packages/trove_classifiers-2025.2.18.16.dist-info
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.1.15.22.dist-info moved to /usr/lib/python3.13/site-packages/trove_classifiers-2025.2.18.16.dist-info

--===============1222240476883721191==--

