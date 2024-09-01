Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEC0FCD37A7
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 06:40:58 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.11356.1725172853723366533
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Aug 2024 23:40:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Mrhztjjm;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=j9uuopsf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010191ac50a8df-63d62410-19a9-4081-8262-920132465130-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1725172853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1RcUyzqjdTyvBM+3xkhVpPGMRoahxP5XUBdi1/z/TtY=;
	b=MrhztjjmrKtRzkelhHPn1zqOAqZeRy9T4+3EYQOJ/bqJNrp4tClkahbBIc9Amn0O
	HhYq2/4aEgaH14pScn03/6KV0NPdqn5kBjrPF+KYVfJ/mWETSWzRZKm4njcPXHJlQqK
	LfKEKFM5Pl2MWopRb6SJv2qAVOZzPktUAfz+0lpo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1725172853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1RcUyzqjdTyvBM+3xkhVpPGMRoahxP5XUBdi1/z/TtY=;
	b=j9uuopsfN1Ly8Z1+9Vvpj0RXBZH2PtxW7ac7chEgSu+MFf/MbF1WIua2GLbLApj+
	+2ObG0CP5yJe6DcHJe1DaNzMuSsJJpgQ3y/uU6BYslJq9hr/mUGJ1FgphjSfdaVDwjQ
	TJ0HOdl3uFjKsjIIxyJQsclQjHwr9zeAD+483kR8=
Content-Type: multipart/mixed; boundary="===============0350116699210039951=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography: upgrading to 43.0.0 FAILED
Message-ID: <01010191ac50a8df-63d62410-19a9-4081-8262-920132465130-000000@us-west-2.amazonses.com>
Date: Sun, 1 Sep 2024 06:40:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 06:40:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204005

