Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 010EFC32771
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 18:57:03 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.6312.1660589820284900691
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 11:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=bLfYOG6Q;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 01010182a2ddc512-30448269-e171-47dd-8ebb-ab604dce85f5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1660589819;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OBPLtHE6BwD74hVwWLCIiuUblkJmXWVmNJKcKrFW7Qo=;
	b=bLfYOG6QK9UITrieU4t2vULZYEmPeQ4JrVemHtbTpAuSqSn+VQiPM2GLue76ug7x
	c34OndmC0F8kckLtjgQwr9SFh8IxyWdiXAYh2a1utz4AheVnymjUv0pN+c/X88F8U9j
	R9tUOctfV/BMFm8kNN1woY/ALElpdGexLEPbtQ9o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1660589819;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OBPLtHE6BwD74hVwWLCIiuUblkJmXWVmNJKcKrFW7Qo=;
	b=JjCk5iGdiEOj1cvSZOvO4QqzDJgQAHVu8+4pcUauWlj7sBXpnY0QteFjheY6Qbdu
	mpjCh8EyAT80xDdqtAz6P7COecCHBEqyWfaF/WxeST8Gqo7RQ1jLLTU/JSGYrUeIOZv
	5tmWy7ULqLfEqnxt+pOTn4B2JOFdl2CRcP/zPiho=
Content-Type: multipart/mixed; boundary="===============5159369511954199275=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd-boot: upgrading to 251.4 SUCCEEDED
Message-ID: 
 <01010182a2ddc512-30448269-e171-47dd-8ebb-ab604dce85f5-000000@us-west-2.amazonses.com>
Date: Mon, 15 Aug 2022 18:56:59 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 18:57:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169365

--===============5159369511954199275==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemd-boot* to *251.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-systemd-boot-upgrade-251.3-251.4.patch
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
--===============5159369511954199275==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-systemd-boot-upgrade-251.3-251.4.patch"

RnJvbSA5NzAzYmIyNGYxMjUzMWU4MTNjZGEwZmExNTUzMDdmYzQ5MDVjOTBhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXVnIDIwMjIgMDY6NDE6NDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
eXN0ZW1kLWJvb3Q6IHVwZ3JhZGUgMjUxLjMgLT4gMjUxLjQKCi0tLQogLi4uL3N5c3RlbWQve3N5
c3RlbWQtYm9vdF8yNTEuMy5iYiA9PiBzeXN0ZW1kLWJvb3RfMjUxLjQuYmJ9ICAgIHwgMAogbWV0
YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLmluYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQve3N5c3RlbWQtYm9vdF8yNTEuMy5i
YiA9PiBzeXN0ZW1kLWJvb3RfMjUxLjQuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC1ib290XzI1MS4zLmJiIGIvbWV0YS9yZWNpcGVzLWNv
cmUvc3lzdGVtZC9zeXN0ZW1kLWJvb3RfMjUxLjQuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC1ib290XzI1MS4zLmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQtYm9vdF8yNTEuNC5i
YgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLmluYyBiL21l
dGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC5pbmMKaW5kZXggMDNmMTU1OWYwMi4uNzFl
YjkzZjIzYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLmlu
YworKysgYi9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQuaW5jCkBAIC0xNCw3ICsx
NCw3IEBAIExJQ0VOU0UgPSAiR1BMLTIuMC1vbmx5ICYgTEdQTC0yLjEtb25seSIKIExJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UuR1BMMjttZDU9NzUxNDE5MjYwYWE5NTQ0OTlmN2Fi
YWFiYWE4ODJiYmUgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5TRS5MR1BMMi4x
O21kNT00ZmJkNjUzODBjZGQyNTU5NTEwNzkwMDhiMzY0NTE2YyIKIAotU1JDUkVWID0gIjUxNjEw
OGYyNzM4ODhkZjNkY2ZhNGY0MmIxNDAyNTJhMjg1YTIyODgiCitTUkNSRVYgPSAiMmE2NzRiNGI2
NmFmMWEwNTBhMDM2MmI2NDZkMmZjYTkwYzkwMTEyZSIKIFNSQ0JSQU5DSCA9ICJ2MjUxLXN0YWJs
ZSIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9zeXN0ZW1kL3N5c3RlbWQtc3RhYmxlLmdp
dDtwcm90b2NvbD1odHRwczticmFuY2g9JHtTUkNCUkFOQ0h9IFwKICIKLS0gCjIuMzEuMQoK

