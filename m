Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE05C88C95
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 21:29:03 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.32127.1680384534976172389
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 14:28:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=InOdcz07;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101873eb927c7-97134a0c-a51b-4a87-b05f-516f0d13ecdc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1680384534;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=R42g6lKr9vU6Qj4c6/NdVLcVVEG3OGFovhJhrhyJwko=;
	b=InOdcz07o+xIS3348b2VlkDiMCU/OswIUXomrKfVcBa6CdeND2hcSeXO1Y95pCtm
	sL1uPq+qp8VjxowdOKzRTiBIn/K4c+kcBqvR8yya/fv6mFSnRjWVyVgfXgHRZcd5359
	+WphenLkhCH2/T5p31MPE/39qFCHanrzI9A/nsOA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1680384534;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=R42g6lKr9vU6Qj4c6/NdVLcVVEG3OGFovhJhrhyJwko=;
	b=XchDrLhn2iBd4KqfFcsvDcYET86voq6UYiYSQCpguNjAYKmWIe2XHgtOvaXa1DJF
	06zO/bWzJdrGmIjfmFQqvfo6oejd2pok124KKVgUGha91fiysC0TUjbvEe2fUsMf+AJ
	A66UV+m/i1tk13D5ujZFIuOyUdF4trsL+NrrboDw=
Content-Type: multipart/mixed; boundary="===============2908738591756886369=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vala: upgrading to 0.56.5 SUCCEEDED
Message-ID: <010101873eb927c7-97134a0c-a51b-4a87-b05f-516f0d13ecdc-000000@us-west-2.amazonses.com>
Date: Sat, 1 Apr 2023 21:28:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 21:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179510

--===============2908738591756886369==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vala* to *0.56.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vala-upgrade-0.56.4-0.56.5.patch
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
--===============2908738591756886369==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vala-upgrade-0.56.4-0.56.5.patch"

RnJvbSBjMmU1MDJiYTUxMDQwMzE1YzhiYzc5NTgxYTg5NjE4MjEzYzUxMDA4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBBcHIgMjAyMyAxMTo0OTowMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZh
bGE6IHVwZ3JhZGUgMC41Ni40IC0+IDAuNTYuNQoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
dmFsYS97dmFsYV8wLjU2LjQuYmIgPT4gdmFsYV8wLjU2LjUuYmJ9IHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3ZhbGEve3ZhbGFfMC41Ni40LmJiID0+IHZhbGFfMC41Ni41LmJifSAoMTglKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxhL3ZhbGFfMC41Ni40LmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGEvdmFsYV8wLjU2LjUuYmIKc2ltaWxhcml0eSBpbmRl
eCAxOCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGEvdmFsYV8wLjU2LjQu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxhL3ZhbGFfMC41Ni41LmJiCmlu
ZGV4IDMyZmE4MWEwOGIuLjc0NDczNWU4NDIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy92YWxhL3ZhbGFfMC41Ni40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxh
L3ZhbGFfMC41Ni41LmJiCkBAIC0xLDMgKzEsMyBAQAogcmVxdWlyZSAke0JQTn0uaW5jCiAKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICI4NjJjNDFkOTM4NTQzZWQzZDhkODZjODIxOWE2MTA4Nzc5NzE5
M2RlZmVlOGRhMGM1MGNhZjQ5OTkzYzY2YjZhIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjJiNDI5
MmU3MzAxZGU1ZmU5MDRlNjc2MTgxMTZiYzQwMjdmNjAxMzBhMjQyYjRhMjIyOGEyOTVlNjM1N2I0
OGMiCi0tIAoyLjM5LjIKCg==

--===============2908738591756886369==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/vala: PKGV changed from 0.56.4 [default] to 0.56.5 [default]
packages/core2-32-poky-linux/vala: PV changed from "0.56.4" to "0.56.5"
packages/core2-32-poky-linux/vala: SRC_URI changed from "http://ftp.gnome.org/pub/GNOME/sources/vala/0.56/vala-0.56.4.tar.xz" to "http://ftp.gnome.org/pub/GNOME/sources/vala/0.56/vala-0.56.5.tar.xz"
packages/core2-32-poky-linux/vala/vala-dbg: PKGV changed from 0.56.4 [default] to 0.56.5 [default]
packages/core2-32-poky-linux/vala/vala-dbg: PKGSIZE changed from 15513040 to 15523700 (+0%)
packages/core2-32-poky-linux/vala/vala-dbg: PV changed from "0.56.4" to "0.56.5"
packages/core2-32-poky-linux/vala/vala-dev: PKGV changed from 0.56.4 [default] to 0.56.5 [default]
packages/core2-32-poky-linux/vala/vala-dev: PV changed from "0.56.4" to "0.56.5"
packages/core2-32-poky-linux/vala/vala-doc: PKGV changed from 0.56.4 [default] to 0.56.5 [default]
packages/core2-32-poky-linux/vala/vala-doc: PKGSIZE changed from 10316 to 10307 (-0%)
packages/core2-32-poky-linux/vala/vala-doc: PV changed from "0.56.4" to "0.56.5"
packages/core2-32-poky-linux/vala/vala-locale: PKGV changed from 0.56.4 [default] to 0.56.5 [default]
packages/core2-32-poky-linux/vala/vala-locale: PV changed from "0.56.4" to "0.56.5"
packages/core2-32-poky-linux/vala/vala-src: PKGV changed from 0.56.4 [default] to 0.56.5 [default]
packages/core2-32-poky-linux/vala/vala-src: PKGSIZE changed from 15772079 to 15784748 (+0%)
packages/core2-32-poky-linux/vala/vala-src: PV changed from "0.56.4" to "0.56.5"
packages/core2-32-poky-linux/vala/vala-staticdev: PKGV changed from 0.56.4 [default] to 0.56.5 [default]
packages/core2-32-poky-linux/vala/vala-staticdev: PV changed from "0.56.4" to "0.56.5"
packages/core2-32-poky-linux/vala/vala: PKGV changed from 0.56.4 [default] to 0.56.5 [default]
packages/core2-32-poky-linux/vala/vala: PKGSIZE changed from 13417021 to 13222680 (-1%)
packages/core2-32-poky-linux/vala/vala: PV changed from "0.56.4" to "0.56.5"

--===============2908738591756886369==--

