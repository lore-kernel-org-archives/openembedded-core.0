Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EDDCC7115A
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:36 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.144494.1671136350880845425
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Uy8adcPE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010185177d0fd9-b3808f65-bed2-46d7-95f8-8464fab1c6fb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fvBDmu9EIJiuGRotouylRqSt0j+iNbciYxF1yhgGRDA=;
	b=Uy8adcPEFdpbekjqcJ8Y8nzamjk1v82KMGwdwZqAatKAgUY3pkEpuCYcIt/XrSgj
	/2bY2u+9izgKpK4CCLcOEHDPA6McDmv6XW3nQQaQGXWhkHr3PfWkj80DwPkO1zSXyDL
	26wgyOmYZZNboTXmQWLpq9nGqh9UcHN7JVpihW2k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fvBDmu9EIJiuGRotouylRqSt0j+iNbciYxF1yhgGRDA=;
	b=XtxEV7luZaatOVN0rMxkd0OhB09d7j+uVZpJ5VdnOUY6JnchB5HK1AgTZKfjOiXo
	ig3JwSF/8kChWuGqdSKoGEcWL1TFUtUN7ANVFdzOcfLF7bD0qbpCqy9tWIRKrHEfoTa
	J34Ca1Wuqayhsidubl7pKMRYtNoRpECBR6eq78rk=
Content-Type: multipart/mixed; boundary="===============0064985829447564155=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go: upgrading to 1.19.4 FAILED
Message-ID: <01010185177d0fd9-b3808f65-bed2-46d7-95f8-8464fab1c6fb-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:30 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174630

--===============0064985829447564155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go* to *1.19.4* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-go-upgrade-1.19.3-1.19.4.patch
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
--===============0064985829447564155==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-go-upgrade-1.19.3-1.19.4.patch"

RnJvbSA0ZDY4MWI4ZjAwMmY5YTc2NjM0YjEzMmEyNWZlNmE2YmQyNTJkOTYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMDk6MjE6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bzogdXBncmFkZSAxLjE5LjMgLT4gMS4xOS40CgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9n
by97Z28tMS4xOS4zLmluYyA9PiBnby0xLjE5LjQuaW5jfSB8IDIgKy0KIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9nby97Z29fMS4xOS4zLmJiID0+IGdvXzEuMTkuNC5iYn0gICB8IDAKIDIgZmlsZXMg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZ28ve2dvLTEuMTkuMy5pbmMgPT4gZ28tMS4xOS40LmluY30gKDg5JSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28ve2dvXzEuMTkuMy5iYiA9PiBnb18xLjE5LjQu
YmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby0xLjE5
LjMuaW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLTEuMTkuNC5pbmMKc2ltaWxhcml0
eSBpbmRleCA4OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLTEuMTku
My5pbmMKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby0xLjE5LjQuaW5jCmlu
ZGV4IDEyNDVmYWJhOTMuLjQ5MzQ5YmE2ZWMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9nby9nby0xLjE5LjMuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby0x
LjE5LjQuaW5jCkBAIC0xNSw0ICsxNSw0IEBAIFNSQ19VUkkgKz0gIlwKICAgICBmaWxlOi8vMDAw
MS1zcmMtY21kLWRpc3QtYnVpbGRnby5nby1kby1ub3QtaGFyZGNvZGUtaG9zdC1jb21waWxlLnBh
dGNoIFwKICAgICBmaWxlOi8vZmlsdGVyLWJ1aWxkLXBhdGhzLnBhdGNoIFwKICIKLVNSQ19VUklb
bWFpbi5zaGEyNTZzdW1dID0gIjE4YWMyNjNlMzkyMTBiY2Y2OGQ4NWY0MzcwZTk3ZmIxNzM0MTY2
OTk1YTFmNjNmYjM4YjRmNmUwN2Q5MGQyMTIiCitTUkNfVVJJW21haW4uc2hhMjU2c3VtXSA9ICJl
ZGE3NGRiNGFjNDk0ODAwYTNlNjZlZTc4NGU0OTViZmJiOWI4ZTUzNWRmOTI0YThiMDFiMWE4MDI4
YjdmMzY4IgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvXzEuMTkuMy5i
YiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nb18xLjE5LjQuYmIKc2ltaWxhcml0eSBpbmRl
eCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nb18xLjE5LjMuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nb18xLjE5LjQuYmIKLS0gCjIuMzcu
MwoK

--===============0064985829447564155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: ParseError at /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-crosssdk_1.19.3.bb:2: Could not include required file go-1.19.3.inc
ERROR: Parsing halted due to errors, see error messages above

--===============0064985829447564155==--

