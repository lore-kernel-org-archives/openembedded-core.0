Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A70CA9ECB
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:17 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.3711.1684186747687203807
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VD4nVwGb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010188215a502c-0bb39f10-5311-4ef6-b810-dd9f157d62c6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186747;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4WnzOlF+DfxU0R7pKBjBuSRiFFV9jy7kuMVc3DcQYh8=;
	b=VD4nVwGby8k7ITDvJDX8kjgBtbFb6Yomhe7TWVW0teo9EF5PdmiU8eMsifOgJkAs
	0gTm5GsOukdu8e0ntxxU18OWE1xawmwl8m8xdQsHelSJ9e1eSeJ4Oh6tPCzN9RmgRst
	6a8YJefZYd8v4hw7+J/gZxWD3wS0NoHKSuG2rdgg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186747;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4WnzOlF+DfxU0R7pKBjBuSRiFFV9jy7kuMVc3DcQYh8=;
	b=NZhKeMekATFhVfZKc9JdTUMsBzzM8lUauf+2ZDzJqn9no7NpzDFvuPKNsr5l1Ec8
	WiZfF9slHFbZkpVSVuqWDqMJNQ2uSSnqo+rCMPZcrJQBRJYIKiUdUuP9HypNroIIgkP
	e4T/lcmGri2hTvgK8aUeTBIcPYAmp1vI8lM92Ydg=
Content-Type: multipart/mixed; boundary="===============1964491911398517314=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pkgconf: upgrading to 1.9.5 SUCCEEDED
Message-ID: <01010188215a502c-0bb39f10-5311-4ef6-b810-dd9f157d62c6-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181302

--===============1964491911398517314==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *pkgconf* to *1.9.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pkgconf-upgrade-1.9.4-1.9.5.patch
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
--===============1964491911398517314==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/pkgconf: PKGV changed from 1.9.4 [default] to 1.9.5 [default]
packages/core2-32-poky-linux/pkgconf: PV changed from "1.9.4" to "1.9.5"
packages/core2-32-poky-linux/pkgconf: SRC_URI changed from "https://distfiles.dereferenced.org/pkgconf/pkgconf-1.9.4.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in" to "https://distfiles.dereferenced.org/pkgconf/pkgconf-1.9.5.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in"
packages/core2-32-poky-linux/pkgconf/pkgconf-dbg: PKGV changed from 1.9.4 [default] to 1.9.5 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf-dbg: PV changed from "1.9.4" to "1.9.5"
packages/core2-32-poky-linux/pkgconf/pkgconf-dbg: PKGSIZE changed from 255984 to 255964 (-0%)
packages/core2-32-poky-linux/pkgconf/pkgconf-dev: PKGV changed from 1.9.4 [default] to 1.9.5 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf-dev: PV changed from "1.9.4" to "1.9.5"
packages/core2-32-poky-linux/pkgconf/pkgconf-dev: PKGSIZE changed from 24018 to 24019 (+0%)
packages/core2-32-poky-linux/pkgconf/pkgconf-doc: PKGV changed from 1.9.4 [default] to 1.9.5 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf-doc: PV changed from "1.9.4" to "1.9.5"
packages/core2-32-poky-linux/pkgconf/pkgconf-locale: PKGV changed from 1.9.4 [default] to 1.9.5 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf-locale: PV changed from "1.9.4" to "1.9.5"
packages/core2-32-poky-linux/pkgconf/pkgconf-src: PKGV changed from 1.9.4 [default] to 1.9.5 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf-src: PV changed from "1.9.4" to "1.9.5"
packages/core2-32-poky-linux/pkgconf/pkgconf-src: PKGSIZE changed from 268613 to 268524 (-0%)
packages/core2-32-poky-linux/pkgconf/pkgconf-staticdev: PKGV changed from 1.9.4 [default] to 1.9.5 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf-staticdev: PV changed from "1.9.4" to "1.9.5"
packages/core2-32-poky-linux/pkgconf/pkgconf: PKGV changed from 1.9.4 [default] to 1.9.5 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf: PV changed from "1.9.4" to "1.9.5"

--===============1964491911398517314==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pkgconf-upgrade-1.9.4-1.9.5.patch"

RnJvbSAxYmQ5YWYzNTNlY2YxNGFmYzcxMGU0NjliODc2NWE3ZjRkM2ZkMTAxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMDk6NDU6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
a2djb25mOiB1cGdyYWRlIDEuOS40IC0+IDEuOS41CgotLS0KIC4uLi9wa2djb25mL3twa2djb25m
XzEuOS40LmJiID0+IHBrZ2NvbmZfMS45LjUuYmJ9ICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9wa2djb25mL3twa2djb25mXzEuOS40LmJiID0+IHBrZ2NvbmZfMS45LjUu
YmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BrZ2NvbmYvcGtn
Y29uZl8xLjkuNC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wa2djb25mL3BrZ2NvbmZfMS45
LjUuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3BrZ2NvbmYvcGtnY29uZl8xLjkuNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3BrZ2NvbmYvcGtnY29uZl8xLjkuNS5iYgppbmRleCBhYjBmMzcxMDkzLi40YmRmMDNjNTc0
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGtnY29uZi9wa2djb25mXzEuOS40
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wa2djb25mL3BrZ2NvbmZfMS45LjUuYmIK
QEAgLTIwLDcgKzIwLDcgQEAgU1JDX1VSSSA9ICJcCiAgICAgZmlsZTovL3BrZy1jb25maWctbmF0
aXZlLmluIFwKICAgICBmaWxlOi8vcGtnLWNvbmZpZy1lc2RrLmluIFwKICIKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICJkYWNjZjFiYmU1YTMwZDE0OWI1NTZjN2QyZmZmZmVhZmQ3NmQ3YjUxNGUyNDky
NzFhYmRkNTAxNTMzYzFkOGFlIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjFhYzE2NTZkZWJiMjc0
OTc1NjMwMzZmN2JmZmMyODE0OTBmODNmOWI4NDU3YzBkNjBiY2ZiNjM4ZmI2YjYxNzEiCiAKIGlu
aGVyaXQgYXV0b3Rvb2xzCiAKLS0gCjIuMzkuMgoK

--===============1964491911398517314==--

