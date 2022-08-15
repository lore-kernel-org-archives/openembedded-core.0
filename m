Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55820C3F6B0
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 18:57:02 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.6265.1660589821735369532
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 11:57:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Y2EwaoyZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 01010182a2ddcc63-e5ff066a-8029-41e8-a7ae-7a927c257e6b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1660589821;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GQy//AEdRBUsKAKgFbzXIHo4+myhRJj4RqUp2Jle8G4=;
	b=Y2EwaoyZUcsK4kCaKwGP9+thHd2vncFuwpyQNAIfiZ8blj1SnTsfi3iLPXc/yTDC
	1xRhPljRPkhdkwa5bKZ36bY3GHIrvJAau9mlbwBxQqYLAHXzQAn4ZiQ5nMBE9+RLraA
	d/gbppiBtdDVgDsA8z6r2d3rbpCLKqzUtbcSvuQA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1660589821;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GQy//AEdRBUsKAKgFbzXIHo4+myhRJj4RqUp2Jle8G4=;
	b=Wqq/FQeRMZ87pvXcQ76awoXs9U+QcekDCJJzFfACgFPFYpZZCvoZcSwrCfKYPaFO
	m6z5UGu0xnbVx8bg3Ufot6l163gUtSpfLn4CQt9e/pe78VMoemhQVUOThCHX9cHmqrr
	PHwDzIPGbNFpm9Jn7MGjee2/oOiQJvJc4ztc6cxo=
Content-Type: multipart/mixed; boundary="===============1588027346161258256=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sysklogd: upgrading to 2.4.4 SUCCEEDED
Message-ID: 
 <01010182a2ddcc63-e5ff066a-8029-41e8-a7ae-7a927c257e6b-000000@us-west-2.amazonses.com>
Date: Mon, 15 Aug 2022 18:57:01 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 18:57:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169393

--===============1588027346161258256==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *sysklogd* to *2.4.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sysklogd-upgrade-2.4.2-2.4.4.patch
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
--===============1588027346161258256==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sysklogd-upgrade-2.4.2-2.4.4.patch"

RnJvbSAzMmI5NmE5ODQ2YTZlMDlkYzQ4YWNlNjAxMWYyNmQ2MzI5MmU4ZjFiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXVnIDIwMjIgMTA6Mzg6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
eXNrbG9nZDogdXBncmFkZSAyLjQuMiAtPiAyLjQuNAoKLS0tCiAuLi4vc3lza2xvZ2Qve3N5c2ts
b2dkXzIuNC4yLmJiID0+IHN5c2tsb2dkXzIuNC40LmJifSAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvc3lza2xvZ2Qve3N5c2tsb2dkXzIuNC4yLmJiID0+IHN5c2tsb2dkXzIu
NC40LmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zeXNrbG9n
ZC9zeXNrbG9nZF8yLjQuMi5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zeXNrbG9nZC9zeXNr
bG9nZF8yLjQuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvc3lza2xvZ2Qvc3lza2xvZ2RfMi40LjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1leHRlbmRlZC9zeXNrbG9nZC9zeXNrbG9nZF8yLjQuNC5iYgppbmRleCA5NDhhY2JjZjU5
Li5hMTliNGY1OGViIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3lza2xvZ2Qv
c3lza2xvZ2RfMi40LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N5c2tsb2dkL3N5
c2tsb2dkXzIuNC40LmJiCkBAIC0xNCw3ICsxNCw3IEBAIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHVi
LmNvbS90cm9nbG9iaXQvc3lza2xvZ2QuZ2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMK
ICAgICAgICAgICAgZmlsZTovL3N5c2tsb2dkIFwKICAgICAgICAgICAgIgogCi1TUkNSRVYgPSAi
Nzg1MDU5MTM4ODhiNzFiMmZhMmU4NjE2NjM2ZmNjNDMwZmZhMzBiYiIKK1NSQ1JFViA9ICI1MWQ0
NzE1NDNjZTU5ZWFjZTZkZjZkYTBlNDI2NTg5MTFmMWZiOGMwIgogCiBTID0gIiR7V09SS0RJUn0v
Z2l0IgogCi0tIAoyLjMxLjEKCg==

--===============1588027346161258256==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/sysklogd: PV changed from "2.4.2" to "2.4.4"
packages/core2-32-poky-linux/sysklogd: PKGV changed from 2.4.2 [default] to 2.4.4 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-dbg: PV changed from "2.4.2" to "2.4.4"
packages/core2-32-poky-linux/sysklogd/sysklogd-dbg: PKGSIZE changed from 150976 to 150984 (+0%)
packages/core2-32-poky-linux/sysklogd/sysklogd-dbg: PKGV changed from 2.4.2 [default] to 2.4.4 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-dev: PV changed from "2.4.2" to "2.4.4"
packages/core2-32-poky-linux/sysklogd/sysklogd-dev: PKGV changed from 2.4.2 [default] to 2.4.4 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-doc: PV changed from "2.4.2" to "2.4.4"
packages/core2-32-poky-linux/sysklogd/sysklogd-doc: PKGSIZE changed from 90432 to 90965 (+1%)
packages/core2-32-poky-linux/sysklogd/sysklogd-doc: PKGV changed from 2.4.2 [default] to 2.4.4 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-locale: PV changed from "2.4.2" to "2.4.4"
packages/core2-32-poky-linux/sysklogd/sysklogd-locale: PKGV changed from 2.4.2 [default] to 2.4.4 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-src: PV changed from "2.4.2" to "2.4.4"
packages/core2-32-poky-linux/sysklogd/sysklogd-src: PKGSIZE changed from 146736 to 146769 (+0%)
packages/core2-32-poky-linux/sysklogd/sysklogd-src: PKGV changed from 2.4.2 [default] to 2.4.4 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-staticdev: PV changed from "2.4.2" to "2.4.4"
packages/core2-32-poky-linux/sysklogd/sysklogd-staticdev: PKGV changed from 2.4.2 [default] to 2.4.4 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd: PV changed from "2.4.2" to "2.4.4"
packages/core2-32-poky-linux/sysklogd/sysklogd: PKGV changed from 2.4.2 [default] to 2.4.4 [default]

--===============1588027346161258256==--

