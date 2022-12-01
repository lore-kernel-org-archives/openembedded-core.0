Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1311C63714
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:30:33 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.46826.1669908627073689165
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:30:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Jj43HLZu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010184ce4f8089-17ab8865-2d4d-4047-931a-c459cf923b20-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1669908627;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZAAqE3jynx9a8Bl40213xuC/VEdnSqtFAE3YWmyic5s=;
	b=Jj43HLZuU39PdR0QnDaXcTjFtBPCc26N9HXsbxdmxwoT59TnSIgRqs4+eJbOyBuJ
	fTD7TBLCeZe9HeJ73vLrfNwxtP3AH06Pb/zIdAlA8bSN3iziAldNPcmEdehLormZhPZ
	BQ8nVmBKgvLDB2+mLEn+DaulEsW2gOqMus5wQ6aU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1669908627;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZAAqE3jynx9a8Bl40213xuC/VEdnSqtFAE3YWmyic5s=;
	b=T5FpkaFp+9rW6xAitLmlBZt9UBDt9x46GoUIdn4Rq6v2S1eU234G6tl5gExPFUpc
	H+6E0kiuGOAKITwxFUhXerMEl+FUEJFNVNgcF7K520FxZ13qn0kMriZ0/u/3tNPiSod
	aeKM2Ky4JGyIxudh0Z2cIGs9FMka1vSKfIvKg4tY=
Content-Type: multipart/mixed; boundary="===============5830839049521203407=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shaderc: upgrading to 2022.4 SUCCEEDED
Message-ID: <01010184ce4f8089-17ab8865-2d4d-4047-931a-c459cf923b20-000000@us-west-2.amazonses.com>
Date: Thu, 1 Dec 2022 15:30:27 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174170

--===============5830839049521203407==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *shaderc* to *2022.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-shaderc-upgrade-2022.3-2022.4.patch
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
--===============5830839049521203407==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/shaderc: PKGV changed from 2022.3 [default] to 2022.4 [default]
packages/core2-32-poky-linux/shaderc: PV changed from "2022.3" to "2022.4"
packages/core2-32-poky-linux/shaderc/shaderc-dbg: PKGV changed from 2022.3 [default] to 2022.4 [default]
packages/core2-32-poky-linux/shaderc/shaderc-dbg: PV changed from "2022.3" to "2022.4"
packages/core2-32-poky-linux/shaderc/shaderc-dev: PKGV changed from 2022.3 [default] to 2022.4 [default]
packages/core2-32-poky-linux/shaderc/shaderc-dev: PV changed from "2022.3" to "2022.4"
packages/core2-32-poky-linux/shaderc/shaderc-doc: PKGV changed from 2022.3 [default] to 2022.4 [default]
packages/core2-32-poky-linux/shaderc/shaderc-doc: PV changed from "2022.3" to "2022.4"
packages/core2-32-poky-linux/shaderc/shaderc-locale: PKGV changed from 2022.3 [default] to 2022.4 [default]
packages/core2-32-poky-linux/shaderc/shaderc-locale: PV changed from "2022.3" to "2022.4"
packages/core2-32-poky-linux/shaderc/shaderc-src: PKGV changed from 2022.3 [default] to 2022.4 [default]
packages/core2-32-poky-linux/shaderc/shaderc-src: PV changed from "2022.3" to "2022.4"
packages/core2-32-poky-linux/shaderc/shaderc-staticdev: PKGSIZE changed from 2498550 to 2498542 (-0%)
packages/core2-32-poky-linux/shaderc/shaderc-staticdev: PKGV changed from 2022.3 [default] to 2022.4 [default]
packages/core2-32-poky-linux/shaderc/shaderc-staticdev: PV changed from "2022.3" to "2022.4"
packages/core2-32-poky-linux/shaderc/shaderc: PKGV changed from 2022.3 [default] to 2022.4 [default]
packages/core2-32-poky-linux/shaderc/shaderc: PV changed from "2022.3" to "2022.4"

--===============5830839049521203407==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shaderc-upgrade-2022.3-2022.4.patch"

RnJvbSBkZGRlYWE4ZTA5M2M5ZTI1NjNlN2MxN2U1ZDRjNzczM2MzYjUyMDFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBEZWMgMjAyMiAxMjozMjo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNo
YWRlcmM6IHVwZ3JhZGUgMjAyMi4zIC0+IDIwMjIuNAoKLS0tCiAuLi4vc2hhZGVyYy97c2hhZGVy
Y18yMDIyLjMuYmIgPT4gc2hhZGVyY18yMDIyLjQuYmJ9ICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy97c2hhZGVyY18yMDIyLjMuYmIgPT4gc2hhZGVyY18yMDIy
LjQuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMv
c2hhZGVyY18yMDIyLjMuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9zaGFkZXJj
XzIwMjIuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
Z3JhcGhpY3Mvc2hhZGVyYy9zaGFkZXJjXzIwMjIuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3NoYWRlcmMvc2hhZGVyY18yMDIyLjQuYmIKaW5kZXggYzM0MDY0NmZhNy4uMGZl
Njg4N2NiYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvc2hhZGVy
Y18yMDIyLjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvc2hhZGVyY18y
MDIyLjQuYmIKQEAgLTYsNyArNiw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9n
b29nbGUvc2hhZGVyYyIKIExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIKIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTg2ZDNmM2E5NWMzMjRjOTQ3OWJkODk4Njk2OGY0MzI3Igog
Ci1TUkNSRVYgPSAiNGJiYjY0NmRkYjMyNzljNmEyN2U3YWEwZWI4NmMxMGM4YWRkOTg3YiIKK1NS
Q1JFViA9ICIwNjdlMDA4YzgwYzMyM2IxY2QxYWIxZTU0N2IzOGY5YTVmNTIyNjllIgogU1JDX1VS
SSA9ICJnaXQ6Ly9naXRodWIuY29tL2dvb2dsZS9zaGFkZXJjLmdpdDtwcm90b2NvbD1odHRwczti
cmFuY2g9bWFpbiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWNtYWtlLWRpc2FibGUtYnVpbGRp
bmctZXh0ZXJuYWwtZGVwZW5kZW5jaWVzLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDIt
bGlic2hhZGVyY191dGlsLWZpeC1nbHNsYW5nLWhlYWRlci1maWxlLWxvY2F0aW9uLnBhdGNoIFwK
LS0gCjIuMzEuMQoK

--===============5830839049521203407==--

