Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A07E0C54F7A
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:11 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.14623.1700059030257157187
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=SC1o++Fq;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=hIaJFHpA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018bd36a200f-9ab23de3-d3fc-460a-ae2a-dc64d14cb3da-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=B96lLvDV41MlImrYGBzXQJDrRzSmEm/F5+MM3EkpsiA=;
	b=SC1o++Fq+TcmS3Fd/lx/ssD+NKROX96LJmBlfEMSihTTcAP7USVpc1n9cJ3oFBHz
	bgkPh9W2klPkIVxvf2WamEH3tBoRIQtFfxFIJN4GAjcknzMNJDb9kh+jtIWhe5wjVzk
	47ixnZBnG604zf+MpZXt46pnCNyAXmunCrrRFAJg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=B96lLvDV41MlImrYGBzXQJDrRzSmEm/F5+MM3EkpsiA=;
	b=hIaJFHpAuuMIBHEETaJqwK1sB2Grdc/pXqDj8rFr+3YUGckOeFNLntozWkP5si+9
	7MYI9Hh9V3pblpMFFOKrngTSEMYy5sE+AFjrIDZlqujE02D+ZibcF0rYJyLqQgpaXs/
	3bMKeaTTXCK/ljS4o2TKPb24yeyxwdDifV0KMWyo=
Content-Type: multipart/mixed; boundary="===============5898815767340016119=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go: upgrading to 1.21.4 FAILED
Message-ID: <0101018bd36a200f-9ab23de3-d3fc-460a-ae2a-dc64d14cb3da-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:09 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190627

