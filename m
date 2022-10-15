Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C09C1C4708E
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:19 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web09.24566.1665871395530236791
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=jBx7lrhG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010183ddac3834-87a6580b-6824-435d-8a1a-ae56bd8d5296-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2l3WIm153EWzpsLLuM6eIJWMvz6rs9deRr9uhzFBjbM=;
	b=jBx7lrhG0djktJlQR/h8VqvQj6WagkCYxTjmUlHynrmz7nteQtEklJWR9gbDOGgm
	eIUSug1m07sYWV7Bst6Mi/GdcdIWWWuESs+BrmG+oqOb4qehu3KTb0obZdrrfkYjIFg
	L6oWRQ2Ap0TiATghtNNjspceUO4z/jNbNbi03ZVU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2l3WIm153EWzpsLLuM6eIJWMvz6rs9deRr9uhzFBjbM=;
	b=R9RA0lb5b0tRWn9XnASZlCK1DEKhuHkgseKxVPyIvzk6ZxG7yaWCP8sknhxTFaxQ
	mIuXEt2pcqWkbELXBP492oBXUUpWO56X44uLGs5FovvTjxizHtYUxitc1SR4OmAyT3p
	wbk9076TtFdHMvRKkGUGAhXwUIU6QgitWIC0fetg=
Content-Type: multipart/mixed; boundary="===============0674758789487482018=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] xz: upgrading to 5.2.7 SUCCEEDED
Message-ID: <01010183ddac3834-87a6580b-6824-435d-8a1a-ae56bd8d5296-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171824

--===============0674758789487482018==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xz* to *5.2.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xz-upgrade-5.2.6-5.2.7.patch
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
--===============0674758789487482018==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-xz-upgrade-5.2.6-5.2.7.patch"

RnJvbSA3ZGQ5YWQ5ZjFmYzExYTcyMGZhN2ZjZDg3YjkwY2I3M2U5MTE5Njg2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTQ6Mjg6MzAgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
ejogdXBncmFkZSA1LjIuNiAtPiA1LjIuNwoKLS0tCiBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQveHov
e3h6XzUuMi42LmJiID0+IHh6XzUuMi43LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC94
ei97eHpfNS4yLjYuYmIgPT4geHpfNS4yLjcuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL3h6L3h6XzUuMi42LmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3h6
L3h6XzUuMi43LmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1leHRlbmRlZC94ei94el81LjIuNi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L3h6L3h6XzUuMi43LmJiCmluZGV4IDM0ODI2MjI0NzEuLjg4ZWM4NDdjMTUgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1leHRlbmRlZC94ei94el81LjIuNi5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQveHoveHpfNS4yLjcuYmIKQEAgLTI1LDcgKzI1LDcgQEAgTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vQ09QWUlORzttZDU9OTdkNTU0YTMyODgxZmVlMGFhMjgzZDk2ZTQ3Y2IyNGEg
XAogICAgICAgICAgICAgICAgICAgICAiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly90dWthYW5pLm9y
Zy94ei94ei0ke1BWfS50YXIuZ3oiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTIxMDVhYmVlMTdi
Y2QyZWJkMTVjZWQzMWI0ZjVlZGE2ZTE3ZWZkNmIxMGY5MjFhMDFjZGE0YTQ0YzkxYjNhMCIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICIwNjMyN2MyZGRjODFlMTI2YTZkOWE3OGIwYmU1MDE0Yjk3NmEy
YzA4MzJmNDkyZGNmYzQ3NTVkN2ZhY2Y2ZDMzIgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAieHot
KD9QPHB2ZXI+XGQrKFwuXGQrKSspXC50YXIiCiAKIENBQ0hFRF9DT05GSUdVUkVWQVJTICs9ICJn
bF9jdl9wb3NpeF9zaGVsbD0vYmluL3NoIgotLSAKMi4zMS4xCgo=

