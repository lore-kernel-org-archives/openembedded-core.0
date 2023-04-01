Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57910C88CB1
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 21:29:03 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.32137.1680384534816917459
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 14:28:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=FM9cgZND;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101873eb92628-177b3913-1483-4aa1-9a35-0300f163a236-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1680384534;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=P0X4LQm0BzIOsItm6Zswj1ut+HP27qoptjxC0+MGtOo=;
	b=FM9cgZNDdq/MoUfTw08SbiYFJi/NfbtKv6c7bTsEBdfWykPXFQqvfnrmqOSKH4BU
	K/nN84ugCxI0RSB2SMj9sz8XRsYt088yEZ0m4IJMShGT2clGYRW5XAgX78QvOx2g8Be
	BsjZZBeonD8dUAkQvEjL91/wLxslOEUHRuzYWTF0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1680384534;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=P0X4LQm0BzIOsItm6Zswj1ut+HP27qoptjxC0+MGtOo=;
	b=qjlIjsTOAiNEjQV+cx219R1SXrAfTLFqMQxPFEOwmAq0WGNbH9ttJGEHNE/CQsdM
	D22i5Ohyisnbg9KXoY7O+yil3PTK+m1Mv+sE78xf6u3kLpmlqaqLLPOF7a/K0/X4vTa
	qwNtCPe23GbBeKIcmRjRdyKd1MVllnH34I2MnJJc=
Content-Type: multipart/mixed; boundary="===============4456098749427792406=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pytz: upgrading to 2023.3 SUCCEEDED
Message-ID: <010101873eb92628-177b3913-1483-4aa1-9a35-0300f163a236-000000@us-west-2.amazonses.com>
Date: Sat, 1 Apr 2023 21:28:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 21:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179506

--===============4456098749427792406==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pytz* to *2023.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pytz-upgrade-2022.7.1-2023.3.patch
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
--===============4456098749427792406==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pytz-upgrade-2022.7.1-2023.3.patch"

RnJvbSBmMDFmNmI3ZWZjZGM4NjBjODMwZWRmYmYyOTkyZmM3Mjk3MGJhOTYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBBcHIgMjAyMyAxMDowMDoxMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHl0ejogdXBncmFkZSAyMDIyLjcuMSAtPiAyMDIzLjMKCi0tLQogLi4uL3B5dGhvbi97
cHl0aG9uMy1weXR6XzIwMjIuNy4xLmJiID0+IHB5dGhvbjMtcHl0el8yMDIzLjMuYmJ9IHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1weXR6XzIwMjIuNy4xLmJiID0+
IHB5dGhvbjMtcHl0el8yMDIzLjMuYmJ9ICg5MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5dHpfMjAyMi43LjEuYmIgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0el8yMDIzLjMuYmIKc2ltaWxhcml0eSBpbmRleCA5
MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5dHpf
MjAyMi43LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1weXR6XzIwMjMuMy5iYgppbmRleCBlMzk5ZjIxMzlhLi4wOWZhMjYwOTNmIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0el8yMDIyLjcuMS5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0el8yMDIzLjMuYmIK
QEAgLTUsNyArNSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0O21k
NT0xYTY3ZmM0NmMxYjU5NmNjZTVkMjEyMDliYmU3NTk5OSIKIAogaW5oZXJpdCBweXBpIHNldHVw
dG9vbHMzIHB0ZXN0CiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIwMWEwNjgxYzRiOTY4NGEyODMw
NDYxNWViYTU1ZDFhYjMxYWUwMGJmNjhlYzE1N2VjMzcwOGE4MTgyZGJiY2QwIgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjFkOGNlMjlkYjE4OTE5MWZiNTUzMzhlZTZkMDM4N2Q4MmFiNTlmM2QwMGVh
YzEwMzQxMmQ2NGUwZWJkMGM1ODgiCiAKIFJERVBFTkRTOiR7UE59OmNsYXNzLXRhcmdldCArPSAi
XAogICAgICR7UFlUSE9OX1BOfS1kYXRldGltZSBcCi0tIAoyLjM5LjIKCg==

