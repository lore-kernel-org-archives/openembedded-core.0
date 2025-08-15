Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25088CA0EEC
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:07:11 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.11409.1755263221155361270
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:07:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=zhmVagwc;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=iXPySyri;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010198add758e1-80f08d2c-44d6-4e79-a42b-c983c786f9a6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1755263228;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aoBZ7jnZkM2R6hKG1WEo4gNbAan5T8mp3FNck70Cc6Y=;
	b=zhmVagwcLopdvfz1PN8tQQGsJMZa+ffW1iDHCLqfTLK9hzw9YFCH+teHwTgKYg4z
	/+T29cNJ3t7SKVHDuY55eLsKLe58F5Wa7j7QXBpuVSL310GzzVA/CroyHVc9EzHqBlB
	EXaVKcBikYhmomX2DLH38/B2mq3gJD1ETFc2aiEM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1755263228;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aoBZ7jnZkM2R6hKG1WEo4gNbAan5T8mp3FNck70Cc6Y=;
	b=iXPySyri2+f+QxvVSHDDw8ZnMMQ1jVfVLowrtKVVL6al8tnKhV3WqnKf8Z4MHrfb
	f90E2Bs+i5QhWMdOWEurGdR3Jkt1XrQ7VRIw5w0PTxJPZE/uQrHH5aFhqDe70UwTmlO
	XM5GnC4qZd4mMqvXAv4FzyqnLRSDJpRbqKXNMwoY=
Content-Type: multipart/mixed; boundary="===============2940741197375364216=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-trove-classifiers: upgrading to 2025.8.6.13 SUCCEEDED
Message-ID: <01010198add758e1-80f08d2c-44d6-4e79-a42b-c983c786f9a6-000000@us-west-2.amazonses.com>
Date: Fri, 15 Aug 2025 13:07:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 13:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221920

--===============2940741197375364216==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-trove-classifiers* to *2025.8.6.13* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-trove-classifiers-upgrade-2025.5.9.12-2025.8.patch
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
From 006caa215d5d8eefb15b892b37e1b80fbda7b4c2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Aug 2025 09:32:21 +0000
Subject: [PATCH] python3-trove-classifiers: upgrade 2025.5.9.12 -> 2025.8.6.13

---
 ..._2025.5.9.12.bb => python3-trove-classifiers_2025.8.6.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2025.5.9.12.bb => python3-trove-classifiers_2025.8.6.13.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2025.5.9.12.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2025.8.6.13.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2025.5.9.12.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2025.8.6.13.bb
index 68b09537bc..dfeb803669 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2025.5.9.12.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2025.8.6.13.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "7ca7c8a7a76e2cd314468c677c69d12cc2357711fcab4a60f87994c1589e5cb5"
+SRC_URI[sha256sum] = "5a0abad839d2ed810f213ab133d555d267124ddea29f1d8a50d6eca12a50ae6e"
 
 PYPI_PACKAGE = "trove_classifiers"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.47.1


--===============2940741197375364216==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info moved to /usr/lib/python3.13/site-packages/trove_classifiers-2025.8.6.13.dist-info
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info moved to /usr/lib/python3.13/site-packages/trove_classifiers-2025.8.6.13.dist-info

