Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12D65C64EDF
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:40 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web12.872.1667349632816012524
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=La6kLhDP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018435c85548-65739fdd-3db4-4f36-8844-c39cb0a78163-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349632;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jqY6oTp7jGQG8O1C8hWoHC8Cq8aOwKXpt6tgBi9eTKM=;
	b=La6kLhDPBLrVCEDYCx9Ql3YkkRNWHIFtdH9Yv+SKX3uDBfB6H81sdKwOLeBdaqoD
	apoHz1Ro4O7S8wrJnJJNGSoImu2erq7BrgkIIgTPK1fE+ppIhkJSn7Y+A3RLLLqCxaC
	rugrnY4oi7PT0m0x2+aN0zuk9yUlPpxMPG+ddmm0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349632;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jqY6oTp7jGQG8O1C8hWoHC8Cq8aOwKXpt6tgBi9eTKM=;
	b=S+0Ya0q3uBxCEaAftgczIFHHTjgwVd44+6gx/3oPy+2CPRdXIpr493tTROqD3Gut
	CqY3ti64gHwH0rdWhrONo1qCoCFuSqWIuCGLUTE952fbkB8OEN/H1LwnKQu716mIuOn
	tCjXafV0AzVxO2TRyRXMMc1727QV9IrmIzs/mqTA=
Content-Type: multipart/mixed; boundary="===============3660973000252031063=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] patchelf: upgrading to 0.16.1 SUCCEEDED
Message-ID: <0101018435c85548-65739fdd-3db4-4f36-8844-c39cb0a78163-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172413

--===============3660973000252031063==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *patchelf* to *0.16.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-patchelf-upgrade-0.15.0-0.16.1.patch
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
--===============3660973000252031063==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/patchelf: PV changed from "0.15.0" to "0.16.1"
packages/core2-32-poky-linux/patchelf: PKGV changed from 0.15.0 [default] to 0.16.1 [default]
packages/core2-32-poky-linux/patchelf/patchelf-dbg: PV changed from "0.15.0" to "0.16.1"
packages/core2-32-poky-linux/patchelf/patchelf-dbg: PKGV changed from 0.15.0 [default] to 0.16.1 [default]
packages/core2-32-poky-linux/patchelf/patchelf-dbg: PKGSIZE changed from 2313840 to 2397664 (+4%)
packages/core2-32-poky-linux/patchelf/patchelf-dev: PV changed from "0.15.0" to "0.16.1"
packages/core2-32-poky-linux/patchelf/patchelf-dev: PKGV changed from 0.15.0 [default] to 0.16.1 [default]
packages/core2-32-poky-linux/patchelf/patchelf-doc: PV changed from "0.15.0" to "0.16.1"
packages/core2-32-poky-linux/patchelf/patchelf-doc: PKGV changed from 0.15.0 [default] to 0.16.1 [default]
packages/core2-32-poky-linux/patchelf/patchelf-doc: PKGSIZE changed from 11726 to 7662 (-35%)
packages/core2-32-poky-linux/patchelf/patchelf-locale: PV changed from "0.15.0" to "0.16.1"
packages/core2-32-poky-linux/patchelf/patchelf-locale: PKGV changed from 0.15.0 [default] to 0.16.1 [default]
packages/core2-32-poky-linux/patchelf/patchelf-src: PV changed from "0.15.0" to "0.16.1"
packages/core2-32-poky-linux/patchelf/patchelf-src: PKGV changed from 0.15.0 [default] to 0.16.1 [default]
packages/core2-32-poky-linux/patchelf/patchelf-src: PKGSIZE changed from 227130 to 232928 (+3%)
packages/core2-32-poky-linux/patchelf/patchelf-staticdev: PV changed from "0.15.0" to "0.16.1"
packages/core2-32-poky-linux/patchelf/patchelf-staticdev: PKGV changed from 0.15.0 [default] to 0.16.1 [default]
packages/core2-32-poky-linux/patchelf/patchelf: PV changed from "0.15.0" to "0.16.1"
packages/core2-32-poky-linux/patchelf/patchelf: PKGV changed from 0.15.0 [default] to 0.16.1 [default]
packages/core2-32-poky-linux/patchelf/patchelf: PKGSIZE changed from 206332 to 214524 (+4%)

--===============3660973000252031063==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/patchelf/patchelf-doc: PKGSIZE changed from 11726 to 7662 (-35%)

--===============3660973000252031063==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-patchelf-upgrade-0.15.0-0.16.1.patch"

RnJvbSBkYmMzNDIwY2E5YWY3ZWVjMDFiMDEwNDM1MmQ1MjRlNDg4MGQyNzkzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAwODo0MjoxMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBh
dGNoZWxmOiB1cGdyYWRlIDAuMTUuMCAtPiAwLjE2LjEKCi0tLQogLi4uL3BhdGNoZWxmL3twYXRj
aGVsZl8wLjE1LjAuYmIgPT4gcGF0Y2hlbGZfMC4xNi4xLmJifSAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3BhdGNoZWxmL3twYXRjaGVsZl8wLjE1LjAuYmIgPT4gcGF0Y2hlbGZf
MC4xNi4xLmJifSAoOTAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wYXRj
aGVsZi9wYXRjaGVsZl8wLjE1LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGF0Y2hlbGYv
cGF0Y2hlbGZfMC4xNi4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTAlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9wYXRjaGVsZi9wYXRjaGVsZl8wLjE1LjAuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9wYXRjaGVsZi9wYXRjaGVsZl8wLjE2LjEuYmIKaW5kZXggZTA3
Nzc1ZjU3NC4uOGNlOWU5OTUyMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Bh
dGNoZWxmL3BhdGNoZWxmXzAuMTUuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGF0
Y2hlbGYvcGF0Y2hlbGZfMC4xNi4xLmJiCkBAIC02LDcgKzYsNyBAQCBMSUNFTlNFID0gIkdQTC0z
LjAtb25seSIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL05peE9TL3BhdGNoZWxmO3By
b3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0ZXIgXAogICAgICAgICAgICAiCi1TUkNSRVYgPSAiNDkw
MDgwMDI1NjIzNTViMGUzNTA3NWNiYzFjNDJjNjQ1ZmYwNGUyOCIKK1NSQ1JFViA9ICI0MzhkMjNl
MjljNzNiZWI4ZjE2ZTA0ZWZlMmE5MWRhYTY4MTllZjM0IgogCiBTID0gIiR7V09SS0RJUn0vZ2l0
IgogCi0tIAoyLjMxLjEKCg==

--===============3660973000252031063==--

