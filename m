Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB2CC7618A
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:24 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.29999.1675272853476625518
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=k7R1D0df;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101860e0b253a-37b1d433-2fea-4ed2-9f1a-001ce7ead66f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272857;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1XrMIL+hVxH9Od1ZENdFRi1t1MfppibmlUGqkp91I/g=;
	b=k7R1D0dfgiBuQuEx0JcjCl0QcVeI2LbaOTglJk0jkPdP8cgOdB/GLje9Cvv7xiL7
	q+qnglbJQ/leRLCXMN4XsQWiT7vR/2NSPI1RRIrNte2JNqYzMd/3+QyhuzSoYg++kfu
	gN2Ez9DcsToWoJpNl0C2MXCipVbuWDk3f0p0lzRI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272857;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1XrMIL+hVxH9Od1ZENdFRi1t1MfppibmlUGqkp91I/g=;
	b=B6PP9/0TYETnNKwY0wLiZSrzvEAc0LO2nQUfI3hal/69Sg55RsBPxbnKNKQEgwDm
	QGoVdwly3WaJG+cEZSDujOgy6Xiu9qyITmMoycdHRww8Sa8pG20p7o+hF1gVWX+k0I8
	QBP3bzqaUJvHu/U5HeRE2FaFP9uCNFdmWeN9WClE=
Content-Type: multipart/mixed; boundary="===============0472582191212473110=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libjpeg-turbo: upgrading to 2.1.5 SUCCEEDED
Message-ID: <010101860e0b253a-37b1d433-2fea-4ed2-9f1a-001ce7ead66f-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176620

--===============0472582191212473110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libjpeg-turbo* to *2.1.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libjpeg-turbo-upgrade-2.1.4-2.1.5.patch
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
--===============0472582191212473110==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libjpeg-turbo-upgrade-2.1.4-2.1.5.patch"

RnJvbSBmNDJkNTVlMDA2M2MwMjRjMmRhMzUxZmE2YTgxZTFlMzAxNzI2MzExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxNToxMDoyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmpwZWctdHVyYm86IHVwZ3JhZGUgMi4xLjQgLT4gMi4xLjUKCi0tLQogLi4uL2pwZWcve2xpYmpw
ZWctdHVyYm9fMi4xLjQuYmIgPT4gbGlianBlZy10dXJib18yLjEuNS5iYn0gICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL2pwZWcve2xpYmpwZWctdHVyYm9fMi4xLjQuYmIgPT4gbGlianBl
Zy10dXJib18yLjEuNS5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvanBlZy9saWJqcGVnLXR1cmJvXzIuMS40LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2pw
ZWcvbGlianBlZy10dXJib18yLjEuNS5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvanBlZy9saWJqcGVnLXR1cmJvXzIuMS40LmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvanBlZy9saWJqcGVnLXR1cmJvXzIuMS41LmJiCmlu
ZGV4IDE3MDhmYTk3ZjAuLjRkMjFjYTFlMWQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9qcGVnL2xpYmpwZWctdHVyYm9fMi4xLjQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL2pwZWcvbGlianBlZy10dXJib18yLjEuNS5iYgpAQCAtMTQsNyArMTQsNyBAQCBTUkNfVVJJ
ID0gIiR7U09VUkNFRk9SR0VfTUlSUk9SfS8ke0JQTn0vJHtCUE59LSR7UFZ9LnRhci5neiBcCiAg
ICAgICAgICAgIGZpbGU6Ly8wMDAxLWxpYmpwZWctdHVyYm8tZml4LXBhY2thZ2VfcWEtZXJyb3Iu
cGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJkM2VkMjZhMTEz
MWExMzY4NmRmY2E0OTM1ZTUyMGViN2M5MGFlNzZmYmM0NWQ5OGJiNTBhOGRjODYyMzAzNDJiIgor
U1JDX1VSSVtzaGEyNTZzdW1dID0gImJjMTJiYzlkY2U1NTMwMGM2YmY0MzQyYmMyMzNiY2MyNmJk
MzhiZjI4OWVlZGYxNDczNjBkNzMxYzY2OGRkYWYiCiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0
cDovL3NvdXJjZWZvcmdlLm5ldC9wcm9qZWN0cy9saWJqcGVnLXR1cmJvL2ZpbGVzLyIKIFVQU1RS
RUFNX0NIRUNLX1JFR0VYID0gIi9saWJqcGVnLXR1cmJvL2ZpbGVzLyg/UDxwdmVyPihcZCtbXC5c
LV9dKikrKS8iCiAKLS0gCjIuMzcuMwoK

