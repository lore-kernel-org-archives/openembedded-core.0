Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01FF2C32772
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 18:57:03 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web09.6460.1660589819622344365
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 11:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=HeLM9f1v;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 01010182a2ddc6a1-40a56072-ffeb-4572-a614-11f1065bb02a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1660589819;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9hLsRU+/RgDvIciVAwH6zs3Jcd+N27ZLPtcIEVcQdoQ=;
	b=HeLM9f1vT60eT6oVp1J9nwk0lGRy27oWm+N32MAvKTYtNjNfiwlghrGxH/c++VYV
	FDWb6f/Wo6+xakQoctvKxRI4BU0dhzlzjFg/YRzhUfahItK0gMzRgjIPwRUvkrMhJJm
	Ggi+4cdNTj6ChYZapY/M34nbhv90qru3xGdA+Feg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1660589819;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9hLsRU+/RgDvIciVAwH6zs3Jcd+N27ZLPtcIEVcQdoQ=;
	b=MZQyW1xmQrydGbi7cp8tCS9t6fVlJoSCpJWqSWYBEKBodBszcJKGaK7wR/DbkYuz
	c23Vztxjm7W9HSJU8g8acW3N0/IzG9o/LMAjJ3hBvXoGNiWRNOIyCt9OYN49ryeE848
	8JLOjfYYX3YKNZuXwad0/nP+0aj6VcU8nyx3H6E4=
Content-Type: multipart/mixed; boundary="===============7695658883632914313=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pkgconf: upgrading to 1.9.2 SUCCEEDED
Message-ID: 
 <01010182a2ddc6a1-40a56072-ffeb-4572-a614-11f1065bb02a-000000@us-west-2.amazonses.com>
Date: Mon, 15 Aug 2022 18:56:59 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 18:57:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169364

--===============7695658883632914313==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *pkgconf* to *1.9.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pkgconf-upgrade-1.8.0-1.9.2.patch
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
--===============7695658883632914313==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pkgconf-upgrade-1.8.0-1.9.2.patch"

RnJvbSAxYTBlNjdiNGRhNmYzMTZjZTI3NDRmMWQwZTRkNjIyNjE4MzcxYzRlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXVnIDIwMjIgMDc6NTc6MTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
a2djb25mOiB1cGdyYWRlIDEuOC4wIC0+IDEuOS4yCgotLS0KIC4uLi9wa2djb25mL3twa2djb25m
XzEuOC4wLmJiID0+IHBrZ2NvbmZfMS45LjIuYmJ9ICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9wa2djb25mL3twa2djb25mXzEuOC4wLmJiID0+IHBrZ2NvbmZfMS45LjIu
YmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BrZ2NvbmYvcGtn
Y29uZl8xLjguMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wa2djb25mL3BrZ2NvbmZfMS45
LjIuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3BrZ2NvbmYvcGtnY29uZl8xLjguMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3BrZ2NvbmYvcGtnY29uZl8xLjkuMi5iYgppbmRleCA4ODdlMTVlMjhjLi41NzY3MTBiOGZj
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGtnY29uZi9wa2djb25mXzEuOC4w
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wa2djb25mL3BrZ2NvbmZfMS45LjIuYmIK
QEAgLTIwLDcgKzIwLDcgQEAgU1JDX1VSSSA9ICJcCiAgICAgZmlsZTovL3BrZy1jb25maWctbmF0
aXZlLmluIFwKICAgICBmaWxlOi8vcGtnLWNvbmZpZy1lc2RrLmluIFwKICIKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICJlZjljN2U2MTgyMmI3Y2I4MzU2ZTZlOWUxZGNhNThkOTU1NmYzMjAwZDc4YWNh
YjM1ZTQzNDdlOWQ0YzJiYmFmIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImRiNmJmNTQyNmUwZTlm
YzEwNzA0MmNjODVmYzYyYjFmMzkxZjFkN2FmNDZjNGEzYzM5YjdmNWI1MjMxZGZhMDkiCiAKIGlu
aGVyaXQgYXV0b3Rvb2xzCiAKLS0gCjIuMzEuMQoK

