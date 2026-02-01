Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84577E6BF22
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:12:45 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29184.1769951561247612160
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=xHaefyaS;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=P/LgC61m;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019c19558297-03440b9a-30a5-4d23-a629-cd86a330ccce-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951560;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=d7Z0mocuJa2Nt+md0LxXO7Ef00WvfM0C1/ObnJ88RCg=;
	b=xHaefyaS59NOHo2tII6vlHJZt5M7Hn5WLTNo6u91yJnZOW6n6xzXR/hbriB69uzA
	01JXb0BLaMg2JQXP8ZtlnrA+TNVuT++Y2mdT40pzjXUJbhKX9FWK/SIuxYuQ0593nuQ
	fr1hlxl5OFuxkQzj7SKnml0LwMNR7HoXdVCrM5xM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951560;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=d7Z0mocuJa2Nt+md0LxXO7Ef00WvfM0C1/ObnJ88RCg=;
	b=P/LgC61m/DyTeCezUPQrsKgK3/7b3fiCaxqKl//tLNXQnnyHk1pkXEy+l32TEcuc
	AsbF17eI6ATutZrbhWR9s7q0f+K8H9p+IJXWzDGGdQAjgWgw6Hv8wScytm3HyxIqbCu
	F9/pFQptgta8wnF/WtWTv7v+/U5kZuo7Jjc9Cxnc=
Content-Type: multipart/mixed; boundary="===============8837240863495924298=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cross-localedef-native,glibc-testsuite,glibc: upgrading to
 2.43,2.43,2.43 FAILED
Message-ID: <0101019c19558297-03440b9a-30a5-4d23-a629-cd86a330ccce-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:12:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230260

--===============8837240863495924298==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cross-localedef-native,glibc-testsuite,glibc* to *2.43,2.43,2.43* has Failed(other errors).

Detailed error information:

