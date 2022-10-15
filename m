Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5F69C64EDD
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:20 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web08.24446.1665871392133082811
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=STm0+pkC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010183ddac30b9-4acba2f0-506b-4cbe-af31-1e12c0acd239-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YEmJgnFBgSblyWqk4+4kVGGlviiUnkDtnxiYinuCCKA=;
	b=STm0+pkC+4hg0A9NnRWeqP4pQQ8WBgaf+1EZ9UG3X7LCPGqwFXOADZp0FF9zt+mm
	NUqZW+tVIrlbT1mi7sdgLZUf58WOHSWT2yeI6MTte7ezMtQPTNhNghgGitVBGgKSk/s
	MKWAUYkm7OOg+Y7wAEm6mDMLTvYTYZwxb8Bq2zNY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YEmJgnFBgSblyWqk4+4kVGGlviiUnkDtnxiYinuCCKA=;
	b=gwGKUhtHVx1VUg2xp3AJd9AafzPkJv1QcEBe3JeFej7zxjMacs/7lkkUF9pupyz+
	jpkW8ulgTIyneGbMEYd8iNZR++o2CQJgs8hmeuNVikr5Re0TV5dzx4GenqtB0NQFvXG
	KeBBhv6PpqAZMhp5QImacmRirpwoFDjIl+oO5dzA=
Content-Type: multipart/mixed; boundary="===============1298777991885172306=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] meson: upgrading to 0.63.3 SUCCEEDED
Message-ID: <01010183ddac30b9-4acba2f0-506b-4cbe-af31-1e12c0acd239-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171757

--===============1298777991885172306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *meson* to *0.63.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-meson-upgrade-0.63.2-0.63.3.patch
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
--===============1298777991885172306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/meson (sysroot):
  /usr/lib/python3.10/site-packages/meson-0.63.2.dist-info moved to /usr/lib/python3.10/site-packages/meson-0.63.3.dist-info

--===============1298777991885172306==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-meson-upgrade-0.63.2-0.63.3.patch"

RnJvbSAwZWY1OTA0NzRhNTFjZTgyOWU0YzE2OWI0ZjY4ZThmNTZiYjA5MTY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMDk6MTY6MTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
ZXNvbjogdXBncmFkZSAwLjYzLjIgLT4gMC42My4zCgotLS0KIC4uLi9yZWNpcGVzLWRldnRvb2xz
L21lc29uL3ttZXNvbl8wLjYzLjIuYmIgPT4gbWVzb25fMC42My4zLmJifSB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9tZXNvbi97bWVzb25fMC42My4yLmJiID0+IG1lc29uXzAuNjMuMy5iYn0g
KDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb25fMC42
My4yLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uXzAuNjMuMy5iYgpzaW1p
bGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24v
bWVzb25fMC42My4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVz
b25fMC42My4zLmJiCmluZGV4IDg5MGZhYWNlYzkuLjkyNjcwNzc0MjIgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbl8wLjYzLjIuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL21lc29uL21lc29uXzAuNjMuMy5iYgpAQCAtMTgsNyArMTgsNyBAQCBTUkNf
VVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC8ke1BWfS9tZXNvbi0ke1BWfS50YXIu
Z3ogXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1pc19kZWJpYW5saWtlLWFsd2F5cy1yZXR1cm4t
RmFsc2UucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1DaGVjay1mb3ItY2xhbmctYmVm
b3JlLWd1ZXNzaW5nLWdjYy1vci1sY2MucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiMTYyMjJmMTdlZjc2YmUwNTQyYzkxYzA3OTk0Zjk2NzZhZTg3OWY0NmZjMjFj
MGM3ODZhMjFlZjJjYjUxOGJiZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI1MTljMDkzMmUxYThi
MjA4NzQxZjBmZGNlOTBhYTVjMGI1MjhkZDI5N2NmMzM3MDA5YmY2MzUzOTg0NmFjMDU2IgogCiBp
bmhlcml0IHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEgZ2l0aHViLXJlbGVhc2VzCiAKLS0g
CjIuMzEuMQoK

--===============1298777991885172306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/meson: PKGV changed from 0.63.2 [default] to 0.63.3 [default]
packages/core2-32-poky-linux/meson: PV changed from "0.63.2" to "0.63.3"
packages/core2-32-poky-linux/meson: SRC_URI changed from "https://github.com/mesonbuild/meson/releases//download/0.63.2/meson-0.63.2.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://disable-rpath-handling.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch file://0001-is_debianlike-always-return-False.patch file://0001-Check-for-clang-before-guessing-gcc-or-lcc.patch" to "https://github.com/mesonbuild/meson/releases//download/0.63.3/meson-0.63.3.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://disable-rpath-handling.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch file://0001-is_debianlike-always-return-False.patch file://0001-Check-for-clang-before-guessing-gcc-or-lcc.patch"
packages/core2-32-poky-linux/meson/meson-dbg: PKGV changed from 0.63.2 [default] to 0.63.3 [default]
packages/core2-32-poky-linux/meson/meson-dbg: PV changed from "0.63.2" to "0.63.3"
packages/core2-32-poky-linux/meson/meson-dev: PKGV changed from 0.63.2 [default] to 0.63.3 [default]
packages/core2-32-poky-linux/meson/meson-dev: PV changed from "0.63.2" to "0.63.3"
packages/core2-32-poky-linux/meson/meson-doc: PKGV changed from 0.63.2 [default] to 0.63.3 [default]
packages/core2-32-poky-linux/meson/meson-doc: PKGSIZE changed from 5346 to 5344 (-0%)
packages/core2-32-poky-linux/meson/meson-doc: PV changed from "0.63.2" to "0.63.3"
packages/core2-32-poky-linux/meson/meson-locale: PKGV changed from 0.63.2 [default] to 0.63.3 [default]
packages/core2-32-poky-linux/meson/meson-locale: PV changed from "0.63.2" to "0.63.3"
packages/core2-32-poky-linux/meson/meson-src: PKGV changed from 0.63.2 [default] to 0.63.3 [default]
packages/core2-32-poky-linux/meson/meson-src: PV changed from "0.63.2" to "0.63.3"
packages/core2-32-poky-linux/meson/meson-staticdev: PKGV changed from 0.63.2 [default] to 0.63.3 [default]
packages/core2-32-poky-linux/meson/meson-staticdev: PV changed from "0.63.2" to "0.63.3"
packages/core2-32-poky-linux/meson/meson: PKGV changed from 0.63.2 [default] to 0.63.3 [default]
packages/core2-32-poky-linux/meson/meson: PKGSIZE changed from 5665104 to 5674177 (+0%)
packages/core2-32-poky-linux/meson/meson: PV changed from "0.63.2" to "0.63.3"
Changes to packages/core2-32-poky-linux/meson (sysroot):
  /usr/lib/python3.10/site-packages/meson-0.63.2.dist-info moved to /usr/lib/python3.10/site-packages/meson-0.63.3.dist-info

--===============1298777991885172306==--

