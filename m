Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60213C88C95
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:42 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.7541.1685693434916213724
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=a0zc7wRJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101887b288cb1-3667f662-dd3d-4ec3-88a3-08dfc39d6846-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693435;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=1u7BJtCElF/3bAs/h9h3l3FeO5XFmKuFvwVkx7oh/Ys=;
	b=a0zc7wRJmFZNYtuXJUjy5KvhVYfbPuVQfF48LKNG9CcENUDNI2Pf8Sz0Yz6t1vjA
	jWp8l8NyCNT3wOqjVC9MvxbzCfZlj4DQkiZBw320a5r4yOsgRKMVmgJb35Q6AKpIdye
	hBsxiNaDUFqhP2Y3JMSyujTa84yyz7Y5BfHIgr1Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693435;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=1u7BJtCElF/3bAs/h9h3l3FeO5XFmKuFvwVkx7oh/Ys=;
	b=qZd1r48RRdZv/xlZ/KS54GfzZ9SaN94rVkygeWY8JfM+v595b1/qM5gSFji5wH+P
	qxU0TA0/ocnThmboFDNWLtR02uFc12RXCgGx3V13QVGdbBnaCM55dVrz59NtlRnYG27
	6IaAu8A0rI0Pip/7Ew9lH7dNIGBrc/Lc25l6+pLU=
Content-Type: multipart/mixed; boundary="===============8940194801089868628=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xdpyinfo: upgrading to 1.3.4 SUCCEEDED
Message-ID: <010101887b288cb1-3667f662-dd3d-4ec3-88a3-08dfc39d6846-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182259

--===============8940194801089868628==
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
--===============8940194801089868628==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xdpyinfo-upgrade-1.3.3-1.3.4.patch"

RnJvbSBjZDA2ZmY0MTQ4MjBiY2JhMDJlMmMwZGQ1MWZkOTI3ZDc5MmY0OTgzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMiBKdW4gMjAyMyAwMTo1NzoyNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhk
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

--===============8940194801089868628==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/xdpyinfo: PV changed from "1.3.3" to "1.3.4"
packages/core2-32-poky-linux/xdpyinfo: PKGV changed from 1.3.3 [default] to 1.3.4 [default]
packages/core2-32-poky-linux/xdpyinfo: SRC_URI changed from "https://www.x.org/releases//individual/app/xdpyinfo-1.3.3.tar.xz file://disable-xkb.patch" to "https://www.x.org/releases//individual/app/xdpyinfo-1.3.4.tar.xz file://disable-xkb.patch"
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo-dbg: PV changed from "1.3.3" to "1.3.4"
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo-dbg: PKGV changed from 1.3.3 [default] to 1.3.4 [default]
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo-dbg: PKGSIZE changed from 60972 to 62604 (+3%)
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo-dev: PV changed from "1.3.3" to "1.3.4"
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo-dev: PKGV changed from 1.3.3 [default] to 1.3.4 [default]
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo-doc: PV changed from "1.3.3" to "1.3.4"
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo-doc: PKGV changed from 1.3.3 [default] to 1.3.4 [default]
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo-locale: PV changed from "1.3.3" to "1.3.4"
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo-locale: PKGV changed from 1.3.3 [default] to 1.3.4 [default]
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo-src: PV changed from "1.3.3" to "1.3.4"
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo-src: PKGV changed from 1.3.3 [default] to 1.3.4 [default]
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo-src: PKGSIZE changed from 45438 to 45378 (-0%)
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo-staticdev: PV changed from "1.3.3" to "1.3.4"
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo-staticdev: PKGV changed from 1.3.3 [default] to 1.3.4 [default]
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo: PV changed from "1.3.3" to "1.3.4"
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo: PKGV changed from 1.3.3 [default] to 1.3.4 [default]

--===============8940194801089868628==--

