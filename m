Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03A16CA9EB4
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 18:01:31 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.13799.1681581684515391763
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 11:01:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=gtFqBMIj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018786143310-ecf2b0ed-5cf9-4726-9c97-4d1caf82a60b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1681581683;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=THVez8EfREg94dw6yN7Gsu3MhlWB9YoTFq+4Q7Ak6dU=;
	b=gtFqBMIjjvUMfbDRCi1qFTE+p38ZTEroLR1liL5NOZxvBUPhIDPtp7EkALwvam8o
	zTdqjWqYN/ArRIVC5aNvqrNR7Pk80vTqRLTrwT7MYsSJMld/ui/sPBr25U8v9/L/ALq
	ag98DTkhANZyDao8JklrHiONFTu/WzVtBI1LI1vU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1681581683;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=THVez8EfREg94dw6yN7Gsu3MhlWB9YoTFq+4Q7Ak6dU=;
	b=FXeZ/wejPv/3t4DTXIG9dtLIA/AgOQTT7woc4tTo6FipLcsB3J/tiu2/lhYYZ9Ce
	Q87CqRB9nj6pYfUsivSVaRGnASMkFdPmgdZxgVYjdTCPWBuo3yfu8Dyu5KG9iF24KoG
	I7/fEs/iLA7Qcv7pcPoxX/l0yiOIHEKBKky+g9Cs=
Content-Type: multipart/mixed; boundary="===============0290210693131635104=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-networking: upgrading to 2.76.0 SUCCEEDED
Message-ID: <0101018786143310-ecf2b0ed-5cf9-4726-9c97-4d1caf82a60b-000000@us-west-2.amazonses.com>
Date: Sat, 15 Apr 2023 18:01:23 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 18:01:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180027

--===============0290210693131635104==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glib-networking* to *2.76.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glib-networking-upgrade-2.74.0-2.76.0.patch
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
--===============0290210693131635104==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glib-networking-upgrade-2.74.0-2.76.0.patch"

RnJvbSA0MGI2ZjIxZDA3NmRlY2E1YTIxMzJhYTljY2VmMjMxYTA1MWRjNTU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgQXByIDIwMjMgMDc6MzI6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bGliLW5ldHdvcmtpbmc6IHVwZ3JhZGUgMi43NC4wIC0+IDIuNzYuMAoKLS0tCiAuLi4ve2dsaWIt
bmV0d29ya2luZ18yLjc0LjAuYmIgPT4gZ2xpYi1uZXR3b3JraW5nXzIuNzYuMC5iYn0gICAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtY29yZS9nbGliLW5ldHdvcmtpbmcve2dsaWItbmV0d29ya2luZ18yLjc0
LjAuYmIgPT4gZ2xpYi1uZXR3b3JraW5nXzIuNzYuMC5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtY29yZS9nbGliLW5ldHdvcmtpbmcvZ2xpYi1uZXR3b3JraW5nXzIuNzQuMC5i
YiBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItbmV0d29ya2luZy9nbGliLW5ldHdvcmtpbmdfMi43
Ni4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3Jl
L2dsaWItbmV0d29ya2luZy9nbGliLW5ldHdvcmtpbmdfMi43NC4wLmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtY29yZS9nbGliLW5ldHdvcmtpbmcvZ2xpYi1uZXR3b3JraW5nXzIuNzYuMC5iYgpp
bmRleCBkYzBiZTIzMzU3Li5jMWRjMGJjYmRlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29y
ZS9nbGliLW5ldHdvcmtpbmcvZ2xpYi1uZXR3b3JraW5nXzIuNzQuMC5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtY29yZS9nbGliLW5ldHdvcmtpbmcvZ2xpYi1uZXR3b3JraW5nXzIuNzYuMC5iYgpAQCAt
OSw3ICs5LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NGZiZDY1
MzgwY2RkMjU1OTUxMDc5MDA4YjM2NDUxNmMiCiBTRUNUSU9OID0gImxpYnMiCiBERVBFTkRTID0g
ImdsaWItMi4wLW5hdGl2ZSBnbGliLTIuMCIKIAotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0g
PSAiMWYxODVhYWVmMDk0MTIzZjhlMjVkOGZhNTU2NjFiM2ZkNzEwMjAxNjNhMDE3NGFkYjM1YTM3
Njg1Y2RhNjEzYiIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjE0OWEwNWExNzllNjI5
YTUzOGJlMjU2NjJhYTMyNGI0OTlkN2M0NTQ5YzUxNTFkYjUzNzNlNzgwYTFiZjFiOWEiCiAKIFBB
Q0tBR0VDT05GSUcgPz89ICJvcGVuc3NsICR7QGJiLnV0aWxzLmNvbnRhaW5zKCdQVEVTVF9FTkFC
TEVEJywgJzEnLCAndGVzdHMnLCAnJywgZCl9IgogCi0tIAoyLjM5LjIKCg==

