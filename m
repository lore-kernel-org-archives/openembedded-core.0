Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D18DC88C97
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 18:01:30 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.13517.1681581684516033537
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 11:01:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=l0D2htUo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101878614419e-4840618c-d3ed-4d23-a66e-e3dabc44f6bf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1681581687;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=LNj/vjUFB255rdzC4Y3uzABPqp/KDOHQFYr+AiS8Ba4=;
	b=l0D2htUoep1jJvmDP5JW3N/fRCYLgGauAgQMOyhgXo5byjlXqAQg+TuHps2EiNJ+
	wv9QLiRE5xu6jzj46dTyk4xhR2IXNtFYdtA17vQu4/+6KPDnszmTGsStAtThuxuv310
	hQjgbA80SUyqqgamL7x0tcZ3tMDbTnLJje215TJw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1681581687;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=LNj/vjUFB255rdzC4Y3uzABPqp/KDOHQFYr+AiS8Ba4=;
	b=V8h2DNJaGL3sllQkUbwdDDhX6g4iKdUggOCgWrbekf/c2VHINAsVNiIG5u7ocQOf
	NrUXJBptf42SMfN9lJQLM71g/dcoITTUMWoDbFanH7Z8nCq5pDktOmp1HFxiw89BnDo
	XoB/F7MZm5xyLIQMfvhplf/KeioHxz3+ADaHni9k=
Content-Type: multipart/mixed; boundary="===============5383661511765057923=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libgit2: upgrading to 1.6.4 SUCCEEDED
Message-ID: <010101878614419e-4840618c-d3ed-4d23-a66e-e3dabc44f6bf-000000@us-west-2.amazonses.com>
Date: Sat, 15 Apr 2023 18:01:27 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 18:01:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180102

--===============5383661511765057923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libgit2* to *1.6.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libgit2-upgrade-1.6.3-1.6.4.patch
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
--===============5383661511765057923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libgit2: PKGV changed from 1.6.3 [default] to 1.6.4 [default]
packages/core2-32-poky-linux/libgit2: PV changed from "1.6.3" to "1.6.4"
packages/core2-32-poky-linux/libgit2/libgit2-dbg: PKGV changed from 1.6.3 [default] to 1.6.4 [default]
packages/core2-32-poky-linux/libgit2/libgit2-dbg: PV changed from "1.6.3" to "1.6.4"
packages/core2-32-poky-linux/libgit2/libgit2-dbg: PKGSIZE changed from 7910988 to 7911228 (+0%)
packages/core2-32-poky-linux/libgit2/libgit2-dbg: FILELIST: removed "/usr/lib/.debug/libgit2.so.1.6.3", added "/usr/lib/.debug/libgit2.so.1.6.4"
packages/core2-32-poky-linux/libgit2/libgit2-dev: PKGV changed from 1.6.3 [default] to 1.6.4 [default]
packages/core2-32-poky-linux/libgit2/libgit2-dev: PV changed from "1.6.3" to "1.6.4"
packages/core2-32-poky-linux/libgit2/libgit2-doc: PKGV changed from 1.6.3 [default] to 1.6.4 [default]
packages/core2-32-poky-linux/libgit2/libgit2-doc: PV changed from "1.6.3" to "1.6.4"
packages/core2-32-poky-linux/libgit2/libgit2-locale: PKGV changed from 1.6.3 [default] to 1.6.4 [default]
packages/core2-32-poky-linux/libgit2/libgit2-locale: PV changed from "1.6.3" to "1.6.4"
packages/core2-32-poky-linux/libgit2/libgit2-src: PKGV changed from 1.6.3 [default] to 1.6.4 [default]
packages/core2-32-poky-linux/libgit2/libgit2-src: PV changed from "1.6.3" to "1.6.4"
packages/core2-32-poky-linux/libgit2/libgit2-src: PKGSIZE changed from 4131836 to 4131873 (+0%)
packages/core2-32-poky-linux/libgit2/libgit2-staticdev: PKGV changed from 1.6.3 [default] to 1.6.4 [default]
packages/core2-32-poky-linux/libgit2/libgit2-staticdev: PV changed from "1.6.3" to "1.6.4"
packages/core2-32-poky-linux/libgit2/libgit2: PKGV changed from 1.6.3 [default] to 1.6.4 [default]
packages/core2-32-poky-linux/libgit2/libgit2: PV changed from "1.6.3" to "1.6.4"
packages/core2-32-poky-linux/libgit2/libgit2: FILELIST: removed "/usr/lib/libgit2.so.1.6.3", added "/usr/lib/libgit2.so.1.6.4"
Changes to packages/core2-32-poky-linux/libgit2 (sysroot):
  /usr/lib/libgit2.so.1.6 changed symlink target from libgit2.so.1.6.3 to libgit2.so.1.6.4
  /usr/lib/libgit2.so.1.6.3 moved to /usr/lib/libgit2.so.1.6.4

