Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D29BDC369DC
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:43 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.1812.1746113623390356142
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=RXgxb8wk;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=RX1Rrimc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101968c7b72e6-d8b17f31-4934-4d80-84f0-46c2516fb6ce-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113622;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GXYz8EfVB5ZNrxjDj+qPNNEedjK2KVN6BNhhyxD4efk=;
	b=RXgxb8wk80enSyK28BIuktT++jtGm/8A8zElyTAeLCfXaS1UdeLjWDLpcdqxNTRE
	QPQllXRunlLkb+KjFyRZtrXxp95HtJ5kJjHbDqtpUU0s1S33nleIQKsRqw0Q/h9m3gL
	6RC+zpzRTLr0tjQd9by9MWfoxOhqIUeSpznoJX0M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113622;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GXYz8EfVB5ZNrxjDj+qPNNEedjK2KVN6BNhhyxD4efk=;
	b=RX1RrimcZmwpCbh/8RdgIGedWEZOCVo1lvI0n8hDau2Kvt4bqz87AKigZw14kfDf
	Q/lvblHPHM3h/sGr8OXmhPWoq4dyWCr9jT5CjHVVq5mce2xilJ2N/m5wuAAKf0ubRcT
	AQ+guRyDlDclyba2JHCYjWcfkssQHawuwue8mns0=
Content-Type: multipart/mixed; boundary="===============7158787140487220660=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-trove-classifiers: upgrading to 2025.4.28.22 SUCCEEDED
Message-ID: <010101968c7b72e6-d8b17f31-4934-4d80-84f0-46c2516fb6ce-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215829

--===============7158787140487220660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-trove-classifiers* to *2025.4.28.22* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-trove-classifiers-upgrade-2025.3.19.19-2025..patch
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
From cbb2e6290b2fbadf198d7b6f0c8171786acbf65d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 09:33:39 +0000
Subject: [PATCH] python3-trove-classifiers: upgrade 2025.3.19.19 ->
 2025.4.28.22

---
 ...025.3.19.19.bb => python3-trove-classifiers_2025.4.28.22.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2025.3.19.19.bb => python3-trove-classifiers_2025.4.28.22.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2025.3.19.19.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2025.4.28.22.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2025.3.19.19.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2025.4.28.22.bb
index 39fb997e88..941d92202d 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2025.3.19.19.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2025.4.28.22.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "98e9d396fe908d5f43b7454fa4c43d17cd0fdadf046f45fb38a5e3af8d959ecd"
+SRC_URI[sha256sum] = "42bef4957a74fe7724b8310dafd4b23e0a71406a4812cf4dfd65e2ee34f1943d"
 
 PYPI_PACKAGE = "trove_classifiers"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.47.1


--===============7158787140487220660==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-trove-classifiers-upgrade-2025.3.19.19-2025..patch"

RnJvbSBjYmIyZTYyOTBiMmZiYWRmMTk4ZDdiNmYwYzgxNzE3ODZhY2JmNjVkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAwOTozMzozOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdHJvdmUtY2xhc3NpZmllcnM6IHVwZ3JhZGUgMjAyNS4zLjE5LjE5IC0+CiAyMDI1LjQu
MjguMjIKCi0tLQogLi4uMDI1LjMuMTkuMTkuYmIgPT4gcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVy
c18yMDI1LjQuMjguMjIuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0
aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI1LjMuMTkuMTkuYmIgPT4gcHl0aG9uMy10cm92ZS1j
bGFzc2lmaWVyc18yMDI1LjQuMjguMjIuYmJ9ICg4MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjUuMy4xOS4x
OS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lm
aWVyc18yMDI1LjQuMjguMjIuYmIKc2ltaWxhcml0eSBpbmRleCA4MyUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjUu
My4xOS4xOS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjUuNC4yOC4yMi5iYgppbmRleCAzOWZiOTk3ZTg4Li45NDFk
OTIyMDJkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
dHJvdmUtY2xhc3NpZmllcnNfMjAyNS4zLjE5LjE5LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI1LjQuMjguMjIuYmIKQEAg
LTMsNyArMyw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9weXBhL3Ryb3ZlLWNs
YXNzaWZpZXJzIgogTElDRU5TRSA9ICJBcGFjaGUtMi4wIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vTElDRU5TRTttZDU9ODZkM2YzYTk1YzMyNGM5NDc5YmQ4OTg2OTY4ZjQzMjciCiAKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICI5OGU5ZDM5NmZlOTA4ZDVmNDNiNzQ1NGZhNGM0M2QxN2NkMGZk
YWRmMDQ2ZjQ1ZmIzOGE1ZTNhZjhkOTU5ZWNkIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjQyYmVm
NDk1N2E3NGZlNzcyNGI4MzEwZGFmZDRiMjNlMGE3MTQwNmE0ODEyY2Y0ZGZkNjVlMmVlMzRmMTk0
M2QiCiAKIFBZUElfUEFDS0FHRSA9ICJ0cm92ZV9jbGFzc2lmaWVycyIKIFVQU1RSRUFNX0NIRUNL
X1BZUElfUEFDS0FHRSA9ICIke1BZUElfUEFDS0FHRX0iCi0tIAoyLjQ3LjEKCg==

