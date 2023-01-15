Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0780AC678D8
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 18:02:31 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.145730.1673805745148790948
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 10:02:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=hHBLfj8H;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010185b698c987-9ec44959-40d2-48a0-8b81-c666916d423d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1673805744;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VqYUQGTxHQbswDQvf3Dl8mqZhorqg1cCASEniuuvTxc=;
	b=hHBLfj8HQukDYxDJKK63Xq38sLS4XpV6CWXtAO0H/FnhNOAW+fTr3puDbB+D1Uua
	Pkz7cIhCGxiS4sTNsYjSXTCAAbN3jylzsHI5jazZAYfWgTQVs4ObhHkFDILK/6vrkeV
	GvAuDGeA2k+Rr5xF0/W2udKGraZoqi9DZK7zbskc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1673805744;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VqYUQGTxHQbswDQvf3Dl8mqZhorqg1cCASEniuuvTxc=;
	b=c+F0osJwdI2kiYG/opJ+g4NVa3PPWpl4Rrebr1bPZSHa2E979w8WUyZn8c6SmFHg
	EWazBFfkF3rYL3FIdZWk/mkTEVd9nkrdjOMcbDResInCZPRftjZd2qfgbI35TyV8dUP
	5t5L57+ZQOCJ6032ZZwimjB2NqhcVqviZyxkbNGI=
Content-Type: multipart/mixed; boundary="===============4051062830474691166=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] puzzles: upgrading to e66d027a81211d327319cf45bb4155e689513f72
 SUCCEEDED
Message-ID: <01010185b698c987-9ec44959-40d2-48a0-8b81-c666916d423d-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jan 2023 18:02:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 18:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175941

--===============4051062830474691166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *puzzles* to *e66d027a81211d327319cf45bb4155e689513f72* has Succeeded.

Next steps:
    - apply the patch: git am 0001-puzzles-upgrade-to-latest-revision.patch
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
--===============4051062830474691166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/puzzles: PKGV changed from 0.0+gitAUTOINC+14c025d192 [default] to 0.0+gitAUTOINC+e66d027a81 [default]
packages/core2-32-poky-linux/puzzles: PV changed from "0.0+gitAUTOINC+14c025d192" to "0.0+gitAUTOINC+e66d027a81"
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGSIZE changed from 14274200 to 14275404 (+0%)
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+14c025d192 to 0.0+git0+e66d027a81
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PV changed from "0.0+gitAUTOINC+14c025d192" to "0.0+gitAUTOINC+e66d027a81"
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+14c025d192 to 0.0+git0+e66d027a81
packages/core2-32-poky-linux/puzzles/puzzles-dev: PV changed from "0.0+gitAUTOINC+14c025d192" to "0.0+gitAUTOINC+e66d027a81"
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+14c025d192 to 0.0+git0+e66d027a81
packages/core2-32-poky-linux/puzzles/puzzles-doc: PV changed from "0.0+gitAUTOINC+14c025d192" to "0.0+gitAUTOINC+e66d027a81"
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+14c025d192 to 0.0+git0+e66d027a81
packages/core2-32-poky-linux/puzzles/puzzles-locale: PV changed from "0.0+gitAUTOINC+14c025d192" to "0.0+gitAUTOINC+e66d027a81"
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGSIZE changed from 3522536 to 3524196 (+0%)
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+14c025d192 to 0.0+git0+e66d027a81
packages/core2-32-poky-linux/puzzles/puzzles-src: PV changed from "0.0+gitAUTOINC+14c025d192" to "0.0+gitAUTOINC+e66d027a81"
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+14c025d192 to 0.0+git0+e66d027a81
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PV changed from "0.0+gitAUTOINC+14c025d192" to "0.0+gitAUTOINC+e66d027a81"
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+14c025d192 to 0.0+git0+e66d027a81
packages/core2-32-poky-linux/puzzles/puzzles: PV changed from "0.0+gitAUTOINC+14c025d192" to "0.0+gitAUTOINC+e66d027a81"

--===============4051062830474691166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+14c025d192 to 0.0+git0+e66d027a81
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+14c025d192 to 0.0+git0+e66d027a81
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+14c025d192 to 0.0+git0+e66d027a81
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+14c025d192 to 0.0+git0+e66d027a81
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+14c025d192 to 0.0+git0+e66d027a81
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+14c025d192 to 0.0+git0+e66d027a81
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+14c025d192 to 0.0+git0+e66d027a81

--===============4051062830474691166==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-puzzles-upgrade-to-latest-revision.patch"

RnJvbSBkYTA5NjkzY2RiZTAxZjI0YzE5NzhkNmVmN2E4ZDc5Y2Q2ZGNhODA0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSmFuIDIwMjMgMTc6MTI6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
dXp6bGVzOiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiBtZXRhL3JlY2lwZXMtc2F0
by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXNhdG8vcHV6
emxlcy9wdXp6bGVzX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1zYXRvL3B1enpsZXMvcHV6emxlc19n
aXQuYmIKaW5kZXggYzk0ZmVmNDkzMS4uMGEzMTM4NjIyYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLXNhdG8vcHV6emxlcy9wdXp6bGVzX2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc2F0by9w
dXp6bGVzL3B1enpsZXNfZ2l0LmJiCkBAIC0xMCw3ICsxMCw3IEBAIFJFUVVJUkVEX0RJU1RST19G
RUFUVVJFUyA9ICJ4MTEiCiBTUkNfVVJJID0gImdpdDovL2dpdC50YXJ0YXJ1cy5vcmcvc2ltb24v
cHV6emxlcy5naXQ7YnJhbmNoPW1haW4iCiAKIFVQU1RSRUFNX0NIRUNLX0NPTU1JVFMgPSAiMSIK
LVNSQ1JFViA9ICIxNGMwMjVkMTkyNTc5OTYxZDFhZGU1MWYyYTMyMmJkNzY1YWVmMGU1IgorU1JD
UkVWID0gImU2NmQwMjdhODEyMTFkMzI3MzE5Y2Y0NWJiNDE1NWU2ODk1MTNmNzIiCiBQRSA9ICIy
IgogUFYgPSAiMC4wK2dpdCR7U1JDUFZ9IgogCi0tIAoyLjM3LjMKCg==

--===============4051062830474691166==--

