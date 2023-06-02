Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2CDACA9EA9
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:43 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.7524.1685693431276016904
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=S6BM04Mk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101887b288a66-a73e5d05-9172-42cc-aff7-3484db2db4ff-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693434;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pkY27VKX43dkkH6aX4uU1Ik/+iwEZF+9jVj244iQn/w=;
	b=S6BM04MkhZ9UCqPxOTvbfoukZxVMyk7PlUA9+UgdAP3MRRswloxcfwTBGsaTCGqS
	+Et6Z/F6Pkq8jvWf98Yz4TYBoTB+M3JuBt2YVMPi5x9I8Vw0Hx+dkNI0LgkhFh5ak7D
	upwvlPjc0p/YluCVoQdi7mO/rW8Wyn12VMEKKBik=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693434;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pkY27VKX43dkkH6aX4uU1Ik/+iwEZF+9jVj244iQn/w=;
	b=A+o2bUlCSHe00jXV9kLhD13iX8dAXTtzMbQrYjCJpmGDdgeqkxgTkd/T2rOHNaSx
	n7FWHqx5Qio4fkp2QBhGepaxAHAvW3jmhvkLbvctZjGZUN6Rf3oYEeSNW6fqR0+QKWW
	m6YVdLGAnCqjEWFVe1pDGiYfMyaMrVaBixhi/E50=
Content-Type: multipart/mixed; boundary="===============4234802176999941888=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glslang: upgrading to 1.3.250.0 SUCCEEDED
Message-ID: <010101887b288a66-a73e5d05-9172-42cc-aff7-3484db2db4ff-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182231

--===============4234802176999941888==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glslang* to *1.3.250.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glslang-upgrade-1.3.243.0-1.3.250.0.patch
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
--===============4234802176999941888==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glslang-upgrade-1.3.243.0-1.3.250.0.patch"

RnJvbSA5Y2M2MGExYjNiYjY5Njg1ZGI0YTdhNTIwNDJmZjk4NjdhMjZiYjdjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAyMzo0MToxMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGds
c2xhbmc6IHVwZ3JhZGUgMS4zLjI0My4wIC0+IDEuMy4yNTAuMAoKLS0tCiAuLi4vZ2xzbGFuZy97
Z2xzbGFuZ18xLjMuMjQzLjAuYmIgPT4gZ2xzbGFuZ18xLjMuMjUwLjAuYmJ9ICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy97Z2xzbGFuZ18xLjMuMjQzLjAuYmIgPT4gZ2xz
bGFuZ18xLjMuMjUwLjAuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjQzLjAuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
Z2xzbGFuZy9nbHNsYW5nXzEuMy4yNTAuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy9nbHNsYW5nXzEuMy4yNDMuMC5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjUwLjAu
YmIKaW5kZXggYzUwZDY3YTY1Mi4uNmU5YzY2NmQ0NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjQzLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjUwLjAuYmIKQEAgLTgsNyArOCw3IEBAIEhP
TUVQQUdFID0gImh0dHBzOi8vd3d3Lmtocm9ub3Mub3JnL29wZW5nbGVzL3Nkay90b29scy9SZWZl
cmVuY2UtQ29tcGlsZXIiCiBMSUNFTlNFID0gIkJTRC0zLUNsYXVzZSAmIEJTRC0yLUNsYXVzZSAm
IE1JVCAmIEFwYWNoZS0yLjAgJiBHUEwtMy13aXRoLWJpc29uLWV4Y2VwdGlvbiIKIExJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT0yYTJiNWFjZDdiYzQ4NDQ5NjRjZmRh
NDVmZTgwN2RjMyIKIAotU1JDUkVWID0gIjE0ZTVhMDRlNzAwNTc5NzJlZWY4YTQwZGY0MjJlMzBh
M2I3MGU0YjUiCitTUkNSRVYgPSAiZDE1MTdkNjRjZmNhOTFmNTczYWYxYmY3MzQxZGMzYTUxMTMz
NDljMCIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvZ2xzbGFuZy5n
aXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW4gXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1n
ZW5lcmF0ZS1nbHNsYW5nLXBrZy1jb25maWcucGF0Y2ggXAogICAgICAgICAgICAiCi0tIAoyLjM5
LjIKCg==

