Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C4E5C021A4
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:20:50 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.42710.1738416041887559687
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:20:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=KUBUQsYm;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=TIlPm/+4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010194c1abaa70-89e99bef-e950-4f00-8616-dda26c8acb65-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416040;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=SHIPsodZVWdNxkWNOudJrXJkKf9aPuFB8R4A1DHDR0Q=;
	b=KUBUQsYmnRDvM/8yK5vErO/xPDhRejrX2Xfl8/X/vi+PkRYqhTib1CRKYLvx5hUZ
	PwpJCCDEgJ9wgkGeptu4W3PAt/KicLhQhE+7FwH3OE+Z9C72IMU28x+ZNSpgAWw0TYQ
	sbW7raqlxD/tlF/OmkMso3zlnrTljXnikfvjjC4c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416040;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=SHIPsodZVWdNxkWNOudJrXJkKf9aPuFB8R4A1DHDR0Q=;
	b=TIlPm/+4F/zjnTEPUvAz0AXcCgFGQQYxBpOUf7llIJ1F6PLT0DisxWRoe44el78R
	swrwY2Vd4nUDi+bFcWNgdNoFTASGEqhacC9I4FQjcn34M2ddPipYDZORtWY1rO3suAr
	cTkdf6nPw1nI+RvBAtcTqLNJveU0BTfiGT21c/6A=
Content-Type: multipart/mixed; boundary="===============1746471288020718958=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Lukasz Majewski <lukma@denx.de>, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cross-localedef-native,glibc-testsuite,glibc-y2038-tests,glibc:
 upgrading to 2.41,2.41,2.41,2.41 FAILED
Message-ID: <01010194c1abaa70-89e99bef-e950-4f00-8616-dda26c8acb65-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:20:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:20:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210507