--===============4456098749427792406==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1797 targets, 73 skipped, 0 masked, 0 errors.
Removing 2 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-be2bebba9bd1893f4fe71ea72124cea5bf310241"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:be2bebba9bd1893f4fe71ea72124cea5bf310241"
workspace            = "master:d59756912cd450b0af3d8893b822c66dafe42544"

Initialising tasks...done.
Sstate summary: Wanted 17 Local 7 Mirrors 0 Missed 10 Current 372 (41% match, 97% complete)
Removing 2 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 376 of 389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_packagedata_setscene)
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-importlib-metadata/6.0.0-r0/temp/log.do_packagedata_setscene.3287998
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 388 of 389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_package_setscene)
NOTE: Running task 912 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_fetch)
NOTE: Running task 1084 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-pytz-2023.3-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_fetch: Succeeded
NOTE: Running task 1085 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_unpack)
NOTE: Running task 1086 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2023.3-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_package_setscene: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_unpack: Succeeded
NOTE: Running task 1442 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_patch)
NOTE: recipe python3-pytz-2023.3-r0: task do_patch: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1452 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1453 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_patch: Succeeded
NOTE: Running task 1459 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1460 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_populate_lic)
NOTE: recipe python3-pytz-2023.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_populate_lic: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_populate_lic unihash changed to ec05572fa6010c9fa9845945c67bfd7eed71a85aa3f06a7117dc2aa9d1f16d00
NOTE: recipe python3-pytz-2023.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1462 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_configure)
NOTE: recipe python3-pytz-2023.3-r0: task do_configure: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_configure: Succeeded
NOTE: Running task 1463 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_configure_ptest_base)
NOTE: recipe python3-pytz-2023.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1464 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1465 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-pytz-2023.3-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 7994dc0197a3d7f2ae99e629c620e5b799d87ecde32071472b49df20689399c2
NOTE: recipe python3-pytz-2023.3-r0: task do_compile: Succeeded
NOTE: Running task 1470 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_compile_ptest_base)
NOTE: recipe python3-pytz-2023.3-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1471 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_install)
NOTE: recipe python3-pytz-2023.3-r0: task do_install: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_install: Succeeded
NOTE: Running task 1472 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_install_ptest_base)
NOTE: recipe python3-pytz-2023.3-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1473 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_package)
NOTE: Running task 1474 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_populate_sysroot)
NOTE: recipe python3-pytz-2023.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_package: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_package: Succeeded
NOTE: Running task 1475 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_packagedata)
NOTE: recipe python3-pytz-2023.3-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1476 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_package_write_rpm)
NOTE: Running task 1477 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_package_qa)
NOTE: recipe python3-pytz-2023.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_package_qa: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1478 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_build)
NOTE: Tasks Summary: Attempted 1478 tasks of which 1456 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-importlib-metadata-6.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.0.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4456098749427792406==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pytz: PKGV changed from 2022.7.1 [default] to 2023.3 [default]
packages/core2-32-poky-linux/python3-pytz: PV changed from "2022.7.1" to "2023.3"
packages/core2-32-poky-linux/python3-pytz: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pytz/pytz-2022.7.1.tar.gz;downloadfilename=pytz-2022.7.1.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/p/pytz/pytz-2023.3.tar.gz;downloadfilename=pytz-2023.3.tar.gz file://run-ptest"
packages/core2-32-poky-linux/python3-pytz/python3-pytz-dbg: PV changed from "2022.7.1" to "2023.3"
packages/core2-32-poky-linux/python3-pytz/python3-pytz-dbg: PKGV changed from 2022.7.1 [default] to 2023.3 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz-dev: PV changed from "2022.7.1" to "2023.3"
packages/core2-32-poky-linux/python3-pytz/python3-pytz-dev: PKGV changed from 2022.7.1 [default] to 2023.3 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz-doc: PV changed from "2022.7.1" to "2023.3"
packages/core2-32-poky-linux/python3-pytz/python3-pytz-doc: PKGV changed from 2022.7.1 [default] to 2023.3 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz-locale: PV changed from "2022.7.1" to "2023.3"
packages/core2-32-poky-linux/python3-pytz/python3-pytz-locale: PKGV changed from 2022.7.1 [default] to 2023.3 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz-ptest: PV changed from "2022.7.1" to "2023.3"
packages/core2-32-poky-linux/python3-pytz/python3-pytz-ptest: PKGSIZE changed from 58760 to 59413 (+1%)
packages/core2-32-poky-linux/python3-pytz/python3-pytz-ptest: PKGV changed from 2022.7.1 [default] to 2023.3 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz-src: PV changed from "2022.7.1" to "2023.3"
packages/core2-32-poky-linux/python3-pytz/python3-pytz-src: PKGV changed from 2022.7.1 [default] to 2023.3 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz-staticdev: PV changed from "2022.7.1" to "2023.3"
packages/core2-32-poky-linux/python3-pytz/python3-pytz-staticdev: PKGV changed from 2022.7.1 [default] to 2023.3 [default]
packages/core2-32-poky-linux/python3-pytz/python3-pytz: PV changed from "2022.7.1" to "2023.3"
packages/core2-32-poky-linux/python3-pytz/python3-pytz: PKGSIZE changed from 1062247 to 1069549 (+1%)
packages/core2-32-poky-linux/python3-pytz/python3-pytz: PKGV changed from 2022.7.1 [default] to 2023.3 [default]
Changes to packages/core2-32-poky-linux/python3-pytz (sysroot):
  /usr/lib/python3.11/site-packages/pytz-2023.3.dist-info was added
  /usr/lib/python3.11/site-packages/pytz-2023.3.dist-info/LICENSE.txt was added
  /usr/lib/python3.11/site-packages/pytz-2023.3.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/pytz-2023.3.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/pytz-2023.3.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/pytz-2023.3.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/pytz-2023.3.dist-info/zip-safe was added
  /usr/lib/python3.11/site-packages/pytz-2022.7.1.dist-info was removed
  /usr/lib/python3.11/site-packages/pytz-2022.7.1.dist-info/LICENSE.txt was removed
  /usr/lib/python3.11/site-packages/pytz-2022.7.1.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/pytz-2022.7.1.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/pytz-2022.7.1.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/pytz-2022.7.1.dist-info/WHEEL was removed
  /usr/lib/python3.11/site-packages/pytz-2022.7.1.dist-info/zip-safe was removed

