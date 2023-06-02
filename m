Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F8C0CCA46A
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:46 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.7628.1685693431869792775
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Tg9G+nfS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101887b287cbc-89b5bdcd-78d2-4b46-be2d-b90e588e77ac-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693431;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UoUlmaWklm47GGS8tDHHMXf+7+OdyMY0BKLi9QQkt9I=;
	b=Tg9G+nfS9MRAibH2Yrl/A3qqBC7rtx9F+Bef2mGUzFUVl/QgPi905ltuBIx03dy2
	rNPP4sJ6CA/8fX1zAS+KelwKaEXsowpt8EY6xg36bHmkHAq7NhHUK0sci/Zzix35VpC
	2kUiKDhqYb8CyFsrtAA0HT259HKQyssMkw6O7sw8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693431;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UoUlmaWklm47GGS8tDHHMXf+7+OdyMY0BKLi9QQkt9I=;
	b=GYQH1suPx8E48pnsE2NMI8K1uax91KBnKXhVxpEXB5YQU9HH+HluJy5Vn2NKTdMJ
	H8UnhL0Hb0rJKjx72R53ciGvhxoS//eXTh7NHPXKiu9qI9OYqWgwVA/sv73POOcFVXa
	rHNrFhYia9N4ZIKVwHpSDWFdQrIY/cHERwhfR2O4=
Content-Type: multipart/mixed; boundary="===============5464868990333699933=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ccache: upgrading to 4.8.1 SUCCEEDED
Message-ID: <010101887b287cbc-89b5bdcd-78d2-4b46-be2d-b90e588e77ac-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:30 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182170

--===============5464868990333699933==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ccache* to *4.8.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ccache-upgrade-4.8-4.8.1.patch
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
--===============5464868990333699933==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ccache-upgrade-4.8-4.8.1.patch"

RnJvbSBmODYyZWJkMjZkMzk5NmE3MGMyOTRhYTdjNjgyNTkzMjVjMDkxN2FlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAwOToyNjo0MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNj
YWNoZTogdXBncmFkZSA0LjggLT4gNC44LjEKCi0tLQogLi4uL2NjYWNoZS97Y2NhY2hlXzQuOC5i
YiA9PiBjY2FjaGVfNC44LjEuYmJ9IHwgMzMgKysrKysrKysrKysrKysrKystLQogMSBmaWxlIGNo
YW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2NjYWNoZS97Y2NhY2hlXzQuOC5iYiA9PiBjY2FjaGVfNC44LjEuYmJ9ICg0
MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NjYWNoZS9jY2FjaGVfNC44
LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NjYWNoZS9jY2FjaGVfNC44LjEuYmIKc2ltaWxh
cml0eSBpbmRleCA0MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NjYWNoZS9j
Y2FjaGVfNC44LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2NjYWNo
ZV80LjguMS5iYgppbmRleCA2Y2FkMGRkN2M2Li5iZjA0M2UyYmQzIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2NjYWNoZV80LjguYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2NjYWNoZS9jY2FjaGVfNC44LjEuYmIKQEAgLTEsMyArMSwzMiBAQAorIyBGSVhN
RTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0
b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4g
dGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJ
Q0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRo
ZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTog
J0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hh
bmdlczoKKyMKKyMgLS0tIExJQ0VOU0UuYWRvYworIyArKysgTElDRU5TRS5hZG9jCisjIEBAIC01
MTYsMTMgKzUxNiwxMyBAQAorIyAgPT09IHNyYy90aGlyZF9wYXJ0eS9odHRwbGliLioKKyMgIAor
IyAgY3BwLWh0dHBsaWIgLSBBIEMrKzExIGNyb3NzLXBsYXRmb3JtIEhUVFAvSFRUUFMgbGlicmFy
eS4gQ29waWVkIGZyb20gY3BwLWh0dHBsaWIKKyMgLXYwLjExLjEgZG93bmxvYWRlZCBmcm9tIGh0
dHBzOi8vZ2l0aHViLmNvbS95aGlyb3NlL2NwcC1odHRwbGliW2NwcC1odHRwbGliXS4gVGhlCisj
ICt2MC4xMi4zIGRvd25sb2FkZWQgZnJvbSBodHRwczovL2dpdGh1Yi5jb20veWhpcm9zZS9jcHAt
aHR0cGxpYltjcHAtaHR0cGxpYl0uIFRoZQorIyAgbGlicmFyeSBoYXMgdGhlIGZvbGxvd2luZyBs
aWNlbnNlOgorIyAgCisjICAtLS0tCisjICBUaGUgTUlUIExpY2Vuc2UgKE1JVCkKKyMgIAorIyAt
Q29weXJpZ2h0IChjKSAyMDIyIHloaXJvc2UKKyMgK0NvcHlyaWdodCAoYykgMjAyMyB5aGlyb3Nl
CisjICAKKyMgIFBlcm1pc3Npb24gaXMgaGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0
byBhbnkgcGVyc29uIG9idGFpbmluZyBhIGNvcHkKKyMgIG9mIHRoaXMgc29mdHdhcmUgYW5kIGFz
c29jaWF0ZWQgZG9jdW1lbnRhdGlvbiBmaWxlcyAodGhlICJTb2Z0d2FyZSIpLCB0byBkZWFsCisj
IAorIworCiBTVU1NQVJZID0gImEgZmFzdCBDL0MrKyBjb21waWxlciBjYWNoZSIKIERFU0NSSVBU
SU9OID0gImNjYWNoZSBpcyBhIGNvbXBpbGVyIGNhY2hlLiBJdCBzcGVlZHMgdXAgcmVjb21waWxh
dGlvbiBcCiBieSBjYWNoaW5nIHRoZSByZXN1bHQgb2YgcHJldmlvdXMgY29tcGlsYXRpb25zIGFu
ZCBkZXRlY3Rpbmcgd2hlbiB0aGUgXApAQCAtNywxNCArMzYsMTQgQEAgSE9NRVBBR0UgPSAiaHR0
cDovL2NjYWNoZS5zYW1iYS5vcmciCiBTRUNUSU9OID0gImRldmVsIgogCiBMSUNFTlNFID0gIkdQ
TC0zLjAtb3ItbGF0ZXIiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLmFkb2M7
bWQ1PTQzYTAyYjc0YzllYjczYTBiOTc4YWU1MDgyZjVmMWI2IgorTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vTElDRU5TRS5hZG9jO21kNT0xNjAxZDYyZDY4MjhmYmUxOWI2ZjZjMmQwMWZkZmY0
YyIKIAogREVQRU5EUyA9ICJ6c3RkIgogCiBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9k
b3dubG9hZC92JHtQVn0vJHtCUH0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEteHho
YXNoLmgtRml4LWJ1aWxkLXdpdGgtZ2NjLTEyLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VS
SVtzaGEyNTZzdW1dID0gImFjNGIwMTc0OGZkNTljZmUwN2UwNzBjMzQ0MzJiOTFiZGQwZmQ4NjQw
ZTFlNjUzYTgwYjAxZDZhNTIzMTg2YjAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiODY5OTAzYzE4
OTFiZWI4YmVlODdmMWVjOTRkOGEwZGFkMThjMmFkZDQwNzJjNDU2YWNiYzg1Y2RmYzIzY2E2MyIK
IAogaW5oZXJpdCBjbWFrZSBnaXRodWItcmVsZWFzZXMKIAotLSAKMi4zOS4yCgo=

