Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01662CA9EAC
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:44 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.7534.1685693433057780540
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=NxpC0I89;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101887b2888bb-3ca1f3e8-a62b-4d0a-80b6-73835acdcfd7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693434;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=iXf/T0KOcqk+U3LMa3GAUG+1vlPl16YLQWcXW29o34U=;
	b=NxpC0I89aoknMTPB4j5b2P9x+wdU2pMfN6DCoL4NmwrbcDrZ/WjAu91MlGgx+QtR
	pLFYdpXJcx6sHnY3Up44wboZRR1Lpuw/W4CYXFn+UgPVPkjqHTpdP5PV4oPjQnt9E5c
	J72L4uG749WWeN8mKhFaz3u2UuIxSwp3XJtMsHq8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693434;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=iXf/T0KOcqk+U3LMa3GAUG+1vlPl16YLQWcXW29o34U=;
	b=Q0DyZF2yhyJ7GFAxIqHJ+mPm2sOPSp3LcGfMfpkckusqL0ocbX25B/7iADbe02hX
	4nHE0aX8bFZ6+Il9aLmH1ZmI/G6smIfZ5q4i286kqvwq4/U7rOwcAza0nsSu2Qtt4NN
	nBZNnioK9XUj6BmJvs5C5a0OFHkiw8x8nl07G+HA=
Content-Type: multipart/mixed; boundary="===============5363502870255452857=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wget: upgrading to 1.21.4 SUCCEEDED
Message-ID: <010101887b2888bb-3ca1f3e8-a62b-4d0a-80b6-73835acdcfd7-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182229

--===============5363502870255452857==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *wget* to *1.21.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wget-upgrade-1.21.3-1.21.4.patch
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
--===============5363502870255452857==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/wget: PACKAGES: added "wget-locale-ka"
packages/core2-32-poky-linux/wget/wget-locale-be: PKGSIZE changed from 23843 to 98110 (+311%)
packages/core2-32-poky-linux/wget/wget-locale-hu: PKGSIZE changed from 82226 to 90495 (+10%)
packages/core2-32-poky-linux/wget/wget-locale-id: PKGSIZE changed from 30193 to 61467 (+104%)

--===============5363502870255452857==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wget-upgrade-1.21.3-1.21.4.patch"