--===============4234802176999941888==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libSPVRemapper.so.12.1.0 /usr/lib/libHLSL.so.12.1.0 /usr/lib/libglslang.so.12.1.0 /usr/lib/libglslang-default-resource-limits.so.12.1.0 /usr/lib/libSPIRV.so.12.1.0", added "/usr/lib/libglslang.so.12.2.0 /usr/lib/libSPVRemapper.so.12.2.0 /usr/lib/libglslang-default-resource-limits.so.12.2.0 /usr/lib/libSPIRV.so.12.2.0 /usr/lib/libHLSL.so.12.2.0"
Changes to packages/core2-32-poky-linux/glslang (sysroot):
  /usr/lib/libglslang-default-resource-limits.so.12 changed symlink target from libglslang-default-resource-limits.so.12.1.0 to libglslang-default-resource-limits.so.12.2.0
  /usr/lib/libglslang.so.12 changed symlink target from libglslang.so.12.1.0 to libglslang.so.12.2.0
  /usr/lib/libHLSL.so.12 changed symlink target from libHLSL.so.12.1.0 to libHLSL.so.12.2.0
  /usr/lib/libSPIRV.so.12 changed symlink target from libSPIRV.so.12.1.0 to libSPIRV.so.12.2.0
  /usr/lib/libSPVRemapper.so.12 changed symlink target from libSPVRemapper.so.12.1.0 to libSPVRemapper.so.12.2.0
  /usr/lib/libglslang-default-resource-limits.so.12.1.0 moved to /usr/lib/libglslang-default-resource-limits.so.12.2.0
  /usr/lib/libglslang.so.12.1.0 moved to /usr/lib/libglslang.so.12.2.0
  /usr/lib/libHLSL.so.12.1.0 moved to /usr/lib/libHLSL.so.12.2.0
  /usr/lib/libSPIRV.so.12.1.0 moved to /usr/lib/libSPIRV.so.12.2.0
  /usr/lib/libSPVRemapper.so.12.1.0 moved to /usr/lib/libSPVRemapper.so.12.2.0

