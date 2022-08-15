Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EF41C2BBC5
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 18:57:02 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web09.6464.1660589821364208004
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 11:57:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=WJDpxFsd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 01010182a2ddcaf7-9479e14c-6072-4417-8026-9ab3140ff00b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1660589820;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HBz2sbi10dHIIsd6ofSjAHqo/i/5QoJPZJQ3e/zcaIk=;
	b=WJDpxFsdLp2UbT6UM2JCsWlFigt1qMtT97d1MFxJTEm1jJ7PGLVMO2FLXe7CLdv8
	14W/xTUMJuIWzKsh/dKPimKjUy49gtYXOW+/Eed5G7th6TcziG4iadKeSynBnSw3E16
	K55DsXFNJ7agRMECH5RV5AIlVd5sGs8FscWOYUc4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1660589820;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HBz2sbi10dHIIsd6ofSjAHqo/i/5QoJPZJQ3e/zcaIk=;
	b=Vn+f3aPTfCc9TF5IqI4bpxRpbItUbQ4oPxr5SO2c6v+FfjO3DhTuKv44E4/KraKE
	aWqfqKR2y5/J//3xpPs6Vorkq8+6kMjA9hHRp4kUeyf3mPbkdID1lcBWPYDYZZSZGnS
	QTWfR8HnkujTl22zWLXgCTm4BF+ounGb/hfol78g=
Content-Type: multipart/mixed; boundary="===============4552543468406927702=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] msmtp: upgrading to 1.8.22 SUCCEEDED
Message-ID: 
 <01010182a2ddcaf7-9479e14c-6072-4417-8026-9ab3140ff00b-000000@us-west-2.amazonses.com>
Date: Mon, 15 Aug 2022 18:57:00 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 18:57:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169384

--===============4552543468406927702==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *msmtp* to *1.8.22* has Succeeded.