--===============5159369511954199275==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/systemd-boot: PV changed from "251.3" to "251.4"
packages/core2-32-poky-linux/systemd-boot: PKGV changed from 251.3 [default] to 251.4 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dbg: PV changed from "251.3" to "251.4"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dbg: PKGV changed from 251.3 [default] to 251.4 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dev: PV changed from "251.3" to "251.4"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dev: PKGV changed from 251.3 [default] to 251.4 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-doc: PV changed from "251.3" to "251.4"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-doc: PKGV changed from 251.3 [default] to 251.4 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-locale: PV changed from "251.3" to "251.4"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-locale: PKGV changed from 251.3 [default] to 251.4 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-src: PV changed from "251.3" to "251.4"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-src: PKGV changed from 251.3 [default] to 251.4 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-staticdev: PV changed from "251.3" to "251.4"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-staticdev: PKGV changed from 251.3 [default] to 251.4 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot: PV changed from "251.3" to "251.4"
packages/core2-32-poky-linux/systemd-boot/systemd-boot: PKGV changed from 251.3 [default] to 251.4 [default]

--===============5159369511954199275==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1658 targets, 63 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: Nothing PROVIDES 'systemd-boot'
systemd-boot was skipped: incompatible with host mips-poky-linux (not in COMPATIBLE_HOST)

--===============5159369511954199275==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1658 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-832312428027d455c3bd01737de97b2a2e617e94"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:832312428027d455c3bd01737de97b2a2e617e94"
workspace            = "master:21cfb871f7da604f1fab957d7747cb03b113b971"

