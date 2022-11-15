Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AF35C6371B
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 13:05:46 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web09.5198.1668517536655909183
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 05:05:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=m2T8fyNW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101847b65211b-f5da0fed-6e56-4acf-aaa2-da63623928d9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1668517536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=k72QuozDVEdYp7k+T59tHOjBuieOKRaRwYl/repiZyo=;
	b=m2T8fyNWTQgJdLqwsWmWuJetwzGi91jm7vEifs9Yrm8tZbaI27uzY3JCivAjMThB
	vUWU7Ezl6INRwPW5GZX0nqvdPei6kqzU19S1xaSOTDc+ztUKAt6FMi8IRjE9gVT7VQu
	4uJwXXoEvIjs6z6HiT8wyEvu/XuEOc4BiopH+wTo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1668517536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=k72QuozDVEdYp7k+T59tHOjBuieOKRaRwYl/repiZyo=;
	b=URiUQhyDI3tNSjADuSZhNBQLN4O4Lay8XizW4ETpsuyreJBuv5Sgeui5bBBM0oGF
	/0NkcLmu9bpjjFIAcdlppQijm9eI72WTRI90DH0n923ze+nhch85bH3RO9Pv796GKoi
	l6QeDsazo0RD8CNI/22eAKgSJ6zViiBWY6qsg3Nk=
Content-Type: multipart/mixed; boundary="===============8495659469730001657=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] xz: upgrading to 5.2.8 SUCCEEDED
Message-ID: <010101847b65211b-f5da0fed-6e56-4acf-aaa2-da63623928d9-000000@us-west-2.amazonses.com>
Date: Tue, 15 Nov 2022 13:05:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 13:05:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173312

--===============8495659469730001657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xz* to *5.2.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xz-upgrade-5.2.7-5.2.8.patch
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
--===============8495659469730001657==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-xz-upgrade-5.2.7-5.2.8.patch"

RnJvbSAxMjIyYzM1ZTQ5NWZlNWMxMDExZGEyYTA0YjczYWU0NzZjODcyZWViIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgTm92IDIwMjIgMDk6MTM6MjMgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
ejogdXBncmFkZSA1LjIuNyAtPiA1LjIuOAoKLS0tCiBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQveHov
e3h6XzUuMi43LmJiID0+IHh6XzUuMi44LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC94
ei97eHpfNS4yLjcuYmIgPT4geHpfNS4yLjguYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL3h6L3h6XzUuMi43LmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3h6
L3h6XzUuMi44LmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1leHRlbmRlZC94ei94el81LjIuNy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L3h6L3h6XzUuMi44LmJiCmluZGV4IDg4ZWM4NDdjMTUuLjUyMmQ1MGRiY2UgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1leHRlbmRlZC94ei94el81LjIuNy5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQveHoveHpfNS4yLjguYmIKQEAgLTI1LDcgKzI1LDcgQEAgTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vQ09QWUlORzttZDU9OTdkNTU0YTMyODgxZmVlMGFhMjgzZDk2ZTQ3Y2IyNGEg
XAogICAgICAgICAgICAgICAgICAgICAiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly90dWthYW5pLm9y
Zy94ei94ei0ke1BWfS50YXIuZ3oiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDYzMjdjMmRkYzgx
ZTEyNmE2ZDlhNzhiMGJlNTAxNGI5NzZhMmMwODMyZjQ5MmRjZmM0NzU1ZDdmYWNmNmQzMyIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICJlYzVjZGE5ZjBiOTEzMzZhYjFiODgxZDNkMTQ0ZTgyMDNmY2Nh
NjA0ZTYwN2NhY2E4YWU2NzhkZGJjMjkyMDdkIgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAieHot
KD9QPHB2ZXI+XGQrKFwuXGQrKSspXC50YXIiCiAKIENBQ0hFRF9DT05GSUdVUkVWQVJTICs9ICJn
bF9jdl9wb3NpeF9zaGVsbD0vYmluL3NoIgotLSAKMi4zMS4xCgo=

