Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A7A1C7EE37
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:41 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.7527.1685693431863737309
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=I+i1HJpu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101887b289318-120b4c4a-ef46-4179-9156-803d852fcd0f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693436;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ikk3dlFoqCYtryHHjLUAVzqTBiNyOxMvZ4s81TXcN8I=;
	b=I+i1HJpuYg0/pxhZgAVSS2apXP1fZQfAJBFKGIdmBULGJhpPzHw+FwArDKcRHakK
	tX5jna2qBL/mN8cQbagQoRrNH79jOp0ty7ZXULIbVV1tEN3QcVuYnxleNQ0QleT/J5U
	IoVCN978whjWkunCGGwYTi0u/MhlEnLC6/8X0a58=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693436;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ikk3dlFoqCYtryHHjLUAVzqTBiNyOxMvZ4s81TXcN8I=;
	b=gwrbGi9B2+SGLWAk3M66aYkZL2kAeunDDF1DIK8Oz5bEARqwjoPBKkaliWyZncV1
	UWu8cwy70i7e/6gOig0dG+Hn9njYVcm5We+aECk8h86pJpeouRa3pJZEa6vtdijXmNs
	d0ciynWd9EdD6gU2JbRBeLTNK1Lx+QgpybGoc7LI=
Content-Type: multipart/mixed; boundary="===============8119004529813580958=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxslt: upgrading to 1.1.38 SUCCEEDED
Message-ID: <010101887b289318-120b4c4a-ef46-4179-9156-803d852fcd0f-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182283

--===============8119004529813580958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxslt* to *1.1.38* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxslt-upgrade-1.1.37-1.1.38.patch
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
--===============8119004529813580958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libxslt/libxslt: FILELIST: removed "/usr/lib/libxslt.so.1.1.37 /usr/lib/libexslt.so.0.8.20", added "/usr/lib/libxslt.so.1.1.38 /usr/lib/libexslt.so.0.8.21"
Changes to packages/core2-32-poky-linux/libxslt (sysroot):
  /usr/lib/libexslt.so.0 changed symlink target from libexslt.so.0.8.20 to libexslt.so.0.8.21
  /usr/lib/libexslt.so changed symlink target from libexslt.so.0.8.20 to libexslt.so.0.8.21
  /usr/lib/libxslt.so.1 changed symlink target from libxslt.so.1.1.37 to libxslt.so.1.1.38
  /usr/lib/libxslt.so changed symlink target from libxslt.so.1.1.37 to libxslt.so.1.1.38
  /usr/lib/libexslt.so.0.8.20 moved to /usr/lib/libexslt.so.0.8.21
  /usr/lib/libxslt.so.1.1.37 moved to /usr/lib/libxslt.so.1.1.38