--===============4234802176999941888==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/glslang/glslang-dbg: FILELIST: removed "/usr/lib/.debug/libSPIRV.so.12.1.0 /usr/lib/.debug/libSPVRemapper.so.12.1.0 /usr/lib/.debug/libglslang-default-resource-limits.so.12.1.0 /usr/lib/.debug/libHLSL.so.12.1.0 /usr/lib/.debug/libglslang.so.12.1.0", added "/usr/lib/.debug/libglslang-default-resource-limits.so.12.2.0 /usr/lib/.debug/libSPIRV.so.12.2.0 /usr/lib/.debug/libSPVRemapper.so.12.2.0 /usr/lib/.debug/libglslang.so.12.2.0 /usr/lib/.debug/libHLSL.so.12.2.0"
packages/core2-32-poky-linux/glslang/glslang-dbg: PKGV changed from 1.3.243.0 [default] to 1.3.250.0 [default]
packages/core2-32-poky-linux/glslang/glslang-dbg: PKGSIZE changed from 74316304 to 74679108 (+0%)
packages/core2-32-poky-linux/glslang/glslang-dbg: PV changed from "1.3.243.0" to "1.3.250.0"
packages/core2-32-poky-linux/glslang/glslang-dev: PKGV changed from 1.3.243.0 [default] to 1.3.250.0 [default]
packages/core2-32-poky-linux/glslang/glslang-dev: PKGSIZE changed from 1005725 to 1020014 (+1%)
packages/core2-32-poky-linux/glslang/glslang-dev: PV changed from "1.3.243.0" to "1.3.250.0"
packages/core2-32-poky-linux/glslang/glslang-doc: PKGV changed from 1.3.243.0 [default] to 1.3.250.0 [default]
packages/core2-32-poky-linux/glslang/glslang-doc: PV changed from "1.3.243.0" to "1.3.250.0"
packages/core2-32-poky-linux/glslang/glslang-locale: PKGV changed from 1.3.243.0 [default] to 1.3.250.0 [default]
packages/core2-32-poky-linux/glslang/glslang-locale: PV changed from "1.3.243.0" to "1.3.250.0"
packages/core2-32-poky-linux/glslang/glslang-src: PKGV changed from 1.3.243.0 [default] to 1.3.250.0 [default]
packages/core2-32-poky-linux/glslang/glslang-src: PKGSIZE changed from 4789702 to 4821631 (+1%)
packages/core2-32-poky-linux/glslang/glslang-src: PV changed from "1.3.243.0" to "1.3.250.0"
packages/core2-32-poky-linux/glslang/glslang-staticdev: PKGV changed from 1.3.243.0 [default] to 1.3.250.0 [default]
packages/core2-32-poky-linux/glslang/glslang-staticdev: PV changed from "1.3.243.0" to "1.3.250.0"
packages/core2-32-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libHLSL.so.12.1.0 /usr/lib/libglslang.so.12.1.0 /usr/lib/libSPIRV.so.12.1.0 /usr/lib/libSPVRemapper.so.12.1.0 /usr/lib/libglslang-default-resource-limits.so.12.1.0", added "/usr/lib/libglslang.so.12.2.0 /usr/lib/libglslang-default-resource-limits.so.12.2.0 /usr/lib/libHLSL.so.12.2.0 /usr/lib/libSPIRV.so.12.2.0 /usr/lib/libSPVRemapper.so.12.2.0"
packages/core2-32-poky-linux/glslang/glslang: PKGV changed from 1.3.243.0 [default] to 1.3.250.0 [default]
packages/core2-32-poky-linux/glslang/glslang: PKGSIZE changed from 6502327 to 6530999 (+0%)
packages/core2-32-poky-linux/glslang/glslang: PV changed from "1.3.243.0" to "1.3.250.0"
packages/core2-32-poky-linux/glslang: PKGV changed from 1.3.243.0 [default] to 1.3.250.0 [default]
packages/core2-32-poky-linux/glslang: PV changed from "1.3.243.0" to "1.3.250.0"
Changes to packages/core2-32-poky-linux/glslang (sysroot):
  /usr/lib/libglslang-default-resource-limits.so.12 changed symlink target from libglslang-default-resource-limits.so.12.1.0 to libglslang-default-resource-limits.so.12.2.0
  /usr/lib/libglslang.so.12 changed symlink target from libglslang.so.12.1.0 to libglslang.so.12.2.0
  /usr/lib/libHLSL.so.12 changed symlink target from libHLSL.so.12.1.0 to libHLSL.so.12.2.0
  /usr/lib/libSPIRV.so.12 changed symlink target from libSPIRV.so.12.1.0 to libSPIRV.so.12.2.0
  /usr/lib/libSPVRemapper.so.12 changed symlink target from libSPVRemapper.so.12.1.0 to libSPVRemapper.so.12.2.0
  /usr/lib/libglslang-default-resource-limits.so.12.1.0 moved to /usr/lib/libglslang-default-resource-limits.so.12.2.0
  /usr/lib/libglslang.so.12.1.0 moved to /usr/lib/libglslang.so.12.2.0
  /usr/lib/libHLSL.so.12.1.0 moved to /usr/lib/libHLSL.so.12.2.0
  /usr/lib/libSPIRV.so.12.1.0 moved to /usr/lib/libSPIRV.so.12.2.0
  /usr/lib/libSPVRemapper.so.12.1.0 moved to /usr/lib/libSPVRemapper.so.12.2.0

--===============4234802176999941888==--

