Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0634C433FE
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:18 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web08.24447.1665871392572109692
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=TrXbwjv5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010183ddac2bb8-dc45a55f-7c5d-40e0-bd36-c8b496b5fb41-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871391;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XHjda1Hvz7yWtXM55TATYdqFRGpAKkOnaNupqrGkNNQ=;
	b=TrXbwjv5cTWb+eCf8uKEisTQKtrEuAe/k+pijzSUY0P6xl8XtE04hC3nkPjgnVeu
	aR71lTW1BmYxfeBWRyQLFpjSBAgY1WASuaJUmsBGQoDVHkT6ajF3Hl5+TLBBwOAbA38
	YCJfoUDxWmFBqPiw4zCJFGnEMtoHFRH4uUz01AiQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871391;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XHjda1Hvz7yWtXM55TATYdqFRGpAKkOnaNupqrGkNNQ=;
	b=XDoFofFEqXNjbeW2D6MANLio8ttEIk1mMlElMlMjsVgZ2SOKugY9QX58wgy5M3Zi
	ouGQhm2SD2uE+MkRqbXRq4S651Dh5GVg9+tdPk7V1XXvyk7v2Zg1DSH5hOW9lLSbyYA
	hgHQ0UTq7AUy/+kyPzCK8MHhg9bvcaPjllBuQCSw=
Content-Type: multipart/mixed; boundary="===============6143885743176884448=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] u-boot: upgrading to 2022.10 FAILED
Message-ID: <01010183ddac2bb8-dc45a55f-7c5d-40e0-bd36-c8b496b5fb41-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171743

--===============6143885743176884448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *u-boot* to *2022.10* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-u-boot-upgrade-2022.07-2022.10.patch
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
--===============6143885743176884448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/qemux86-poky-linux/u-boot/u-boot-env: FILELIST: removed "/etc/u-boot-initial-env-qemux86-2022.07-r0", added "/etc/u-boot-initial-env-qemux86-2022.10-r0"
packages/qemux86-poky-linux/u-boot/u-boot: FILELIST: removed "/boot/u-boot-qemux86-2022.07-r0.bin", added "/boot/u-boot-qemux86-2022.10-r0.bin"

--===============6143885743176884448==
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
ERROR: Nothing PROVIDES 'u-boot'
u-boot was skipped: Either UBOOT_MACHINE or UBOOT_CONFIG must be set in the qemuppc machine configuration.

--===============6143885743176884448==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-u-boot-upgrade-2022.07-2022.10.patch"

RnJvbSBjNTIzOWY2YzRjNWViNDgxZTQzZjc3YTVmNzlmNTVmOGU1N2YzZjVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMDY6MjI6NDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSB1
LWJvb3Q6IHVwZ3JhZGUgMjAyMi4wNyAtPiAyMDIyLjEwCgotLS0KIG1ldGEvcmVjaXBlcy1ic3Av
dS1ib290L3UtYm9vdC1jb21tb24uaW5jICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIC4u
Li9yZWNpcGVzLWJzcC91LWJvb3Qve3UtYm9vdF8yMDIyLjA3LmJiID0+IHUtYm9vdF8yMDIyLjEw
LmJifSB8IDAKIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtYnNwL3UtYm9vdC97dS1ib290XzIwMjIuMDcuYmIgPT4gdS1i
b290XzIwMjIuMTAuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ic3AvdS1i
b290L3UtYm9vdC1jb21tb24uaW5jIGIvbWV0YS9yZWNpcGVzLWJzcC91LWJvb3QvdS1ib290LWNv
bW1vbi5pbmMKaW5kZXggZDdmZDNjNzIyNy4uNjBjNzdjYmVjNCAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWJzcC91LWJvb3QvdS1ib290LWNvbW1vbi5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWJz
cC91LWJvb3QvdS1ib290LWNvbW1vbi5pbmMKQEAgLTEyLDcgKzEyLDcgQEAgUEUgPSAiMSIKIAog
IyBXZSB1c2UgdGhlIHJldmlzaW9uIGluIG9yZGVyIHRvIGF2b2lkIGhhdmluZyB0byBmZXRjaCBp
dCBmcm9tIHRoZQogIyByZXBvIGR1cmluZyBwYXJzZQotU1JDUkVWID0gImUwOTJlMzI1MDI3MGEx
MDE2Yzg3N2RhN2JkZDkzODRmMTRiMTMyMWUiCitTUkNSRVYgPSAiNGRlYmM1N2EzZGE2YzNmNGQz
Zjg5YTYzN2U5OTIwNmY0Y2VhMGE5NiIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9zb3VyY2UuZGVueC5k
ZS91LWJvb3QvdS1ib290LmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyIgogCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtYnNwL3UtYm9vdC91LWJvb3RfMjAyMi4wNy5iYiBiL21ldGEv
cmVjaXBlcy1ic3AvdS1ib290L3UtYm9vdF8yMDIyLjEwLmJiCnNpbWlsYXJpdHkgaW5kZXggMTAw
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtYnNwL3UtYm9vdC91LWJvb3RfMjAyMi4wNy5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWJzcC91LWJvb3QvdS1ib290XzIwMjIuMTAuYmIKLS0gCjIu
MzEuMQoK

