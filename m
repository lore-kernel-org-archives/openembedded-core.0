Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB1CAECAAA1
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 14:18:42 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web08.10737.1663251514875393645
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 07:18:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ZPhNH6M5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 010101834184039c-93e46bd3-911e-49e9-8134-0baaa168fd6e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1663251514;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qQ1iL/O0OQNRAt4lDpfqGHdUcFnISTr/ZfHCDMoWTkA=;
	b=ZPhNH6M5dHL8zsZXj6SZikdqkc5j4GxCDvMrGeeiLQTbG+uZ4mgzLeBT4NSfX9wv
	elpHUOd3PT2/LOIsQ/S7ws3bmmIzFAx2X92PDmoigg9YeB8laczgxeTTWZxs5xIqBVP
	lRe6MCYV6GY0HDP21TWKxgIAu9kRyiZSfAxPUkBU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1663251514;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qQ1iL/O0OQNRAt4lDpfqGHdUcFnISTr/ZfHCDMoWTkA=;
	b=UDGkCm2Q3Eq/qJHj+kcMkoqhHFbw4pE15HipXoJDg7lCH2EuZ7Nkz/ib/g88rDOM
	kbzJ95px91gIhRbM/H6jXNsGQ8OiKc/fjN6a5KI65+GJbIchigRXDnxwwUiTtMWPaQS
	LMtf6zTtvNo5lli2/uVZiLoVIApDYutUObzvAA6Y=
Content-Type: multipart/mixed; boundary="===============7746416108447614189=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] numactl: upgrading to 2.0.15 SUCCEEDED
Message-ID: 
 <010101834184039c-93e46bd3-911e-49e9-8134-0baaa168fd6e-000000@us-west-2.amazonses.com>
Date: Thu, 15 Sep 2022 14:18:34 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 14:18:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170767

--===============7746416108447614189==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *numactl* to *2.0.15* has Succeeded.

Next steps:
    - apply the patch: git am 0001-numactl-upgrade-2.0.14-2.0.15.patch
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
--===============7746416108447614189==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/numactl: PKGV changed from 2.0.14 [default] to 2.0.15 [default]
packages/core2-32-poky-linux/numactl: PV changed from "2.0.14" to "2.0.15"
packages/core2-32-poky-linux/numactl/numactl-dbg: PKGV changed from 2.0.14 [default] to 2.0.15 [default]
packages/core2-32-poky-linux/numactl/numactl-dbg: PV changed from "2.0.14" to "2.0.15"
packages/core2-32-poky-linux/numactl/numactl-dbg: PKGSIZE changed from 606980 to 625448 (+3%)
packages/core2-32-poky-linux/numactl/numactl-dev: PKGV changed from 2.0.14 [default] to 2.0.15 [default]
packages/core2-32-poky-linux/numactl/numactl-dev: PV changed from "2.0.14" to "2.0.15"
packages/core2-32-poky-linux/numactl/numactl-dev: PKGSIZE changed from 16486 to 17166 (+4%)
packages/core2-32-poky-linux/numactl/numactl-doc: PKGV changed from 2.0.14 [default] to 2.0.15 [default]
packages/core2-32-poky-linux/numactl/numactl-doc: PV changed from "2.0.14" to "2.0.15"
packages/core2-32-poky-linux/numactl/numactl-doc: PKGSIZE changed from 54177 to 56282 (+4%)
packages/core2-32-poky-linux/numactl/numactl-locale: PKGV changed from 2.0.14 [default] to 2.0.15 [default]
packages/core2-32-poky-linux/numactl/numactl-locale: PV changed from "2.0.14" to "2.0.15"
packages/core2-32-poky-linux/numactl/numactl-ptest: PKGV changed from 2.0.14 [default] to 2.0.15 [default]
packages/core2-32-poky-linux/numactl/numactl-ptest: PV changed from "2.0.14" to "2.0.15"
packages/core2-32-poky-linux/numactl/numactl-ptest: PKGSIZE changed from 244484 to 244823 (+0%)
packages/core2-32-poky-linux/numactl/numactl-src: PKGV changed from 2.0.14 [default] to 2.0.15 [default]
packages/core2-32-poky-linux/numactl/numactl-src: PV changed from "2.0.14" to "2.0.15"
packages/core2-32-poky-linux/numactl/numactl-src: PKGSIZE changed from 230943 to 237528 (+3%)
packages/core2-32-poky-linux/numactl/numactl-staticdev: PKGV changed from 2.0.14 [default] to 2.0.15 [default]
packages/core2-32-poky-linux/numactl/numactl-staticdev: PV changed from "2.0.14" to "2.0.15"
packages/core2-32-poky-linux/numactl/numactl: PKGV changed from 2.0.14 [default] to 2.0.15 [default]
packages/core2-32-poky-linux/numactl/numactl: PV changed from "2.0.14" to "2.0.15"
packages/core2-32-poky-linux/numactl/numactl: PKGSIZE changed from 204340 to 200436 (-2%)

