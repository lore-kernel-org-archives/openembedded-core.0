Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44B89C64EBE
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:30:34 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.46812.1669908625968508096
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:30:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=hvd1oG5j;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010184ce4f77a5-985996aa-d256-4cb5-929d-c860a16f3ee5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1669908625;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2rmTT6efC7JUwQaC2f0/wK+7ohJbrj1ED5l8dGznbas=;
	b=hvd1oG5jb56L7F68z0v5vwEiB/xwfi19zYd4fyjCxGsXHsKNayfyGj+90EH6lHrv
	w1yLObclJYZjB7b77uNVMfo4htZwsBJvixHCkPJyxCqo7tnhfRq/7c1ms/SyxVIKRZt
	6o30Cme4/N79cb7XOiBqFQ8GjBXFdDcT6I9O3aJ0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1669908625;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2rmTT6efC7JUwQaC2f0/wK+7ohJbrj1ED5l8dGznbas=;
	b=XbYBbvk1RXOUF/Fx6MI0mx0jm2kwlcSj+QwCvAbCQZR9xuce8PhJUY8taE8lz45i
	ytL7JAxPs52wJaBf1rX0lX/767r/POxobP1tc7HTVEb2WMFQ27Q2G+eLlAuIrYUW/05
	Tix+kppIFXQMt80eONc/dooTv+qJ+0TMaXVfqOWI=
Content-Type: multipart/mixed; boundary="===============4547249648130044067=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ccache: upgrading to 4.7.4 SUCCEEDED
Message-ID: <01010184ce4f77a5-985996aa-d256-4cb5-929d-c860a16f3ee5-000000@us-west-2.amazonses.com>
Date: Thu, 1 Dec 2022 15:30:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:30:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174136

--===============4547249648130044067==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ccache* to *4.7.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ccache-upgrade-4.7.2-4.7.4.patch
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
--===============4547249648130044067==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ccache-upgrade-4.7.2-4.7.4.patch"

RnJvbSBjZTNjYzMzMzMwMDdiNzk5YmM5MzgzMDQ0Y2JkOTk3YzlkNTY3NmU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBEZWMgMjAyMiAwODoxMToxNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNj
YWNoZTogdXBncmFkZSA0LjcuMiAtPiA0LjcuNAoKLS0tCiAuLi4vY2NhY2hlL3tjY2FjaGVfNC43
LjIuYmIgPT4gY2NhY2hlXzQuNy40LmJifSAgICAgICAgICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvY2NhY2hlL3tjY2FjaGVfNC43LjIuYmIgPT4gY2NhY2hlXzQuNy40LmJifSAo
OTAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jY2FjaGUvY2NhY2hlXzQu
Ny4yLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NjYWNoZS9jY2FjaGVfNC43LjQuYmIKc2lt
aWxhcml0eSBpbmRleCA5MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NjYWNo
ZS9jY2FjaGVfNC43LjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jY2FjaGUv
Y2NhY2hlXzQuNy40LmJiCmluZGV4IGI4NTk4YWY2MzkuLjA0MTlkMDdjNGUgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9jY2FjaGUvY2NhY2hlXzQuNy4yLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9jY2FjaGUvY2NhY2hlXzQuNy40LmJiCkBAIC0xNCw3ICsxNCw3IEBA
IERFUEVORFMgPSAienN0ZCIKIFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25sb2Fk
L3Yke1BWfS8ke0JQfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8vMDAwMS14eGhhc2guaC1G
aXgtYnVpbGQtd2l0aC1nY2MtMTIucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiNmIzNDZmNDQxMzQyYTI1YTZjMWQ3ZTAxMDk1N2E1OTNmNDE2ZTk0YjVkNjZmZGYy
ZTI5OTI5NTNiMzg2MGI5ZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJkYzI4MzkwNmI3M2JkN2M0
NjExNzhjYTQ3MmE0NTllOWQ4NmI1NTIzNDA1MDM1OTIxYmQ4MjA0ZTc3NjIwMjY0IgogCiBpbmhl
cml0IGNtYWtlIGdpdGh1Yi1yZWxlYXNlcwogCi0tIAoyLjMxLjEKCg==

--===============4547249648130044067==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ccache/ccache-dbg: PKGV changed from 4.7.2 [default] to 4.7.4 [default]
packages/core2-32-poky-linux/ccache/ccache-dbg: PKGSIZE changed from 24714764 to 24683416 (-0%)
packages/core2-32-poky-linux/ccache/ccache-dbg: PV changed from "4.7.2" to "4.7.4"
packages/core2-32-poky-linux/ccache/ccache-dev: PKGV changed from 4.7.2 [default] to 4.7.4 [default]
packages/core2-32-poky-linux/ccache/ccache-dev: PV changed from "4.7.2" to "4.7.4"
packages/core2-32-poky-linux/ccache/ccache-doc: PKGV changed from 4.7.2 [default] to 4.7.4 [default]
packages/core2-32-poky-linux/ccache/ccache-doc: PV changed from "4.7.2" to "4.7.4"
packages/core2-32-poky-linux/ccache/ccache-locale: PKGV changed from 4.7.2 [default] to 4.7.4 [default]
packages/core2-32-poky-linux/ccache/ccache-locale: PV changed from "4.7.2" to "4.7.4"
packages/core2-32-poky-linux/ccache/ccache-src: PKGV changed from 4.7.2 [default] to 4.7.4 [default]
packages/core2-32-poky-linux/ccache/ccache-src: PKGSIZE changed from 1866320 to 1870304 (+0%)
packages/core2-32-poky-linux/ccache/ccache-src: PV changed from "4.7.2" to "4.7.4"
packages/core2-32-poky-linux/ccache/ccache-staticdev: PKGV changed from 4.7.2 [default] to 4.7.4 [default]
packages/core2-32-poky-linux/ccache/ccache-staticdev: PV changed from "4.7.2" to "4.7.4"
packages/core2-32-poky-linux/ccache/ccache: PKGV changed from 4.7.2 [default] to 4.7.4 [default]
packages/core2-32-poky-linux/ccache/ccache: PKGSIZE changed from 1587236 to 1583140 (-0%)
packages/core2-32-poky-linux/ccache/ccache: PV changed from "4.7.2" to "4.7.4"
packages/core2-32-poky-linux/ccache: PV changed from "4.7.2" to "4.7.4"
packages/core2-32-poky-linux/ccache: SRC_URI changed from "https://github.com/ccache/ccache/releases//download/v4.7.2/ccache-4.7.2.tar.gz file://0001-xxhash.h-Fix-build-with-gcc-12.patch" to "https://github.com/ccache/ccache/releases//download/v4.7.4/ccache-4.7.4.tar.gz file://0001-xxhash.h-Fix-build-with-gcc-12.patch"
packages/core2-32-poky-linux/ccache: PKGV changed from 4.7.2 [default] to 4.7.4 [default]

--===============4547249648130044067==--