--===============6143885743176884448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/qemux86-poky-linux/u-boot: PV changed from "2022.07" to "2022.10"
packages/qemux86-poky-linux/u-boot: PKGV changed from 2022.07 [default] to 2022.10 [default]
packages/qemux86-poky-linux/u-boot/u-boot-dbg: PV changed from "2022.07" to "2022.10"
packages/qemux86-poky-linux/u-boot/u-boot-dbg: PKGV changed from 2022.07 [default] to 2022.10 [default]
packages/qemux86-poky-linux/u-boot/u-boot-dev: PV changed from "2022.07" to "2022.10"
packages/qemux86-poky-linux/u-boot/u-boot-dev: PKGV changed from 2022.07 [default] to 2022.10 [default]
packages/qemux86-poky-linux/u-boot/u-boot-doc: PV changed from "2022.07" to "2022.10"
packages/qemux86-poky-linux/u-boot/u-boot-doc: PKGV changed from 2022.07 [default] to 2022.10 [default]
packages/qemux86-poky-linux/u-boot/u-boot-env: PV changed from "2022.07" to "2022.10"
packages/qemux86-poky-linux/u-boot/u-boot-env: PKGV changed from 2022.07 [default] to 2022.10 [default]
packages/qemux86-poky-linux/u-boot/u-boot-env: PKGSIZE changed from 4618 to 4636 (+0%)
packages/qemux86-poky-linux/u-boot/u-boot-env: FILELIST: removed "/etc/u-boot-initial-env-qemux86-2022.07-r0", added "/etc/u-boot-initial-env-qemux86-2022.10-r0"
packages/qemux86-poky-linux/u-boot/u-boot-extlinux: PV changed from "2022.07" to "2022.10"
packages/qemux86-poky-linux/u-boot/u-boot-extlinux: PKGV changed from 2022.07 [default] to 2022.10 [default]
packages/qemux86-poky-linux/u-boot/u-boot-locale: PV changed from "2022.07" to "2022.10"
packages/qemux86-poky-linux/u-boot/u-boot-locale: PKGV changed from 2022.07 [default] to 2022.10 [default]
packages/qemux86-poky-linux/u-boot/u-boot-src: PV changed from "2022.07" to "2022.10"
packages/qemux86-poky-linux/u-boot/u-boot-src: PKGV changed from 2022.07 [default] to 2022.10 [default]
packages/qemux86-poky-linux/u-boot/u-boot-staticdev: PV changed from "2022.07" to "2022.10"
packages/qemux86-poky-linux/u-boot/u-boot-staticdev: PKGV changed from 2022.07 [default] to 2022.10 [default]
packages/qemux86-poky-linux/u-boot/u-boot: PV changed from "2022.07" to "2022.10"
packages/qemux86-poky-linux/u-boot/u-boot: PKGV changed from 2022.07 [default] to 2022.10 [default]
packages/qemux86-poky-linux/u-boot/u-boot: PKGSIZE changed from 725071 to 730751 (+1%)
packages/qemux86-poky-linux/u-boot/u-boot: FILELIST: removed "/boot/u-boot-qemux86-2022.07-r0.bin", added "/boot/u-boot-qemux86-2022.10-r0.bin"

--===============6143885743176884448==--

