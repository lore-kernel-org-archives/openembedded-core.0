Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 161DFC87FE1
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:16 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.3760.1684186747292497654
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=M5nt9qkW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010188215a5d58-a6a814f3-a49b-41f0-a336-4848274ed0c0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186750;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=uBN4XLjTd0uHbnJL+QtjvUNydTJwcxTOAt0rNNSOgMQ=;
	b=M5nt9qkWTDh8P1zTmR8pYy1IPTWXC0Y0Hc7bcXWlLjoAIQfkzYOUH1NsiRdS+ak1
	RYuIxgpG+WSkRESKEtcRs2MdTeyKq0LojKQK1Bf0wPb3eRmKFJbA6VbWJrsxnXrRm+o
	L6WzR5V7sKsCr56Z6BaUGdaMtYwCMc25RFrVaBEc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186750;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=uBN4XLjTd0uHbnJL+QtjvUNydTJwcxTOAt0rNNSOgMQ=;
	b=bPxHoKun76+iotbzpLTxfcJqfHi0//TBGq6+KR/yx2ofF9B7lBXst2mnP+KjtTXm
	7ti/yroHhW7E/D/G5VpdEPI2E6XKhmhiEcJqhIyBEUzd4vkK5+yDpqL9OpCLZDgqZs1
	U92Vv4pPoQ8Xn25pCyzlADJxlhEouFINt2AAExiE=
Content-Type: multipart/mixed; boundary="===============0283526659333893500=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libxpm: upgrading to 3.5.16 SUCCEEDED
Message-ID: <01010188215a5d58-a6a814f3-a49b-41f0-a336-4848274ed0c0-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181370

--===============0283526659333893500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxpm* to *3.5.16* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxpm-upgrade-3.5.15-3.5.16.patch
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
--===============0283526659333893500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libxpm/cxpm: PV changed from "3.5.15" to "3.5.16"
packages/core2-32-poky-linux/libxpm/cxpm: PKGV changed from 3.5.15 [default] to 3.5.16 [default]
packages/core2-32-poky-linux/libxpm: PV changed from "3.5.15" to "3.5.16"
packages/core2-32-poky-linux/libxpm: PKGV changed from 3.5.15 [default] to 3.5.16 [default]
packages/core2-32-poky-linux/libxpm: SRC_URI changed from "https://www.x.org/releases//individual/lib/libXpm-3.5.15.tar.xz" to "https://www.x.org/releases//individual/lib/libXpm-3.5.16.tar.xz"
packages/core2-32-poky-linux/libxpm/libxpm-dbg: PV changed from "3.5.15" to "3.5.16"
packages/core2-32-poky-linux/libxpm/libxpm-dbg: PKGSIZE changed from 315668 to 315840 (+0%)
packages/core2-32-poky-linux/libxpm/libxpm-dbg: PKGV changed from 3.5.15 [default] to 3.5.16 [default]
packages/core2-32-poky-linux/libxpm/libxpm-dev: PV changed from "3.5.15" to "3.5.16"
packages/core2-32-poky-linux/libxpm/libxpm-dev: PKGV changed from 3.5.15 [default] to 3.5.16 [default]
packages/core2-32-poky-linux/libxpm/libxpm-doc: PV changed from "3.5.15" to "3.5.16"
packages/core2-32-poky-linux/libxpm/libxpm-doc: PKGV changed from 3.5.15 [default] to 3.5.16 [default]
packages/core2-32-poky-linux/libxpm/libxpm-locale: PV changed from "3.5.15" to "3.5.16"
packages/core2-32-poky-linux/libxpm/libxpm-locale: PKGV changed from 3.5.15 [default] to 3.5.16 [default]
packages/core2-32-poky-linux/libxpm/libxpm-src: PV changed from "3.5.15" to "3.5.16"
packages/core2-32-poky-linux/libxpm/libxpm-src: PKGSIZE changed from 298355 to 298184 (-0%)
packages/core2-32-poky-linux/libxpm/libxpm-src: PKGV changed from 3.5.15 [default] to 3.5.16 [default]
packages/core2-32-poky-linux/libxpm/libxpm-staticdev: PV changed from "3.5.15" to "3.5.16"
packages/core2-32-poky-linux/libxpm/libxpm-staticdev: PKGV changed from 3.5.15 [default] to 3.5.16 [default]
packages/core2-32-poky-linux/libxpm/libxpm: PV changed from "3.5.15" to "3.5.16"
packages/core2-32-poky-linux/libxpm/libxpm: PKGV changed from 3.5.15 [default] to 3.5.16 [default]
packages/core2-32-poky-linux/libxpm/sxpm: PV changed from "3.5.15" to "3.5.16"
packages/core2-32-poky-linux/libxpm/sxpm: PKGV changed from 3.5.15 [default] to 3.5.16 [default]

--===============0283526659333893500==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxpm-upgrade-3.5.15-3.5.16.patch"

RnJvbSBjNjAyOTJlYmI4ZjZkODc3YTg4ODliMDgzZWUxZWE0MGE5YjMwZTk1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMTk6NTU6NDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ4cG06IHVwZ3JhZGUgMy41LjE1IC0+IDMuNS4xNgoKLS0tCiAuLi4veG9yZy1saWIve2xpYnhw
bV8zLjUuMTUuYmIgPT4gbGlieHBtXzMuNS4xNi5iYn0gICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MveG9yZy1saWIve2xpYnhwbV8zLjUuMTUuYmIgPT4gbGlieHBtXzMuNS4x
Ni5iYn0gKDg4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIv
bGlieHBtXzMuNS4xNS5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4cG1f
My41LjE2LmJiCnNpbWlsYXJpdHkgaW5kZXggODglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1n
cmFwaGljcy94b3JnLWxpYi9saWJ4cG1fMy41LjE1LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
Z3JhcGhpY3MveG9yZy1saWIvbGlieHBtXzMuNS4xNi5iYgppbmRleCAzMmEyYjM1MzU2Li5jM2Qw
MWYxYmIzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlieHBt
XzMuNS4xNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlieHBtXzMu
NS4xNi5iYgpAQCAtMjIsNiArMjIsNiBAQCBQQUNLQUdFUyA9KyAic3hwbSBjeHBtIgogRklMRVM6
Y3hwbSA9ICIke2JpbmRpcn0vY3hwbSIKIEZJTEVTOnN4cG0gPSAiJHtiaW5kaXJ9L3N4cG0iCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICI2MGJiOTA2YzVjMzE3YTZkYjg2M2UzOWI2OWM0YTgzZmRi
ZDJhZTIxNTRmY2Y0NzY0MGY4ZmVmYzlmZGZkMWMxIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImU2
YmM1ZGE3YTY5ZGJkOWJjYzY3ZTg3YzkzZDQ5MDRmZTJmNTE3N2EwNzExYzU2ZTcxZmEyZjZlZmY2
NDlmNTEiCiAKIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIgotLSAKMi4zOS4yCgo=

--===============0283526659333893500==--