RnJvbSAyZTlmYjZlMTA5OWQ5YmRjZDFiYjdlOTg1ZTczMzRjNTQyYTg1NTMzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAyMTowNToxNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHdn
ZXQ6IHVwZ3JhZGUgMS4yMS4zIC0+IDEuMjEuNAoKLS0tCiBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
d2dldC93Z2V0LmluYyAgICAgICAgICAgfCAgMiArLQogLi4uL3dnZXQve3dnZXRfMS4yMS4zLmJi
ID0+IHdnZXRfMS4yMS40LmJifSAgIHwgMjQgKysrKysrKysrKysrKysrKysrLQogMiBmaWxlcyBj
aGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1leHRlbmRlZC93Z2V0L3t3Z2V0XzEuMjEuMy5iYiA9PiB3Z2V0XzEuMjEuNC5iYn0gKDEz
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvd2dldC93Z2V0LmluYyBiL21l
dGEvcmVjaXBlcy1leHRlbmRlZC93Z2V0L3dnZXQuaW5jCmluZGV4IGQzMTc1NmRiYzguLjUxOTI2
ZTcyOTYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC93Z2V0L3dnZXQuaW5jCisr
KyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC93Z2V0L3dnZXQuaW5jCkBAIC03LDcgKzcsNyBAQCBG
VFAgc2l0ZXMiCiBIT01FUEFHRSA9ICJodHRwczovL3d3dy5nbnUub3JnL3NvZnR3YXJlL3dnZXQv
IgogU0VDVElPTiA9ICJjb25zb2xlL25ldHdvcmsiCiBMSUNFTlNFID0gIkdQTC0zLjAtb25seSIK
LUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWM2Nzg5NTdiMGM4ZTk2NGFh
NmM3MGZkNzc2NDFhNzFlIgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9
NmY2NTAxMmQxZGFmOThjYjA5YjM4NmNmYjY4ZGYyNmIiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIGdl
dHRleHQgdGV4aW5mbyB1cGRhdGUtYWx0ZXJuYXRpdmVzIHBrZ2NvbmZpZwogCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvd2dldC93Z2V0XzEuMjEuMy5iYiBiL21ldGEvcmVjaXBl
cy1leHRlbmRlZC93Z2V0L3dnZXRfMS4yMS40LmJiCnNpbWlsYXJpdHkgaW5kZXggMTMlCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC93Z2V0L3dnZXRfMS4yMS4zLmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvd2dldC93Z2V0XzEuMjEuNC5iYgppbmRleCBmMTc2YTE1
NDZjLi43NDU1ZjdlMDhlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvd2dldC93
Z2V0XzEuMjEuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvd2dldC93Z2V0XzEuMjEu
NC5iYgpAQCAtMSw3ICsxLDI5IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1
ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dp
bmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2Ug
dGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBz
dW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5z
ZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5
ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gQ09QWUlORworIyAr
KysgQ09QWUlORworIyBAQCAtMSw3ICsxLDcgQEAKKyMgICAgICAgICAgICAgICAgICAgICAgR05V
IEdFTkVSQUwgUFVCTElDIExJQ0VOU0UKKyMgICAgICAgICAgICAgICAgICAgICAgICAgVmVyc2lv
biAzLCAyOSBKdW5lIDIwMDcKKyMgIAorIyAtIENvcHlyaWdodCAoQykgMjAwNyBGcmVlIFNvZnR3
YXJlIEZvdW5kYXRpb24sIEluYy4gPGh0dHBzOi8vZnNmLm9yZy8+CisjICsgQ29weXJpZ2h0IChD
KSAyMDA3LCAyMDIzIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLiA8aHR0cHM6Ly9mc2Yu
b3JnLz4KKyMgICBFdmVyeW9uZSBpcyBwZXJtaXR0ZWQgdG8gY29weSBhbmQgZGlzdHJpYnV0ZSB2
ZXJiYXRpbSBjb3BpZXMKKyMgICBvZiB0aGlzIGxpY2Vuc2UgZG9jdW1lbnQsIGJ1dCBjaGFuZ2lu
ZyBpdCBpcyBub3QgYWxsb3dlZC4KKyMgIAorIyAKKyMKKwogU1JDX1VSSSA9ICIke0dOVV9NSVJS
T1J9L3dnZXQvd2dldC0ke1BWfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8vMDAwMi1pbXBy
b3ZlLXJlcHJvZHVjaWJpbGl0eS5wYXRjaCBcCiAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiNTcyNmJiOGJjNWNhMGY2ZGM3MTEwZjY0MTZlNGJiNzAxOWUyZDJmZjViZjkzZDFj
YTJmZmNjNjY1NmYyMjBlNSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI4MTU0MmY1Y2VmYjhmYWFj
YzM5YmJiYzZjODJkZWQ4MGUzZTRhODg1MDVhZTcyZWE1MWRmMjc1MjViY2RlMDRjIgogCiByZXF1
aXJlIHdnZXQuaW5jCi0tIAoyLjM5LjIKCg==

