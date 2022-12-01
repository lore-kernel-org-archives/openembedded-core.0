Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A385C4708D
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:30:33 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.46815.1669908626202359137
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:30:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mdbJgH5Y;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010184ce4f8289-eacfc792-db61-4201-be67-712f664b8964-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1669908628;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nX9i1dV04Xg9cctcJITJR0gOHnBQxwvuoNbAQNodVsI=;
	b=mdbJgH5Y9lLAxZRM69eV2x3mZvcjewwgfQgWQqTFNn9RJY3DD2tunFAaH7od/g1K
	zBF8P44AtYMmZl5t4BNyK+2k2JI0JM1Zxxw/0f3e8tMuETLRkDE4MLgYmJo6DhaklUM
	ol8FwJBVl3xrvUpe+hUnG/vQ7kLd9yO+0LMvGp0o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1669908628;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nX9i1dV04Xg9cctcJITJR0gOHnBQxwvuoNbAQNodVsI=;
	b=jgXDZfHQ1XuFoOsfpIHKtWzIMt07BI/JC/mTxjTEPp5IgoMoia2QB4eaL9J+ISC8
	dJ5RFqg2QTT2gtkQz1p41xBMtV37TZbeBgzogqA4oB833sGgBIxQC6FXxBUd0L9XluN
	Qk+WCZkLr++t9+Lk9s6u5hbz0Zl0qY0tRhLatXGY=
Content-Type: multipart/mixed; boundary="===============3611700983240538699=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mpfr: upgrading to 4.1.1 SUCCEEDED
Message-ID: <01010184ce4f8289-eacfc792-db61-4201-be67-712f664b8964-000000@us-west-2.amazonses.com>
Date: Thu, 1 Dec 2022 15:30:28 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174184

--===============3611700983240538699==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mpfr* to *4.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mpfr-upgrade-4.1.0-4.1.1.patch
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
--===============3611700983240538699==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mpfr: PKGV changed from 4.1.0 [default] to 4.1.1 [default]
packages/core2-32-poky-linux/mpfr: SRC_URI changed from "https://www.mpfr.org/mpfr-4.1.0/mpfr-4.1.0.tar.xz" to "https://www.mpfr.org/mpfr-4.1.1/mpfr-4.1.1.tar.xz"
packages/core2-32-poky-linux/mpfr: PV changed from "4.1.0" to "4.1.1"
packages/core2-32-poky-linux/mpfr/mpfr-dbg: PKGV changed from 4.1.0 [default] to 4.1.1 [default]
packages/core2-32-poky-linux/mpfr/mpfr-dbg: FILELIST: removed "/usr/lib/.debug/libmpfr.so.6.1.0", added "/usr/lib/.debug/libmpfr.so.6.1.1"
packages/core2-32-poky-linux/mpfr/mpfr-dbg: PV changed from "4.1.0" to "4.1.1"
packages/core2-32-poky-linux/mpfr/mpfr-dbg: PKGSIZE changed from 2463252 to 2475228 (+0%)
packages/core2-32-poky-linux/mpfr/mpfr-dev: PKGV changed from 4.1.0 [default] to 4.1.1 [default]
packages/core2-32-poky-linux/mpfr/mpfr-dev: PV changed from "4.1.0" to "4.1.1"
packages/core2-32-poky-linux/mpfr/mpfr-dev: PKGSIZE changed from 59596 to 61378 (+3%)
packages/core2-32-poky-linux/mpfr/mpfr-doc: PKGV changed from 4.1.0 [default] to 4.1.1 [default]
packages/core2-32-poky-linux/mpfr/mpfr-doc: PV changed from "4.1.0" to "4.1.1"
packages/core2-32-poky-linux/mpfr/mpfr-doc: PKGSIZE changed from 145656 to 146384 (+0%)
packages/core2-32-poky-linux/mpfr/mpfr-locale: PKGV changed from 4.1.0 [default] to 4.1.1 [default]
packages/core2-32-poky-linux/mpfr/mpfr-locale: PV changed from "4.1.0" to "4.1.1"
packages/core2-32-poky-linux/mpfr/mpfr-src: PKGV changed from 4.1.0 [default] to 4.1.1 [default]
packages/core2-32-poky-linux/mpfr/mpfr-src: PV changed from "4.1.0" to "4.1.1"
packages/core2-32-poky-linux/mpfr/mpfr-src: PKGSIZE changed from 2043445 to 2049871 (+0%)
packages/core2-32-poky-linux/mpfr/mpfr-staticdev: PKGV changed from 4.1.0 [default] to 4.1.1 [default]
packages/core2-32-poky-linux/mpfr/mpfr-staticdev: PV changed from "4.1.0" to "4.1.1"
packages/core2-32-poky-linux/mpfr/mpfr: PKGV changed from 4.1.0 [default] to 4.1.1 [default]
packages/core2-32-poky-linux/mpfr/mpfr: FILELIST: removed "/usr/lib/libmpfr.so.6.1.0", added "/usr/lib/libmpfr.so.6.1.1"
packages/core2-32-poky-linux/mpfr/mpfr: PV changed from "4.1.0" to "4.1.1"
Changes to packages/core2-32-poky-linux/mpfr (sysroot):
  /usr/lib/libmpfr.so.6 changed symlink target from libmpfr.so.6.1.0 to libmpfr.so.6.1.1
  /usr/lib/libmpfr.so changed symlink target from libmpfr.so.6.1.0 to libmpfr.so.6.1.1
  /usr/lib/libmpfr.so.6.1.0 moved to /usr/lib/libmpfr.so.6.1.1
