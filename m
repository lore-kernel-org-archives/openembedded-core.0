Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62021C4727C
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 16:53:53 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.503.1664643227689590699
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 09:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=S7yApjh5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 010101839477dca7-35179ae9-0426-4d7d-9300-7ace364b5a44-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1664643227;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3ZtkLE4rsEUJ6VuT2y6KpgYxDztxl1j0gplyvDyYk7M=;
	b=S7yApjh52A2FE/I5d90sxUGNU9NZsXKd9JwoFE5Irjlm1p9C8GOUW4i5OVEObbTb
	k9DzYyLNZK+KKaesXIQ2hfgL/X74mbyUR1eL+QopuZnZ8HuWoyuxuKiQN9ztSiSwj9T
	RF62Q7b2tLapBlH8D4g5tIhXjYs3Z5LjJOv52CZc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1664643227;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3ZtkLE4rsEUJ6VuT2y6KpgYxDztxl1j0gplyvDyYk7M=;
	b=eKEFiQT7P8FXUkFEJVRimIwhd55tDM3cCbrnKGRVonVeXRGwhyWPqgHX0/Iw5SGp
	v0qCWUx7Ng+6vKQmxVZ0fTYeX6QIsd9+QOFvrVt7l+reBi43gi8TzSzcCxhXk6alSUT
	X3eihFEv0Nw9S5o+0XCXMsy1eSDBnsza2jBZe228=
Content-Type: multipart/mixed; boundary="===============0443872428796442403=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools-rust: upgrading to 1.5.2 SUCCEEDED
Message-ID: 
 <010101839477dca7-35179ae9-0426-4d7d-9300-7ace364b5a44-000000@us-west-2.amazonses.com>
Date: Sat, 1 Oct 2022 16:53:46 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 16:53:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171285

--===============0443872428796442403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools-rust* to *1.5.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-rust-upgrade-1.5.1-1.5.2.patch
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
--===============0443872428796442403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-setuptools-rust (sysroot):
  /usr/lib/python3.10/site-packages/setuptools_rust-1.5.1.dist-info moved to /usr/lib/python3.10/site-packages/setuptools_rust-1.5.2.dist-info

--===============0443872428796442403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-setuptools-rust: PKGV changed from 1.5.1 [default] to 1.5.2 [default]
packages/core2-32-poky-linux/python3-setuptools-rust: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools-rust/setuptools-rust-1.5.1.tar.gz https://files.pythonhosted.org/packages/source/s/setuptools-rust/setuptools-rust-1.5.1.tar.gz https://files.pythonhosted.org/packages/67/08/e1aa2c582c62ac76e4d60f8e454bd3bba933781a06a88b4e38797445822a/setuptools-rust-1.5.1.tar.gz" to "https://files.pythonhosted.org/packages/source/s/setuptools-rust/setuptools-rust-1.5.2.tar.gz https://files.pythonhosted.org/packages/source/s/setuptools-rust/setuptools-rust-1.5.2.tar.gz https://files.pythonhosted.org/packages/67/08/e1aa2c582c62ac76e4d60f8e454bd3bba933781a06a88b4e38797445822a/setuptools-rust-1.5.2.tar.gz"
packages/core2-32-poky-linux/python3-setuptools-rust: PV changed from "1.5.1" to "1.5.2"
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dbg: PKGV changed from 1.5.1 [default] to 1.5.2 [default]
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dbg: PV changed from "1.5.1" to "1.5.2"
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dev: PKGV changed from 1.5.1 [default] to 1.5.2 [default]
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dev: PV changed from "1.5.1" to "1.5.2"
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-doc: PKGV changed from 1.5.1 [default] to 1.5.2 [default]
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-doc: PV changed from "1.5.1" to "1.5.2"
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-locale: PKGV changed from 1.5.1 [default] to 1.5.2 [default]
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-locale: PV changed from "1.5.1" to "1.5.2"
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-src: PKGV changed from 1.5.1 [default] to 1.5.2 [default]
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-src: PV changed from "1.5.1" to "1.5.2"
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-staticdev: PKGV changed from 1.5.1 [default] to 1.5.2 [default]
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-staticdev: PV changed from "1.5.1" to "1.5.2"
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PKGSIZE changed from 121528 to 121629 (+0%)
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PKGV changed from 1.5.1 [default] to 1.5.2 [default]
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PV changed from "1.5.1" to "1.5.2"
Changes to packages/core2-32-poky-linux/python3-setuptools-rust (sysroot):
  /usr/lib/python3.10/site-packages/setuptools_rust-1.5.1.dist-info moved to /usr/lib/python3.10/site-packages/setuptools_rust-1.5.2.dist-info

--===============0443872428796442403==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-rust-upgrade-1.5.1-1.5.2.patch"

RnJvbSAxMzYxMzgyNWQwOTY2MDc5OTc4OGVmOWJhYjBiMWZkNGUxYjQzNDAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBPY3QgMjAyMiAwODozNDo1OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc2V0dXB0b29scy1ydXN0OiB1cGdyYWRlIDEuNS4xIC0+IDEuNS4yCgotLS0KIC4uLmV0
dXB0b29scy1ydXN0XzEuNS4xLmJiID0+IHB5dGhvbjMtc2V0dXB0b29scy1ydXN0XzEuNS4yLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtc2V0dXB0b29scy1y
dXN0XzEuNS4xLmJiID0+IHB5dGhvbjMtc2V0dXB0b29scy1ydXN0XzEuNS4yLmJifSAoOTIlKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRv
b2xzLXJ1c3RfMS41LjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
c2V0dXB0b29scy1ydXN0XzEuNS4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTIlCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzLXJ1c3RfMS41
LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1
cHRvb2xzLXJ1c3RfMS41LjIuYmIKaW5kZXggMjRhNGY0YWJlZi4uNTAyOTY3ZmQyMCAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMtcnVz
dF8xLjUuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0
dXB0b29scy1ydXN0XzEuNS4yLmJiCkBAIC0xMiw3ICsxMiw3IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTAxMWNkOTJlNzAyZGQ5ZTZiMWEyNjE1N2I2ZmQ1M2Y1Igog
U1JDX1VSSSA9ICIke1BZUElfU1JDX1VSSX0gXAogICAgICAgICAgICBodHRwczovL2ZpbGVzLnB5
dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvNjcvMDgvZTFhYTJjNTgyYzYyYWM3NmU0ZDYwZjhlNDU0
YmQzYmJhOTMzNzgxYTA2YTg4YjRlMzg3OTc0NDU4MjJhL3NldHVwdG9vbHMtcnVzdC0ke1BWfS50
YXIuZ3ogXAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMGUwNWU0NTY2NDVk
NTk0MjljYjEwMjEzNzBhZWRlNzNjMDc2MGU5MzYwYmJmZGFhZWZiNWJjZWQ1MzBlYjlkNyIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICJkOGRhY2NiMTRkYzBlYWUxYjZiNmViM2VjZWY3OTY3NWJkMzdi
NDA2NTM2OWY3OWMzNTM5M2RkNWM1NTY1MmM3IgogCiBpbmhlcml0IGNhcmdvIHB5cGkgcHl0aG9u
X3NldHVwdG9vbHNfYnVpbGRfbWV0YQogCi0tIAoyLjMxLjEKCg==

--===============0443872428796442403==--

