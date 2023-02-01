Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D641C636CD
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:23 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.29999.1675272853476625518
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=X8J1AVjI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101860e0b138e-5bcac5fd-7112-4cd6-8451-8559f918db38-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272852;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HYIOGJnmdF6NiRYz4vyXdEvhNskIbSfYbERNvZHj6pM=;
	b=X8J1AVjIJXUqJV25vqgcV6uxLhQ3smr7kH7E219HT3idE4o8AxTHlCX7Lefv2EnO
	lrd/5qCun55eJp8PoxCxyMzf2kEqo8IsLmZ0jJnvHKm72K0xyOkCEHr6UwfDp61ekuT
	x8CqANJN8EKeB8PkOAiWACusNcHi/wC2U87oFsC8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272852;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HYIOGJnmdF6NiRYz4vyXdEvhNskIbSfYbERNvZHj6pM=;
	b=PPNP+mtKlZ+EBx462dXGUqh7U7zs86s+mr7wtWZ4zxBvy8nVy995aMZIAT3IyThx
	deOalSIeoMbtnUvEtKwrHJqFOv6Us9f44ZDNYNKb/uVJZ8ZNz4PqRZ2O/AZgT+mIpzS
	OL5PTwkInGY5r8NZ7etjFxG91eU76qRzC8V3PaW4=
Content-Type: multipart/mixed; boundary="===============1492277282617166952=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangrc.fnst@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ell: upgrading to 0.56 SUCCEEDED
Message-ID: <010101860e0b138e-5bcac5fd-7112-4cd6-8451-8559f918db38-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176570

--===============1492277282617166952==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ell* to *0.56* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ell-upgrade-0.55-0.56.patch
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
--===============1492277282617166952==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ell-upgrade-0.55-0.56.patch"

RnJvbSAwNDQyZGMzYzMyM2FlMmQ2YTY4YWYyZWQwYmMyMTczYjc4N2RlNDlhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAwNjo1MDo0NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVs
bDogdXBncmFkZSAwLjU1IC0+IDAuNTYKCi0tLQogbWV0YS9yZWNpcGVzLWNvcmUvZWxsL3tlbGxf
MC41NS5iYiA9PiBlbGxfMC41Ni5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS9lbGwve2VsbF8w
LjU1LmJiID0+IGVsbF8wLjU2LmJifSAoODklKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1j
b3JlL2VsbC9lbGxfMC41NS5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL2VsbC9lbGxfMC41Ni5iYgpz
aW1pbGFyaXR5IGluZGV4IDg5JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29yZS9lbGwvZWxs
XzAuNTUuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL2VsbC9lbGxfMC41Ni5iYgppbmRl
eCA3MTg0NzAxZTRlLi4wYWNlNjIyODM1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9l
bGwvZWxsXzAuNTUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZWxsL2VsbF8wLjU2LmJiCkBA
IC0xNSw3ICsxNSw3IEBAIERFUEVORFMgPSAiZGJ1cyIKIGluaGVyaXQgYXV0b3Rvb2xzIHBrZ2Nv
bmZpZwogCiBTUkNfVVJJID0gImh0dHBzOi8vbWlycm9ycy5lZGdlLmtlcm5lbC5vcmcvcHViL2xp
bnV4L2xpYnMvJHtCUE59LyR7QlBOfS0ke1BWfS50YXIueHoiCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiYTdlMWZkM2UxM2Q5MDgzZjgwZWI5Nzg3NTQ2YWRkNDlmYmE1YzNkOWU5ZjE2NmIwNmUyZmY5
ZmQ4MDMwZGM2ZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI1OGViOGIyYjY0MDg3Zjc0NzlkNWRi
NmE4MzBhMDY1NmM1MzZkOTNlNWYxMWQ0YzlhNDQ0M2NlODc2MGExYjYzIgogCiBkb19jb25maWd1
cmU6cHJlcGVuZCAoKSB7CiAgICAgbWtkaXIgLXAgJHtTfS9idWlsZC1hdXgKLS0gCjIuMzcuMwoK

--===============1492277282617166952==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ell/ell-dbg: PV changed from "0.55" to "0.56"
packages/core2-32-poky-linux/ell/ell-dbg: PKGSIZE changed from 1401000 to 1403128 (+0%)
packages/core2-32-poky-linux/ell/ell-dbg: PKGV changed from 0.55 [default] to 0.56 [default]
packages/core2-32-poky-linux/ell/ell-dev: PV changed from "0.55" to "0.56"
packages/core2-32-poky-linux/ell/ell-dev: PKGSIZE changed from 149041 to 149226 (+0%)
packages/core2-32-poky-linux/ell/ell-dev: PKGV changed from 0.55 [default] to 0.56 [default]
packages/core2-32-poky-linux/ell/ell-doc: PV changed from "0.55" to "0.56"
packages/core2-32-poky-linux/ell/ell-doc: PKGV changed from 0.55 [default] to 0.56 [default]
packages/core2-32-poky-linux/ell/ell-locale: PV changed from "0.55" to "0.56"
packages/core2-32-poky-linux/ell/ell-locale: PKGV changed from 0.55 [default] to 0.56 [default]
packages/core2-32-poky-linux/ell/ell-src: PV changed from "0.55" to "0.56"
packages/core2-32-poky-linux/ell/ell-src: PKGSIZE changed from 1471123 to 1472970 (+0%)
packages/core2-32-poky-linux/ell/ell-src: PKGV changed from 0.55 [default] to 0.56 [default]
packages/core2-32-poky-linux/ell/ell-staticdev: PV changed from "0.55" to "0.56"
packages/core2-32-poky-linux/ell/ell-staticdev: PKGV changed from 0.55 [default] to 0.56 [default]
packages/core2-32-poky-linux/ell/ell: PV changed from "0.55" to "0.56"
packages/core2-32-poky-linux/ell/ell: PKGV changed from 0.55 [default] to 0.56 [default]
packages/core2-32-poky-linux/ell: SRC_URI changed from "https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.55.tar.xz" to "https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.56.tar.xz"
packages/core2-32-poky-linux/ell: PV changed from "0.55" to "0.56"
packages/core2-32-poky-linux/ell: PKGV changed from 0.55 [default] to 0.56 [default]

--===============1492277282617166952==--