' bitbake cross-localedef-native glibc-testsuite glibc' failed
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1957 targets, 47 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-58b9f90779d1227e30a7de4948b10e49fb5b5ac1"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:58b9f90779d1227e30a7de4948b10e49fb5b5ac1"
meta-yocto-bsp       
meta-poky            = "master:de4abc0a175af12eacc761a2e1e60ca7fdfeaa1b"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 231 Local 225 Mirrors 0 Missed 6 Current 153 (97% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 156 of 384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 160 of 384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_create_package_spdx_setscene)
NOTE: Running setscene task 169 of 384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_package_qa_setscene)
NOTE: Running setscene task 170 of 384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/cross-localedef-native_2.42.bb:do_create_package_spdx_setscene)
NOTE: Running setscene task 174 of 384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 175 of 384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/cross-localedef-native_2.42.bb:do_populate_lic_setscene)
NOTE: Running setscene task 181 of 384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_populate_lic_setscene)
NOTE: Running setscene task 192 of 384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 207 of 384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 209 of 384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_package_qa_setscene)
NOTE: Running setscene task 218 of 384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 221 of 384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 222 of 384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc-locale_2.42.bb:do_create_spdx_setscene)
NOTE: Running setscene task 223 of 384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc-testsuite_2.42.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 224 of 384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_10.2.0.bb:do_create_spdx_setscene)
NOTE: recipe cross-localedef-native-2.42+git-r0: task do_create_package_spdx_setscene: Started
NOTE: recipe cross-localedef-native-2.42+git-r0: task do_populate_lic_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_package_write_deb_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_package_qa_setscene: Started
NOTE: recipe glibc-locale-2.42+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe qemu-native-10.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.42+git-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe glibc-2.42+git-r1: task do_create_package_spdx_setscene: Started
NOTE: recipe glibc-2.42+git-r1: task do_package_qa_setscene: Started
NOTE: recipe glibc-testsuite-2.42+git-r1: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-2.42+git-r1: task do_populate_lic_setscene: Started
NOTE: recipe cross-localedef-native-2.42+git-r0: task do_create_package_spdx_setscene: Succeeded
NOTE: recipe cross-localedef-native-2.42+git-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe glibc-2.42+git-r1: task do_package_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe qemu-native-10.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glibc-testsuite-2.42+git-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 388 of 1127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc-testsuite_2.42.bb:do_fetch)
NOTE: recipe glibc-2.42+git-r1: task do_populate_lic_setscene: Succeeded
NOTE: recipe glibc-2.42+git-r1: task do_create_package_spdx_setscene: Succeeded
NOTE: recipe glibc-2.42+git-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glibc-testsuite-2.42+git-r1: task do_fetch: Started
NOTE: recipe glibc-locale-2.42+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 240 of 384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc-locale_2.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 241 of 384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/cross-localedef-native_2.42.bb:do_create_spdx_setscene)
NOTE: Running setscene task 242 of 384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_create_spdx_setscene)
NOTE: recipe cross-localedef-native-2.42+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-locale-2.42+git-r0: task do_packagedata_setscene: Started
NOTE: recipe glibc-2.42+git-r1: task do_create_spdx_setscene: Started
NOTE: recipe cross-localedef-native-2.42+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glibc-2.42+git-r1: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 243 of 384 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 245 of 384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_package_setscene)
NOTE: recipe gawk-native-5.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gawk-native-5.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 246 of 384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 247 of 384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_258.1.bb:do_create_spdx_setscene)
NOTE: recipe systemd-systemctl-native-258.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe systemd-systemctl-native-258.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 258 of 384 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gperf/gperf_3.3.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 304 of 384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_create_spdx_setscene)
NOTE: Running setscene task 305 of 384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_create_spdx_setscene)
NOTE: recipe binutils-cross-x86_64-2.45.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_create_spdx_setscene: Started
NOTE: recipe gperf-native-3.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.45.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gperf-native-3.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glibc-2.42+git-r1: task do_package_setscene: Started
NOTE: recipe glibc-2.42+git-r1: task do_package_setscene: Succeeded
NOTE: recipe glibc-testsuite-2.42+git-r1: task do_fetch: Succeeded
NOTE: Running task 665 of 1127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc-testsuite_2.42.bb:do_unpack)
NOTE: recipe glibc-testsuite-2.42+git-r1: task do_unpack: Started
NOTE: recipe glibc-testsuite-2.42+git-r1: task do_unpack: Succeeded
NOTE: Running task 666 of 1127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc-testsuite_2.42.bb:do_patch)
NOTE: recipe glibc-testsuite-2.42+git-r1: task do_patch: Started
NOTE: recipe glibc-testsuite-2.42+git-r1: task do_patch: Succeeded
NOTE: Running task 667 of 1127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc-testsuite_2.42.bb:do_deploy_source_date_epoch)
NOTE: Running task 668 of 1127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc-testsuite_2.42.bb:do_populate_lic)
NOTE: recipe glibc-locale-2.42+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 311 of 384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 313 of 384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/cross-localedef-native_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 314 of 384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_258.1.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-testsuite-2.42+git-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe glibc-testsuite-2.42+git-r1: task do_populate_lic: Started
NOTE: recipe cross-localedef-native-2.42+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-systemctl-native-258.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.42+git-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.42+git-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cross-localedef-native-2.42+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 328 of 384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/cross-localedef-native_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe systemd-systemctl-native-258.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 329 of 384 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 334 of 384 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 339 of 384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_258.1.bb:do_recipe_qa_setscene)
NOTE: recipe glibc-testsuite-2.42+git-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc-testsuite_2.42.bb:do_deploy_source_date_epoch unihash changed to 0bd323f2c6a959eb227df71405787b7ca66869230bf63de3a3bbcba8fcca7835
NOTE: recipe cross-localedef-native-2.42+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe systemd-systemctl-native-258.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cross-localedef-native-2.42+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running noexec task 818 of 1127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/cross-localedef-native_2.42.bb:do_build)
NOTE: recipe systemd-systemctl-native-258.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-native-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-testsuite-2.42+git-r1: task do_populate_lic: Succeeded
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 346 of 384 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 347 of 384 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe python3-markupsafe-native-3.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-markupsafe-native-3.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 348 of 384 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 350 of 384 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-native-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 352 of 384 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 354 of 384 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 355 of 384 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-native-80.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-markupsafe-native-3.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-native-0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-native-10.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-markupsafe-native-3.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-native-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-native-0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-native-10.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 359 of 384 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 361 of 384 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-native-80.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 363 of 384 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.46.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 364 of 384 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-native-0.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-native-10.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-native-80.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-wheel-native-0.46.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-native-0.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-native-10.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-native-80.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-wheel-native-0.46.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 365 of 384 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 367 of 384 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.46.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-build-native-1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-wheel-native-0.46.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-wheel-native-0.46.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-build-native-1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 369 of 384 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 370 of 384 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.4.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 371 of 384 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-build-native-1.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-packaging-native-25.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-build-native-1.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-packaging-native-25.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 373 of 384 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 374 of 384 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 376 of 384 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-packaging-native-25.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-packaging-native-25.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-installer-native-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 377 of 384 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 379 of 384 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 381 of 384 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 382 of 384 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_recipe_qa_setscene)
NOTE: recipe unzip-native-1_6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe unzip-native-1_6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 384 of 384 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_recipe_qa_setscene)
NOTE: recipe unzip-native-1_6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe unzip-native-1_6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1118 of 1127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc-testsuite_2.42.bb:do_collect_spdx_deps)
NOTE: Running task 1119 of 1127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_package_write_ipk)
NOTE: Running task 1120 of 1127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_package_write_deb)
NOTE: recipe glibc-testsuite-2.42+git-r1: task do_collect_spdx_deps: Started
NOTE: recipe glibc-2.42+git-r1: task do_package_write_deb: Started
NOTE: recipe glibc-2.42+git-r1: task do_package_write_ipk: Started
NOTE: recipe glibc-testsuite-2.42+git-r1: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1124 of 1127 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc-testsuite_2.42.bb:do_create_spdx)
NOTE: recipe glibc-testsuite-2.42+git-r1: task do_create_spdx: Started
NOTE: recipe glibc-testsuite-2.42+git-r1: task do_create_spdx: Failed
NOTE: recipe glibc-2.42+git-r1: task do_package_write_deb: Succeeded
NOTE: recipe glibc-2.42+git-r1: task do_package_write_ipk: Succeeded
NOTE: Tasks Summary: Attempted 1124 tasks of which 1114 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260201051038.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260201051038.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc-testsuite_2.42.bb:do_create_spdx
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/glibc-testsuite/2.42+git/temp/log.do_create_spdx.588950
Summary: There was 1 ERROR message, returning a non-zero exit code.

ERROR: glibc-testsuite-2.42+git-r1 do_create_spdx: Recipe glibc-testsuite is trying to create package sln which was already written by recipe glibc. This will cause corruption, please resolve this and only provide the package from one recipe or the other or only build one of the recipes.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/glibc-testsuite/2.42+git/temp/log.do_create_spdx.588950
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc-testsuite_2.42.bb:do_create_spdx) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8837240863495924298==--