--===============0350116699210039951==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-cryptography* to *43.0.0* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake python3-cryptography' failed
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1867 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-69fe8a0f5dace7480b8e2d398b3560c8d7759a73"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:69fe8a0f5dace7480b8e2d398b3560c8d7759a73"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 565 Local 490 Mirrors 0 Missed 75 Current 479 (86% match, 92% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 547 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 549 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 551 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors_42.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 565 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_42.0.8.bb:do_populate_lic_setscene)
NOTE: Running setscene task 572 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_24.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 575 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.111.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 582 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 583 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_create_spdx_setscene)
NOTE: Running setscene task 586 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 593 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 603 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.13.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 604 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 607 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 614 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 619 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 620 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-cryptography-vectors-42.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-cffi-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-attrs-24.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-hypothesis-6.111.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-psutil-6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pytest-subtests-0.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-8.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-8.3.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pytz-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-bcrypt-4.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-cryptography-42.0.8-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 623 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-attrs-24.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pytest-8.3.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 624 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_24.2.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 625 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_packagedata_setscene)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 626 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.1.bb:do_packagedata_setscene)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 627 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pluggy_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-8.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-cryptography-42.0.8-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 628 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 630 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 632 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 633 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pytest-subtests-0.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 634 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.13.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-24.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pytest-8.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-24.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-hypothesis-6.111.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 635 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.111.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-cffi-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-bcrypt-4.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 636 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 637 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pytz-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 638 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-psutil-6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pytest-subtests-0.13.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 639 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_6.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 640 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2024.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 641 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_packagedata_setscene)
NOTE: recipe python3-attrs-24.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 647 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.79.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-24.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 705 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package_setscene)
NOTE: recipe python3-hypothesis-6.111.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pluggy-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-subtests-0.13.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-cffi-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pycparser-2.22-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-psutil-6.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pytest-8.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-bcrypt-4.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pytz-2024.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.79.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-hypothesis-6.111.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 706 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-cffi-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-psutil-6.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-bcrypt-4.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pytz-2024.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.79.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pycparser-2.22-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 707 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-cryptography-vectors-42.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 708 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 709 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors_42.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 710 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_42.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 711 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.111.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 718 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_6.0.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 719 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 720 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.13.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 721 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.2.bb:do_package_setscene)
NOTE: Running setscene task 722 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2024.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 723 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_package_setscene)
NOTE: Running setscene task 724 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.79.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 785 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 890 of 1044 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-cryptography-vectors-42.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-cffi-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-psutil-6.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pytest-subtests-0.13.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pycparser-2.22-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-hypothesis-6.111.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pytz-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.79.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-bcrypt-4.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-cryptography-42.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 892 of 1044 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_24.1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-cffi-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-psutil-6.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pytest-subtests-0.13.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 893 of 1044 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hatch-vcs_0.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-hypothesis-6.111.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-cryptography-vectors-42.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pytz-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 901 of 1044 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 905 of 1044 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.10.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 909 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors_42.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pycparser-2.22-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 920 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_recipe_qa_setscene)
NOTE: recipe python3-cffi-native-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-bcrypt-4.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libstd-rs-1.79.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cffi-native-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-cryptography-vectors-42.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pycparser-2.22-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-hatch-fancy-pypi-readme-native-24.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 970 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-hatch-vcs-native-0.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-poetry-core-native-1.9.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-rust-native-1.10.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-cryptography-42.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 973 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_42.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 974 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.79.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 975 of 1044 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-cryptography-vectors-42.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pycparser-2.22-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-poetry-core-native-1.9.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 976 of 1044 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-rust-native-1.10.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 977 of 1044 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.10.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 978 of 1044 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-scm_8.1.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-hatch-fancy-pypi-readme-native-24.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 980 of 1044 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_24.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-hatch-vcs-native-0.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 982 of 1044 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hatch-vcs_0.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.79.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-cryptography-42.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-cffi-native-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-poetry-core-native-1.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 984 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_setscene: Started
NOTE: recipe python3-setuptools-scm-native-8.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_setscene: Started
NOTE: recipe python3-pytest-8.3.2-r0: task do_package_setscene: Started
NOTE: recipe python3-hatch-fancy-pypi-readme-native-24.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-rust-native-1.10.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-cryptography-42.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 985 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_42.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe python3-hatch-vcs-native-0.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-scm-native-8.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-hatch-fancy-pypi-readme-native-24.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-hatch-vcs-native-0.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-cffi-native-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 996 of 1044 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 997 of 1044 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-poetry-core-native-1.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.10.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 999 of 1044 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1000 of 1044 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1001 of 1044 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1003 of 1044 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools-rust_1.10.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-cryptography-42.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-cryptography-42.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libstd-rs-1.79.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pycparser-native-2.22-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-poetry-core-native-1.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1005 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.79.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-cffi-native-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-six-native-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-semantic-version-native-2.10.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.10.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1006 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-poetry-core-native-1.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-cffi-native-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1007 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-setuptools-rust-native-1.10.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libstd-rs-1.79.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-six-native-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1009 of 1044 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-semantic-version-native-2.10.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1011 of 1044 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pytest-8.3.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1012 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1013 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1014 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1181 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_42.0.8.bb:do_fetch)
NOTE: Running task 1216 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.2.0.bb:do_fetch)
NOTE: recipe python3-pycparser-native-2.22-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1240 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_fetch)
NOTE: Running setscene task 1016 of 1044 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.79.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1017 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_recipe_qa_setscene)
NOTE: Running task 1257 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.111.2.bb:do_fetch)
NOTE: Running task 1258 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2024.1.bb:do_fetch)
NOTE: Running task 1260 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.0.bb:do_fetch)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1018 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-six-native-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pytest-8.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-semantic-version-native-2.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1356 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe python3-pycparser-2.22-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-42.0.8-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-bcrypt-4.2.0-r0: task do_fetch: Started
NOTE: recipe python3-pycparser-native-2.22-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-hypothesis-6.111.2-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.17.0-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2024.1-r0: task do_fetch: Started
NOTE: recipe python3-six-native-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-semantic-version-native-2.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pytest-8.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1019 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.2.bb:do_recipe_qa_setscene)
NOTE: Running task 1472 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_24.2.0.bb:do_fetch)
NOTE: Running task 1480 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pycparser-2.22-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pycparser-native-2.22-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1494 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_unpack)
NOTE: recipe python3-pytz-2024.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.111.2-r0: task do_fetch: Succeeded
NOTE: Running task 1536 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2024.1.bb:do_unpack)
NOTE: recipe python3-cffi-1.17.0-r0: task do_fetch: Succeeded
NOTE: Running task 1541 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.111.2.bb:do_unpack)
NOTE: Running task 1542 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.0.bb:do_unpack)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1021 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-8.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1580 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors_42.0.8.bb:do_fetch)
NOTE: Running task 1581 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_6.0.0.bb:do_fetch)
NOTE: Running task 1582 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.13.1.bb:do_fetch)
NOTE: Running task 1583 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-attrs-24.2.0-r0: task do_fetch: Started
NOTE: recipe python3-pycparser-2.22-r0: task do_unpack: Started
NOTE: recipe python3-pycparser-2.22-r0: task do_unpack: Succeeded
NOTE: Running task 1584 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_patch)
NOTE: recipe python3-pytz-2024.1-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.111.2-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.17.0-r0: task do_unpack: Started
NOTE: recipe python3-pytest-8.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1023 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_fetch: Started
NOTE: Running setscene task 1024 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-psutil-6.0.0-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.13.1-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-42.0.8-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.17.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-hypothesis-6.111.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytz-2024.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-attrs-24.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1587 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.0.bb:do_patch)
NOTE: Running task 1588 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2024.1.bb:do_patch)
NOTE: Running task 1589 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.111.2.bb:do_patch)
NOTE: Running task 1592 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_24.2.0.bb:do_unpack)
NOTE: recipe python3-pycparser-2.22-r0: task do_patch: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-subtests-0.13.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-psutil-6.0.0-r0: task do_fetch: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1026 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1647 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_6.0.0.bb:do_unpack)
NOTE: Running task 1648 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.13.1.bb:do_unpack)
NOTE: Running task 1649 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_unpack)
NOTE: recipe python3-cffi-1.17.0-r0: task do_patch: Started
NOTE: recipe python3-pytz-2024.1-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.111.2-r0: task do_patch: Started
NOTE: recipe python3-attrs-24.2.0-r0: task do_unpack: Started
NOTE: recipe python3-attrs-24.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1650 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_24.2.0.bb:do_patch)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pytest-subtests-0.13.1-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_unpack: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-subtests-0.13.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-psutil-6.0.0-r0: task do_unpack: Started
NOTE: recipe glibc-2.40+git-r0: task do_packagedata_setscene: Started
NOTE: Running task 1712 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_patch)
NOTE: Running task 1720 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.13.1.bb:do_patch)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1027 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1029 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-psutil-6.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1740 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_6.0.0.bb:do_patch)
NOTE: recipe python3-attrs-24.2.0-r0: task do_patch: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_patch: Started
NOTE: recipe python3-pytest-subtests-0.13.1-r0: task do_patch: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-psutil-6.0.0-r0: task do_patch: Started
NOTE: recipe glibc-2.40+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.40+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1031 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_packagedata_setscene)
NOTE: Running task 1779 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Started
NOTE: recipe glibc-2.40+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1034 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_recipe_qa_setscene)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1042 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_populate_sysroot_setscene)
NOTE: Running task 1852 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.40+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1853 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_patch)
NOTE: recipe glibc-2.40+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1901 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_patch)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1044 of 1044 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_recipe_qa_setscene)
NOTE: recipe procps-4.0.4-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2248 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pycparser-2.22-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-42.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 2295 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.111.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.111.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Failed
NOTE: Running task 2296 of 2920 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2024.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2024.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycparser-2.22-r0: task do_patch: Failed
NOTE: recipe python3-hypothesis-6.111.2-r0: task do_patch: Failed
NOTE: recipe python3-cffi-1.17.0-r0: task do_patch: Failed
NOTE: recipe python3-pytz-2024.1-r0: task do_patch: Failed
NOTE: recipe python3-attrs-24.2.0-r0: task do_patch: Failed
NOTE: recipe python3-pytest-subtests-0.13.1-r0: task do_patch: Failed
NOTE: recipe python3-iso8601-2.1.0-r0: task do_patch: Failed
NOTE: recipe python3-psutil-6.0.0-r0: task do_patch: Failed
NOTE: recipe python3-bcrypt-4.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Failed
NOTE: recipe procps-4.0.4-r0: task do_patch: Failed
NOTE: recipe python3-cryptography-42.0.8-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe python3-pycparser-2.22-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe python3-pytz-2024.1-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe python3-hypothesis-6.111.2-r0: task do_prepare_recipe_sysroot: Failed
NOTE: Tasks Summary: Attempted 2296 tasks of which 2260 didn't need to be rerun and 15 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901061633.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901061633.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 15 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_patch.2622392
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-pycparser/2.22/temp/log.do_patch.2622607
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.111.2.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.111.2/temp/log.do_patch.2622654
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.0.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-cffi/1.17.0/temp/log.do_patch.2622651
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2024.1.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-pytz/2024.1/temp/log.do_patch.2622653
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_24.2.0.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-attrs/24.2.0/temp/log.do_patch.2622749
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.13.1.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-pytest-subtests/0.13.1/temp/log.do_patch.2622780
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-iso8601/2.1.0/temp/log.do_patch.2622772
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_6.0.0.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-psutil/6.0.0/temp/log.do_patch.2622789
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-sortedcontainers/2.4.0/temp/log.do_patch.2622956
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/procps/4.0.4/temp/log.do_patch.2622965
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_prepare_recipe_sysroot.2622515
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-pycparser/2.22/temp/log.do_prepare_recipe_sysroot.2623009
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2024.1.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-pytz/2024.1/temp/log.do_prepare_recipe_sysroot.2623123
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.111.2.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.111.2/temp/log.do_prepare_recipe_sysroot.2623019
Summary: There were 15 ERROR messages, returning a non-zero exit code.