--===============4456098749427792406==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1799 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1797 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-be2bebba9bd1893f4fe71ea72124cea5bf310241"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:be2bebba9bd1893f4fe71ea72124cea5bf310241"
workspace            = "master:d59756912cd450b0af3d8893b822c66dafe42544"

Initialising tasks...done.
Sstate summary: Wanted 17 Local 7 Mirrors 0 Missed 10 Current 372 (41% match, 97% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 376 of 389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_packagedata_setscene)
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-importlib-metadata/6.0.0-r0/temp/log.do_packagedata_setscene.3277783
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 388 of 389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_package_setscene)
NOTE: Running task 912 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_fetch)
NOTE: Running task 1085 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-pytz-2023.3-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_fetch: Succeeded
NOTE: Running task 1086 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_unpack)
NOTE: Running task 1087 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_unpack: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_package_setscene: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_unpack: Succeeded
NOTE: Running task 1442 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_patch)
NOTE: recipe python3-pytz-2023.3-r0: task do_patch: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1452 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1453 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_patch: Succeeded
NOTE: Running task 1459 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1460 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_populate_lic)
NOTE: recipe python3-pytz-2023.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_populate_lic: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_populate_lic unihash changed to ec05572fa6010c9fa9845945c67bfd7eed71a85aa3f06a7117dc2aa9d1f16d00
NOTE: recipe python3-pytz-2023.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1462 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_configure)
NOTE: recipe python3-pytz-2023.3-r0: task do_configure: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_configure: Succeeded
NOTE: Running task 1463 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_configure_ptest_base)
NOTE: recipe python3-pytz-2023.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1464 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_compile)
NOTE: Running task 1465 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 36deaa96c352f3b0c6063b0341b3a10810745556a80ce4a4680e35c33ecc2227
NOTE: recipe python3-pytz-2023.3-r0: task do_compile: Succeeded
NOTE: Running task 1470 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_compile_ptest_base)
NOTE: recipe python3-pytz-2023.3-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1471 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_install)
NOTE: recipe python3-pytz-2023.3-r0: task do_install: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_install: Succeeded
NOTE: Running task 1472 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_install_ptest_base)
NOTE: recipe python3-pytz-2023.3-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1473 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_package)
NOTE: Running task 1474 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_populate_sysroot)
NOTE: recipe python3-pytz-2023.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_package: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_package: Succeeded
NOTE: Running task 1475 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_packagedata)
NOTE: recipe python3-pytz-2023.3-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1476 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_package_write_rpm)
NOTE: Running task 1477 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_package_qa)
NOTE: recipe python3-pytz-2023.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_package_qa: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1478 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_build)
NOTE: Tasks Summary: Attempted 1478 tasks of which 1456 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-importlib-metadata-6.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.0.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4456098749427792406==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-pytz (sysroot):
  /usr/lib/python3.11/site-packages/pytz-2023.3.dist-info was added
  /usr/lib/python3.11/site-packages/pytz-2023.3.dist-info/LICENSE.txt was added
  /usr/lib/python3.11/site-packages/pytz-2023.3.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/pytz-2023.3.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/pytz-2023.3.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/pytz-2023.3.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/pytz-2023.3.dist-info/zip-safe was added
  /usr/lib/python3.11/site-packages/pytz-2022.7.1.dist-info was removed
  /usr/lib/python3.11/site-packages/pytz-2022.7.1.dist-info/LICENSE.txt was removed
  /usr/lib/python3.11/site-packages/pytz-2022.7.1.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/pytz-2022.7.1.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/pytz-2022.7.1.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/pytz-2022.7.1.dist-info/WHEEL was removed
  /usr/lib/python3.11/site-packages/pytz-2022.7.1.dist-info/zip-safe was removed