--===============7695658883632914313==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/pkgconf: PKGV changed from 1.8.0 [default] to 1.9.2 [default]
packages/core2-32-poky-linux/pkgconf: SRC_URI changed from "https://distfiles.dereferenced.org/pkgconf/pkgconf-1.8.0.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in" to "https://distfiles.dereferenced.org/pkgconf/pkgconf-1.9.2.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in"
packages/core2-32-poky-linux/pkgconf: PV changed from "1.8.0" to "1.9.2"
packages/core2-32-poky-linux/pkgconf/pkgconf-dbg: FILELIST: removed "/usr/lib/.debug/libpkgconf.so.3.0.0", added "/usr/lib/.debug/libpkgconf.so.4.0.0"
packages/core2-32-poky-linux/pkgconf/pkgconf-dbg: PKGV changed from 1.8.0 [default] to 1.9.2 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf-dbg: PKGSIZE changed from 198736 to 215412 (+8%)
packages/core2-32-poky-linux/pkgconf/pkgconf-dbg: PV changed from "1.8.0" to "1.9.2"
packages/core2-32-poky-linux/pkgconf/pkgconf-dev: PKGV changed from 1.8.0 [default] to 1.9.2 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf-dev: PKGSIZE changed from 22852 to 23802 (+4%)
packages/core2-32-poky-linux/pkgconf/pkgconf-dev: PV changed from "1.8.0" to "1.9.2"
packages/core2-32-poky-linux/pkgconf/pkgconf-doc: PKGV changed from 1.8.0 [default] to 1.9.2 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf-doc: PKGSIZE changed from 28197 to 28806 (+2%)
packages/core2-32-poky-linux/pkgconf/pkgconf-doc: PV changed from "1.8.0" to "1.9.2"
packages/core2-32-poky-linux/pkgconf/pkgconf-locale: PKGV changed from 1.8.0 [default] to 1.9.2 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf-locale: PV changed from "1.8.0" to "1.9.2"
packages/core2-32-poky-linux/pkgconf/pkgconf-src: PKGV changed from 1.8.0 [default] to 1.9.2 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf-src: PKGSIZE changed from 240323 to 255989 (+7%)
packages/core2-32-poky-linux/pkgconf/pkgconf-src: PV changed from "1.8.0" to "1.9.2"
packages/core2-32-poky-linux/pkgconf/pkgconf-staticdev: PKGV changed from 1.8.0 [default] to 1.9.2 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf-staticdev: PV changed from "1.8.0" to "1.9.2"
packages/core2-32-poky-linux/pkgconf/pkgconf: FILELIST: removed "/usr/lib/libpkgconf.so.3.0.0 /usr/lib/libpkgconf.so.3", added "/usr/lib/libpkgconf.so.4 /usr/lib/libpkgconf.so.4.0.0"
packages/core2-32-poky-linux/pkgconf/pkgconf: PKGV changed from 1.8.0 [default] to 1.9.2 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf: PKGSIZE changed from 124324 to 128597 (+3%)
packages/core2-32-poky-linux/pkgconf/pkgconf: PV changed from "1.8.0" to "1.9.2"
Changes to packages/core2-32-poky-linux/pkgconf (sysroot):
  /usr/lib/libpkgconf.so changed symlink target from libpkgconf.so.3.0.0 to libpkgconf.so.4.0.0
  /usr/lib/libpkgconf.so.3.0.0 moved to /usr/lib/libpkgconf.so.4.0.0
  /usr/lib/libpkgconf.so.3 moved to /usr/lib/libpkgconf.so.4

--===============7695658883632914313==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/pkgconf/pkgconf: FILELIST: removed "/usr/lib/libpkgconf.so.3 /usr/lib/libpkgconf.so.3.0.0", added "/usr/lib/libpkgconf.so.4.0.0 /usr/lib/libpkgconf.so.4"
Changes to packages/core2-32-poky-linux/pkgconf (sysroot):
  /usr/lib/libpkgconf.so changed symlink target from libpkgconf.so.3.0.0 to libpkgconf.so.4.0.0
  /usr/lib/libpkgconf.so.3.0.0 moved to /usr/lib/libpkgconf.so.4.0.0
  /usr/lib/libpkgconf.so.3 moved to /usr/lib/libpkgconf.so.4

--===============7695658883632914313==--

