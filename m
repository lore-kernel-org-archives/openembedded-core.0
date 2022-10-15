Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A841CC43217
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:13:01 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.24338.1665871976038194468
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=DQsZGZqV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010183ddb512ce-0c2680de-0fea-46a6-b50b-4cd6cfbf04c1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871975;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yE047bSBpuGhwFHHu26gBq1EMKoiRRZnedy8gha5CAY=;
	b=DQsZGZqVp9L+HSLR2kKXKRPQZpsDNN+XpRakAEuHLxMT+0Be1WCJLSuaVkkZJjRY
	LKrreoCJDBIVOSmMoaN/Y2lSnLZ+0+Bse9cIhhtPiVg+gp3SmY55IHU6dJT82oOITeE
	3ifaSUPsrmcmT6B4kA7P6Kldgh4AkJPvRPq4bhsA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871975;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yE047bSBpuGhwFHHu26gBq1EMKoiRRZnedy8gha5CAY=;
	b=XZBbLt1TAjL7NWdp2Qi1/OKYlsyc3H9pFWEACoerpJIXjQL5mFxuBEl5EHh8PGYu
	qm1ux1U4q/Z4Pu2oUa7GNHEyD9me3d8eZw5RWOg51zw5/+Mmop390dLUnuUkm0cBx54
	fjfcE+c6vqcs9+D/thkJFEWv7Qq2gBooyglb4N6g=
Content-Type: multipart/mixed; boundary="===============6597897761709360222=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] numactl: upgrading to 2.0.16 SUCCEEDED
Message-ID: <01010183ddb512ce-0c2680de-0fea-46a6-b50b-4cd6cfbf04c1-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:12:55 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:13:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171881

--===============6597897761709360222==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *numactl* to *2.0.16* has Succeeded.

Next steps:
    - apply the patch: git am 0001-numactl-upgrade-2.0.15-2.0.16.patch
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
--===============6597897761709360222==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-numactl-upgrade-2.0.15-2.0.16.patch"

RnJvbSAzMjViY2IwOWI0MDYyNDlmMDNlMTk2ZGYzMjgwYzQxMDY0YjhkYzQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMjE6Mjg6MzMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBu
dW1hY3RsOiB1cGdyYWRlIDIuMC4xNSAtPiAyLjAuMTYKCi0tLQogbWV0YS9yZWNpcGVzLXN1cHBv
cnQvbnVtYWN0bC9udW1hY3RsX2dpdC5iYiB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9udW1hY3RsL251bWFjdGxfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbnVtYWN0
bC9udW1hY3RsX2dpdC5iYgppbmRleCA3MTJjZjAyMDNmLi4yM2JlMGEzYjRmIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9udW1hY3RsL251bWFjdGxfZ2l0LmJiCisrKyBiL21ldGEv
cmVjaXBlcy1zdXBwb3J0L251bWFjdGwvbnVtYWN0bF9naXQuYmIKQEAgLTEwLDggKzEwLDggQEAg
aW5oZXJpdCBhdXRvdG9vbHMtYnJva2Vuc2VwIHB0ZXN0CiAKIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL1JFQURNRS5tZDtiZWdpbmxpbmU9MTk7ZW5kbGluZT0zMjttZDU9OWYzNGMzYWY0ZWQ2
ZjNmNWRmMGRhNWYzYzA4MzVhNDMiCiAKLVNSQ1JFViA9ICIwMWEzOWNiNGVkYzBkZDBmNDE1MWI3
YWQxMWUwYzU2ZDJlNjEyYTAyIgotUFYgPSAiMi4wLjE1IgorU1JDUkVWID0gIjEwMjg1ZjFhMWJh
ZDQ5MzA2ODM5YjJjNDYzOTM2NDYwYjYwNGUzZWEiCitQViA9ICIyLjAuMTYiCiAKIFNSQ19VUkkg
PSAiZ2l0Oi8vZ2l0aHViLmNvbS9udW1hY3RsL251bWFjdGw7YnJhbmNoPW1hc3Rlcjtwcm90b2Nv
bD1odHRwcyBcCiAgICAgICAgICAgIGZpbGU6Ly9GaXgtdGhlLXRlc3Qtb3V0cHV0LWZvcm1hdC5w
YXRjaCBcCi0tIAoyLjMxLjEKCg==

--===============6597897761709360222==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/numactl: PV changed from "2.0.15" to "2.0.16"
packages/core2-32-poky-linux/numactl: PKGV changed from 2.0.15 [default] to 2.0.16 [default]
packages/core2-32-poky-linux/numactl/numactl-dbg: PV changed from "2.0.15" to "2.0.16"
packages/core2-32-poky-linux/numactl/numactl-dbg: PKGV changed from 2.0.15 [default] to 2.0.16 [default]
packages/core2-32-poky-linux/numactl/numactl-dbg: PKGSIZE changed from 625448 to 625540 (+0%)
packages/core2-32-poky-linux/numactl/numactl-dev: PV changed from "2.0.15" to "2.0.16"
packages/core2-32-poky-linux/numactl/numactl-dev: PKGV changed from 2.0.15 [default] to 2.0.16 [default]
packages/core2-32-poky-linux/numactl/numactl-dev: PKGSIZE changed from 17166 to 17156 (-0%)
packages/core2-32-poky-linux/numactl/numactl-doc: PV changed from "2.0.15" to "2.0.16"
packages/core2-32-poky-linux/numactl/numactl-doc: PKGV changed from 2.0.15 [default] to 2.0.16 [default]
packages/core2-32-poky-linux/numactl/numactl-locale: PV changed from "2.0.15" to "2.0.16"
packages/core2-32-poky-linux/numactl/numactl-locale: PKGV changed from 2.0.15 [default] to 2.0.16 [default]
packages/core2-32-poky-linux/numactl/numactl-ptest: PV changed from "2.0.15" to "2.0.16"
packages/core2-32-poky-linux/numactl/numactl-ptest: PKGV changed from 2.0.15 [default] to 2.0.16 [default]
packages/core2-32-poky-linux/numactl/numactl-src: PV changed from "2.0.15" to "2.0.16"
packages/core2-32-poky-linux/numactl/numactl-src: PKGV changed from 2.0.15 [default] to 2.0.16 [default]
packages/core2-32-poky-linux/numactl/numactl-src: PKGSIZE changed from 237528 to 237695 (+0%)
packages/core2-32-poky-linux/numactl/numactl-staticdev: PV changed from "2.0.15" to "2.0.16"
packages/core2-32-poky-linux/numactl/numactl-staticdev: PKGV changed from 2.0.15 [default] to 2.0.16 [default]
packages/core2-32-poky-linux/numactl/numactl: PV changed from "2.0.15" to "2.0.16"
packages/core2-32-poky-linux/numactl/numactl: PKGV changed from 2.0.15 [default] to 2.0.16 [default]

--===============6597897761709360222==--

