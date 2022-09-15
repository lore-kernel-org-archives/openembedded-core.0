Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D78B0C6FA93
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 14:18:42 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.10623.1663251513209410086
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 07:18:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Kcc0zoBJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 0101018341840316-40fde4cf-50d7-43d7-9eb1-d1bc76e38266-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1663251514;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BunDZew371/ORqFgZ1+zW2sUvrB1bMsyy3Yb1voxu8s=;
	b=Kcc0zoBJCzP+vkieMl0yhv/2GXf5lqpRpSzaD6k5FnXHATOVhluOvsHiZM+MdaKq
	KNd7Kja7g0EixjOt8EyNAjd7RF0h+jbDjMd+xzZ2pxbvXuPxdljMEYvcB4doaXG3o/i
	NSLOXA6+YRZ0IEVY8HBkLzuMnNNw8J3Vm1EGVTRA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1663251514;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BunDZew371/ORqFgZ1+zW2sUvrB1bMsyy3Yb1voxu8s=;
	b=GlLTIAB+/wySf3unrGmYRWjokMhYDwRnCzz5qZNWDnOkC9QkhPoYXF2TLK2sRSZJ
	hHECLT8+beh+AZ9llk3vuxdoCnPpYrYRWoDmu/OzACOa4yzdA9qH0QNK90zJJOpnhuZ
	lOF3KQXgUyHCpi4LhFPVlhiytT4/K2Vud0vJZWLE=
Content-Type: multipart/mixed; boundary="===============6136330267237481581=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libjitterentropy: upgrading to 3.4.1 SUCCEEDED
Message-ID: 
 <0101018341840316-40fde4cf-50d7-43d7-9eb1-d1bc76e38266-000000@us-west-2.amazonses.com>
Date: Thu, 15 Sep 2022 14:18:34 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 14:18:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170763

--===============6136330267237481581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libjitterentropy* to *3.4.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libjitterentropy-upgrade-3.4.0-3.4.1.patch
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
--===============6136330267237481581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libjitterentropy/libjitterentropy-doc: PKGSIZE changed from 3731 to 4204 (+13%)
packages/core2-32-poky-linux/libjitterentropy/libjitterentropy: FILELIST: removed "/usr/lib/libjitterentropy.so.3.4.0", added "/usr/lib/libjitterentropy.so.3.4.1"
Changes to packages/core2-32-poky-linux/libjitterentropy (sysroot):
  /usr/lib/libjitterentropy.so.3 changed symlink target from libjitterentropy.so.3.4.0 to libjitterentropy.so.3.4.1
  /usr/lib/libjitterentropy.so.3.4.0 moved to /usr/lib/libjitterentropy.so.3.4.1

--===============6136330267237481581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libjitterentropy: PV changed from "3.4.0" to "3.4.1"
packages/core2-32-poky-linux/libjitterentropy: PKGV changed from 3.4.0 [default] to 3.4.1 [default]
packages/core2-32-poky-linux/libjitterentropy/libjitterentropy-dbg: PV changed from "3.4.0" to "3.4.1"
packages/core2-32-poky-linux/libjitterentropy/libjitterentropy-dbg: PKGSIZE changed from 48272 to 48364 (+0%)
packages/core2-32-poky-linux/libjitterentropy/libjitterentropy-dbg: FILELIST: removed "/usr/lib/.debug/libjitterentropy.so.3.4.0", added "/usr/lib/.debug/libjitterentropy.so.3.4.1"
packages/core2-32-poky-linux/libjitterentropy/libjitterentropy-dbg: PKGV changed from 3.4.0 [default] to 3.4.1 [default]
packages/core2-32-poky-linux/libjitterentropy/libjitterentropy-dev: PV changed from "3.4.0" to "3.4.1"
packages/core2-32-poky-linux/libjitterentropy/libjitterentropy-dev: PKGSIZE changed from 27915 to 29072 (+4%)
packages/core2-32-poky-linux/libjitterentropy/libjitterentropy-dev: PKGV changed from 3.4.0 [default] to 3.4.1 [default]
packages/core2-32-poky-linux/libjitterentropy/libjitterentropy-doc: PV changed from "3.4.0" to "3.4.1"
packages/core2-32-poky-linux/libjitterentropy/libjitterentropy-doc: PKGSIZE changed from 3731 to 4204 (+13%)
packages/core2-32-poky-linux/libjitterentropy/libjitterentropy-doc: PKGV changed from 3.4.0 [default] to 3.4.1 [default]
packages/core2-32-poky-linux/libjitterentropy/libjitterentropy-locale: PV changed from "3.4.0" to "3.4.1"
packages/core2-32-poky-linux/libjitterentropy/libjitterentropy-locale: PKGV changed from 3.4.0 [default] to 3.4.1 [default]
packages/core2-32-poky-linux/libjitterentropy/libjitterentropy-src: PV changed from "3.4.0" to "3.4.1"
packages/core2-32-poky-linux/libjitterentropy/libjitterentropy-src: PKGSIZE changed from 107839 to 109257 (+1%)
packages/core2-32-poky-linux/libjitterentropy/libjitterentropy-src: PKGV changed from 3.4.0 [default] to 3.4.1 [default]
packages/core2-32-poky-linux/libjitterentropy/libjitterentropy-staticdev: PV changed from "3.4.0" to "3.4.1"
packages/core2-32-poky-linux/libjitterentropy/libjitterentropy-staticdev: PKGV changed from 3.4.0 [default] to 3.4.1 [default]
packages/core2-32-poky-linux/libjitterentropy/libjitterentropy: PV changed from "3.4.0" to "3.4.1"
packages/core2-32-poky-linux/libjitterentropy/libjitterentropy: FILELIST: removed "/usr/lib/libjitterentropy.so.3.4.0", added "/usr/lib/libjitterentropy.so.3.4.1"
packages/core2-32-poky-linux/libjitterentropy/libjitterentropy: PKGV changed from 3.4.0 [default] to 3.4.1 [default]
Changes to packages/core2-32-poky-linux/libjitterentropy (sysroot):
  /usr/lib/libjitterentropy.so.3 changed symlink target from libjitterentropy.so.3.4.0 to libjitterentropy.so.3.4.1
  /usr/lib/libjitterentropy.so.3.4.0 moved to /usr/lib/libjitterentropy.so.3.4.1