Initialising tasks...done.
Sstate summary: Wanted 16 Local 0 Mirrors 0 Missed 16 Current 238 (0% match, 93% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 846 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb:do_fetch)
NOTE: Running task 858 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_251.4.bb:do_fetch)
NOTE: Running task 904 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_fetch)
NOTE: Running task 958 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_251.4.bb:do_write_config)
NOTE: recipe systemd-bootconf-1.00-r0: task do_fetch: Started
NOTE: recipe gnu-efi-3.0.14-r0: task do_fetch: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_fetch: Succeeded
NOTE: recipe systemd-boot-251.4-r0: task do_fetch: Started
NOTE: Running task 971 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_unpack)
NOTE: Running task 972 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-boot-251.4-r0: task do_write_config: Started
NOTE: recipe gnu-efi-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 973 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb:do_unpack)
NOTE: Running task 974 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-boot-251.4-r0: task do_fetch: Succeeded
NOTE: recipe systemd-boot-251.4-r0: task do_write_config: Succeeded
NOTE: Running task 975 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_251.4.bb:do_unpack)
NOTE: recipe systemd-bootconf-1.00-r0: task do_unpack: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_unpack: Succeeded
NOTE: recipe gnu-efi-3.0.14-r0: task do_unpack: Started
NOTE: Running task 976 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_patch)
NOTE: recipe gnu-efi-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-boot-251.4-r0: task do_unpack: Started
NOTE: recipe gnu-efi-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 977 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb:do_patch)
NOTE: recipe systemd-bootconf-1.00-r0: task do_patch: Started
NOTE: recipe gnu-efi-3.0.14-r0: task do_patch: Started
NOTE: recipe gnu-efi-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe systemd-bootconf-1.00-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe systemd-bootconf-1.00-r0: task do_patch: Succeeded
NOTE: Running task 978 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_deploy_source_date_epoch)
NOTE: recipe systemd-bootconf-1.00-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnu-efi-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 979 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe systemd-bootconf-1.00-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 980 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_configure)
NOTE: recipe gnu-efi-3.0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_configure: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_configure: Succeeded
NOTE: Running task 981 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_compile)
NOTE: recipe gnu-efi-3.0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 982 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb:do_configure)
NOTE: recipe systemd-bootconf-1.00-r0: task do_compile: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_compile: Succeeded
NOTE: Running task 983 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_install)
NOTE: recipe gnu-efi-3.0.14-r0: task do_configure: Started
NOTE: recipe systemd-boot-251.4-r0: task do_unpack: Succeeded
NOTE: recipe gnu-efi-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 984 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_251.4.bb:do_patch)
NOTE: Running task 985 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb:do_compile)
NOTE: recipe gnu-efi-3.0.14-r0: task do_compile: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_install: Started
NOTE: recipe systemd-boot-251.4-r0: task do_patch: Started
NOTE: recipe systemd-boot-251.4-r0: task do_patch: Succeeded
NOTE: Running task 986 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_251.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 987 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_251.4.bb:do_populate_lic)
NOTE: recipe systemd-bootconf-1.00-r0: task do_install: Succeeded
NOTE: Running task 988 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_package)
NOTE: recipe systemd-boot-251.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe systemd-boot-251.4-r0: task do_populate_lic: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_package: Started
NOTE: recipe systemd-boot-251.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_251.4.bb:do_populate_lic unihash changed to f3452c4f39372017f6f9e77ea40bfb598336b0decf1176543760a11c35c43bda
NOTE: recipe systemd-boot-251.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnu-efi-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 989 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb:do_install)
NOTE: recipe gnu-efi-3.0.14-r0: task do_install: Started
NOTE: recipe gnu-efi-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 990 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 991 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb:do_package)
NOTE: recipe gnu-efi-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe gnu-efi-3.0.14-r0: task do_package: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_package: Succeeded
NOTE: Running task 992 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_packagedata)
NOTE: recipe gnu-efi-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 993 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_251.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-bootconf-1.00-r0: task do_packagedata: Started
NOTE: recipe systemd-boot-251.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_packagedata: Succeeded
NOTE: Running task 994 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_package_write_rpm)
NOTE: recipe systemd-bootconf-1.00-r0: task do_package_write_rpm: Started
NOTE: recipe systemd-boot-251.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 995 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_251.4.bb:do_configure)
NOTE: recipe systemd-boot-251.4-r0: task do_configure: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnu-efi-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 996 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb:do_packagedata)
NOTE: recipe gnu-efi-3.0.14-r0: task do_packagedata: Started
NOTE: recipe gnu-efi-3.0.14-r0: task do_packagedata: Failed
NOTE: recipe systemd-boot-251.4-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 996 tasks of which 966 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: gnu-efi-3.0.14-r0 do_packagedata: QA Issue: Package version for package gnu-efi-src went backwards which would break package feeds (from 0:3.0.15-r0 to 0:3.0.14-r0) [version-going-backwards]
ERROR: gnu-efi-3.0.14-r0 do_packagedata: QA Issue: Package version for package gnu-efi-dbg went backwards which would break package feeds (from 0:3.0.15-r0 to 0:3.0.14-r0) [version-going-backwards]
ERROR: gnu-efi-3.0.14-r0 do_packagedata: QA Issue: Package version for package gnu-efi-staticdev went backwards which would break package feeds (from 0:3.0.15-r0 to 0:3.0.14-r0) [version-going-backwards]
ERROR: gnu-efi-3.0.14-r0 do_packagedata: QA Issue: Package version for package gnu-efi-dev went backwards which would break package feeds (from 0:3.0.15-r0 to 0:3.0.14-r0) [version-going-backwards]
ERROR: gnu-efi-3.0.14-r0 do_packagedata: QA Issue: Package version for package gnu-efi-doc went backwards which would break package feeds (from 0:3.0.15-r0 to 0:3.0.14-r0) [version-going-backwards]
ERROR: gnu-efi-3.0.14-r0 do_packagedata: QA Issue: Package version for package gnu-efi-locale went backwards which would break package feeds (from 0:3.0.15-r0 to 0:3.0.14-r0) [version-going-backwards]
ERROR: gnu-efi-3.0.14-r0 do_packagedata: QA Issue: Package version for package gnu-efi went backwards which would break package feeds (from 0:3.0.15-r0 to 0:3.0.14-r0) [version-going-backwards]
ERROR: gnu-efi-3.0.14-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/gnu-efi/3.0.14-r0/temp/log.do_packagedata.562054
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb:do_packagedata) failed with exit code '1'