--===============0674758789487482018==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/xz: PACKAGES: added "xz-locale-tr"
packages/core2-32-poky-linux/xz/liblzma: FILELIST: removed "/usr/lib/liblzma.so.5.2.6", added "/usr/lib/liblzma.so.5.2.7"
Changes to packages/core2-32-poky-linux/xz (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.2.6 to liblzma.so.5.2.7
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.2.6 to liblzma.so.5.2.7
  /usr/lib/liblzma.so.5.2.6 moved to /usr/lib/liblzma.so.5.2.7
Changes to packages/x86_64-linux/xz-native (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.2.6 to liblzma.so.5.2.7
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.2.6 to liblzma.so.5.2.7
  /usr/lib/liblzma.so.5.2.6 moved to /usr/lib/liblzma.so.5.2.7

--===============0674758789487482018==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/xz: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz: SRC_URI changed from "https://tukaani.org/xz/xz-5.2.6.tar.gz" to "https://tukaani.org/xz/xz-5.2.7.tar.gz"
packages/core2-32-poky-linux/xz: PACKAGES: added "xz-locale-tr"
packages/core2-32-poky-linux/xz/liblzma: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/liblzma: FILELIST: removed "/usr/lib/liblzma.so.5.2.6", added "/usr/lib/liblzma.so.5.2.7"
packages/core2-32-poky-linux/xz/liblzma: PV changed from "5.2.6" to "5.2.7"
Changes to packages/core2-32-poky-linux/xz (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.2.6 to liblzma.so.5.2.7
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.2.6 to liblzma.so.5.2.7
  /usr/lib/liblzma.so.5.2.6 moved to /usr/lib/liblzma.so.5.2.7
packages/core2-32-poky-linux/xz/xz-dbg: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-dbg: FILELIST: removed "/usr/lib/.debug/liblzma.so.5.2.6", added "/usr/lib/.debug/liblzma.so.5.2.7"
packages/core2-32-poky-linux/xz/xz-dbg: PKGSIZE changed from 794692 to 797364 (+0%)
packages/core2-32-poky-linux/xz/xz-dbg: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-dev: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-dev: PKGSIZE changed from 170355 to 171116 (+0%)
packages/core2-32-poky-linux/xz/xz-dev: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-doc: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-doc: PKGSIZE changed from 426290 to 429675 (+1%)
packages/core2-32-poky-linux/xz/xz-doc: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-locale-ca: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-locale-ca: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-locale-cs: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-locale-cs: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-locale-da: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-locale-da: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-locale-de: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-locale-de: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-locale-eo: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-locale-eo: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-locale-es: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-locale-es: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-locale-fi: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-locale-fi: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-locale-fr: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-locale-fr: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-locale-hr: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-locale-hr: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-locale-hu: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-locale-hu: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-locale-it: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-locale-it: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-locale-ko: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-locale-ko: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-locale-pl: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-locale-pl: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-locale-pt-br: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-locale-pt-br: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-locale-pt: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-locale-pt: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-locale-ro: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-locale-ro: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-locale-sr: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-locale-sr: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-locale-sv: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-locale-sv: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-locale-uk: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-locale-uk: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-locale-vi: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-locale-vi: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-locale-zh-cn: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-locale-zh-cn: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-locale-zh-tw: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-locale-zh-tw: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-src: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-src: PKGSIZE changed from 1043424 to 1050080 (+1%)
packages/core2-32-poky-linux/xz/xz-src: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-staticdev: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-staticdev: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz: PKGSIZE changed from 158832 to 158835 (+0%)
packages/core2-32-poky-linux/xz/xz: PV changed from "5.2.6" to "5.2.7"
Changes to packages/x86_64-linux/xz-native (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.2.6 to liblzma.so.5.2.7
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.2.6 to liblzma.so.5.2.7
  /usr/lib/liblzma.so.5.2.6 moved to /usr/lib/liblzma.so.5.2.7

--===============0674758789487482018==--

