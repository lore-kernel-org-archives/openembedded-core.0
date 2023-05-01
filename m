Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E67CA9EB7
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:26:04 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.107908.1682976353495150920
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Y8hEmPex;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010187d9352a04-3b1cd499-e5de-4494-863f-b342fd252c11-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976352;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=wQ4XkRdc3hhpx2HkDEM6NacOZqG3wRTxiR22Y6sKcm8=;
	b=Y8hEmPexA8u7Dfq+0+hFDgXVludk9aXfhEBMOhKgB2yM1Ih7oEIyE22uJg0266k3
	ZmvmtawM8OjdjoVzNOH3QLEtpmL+FG4CT8GtEvK3RnWexj+bUyFtk2pTQivKXseSDaI
	7xWUQmAQVWUKeJDq9admRaCnA5BHrATk6AEffkW4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976352;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=wQ4XkRdc3hhpx2HkDEM6NacOZqG3wRTxiR22Y6sKcm8=;
	b=ZTClmtFYsO84svJyoDoImLEcvJ9ktmMHacnWFH1+3My0xdI2Oh4BDMy8sZ4wQWSD
	8RlCMQAI7ulr2xlvFjonRWKZ/8IQFY02YcF+KS2l9JRmm2SoUN+OYGBbe0rJ8SxgfeH
	bp2BYV7Y1JASKzrjHJ+D2yjYLul5WH04Fcd0Scg0=
Content-Type: multipart/mixed; boundary="===============8258125906370645757=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xdpyinfo: upgrading to 1.3.4 SUCCEEDED
Message-ID: <01010187d9352a04-3b1cd499-e5de-4494-863f-b342fd252c11-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:52 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180679

--===============8258125906370645757==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xdpyinfo* to *1.3.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xdpyinfo-upgrade-1.3.3-1.3.4.patch
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
--===============8258125906370645757==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xdpyinfo-upgrade-1.3.3-1.3.4.patch"

RnJvbSA1ZGExMWY1ODU4ZjJmNmIzMzE0Nzk2MzExMjQ5ZjQ1ZTUyNzFkZWVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAxODo0MjowMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhk
cHlpbmZvOiB1cGdyYWRlIDEuMy4zIC0+IDEuMy40CgotLS0KIC4uLi94b3JnLWFwcC97eGRweWlu
Zm9fMS4zLjMuYmIgPT4geGRweWluZm9fMS4zLjQuYmJ9ICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1ncmFwaGljcy94b3JnLWFwcC97eGRweWluZm9fMS4zLjMuYmIgPT4geGRweWluZm9fMS4z
LjQuYmJ9ICg4OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBw
L3hkcHlpbmZvXzEuMy4zLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3hkcHlp
bmZvXzEuMy40LmJiCnNpbWlsYXJpdHkgaW5kZXggODglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1ncmFwaGljcy94b3JnLWFwcC94ZHB5aW5mb18xLjMuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3hvcmctYXBwL3hkcHlpbmZvXzEuMy40LmJiCmluZGV4IGU3NWE4NDBiN2Qu
LmFhYThhYTg5MDMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94
ZHB5aW5mb18xLjMuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveGRw
eWluZm9fMS4zLjQuYmIKQEAgLTE1LDYgKzE1LDYgQEAgUEUgPSAiMSIKIFNSQ19VUkkgKz0gImZp
bGU6Ly9kaXNhYmxlLXhrYi5wYXRjaCIKIAogU1JDX1VSSV9FWFQgPSAieHoiCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiMzU2ZDVmZDYyZjNlOThlZTM2ZDZiZWNmMWIzMmQ0YWI2MTEyZDYxODMzOWZi
NGI1OTJjY2ZmYmQ5ZTBmYzIwNiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJhOGFkYTU4MWRiZDcy
NjY0NDBkN2MzNzk0ZmE4OWVkZjZiOTliODg1N2ZjMmU4YzMxMDQyNjg0ZjNhZjQ4MjJiIgogCiBF
WFRSQV9PRUNPTkYgPSAiLS1kaXNhYmxlLXhrYiIKLS0gCjIuMzkuMgoK

--===============8258125906370645757==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/xdpyinfo: SRC_URI changed from "https://www.x.org/releases//individual/app/xdpyinfo-1.3.3.tar.xz file://disable-xkb.patch" to "https://www.x.org/releases//individual/app/xdpyinfo-1.3.4.tar.xz file://disable-xkb.patch"
packages/core2-32-poky-linux/xdpyinfo: PV changed from "1.3.3" to "1.3.4"
packages/core2-32-poky-linux/xdpyinfo: PKGV changed from 1.3.3 [default] to 1.3.4 [default]
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo-dbg: PKGSIZE changed from 59652 to 61192 (+3%)
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo-dbg: PV changed from "1.3.3" to "1.3.4"
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo-dbg: PKGV changed from 1.3.3 [default] to 1.3.4 [default]
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo-dev: PV changed from "1.3.3" to "1.3.4"
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo-dev: PKGV changed from 1.3.3 [default] to 1.3.4 [default]
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo-doc: PV changed from "1.3.3" to "1.3.4"
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo-doc: PKGV changed from 1.3.3 [default] to 1.3.4 [default]
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo-locale: PV changed from "1.3.3" to "1.3.4"
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo-locale: PKGV changed from 1.3.3 [default] to 1.3.4 [default]
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo-src: PKGSIZE changed from 45438 to 45378 (-0%)
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo-src: PV changed from "1.3.3" to "1.3.4"
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo-src: PKGV changed from 1.3.3 [default] to 1.3.4 [default]
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo-staticdev: PV changed from "1.3.3" to "1.3.4"
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo-staticdev: PKGV changed from 1.3.3 [default] to 1.3.4 [default]
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo: PV changed from "1.3.3" to "1.3.4"
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo: PKGV changed from 1.3.3 [default] to 1.3.4 [default]

--===============8258125906370645757==--

