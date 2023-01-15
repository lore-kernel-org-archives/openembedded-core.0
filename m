Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2DAAC3DA78
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 18:02:30 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.145845.1673805745621561446
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 10:02:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Y6UOXRrs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010185b698bf51-38d7d59d-ce53-4f91-8f9d-66934fd1f44c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1673805742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Nupr09xqn+WmLzRkWqrsDQKSH43SH8zHSzckwCNLZ/w=;
	b=Y6UOXRrsLEowbqSbruJvEMpICy7IpL+24vbyLfbhsn2maaygxeFnZBTpDFmg2fJV
	OBYtNGMDBYZ/F8Hh3jHuCmemLIgbP9v7oG3LXDXPV5QXvLfjp3Owh/XbpynomRbbG6s
	WJHtEtzq+W18DAYYqxTKdYpe4kKDIb6nPtAUm/pA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1673805742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Nupr09xqn+WmLzRkWqrsDQKSH43SH8zHSzckwCNLZ/w=;
	b=Jz6bd2Cnzo2juTYj3wZTy0FeLBtM5gYMbO6vtt8nvBarJNWqpSq4eRZzNULGO0HJ
	08ZjJ2a/SjgbMpcfpqP9MtTQcUC+sdPa6YGGO3GX91VzwDvyhBHedwQlZYdotY44ecd
	kNBiMyRqSwL7+S5kC+zmUFEA/ozU9P5gIJ7cYfv4=
Content-Type: multipart/mixed; boundary="===============1017085481637018681=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libpcap: upgrading to 1.10.3 SUCCEEDED
Message-ID: <01010185b698bf51-38d7d59d-ce53-4f91-8f9d-66934fd1f44c-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jan 2023 18:02:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 18:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175945

--===============1017085481637018681==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libpcap* to *1.10.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libpcap-upgrade-1.10.2-1.10.3.patch
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
--===============1017085481637018681==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libpcap: SRC_URI changed from "https://www.tcpdump.org/release/libpcap-1.10.2.tar.gz" to "https://www.tcpdump.org/release/libpcap-1.10.3.tar.gz"
packages/core2-32-poky-linux/libpcap: PKGV changed from 1.10.2 [default] to 1.10.3 [default]
packages/core2-32-poky-linux/libpcap: PV changed from "1.10.2" to "1.10.3"
packages/core2-32-poky-linux/libpcap/libpcap-dbg: PKGV changed from 1.10.2 [default] to 1.10.3 [default]
packages/core2-32-poky-linux/libpcap/libpcap-dbg: PV changed from "1.10.2" to "1.10.3"
packages/core2-32-poky-linux/libpcap/libpcap-dbg: FILELIST: removed "/usr/lib/.debug/libpcap.so.1.10.2", added "/usr/lib/.debug/libpcap.so.1.10.3"
packages/core2-32-poky-linux/libpcap/libpcap-dev: PKGSIZE changed from 168068 to 165599 (-1%)
packages/core2-32-poky-linux/libpcap/libpcap-dev: PKGV changed from 1.10.2 [default] to 1.10.3 [default]
packages/core2-32-poky-linux/libpcap/libpcap-dev: PV changed from "1.10.2" to "1.10.3"
packages/core2-32-poky-linux/libpcap/libpcap-dev: FILELIST: removed "/usr/include/pcap-util.h"
packages/core2-32-poky-linux/libpcap/libpcap-doc: PKGV changed from 1.10.2 [default] to 1.10.3 [default]
packages/core2-32-poky-linux/libpcap/libpcap-doc: PV changed from "1.10.2" to "1.10.3"
packages/core2-32-poky-linux/libpcap/libpcap-locale: PKGV changed from 1.10.2 [default] to 1.10.3 [default]
packages/core2-32-poky-linux/libpcap/libpcap-locale: PV changed from "1.10.2" to "1.10.3"
packages/core2-32-poky-linux/libpcap/libpcap-src: PKGSIZE changed from 1492416 to 1492417 (+0%)
packages/core2-32-poky-linux/libpcap/libpcap-src: PKGV changed from 1.10.2 [default] to 1.10.3 [default]
packages/core2-32-poky-linux/libpcap/libpcap-src: PV changed from "1.10.2" to "1.10.3"
packages/core2-32-poky-linux/libpcap/libpcap-staticdev: PKGSIZE changed from 1186388 to 1186436 (+0%)
packages/core2-32-poky-linux/libpcap/libpcap-staticdev: PKGV changed from 1.10.2 [default] to 1.10.3 [default]
packages/core2-32-poky-linux/libpcap/libpcap-staticdev: PV changed from "1.10.2" to "1.10.3"
packages/core2-32-poky-linux/libpcap/libpcap: PKGV changed from 1.10.2 [default] to 1.10.3 [default]
packages/core2-32-poky-linux/libpcap/libpcap: PV changed from "1.10.2" to "1.10.3"
packages/core2-32-poky-linux/libpcap/libpcap: FILELIST: removed "/usr/lib/libpcap.so.1.10.2", added "/usr/lib/libpcap.so.1.10.3"
Changes to packages/core2-32-poky-linux/libpcap (sysroot):
  /usr/lib/libpcap.so.1 changed symlink target from libpcap.so.1.10.2 to libpcap.so.1.10.3
  /usr/lib/libpcap.so.1.10.2 moved to /usr/lib/libpcap.so.1.10.3
  /usr/include/pcap-util.h was removed

