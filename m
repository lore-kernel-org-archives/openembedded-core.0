Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 937B3C64E96
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 13:05:46 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.5245.1668517535907762516
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 05:05:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=MHP47eEB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101847b651e3b-6ab8678f-dbb4-4aef-b103-520f0098d674-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1668517535;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sc+AE2soyH97Wz6i070TYXTV6NaTkEaNdJyfMXzOhp4=;
	b=MHP47eEBvYZoclhL/s+C9j+i0XdXt1e7dCJIjYDp1VA0gpgi8YWixchBxcroPG8s
	GNSotQT0za4Cj8JJ6UQ/TkD1upG6IWxqAHeV6yW6D9AObOwj3lby0exjFj/qpyQXi1N
	uWlklislK4mD4GonqsL3CU6ZJp89TYkJoTKqo9p0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1668517535;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sc+AE2soyH97Wz6i070TYXTV6NaTkEaNdJyfMXzOhp4=;
	b=SgZWtqRHZdwSoddj+Q6XREY83b5biABlybO98kFPcVZ5zE1uUz0OndWorDerjp8y
	HjhojRf3VCD0p++wYHM83o3tD8bEvdqcqNXHESGtf3DP3VPmA9PVxsb8QiIUIjlfiMV
	2pecpVYDPq4znehLsUr8ondzKvKRQGQDvbM/N8HI=
Content-Type: multipart/mixed; boundary="===============1669394829661876282=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] patchelf: upgrading to 0.17.0 SUCCEEDED
Message-ID: <010101847b651e3b-6ab8678f-dbb4-4aef-b103-520f0098d674-000000@us-west-2.amazonses.com>
Date: Tue, 15 Nov 2022 13:05:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 13:05:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173291

--===============1669394829661876282==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *patchelf* to *0.17.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-patchelf-upgrade-0.16.1-0.17.0.patch
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
--===============1669394829661876282==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-patchelf-upgrade-0.16.1-0.17.0.patch"

RnJvbSA3MjFlNGZhYjcwMjJjMzEyZWRkZDkwNmYyZjFhNzg5MDA3MWNmYzM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgTm92IDIwMjIgMDc6NTU6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
YXRjaGVsZjogdXBncmFkZSAwLjE2LjEgLT4gMC4xNy4wCgotLS0KIC4uLi9wYXRjaGVsZi97cGF0
Y2hlbGZfMC4xNi4xLmJiID0+IHBhdGNoZWxmXzAuMTcuMC5iYn0gICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9wYXRjaGVsZi97cGF0Y2hlbGZfMC4xNi4xLmJiID0+IHBhdGNoZWxm
XzAuMTcuMC5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGF0
Y2hlbGYvcGF0Y2hlbGZfMC4xNi4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BhdGNoZWxm
L3BhdGNoZWxmXzAuMTcuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDkwJQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcGF0Y2hlbGYvcGF0Y2hlbGZfMC4xNi4xLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGF0Y2hlbGYvcGF0Y2hlbGZfMC4xNy4wLmJiCmluZGV4IDhj
ZTllOTk1MjAuLjVmYWVlOTIzYmYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
YXRjaGVsZi9wYXRjaGVsZl8wLjE2LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Bh
dGNoZWxmL3BhdGNoZWxmXzAuMTcuMC5iYgpAQCAtNiw3ICs2LDcgQEAgTElDRU5TRSA9ICJHUEwt
My4wLW9ubHkiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9OaXhPUy9wYXRjaGVsZjtw
cm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyIFwKICAgICAgICAgICAgIgotU1JDUkVWID0gIjQz
OGQyM2UyOWM3M2JlYjhmMTZlMDRlZmUyYTkxZGFhNjgxOWVmMzQiCitTUkNSRVYgPSAiYWQwMjY1
NjY4ZjEyZWZmNTkwMjcyNTkzNDVmZWQ0YjBmMzE1MzM2YSIKIAogUyA9ICIke1dPUktESVJ9L2dp
dCIKIAotLSAKMi4zMS4xCgo=

--===============1669394829661876282==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/patchelf/patchelf-src: PKGSIZE changed from 232928 to 271596 (+17%)

--===============1669394829661876282==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/patchelf: PKGV changed from 0.16.1 [default] to 0.17.0 [default]
packages/core2-32-poky-linux/patchelf: PV changed from "0.16.1" to "0.17.0"
packages/core2-32-poky-linux/patchelf/patchelf-dbg: PKGV changed from 0.16.1 [default] to 0.17.0 [default]
packages/core2-32-poky-linux/patchelf/patchelf-dbg: PV changed from "0.16.1" to "0.17.0"
packages/core2-32-poky-linux/patchelf/patchelf-dbg: PKGSIZE changed from 2397664 to 2397456 (-0%)
packages/core2-32-poky-linux/patchelf/patchelf-dev: PKGV changed from 0.16.1 [default] to 0.17.0 [default]
packages/core2-32-poky-linux/patchelf/patchelf-dev: PV changed from "0.16.1" to "0.17.0"
packages/core2-32-poky-linux/patchelf/patchelf-doc: PKGV changed from 0.16.1 [default] to 0.17.0 [default]
packages/core2-32-poky-linux/patchelf/patchelf-doc: PV changed from "0.16.1" to "0.17.0"
packages/core2-32-poky-linux/patchelf/patchelf-locale: PKGV changed from 0.16.1 [default] to 0.17.0 [default]
packages/core2-32-poky-linux/patchelf/patchelf-locale: PV changed from "0.16.1" to "0.17.0"
packages/core2-32-poky-linux/patchelf/patchelf-src: PKGV changed from 0.16.1 [default] to 0.17.0 [default]
packages/core2-32-poky-linux/patchelf/patchelf-src: PV changed from "0.16.1" to "0.17.0"
packages/core2-32-poky-linux/patchelf/patchelf-src: PKGSIZE changed from 232928 to 271596 (+17%)
packages/core2-32-poky-linux/patchelf/patchelf-staticdev: PKGV changed from 0.16.1 [default] to 0.17.0 [default]
packages/core2-32-poky-linux/patchelf/patchelf-staticdev: PV changed from "0.16.1" to "0.17.0"
packages/core2-32-poky-linux/patchelf/patchelf: PKGV changed from 0.16.1 [default] to 0.17.0 [default]
packages/core2-32-poky-linux/patchelf/patchelf: PV changed from "0.16.1" to "0.17.0"

--===============1669394829661876282==--