ERROR: base-files-3.0.14-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: python3-pycparser-2.22-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: python3-cffi-1.17.0-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: python3-pytz-2024.1-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: python3-hypothesis-6.111.2-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: python3-attrs-24.2.0-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: python3-iso8601-2.1.0-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: python3-pytest-subtests-0.13.1-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: python3-psutil-6.0.0-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: python3-sortedcontainers-2.4.0-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: procps-4.0.4-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_patch.2622392
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch) failed with exit code '1'
ERROR: base-files-3.0.14-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-pycparser/2.22/temp/log.do_patch.2622607
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_patch) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.111.2/temp/log.do_patch.2622654
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-cffi/1.17.0/temp/log.do_patch.2622651
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-pytz/2024.1/temp/log.do_patch.2622653
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.0.bb:do_patch) failed with exit code '1'
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.111.2.bb:do_patch) failed with exit code '1'
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2024.1.bb:do_patch) failed with exit code '1'
ERROR: python3-pycparser-2.22-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: python3-pytz-2024.1-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: python3-hypothesis-6.111.2-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-attrs/24.2.0/temp/log.do_patch.2622749
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_24.2.0.bb:do_patch) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-pytest-subtests/0.13.1/temp/log.do_patch.2622780
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-iso8601/2.1.0/temp/log.do_patch.2622772
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_patch) failed with exit code '1'
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.13.1.bb:do_patch) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-psutil/6.0.0/temp/log.do_patch.2622789
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_6.0.0.bb:do_patch) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-sortedcontainers/2.4.0/temp/log.do_patch.2622956
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_patch) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/procps/4.0.4/temp/log.do_patch.2622965
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_patch) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_prepare_recipe_sysroot.2622515
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-pycparser/2.22/temp/log.do_prepare_recipe_sysroot.2623009
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-pytz/2024.1/temp/log.do_prepare_recipe_sysroot.2623123
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.111.2/temp/log.do_prepare_recipe_sysroot.2623019
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2024.1.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.111.2.bb:do_prepare_recipe_sysroot) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0350116699210039951==--

