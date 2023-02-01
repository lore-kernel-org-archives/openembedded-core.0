Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A64C7618B
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:24 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.30005.1675272855187785531
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=fyP5CeLE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101860e0b25f1-30b39b2d-4bce-4b5e-a7fe-e6a29ec50e8e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272857;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Uc1z0BhBMjrEPbY+CgcGuS5GXbF4B9Z28Gzb6nsSWxs=;
	b=fyP5CeLEl/exWHTxmqrE/2LTZt8RteRhXcZ+nGykAmipYPKLCvGrFek64+PwIsG1
	Yfd45JDrOkz70rwN1ViqDgxjKR66zgL9TWApOZ4lmYOhZQxadx559U6ZRiXzR3Cemqo
	9Ypbb7PJe7OMKc5RCoCENFB++XlePdyacwVONoHM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272857;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Uc1z0BhBMjrEPbY+CgcGuS5GXbF4B9Z28Gzb6nsSWxs=;
	b=JhblWL+AHHeewxg84EgI7iAOOr7o8UZxJN1pTOJWE1zrcJA2AbMNLJ+0WNCH3JRF
	pVxFmiosPV8nAgLQYQTavDKKeY+YqzUBJ/cqe3ACB4QVK2mN4zamvBiU8jRM6zPaMJf
	QeaA91uE9eaZyyYxpAyY7jkls/VIKfyX0n1FBuy8=
Content-Type: multipart/mixed; boundary="===============0172596118412825197=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-headers: upgrading to 1.3.239.0 FAILED
Message-ID: <010101860e0b25f1-30b39b2d-4bce-4b5e-a7fe-e6a29ec50e8e-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:17 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176622

--===============0172596118412825197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-headers* to *1.3.239.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-headers-upgrade-1.3.236.0-1.3.239.0.patch
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
--===============0172596118412825197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1697 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1697 targets, 41 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4f2dc0c76473fc3de3cdc51a05cb65e14b0d680c"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 24 Local 17 Mirrors 0 Missed 7 Current 136 (70% match, 95% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 607 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_fetch)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_fetch: Succeeded
NOTE: Running task 652 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_unpack)
NOTE: Running task 653 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_unpack: Succeeded
NOTE: Running task 654 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_patch: Succeeded
NOTE: Running task 655 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 656 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_generate_toolchain_file)
NOTE: Running task 657 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_populate_lic)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_lic: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_lic: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 658 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_configure: Succeeded
NOTE: Running task 659 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_compile)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_compile: Succeeded
NOTE: Running task 660 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_install)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_install: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_install: Succeeded
NOTE: Running task 661 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_package)
NOTE: Running task 662 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_populate_sysroot)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_package: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_package: Succeeded
NOTE: Running task 663 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata: Succeeded
NOTE: Running task 664 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_package_write_rpm)
NOTE: Running task 665 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_package_qa)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_package_write_rpm: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_package_qa: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_package_qa: Failed
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 665 tasks of which 650 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_package_qa
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: vulkan-headers-1.3.239.0-r0 do_package_qa: QA Issue: /usr/share/vulkan/registry/stripAPI.py contained in package vulkan-headers requires /usr/bin/python3, but no providers found in RDEPENDS:vulkan-headers? [file-rdeps]
ERROR: vulkan-headers-1.3.239.0-r0 do_package_qa: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-headers/1.3.239.0-r0/temp/log.do_package_qa.144353
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_package_qa) failed with exit code '1'

--===============0172596118412825197==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-headers-upgrade-1.3.236.0-1.3.239.0.patch"

RnJvbSA0MmI3OThlY2E1MjZkYzY4NGQxMzkyOGJiNTU3YzZjODJjNDIxNWQ0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxNTo0NjoyNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ1
bGthbi1oZWFkZXJzOiB1cGdyYWRlIDEuMy4yMzYuMCAtPiAxLjMuMjM5LjAKCi0tLQogLi4ue3Z1
bGthbi1oZWFkZXJzXzEuMy4yMzYuMC5iYiA9PiB2dWxrYW4taGVhZGVyc18xLjMuMjM5LjAuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi97dnVsa2FuLWhlYWRlcnNfMS4zLjIz
Ni4wLmJiID0+IHZ1bGthbi1oZWFkZXJzXzEuMy4yMzkuMC5iYn0gKDkzJSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yMzYuMC5i
YiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLWhlYWRlcnNfMS4zLjIzOS4w
LmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy92dWxrYW4vdnVsa2FuLWhlYWRlcnNfMS4zLjIzNi4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yMzkuMC5iYgppbmRleCA4NzE2
Mzc2ZmMwLi4yOTI4NWExZjI1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVs
a2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yMzYuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuMy4yMzkuMC5iYgpAQCAtMTEsNyArMTEsNyBAQCBM
SUNFTlNFID0gIkFwYWNoZS0yLjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNF
LnR4dDttZDU9M2I4M2VmOTYzODdmMTQ2NTVmYzg1NGRkYzNjNmJkNTciCiBTUkNfVVJJID0gImdp
dDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1Z1bGthbi1IZWFkZXJzLmdpdDticmFuY2g9bWFp
bjtwcm90b2NvbD1odHRwcyIKIAotU1JDUkVWID0gImI3NWU1YTAyYjY5MzNjYWY4NmM1ODIyZDAx
OTA2N2IzMzU0OTJjODUiCitTUkNSRVYgPSAiMmJiMGEyMzEwNGNlZmZkOWEyOGQ1Yjc0MDFmMmNl
ZTdkYWUzNWJiOCIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKIAotLSAKMi4zNy4zCgo=

--===============0172596118412825197==--

