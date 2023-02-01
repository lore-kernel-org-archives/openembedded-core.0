Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD3BC6FD1F
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:24 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.30364.1675272858140193213
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=aPJRbJ0h;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101860e0b27d0-96be7ca6-6d32-4b65-a39f-8681b3b4fa08-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272857;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xwR2ZpPqgsdRRqlqRAM/4N6GOSD28qmK72BOxouZF10=;
	b=aPJRbJ0hP4pS8jXBrbdoz16QAslDzX6sbwU7eAYIkHoYnRVMaU8f55iUljiJZiBt
	gYFudfyxFXMJnTSN69JkQhmthx7lt/FPKWfwP0/1NlRVGNB4p88k9UWKFsytQfBSJ5w
	EiU3WQZ6P0DnDB2i76s+MJEfPbj1UEigTqDKSJ/E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272857;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xwR2ZpPqgsdRRqlqRAM/4N6GOSD28qmK72BOxouZF10=;
	b=Y+mkvjiEBbnQIUXjvD2RN7iesQ4SWnYL9SIviw7JUDZUnHICcFdSBTal230B/oDZ
	O1A6APtuTMW6pM5p/NIpiDlcT5zi/JoDQeStRmh0Wu6lm8zNH6/ZTD+ROJHFIZWzjQc
	eDBoJEJnIT37W1bc3MPjC8JMwuZXm1Jjr+4WTjy8=
Content-Type: multipart/mixed; boundary="===============3670800097006095547=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libinput: upgrading to 1.22.1 SUCCEEDED
Message-ID: <010101860e0b27d0-96be7ca6-6d32-4b65-a39f-8681b3b4fa08-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:17 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176629

--===============3670800097006095547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libinput* to *1.22.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libinput-upgrade-1.22.0-1.22.1.patch
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
--===============3670800097006095547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libinput: SRC_URI changed from "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=main file://run-ptest file://determinism.patch" to "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=1.22-branch file://run-ptest file://determinism.patch"
packages/core2-32-poky-linux/libinput: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-32-poky-linux/libinput: PV changed from "1.22.0" to "1.22.1"
packages/core2-32-poky-linux/libinput/libinput-bin: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-32-poky-linux/libinput/libinput-bin: PV changed from "1.22.0" to "1.22.1"
packages/core2-32-poky-linux/libinput/libinput-dbg: PKGSIZE changed from 4831844 to 4831960 (+0%)
packages/core2-32-poky-linux/libinput/libinput-dbg: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-32-poky-linux/libinput/libinput-dbg: PV changed from "1.22.0" to "1.22.1"
packages/core2-32-poky-linux/libinput/libinput-dev: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-32-poky-linux/libinput/libinput-dev: PV changed from "1.22.0" to "1.22.1"
packages/core2-32-poky-linux/libinput/libinput-doc: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-32-poky-linux/libinput/libinput-doc: PV changed from "1.22.0" to "1.22.1"
packages/core2-32-poky-linux/libinput/libinput-locale: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-32-poky-linux/libinput/libinput-locale: PV changed from "1.22.0" to "1.22.1"
packages/core2-32-poky-linux/libinput/libinput-ptest: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-32-poky-linux/libinput/libinput-ptest: PV changed from "1.22.0" to "1.22.1"
packages/core2-32-poky-linux/libinput/libinput-src: PKGSIZE changed from 3447987 to 3448008 (+0%)
packages/core2-32-poky-linux/libinput/libinput-src: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-32-poky-linux/libinput/libinput-src: PV changed from "1.22.0" to "1.22.1"
packages/core2-32-poky-linux/libinput/libinput-staticdev: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-32-poky-linux/libinput/libinput-staticdev: PV changed from "1.22.0" to "1.22.1"
packages/core2-32-poky-linux/libinput/libinput: FILELIST: added "/usr/share/libinput/30-vendor-glorious.quirks"
packages/core2-32-poky-linux/libinput/libinput: PKGSIZE changed from 1218498 to 1219214 (+0%)
packages/core2-32-poky-linux/libinput/libinput: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-32-poky-linux/libinput/libinput: PV changed from "1.22.0" to "1.22.1"
Changes to packages/core2-32-poky-linux/libinput (sysroot):
  /usr/share/libinput/30-vendor-glorious.quirks was added

--===============3670800097006095547==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libinput-upgrade-1.22.0-1.22.1.patch"

RnJvbSA1ZTZjYjZlNmU5MDg5ZjBhMzU0ZDBiZWNlZGQwZWU3ZTUzNzRlNTg2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxNTo1NTowMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmlucHV0OiB1cGdyYWRlIDEuMjIuMCAtPiAxLjIyLjEKCi0tLQogLi4uL3dheWxhbmQve2xpYmlu
cHV0XzEuMjIuMC5iYiA9PiBsaWJpbnB1dF8xLjIyLjEuYmJ9ICAgICAgICB8IDQgKystLQogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC97bGliaW5wdXRfMS4yMi4wLmJiID0+IGxpYmlucHV0
XzEuMjIuMS5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5
bGFuZC9saWJpbnB1dF8xLjIyLjAuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC9s
aWJpbnB1dF8xLjIyLjEuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvbGliaW5wdXRfMS4yMi4wLmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC9saWJpbnB1dF8xLjIyLjEuYmIKaW5kZXggNWE1ZmM5
ZjM1ZC4uZjg2ODg1ZDNlMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxh
bmQvbGliaW5wdXRfMS4yMi4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5k
L2xpYmlucHV0XzEuMjIuMS5iYgpAQCAtMTIsMTEgKzEyLDExIEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkc7bWQ1PWJhYjRhYzdkYzFjMTBiYzBmYjAzN2RjNzZjNDZlZjhhIgog
CiBERVBFTkRTID0gImxpYmV2ZGV2IHVkZXYgbXRkZXYgbGliY2hlY2siCiAKLVNSQ19VUkkgPSAi
Z2l0Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9saWJpbnB1dC9saWJpbnB1dC5naXQ7cHJvdG9j
b2w9aHR0cHM7YnJhbmNoPW1haW4gXAorU1JDX1VSSSA9ICJnaXQ6Ly9naXRsYWIuZnJlZWRlc2t0
b3Aub3JnL2xpYmlucHV0L2xpYmlucHV0LmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9MS4yMi1i
cmFuY2ggXAogICAgICAgICAgICBmaWxlOi8vcnVuLXB0ZXN0IFwKICAgICAgICAgICAgZmlsZTov
L2RldGVybWluaXNtLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDUkVWID0gImZjNTllNTc0ZTA1
MGM1MDJjOWEzYWRlZmFjZjk3YmFiZjNkMDljN2EiCitTUkNSRVYgPSAiZDlmNDVmZDEyNjFkYTg1
YjRlYjQ0ZjhhYTgyZTE1MDBiOTlmMzAzYiIKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKIFVQU1RS
RUFNX0NIRUNLX1JFR0VYID0gImxpYmlucHV0LSg/UDxwdmVyPlxkK1wuXGQrXC4oPyE5XGQrKVxk
KykiCi0tIAoyLjM3LjMKCg==

--===============3670800097006095547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libinput/libinput: FILELIST: added "/usr/share/libinput/30-vendor-glorious.quirks"
Changes to packages/core2-32-poky-linux/libinput (sysroot):
  /usr/share/libinput/30-vendor-glorious.quirks was added

--===============3670800097006095547==--