--===============4456098749427792406==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1797 targets, 50 skipped, 0 masked, 0 errors.
Removing 26 recipes from the core2-32 sysroot...done.
Removing 50 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-be2bebba9bd1893f4fe71ea72124cea5bf310241"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:be2bebba9bd1893f4fe71ea72124cea5bf310241"
workspace            = "master:d59756912cd450b0af3d8893b822c66dafe42544"

Initialising tasks...done.
Sstate summary: Wanted 202 Local 192 Mirrors 0 Missed 10 Current 183 (95% match, 97% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 184 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 185 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 193 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 194 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 195 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 196 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm_setscene)
NOTE: Running task 642 of 1463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-7.2.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_fetch: Started
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_fetch: Succeeded
NOTE: Running task 832 of 1463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_unpack)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 201 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 202 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-7.2.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 203 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 204 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 205 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 206 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 207 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 208 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 209 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 210 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 211 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 212 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 213 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 214 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 215 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_unpack: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-22.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-23.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-more-itertools-9.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-67.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_unpack: Succeeded
NOTE: Running setscene task 217 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 218 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 219 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 220 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 221 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 837 of 1463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_patch)
NOTE: recipe python3-attrs-22.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-23.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-importlib-metadata/6.0.0-r0/temp/log.do_packagedata_setscene.3291843
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 229 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_package_setscene)
NOTE: recipe python3-pytest-7.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_patch: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-67.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-more-itertools-9.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_patch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 257 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 258 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 259 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running task 843 of 1463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 903 of 1463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_populate_lic)
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 268 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 270 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 272 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.67-r0: task do_packagedata_setscene: Started
NOTE: Running task 916 of 1463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_populate_lic unihash changed to ec05572fa6010c9fa9845945c67bfd7eed71a85aa3f06a7117dc2aa9d1f16d00
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-2.67-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 280 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 285 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running task 933 of 1463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 938 of 1463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_package_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 939 of 1463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 291 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 292 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running task 949 of 1463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running task 950 of 1463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 951 of 1463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 294 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.10.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 298 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 299 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 300 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 301 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 302 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 303 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.0.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 307 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 308 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 309 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 311 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 312 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 313 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 314 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 315 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 316 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.41.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 318 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 321 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.41.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 960 of 1463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 326 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 332 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 340 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 341 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 345 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 347 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 354 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 355 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 358 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 360 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 362 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+7d756e1c04-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 363 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+7d756e1c04-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 366 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 367 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 368 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+7d756e1c04-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+7d756e1c04-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 371 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 372 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1028 of 1463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 378 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 4fad8b7554539667ce2afee5751d0311916de63fc4ed5f22dafc5460023d6d50
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 382 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 383 of 385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1234 of 1463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1436 of 1463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_packagedata)
NOTE: recipe python3-pytz-2023.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1452 of 1463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_configure)
NOTE: recipe python3-pytz-2023.3-r0: task do_configure: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_configure: Succeeded
NOTE: Running task 1453 of 1463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_configure_ptest_base)
NOTE: recipe python3-pytz-2023.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1454 of 1463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_compile)
NOTE: recipe python3-pytz-2023.3-r0: task do_compile: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_compile: Succeeded
NOTE: Running task 1455 of 1463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_compile_ptest_base)
NOTE: recipe python3-pytz-2023.3-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1456 of 1463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_install)
NOTE: recipe python3-pytz-2023.3-r0: task do_install: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_install: Succeeded
NOTE: Running task 1457 of 1463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_install_ptest_base)
NOTE: recipe python3-pytz-2023.3-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1458 of 1463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_package)
NOTE: Running task 1459 of 1463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_populate_sysroot)
NOTE: recipe python3-pytz-2023.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_package: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_package: Succeeded
NOTE: Running task 1460 of 1463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_packagedata)
NOTE: recipe python3-pytz-2023.3-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1461 of 1463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_package_write_rpm)
NOTE: Running task 1462 of 1463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_package_qa)
NOTE: recipe python3-pytz-2023.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_package_qa: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1463 of 1463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_build)
NOTE: Tasks Summary: Attempted 1463 tasks of which 1435 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-importlib-metadata-6.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.0.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4456098749427792406==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1797 targets, 66 skipped, 0 masked, 0 errors.
Removing 2 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-be2bebba9bd1893f4fe71ea72124cea5bf310241"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:be2bebba9bd1893f4fe71ea72124cea5bf310241"
workspace            = "master:d59756912cd450b0af3d8893b822c66dafe42544"