--===============1017085481637018681==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libpcap/libpcap-dev: FILELIST: removed "/usr/include/pcap-util.h"
packages/core2-32-poky-linux/libpcap/libpcap: FILELIST: removed "/usr/lib/libpcap.so.1.10.2", added "/usr/lib/libpcap.so.1.10.3"
Changes to packages/core2-32-poky-linux/libpcap (sysroot):
  /usr/lib/libpcap.so.1 changed symlink target from libpcap.so.1.10.2 to libpcap.so.1.10.3
  /usr/lib/libpcap.so.1.10.2 moved to /usr/lib/libpcap.so.1.10.3
  /usr/include/pcap-util.h was removed

--===============1017085481637018681==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libpcap-upgrade-1.10.2-1.10.3.patch"

RnJvbSBhN2FkMmY2ZDcyOWM1ZWE1YTBjYWI1OWRjNjU4YzM5OGRhOWEwNzhlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSmFuIDIwMjMgMDY6NDE6MTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJwY2FwOiB1cGdyYWRlIDEuMTAuMiAtPiAxLjEwLjMKCi0tLQogLi4uL2xpYnBjYXAve2xpYnBj
YXBfMS4xMC4yLmJiID0+IGxpYnBjYXBfMS4xMC4zLmJifSAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9saWJwY2FwL3tsaWJwY2FwXzEuMTAuMi5iYiA9PiBsaWJwY2Fw
XzEuMTAuMy5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2xpYnBjYXAvbGlicGNhcF8xLjEwLjIuYmIgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2xp
YnBjYXAvbGlicGNhcF8xLjEwLjMuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9saWJwY2FwL2xpYnBjYXBfMS4xMC4yLmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2xpYnBjYXAvbGlicGNhcF8xLjEwLjMuYmIK
aW5kZXggNDhjOWJiMDlkMy4uZWIwYTY1MDEzMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9saWJwY2FwL2xpYnBjYXBfMS4xMC4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvbGlicGNhcC9saWJwY2FwXzEuMTAuMy5iYgpAQCAtMTEsNyArMTEsNyBAQCBM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT01ZWIyODkyMTdjMTYwZTI5MjBk
MmUzNWJkZGMzNjQ1MyBcCiBERVBFTkRTID0gImZsZXgtbmF0aXZlIGJpc29uLW5hdGl2ZSIKIAog
U1JDX1VSSSA9ICJodHRwczovL3d3dy50Y3BkdW1wLm9yZy9yZWxlYXNlLyR7QlB9LnRhci5neiIK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICJkYjZkNzlkNGFkMDNiOGIxNWZiMTZjNDI0NDdkMDkzYWQz
NTIwYzBlYzBhZTNkMzMxMTA0ZGNmYjFjZTc3NTYwIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjJh
ODg4NWM0MDM1MTZjZjdiMDkzM2VkNGIxNGQ2Y2FhMzBlMDIwNTI0ODllYmQ0MTRkYzc1YWM1MmU3
NTU5ZTYiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIGJpbmNvbmZpZy1kaXNhYmxlZCBwa2djb25maWcK
IAotLSAKMi4zNy4zCgo=

--===============1017085481637018681==--

