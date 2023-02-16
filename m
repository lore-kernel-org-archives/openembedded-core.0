Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73E0DC77B75
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 00:46:46 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.10148.1676508396601976632
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 16:46:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=idHtWr7P;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018657aff842-a590a2e4-4dcf-4475-80f0-d75bb6263ed1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1676508395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CWMFpvWcuRs/P9kRL5UFq/wQRy5P/vBfNi3VNAdsv4M=;
	b=idHtWr7Pl6yDEtEmamr/kmNwJFnF+UHnHTaK8ORmQnDJdRrFM3D6ru+n4ve3JveE
	DHLEl8ZNdDJ9j7f1fRviswJdHFRAmvTNA7f9bm3S4u4cXpCJgityHGDy/QW+bQZV08W
	eFn20DN4h9kiUkPMw0JxO9zaV+x20MSJdYoYRAgI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1676508395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CWMFpvWcuRs/P9kRL5UFq/wQRy5P/vBfNi3VNAdsv4M=;
	b=AMDnV+AV7VwANw1+0L1Wh1l4k0HoYFzqONJVJCxpuBLVlRskOA/+J8QtsnCn85PW
	zM1bwRBCKNrIZ3hmVOOonGD+AkNHHLhtI4n27XsrsJlU+UkFlPTid45O2ieHrkcpOVZ
	5gm6k0u6cAR0Yt+gH8EWmvj/7FMwW7ixQCTeFJNM=
Content-Type: multipart/mixed; boundary="===============6527761038485811624=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go: upgrading to 1.20.1 FAILED
Message-ID: <0101018657aff842-a590a2e4-4dcf-4475-80f0-d75bb6263ed1-000000@us-west-2.amazonses.com>
Date: Thu, 16 Feb 2023 00:46:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 00:46:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177235

--===============6527761038485811624==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go* to *1.20.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-go-upgrade-1.20-1.20.1.patch
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
--===============6527761038485811624==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1693 entries from dependency cache.
Parsing recipes...
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: ParseError at /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/go/go-runtime_1.20.bb:1: Could not include required file go-1.20.inc
ERROR: Parsing halted due to errors, see error messages above

--===============6527761038485811624==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-go-upgrade-1.20-1.20.1.patch"

RnJvbSA1OWE2NTI2MjdjMDdkMzIxNGRmNTJlODc1MTYzMjdlOTBlYTAzOGFlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgRmViIDIwMjMgMTU6MDg6MTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bzogdXBncmFkZSAxLjIwIC0+IDEuMjAuMQoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28v
e2dvLTEuMjAuaW5jID0+IGdvLTEuMjAuMS5pbmN9IHwgMiArLQogbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2dvL3tnb18xLjIwLmJiID0+IGdvXzEuMjAuMS5iYn0gICB8IDAKIDIgZmlsZXMgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZ28ve2dvLTEuMjAuaW5jID0+IGdvLTEuMjAuMS5pbmN9ICg4OSUpCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2dvL3tnb18xLjIwLmJiID0+IGdvXzEuMjAuMS5iYn0gKDEwMCUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLTEuMjAuaW5jIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLTEuMjAuMS5pbmMKc2ltaWxhcml0eSBpbmRleCA4OSUK
cmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLTEuMjAuaW5jCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28tMS4yMC4xLmluYwppbmRleCAxMzlmOGQxZjNj
Li5hYTNlMmRhZGYxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28tMS4y
MC5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvLTEuMjAuMS5pbmMKQEAgLTE1
LDQgKzE1LDQgQEAgU1JDX1VSSSArPSAiXAogICAgIGZpbGU6Ly8wMDA4LXNyYy1jbWQtZGlzdC1i
dWlsZGdvLmdvLWRvLW5vdC1oYXJkY29kZS1ob3N0LWNvbXBpbGUucGF0Y2ggXAogICAgIGZpbGU6
Ly8wMDA5LWdvLUZpbHRlci1idWlsZC1wYXRocy1vbi1zdGF0aWNseS1saW5rZWQtYXJjaGVzLnBh
dGNoIFwKICIKLVNSQ19VUklbbWFpbi5zaGEyNTZzdW1dID0gIjNhMjlmZjA0MjFiZWFmNjMyOTI5
MmI4YTQ2MzExYzlmYmYwNmM4MDAwNzdjZWRkZWY1ZmI3ZjhkNWIxYWNlMzMiCitTUkNfVVJJW21h
aW4uc2hhMjU2c3VtXSA9ICJiNWMxYTNhZjUyYzM4NWE2ZDFjNzZhZWQ1MzYxY2YyNjQ1OTAyMzk4
MGQwMzIwZGU3NjU4YmFlMzkxNTgzMWEyIgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2dvL2dvXzEuMjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ29fMS4yMC4xLmJi
CnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
Z28vZ29fMS4yMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dvL2dvXzEuMjAu
MS5iYgotLSAKMi4zNy4zCgo=

--===============6527761038485811624==--

