Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E8EAC77B73
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 00:46:46 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.10283.1676508395199432215
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 16:46:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=RV5hEQh+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018657aff872-ba3e056b-35c1-40a9-a7c1-f573e7ba66a2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1676508396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=v4SuPXc6vS3kTSr6i5pSy+/tQsdCIFpfUuyppkRizvc=;
	b=RV5hEQh+V6PKSwv2neJ9uhjr/jPMQF/8kaSMTQfvCjDiUXZtsleOoUljty4yQOm1
	gcDTYwTSln1K9dxLubwnzyhRTSiEBLE+fPIvSiG72XWQD2DySsdnS0nZ33gh8tXaylB
	9BLNtXKIaWKzZSV1Qluvomijut81XyyLVTiFk/Qg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1676508396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=v4SuPXc6vS3kTSr6i5pSy+/tQsdCIFpfUuyppkRizvc=;
	b=aBgkQ+phkhNmEBHIIW3gG2+Zk8MYR4sHdy5OcnLwMofMIvabWqMuT8xi1SESwt8x
	2L9S8wsZ8N5hfZuphsrjKh4gyUqLec1K307E6EARBGXIh8Rcd8ns0NyWX59GrFqOxtc
	B6YyNeZtgNqI3JFaR/Ekwc44uF9G+BbMWgIk75YY=
Content-Type: multipart/mixed; boundary="===============7408388588332641757=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.68.1 SUCCEEDED
Message-ID: <0101018657aff872-ba3e056b-35c1-40a9-a7c1-f573e7ba66a2-000000@us-west-2.amazonses.com>
Date: Thu, 16 Feb 2023 00:46:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.16-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 00:46:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177234

--===============7408388588332641757==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hypothesis* to *6.68.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.66.0-6.68.1.patch
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
--===============7408388588332641757==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.66.0-6.68.1.patch"

RnJvbSBhMDMzZTU4YWVmYWU4OWJlNWVmYmRhNzdiYmUyNmJlNTQ0ZGE3YjJhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgRmViIDIwMjMgMTY6MDQ6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWh5cG90aGVzaXM6IHVwZ3JhZGUgNi42Ni4wIC0+IDYuNjguMQoKLS0tCiAuLi55dGhv
bjMtaHlwb3RoZXNpc182LjY2LjAuYmIgPT4gcHl0aG9uMy1oeXBvdGhlc2lzXzYuNjguMS5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWh5cG90aGVzaXNfNi42
Ni4wLmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjY4LjEuYmJ9ICg5MSUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi42Ni4w
LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi42
OC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuNjYuMC5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi42OC4xLmJiCmluZGV4
IDMxMDE4NDVlNDguLjFkYjMxNTE1Y2MgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuNjYuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjY4LjEuYmIKQEAgLTEzLDcgKzEz
LDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBmaWxlOi8vdGVzdF9ybGUucHkgXAogICAgICIKIAot
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjJmYjMzNGFiMDY4ZGM2ZTdjMDJkNDlhMWM2OTRmNjZiZDFm
NjgxMTk3ZWVlZDk0NDA2NjUwYTU5ZWViZWY4NzAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjM3
YmQ3N2I0YjdmNDA0YTU5ZmY5NjVlMjRiZThhZWM0MjA5MzIzODY2ZTM0ZWNlY2RmNDE2NTIyYzZk
MDg1NCIKIAogUkRFUEVORFM6JHtQTn0gKz0gIiBcCiAgICAgcHl0aG9uMy1hdHRycyBcCi0tIAoy
LjM3LjMKCg==

--===============7408388588332641757==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.66.0.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.68.1.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py"
packages/core2-32-poky-linux/python3-hypothesis: PV changed from "6.66.0" to "6.68.1"
packages/core2-32-poky-linux/python3-hypothesis: PKGV changed from 6.66.0 [default] to 6.68.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.66.0" to "6.68.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.66.0 [default] to 6.68.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.66.0" to "6.68.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.66.0 [default] to 6.68.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.66.0" to "6.68.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.66.0 [default] to 6.68.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.66.0" to "6.68.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.66.0 [default] to 6.68.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.66.0" to "6.68.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.66.0 [default] to 6.68.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.66.0" to "6.68.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.66.0 [default] to 6.68.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.66.0" to "6.68.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.66.0 [default] to 6.68.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 2777089 to 2776283 (-0%)
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.66.0" to "6.68.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.66.0 [default] to 6.68.1 [default]
Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.11/site-packages/hypothesis-6.66.0.dist-info moved to /usr/lib/python3.11/site-packages/hypothesis-6.68.1.dist-info

--===============7408388588332641757==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.11/site-packages/hypothesis-6.66.0.dist-info moved to /usr/lib/python3.11/site-packages/hypothesis-6.68.1.dist-info

--===============7408388588332641757==--

