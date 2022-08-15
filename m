Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 675F9C25B08
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 18:57:02 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.6312.1660589820284900691
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 11:57:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Q2uKlCyZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 01010182a2ddcd6a-2e27ce59-7205-493c-9990-d9140e8feaa6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1660589821;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UxxffReJYT00s04hltCiTjh0/j1no1CwR8k3OL59O2c=;
	b=Q2uKlCyZybsWaU/4ONo+szBo+kS5hqyaPtu/I+1NfO9ch/x8Ku+we6ffcEoLODFX
	1d72ov8MAJNiT2JlTmuEmae2yKI2fO4oJXMj5wd3VOxUMBBS4LEG7/LcqMB809dhcmy
	onkbfGZM0NK1LfOL/hfuBMqGuvv9JomfSnXs1gyw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1660589821;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UxxffReJYT00s04hltCiTjh0/j1no1CwR8k3OL59O2c=;
	b=VKyGmNygfmnobYKGenm/p0RoTg+kCf9u/Vgn2eFIVjIw/RR6q9g2tkxLy+dtqnye
	vlZw9qC+W4yGO8yEK09ctJMuNu5jAAZGMFaJuH/j/lmSGxujgrnyzPO1aY/8zhRPH1O
	+ubYw9EYvjJLxJ5WJ/vQv6NfjTXAHm7nUV5lCzjU=
Content-Type: multipart/mixed; boundary="===============0644975349991141873=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shaderc: upgrading to 2022.2 SUCCEEDED
Message-ID: 
 <01010182a2ddcd6a-2e27ce59-7205-493c-9990-d9140e8feaa6-000000@us-west-2.amazonses.com>
Date: Mon, 15 Aug 2022 18:57:01 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 18:57:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169390

--===============0644975349991141873==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *shaderc* to *2022.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-shaderc-upgrade-2022.1-2022.2.patch
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
--===============0644975349991141873==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shaderc-upgrade-2022.1-2022.2.patch"

RnJvbSAyNjMxMzJiMTRiNzE0ZGI2MjIwMTUwYTUxMzFhNzEwMmZlZDg3MmVhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXVnIDIwMjIgMTU6MTU6NDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
aGFkZXJjOiB1cGdyYWRlIDIwMjIuMSAtPiAyMDIyLjIKCi0tLQogLi4uL3NoYWRlcmMve3NoYWRl
cmNfMjAyMi4xLmJiID0+IHNoYWRlcmNfMjAyMi4yLmJifSAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMve3NoYWRlcmNfMjAyMi4xLmJiID0+IHNoYWRlcmNfMjAy
Mi4yLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJj
L3NoYWRlcmNfMjAyMi4xLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvc2hhZGVy
Y18yMDIyLjIuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3NoYWRlcmMvc2hhZGVyY18yMDIyLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1ncmFwaGljcy9zaGFkZXJjL3NoYWRlcmNfMjAyMi4yLmJiCmluZGV4IGZlOWQ5NDA5NGMuLmRm
MGZlOGU2YzggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL3NoYWRl
cmNfMjAyMi4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zaGFkZXJjL3NoYWRlcmNf
MjAyMi4yLmJiCkBAIC02LDcgKzYsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20v
Z29vZ2xlL3NoYWRlcmMiCiBMSUNFTlNFID0gIkFwYWNoZS0yLjAiCiBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFO21kNT04NmQzZjNhOTVjMzI0Yzk0NzliZDg5ODY5NjhmNDMyNyIK
IAotU1JDUkVWID0gImU0NzIyYjBhZDQ5ZWU2MGMxNDNkNDNiYWFlODM5MGY3NWJhMjdkMmQiCitT
UkNSRVYgPSAiM2YxNjM1ZGY3Nzc0YTkwZjY5MTc3M2UwMDkzYmM2YWQ4MDA1ZGU1YSIKIFNSQ19V
UkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9nb29nbGUvc2hhZGVyYy5naXQ7cHJvdG9jb2w9aHR0cHM7
YnJhbmNoPW1haW4gXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1jbWFrZS1kaXNhYmxlLWJ1aWxk
aW5nLWV4dGVybmFsLWRlcGVuZGVuY2llcy5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAy
LWxpYnNoYWRlcmNfdXRpbC1maXgtZ2xzbGFuZy1oZWFkZXItZmlsZS1sb2NhdGlvbi5wYXRjaCBc
Ci0tIAoyLjMxLjEKCg==

--===============0644975349991141873==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/shaderc: PKGV changed from 2022.1 [default] to 2022.2 [default]
packages/core2-32-poky-linux/shaderc: PV changed from "2022.1" to "2022.2"
packages/core2-32-poky-linux/shaderc/shaderc-dbg: PKGV changed from 2022.1 [default] to 2022.2 [default]
packages/core2-32-poky-linux/shaderc/shaderc-dbg: PKGSIZE changed from 6575460 to 6588892 (+0%)
packages/core2-32-poky-linux/shaderc/shaderc-dbg: PV changed from "2022.1" to "2022.2"
packages/core2-32-poky-linux/shaderc/shaderc-dev: PKGV changed from 2022.1 [default] to 2022.2 [default]
packages/core2-32-poky-linux/shaderc/shaderc-dev: PKGSIZE changed from 61761 to 62114 (+1%)
packages/core2-32-poky-linux/shaderc/shaderc-dev: PV changed from "2022.1" to "2022.2"
packages/core2-32-poky-linux/shaderc/shaderc-doc: PKGV changed from 2022.1 [default] to 2022.2 [default]
packages/core2-32-poky-linux/shaderc/shaderc-doc: PV changed from "2022.1" to "2022.2"
packages/core2-32-poky-linux/shaderc/shaderc-locale: PKGV changed from 2022.1 [default] to 2022.2 [default]
packages/core2-32-poky-linux/shaderc/shaderc-locale: PV changed from "2022.1" to "2022.2"
packages/core2-32-poky-linux/shaderc/shaderc-src: PKGV changed from 2022.1 [default] to 2022.2 [default]
packages/core2-32-poky-linux/shaderc/shaderc-src: PKGSIZE changed from 317811 to 319023 (+0%)
packages/core2-32-poky-linux/shaderc/shaderc-src: PV changed from "2022.1" to "2022.2"
packages/core2-32-poky-linux/shaderc/shaderc-staticdev: PKGV changed from 2022.1 [default] to 2022.2 [default]
packages/core2-32-poky-linux/shaderc/shaderc-staticdev: PKGSIZE changed from 2493644 to 2495018 (+0%)
packages/core2-32-poky-linux/shaderc/shaderc-staticdev: PV changed from "2022.1" to "2022.2"
packages/core2-32-poky-linux/shaderc/shaderc: PKGV changed from 2022.1 [default] to 2022.2 [default]
packages/core2-32-poky-linux/shaderc/shaderc: PV changed from "2022.1" to "2022.2"

--===============0644975349991141873==--

