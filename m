Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8384C4708D
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 13:05:45 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web12.5224.1668517535331766825
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 05:05:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=LDAQ+d3V;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101847b651adc-fa4180b8-738b-4182-83da-09f5b79be2b0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1668517534;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bnf3CJ6UNkNPwn91BiJloLHfenN1dMf7wJsFA/qhLAc=;
	b=LDAQ+d3V6D0tsAU53a2xpPgciYrFG/7K0ywym67MHF/68XcKJdn4Qk1EtHFV0ABD
	i6WoCZ1jg2Xguh9LY9Dtx2P9u4ZmrE27EH6xhgLtigMH5nhpqEp/NwpM6CQ0x60ewrA
	Nyau4JT+wwon1oUOcDuBEw5SNeHhDyvZC8j6dwSo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1668517534;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bnf3CJ6UNkNPwn91BiJloLHfenN1dMf7wJsFA/qhLAc=;
	b=NEfvSVHImhYPnAGZWuRhbx00t8vxHoBKDH3gMhZWSciQ8nkpBK+XU4Q8JGLVoxbY
	aYCK8jU2Jiw8aUguMNBxyS6QNjsQTR+qrvMfEAkIBG4QFjAHwB3zj2U4U+/mdfZ72Cu
	igNWaB2ZzQ9j3SVWo6xsUBI1jaboa0jUmbi9Mas4=
Content-Type: multipart/mixed; boundary="===============1026065558843284010=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxcrypt-compat: upgrading to 4.4.31 SUCCEEDED
Message-ID: <010101847b651adc-fa4180b8-738b-4182-83da-09f5b79be2b0-000000@us-west-2.amazonses.com>
Date: Tue, 15 Nov 2022 13:05:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 13:05:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173282

--===============1026065558843284010==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxcrypt-compat* to *4.4.31* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxcrypt-compat-upgrade-4.4.30-4.4.31.patch
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
--===============1026065558843284010==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxcrypt-compat-upgrade-4.4.30-4.4.31.patch"

RnJvbSBlZTkzNjg0ZTUyN2JjNDdmYzkxYTk4ODBiYmNlN2Y4ZDQ1OGJmNTAxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgTm92IDIwMjIgMDY6NTc6NDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ4Y3J5cHQtY29tcGF0OiB1cGdyYWRlIDQuNC4zMCAtPiA0LjQuMzEKCi0tLQogLi4ue2xpYnhj
cnlwdC1jb21wYXRfNC40LjMwLmJiID0+IGxpYnhjcnlwdC1jb21wYXRfNC40LjMxLmJifSB8IDAK
IG1ldGEvcmVjaXBlcy1jb3JlL2xpYnhjcnlwdC9saWJ4Y3J5cHQuaW5jICAgICAgICAgICAgICAg
ICAgICAgfCA0ICsrKy0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvbGlieGNyeXB0L3tsaWJ4Y3J5cHQtY29t
cGF0XzQuNC4zMC5iYiA9PiBsaWJ4Y3J5cHQtY29tcGF0XzQuNC4zMS5iYn0gKDEwMCUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvbGlieGNyeXB0L2xpYnhjcnlwdC1jb21wYXRfNC40
LjMwLmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvbGlieGNyeXB0L2xpYnhjcnlwdC1jb21wYXRfNC40
LjMxLmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29y
ZS9saWJ4Y3J5cHQvbGlieGNyeXB0LWNvbXBhdF80LjQuMzAuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1jb3JlL2xpYnhjcnlwdC9saWJ4Y3J5cHQtY29tcGF0XzQuNC4zMS5iYgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWNvcmUvbGlieGNyeXB0L2xpYnhjcnlwdC5pbmMgYi9tZXRhL3JlY2lw
ZXMtY29yZS9saWJ4Y3J5cHQvbGlieGNyeXB0LmluYwppbmRleCAyYmRlZGNiYTZkLi5jOGVkNzMy
MjIxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9saWJ4Y3J5cHQvbGlieGNyeXB0Lmlu
YworKysgYi9tZXRhL3JlY2lwZXMtY29yZS9saWJ4Y3J5cHQvbGlieGNyeXB0LmluYwpAQCAtMTAs
NyArMTAsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNJTkc7bWQ1PWMwYTMw
ZTJiMTUwMmM1NWE3ZjM3ZTQxMmNkNmM2YTRiIFwKIGluaGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZp
ZwogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vYmVzc2VyODIvbGlieGNyeXB0LmdpdDti
cmFuY2g9JHtTUkNCUkFOQ0h9O3Byb3RvY29sPWh0dHBzIgotU1JDUkVWID0gImZlZTI2ODdiYWQ2
NmUzNTFhM2RjYzk2M2EzNGFlODAxMjU5MjNmZjgiCitTUkNSRVYgPSAiZGEyZTIzODQ1NDQwZjlk
YjliYjhmZTA0YzNkZWViZWQ0NjFjZThhNCIKIFNSQ0JSQU5DSCA/PSAiZGV2ZWxvcCIKIAogU1JD
X1VSSSArPSAiZmlsZTovL2ZpeF9jZmxhZ3NfaGFuZGxpbmcucGF0Y2giCkBAIC0zMywzICszMyw1
IEBAIEFQSSA9ICItLWRpc2FibGUtb2Jzb2xldGUtYXBpIgogRVhUUkFfT0VDT05GICs9ICIke0FQ
SX0iCiAKIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayIKKworU1JDQlJBTkNIID0g
Im1hc3RlciIKLS0gCjIuMzEuMQoK

--===============1026065558843284010==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libxcrypt-compat: SRC_URI changed from "git://github.com/besser82/libxcrypt.git;branch=develop;protocol=https file://fix_cflags_handling.patch" to "git://github.com/besser82/libxcrypt.git;branch=master;protocol=https file://fix_cflags_handling.patch"
packages/core2-32-poky-linux/libxcrypt-compat: PKGV changed from 4.4.30 [default] to 4.4.31 [default]
packages/core2-32-poky-linux/libxcrypt-compat: PV changed from "4.4.30" to "4.4.31"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-dbg: PKGV changed from 4.4.30 [default] to 4.4.31 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-dbg: PKGSIZE changed from 519976 to 521356 (+0%)
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-dbg: PV changed from "4.4.30" to "4.4.31"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-dev: PKGV changed from 4.4.30 [default] to 4.4.31 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-dev: PV changed from "4.4.30" to "4.4.31"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-doc: PKGV changed from 4.4.30 [default] to 4.4.31 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-doc: PV changed from "4.4.30" to "4.4.31"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-locale: PKGV changed from 4.4.30 [default] to 4.4.31 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-locale: PV changed from "4.4.30" to "4.4.31"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-src: PKGV changed from 4.4.30 [default] to 4.4.31 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-src: PKGSIZE changed from 751861 to 752177 (+0%)
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-src: PV changed from "4.4.30" to "4.4.31"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-staticdev: PKGV changed from 4.4.30 [default] to 4.4.31 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat-staticdev: PV changed from "4.4.30" to "4.4.31"
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat: PKGV changed from 4.4.30 [default] to 4.4.31 [default]
packages/core2-32-poky-linux/libxcrypt-compat/libxcrypt-compat: PV changed from "4.4.30" to "4.4.31"

--===============1026065558843284010==--