--===============5363502870255452857==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/wget: PACKAGES: added "wget-locale-ka"
packages/core2-32-poky-linux/wget: SRC_URI changed from "https://ftp.gnu.org/gnu/wget/wget-1.21.3.tar.gz file://0002-improve-reproducibility.patch" to "https://ftp.gnu.org/gnu/wget/wget-1.21.4.tar.gz file://0002-improve-reproducibility.patch"
packages/core2-32-poky-linux/wget: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-dbg: PKGSIZE changed from 1368616 to 1380336 (+1%)
packages/core2-32-poky-linux/wget/wget-dbg: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-dbg: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-dev: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-dev: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-doc: PKGSIZE changed from 233669 to 233677 (+0%)
packages/core2-32-poky-linux/wget/wget-doc: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-doc: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-af: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-af: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-be: PKGSIZE changed from 23843 to 98110 (+311%)
packages/core2-32-poky-linux/wget/wget-locale-be: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-be: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-bg: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-bg: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-ca: PKGSIZE changed from 34697 to 34625 (-0%)
packages/core2-32-poky-linux/wget/wget-locale-ca: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-ca: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-cs: PKGSIZE changed from 87541 to 87863 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-cs: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-cs: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-da: PKGSIZE changed from 27195 to 27130 (-0%)
packages/core2-32-poky-linux/wget/wget-locale-da: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-da: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-de: PKGSIZE changed from 90321 to 90681 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-de: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-de: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-el: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-el: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-en-gb: PKGSIZE changed from 8365 to 8427 (+1%)
packages/core2-32-poky-linux/wget/wget-locale-en-gb: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-en-gb: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-eo: PKGSIZE changed from 80571 to 82274 (+2%)
packages/core2-32-poky-linux/wget/wget-locale-eo: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-eo: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-es: PKGSIZE changed from 84891 to 85775 (+1%)
packages/core2-32-poky-linux/wget/wget-locale-es: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-es: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-et: PKGSIZE changed from 79250 to 79536 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-et: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-et: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-eu: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-eu: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-fi: PKGSIZE changed from 71680 to 71623 (-0%)
packages/core2-32-poky-linux/wget/wget-locale-fi: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-fi: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-fr: PKGSIZE changed from 88506 to 88786 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-fr: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-fr: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-ga: PKGSIZE changed from 76717 to 76654 (-0%)
packages/core2-32-poky-linux/wget/wget-locale-ga: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-ga: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-gl: PKGSIZE changed from 24196 to 24131 (-0%)
packages/core2-32-poky-linux/wget/wget-locale-gl: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-gl: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-he: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-he: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-hr: PKGSIZE changed from 81728 to 82185 (+1%)
packages/core2-32-poky-linux/wget/wget-locale-hr: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-hr: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-hu: PKGSIZE changed from 82226 to 90495 (+10%)
packages/core2-32-poky-linux/wget/wget-locale-hu: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-hu: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-id: PKGSIZE changed from 30193 to 61467 (+104%)
packages/core2-32-poky-linux/wget/wget-locale-id: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-id: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-it: PKGSIZE changed from 86629 to 86569 (-0%)
packages/core2-32-poky-linux/wget/wget-locale-it: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-it: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-ja: PKGSIZE changed from 92018 to 92245 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-ja: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-ja: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-ko: PKGSIZE changed from 82621 to 82916 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-ko: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-ko: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-lt: PKGSIZE changed from 15711 to 15765 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-lt: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-lt: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-ms: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-ms: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-nb: PKGSIZE changed from 78832 to 79149 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-nb: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-nb: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-nl: PKGSIZE changed from 65087 to 65020 (-0%)
packages/core2-32-poky-linux/wget/wget-locale-nl: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-nl: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-pl: PKGSIZE changed from 85834 to 86113 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-pl: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-pl: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-pt-br: PKGSIZE changed from 85338 to 87209 (+2%)
packages/core2-32-poky-linux/wget/wget-locale-pt-br: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-pt-br: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-pt: PKGSIZE changed from 83372 to 83308 (-0%)
packages/core2-32-poky-linux/wget/wget-locale-pt: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-pt: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-ro: PKGSIZE changed from 84546 to 87795 (+4%)
packages/core2-32-poky-linux/wget/wget-locale-ro: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-ro: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-ru: PKGSIZE changed from 105554 to 105837 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-ru: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-ru: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-rw: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-rw: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-sk: PKGSIZE changed from 80943 to 81233 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-sk: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-sk: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-sl: PKGSIZE changed from 28068 to 28011 (-0%)
packages/core2-32-poky-linux/wget/wget-locale-sl: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-sl: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-sr: PKGSIZE changed from 105082 to 105410 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-sr: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-sr: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-sv: PKGSIZE changed from 83324 to 83640 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-sv: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-sv: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-tr: PKGSIZE changed from 73064 to 73002 (-0%)
packages/core2-32-poky-linux/wget/wget-locale-tr: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-tr: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-uk: PKGSIZE changed from 106329 to 106628 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-uk: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-uk: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-vi: PKGSIZE changed from 82728 to 90469 (+9%)
packages/core2-32-poky-linux/wget/wget-locale-vi: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-vi: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-zh-cn: PKGSIZE changed from 77661 to 79391 (+2%)
packages/core2-32-poky-linux/wget/wget-locale-zh-cn: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-zh-cn: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-locale-zh-tw: PKGSIZE changed from 80432 to 80753 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-zh-tw: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-locale-zh-tw: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-src: PKGSIZE changed from 2781944 to 2818203 (+1%)
packages/core2-32-poky-linux/wget/wget-src: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-src: FILELIST: directory renamed /usr/src/debug/wget/1.21.3-r0/src -> /usr/src/debug/wget/1.21.4-r0/src, directory renamed /usr/src/debug/wget/1.21.3-r0/lib/sys -> /usr/src/debug/wget/1.21.4-r0/lib/sys, directory renamed /usr/src/debug/wget/1.21.3-r0/lib/malloc -> /usr/src/debug/wget/1.21.4-r0/lib/malloc, removed "/usr/src/debug/wget/1.21.3-r0/lib/ialloc.h /usr/src/debug/wget/1.21.3-r0/lib/af_alg.h /usr/src/debug/wget/1.21.3-r0/lib/localcharset.c /usr/src/debug/wget/1.21.3-r0/lib/base32.h /usr/src/debug/wget/1.21.3-r0/lib/dirent.h /usr/src/debug/wget/1.21.3-r0/lib/mbchar.h /usr/src/debug/wget/1.21.3-r0/lib/mbiter.h /usr/src/debug/wget/1.21.3-r0/lib/base32.c /usr/src/debug/wget/1.21.3-r0/lib/fflush.c /usr/src/debug/wget/1.21.3-r0/lib/fseeko.c /usr/src/debug/wget/1.21.3-r0/lib/getopt.c /usr/src/debug/wget/1.21.3-r0/lib/mbchar.c /usr/src/debug/wget/1.21.3-r0/lib/fnmatch_loop.c /usr/src/debug/wget/1.21.3-r0/lib/idx.h /usr/src/debug/wget/1.21.3-r0/li
 b/localcharset.h /usr/src/debug/wget/1.21.3-r0/lib/memchr.c /usr/src/debug/wget/1.21.3-r0/lib/quotearg.c /usr/src/debug/wget/1.21.3-r0/lib/sha1.h /usr/src/debug/wget/1.21.3-r0/lib/strerror.c /usr/src/debug/wget/1.21.3-r0/lib/basename-lgpl.c /usr/src/debug/wget/1.21.3-r0/lib/c-strncasecmp.c /usr/src/debug/wget/1.21.3-r0/lib/quotearg.h /usr/src/debug/wget/1.21.3-r0/lib/c-strcasecmp.c /usr/src/debug/wget/1.21.3-r0/lib/basename-lgpl.h /usr/src/debug/wget/1.21.3-r0/lib/sha1.c /usr/src/debug/wget/1.21.3-r0/lib/regcomp.c /usr/src/debug/wget/1.21.3-r0/lib/sha256.h /usr/src/debug/wget/1.21.3-r0/lib/stdlib.h /usr/src/debug/wget/1.21.3-r0/lib/string.h /usr/src/debug/wget/1.21.3-r0/lib/tmpdir.h /usr/src/debug/wget/1.21.3-r0/lib/mbrtowc.c /usr/src/debug/wget/1.21.3-r0/lib/regexec.c /usr/src/debug/wget/1.21.3-r0/lib/xalloc.h /usr/src/debug/wget/1.21.3-r0/lib/xmalloc.c /usr/src/debug/wget/1.21.3-r0/lib/basename.c /usr/src/debug/wget/1.21.3-r0/lib/hard-locale.h /usr/src/debug/wget/1.21.3-r0/lib/exi
 tfail.h /usr/src/debug/wget/1.21.3-r0/lib/exitfail.c /usr/src/debug/wget/1.21.3-r0/lib/xalloc-die.c /usr/src/debug/wget/1.21.3-r0/lib/hard-locale.c /usr/src/debug/wget/1.21.3-r0/lib/sha1-stream.c /usr/src/debug/wget/1.21.3-r0/lib/md5.h /usr/src/debug/wget/1.21.3-r0/lib/fnmatch.h /usr/src/debug/wget/1.21.3-r0/lib/getopt-core.h /usr/src/debug/wget/1.21.3-r0/lib/xmemdup0.h /usr/src/debug/wget/1.21.3-r0/lib/sha256.c /usr/src/debug/wget/1.21.3-r0/lib/strtol.c /usr/src/debug/wget/1.21.3-r0/lib/fnmatch.c /usr/src/debug/wget/1.21.3-r0/lib/md5.c /usr/src/debug/wget/1.21.3-r0/lib/tmpdir.c /usr/src/debug/wget/1.21.3-r0/lib/c-strcase.h /usr/src/debug/wget/1.21.3-r0/lib/quote.h /usr/src/debug/wget/1.21.3-r0/lib/regex.h /usr/src/debug/wget/1.21.3-r0/lib/stdio.h /usr/src/debug/wget/1.21.3-r0/lib/wchar.h /usr/src/debug/wget/1.21.3-r0/lib/xmemdup0.c /usr/src/debug/wget/1.21.3-r0/lib/regex_internal.c /usr/src/debug/wget/1.21.3-r0/lib/fcntl.h /usr/src/debug/wget/1.21.3-r0/lib/dirname.h /usr/src/debug/
 wget/1.21.3-r0/lib/c-ctype.h /usr/src/debug/wget/1.21.3-r0/lib/regex_internal.h /usr/src/debug/wget/1.21.3-r0/lib/xstrndup.c /usr/src/debug/wget/1.21.3-r0/lib/getopt1.c /usr/src/debug/wget/1.21.3-r0/lib/setlocale_null.h /usr/src/debug/wget/1.21.3-r0/lib/getopt_int.h /usr/src/debug/wget/1.21.3-r0/lib/setlocale_null.c /usr/src/debug/wget/1.21.3-r0/lib/xstrndup.h /usr/src/debug/wget/1.21.3-r0/lib/fcntl.c /usr/src/debug/wget/1.21.3-r0/lib/fseek.c /usr/src/debug/wget/1.21.3-r0/lib/getopt-ext.h /usr/src/debug/wget/1.21.3-r0/lib/ioctl.c /usr/src/debug/wget/1.21.3-r0/lib/error.h /usr/src/debug/wget/1.21.3-r0/lib/c-strcaseeq.h", added "/usr/src/debug/wget/1.21.4-r0/lib/dirent.h /usr/src/debug/wget/1.21.4-r0/lib/af_alg.h /usr/src/debug/wget/1.21.4-r0/lib/base32.h /usr/src/debug/wget/1.21.4-r0/lib/ialloc.h /usr/src/debug/wget/1.21.4-r0/lib/mbchar.h /usr/src/debug/wget/1.21.4-r0/lib/mbiter.h /usr/src/debug/wget/1.21.4-r0/lib/sha256.h /usr/src/debug/wget/1.21.4-r0/lib/base32.c /usr/src/debug/wge
 t/1.21.4-r0/lib/fflush.c /usr/src/debug/wget/1.21.4-r0/lib/fseeko.c /usr/src/debug/wget/1.21.4-r0/lib/getopt.c /usr/src/debug/wget/1.21.4-r0/lib/mbchar.c /usr/src/debug/wget/1.21.4-r0/lib/memchr.c /usr/src/debug/wget/1.21.4-r0/lib/idx.h /usr/src/debug/wget/1.21.4-r0/lib/sha256.c /usr/src/debug/wget/1.21.4-r0/lib/strtol.c /usr/src/debug/wget/1.21.4-r0/lib/tmpdir.c /usr/src/debug/wget/1.21.4-r0/lib/basename-lgpl.c /usr/src/debug/wget/1.21.4-r0/lib/mbsrtowcs.c /usr/src/debug/wget/1.21.4-r0/lib/basename-lgpl.h /usr/src/debug/wget/1.21.4-r0/lib/stdlib.h /usr/src/debug/wget/1.21.4-r0/lib/string.h /usr/src/debug/wget/1.21.4-r0/lib/tmpdir.h /usr/src/debug/wget/1.21.4-r0/lib/regcomp.c /usr/src/debug/wget/1.21.4-r0/lib/xalloc.h /usr/src/debug/wget/1.21.4-r0/lib/basename.c /usr/src/debug/wget/1.21.4-r0/lib/exitfail.h /usr/src/debug/wget/1.21.4-r0/lib/exitfail.c /usr/src/debug/wget/1.21.4-r0/lib/regex_internal.c /usr/src/debug/wget/1.21.4-r0/lib/regex_internal.h /usr/src/debug/wget/1.21.4-r0/li
 b/getopt-ext.h /usr/src/debug/wget/1.21.4-r0/lib/c-strcaseeq.h /usr/src/debug/wget/1.21.4-r0/lib/mbsrtowcs-impl.h /usr/src/debug/wget/1.21.4-r0/lib/strerror.c /usr/src/debug/wget/1.21.4-r0/lib/c-strncasecmp.c /usr/src/debug/wget/1.21.4-r0/lib/mbrtowc.c /usr/src/debug/wget/1.21.4-r0/lib/regexec.c /usr/src/debug/wget/1.21.4-r0/lib/xmalloc.c /usr/src/debug/wget/1.21.4-r0/lib/wchar.h /usr/src/debug/wget/1.21.4-r0/lib/fcntl.h /usr/src/debug/wget/1.21.4-r0/lib/regex.h /usr/src/debug/wget/1.21.4-r0/lib/quote.h /usr/src/debug/wget/1.21.4-r0/lib/md5.h /usr/src/debug/wget/1.21.4-r0/lib/fnmatch.h /usr/src/debug/wget/1.21.4-r0/lib/getopt-core.h /usr/src/debug/wget/1.21.4-r0/lib/fnmatch.c /usr/src/debug/wget/1.21.4-r0/lib/md5.c /usr/src/debug/wget/1.21.4-r0/lib/mbsrtowcs-state.c /usr/src/debug/wget/1.21.4-r0/lib/xstrndup.c /usr/src/debug/wget/1.21.4-r0/lib/xstrndup.h /usr/src/debug/wget/1.21.4-r0/lib/quotearg.c /usr/src/debug/wget/1.21.4-r0/lib/sha1.h /usr/src/debug/wget/1.21.4-r0/lib/quotearg.h
  /usr/src/debug/wget/1.21.4-r0/lib/sha1.c /usr/src/debug/wget/1.21.4-r0/lib/xalloc-die.c /usr/src/debug/wget/1.21.4-r0/lib/sha1-stream.c /usr/src/debug/wget/1.21.4-r0/lib/xmemdup0.h /usr/src/debug/wget/1.21.4-r0/lib/c-strcase.h /usr/src/debug/wget/1.21.4-r0/lib/xmemdup0.c /usr/src/debug/wget/1.21.4-r0/lib/dirname.h /usr/src/debug/wget/1.21.4-r0/lib/c-ctype.h /usr/src/debug/wget/1.21.4-r0/lib/setlocale_null.h /usr/src/debug/wget/1.21.4-r0/lib/setlocale_null.c /usr/src/debug/wget/1.21.4-r0/lib/strnlen1.h /usr/src/debug/wget/1.21.4-r0/lib/strnlen1.c /usr/src/debug/wget/1.21.4-r0/lib/localcharset.c /usr/src/debug/wget/1.21.4-r0/lib/fnmatch_loop.c /usr/src/debug/wget/1.21.4-r0/lib/localcharset.h /usr/src/debug/wget/1.21.4-r0/lib/c-strcasecmp.c /usr/src/debug/wget/1.21.4-r0/lib/hard-locale.h /usr/src/debug/wget/1.21.4-r0/lib/hard-locale.c /usr/src/debug/wget/1.21.4-r0/lib/getopt1.c /usr/src/debug/wget/1.21.4-r0/lib/getopt_int.h /usr/src/debug/wget/1.21.4-r0/lib/btowc.c /usr/src/debug/wget
 /1.21.4-r0/lib/fcntl.c /usr/src/debug/wget/1.21.4-r0/lib/fopen.c /usr/src/debug/wget/1.21.4-r0/lib/fseek.c /usr/src/debug/wget/1.21.4-r0/lib/ioctl.c /usr/src/debug/wget/1.21.4-r0/lib/stdio.h"
packages/core2-32-poky-linux/wget/wget-src: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget-staticdev: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget-staticdev: PV changed from "1.21.3" to "1.21.4"
packages/core2-32-poky-linux/wget/wget: PKGV changed from 1.21.3 [default] to 1.21.4 [default]
packages/core2-32-poky-linux/wget/wget: PV changed from "1.21.3" to "1.21.4"

--===============5363502870255452857==--

