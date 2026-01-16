Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 678A5D47CCD
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:25:52 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1477.1768526750391830173
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=QGW1Cvtr;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=go+hhyu5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019bc4689e33-c50bb449-bffb-4c3a-a3de-a040f4576517-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526749;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/N1Chla2A+mjDTgAWIuX/aH0mk2V5ysAr2EpwxZ8xx4=;
	b=QGW1CvtrB0YlCwXC7EpAL6nmagp2v4/UNMi5dN+5PMwutpiRAqcTCKT8L+tbcCMX
	lJ+37e2fU3S7pTzzOCqB1XD//KXJLwLEtboiEgsrBKdEMzCE3jds9h4Nw5Rk9xbz8ZE
	MRXK3AiYZhHuOnRDSPDDVQhXznEiFO2JPYXiKvX4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526749;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/N1Chla2A+mjDTgAWIuX/aH0mk2V5ysAr2EpwxZ8xx4=;
	b=go+hhyu5VqBqBqUfaz6/f954IBSCm32T3wacCv5cnyc1fAVwQPWxxWpLzt7rgThM
	w2U6z7ZDFL3Yn8vzBB8JZBuHAipNb5LnazyHckXeYiuNPKkuloSivrfwiR2w4Rf80jQ
	WqZeKSSx3XOZ/FeFQxj7wKet19JFX30HvPk4XMHY=
Content-Type: multipart/mixed; boundary="===============7354867957552319946=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-urllib3: upgrading to 2.6.3 SUCCEEDED
Message-ID: <0101019bc4689e33-c50bb449-bffb-4c3a-a3de-a040f4576517-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229475

--===============7354867957552319946==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-urllib3* to *2.6.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-urllib3-upgrade-2.6.2-2.6.3.patch
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
From c1b356c157afd1e7c17141c1fbf34445077bd086 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jan 2026 21:56:48 +0000
Subject: [PATCH] python3-urllib3: upgrade 2.6.2 -> 2.6.3

