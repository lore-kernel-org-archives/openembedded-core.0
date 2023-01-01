Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6104AC677F0
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 20:46:18 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.20679.1672605968483514342
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 12:46:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Xzopsb03;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101856f15a60c-cbc3f701-4141-49c0-9073-083d23922551-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1672605968;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=k0AE9kPnlVBiOKtFgyU5bwHIYngDtE212quVoLNruT4=;
	b=Xzopsb03Oad/OiqgK74JdZTR6vqkcOflrYJ+nfVA2HJqREeoiiYAlv2YauM8kbX8
	6rW2rrdXxEZNuRPpz0FKvHNhUHAJoMC/t42UC2FtfPWxOXh5bHLcyPbvrfYJ3ukaumG
	Vgq0pyyJI0hBT8O49ZUa63zgPBQDpxqiTBDEY6YE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1672605968;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=k0AE9kPnlVBiOKtFgyU5bwHIYngDtE212quVoLNruT4=;
	b=QFKdnGYnsbNzXkDefVDX75SZ/2+siYNXXx438j8J93n3eu3eVB5b/klC3uPhLGzD
	b9fLb1IS7dcy5GiXl5GjwuJWFMk4jTwKk9Q3MThnqRFLrsvvFCNN48hzIA+9upoo12B
	F37e+Aw/0tFBz5ohnV4T9kINAVxlzlYxVflyddZg=
Content-Type: multipart/mixed; boundary="===============4629514211293787889=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libsdl2: upgrading to 2.26.1 SUCCEEDED
Message-ID: <010101856f15a60c-cbc3f701-4141-49c0-9073-083d23922551-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jan 2023 20:46:07 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 20:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175294

--===============4629514211293787889==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libsdl2* to *2.26.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libsdl2-upgrade-2.26.0-2.26.1.patch
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
--===============4629514211293787889==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libsdl2/libsdl2: FILELIST: removed "/usr/lib/libSDL2-2.0.so.0.2600.0", added "/usr/lib/libSDL2-2.0.so.0.2600.1"
Changes to packages/core2-32-poky-linux/libsdl2 (sysroot):
  /usr/lib/libSDL2-2.0.so.0 changed symlink target from libSDL2-2.0.so.0.2600.0 to libSDL2-2.0.so.0.2600.1
  /usr/lib/libSDL2-2.0.so.0.2600.0 moved to /usr/lib/libSDL2-2.0.so.0.2600.1

--===============4629514211293787889==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libsdl2: SRC_URI changed from "http://www.libsdl.org/release/SDL2-2.26.0.tar.gz" to "http://www.libsdl.org/release/SDL2-2.26.1.tar.gz"
packages/core2-32-poky-linux/libsdl2: PKGV changed from 2.26.0 [default] to 2.26.1 [default]
packages/core2-32-poky-linux/libsdl2: PV changed from "2.26.0" to "2.26.1"
packages/core2-32-poky-linux/libsdl2/libsdl2-bin: PKGV changed from 2.26.0 [default] to 2.26.1 [default]
packages/core2-32-poky-linux/libsdl2/libsdl2-bin: PV changed from "2.26.0" to "2.26.1"
packages/core2-32-poky-linux/libsdl2/libsdl2-dbg: FILELIST: removed "/usr/lib/.debug/libSDL2-2.0.so.0.2600.0", added "/usr/lib/.debug/libSDL2-2.0.so.0.2600.1"
packages/core2-32-poky-linux/libsdl2/libsdl2-dbg: PKGV changed from 2.26.0 [default] to 2.26.1 [default]
packages/core2-32-poky-linux/libsdl2/libsdl2-dbg: PKGSIZE changed from 6183004 to 6182988 (-0%)
packages/core2-32-poky-linux/libsdl2/libsdl2-dbg: PV changed from "2.26.0" to "2.26.1"
packages/core2-32-poky-linux/libsdl2/libsdl2-dev: PKGV changed from 2.26.0 [default] to 2.26.1 [default]
packages/core2-32-poky-linux/libsdl2/libsdl2-dev: PV changed from "2.26.0" to "2.26.1"
packages/core2-32-poky-linux/libsdl2/libsdl2-doc: PKGV changed from 2.26.0 [default] to 2.26.1 [default]
packages/core2-32-poky-linux/libsdl2/libsdl2-doc: PV changed from "2.26.0" to "2.26.1"
packages/core2-32-poky-linux/libsdl2/libsdl2-locale: PKGV changed from 2.26.0 [default] to 2.26.1 [default]
packages/core2-32-poky-linux/libsdl2/libsdl2-locale: PV changed from "2.26.0" to "2.26.1"
packages/core2-32-poky-linux/libsdl2/libsdl2-src: PKGV changed from 2.26.0 [default] to 2.26.1 [default]
packages/core2-32-poky-linux/libsdl2/libsdl2-src: PKGSIZE changed from 10022184 to 10022120 (-0%)
packages/core2-32-poky-linux/libsdl2/libsdl2-src: PV changed from "2.26.0" to "2.26.1"
packages/core2-32-poky-linux/libsdl2/libsdl2-staticdev: PKGV changed from 2.26.0 [default] to 2.26.1 [default]
packages/core2-32-poky-linux/libsdl2/libsdl2-staticdev: PKGSIZE changed from 9129994 to 9129438 (-0%)
packages/core2-32-poky-linux/libsdl2/libsdl2-staticdev: PV changed from "2.26.0" to "2.26.1"
packages/core2-32-poky-linux/libsdl2/libsdl2: FILELIST: removed "/usr/lib/libSDL2-2.0.so.0.2600.0", added "/usr/lib/libSDL2-2.0.so.0.2600.1"
packages/core2-32-poky-linux/libsdl2/libsdl2: PKGV changed from 2.26.0 [default] to 2.26.1 [default]
packages/core2-32-poky-linux/libsdl2/libsdl2: PKGSIZE changed from 1976327 to 1976359 (+0%)
packages/core2-32-poky-linux/libsdl2/libsdl2: PV changed from "2.26.0" to "2.26.1"
Changes to packages/core2-32-poky-linux/libsdl2 (sysroot):
  /usr/lib/libSDL2-2.0.so.0 changed symlink target from libSDL2-2.0.so.0.2600.0 to libSDL2-2.0.so.0.2600.1
  /usr/lib/libSDL2-2.0.so.0.2600.0 moved to /usr/lib/libSDL2-2.0.so.0.2600.1