--===============2940741197375364216==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-trove-classifiers: PKGV changed from 2025.5.9.12 [default] to 2025.8.6.13 [default]
packages/core2-64-poky-linux/python3-trove-classifiers: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2025.5.9.12.tar.gz;downloadfilename=trove_classifiers-2025.5.9.12.tar.gz" to "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2025.8.6.13.tar.gz;downloadfilename=trove_classifiers-2025.8.6.13.tar.gz"
packages/core2-64-poky-linux/python3-trove-classifiers: PV changed from "2025.5.9.12" to "2025.8.6.13"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PKGV changed from 2025.5.9.12 [default] to 2025.8.6.13 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PV changed from "2025.5.9.12" to "2025.8.6.13"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PKGV changed from 2025.5.9.12 [default] to 2025.8.6.13 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PV changed from "2025.5.9.12" to "2025.8.6.13"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PKGV changed from 2025.5.9.12 [default] to 2025.8.6.13 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PV changed from "2025.5.9.12" to "2025.8.6.13"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PKGV changed from 2025.5.9.12 [default] to 2025.8.6.13 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PV changed from "2025.5.9.12" to "2025.8.6.13"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PKGV changed from 2025.5.9.12 [default] to 2025.8.6.13 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PV changed from "2025.5.9.12" to "2025.8.6.13"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PKGV changed from 2025.5.9.12 [default] to 2025.8.6.13 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PV changed from "2025.5.9.12" to "2025.8.6.13"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PKGV changed from 2025.5.9.12 [default] to 2025.8.6.13 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PV changed from "2025.5.9.12" to "2025.8.6.13"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGV changed from 2025.5.9.12 [default] to 2025.8.6.13 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGSIZE changed from 95240 to 95328 (+0%)
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PV changed from "2025.5.9.12" to "2025.8.6.13"
Changes to packages/core2-64-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info moved to /usr/lib/python3.13/site-packages/trove_classifiers-2025.8.6.13.dist-info
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info moved to /usr/lib/python3.13/site-packages/trove_classifiers-2025.8.6.13.dist-info

--===============2940741197375364216==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-trove-classifiers-upgrade-2025.5.9.12-2025.8.patch"

RnJvbSAwMDZjYWEyMTVkNWQ4ZWVmYjE1Yjg5MmIzN2UxYjgwZmJkYTdiNGMyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgQXVnIDIwMjUgMDk6MzI6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzOiB1cGdyYWRlIDIwMjUuNS45LjEyIC0+IDIwMjUuOC42
LjEzCgotLS0KIC4uLl8yMDI1LjUuOS4xMi5iYiA9PiBweXRob24zLXRyb3ZlLWNsYXNzaWZpZXJz
XzIwMjUuOC42LjEzLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhv
bjMtdHJvdmUtY2xhc3NpZmllcnNfMjAyNS41LjkuMTIuYmIgPT4gcHl0aG9uMy10cm92ZS1jbGFz
c2lmaWVyc18yMDI1LjguNi4xMy5iYn0gKDgzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHJvdmUtY2xhc3NpZmllcnNfMjAyNS41LjkuMTIuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHJvdmUtY2xhc3NpZmllcnNf
MjAyNS44LjYuMTMuYmIKc2ltaWxhcml0eSBpbmRleCA4MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjUuNS45LjEy
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHJvdmUt
Y2xhc3NpZmllcnNfMjAyNS44LjYuMTMuYmIKaW5kZXggNjhiMDk1MzdiYy4uZGZlYjgwMzY2OSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRyb3ZlLWNs
YXNzaWZpZXJzXzIwMjUuNS45LjEyLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI1LjguNi4xMy5iYgpAQCAtMyw3ICszLDcg
QEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL3B5cGEvdHJvdmUtY2xhc3NpZmllcnMi
CiBMSUNFTlNFID0gIkFwYWNoZS0yLjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNF
TlNFO21kNT04NmQzZjNhOTVjMzI0Yzk0NzliZDg5ODY5NjhmNDMyNyIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjdjYTdjOGE3YTc2ZTJjZDMxNDQ2OGM2NzdjNjlkMTJjYzIzNTc3MTFmY2FiNGE2
MGY4Nzk5NGMxNTg5ZTVjYjUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNWEwYWJhZDgzOWQyZWQ4
MTBmMjEzYWIxMzNkNTU1ZDI2NzEyNGRkZWEyOWYxZDhhNTBkNmVjYTEyYTUwYWU2ZSIKIAogUFlQ
SV9QQUNLQUdFID0gInRyb3ZlX2NsYXNzaWZpZXJzIgogVVBTVFJFQU1fQ0hFQ0tfUFlQSV9QQUNL
QUdFID0gIiR7UFlQSV9QQUNLQUdFfSIKLS0gCjIuNDcuMQoK

--===============2940741197375364216==--

