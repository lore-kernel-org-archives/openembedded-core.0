Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5501ECAA40
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:46 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.7620.1685693431241538892
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=d6moAoxT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101887b2879d8-aa2ecf13-9231-424d-a547-a1dfc3678a26-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693430;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=o47DkIctOpFubc/N8gP9pz3iVsH1blIVjPD+j0IdAZA=;
	b=d6moAoxTlSROZWCuFKWciq1XwXJI5r8Ut9RFXzEduUmCKMuuAVnrIWxb1ci5Z4qO
	12iTHjAn24OxQ1Inz5wmPxVq6o7/asxjxLnnXJI21UH6U2X396+xLtVzrr/txH6lpDc
	UIwBdsikATg5syEveQSGdO65rInmpE3dysO0tGdU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693430;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=o47DkIctOpFubc/N8gP9pz3iVsH1blIVjPD+j0IdAZA=;
	b=I4wly88lVw9/E4GKU6T5fDEQoeitwm67I1ApXdAFQcm6hN4g9imlHlgi5nlsalh9
	vjKJxHSUd4wcFkMuiYOV4/Q0fpWckN6Thj8W3IGXkOBCT3s3vu2EfOj+iOFH0y0EUCR
	38qQLtsWShD03qWlah+0fycdlORJWouc4OW/BDQA=
Content-Type: multipart/mixed; boundary="===============8868541587647312037=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxcrypt-compat: upgrading to 4.4.34 SUCCEEDED
Message-ID: <010101887b2879d8-aa2ecf13-9231-424d-a547-a1dfc3678a26-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:30 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182157

--===============8868541587647312037==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxcrypt-compat* to *4.4.34* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxcrypt-compat-upgrade-4.4.33-4.4.34.patch
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
--===============8868541587647312037==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxcrypt-compat-upgrade-4.4.33-4.4.34.patch"

RnJvbSA2OWQ0YjQzZTliNDM1ZTJlYjZmMjFjMjA4NWFkMmZlY2RlOWRlODI1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAwODoxMToyNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnhjcnlwdC1jb21wYXQ6IHVwZ3JhZGUgNC40LjMzIC0+IDQuNC4zNAoKLS0tCiAuLi57bGlieGNy
eXB0LWNvbXBhdF80LjQuMzMuYmIgPT4gbGlieGNyeXB0LWNvbXBhdF80LjQuMzQuYmJ9IHwgMAog
bWV0YS9yZWNpcGVzLWNvcmUvbGlieGNyeXB0L2xpYnhjcnlwdC5pbmMgICAgICAgICAgICAgICAg
ICAgICB8IDQgKysrLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS9saWJ4Y3J5cHQve2xpYnhjcnlwdC1jb21w
YXRfNC40LjMzLmJiID0+IGxpYnhjcnlwdC1jb21wYXRfNC40LjM0LmJifSAoMTAwJSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9saWJ4Y3J5cHQvbGlieGNyeXB0LWNvbXBhdF80LjQu
MzMuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS9saWJ4Y3J5cHQvbGlieGNyeXB0LWNvbXBhdF80LjQu
MzQuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3Jl
L2xpYnhjcnlwdC9saWJ4Y3J5cHQtY29tcGF0XzQuNC4zMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWNvcmUvbGlieGNyeXB0L2xpYnhjcnlwdC1jb21wYXRfNC40LjM0LmJiCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtY29yZS9saWJ4Y3J5cHQvbGlieGNyeXB0LmluYyBiL21ldGEvcmVjaXBl
cy1jb3JlL2xpYnhjcnlwdC9saWJ4Y3J5cHQuaW5jCmluZGV4IDYxYjAzODEwNzYuLjliNmQyMDMx
NzggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhjcnlwdC9saWJ4Y3J5cHQuaW5j
CisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhjcnlwdC9saWJ4Y3J5cHQuaW5jCkBAIC0xMCw3
ICsxMCw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0lORzttZDU9YzBhMzBl
MmIxNTAyYzU1YTdmMzdlNDEyY2Q2YzZhNGIgXAogaW5oZXJpdCBhdXRvdG9vbHMgcGtnY29uZmln
CiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9iZXNzZXI4Mi9saWJ4Y3J5cHQuZ2l0O2Jy
YW5jaD0ke1NSQ0JSQU5DSH07cHJvdG9jb2w9aHR0cHMiCi1TUkNSRVYgPSAiZDdmZTFhYzA0YzMy
NmRiYTdlMDQ0MDg2ODg4OWQxZGNjYjQxYTE3NSIKK1NSQ1JFViA9ICJlODBjZmRlNTFiYjRmZTRi
Y2YyNzU4NTgxMGUwYjRlYTNkMWU0ZDdkIgogU1JDQlJBTkNIID89ICJkZXZlbG9wIgogCiBTUkNf
VVJJICs9ICJmaWxlOi8vZml4X2NmbGFnc19oYW5kbGluZy5wYXRjaCIKQEAgLTMzLDMgKzMzLDUg
QEAgQVBJID0gIi0tZGlzYWJsZS1vYnNvbGV0ZS1hcGkiCiBFWFRSQV9PRUNPTkYgKz0gIiR7QVBJ
fSIKIAogQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgorCitTUkNCUkFOQ0ggPSAi
bWFzdGVyIgotLSAKMi4zOS4yCgo=

--===============8868541587647312037==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libxcrypt-compat: PKGV changed from 4.4.33 [default] to 4.4.34 [default]
packages/core2-32-poky-linux/libxcrypt-compat: PV changed from "4.4.33" to "4.4.34"
packages/core2-32-poky-linux/libxcrypt-compat: SRC_URI changed from "git://github.com/besser82/libxcrypt.git;branch=develop;protocol=https file://fix_cflags_handling.patch" to "git://github.com/besser82/libxcrypt.git;branch=master;protocol=https file://fix_cflags_handling.patch"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-dbg: PKGV changed from 4.4.33 [default] to 4.4.34 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-dbg: PV changed from "4.4.33" to "4.4.34"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-dbg: PKGSIZE changed from 508464 to 510592 (+0%)
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-dev: PKGV changed from 4.4.33 [default] to 4.4.34 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-dev: PV changed from "4.4.33" to "4.4.34"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-doc: PKGV changed from 4.4.33 [default] to 4.4.34 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-doc: PV changed from "4.4.33" to "4.4.34"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-locale: PKGV changed from 4.4.33 [default] to 4.4.34 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-locale: PV changed from "4.4.33" to "4.4.34"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-src: PKGV changed from 4.4.33 [default] to 4.4.34 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-src: PV changed from "4.4.33" to "4.4.34"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-src: PKGSIZE changed from 752348 to 753579 (+0%)
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-staticdev: PKGV changed from 4.4.33 [default] to 4.4.34 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-staticdev: PV changed from "4.4.33" to "4.4.34"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat: PKGV changed from 4.4.33 [default] to 4.4.34 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat: PV changed from "4.4.33" to "4.4.34"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat: PKGSIZE changed from 218534 to 222630 (+2%)

--===============8868541587647312037==--