--===============0290210693131635104==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1801 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1799 targets, 39 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b2c1beedeafc10c0f2ff0db3fe20c5bd3a282a17"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 13 Local 4 Mirrors 0 Missed 9 Current 423 (30% match, 97% complete)
Removing 1 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 432 of 436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1088 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_fetch)
NOTE: Running task 1159 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_write_config)
NOTE: recipe glib-networking-2.76.0-r0: task do_fetch: Started
NOTE: Running task 1564 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_rpm)
NOTE: recipe glib-networking-2.76.0-r0: task do_write_config: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_fetch: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/coreutils/9.1-r0/temp/log.do_packagedata_setscene.1014056
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe glib-networking-2.76.0-r0: task do_write_config: Succeeded
NOTE: Running setscene task 435 of 436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package_setscene)
NOTE: Running task 1565 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_unpack)
NOTE: Running task 1566 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_unpack: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.1-r0: task do_package_setscene: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_unpack: Succeeded
NOTE: Running task 1568 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_patch)
NOTE: recipe glib-networking-2.76.0-r0: task do_patch: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_patch: Succeeded
NOTE: Running task 1569 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1570 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_populate_lic)
NOTE: recipe glib-networking-2.76.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-networking-2.76.0-r0: task do_populate_lic: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_populate_lic unihash changed to 3e4f6144901d4608af657bbe8b2b0de3c823ceba6bbb792ade368e1dbe288dba
NOTE: recipe glib-networking-2.76.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1571 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-networking-2.76.0-r0: task do_configure: Started
NOTE: recipe coreutils-9.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1584 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata)
NOTE: recipe coreutils-9.1-r0: task do_packagedata: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1585 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_rpm)
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_configure: Succeeded
NOTE: Running task 1586 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_configure_ptest_base)
NOTE: recipe glib-networking-2.76.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1587 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_compile)
NOTE: recipe glib-networking-2.76.0-r0: task do_compile: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_compile: Succeeded
NOTE: Running task 1588 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_compile_ptest_base)
NOTE: recipe glib-networking-2.76.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1589 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_install)
NOTE: recipe glib-networking-2.76.0-r0: task do_install: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_install: Succeeded
NOTE: Running task 1590 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_install_ptest_base)
NOTE: recipe glib-networking-2.76.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1591 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_package)
NOTE: Running task 1592 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_populate_sysroot)
NOTE: recipe glib-networking-2.76.0-r0: task do_populate_sysroot: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_package: Started
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_rpm unihash changed to af6c4e4795d376f5eb2177cb6acc56ce758c6f19d9e3ff6f1ccdcb69df7604d7
NOTE: recipe glib-networking-2.76.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-networking-2.76.0-r0: task do_package: Succeeded
NOTE: Running task 1593 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_packagedata)
NOTE: recipe glib-networking-2.76.0-r0: task do_packagedata: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1594 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_package_write_rpm)
NOTE: Running task 1595 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_package_qa)
NOTE: recipe glib-networking-2.76.0-r0: task do_package_write_rpm: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_package_qa: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_package_qa: Succeeded
NOTE: recipe glib-networking-2.76.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1596 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1596 tasks of which 1574 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 52 ERROR messages, returning a non-zero exit code.
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-src went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-dbg went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-ptest went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-staticdev went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-dev went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-doc went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-stdbuf went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-af went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-be went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-bg went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ca went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-cs went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-da went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-de went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-el went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-eo went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-es went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-et went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-eu went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-fi went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-fr went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ga went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-gl went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-hr went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-hu went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ia went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-id went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-it went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ja went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-kk went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ko went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-lg went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-lt went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ms went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-nb went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-nl went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-pl went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-pt went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-pt-br went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ro went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ru went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sk went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sl went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sr went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sv went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-tr went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-uk went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-vi went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-zh-cn went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-zh-tw went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0290210693131635104==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/glib-networking/glib-networking-dbg: FILELIST: removed "/usr/lib/gio/modules/.debug/libgioenvironmentproxy.so /usr/libexec/installed-tests/glib-networking/.debug/environment"
packages/core2-32-poky-linux/glib-networking/glib-networking-dbg: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-dbg: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-dbg: PKGSIZE changed from 600324 to 579740 (-3%)
packages/core2-32-poky-linux/glib-networking/glib-networking-dev: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-dev: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-doc: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-doc: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ab: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ab: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-an: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-an: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ar: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ar: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-as: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-as: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-be: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-be: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-bg: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-bg: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-bn-in: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-bn-in: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-bs: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-bs: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ca+valencia: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ca+valencia: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ca: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ca: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-cs: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-cs: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-da: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-da: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-de: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-de: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-de: PKGSIZE changed from 8265 to 8850 (+7%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-el: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-el: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-en-ca: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-en-ca: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-en-gb: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-en-gb: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-eo: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-eo: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-es: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-es: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-et: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-et: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-eu: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-eu: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fa: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fa: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fi: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fi: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fr: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fr: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fr: PKGSIZE changed from 8451 to 8260 (-2%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fur: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fur: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fur: PKGSIZE changed from 8072 to 7875 (-2%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gd: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gd: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gl: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gl: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gl: PKGSIZE changed from 8230 to 8751 (+6%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gu: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gu: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-he: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-he: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hi: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hi: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hr: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hr: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hu: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hu: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hu: PKGSIZE changed from 8029 to 8634 (+8%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-id: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-id: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-id: PKGSIZE changed from 7335 to 7891 (+8%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-it: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-it: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ja: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ja: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ka: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ka: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-kk: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-kk: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-kk: PKGSIZE changed from 9814 to 9618 (-2%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-km: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-km: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-kn: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-kn: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ko: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ko: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-lt: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-lt: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-lv: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-lv: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ml: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ml: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-mr: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-mr: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ms: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ms: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-nb: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-nb: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ne: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ne: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ne: PKGSIZE changed from 10493 to 11164 (+6%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-nl: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-nl: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-nl: PKGSIZE changed from 7739 to 7545 (-3%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-oc: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-oc: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-oc: PKGSIZE changed from 8254 to 8092 (-2%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-or: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-or: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pa: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pa: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pl: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pl: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pt-br: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pt-br: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pt: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pt: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pt: PKGSIZE changed from 7885 to 8417 (+7%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ro: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ro: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ru: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ru: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ru: PKGSIZE changed from 10297 to 11083 (+8%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sk: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sk: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sl: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sl: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sr+latin: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sr+latin: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sr: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sr: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sr: PKGSIZE changed from 10592 to 10386 (-2%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sv: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sv: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ta: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ta: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-te: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-te: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-tg: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-tg: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-th: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-th: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-tr: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-tr: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-tr: PKGSIZE changed from 7332 to 7905 (+8%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ug: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ug: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-uk: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-uk: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-uk: PKGSIZE changed from 11020 to 11812 (+7%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-vi: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-vi: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-zh-cn: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-zh-cn: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-zh-hk: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-zh-hk: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-zh-tw: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-zh-tw: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-ptest: FILELIST: removed "/usr/libexec/installed-tests/glib-networking/environment /usr/share/installed-tests/glib-networking/environment.test"
packages/core2-32-poky-linux/glib-networking/glib-networking-ptest: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-ptest: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-ptest: PKGSIZE changed from 338374 to 324492 (-4%)
packages/core2-32-poky-linux/glib-networking/glib-networking-src: FILELIST: directory renamed /usr/src/debug/glib-networking/2.74.0-r0/tls/tests -> /usr/src/debug/glib-networking/2.76.0-r0/tls/tests, directory renamed /usr/src/debug/glib-networking/2.74.0-r0/tls/openssl -> /usr/src/debug/glib-networking/2.76.0-r0/tls/openssl, removed "/usr/src/debug/glib-networking/2.74.0-r0/proxy/environment/genvironmentproxyresolver.c /usr/src/debug/glib-networking/2.74.0-r0/proxy/tests/common.c /usr/src/debug/glib-networking/2.74.0-r0/tls/base/gtlsconnection-base.h /usr/src/debug/glib-networking/2.74.0-r0/tls/base/gtlsinputstream.h /usr/src/debug/glib-networking/2.74.0-r0/tls/base/gtlslog.c /usr/src/debug/glib-networking/2.74.0-r0/tls/base/gtlsoutputstream.h /usr/src/debug/glib-networking/2.74.0-r0/proxy/environment/genvironmentproxyresolver.h /usr/src/debug/glib-networking/2.74.0-r0/tls/base/gtlsoutputstream.c /usr/src/debug/glib-networking/2.74.0-r0/tls/base/gtlslog.h /usr/src/debug/glib-network
 ing/2.74.0-r0/tls/base/gtlsinputstream.c /usr/src/debug/glib-networking/2.74.0-r0/tls/base/gtlsconnection-base.c /usr/src/debug/glib-networking/2.74.0-r0/proxy/tests/environment.c /usr/src/debug/glib-networking/2.74.0-r0/proxy/environment/environmentproxy-module.c", added "/usr/src/debug/glib-networking/2.76.0-r0/tls/base/gtlsconnection-base.h /usr/src/debug/glib-networking/2.76.0-r0/tls/base/gtlsinputstream.h /usr/src/debug/glib-networking/2.76.0-r0/tls/base/gtlslog.c /usr/src/debug/glib-networking/2.76.0-r0/tls/base/gtlsoutputstream.h /usr/src/debug/glib-networking/2.76.0-r0/tls/base/gtlssessioncache.h /usr/src/debug/glib-networking/2.76.0-r0/tls/base/gtlsoutputstream.c /usr/src/debug/glib-networking/2.76.0-r0/tls/base/gtlslog.h /usr/src/debug/glib-networking/2.76.0-r0/tls/base/gtlsinputstream.c /usr/src/debug/glib-networking/2.76.0-r0/tls/base/gtlsconnection-base.c /usr/src/debug/glib-networking/2.76.0-r0/tls/base/gtlssessioncache.c"
packages/core2-32-poky-linux/glib-networking/glib-networking-src: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-src: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-src: PKGSIZE changed from 510624 to 517539 (+1%)
packages/core2-32-poky-linux/glib-networking/glib-networking-staticdev: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-staticdev: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking: FILELIST: removed "/usr/lib/gio/modules/libgioenvironmentproxy.so"
packages/core2-32-poky-linux/glib-networking/glib-networking: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking/glib-networking: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking: PKGSIZE changed from 162424 to 161108 (-1%)
packages/core2-32-poky-linux/glib-networking: SRC_URI changed from "https://download.gnome.org/sources//glib-networking/2.74/glib-networking-2.74.0.tar.xz;name=archive file://run-ptest" to "https://download.gnome.org/sources//glib-networking/2.76/glib-networking-2.76.0.tar.xz;name=archive file://run-ptest"
packages/core2-32-poky-linux/glib-networking: PV changed from "2.74.0" to "2.76.0"
packages/core2-32-poky-linux/glib-networking: PKGV changed from 2.74.0 [default] to 2.76.0 [default]
Changes to packages/core2-32-poky-linux/glib-networking (sysroot):
  /usr/lib/gio/modules/libgioenvironmentproxy.so was removed

--===============0290210693131635104==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 74 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b2c1beedeafc10c0f2ff0db3fe20c5bd3a282a17"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 13 Local 4 Mirrors 0 Missed 9 Current 423 (30% match, 97% complete)
Removing 1 stale sstate objects for arch ppc7400...done.
NOTE: Executing Tasks
NOTE: Running setscene task 432 of 436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1088 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_fetch)
NOTE: Running task 1159 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_write_config)
NOTE: recipe glib-networking-2.76.0-r0: task do_fetch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/coreutils/9.1-r0/temp/log.do_packagedata_setscene.1057158
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 435 of 436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package_setscene)
NOTE: recipe glib-networking-2.76.0-r0: task do_write_config: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-networking-2.76.0-r0: task do_write_config: Succeeded
NOTE: Running task 1492 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_unpack)
NOTE: Running task 1493 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1567 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_rpm)
NOTE: recipe glib-networking-2.76.0-r0: task do_unpack: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_unpack: Succeeded
NOTE: Running task 1568 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_patch)
NOTE: recipe glib-networking-2.76.0-r0: task do_patch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Started
NOTE: recipe coreutils-9.1-r0: task do_package_setscene: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_patch: Succeeded
NOTE: Running task 1569 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1570 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_populate_lic)
NOTE: recipe glib-networking-2.76.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-networking-2.76.0-r0: task do_populate_lic: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_populate_lic unihash changed to 3e4f6144901d4608af657bbe8b2b0de3c823ceba6bbb792ade368e1dbe288dba
NOTE: recipe glib-networking-2.76.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1571 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_configure)
NOTE: recipe glib-networking-2.76.0-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1584 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata)
NOTE: recipe coreutils-9.1-r0: task do_packagedata: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1585 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_rpm)
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_configure: Succeeded
NOTE: Running task 1586 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_configure_ptest_base)
NOTE: recipe glib-networking-2.76.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1587 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_compile)
NOTE: recipe glib-networking-2.76.0-r0: task do_compile: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_compile: Succeeded
NOTE: Running task 1588 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_compile_ptest_base)
NOTE: recipe glib-networking-2.76.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1589 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_install)
NOTE: recipe glib-networking-2.76.0-r0: task do_install: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_install: Succeeded
NOTE: Running task 1590 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_install_ptest_base)
NOTE: recipe glib-networking-2.76.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1591 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_package)
NOTE: Running task 1592 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_populate_sysroot)
NOTE: recipe glib-networking-2.76.0-r0: task do_populate_sysroot: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_package: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_rpm unihash changed to ea1739d2d6884c1e50c67e93527fd93de21aad9eeafd466fbb7ddaf2e2e21ddb
NOTE: recipe glib-networking-2.76.0-r0: task do_package: Succeeded
NOTE: Running task 1593 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_packagedata)
NOTE: recipe glib-networking-2.76.0-r0: task do_packagedata: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1594 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_package_write_rpm)
NOTE: Running task 1595 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_package_qa)
NOTE: recipe glib-networking-2.76.0-r0: task do_package_write_rpm: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_package_qa: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_package_qa: Succeeded
NOTE: recipe glib-networking-2.76.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1596 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1596 tasks of which 1574 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 52 ERROR messages, returning a non-zero exit code.
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-src went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-dbg went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-ptest went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-staticdev went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-dev went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-doc went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-stdbuf went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-af went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-be went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-bg went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ca went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-cs went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-da went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-de went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-el went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-eo went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-es went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-et went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-eu went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-fi went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-fr went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ga went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-gl went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-hr went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-hu went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ia went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-id went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-it went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ja went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-kk went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ko went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-lg went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-lt went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ms went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-nb went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-nl went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-pl went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-pt went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-pt-br went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ro went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ru went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sk went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sl went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sr went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sv went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-tr went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-uk went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-vi went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-zh-cn went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-zh-tw went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0290210693131635104==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/glib-networking/glib-networking-ptest: FILELIST: removed "/usr/share/installed-tests/glib-networking/environment.test /usr/libexec/installed-tests/glib-networking/environment"
packages/core2-32-poky-linux/glib-networking/glib-networking: FILELIST: removed "/usr/lib/gio/modules/libgioenvironmentproxy.so"
Changes to packages/core2-32-poky-linux/glib-networking (sysroot):
  /usr/lib/gio/modules/libgioenvironmentproxy.so was removed

