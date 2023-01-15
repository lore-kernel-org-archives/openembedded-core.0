Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B9D3C71133
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 18:02:31 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.145823.1673805742614116257
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 10:02:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=UaRL8ju6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010185b698c7a1-4ecf584b-5fc8-4685-9759-80fd3dce271d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1673805744;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=j2KlVhbRGl1/GO2+TjubS11QEwvoHO/UWKJ+TrFzO5A=;
	b=UaRL8ju6ngDaNUafx+fI1gb0Oj0C2zDyPnnKKewXllMtxC/d6uxXW3gBOoHKEk2Y
	W4rEVVbRtWWLHqJUxo/Y61BK4FmfqIKDuWElqph5QYtm7lW8bQnp4zEMeaCX+NO20/Q
	pQpzPMowMAXqhYo7Es47WM+CHQUn55dCauSDfVyg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1673805744;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=j2KlVhbRGl1/GO2+TjubS11QEwvoHO/UWKJ+TrFzO5A=;
	b=KEpJopuy+YKnh6bBreHMz+jSxvQGDDbhohMaTq3pVeoXKGuoyCWPPkzzToVaOR4C
	A1yQB99HnB5dwHyshIXzE90Xhpv1cSVHG+8AFiZyin9lBqOf6IWYKDnJ8lNOKonZEj0
	AxZ0oZzC3XNqBOACodw53YRmLDyG5DPYO1aL9H4M=
Content-Type: multipart/mixed; boundary="===============6858959205083716126=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] man-db: upgrading to 2.11.2 SUCCEEDED
Message-ID: <01010185b698c7a1-4ecf584b-5fc8-4685-9759-80fd3dce271d-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jan 2023 18:02:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 18:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175927

--===============6858959205083716126==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *man-db* to *2.11.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-man-db-upgrade-2.11.1-2.11.2.patch
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
--===============6858959205083716126==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/man-db: SRC_URI changed from "https://download.savannah.nongnu.org/releases/man-db/man-db-2.11.1.tar.xz file://99_mandb file://0001-man-Move-local-variable-declaration-to-function-scop.patch file://man_db.conf-avoid-multilib-install-file-conflict.patch" to "https://download.savannah.nongnu.org/releases/man-db/man-db-2.11.2.tar.xz file://99_mandb file://0001-man-Move-local-variable-declaration-to-function-scop.patch file://man_db.conf-avoid-multilib-install-file-conflict.patch"
packages/core2-32-poky-linux/man-db: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db: PACKAGES: added "man-db-locale-ka"
packages/core2-32-poky-linux/man-db: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db-dbg: PKGSIZE changed from 2169004 to 2169616 (+0%)
packages/core2-32-poky-linux/man-db/man-db-dbg: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db-dbg: FILELIST: removed "/usr/lib/man-db/.debug/libmandb-2.11.1.so /usr/lib/man-db/.debug/libman-2.11.1.so", added "/usr/lib/man-db/.debug/libmandb-2.11.2.so /usr/lib/man-db/.debug/libman-2.11.2.so"
packages/core2-32-poky-linux/man-db/man-db-dbg: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db-dev: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db-dev: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db-doc: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db-doc: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db-locale-af: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-af: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db-locale-ast: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-ast: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db-locale-be: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-be: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db-locale-bg: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-bg: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db-locale-ca: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-ca: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db-locale-cs: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-cs: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db-locale-da: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-da: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db-locale-de: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-de: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db-locale-el: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-el: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db-locale-eo: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-eo: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db-locale-es: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-es: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db-locale-et: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-et: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db-locale-eu: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-eu: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db-locale-fi: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-fi: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db-locale-fr: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-fr: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db-locale-ga: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-ga: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db-locale-gl: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-gl: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db-locale-hu: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-hu: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db-locale-id: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-id: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db-locale-it: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-it: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db-locale-ja: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-ja: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db-locale-ko: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-ko: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db-locale-ms: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-ms: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db-locale-nb: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-nb: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db-locale-nl: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-nl: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db-locale-pl: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-pl: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db-locale-pt-br: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-pt-br: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db-locale-pt: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-pt: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db-locale-ro: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-ro: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db-locale-ru: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-ru: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db-locale-rw: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-rw: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db-locale-sk: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-sk: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db-locale-sl: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-sl: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db-locale-sr: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-sr: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db-locale-sv: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-sv: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db-locale-tr: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-tr: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db-locale-uk: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-uk: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db-locale-vi: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-vi: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db-locale-zh-cn: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-zh-cn: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db-locale-zh-tw: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db-locale-zh-tw: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db-src: PKGSIZE changed from 2980298 to 2980753 (+0%)
packages/core2-32-poky-linux/man-db/man-db-src: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db-src: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db-staticdev: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db-staticdev: PV changed from "2.11.1" to "2.11.2"
packages/core2-32-poky-linux/man-db/man-db: PKGV changed from 2.11.1 [default] to 2.11.2 [default]
packages/core2-32-poky-linux/man-db/man-db: FILELIST: removed "/usr/lib/man-db/libmandb-2.11.1.so /usr/lib/man-db/libman-2.11.1.so", added "/usr/lib/man-db/libman-2.11.2.so /usr/lib/man-db/libmandb-2.11.2.so"
packages/core2-32-poky-linux/man-db/man-db: PV changed from "2.11.1" to "2.11.2"
Changes to packages/core2-32-poky-linux/man-db (sysroot):
  /usr/lib/man-db/libmandb.so changed symlink target from libmandb-2.11.1.so to libmandb-2.11.2.so
  /usr/lib/man-db/libman.so changed symlink target from libman-2.11.1.so to libman-2.11.2.so
  /usr/lib/man-db/libman-2.11.1.so moved to /usr/lib/man-db/libman-2.11.2.so
  /usr/lib/man-db/libmandb-2.11.1.so moved to /usr/lib/man-db/libmandb-2.11.2.so