---
 .../{python3-urllib3_2.6.2.bb => python3-urllib3_2.6.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_2.6.2.bb => python3-urllib3_2.6.3.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_2.6.2.bb b/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-urllib3_2.6.2.bb
rename to meta/recipes-devtools/python/python3-urllib3_2.6.3.bb
index 3957818f6f..e63791a8f4 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.6.2.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/urllib3/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=52d273a3054ced561275d4d15260ecda"
 
-SRC_URI[sha256sum] = "016f9c98bb7e98085cb2b4b17b87d2c702975664e4f060c6532e64d1c1a5e797"
+SRC_URI[sha256sum] = "1b62b6884944a57dbe321509ab94fd4d3b307075e0c2eae991ac71ee15ad38ed"
 
 inherit pypi python_hatchling
 
-- 
2.47.1


--===============7354867957552319946==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-urllib3-upgrade-2.6.2-2.6.3.patch"

RnJvbSBjMWIzNTZjMTU3YWZkMWU3YzE3MTQxYzFmYmYzNDQ0NTA3N2JkMDg2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSmFuIDIwMjYgMjE6NTY6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXVybGxpYjM6IHVwZ3JhZGUgMi42LjIgLT4gMi42LjMKCi0tLQogLi4uL3tweXRob24z
LXVybGxpYjNfMi42LjIuYmIgPT4gcHl0aG9uMy11cmxsaWIzXzIuNi4zLmJifSAgICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy11cmxsaWIzXzIuNi4yLmJiID0+
IHB5dGhvbjMtdXJsbGliM18yLjYuMy5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJsbGliM18yLjYuMi5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cmxsaWIzXzIuNi4zLmJiCnNpbWlsYXJpdHkgaW5k
ZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11
cmxsaWIzXzIuNi4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtdXJsbGliM18yLjYuMy5iYgppbmRleCAzOTU3ODE4ZjZmLi5lNjM3OTFhOGY0IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJsbGliM18yLjYu
Mi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJsbGliM18y
LjYuMy5iYgpAQCAtMyw3ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL3Vy
bGxpYjMvdXJsbGliMyIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxl
Oi8vTElDRU5TRS50eHQ7bWQ1PTUyZDI3M2EzMDU0Y2VkNTYxMjc1ZDRkMTUyNjBlY2RhIgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiMDE2ZjljOThiYjdlOTgwODVjYjJiNGIxN2I4N2QyYzcwMjk3
NTY2NGU0ZjA2MGM2NTMyZTY0ZDFjMWE1ZTc5NyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIxYjYy
YjY4ODQ5NDRhNTdkYmUzMjE1MDlhYjk0ZmQ0ZDNiMzA3MDc1ZTBjMmVhZTk5MWFjNzFlZTE1YWQz
OGVkIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX2hhdGNobGluZwogCi0tIAoyLjQ3LjEKCg==

--===============7354867957552319946==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3: FILELIST: directory renamed /usr/lib/python3.13/site-packages/urllib3-2.6.2.dist-info -> /usr/lib/python3.13/site-packages/urllib3-2.6.3.dist-info, directory renamed /usr/lib/python3.13/site-packages/urllib3-2.6.2.dist-info/licenses -> /usr/lib/python3.13/site-packages/urllib3-2.6.3.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-urllib3 (sysroot):
  /usr/lib/python3.13/site-packages/urllib3-2.6.2.dist-info moved to /usr/lib/python3.13/site-packages/urllib3-2.6.3.dist-info

--===============7354867957552319946==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-urllib3: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/urllib3/urllib3-2.6.2.tar.gz;downloadfilename=urllib3-2.6.2.tar.gz" to "https://files.pythonhosted.org/packages/source/u/urllib3/urllib3-2.6.3.tar.gz;downloadfilename=urllib3-2.6.3.tar.gz"
packages/x86-64-v3-poky-linux/python3-urllib3: PV changed from "2.6.2" to "2.6.3"
packages/x86-64-v3-poky-linux/python3-urllib3: PKGV changed from 2.6.2 [default] to 2.6.3 [default]
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-dbg: PV changed from "2.6.2" to "2.6.3"
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-dbg: PKGV changed from 2.6.2 [default] to 2.6.3 [default]
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-dev: PV changed from "2.6.2" to "2.6.3"
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-dev: PKGV changed from 2.6.2 [default] to 2.6.3 [default]
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-doc: PV changed from "2.6.2" to "2.6.3"
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-doc: PKGV changed from 2.6.2 [default] to 2.6.3 [default]
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-locale: PV changed from "2.6.2" to "2.6.3"
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-locale: PKGV changed from 2.6.2 [default] to 2.6.3 [default]
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-src: PV changed from "2.6.2" to "2.6.3"
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-src: PKGV changed from 2.6.2 [default] to 2.6.3 [default]
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-staticdev: PV changed from "2.6.2" to "2.6.3"
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3-staticdev: PKGV changed from 2.6.2 [default] to 2.6.3 [default]
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3: PV changed from "2.6.2" to "2.6.3"
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3: PKGSIZE changed from 872200 to 874274 (+0%)
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3: PKGV changed from 2.6.2 [default] to 2.6.3 [default]
packages/x86-64-v3-poky-linux/python3-urllib3/python3-urllib3: FILELIST: directory renamed /usr/lib/python3.13/site-packages/urllib3-2.6.2.dist-info -> /usr/lib/python3.13/site-packages/urllib3-2.6.3.dist-info, directory renamed /usr/lib/python3.13/site-packages/urllib3-2.6.2.dist-info/licenses -> /usr/lib/python3.13/site-packages/urllib3-2.6.3.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-urllib3 (sysroot):
  /usr/lib/python3.13/site-packages/urllib3-2.6.2.dist-info moved to /usr/lib/python3.13/site-packages/urllib3-2.6.3.dist-info

--===============7354867957552319946==--