--===============5898815767340016119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go* to *1.21.4* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake go' failed
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1844 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-f9d2065a94ad9b0939acb3a9c97ead331256c018"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:f9d2065a94ad9b0939acb3a9c97ead331256c018"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 89 Local 78 Mirrors 0 Missed 11 Current 215 (87% match, 96% complete)
Removing 4 stale sstate objects for arch core2-64...done.
Removing 1 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 224 of 304 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go_1.20.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 231 of 304 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 232 of 304 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go_1.20.10.bb:do_populate_lic_setscene)
NOTE: Running setscene task 233 of 304 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go_1.20.10.bb:do_populate_sysroot_setscene)
NOTE: recipe go-1.20.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe go-runtime-1.20.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe go-1.20.10-r0: task do_populate_lic_setscene: Started
NOTE: recipe go-1.20.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe go-1.20.10-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe go-runtime-1.20.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe go-1.20.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 346 of 914 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_fetch)
NOTE: Running setscene task 260 of 304 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 261 of 304 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-cross_1.20.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 262 of 304 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go_1.20.10.bb:do_packagedata_setscene)
NOTE: recipe go-cross-core2-64-1.20.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe go-runtime-1.20.10-r0: task do_fetch: Started
NOTE: recipe go-1.20.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe go-runtime-1.20.10-r0: task do_fetch: Succeeded
NOTE: Running task 347 of 914 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_unpack)
NOTE: recipe go-1.20.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe go-cross-core2-64-1.20.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 263 of 304 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-binary-native_1.20.10.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe go-1.20.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 267 of 304 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: Running setscene task 270 of 304 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go_1.20.10.bb:do_package_setscene)
NOTE: recipe go-runtime-1.20.10-r0: task do_unpack: Started
NOTE: recipe go-binary-native-1.20.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe go-binary-native-1.20.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 275 of 304 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe go-1.20.10-r0: task do_package_setscene: Started
NOTE: recipe go-runtime-1.20.10-r0: task do_unpack: Succeeded
NOTE: recipe go-1.20.10-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 287 of 304 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 288 of 304 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-cross_1.20.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 289 of 304 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go_1.20.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe go-cross-core2-64-1.20.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe go-1.20.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe go-1.20.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 290 of 304 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go_1.20.10.bb:do_recipe_qa_setscene)
NOTE: recipe go-1.20.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe go-1.20.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 292 of 304 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 294 of 304 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 298 of 304 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: Running task 776 of 914 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_patch)
NOTE: recipe go-cross-core2-64-1.20.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 300 of 304 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-binary-native_1.20.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 302 of 304 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-cross_1.20.10.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe go-binary-native-1.20.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe go-runtime-1.20.10-r0: task do_patch: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe go-cross-core2-64-1.20.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe go-cross-core2-64-1.20.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe go-runtime-1.20.10-r0: task do_patch: Succeeded
NOTE: recipe go-binary-native-1.20.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 304 of 304 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-binary-native_1.20.10.bb:do_recipe_qa_setscene)
NOTE: recipe go-binary-native-1.20.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe go-binary-native-1.20.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 890 of 914 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 898 of 914 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_collect_spdx_deps)
NOTE: recipe go-runtime-1.20.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe go-runtime-1.20.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe go-runtime-1.20.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe go-runtime-1.20.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 900 of 914 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_configure)
NOTE: recipe go-runtime-1.20.10-r0: task do_configure: Started
NOTE: recipe go-runtime-1.20.10-r0: task do_configure: Succeeded
NOTE: Running task 901 of 914 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_compile)
NOTE: recipe go-runtime-1.20.10-r0: task do_compile: Started
NOTE: recipe go-runtime-1.20.10-r0: task do_compile: Succeeded
NOTE: Running task 902 of 914 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_install)
NOTE: recipe go-runtime-1.20.10-r0: task do_install: Started
NOTE: recipe go-runtime-1.20.10-r0: task do_install: Succeeded
NOTE: Running task 903 of 914 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_package)
NOTE: recipe go-runtime-1.20.10-r0: task do_package: Started
NOTE: recipe go-runtime-1.20.10-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_package unihash changed to e5ba2f2fd830db77c2548f3ae606e8f30aeff2da354a8e10266e31d5feb9236a
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go_1.20.10.bb:do_package_write_deb became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_package_write_deb became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go_1.20.10.bb:do_package_qa became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_package_write_ipk became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go_1.20.10.bb:do_create_runtime_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go_1.20.10.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go_1.20.10.bb:do_package_write_ipk became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_create_spdx became valid
NOTE: Running setscene task 295 of 304 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 296 of 304 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 297 of 304 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 298 of 304 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go_1.20.10.bb:do_create_runtime_spdx_setscene)
NOTE: Running setscene task 299 of 304 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go_1.20.10.bb:do_package_qa_setscene)
NOTE: Running setscene task 300 of 304 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go_1.20.10.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 301 of 304 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go_1.20.10.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 302 of 304 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go_1.20.10.bb:do_package_write_rpm_setscene)
NOTE: recipe go-runtime-1.20.10-r0: task do_package_write_deb_setscene: Started
NOTE: recipe go-runtime-1.20.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe go-runtime-1.20.10-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe go-1.20.10-r0: task do_create_runtime_spdx_setscene: Started
NOTE: recipe go-1.20.10-r0: task do_package_qa_setscene: Started
NOTE: recipe go-1.20.10-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe go-1.20.10-r0: task do_package_write_deb_setscene: Started
NOTE: recipe go-1.20.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe go-1.20.10-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe go-1.20.10-r0: task do_create_runtime_spdx_setscene: Succeeded
NOTE: recipe go-1.20.10-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe go-1.20.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe go-1.20.10-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe go-runtime-1.20.10-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe go-runtime-1.20.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe go-runtime-1.20.10-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 304 of 304 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_packagedata_setscene)
NOTE: recipe go-runtime-1.20.10-r0: task do_packagedata_setscene: Started
NOTE: recipe go-runtime-1.20.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running noexec task 914 of 914 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go_1.20.10.bb:do_build)
NOTE: Tasks Summary: Attempted 914 tasks of which 904 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 71 ERROR messages, returning a non-zero exit code.

ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_package, the basehash value changed from 94897cc38958b46b09d2c5e614db54841ef58142e595f679fbfa9cf4c95acce6 to a37653015e4e8863e2fbb8500ac1cfc84f50bb2a9048f670e3d3bf9a16ed2dc6. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake go-runtime -cdo_package -Snone
ERROR: Then:
ERROR: $ bitbake go-runtime -cdo_package -Sprintdiff

ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_package, the basehash value changed from 94897cc38958b46b09d2c5e614db54841ef58142e595f679fbfa9cf4c95acce6 to a37653015e4e8863e2fbb8500ac1cfc84f50bb2a9048f670e3d3bf9a16ed2dc6. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake go-runtime -cdo_package -Snone
ERROR: Then:
ERROR: $ bitbake go-runtime -cdo_package -Sprintdiff

ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_package, the basehash value changed from 94897cc38958b46b09d2c5e614db54841ef58142e595f679fbfa9cf4c95acce6 to a37653015e4e8863e2fbb8500ac1cfc84f50bb2a9048f670e3d3bf9a16ed2dc6. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake go-runtime -cdo_package -Snone
ERROR: Then:
ERROR: $ bitbake go-runtime -cdo_package -Sprintdiff

ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_package, the basehash value changed from 94897cc38958b46b09d2c5e614db54841ef58142e595f679fbfa9cf4c95acce6 to a37653015e4e8863e2fbb8500ac1cfc84f50bb2a9048f670e3d3bf9a16ed2dc6. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake go-runtime -cdo_package -Snone
ERROR: Then:
ERROR: $ bitbake go-runtime -cdo_package -Sprintdiff

ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_package, the basehash value changed from 94897cc38958b46b09d2c5e614db54841ef58142e595f679fbfa9cf4c95acce6 to a37653015e4e8863e2fbb8500ac1cfc84f50bb2a9048f670e3d3bf9a16ed2dc6. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake go-runtime -cdo_package -Snone
ERROR: Then:
ERROR: $ bitbake go-runtime -cdo_package -Sprintdiff

ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_package, the basehash value changed from 94897cc38958b46b09d2c5e614db54841ef58142e595f679fbfa9cf4c95acce6 to a37653015e4e8863e2fbb8500ac1cfc84f50bb2a9048f670e3d3bf9a16ed2dc6. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake go-runtime -cdo_package -Snone
ERROR: Then:
ERROR: $ bitbake go-runtime -cdo_package -Sprintdiff

ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_package, the basehash value changed from 94897cc38958b46b09d2c5e614db54841ef58142e595f679fbfa9cf4c95acce6 to a37653015e4e8863e2fbb8500ac1cfc84f50bb2a9048f670e3d3bf9a16ed2dc6. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake go-runtime -cdo_package -Snone
ERROR: Then:
ERROR: $ bitbake go-runtime -cdo_package -Sprintdiff

ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_package, the basehash value changed from 94897cc38958b46b09d2c5e614db54841ef58142e595f679fbfa9cf4c95acce6 to a37653015e4e8863e2fbb8500ac1cfc84f50bb2a9048f670e3d3bf9a16ed2dc6. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake go-runtime -cdo_package -Snone
ERROR: Then:
ERROR: $ bitbake go-runtime -cdo_package -Sprintdiff

ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_package, the basehash value changed from 94897cc38958b46b09d2c5e614db54841ef58142e595f679fbfa9cf4c95acce6 to a37653015e4e8863e2fbb8500ac1cfc84f50bb2a9048f670e3d3bf9a16ed2dc6. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake go-runtime -cdo_package -Snone
ERROR: Then:
ERROR: $ bitbake go-runtime -cdo_package -Sprintdiff

ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_package, the basehash value changed from 94897cc38958b46b09d2c5e614db54841ef58142e595f679fbfa9cf4c95acce6 to a37653015e4e8863e2fbb8500ac1cfc84f50bb2a9048f670e3d3bf9a16ed2dc6. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake go-runtime -cdo_package -Snone
ERROR: Then:
ERROR: $ bitbake go-runtime -cdo_package -Sprintdiff