Initialising tasks...done.
Sstate summary: Wanted 17 Local 7 Mirrors 0 Missed 10 Current 372 (41% match, 97% complete)
Removing 2 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 376 of 389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_packagedata_setscene)
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-importlib-metadata/6.0.0-r0/temp/log.do_packagedata_setscene.3284622
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 388 of 389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_package_setscene)
NOTE: Running task 912 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_fetch)
NOTE: Running task 1084 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-pytz-2023.3-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_fetch: Succeeded
NOTE: Running task 1085 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_unpack)
NOTE: Running task 1086 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_unpack: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_package_setscene: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_unpack: Succeeded
NOTE: Running task 1442 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_patch)
NOTE: recipe python3-pytz-2023.3-r0: task do_patch: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1452 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1453 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-pytz-2023.3-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 1459 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1460 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_populate_lic)
NOTE: recipe python3-pytz-2023.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_populate_lic: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_populate_lic unihash changed to ec05572fa6010c9fa9845945c67bfd7eed71a85aa3f06a7117dc2aa9d1f16d00
NOTE: recipe python3-pytz-2023.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1462 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_configure)
NOTE: recipe python3-pytz-2023.3-r0: task do_configure: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_configure: Succeeded
NOTE: Running task 1463 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_configure_ptest_base)
NOTE: recipe python3-pytz-2023.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1464 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_compile)
NOTE: Running task 1465 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to f72d0fa918541ffac38106c61c0e1fbcf619abfac616beca13b0c759dc5962a5
NOTE: recipe python3-pytz-2023.3-r0: task do_compile: Succeeded
NOTE: Running task 1470 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_compile_ptest_base)
NOTE: recipe python3-pytz-2023.3-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1471 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_install)
NOTE: recipe python3-pytz-2023.3-r0: task do_install: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_install: Succeeded
NOTE: Running task 1472 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_install_ptest_base)
NOTE: recipe python3-pytz-2023.3-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1473 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_package)
NOTE: Running task 1474 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_populate_sysroot)
NOTE: recipe python3-pytz-2023.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_package: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_package: Succeeded
NOTE: Running task 1475 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_packagedata)
NOTE: recipe python3-pytz-2023.3-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1476 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_package_write_rpm)
NOTE: Running task 1477 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_package_qa)
NOTE: recipe python3-pytz-2023.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_package_qa: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1478 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_build)
NOTE: Tasks Summary: Attempted 1478 tasks of which 1456 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-importlib-metadata-6.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.0.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4456098749427792406==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1797 targets, 56 skipped, 0 masked, 0 errors.
Removing 2 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-be2bebba9bd1893f4fe71ea72124cea5bf310241"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:be2bebba9bd1893f4fe71ea72124cea5bf310241"
workspace            = "master:d59756912cd450b0af3d8893b822c66dafe42544"

