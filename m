Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F3DBC3A5A3
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 16:53:53 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web09.357.1664643228637538381
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 09:53:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mRDhU519;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 010101839477e018-4dffe64a-05e3-405a-839a-23722136e72e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1664643228;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=b7qbfA4+aHEqy5vLufaOikn6fnQM0zNSi8yhpRDTn0M=;
	b=mRDhU519EfzFJ8Z5ZRvu8dgb0t2M/ERp16jHz7nYH3stSYOrjEDFWaxiPXpe1mkM
	pVz64Y4eZrV7BPsrlkfCiayIaqB9QQwpfFFV1LEmSaFRxRIfsc9vbGMaPTEStnA2gmX
	geSzLqin/ChL0/f6H29fN61r5C7s02GhNou3FR/4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1664643228;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=b7qbfA4+aHEqy5vLufaOikn6fnQM0zNSi8yhpRDTn0M=;
	b=k9xvhCOTu8WiEHy2++GmQJ7VgaPFX/4gnj1UrQs76sZdn9Lh62dFEHr7D0Uh8Ks7
	MyUBxjfnhaHnyIFBzEfQQP0w3X3wOHarV01FzZVuRVagxMVpJvM+W3hrS6ErXytqKg/
	OjI3sLY40I+CuUvECAHbIyq65dhVPcS3ObrdJpOs=
Content-Type: multipart/mixed; boundary="===============7886201621680536529=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] xz: upgrading to 5.2.7 SUCCEEDED
Message-ID: 
 <010101839477e018-4dffe64a-05e3-405a-839a-23722136e72e-000000@us-west-2.amazonses.com>
Date: Sat, 1 Oct 2022 16:53:47 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 16:53:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171312

--===============7886201621680536529==
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
--===============7886201621680536529==
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

--===============7886201621680536529==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/xz: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz: PACKAGES: added "xz-locale-tr"
packages/core2-32-poky-linux/xz: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz: SRC_URI changed from "https://tukaani.org/xz/xz-5.2.6.tar.gz" to "https://tukaani.org/xz/xz-5.2.7.tar.gz"
packages/core2-32-poky-linux/xz/liblzma: FILELIST: removed "/usr/lib/liblzma.so.5.2.6", added "/usr/lib/liblzma.so.5.2.7"
packages/core2-32-poky-linux/xz/liblzma: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/liblzma: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
Changes to packages/core2-32-poky-linux/xz (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.2.6 to liblzma.so.5.2.7
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.2.6 to liblzma.so.5.2.7
  /usr/lib/liblzma.so.5.2.6 moved to /usr/lib/liblzma.so.5.2.7
packages/core2-32-poky-linux/xz/xz-dbg: PKGSIZE changed from 794692 to 797364 (+0%)
packages/core2-32-poky-linux/xz/xz-dbg: FILELIST: removed "/usr/lib/.debug/liblzma.so.5.2.6", added "/usr/lib/.debug/liblzma.so.5.2.7"
packages/core2-32-poky-linux/xz/xz-dbg: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-dbg: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-dev: PKGSIZE changed from 170355 to 171116 (+0%)
packages/core2-32-poky-linux/xz/xz-dev: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-dev: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-doc: PKGSIZE changed from 426290 to 429675 (+1%)
packages/core2-32-poky-linux/xz/xz-doc: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-doc: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-locale-ca: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-locale-ca: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-locale-cs: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-locale-cs: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-locale-da: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-locale-da: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-locale-de: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-locale-de: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-locale-eo: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-locale-eo: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-locale-es: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-locale-es: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-locale-fi: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-locale-fi: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-locale-fr: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-locale-fr: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-locale-hr: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-locale-hr: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-locale-hu: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-locale-hu: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-locale-it: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-locale-it: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-locale-ko: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-locale-ko: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-locale-pl: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-locale-pl: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-locale-pt-br: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-locale-pt-br: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-locale-pt: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-locale-pt: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-locale-ro: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-locale-ro: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-locale-sr: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-locale-sr: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-locale-sv: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-locale-sv: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-locale-uk: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-locale-uk: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-locale-vi: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-locale-vi: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-locale-zh-cn: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-locale-zh-cn: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-locale-zh-tw: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-locale-zh-tw: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-src: PKGSIZE changed from 1043424 to 1050080 (+1%)
packages/core2-32-poky-linux/xz/xz-src: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-src: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz-staticdev: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz-staticdev: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
packages/core2-32-poky-linux/xz/xz: PKGSIZE changed from 158832 to 158835 (+0%)
packages/core2-32-poky-linux/xz/xz: PV changed from "5.2.6" to "5.2.7"
packages/core2-32-poky-linux/xz/xz: PKGV changed from 5.2.6 [default] to 5.2.7 [default]
Changes to packages/x86_64-linux/xz-native (sysroot):
  /usr/lib/liblzma.so.5 changed symlink target from liblzma.so.5.2.6 to liblzma.so.5.2.7
  /usr/lib/liblzma.so changed symlink target from liblzma.so.5.2.6 to liblzma.so.5.2.7
  /usr/lib/liblzma.so.5.2.6 moved to /usr/lib/liblzma.so.5.2.7

--===============7886201621680536529==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-xz-upgrade-5.2.6-5.2.7.patch"

RnJvbSBjNzNiYWUxM2UyYTIyNDVlYzgwZTQzZjhlNGVkM2U2Y2VmNWIwMTJkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBPY3QgMjAyMiAxMTo1MDowNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHh6
OiB1cGdyYWRlIDUuMi42IC0+IDUuMi43CgotLS0KIG1ldGEvcmVjaXBlcy1leHRlbmRlZC94ei97
eHpfNS4yLjYuYmIgPT4geHpfNS4yLjcuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3h6
L3t4el81LjIuNi5iYiA9PiB4el81LjIuNy5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQveHoveHpfNS4yLjYuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQveHov
eHpfNS4yLjcuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL3h6L3h6XzUuMi42LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
eHoveHpfNS4yLjcuYmIKaW5kZXggMzQ4MjYyMjQ3MS4uODhlYzg0N2MxNSAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL3h6L3h6XzUuMi42LmJiCisrKyBiL21ldGEvcmVjaXBlcy1l
eHRlbmRlZC94ei94el81LjIuNy5iYgpAQCAtMjUsNyArMjUsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HO21kNT05N2Q1NTRhMzI4ODFmZWUwYWEyODNkOTZlNDdjYjI0YSBc
CiAgICAgICAgICAgICAgICAgICAgICIKIAogU1JDX1VSSSA9ICJodHRwczovL3R1a2Fhbmkub3Jn
L3h6L3h6LSR7UFZ9LnRhci5neiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJhMjEwNWFiZWUxN2Jj
ZDJlYmQxNWNlZDMxYjRmNWVkYTZlMTdlZmQ2YjEwZjkyMWEwMWNkYTRhNDRjOTFiM2EwIgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjA2MzI3YzJkZGM4MWUxMjZhNmQ5YTc4YjBiZTUwMTRiOTc2YTJj
MDgzMmY0OTJkY2ZjNDc1NWQ3ZmFjZjZkMzMiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJ4ei0o
P1A8cHZlcj5cZCsoXC5cZCspKylcLnRhciIKIAogQ0FDSEVEX0NPTkZJR1VSRVZBUlMgKz0gImds
X2N2X3Bvc2l4X3NoZWxsPS9iaW4vc2giCi0tIAoyLjMxLjEKCg==

--===============7886201621680536529==--