Next steps:
    - apply the patch: git am 0001-msmtp-upgrade-1.8.20-1.8.22.patch
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
--===============4552543468406927702==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/msmtp: SRC_URI changed from "https://marlam.de/msmtp/releases/msmtp-1.8.20.tar.xz" to "https://marlam.de/msmtp/releases/msmtp-1.8.22.tar.xz"
packages/core2-32-poky-linux/msmtp: PV changed from "1.8.20" to "1.8.22"
packages/core2-32-poky-linux/msmtp: PKGV changed from 1.8.20 [default] to 1.8.22 [default]
packages/core2-32-poky-linux/msmtp/msmtp-dbg: PV changed from "1.8.20" to "1.8.22"
packages/core2-32-poky-linux/msmtp/msmtp-dbg: PKGSIZE changed from 330524 to 342616 (+4%)
packages/core2-32-poky-linux/msmtp/msmtp-dbg: PKGV changed from 1.8.20 [default] to 1.8.22 [default]
packages/core2-32-poky-linux/msmtp/msmtp-dev: PV changed from "1.8.20" to "1.8.22"
packages/core2-32-poky-linux/msmtp/msmtp-dev: PKGV changed from 1.8.20 [default] to 1.8.22 [default]
packages/core2-32-poky-linux/msmtp/msmtp-doc: PV changed from "1.8.20" to "1.8.22"
packages/core2-32-poky-linux/msmtp/msmtp-doc: PKGSIZE changed from 112117 to 114240 (+2%)
packages/core2-32-poky-linux/msmtp/msmtp-doc: PKGV changed from 1.8.20 [default] to 1.8.22 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-de: PV changed from "1.8.20" to "1.8.22"
packages/core2-32-poky-linux/msmtp/msmtp-locale-de: PKGSIZE changed from 35746 to 35576 (-0%)
packages/core2-32-poky-linux/msmtp/msmtp-locale-de: PKGV changed from 1.8.20 [default] to 1.8.22 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-eo: PV changed from "1.8.20" to "1.8.22"
packages/core2-32-poky-linux/msmtp/msmtp-locale-eo: PKGSIZE changed from 34818 to 34678 (-0%)
packages/core2-32-poky-linux/msmtp/msmtp-locale-eo: PKGV changed from 1.8.20 [default] to 1.8.22 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-fr: PV changed from "1.8.20" to "1.8.22"
packages/core2-32-poky-linux/msmtp/msmtp-locale-fr: PKGSIZE changed from 37557 to 37402 (-0%)
packages/core2-32-poky-linux/msmtp/msmtp-locale-fr: PKGV changed from 1.8.20 [default] to 1.8.22 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-pt-br: PV changed from "1.8.20" to "1.8.22"
packages/core2-32-poky-linux/msmtp/msmtp-locale-pt-br: PKGSIZE changed from 36413 to 36253 (-0%)
packages/core2-32-poky-linux/msmtp/msmtp-locale-pt-br: PKGV changed from 1.8.20 [default] to 1.8.22 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-sr: PV changed from "1.8.20" to "1.8.22"
packages/core2-32-poky-linux/msmtp/msmtp-locale-sr: PKGSIZE changed from 45425 to 45241 (-0%)
packages/core2-32-poky-linux/msmtp/msmtp-locale-sr: PKGV changed from 1.8.20 [default] to 1.8.22 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-ta: PV changed from "1.8.20" to "1.8.22"
packages/core2-32-poky-linux/msmtp/msmtp-locale-ta: PKGSIZE changed from 12713 to 12446 (-2%)
packages/core2-32-poky-linux/msmtp/msmtp-locale-ta: PKGV changed from 1.8.20 [default] to 1.8.22 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-uk: PV changed from "1.8.20" to "1.8.22"
packages/core2-32-poky-linux/msmtp/msmtp-locale-uk: PKGSIZE changed from 47311 to 47097 (-0%)
packages/core2-32-poky-linux/msmtp/msmtp-locale-uk: PKGV changed from 1.8.20 [default] to 1.8.22 [default]
packages/core2-32-poky-linux/msmtp/msmtp-src: FILELIST: removed "/usr/src/debug/msmtp/1.8.20-r0/msmtp-1.8.20/src/smtp.h /usr/src/debug/msmtp/1.8.20-r0/msmtp-1.8.20/src/aliases.c /usr/src/debug/msmtp/1.8.20-r0/msmtp-1.8.20/src/conf.h /usr/src/debug/msmtp/1.8.20-r0/msmtp-1.8.20/src/readbuf.c /usr/src/debug/msmtp/1.8.20-r0/msmtp-1.8.20/src/base64.h /usr/src/debug/msmtp/1.8.20-r0/msmtp-1.8.20/src/mtls.c /usr/src/debug/msmtp/1.8.20-r0/msmtp-1.8.20/src/md5.h /usr/src/debug/msmtp/1.8.20-r0/msmtp-1.8.20/src/stream.c /usr/src/debug/msmtp/1.8.20-r0/msmtp-1.8.20/src/tools.h /usr/src/debug/msmtp/1.8.20-r0/msmtp-1.8.20/src/conf.c /usr/src/debug/msmtp/1.8.20-r0/msmtp-1.8.20/src/list.h /usr/src/debug/msmtp/1.8.20-r0/msmtp-1.8.20/src/netrc.c /usr/src/debug/msmtp/1.8.20-r0/msmtp-1.8.20/src/password.h /usr/src/debug/msmtp/1.8.20-r0/msmtp-1.8.20/src/stream.h /usr/src/debug/msmtp/1.8.20-r0/msmtp-1.8.20/src/tools.c /usr/src/debug/msmtp/1.8.20-r0/msmtp-1.8.20/src/readbuf.h /usr/src/debug/msmtp/1.8.20-r0/m
 smtp-1.8.20/src/msmtp.c /usr/src/debug/msmtp/1.8.20-r0/msmtp-1.8.20/src/smtp.c /usr/src/debug/msmtp/1.8.20-r0/msmtp-1.8.20/src/md5-apps.h /usr/src/debug/msmtp/1.8.20-r0/msmtp-1.8.20/src/md5.c /usr/src/debug/msmtp/1.8.20-r0/msmtp-1.8.20/src/netrc.h /usr/src/debug/msmtp/1.8.20-r0/msmtp-1.8.20/src/net.c /usr/src/debug/msmtp/1.8.20-r0/msmtp-1.8.20/src/mtls.h /usr/src/debug/msmtp/1.8.20-r0/msmtp-1.8.20/src/xalloc.c /usr/src/debug/msmtp/1.8.20-r0/msmtp-1.8.20/src/net.h /usr/src/debug/msmtp/1.8.20-r0/msmtp-1.8.20/src/md5-apps.c /usr/src/debug/msmtp/1.8.20-r0/msmtp-1.8.20/src/mtls-gnutls.c /usr/src/debug/msmtp/1.8.20-r0/msmtp-1.8.20/src/base64.c /usr/src/debug/msmtp/1.8.20-r0/msmtp-1.8.20/src/aliases.h /usr/src/debug/msmtp/1.8.20-r0/msmtp-1.8.20/src/msmtpd.c /usr/src/debug/msmtp/1.8.20-r0/msmtp-1.8.20/src/xalloc.h /usr/src/debug/msmtp/1.8.20-r0/msmtp-1.8.20/src/password.c /usr/src/debug/msmtp/1.8.20-r0/msmtp-1.8.20/src/list.c", added "/usr/src/debug/msmtp/1.8.22-r0/msmtp-1.8.22/src/stream.c
  /usr/src/debug/msmtp/1.8.22-r0/msmtp-1.8.22/src/mtls-gnutls.c /usr/src/debug/msmtp/1.8.22-r0/msmtp-1.8.22/src/list.c /usr/src/debug/msmtp/1.8.22-r0/msmtp-1.8.22/src/base64.h /usr/src/debug/msmtp/1.8.22-r0/msmtp-1.8.22/src/md5-apps.h /usr/src/debug/msmtp/1.8.22-r0/msmtp-1.8.22/src/mtls.c /usr/src/debug/msmtp/1.8.22-r0/msmtp-1.8.22/src/readbuf.c /usr/src/debug/msmtp/1.8.22-r0/msmtp-1.8.22/src/base64.c /usr/src/debug/msmtp/1.8.22-r0/msmtp-1.8.22/src/xalloc.c /usr/src/debug/msmtp/1.8.22-r0/msmtp-1.8.22/src/md5.h /usr/src/debug/msmtp/1.8.22-r0/msmtp-1.8.22/src/tools.c /usr/src/debug/msmtp/1.8.22-r0/msmtp-1.8.22/src/aliases.h /usr/src/debug/msmtp/1.8.22-r0/msmtp-1.8.22/src/password.h /usr/src/debug/msmtp/1.8.22-r0/msmtp-1.8.22/src/aliases.c /usr/src/debug/msmtp/1.8.22-r0/msmtp-1.8.22/src/conf.h /usr/src/debug/msmtp/1.8.22-r0/msmtp-1.8.22/src/xalloc.h /usr/src/debug/msmtp/1.8.22-r0/msmtp-1.8.22/src/list.h /usr/src/debug/msmtp/1.8.22-r0/msmtp-1.8.22/src/conf.c /usr/src/debug/msmtp/1.8.22-r
 0/msmtp-1.8.22/src/mtls.h /usr/src/debug/msmtp/1.8.22-r0/msmtp-1.8.22/src/smtp.c /usr/src/debug/msmtp/1.8.22-r0/msmtp-1.8.22/src/msgid.h /usr/src/debug/msmtp/1.8.22-r0/msmtp-1.8.22/src/eval.h /usr/src/debug/msmtp/1.8.22-r0/msmtp-1.8.22/src/msmtpd.c /usr/src/debug/msmtp/1.8.22-r0/msmtp-1.8.22/src/password.c /usr/src/debug/msmtp/1.8.22-r0/msmtp-1.8.22/src/msmtp.c /usr/src/debug/msmtp/1.8.22-r0/msmtp-1.8.22/src/netrc.c /usr/src/debug/msmtp/1.8.22-r0/msmtp-1.8.22/src/md5-apps.c /usr/src/debug/msmtp/1.8.22-r0/msmtp-1.8.22/src/tools.h /usr/src/debug/msmtp/1.8.22-r0/msmtp-1.8.22/src/net.c /usr/src/debug/msmtp/1.8.22-r0/msmtp-1.8.22/src/md5.c /usr/src/debug/msmtp/1.8.22-r0/msmtp-1.8.22/src/net.h /usr/src/debug/msmtp/1.8.22-r0/msmtp-1.8.22/src/readbuf.h /usr/src/debug/msmtp/1.8.22-r0/msmtp-1.8.22/src/msgid.c /usr/src/debug/msmtp/1.8.22-r0/msmtp-1.8.22/src/smtp.h /usr/src/debug/msmtp/1.8.22-r0/msmtp-1.8.22/src/eval.c /usr/src/debug/msmtp/1.8.22-r0/msmtp-1.8.22/src/stream.h /usr/src/debug/msmt
 p/1.8.22-r0/msmtp-1.8.22/src/netrc.h"