--===============0472582191212473110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libjpeg-turbo/jpeg-tools: PKGV changed from 2.1.4 [default] to 2.1.5 [default]
packages/core2-32-poky-linux/libjpeg-turbo/jpeg-tools: PV changed from "2.1.4" to "2.1.5"
packages/core2-32-poky-linux/libjpeg-turbo: SRC_URI changed from "https://downloads.sourceforge.net/libjpeg-turbo/libjpeg-turbo-2.1.4.tar.gz file://0001-libjpeg-turbo-fix-package_qa-error.patch" to "https://downloads.sourceforge.net/libjpeg-turbo/libjpeg-turbo-2.1.5.tar.gz file://0001-libjpeg-turbo-fix-package_qa-error.patch"
packages/core2-32-poky-linux/libjpeg-turbo: PKGV changed from 2.1.4 [default] to 2.1.5 [default]
packages/core2-32-poky-linux/libjpeg-turbo: PV changed from "2.1.4" to "2.1.5"
packages/core2-32-poky-linux/libjpeg-turbo/libjpeg-turbo-dbg: PKGV changed from 2.1.4 [default] to 2.1.5 [default]
packages/core2-32-poky-linux/libjpeg-turbo/libjpeg-turbo-dbg: PKGSIZE changed from 2867588 to 2869100 (+0%)
packages/core2-32-poky-linux/libjpeg-turbo/libjpeg-turbo-dbg: PV changed from "2.1.4" to "2.1.5"
packages/core2-32-poky-linux/libjpeg-turbo/libjpeg-turbo-dev: PKGV changed from 2.1.4 [default] to 2.1.5 [default]
packages/core2-32-poky-linux/libjpeg-turbo/libjpeg-turbo-dev: PKGSIZE changed from 166738 to 167045 (+0%)
packages/core2-32-poky-linux/libjpeg-turbo/libjpeg-turbo-dev: PV changed from "2.1.4" to "2.1.5"
packages/core2-32-poky-linux/libjpeg-turbo/libjpeg-turbo-doc: PKGV changed from 2.1.4 [default] to 2.1.5 [default]
packages/core2-32-poky-linux/libjpeg-turbo/libjpeg-turbo-doc: PKGSIZE changed from 379401 to 379630 (+0%)
packages/core2-32-poky-linux/libjpeg-turbo/libjpeg-turbo-doc: PV changed from "2.1.4" to "2.1.5"
packages/core2-32-poky-linux/libjpeg-turbo/libjpeg-turbo-locale: PKGV changed from 2.1.4 [default] to 2.1.5 [default]
packages/core2-32-poky-linux/libjpeg-turbo/libjpeg-turbo-locale: PV changed from "2.1.4" to "2.1.5"
packages/core2-32-poky-linux/libjpeg-turbo/libjpeg-turbo-src: PKGV changed from 2.1.4 [default] to 2.1.5 [default]
packages/core2-32-poky-linux/libjpeg-turbo/libjpeg-turbo-src: PKGSIZE changed from 2138984 to 2141863 (+0%)
packages/core2-32-poky-linux/libjpeg-turbo/libjpeg-turbo-src: PV changed from "2.1.4" to "2.1.5"
packages/core2-32-poky-linux/libjpeg-turbo/libjpeg-turbo-staticdev: PKGV changed from 2.1.4 [default] to 2.1.5 [default]
packages/core2-32-poky-linux/libjpeg-turbo/libjpeg-turbo-staticdev: PV changed from "2.1.4" to "2.1.5"
packages/core2-32-poky-linux/libjpeg-turbo/libjpeg-turbo: PKGV changed from 2.1.4 [default] to 2.1.5 [default]
packages/core2-32-poky-linux/libjpeg-turbo/libjpeg-turbo: PKGSIZE changed from 619877 to 619917 (+0%)
packages/core2-32-poky-linux/libjpeg-turbo/libjpeg-turbo: PV changed from "2.1.4" to "2.1.5"
packages/core2-32-poky-linux/libjpeg-turbo/libturbojpeg: PKGV changed from 2.1.4 [default] to 2.1.5 [default]
packages/core2-32-poky-linux/libjpeg-turbo/libturbojpeg: PV changed from "2.1.4" to "2.1.5"

--===============0472582191212473110==--

