Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6159CC6FA9D
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 00:46:45 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.10155.1676508398449827831
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 16:46:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=dtpgeH3W;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018657b00049-d068dce1-4ea6-4627-8ec4-53ef51db0401-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1676508397;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=z4OKmTc4VjHsGiKsACQ7kTh/FuKHrVg3gQfVjrI+nb8=;
	b=dtpgeH3WP5Qvuw5UeQcKj09S0AyVF8vHhALBnSi/hjgJZEmyi3M/vCUq4zp1aGoC
	0aAsMHYvrInn/un1RNnEHTHAVi022sSEartI7TtTuBB1Ee8MQbEQFaE+oweFYe6DNrl
	2YVfb7Ab/MJQjFCXiu5oBxkEb8zpkJuHfJmWj4S4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1676508397;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=z4OKmTc4VjHsGiKsACQ7kTh/FuKHrVg3gQfVjrI+nb8=;
	b=TXe/0YlZxIPiu0r7L85iDtGpRGeInTkmH7qI5z8Zpo97BOvi8+3a9Fs1XiizOlDA
	RgcYerhEOl/Ps1EmiX80UGVVhNvA1jiA8P1VmI2gYqu2YIffQ+tHHJpekyCtycHQ+Ft
	UepJeP4YlcTtNz/nfvQD822mZFHztwNI15sghHuA=
Content-Type: multipart/mixed; boundary="===============5166895208284578702=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libwpe: upgrading to 1.14.1 SUCCEEDED
Message-ID: <0101018657b00049-d068dce1-4ea6-4627-8ec4-53ef51db0401-000000@us-west-2.amazonses.com>
Date: Thu, 16 Feb 2023 00:46:37 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.16-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 00:46:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177262

--===============5166895208284578702==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libwpe* to *1.14.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libwpe-upgrade-1.14.0-1.14.1.patch
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
--===============5166895208284578702==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libwpe: PKGV changed from 1.14.0 [default] to 1.14.1 [default]
packages/core2-32-poky-linux/libwpe: SRC_URI changed from "https://wpewebkit.org/releases/libwpe-1.14.0.tar.xz" to "https://wpewebkit.org/releases/libwpe-1.14.1.tar.xz"
packages/core2-32-poky-linux/libwpe: PV changed from "1.14.0" to "1.14.1"
packages/core2-32-poky-linux/libwpe/libwpe-dbg: PKGSIZE changed from 235224 to 235268 (+0%)
packages/core2-32-poky-linux/libwpe/libwpe-dbg: FILELIST: removed "/usr/lib/.debug/libwpe-1.0.so.1.8.0", added "/usr/lib/.debug/libwpe-1.0.so.1.8.1"
packages/core2-32-poky-linux/libwpe/libwpe-dbg: PKGV changed from 1.14.0 [default] to 1.14.1 [default]
packages/core2-32-poky-linux/libwpe/libwpe-dbg: PV changed from "1.14.0" to "1.14.1"
packages/core2-32-poky-linux/libwpe/libwpe-dev: PKGV changed from 1.14.0 [default] to 1.14.1 [default]
packages/core2-32-poky-linux/libwpe/libwpe-dev: PV changed from "1.14.0" to "1.14.1"
packages/core2-32-poky-linux/libwpe/libwpe-doc: PKGV changed from 1.14.0 [default] to 1.14.1 [default]
packages/core2-32-poky-linux/libwpe/libwpe-doc: PV changed from "1.14.0" to "1.14.1"
packages/core2-32-poky-linux/libwpe/libwpe-locale: PKGV changed from 1.14.0 [default] to 1.14.1 [default]
packages/core2-32-poky-linux/libwpe/libwpe-locale: PV changed from "1.14.0" to "1.14.1"
packages/core2-32-poky-linux/libwpe/libwpe-src: PKGSIZE changed from 252302 to 252324 (+0%)
packages/core2-32-poky-linux/libwpe/libwpe-src: PKGV changed from 1.14.0 [default] to 1.14.1 [default]
packages/core2-32-poky-linux/libwpe/libwpe-src: PV changed from "1.14.0" to "1.14.1"
packages/core2-32-poky-linux/libwpe/libwpe-staticdev: PKGV changed from 1.14.0 [default] to 1.14.1 [default]
packages/core2-32-poky-linux/libwpe/libwpe-staticdev: PV changed from "1.14.0" to "1.14.1"
packages/core2-32-poky-linux/libwpe/libwpe: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.8.0", added "/usr/lib/libwpe-1.0.so.1.8.1"
packages/core2-32-poky-linux/libwpe/libwpe: PKGV changed from 1.14.0 [default] to 1.14.1 [default]
packages/core2-32-poky-linux/libwpe/libwpe: PV changed from "1.14.0" to "1.14.1"
Changes to packages/core2-32-poky-linux/libwpe (sysroot):
  /usr/lib/libwpe-1.0.so.1 changed symlink target from libwpe-1.0.so.1.8.0 to libwpe-1.0.so.1.8.1
  /usr/lib/libwpe-1.0.so.1.8.0 moved to /usr/lib/libwpe-1.0.so.1.8.1

