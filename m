Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CA43C7113C
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 18:02:31 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.145826.1673805743388991396
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 10:02:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=CHdgJULo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010185b698c709-76aa01c0-0795-4cda-8859-52107ec258dc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1673805744;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=khpio+Mftn78D5jQxlcdRtsPRhaq1eLFuI3J1u1Ifs0=;
	b=CHdgJULonRomAK6pPuMGWh5jw0cj1MFFGRD3rZKwJz/6ltJSm4m8Jl3GI/mmNNhE
	BoyQ0qSe1cEjUbfIoma/mwMZ/EtEwDox6btYIdSy2dI8x2G27cE/4ugjz+iqOMxFJtu
	GS4MrUTNPISS5egsJaQFR64Q7cIzKLs6OhtRLTZ4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1673805744;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=khpio+Mftn78D5jQxlcdRtsPRhaq1eLFuI3J1u1Ifs0=;
	b=ARp67wdJl81LNmgD+xL23ofOhzNU3xNAeG9sDFs66rZzo+5yTvNiUOTvvRsFOKNU
	xrqdgOtm1Vm2wcch5BwmZb8QRvT+X7SPb2SkChiGJAqqwyZVgPtNdu50iy/pWNfUOYa
	Q6+WxHJpwCz8R9DqqCoeVUE+2oNdoC94Mr35t/bI=
Content-Type: multipart/mixed; boundary="===============6803567472763919267=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ed: upgrading to 1.19 SUCCEEDED
Message-ID: <01010185b698c709-76aa01c0-0795-4cda-8859-52107ec258dc-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jan 2023 18:02:23 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 18:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175926

--===============6803567472763919267==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ed* to *1.19* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ed-upgrade-1.18-1.19.patch
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
--===============6803567472763919267==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ed/ed-dbg: PKGSIZE changed from 130304 to 129076 (-1%)
packages/core2-32-poky-linux/ed/ed-dbg: PKGV changed from 1.18 [default] to 1.19 [default]
packages/core2-32-poky-linux/ed/ed-dbg: PV changed from "1.18" to "1.19"
packages/core2-32-poky-linux/ed/ed-dev: PKGV changed from 1.18 [default] to 1.19 [default]
packages/core2-32-poky-linux/ed/ed-dev: PV changed from "1.18" to "1.19"
packages/core2-32-poky-linux/ed/ed-doc: PKGSIZE changed from 70591 to 71650 (+2%)
packages/core2-32-poky-linux/ed/ed-doc: PKGV changed from 1.18 [default] to 1.19 [default]
packages/core2-32-poky-linux/ed/ed-doc: PV changed from "1.18" to "1.19"
packages/core2-32-poky-linux/ed/ed-locale: PKGV changed from 1.18 [default] to 1.19 [default]
packages/core2-32-poky-linux/ed/ed-locale: PV changed from "1.18" to "1.19"
packages/core2-32-poky-linux/ed/ed-src: PKGSIZE changed from 108062 to 107620 (-0%)
packages/core2-32-poky-linux/ed/ed-src: PKGV changed from 1.18 [default] to 1.19 [default]
packages/core2-32-poky-linux/ed/ed-src: PV changed from "1.18" to "1.19"
packages/core2-32-poky-linux/ed/ed-staticdev: PKGV changed from 1.18 [default] to 1.19 [default]
packages/core2-32-poky-linux/ed/ed-staticdev: PV changed from "1.18" to "1.19"
packages/core2-32-poky-linux/ed/ed: PKGSIZE changed from 54933 to 54945 (+0%)
packages/core2-32-poky-linux/ed/ed: PKGV changed from 1.18 [default] to 1.19 [default]
packages/core2-32-poky-linux/ed/ed: PV changed from "1.18" to "1.19"
packages/core2-32-poky-linux/ed: SRC_URI changed from "https://ftp.gnu.org/gnu/ed/ed-1.18.tar.lz" to "https://ftp.gnu.org/gnu/ed/ed-1.19.tar.lz"
packages/core2-32-poky-linux/ed: PKGV changed from 1.18 [default] to 1.19 [default]
packages/core2-32-poky-linux/ed: PV changed from "1.18" to "1.19"

--===============6803567472763919267==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ed-upgrade-1.18-1.19.patch"

