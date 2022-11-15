Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FCD6C6377C
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 13:05:46 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web12.5223.1668517535249098679
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 05:05:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=UzkyMCRJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101847b651e70-325cedb3-046c-4d01-91e6-1135bc1b3ddb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1668517535;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=V/8oDAXP3nVDjjosWSxQ2biwTJYchy9LweU50uKGOpY=;
	b=UzkyMCRJPZD//lMOJHZ777fezZZdwlc3bCd87zhfsGR6yBmmF3yFo1cqLCoyPKHO
	/fe23H16J8VqP8V3A297MLr1rYCTJDXJ7CdE6kEJsluXx+g6OyEhF1XP+k02/RJSaU0
	3Pew1Oj6yeUrkJdy0fCowyCZk2P9yqYkOsbmhCdc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1668517535;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=V/8oDAXP3nVDjjosWSxQ2biwTJYchy9LweU50uKGOpY=;
	b=Ran55sJnuV7NZNvTrNAD9oXglT/HwLYPE3XCBibMhWDVcupDyU58+2P5q4hwzRRM
	UFtUYGpnW2hQwemWebkepjsIK6oObfj8B0W2V/y3uc3QS0Tdktia83x8zJ6FvHfps7z
	t5gegJFh1LwRCcCJUasyJkxeaLBh/k96hQJhid/E=
Content-Type: multipart/mixed; boundary="===============8607056368402540622=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pathspec: upgrading to 0.10.2 SUCCEEDED
Message-ID: <010101847b651e70-325cedb3-046c-4d01-91e6-1135bc1b3ddb-000000@us-west-2.amazonses.com>
Date: Tue, 15 Nov 2022 13:05:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 13:05:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173285

--===============8607056368402540622==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pathspec* to *0.10.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pathspec-upgrade-0.10.1-0.10.2.patch
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
--===============8607056368402540622==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pathspec-upgrade-0.10.1-0.10.2.patch"

RnJvbSA3NmZlNTYwMzVmZDIzOGIwODY5M2E1ZWNkOTYzOTQ5MzllYmQxOWRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgTm92IDIwMjIgMDg6MDI6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBhdGhzcGVjOiB1cGdyYWRlIDAuMTAuMSAtPiAwLjEwLjIKCi0tLQogLi4uL3tweXRo
b24zLXBhdGhzcGVjXzAuMTAuMS5iYiA9PiBweXRob24zLXBhdGhzcGVjXzAuMTAuMi5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1wYXRoc3BlY18wLjEwLjEu
YmIgPT4gcHl0aG9uMy1wYXRoc3BlY18wLjEwLjIuYmJ9ICg3OCUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBhdGhzcGVjXzAuMTAuMS5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wYXRoc3BlY18wLjEwLjIuYmIKc2lt
aWxhcml0eSBpbmRleCA3OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXBhdGhzcGVjXzAuMTAuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXBhdGhzcGVjXzAuMTAuMi5iYgppbmRleCA4ZjJhZjBlYzk5Li45
N2UzYWQ0MDQxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcGF0aHNwZWNfMC4xMC4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1wYXRoc3BlY18wLjEwLjIuYmIKQEAgLTQsNyArNCw3IEBAIFNFQ1RJT04gPSAiZGV2
ZWwvcHl0aG9uIgogTElDRU5TRSA9ICJNUEwtMi4wIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxl
Oi8vTElDRU5TRTttZDU9ODE1Y2E1OTljOWRmMjQ3YTBjN2Y2MTliYWIxMjNkYWQiCiAKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICI3YWNlNjE2MWI2MjFkMzFlNzkwMmViNmI1YWUxNDhkMTJjZmQyM2Y0
YTI0OWI5ZmZiNmI5ZmVlMTIwODQzMjNkIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjhmNmJmNzNl
NTc1OGZkMzY1ZWY1ZDU4Y2UwOWFjN2MyN2QyODMzYThkN2RhNTE3MTJlYWM2ZTI3ZTM1MTQxYjAi
CiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi0tIAoyLjMxLjEKCg==

--===============8607056368402540622==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-pathspec (sysroot):
  /usr/lib/python3.11/site-packages/pathspec-0.10.1.dist-info moved to /usr/lib/python3.11/site-packages/pathspec-0.10.2.dist-info

--===============8607056368402540622==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pathspec: PV changed from "0.10.1" to "0.10.2"
packages/core2-32-poky-linux/python3-pathspec: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pathspec/pathspec-0.10.1.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pathspec/pathspec-0.10.2.tar.gz"
packages/core2-32-poky-linux/python3-pathspec: PKGV changed from 0.10.1 [default] to 0.10.2 [default]
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-dbg: PV changed from "0.10.1" to "0.10.2"
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-dbg: PKGV changed from 0.10.1 [default] to 0.10.2 [default]
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-dev: PV changed from "0.10.1" to "0.10.2"
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-dev: PKGV changed from 0.10.1 [default] to 0.10.2 [default]
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-doc: PV changed from "0.10.1" to "0.10.2"
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-doc: PKGV changed from 0.10.1 [default] to 0.10.2 [default]
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-locale: PV changed from "0.10.1" to "0.10.2"
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-locale: PKGV changed from 0.10.1 [default] to 0.10.2 [default]
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-src: PV changed from "0.10.1" to "0.10.2"
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-src: PKGV changed from 0.10.1 [default] to 0.10.2 [default]
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-staticdev: PV changed from "0.10.1" to "0.10.2"
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-staticdev: PKGV changed from 0.10.1 [default] to 0.10.2 [default]
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec: PKGSIZE changed from 152443 to 154762 (+2%)
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec: PV changed from "0.10.1" to "0.10.2"
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec: PKGV changed from 0.10.1 [default] to 0.10.2 [default]
Changes to packages/core2-32-poky-linux/python3-pathspec (sysroot):
  /usr/lib/python3.11/site-packages/pathspec-0.10.1.dist-info moved to /usr/lib/python3.11/site-packages/pathspec-0.10.2.dist-info

--===============8607056368402540622==--