--===============5159369511954199275==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1659 targets, 49 skipped, 0 masked, 0 errors.
Removing 20 recipes from the core2-32 sysroot...done.
Removing 20 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-832312428027d455c3bd01737de97b2a2e617e94"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:832312428027d455c3bd01737de97b2a2e617e94"
workspace            = "master:21cfb871f7da604f1fab957d7747cb03b113b971"

Initialising tasks...done.
Sstate summary: Wanted 93 Local 77 Mirrors 0 Missed 16 Current 162 (82% match, 93% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 179 of 255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 180 of 255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 181 of 255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_packagedata_setscene)
NOTE: Running setscene task 182 of 255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_populate_sysroot_setscene)
NOTE: Running task 648 of 1006 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb:do_fetch)
NOTE: Running task 655 of 1006 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_251.4.bb:do_fetch)
NOTE: Running task 697 of 1006 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_fetch)
NOTE: Running task 735 of 1006 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_251.4.bb:do_write_config)
NOTE: recipe libcap-2.65-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.65-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnu-efi-3.0.14-r0: task do_fetch: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_fetch: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_fetch: Succeeded
NOTE: Running task 736 of 1006 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_unpack)
NOTE: recipe systemd-boot-251.4-r0: task do_fetch: Started
NOTE: recipe gnu-efi-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe systemd-boot-251.4-r0: task do_write_config: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 737 of 1006 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb:do_unpack)
NOTE: recipe systemd-boot-251.4-r0: task do_fetch: Succeeded
NOTE: recipe systemd-boot-251.4-r0: task do_write_config: Succeeded
NOTE: Running task 738 of 1006 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_251.4.bb:do_unpack)
NOTE: recipe systemd-bootconf-1.00-r0: task do_unpack: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_unpack: Succeeded
NOTE: recipe gnu-efi-3.0.14-r0: task do_unpack: Started
NOTE: recipe libcap-2.65-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 739 of 1006 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_patch)
NOTE: recipe libcap-2.65-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-boot-251.4-r0: task do_unpack: Started
NOTE: recipe gnu-efi-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 744 of 1006 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb:do_patch)
NOTE: recipe systemd-bootconf-1.00-r0: task do_patch: Started
NOTE: recipe gnu-efi-3.0.14-r0: task do_patch: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_patch: Succeeded
NOTE: Running task 745 of 1006 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_deploy_source_date_epoch)
NOTE: recipe systemd-bootconf-1.00-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnu-efi-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 746 of 1006 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe systemd-bootconf-1.00-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnu-efi-3.0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 186 of 255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 187 of 255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 188 of 255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 189 of 255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 191 of 255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 192 of 255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 193 of 255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 194 of 255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 195 of 255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 196 of 255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gnu-efi-3.0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 205 of 255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 206 of 255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-boot-251.4-r0: task do_unpack: Succeeded
NOTE: Running task 767 of 1006 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_251.4.bb:do_patch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-boot-251.4-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-boot-251.4-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 772 of 1006 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_251.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 773 of 1006 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_251.4.bb:do_populate_lic)
NOTE: recipe systemd-boot-251.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe systemd-boot-251.4-r0: task do_populate_lic: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 210 of 255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 211 of 255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 212 of 255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 213 of 255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-boot-251.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_251.4.bb:do_populate_lic unihash changed to f3452c4f39372017f6f9e77ea40bfb598336b0decf1176543760a11c35c43bda
NOTE: recipe systemd-boot-251.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 218 of 255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 219 of 255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 224 of 255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 226 of 255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 228 of 255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 230 of 255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 232 of 255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 233 of 255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 236 of 255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 237 of 255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 238 of 255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 239 of 255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 240 of 255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 249 of 255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 252 of 255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 253 of 255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 956 of 1006 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 983 of 1006 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnu-efi-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnu-efi-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe systemd-bootconf-1.00-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 984 of 1006 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb:do_configure)
NOTE: Running task 985 of 1006 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_configure)
NOTE: recipe gnu-efi-3.0.14-r0: task do_configure: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_configure: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_configure: Succeeded
NOTE: Running task 986 of 1006 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_compile)
NOTE: recipe gnu-efi-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 987 of 1006 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb:do_compile)
NOTE: recipe systemd-bootconf-1.00-r0: task do_compile: Started
NOTE: recipe gnu-efi-3.0.14-r0: task do_compile: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_compile: Succeeded
NOTE: Running task 988 of 1006 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_install)
NOTE: recipe gnu-efi-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 989 of 1006 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb:do_install)
NOTE: recipe systemd-bootconf-1.00-r0: task do_install: Started
NOTE: recipe gnu-efi-3.0.14-r0: task do_install: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_install: Succeeded
NOTE: Running task 990 of 1006 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_package)
NOTE: recipe systemd-bootconf-1.00-r0: task do_package: Started
NOTE: recipe gnu-efi-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 991 of 1006 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 992 of 1006 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb:do_package)
NOTE: recipe gnu-efi-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe gnu-efi-3.0.14-r0: task do_package: Started
NOTE: recipe gnu-efi-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 993 of 1006 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_251.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-boot-251.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_package: Succeeded
NOTE: Running task 994 of 1006 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_packagedata)
NOTE: recipe systemd-bootconf-1.00-r0: task do_packagedata: Started
NOTE: recipe systemd-boot-251.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 995 of 1006 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_251.4.bb:do_configure)
NOTE: recipe systemd-bootconf-1.00-r0: task do_packagedata: Succeeded
NOTE: Running task 996 of 1006 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_package_write_rpm)
NOTE: recipe systemd-boot-251.4-r0: task do_configure: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_package_write_rpm: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnu-efi-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 997 of 1006 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb:do_packagedata)
NOTE: recipe gnu-efi-3.0.14-r0: task do_packagedata: Started
NOTE: recipe gnu-efi-3.0.14-r0: task do_packagedata: Failed
NOTE: recipe systemd-boot-251.4-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 997 tasks of which 967 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: gnu-efi-3.0.14-r0 do_packagedata: QA Issue: Package version for package gnu-efi-src went backwards which would break package feeds (from 0:3.0.15-r0 to 0:3.0.14-r0) [version-going-backwards]
ERROR: gnu-efi-3.0.14-r0 do_packagedata: QA Issue: Package version for package gnu-efi-dbg went backwards which would break package feeds (from 0:3.0.15-r0 to 0:3.0.14-r0) [version-going-backwards]
ERROR: gnu-efi-3.0.14-r0 do_packagedata: QA Issue: Package version for package gnu-efi-staticdev went backwards which would break package feeds (from 0:3.0.15-r0 to 0:3.0.14-r0) [version-going-backwards]
ERROR: gnu-efi-3.0.14-r0 do_packagedata: QA Issue: Package version for package gnu-efi-dev went backwards which would break package feeds (from 0:3.0.15-r0 to 0:3.0.14-r0) [version-going-backwards]
ERROR: gnu-efi-3.0.14-r0 do_packagedata: QA Issue: Package version for package gnu-efi-doc went backwards which would break package feeds (from 0:3.0.15-r0 to 0:3.0.14-r0) [version-going-backwards]
ERROR: gnu-efi-3.0.14-r0 do_packagedata: QA Issue: Package version for package gnu-efi-locale went backwards which would break package feeds (from 0:3.0.15-r0 to 0:3.0.14-r0) [version-going-backwards]
ERROR: gnu-efi-3.0.14-r0 do_packagedata: QA Issue: Package version for package gnu-efi went backwards which would break package feeds (from 0:3.0.15-r0 to 0:3.0.14-r0) [version-going-backwards]
ERROR: gnu-efi-3.0.14-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/gnu-efi/3.0.14-r0/temp/log.do_packagedata.569714
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb:do_packagedata) failed with exit code '1'

