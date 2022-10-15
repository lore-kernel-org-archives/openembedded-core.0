Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19566C65C15
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:21 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.24221.1665871393170910750
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=gu5tLqFT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010183ddac2dc0-d3680ee2-6768-40c9-bf77-252e8b1f29a8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871392;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=J6H+ibG8NuF/qBpWkOaULFj6FVUGTL1F6GomTNNMNxA=;
	b=gu5tLqFTe5dEzV5gOhc8q8Ak7yTs0M2TjkLG1US5WnZ4R+GAxmN9cWR5meAkwOwv
	eGI0U8yIdOx5SVqRn5zR1DYChHt9Zi/9CgtV30huHvGW8j/38EWeeAWKhop5hJMRwP+
	BwxoiFeHu5AnPSANeJQ/Ur/znq7a1PiSqP6Rp0SY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871392;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=J6H+ibG8NuF/qBpWkOaULFj6FVUGTL1F6GomTNNMNxA=;
	b=C1bD3HKboYSI9yuB5qh9WrscKFuqLLa12PEDGpjvL0Pov+qGgaETFNmWMxv2W1Bz
	ZPpnCX50cV0MVWiY4yCoWm7IlxR1nHI+nvIKYWbSumcLSMysq1SKovunIBY/ajMENuI
	rH+0Fhgo13MgwMaiPV6QsfCaPP2jReqJlNmGGGEw=
Content-Type: multipart/mixed; boundary="===============5555250372586648559=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd-boot: upgrading to 251.6 SUCCEEDED
Message-ID: <01010183ddac2dc0-d3680ee2-6768-40c9-bf77-252e8b1f29a8-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171752

--===============5555250372586648559==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemd-boot* to *251.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-systemd-boot-upgrade-251.4-251.6.patch
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
--===============5555250372586648559==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1661 targets, 63 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: Nothing PROVIDES 'systemd-boot'
systemd-boot was skipped: incompatible with host mips-poky-linux (not in COMPATIBLE_HOST)

--===============5555250372586648559==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1661 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: Nothing PROVIDES 'systemd-boot'
systemd-boot was skipped: incompatible with host powerpc-poky-linux (not in COMPATIBLE_HOST)

--===============5555250372586648559==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-systemd-boot-upgrade-251.4-251.6.patch"

RnJvbSBkN2YxNjcwMmYzM2RiMjBkMjgwOTE4NzJmZDBiOTk2MjIwMTEwNmUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMDc6Mzk6MTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
eXN0ZW1kLWJvb3Q6IHVwZ3JhZGUgMjUxLjQgLT4gMjUxLjYKCi0tLQogLi4uL3N5c3RlbWQve3N5
c3RlbWQtYm9vdF8yNTEuNC5iYiA9PiBzeXN0ZW1kLWJvb3RfMjUxLjYuYmJ9ICAgIHwgMAogbWV0
YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLmluYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQve3N5c3RlbWQtYm9vdF8yNTEuNC5i
YiA9PiBzeXN0ZW1kLWJvb3RfMjUxLjYuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC1ib290XzI1MS40LmJiIGIvbWV0YS9yZWNpcGVzLWNv
cmUvc3lzdGVtZC9zeXN0ZW1kLWJvb3RfMjUxLjYuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC1ib290XzI1MS40LmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQtYm9vdF8yNTEuNi5i
YgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLmluYyBiL21l
dGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC5pbmMKaW5kZXggNzFlYjkzZjIzYS4uMjAy
YWZkYzViNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLmlu
YworKysgYi9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQuaW5jCkBAIC0xNCw3ICsx
NCw3IEBAIExJQ0VOU0UgPSAiR1BMLTIuMC1vbmx5ICYgTEdQTC0yLjEtb25seSIKIExJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UuR1BMMjttZDU9NzUxNDE5MjYwYWE5NTQ0OTlmN2Fi
YWFiYWE4ODJiYmUgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5TRS5MR1BMMi4x
O21kNT00ZmJkNjUzODBjZGQyNTU5NTEwNzkwMDhiMzY0NTE2YyIKIAotU1JDUkVWID0gIjJhNjc0
YjRiNjZhZjFhMDUwYTAzNjJiNjQ2ZDJmY2E5MGM5MDExMmUiCitTUkNSRVYgPSAiMzAyOGUwNTk1
NWYxZDFhNDNkNTdiYmJlMDUzMjE1NDZkNTZjNzBhOSIKIFNSQ0JSQU5DSCA9ICJ2MjUxLXN0YWJs
ZSIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9zeXN0ZW1kL3N5c3RlbWQtc3RhYmxlLmdp
dDtwcm90b2NvbD1odHRwczticmFuY2g9JHtTUkNCUkFOQ0h9IFwKICIKLS0gCjIuMzEuMQoK

--===============5555250372586648559==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/systemd-boot: PV changed from "251.4" to "251.6"
packages/core2-32-poky-linux/systemd-boot: PKGV changed from 251.4 [default] to 251.6 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dbg: PV changed from "251.4" to "251.6"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dbg: PKGV changed from 251.4 [default] to 251.6 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dev: PV changed from "251.4" to "251.6"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dev: PKGV changed from 251.4 [default] to 251.6 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-doc: PV changed from "251.4" to "251.6"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-doc: PKGV changed from 251.4 [default] to 251.6 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-locale: PV changed from "251.4" to "251.6"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-locale: PKGV changed from 251.4 [default] to 251.6 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-src: PV changed from "251.4" to "251.6"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-src: PKGV changed from 251.4 [default] to 251.6 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-staticdev: PV changed from "251.4" to "251.6"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-staticdev: PKGV changed from 251.4 [default] to 251.6 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot: PV changed from "251.4" to "251.6"
packages/core2-32-poky-linux/systemd-boot/systemd-boot: PKGV changed from 251.4 [default] to 251.6 [default]

--===============5555250372586648559==--