Changes to packages/x86_64-linux/mpfr-native (sysroot):
  /usr/lib/libmpfr.so.6 changed symlink target from libmpfr.so.6.1.0 to libmpfr.so.6.1.1
  /usr/lib/libmpfr.so changed symlink target from libmpfr.so.6.1.0 to libmpfr.so.6.1.1
  /usr/lib/libmpfr.so.6.1.0 moved to /usr/lib/libmpfr.so.6.1.1

--===============3611700983240538699==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/mpfr/mpfr: FILELIST: removed "/usr/lib/libmpfr.so.6.1.0", added "/usr/lib/libmpfr.so.6.1.1"
Changes to packages/core2-32-poky-linux/mpfr (sysroot):
  /usr/lib/libmpfr.so.6 changed symlink target from libmpfr.so.6.1.0 to libmpfr.so.6.1.1
  /usr/lib/libmpfr.so changed symlink target from libmpfr.so.6.1.0 to libmpfr.so.6.1.1
  /usr/lib/libmpfr.so.6.1.0 moved to /usr/lib/libmpfr.so.6.1.1
Changes to packages/x86_64-linux/mpfr-native (sysroot):
  /usr/lib/libmpfr.so.6 changed symlink target from libmpfr.so.6.1.0 to libmpfr.so.6.1.1
  /usr/lib/libmpfr.so changed symlink target from libmpfr.so.6.1.0 to libmpfr.so.6.1.1
  /usr/lib/libmpfr.so.6.1.0 moved to /usr/lib/libmpfr.so.6.1.1

--===============3611700983240538699==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mpfr-upgrade-4.1.0-4.1.1.patch"

RnJvbSBjYjdhNGNkOTJmZTNlYjkwYTYwOWI1MDIyODVmOWZmODc2MGEzMmZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBEZWMgMjAyMiAxNDo1MDoyNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1w
ZnI6IHVwZ3JhZGUgNC4xLjAgLT4gNC4xLjEKCi0tLQogbWV0YS9yZWNpcGVzLXN1cHBvcnQvbXBm
ci97bXBmcl80LjEuMC5iYiA9PiBtcGZyXzQuMS4xLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBw
b3J0L21wZnIve21wZnJfNC4xLjAuYmIgPT4gbXBmcl80LjEuMS5iYn0gKDkxJSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9tcGZyL21wZnJfNC4xLjAuYmIgYi9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9tcGZyL21wZnJfNC4xLjEuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbXBmci9tcGZyXzQuMS4wLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtc3VwcG9ydC9tcGZyL21wZnJfNC4xLjEuYmIKaW5kZXggMjEyMWRhZDU3Yy4u
ZjUzMWE4ODk2MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbXBmci9tcGZyXzQu
MS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L21wZnIvbXBmcl80LjEuMS5iYgpAQCAt
MTIsNyArMTIsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT0xZWJi
ZDNlMzQyMzdhZjI2ZGE1ZGMwOGE0ZTQ0MDQ2NCBcCiBERVBFTkRTID0gImdtcCBhdXRvY29uZi1h
cmNoaXZlIgogCiBTUkNfVVJJID0gImh0dHBzOi8vd3d3Lm1wZnIub3JnL21wZnItJHtQVn0vbXBm
ci0ke1BWfS50YXIueHoiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMGM5OGEzZjE3MzJmZjZjYTRl
YTY5MDU1MjA3OWRhOWM1OTc4NzJkMzBlOTZlYzI4NDE0ZWUyM2M5NTU1OGE3ZiIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICJmZmQxOTViZDU2N2RiYWZmYzNiOThiMjNmZDAwYWFkMDUzNzY4MGM5ODk2
MTcxZTQ0ZmUzZmY3OWUyOGFjMzNkIgogCiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cDovL3d3
dy5tcGZyLm9yZy9tcGZyLWN1cnJlbnQvIgogCi0tIAoyLjMxLjEKCg==

--===============3611700983240538699==--

