Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BCA2C54EBD
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 20:46:07 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.20659.1672605966276764982
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 12:46:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=cfPz6veF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101856f159cc4-890a77de-ba5d-409a-ab5b-5a926d59d73d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1672605965;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HgJUrBBLJqoi1xjUcWHqF8Plk+Hyokvec3UoAUUq+AY=;
	b=cfPz6veF+LnkgltxERC5gu+TWaTmJH9LiRlquiDzDsTURz0HNjBP4Ju762vjE6ln
	MuzcvTApkI/odoBKm4oD3DF91eqyojJRf6Mn0iM8XfLgOJBlYEkkhjpyDtEREBionUk
	tK/pmktx5TRm3meB0kBc96/38IcySoMjoOlIQoI8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1672605965;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HgJUrBBLJqoi1xjUcWHqF8Plk+Hyokvec3UoAUUq+AY=;
	b=XpqyoyLxCd3LDMwnMsY6ZIoXEI5Ryfw3wPhLcR6pWtWdXBa59UkSvdcoUnBBlaTy
	mkz5/bVs4wsCYwH67UzPD1+uDkXMpK/79KgczYE8SEFhUjKDS1sUbhAmOGlhMvfRSqt
	+twTceRMXW0L61PD4yRhciN7Dy5S0eUKupR6mIkk=
Content-Type: multipart/mixed; boundary="===============7959536984391484117=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] meson: upgrading to 1.0.0 SUCCEEDED
Message-ID: <010101856f159cc4-890a77de-ba5d-409a-ab5b-5a926d59d73d-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jan 2023 20:46:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 20:46:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175239

--===============7959536984391484117==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *meson* to *1.0.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-meson-upgrade-0.64.0-1.0.0.patch
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
--===============7959536984391484117==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/meson (sysroot):
  /usr/lib/python3.11/site-packages/meson-1.0.0.dist-info was added
  /usr/lib/python3.11/site-packages/meson-1.0.0.dist-info/COPYING was added
  /usr/lib/python3.11/site-packages/meson-1.0.0.dist-info/entry_points.txt was added
  /usr/lib/python3.11/site-packages/meson-1.0.0.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/meson-1.0.0.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/meson-1.0.0.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/meson-1.0.0.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/meson-0.64.0.dist-info was removed
  /usr/lib/python3.11/site-packages/meson-0.64.0.dist-info/COPYING was removed
  /usr/lib/python3.11/site-packages/meson-0.64.0.dist-info/entry_points.txt was removed
  /usr/lib/python3.11/site-packages/meson-0.64.0.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/meson-0.64.0.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/meson-0.64.0.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/meson-0.64.0.dist-info/WHEEL was removed

--===============7959536984391484117==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-meson-upgrade-0.64.0-1.0.0.patch"

RnJvbSBmY2VhYWRlMDk5MDYxMzI5MGIwYzM3MDYzOWFlMmJmNDljOGJjOTk1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKYW4gMjAyMyAwNzozMjo0NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1l
c29uOiB1cGdyYWRlIDAuNjQuMCAtPiAxLjAuMAoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
bWVzb24ve21lc29uXzAuNjQuMC5iYiA9PiBtZXNvbl8xLjAuMC5iYn0gfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvbWVzb24ve21lc29uXzAuNjQuMC5iYiA9PiBtZXNvbl8xLjAuMC5iYn0gKDk4
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb25fMC42NC4w
LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uXzEuMC4wLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNv
bl8wLjY0LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbl8x
LjAuMC5iYgppbmRleCAzNGEwNGQ1MmFiLi5hNzc0MGNjNmRkIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb25fMC42NC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9tZXNvbi9tZXNvbl8xLjAuMC5iYgpAQCAtMTcsNyArMTcsNyBAQCBTUkNfVVJJID0g
IiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC8ke1BWfS9tZXNvbi0ke1BWfS50YXIuZ3ogXAog
ICAgICAgICAgICBmaWxlOi8vMDAwMi1TdXBwb3J0LWJ1aWxkaW5nLWFsbGFyY2gtcmVjaXBlcy1h
Z2Fpbi5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLUNoZWNrLWZvci1jbGFuZy1iZWZv
cmUtZ3Vlc3NpbmctZ2NjLW9yLWxjYy5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICJjNWUyN2UwOTFjMmEzNWI5MDQ5ZTE1MmE2NTM1MDQ1ZWJiZDA1NzI1M2FlYjY3
ODU2ZGU2ZWNiYjdiOTE3YmFiIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImFhNTBhNGJhNDU1N2My
NWU3ZDQ4NDQ2YWJmZGU4NTc5NTdkY2RmNTgzODVmZmZiZTY3MGJhMGU4ZWZhY2NlMDUiCiAKIGlu
aGVyaXQgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YSBnaXRodWItcmVsZWFzZXMKIAotLSAK
Mi4zNy4zCgo=

