Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B7F6C677C4
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:40 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web09.857.1667349632317853745
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=N2LK2fLP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018435c8520d-824e8045-4c55-48c7-87d3-6156b61c44fa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349631;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qIP1jW6dKGmnzw4cf5noxib2kVQromzJ5pJKJ/Do75o=;
	b=N2LK2fLPRMhDe4HF9ij0FdrkQZ2BMxZ6IzzdcC5ass5ciZusL+a+4RklXvkXrK4u
	J9XQbdqi1CyPTFeOmBNj2R4uSfLiwjNSsMrpF/AsveY8bA5FkYaZUR+DPmr2YoahI6a
	OaoU7dEp3tpHq3mOHcph9b3g/PBfPlXJAwZ0AIIs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349631;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qIP1jW6dKGmnzw4cf5noxib2kVQromzJ5pJKJ/Do75o=;
	b=KLdX2ISTvszLKQdm0OZZOGa/263jTJ1iLqvjvZnXI4JaFAaUrCuMc9YSEGVGvbRz
	0pIuMeHxAyE9UG4v6SCmUiBhjthM9e/umxH9LiUPoeA1dP32tpyKdNwAzAJvCyGgYsJ
	Hp1/qi/K6q+yNxMW7k9vKk9xJSBKAZQdUE7NGY+I=
Content-Type: multipart/mixed; boundary="===============7066265304509812180=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxcrypt-compat: upgrading to 4.4.29 SUCCEEDED
Message-ID: <0101018435c8520d-824e8045-4c55-48c7-87d3-6156b61c44fa-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:31 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172403

--===============7066265304509812180==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxcrypt-compat* to *4.4.29* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxcrypt-compat-upgrade-4.4.28-4.4.29.patch
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
--===============7066265304509812180==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libxcrypt-compat: SRC_URI changed from "git://github.com/besser82/libxcrypt.git;branch=develop;protocol=https file://fix_cflags_handling.patch" to "git://github.com/besser82/libxcrypt.git;branch=master;protocol=https file://fix_cflags_handling.patch"
packages/core2-32-poky-linux/libxcrypt-compat: PV changed from "4.4.28" to "4.4.29"
packages/core2-32-poky-linux/libxcrypt-compat: PKGV changed from 4.4.28 [default] to 4.4.29 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-dbg: PV changed from "4.4.28" to "4.4.29"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-dbg: PKGV changed from 4.4.28 [default] to 4.4.29 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-dev: PV changed from "4.4.28" to "4.4.29"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-dev: PKGV changed from 4.4.28 [default] to 4.4.29 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-doc: PV changed from "4.4.28" to "4.4.29"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-doc: PKGV changed from 4.4.28 [default] to 4.4.29 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-locale: PV changed from "4.4.28" to "4.4.29"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-locale: PKGV changed from 4.4.28 [default] to 4.4.29 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-src: PV changed from "4.4.28" to "4.4.29"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-src: PKGV changed from 4.4.28 [default] to 4.4.29 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-staticdev: PV changed from "4.4.28" to "4.4.29"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-staticdev: PKGV changed from 4.4.28 [default] to 4.4.29 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat: PV changed from "4.4.28" to "4.4.29"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat: PKGV changed from 4.4.28 [default] to 4.4.29 [default]

--===============7066265304509812180==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxcrypt-compat-upgrade-4.4.28-4.4.29.patch"

RnJvbSBmZDNhZmI3YmExZTE3NTg2ZDI1MjA5NDQwZjhkNmE3M2Q5ZjA5NjdmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAwNzoxODoyMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnhjcnlwdC1jb21wYXQ6IHVwZ3JhZGUgNC40LjI4IC0+IDQuNC4yOQoKLS0tCiAuLi57bGlieGNy
eXB0LWNvbXBhdF80LjQuMjguYmIgPT4gbGlieGNyeXB0LWNvbXBhdF80LjQuMjkuYmJ9IHwgMAog
bWV0YS9yZWNpcGVzLWNvcmUvbGlieGNyeXB0L2xpYnhjcnlwdC5pbmMgICAgICAgICAgICAgICAg
ICAgICB8IDQgKysrLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS9saWJ4Y3J5cHQve2xpYnhjcnlwdC1jb21w
YXRfNC40LjI4LmJiID0+IGxpYnhjcnlwdC1jb21wYXRfNC40LjI5LmJifSAoMTAwJSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9saWJ4Y3J5cHQvbGlieGNyeXB0LWNvbXBhdF80LjQu
MjguYmIgYi9tZXRhL3JlY2lwZXMtY29yZS9saWJ4Y3J5cHQvbGlieGNyeXB0LWNvbXBhdF80LjQu
MjkuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3Jl
L2xpYnhjcnlwdC9saWJ4Y3J5cHQtY29tcGF0XzQuNC4yOC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWNvcmUvbGlieGNyeXB0L2xpYnhjcnlwdC1jb21wYXRfNC40LjI5LmJiCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtY29yZS9saWJ4Y3J5cHQvbGlieGNyeXB0LmluYyBiL21ldGEvcmVjaXBl
cy1jb3JlL2xpYnhjcnlwdC9saWJ4Y3J5cHQuaW5jCmluZGV4IDM5YmEyNjM2ZmYuLmY0MmExYzE2
YWEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhjcnlwdC9saWJ4Y3J5cHQuaW5j
CisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhjcnlwdC9saWJ4Y3J5cHQuaW5jCkBAIC0xMCw3
ICsxMCw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0lORzttZDU9YzBhMzBl
MmIxNTAyYzU1YTdmMzdlNDEyY2Q2YzZhNGIgXAogaW5oZXJpdCBhdXRvdG9vbHMgcGtnY29uZmln
CiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9iZXNzZXI4Mi9saWJ4Y3J5cHQuZ2l0O2Jy
YW5jaD0ke1NSQ0JSQU5DSH07cHJvdG9jb2w9aHR0cHMiCi1TUkNSRVYgPSAiNTBjZjJiNmRkNGZk
ZjA0MzA5NDQ1ZjJlZWM4ZGU3MDUxZDk1M2FiZiIKK1NSQ1JFViA9ICJlYmNkOGFmYjBiYWI0ZDZm
YjAxZmQxMzlmMjRiYmEwNzczNDNhNDEwIgogU1JDQlJBTkNIID89ICJkZXZlbG9wIgogCiBTUkNf
VVJJICs9ICJmaWxlOi8vZml4X2NmbGFnc19oYW5kbGluZy5wYXRjaCIKQEAgLTMzLDMgKzMzLDUg
QEAgQVBJID0gIi0tZGlzYWJsZS1vYnNvbGV0ZS1hcGkiCiBFWFRSQV9PRUNPTkYgKz0gIiR7QVBJ
fSIKIAogQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgorCitTUkNCUkFOQ0ggPSAi
bWFzdGVyIgotLSAKMi4zMS4xCgo=

--===============7066265304509812180==--

