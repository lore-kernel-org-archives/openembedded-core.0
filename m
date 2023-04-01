Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6766C7EE45
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 21:29:02 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.32135.1680384535906436676
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 14:28:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=F0OsxJZI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101873eb92a87-7ec9cbce-772d-40e9-9395-792cc9f5ce20-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1680384535;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mMCwoY7iq7dKw4IQRF3CNCpOzQ8s+9P9NgjkmDncE+8=;
	b=F0OsxJZI4IIy18KgzDrsalHMvLLUfJlZDytaYICcXDtgev8Mo08WtWoc06ayUOw3
	1FXcE1oDoaLRLNuW2tjWBrpJDzw+/MqqpalRVx5ppjOcyqEj2dqeImeVvr9Vs6x80Xl
	cx3LJf/W6ccQCw0BLRhNTQ9Af54xxzH/hKt9L/N8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1680384535;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mMCwoY7iq7dKw4IQRF3CNCpOzQ8s+9P9NgjkmDncE+8=;
	b=Ke5RTOQ9rTj1K9x6ndhYovAZUvE08bidEDXNU8zBBH0zOQaq4m6OHIALMBY7JGg6
	lWNSndj1aK7XwTvtw/dQJXMYJRIASoq8mupVUNWl/Ar+1p3FgOM+5iw7uQJoQ0XKbv0
	R5cBgQnsJSIt6aPTfbhUujyobrCJ+TVe/YmeIwZE=
Content-Type: multipart/mixed; boundary="===============5290446902746070379=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libsdl2: upgrading to 2.26.4 SUCCEEDED
Message-ID: <010101873eb92a87-7ec9cbce-772d-40e9-9395-792cc9f5ce20-000000@us-west-2.amazonses.com>
Date: Sat, 1 Apr 2023 21:28:55 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 21:29:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179527

--===============5290446902746070379==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libsdl2* to *2.26.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libsdl2-upgrade-2.26.3-2.26.4.patch
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
--===============5290446902746070379==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libsdl2-upgrade-2.26.3-2.26.4.patch"

RnJvbSAyNWRlMDZmYmFhZTdiYzEzYjliNGUxODYzNmJiNzVlMTQzYzE2OTMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBBcHIgMjAyMyAxNTozOTozNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnNkbDI6IHVwZ3JhZGUgMi4yNi4zIC0+IDIuMjYuNAoKLS0tCiAuLi4vbGlic2RsMi97bGlic2Rs
Ml8yLjI2LjMuYmIgPT4gbGlic2RsMl8yLjI2LjQuYmJ9ICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvbGlic2RsMi97bGlic2RsMl8yLjI2LjMuYmIgPT4gbGlic2RsMl8yLjI2
LjQuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnNkbDIv
bGlic2RsMl8yLjI2LjMuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlic2RsMi9saWJzZGwy
XzIuMjYuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvbGlic2RsMi9saWJzZGwyXzIuMjYuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL2xpYnNkbDIvbGlic2RsMl8yLjI2LjQuYmIKaW5kZXggMTUwNTRlMWVhOS4uNzc1
YTY5OTIyNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnNkbDIvbGlic2Rs
Ml8yLjI2LjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnNkbDIvbGlic2RsMl8y
LjI2LjQuYmIKQEAgLTI1LDcgKzI1LDcgQEAgU1JDX1VSSSA9ICJodHRwOi8vd3d3LmxpYnNkbC5v
cmcvcmVsZWFzZS9TREwyLSR7UFZ9LnRhci5neiIKIAogUyA9ICIke1dPUktESVJ9L1NETDItJHtQ
Vn0iCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjNjYxMjA1YTU1M2I3ZDI1MjQyNWY0Yjc1MWZm
MTMyMDllNWUwMjBiODc2YmJmYTE1OTg0OTRhZjYxNzkwMDU3IgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjFhMGY2ODY0OThmYjc2OGFkOWYzZjgwYjM5MDM3YTdkMDA2ZWFjMDkzYWFkMzljYjRlYmNj
ODMyYTg4ODcyMzEiCiAKIGluaGVyaXQgY21ha2UgbGliX3BhY2thZ2UgYmluY29uZmlnLWRpc2Fi
bGVkIHBrZ2NvbmZpZyB1cHN0cmVhbS12ZXJzaW9uLWlzLWV2ZW4KIAotLSAKMi4zOS4yCgo=

