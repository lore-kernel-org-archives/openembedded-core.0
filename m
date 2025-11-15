Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B97ACED272
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:39:04 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12131.1763224737035900332
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:38:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=nWaOmhZR;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=jNAocTce;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019a8862530d-5487b729-d5d3-4c8f-b121-825c9279df98-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224736;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CJdJOYI0Mh9229K081MZhl8XUfmzNDUKuryivCrDRJM=;
	b=nWaOmhZRxAQ8/k3+EOigxkgWBrUhKGh61WAbNS2aGWdQa+0x1Ig22TAtrAp02nTP
	i2BON+8OtSZXXoEIFj2ZhHjJ33Y9mdT6ZcFmHPS+eCMpr7el7BfPrtzySBEkwJVi5Xe
	tO+CbHwzp+zYdKIfwd5qqSALmGE7ic3C0JRheYow=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224736;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CJdJOYI0Mh9229K081MZhl8XUfmzNDUKuryivCrDRJM=;
	b=jNAocTceCvm8ykavBSGsFkD8gssGAxrhUCiGNJSy3vW20fG5t4LwSS/mrPCYKM0w
	DH3YR5gk1Z28hqaOG17ZVFvLXBnqVOxoqDjpXa+DyfEd87OqAKgWcrMFotakyi7CyT6
	QVkHTNr8AeuoUxzZmhqmT7ZaMTcW03aVPVQdl3bE=
Content-Type: multipart/mixed; boundary="===============8277241942545949545=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-trove-classifiers: upgrading to 2025.11.14.15 SUCCEEDED
Message-ID: <0101019a8862530d-5487b729-d5d3-4c8f-b121-825c9279df98-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:38:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:39:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226381

--===============8277241942545949545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-trove-classifiers* to *2025.11.14.15* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-trove-classifiers-upgrade-2025.9.11.17-2025..patch
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
From b0a1739b67b2fe3e6a1fe6a4046955031a7cdf13 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 11:30:16 +0000
Subject: [PATCH] python3-trove-classifiers: upgrade 2025.9.11.17 ->
 2025.11.14.15

---
 ...25.9.11.17.bb => python3-trove-classifiers_2025.11.14.15.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2025.9.11.17.bb => python3-trove-classifiers_2025.11.14.15.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2025.9.11.17.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2025.11.14.15.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2025.9.11.17.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2025.11.14.15.bb
index 4bbdd243ef..b8365147dc 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2025.9.11.17.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2025.11.14.15.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "931ca9841a5e9c9408bc2ae67b50d28acf85bef56219b56860876dd1f2d024dd"
+SRC_URI[sha256sum] = "6b60f49d40bbd895bc61d8dc414fc2f2286d70eb72ed23548db8cf94f62804ca"
 
 PYPI_PACKAGE = "trove_classifiers"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.47.1


--===============8277241942545949545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-trove-classifiers: PV changed from "2025.9.11.17" to "2025.11.14.15"
packages/x86-64-v3-poky-linux/python3-trove-classifiers: PKGV changed from 2025.9.11.17 [default] to 2025.11.14.15 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2025.9.11.17.tar.gz;downloadfilename=trove_classifiers-2025.9.11.17.tar.gz" to "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2025.11.14.15.tar.gz;downloadfilename=trove_classifiers-2025.11.14.15.tar.gz"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PV changed from "2025.9.11.17" to "2025.11.14.15"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PKGV changed from 2025.9.11.17 [default] to 2025.11.14.15 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PV changed from "2025.9.11.17" to "2025.11.14.15"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PKGV changed from 2025.9.11.17 [default] to 2025.11.14.15 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PV changed from "2025.9.11.17" to "2025.11.14.15"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PKGV changed from 2025.9.11.17 [default] to 2025.11.14.15 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PV changed from "2025.9.11.17" to "2025.11.14.15"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PKGV changed from 2025.9.11.17 [default] to 2025.11.14.15 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PV changed from "2025.9.11.17" to "2025.11.14.15"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PKGV changed from 2025.9.11.17 [default] to 2025.11.14.15 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PV changed from "2025.9.11.17" to "2025.11.14.15"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PKGV changed from 2025.9.11.17 [default] to 2025.11.14.15 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PV changed from "2025.9.11.17" to "2025.11.14.15"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PKGV changed from 2025.9.11.17 [default] to 2025.11.14.15 [default]
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PV changed from "2025.9.11.17" to "2025.11.14.15"
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGSIZE changed from 95627 to 95896 (+0%)
packages/x86-64-v3-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGV changed from 2025.9.11.17 [default] to 2025.11.14.15 [default]
Changes to packages/x86-64-v3-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.11.14.15.dist-info was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.11.14.15.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.11.14.15.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.11.14.15.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.11.14.15.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.11.14.15.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.11.14.15.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.11.14.15.dist-info was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.11.14.15.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.11.14.15.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.11.14.15.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.11.14.15.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.11.14.15.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.11.14.15.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/WHEEL was removed