--===============5166895208284578702==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libwpe/libwpe: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.8.0", added "/usr/lib/libwpe-1.0.so.1.8.1"
Changes to packages/core2-32-poky-linux/libwpe (sysroot):
  /usr/lib/libwpe-1.0.so.1 changed symlink target from libwpe-1.0.so.1.8.0 to libwpe-1.0.so.1.8.1
  /usr/lib/libwpe-1.0.so.1.8.0 moved to /usr/lib/libwpe-1.0.so.1.8.1

--===============5166895208284578702==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libwpe-upgrade-1.14.0-1.14.1.patch"

RnJvbSA2NWVhNzJlOWU2ZTY4MTJkNjdmMWExYjhmODE4ZWQ2MDc1ZjE4YmJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgRmViIDIwMjMgMjI6MTU6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ3cGU6IHVwZ3JhZGUgMS4xNC4wIC0+IDEuMTQuMQoKLS0tCiBtZXRhL3JlY2lwZXMtc2F0by93
ZWJraXQve2xpYndwZV8xLjE0LjAuYmIgPT4gbGlid3BlXzEuMTQuMS5iYn0gfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtc2F0by93ZWJraXQve2xpYndwZV8xLjE0LjAuYmIgPT4gbGlid3BlXzEuMTQuMS5iYn0g
KDg4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvbGlid3BlXzEuMTQu
MC5iYiBiL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC9saWJ3cGVfMS4xNC4xLmJiCnNpbWlsYXJp
dHkgaW5kZXggODglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC9saWJ3cGVf
MS4xNC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvbGlid3BlXzEuMTQu
MS5iYgppbmRleCBhMDgzMDRkMjgwLi5lNjNlMWM4MzY3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtc2F0by93ZWJraXQvbGlid3BlXzEuMTQuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc2F0by93
ZWJraXQvbGlid3BlXzEuMTQuMS5iYgpAQCAtMTEsNyArMTEsNyBAQCBpbmhlcml0IGNtYWtlIGZl
YXR1cmVzX2NoZWNrIHBrZ2NvbmZpZwogUkVRVUlSRURfRElTVFJPX0ZFQVRVUkVTID0gIm9wZW5n
bCIKIAogU1JDX1VSSSA9ICJodHRwczovL3dwZXdlYmtpdC5vcmcvcmVsZWFzZXMvJHtCUE59LSR7
UFZ9LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjMDczMzA1YmJhYzVmNDQwMmNjMWM4
YTQ3NTNiZmEzZDYzYTQwODkwMWY4NjE4MjA1MWVhYTVhNzVkZDg5YzAwIgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gImIxZDBjZGNmMGY4ZGJiNDk0ZTY1YjBmNzkxM2UzNTcxMDZkYTlhMGQ1N2Y0ZmJi
N2I5ZDEyMzhhNmRiZTlhZGUiCiAKICMgVGhpcyBpcyBhIHR3ZWFrIG9mIHVwc3RyZWFtLXZlcnNp
b24taXMtZXZlbiBuZWVkZWQgYmVjYXVzZQogIyBpcHN0cmVhbSBkaXJlY3RvcnkgY29udGFpbnMg
dGFyYmFsbHMgZm9yIG90aGVyIGNvbXBvbmVudHMgYXMgd2VsbC4KLS0gCjIuMzcuMwoK

--===============5166895208284578702==--

