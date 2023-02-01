Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA389C63797
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:35 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.30018.1675272857985470049
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=H3BmhkPm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101860e0b316a-d44c556a-19a8-4048-96a3-b42a1795c7bb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272860;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WCoRNXwgj130iwqNVi/ip7IfM57wbFZR9f6AKtds/us=;
	b=H3BmhkPmuyZZzUXcxKsRl0POXEGTsv1ov9LXHc2IP0/Pqvko/TmkNl34rAF9wTP1
	xeDl1p2SblW1bqpPKnXWMfSihUr++NMl0PqmPmZ66d7UAlDWMY1OZAr0RTncAdjslAD
	Pjx3AsSeKuoWQr70NJ8cMwCmmkZppra0VcyRnv5A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272860;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WCoRNXwgj130iwqNVi/ip7IfM57wbFZR9f6AKtds/us=;
	b=HrDWg0NuBJ+ihgpyfQ122Asu/b0NlmdzUH8dBNWCKxDuPDJcufTtGeqaObXfBIfe
	pjJ68pz0x6ozZ4jrVC0pDZ6HP6L0iKJnszvoPmGN+Q6mrshNPDjUjsNVzLMpUMmQPwt
	y5VJstbE9ReA8kw9wGuHmf4i+GuMWfK/h3srV5Ik=
Content-Type: multipart/mixed; boundary="===============7542252560477402127=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] hwlatdetect: upgrading to 2.5 SUCCEEDED
Message-ID: <010101860e0b316a-d44c556a-19a8-4048-96a3-b42a1795c7bb-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:20 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176658

--===============7542252560477402127==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *hwlatdetect* to *2.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-hwlatdetect-upgrade-2.4-2.5.patch
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
--===============7542252560477402127==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-dbg: PV changed from "2.4" to "2.5"
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-dbg: PKGV changed from 2.4 [default] to 2.5 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-dev: PV changed from "2.4" to "2.5"
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-dev: PKGV changed from 2.4 [default] to 2.5 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-doc: PV changed from "2.4" to "2.5"
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-doc: PKGV changed from 2.4 [default] to 2.5 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-locale: PV changed from "2.4" to "2.5"
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-locale: PKGV changed from 2.4 [default] to 2.5 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-src: PV changed from "2.4" to "2.5"
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-src: PKGV changed from 2.4 [default] to 2.5 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-staticdev: PV changed from "2.4" to "2.5"
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect-staticdev: PKGV changed from 2.4 [default] to 2.5 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect: PV changed from "2.4" to "2.5"
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect: PKGV changed from 2.4 [default] to 2.5 [default]
packages/core2-32-poky-linux/hwlatdetect/hwlatdetect: PKGSIZE changed from 17231 to 17162 (-0%)
packages/core2-32-poky-linux/hwlatdetect: PV changed from "2.4" to "2.5"
packages/core2-32-poky-linux/hwlatdetect: PKGV changed from 2.4 [default] to 2.5 [default]

--===============7542252560477402127==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-hwlatdetect-upgrade-2.4-2.5.patch"

RnJvbSBjNjIxZWUyZWY4ODBkMGMxODc4ZjAyMzRjNDZmOTEzZDgzZTMwMWQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxNjo1NDo1NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGh3
bGF0ZGV0ZWN0OiB1cGdyYWRlIDIuNCAtPiAyLjUKCi0tLQogbWV0YS9yZWNpcGVzLXJ0L3J0LXRl
c3RzL3J0LXRlc3RzLmluYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtcnQvcnQtdGVzdHMv
cnQtdGVzdHMuaW5jIGIvbWV0YS9yZWNpcGVzLXJ0L3J0LXRlc3RzL3J0LXRlc3RzLmluYwppbmRl
eCA5M2ZhMzkwYmJhLi4wNDgxYmY2MDI4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtcnQvcnQt
dGVzdHMvcnQtdGVzdHMuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1ydC9ydC10ZXN0cy9ydC10ZXN0
cy5pbmMKQEAgLTEsNSArMSw1IEBACi1TUkNSRVYgPSAiY2E0YTYyOTNkYTIzYWQwZmQ3MDhlYTFm
ZWNiMmQ0NjVhOWVhNjA5MyIKLVBWID0gIjIuNCIKK1NSQ1JFViA9ICI0NTc5YjlhNmQ4NWFlNTI4
Zjc2ZTkyNDIxZWI1ZTdiMzNjZDI2YjE3IgorUFYgPSAiMi41IgogUEUgPSAiMSIKIAogU1JDX1VS
SSA9ICJnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL3V0aWxzL3J0LXRlc3RzL3J0LXRlc3Rz
LmdpdDticmFuY2g9bWFpbiIKLS0gCjIuMzcuMwoK

--===============7542252560477402127==--