--===============4629514211293787889==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libsdl2-upgrade-2.26.0-2.26.1.patch"

RnJvbSBmM2Y3NWFmNmFjZWY0ZWJmMThjNTkzZWIyOWYxYjczNGM3ODcyMDk2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKYW4gMjAyMyAxNDowMzozMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnNkbDI6IHVwZ3JhZGUgMi4yNi4wIC0+IDIuMjYuMQoKLS0tCiAuLi4vbGlic2RsMi97bGlic2Rs
Ml8yLjI2LjAuYmIgPT4gbGlic2RsMl8yLjI2LjEuYmJ9ICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvbGlic2RsMi97bGlic2RsMl8yLjI2LjAuYmIgPT4gbGlic2RsMl8yLjI2
LjEuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnNkbDIv
bGlic2RsMl8yLjI2LjAuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlic2RsMi9saWJzZGwy
XzIuMjYuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvbGlic2RsMi9saWJzZGwyXzIuMjYuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL2xpYnNkbDIvbGlic2RsMl8yLjI2LjEuYmIKaW5kZXggM2RkYTA4MjU5My4uMGIy
MjMxYmM3YSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnNkbDIvbGlic2Rs
Ml8yLjI2LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnNkbDIvbGlic2RsMl8y
LjI2LjEuYmIKQEAgLTI1LDcgKzI1LDcgQEAgU1JDX1VSSSA9ICJodHRwOi8vd3d3LmxpYnNkbC5v
cmcvcmVsZWFzZS9TREwyLSR7UFZ9LnRhci5neiIKIAogUyA9ICIke1dPUktESVJ9L1NETDItJHtQ
Vn0iCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4MDAwZDcxNjlmZWJjZTkzYzg0YjZiZGYzNzY2
MzFmODE3OTEzMmZkNjlmNzAxNWQ0ZGFkYjhiOWMyYmRiMjk1IgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjAyNTM3Y2M3ZWJkNzQwNzE2MzEwMzhiMjM3ZWM0YmZiYjNmNDgzMGJhMDE5ZTU2OTQzNGRh
MzNmNDIzNzNlMDQiCiAKIGluaGVyaXQgY21ha2UgbGliX3BhY2thZ2UgYmluY29uZmlnLWRpc2Fi
bGVkIHBrZ2NvbmZpZyB1cHN0cmVhbS12ZXJzaW9uLWlzLWV2ZW4KIAotLSAKMi4zNy4zCgo=

--===============4629514211293787889==--