--===============5159369511954199275==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1658 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (882 cached, 2 parsed). 1658 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-832312428027d455c3bd01737de97b2a2e617e94"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:832312428027d455c3bd01737de97b2a2e617e94"
workspace            = "master:21cfb871f7da604f1fab957d7747cb03b113b971"

Initialising tasks...done.
Sstate summary: Wanted 16 Local 0 Mirrors 0 Missed 16 Current 238 (0% match, 93% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 846 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb:do_fetch)
NOTE: Running task 858 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_251.4.bb:do_fetch)
NOTE: Running task 904 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_fetch)
NOTE: Running task 958 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_251.4.bb:do_write_config)
NOTE: recipe systemd-bootconf-1.00-r0: task do_fetch: Started
NOTE: recipe gnu-efi-3.0.14-r0: task do_fetch: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_fetch: Succeeded
NOTE: recipe systemd-boot-251.4-r0: task do_fetch: Started
NOTE: Running task 971 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_unpack)
NOTE: Running task 972 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-boot-251.4-r0: task do_write_config: Started
NOTE: recipe gnu-efi-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 973 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb:do_unpack)
NOTE: Running task 974 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-boot-251.4-r0: task do_fetch: Succeeded
NOTE: recipe systemd-boot-251.4-r0: task do_write_config: Succeeded
NOTE: Running task 975 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_251.4.bb:do_unpack)
NOTE: recipe systemd-bootconf-1.00-r0: task do_unpack: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_unpack: Succeeded
NOTE: recipe gnu-efi-3.0.14-r0: task do_unpack: Started
NOTE: Running task 976 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_patch)
NOTE: recipe gnu-efi-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-boot-251.4-r0: task do_unpack: Started
NOTE: recipe gnu-efi-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe systemd-bootconf-1.00-r0: task do_patch: Started
NOTE: Running task 977 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb:do_patch)
NOTE: recipe gnu-efi-3.0.14-r0: task do_patch: Started
NOTE: recipe gnu-efi-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe systemd-bootconf-1.00-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe systemd-bootconf-1.00-r0: task do_patch: Succeeded
NOTE: Running task 978 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_deploy_source_date_epoch)
NOTE: recipe systemd-bootconf-1.00-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnu-efi-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 979 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe systemd-bootconf-1.00-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 980 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_configure)
NOTE: recipe gnu-efi-3.0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_configure: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_configure: Succeeded
NOTE: Running task 981 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_compile)
NOTE: recipe gnu-efi-3.0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 982 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb:do_configure)
NOTE: recipe systemd-bootconf-1.00-r0: task do_compile: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_compile: Succeeded
NOTE: recipe gnu-efi-3.0.14-r0: task do_configure: Started
NOTE: Running task 983 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_install)
NOTE: recipe gnu-efi-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe systemd-boot-251.4-r0: task do_unpack: Succeeded
NOTE: Running task 984 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_251.4.bb:do_patch)
NOTE: Running task 985 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb:do_compile)
NOTE: recipe gnu-efi-3.0.14-r0: task do_compile: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_install: Started
NOTE: recipe systemd-boot-251.4-r0: task do_patch: Started
NOTE: recipe systemd-boot-251.4-r0: task do_patch: Succeeded
NOTE: Running task 986 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_251.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 987 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_251.4.bb:do_populate_lic)
NOTE: recipe systemd-bootconf-1.00-r0: task do_install: Succeeded
NOTE: Running task 988 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_package)
NOTE: recipe systemd-boot-251.4-r0: task do_populate_lic: Started
NOTE: recipe systemd-boot-251.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_package: Started
NOTE: recipe systemd-boot-251.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_251.4.bb:do_populate_lic unihash changed to f3452c4f39372017f6f9e77ea40bfb598336b0decf1176543760a11c35c43bda
NOTE: recipe systemd-boot-251.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnu-efi-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 989 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb:do_install)
NOTE: recipe gnu-efi-3.0.14-r0: task do_install: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_package: Succeeded
NOTE: Running task 990 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_packagedata)
NOTE: recipe gnu-efi-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 991 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 992 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb:do_package)
NOTE: recipe systemd-bootconf-1.00-r0: task do_packagedata: Started
NOTE: recipe gnu-efi-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe gnu-efi-3.0.14-r0: task do_package: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_packagedata: Succeeded
NOTE: Running task 993 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_package_write_rpm)
NOTE: recipe systemd-bootconf-1.00-r0: task do_package_write_rpm: Started
NOTE: recipe gnu-efi-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 994 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_251.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-boot-251.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_package_write_rpm: Succeeded
NOTE: recipe systemd-boot-251.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 995 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_251.4.bb:do_configure)
NOTE: recipe systemd-boot-251.4-r0: task do_configure: Started
NOTE: recipe gnu-efi-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 996 of 1005 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb:do_packagedata)
NOTE: recipe gnu-efi-3.0.14-r0: task do_packagedata: Started
NOTE: recipe gnu-efi-3.0.14-r0: task do_packagedata: Failed
NOTE: recipe systemd-boot-251.4-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 996 tasks of which 966 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: gnu-efi-3.0.14-r0 do_packagedata: QA Issue: Package version for package gnu-efi-src went backwards which would break package feeds (from 0:3.0.15-r0 to 0:3.0.14-r0) [version-going-backwards]
ERROR: gnu-efi-3.0.14-r0 do_packagedata: QA Issue: Package version for package gnu-efi-dbg went backwards which would break package feeds (from 0:3.0.15-r0 to 0:3.0.14-r0) [version-going-backwards]
ERROR: gnu-efi-3.0.14-r0 do_packagedata: QA Issue: Package version for package gnu-efi-staticdev went backwards which would break package feeds (from 0:3.0.15-r0 to 0:3.0.14-r0) [version-going-backwards]
ERROR: gnu-efi-3.0.14-r0 do_packagedata: QA Issue: Package version for package gnu-efi-dev went backwards which would break package feeds (from 0:3.0.15-r0 to 0:3.0.14-r0) [version-going-backwards]
ERROR: gnu-efi-3.0.14-r0 do_packagedata: QA Issue: Package version for package gnu-efi-doc went backwards which would break package feeds (from 0:3.0.15-r0 to 0:3.0.14-r0) [version-going-backwards]
ERROR: gnu-efi-3.0.14-r0 do_packagedata: QA Issue: Package version for package gnu-efi-locale went backwards which would break package feeds (from 0:3.0.15-r0 to 0:3.0.14-r0) [version-going-backwards]
ERROR: gnu-efi-3.0.14-r0 do_packagedata: QA Issue: Package version for package gnu-efi went backwards which would break package feeds (from 0:3.0.15-r0 to 0:3.0.14-r0) [version-going-backwards]
ERROR: gnu-efi-3.0.14-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-efi/3.0.14-r0/temp/log.do_packagedata.557489
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.14.bb:do_packagedata) failed with exit code '1'

--===============5159369511954199275==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1658 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: Nothing PROVIDES 'systemd-boot'
systemd-boot was skipped: incompatible with host powerpc-poky-linux (not in COMPATIBLE_HOST)

--===============5159369511954199275==--