ERROR: Taskhash mismatch c8e94a9d51c7e7a399c93f127dd69dd6547604b8fc2e6e26f59112c82f191572 versus eccc206f8f6c0928e2287d79763d44d6c2871354b9210bf73e029a5c18e09757 for /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_package
ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_package, the basehash value changed from 94897cc38958b46b09d2c5e614db54841ef58142e595f679fbfa9cf4c95acce6 to a37653015e4e8863e2fbb8500ac1cfc84f50bb2a9048f670e3d3bf9a16ed2dc6. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake go-runtime -cdo_package -Snone
ERROR: Then:
ERROR: $ bitbake go-runtime -cdo_package -Sprintdiff

ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_package, the basehash value changed from 94897cc38958b46b09d2c5e614db54841ef58142e595f679fbfa9cf4c95acce6 to a37653015e4e8863e2fbb8500ac1cfc84f50bb2a9048f670e3d3bf9a16ed2dc6. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_package, the basehash value changed from 94897cc38958b46b09d2c5e614db54841ef58142e595f679fbfa9cf4c95acce6 to a37653015e4e8863e2fbb8500ac1cfc84f50bb2a9048f670e3d3bf9a16ed2dc6. The metadata is not deterministic and this needs to be fixed.
ERROR: $ bitbake go-runtime -cdo_package -Snone
ERROR: The following commands may help:
ERROR: Then:
ERROR: $ bitbake go-runtime -cdo_package -Snone
ERROR: Then:
ERROR: $ bitbake go-runtime -cdo_package -Sprintdiff

ERROR: $ bitbake go-runtime -cdo_package -Sprintdiff

ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.10.bb:do_package, the basehash value changed from 94897cc38958b46b09d2c5e614db54841ef58142e595f679fbfa9cf4c95acce6 to a37653015e4e8863e2fbb8500ac1cfc84f50bb2a9048f670e3d3bf9a16ed2dc6. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake go-runtime -cdo_package -Snone
ERROR: Then:
ERROR: $ bitbake go-runtime -cdo_package -Sprintdiff



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5898815767340016119==--