--===============0290210693131635104==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 51 skipped, 0 masked, 0 errors.
Removing 39 recipes from the core2-32 sysroot...done.
Removing 71 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b2c1beedeafc10c0f2ff0db3fe20c5bd3a282a17"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 158 Local 149 Mirrors 0 Missed 9 Current 156 (94% match, 97% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 157 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 162 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 165 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 168 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 169 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 170 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 171 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 172 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 173 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 175 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 176 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 686 of 1200 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_fetch)
NOTE: Running task 687 of 1200 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_write_config)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 178 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 179 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 180 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-networking-2.76.0-r0: task do_fetch: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_write_config: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_write_config: Succeeded
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/coreutils/9.1-r0/temp/log.do_packagedata_setscene.1071680
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 184 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package_setscene)
NOTE: Running setscene task 187 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_setscene)
NOTE: Running setscene task 191 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 193 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 194 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running task 710 of 1200 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_unpack)
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-networking-2.76.0-r0: task do_unpack: Succeeded
NOTE: Running task 745 of 1200 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_patch)
NOTE: recipe glib-networking-2.76.0-r0: task do_patch: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-networking-2.76.0-r0: task do_patch: Succeeded
NOTE: Running task 750 of 1200 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 751 of 1200 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_populate_lic)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_package_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_package_setscene: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_populate_lic: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_populate_lic unihash changed to 3e4f6144901d4608af657bbe8b2b0de3c823ceba6bbb792ade368e1dbe288dba
NOTE: recipe glib-networking-2.76.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 205 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 206 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 207 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.74.6-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.74.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.74.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 208 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-1_2.74.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 211 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 212 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 213 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 214 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 215 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 216 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 219 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 221 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 226 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 228 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 230 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.68.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.68-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 233 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 234 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 235 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 236 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 238 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 239 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 240 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 241 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.68-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 243 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 244 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 250 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 263 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 264 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 266 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 273 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 274 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 277 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 278 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 283 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 285 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 287 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 289 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 291 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 292 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 295 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 296 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 297 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 298 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 299 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 308 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 311 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 312 of 314 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1049 of 1200 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1183 of 1200 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata)
NOTE: recipe glib-networking-2.76.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1186 of 1200 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_rpm)
NOTE: recipe coreutils-9.1-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1188 of 1200 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_configure)
NOTE: recipe glib-networking-2.76.0-r0: task do_configure: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1189 of 1200 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_rpm)
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-networking-2.76.0-r0: task do_configure: Succeeded
NOTE: Running task 1190 of 1200 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_configure_ptest_base)
NOTE: recipe glib-networking-2.76.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1191 of 1200 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_compile)
NOTE: recipe glib-networking-2.76.0-r0: task do_compile: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_compile: Succeeded
NOTE: Running task 1192 of 1200 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_compile_ptest_base)
NOTE: recipe glib-networking-2.76.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1193 of 1200 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_install)
NOTE: recipe glib-networking-2.76.0-r0: task do_install: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_install: Succeeded
NOTE: Running task 1194 of 1200 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_install_ptest_base)
NOTE: recipe glib-networking-2.76.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1195 of 1200 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_package)
NOTE: Running task 1196 of 1200 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_populate_sysroot)
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_rpm unihash changed to b36614122722658f2d44c2f77e07f9d7dddff6631341d91340c1f0f70f6f436e
NOTE: recipe glib-networking-2.76.0-r0: task do_populate_sysroot: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_package: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-networking-2.76.0-r0: task do_package: Succeeded
NOTE: Running task 1197 of 1200 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_packagedata)
NOTE: recipe glib-networking-2.76.0-r0: task do_packagedata: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1198 of 1200 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_package_write_rpm)
NOTE: Running task 1199 of 1200 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_package_qa)
NOTE: recipe glib-networking-2.76.0-r0: task do_package_write_rpm: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_package_qa: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_package_qa: Succeeded
NOTE: recipe glib-networking-2.76.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1200 of 1200 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1200 tasks of which 1178 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 52 ERROR messages, returning a non-zero exit code.
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-src went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-dbg went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-ptest went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-staticdev went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-dev went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-doc went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-stdbuf went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-af went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-be went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-bg went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ca went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-cs went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-da went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-de went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-el went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-eo went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-es went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-et went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-eu went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-fi went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-fr went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ga went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-gl went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-hr went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-hu went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ia went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-id went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-it went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ja went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-kk went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ko went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-lg went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-lt went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ms went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-nb went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-nl went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-pl went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-pt went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-pt-br went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ro went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ru went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sk went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sl went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sr went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sv went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-tr went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-uk went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-vi went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-zh-cn went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-zh-tw went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0290210693131635104==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 57 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b2c1beedeafc10c0f2ff0db3fe20c5bd3a282a17"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 13 Local 4 Mirrors 0 Missed 9 Current 423 (30% match, 97% complete)
Removing 1 stale sstate objects for arch cortexa15t2hf-neon...done.
NOTE: Executing Tasks
NOTE: Running setscene task 432 of 436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1088 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_fetch)
NOTE: Running task 1159 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_write_config)
NOTE: recipe glib-networking-2.76.0-r0: task do_fetch: Started
NOTE: Running task 1565 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_rpm)
NOTE: recipe glib-networking-2.76.0-r0: task do_write_config: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-networking-2.76.0-r0: task do_write_config: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/coreutils/9.1-r0/temp/log.do_packagedata_setscene.1028432
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 435 of 436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package_setscene)
NOTE: Running task 1566 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_unpack)
NOTE: Running task 1567 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_unpack: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.1-r0: task do_package_setscene: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_unpack: Succeeded
NOTE: Running task 1568 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_patch)
NOTE: recipe glib-networking-2.76.0-r0: task do_patch: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_patch: Succeeded
NOTE: Running task 1569 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1570 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_populate_lic)
NOTE: recipe glib-networking-2.76.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-networking-2.76.0-r0: task do_populate_lic: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_populate_lic unihash changed to 3e4f6144901d4608af657bbe8b2b0de3c823ceba6bbb792ade368e1dbe288dba
NOTE: recipe glib-networking-2.76.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1571 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-networking-2.76.0-r0: task do_configure: Started
NOTE: recipe coreutils-9.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1584 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata)
NOTE: recipe coreutils-9.1-r0: task do_packagedata: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1585 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_rpm)
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_configure: Succeeded
NOTE: Running task 1586 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_configure_ptest_base)
NOTE: recipe glib-networking-2.76.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1587 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_compile)
NOTE: recipe glib-networking-2.76.0-r0: task do_compile: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_compile: Succeeded
NOTE: Running task 1588 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_compile_ptest_base)
NOTE: recipe glib-networking-2.76.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1589 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_install)
NOTE: recipe glib-networking-2.76.0-r0: task do_install: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_install: Succeeded
NOTE: Running task 1590 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_install_ptest_base)
NOTE: recipe glib-networking-2.76.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1591 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_package)
NOTE: Running task 1592 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_populate_sysroot)
NOTE: recipe glib-networking-2.76.0-r0: task do_populate_sysroot: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_package: Started
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_rpm unihash changed to 992924559bf4de1e5976cce18cc642a10e2b138ff1d5706640083010c522fbca
NOTE: recipe glib-networking-2.76.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-networking-2.76.0-r0: task do_package: Succeeded
NOTE: Running task 1593 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_packagedata)
NOTE: recipe glib-networking-2.76.0-r0: task do_packagedata: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1594 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_package_write_rpm)
NOTE: Running task 1595 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_package_qa)
NOTE: recipe glib-networking-2.76.0-r0: task do_package_write_rpm: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_package_qa: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_package_qa: Succeeded
NOTE: recipe glib-networking-2.76.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1596 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1596 tasks of which 1574 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 52 ERROR messages, returning a non-zero exit code.
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-src went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-dbg went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-ptest went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-staticdev went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-dev went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-doc went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-stdbuf went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-af went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-be went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-bg went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ca went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-cs went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-da went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-de went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-el went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-eo went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-es went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-et went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-eu went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-fi went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-fr went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ga went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-gl went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-hr went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-hu went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ia went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-id went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-it went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ja went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-kk went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ko went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-lg went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-lt went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ms went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-nb went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-nl went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-pl went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-pt went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-pt-br went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ro went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ru went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sk went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sl went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sr went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sv went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-tr went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-uk went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-vi went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-zh-cn went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-zh-tw went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0290210693131635104==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 67 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b2c1beedeafc10c0f2ff0db3fe20c5bd3a282a17"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 13 Local 4 Mirrors 0 Missed 9 Current 419 (30% match, 97% complete)
Removing 1 stale sstate objects for arch mips32r2...done.
NOTE: Executing Tasks
NOTE: Running setscene task 428 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1085 of 1582 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_fetch)
NOTE: Running task 1151 of 1582 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_write_config)
NOTE: recipe glib-networking-2.76.0-r0: task do_fetch: Started
NOTE: Running task 1551 of 1582 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_rpm)
NOTE: recipe glib-networking-2.76.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-networking-2.76.0-r0: task do_write_config: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_write_config: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/coreutils/9.1-r0/temp/log.do_packagedata_setscene.1042791
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 431 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package_setscene)
NOTE: Running task 1552 of 1582 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_unpack)
NOTE: Running task 1553 of 1582 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_unpack: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.1-r0: task do_package_setscene: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_unpack: Succeeded
NOTE: Running task 1554 of 1582 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_patch)
NOTE: recipe glib-networking-2.76.0-r0: task do_patch: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_patch: Succeeded
NOTE: Running task 1555 of 1582 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1556 of 1582 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_populate_lic)
NOTE: recipe glib-networking-2.76.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-networking-2.76.0-r0: task do_populate_lic: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_populate_lic unihash changed to 3e4f6144901d4608af657bbe8b2b0de3c823ceba6bbb792ade368e1dbe288dba
NOTE: recipe glib-networking-2.76.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1557 of 1582 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-networking-2.76.0-r0: task do_configure: Started
NOTE: recipe coreutils-9.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1570 of 1582 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata)
NOTE: recipe coreutils-9.1-r0: task do_packagedata: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1571 of 1582 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_rpm)
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_configure: Succeeded
NOTE: Running task 1572 of 1582 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_configure_ptest_base)
NOTE: recipe glib-networking-2.76.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1573 of 1582 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_compile)
NOTE: recipe glib-networking-2.76.0-r0: task do_compile: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_compile: Succeeded
NOTE: Running task 1574 of 1582 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_compile_ptest_base)
NOTE: recipe glib-networking-2.76.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1575 of 1582 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_install)
NOTE: recipe glib-networking-2.76.0-r0: task do_install: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_install: Succeeded
NOTE: Running task 1576 of 1582 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_install_ptest_base)
NOTE: recipe glib-networking-2.76.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1577 of 1582 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_package)
NOTE: Running task 1578 of 1582 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_populate_sysroot)
NOTE: recipe glib-networking-2.76.0-r0: task do_populate_sysroot: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_package: Started
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_rpm unihash changed to 2ee5be65e68fa7a785b59e390d84b17533c2055ae8885ed7e9def458ebb0fed1
NOTE: recipe glib-networking-2.76.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-networking-2.76.0-r0: task do_package: Succeeded
NOTE: Running task 1579 of 1582 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_packagedata)
NOTE: recipe glib-networking-2.76.0-r0: task do_packagedata: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1580 of 1582 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_package_write_rpm)
NOTE: Running task 1581 of 1582 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_package_qa)
NOTE: recipe glib-networking-2.76.0-r0: task do_package_write_rpm: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_package_qa: Started
NOTE: recipe glib-networking-2.76.0-r0: task do_package_qa: Succeeded
NOTE: recipe glib-networking-2.76.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1582 of 1582 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1582 tasks of which 1560 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 52 ERROR messages, returning a non-zero exit code.
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-src went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-dbg went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-ptest went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-staticdev went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-dev went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-doc went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-stdbuf went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-af went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-be went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-bg went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ca went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-cs went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-da went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-de went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-el went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-eo went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-es went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-et went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-eu went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-fi went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-fr went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ga went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-gl went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-hr went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-hu went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ia went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-id went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-it went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ja went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-kk went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ko went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-lg went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-lt went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ms went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-nb went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-nl went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-pl went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-pt went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-pt-br went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ro went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ru went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sk went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sl went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sr went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sv went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-tr went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-uk went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-vi went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-zh-cn went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-zh-tw went backwards which would break package feeds (from 0:9.2-r0 to 0:9.1-r0) [version-going-backwards]
ERROR: coreutils-9.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0290210693131635104==--