--===============8119004529813580958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libxslt: PV changed from "1.1.37" to "1.1.38"
packages/core2-32-poky-linux/libxslt: PKGV changed from 1.1.37 [default] to 1.1.38 [default]
packages/core2-32-poky-linux/libxslt: SRC_URI changed from "https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.37.tar.xz" to "https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.38.tar.xz"
packages/core2-32-poky-linux/libxslt/libxslt-bin: PV changed from "1.1.37" to "1.1.38"
packages/core2-32-poky-linux/libxslt/libxslt-bin: PKGV changed from 1.1.37 [default] to 1.1.38 [default]
packages/core2-32-poky-linux/libxslt/libxslt-dbg: PKGSIZE changed from 874096 to 870384 (-0%)
packages/core2-32-poky-linux/libxslt/libxslt-dbg: PV changed from "1.1.37" to "1.1.38"
packages/core2-32-poky-linux/libxslt/libxslt-dbg: PKGV changed from 1.1.37 [default] to 1.1.38 [default]
packages/core2-32-poky-linux/libxslt/libxslt-dbg: FILELIST: removed "/usr/lib/.debug/libxslt.so.1.1.37 /usr/lib/.debug/libexslt.so.0.8.20", added "/usr/lib/.debug/libexslt.so.0.8.21 /usr/lib/.debug/libxslt.so.1.1.38"
packages/core2-32-poky-linux/libxslt/libxslt-dev: PKGSIZE changed from 133900 to 134366 (+0%)
packages/core2-32-poky-linux/libxslt/libxslt-dev: PV changed from "1.1.37" to "1.1.38"
packages/core2-32-poky-linux/libxslt/libxslt-dev: PKGV changed from 1.1.37 [default] to 1.1.38 [default]
packages/core2-32-poky-linux/libxslt/libxslt-doc: PKGSIZE changed from 602412 to 605519 (+1%)
packages/core2-32-poky-linux/libxslt/libxslt-doc: PV changed from "1.1.37" to "1.1.38"
packages/core2-32-poky-linux/libxslt/libxslt-doc: PKGV changed from 1.1.37 [default] to 1.1.38 [default]
packages/core2-32-poky-linux/libxslt/libxslt-locale: PV changed from "1.1.37" to "1.1.38"
packages/core2-32-poky-linux/libxslt/libxslt-locale: PKGV changed from 1.1.37 [default] to 1.1.38 [default]
packages/core2-32-poky-linux/libxslt/libxslt-src: PKGSIZE changed from 1286109 to 1297537 (+1%)
packages/core2-32-poky-linux/libxslt/libxslt-src: PV changed from "1.1.37" to "1.1.38"
packages/core2-32-poky-linux/libxslt/libxslt-src: PKGV changed from 1.1.37 [default] to 1.1.38 [default]
packages/core2-32-poky-linux/libxslt/libxslt-staticdev: PV changed from "1.1.37" to "1.1.38"
packages/core2-32-poky-linux/libxslt/libxslt-staticdev: PKGV changed from 1.1.37 [default] to 1.1.38 [default]
packages/core2-32-poky-linux/libxslt/libxslt: PV changed from "1.1.37" to "1.1.38"
packages/core2-32-poky-linux/libxslt/libxslt: PKGV changed from 1.1.37 [default] to 1.1.38 [default]
packages/core2-32-poky-linux/libxslt/libxslt: FILELIST: removed "/usr/lib/libexslt.so.0.8.20 /usr/lib/libxslt.so.1.1.37", added "/usr/lib/libxslt.so.1.1.38 /usr/lib/libexslt.so.0.8.21"
Changes to packages/core2-32-poky-linux/libxslt (sysroot):
  /usr/lib/libexslt.so.0 changed symlink target from libexslt.so.0.8.20 to libexslt.so.0.8.21
  /usr/lib/libexslt.so changed symlink target from libexslt.so.0.8.20 to libexslt.so.0.8.21
  /usr/lib/libxslt.so.1 changed symlink target from libxslt.so.1.1.37 to libxslt.so.1.1.38
  /usr/lib/libxslt.so changed symlink target from libxslt.so.1.1.37 to libxslt.so.1.1.38
  /usr/lib/libexslt.so.0.8.20 moved to /usr/lib/libexslt.so.0.8.21
  /usr/lib/libxslt.so.1.1.37 moved to /usr/lib/libxslt.so.1.1.38

--===============8119004529813580958==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxslt-upgrade-1.1.37-1.1.38.patch"

RnJvbSA1OTAxNDcyNjA1ZjNiMDUwNzA3ZjczM2Y3NWZjNWYzMGQzNDI1MDMwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMiBKdW4gMjAyMyAwNzowODoyNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnhzbHQ6IHVwZ3JhZGUgMS4xLjM3IC0+IDEuMS4zOAoKLS0tCiAuLi4vbGlieHNsdC97bGlieHNs
dF8xLjEuMzcuYmIgPT4gbGlieHNsdF8xLjEuMzguYmJ9ICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJ4c2x0L3tsaWJ4c2x0XzEuMS4zNy5iYiA9PiBsaWJ4c2x0XzEuMS4z
OC5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJ4c2x0L2xp
YnhzbHRfMS4xLjM3LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlieHNsdC9saWJ4c2x0XzEu
MS4zOC5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9saWJ4c2x0L2xpYnhzbHRfMS4xLjM3LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9saWJ4c2x0L2xpYnhzbHRfMS4xLjM4LmJiCmluZGV4IDM2MWJiMGY4ZGMuLmJmMzVhOTRi
N2YgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnhzbHQvbGlieHNsdF8xLjEu
MzcuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlieHNsdC9saWJ4c2x0XzEuMS4zOC5i
YgpAQCAtMTUsNyArMTUsNyBAQCBERVBFTkRTID0gImxpYnhtbDIiCiAKIFNSQ19VUkkgPSAiaHR0
cHM6Ly9kb3dubG9hZC5nbm9tZS5vcmcvc291cmNlcy9saWJ4c2x0LzEuMS9saWJ4c2x0LSR7UFZ9
LnRhci54eiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjNhNGIyN2RjODAyN2NjZDYxNDY3MjU5
NTAzMzZmMWVjNTIwOTI4ZjMyMGYxNDRlYjVmYTc5OTBhZTYxMjNhYjQiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiMWYzMjQ1MDQyNTgxOWEwOWFjYWZmMmFiN2E1YTdmOGEyZWM3OTU2ZTUwNWQ3YmVl
YjQ1ZTg0M2QwZTFlY2FiMSIKIAogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAibGlieHNsdC0oP1A8
cHZlcj5cZCsoXC5cZCspKylcLnRhciIKIAotLSAKMi4zOS4yCgo=

--===============8119004529813580958==--

