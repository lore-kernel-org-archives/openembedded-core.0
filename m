Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA4E1ECAA2D
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 14:18:43 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web09.10893.1663251513145123376
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 07:18:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=iv91S53t;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 010101834183fc46-e1bee952-4d4f-485e-b236-de1ffc3a973f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1663251512;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UrLufOkTjZesbMXJOwZqlDaSisHNAc+GWi4Pkt+VPm8=;
	b=iv91S53t4+JElf4oAcbMBj3101ctHcPiCD7mui2whN2e6S0WPUFPb+qJ5xIoFG6n
	aMjmEq3kOoeb/K4oSCVhfYFL5C7ccSVXw8yRwiD0XDJiZOMPytla3en1MAwUgM7FY3Y
	RAeNBuIym6/RQmPQHuhGH8o1Mke8pHoEFIGEOw14=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1663251512;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UrLufOkTjZesbMXJOwZqlDaSisHNAc+GWi4Pkt+VPm8=;
	b=Op0HLUE+PU7Amc09BSOb/bDUeODEL9a//4BiqipRdp9TFQGq76boAc7HNUmzRyGA
	rBtXW3aKegykkbUYCYDAkZbiJ8UQzaM7our8+0OftQMw2zKf1E981XYsaj7kfOHbmdd
	EWzbln0qwEeNHVWIHjivDQKjS3JtIhYLe4yGkYkk=
Content-Type: multipart/mixed; boundary="===============8300321815866618018=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] meson: upgrading to 0.63.2 SUCCEEDED
Message-ID: 
 <010101834183fc46-e1bee952-4d4f-485e-b236-de1ffc3a973f-000000@us-west-2.amazonses.com>
Date: Thu, 15 Sep 2022 14:18:32 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 14:18:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170714

--===============8300321815866618018==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *meson* to *0.63.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-meson-upgrade-0.63.1-0.63.2.patch
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
--===============8300321815866618018==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/meson (sysroot):
  /usr/lib/python3.10/site-packages/meson-0.63.1.dist-info moved to /usr/lib/python3.10/site-packages/meson-0.63.2.dist-info

--===============8300321815866618018==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/meson: PV changed from "0.63.1" to "0.63.2"
packages/core2-32-poky-linux/meson: SRC_URI changed from "https://github.com/mesonbuild/meson/releases/download/0.63.1/meson-0.63.1.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://disable-rpath-handling.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch file://0001-is_debianlike-always-return-False.patch file://0001-Check-for-clang-before-guessing-gcc-or-lcc.patch" to "https://github.com/mesonbuild/meson/releases/download/0.63.2/meson-0.63.2.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://disable-rpath-handling.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch file://0001-is_debianlike-always-return-False.patch file://0001-Check-for-clang-before-guessing-gcc-or-lcc.patch"
packages/core2-32-poky-linux/meson: PKGV changed from 0.63.1 [default] to 0.63.2 [default]
packages/core2-32-poky-linux/meson/meson-dbg: PV changed from "0.63.1" to "0.63.2"
packages/core2-32-poky-linux/meson/meson-dbg: PKGV changed from 0.63.1 [default] to 0.63.2 [default]
packages/core2-32-poky-linux/meson/meson-dev: PV changed from "0.63.1" to "0.63.2"
packages/core2-32-poky-linux/meson/meson-dev: PKGV changed from 0.63.1 [default] to 0.63.2 [default]
packages/core2-32-poky-linux/meson/meson-doc: PV changed from "0.63.1" to "0.63.2"
packages/core2-32-poky-linux/meson/meson-doc: PKGSIZE changed from 5343 to 5346 (+0%)
packages/core2-32-poky-linux/meson/meson-doc: PKGV changed from 0.63.1 [default] to 0.63.2 [default]
packages/core2-32-poky-linux/meson/meson-locale: PV changed from "0.63.1" to "0.63.2"
packages/core2-32-poky-linux/meson/meson-locale: PKGV changed from 0.63.1 [default] to 0.63.2 [default]
packages/core2-32-poky-linux/meson/meson-src: PV changed from "0.63.1" to "0.63.2"
packages/core2-32-poky-linux/meson/meson-src: PKGV changed from 0.63.1 [default] to 0.63.2 [default]
packages/core2-32-poky-linux/meson/meson-staticdev: PV changed from "0.63.1" to "0.63.2"
packages/core2-32-poky-linux/meson/meson-staticdev: PKGV changed from 0.63.1 [default] to 0.63.2 [default]
packages/core2-32-poky-linux/meson/meson: PV changed from "0.63.1" to "0.63.2"
packages/core2-32-poky-linux/meson/meson: PKGSIZE changed from 5665954 to 5665104 (-0%)
packages/core2-32-poky-linux/meson/meson: PKGV changed from 0.63.1 [default] to 0.63.2 [default]
Changes to packages/core2-32-poky-linux/meson (sysroot):
  /usr/lib/python3.10/site-packages/meson-0.63.1.dist-info moved to /usr/lib/python3.10/site-packages/meson-0.63.2.dist-info

--===============8300321815866618018==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-meson-upgrade-0.63.1-0.63.2.patch"

RnJvbSAyMjk5NjEyM2EyNzllN2FiMjIzNThiMzEwNGIxOGMzOGFmNmZmNTg5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgU2VwIDIwMjIgMDk6MDQ6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
ZXNvbjogdXBncmFkZSAwLjYzLjEgLT4gMC42My4yCgotLS0KIC4uLi9yZWNpcGVzLWRldnRvb2xz
L21lc29uL3ttZXNvbl8wLjYzLjEuYmIgPT4gbWVzb25fMC42My4yLmJifSB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9tZXNvbi97bWVzb25fMC42My4xLmJiID0+IG1lc29uXzAuNjMuMi5iYn0g
KDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb25fMC42
My4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uXzAuNjMuMi5iYgpzaW1p
bGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24v
bWVzb25fMC42My4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVz
b25fMC42My4yLmJiCmluZGV4IDdmNzdhN2RlMzQuLjQwNmY1YmYwNWUgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbl8wLjYzLjEuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL21lc29uL21lc29uXzAuNjMuMi5iYgpAQCAtMTcsNyArMTcsNyBAQCBTUkNf
VVJJID0gImh0dHBzOi8vZ2l0aHViLmNvbS9tZXNvbmJ1aWxkL21lc29uL3JlbGVhc2VzL2Rvd25s
b2FkLyR7UFZ9L21lc29uLSR7UAogICAgICAgICAgICBmaWxlOi8vMDAwMS1pc19kZWJpYW5saWtl
LWFsd2F5cy1yZXR1cm4tRmFsc2UucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1DaGVj
ay1mb3ItY2xhbmctYmVmb3JlLWd1ZXNzaW5nLWdjYy1vci1sY2MucGF0Y2ggXAogICAgICAgICAg
ICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDZmZTEzMjk3MjEzZDZmZjAxMjFjNWQ1YWFiMjVh
NTZlZjkzOGZmZWM1NzQxNGVkNjA4NmZkYTI3MmNiNjVlOSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICIxNjIyMmYxN2VmNzZiZTA1NDJjOTFjMDc5OTRmOTY3NmFlODc5ZjQ2ZmMyMWMwYzc4NmEyMWVm
MmNiNTE4YmJmIgogCiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6Ly9naXRodWIuY29tL21l
c29uYnVpbGQvbWVzb24vcmVsZWFzZXMiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJtZXNvbi0o
P1A8cHZlcj5cZCsoXC5cZCspKylcLnRhciIKLS0gCjIuMzEuMQoK

--===============8300321815866618018==--

