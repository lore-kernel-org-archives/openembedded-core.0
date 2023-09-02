Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12738CCF968
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:15 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.5732.1693650553873659308
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=V2BK2l+M;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=AW1XcdTH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018a557088b4-92b7f12b-7929-4d55-98a7-aecbc92bfbba-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650553;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dykf77VBAjfqfJlfVA0Sv3+BNAP2dX6O1rLBz/Nha5k=;
	b=V2BK2l+M7aC5PUd8LZDIwgHIxB3nmaA0EW3A0QQCQjx1M+qukN2+y9II6NZN1mVF
	bh6/CDM4+6mXzY9rnFUbiwviYGmmK8ZmFfkAmKDgyVrBy5zNXYy/a/V6QMghNl2O8CT
	ovGrrN3CVnDzX1tzTiB5Kc7jk0AGdr3OKiwri+l0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650553;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dykf77VBAjfqfJlfVA0Sv3+BNAP2dX6O1rLBz/Nha5k=;
	b=AW1XcdTHtuS4l+tKW3OiS/cjNRWyNvIKzdWnMYUfMOnk3852wbd0Tug0EyBO7GF6
	lX7JPNfC08Mub1qkbXKg2oMvxrFThvr4xkovH/tdazbwH7+5UrcN0Y2R9i42XRw8Qsa
	rIKSFy9ru3uPiv2eqnI5Vq2IAKAL+Z62vWe8ayEU=
Content-Type: multipart/mixed; boundary="===============7864712419475524549=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-libarchive-c: upgrading to 5.0 SUCCEEDED
Message-ID: <0101018a557088b4-92b7f12b-7929-4d55-98a7-aecbc92bfbba-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187076

--===============7864712419475524549==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-libarchive-c* to *5.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-libarchive-c-upgrade-4.0-5.0.patch
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
From 75efb348189b17c634dcf3c4307df3588e63cdcd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Sep 2023 15:19:50 +0000
Subject: [PATCH] python3-libarchive-c: upgrade 4.0 -> 5.0

