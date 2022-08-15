Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1854BC38142
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 18:57:03 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.6316.1660589822573132046
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 11:57:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=CeIWd0v9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 01010182a2ddce1e-77c86aa3-e714-4230-8b16-941064936631-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1660589822;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5t7AoZNUkLOHIIkl3OpmRmUCo89aVGR4gXuchTLETU0=;
	b=CeIWd0v97s7eP0RpoPct3PeUPl+HREqdiD1dCPmCxseEqq3BGoo0DHT0yxti4gqM
	rPCmS0M9IBC6stASZhqBK5Dh0Ju2QW7I4JrMmw05U57begyQA0Nt4KCcAmkBCyPES1b
	smUzJTKLb8TxwfhJPFFMFfSQh1MMiFih9ubE6+As=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1660589822;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5t7AoZNUkLOHIIkl3OpmRmUCo89aVGR4gXuchTLETU0=;
	b=T53EiH+C9RgYNgiHP09wb3uIqzhcOyHLgDzgHQqLSnBERqMWANEtv2I31tCrjp3Q
	YEJ6SrKKAggZ7djrMXJT2tccyr+rA4U9QDyG6FKvwFzYuTT0MiuSWehL/F3Kjc9edch
	uN3lqZcLsWhrOe70gdQGire67hp23epIbFXdL5vM=
Content-Type: multipart/mixed; boundary="===============5983172891262656916=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Adrian Bunk <bunk@kernel.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wireless-regdb: upgrading to 2022.08.12 SUCCEEDED
Message-ID: 
 <01010182a2ddce1e-77c86aa3-e714-4230-8b16-941064936631-000000@us-west-2.amazonses.com>
Date: Mon, 15 Aug 2022 18:57:01 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 18:57:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169404

--===============5983172891262656916==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *wireless-regdb* to *2022.08.12* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wireless-regdb-upgrade-2022.06.06-2022.08.12.patch
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
--===============5983172891262656916==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/wireless-regdb: SRC_URI changed from "https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2022.06.06.tar.xz" to "https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2022.08.12.tar.xz"
packages/all-poky-linux/wireless-regdb: PKGV changed from 2022.06.06 [default] to 2022.08.12 [default]
packages/all-poky-linux/wireless-regdb: PV changed from "2022.06.06" to "2022.08.12"
packages/all-poky-linux/wireless-regdb/wireless-regdb-src: PKGV changed from 2022.06.06 [default] to 2022.08.12 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb-src: PV changed from "2022.06.06" to "2022.08.12"
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PKGSIZE changed from 5674 to 5774 (+2%)
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PKGV changed from 2022.06.06 [default] to 2022.08.12 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PV changed from "2022.06.06" to "2022.08.12"
packages/all-poky-linux/wireless-regdb/wireless-regdb: PKGSIZE changed from 6635 to 6787 (+2%)
packages/all-poky-linux/wireless-regdb/wireless-regdb: PKGV changed from 2022.06.06 [default] to 2022.08.12 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb: PV changed from "2022.06.06" to "2022.08.12"

--===============5983172891262656916==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wireless-regdb-upgrade-2022.06.06-2022.08.12.patch"

RnJvbSBkNGI2MjQzY2ExNWRhMjBjOTQxMjY5NDY1YzI1NzY5NjA3ZmMwZDMwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXVnIDIwMjIgMTU6MTk6NTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
aXJlbGVzcy1yZWdkYjogdXBncmFkZSAyMDIyLjA2LjA2IC0+IDIwMjIuMDguMTIKCi0tLQogLi4u
aXJlbGVzcy1yZWdkYl8yMDIyLjA2LjA2LmJiID0+IHdpcmVsZXNzLXJlZ2RiXzIwMjIuMDguMTIu
YmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC93aXJlbGVzcy1yZWdkYi97d2lyZWxlc3MtcmVn
ZGJfMjAyMi4wNi4wNi5iYiA9PiB3aXJlbGVzcy1yZWdkYl8yMDIyLjA4LjEyLmJifSAoOTQlKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvd2lyZWxlc3MtcmVnZGIvd2lyZWxlc3Mt
cmVnZGJfMjAyMi4wNi4wNi5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvd2lyZWxlc3MtcmVnZGIv
d2lyZWxlc3MtcmVnZGJfMjAyMi4wOC4xMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMta2VybmVsL3dpcmVsZXNzLXJlZ2RiL3dpcmVsZXNzLXJlZ2RiXzIw
MjIuMDYuMDYuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1rZXJuZWwvd2lyZWxlc3MtcmVnZGIv
d2lyZWxlc3MtcmVnZGJfMjAyMi4wOC4xMi5iYgppbmRleCAyZWJhNGY4NzNiLi4zNTdlNzlkN2Ux
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL3dpcmVsZXNzLXJlZ2RiL3dpcmVsZXNz
LXJlZ2RiXzIwMjIuMDYuMDYuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC93aXJlbGVzcy1y
ZWdkYi93aXJlbGVzcy1yZWdkYl8yMDIyLjA4LjEyLmJiCkBAIC01LDcgKzUsNyBAQCBMSUNFTlNF
ID0gIklTQyIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTA3YzRmNmRl
YTM4NDViMDJhMThkYzAwYzhjODc2OTljIgogCiBTUkNfVVJJID0gImh0dHBzOi8vd3d3Lmtlcm5l
bC5vcmcvcHViL3NvZnR3YXJlL25ldHdvcmsvJHtCUE59LyR7QlB9LnRhci54eiIKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICJhYzAwZjk3ZWZlY2NlNTA0NmVkMDY5ZDFkOTNmMzM2NWZkZjk5NGM3Yzc4
NTRhOGZjNTA4MzFlOTU5NTM3MjMwIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjU5YzhmN2QxNzk2
NmRiNzFiMjdmOTBlNzM1ZWU4ZjViNDJjYTM1Mjc2OTRhOGM1ZTZlOWI1NmJkMzc5YzNiODQiCiAK
IGluaGVyaXQgYmluX3BhY2thZ2UgYWxsYXJjaAogCi0tIAoyLjMxLjEKCg==

--===============5983172891262656916==--

