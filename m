Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4767C32770
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 18:57:02 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web12.6334.1660589820527427023
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 11:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=KORB2poq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 01010182a2ddc6d3-623f0f01-bafc-4f6d-856a-a860b3b69c49-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1660589819;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zvOU2XQyiW8aPIR58rDxI2X3p3JBeJTPuLHjTz/jgJw=;
	b=KORB2poq+JXAtwpUugwNfs5EO9vBidqKBEAyfoxUQqY0BDxzFPi7gpdWsll6R5er
	vTNBEzKVzTHZKf+zKpdKQyBBjYyU1DLgJLE7gbQSbqritzpqer/QNxUFYv0uN++IGLp
	pV0FeQA3p5TsoKqQYpCraAhEEGMN0h6VoeU2DtXo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1660589819;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zvOU2XQyiW8aPIR58rDxI2X3p3JBeJTPuLHjTz/jgJw=;
	b=h4wOJnjjuZ10kTdRzi31Cs+4iDyEKSIjBtOqQOvEky13mSXigWSc32ws7q97UkdW
	gjUWgYCPQPwO56H0rQ25vtDA4J159JgBslnA8CPQhCmlCftzb8BGfq3ktTRnYadgD4H
	FzjjtQ/E6FQeEvJjlyPH9Q1QcY+ncMuOG9JCamoQ=
Content-Type: multipart/mixed; boundary="===============9025706912344517366=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] meson: upgrading to 0.63.1 SUCCEEDED
Message-ID: 
 <01010182a2ddc6d3-623f0f01-bafc-4f6d-856a-a860b3b69c49-000000@us-west-2.amazonses.com>
Date: Mon, 15 Aug 2022 18:56:59 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 18:57:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169368

--===============9025706912344517366==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *meson* to *0.63.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-meson-upgrade-0.63.0-0.63.1.patch
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
--===============9025706912344517366==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-meson-upgrade-0.63.0-0.63.1.patch"

RnJvbSA4ODYxNzg2ZWU1ODQ0YzcwNWNjZjBkMGY4ZDJiNjFkZTU5Y2Y3MTA2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXVnIDIwMjIgMDc6NTQ6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
ZXNvbjogdXBncmFkZSAwLjYzLjAgLT4gMC42My4xCgotLS0KIC4uLi9yZWNpcGVzLWRldnRvb2xz
L21lc29uL3ttZXNvbl8wLjYzLjAuYmIgPT4gbWVzb25fMC42My4xLmJifSB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9tZXNvbi97bWVzb25fMC42My4wLmJiID0+IG1lc29uXzAuNjMuMS5iYn0g
KDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb25fMC42
My4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uXzAuNjMuMS5iYgpzaW1p
bGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24v
bWVzb25fMC42My4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVz
b25fMC42My4xLmJiCmluZGV4IDg5MGY0NzUwNmYuLjdmNzdhN2RlMzQgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9tZXNvbi9tZXNvbl8wLjYzLjAuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL21lc29uL21lc29uXzAuNjMuMS5iYgpAQCAtMTcsNyArMTcsNyBAQCBTUkNf
VVJJID0gImh0dHBzOi8vZ2l0aHViLmNvbS9tZXNvbmJ1aWxkL21lc29uL3JlbGVhc2VzL2Rvd25s
b2FkLyR7UFZ9L21lc29uLSR7UAogICAgICAgICAgICBmaWxlOi8vMDAwMS1pc19kZWJpYW5saWtl
LWFsd2F5cy1yZXR1cm4tRmFsc2UucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1DaGVj
ay1mb3ItY2xhbmctYmVmb3JlLWd1ZXNzaW5nLWdjYy1vci1sY2MucGF0Y2ggXAogICAgICAgICAg
ICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiM2I1MWQ0NTE3NDRjMmJjNzE4Mzg1MjRlYzhkOTZj
ZDRmOGM0NzkzZDViOGQ1ZDBkMGE5YzhhNGY3Yzk0Y2Q2ZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICIwNmZlMTMyOTcyMTNkNmZmMDEyMWM1ZDVhYWIyNWE1NmVmOTM4ZmZlYzU3NDE0ZWQ2MDg2ZmRh
MjcyY2I2NWU5IgogCiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6Ly9naXRodWIuY29tL21l
c29uYnVpbGQvbWVzb24vcmVsZWFzZXMiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJtZXNvbi0o
P1A8cHZlcj5cZCsoXC5cZCspKylcLnRhciIKLS0gCjIuMzEuMQoK

--===============9025706912344517366==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/meson: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/meson: SRC_URI changed from "https://github.com/mesonbuild/meson/releases/download/0.63.0/meson-0.63.0.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://disable-rpath-handling.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch file://0001-is_debianlike-always-return-False.patch file://0001-Check-for-clang-before-guessing-gcc-or-lcc.patch" to "https://github.com/mesonbuild/meson/releases/download/0.63.1/meson-0.63.1.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://disable-rpath-handling.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch file://0001-is_debianlike-always-return-False.patch file://0001-Check-for-clang-before-guessing-gcc-or-lcc.patch"
packages/core2-32-poky-linux/meson: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/meson/meson-dbg: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/meson/meson-dbg: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/meson/meson-dev: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/meson/meson-dev: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/meson/meson-doc: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/meson/meson-doc: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/meson/meson-doc: PKGSIZE changed from 5341 to 5343 (+0%)
packages/core2-32-poky-linux/meson/meson-locale: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/meson/meson-locale: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/meson/meson-src: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/meson/meson-src: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/meson/meson-staticdev: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/meson/meson-staticdev: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/meson/meson: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/meson/meson: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/meson/meson: PKGSIZE changed from 5656824 to 5665954 (+0%)
Changes to packages/core2-32-poky-linux/meson (sysroot):
  /usr/lib/python3.10/site-packages/meson-0.63.0.dist-info moved to /usr/lib/python3.10/site-packages/meson-0.63.1.dist-info

--===============9025706912344517366==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/meson (sysroot):
  /usr/lib/python3.10/site-packages/meson-0.63.0.dist-info moved to /usr/lib/python3.10/site-packages/meson-0.63.1.dist-info

--===============9025706912344517366==--