--===============5290446902746070379==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libsdl2: PKGV changed from 2.26.3 [default] to 2.26.4 [default]
packages/core2-32-poky-linux/libsdl2: SRC_URI changed from "http://www.libsdl.org/release/SDL2-2.26.3.tar.gz" to "http://www.libsdl.org/release/SDL2-2.26.4.tar.gz"
packages/core2-32-poky-linux/libsdl2: PV changed from "2.26.3" to "2.26.4"
packages/core2-32-poky-linux/libsdl2/libsdl2-bin: PKGV changed from 2.26.3 [default] to 2.26.4 [default]
packages/core2-32-poky-linux/libsdl2/libsdl2-bin: PV changed from "2.26.3" to "2.26.4"
packages/core2-32-poky-linux/libsdl2/libsdl2-dbg: PKGV changed from 2.26.3 [default] to 2.26.4 [default]
packages/core2-32-poky-linux/libsdl2/libsdl2-dbg: PV changed from "2.26.3" to "2.26.4"
packages/core2-32-poky-linux/libsdl2/libsdl2-dbg: PKGSIZE changed from 6183536 to 6183524 (-0%)
packages/core2-32-poky-linux/libsdl2/libsdl2-dbg: FILELIST: removed "/usr/lib/.debug/libSDL2-2.0.so.0.2600.3", added "/usr/lib/.debug/libSDL2-2.0.so.0.2600.4"
packages/core2-32-poky-linux/libsdl2/libsdl2-dev: PKGV changed from 2.26.3 [default] to 2.26.4 [default]
packages/core2-32-poky-linux/libsdl2/libsdl2-dev: PV changed from "2.26.3" to "2.26.4"
packages/core2-32-poky-linux/libsdl2/libsdl2-doc: PKGV changed from 2.26.3 [default] to 2.26.4 [default]
packages/core2-32-poky-linux/libsdl2/libsdl2-doc: PV changed from "2.26.3" to "2.26.4"
packages/core2-32-poky-linux/libsdl2/libsdl2-locale: PKGV changed from 2.26.3 [default] to 2.26.4 [default]
packages/core2-32-poky-linux/libsdl2/libsdl2-locale: PV changed from "2.26.3" to "2.26.4"
packages/core2-32-poky-linux/libsdl2/libsdl2-src: PKGV changed from 2.26.3 [default] to 2.26.4 [default]
packages/core2-32-poky-linux/libsdl2/libsdl2-src: PV changed from "2.26.3" to "2.26.4"
packages/core2-32-poky-linux/libsdl2/libsdl2-src: PKGSIZE changed from 10022397 to 10022441 (+0%)
packages/core2-32-poky-linux/libsdl2/libsdl2-staticdev: PKGV changed from 2.26.3 [default] to 2.26.4 [default]
packages/core2-32-poky-linux/libsdl2/libsdl2-staticdev: PV changed from "2.26.3" to "2.26.4"
packages/core2-32-poky-linux/libsdl2/libsdl2-staticdev: PKGSIZE changed from 9130874 to 9130710 (-0%)
packages/core2-32-poky-linux/libsdl2/libsdl2: PKGV changed from 2.26.3 [default] to 2.26.4 [default]
packages/core2-32-poky-linux/libsdl2/libsdl2: PV changed from "2.26.3" to "2.26.4"
packages/core2-32-poky-linux/libsdl2/libsdl2: FILELIST: removed "/usr/lib/libSDL2-2.0.so.0.2600.3", added "/usr/lib/libSDL2-2.0.so.0.2600.4"
Changes to packages/core2-32-poky-linux/libsdl2 (sysroot):
  /usr/lib/libSDL2-2.0.so.0 changed symlink target from libSDL2-2.0.so.0.2600.3 to libSDL2-2.0.so.0.2600.4
  /usr/lib/libSDL2-2.0.so.0.2600.3 moved to /usr/lib/libSDL2-2.0.so.0.2600.4

--===============5290446902746070379==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libsdl2/libsdl2: FILELIST: removed "/usr/lib/libSDL2-2.0.so.0.2600.3", added "/usr/lib/libSDL2-2.0.so.0.2600.4"
Changes to packages/core2-32-poky-linux/libsdl2 (sysroot):
  /usr/lib/libSDL2-2.0.so.0 changed symlink target from libSDL2-2.0.so.0.2600.3 to libSDL2-2.0.so.0.2600.4
  /usr/lib/libSDL2-2.0.so.0.2600.3 moved to /usr/lib/libSDL2-2.0.so.0.2600.4

--===============5290446902746070379==--