--===============6858959205083716126==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/man-db: PACKAGES: added "man-db-locale-ka"
packages/core2-32-poky-linux/man-db/man-db: FILELIST: removed "/usr/lib/man-db/libmandb-2.11.1.so /usr/lib/man-db/libman-2.11.1.so", added "/usr/lib/man-db/libmandb-2.11.2.so /usr/lib/man-db/libman-2.11.2.so"
Changes to packages/core2-32-poky-linux/man-db (sysroot):
  /usr/lib/man-db/libmandb.so changed symlink target from libmandb-2.11.1.so to libmandb-2.11.2.so
  /usr/lib/man-db/libman.so changed symlink target from libman-2.11.1.so to libman-2.11.2.so
  /usr/lib/man-db/libman-2.11.1.so moved to /usr/lib/man-db/libman-2.11.2.so
  /usr/lib/man-db/libmandb-2.11.1.so moved to /usr/lib/man-db/libmandb-2.11.2.so

--===============6858959205083716126==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-man-db-upgrade-2.11.1-2.11.2.patch"

RnJvbSAyNDBhYzdmNWNhYzM0YWM3M2E0MTJhY2JhNzA4ZTkyZjAzYTE3OTRkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSmFuIDIwMjMgMTM6NTk6NTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
YW4tZGI6IHVwZ3JhZGUgMi4xMS4xIC0+IDIuMTEuMgoKLS0tCiAuLi4vbWFuLWRiL3ttYW4tZGJf
Mi4xMS4xLmJiID0+IG1hbi1kYl8yLjExLjIuYmJ9ICAgICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvbWFuLWRiL3ttYW4tZGJfMi4xMS4xLmJiID0+IG1hbi1kYl8yLjExLjIu
YmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21hbi1kYi9tYW4t
ZGJfMi4xMS4xLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21hbi1kYi9tYW4tZGJfMi4xMS4y
LmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRl
ZC9tYW4tZGIvbWFuLWRiXzIuMTEuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L21hbi1kYi9tYW4tZGJfMi4xMS4yLmJiCmluZGV4IDJkNTM5YzRhNWIuLmNhMGNiMWEwZTEgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9tYW4tZGIvbWFuLWRiXzIuMTEuMS5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWFuLWRiL21hbi1kYl8yLjExLjIuYmIKQEAgLTEx
LDcgKzExLDcgQEAgU1JDX1VSSSA9ICIke1NBVkFOTkFIX05PTkdOVV9NSVJST1J9L21hbi1kYi9t
YW4tZGItJHtQVn0udGFyLnh6IFwKICAgICAgICAgICAgZmlsZTovLzk5X21hbmRiIFwKICAgICAg
ICAgICAgZmlsZTovLzAwMDEtbWFuLU1vdmUtbG9jYWwtdmFyaWFibGUtZGVjbGFyYXRpb24tdG8t
ZnVuY3Rpb24tc2NvcC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly9tYW5fZGIuY29uZi1hdm9p
ZC1tdWx0aWxpYi1pbnN0YWxsLWZpbGUtY29uZmxpY3QucGF0Y2giCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiMmVhYmFhNTI1MTM0OTg0N2RlOWM5ZTQzYzYzNGQ5ODZjYmNjNmY4NzY0MmQxZDljYjg2
MDhlYzE4NDg3YjZjYyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJjZmZhMWVlNGU5NzRiZTc4NjQ2
YzQ2NTA4ZTZkZDJmMzdlN2M1ODlhYWFiMjkzOGNjMTA2NGYwNThmZWY5ZjhkIgogCiBERVBFTkRT
ID0gImxpYnBpcGVsaW5lIGdkYm0gZ3JvZmYtbmF0aXZlIGJhc2UtcGFzc3dkIgogUkRFUEVORFM6
JHtQTn0gKz0gImJhc2UtcGFzc3dkIgotLSAKMi4zNy4zCgo=

--===============6858959205083716126==--