--===============5464868990333699933==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ccache/ccache-dbg: PKGV changed from 4.8 [default] to 4.8.1 [default]
packages/core2-32-poky-linux/ccache/ccache-dbg: PV changed from "4.8" to "4.8.1"
packages/core2-32-poky-linux/ccache/ccache-dbg: PKGSIZE changed from 25315636 to 25574128 (+1%)
packages/core2-32-poky-linux/ccache/ccache-dev: PKGV changed from 4.8 [default] to 4.8.1 [default]
packages/core2-32-poky-linux/ccache/ccache-dev: PV changed from "4.8" to "4.8.1"
packages/core2-32-poky-linux/ccache/ccache-doc: PKGV changed from 4.8 [default] to 4.8.1 [default]
packages/core2-32-poky-linux/ccache/ccache-doc: PV changed from "4.8" to "4.8.1"
packages/core2-32-poky-linux/ccache/ccache-locale: PKGV changed from 4.8 [default] to 4.8.1 [default]
packages/core2-32-poky-linux/ccache/ccache-locale: PV changed from "4.8" to "4.8.1"
packages/core2-32-poky-linux/ccache/ccache-src: PKGV changed from 4.8 [default] to 4.8.1 [default]
packages/core2-32-poky-linux/ccache/ccache-src: PV changed from "4.8" to "4.8.1"
packages/core2-32-poky-linux/ccache/ccache-src: PKGSIZE changed from 1911250 to 1924171 (+1%)
packages/core2-32-poky-linux/ccache/ccache-staticdev: PKGV changed from 4.8 [default] to 4.8.1 [default]
packages/core2-32-poky-linux/ccache/ccache-staticdev: PV changed from "4.8" to "4.8.1"
packages/core2-32-poky-linux/ccache/ccache: PKGV changed from 4.8 [default] to 4.8.1 [default]
packages/core2-32-poky-linux/ccache/ccache: PV changed from "4.8" to "4.8.1"
packages/core2-32-poky-linux/ccache/ccache: PKGSIZE changed from 1685540 to 1697828 (+1%)
packages/core2-32-poky-linux/ccache: SRC_URI changed from "https://github.com/ccache/ccache/releases//download/v4.8/ccache-4.8.tar.gz file://0001-xxhash.h-Fix-build-with-gcc-12.patch" to "https://github.com/ccache/ccache/releases//download/v4.8.1/ccache-4.8.1.tar.gz file://0001-xxhash.h-Fix-build-with-gcc-12.patch"
packages/core2-32-poky-linux/ccache: PKGV changed from 4.8 [default] to 4.8.1 [default]
packages/core2-32-poky-linux/ccache: PV changed from "4.8" to "4.8.1"

--===============5464868990333699933==--