packages/core2-32-poky-linux/msmtp/msmtp-src: PV changed from "1.8.20" to "1.8.22"
packages/core2-32-poky-linux/msmtp/msmtp-src: PKGSIZE changed from 496268 to 512388 (+3%)
packages/core2-32-poky-linux/msmtp/msmtp-src: PKGV changed from 1.8.20 [default] to 1.8.22 [default]
packages/core2-32-poky-linux/msmtp/msmtp-staticdev: PV changed from "1.8.20" to "1.8.22"
packages/core2-32-poky-linux/msmtp/msmtp-staticdev: PKGV changed from 1.8.20 [default] to 1.8.22 [default]
packages/core2-32-poky-linux/msmtp/msmtp: PV changed from "1.8.20" to "1.8.22"
packages/core2-32-poky-linux/msmtp/msmtp: PKGSIZE changed from 204552 to 204568 (+0%)
packages/core2-32-poky-linux/msmtp/msmtp: PKGV changed from 1.8.20 [default] to 1.8.22 [default]

--===============4552543468406927702==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-msmtp-upgrade-1.8.20-1.8.22.patch"

RnJvbSA4MjQ2OWY3ZWQ1Y2IzZmM0NDE3ZTk2MmEzNjE4ZGM1MWRjNDgwNGFjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXVnIDIwMjIgMTA6MzI6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
c210cDogdXBncmFkZSAxLjguMjAgLT4gMS44LjIyCgotLS0KIC4uLi9yZWNpcGVzLWV4dGVuZGVk
L21zbXRwL3ttc210cF8xLjguMjAuYmIgPT4gbXNtdHBfMS44LjIyLmJifSB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1leHRlbmRlZC9tc210cC97bXNtdHBfMS44LjIwLmJiID0+IG1zbXRwXzEuOC4yMi5iYn0g
KDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbXNtdHAvbXNtdHBfMS44
LjIwLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21zbXRwL21zbXRwXzEuOC4yMi5iYgpzaW1p
bGFyaXR5IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbXNtdHAv
bXNtdHBfMS44LjIwLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbXNtdHAvbXNt
dHBfMS44LjIyLmJiCmluZGV4IGRhM2Y3MGExNjMuLmQ1NmFmNzM0NmIgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9tc210cC9tc210cF8xLjguMjAuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL21zbXRwL21zbXRwXzEuOC4yMi5iYgpAQCAtMTEsNyArMTEsNyBAQCBMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1kMzIyMzliY2I2NzM0NjNhYjg3NGU4
MGQ0N2ZhZTUwNCIKIFVQU1RSRUFNX0NIRUNLX1VSSSA9ICJodHRwczovL21hcmxhbS5kZS9tc210
cC9kb3dubG9hZC8iCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9tYXJsYW0uZGUvJHtCUE59L3JlbGVh
c2VzLyR7QlB9LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJkOTNhZTJhYWZjMGY0OGFm
N2RjOWQwYjM5NGRmMWJiODAwNTg4YjhiNGU4ZDA5NmQ4YjNjZjIyNTM0NGViMTExIgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjFiMDQyMDYyODZhNWI4MjYyMjMzNWU0ZWIwOWUxNzA3NDM2OGI3Mjg4
ZTUzZDEzNDU0M2NiYmM2Yjc5ZWEzZTciCiAKIGluaGVyaXQgZ2V0dGV4dCBhdXRvdG9vbHMgdXBk
YXRlLWFsdGVybmF0aXZlcyBwa2djb25maWcKIAotLSAKMi4zMS4xCgo=

--===============4552543468406927702==--

