Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAF6AC7EE33
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:15 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.3716.1684186748382786239
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=UlEtMuBN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010188215a6430-a6a39438-122a-41a1-a64b-1c3a06796ded-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186752;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=47Sszzqs8vR6wKxRP9Ey0rNFFPqnigwaDSEn2xRljwM=;
	b=UlEtMuBNmKO1tgQa49LvuC9lwMvS8syZNZGQ9SFfrwsmK8n8VTaNpo9WRV4wmt8A
	s8/hqTj0wJb6+J10bp1G2eQAyab47mb+Rwo71XIW6GVyrOUcggHEcnC+6csUvntkFbM
	Rd7clauKgq4tbuSXD1eJcc6HowXXT0B0EgE/md9I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186752;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=47Sszzqs8vR6wKxRP9Ey0rNFFPqnigwaDSEn2xRljwM=;
	b=aRwqUK2LMNvQm6wAZm+fF2uA6w+55llTagwrR3t1cvZZ3HXZkq2SGAAyXvDMZiUp
	Rd2egJo5wMPP8jQmLvK1m6N83vaJBX9cBcc2De9uN+deUysIMZTzCfwZJ1dhjMB51Ji
	OOCts5XvHJCDZUwRZVs02qAUP2zyhAI8hybHEbus=
Content-Type: multipart/mixed; boundary="===============6276921944173065577=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libevdev: upgrading to 1.13.1 SUCCEEDED
Message-ID: <01010188215a6430-a6a39438-122a-41a1-a64b-1c3a06796ded-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181382

--===============6276921944173065577==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libevdev* to *1.13.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libevdev-upgrade-1.13.0-1.13.1.patch
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
--===============6276921944173065577==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libevdev: SRC_URI changed from "http://www.freedesktop.org/software/libevdev/libevdev-1.13.0.tar.xz" to "http://www.freedesktop.org/software/libevdev/libevdev-1.13.1.tar.xz"
packages/core2-32-poky-linux/libevdev: PV changed from "1.13.0" to "1.13.1"
packages/core2-32-poky-linux/libevdev: PKGV changed from 1.13.0 [default] to 1.13.1 [default]
packages/core2-32-poky-linux/libevdev/libevdev-dbg: PV changed from "1.13.0" to "1.13.1"
packages/core2-32-poky-linux/libevdev/libevdev-dbg: PKGV changed from 1.13.0 [default] to 1.13.1 [default]
packages/core2-32-poky-linux/libevdev/libevdev-dev: PV changed from "1.13.0" to "1.13.1"
packages/core2-32-poky-linux/libevdev/libevdev-dev: PKGV changed from 1.13.0 [default] to 1.13.1 [default]
packages/core2-32-poky-linux/libevdev/libevdev-doc: PV changed from "1.13.0" to "1.13.1"
packages/core2-32-poky-linux/libevdev/libevdev-doc: PKGV changed from 1.13.0 [default] to 1.13.1 [default]
packages/core2-32-poky-linux/libevdev/libevdev-locale: PV changed from "1.13.0" to "1.13.1"
packages/core2-32-poky-linux/libevdev/libevdev-locale: PKGV changed from 1.13.0 [default] to 1.13.1 [default]
packages/core2-32-poky-linux/libevdev/libevdev-src: PV changed from "1.13.0" to "1.13.1"
packages/core2-32-poky-linux/libevdev/libevdev-src: PKGSIZE changed from 283345 to 283857 (+0%)
packages/core2-32-poky-linux/libevdev/libevdev-src: PKGV changed from 1.13.0 [default] to 1.13.1 [default]
packages/core2-32-poky-linux/libevdev/libevdev-staticdev: PV changed from "1.13.0" to "1.13.1"
packages/core2-32-poky-linux/libevdev/libevdev-staticdev: PKGV changed from 1.13.0 [default] to 1.13.1 [default]
packages/core2-32-poky-linux/libevdev/libevdev: PV changed from "1.13.0" to "1.13.1"
packages/core2-32-poky-linux/libevdev/libevdev: PKGV changed from 1.13.0 [default] to 1.13.1 [default]

--===============6276921944173065577==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libevdev-upgrade-1.13.0-1.13.1.patch"

RnJvbSBhODU5MmI2ZjI3MzAxNTdmOWZjZmZmMjc5MWVlZDc4MDI4NjQyMWM1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMjA6NTY6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJldmRldjogdXBncmFkZSAxLjEzLjAgLT4gMS4xMy4xCgotLS0KIC4uLi9saWJldmRldi97bGli
ZXZkZXZfMS4xMy4wLmJiID0+IGxpYmV2ZGV2XzEuMTMuMS5iYn0gICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L2xpYmV2ZGV2L3tsaWJldmRldl8xLjEzLjAuYmIgPT4gbGliZXZkZXZf
MS4xMy4xLmJifSAoODclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmV2
ZGV2L2xpYmV2ZGV2XzEuMTMuMC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmV2ZGV2L2xp
YmV2ZGV2XzEuMTMuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDg3JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJldmRldi9saWJldmRldl8xLjEzLjAuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L2xpYmV2ZGV2L2xpYmV2ZGV2XzEuMTMuMS5iYgppbmRleCBkZGNjNGI2
MTI5Li44NWNmZDc4NTA3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJldmRl
di9saWJldmRldl8xLjEzLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZXZkZXYv
bGliZXZkZXZfMS4xMy4xLmJiCkBAIC0xMCw3ICsxMCw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0NPUFlJTkc7bWQ1PTgwYzU1MGIzMTk3YmNiOGRhN2Q3NTU3ZWJjYzNmYzQ2IFwKICAg
ICAgICAgICAgICAgICAgICAgIgogCiBTUkNfVVJJID0gImh0dHA6Ly93d3cuZnJlZWRlc2t0b3Au
b3JnL3NvZnR3YXJlL2xpYmV2ZGV2LyR7QlB9LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICI5ZWRmMjAwNmNjODZhNTA1NTI3OTY0N2MzOGVjOTIzZDExYTgyMWVlNGRjMmMzMDMzZThkMjBl
OGVlMjM3Y2Q5IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjA2YTc3YmYyYWM1Yzk5MzMwNTg4MmJj
MTY0MTAxN2Y1YmVjMTU5MmQ2ZDFiNjQ3ODdiYWQ0OTJhYjM0ZjJmMzYiCiAKIGluaGVyaXQgYXV0
b3Rvb2xzIHBrZ2NvbmZpZwogCi0tIAoyLjM5LjIKCg==

--===============6276921944173065577==--

