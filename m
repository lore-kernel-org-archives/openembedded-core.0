Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C348C48BCD
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 16:53:53 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web08.478.1664643227445575329
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 09:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=UHMDevbI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 010101839477db51-1e7d6eb4-c735-4e76-8557-1daf39cce752-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1664643226;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1RfIGHtymtQ7ABE8eSFH2+VjkQMECYnEH0BGP8DQzU0=;
	b=UHMDevbIU/+l8Hwt/Mxpx0M/n9y4yeaJinKf2CHQkNEy1DYF47Qwz09n0RGqimnU
	0y6+uMQEDSg58Q5qoLnXiTC36DCdHp5L8bgryU35212wMbm6VPVreDRNZqPRPRWGrKU
	wm6MNOFGNryODzyksoFLVrvvsbHoQJgE6jBhBREw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1664643226;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1RfIGHtymtQ7ABE8eSFH2+VjkQMECYnEH0BGP8DQzU0=;
	b=Id49eQMKsF6MuVehJVQSBdCAZYWvpL74fbtxArFm+aDoCvJt6dXQCCdIPRaVS0vl
	pZtf32jk3Lk3YFhJVGgH6I4RJs8+L3H38FChZlR+0Iq+apM9b5gZCPP5CYC3RDI1Zzx
	IHpwIPqnk3v8gFAcZTIRsYcr7NGr/7rVAg2y1O88=
Content-Type: multipart/mixed; boundary="===============6733809347389686520=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hatchling: upgrading to 1.10.0 SUCCEEDED
Message-ID: 
 <010101839477db51-1e7d6eb4-c735-4e76-8557-1daf39cce752-000000@us-west-2.amazonses.com>
Date: Sat, 1 Oct 2022 16:53:46 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 16:53:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171276

--===============6733809347389686520==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hatchling* to *1.10.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hatchling-upgrade-1.9.0-1.10.0.patch
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
--===============6733809347389686520==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.10/site-packages/hatchling-1.10.0.dist-info was added
  /usr/lib/python3.10/site-packages/hatchling-1.10.0.dist-info/entry_points.txt was added
  /usr/lib/python3.10/site-packages/hatchling-1.10.0.dist-info/licenses was added
  /usr/lib/python3.10/site-packages/hatchling-1.10.0.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.10/site-packages/hatchling-1.10.0.dist-info/METADATA was added
  /usr/lib/python3.10/site-packages/hatchling-1.10.0.dist-info/RECORD was added
  /usr/lib/python3.10/site-packages/hatchling-1.10.0.dist-info/WHEEL was added
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/entry_points.txt was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/licenses was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/METADATA was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/RECORD was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.10/site-packages/hatchling-1.10.0.dist-info was added
  /usr/lib/python3.10/site-packages/hatchling-1.10.0.dist-info/entry_points.txt was added
  /usr/lib/python3.10/site-packages/hatchling-1.10.0.dist-info/licenses was added
  /usr/lib/python3.10/site-packages/hatchling-1.10.0.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.10/site-packages/hatchling-1.10.0.dist-info/METADATA was added
  /usr/lib/python3.10/site-packages/hatchling-1.10.0.dist-info/RECORD was added
  /usr/lib/python3.10/site-packages/hatchling-1.10.0.dist-info/WHEEL was added
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/entry_points.txt was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/licenses was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/METADATA was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/RECORD was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/WHEEL was removed

--===============6733809347389686520==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hatchling-upgrade-1.9.0-1.10.0.patch"

