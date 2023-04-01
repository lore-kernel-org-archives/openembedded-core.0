Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24649C88C8C
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 21:29:03 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.32130.1680384535237060478
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 14:28:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=aUZ/hmRF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101873eb9281e-551d78d4-1dd1-4465-92b1-3fde63f0b500-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1680384534;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=D8IsPnnFtOtWZZfQ/ug0ujLlYFV0DvQvO0UJ+O+n83o=;
	b=aUZ/hmRFZVJWOX+mkpDRFQaczdGJR1i3g2MHyRC4634xCSXD8AWWvgkvyffeuzb6
	+UVN7LgE52g1uyXkmrNQOsG4OhzdUXmeaaFoqku7UnC0emkxLV3xFleSvTF5XwG3m2b
	YoEvep0zKvM+a7RELxdcGEz2R2LzUaqVWCnMq2l4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1680384534;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=D8IsPnnFtOtWZZfQ/ug0ujLlYFV0DvQvO0UJ+O+n83o=;
	b=TRe7RzjxkQsvv80Dykd0qR7tHXeGpBN9tg3z25bkbqdw9RcBgryZBVrQmaOlObj0
	zNHKFGBM0/i7Wfo61tYhlEbsnbgy52ssk1kGaKQTaoUUN/7FBNbubRkwC69itNX+P+X
	mYtAhRQ5y/y6pUMrCfa0Dc1x7ZNC8LfKaq/YhVyo=
Content-Type: multipart/mixed; boundary="===============5770021146226821209=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] grep: upgrading to 3.10 SUCCEEDED
Message-ID: <010101873eb9281e-551d78d4-1dd1-4465-92b1-3fde63f0b500-000000@us-west-2.amazonses.com>
Date: Sat, 1 Apr 2023 21:28:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 21:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179516

--===============5770021146226821209==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *grep* to *3.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-grep-upgrade-3.9-3.10.patch
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
--===============5770021146226821209==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/grep/grep-dbg: PKGSIZE changed from 798648 to 802332 (+0%)
packages/core2-32-poky-linux/grep/grep-dbg: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-dbg: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-dev: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-dev: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-doc: PKGSIZE changed from 169836 to 169744 (-0%)
packages/core2-32-poky-linux/grep/grep-doc: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-doc: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-locale-af: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-locale-af: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-locale-be: PKGSIZE changed from 23295 to 23299 (+0%)
packages/core2-32-poky-linux/grep/grep-locale-be: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-locale-be: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-locale-bg: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-locale-bg: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-locale-ca: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-locale-ca: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-locale-cs: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-locale-cs: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-locale-da: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-locale-da: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-locale-de: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-locale-de: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-locale-el: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-locale-el: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-locale-eo: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-locale-eo: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-locale-es: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-locale-es: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-locale-et: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-locale-et: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-locale-eu: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-locale-eu: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-locale-fi: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-locale-fi: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-locale-fr: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-locale-fr: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-locale-ga: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-locale-ga: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-locale-gl: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-locale-gl: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-locale-he: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-locale-he: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-locale-hr: PKGSIZE changed from 17885 to 18215 (+2%)
packages/core2-32-poky-linux/grep/grep-locale-hr: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-locale-hr: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-locale-hu: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-locale-hu: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-locale-id: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-locale-id: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-locale-it: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-locale-it: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-locale-ja: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-locale-ja: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-locale-ka: PKGSIZE changed from 27371 to 27905 (+2%)
packages/core2-32-poky-linux/grep/grep-locale-ka: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-locale-ka: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-locale-ko: PKGSIZE changed from 19017 to 19419 (+2%)
packages/core2-32-poky-linux/grep/grep-locale-ko: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-locale-ko: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-locale-ky: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-locale-ky: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-locale-lt: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-locale-lt: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-locale-nb: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-locale-nb: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-locale-nl: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-locale-nl: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-locale-pa: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-locale-pa: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-locale-pl: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-locale-pl: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-locale-pt-br: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-locale-pt-br: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-locale-pt: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-locale-pt: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-locale-ro: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-locale-ro: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-locale-ru: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-locale-ru: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-locale-sk: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-locale-sk: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-locale-sl: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-locale-sl: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-locale-sr: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-locale-sr: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-locale-sv: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-locale-sv: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-locale-ta: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-locale-ta: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-locale-th: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-locale-th: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-locale-tr: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-locale-tr: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-locale-uk: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-locale-uk: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-locale-vi: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-locale-vi: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-locale-zh-cn: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-locale-zh-cn: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-locale-zh-tw: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-locale-zh-tw: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-src: PKGSIZE changed from 1886047 to 1888700 (+0%)
packages/core2-32-poky-linux/grep/grep-src: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-src: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep-staticdev: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep-staticdev: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep/grep: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep/grep: PKGV changed from 3.9 [default] to 3.10 [default]
packages/core2-32-poky-linux/grep: PV changed from "3.9" to "3.10"
packages/core2-32-poky-linux/grep: SRC_URI changed from "https://ftp.gnu.org/gnu/grep/grep-3.9.tar.xz" to "https://ftp.gnu.org/gnu/grep/grep-3.10.tar.xz"
packages/core2-32-poky-linux/grep: PKGV changed from 3.9 [default] to 3.10 [default]

--===============5770021146226821209==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-grep-upgrade-3.9-3.10.patch"

RnJvbSA4YjlkZjA3YTVlYjNmNmE0NWYxODc4YWUyNjExM2UyZTgwYWE1Yzc1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBBcHIgMjAyMyAxMjowNDowMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdy
ZXA6IHVwZ3JhZGUgMy45IC0+IDMuMTAKCi0tLQogbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dyZXAv
e2dyZXBfMy45LmJiID0+IGdyZXBfMy4xMC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
Z3JlcC97Z3JlcF8zLjkuYmIgPT4gZ3JlcF8zLjEwLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9ncmVwL2dyZXBfMy45LmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2dyZXAvZ3JlcF8zLjEwLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1leHRlbmRlZC9ncmVwL2dyZXBfMy45LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvZ3JlcC9ncmVwXzMuMTAuYmIKaW5kZXggM2MzOWE1ZmI1Ni4uMzNmZDY0ZDI3
ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dyZXAvZ3JlcF8zLjkuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dyZXAvZ3JlcF8zLjEwLmJiCkBAIC04LDcgKzgsNyBA
QCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT0xZWJiZDNlMzQyMzdhZjI2
ZGE1ZGMwOGE0ZTQ0MDQ2NCIKIAogU1JDX1VSSSA9ICIke0dOVV9NSVJST1J9L2dyZXAvZ3JlcC0k
e1BWfS50YXIueHoiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJhYmNkMTE0MDllZTIzZDRjYWYz
NWZlYjQyMmU1M2JiYWM4NjcwMTRjZmVlZDMxM2JiNWY0ODhhY2ExNzBiNTk5IgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjI0ZWZhNWI1OTVmYjVhNzEwMDg3OWI1MWI4ODY4YTBiYjg3YTcxYzE4M2Qw
MmM0YzYwMjYzM2I4OGFmNjg1NWIiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIGdldHRleHQgdGV4aW5m
byBwa2djb25maWcKIAotLSAKMi4zOS4yCgo=

--===============5770021146226821209==--

