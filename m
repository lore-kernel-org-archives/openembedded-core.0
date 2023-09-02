Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0FDCCCF97E
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:25 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.5694.1693650556534486766
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=AvGzcqZH;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=d0Pa5lqE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018a5570942b-7c33883c-cccc-4e03-b5cf-8be49f7c3287-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650556;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gbha0/2kphu9oCAGjd7P5qkCOVju2cv0B0hFDzPF8wg=;
	b=AvGzcqZHYWUbSBMZlirwdzAGf8m09ILdJdMm0ASUaaZrx9g67mvpraKMloDwzzeu
	w2ZS2rEbc09CUJUh1Ov5N9W7xiuo5C+TdhIbVzxw7X7yi3RrTzAD2YuU7TAK+BkBm/V
	jRMiq6+pb2p1Y1/DwEKJnMqlMw+aZsCIrNvbMAIk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650556;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gbha0/2kphu9oCAGjd7P5qkCOVju2cv0B0hFDzPF8wg=;
	b=d0Pa5lqEDuRRE7D5Q9vUAYH/7UrQZCSekoVhAw6HpbBhdQBehVfIlKg9YWB3imrf
	oiq6b87Z2heueHX26i41LC+/DkWhInNOVflf5aDI/x/albsfmxnkyISb5jAPxngMX7d
	eCk+Pq85ApBMzaR7XtOaGC1GT7cpYzCyscSCYf+E=
Content-Type: multipart/mixed; boundary="===============6853983755162033377=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dos2unix: upgrading to 7.5.1 SUCCEEDED
Message-ID: <0101018a5570942b-7c33883c-cccc-4e03-b5cf-8be49f7c3287-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187141

--===============6853983755162033377==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dos2unix* to *7.5.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dos2unix-upgrade-7.5.0-7.5.1.patch
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
From 5e24e7d30962b89b9b9bedd59337efe244bfd4e0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 2 Sep 2023 06:59:56 +0000
Subject: [PATCH] dos2unix: upgrade 7.5.0 -> 7.5.1

