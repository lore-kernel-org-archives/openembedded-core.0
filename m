Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F9E4CA9EDA
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:18 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.3758.1684186747272379360
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=e59MkyX1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010188215a4c76-02c9a7fb-b7c4-4be2-b704-eba8db131c8c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186746;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TFwQ1Ls217xSFmAwdohi3dFsX03otvo4y4PH300PIxw=;
	b=e59MkyX1KFv2rYQyo8QzmSDFSHL41O1x1w0G40IqQHYZSr8Ey1ImZ1w1uyXjksaT
	zQCKvWkI6JK5LEFLK6UCv0ZZYI5uIoDOee1uy7l4jrh6dhat2fQiLKcEVDAaFVC+rs5
	jlzPtFjj7Pr62tIThEj2ZZJZJXuemLLKfmHMBXm8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186746;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TFwQ1Ls217xSFmAwdohi3dFsX03otvo4y4PH300PIxw=;
	b=dkJ4GudxO4tDD2lR+SsgcrOqq8RYRTWNROIa3NNWwHdpn6g6GgM5qL777KJVP0gf
	O+OV2B3VY7AQav29qCAm4lYSy2yAgXkSt0OjEvyzD5r58292BawPboFlBx2sLOF4VOs
	rpRNkHD8K+HpbWy9V0cZ2n7kZlx4QofnKjJIeMEE=
Content-Type: multipart/mixed; boundary="===============2368162481024538680=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd-boot: upgrading to 253.4 SUCCEEDED
Message-ID: <01010188215a4c76-02c9a7fb-b7c4-4be2-b704-eba8db131c8c-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181289

--===============2368162481024538680==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemd-boot* to *253.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-systemd-boot-upgrade-253.3-253.4.patch
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
--===============2368162481024538680==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-systemd-boot-upgrade-253.3-253.4.patch"

RnJvbSAzMzQ0MWM1M2NmNGQ1ZTNmZDI1OTNhZDNlMzY0ZWI4NzZkN2FiNjFjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMDc6NTk6MjUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
eXN0ZW1kLWJvb3Q6IHVwZ3JhZGUgMjUzLjMgLT4gMjUzLjQKCi0tLQogLi4uL3N5c3RlbWQve3N5
c3RlbWQtYm9vdF8yNTMuMy5iYiA9PiBzeXN0ZW1kLWJvb3RfMjUzLjQuYmJ9ICAgIHwgMAogbWV0
YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLmluYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQve3N5c3RlbWQtYm9vdF8yNTMuMy5i
YiA9PiBzeXN0ZW1kLWJvb3RfMjUzLjQuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC1ib290XzI1My4zLmJiIGIvbWV0YS9yZWNpcGVzLWNv
cmUvc3lzdGVtZC9zeXN0ZW1kLWJvb3RfMjUzLjQuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC1ib290XzI1My4zLmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQtYm9vdF8yNTMuNC5i
YgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLmluYyBiL21l
dGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC5pbmMKaW5kZXggZDUwZjJjOWNiYS4uYTg5
NzI0OWM3ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLmlu
YworKysgYi9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQuaW5jCkBAIC0xNCw3ICsx
NCw3IEBAIExJQ0VOU0UgPSAiR1BMLTIuMC1vbmx5ICYgTEdQTC0yLjEtb25seSIKIExJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UuR1BMMjttZDU9NzUxNDE5MjYwYWE5NTQ0OTlmN2Fi
YWFiYWE4ODJiYmUgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5TRS5MR1BMMi4x
O21kNT00ZmJkNjUzODBjZGQyNTU5NTEwNzkwMDhiMzY0NTE2YyIKIAotU1JDUkVWID0gImVkMThj
MmFiNzllOGI5NDE4MmQ1ZGNmMzFkNTg0NTc3NjNmM2UzZTEiCitTUkNSRVYgPSAiNWVkMDg3ZmE0
NmRjMDRlZTkyZGExMjYzNTc3N2IyYjYyMjE4M2E1ZCIKIFNSQ0JSQU5DSCA9ICJ2MjUzLXN0YWJs
ZSIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9zeXN0ZW1kL3N5c3RlbWQtc3RhYmxlLmdp
dDtwcm90b2NvbD1odHRwczticmFuY2g9JHtTUkNCUkFOQ0h9IFwKICAgICAgICAgICAgZmlsZTov
LzAwMjYtc3JjLWJvb3QtZWZpLWVmaS1zdHJpbmcuYy1kZWZpbmUtd2NoYXJfdC1mcm9tLV9fV0NI
QS5wYXRjaCBcCi0tIAoyLjM5LjIKCg==

--===============2368162481024538680==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (0 cached, 900 parsed). 1804 targets, 73 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'systemd-boot'
systemd-boot was skipped: incompatible with host powerpc-poky-linux (not in COMPATIBLE_HOST)

--===============2368162481024538680==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/systemd-boot: PKGV changed from 253.3 [default] to 253.4 [default]
packages/core2-32-poky-linux/systemd-boot: PV changed from "253.3" to "253.4"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dbg: PKGV changed from 253.3 [default] to 253.4 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dbg: PV changed from "253.3" to "253.4"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dev: PKGV changed from 253.3 [default] to 253.4 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dev: PV changed from "253.3" to "253.4"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-doc: PKGV changed from 253.3 [default] to 253.4 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-doc: PV changed from "253.3" to "253.4"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-locale: PKGV changed from 253.3 [default] to 253.4 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-locale: PV changed from "253.3" to "253.4"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-src: PKGV changed from 253.3 [default] to 253.4 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-src: PV changed from "253.3" to "253.4"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-staticdev: PKGV changed from 253.3 [default] to 253.4 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-staticdev: PV changed from "253.3" to "253.4"
packages/core2-32-poky-linux/systemd-boot/systemd-boot: PKGV changed from 253.3 [default] to 253.4 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot: PV changed from "253.3" to "253.4"

--===============2368162481024538680==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (0 cached, 900 parsed). 1804 targets, 67 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'systemd-boot'
systemd-boot was skipped: incompatible with host mips-poky-linux (not in COMPATIBLE_HOST)

--===============2368162481024538680==--

