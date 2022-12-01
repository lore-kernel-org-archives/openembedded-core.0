Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D736C64EBF
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:30:34 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.46819.1669908626468875427
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:30:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=dK1Zrxhc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010184ce4f788d-97aef7af-861a-4d9a-9798-51b624e70f44-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1669908625;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wAeKeEgX791uDl4ss/35uvo0fmSMa61TuX4n9jUHZKs=;
	b=dK1ZrxhcLE0jqFHy8RLbItS4thUDCm/Ng9vKMiHXOSTye3T6ler+5zs1YTbQyN8z
	9y2Q+DpXTVyt0uj0KlX7J8IfyHZIzQwDWcUv+5VxuTHgW3yto5P38MQQOEBF7a12LD/
	9rotWlSRKbmaZd8U4d42rA2qQSQmpEJlDVc4KwX4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1669908625;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wAeKeEgX791uDl4ss/35uvo0fmSMa61TuX4n9jUHZKs=;
	b=I/jI8LCzwZ0D5xnECqtKVgspkZ9zB7nZ1yAU+C75jpfFP4f7ShbAQl7Y0RfWZMca
	JrBJv1VjwHVObGr7u3xpe9otJMQuvxbMdI0gIADsREjvg4kGYPArCgy3Cb49tuEqAEV
	ihDzbKcTAitvXfh7T7bLJ1gB2GXYD5XKHZzA7VcQ=
Content-Type: multipart/mixed; boundary="===============3199289465636285607=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] patchelf: upgrading to 0.17.0 SUCCEEDED
Message-ID: <01010184ce4f788d-97aef7af-861a-4d9a-9798-51b624e70f44-000000@us-west-2.amazonses.com>
Date: Thu, 1 Dec 2022 15:30:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:30:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174137

--===============3199289465636285607==
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
--===============3199289465636285607==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-patchelf-upgrade-0.16.1-0.17.0.patch"

RnJvbSBhN2Q4MDkwZGYyNzE3YWFmZWM0ZmM3MDE1ZWYzN2IyMzIyOWFkYmI4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBEZWMgMjAyMiAwODozOToyMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBh
dGNoZWxmOiB1cGdyYWRlIDAuMTYuMSAtPiAwLjE3LjAKCi0tLQogLi4uL3BhdGNoZWxmL3twYXRj
aGVsZl8wLjE2LjEuYmIgPT4gcGF0Y2hlbGZfMC4xNy4wLmJifSAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3BhdGNoZWxmL3twYXRjaGVsZl8wLjE2LjEuYmIgPT4gcGF0Y2hlbGZf
MC4xNy4wLmJifSAoOTAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wYXRj
aGVsZi9wYXRjaGVsZl8wLjE2LjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGF0Y2hlbGYv
cGF0Y2hlbGZfMC4xNy4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTAlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9wYXRjaGVsZi9wYXRjaGVsZl8wLjE2LjEuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9wYXRjaGVsZi9wYXRjaGVsZl8wLjE3LjAuYmIKaW5kZXggOGNl
OWU5OTUyMC4uNWZhZWU5MjNiZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Bh
dGNoZWxmL3BhdGNoZWxmXzAuMTYuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGF0
Y2hlbGYvcGF0Y2hlbGZfMC4xNy4wLmJiCkBAIC02LDcgKzYsNyBAQCBMSUNFTlNFID0gIkdQTC0z
LjAtb25seSIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL05peE9TL3BhdGNoZWxmO3By
b3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0ZXIgXAogICAgICAgICAgICAiCi1TUkNSRVYgPSAiNDM4
ZDIzZTI5YzczYmViOGYxNmUwNGVmZTJhOTFkYWE2ODE5ZWYzNCIKK1NSQ1JFViA9ICJhZDAyNjU2
NjhmMTJlZmY1OTAyNzI1OTM0NWZlZDRiMGYzMTUzMzZhIgogCiBTID0gIiR7V09SS0RJUn0vZ2l0
IgogCi0tIAoyLjMxLjEKCg==

--===============3199289465636285607==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/patchelf: PV changed from "0.16.1" to "0.17.0"
packages/core2-32-poky-linux/patchelf: PKGV changed from 0.16.1 [default] to 0.17.0 [default]
packages/core2-32-poky-linux/patchelf/patchelf-dbg: PV changed from "0.16.1" to "0.17.0"
packages/core2-32-poky-linux/patchelf/patchelf-dbg: PKGV changed from 0.16.1 [default] to 0.17.0 [default]
packages/core2-32-poky-linux/patchelf/patchelf-dbg: PKGSIZE changed from 2397664 to 2397456 (-0%)
packages/core2-32-poky-linux/patchelf/patchelf-dev: PV changed from "0.16.1" to "0.17.0"
packages/core2-32-poky-linux/patchelf/patchelf-dev: PKGV changed from 0.16.1 [default] to 0.17.0 [default]
packages/core2-32-poky-linux/patchelf/patchelf-doc: PV changed from "0.16.1" to "0.17.0"
packages/core2-32-poky-linux/patchelf/patchelf-doc: PKGV changed from 0.16.1 [default] to 0.17.0 [default]
packages/core2-32-poky-linux/patchelf/patchelf-locale: PV changed from "0.16.1" to "0.17.0"
packages/core2-32-poky-linux/patchelf/patchelf-locale: PKGV changed from 0.16.1 [default] to 0.17.0 [default]
packages/core2-32-poky-linux/patchelf/patchelf-src: PV changed from "0.16.1" to "0.17.0"
packages/core2-32-poky-linux/patchelf/patchelf-src: PKGV changed from 0.16.1 [default] to 0.17.0 [default]
packages/core2-32-poky-linux/patchelf/patchelf-src: PKGSIZE changed from 232928 to 271596 (+17%)
packages/core2-32-poky-linux/patchelf/patchelf-staticdev: PV changed from "0.16.1" to "0.17.0"
packages/core2-32-poky-linux/patchelf/patchelf-staticdev: PKGV changed from 0.16.1 [default] to 0.17.0 [default]
packages/core2-32-poky-linux/patchelf/patchelf: PV changed from "0.16.1" to "0.17.0"
packages/core2-32-poky-linux/patchelf/patchelf: PKGV changed from 0.16.1 [default] to 0.17.0 [default]

--===============3199289465636285607==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/patchelf/patchelf-src: PKGSIZE changed from 232928 to 271596 (+17%)

--===============3199289465636285607==--