---
 ...{python3-libarchive-c_4.0.bb => python3-libarchive-c_5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-libarchive-c_4.0.bb => python3-libarchive-c_5.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb b/meta/recipes-devtools/python/python3-libarchive-c_5.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-libarchive-c_4.0.bb
rename to meta/recipes-devtools/python/python3-libarchive-c_5.0.bb
index 3c6bc1e1ca..5ada76fbf4 100644
--- a/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb
+++ b/meta/recipes-devtools/python/python3-libarchive-c_5.0.bb
@@ -9,7 +9,7 @@ PYPI_PACKAGE = "libarchive-c"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "a5b41ade94ba58b198d778e68000f6b7de41da768de7140c984f71d7fa8416e5"
+SRC_URI[sha256sum] = "d673f56673d87ec740d1a328fa205cafad1d60f5daca4685594deb039d32b159"
 
 RDEPENDS:${PN} += "\
   libarchive \
-- 
2.39.2


--===============7864712419475524549==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-libarchive-c: SRC_URI changed from "https://files.pythonhosted.org/packages/source/l/libarchive-c/libarchive-c-4.0.tar.gz;downloadfilename=libarchive-c-4.0.tar.gz" to "https://files.pythonhosted.org/packages/source/l/libarchive-c/libarchive-c-5.0.tar.gz;downloadfilename=libarchive-c-5.0.tar.gz"
packages/core2-32-poky-linux/python3-libarchive-c: PKGV changed from 4.0 [default] to 5.0 [default]
packages/core2-32-poky-linux/python3-libarchive-c: PV changed from "4.0" to "5.0"
packages/core2-32-poky-linux/python3-libarchive-c/python3-libarchive-c-dbg: PKGV changed from 4.0 [default] to 5.0 [default]
packages/core2-32-poky-linux/python3-libarchive-c/python3-libarchive-c-dbg: PV changed from "4.0" to "5.0"
packages/core2-32-poky-linux/python3-libarchive-c/python3-libarchive-c-dev: PKGV changed from 4.0 [default] to 5.0 [default]
packages/core2-32-poky-linux/python3-libarchive-c/python3-libarchive-c-dev: PV changed from "4.0" to "5.0"
packages/core2-32-poky-linux/python3-libarchive-c/python3-libarchive-c-doc: PKGV changed from 4.0 [default] to 5.0 [default]
packages/core2-32-poky-linux/python3-libarchive-c/python3-libarchive-c-doc: PV changed from "4.0" to "5.0"
packages/core2-32-poky-linux/python3-libarchive-c/python3-libarchive-c-locale: PKGV changed from 4.0 [default] to 5.0 [default]
packages/core2-32-poky-linux/python3-libarchive-c/python3-libarchive-c-locale: PV changed from "4.0" to "5.0"
packages/core2-32-poky-linux/python3-libarchive-c/python3-libarchive-c-src: PKGV changed from 4.0 [default] to 5.0 [default]
packages/core2-32-poky-linux/python3-libarchive-c/python3-libarchive-c-src: PV changed from "4.0" to "5.0"
packages/core2-32-poky-linux/python3-libarchive-c/python3-libarchive-c-staticdev: PKGV changed from 4.0 [default] to 5.0 [default]
packages/core2-32-poky-linux/python3-libarchive-c/python3-libarchive-c-staticdev: PV changed from "4.0" to "5.0"
packages/core2-32-poky-linux/python3-libarchive-c/python3-libarchive-c: PKGV changed from 4.0 [default] to 5.0 [default]
packages/core2-32-poky-linux/python3-libarchive-c/python3-libarchive-c: PKGSIZE changed from 120595 to 126818 (+5%)
packages/core2-32-poky-linux/python3-libarchive-c/python3-libarchive-c: PV changed from "4.0" to "5.0"
Changes to packages/core2-32-poky-linux/python3-libarchive-c (sysroot):
  /usr/lib/python3.11/site-packages/libarchive_c-4.0.dist-info moved to /usr/lib/python3.11/site-packages/libarchive_c-5.0.dist-info

--===============7864712419475524549==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-libarchive-c-upgrade-4.0-5.0.patch"

RnJvbSA3NWVmYjM0ODE4OWIxN2M2MzRkY2YzYzQzMDdkZjM1ODhlNjNjZGNkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBTZXAgMjAyMyAxNToxOTo1MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbGliYXJjaGl2ZS1jOiB1cGdyYWRlIDQuMCAtPiA1LjAKCi0tLQogLi4ue3B5dGhvbjMt
bGliYXJjaGl2ZS1jXzQuMC5iYiA9PiBweXRob24zLWxpYmFyY2hpdmUtY181LjAuYmJ9IHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1saWJhcmNoaXZlLWNfNC4wLmJi
ID0+IHB5dGhvbjMtbGliYXJjaGl2ZS1jXzUuMC5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbGliYXJjaGl2ZS1jXzQuMC5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1saWJhcmNoaXZlLWNfNS4wLmJiCnNp
bWlsYXJpdHkgaW5kZXggODUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1saWJhcmNoaXZlLWNfNC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtbGliYXJjaGl2ZS1jXzUuMC5iYgppbmRleCAzYzZiYzFlMWNh
Li41YWRhNzZmYmY0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtbGliYXJjaGl2ZS1jXzQuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtbGliYXJjaGl2ZS1jXzUuMC5iYgpAQCAtOSw3ICs5LDcgQEAgUFlQSV9QQUNL
QUdFID0gImxpYmFyY2hpdmUtYyIKIAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICJhNWI0MWFkZTk0YmE1OGIxOThkNzc4ZTY4MDAwZjZiN2RlNDFkYTc2
OGRlNzE0MGM5ODRmNzFkN2ZhODQxNmU1IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImQ2NzNmNTY2
NzNkODdlYzc0MGQxYTMyOGZhMjA1Y2FmYWQxZDYwZjVkYWNhNDY4NTU5NGRlYjAzOWQzMmIxNTki
CiAKIFJERVBFTkRTOiR7UE59ICs9ICJcCiAgIGxpYmFyY2hpdmUgXAotLSAKMi4zOS4yCgo=

--===============7864712419475524549==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-libarchive-c (sysroot):
  /usr/lib/python3.11/site-packages/libarchive_c-4.0.dist-info moved to /usr/lib/python3.11/site-packages/libarchive_c-5.0.dist-info

--===============7864712419475524549==--