--===============6136330267237481581==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libjitterentropy-upgrade-3.4.0-3.4.1.patch"

RnJvbSBkZjNiZmVkZDJhNDllMjU2ZWVkMzQwYjMxMDA3OWE4OWIzOTc3ZWFjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgU2VwIDIwMjIgMTM6MzI6NTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJqaXR0ZXJlbnRyb3B5OiB1cGdyYWRlIDMuNC4wIC0+IDMuNC4xCgotLS0KIC4uLi97bGliaml0
dGVyZW50cm9weV8zLjQuMC5iYiA9PiBsaWJqaXR0ZXJlbnRyb3B5XzMuNC4xLmJifSAgICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmppdHRlcmVudHJvcHkve2xpYmppdHRlcmVudHJvcHlf
My40LjAuYmIgPT4gbGliaml0dGVyZW50cm9weV8zLjQuMS5iYn0gKDk1JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJqaXR0ZXJlbnRyb3B5L2xpYmppdHRlcmVudHJvcHlf
My40LjAuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJqaXR0ZXJlbnRyb3B5L2xpYmppdHRl
cmVudHJvcHlfMy40LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvbGliaml0dGVyZW50cm9weS9saWJqaXR0ZXJlbnRyb3B5XzMuNC4wLmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJqaXR0ZXJlbnRyb3B5L2xpYmppdHRl
cmVudHJvcHlfMy40LjEuYmIKaW5kZXggMWQyOTFjYzM1Ny4uM2ZiOGM2YjE0NyAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliaml0dGVyZW50cm9weS9saWJqaXR0ZXJlbnRyb3B5
XzMuNC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmppdHRlcmVudHJvcHkvbGli
aml0dGVyZW50cm9weV8zLjQuMS5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFO21kNT02NGE4NzE4MDkwODU0MDYyMGNlMzY0YjVlNjliM2IwMyBc
CiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTlNFLmJzZDttZDU9NjZhNWNlZGFmNjJj
NGIyNjM3MDI1ZjA0OWY5YjgyNmYgXAogICAgICAgICAgICAgICAgICAgICAiCiBTUkNfVVJJID0g
ImdpdDovL2dpdGh1Yi5jb20vc211ZWxsZXJERC9qaXR0ZXJlbnRyb3B5LWxpYnJhcnkuZ2l0O2Jy
YW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMiCi1TUkNSRVYgPSAiMmU1MDE5Y2ZlNjMwMzhmYWFh
NDA1Y2U1MzcxNWVmZmU0ZWE1ODBlNCIKK1NSQ1JFViA9ICI0NTQ0ZTExMzIwMTM4YWMwMjc5N2Fm
ODE3NjZmNDQ3NmE3MWJiMDlmIgogUyA9ICIke1dPUktESVJ9L2dpdCIKIAogIyByZW1vdmUgYXQg
bmV4dCB2ZXJzaW9uIHVwZ3JhZGUgb3Igd2hlbiBvdXRwdXQgY2hhbmdlcwotLSAKMi4zMS4xCgo=

--===============6136330267237481581==--

