Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A099C77B7E
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:25 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.30008.1675272855313165610
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=SRBJfkxA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101860e0b1c07-8a7b051e-8f11-4f67-a6ff-bebba48fc268-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272854;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Fd92JXtqAsW88n7UpqAArBo89pZhMNjZKg59w6er29I=;
	b=SRBJfkxAJmYUXFRBeuSgi1W/nj5zB3wGmd7xYLNsfCtRqAqtJTV35jNhI+l/bQV/
	hIkY12LuJOFhLtmEd8EsZ2cnZgvaXHIpLSgRJHZV4V1oMqZy42ZHfzzc1QvezfKYM6l
	X9P5X/zDZjGZYon0BzAZYz0zBQZOFnVH1ibrgS74=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272854;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Fd92JXtqAsW88n7UpqAArBo89pZhMNjZKg59w6er29I=;
	b=YdTWmSNmlm6oNjpDv8k3vnD3h2A2+aFh43g2cEc3VdIuHW6MZ+4QkXG8SvDgYaVD
	BcRwbdsoHiqP5bJ9NT7YKmCYBJr6SIa9TL2h5OZiCnifqO10D8d9DRXnVh37SzcKTFH
	0yDRTF0z+Bks81FVI2OCVrS/om3doqLKeTllU/eI=
Content-Type: multipart/mixed; boundary="===============8555229315921147041=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pkgconf: upgrading to 1.9.4 SUCCEEDED
Message-ID: <010101860e0b1c07-8a7b051e-8f11-4f67-a6ff-bebba48fc268-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176590

--===============8555229315921147041==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *pkgconf* to *1.9.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pkgconf-upgrade-1.9.3-1.9.4.patch
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
--===============8555229315921147041==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pkgconf-upgrade-1.9.3-1.9.4.patch"

RnJvbSA2NzJiNzg3NzJkNTBlZmQyZGQzNDZjYWVmY2JhYmEzZjRlNzUyYTY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxMToxMDo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBr
Z2NvbmY6IHVwZ3JhZGUgMS45LjMgLT4gMS45LjQKCi0tLQogLi4uL3BrZ2NvbmYve3BrZ2NvbmZf
MS45LjMuYmIgPT4gcGtnY29uZl8xLjkuNC5iYn0gICAgICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3BrZ2NvbmYve3BrZ2NvbmZfMS45LjMuYmIgPT4gcGtnY29uZl8xLjkuNC5i
Yn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGtnY29uZi9wa2dj
b25mXzEuOS4zLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BrZ2NvbmYvcGtnY29uZl8xLjku
NC5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcGtnY29uZi9wa2djb25mXzEuOS4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcGtnY29uZi9wa2djb25mXzEuOS40LmJiCmluZGV4IDQ1M2RhODljM2QuLmFiMGYzNzEwOTMg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wa2djb25mL3BrZ2NvbmZfMS45LjMu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BrZ2NvbmYvcGtnY29uZl8xLjkuNC5iYgpA
QCAtMjAsNyArMjAsNyBAQCBTUkNfVVJJID0gIlwKICAgICBmaWxlOi8vcGtnLWNvbmZpZy1uYXRp
dmUuaW4gXAogICAgIGZpbGU6Ly9wa2ctY29uZmlnLWVzZGsuaW4gXAogIgotU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjVmYjM1NWI0ODdkNTRmYjZkMzQxZTRmMThkNGUyZjdlODEzYTY2MjJjZjAzYTll
ODdhZmZhNmE0MDU2NTY5OWQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZGFjY2YxYmJlNWEzMGQx
NDliNTU2YzdkMmZmZmZlYWZkNzZkN2I1MTRlMjQ5MjcxYWJkZDUwMTUzM2MxZDhhZSIKIAogaW5o
ZXJpdCBhdXRvdG9vbHMKIAotLSAKMi4zNy4zCgo=

--===============8555229315921147041==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/pkgconf: PKGV changed from 1.9.3 [default] to 1.9.4 [default]
packages/core2-32-poky-linux/pkgconf: PV changed from "1.9.3" to "1.9.4"
packages/core2-32-poky-linux/pkgconf: SRC_URI changed from "https://distfiles.dereferenced.org/pkgconf/pkgconf-1.9.3.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in" to "https://distfiles.dereferenced.org/pkgconf/pkgconf-1.9.4.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in"
packages/core2-32-poky-linux/pkgconf/pkgconf-dbg: PKGV changed from 1.9.3 [default] to 1.9.4 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf-dbg: PKGSIZE changed from 255968 to 255984 (+0%)
packages/core2-32-poky-linux/pkgconf/pkgconf-dbg: PV changed from "1.9.3" to "1.9.4"
packages/core2-32-poky-linux/pkgconf/pkgconf-dev: PKGV changed from 1.9.3 [default] to 1.9.4 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf-dev: PV changed from "1.9.3" to "1.9.4"
packages/core2-32-poky-linux/pkgconf/pkgconf-doc: PKGV changed from 1.9.3 [default] to 1.9.4 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf-doc: PKGSIZE changed from 29203 to 29208 (+0%)
packages/core2-32-poky-linux/pkgconf/pkgconf-doc: PV changed from "1.9.3" to "1.9.4"
packages/core2-32-poky-linux/pkgconf/pkgconf-locale: PKGV changed from 1.9.3 [default] to 1.9.4 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf-locale: PV changed from "1.9.3" to "1.9.4"
packages/core2-32-poky-linux/pkgconf/pkgconf-src: PKGV changed from 1.9.3 [default] to 1.9.4 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf-src: PKGSIZE changed from 267456 to 268613 (+0%)
packages/core2-32-poky-linux/pkgconf/pkgconf-src: PV changed from "1.9.3" to "1.9.4"
packages/core2-32-poky-linux/pkgconf/pkgconf-staticdev: PKGV changed from 1.9.3 [default] to 1.9.4 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf-staticdev: PV changed from "1.9.3" to "1.9.4"
packages/core2-32-poky-linux/pkgconf/pkgconf: PKGV changed from 1.9.3 [default] to 1.9.4 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf: PKGSIZE changed from 150609 to 150517 (-0%)
packages/core2-32-poky-linux/pkgconf/pkgconf: PV changed from "1.9.3" to "1.9.4"

--===============8555229315921147041==--