--===============8495659469730001657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/xz/liblzma: FILELIST: removed "/usr/lib/liblzma.so.5.2.7", added "/usr/lib/liblzma.so.5.2.8"
Changes to packages/core2-32-poky-linux/xz (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.2.7 to liblzma.so.5.2.8
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.2.7 to liblzma.so.5.2.8
  /usr/lib/liblzma.so.5.2.7 moved to /usr/lib/liblzma.so.5.2.8
Changes to packages/x86_64-linux/xz-native (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.2.7 to liblzma.so.5.2.8
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.2.7 to liblzma.so.5.2.8
  /usr/lib/liblzma.so.5.2.7 moved to /usr/lib/liblzma.so.5.2.8

--===============8495659469730001657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/xz: PKGV changed from 5.2.7 [default] to 5.2.8 [default]
packages/core2-32-poky-linux/xz: SRC_URI changed from "https://tukaani.org/xz/xz-5.2.7.tar.gz" to "https://tukaani.org/xz/xz-5.2.8.tar.gz"
packages/core2-32-poky-linux/xz: PV changed from "5.2.7" to "5.2.8"
packages/core2-32-poky-linux/xz/liblzma: PKGV changed from 5.2.7 [default] to 5.2.8 [default]
packages/core2-32-poky-linux/xz/liblzma: PV changed from "5.2.7" to "5.2.8"
packages/core2-32-poky-linux/xz/liblzma: FILELIST: removed "/usr/lib/liblzma.so.5.2.7", added "/usr/lib/liblzma.so.5.2.8"
Changes to packages/core2-32-poky-linux/xz (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.2.7 to liblzma.so.5.2.8
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.2.7 to liblzma.so.5.2.8
  /usr/lib/liblzma.so.5.2.7 moved to /usr/lib/liblzma.so.5.2.8
packages/core2-32-poky-linux/xz/xz-dbg: PKGSIZE changed from 797364 to 797476 (+0%)
packages/core2-32-poky-linux/xz/xz-dbg: PKGV changed from 5.2.7 [default] to 5.2.8 [default]
packages/core2-32-poky-linux/xz/xz-dbg: PV changed from "5.2.7" to "5.2.8"
packages/core2-32-poky-linux/xz/xz-dbg: FILELIST: removed "/usr/lib/.debug/liblzma.so.5.2.7", added "/usr/lib/.debug/liblzma.so.5.2.8"
packages/core2-32-poky-linux/xz/xz-dev: PKGSIZE changed from 171116 to 171799 (+0%)
packages/core2-32-poky-linux/xz/xz-dev: PKGV changed from 5.2.7 [default] to 5.2.8 [default]
packages/core2-32-poky-linux/xz/xz-dev: PV changed from "5.2.7" to "5.2.8"
packages/core2-32-poky-linux/xz/xz-doc: PKGSIZE changed from 429675 to 429530 (-0%)
packages/core2-32-poky-linux/xz/xz-doc: PKGV changed from 5.2.7 [default] to 5.2.8 [default]
packages/core2-32-poky-linux/xz/xz-doc: PV changed from "5.2.7" to "5.2.8"
packages/core2-32-poky-linux/xz/xz-locale-ca: PKGV changed from 5.2.7 [default] to 5.2.8 [default]
packages/core2-32-poky-linux/xz/xz-locale-ca: PV changed from "5.2.7" to "5.2.8"
packages/core2-32-poky-linux/xz/xz-locale-cs: PKGV changed from 5.2.7 [default] to 5.2.8 [default]
packages/core2-32-poky-linux/xz/xz-locale-cs: PV changed from "5.2.7" to "5.2.8"
packages/core2-32-poky-linux/xz/xz-locale-da: PKGV changed from 5.2.7 [default] to 5.2.8 [default]
packages/core2-32-poky-linux/xz/xz-locale-da: PV changed from "5.2.7" to "5.2.8"
packages/core2-32-poky-linux/xz/xz-locale-de: PKGV changed from 5.2.7 [default] to 5.2.8 [default]
packages/core2-32-poky-linux/xz/xz-locale-de: PV changed from "5.2.7" to "5.2.8"
packages/core2-32-poky-linux/xz/xz-locale-eo: PKGV changed from 5.2.7 [default] to 5.2.8 [default]
packages/core2-32-poky-linux/xz/xz-locale-eo: PV changed from "5.2.7" to "5.2.8"
packages/core2-32-poky-linux/xz/xz-locale-es: PKGV changed from 5.2.7 [default] to 5.2.8 [default]
packages/core2-32-poky-linux/xz/xz-locale-es: PV changed from "5.2.7" to "5.2.8"
packages/core2-32-poky-linux/xz/xz-locale-fi: PKGV changed from 5.2.7 [default] to 5.2.8 [default]
packages/core2-32-poky-linux/xz/xz-locale-fi: PV changed from "5.2.7" to "5.2.8"
packages/core2-32-poky-linux/xz/xz-locale-fr: PKGV changed from 5.2.7 [default] to 5.2.8 [default]
packages/core2-32-poky-linux/xz/xz-locale-fr: PV changed from "5.2.7" to "5.2.8"
packages/core2-32-poky-linux/xz/xz-locale-hr: PKGSIZE changed from 26302 to 26285 (-0%)
packages/core2-32-poky-linux/xz/xz-locale-hr: PKGV changed from 5.2.7 [default] to 5.2.8 [default]
packages/core2-32-poky-linux/xz/xz-locale-hr: PV changed from "5.2.7" to "5.2.8"
packages/core2-32-poky-linux/xz/xz-locale-hu: PKGV changed from 5.2.7 [default] to 5.2.8 [default]
packages/core2-32-poky-linux/xz/xz-locale-hu: PV changed from "5.2.7" to "5.2.8"
packages/core2-32-poky-linux/xz/xz-locale-it: PKGV changed from 5.2.7 [default] to 5.2.8 [default]
packages/core2-32-poky-linux/xz/xz-locale-it: PV changed from "5.2.7" to "5.2.8"
packages/core2-32-poky-linux/xz/xz-locale-ko: PKGV changed from 5.2.7 [default] to 5.2.8 [default]
packages/core2-32-poky-linux/xz/xz-locale-ko: PV changed from "5.2.7" to "5.2.8"
packages/core2-32-poky-linux/xz/xz-locale-pl: PKGV changed from 5.2.7 [default] to 5.2.8 [default]
packages/core2-32-poky-linux/xz/xz-locale-pl: PV changed from "5.2.7" to "5.2.8"
packages/core2-32-poky-linux/xz/xz-locale-pt-br: PKGV changed from 5.2.7 [default] to 5.2.8 [default]
packages/core2-32-poky-linux/xz/xz-locale-pt-br: PV changed from "5.2.7" to "5.2.8"
packages/core2-32-poky-linux/xz/xz-locale-pt: PKGV changed from 5.2.7 [default] to 5.2.8 [default]
packages/core2-32-poky-linux/xz/xz-locale-pt: PV changed from "5.2.7" to "5.2.8"
packages/core2-32-poky-linux/xz/xz-locale-ro: PKGV changed from 5.2.7 [default] to 5.2.8 [default]
packages/core2-32-poky-linux/xz/xz-locale-ro: PV changed from "5.2.7" to "5.2.8"
packages/core2-32-poky-linux/xz/xz-locale-sr: PKGV changed from 5.2.7 [default] to 5.2.8 [default]
packages/core2-32-poky-linux/xz/xz-locale-sr: PV changed from "5.2.7" to "5.2.8"
packages/core2-32-poky-linux/xz/xz-locale-sv: PKGV changed from 5.2.7 [default] to 5.2.8 [default]
packages/core2-32-poky-linux/xz/xz-locale-sv: PV changed from "5.2.7" to "5.2.8"
packages/core2-32-poky-linux/xz/xz-locale-tr: PKGV changed from 5.2.7 [default] to 5.2.8 [default]
packages/core2-32-poky-linux/xz/xz-locale-tr: PV changed from "5.2.7" to "5.2.8"
packages/core2-32-poky-linux/xz/xz-locale-uk: PKGV changed from 5.2.7 [default] to 5.2.8 [default]
packages/core2-32-poky-linux/xz/xz-locale-uk: PV changed from "5.2.7" to "5.2.8"
packages/core2-32-poky-linux/xz/xz-locale-vi: PKGV changed from 5.2.7 [default] to 5.2.8 [default]
packages/core2-32-poky-linux/xz/xz-locale-vi: PV changed from "5.2.7" to "5.2.8"
packages/core2-32-poky-linux/xz/xz-locale-zh-cn: PKGV changed from 5.2.7 [default] to 5.2.8 [default]
packages/core2-32-poky-linux/xz/xz-locale-zh-cn: PV changed from "5.2.7" to "5.2.8"
packages/core2-32-poky-linux/xz/xz-locale-zh-tw: PKGV changed from 5.2.7 [default] to 5.2.8 [default]
packages/core2-32-poky-linux/xz/xz-locale-zh-tw: PV changed from "5.2.7" to "5.2.8"
packages/core2-32-poky-linux/xz/xz-src: PKGSIZE changed from 1050080 to 1052879 (+0%)
packages/core2-32-poky-linux/xz/xz-src: PKGV changed from 5.2.7 [default] to 5.2.8 [default]
packages/core2-32-poky-linux/xz/xz-src: PV changed from "5.2.7" to "5.2.8"
packages/core2-32-poky-linux/xz/xz-staticdev: PKGV changed from 5.2.7 [default] to 5.2.8 [default]
packages/core2-32-poky-linux/xz/xz-staticdev: PV changed from "5.2.7" to "5.2.8"
packages/core2-32-poky-linux/xz/xz: PKGSIZE changed from 158835 to 158961 (+0%)
packages/core2-32-poky-linux/xz/xz: PKGV changed from 5.2.7 [default] to 5.2.8 [default]
packages/core2-32-poky-linux/xz/xz: PV changed from "5.2.7" to "5.2.8"
Changes to packages/x86_64-linux/xz-native (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.2.7 to liblzma.so.5.2.8
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.2.7 to liblzma.so.5.2.8
  /usr/lib/liblzma.so.5.2.7 moved to /usr/lib/liblzma.so.5.2.8

--===============8495659469730001657==--