Initialising tasks...done.
Sstate summary: Wanted 17 Local 7 Mirrors 0 Missed 10 Current 372 (41% match, 97% complete)
Removing 2 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 376 of 389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_packagedata_setscene)
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 912 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_fetch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-importlib-metadata/6.0.0-r0/temp/log.do_packagedata_setscene.3281206
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 388 of 389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_package_setscene)
NOTE: recipe python3-pytz-2023.3-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_fetch: Succeeded
NOTE: Running task 1037 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_unpack)
NOTE: Running task 1038 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1086 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-pytz-2023.3-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_unpack: Succeeded
NOTE: Running task 1087 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_patch: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_package_setscene: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_patch: Succeeded
NOTE: Running task 1443 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1444 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_populate_lic)
NOTE: recipe python3-pytz-2023.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_populate_lic: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_package_setscene: Succeeded
NOTE: Running task 1454 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.0.0.bb:do_packagedata)
NOTE: recipe python3-pytz-2023.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_populate_lic unihash changed to ec05572fa6010c9fa9845945c67bfd7eed71a85aa3f06a7117dc2aa9d1f16d00
NOTE: Setscene tasks completed
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1455 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_configure)
NOTE: Running task 1456 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_configure: Started
NOTE: recipe python3-importlib-metadata-6.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_configure: Succeeded
NOTE: Running task 1463 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_configure_ptest_base)
NOTE: recipe python3-pytz-2023.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1464 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_compile)
NOTE: recipe python3-pytz-2023.3-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1465 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to ee640553c9ed7531eb4120f495a1c27eae33b911eb232233bf76a7c935b60339
NOTE: recipe python3-pytz-2023.3-r0: task do_compile: Succeeded
NOTE: Running task 1470 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_compile_ptest_base)
NOTE: recipe python3-pytz-2023.3-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1471 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_install)
NOTE: recipe python3-pytz-2023.3-r0: task do_install: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_install: Succeeded
NOTE: Running task 1472 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_install_ptest_base)
NOTE: recipe python3-pytz-2023.3-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1473 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_package)
NOTE: Running task 1474 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_populate_sysroot)
NOTE: recipe python3-pytz-2023.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_package: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_package: Succeeded
NOTE: Running task 1475 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_packagedata)
NOTE: recipe python3-pytz-2023.3-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1476 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_package_write_rpm)
NOTE: Running task 1477 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_package_qa)
NOTE: recipe python3-pytz-2023.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_package_qa: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1478 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_build)
NOTE: Tasks Summary: Attempted 1478 tasks of which 1456 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-importlib-metadata-6.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:6.1.0-r0 to 0:6.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.0.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4456098749427792406==--

