Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE58C761A6
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 00:46:46 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.10284.1676508396009394288
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 16:46:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=WKL56QGI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018657aff5a6-2fd34325-d82a-4a83-b856-bd1c0db15d20-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1676508395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4xIYcL1AfbDZBoGVHqId/QSzHDl0EnPG7v0+RQAlOfQ=;
	b=WKL56QGIX3DEobfgfGhfpREvK2nCdaLWf9ioxTy4jhyfj8A1Reiaey5U79LjUtt0
	ITS4/6GKCxjicfhpoyaoCmSVwYg6xIA3bBOveloWzcLwfBXjgAUISPH8xMgE/GI5cXV
	p4xM7kiGC89I50DLglIQSO6Jzyyei/1v3crDkexQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1676508395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4xIYcL1AfbDZBoGVHqId/QSzHDl0EnPG7v0+RQAlOfQ=;
	b=c/8kn+5W9+CxmDSdp7ohz2STrCg2jRNRk+gjffQqPV5PUbwHpNun/epqFvU0YxYE
	zZgVWYo2IKqrSj2mwKaD4s8ARHgjyVoVJ7jENN1UtZ4kYps6OAk8cPTb6iblns01Fd6
	EKMHVY7UxJbzQbGSZBJ3uYD3csYoTLTz+HnA1vN0=
Content-Type: multipart/mixed; boundary="===============2980646669586352630=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] git: upgrading to 2.39.2 SUCCEEDED
Message-ID: <0101018657aff5a6-2fd34325-d82a-4a83-b856-bd1c0db15d20-000000@us-west-2.amazonses.com>
Date: Thu, 16 Feb 2023 00:46:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.16-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 00:46:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177229

--===============2980646669586352630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *git* to *2.39.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-git-upgrade-2.39.1-2.39.2.patch
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
--===============2980646669586352630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/git/git-bash-completion: PV changed from "2.39.1" to "2.39.2"
packages/core2-32-poky-linux/git/git-bash-completion: PKGV changed from 2.39.1 [default] to 2.39.2 [default]
packages/core2-32-poky-linux/git/git-dbg: PKGSIZE changed from 77937404 to 77964384 (+0%)
packages/core2-32-poky-linux/git/git-dbg: PV changed from "2.39.1" to "2.39.2"
packages/core2-32-poky-linux/git/git-dbg: PKGV changed from 2.39.1 [default] to 2.39.2 [default]
packages/core2-32-poky-linux/git/git-dev: PV changed from "2.39.1" to "2.39.2"
packages/core2-32-poky-linux/git/git-dev: PKGV changed from 2.39.1 [default] to 2.39.2 [default]
packages/core2-32-poky-linux/git/git-doc: PV changed from "2.39.1" to "2.39.2"
packages/core2-32-poky-linux/git/git-doc: PKGV changed from 2.39.1 [default] to 2.39.2 [default]
packages/core2-32-poky-linux/git/git-locale: PV changed from "2.39.1" to "2.39.2"
packages/core2-32-poky-linux/git/git-locale: PKGV changed from 2.39.1 [default] to 2.39.2 [default]
packages/core2-32-poky-linux/git/git-perltools: PV changed from "2.39.1" to "2.39.2"
packages/core2-32-poky-linux/git/git-perltools: PKGV changed from 2.39.1 [default] to 2.39.2 [default]
packages/core2-32-poky-linux/git/git-src: PKGSIZE changed from 8951005 to 8953442 (+0%)
packages/core2-32-poky-linux/git/git-src: PV changed from "2.39.1" to "2.39.2"
packages/core2-32-poky-linux/git/git-src: PKGV changed from 2.39.1 [default] to 2.39.2 [default]
packages/core2-32-poky-linux/git/git-staticdev: PV changed from "2.39.1" to "2.39.2"
packages/core2-32-poky-linux/git/git-staticdev: PKGV changed from 2.39.1 [default] to 2.39.2 [default]
packages/core2-32-poky-linux/git/git-tk: PV changed from "2.39.1" to "2.39.2"
packages/core2-32-poky-linux/git/git-tk: PKGV changed from 2.39.1 [default] to 2.39.2 [default]
packages/core2-32-poky-linux/git/git: PV changed from "2.39.1" to "2.39.2"
packages/core2-32-poky-linux/git/git: PKGV changed from 2.39.1 [default] to 2.39.2 [default]
packages/core2-32-poky-linux/git/gitweb: PV changed from "2.39.1" to "2.39.2"
packages/core2-32-poky-linux/git/gitweb: PKGV changed from 2.39.1 [default] to 2.39.2 [default]
packages/core2-32-poky-linux/git: PV changed from "2.39.1" to "2.39.2"
packages/core2-32-poky-linux/git: PKGV changed from 2.39.1 [default] to 2.39.2 [default]
packages/core2-32-poky-linux/git: SRC_URI changed from "https://cdn.kernel.org/pub/software/scm/git/git-2.39.1.tar.gz;name=tarball file://fixsort.patch file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch" to "https://cdn.kernel.org/pub/software/scm/git/git-2.39.2.tar.gz;name=tarball file://fixsort.patch file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch"

--===============2980646669586352630==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-git-upgrade-2.39.1-2.39.2.patch"

RnJvbSBiZDg5ZjFlZTliY2I0ZTBlODU1YzFhNjZjNzVjZjJhYjE1YTM0YTA0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgRmViIDIwMjMgMTU6MDA6NTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
aXQ6IHVwZ3JhZGUgMi4zOS4xIC0+IDIuMzkuMgoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
Z2l0L3tnaXRfMi4zOS4xLmJiID0+IGdpdF8yLjM5LjIuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2dpdC97Z2l0XzIuMzkuMS5iYiA9PiBnaXRfMi4zOS4yLmJifSAoOTglKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0XzIuMzkuMS5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9naXQvZ2l0XzIuMzkuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdF8yLjM5LjEuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0XzIuMzkuMi5iYgppbmRleCBkODEzN2RmNTYx
Li4yMjJlNTQ1ZjYwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdF8y
LjM5LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXRfMi4zOS4yLmJiCkBA
IC0xNjgsNCArMTY4LDQgQEAgRVhUUkFfT0VDT05GICs9ICJhY19jdl9zbnByaW50Zl9yZXR1cm5z
X2JvZ3VzPW5vIFwKICAgICAgICAgICAgICAgICAgIgogRVhUUkFfT0VNQUtFICs9ICJOT19HRVRU
RVhUPTEiCiAKLVNSQ19VUklbdGFyYmFsbC5zaGEyNTZzdW1dID0gImFlOGQzNDI3ZTRjY2Q2Nzdh
YmM5MzFmMTYxODNjMGVjOTUzZTNiZmNkODY2NDkzNjAxMzUxZTA0YTJiOTczOTgiCitTUkNfVVJJ
W3RhcmJhbGwuc2hhMjU2c3VtXSA9ICJmYjY4MDdkMWViNDA5NGJiMjM0OWFiOTdkMjAzZmUxZTZj
M2ViMjhhZjczZWEzOTFkZWNmYmQzYTAzYzAyZTg1IgotLSAKMi4zNy4zCgo=

--===============2980646669586352630==--