--===============5383661511765057923==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libgit2-upgrade-1.6.3-1.6.4.patch"

RnJvbSAwMGUyYTc1MmM1MjU4YTcyMWU4YjM2ZWVhMDNiZGRjOTJlZWFmNWE0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgQXByIDIwMjMgMTg6MDA6MTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJnaXQyOiB1cGdyYWRlIDEuNi4zIC0+IDEuNi40CgotLS0KIC4uLi9saWJnaXQyL3tsaWJnaXQy
XzEuNi4zLmJiID0+IGxpYmdpdDJfMS42LjQuYmJ9ICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L2xpYmdpdDIve2xpYmdpdDJfMS42LjMuYmIgPT4gbGliZ2l0Ml8xLjYuNC5i
Yn0gKDkyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJnaXQyL2xpYmdp
dDJfMS42LjMuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJnaXQyL2xpYmdpdDJfMS42LjQu
YmIKc2ltaWxhcml0eSBpbmRleCA5MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQv
bGliZ2l0Mi9saWJnaXQyXzEuNi4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9s
aWJnaXQyL2xpYmdpdDJfMS42LjQuYmIKaW5kZXggY2FiN2Q3YTIwYS4uZmZlMDBkODY1MyAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2l0Mi9saWJnaXQyXzEuNi4zLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdpdDIvbGliZ2l0Ml8xLjYuNC5iYgpAQCAtNiw3
ICs2LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NWJkZjQ3YmJj
OWEzOWRjNmNlMDc2ZDU5ZTMyMmRjMTciCiBERVBFTkRTID0gImN1cmwgb3BlbnNzbCB6bGliIGxp
YnNzaDIgbGliZ2NyeXB0IGxpYnBjcmUyIgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20v
bGliZ2l0Mi9saWJnaXQyLmdpdDticmFuY2g9bWFpbnQvdjEuNjtwcm90b2NvbD1odHRwcyIKLVNS
Q1JFViA9ICJjMDU4YWE4N2RjZTRjNjdhM2I4NmIzMzQ5YmVlYmQ2NGI3YmVkY2QzIgorU1JDUkVW
ID0gImU2MzI1MzUxY2VlZTU4Y2Y1NmY1OGJkY2U2MWIzODkwNzgwNTU0NGYiCiAKIFMgPSAiJHtX
T1JLRElSfS9naXQiCiAKLS0gCjIuMzkuMgoK

--===============5383661511765057923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libgit2/libgit2: FILELIST: removed "/usr/lib/libgit2.so.1.6.3", added "/usr/lib/libgit2.so.1.6.4"
Changes to packages/core2-32-poky-linux/libgit2 (sysroot):
  /usr/lib/libgit2.so.1.6 changed symlink target from libgit2.so.1.6.3 to libgit2.so.1.6.4
  /usr/lib/libgit2.so.1.6.3 moved to /usr/lib/libgit2.so.1.6.4

--===============5383661511765057923==--