--===============7959536984391484117==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/meson: PV changed from "0.64.0" to "1.0.0"
packages/core2-32-poky-linux/meson: SRC_URI changed from "https://github.com/mesonbuild/meson/releases//download/0.64.0/meson-0.64.0.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://disable-rpath-handling.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch file://0001-Check-for-clang-before-guessing-gcc-or-lcc.patch" to "https://github.com/mesonbuild/meson/releases//download/1.0.0/meson-1.0.0.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://disable-rpath-handling.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch file://0001-Check-for-clang-before-guessing-gcc-or-lcc.patch"
packages/core2-32-poky-linux/meson: PKGV changed from 0.64.0 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/meson/meson-dbg: PV changed from "0.64.0" to "1.0.0"
packages/core2-32-poky-linux/meson/meson-dbg: PKGV changed from 0.64.0 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/meson/meson-dev: PV changed from "0.64.0" to "1.0.0"
packages/core2-32-poky-linux/meson/meson-dev: PKGV changed from 0.64.0 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/meson/meson-doc: PV changed from "0.64.0" to "1.0.0"
packages/core2-32-poky-linux/meson/meson-doc: PKGSIZE changed from 5345 to 5344 (-0%)
packages/core2-32-poky-linux/meson/meson-doc: PKGV changed from 0.64.0 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/meson/meson-locale: PV changed from "0.64.0" to "1.0.0"
packages/core2-32-poky-linux/meson/meson-locale: PKGV changed from 0.64.0 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/meson/meson-src: PV changed from "0.64.0" to "1.0.0"
packages/core2-32-poky-linux/meson/meson-src: PKGV changed from 0.64.0 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/meson/meson-staticdev: PV changed from "0.64.0" to "1.0.0"
packages/core2-32-poky-linux/meson/meson-staticdev: PKGV changed from 0.64.0 [default] to 1.0.0 [default]
packages/core2-32-poky-linux/meson/meson: PV changed from "0.64.0" to "1.0.0"
packages/core2-32-poky-linux/meson/meson: PKGSIZE changed from 7856254 to 7899847 (+1%)
packages/core2-32-poky-linux/meson/meson: PKGV changed from 0.64.0 [default] to 1.0.0 [default]
Changes to packages/core2-32-poky-linux/meson (sysroot):
  /usr/lib/python3.11/site-packages/meson-1.0.0.dist-info was added
  /usr/lib/python3.11/site-packages/meson-1.0.0.dist-info/COPYING was added
  /usr/lib/python3.11/site-packages/meson-1.0.0.dist-info/entry_points.txt was added
  /usr/lib/python3.11/site-packages/meson-1.0.0.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/meson-1.0.0.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/meson-1.0.0.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/meson-1.0.0.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/meson-0.64.0.dist-info was removed
  /usr/lib/python3.11/site-packages/meson-0.64.0.dist-info/COPYING was removed
  /usr/lib/python3.11/site-packages/meson-0.64.0.dist-info/entry_points.txt was removed
  /usr/lib/python3.11/site-packages/meson-0.64.0.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/meson-0.64.0.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/meson-0.64.0.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/meson-0.64.0.dist-info/WHEEL was removed

--===============7959536984391484117==--