---
 .../dos2unix/{dos2unix_7.5.0.bb => dos2unix_7.5.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/dos2unix/{dos2unix_7.5.0.bb => dos2unix_7.5.1.bb} (95%)

diff --git a/meta/recipes-support/dos2unix/dos2unix_7.5.0.bb b/meta/recipes-support/dos2unix/dos2unix_7.5.1.bb
similarity index 95%
rename from meta/recipes-support/dos2unix/dos2unix_7.5.0.bb
rename to meta/recipes-support/dos2unix/dos2unix_7.5.1.bb
index 1ff1fc4f97..acf49f0483 100644
--- a/meta/recipes-support/dos2unix/dos2unix_7.5.0.bb
+++ b/meta/recipes-support/dos2unix/dos2unix_7.5.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=37f72246ce2aa2fce9482c10b1f2b502"
 SRC_URI = "git://git.code.sf.net/p/dos2unix/dos2unix;branch=master;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "dos2unix-(?P<pver>(\d+(\.\d+)+))"
 
-SRCREV = "d6613bbb175624f065de907ebcc94437f699c14e"
+SRCREV = "9675e7aea32653e1c10ef027eb55d89f3c48ec1f"
 
 S = "${WORKDIR}/git/dos2unix"
 
-- 
2.39.2


--===============6853983755162033377==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/dos2unix/dos2unix-dbg: PV changed from "7.5.0" to "7.5.1"
packages/core2-32-poky-linux/dos2unix/dos2unix-dbg: PKGV changed from 7.5.0 [default] to 7.5.1 [default]
packages/core2-32-poky-linux/dos2unix/dos2unix-dbg: PKGSIZE changed from 188412 to 186016 (-1%)
packages/core2-32-poky-linux/dos2unix/dos2unix-dev: PV changed from "7.5.0" to "7.5.1"
packages/core2-32-poky-linux/dos2unix/dos2unix-dev: PKGV changed from 7.5.0 [default] to 7.5.1 [default]
packages/core2-32-poky-linux/dos2unix/dos2unix-doc: PV changed from "7.5.0" to "7.5.1"
packages/core2-32-poky-linux/dos2unix/dos2unix-doc: PKGV changed from 7.5.0 [default] to 7.5.1 [default]
packages/core2-32-poky-linux/dos2unix/dos2unix-doc: PKGSIZE changed from 200021 to 200773 (+0%)
packages/core2-32-poky-linux/dos2unix/dos2unix-locale: PV changed from "7.5.0" to "7.5.1"
packages/core2-32-poky-linux/dos2unix/dos2unix-locale: PKGV changed from 7.5.0 [default] to 7.5.1 [default]
packages/core2-32-poky-linux/dos2unix/dos2unix-src: PV changed from "7.5.0" to "7.5.1"
packages/core2-32-poky-linux/dos2unix/dos2unix-src: PKGV changed from 7.5.0 [default] to 7.5.1 [default]
packages/core2-32-poky-linux/dos2unix/dos2unix-src: PKGSIZE changed from 200833 to 201035 (+0%)
packages/core2-32-poky-linux/dos2unix/dos2unix-staticdev: PV changed from "7.5.0" to "7.5.1"
packages/core2-32-poky-linux/dos2unix/dos2unix-staticdev: PKGV changed from 7.5.0 [default] to 7.5.1 [default]
packages/core2-32-poky-linux/dos2unix/dos2unix: PV changed from "7.5.0" to "7.5.1"
packages/core2-32-poky-linux/dos2unix/dos2unix: PKGV changed from 7.5.0 [default] to 7.5.1 [default]
packages/core2-32-poky-linux/dos2unix: PV changed from "7.5.0" to "7.5.1"
packages/core2-32-poky-linux/dos2unix: PKGV changed from 7.5.0 [default] to 7.5.1 [default]

--===============6853983755162033377==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dos2unix-upgrade-7.5.0-7.5.1.patch"

RnJvbSA1ZTI0ZTdkMzA5NjJiODliOWI5YmVkZDU5MzM3ZWZlMjQ0YmZkNGUwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMiBTZXAgMjAyMyAwNjo1OTo1NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRv
czJ1bml4OiB1cGdyYWRlIDcuNS4wIC0+IDcuNS4xCgotLS0KIC4uLi9kb3MydW5peC97ZG9zMnVu
aXhfNy41LjAuYmIgPT4gZG9zMnVuaXhfNy41LjEuYmJ9ICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L2RvczJ1bml4L3tkb3MydW5peF83LjUuMC5iYiA9PiBkb3MydW5peF83LjUu
MS5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kb3MydW5peC9k
b3MydW5peF83LjUuMC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RvczJ1bml4L2RvczJ1bml4
XzcuNS4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1z
dXBwb3J0L2RvczJ1bml4L2RvczJ1bml4XzcuNS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
c3VwcG9ydC9kb3MydW5peC9kb3MydW5peF83LjUuMS5iYgppbmRleCAxZmYxZmM0Zjk3Li5hY2Y0
OWYwNDgzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kb3MydW5peC9kb3MydW5p
eF83LjUuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kb3MydW5peC9kb3MydW5peF83
LjUuMS5iYgpAQCAtMTEsNyArMTEsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZ
SU5HLnR4dDttZDU9MzdmNzIyNDZjZTJhYTJmY2U5NDgyYzEwYjFmMmI1MDIiCiBTUkNfVVJJID0g
ImdpdDovL2dpdC5jb2RlLnNmLm5ldC9wL2RvczJ1bml4L2RvczJ1bml4O2JyYW5jaD1tYXN0ZXI7
cHJvdG9jb2w9aHR0cHMiCiBVUFNUUkVBTV9DSEVDS19HSVRUQUdSRUdFWCA9ICJkb3MydW5peC0o
P1A8cHZlcj4oXGQrKFwuXGQrKSspKSIKIAotU1JDUkVWID0gImQ2NjEzYmJiMTc1NjI0ZjA2NWRl
OTA3ZWJjYzk0NDM3ZjY5OWMxNGUiCitTUkNSRVYgPSAiOTY3NWU3YWVhMzI2NTNlMWMxMGVmMDI3
ZWI1NWQ4OWYzYzQ4ZWMxZiIKIAogUyA9ICIke1dPUktESVJ9L2dpdC9kb3MydW5peCIKIAotLSAK
Mi4zOS4yCgo=

--===============6853983755162033377==--

