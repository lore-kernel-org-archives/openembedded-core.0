Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F80AC43219
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 16:53:52 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web09.350.1664643228089855639
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 09:53:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=SPU4anab;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 010101839477e5f5-79b8c8a2-98ca-4ba2-b609-f3e8abd5f3e3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1664643229;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sETTtlewiKP8Xe4bzp7xLY926qBDd8Mjm8PIgGgGfw8=;
	b=SPU4anabqeMeNnbLsezTC1f0y+Q4z7iK75BX+rmBeE8T6VPPjff8qWKMJpnKUHvw
	78ew47ZgaXE3jCU5A7GZB+thHQpJsKUrL9TfNfN4lGvZeaBh3ZRS5znVnHlpV7U9/4g
	3KRn5vPV6zM/KNLDVY2BEDkHheT0FRSt2Sh5/n08=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1664643229;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sETTtlewiKP8Xe4bzp7xLY926qBDd8Mjm8PIgGgGfw8=;
	b=dNjhez+CrINdFIEMBND0HQzt6G4lvkPgbdapBfLwqCnUclghU7X3HZQRWjtXyvJD
	WZodYOaTNYREvRyD6zCC9DTTGEv4jU6iwtu7s4uh5TpYVuURHclCDZ7Ewk2eqbmzE1G
	aUdd5RN7MK+wFSZBh6osrJRebHBHW8ni51Goag6Y=
Content-Type: multipart/mixed; boundary="===============0420520504950860473=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libksba: upgrading to 1.6.1 SUCCEEDED
Message-ID: 
 <010101839477e5f5-79b8c8a2-98ca-4ba2-b609-f3e8abd5f3e3-000000@us-west-2.amazonses.com>
Date: Sat, 1 Oct 2022 16:53:49 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 16:53:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171340

--===============0420520504950860473==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libksba* to *1.6.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libksba-upgrade-1.6.0-1.6.1.patch
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
--===============0420520504950860473==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libksba/libksba: FILELIST: removed "/usr/lib/libksba.so.8.14.0", added "/usr/lib/libksba.so.8.14.1"
Changes to packages/core2-32-poky-linux/libksba (sysroot):
  /usr/lib/libksba.so.8 changed symlink target from libksba.so.8.14.0 to libksba.so.8.14.1
  /usr/lib/libksba.so changed symlink target from libksba.so.8.14.0 to libksba.so.8.14.1
  /usr/lib/libksba.so.8.14.0 moved to /usr/lib/libksba.so.8.14.1

--===============0420520504950860473==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libksba: PV changed from "1.6.0" to "1.6.1"
packages/core2-32-poky-linux/libksba: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/libksba/libksba-1.6.0.tar.bz2 file://ksba-add-pkgconfig-support.patch" to "https://www.gnupg.org/ftp/gcrypt/libksba/libksba-1.6.1.tar.bz2 file://ksba-add-pkgconfig-support.patch"
packages/core2-32-poky-linux/libksba: PKGV changed from 1.6.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/libksba/libksba-dbg: PV changed from "1.6.0" to "1.6.1"
packages/core2-32-poky-linux/libksba/libksba-dbg: PKGSIZE changed from 703236 to 704220 (+0%)
packages/core2-32-poky-linux/libksba/libksba-dbg: PKGV changed from 1.6.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/libksba/libksba-dbg: FILELIST: removed "/usr/lib/.debug/libksba.so.8.14.0", added "/usr/lib/.debug/libksba.so.8.14.1"
packages/core2-32-poky-linux/libksba/libksba-dev: PV changed from "1.6.0" to "1.6.1"
packages/core2-32-poky-linux/libksba/libksba-dev: PKGSIZE changed from 30113 to 30114 (+0%)
packages/core2-32-poky-linux/libksba/libksba-dev: PKGV changed from 1.6.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/libksba/libksba-doc: PV changed from "1.6.0" to "1.6.1"
packages/core2-32-poky-linux/libksba/libksba-doc: PKGV changed from 1.6.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/libksba/libksba-locale: PV changed from "1.6.0" to "1.6.1"
packages/core2-32-poky-linux/libksba/libksba-locale: PKGV changed from 1.6.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/libksba/libksba-src: PV changed from "1.6.0" to "1.6.1"
packages/core2-32-poky-linux/libksba/libksba-src: PKGSIZE changed from 876599 to 878511 (+0%)
packages/core2-32-poky-linux/libksba/libksba-src: PKGV changed from 1.6.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/libksba/libksba-staticdev: PV changed from "1.6.0" to "1.6.1"
packages/core2-32-poky-linux/libksba/libksba-staticdev: PKGV changed from 1.6.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/libksba/libksba: PV changed from "1.6.0" to "1.6.1"
packages/core2-32-poky-linux/libksba/libksba: PKGV changed from 1.6.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/libksba/libksba: FILELIST: removed "/usr/lib/libksba.so.8.14.0", added "/usr/lib/libksba.so.8.14.1"
Changes to packages/core2-32-poky-linux/libksba (sysroot):
  /usr/lib/libksba.so.8 changed symlink target from libksba.so.8.14.0 to libksba.so.8.14.1
  /usr/lib/libksba.so changed symlink target from libksba.so.8.14.0 to libksba.so.8.14.1
  /usr/lib/libksba.so.8.14.0 moved to /usr/lib/libksba.so.8.14.1

