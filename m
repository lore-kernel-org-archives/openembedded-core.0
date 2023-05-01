Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB92CA9EB3
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:26:04 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.107900.1682976351921414507
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Ml3W6+3p;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010187d9352b5b-e899e818-eca7-47cb-b1f3-858187031f16-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976353;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=A4K21WlKsH7vfzXmxE4ZmOA+id5PGlHxoB47ZHKaxEU=;
	b=Ml3W6+3poqGu3aq15Lj+d9Tq5kshM6FdLrFp8XVoSWSsEzDTILP8n3EZhgJUdyIN
	pPdTYa5NXgUpIhrfJjL0x/JABBvdY3GQ6bhvcXrO+0OEhnoyM++F7nUyTWOQ/a0FSMA
	7+ONLkgZqZ/hRdAE96pzQpMUPGe4akqC2cwo1aq4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976353;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=A4K21WlKsH7vfzXmxE4ZmOA+id5PGlHxoB47ZHKaxEU=;
	b=Txqd4xiwRBqKh3omRTIddE4yfWWaW9h/sU9MpJuZjM0SDRnYGzaq/N+5lG2SeXcy
	czYk3Heif98FSiDVAE9DzVkwWRPn3Ua3ZBG3uds4t/m3gUm6wbeD94WAr2Ir48Tx+V/
	2OSrQfvy+xOx+DhFANvHQHeu6t+fOlbAhTZcg9Rc=
Content-Type: multipart/mixed; boundary="===============5453852278717965899=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cryptodev-linux: upgrading to 1.13 SUCCEEDED
Message-ID: <01010187d9352b5b-e899e818-eca7-47cb-b1f3-858187031f16-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180682

--===============5453852278717965899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cryptodev-linux* to *1.13* has Succeeded.

Next steps:
    - apply the patch: git am 0001-cryptodev-linux-upgrade-1.12-1.13.patch
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
--===============5453852278717965899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux-dbg: PKGV changed from 1.12 [default] to 1.13 [default]
packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux-dbg: PV changed from "1.12" to "1.13"
packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux-dev: PKGSIZE changed from 9848 to 9914 (+1%)
packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux-dev: PKGV changed from 1.12 [default] to 1.13 [default]
packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux-dev: PV changed from "1.12" to "1.13"
packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux-doc: PKGV changed from 1.12 [default] to 1.13 [default]
packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux-doc: PV changed from "1.12" to "1.13"
packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux-locale: PKGV changed from 1.12 [default] to 1.13 [default]
packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux-locale: PV changed from "1.12" to "1.13"
packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux-src: PKGV changed from 1.12 [default] to 1.13 [default]
packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux-src: PV changed from "1.12" to "1.13"
packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux-staticdev: PKGV changed from 1.12 [default] to 1.13 [default]
packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux-staticdev: PV changed from "1.12" to "1.13"
packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux: PKGV changed from 1.12 [default] to 1.13 [default]
packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux: PV changed from "1.12" to "1.13"
packages/core2-32-poky-linux/cryptodev-linux: PKGV changed from 1.12 [default] to 1.13 [default]
packages/core2-32-poky-linux/cryptodev-linux: PV changed from "1.12" to "1.13"

--===============5453852278717965899==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cryptodev-linux-upgrade-1.12-1.13.patch"

RnJvbSA2ZWMzZDU4M2EwZjRiYmEyZTBhYTU5ZTExNjQzYjUxZDg0MGRiOGFiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAxOTowODo1MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNy
eXB0b2Rldi1saW51eDogdXBncmFkZSAxLjEyIC0+IDEuMTMKCi0tLQogLi4uL3tjcnlwdG9kZXYt
bGludXhfMS4xMi5iYiA9PiBjcnlwdG9kZXYtbGludXhfMS4xMy5iYn0gICAgICAgIHwgMAogbWV0
YS9yZWNpcGVzLWtlcm5lbC9jcnlwdG9kZXYvY3J5cHRvZGV2LmluYyAgICAgICAgICAgICAgICAg
ICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1rZXJuZWwvY3J5cHRvZGV2L3tjcnlwdG9kZXYtbGludXhf
MS4xMi5iYiA9PiBjcnlwdG9kZXYtbGludXhfMS4xMy5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWtlcm5lbC9jcnlwdG9kZXYvY3J5cHRvZGV2LWxpbnV4XzEuMTIuYmIgYi9t
ZXRhL3JlY2lwZXMta2VybmVsL2NyeXB0b2Rldi9jcnlwdG9kZXYtbGludXhfMS4xMy5iYgpzaW1p
bGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWtlcm5lbC9jcnlwdG9k
ZXYvY3J5cHRvZGV2LWxpbnV4XzEuMTIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1rZXJuZWwv
Y3J5cHRvZGV2L2NyeXB0b2Rldi1saW51eF8xLjEzLmJiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMta2VybmVsL2NyeXB0b2Rldi9jcnlwdG9kZXYuaW5jIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9j
cnlwdG9kZXYvY3J5cHRvZGV2LmluYwppbmRleCBlZjM0MmExNTdjLi42MWM2ODhmMWQwIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL2NyeXB0b2Rldi9jcnlwdG9kZXYuaW5jCisrKyBi
L21ldGEvcmVjaXBlcy1rZXJuZWwvY3J5cHRvZGV2L2NyeXB0b2Rldi5pbmMKQEAgLTEwLDcgKzEw
LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9YjIzNGVlNGQ2OWY1
ZmNlNDQ4NmE4MGZkYWY0YTQyNjMiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9jcnlw
dG9kZXYtbGludXgvY3J5cHRvZGV2LWxpbnV4O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMg
XAogICAgICAgICAgICAiCi1TUkNSRVYgPSAiZTBjMjVlMjg5ZDZiYWYxZDgzYzJiOWNiNTIzZDNi
YzIzN2QwYzBjOSIKK1NSQ1JFViA9ICI3OTVmNWZkYTE0ODVkNDQ3Y2RiYWQzNDJlODMwNGJlMzE3
ZDRmN2U4IgogCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCi0tIAoyLjM5LjIKCg==

--===============5453852278717965899==--

