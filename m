Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22BEBC77B7D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 15:55:32 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.12303.1678895727616560332
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 08:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=XTVWeXcf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010186e5fbc073-691b2336-af97-48c6-8540-1dfc66f081b2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1678895726;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vNumwrvoNoOIYbDcio2sPBdvQn2wBzc6gpMRBWcEMAc=;
	b=XTVWeXcfAQhQ7uXN+LTiE9nrXZG/ydEIdkpTEMXoHdkELtge4kH9jFrBF3slOmWZ
	ySIzwH0O2mcpujPK3CdNphZLTQJvPj8lC2jU6PTDE74vP2dchDeLnvWc8Umi90ngZaC
	qMxFu4ldRERYhtrAwEpjWb//agtY3pYUsXD6v76Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1678895726;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vNumwrvoNoOIYbDcio2sPBdvQn2wBzc6gpMRBWcEMAc=;
	b=ZrukU089eb9zVNwRYCE2cJxuzl2B4L77+8yWNmQRQPQpvZmJcRMVz9LKzAAX6Idv
	rzxE8l9H7LFdKPiyE51maoMKAtS4NYYcW7JLBTPhjPLliW13YQvMAEYSbdqgoQ73O66
	pNAauCb8VyNEWutEGhE93nDDiw+PDLLMsb4MAwRs=
Content-Type: multipart/mixed; boundary="===============3172590735020593980=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libhandy: upgrading to 1.8.2 SUCCEEDED
Message-ID: <01010186e5fbc073-691b2336-af97-48c6-8540-1dfc66f081b2-000000@us-west-2.amazonses.com>
Date: Wed, 15 Mar 2023 15:55:26 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 15:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178620

--===============3172590735020593980==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libhandy* to *1.8.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libhandy-upgrade-1.8.1-1.8.2.patch
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
--===============3172590735020593980==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libhandy/libhandy-locale-sl: PKGSIZE changed from 11786 to 18409 (+56%)

--===============3172590735020593980==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libhandy-upgrade-1.8.1-1.8.2.patch"

RnJvbSAyZjIwNDkxMTY3YzI0ZjIxNzc5N2E3MmFhOWIyNDg0N2Y2NTAwMjZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWFyIDIwMjMgMTE6Mjk6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJoYW5keTogdXBncmFkZSAxLjguMSAtPiAxLjguMgoKLS0tCiAuLi4vbGliaGFuZHkve2xpYmhh
bmR5XzEuOC4xLmJiID0+IGxpYmhhbmR5XzEuOC4yLmJifSAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZ25vbWUvbGliaGFuZHkve2xpYmhhbmR5XzEuOC4xLmJiID0+IGxpYmhhbmR5XzEuOC4y
LmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9saWJoYW5keS9saWJo
YW5keV8xLjguMS5iYiBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJoYW5keS9saWJoYW5keV8xLjgu
Mi5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ25vbWUv
bGliaGFuZHkvbGliaGFuZHlfMS44LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1nbm9tZS9s
aWJoYW5keS9saWJoYW5keV8xLjguMi5iYgppbmRleCA0MWM4ZTliZmI4Li5lODYzZThkMTNiIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvbGliaGFuZHkvbGliaGFuZHlfMS44LjEuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2xpYmhhbmR5L2xpYmhhbmR5XzEuOC4yLmJiCkBAIC0x
MCw3ICsxMCw3IEBAIExJQ0VOU0UgPSAiTEdQTC0yLjEtb25seSIKIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkc7bWQ1PTRmYmQ2NTM4MGNkZDI1NTk1MTA3OTAwOGIzNjQ1MTZjIgog
CiBTUkNfVVJJID0gImdpdDovL2dpdGxhYi5nbm9tZS5vcmcvR05PTUUvbGliaGFuZHkuZ2l0O3By
b3RvY29sPWh0dHBzO2JyYW5jaD1saWJoYW5keS0xLTgiCi1TUkNSRVYgPSAiZjA2YzFiZmE5NWEz
MTYwNTc1YjM2MzE1YzZkOTQzNzM3NmQ4YWY3NyIKK1NSQ1JFViA9ICI0OGFlN2VjMGY3ZjllZTVm
NjY2ZGEzOGIwZTM5ZTY2ODc0OTU3MTY2IgogUyA9ICIke1dPUktESVJ9L2dpdCIKIAogVVBTVFJF
QU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAiKD9QPHB2ZXI+XGQrXC4oXGQqWzAyNDY4XSkrKFwuXGQr
KSkiCi0tIAoyLjM5LjIKCg==

