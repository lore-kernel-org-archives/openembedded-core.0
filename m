Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 696FBC64ECB
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:30:34 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.46765.1669908625785666644
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:30:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=m5AyuQLL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010184ce4f75ae-eda3bde2-8e63-49a3-bffe-296ddf0480de-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1669908625;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=r4tQVpLSxQ07JJcRk8iQsm/1ppBv9Tmy4pPh0sdEdPQ=;
	b=m5AyuQLLJIGOausnfAzWUyUpN6IEtTvHpokUE1plAWXbqfWnrVQGFFDIEr02NjxR
	EJvyK0InAoQ7Y/Ovv30KUEfBtEpOAm1BGUQnbwTlovM1HkZZL9wZd4fClU62ZdNgi4O
	LNzOs9D6x6qFtgpIQa64J/xpymFIP6TEfbcgH9fc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1669908625;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=r4tQVpLSxQ07JJcRk8iQsm/1ppBv9Tmy4pPh0sdEdPQ=;
	b=B8bU6tsKsBV5860KUDLSXDr8IT4AFPmTxMPKqskrUC4JiP4VwVlL/A7BqUhoN9Gn
	FF230VSbyygdSyLJ0lYErAwOghj0tNj1YvSU9BNGooQZmdEayYdqgNrOL9dYE1MiM5r
	joZrdJvSJp3WgBGx8T/c17MN8shGCoKUoIHB1/ak=
Content-Type: multipart/mixed; boundary="===============6415000753903936365=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxcrypt-compat: upgrading to 4.4.33 SUCCEEDED
Message-ID: <01010184ce4f75ae-eda3bde2-8e63-49a3-bffe-296ddf0480de-000000@us-west-2.amazonses.com>
Date: Thu, 1 Dec 2022 15:30:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:30:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174125

--===============6415000753903936365==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxcrypt-compat* to *4.4.33* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxcrypt-compat-upgrade-4.4.30-4.4.33.patch
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
--===============6415000753903936365==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libxcrypt-compat: PKGV changed from 4.4.30 [default] to 4.4.33 [default]
packages/core2-32-poky-linux/libxcrypt-compat: SRC_URI changed from "git://github.com/besser82/libxcrypt.git;branch=develop;protocol=https file://fix_cflags_handling.patch" to "git://github.com/besser82/libxcrypt.git;branch=master;protocol=https file://fix_cflags_handling.patch"
packages/core2-32-poky-linux/libxcrypt-compat: PV changed from "4.4.30" to "4.4.33"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-dbg: PKGV changed from 4.4.30 [default] to 4.4.33 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-dbg: PKGSIZE changed from 519976 to 521356 (+0%)
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-dbg: PV changed from "4.4.30" to "4.4.33"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-dev: PKGV changed from 4.4.30 [default] to 4.4.33 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-dev: PV changed from "4.4.30" to "4.4.33"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-doc: PKGV changed from 4.4.30 [default] to 4.4.33 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-doc: PV changed from "4.4.30" to "4.4.33"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-locale: PKGV changed from 4.4.30 [default] to 4.4.33 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-locale: PV changed from "4.4.30" to "4.4.33"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-src: PKGV changed from 4.4.30 [default] to 4.4.33 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-src: PKGSIZE changed from 751861 to 752348 (+0%)
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-src: PV changed from "4.4.30" to "4.4.33"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-staticdev: PKGV changed from 4.4.30 [default] to 4.4.33 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-staticdev: PV changed from "4.4.30" to "4.4.33"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat: PKGV changed from 4.4.30 [default] to 4.4.33 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat: PV changed from "4.4.30" to "4.4.33"

--===============6415000753903936365==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxcrypt-compat-upgrade-4.4.30-4.4.33.patch"

RnJvbSA0NTM5YjQzYjMzOGMyYzk5NDZmMzUwN2VlZjM4YzhiZWZjOTVlYWMzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBEZWMgMjAyMiAwNzo0MDowMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnhjcnlwdC1jb21wYXQ6IHVwZ3JhZGUgNC40LjMwIC0+IDQuNC4zMwoKLS0tCiAuLi57bGlieGNy
eXB0LWNvbXBhdF80LjQuMzAuYmIgPT4gbGlieGNyeXB0LWNvbXBhdF80LjQuMzMuYmJ9IHwgMAog
bWV0YS9yZWNpcGVzLWNvcmUvbGlieGNyeXB0L2xpYnhjcnlwdC5pbmMgICAgICAgICAgICAgICAg
ICAgICB8IDQgKysrLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS9saWJ4Y3J5cHQve2xpYnhjcnlwdC1jb21w
YXRfNC40LjMwLmJiID0+IGxpYnhjcnlwdC1jb21wYXRfNC40LjMzLmJifSAoMTAwJSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9saWJ4Y3J5cHQvbGlieGNyeXB0LWNvbXBhdF80LjQu
MzAuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS9saWJ4Y3J5cHQvbGlieGNyeXB0LWNvbXBhdF80LjQu
MzMuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3Jl
L2xpYnhjcnlwdC9saWJ4Y3J5cHQtY29tcGF0XzQuNC4zMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWNvcmUvbGlieGNyeXB0L2xpYnhjcnlwdC1jb21wYXRfNC40LjMzLmJiCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtY29yZS9saWJ4Y3J5cHQvbGlieGNyeXB0LmluYyBiL21ldGEvcmVjaXBl
cy1jb3JlL2xpYnhjcnlwdC9saWJ4Y3J5cHQuaW5jCmluZGV4IDJiZGVkY2JhNmQuLmZmMTU4NmY3
OTYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhjcnlwdC9saWJ4Y3J5cHQuaW5j
CisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhjcnlwdC9saWJ4Y3J5cHQuaW5jCkBAIC0xMCw3
ICsxMCw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0lORzttZDU9YzBhMzBl
MmIxNTAyYzU1YTdmMzdlNDEyY2Q2YzZhNGIgXAogaW5oZXJpdCBhdXRvdG9vbHMgcGtnY29uZmln
CiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9iZXNzZXI4Mi9saWJ4Y3J5cHQuZ2l0O2Jy
YW5jaD0ke1NSQ0JSQU5DSH07cHJvdG9jb2w9aHR0cHMiCi1TUkNSRVYgPSAiZmVlMjY4N2JhZDY2
ZTM1MWEzZGNjOTYzYTM0YWU4MDEyNTkyM2ZmOCIKK1NSQ1JFViA9ICJkN2ZlMWFjMDRjMzI2ZGJh
N2UwNDQwODY4ODg5ZDFkY2NiNDFhMTc1IgogU1JDQlJBTkNIID89ICJkZXZlbG9wIgogCiBTUkNf
VVJJICs9ICJmaWxlOi8vZml4X2NmbGFnc19oYW5kbGluZy5wYXRjaCIKQEAgLTMzLDMgKzMzLDUg
QEAgQVBJID0gIi0tZGlzYWJsZS1vYnNvbGV0ZS1hcGkiCiBFWFRSQV9PRUNPTkYgKz0gIiR7QVBJ
fSIKIAogQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgorCitTUkNCUkFOQ0ggPSAi
bWFzdGVyIgotLSAKMi4zMS4xCgo=

--===============6415000753903936365==--