--===============1746471288020718958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cross-localedef-native,glibc-testsuite,glibc-y2038-tests,glibc* to *2.41,2.41,2.41,2.41* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake cross-localedef-native glibc-testsuite glibc-y2038-tests glibc' failed
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1874 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2e2b3f69f2f5405ba823d3203edd113c002ad75b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 463 Local 426 Mirrors 0 Missed 37 Current 97 (92% match, 93% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 99 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/cross-localedef-native_2.40.bb:do_create_package_spdx_setscene)
NOTE: Running setscene task 100 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 101 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 104 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 108 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 113 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/cross-localedef-native_2.40.bb:do_populate_lic_setscene)
NOTE: Running setscene task 114 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 122 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_package_qa_setscene)
NOTE: Running setscene task 127 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_populate_lic_setscene)
NOTE: Running setscene task 128 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_create_package_spdx_setscene)
NOTE: Running setscene task 133 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_package_qa_setscene)
NOTE: Running setscene task 136 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 143 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_package_qa_setscene)
NOTE: Running setscene task 148 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 151 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 157 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_package_write_rpm_setscene)
NOTE: recipe cross-localedef-native-2.40+git-r0: task do_create_package_spdx_setscene: Started
NOTE: recipe cross-localedef-native-2.40+git-r0: task do_populate_lic_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_package_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_package_write_deb_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_package_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe sed-4.9-r0: task do_package_qa_setscene: Started
NOTE: recipe glibc-2.40+git-r0: task do_populate_lic_setscene: Started
NOTE: recipe glibc-2.40+git-r0: task do_create_package_spdx_setscene: Started
NOTE: recipe cross-localedef-native-2.40+git-r0: task do_create_package_spdx_setscene: Succeeded
NOTE: recipe glibc-2.40+git-r0: task do_package_qa_setscene: Started
NOTE: Running setscene task 159 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.40+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cross-localedef-native-2.40+git-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 160 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 161 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_create_spdx_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 169 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_create_spdx_setscene)
NOTE: Running setscene task 170 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-testsuite_2.40.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 174 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 175 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 177 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 178 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 180 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 181 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: recipe glibc-2.40+git-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 182 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glibc-2.40+git-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 184 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-y2038-tests_2.40.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 185 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-2.40+git-r0: task do_create_package_spdx_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 186 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-locale-2.40+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glibc-testsuite-2.40+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe glibc-2.40+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 187 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 189 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 190 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: recipe glibc-y2038-tests-2.40+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-testsuite-2.40+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 191 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 192 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 193 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 194 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glibc-y2038-tests-2.40+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 197 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 199 of 561 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk-doc/gtk-doc_1.34.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 200 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 202 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 206 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 210 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 211 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-locale-2.40+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 212 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.2.0.bb:do_create_spdx_setscene)
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk-doc-native-1.34.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gawk-5.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 213 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/cross-localedef-native_2.40.bb:do_create_spdx_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 214 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 217 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe qemu-native-9.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 224 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 232 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 233 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.73.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cross-localedef-native-2.40+git-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 235 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_recipe_qa_setscene)
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 236 of 561 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.1.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-locale-2.40+git-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk-doc-native-1.34.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glibc-locale-2.40+git-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 240 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 241 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 243 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe qemu-native-9.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 245 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.73-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sed-4.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cross-localedef-native-2.40+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 247 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 248 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 250 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_package_setscene)
NOTE: recipe base-passwd-3.6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gawk-5.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.73-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-native-4.17.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sed-4.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glibc-locale-2.40+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-native-4.17.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 252 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_setscene)
NOTE: Running setscene task 256 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 259 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.73.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 260 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_setscene)
NOTE: Running setscene task 261 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 265 of 561 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libbsd/libbsd_0.12.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 268 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 269 of 561 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk-doc/gtk-doc_1.34.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 271 of 561 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 272 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 279 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: Running task 123 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-y2038-tests_2.40.bb:do_fetch)
NOTE: Running task 137 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.73-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libbsd-native-0.12.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-native-4.17.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk-doc-native-1.34.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 138 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_fetch)
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.73-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 156 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.73.bb:do_fetch)
NOTE: Running task 164 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-testsuite_2.40.bb:do_fetch)
NOTE: recipe glibc-y2038-tests-2.40+git-r0: task do_fetch: Started
NOTE: recipe util-linux-2.40.2-r0: task do_fetch: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-native-4.17.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 322 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_create_spdx_setscene)
NOTE: recipe gtk-doc-native-1.34.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.73-r0: task do_fetch: Started
NOTE: recipe coreutils-9.5-r0: task do_fetch: Started
NOTE: recipe libbsd-native-0.12.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 327 of 561 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libbsd/libbsd_0.12.2.bb:do_recipe_qa_setscene)
NOTE: recipe glibc-testsuite-2.40+git-r0: task do_fetch: Started
NOTE: recipe libgcc-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.73-r0: task do_fetch: Succeeded
NOTE: recipe libbsd-native-0.12.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 328 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_create_spdx_setscene)
NOTE: recipe libbsd-native-0.12.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glibc-2.40+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.9-r0: task do_package_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_package_setscene: Started
NOTE: recipe glibc-2.40+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 329 of 561 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gperf/gperf_3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 330 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd-systemctl-native.bb:do_create_spdx_setscene)
NOTE: Running setscene task 332 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe systemd-systemctl-native-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gperf-native-3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe systemd-systemctl-native-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 333 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 335 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_create_spdx_setscene)
NOTE: recipe gperf-native-3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 350 of 561 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/bison/bison_3.8.2.bb:do_create_spdx_setscene)
NOTE: recipe bison-native-3.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe bison-native-3.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 355 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-native_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 359 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 360 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 363 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 364 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 365 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 366 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 367 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-native-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-native-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-4.17.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 369 of 561 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/automake/automake_1.17.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.17.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 370 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.1.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 371 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 377 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_recipe_qa_setscene)
NOTE: recipe automake-native-1.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 380 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.17.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe automake-native-1.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 381 of 561 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72e.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.17.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 201 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.1.bb:do_fetch)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe autoconf-native-2.72e-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.17.1-r0: task do_fetch: Started
NOTE: recipe autoconf-native-2.72e-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 383 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb:do_create_spdx_setscene)
NOTE: recipe texinfo-dummy-native-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe texinfo-dummy-native-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 391 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sed-4.9-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 436 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 437 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_recipe_qa_setscene)
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 439 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.37.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 440 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 443 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 445 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 446 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.37.bb:do_packagedata_setscene)
NOTE: recipe bash-5.2.37-r0: task do_package_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcrypt-4.4.37-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 450 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 451 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 452 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 456 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.37.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 458 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.2.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 459 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.37-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 464 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 465 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 466 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 468 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.2.37-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcrypt-4.4.37-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 471 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 473 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.17.1-r0: task do_fetch: Succeeded
NOTE: Running task 283 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.1.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.17.1-r0: task do_unpack: Started
NOTE: recipe shadow-4.17.1-r0: task do_unpack: Succeeded
NOTE: recipe glibc-locale-2.40+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 475 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 476 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/cross-localedef-native_2.40.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 478 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe cross-localedef-native-2.40+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cross-localedef-native-2.40+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 480 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/cross-localedef-native_2.40.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 482 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe cross-localedef-native-2.40+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cross-localedef-native-2.40+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 483 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_package_setscene)
NOTE: Running setscene task 484 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 486 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_package_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glibc-y2038-tests-2.40+git-r0: task do_fetch: Succeeded
NOTE: Running task 296 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-y2038-tests_2.40.bb:do_unpack)
NOTE: recipe libgcc-14.2.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 487 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 488 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_packagedata_setscene)
NOTE: Running setscene task 489 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 490 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe glibc-y2038-tests-2.40+git-r0: task do_unpack: Started
NOTE: recipe glibc-testsuite-2.40+git-r0: task do_fetch: Succeeded
NOTE: Running task 297 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-testsuite_2.40.bb:do_unpack)
NOTE: recipe libgcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-2.40+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.40+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glibc-testsuite-2.40+git-r0: task do_unpack: Started
NOTE: recipe libgcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-2.40+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 491 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_package_setscene)
NOTE: recipe glibc-2.40+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glibc-2.40+git-r0: task do_package_setscene: Started
NOTE: recipe glibc-y2038-tests-2.40+git-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.40+git-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 492 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 494 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 495 of 561 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gperf/gperf_3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 498 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd-systemctl-native.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 500 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-systemctl-native-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.40+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gperf-native-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.40+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 501 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 503 of 561 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-systemctl-native-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 505 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd-systemctl-native.bb:do_recipe_qa_setscene)
NOTE: recipe gperf-native-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 507 of 561 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gperf/gperf_3.1.bb:do_recipe_qa_setscene)
NOTE: recipe systemd-systemctl-native-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.40+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe systemd-systemctl-native-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gperf-native-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-2.40+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 509 of 561 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_recipe_qa_setscene)
NOTE: recipe gperf-native-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glibc-testsuite-2.40+git-r0: task do_unpack: Succeeded
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 512 of 561 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 513 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 515 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmpc-native-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmpc-native-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 517 of 561 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 518 of 561 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 520 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 523 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 524 of 561 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot_setscene)
NOTE: recipe mpfr-native-4.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmpc-native-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-native-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe patch-native-2.7.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpfr-native-4.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 532 of 561 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe patch-native-2.7.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 535 of 561 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_recipe_qa_setscene)
NOTE: recipe mpfr-native-4.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-native-4.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe patch-native-2.7.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 536 of 561 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 537 of 561 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/bison/bison_3.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 539 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_recipe_qa_setscene)
NOTE: recipe patch-native-2.7.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pkgconfig-native-0.29.2+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bison-native-3.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bison-native-3.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 540 of 561 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 542 of 561 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/bison/bison_3.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe pkgconfig-native-0.29.2+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 544 of 561 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_recipe_qa_setscene)
NOTE: recipe bison-native-3.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flex-native-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pkgconfig-native-0.29.2+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bison-native-3.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pkgconfig-native-0.29.2+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe flex-native-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 545 of 561 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/automake/automake_1.17.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 547 of 561 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/flex/flex_2.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe automake-native-1.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-native-2.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flex-native-2.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe automake-native-1.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 549 of 561 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72e.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 550 of 561 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/automake/automake_1.17.bb:do_recipe_qa_setscene)
NOTE: recipe autoconf-native-2.72e-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe automake-native-1.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe automake-native-1.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe autoconf-native-2.72e-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 551 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/m4/m4-native_1.4.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 553 of 561 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72e.bb:do_recipe_qa_setscene)
NOTE: recipe m4-native-1.4.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe autoconf-native-2.72e-r0: task do_recipe_qa_setscene: Started
NOTE: recipe autoconf-native-2.72e-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe m4-native-1.4.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 555 of 561 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gnu-config/gnu-config_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 556 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/m4/m4-native_1.4.19.bb:do_recipe_qa_setscene)
NOTE: recipe m4-native-1.4.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnu-config-native-20240823+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe m4-native-1.4.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnu-config-native-20240823+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 558 of 561 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gnu-config/gnu-config_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 559 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.68.bb:do_populate_sysroot_setscene)
NOTE: recipe quilt-native-0.68-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnu-config-native-20240823+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnu-config-native-20240823+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe quilt-native-0.68-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 561 of 561 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.68.bb:do_recipe_qa_setscene)
NOTE: recipe quilt-native-0.68-r0: task do_recipe_qa_setscene: Started
NOTE: recipe quilt-native-0.68-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1158 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-y2038-tests_2.40.bb:do_patch)
NOTE: Running task 1203 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-y2038-tests_2.40.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1216 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.1.bb:do_patch)
NOTE: Running task 1230 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.73.bb:do_unpack)
NOTE: Running task 1241 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_unpack)
NOTE: Running task 1242 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_unpack)
NOTE: Running task 1256 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1282 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.73.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1320 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-2.73-r0: task do_unpack: Started
NOTE: Running task 1443 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-testsuite_2.40.bb:do_patch)
NOTE: Running task 1446 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_package_write_ipk)
NOTE: recipe shadow-4.17.1-r0: task do_patch: Started
NOTE: recipe glibc-y2038-tests-2.40+git-r0: task do_patch: Started
NOTE: Running task 1447 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_package_write_deb)
NOTE: recipe coreutils-9.5-r0: task do_unpack: Started
NOTE: recipe glibc-y2038-tests-2.40+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.17.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.73-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1452 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-y2038-tests_2.40.bb:do_collect_spdx_deps)
NOTE: recipe util-linux-2.40.2-r0: task do_unpack: Started
NOTE: Running task 1453 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-testsuite_2.40.bb:do_collect_spdx_deps)
NOTE: Running task 1480 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_package_write_ipk)
NOTE: Running task 1481 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_package_write_deb)
NOTE: recipe util-linux-2.40.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibc-testsuite-2.40+git-r0: task do_patch: Started
NOTE: recipe glibc-2.40+git-r0: task do_package_write_ipk: Started
NOTE: recipe libcap-2.73-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.40+git-r0: task do_package_write_deb: Started
NOTE: Running task 1482 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.73.bb:do_patch)
NOTE: recipe glibc-testsuite-2.40+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe glibc-y2038-tests-2.40+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcc-14.2.0-r0: task do_package_write_ipk: Started
NOTE: recipe libgcc-14.2.0-r0: task do_package_write_deb: Started
NOTE: recipe libcap-2.73-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running noexec task 1489 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/cross-localedef-native_2.40.bb:do_build)
NOTE: recipe libcap-2.73-r0: task do_patch: Started
NOTE: recipe glibc-testsuite-2.40+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shadow-4.17.1-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.17.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1491 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.1.bb:do_configure)
NOTE: recipe glibc-y2038-tests-2.40+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glibc-y2038-tests-2.40+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libcap-2.73-r0: task do_patch: Succeeded
NOTE: Running task 1493 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.73.bb:do_configure)
NOTE: recipe shadow-4.17.1-r0: task do_configure: Started
NOTE: recipe libcap-2.73-r0: task do_configure: Started
NOTE: recipe coreutils-9.5-r0: task do_unpack: Succeeded
NOTE: Running task 1494 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_patch)
NOTE: recipe util-linux-2.40.2-r0: task do_unpack: Succeeded
NOTE: Running task 1495 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_patch)
NOTE: recipe libcap-2.73-r0: task do_configure: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1496 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.73.bb:do_compile)
NOTE: recipe coreutils-9.5-r0: task do_patch: Started
NOTE: recipe util-linux-2.40.2-r0: task do_patch: Started
NOTE: recipe libcap-2.73-r0: task do_compile: Started
NOTE: recipe coreutils-9.5-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_patch: Succeeded
NOTE: Running task 1499 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_configure)
NOTE: recipe glibc-y2038-tests-2.40+git-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_configure: Started
NOTE: Running task 1500 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-y2038-tests_2.40.bb:do_deploy_source_date_epoch)
NOTE: Running task 1501 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-y2038-tests_2.40.bb:do_populate_lic)
NOTE: recipe glibc-testsuite-2.40+git-r0: task do_patch: Succeeded
NOTE: Running task 1502 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-testsuite_2.40.bb:do_deploy_source_date_epoch)
NOTE: Running task 1503 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-testsuite_2.40.bb:do_populate_lic)
NOTE: recipe glibc-y2038-tests-2.40+git-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glibc-y2038-tests-2.40+git-r0: task do_populate_lic: Started
NOTE: recipe glibc-testsuite-2.40+git-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glibc-testsuite-2.40+git-r0: task do_populate_lic: Started
NOTE: recipe libgcc-14.2.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_package_write_ipk unihash changed to e2e121cbf90a4dccd0c3032815faf428e70efecd4fc9cc924f8c19add687367b
NOTE: recipe glibc-y2038-tests-2.40+git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glibc-testsuite-2.40+git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glibc-y2038-tests-2.40+git-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-y2038-tests_2.40.bb:do_deploy_source_date_epoch unihash changed to f08ee03177fa0e99bc0788cf6a3da611ee39af6af566229b0e82b3ef4f7ced5f
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-y2038-tests_2.40.bb:do_populate_sysroot as unihash 56fbbb88bc7662c80633726f7c3bdb440925069f455b50573a1013ad78a64f9a to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '92fc50261622e3b1c4079297c671ada251f82ac3077b074000eaf7cb78d5394b', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '56fbbb88bc7662c80633726f7c3bdb440925069f455b50573a1013ad78a64f9a'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-y2038-tests_2.40.bb:do_populate_sysroot unihash changed 92fc50261622e3b1c4079297c671ada251f82ac3077b074000eaf7cb78d5394b -> 56fbbb88bc7662c80633726f7c3bdb440925069f455b50573a1013ad78a64f9a as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-y2038-tests_2.40.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: recipe glibc-testsuite-2.40+git-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-y2038-tests_2.40.bb:do_populate_lic unihash changed to 5498935bbfba35d1603d653d3710b42ecb6c4f6b248afd7f42837734dcad0470
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-testsuite_2.40.bb:do_deploy_source_date_epoch unihash changed to 2b88b9009e5861a1fe77b06c2cfc8edea1caeebf6775f49be154c53cead218a0
NOTE: Setscene tasks completed
NOTE: Running task 1504 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-y2038-tests_2.40.bb:do_configure)
NOTE: Running task 1505 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-testsuite_2.40.bb:do_create_spdx)
NOTE: recipe glibc-y2038-tests-2.40+git-r0: task do_configure: Started
NOTE: recipe glibc-testsuite-2.40+git-r0: task do_create_spdx: Started
NOTE: recipe glibc-2.40+git-r0: task do_package_write_ipk: Succeeded
NOTE: recipe libcap-2.73-r0: task do_compile: Succeeded
NOTE: Running task 1506 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.73.bb:do_install)
NOTE: recipe libcap-2.73-r0: task do_install: Started
NOTE: recipe libgcc-14.2.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_package_write_deb unihash changed to b3587f8d39292d463872e3847e3f76372db6522d96cb8ff012331ab1d51de44c
NOTE: recipe libcap-2.73-r0: task do_install: Succeeded
NOTE: Running task 1507 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.73.bb:do_populate_sysroot)
NOTE: Running task 1508 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.73.bb:do_package)
NOTE: recipe libcap-2.73-r0: task do_populate_sysroot: Started
NOTE: recipe libcap-2.73-r0: task do_package: Started
NOTE: recipe libcap-2.73-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1509 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe coreutils-9.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1510 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_configure)
NOTE: recipe coreutils-9.5-r0: task do_configure: Started
NOTE: recipe glibc-y2038-tests-2.40+git-r0: task do_configure: Succeeded
NOTE: Running task 1511 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-y2038-tests_2.40.bb:do_configure_ptest_base)
NOTE: recipe glibc-y2038-tests-2.40+git-r0: task do_configure_ptest_base: Started
NOTE: recipe glibc-y2038-tests-2.40+git-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1512 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-y2038-tests_2.40.bb:do_compile)
NOTE: recipe glibc-y2038-tests-2.40+git-r0: task do_compile: Started
NOTE: recipe libcap-2.73-r0: task do_package: Succeeded
NOTE: Running task 1513 of 1571 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.73.bb:do_packagedata)
NOTE: recipe libcap-2.73-r0: task do_packagedata: Started
NOTE: recipe libcap-2.73-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.73.bb:do_packagedata unihash changed to f84efb32ad3c588a555d906c82178e008a624a91c4023cdfc4c7c8ae06d0711e
NOTE: Setscene tasks completed
NOTE: recipe glibc-testsuite-2.40+git-r0: task do_create_spdx: Failed
NOTE: recipe glibc-2.40+git-r0: task do_package_write_deb: Succeeded
NOTE: recipe shadow-4.17.1-r0: task do_configure: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_configure: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_configure: Succeeded
NOTE: recipe glibc-y2038-tests-2.40+git-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1513 tasks of which 1466 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250201050332.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250201050332.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-testsuite_2.40.bb:do_create_spdx
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/glibc-testsuite/2.40+git/temp/log.do_create_spdx.3677382
Summary: There was 1 ERROR message, returning a non-zero exit code.

ERROR: glibc-testsuite-2.40+git-r0 do_create_spdx: Recipe glibc-testsuite is trying to create package sln which was already written by recipe glibc. This will cause corruption, please resolve this and only provide the package from one recipe or the other or only build one of the recipes.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/glibc-testsuite/2.40+git/temp/log.do_create_spdx.3677382
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-testsuite_2.40.bb:do_create_spdx) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1746471288020718958==--

