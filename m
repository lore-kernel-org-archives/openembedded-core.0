Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4634C7112F
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:35 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.144507.1671136352060885879
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=UIpgr+Ub;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010185177d14b5-8e87974c-b3b1-4939-b352-f9a3878400f7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=72ylx4nvgt3z/18ZJVghq4LqLZGjp5IV1oXcy3iE+3M=;
	b=UIpgr+Ub2M6QHudiWl6WQqnIO1cjaOkmAef9lev+CvzEgVCgTFxIL/XroF7Jq+nk
	ZNFQMii5JDMfd4O9BpoJln0MBUcYX2lNbGadW7Y2Vn05Qv33R22CFNkcMbDAJ4Z0C6u
	pKNItBzKQUuhCXdXPvtsAvMkpvUPMm8lfT/EM7Y0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=72ylx4nvgt3z/18ZJVghq4LqLZGjp5IV1oXcy3iE+3M=;
	b=JJgdcztpLbb+VjVjnkztjO12H5A+8j2xUM/e9qvfu8BQIjmFejGr+wKwBibD8lO+
	z/Lq8hb1IrcFtBtHFYt39S3QN1iTxQoW5paa7n7hwPKCoo+j872Sv59Qz2tWQS97NDK
	yVCD3jaZWFAR/Tjc8xve+ThODa6obvUNwornicFk=
Content-Type: multipart/mixed; boundary="===============0260240236106929260=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pathspec: upgrading to 0.10.3 SUCCEEDED
Message-ID: <01010185177d14b5-8e87974c-b3b1-4939-b352-f9a3878400f7-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:31 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174655

--===============0260240236106929260==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pathspec* to *0.10.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pathspec-upgrade-0.10.1-0.10.3.patch
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
--===============0260240236106929260==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pathspec-upgrade-0.10.1-0.10.3.patch"

RnJvbSA0NzZlNWEzZTI5NGUxZmU0YTQzNzIzZTA2MTM0NTVhYzFhNGQ2NDM3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMTE6MzI6MTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBhdGhzcGVjOiB1cGdyYWRlIDAuMTAuMSAtPiAwLjEwLjMKCi0tLQogLi4uL3tweXRo
b24zLXBhdGhzcGVjXzAuMTAuMS5iYiA9PiBweXRob24zLXBhdGhzcGVjXzAuMTAuMy5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1wYXRoc3BlY18wLjEwLjEu
YmIgPT4gcHl0aG9uMy1wYXRoc3BlY18wLjEwLjMuYmJ9ICg3OCUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBhdGhzcGVjXzAuMTAuMS5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wYXRoc3BlY18wLjEwLjMuYmIKc2lt
aWxhcml0eSBpbmRleCA3OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXBhdGhzcGVjXzAuMTAuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXBhdGhzcGVjXzAuMTAuMy5iYgppbmRleCA4ZjJhZjBlYzk5Li5i
ZDFlN2UzNjM5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcGF0aHNwZWNfMC4xMC4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1wYXRoc3BlY18wLjEwLjMuYmIKQEAgLTQsNyArNCw3IEBAIFNFQ1RJT04gPSAiZGV2
ZWwvcHl0aG9uIgogTElDRU5TRSA9ICJNUEwtMi4wIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxl
Oi8vTElDRU5TRTttZDU9ODE1Y2E1OTljOWRmMjQ3YTBjN2Y2MTliYWIxMjNkYWQiCiAKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICI3YWNlNjE2MWI2MjFkMzFlNzkwMmViNmI1YWUxNDhkMTJjZmQyM2Y0
YTI0OWI5ZmZiNmI5ZmVlMTIwODQzMjNkIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjU2MjAwZGU0
MDc3ZDlkMDc5MTQ2NWFhOTA5NWEwMWQ0MjE4NjFlNDA1YjUwOTY5NTUwNTFkZWVmZDY5N2Q2ZjYi
CiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi0tIAoyLjM3LjMKCg==

--===============0260240236106929260==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pathspec: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pathspec/pathspec-0.10.1.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pathspec/pathspec-0.10.3.tar.gz"
packages/core2-32-poky-linux/python3-pathspec: PKGV changed from 0.10.1 [default] to 0.10.3 [default]
packages/core2-32-poky-linux/python3-pathspec: PV changed from "0.10.1" to "0.10.3"
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-dbg: PKGV changed from 0.10.1 [default] to 0.10.3 [default]
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-dbg: PV changed from "0.10.1" to "0.10.3"
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-dev: PKGV changed from 0.10.1 [default] to 0.10.3 [default]
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-dev: PV changed from "0.10.1" to "0.10.3"
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-doc: PKGV changed from 0.10.1 [default] to 0.10.3 [default]
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-doc: PV changed from "0.10.1" to "0.10.3"
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-locale: PKGV changed from 0.10.1 [default] to 0.10.3 [default]
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-locale: PV changed from "0.10.1" to "0.10.3"
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-src: PKGV changed from 0.10.1 [default] to 0.10.3 [default]
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-src: PV changed from "0.10.1" to "0.10.3"
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-staticdev: PKGV changed from 0.10.1 [default] to 0.10.3 [default]
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-staticdev: PV changed from "0.10.1" to "0.10.3"
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec: PKGV changed from 0.10.1 [default] to 0.10.3 [default]
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec: PKGSIZE changed from 152443 to 157421 (+3%)
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec: PV changed from "0.10.1" to "0.10.3"
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec: FILELIST: directory renamed /usr/lib/python3.11/site-packages/pathspec-0.10.1.dist-info -> /usr/lib/python3.11/site-packages/pathspec-0.10.3.dist-info, added "/usr/lib/python3.11/site-packages/pathspec/py.typed"
Changes to packages/core2-32-poky-linux/python3-pathspec (sysroot):
  /usr/lib/python3.11/site-packages/pathspec-0.10.1.dist-info moved to /usr/lib/python3.11/site-packages/pathspec-0.10.3.dist-info
  /usr/lib/python3.11/site-packages/pathspec/py.typed was added

--===============0260240236106929260==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-pathspec/python3-pathspec: FILELIST: directory renamed /usr/lib/python3.11/site-packages/pathspec-0.10.1.dist-info -> /usr/lib/python3.11/site-packages/pathspec-0.10.3.dist-info, added "/usr/lib/python3.11/site-packages/pathspec/py.typed"
Changes to packages/core2-32-poky-linux/python3-pathspec (sysroot):
  /usr/lib/python3.11/site-packages/pathspec-0.10.1.dist-info moved to /usr/lib/python3.11/site-packages/pathspec-0.10.3.dist-info
  /usr/lib/python3.11/site-packages/pathspec/py.typed was added

--===============0260240236106929260==--