RnJvbSA2MTcxZDQ5MTlhNTAxYzk5MTQ4MTIxODBjODAyYjQyNDhhOTY2YWM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSmFuIDIwMjMgMTM6NDE6MzcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
ZDogdXBncmFkZSAxLjE4IC0+IDEuMTkKCi0tLQogLi4uL2VkL3tlZF8xLjE4LmJiID0+IGVkXzEu
MTkuYmJ9ICAgICAgICAgICAgIHwgMzggKysrKysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5n
ZWQsIDM1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL2VkL3tlZF8xLjE4LmJiID0+IGVkXzEuMTkuYmJ9ICg0MiUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2VkL2VkXzEuMTguYmIgYi9tZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvZWQvZWRfMS4xOS5iYgpzaW1pbGFyaXR5IGluZGV4IDQyJQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvZWQvZWRfMS4xOC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL2VkL2VkXzEuMTkuYmIKaW5kZXggZTE1NDhkZjE1Zi4uNjMwZmIzOTIxMiAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2VkL2VkXzEuMTguYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL2VkL2VkXzEuMTkuYmIKQEAgLTEsMTEgKzEsNDMgQEAKKyMgRklYTUU6IHRo
ZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1
cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBv
bGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNF
IHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29t
bWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNl
bnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6
CisjCisjIC0tLSBlZC5oCisjICsrKyBlZC5oCisjIEBAIC0xLDcgKzEsNyBAQAorIyAgLyogR2xv
YmFsIGRlY2xhcmF0aW9ucyBmb3IgdGhlIGVkIGVkaXRvci4gICovCisjICAvKiBHTlUgZWQgLSBU
aGUgR05VIGxpbmUgZWRpdG9yLgorIyAtICAgQ29weXJpZ2h0IChDKSAxOTkzLCAxOTk0IEFuZHJl
dyBNb29yZSwgVGFsa2UgU3R1ZGlvCisjIC0gICBDb3B5cmlnaHQgKEMpIDIwMDYtMjAyMiBBbnRv
bmlvIERpYXogRGlhei4KKyMgKyAgIENvcHlyaWdodCAoQykgMTk5MywgMTk5NCBBbmRyZXcgTC4g
TW9vcmUsIFRhbGtlIFN0dWRpbworIyArICAgQ29weXJpZ2h0IChDKSAyMDA2LTIwMjMgQW50b25p
byBEaWF6IERpYXouCisjICAKKyMgICAgIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOiB5
b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5CisjICAgICBpdCB1bmRlciB0aGUg
dGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQor
IyAtLS0gbWFpbi5jCisjICsrKyBtYWluLmMKKyMgQEAgLTEsNSArMSw1IEBACisjICAvKiBHTlUg
ZWQgLSBUaGUgR05VIGxpbmUgZWRpdG9yLgorIyAtICAgQ29weXJpZ2h0IChDKSAyMDA2LTIwMjIg
QW50b25pbyBEaWF6IERpYXouCisjICsgICBDb3B5cmlnaHQgKEMpIDIwMDYtMjAyMyBBbnRvbmlv
IERpYXogRGlhei4KKyMgIAorIyAgICAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU6IHlv
dSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKKyMgICAgIGl0IHVuZGVyIHRoZSB0
ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5Cisj
IAorIworCiBTVU1NQVJZID0gIkxpbmUtb3JpZW50ZWQgdGV4dCBlZGl0b3IiCiBIT01FUEFHRSA9
ICJodHRwOi8vd3d3LmdudS5vcmcvc29mdHdhcmUvZWQvIgogREVTQ1JJUFRJT04gPSAiR05VIGVk
IGlzIGEgbGluZS1vcmllbnRlZCB0ZXh0IGVkaXRvci4gSXQgaXMgdXNlZCB0byBjcmVhdGUsIGRp
c3BsYXksIG1vZGlmeSBhbmQgb3RoZXJ3aXNlIG1hbmlwdWxhdGUgdGV4dCBmaWxlcywgYm90aCBp
bnRlcmFjdGl2ZWx5IGFuZCB2aWEgc2hlbGwgc2NyaXB0cy4gQSByZXN0cmljdGVkIHZlcnNpb24g
b2YgZWQsIHJlZCwgY2FuIG9ubHkgZWRpdCBmaWxlcyBpbiB0aGUgY3VycmVudCBkaXJlY3Rvcnkg
YW5kIGNhbm5vdCBleGVjdXRlIHNoZWxsIGNvbW1hbmRzLiIKIAogTElDRU5TRSA9ICJHUEwtMi4w
LW9ubHkiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT03NmQ2ZTMwMGZm
ZDhmYjlkMThiZDliMTM2YTliYmExMyBcCi0gICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9lZC5o
O2VuZGxpbmU9MjA7bWQ1PTZlNmE4MThiMDU5M2Y5MzdmYzYzYmEwOGQ1ZTMxNGJmIFwKLSAgICAg
ICAgICAgICAgICAgICAgZmlsZTovL21haW4uYztlbmRsaW5lPTE3O21kNT04NDE5YTA4YmIxMjkz
NmYzMjM4NGEwZDFjMGY5ZTc0YyBcCisgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9lZC5oO2Vu
ZGxpbmU9MjA7bWQ1PTUwNGE5MGE3OGIwNDU5NzJlMmZkMmYzZmM0MThjMTk1IFwKKyAgICAgICAg
ICAgICAgICAgICAgZmlsZTovL21haW4uYztlbmRsaW5lPTE3O21kNT1jZjlkMzIyYjBhYzQ0NDVj
YTIyOTljNjFlZTE3NTM2NSBcCiAgICAgICAgICAgICAgICAgICAgICIKIAogU0VDVElPTiA9ICJi
YXNlIgpAQCAtMTksNyArNTEsNyBAQCBiaW5kaXIgPSAiJHtiYXNlX2JpbmRpcn0iCiBTUkNfVVJJ
ID0gIiR7R05VX01JUlJPUn0vZWQvJHtCUH0udGFyLmx6IgogVVBTVFJFQU1fQ0hFQ0tfVVJJID0g
IiR7R05VX01JUlJPUn0vZWQvIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYWNhOGVmYWQ5ODAw
YzU4NzcyNGEyMGI5N2FhOGZjNDdlNmI1YTQ3ZGY4MTYwNmZlYWJhODMxYjA3NDQ2MmI0ZiIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICJjZTJmMmU1YzQyNDc5MGFhOTZkMDlkYWNiOTNkOWJiZmRjMGI3
ZWI2MjQ5YzljYjc1Mzg0NTJlOGVjNzdjZDQ4IgogCiBFWFRSQV9PRU1BS0UgPSAiLWUgTUFLRUZM
QUdTPSIKIAotLSAKMi4zNy4zCgo=

--===============6803567472763919267==--

