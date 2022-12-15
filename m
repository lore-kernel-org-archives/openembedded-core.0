Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07783C54EBC
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:35 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.144496.1671136351301435968
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=JjQXCdzE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010185177d1a3b-92189f0c-1ffd-451a-a765-047c9bca4aab-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6vzMN4IYKHVmrmNTE2s5iU3piZGC3ocI+YS//QBZ2KQ=;
	b=JjQXCdzE4LF+bpG4tiQqcgOPVj/uZYaDt6q6O66npu8uiiYNn7bSN7wiPUUJV2SD
	eB4rzTpjIcgSWtGvwlHjylhagB1d1uRn5LobHJWuKYLZVPkA2jx3wtnds36a5gYl5hG
	oJFnU7Edwsdn18088bPYkN8UXwFkQ7SsMNnsbVzw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6vzMN4IYKHVmrmNTE2s5iU3piZGC3ocI+YS//QBZ2KQ=;
	b=hcNfBaXfx8jmIom3G9VGJGqshdCpvqBN/QH3gGZAvYX6rfDoAt1bD+LWPvTw+DlM
	Y+sGXRgE+vmXvOQ6Xc33rOWqrU+ZVIlIiQFN+iIZG5p9eB3JTzHYcNvj8LscXRkREg4
	BPNCXPMnkLP1GdbB4EY7acUy0OWhdl0Dzg+4rkcI=
Content-Type: multipart/mixed; boundary="===============3499068645056815054=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-headers: upgrading to 1.3.236.0 SUCCEEDED
Message-ID: <01010185177d1a3b-92189f0c-1ffd-451a-a765-047c9bca4aab-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174683

--===============3499068645056815054==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *spirv-headers* to *1.3.236.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-spirv-headers-upgrade-1.3.231.1-1.3.236.0.patch
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
--===============3499068645056815054==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/spirv-headers: PV changed from "1.3.231.1" to "1.3.236.0"
packages/core2-32-poky-linux/spirv-headers: PKGV changed from 1.3.231.1 [default] to 1.3.236.0 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dbg: PV changed from "1.3.231.1" to "1.3.236.0"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dbg: PKGV changed from 1.3.231.1 [default] to 1.3.236.0 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dev: PV changed from "1.3.231.1" to "1.3.236.0"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dev: PKGV changed from 1.3.231.1 [default] to 1.3.236.0 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dev: PKGSIZE changed from 2738782 to 2785320 (+2%)
packages/core2-32-poky-linux/spirv-headers/spirv-headers-doc: PV changed from "1.3.231.1" to "1.3.236.0"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-doc: PKGV changed from 1.3.231.1 [default] to 1.3.236.0 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-locale: PV changed from "1.3.231.1" to "1.3.236.0"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-locale: PKGV changed from 1.3.231.1 [default] to 1.3.236.0 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-src: PV changed from "1.3.231.1" to "1.3.236.0"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-src: PKGV changed from 1.3.231.1 [default] to 1.3.236.0 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-staticdev: PV changed from "1.3.231.1" to "1.3.236.0"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-staticdev: PKGV changed from 1.3.231.1 [default] to 1.3.236.0 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers: PV changed from "1.3.231.1" to "1.3.236.0"
packages/core2-32-poky-linux/spirv-headers/spirv-headers: PKGV changed from 1.3.231.1 [default] to 1.3.236.0 [default]

--===============3499068645056815054==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-spirv-headers-upgrade-1.3.231.1-1.3.236.0.patch"

RnJvbSAwMDUwY2U0ZTYxYTU5NjBkYzUzMmJiODNiOGNjNDRiMDcxMmY0YmQ0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMTY6MDI6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
cGlydi1oZWFkZXJzOiB1cGdyYWRlIDEuMy4yMzEuMSAtPiAxLjMuMjM2LjAKCi0tLQogLi4uL3tz
cGlydi1oZWFkZXJzXzEuMy4yMzEuMS5iYiA9PiBzcGlydi1oZWFkZXJzXzEuMy4yMzYuMC5iYn0g
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIve3NwaXJ2LWhlYWRlcnNfMS4zLjIzMS4x
LmJiID0+IHNwaXJ2LWhlYWRlcnNfMS4zLjIzNi4wLmJifSAoOTIlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LWhlYWRlcnNfMS4zLjIzMS4xLmJiIGIvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtaGVhZGVyc18xLjMuMjM2LjAuYmIKc2ltaWxh
cml0eSBpbmRleCA5MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3Bp
cnYtaGVhZGVyc18xLjMuMjMxLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9z
cGlyL3NwaXJ2LWhlYWRlcnNfMS4zLjIzNi4wLmJiCmluZGV4IGZkY2M4ZDUyM2YuLmUzNTYyOGVj
YmYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LWhlYWRlcnNf
MS4zLjIzMS4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LWhlYWRl
cnNfMS4zLjIzNi4wLmJiCkBAIC03LDcgKzcsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL3d3dy5r
aHJvbm9zLm9yZy9yZWdpc3RyeS9zcGlyLXYiCiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWM5MzhiODViY2ViOGZiMjZjMWE4MDdmMjhhNTJh
ZTJkIgogCi1TUkNSRVYgPSAiODVhMWVkMjAwZDUwNjYwNzg2YzFhODhkOTE2NmU4NzExMjNjY2Uz
OSIKK1NSQ1JFViA9ICIxZDMxYTEwMDQwNWNmODc4M2NhN2EzMWUzMWNkZDcyN2M5ZmM1NGMzIgog
U1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL0tocm9ub3NHcm91cC9TUElSVi1IZWFkZXJzO3By
b3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0ZXIiCiBQRSA9ICIxIgogVVBTVFJFQU1fQ0hFQ0tfR0lU
VEFHUkVHRVggPSAic2RrLSg/UDxwdmVyPlxkKyhcLlxkKykrKSIKLS0gCjIuMzcuMwoK

--===============3499068645056815054==--