--===============0420520504950860473==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libksba-upgrade-1.6.0-1.6.1.patch"

RnJvbSA1NzJiYzdmMmYwNGQ2NWFlZDNmZTExYjBjYTBlMjU5OTk0Yjk1ODYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBPY3QgMjAyMiAxNjowOTozNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmtzYmE6IHVwZ3JhZGUgMS42LjAgLT4gMS42LjEKCi0tLQogLi4uL2xpYmtzYmEve2xpYmtzYmFf
MS42LjAuYmIgPT4gbGlia3NiYV8xLjYuMS5iYn0gICAgICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvbGlia3NiYS97bGlia3NiYV8xLjYuMC5iYiA9PiBsaWJrc2JhXzEuNi4xLmJi
fSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmtzYmEvbGlia3Ni
YV8xLjYuMC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmtzYmEvbGlia3NiYV8xLjYuMS5i
YgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9s
aWJrc2JhL2xpYmtzYmFfMS42LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xp
YmtzYmEvbGlia3NiYV8xLjYuMS5iYgppbmRleCBmOWU4MzY4MWRkLi5hMjM0YjdkNmRlIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJrc2JhL2xpYmtzYmFfMS42LjAuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlia3NiYS9saWJrc2JhXzEuNi4xLmJiCkBAIC0yNCw3
ICsyNCw3IEBAIFVQU1RSRUFNX0NIRUNLX1VSSSA9ICJodHRwczovL2dudXBnLm9yZy9kb3dubG9h
ZC9pbmRleC5odG1sIgogU1JDX1VSSSA9ICIke0dOVVBHX01JUlJPUn0vJHtCUE59LyR7QlBOfS0k
e1BWfS50YXIuYnoyIFwKICAgICAgICAgICAgZmlsZTovL2tzYmEtYWRkLXBrZ2NvbmZpZy1zdXBw
b3J0LnBhdGNoIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZGFkNjgzZTZmMmQ5MTVkODgwYWE0
YmVkNWNlYTlhMTE1NjkwYjg5MzViNzhhMWJiZTAxNjY5MTg5MzA3YTQ4YiIKK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICI0MDc1MDg2NGMzY2ExMWZhMDgzMzIyNzkzOGRiNjYwMzY2MWY2YzFhM2NjMjY3
NDg1ZTgxZmExNDBjYzZlYTA0IgogCiBkb19jb25maWd1cmU6cHJlcGVuZCAoKSB7CiAJIyBFbHNl
IHRoZXNlIGNvdWxkIGJlIHVzZWQgaW4gcHJlZmVyZW5jZSB0byB0aG9zZSBpbiBhY2xvY2FsLWNv
cHkKLS0gCjIuMzEuMQoK

--===============0420520504950860473==--