--===============3172590735020593980==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libhandy: PV changed from "1.8.1" to "1.8.2"
packages/core2-32-poky-linux/libhandy: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-dbg: PV changed from "1.8.1" to "1.8.2"
packages/core2-32-poky-linux/libhandy/libhandy-dbg: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-dbg: PKGSIZE changed from 2275864 to 2278320 (+0%)
packages/core2-32-poky-linux/libhandy/libhandy-dev: PV changed from "1.8.1" to "1.8.2"
packages/core2-32-poky-linux/libhandy/libhandy-dev: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-dev: PKGSIZE changed from 886083 to 886088 (+0%)
packages/core2-32-poky-linux/libhandy/libhandy-doc: PV changed from "1.8.1" to "1.8.2"
packages/core2-32-poky-linux/libhandy/libhandy-doc: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-examples: PV changed from "1.8.1" to "1.8.2"
packages/core2-32-poky-linux/libhandy/libhandy-examples: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-ca: PV changed from "1.8.1" to "1.8.2"
packages/core2-32-poky-linux/libhandy/libhandy-locale-ca: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-cs: PV changed from "1.8.1" to "1.8.2"
packages/core2-32-poky-linux/libhandy/libhandy-locale-cs: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-de: PV changed from "1.8.1" to "1.8.2"
packages/core2-32-poky-linux/libhandy/libhandy-locale-de: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-en-gb: PV changed from "1.8.1" to "1.8.2"
packages/core2-32-poky-linux/libhandy/libhandy-locale-en-gb: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-es: PV changed from "1.8.1" to "1.8.2"
packages/core2-32-poky-linux/libhandy/libhandy-locale-es: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-eu: PV changed from "1.8.1" to "1.8.2"
packages/core2-32-poky-linux/libhandy/libhandy-locale-eu: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-fa: PV changed from "1.8.1" to "1.8.2"
packages/core2-32-poky-linux/libhandy/libhandy-locale-fa: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-fi: PV changed from "1.8.1" to "1.8.2"
packages/core2-32-poky-linux/libhandy/libhandy-locale-fi: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-fr: PV changed from "1.8.1" to "1.8.2"
packages/core2-32-poky-linux/libhandy/libhandy-locale-fr: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-fur: PV changed from "1.8.1" to "1.8.2"
packages/core2-32-poky-linux/libhandy/libhandy-locale-fur: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-gl: PV changed from "1.8.1" to "1.8.2"
packages/core2-32-poky-linux/libhandy/libhandy-locale-gl: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-hr: PV changed from "1.8.1" to "1.8.2"
packages/core2-32-poky-linux/libhandy/libhandy-locale-hr: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-hu: PV changed from "1.8.1" to "1.8.2"
packages/core2-32-poky-linux/libhandy/libhandy-locale-hu: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-id: PV changed from "1.8.1" to "1.8.2"
packages/core2-32-poky-linux/libhandy/libhandy-locale-id: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-ka: PV changed from "1.8.1" to "1.8.2"
packages/core2-32-poky-linux/libhandy/libhandy-locale-ka: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-ko: PV changed from "1.8.1" to "1.8.2"
packages/core2-32-poky-linux/libhandy/libhandy-locale-ko: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-nl: PV changed from "1.8.1" to "1.8.2"
packages/core2-32-poky-linux/libhandy/libhandy-locale-nl: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-oc: PV changed from "1.8.1" to "1.8.2"
packages/core2-32-poky-linux/libhandy/libhandy-locale-oc: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-pl: PV changed from "1.8.1" to "1.8.2"
packages/core2-32-poky-linux/libhandy/libhandy-locale-pl: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-pt-br: PV changed from "1.8.1" to "1.8.2"
packages/core2-32-poky-linux/libhandy/libhandy-locale-pt-br: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-pt: PV changed from "1.8.1" to "1.8.2"
packages/core2-32-poky-linux/libhandy/libhandy-locale-pt: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-ro: PV changed from "1.8.1" to "1.8.2"
packages/core2-32-poky-linux/libhandy/libhandy-locale-ro: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-ru: PV changed from "1.8.1" to "1.8.2"
packages/core2-32-poky-linux/libhandy/libhandy-locale-ru: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-sl: PV changed from "1.8.1" to "1.8.2"
packages/core2-32-poky-linux/libhandy/libhandy-locale-sl: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-sl: PKGSIZE changed from 11786 to 18409 (+56%)
packages/core2-32-poky-linux/libhandy/libhandy-locale-sr: PV changed from "1.8.1" to "1.8.2"
packages/core2-32-poky-linux/libhandy/libhandy-locale-sr: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-sv: PV changed from "1.8.1" to "1.8.2"
packages/core2-32-poky-linux/libhandy/libhandy-locale-sv: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-tr: PV changed from "1.8.1" to "1.8.2"
packages/core2-32-poky-linux/libhandy/libhandy-locale-tr: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-uk: PV changed from "1.8.1" to "1.8.2"
packages/core2-32-poky-linux/libhandy/libhandy-locale-uk: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-locale-zh-cn: PV changed from "1.8.1" to "1.8.2"
packages/core2-32-poky-linux/libhandy/libhandy-locale-zh-cn: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-src: PV changed from "1.8.1" to "1.8.2"
packages/core2-32-poky-linux/libhandy/libhandy-src: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy-src: PKGSIZE changed from 3572778 to 3574220 (+0%)
packages/core2-32-poky-linux/libhandy/libhandy-staticdev: PV changed from "1.8.1" to "1.8.2"
packages/core2-32-poky-linux/libhandy/libhandy-staticdev: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-32-poky-linux/libhandy/libhandy: PV changed from "1.8.1" to "1.8.2"
packages/core2-32-poky-linux/libhandy/libhandy: PKGV changed from 1.8.1 [default] to 1.8.2 [default]

--===============3172590735020593980==--