--===============7746416108447614189==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-numactl-upgrade-2.0.14-2.0.15.patch"

RnJvbSBiZWRjNGQ3OTFjMTMyOTdjNTQ0NzllYTIyM2QxNTcyNWNhN2Y5NjRjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgU2VwIDIwMjIgMTM6NDU6NTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBu
dW1hY3RsOiB1cGdyYWRlIDIuMC4xNCAtPiAyLjAuMTUKCi0tLQogbWV0YS9yZWNpcGVzLXN1cHBv
cnQvbnVtYWN0bC9udW1hY3RsX2dpdC5iYiB8IDI1ICsrKysrKysrKysrKysrKysrKy0tLQogMSBm
aWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbnVtYWN0bC9udW1hY3RsX2dpdC5iYiBiL21ldGEvcmVj
aXBlcy1zdXBwb3J0L251bWFjdGwvbnVtYWN0bF9naXQuYmIKaW5kZXggOTM1NDdlYTIzOS4uNmYx
ZTBmOTFhNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbnVtYWN0bC9udW1hY3Rs
X2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9udW1hY3RsL251bWFjdGxfZ2l0LmJi
CkBAIC0xLDMgKzEsMjIgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBo
YXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBp
cyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0
LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1h
cml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVw
ZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJz
IHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBSRUFETUUubWQKKyMgKysr
IFJFQURNRS5tZAorIyBAQCAtMSw0ICsxLDQgQEAKKyMgLU90aGVyd2lzZSB5b3Ugd2lsbCBnZXQg
c3B1cmlvdXMgZmFpbHVyZXMgaW4gdGhlIG5vbi1zdHJpY3QgcG9saWNpZXMgKHByZWZlcmVkLAor
IyArT3RoZXJ3aXNlIHlvdSB3aWxsIGdldCBzcHVyaW91cyBmYWlsdXJlcyBpbiB0aGUgbm9uLXN0
cmljdCBwb2xpY2llcyAocHJlZmVycmVkLAorIyAgaW50ZXJsZWF2ZS4pCisjICAKKyMgIFNlZSB0
aGUgbWFucGFnZXMgW2BudW1hY3RsLjhgXShodHRwczovL2xpbnV4LmRpZS5uZXQvbWFuLzgvbnVt
YWN0bCkgYW5kCisjIAorIworCiBTVU1NQVJZID0gIkRldmVsb3BtZW50IHBhY2thZ2UgZm9yIGJ1
aWxkaW5nIEFwcGxpY2F0aW9ucyB0aGF0IHVzZSBudW1hIgogSE9NRVBBR0UgPSAiaHR0cDovL29z
cy5zZ2kuY29tL3Byb2plY3RzL2xpYm51bWEvIiAKIERFU0NSSVBUSU9OID0gIlNpbXBsZSBOVU1B
IHBvbGljeSBzdXBwb3J0LiBJdCBjb25zaXN0cyBvZiBhIG51bWFjdGwgcHJvZ3JhbSBcCkBAIC04
LDEwICsyNywxMCBAQCBTRUNUSU9OID0gImFwcHMiCiAKIGluaGVyaXQgYXV0b3Rvb2xzLWJyb2tl
bnNlcCBwdGVzdAogCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9SRUFETUUubWQ7YmVnaW5s
aW5lPTE5O2VuZGxpbmU9MzI7bWQ1PWY4ZmYyMzkxNjI0ZjI4ZTQ4MTI5OWYzZjY3N2IyMWJiIgor
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vUkVBRE1FLm1kO2JlZ2lubGluZT0xOTtlbmRsaW5l
PTMyO21kNT05ZjM0YzNhZjRlZDZmM2Y1ZGYwZGE1ZjNjMDgzNWE0MyIKIAotU1JDUkVWID0gImRk
NmRlMDcyYzkyYzg5MmE4NmUxOGMwZmQwZGZhMWJhNTdhOWEwNWQiCi1QViA9ICIyLjAuMTQiCitT
UkNSRVYgPSAiMDFhMzljYjRlZGMwZGQwZjQxNTFiN2FkMTFlMGM1NmQyZTYxMmEwMiIKK1BWID0g
IjIuMC4xNSIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL251bWFjdGwvbnVtYWN0bDti
cmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIFwKICAgICAgICAgICAgZmlsZTovL0ZpeC10aGUt
dGVzdC1vdXRwdXQtZm9ybWF0LnBhdGNoIFwKLS0gCjIuMzEuMQoK

--===============7746416108447614189==--