--===============7158787140487220660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-trove-classifiers: PV changed from "2025.3.19.19" to "2025.4.28.22"
packages/core2-64-poky-linux/python3-trove-classifiers: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2025.3.19.19.tar.gz;downloadfilename=trove_classifiers-2025.3.19.19.tar.gz" to "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2025.4.28.22.tar.gz;downloadfilename=trove_classifiers-2025.4.28.22.tar.gz"
packages/core2-64-poky-linux/python3-trove-classifiers: PKGV changed from 2025.3.19.19 [default] to 2025.4.28.22 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PV changed from "2025.3.19.19" to "2025.4.28.22"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PKGV changed from 2025.3.19.19 [default] to 2025.4.28.22 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PV changed from "2025.3.19.19" to "2025.4.28.22"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PKGV changed from 2025.3.19.19 [default] to 2025.4.28.22 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PV changed from "2025.3.19.19" to "2025.4.28.22"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PKGV changed from 2025.3.19.19 [default] to 2025.4.28.22 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PV changed from "2025.3.19.19" to "2025.4.28.22"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PKGV changed from 2025.3.19.19 [default] to 2025.4.28.22 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PV changed from "2025.3.19.19" to "2025.4.28.22"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PKGV changed from 2025.3.19.19 [default] to 2025.4.28.22 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: FILELIST: added "/usr/lib/python3-trove-classifiers/ptest/tests/test_cli.py"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PKGSIZE changed from 4453 to 5504 (+24%)
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PV changed from "2025.3.19.19" to "2025.4.28.22"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PKGV changed from 2025.3.19.19 [default] to 2025.4.28.22 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PV changed from "2025.3.19.19" to "2025.4.28.22"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PKGV changed from 2025.3.19.19 [default] to 2025.4.28.22 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PV changed from "2025.3.19.19" to "2025.4.28.22"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGV changed from 2025.3.19.19 [default] to 2025.4.28.22 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: FILELIST: directory renamed /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/licenses -> /usr/lib/python3.13/site-packages/trove_classifiers-2025.4.28.22.dist-info/licenses, removed "/usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/top_level.txt /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/WHEEL /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/METADATA", added "/usr/lib/python3.13/site-packages/trove_classifiers-2025.4.28.22.dist-info/WHEEL /usr/bin/trove-classifiers /usr/lib/python3.13/site-packages/trove_classifiers-2025.4.28.22.dist-info/METADATA /usr/lib/python3.13/site-packages/trove_classifiers-2025.4.28.22.dist-info/top_level.txt /usr/lib/python3.13/site-packages/trove_classifiers-2025.4.28.22.dist-info/entry_points.txt"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGSIZE changed from 93568 to 94183 (+1%)
Changes to packages/core2-64-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info moved to /usr/lib/python3.13/site-packages/trove_classifiers-2025.4.28.22.dist-info
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.4.28.22.dist-info/entry_points.txt was added
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info moved to /usr/lib/python3.13/site-packages/trove_classifiers-2025.4.28.22.dist-info
  /usr/bin was added
  /usr/bin/trove-classifiers was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.4.28.22.dist-info/entry_points.txt was added

--===============7158787140487220660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PKGSIZE changed from 4453 to 5504 (+24%)
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: FILELIST: added "/usr/lib/python3-trove-classifiers/ptest/tests/test_cli.py"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: FILELIST: directory renamed /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/licenses -> /usr/lib/python3.13/site-packages/trove_classifiers-2025.4.28.22.dist-info/licenses, removed "/usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/WHEEL /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/top_level.txt /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/METADATA", added "/usr/lib/python3.13/site-packages/trove_classifiers-2025.4.28.22.dist-info/entry_points.txt /usr/lib/python3.13/site-packages/trove_classifiers-2025.4.28.22.dist-info/WHEEL /usr/lib/python3.13/site-packages/trove_classifiers-2025.4.28.22.dist-info/top_level.txt /usr/lib/python3.13/site-packages/trove_classifiers-2025.4.28.22.dist-info/METADATA /usr/bin/trove-classifiers"
Changes to packages/core2-64-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info moved to /usr/lib/python3.13/site-packages/trove_classifiers-2025.4.28.22.dist-info
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.4.28.22.dist-info/entry_points.txt was added
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info moved to /usr/lib/python3.13/site-packages/trove_classifiers-2025.4.28.22.dist-info
  /usr/bin was added
  /usr/bin/trove-classifiers was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.4.28.22.dist-info/entry_points.txt was added

--===============7158787140487220660==--

