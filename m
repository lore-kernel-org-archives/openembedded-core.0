Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C7C5C88C8B
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:42 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.7618.1685693430681222998
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=TpIjoIQI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101887b288d9c-7df7093b-802f-46ec-8535-b1f2534e7471-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693435;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FVF2ILbh2FR2GyD3ZqwI8iJU6kdXHMmEx2exsHDQ7ww=;
	b=TpIjoIQI6bNEoaj/cEcnU1kZ1HoLxFzAJQ+K122BfB4J3OSrr8kX+cNn9hK69WXP
	Z41vhcz991npPZPbGfxZfVH/58J3u7Chrlhf66YWyvK0QOfqs12QqeCYb9IPjElYVIw
	UeEbMmiWRWW8MVonjD5bBZL2Asw212RtBXXW95WY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693435;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FVF2ILbh2FR2GyD3ZqwI8iJU6kdXHMmEx2exsHDQ7ww=;
	b=PRa8mYT3RtvjhZNKPAjtCuhVupp057PxY6OWQkWKznT++ZONL6yO0CuIeW5k7yoM
	NzD5O20FQ2FlFyre5/ZOs85S5edpw982xbYZh/vnLEpc4ay25+sUO0Zxh1ITFAloDqb
	pNnIKdRmg85tVYt91uvfWieJBUauKUL7RBxgYi7c=
Content-Type: multipart/mixed; boundary="===============2436723551531233997=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Adrian Bunk <bunk@kernel.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wireless-regdb: upgrading to 2023.05.03 SUCCEEDED
Message-ID: <010101887b288d9c-7df7093b-802f-46ec-8535-b1f2534e7471-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182262

--===============2436723551531233997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *wireless-regdb* to *2023.05.03* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wireless-regdb-upgrade-2023.02.13-2023.05.03.patch
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
--===============2436723551531233997==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wireless-regdb-upgrade-2023.02.13-2023.05.03.patch"

RnJvbSBkMDA0MGZiYzc5YWUyNWJhYmQxZjgzMTcyZWI4OWU1OTFmMGU4YmI0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMiBKdW4gMjAyMyAwMzoxOTozNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHdp
cmVsZXNzLXJlZ2RiOiB1cGdyYWRlIDIwMjMuMDIuMTMgLT4gMjAyMy4wNS4wMwoKLS0tCiAuLi5p
cmVsZXNzLXJlZ2RiXzIwMjMuMDIuMTMuYmIgPT4gd2lyZWxlc3MtcmVnZGJfMjAyMy4wNS4wMy5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMta2VybmVsL3dpcmVsZXNzLXJlZ2RiL3t3aXJlbGVzcy1yZWdk
Yl8yMDIzLjAyLjEzLmJiID0+IHdpcmVsZXNzLXJlZ2RiXzIwMjMuMDUuMDMuYmJ9ICg5NCUpCgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC93aXJlbGVzcy1yZWdkYi93aXJlbGVzcy1y
ZWdkYl8yMDIzLjAyLjEzLmJiIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC93aXJlbGVzcy1yZWdkYi93
aXJlbGVzcy1yZWdkYl8yMDIzLjA1LjAzLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1rZXJuZWwvd2lyZWxlc3MtcmVnZGIvd2lyZWxlc3MtcmVnZGJfMjAy
My4wMi4xMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWtlcm5lbC93aXJlbGVzcy1yZWdkYi93
aXJlbGVzcy1yZWdkYl8yMDIzLjA1LjAzLmJiCmluZGV4IGNlNjAxNTRmMWUuLmNkM2Y1MmZjNzYg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvd2lyZWxlc3MtcmVnZGIvd2lyZWxlc3Mt
cmVnZGJfMjAyMy4wMi4xMy5iYgorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL3dpcmVsZXNzLXJl
Z2RiL3dpcmVsZXNzLXJlZ2RiXzIwMjMuMDUuMDMuYmIKQEAgLTUsNyArNSw3IEBAIExJQ0VOU0Ug
PSAiSVNDIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MDdjNGY2ZGVh
Mzg0NWIwMmExOGRjMDBjOGM4NzY5OWMiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly93d3cua2VybmVs
Lm9yZy9wdWIvc29mdHdhcmUvbmV0d29yay8ke0JQTn0vJHtCUH0udGFyLnh6IgotU1JDX1VSSVtz
aGEyNTZzdW1dID0gImZlODFlOGE4Njk0ZGM0NzUzYTQ1MDg3YTFjNGM3ZTFiNDhkZWU1YTU5ZjVm
Nzk2Y2UzNzRlYTU1MGYwYjJlNzMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZjI1NGQwOGFiMzc2
NWFlYWUyYjg1NjIyMmUxMWE5NWQ0NGFlZjUxOWE2NjYzODc3YzcxZWY2OGZhZTRjOGMxMiIKIAog
aW5oZXJpdCBiaW5fcGFja2FnZSBhbGxhcmNoCiAKLS0gCjIuMzkuMgoK

--===============2436723551531233997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/wireless-regdb: PV changed from "2023.02.13" to "2023.05.03"
packages/all-poky-linux/wireless-regdb: SRC_URI changed from "https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2023.02.13.tar.xz" to "https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2023.05.03.tar.xz"
packages/all-poky-linux/wireless-regdb: PKGV changed from 2023.02.13 [default] to 2023.05.03 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb-src: PV changed from "2023.02.13" to "2023.05.03"
packages/all-poky-linux/wireless-regdb/wireless-regdb-src: PKGV changed from 2023.02.13 [default] to 2023.05.03 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PV changed from "2023.02.13" to "2023.05.03"
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PKGSIZE changed from 5858 to 5910 (+1%)
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PKGV changed from 2023.02.13 [default] to 2023.05.03 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb: PV changed from "2023.02.13" to "2023.05.03"
packages/all-poky-linux/wireless-regdb/wireless-regdb: PKGSIZE changed from 6871 to 6923 (+1%)
packages/all-poky-linux/wireless-regdb/wireless-regdb: PKGV changed from 2023.02.13 [default] to 2023.05.03 [default]

--===============2436723551531233997==--

