Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DA05C4167B
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:19 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web09.24571.1665871396571363879
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=X5kRkc01;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010183ddac3ccf-7efda1bb-2ce3-4c91-ab15-007e8de14802-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HwnKVakaBW2ChJZornnv2nO9DP1oyPXL7nmegZ63Cn0=;
	b=X5kRkc01/aog2sN5vjXJaTjVX+8ZvG10OdRSS+xlmXPHNPFWmYWq830POUROXBqN
	KRyvsebt3YxnYWXmMonZDu+xTYnIbYUkwe0gl+O5iaA3iqhenc/ij+AOzl3YRXvXU9s
	OFmUpG0+v+ltqUG+hcgWYQBw7+izpUeYd9xCfKJA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HwnKVakaBW2ChJZornnv2nO9DP1oyPXL7nmegZ63Cn0=;
	b=XvOw57h7BuudghXiNSFILACtyK/J++Z/ch9Nvdvl2UFky9Tv25NYdopQOFY0bysH
	j4aQ+rV+etDaajth4dotQzUN1T9goXvt3O92VoHkTUUvtKeSAxdIOS676Pjd8AqGoF0
	XFNaG0jXx+GFRmPF/nghbjQRD8vEt3UK4XlFjd2Y=
Content-Type: multipart/mixed; boundary="===============0173173830369448075=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lttng-ust: upgrading to 2.13.5 SUCCEEDED
Message-ID: <01010183ddac3ccf-7efda1bb-2ce3-4c91-ab15-007e8de14802-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171848

--===============0173173830369448075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lttng-ust* to *2.13.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-lttng-ust-upgrade-2.13.4-2.13.5.patch
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
--===============0173173830369448075==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lttng-ust-upgrade-2.13.4-2.13.5.patch"

RnJvbSBkZGEyM2U2MzdmZDY0MmY0YThhNzg1NGNkZWUxNzU0NWM0ZWFjYjYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTc6MjI6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
dHRuZy11c3Q6IHVwZ3JhZGUgMi4xMy40IC0+IDIuMTMuNQoKLS0tCiAuLi4vbHR0bmcve2x0dG5n
LXVzdF8yLjEzLjQuYmIgPT4gbHR0bmctdXN0XzIuMTMuNS5iYn0gICAgICAgICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMta2VybmVsL2x0dG5nL3tsdHRuZy11c3RfMi4xMy40LmJiID0+IGx0dG5nLXVzdF8y
LjEzLjUuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9s
dHRuZy11c3RfMi4xMy40LmJiIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy9sdHRuZy11c3Rf
Mi4xMy41LmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1r
ZXJuZWwvbHR0bmcvbHR0bmctdXN0XzIuMTMuNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWtl
cm5lbC9sdHRuZy9sdHRuZy11c3RfMi4xMy41LmJiCmluZGV4IDU2MjAwYWMzZTEuLjkxNjQwOGJm
ZjAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvbHR0bmctdXN0XzIuMTMu
NC5iYgorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2x0dG5nLXVzdF8yLjEzLjUuYmIK
QEAgLTM0LDcgKzM0LDcgQEAgU1JDX1VSSSA9ICJodHRwczovL2x0dG5nLm9yZy9maWxlcy9sdHRu
Zy11c3QvbHR0bmctdXN0LSR7UFZ9LnRhci5iejIgXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1N
YWtlZmlsZS5hbS11cGRhdGUtcnBhdGgtbGluay5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjY5OGY4MmVjNWRjNTZlOTgxYzBiYjA4YzQ2ZWJhYmFmMzFjNjBl
ODc3YzJlMzY1YjlmZDZkM2E5ZmZmOGIzOTgiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZjFkN2Ji
NDk4NGEzZGM1ZGFjZDNiN2JjYjRjMTBjMDRiMDQxYjBlZWNkN2NiYTFmZWYzZDhmODZhZmYwMmJk
NiIKIAogQ1ZFX1BST0RVQ1QgPSAidXN0IgogCi0tIAoyLjMxLjEKCg==

--===============0173173830369448075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/lttng-ust: SRC_URI changed from "https://lttng.org/files/lttng-ust/lttng-ust-2.13.4.tar.bz2 file://0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch file://0001-lttng-ust-common-link-with-liburcu-explicitly.patch file://0001-Makefile.am-update-rpath-link.patch" to "https://lttng.org/files/lttng-ust/lttng-ust-2.13.5.tar.bz2 file://0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch file://0001-lttng-ust-common-link-with-liburcu-explicitly.patch file://0001-Makefile.am-update-rpath-link.patch"
packages/core2-32-poky-linux/lttng-ust: PV changed from "2.13.4" to "2.13.5"
packages/core2-32-poky-linux/lttng-ust: PKGV changed from 2.13.4 [default] to 2.13.5 [default]
packages/core2-32-poky-linux/lttng-ust/lttng-ust-bin: PV changed from "2.13.4" to "2.13.5"
packages/core2-32-poky-linux/lttng-ust/lttng-ust-bin: PKGV changed from 2.13.4 [default] to 2.13.5 [default]
packages/core2-32-poky-linux/lttng-ust/lttng-ust-dbg: PV changed from "2.13.4" to "2.13.5"
packages/core2-32-poky-linux/lttng-ust/lttng-ust-dbg: PKGSIZE changed from 3834772 to 3843380 (+0%)
packages/core2-32-poky-linux/lttng-ust/lttng-ust-dbg: PKGV changed from 2.13.4 [default] to 2.13.5 [default]
packages/core2-32-poky-linux/lttng-ust/lttng-ust-dev: PV changed from "2.13.4" to "2.13.5"
packages/core2-32-poky-linux/lttng-ust/lttng-ust-dev: PKGV changed from 2.13.4 [default] to 2.13.5 [default]
packages/core2-32-poky-linux/lttng-ust/lttng-ust-doc: PV changed from "2.13.4" to "2.13.5"
packages/core2-32-poky-linux/lttng-ust/lttng-ust-doc: PKGSIZE changed from 108117 to 108533 (+0%)
packages/core2-32-poky-linux/lttng-ust/lttng-ust-doc: PKGV changed from 2.13.4 [default] to 2.13.5 [default]
packages/core2-32-poky-linux/lttng-ust/lttng-ust-locale: PV changed from "2.13.4" to "2.13.5"
packages/core2-32-poky-linux/lttng-ust/lttng-ust-locale: PKGV changed from 2.13.4 [default] to 2.13.5 [default]
packages/core2-32-poky-linux/lttng-ust/lttng-ust-src: PV changed from "2.13.4" to "2.13.5"
packages/core2-32-poky-linux/lttng-ust/lttng-ust-src: PKGSIZE changed from 1517150 to 1525185 (+1%)
packages/core2-32-poky-linux/lttng-ust/lttng-ust-src: PKGV changed from 2.13.4 [default] to 2.13.5 [default]
packages/core2-32-poky-linux/lttng-ust/lttng-ust-staticdev: PV changed from "2.13.4" to "2.13.5"
packages/core2-32-poky-linux/lttng-ust/lttng-ust-staticdev: PKGV changed from 2.13.4 [default] to 2.13.5 [default]
packages/core2-32-poky-linux/lttng-ust/lttng-ust: PV changed from "2.13.4" to "2.13.5"
packages/core2-32-poky-linux/lttng-ust/lttng-ust: PKGSIZE changed from 1202430 to 1210622 (+1%)
packages/core2-32-poky-linux/lttng-ust/lttng-ust: PKGV changed from 2.13.4 [default] to 2.13.5 [default]

--===============0173173830369448075==--