RnJvbSBhNmEyN2JlZjk3MWEyYjE2YzVhNTdlMDAxY2RiNzNhOGI4YzE5YjljIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBPY3QgMjAyMiAwODoxODoyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaGF0Y2hsaW5nOiB1cGdyYWRlIDEuOS4wIC0+IDEuMTAuMAoKLS0tCiAuLi4ve3B5dGhv
bjMtaGF0Y2hsaW5nXzEuOS4wLmJiID0+IHB5dGhvbjMtaGF0Y2hsaW5nXzEuMTAuMC5iYn0gfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWhhdGNobGluZ18xLjkuMC5i
YiA9PiBweXRob24zLWhhdGNobGluZ18xLjEwLjAuYmJ9ICg4NSUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjkuMC5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oYXRjaGxpbmdfMS4xMC4wLmJiCnNp
bWlsYXJpdHkgaW5kZXggODUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1oYXRjaGxpbmdfMS45LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1oYXRjaGxpbmdfMS4xMC4wLmJiCmluZGV4IDAxMWY1ZWQxMTAu
LmEwZDQxZDRiMGQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1oYXRjaGxpbmdfMS45LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWhhdGNobGluZ18xLjEwLjAuYmIKQEAgLTgsNyArOCw3IEBAIGluaGVyaXQgcHlw
aSBweXRob25faGF0Y2hsaW5nCiBERVBFTkRTICs9ICJweXRob24zLXBsdWdneS1uYXRpdmUgcHl0
aG9uMy10b21saS1uYXRpdmUgcHl0aG9uMy1wYXRoc3BlYy1uYXRpdmUgcHl0aG9uMy1wYWNrYWdp
bmctbmF0aXZlIHB5dGhvbjMtZWRpdGFibGVzLW5hdGl2ZSIKIERFUEVORFM6cmVtb3ZlOmNsYXNz
LW5hdGl2ZSA9ICJweXRob24zLWhhdGNobGluZy1uYXRpdmUiCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICJiNTdjNzM2MmY0MzdiOTQyNmU0Yjk0MjI4YTIxZDJhYzU4MDRmYmIyYWJjYjAxYWRkZTI1
NDRhMzViYjMwM2NkIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjVkMzFmNDNkZmZhZjYyNjVjODA4
ZTFiNTM1MzY2MmZmYTUxNDZkODQ0Mjc4YjU1Y2FhNmM3Zjc0ZjQyN2VjNTAiCiAKIGRvX2NvbXBp
bGU6cHJlcGVuZCgpIHsKICAgICBleHBvcnQgUFlUSE9OUEFUSD1zcmMKLS0gCjIuMzEuMQoK

--===============6733809347389686520==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hatchling: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.9.0.tar.gz" to "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.10.0.tar.gz"
packages/core2-32-poky-linux/python3-hatchling: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-32-poky-linux/python3-hatchling: PV changed from "1.9.0" to "1.10.0"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dbg: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dbg: PV changed from "1.9.0" to "1.10.0"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dev: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dev: PV changed from "1.9.0" to "1.10.0"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-doc: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-doc: PV changed from "1.9.0" to "1.10.0"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-locale: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-locale: PV changed from "1.9.0" to "1.10.0"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-src: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-src: PV changed from "1.9.0" to "1.10.0"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-staticdev: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-staticdev: PV changed from "1.9.0" to "1.10.0"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling: PKGV changed from 1.9.0 [default] to 1.10.0 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling: PKGSIZE changed from 533221 to 536023 (+1%)
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling: PV changed from "1.9.0" to "1.10.0"
Changes to packages/core2-32-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.10/site-packages/hatchling-1.10.0.dist-info was added
  /usr/lib/python3.10/site-packages/hatchling-1.10.0.dist-info/entry_points.txt was added
  /usr/lib/python3.10/site-packages/hatchling-1.10.0.dist-info/licenses was added
  /usr/lib/python3.10/site-packages/hatchling-1.10.0.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.10/site-packages/hatchling-1.10.0.dist-info/METADATA was added
  /usr/lib/python3.10/site-packages/hatchling-1.10.0.dist-info/RECORD was added
  /usr/lib/python3.10/site-packages/hatchling-1.10.0.dist-info/WHEEL was added
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/entry_points.txt was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/licenses was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/METADATA was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/RECORD was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.10/site-packages/hatchling-1.10.0.dist-info was added
  /usr/lib/python3.10/site-packages/hatchling-1.10.0.dist-info/entry_points.txt was added
  /usr/lib/python3.10/site-packages/hatchling-1.10.0.dist-info/licenses was added
  /usr/lib/python3.10/site-packages/hatchling-1.10.0.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.10/site-packages/hatchling-1.10.0.dist-info/METADATA was added
  /usr/lib/python3.10/site-packages/hatchling-1.10.0.dist-info/RECORD was added
  /usr/lib/python3.10/site-packages/hatchling-1.10.0.dist-info/WHEEL was added
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/entry_points.txt was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/licenses was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/METADATA was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/RECORD was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/WHEEL was removed

--===============6733809347389686520==--