--===============8277241942545949545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.11.14.15.dist-info was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.11.14.15.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.11.14.15.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.11.14.15.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.11.14.15.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.11.14.15.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.11.14.15.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.11.14.15.dist-info was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.11.14.15.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.11.14.15.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.11.14.15.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.11.14.15.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.11.14.15.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.11.14.15.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.9.11.17.dist-info/WHEEL was removed

--===============8277241942545949545==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-trove-classifiers-upgrade-2025.9.11.17-2025..patch"

RnJvbSBiMGExNzM5YjY3YjJmZTNlNmExZmU2YTQwNDY5NTUwMzFhN2NkZjEzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMTE6MzA6MTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzOiB1cGdyYWRlIDIwMjUuOS4xMS4xNyAtPgogMjAyNS4x
MS4xNC4xNQoKLS0tCiAuLi4yNS45LjExLjE3LmJiID0+IHB5dGhvbjMtdHJvdmUtY2xhc3NpZmll
cnNfMjAyNS4xMS4xNC4xNS5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tw
eXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjUuOS4xMS4xNy5iYiA9PiBweXRob24zLXRyb3Zl
LWNsYXNzaWZpZXJzXzIwMjUuMTEuMTQuMTUuYmJ9ICg4MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjUuOS4x
MS4xNy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFz
c2lmaWVyc18yMDI1LjExLjE0LjE1LmJiCnNpbWlsYXJpdHkgaW5kZXggODMlCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18y
MDI1LjkuMTEuMTcuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI1LjExLjE0LjE1LmJiCmluZGV4IDRiYmRkMjQzZWYu
LmI4MzY1MTQ3ZGMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI1LjkuMTEuMTcuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjUuMTEuMTQuMTUu
YmIKQEAgLTMsNyArMyw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9weXBhL3Ry
b3ZlLWNsYXNzaWZpZXJzIgogTElDRU5TRSA9ICJBcGFjaGUtMi4wIgogTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vTElDRU5TRTttZDU9ODZkM2YzYTk1YzMyNGM5NDc5YmQ4OTg2OTY4ZjQzMjci
CiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI5MzFjYTk4NDFhNWU5Yzk0MDhiYzJhZTY3YjUwZDI4
YWNmODViZWY1NjIxOWI1Njg2MDg3NmRkMWYyZDAyNGRkIgorU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjZiNjBmNDlkNDBiYmQ4OTViYzYxZDhkYzQxNGZjMmYyMjg2ZDcwZWI3MmVkMjM1NDhkYjhjZjk0
ZjYyODA0Y2EiCiAKIFBZUElfUEFDS0FHRSA9ICJ0cm92ZV9jbGFzc2lmaWVycyIKIFVQU1RSRUFN
X0NIRUNLX1BZUElfUEFDS0FHRSA9ICIke1BZUElfUEFDS0FHRX0iCi0tIAoyLjQ3LjEKCg==

--===============8277241942545949545==--

