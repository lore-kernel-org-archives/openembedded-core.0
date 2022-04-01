Return-Path: <auh@yoctoproject.org>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B6D6C352AA
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 13:23:43 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web08.10620.1648819421690784244
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 06:23:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=pYLHo10U;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 0101017fe54bbd48-687a373e-8222-4493-b66d-5db60a71e5fd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1648819420;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=m4mP6EkjmRz49HC2Eho79F5lJ2CZk0+8tmzo/Ri6x7M=;
	b=pYLHo10U/zsUQquo0+FXsuejDlk9JQFdcexaUr81myfe39FZDJbg2sDvy5G2oZKW
	UDjIIk3bxpkutDHnWJOkVjMzR7Mz/rs/w59vLPOhZRHCouVME7FZEnaay5iKw+GqeWZ
	LE+ghStN1XAu2Pe+1Bo71K15uN0uInhQmzCY/ISk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1648819420;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=m4mP6EkjmRz49HC2Eho79F5lJ2CZk0+8tmzo/Ri6x7M=;
	b=hWxD4iVRIW+VH1th+HA9E61Gbq/w/GKwOFHsbITb7WPpnCuVxjL2Q8QL3Ueo9yGZ
	ahlC09EVG4zYsM1gdsjm4KVa94HlUQ60QX+L6Q7OL7nL6AUHPYt2bpS8UuVaiVHMYYY
	bhMy8koUuscqZCiEV5Fmo+VVWdudUGuD5B+c4qGY=
Content-Type: multipart/mixed; boundary="===============0894140871958499617=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] strace: upgrading to 5.17 SUCCEEDED
Message-ID: 
 <0101017fe54bbd48-687a373e-8222-4493-b66d-5db60a71e5fd-000000@us-west-2.amazonses.com>
Date: Fri, 1 Apr 2022 13:23:40 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Apr 2022 13:23:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163923

--===============0894140871958499617==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *strace* to *5.17* has Succeeded.

Next steps:
    - apply the patch: git am 0001-strace-upgrade-5.16-5.17.patch
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
--===============0894140871958499617==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/strace/strace-ptest: FILELIST: added "/usr/lib/strace/ptest/tests/trace_personality_number_x32.gen.test /usr/lib/strace/ptest/tests/trace_personality_statfs_32.gen.test /usr/lib/strace/ptest/tests/prctl-set_vma.gen.test /usr/lib/strace/ptest/tests/trace_personality_number_64.gen.test /usr/lib/strace/ptest/tests/trace_personality_statfs_64.in /usr/lib/strace/ptest/tests/trace_personality_statfs_64.gen.test /usr/lib/strace/ptest/tests/ioctl_lirc.gen.test /usr/lib/strace/ptest/tests/qualify_personality_all.sh /usr/lib/strace/ptest/tests/trace_personality_all_64.gen.test /usr/lib/strace/ptest/tests/ioctl_lirc-success.gen.test /usr/lib/strace/ptest/tests/segv_pkuerr.gen.test /usr/lib/strace/ptest/tests/segv_accerr /usr/lib/strace/ptest/tests/print_scno_getcwd.sh /usr/lib/strace/ptest/tests/trace_personality_statfs_32.in /usr/lib/strace/ptest/tests/trace_personality_statfs_x32.gen.test /usr/lib/strace/ptest/tests/prctl-set_vma /usr/lib/strace/ptest/tests/trace_
 personality_number_32.in /usr/lib/strace/ptest/tests/segv_accerr.gen.test /usr/lib/strace/ptest/tests/ioctl_lirc /usr/lib/strace/ptest/tests/trace_personality_all_32.gen.test /usr/lib/strace/ptest/tests/set_mempolicy_home_node /usr/lib/strace/ptest/tests/trace_personality_number_32.gen.test /usr/lib/strace/ptest/tests/segv_pkuerr /usr/lib/strace/ptest/tests/trace_personality_statfs_x32.in /usr/lib/strace/ptest/tests/set_mempolicy_home_node.gen.test /usr/lib/strace/ptest/tests/trace_personality_number_64.in /usr/lib/strace/ptest/tests/trace_personality_number_x32.in /usr/lib/strace/ptest/tests/trace_personality_all_x32.gen.test /usr/lib/strace/ptest/tests/ioctl_lirc-success"

--===============0894140871958499617==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1641 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (881 cached, 1 parsed). 1640 targets, 34 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d31b9d9377484317439d8e4f3d5d49e2fed9f0f1"
workspace            = "master:ee5f9d9fdd7d09aa3a86a19d07e3e64851ddc686"

Initialising tasks...done.
Sstate summary: Wanted 123 Local 29 Mirrors 0 Missed 94 Current 382 (23% match, 81% complete)
Removing 12 stale sstate objects for arch core2-64...done.
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 393 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 439 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 468 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 478 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 479 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.37.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 765 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_configure)
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1065 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_configure_ptest_base)
NOTE: recipe libpcre-8.45-r0: task do_configure: Started
NOTE: Running task 1109 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_compile)
NOTE: Running task 1183 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_compile)
NOTE: Running task 1186 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_compile)
NOTE: Running task 1256 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_compile)
NOTE: Running task 1257 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_install)
NOTE: recipe libseccomp-2.5.3-r0: task do_configure_ptest_base: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_compile: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_compile: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_compile: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_compile: Succeeded
NOTE: recipe kmod-29-r0: task do_compile: Started
NOTE: recipe python3-3.10.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 498 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.0.bb:do_package_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3/3.10.3-r0/temp/log.do_packagedata_setscene.4119103
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 499 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_package_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_compile: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_compile: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1264 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_compile)
NOTE: Running task 1267 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_install)
NOTE: Running task 1268 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_install)
NOTE: Running task 1269 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_install)
NOTE: Running task 1311 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_fetch)
NOTE: Running task 1313 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_fetch)
NOTE: Running task 1314 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_fetch)
NOTE: Running task 1315 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_fetch)
NOTE: Running task 1337 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_fetch)
NOTE: Running task 1341 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_write_config)
NOTE: Running task 1359 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_fetch)
NOTE: recipe zstd-1.5.2-r0: task do_install: Started
NOTE: Running task 1463 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_fetch)
NOTE: Running task 1470 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_packagedata)
NOTE: recipe libseccomp-2.5.3-r0: task do_compile: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_install: Started
NOTE: Running task 1509 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_package)
NOTE: recipe coreutils-9.0-r0: task do_package_setscene: Started
NOTE: recipe libical-3.0.14-r0: task do_fetch: Started
NOTE: recipe vala-0.56.0-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_install: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_install: Started
NOTE: recipe icu-70.1-r0: task do_fetch: Started
NOTE: Running task 1549 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package)
NOTE: recipe libical-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.10.3-r0: task do_package_setscene: Started
NOTE: recipe vala-0.56.0-r0: task do_fetch: Succeeded
NOTE: Running task 1551 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_package)
NOTE: recipe bluez5-5.64-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_fetch: Started
NOTE: recipe icu-70.1-r0: task do_fetch: Succeeded
NOTE: recipe strace-5.17-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_write_config: Started
NOTE: Running task 1552 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_unpack)
NOTE: Running task 1553 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_unpack)
NOTE: Running task 1557 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_fetch: Succeeded
NOTE: Running task 1558 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_unpack)
NOTE: recipe bluez5-5.64-r0: task do_fetch: Succeeded
NOTE: Running task 1559 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe strace-5.17-r0: task do_fetch: Succeeded
NOTE: Running task 1560 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.35.bb:do_package_write_rpm)
NOTE: Running task 1561 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_unpack)
NOTE: Running task 1562 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_unpack)
NOTE: Running task 1563 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_unpack)
NOTE: recipe grep-3.7-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_packagedata: Started
NOTE: recipe grep-3.7-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_write_config: Succeeded
NOTE: Running task 1565 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_unpack)
NOTE: recipe libical-3.0.14-r0: task do_unpack: Started
NOTE: recipe vala-0.56.0-r0: task do_unpack: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Started
NOTE: recipe gawk-5.1.1-r0: task do_package: Started
NOTE: recipe icu-70.1-r0: task do_unpack: Started
NOTE: recipe findutils-4.9.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_unpack: Started
NOTE: recipe strace-5.17-r0: task do_unpack: Started
NOTE: recipe icu-70.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm: Started
NOTE: recipe bluez5-5.64-r0: task do_unpack: Started
NOTE: recipe grep-3.7-r0: task do_unpack: Started
NOTE: recipe libical-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1566 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_patch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_install: Succeeded
NOTE: recipe kmod-29-r0: task do_compile: Succeeded
NOTE: recipe glibc-locale-2.35-r0: task do_package_write_rpm: Started
NOTE: Running task 1567 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_install)
NOTE: Running task 1568 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 1569 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package)
NOTE: recipe libical-3.0.14-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_install: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_install: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_unpack: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot: Started
NOTE: Running task 1570 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot)
NOTE: Running task 1571 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot)
NOTE: Running task 1572 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_patch)
NOTE: Running task 1573 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package)
NOTE: Running task 1574 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package)
NOTE: recipe grep-3.7-r0: task do_unpack: Succeeded
NOTE: Running task 1575 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_patch)
NOTE: recipe libical-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1576 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_generate_toolchain_file)
NOTE: Running task 1577 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Started
NOTE: recipe bluez5-5.64-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot: Started
NOTE: Running task 1578 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_patch)
NOTE: recipe kmod-29-r0: task do_install: Started
NOTE: recipe icu-70.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package: Started
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package: Started
NOTE: recipe grep-3.7-r0: task do_patch: Started
NOTE: recipe vala-0.56.0-r0: task do_unpack: Succeeded
NOTE: Running task 1579 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_patch)
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.64-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_packagedata: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_patch: Succeeded
NOTE: Running task 1580 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.0-r0: task do_patch: Started
NOTE: recipe grep-3.7-r0: task do_patch: Succeeded
NOTE: Running task 1581 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe strace-5.17-r0: task do_unpack: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vala-0.56.0-r0: task do_patch: Succeeded
NOTE: Running task 1582 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_patch)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1583 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1584 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe grep-3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe strace-5.17-r0: task do_patch: Started
NOTE: recipe bluez5-5.64-r0: task do_patch: Succeeded
NOTE: Running task 1585 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_deploy_source_date_epoch)
NOTE: recipe libice-1_1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1586 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe kmod-29-r0: task do_install: Succeeded
NOTE: Running task 1587 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_populate_sysroot)
NOTE: recipe grep-3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1588 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_package)
NOTE: recipe libxcb-1.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1589 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_configure)
NOTE: recipe bluez5-5.64-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe kmod-29-r0: task do_populate_sysroot: Started
NOTE: recipe kmod-29-r0: task do_package: Started
NOTE: recipe libice-1_1.0.10-r0: task do_configure: Started
NOTE: recipe strace-5.17-r0: task do_patch: Succeeded
NOTE: Running task 1590 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_deploy_source_date_epoch)
NOTE: Running task 1591 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_populate_lic)
NOTE: recipe strace-5.17-r0: task do_populate_lic: Started
NOTE: recipe strace-5.17-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcb-1.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe icu-70.1-r0: task do_unpack: Succeeded
NOTE: Running task 1592 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_configure)
NOTE: Running task 1593 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_patch)
NOTE: recipe strace-5.17-r0: task do_populate_lic: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_populate_lic unihash changed to a6b1df75dc53be8b6056177243ab303fc454edc85216acd9842c7d42cddd6bdb
NOTE: recipe icu-70.1-r0: task do_patch: Started
NOTE: recipe strace-5.17-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe kmod-29-r0: task do_populate_sysroot: Succeeded
NOTE: recipe icu-70.1-r0: task do_patch: Succeeded
NOTE: Running task 1594 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_make_icudata)
NOTE: Running task 1595 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_deploy_source_date_epoch)
NOTE: recipe icu-70.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-70.1-r0: task do_make_icudata: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Succeeded
NOTE: recipe icu-70.1-r0: task do_make_icudata: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Succeeded
NOTE: Running task 1596 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package unihash changed to d013333b219c32a116953b113ba230402d494a67781b8648e1a92e00c1f12615
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata became valid
NOTE: Running setscene task 500 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Started
NOTE: recipe icu-70.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: Running task 1597 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_configure)
NOTE: recipe python3-3.10.3-r0: task do_package_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package: Succeeded
NOTE: Running task 1610 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe icu-70.1-r0: task do_configure: Started
NOTE: Running task 1612 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_packagedata)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package: Succeeded
NOTE: Running task 1613 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata)
NOTE: Running task 1614 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata)
NOTE: recipe libxml2-2.9.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-3.10.3-r0: task do_packagedata: Started
NOTE: recipe kmod-29-r0: task do_package: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1616 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_packagedata)
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1617 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_configure)
NOTE: recipe kmod-29-r0: task do_packagedata: Started
NOTE: recipe libxml2-2.9.13-r0: task do_configure: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-3.10.3-r0: task do_packagedata: Succeeded
NOTE: recipe kmod-29-r0: task do_packagedata: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_compile: Succeeded
NOTE: Running task 1618 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_compile_ptest_base)
NOTE: recipe libseccomp-2.5.3-r0: task do_compile_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_package: Succeeded
NOTE: recipe coreutils-9.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 502 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_populate_sysroot_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_package unihash changed to 2eb1bfae386fe914cc04a0fdc08a743a19b1886e127573a3dbe6240812fd55dd
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata became valid
NOTE: Running setscene task 503 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.63-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.63-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.63-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.63-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 505 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gawk-5.1.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_package unihash changed to 7276daa2b0d3ed0c6b0f5b0734177dc8221f7bf4c809fdc583c0db49aba24521
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_packagedata became valid
NOTE: Running setscene task 505 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1676 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_package_write_rpm)
NOTE: Running task 1677 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm)
NOTE: Running task 1678 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.0.bb:do_package_write_rpm)
NOTE: recipe gawk-5.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm: Started
NOTE: recipe coreutils-9.0-r0: task do_package_write_rpm: Started
NOTE: recipe gawk-5.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm unihash changed to 03240347c27a7be70c5563943ce52324ed4ec0e404e865bcc4b582fe20f77a1b
NOTE: recipe icu-70.1-r0: task do_configure: Succeeded
NOTE: Running task 1679 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_compile)
NOTE: recipe zstd-1.5.2-r0: task do_install: Succeeded
NOTE: Running task 1680 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_populate_sysroot)
NOTE: Running task 1681 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_package)
NOTE: recipe icu-70.1-r0: task do_compile: Started
NOTE: recipe zstd-1.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe zstd-1.5.2-r0: task do_package: Started
NOTE: recipe libpcre-8.45-r0: task do_configure: Succeeded
NOTE: Running task 1682 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_configure_ptest_base)
NOTE: recipe libpcre-8.45-r0: task do_configure_ptest_base: Started
NOTE: recipe libpcre-8.45-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1683 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_compile)
NOTE: recipe libpcre-8.45-r0: task do_compile: Started
NOTE: recipe libice-1_1.0.10-r0: task do_configure: Succeeded
NOTE: Running task 1684 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_compile)
NOTE: recipe libice-1_1.0.10-r0: task do_compile: Started
NOTE: recipe zstd-1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 1685 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_install)
NOTE: recipe libice-1_1.0.10-r0: task do_install: Started
NOTE: recipe libice-1_1.0.10-r0: task do_install: Succeeded
NOTE: Running task 1686 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot)
NOTE: Running task 1687 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1688 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsm-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.2-r0: task do_package: Succeeded
NOTE: Running task 1689 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_packagedata)
NOTE: recipe zstd-1.5.2-r0: task do_packagedata: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1690 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_configure)
NOTE: recipe libxcb-1.14-r0: task do_configure: Succeeded
NOTE: Running task 1691 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_compile)
NOTE: recipe libsm-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libxcb-1.14-r0: task do_compile: Started
NOTE: recipe zstd-1.5.2-r0: task do_packagedata: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package: Succeeded
NOTE: Running task 1692 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_compile: Succeeded
NOTE: Running task 1693 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_install)
NOTE: recipe libxcb-1.14-r0: task do_install: Started
NOTE: recipe libpcre-8.45-r0: task do_compile: Succeeded
NOTE: Running task 1694 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_compile_ptest_base)
NOTE: recipe libpcre-8.45-r0: task do_compile_ptest_base: Started
NOTE: recipe libpcre-8.45-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1695 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_install)
NOTE: recipe libpcre-8.45-r0: task do_install: Started
NOTE: recipe libxml2-2.9.13-r0: task do_configure: Succeeded
NOTE: Running task 1696 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_configure_ptest_base)
NOTE: recipe libxml2-2.9.13-r0: task do_configure_ptest_base: Started
NOTE: recipe libxml2-2.9.13-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1697 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_compile)
NOTE: recipe libxml2-2.9.13-r0: task do_compile: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1698 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_install)
NOTE: recipe libpcre-8.45-r0: task do_install: Succeeded
NOTE: Running task 1699 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_install_ptest_base)
NOTE: recipe libseccomp-2.5.3-r0: task do_install: Started
NOTE: recipe libpcre-8.45-r0: task do_install_ptest_base: Started
NOTE: recipe libpcre-8.45-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1700 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot)
NOTE: Running task 1701 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_package)
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre-8.45-r0: task do_package: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_install: Succeeded
NOTE: Running task 1702 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_install_ptest_base)
NOTE: recipe libseccomp-2.5.3-r0: task do_install_ptest_base: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1703 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1704 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe grep-3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe grep-3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1705 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_configure)
NOTE: recipe grep-3.7-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1706 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_configure)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_configure: Started
NOTE: recipe libxcb-1.14-r0: task do_install: Succeeded
NOTE: Running task 1707 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot)
NOTE: Running task 1708 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package)
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot: Started
NOTE: recipe libxcb-1.14-r0: task do_package: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1709 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_populate_sysroot)
NOTE: Running task 1710 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_package)
NOTE: recipe libseccomp-2.5.3-r0: task do_populate_sysroot: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_package: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1711 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1712 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_configure)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_configure: Started
NOTE: recipe libpcre-8.45-r0: task do_package: Succeeded
NOTE: Running task 1713 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata)
NOTE: recipe coreutils-9.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.0.bb:do_package_write_rpm unihash changed to 6ed8f6c73c7a1ddc9e2dbe2b12d4bf54c37e632016fe3112317aa2bc2cfca92b
NOTE: recipe libpcre-8.45-r0: task do_packagedata: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 1714 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_compile)
NOTE: recipe libsm-1_1.2.3-r0: task do_compile: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 1715 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_install)
NOTE: recipe libsm-1_1.2.3-r0: task do_install: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 1716 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 1717 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package)
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_package: Succeeded
NOTE: Running task 1718 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_packagedata)
NOTE: recipe libseccomp-2.5.3-r0: task do_packagedata: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_packagedata: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 1719 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_compile: Succeeded
NOTE: Running task 1720 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_compile_ptest_base)
NOTE: recipe libxml2-2.9.13-r0: task do_compile_ptest_base: Started
NOTE: recipe libxcb-1.14-r0: task do_package: Succeeded
NOTE: Running task 1721 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata)
NOTE: recipe libxcb-1.14-r0: task do_packagedata: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_configure: Succeeded
NOTE: Running task 1722 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1723 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_compile)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_compile: Started
NOTE: recipe icu-70.1-r0: task do_compile: Succeeded
NOTE: Running task 1724 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_install)
NOTE: recipe icu-70.1-r0: task do_install: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_configure: Succeeded
NOTE: Running task 1725 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_compile)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_compile: Started
NOTE: recipe icu-70.1-r0: task do_install: Succeeded
NOTE: Running task 1726 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_populate_sysroot)
NOTE: Running task 1727 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_package)
NOTE: recipe icu-70.1-r0: task do_populate_sysroot: Started
NOTE: recipe icu-70.1-r0: task do_package: Started
NOTE: recipe icu-70.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_compile: Succeeded
NOTE: Running task 1728 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1729 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_install)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_install: Started
NOTE: recipe grep-3.7-r0: task do_configure: Succeeded
NOTE: Running task 1730 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_compile)
NOTE: recipe grep-3.7-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_install: Succeeded
NOTE: Running task 1731 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1732 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_populate_sysroot)
NOTE: Running task 1733 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_package)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1734 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1735 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxml2-2.9.13-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1736 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_install)
NOTE: recipe libxml2-2.9.13-r0: task do_install: Started
NOTE: recipe vala-0.56.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1737 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1738 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_configure)
NOTE: recipe vala-0.56.0-r0: task do_configure: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_compile: Succeeded
NOTE: Running task 1739 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_install)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_configure: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_install: Started
NOTE: recipe grep-3.7-r0: task do_compile: Succeeded
NOTE: Running task 1740 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_install)
NOTE: recipe grep-3.7-r0: task do_install: Started
NOTE: recipe libxml2-2.9.13-r0: task do_install: Succeeded
NOTE: recipe icu-70.1-r0: task do_package: Succeeded
NOTE: Running task 1741 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_install_ptest_base)
NOTE: Running task 1742 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_packagedata)
NOTE: recipe libxml2-2.9.13-r0: task do_install_ptest_base: Started
NOTE: recipe icu-70.1-r0: task do_packagedata: Started
NOTE: recipe icu-70.1-r0: task do_packagedata: Succeeded
NOTE: recipe grep-3.7-r0: task do_install: Succeeded
NOTE: Running task 1743 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_package)
NOTE: recipe grep-3.7-r0: task do_package: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_install: Succeeded
NOTE: Running task 1744 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_populate_sysroot)
NOTE: Running task 1745 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_package)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_package: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_configure: Succeeded
NOTE: Running task 1746 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_compile: Started
NOTE: recipe libxml2-2.9.13-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1747 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_populate_sysroot)
NOTE: Running task 1748 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_package)
NOTE: recipe libxml2-2.9.13-r0: task do_populate_sysroot: Started
NOTE: recipe libxml2-2.9.13-r0: task do_package: Started
NOTE: recipe grep-3.7-r0: task do_package: Succeeded
NOTE: Running task 1749 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_packagedata)
NOTE: recipe grep-3.7-r0: task do_packagedata: Started
NOTE: recipe libxml2-2.9.13-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1750 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe grep-3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 1751 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_package_write_rpm)
NOTE: recipe wayland-1.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe grep-3.7-r0: task do_package_write_rpm: Started
NOTE: recipe wayland-1.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1752 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_configure)
NOTE: recipe wayland-1.20.0-r0: task do_configure: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_package: Succeeded
NOTE: Running task 1753 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_packagedata)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_packagedata: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_packagedata: Succeeded
NOTE: recipe grep-3.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_configure: Succeeded
NOTE: Running task 1754 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_configure_ptest_base)
NOTE: recipe wayland-1.20.0-r0: task do_configure_ptest_base: Started
NOTE: recipe wayland-1.20.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1755 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_compile)
NOTE: recipe wayland-1.20.0-r0: task do_compile: Started
NOTE: recipe vala-0.56.0-r0: task do_configure: Succeeded
NOTE: Running task 1756 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_compile)
NOTE: recipe vala-0.56.0-r0: task do_compile: Started
NOTE: recipe wayland-1.20.0-r0: task do_compile: Succeeded
NOTE: Running task 1757 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_compile_ptest_base)
NOTE: recipe wayland-1.20.0-r0: task do_compile_ptest_base: Started
NOTE: recipe wayland-1.20.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1758 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_install)
NOTE: recipe wayland-1.20.0-r0: task do_install: Started
NOTE: recipe wayland-1.20.0-r0: task do_install: Succeeded
NOTE: Running task 1759 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_install_ptest_base)
NOTE: recipe wayland-1.20.0-r0: task do_install_ptest_base: Started
NOTE: recipe wayland-1.20.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1760 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_populate_sysroot)
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot: Started
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1761 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1762 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_configure)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_package: Succeeded
NOTE: Running task 1763 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1764 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_compile)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1765 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_install)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 1766 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_populate_sysroot)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1767 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-1_250.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_compile: Succeeded
NOTE: Running task 1768 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_install)
NOTE: recipe systemd-1_250.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_install: Started
NOTE: Running task 1769 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_configure)
NOTE: recipe systemd-1_250.4-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_install: Succeeded
NOTE: Running task 1770 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot)
NOTE: Running task 1771 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_package)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_package: Succeeded
NOTE: Running task 1772 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_package: Succeeded
NOTE: Running task 1773 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_packagedata)
NOTE: recipe libxml2-2.9.13-r0: task do_packagedata: Started
NOTE: recipe libxml2-2.9.13-r0: task do_packagedata: Succeeded
NOTE: Running task 1774 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_package)
NOTE: recipe wayland-1.20.0-r0: task do_package: Started
NOTE: recipe wayland-1.20.0-r0: task do_package: Succeeded
NOTE: Running task 1775 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_packagedata)
NOTE: recipe wayland-1.20.0-r0: task do_packagedata: Started
NOTE: recipe wayland-1.20.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1776 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_package)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 1777 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_packagedata)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe vala-0.56.0-r0: task do_compile: Succeeded
NOTE: Running task 1778 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_install)
NOTE: recipe vala-0.56.0-r0: task do_install: Started
NOTE: recipe vala-0.56.0-r0: task do_install: Succeeded
NOTE: Running task 1779 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_populate_sysroot)
NOTE: Running task 1780 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_package)
NOTE: recipe vala-0.56.0-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.0-r0: task do_package: Started
NOTE: recipe vala-0.56.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1781 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe glibc-locale-2.35-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.35.bb:do_package_write_rpm unihash changed to 0f151f8973d6fcbbeb9d59fd899fbf41e7be63e68770207de959aee95bb05b49
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1782 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_configure)
NOTE: recipe libical-3.0.14-r0: task do_configure: Started
NOTE: recipe vala-0.56.0-r0: task do_package: Succeeded
NOTE: Running task 1783 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_packagedata)
NOTE: recipe vala-0.56.0-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.0-r0: task do_packagedata: Succeeded
NOTE: recipe systemd-1_250.4-r0: task do_configure: Succeeded
NOTE: Running task 1784 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_compile)
NOTE: recipe systemd-1_250.4-r0: task do_compile: Started
NOTE: recipe libical-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1785 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_compile)
NOTE: recipe libical-3.0.14-r0: task do_compile: Started
NOTE: recipe libical-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1786 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_install)
NOTE: recipe libical-3.0.14-r0: task do_install: Started
NOTE: recipe libical-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1787 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1788 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_package)
NOTE: recipe libical-3.0.14-r0: task do_package: Started
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe systemd-1_250.4-r0: task do_compile: Succeeded
NOTE: Running task 1789 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_install)
NOTE: recipe systemd-1_250.4-r0: task do_install: Started
NOTE: recipe libical-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1790 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_packagedata)
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe systemd-1_250.4-r0: task do_install: Succeeded
NOTE: Running task 1791 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_populate_sysroot)
NOTE: Running task 1792 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_package)
NOTE: recipe systemd-1_250.4-r0: task do_package: Started
NOTE: recipe systemd-1_250.4-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-1_250.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1793 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-1.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1794 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_configure)
NOTE: recipe dbus-1.14.0-r0: task do_configure: Started
NOTE: recipe systemd-1_250.4-r0: task do_package: Succeeded
NOTE: Running task 1795 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_packagedata)
NOTE: recipe systemd-1_250.4-r0: task do_packagedata: Started
NOTE: recipe systemd-1_250.4-r0: task do_packagedata: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_configure: Succeeded
NOTE: Running task 1796 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_configure_ptest_base)
NOTE: recipe dbus-1.14.0-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.14.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1797 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_compile)
NOTE: recipe dbus-1.14.0-r0: task do_compile: Started
NOTE: recipe dbus-1.14.0-r0: task do_compile: Succeeded
NOTE: Running task 1798 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_compile_ptest_base)
NOTE: recipe dbus-1.14.0-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.14.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1799 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_install)
NOTE: recipe dbus-1.14.0-r0: task do_install: Started
NOTE: recipe dbus-1.14.0-r0: task do_install: Succeeded
NOTE: Running task 1800 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_install_ptest_base)
NOTE: recipe dbus-1.14.0-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.14.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1801 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_populate_sysroot)
NOTE: Running task 1802 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_package)
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.14.0-r0: task do_package: Started
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1803 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.64-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.64-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1804 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_configure)
NOTE: recipe bluez5-5.64-r0: task do_configure: Started
NOTE: recipe dbus-1.14.0-r0: task do_package: Succeeded
NOTE: Running task 1805 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_packagedata)
NOTE: recipe dbus-1.14.0-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_configure: Succeeded
NOTE: Running task 1806 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.64-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1807 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_compile)
NOTE: recipe bluez5-5.64-r0: task do_compile: Started
NOTE: recipe bluez5-5.64-r0: task do_compile: Succeeded
NOTE: Running task 1808 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_compile_ptest_base: Started
NOTE: recipe bluez5-5.64-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1809 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_install)
NOTE: recipe bluez5-5.64-r0: task do_install: Started
NOTE: recipe bluez5-5.64-r0: task do_install: Succeeded
NOTE: Running task 1810 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.64-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1811 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_populate_sysroot)
NOTE: Running task 1812 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_package)
NOTE: recipe bluez5-5.64-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.64-r0: task do_package: Started
NOTE: recipe bluez5-5.64-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1813 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_prepare_recipe_sysroot)
NOTE: recipe strace-5.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe strace-5.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1814 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_configure)
NOTE: recipe strace-5.17-r0: task do_configure: Started
NOTE: recipe bluez5-5.64-r0: task do_package: Succeeded
NOTE: Running task 1815 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_packagedata)
NOTE: recipe bluez5-5.64-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.64-r0: task do_packagedata: Succeeded
NOTE: recipe strace-5.17-r0: task do_configure: Succeeded
NOTE: Running task 1816 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_configure_ptest_base)
NOTE: recipe strace-5.17-r0: task do_configure_ptest_base: Started
NOTE: recipe strace-5.17-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1817 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_compile)
NOTE: recipe strace-5.17-r0: task do_compile: Started
NOTE: recipe strace-5.17-r0: task do_compile: Succeeded
NOTE: Running task 1818 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_compile_ptest_base)
NOTE: recipe strace-5.17-r0: task do_compile_ptest_base: Started
NOTE: recipe strace-5.17-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1819 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_install)
NOTE: recipe strace-5.17-r0: task do_install: Started
NOTE: recipe strace-5.17-r0: task do_install: Succeeded
NOTE: Running task 1820 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_install_ptest_base)
NOTE: recipe strace-5.17-r0: task do_install_ptest_base: Started
NOTE: recipe strace-5.17-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1821 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_package)
NOTE: Running task 1822 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_populate_sysroot)
NOTE: recipe strace-5.17-r0: task do_package: Started
NOTE: recipe strace-5.17-r0: task do_populate_sysroot: Started
NOTE: recipe strace-5.17-r0: task do_populate_sysroot: Succeeded
NOTE: recipe strace-5.17-r0: task do_package: Succeeded
NOTE: Running task 1823 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_packagedata)
NOTE: recipe strace-5.17-r0: task do_packagedata: Started
NOTE: recipe strace-5.17-r0: task do_packagedata: Succeeded
NOTE: Running task 1824 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_package_write_rpm)
NOTE: Running task 1825 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_package_qa)
NOTE: recipe strace-5.17-r0: task do_package_qa: Started
NOTE: recipe strace-5.17-r0: task do_package_write_rpm: Started
NOTE: recipe strace-5.17-r0: task do_package_write_rpm: Succeeded
NOTE: recipe strace-5.17-r0: task do_package_qa: Succeeded
NOTE: Running noexec task 1826 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_build)
NOTE: Tasks Summary: Attempted 1826 tasks of which 1603 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 70 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-src went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbg went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tests went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-2to3 went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asyncio went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-audio went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-codecs went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compile went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compression went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-core went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-crypt went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ctypes went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-curses went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-datetime went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-db went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-debugger went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-difflib went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils-windows went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doctest went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-email went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-fcntl went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-gdbm went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-html went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-idle went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-image went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-io went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-json went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-logging went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mailbox went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-math went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mime went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mmap went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-modules went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-multiprocessing went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netclient went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netserver went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-numbers went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pickle went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkgutil went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-plistlib went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pprint went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-profile went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pydoc went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-resource went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-shell went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-smtpd went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-sqlite3 went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-statistics went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-stringold went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-syslog went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-terminal went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-threading went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tkinter went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unixadmin went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-venv went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xml went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xmlrpc went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3 went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3-staticdev went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ptest went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-staticdev went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dev went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doc went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-locale went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3 went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-misc went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-man went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0894140871958499617==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/strace: SRC_URI changed from "https://strace.io/files/5.16/strace-5.16.tar.xz file://update-gawk-paths.patch file://Makefile-ptest.patch file://run-ptest file://0001-caps-abbrev.awk-fix-gawk-s-path.patch file://ptest-spacesave.patch file://0001-strace-fix-reproducibilty-issues.patch file://skip-load.patch" to "https://strace.io/files/5.17/strace-5.17.tar.xz file://update-gawk-paths.patch file://Makefile-ptest.patch file://run-ptest file://0001-caps-abbrev.awk-fix-gawk-s-path.patch file://ptest-spacesave.patch file://0001-strace-fix-reproducibilty-issues.patch file://skip-load.patch"
packages/core2-32-poky-linux/strace: PKGV changed from 5.16 [default] to 5.17 [default]
packages/core2-32-poky-linux/strace: PV changed from "5.16" to "5.17"
packages/core2-32-poky-linux/strace/strace-dbg: PKGV changed from 5.16 [default] to 5.17 [default]
packages/core2-32-poky-linux/strace/strace-dbg: PKGSIZE changed from 46283704 to 46198352 (-0%)
packages/core2-32-poky-linux/strace/strace-dbg: FILELIST: added "/usr/lib/strace/ptest/tests/.debug/set_mempolicy_home_node /usr/lib/strace/ptest/tests/.debug/segv_pkuerr /usr/lib/strace/ptest/tests/.debug/segv_accerr /usr/lib/strace/ptest/tests/.debug/ioctl_lirc /usr/lib/strace/ptest/tests/.debug/ioctl_lirc-success /usr/lib/strace/ptest/tests/.debug/prctl-set_vma"
packages/core2-32-poky-linux/strace/strace-dbg: PV changed from "5.16" to "5.17"
packages/core2-32-poky-linux/strace/strace-dev: PKGV changed from 5.16 [default] to 5.17 [default]
packages/core2-32-poky-linux/strace/strace-dev: PV changed from "5.16" to "5.17"
packages/core2-32-poky-linux/strace/strace-doc: PKGV changed from 5.16 [default] to 5.17 [default]
packages/core2-32-poky-linux/strace/strace-doc: PKGSIZE changed from 53985 to 54267 (+1%)
packages/core2-32-poky-linux/strace/strace-doc: PV changed from "5.16" to "5.17"
packages/core2-32-poky-linux/strace/strace-locale: PKGV changed from 5.16 [default] to 5.17 [default]
packages/core2-32-poky-linux/strace/strace-locale: PV changed from "5.16" to "5.17"
packages/core2-32-poky-linux/strace/strace-ptest: PKGV changed from 5.16 [default] to 5.17 [default]
packages/core2-32-poky-linux/strace/strace-ptest: PKGSIZE changed from 25245268 to 25272670 (+0%)
packages/core2-32-poky-linux/strace/strace-ptest: FILELIST: added "/usr/lib/strace/ptest/tests/ioctl_lirc /usr/lib/strace/ptest/tests/prctl-set_vma /usr/lib/strace/ptest/tests/trace_personality_statfs_64.in /usr/lib/strace/ptest/tests/ioctl_lirc-success /usr/lib/strace/ptest/tests/print_scno_getcwd.sh /usr/lib/strace/ptest/tests/set_mempolicy_home_node /usr/lib/strace/ptest/tests/trace_personality_statfs_x32.gen.test /usr/lib/strace/ptest/tests/qualify_personality_all.sh /usr/lib/strace/ptest/tests/segv_pkuerr /usr/lib/strace/ptest/tests/segv_accerr /usr/lib/strace/ptest/tests/trace_personality_statfs_64.gen.test /usr/lib/strace/ptest/tests/trace_personality_number_x32.gen.test /usr/lib/strace/ptest/tests/trace_personality_all_64.gen.test /usr/lib/strace/ptest/tests/trace_personality_statfs_32.gen.test /usr/lib/strace/ptest/tests/trace_personality_number_64.in /usr/lib/strace/ptest/tests/trace_personality_all_32.gen.test /usr/lib/strace/ptest/tests/trace_personality_number_64.gen.tes
 t /usr/lib/strace/ptest/tests/segv_accerr.gen.test /usr/lib/strace/ptest/tests/ioctl_lirc-success.gen.test /usr/lib/strace/ptest/tests/trace_personality_number_32.gen.test /usr/lib/strace/ptest/tests/set_mempolicy_home_node.gen.test /usr/lib/strace/ptest/tests/prctl-set_vma.gen.test /usr/lib/strace/ptest/tests/segv_pkuerr.gen.test /usr/lib/strace/ptest/tests/trace_personality_statfs_32.in /usr/lib/strace/ptest/tests/ioctl_lirc.gen.test /usr/lib/strace/ptest/tests/trace_personality_statfs_x32.in /usr/lib/strace/ptest/tests/trace_personality_all_x32.gen.test /usr/lib/strace/ptest/tests/trace_personality_number_32.in /usr/lib/strace/ptest/tests/trace_personality_number_x32.in"
packages/core2-32-poky-linux/strace/strace-ptest: PV changed from "5.16" to "5.17"
packages/core2-32-poky-linux/strace/strace-src: PKGV changed from 5.16 [default] to 5.17 [default]
packages/core2-32-poky-linux/strace/strace-src: PKGSIZE changed from 9654563 to 9702544 (+0%)
packages/core2-32-poky-linux/strace/strace-src: FILELIST: directory renamed /usr/src/debug/strace/5.16-r0/strace-5.16/src/linux/i386 -> /usr/src/debug/strace/5.17-r0/strace-5.17/src/linux/i386, directory renamed /usr/src/debug/strace/5.16-r0/strace-5.16/src/linux/generic -> /usr/src/debug/strace/5.17-r0/strace-5.17/src/linux/generic, directory renamed /usr/src/debug/strace/5.16-r0/strace-5.16/src/gen -> /usr/src/debug/strace/5.17-r0/strace-5.17/src/gen, directory renamed /usr/src/debug/strace/5.16-r0/strace-5.16/bundled/linux/include/uapi/asm -> /usr/src/debug/strace/5.17-r0/strace-5.17/bundled/linux/include/uapi/asm, directory renamed /usr/src/debug/strace/5.16-r0/strace-5.16/src/linux/x86_64 -> /usr/src/debug/strace/5.17-r0/strace-5.17/src/linux/x86_64, directory renamed /usr/src/debug/strace/5.16-r0/strace-5.16/bundled/linux/include/uapi/linux/netfilter/ipset -> /usr/src/debug/strace/5.17-r0/strace-5.17/bundled/linux/include/uapi/linux/netfilter/ipset, directory renamed /usr/src/d
 ebug/strace/5.16-r0/strace-5.16/bundled/linux/include/uapi/linux/netfilter -> /usr/src/debug/strace/5.17-r0/strace-5.17/bundled/linux/include/uapi/linux/netfilter, directory renamed /usr/src/debug/strace/5.16-r0/strace-5.16/bundled/linux/include/uapi/rdma -> /usr/src/debug/strace/5.17-r0/strace-5.17/bundled/linux/include/uapi/rdma, directory renamed /usr/src/debug/strace/5.16-r0/strace-5.16/bundled/linux/include/uapi/mtd -> /usr/src/debug/strace/5.17-r0/strace-5.17/bundled/linux/include/uapi/mtd, directory renamed /usr/src/debug/strace/5.16-r0/build/src -> /usr/src/debug/strace/5.17-r0/build/src, directory renamed /usr/src/debug/strace/5.16-r0/strace-5.16/bundled/linux/include/uapi/linux -> /usr/src/debug/strace/5.17-r0/strace-5.17/bundled/linux/include/uapi/linux, removed "/usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sock_ip_options.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/block.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/v4l2.c /usr/src/debug/strace/5.16-r0/strace
 -5.16/tests/ioctl_evdev.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/open.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_link_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/brk.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/ioctl_dirs.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/rtnl_dcb.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/modetypes.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/tun_device_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/nfc_protocols.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/kexec_file_load.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/rtnl_addr.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/filter_seccomp-flag.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/siginfo.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_tca_act_hw_stats.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/ptp_perout_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/rtnl_stats.c /usr/src/debug/str
 ace/5.16-r0/strace-5.16/tests/mlock.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/kvm_mem_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/v4l2_tuner_capabilities.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nlattr_ifla_af_inet6.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/prctl-set-ptracer-success.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/nf_acct_msg_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sock_bluetooth_options.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/recvmmsg-timeout.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/unix-pair-send-recv.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nlattr_nhmsg.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/netlink_socket_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/scsi.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/snmp_ip_stats.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/vsock_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/perf_event_ope
 n.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/seccomp_ioctl_addfd_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/swap_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/btrfs.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/nf_osf_msg_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/getdents.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/bpf_attach_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/sigprocmask.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/futex.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/clone_ptrace.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/net-packet_mreq.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/mount_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/faccessat--secontext.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/symlink.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/count-f.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/mtd_mode_options.h /usr/src/debug/strace/5.16-r
 0/strace-5.16/tests/status-unfinished-threads.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/v4l2_vbi_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/socketcall.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/cap_mask0.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ipc.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/times.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/f_owner_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/futex_waiter_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_ifla_xdp_attached_mode.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sysctl_net_core.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/getsockname.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/pipe_maxfd.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/ieee802154_addrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/swapon.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/pr_tsc.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/rest
 art_syscall.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/prctl-syscall-user-dispatch.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/filter_seccomp-perf.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/signal.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_mdba_router_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/userfaultfd.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ifindex.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/netlink_kobject_uevent.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/stage_output.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/prctl-sched-core.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ioctl_fs_x.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/printsignal.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/prctl-seccomp-strict.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/bpf_op_jmp.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/mknod.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/multicast_router_typ
 es.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/delay.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/net-yy-netlink.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_ifla_vf_info_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/tcflsh_options.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/negated_errno.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/perf_ioctl_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ioctl_sg_io_v3.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/open_tree.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/prctl-seccomp-filter-v.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/xfs_dqblk_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/keyctl_pkey_ops.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/copy_file_range.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/delay.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/btrfs_dev_stats_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/status.c /usr/src
 /debug/strace/5.16-r0/strace-5.16/src/rtnl_addrlabel.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/rt_sigtimedwait.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/io_uring_setup.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/v4l2_fields.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/statx.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/ipc.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ioctl_inotify.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/seccomp-strict.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/nf_cttimeout_msg_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/dirent.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/tee_ioctl_gen_caps.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/prlimit64.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nlattr_ifla_linkinfo.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/print_mac.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/chdir.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/kcmp.c /usr/src/deb
 ug/strace/5.16-r0/strace-5.16/src/xlat/kvm_cpuid_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/routing_protocols.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sock_sctp_options.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/ieee802154_pan_ids.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/mount.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xattr.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/ipccalls.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/ptp.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/fetch_struct_statfs.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/getsock_ip_options.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/tcxonc_options.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/geteuid.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/rt_sigqueueinfo.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/fsync-y.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/netlink_protocols.h /usr/src/debug/strace/5.16-r0/strace-5.16
 /tests/timer_xettime.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/old_mmap.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/syscall.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/prctl-unalign.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/socketutils.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/resources.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/alg_sockaddr_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/mtd_file_mode_options.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/filter_qualify.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/kcmp.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/keyctl_kdf_params.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/pidns-cache.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/personality_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/sync_file_range2.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/rtnl_mdb.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/sendfile64.c /usr/src/debug/strace/5
 .16-r0/strace-5.16/tests/nlattr_ifla_vfinfo.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/gettid.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/v4l2_control_id_bases.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nlattr_inet_diag_req_v2.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/sysinfo.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/evdev_misc.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/fan_classes.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/perf_event_read_format.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/kernel_timeval.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/inet_diag_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/fallocate.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_ifla_br_boolopt_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sg_io_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/setdomainname.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/prctl-fp-mode.c /usr/src/debug/strace
 /5.16-r0/strace-5.16/src/xlat/sigaltstack_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/dm.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sock_type_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/preadv2-pwritev2.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/umovestr_cached.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/fetch_struct_iovec.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/clone3_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/ifstats_af_spec_mpls_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/dm_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/ioprio_who.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/fdflags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nlattr_ifla.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sock_alg_options.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/mbind_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/setrlimit.c /usr/src/debug/strace/5.16-r0/strace-
 5.16/tests/maybe_switch_current_tcp.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/kd_meta_vals.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ptrace_syscall_info.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/ubi.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/recvmsg.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/landlock_ruleset_access_fs.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/listen.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/clockflags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/readlink.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/attach-p-cmd-cmd.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/if_dqblk_valid.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/seccomp_ioctl_resp_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/mount_attr_attr.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/libsocketcall.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/packet_diag_attrs.h /usr/src/debug/strace/5.16-r0/strace-5
 .16/src/ptrace_syscall_info.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/mq_sendrecv.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/bpf_sock_filter.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ioctl_fiemap.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sfd_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/printstrn-umoven.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/splice_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/stack-fcall.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/semtimedop-ipc.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/tee_ioctl_origins.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/ptrace_syscall_info_op.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/ioprio.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/btrfs_key_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/fetch_struct_mmsghdr.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/oldstat.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/waitpid.c /
 usr/src/debug/strace/5.16-r0/strace-5.16/tests/fsmount.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ip_mreq.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sock_pppol2tp_options.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/printpath-umovestr-undumpable.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/kd_kbd_modes.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/poke.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/signal_receive.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/rtnl_route.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sigbus_codes.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/test_ucopy.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_nexthop_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/strace--decode-pids-comm.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/setpgrp-exec.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/defs.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/qipcrtr_ports.h /usr/src/debug/strace/5.1
 6-r0/strace-5.16/tests/renameat.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_ifla_proto_down_reason_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/msg_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/ipc_msgctl.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/hw_breakpoint_type.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sock_tipc_options.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/filter_seccomp.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/pr_sve_vl_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/so_peercred.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/net-accept-connect.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/kexec_arch_values.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nanosleep.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/fchmodat--secontext.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xmalloc.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/ptrace.c /usr/src/debug/strace/5.16-r0/strace
 -5.16/src/futex.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/uffd_register_mode_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/netlink_crypto.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/kernel_v4l2_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/netlink_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/uffd_register_ioctl_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/nf_ctnetlink_exp_msg_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rxrpc_services.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sock_ax25_options.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ptrace.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/count.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/bsg_subprotocol.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/get_robust_list.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ioctl_loop.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/kernel_old_timex.h /usr/src/debug/strace/5.16-r0/str
 ace-5.16/src/umount.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/status-failed.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/s390_runtime_instr.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/bluetooth_l2_cid.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/rt_sigreturn.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/open--secontext.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nfnetlink_nft_compat.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/xstatfsx.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/aio_iocb_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/route_nexthop_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/list_sigaction_signum.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/sched_xetparam.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/gpio_ioctl.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/get_page_size.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/perf_hw_cache_op_result_id.h /usr/src/debug/strace/5.16-r0/st
 race-5.16/src/xlat/mctl_sync.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/quota_formats.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/landlock_restrict_self.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/syslog.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/perf_ioctl.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ioctl_kvm_run_common.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_neightbl_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_ifla_af_spec_mctp_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/archvals.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/ptrace_peeksiginfo_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/efd_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/setgroups.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nlattr_fib_rule_hdr.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/subdir.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/kd_key_slock_keys.h /usr/src/debug/strace/5.1
 6-r0/strace-5.16/tests/umovestr.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/printxval.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/perf_attr_size.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/kd_key_fn_keys.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/fanotify_mark.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/futexwakecmps.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/userfaultfd.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/landlock_rule_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nlattr_ndmsg.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/pidfd_open.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/nl_sock_diag_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/eventfd.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/nl_netfilter_subsys_ids.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/ipc_shm.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/futexwakeops.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/
 filter-unavailable.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/getppid.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_tca_stab_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/tee_ioctl_shm_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/fspick.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/xattr.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sync_file_range_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/epollctls.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/bsg_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/fs_ioc_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/bpf_filter.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/packet_mreq_type.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ioctl_rtc.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/netlink_unix_diag.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/truncate.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/af_packet_types.h /usr/sr
 c/debug/strace/5.16-r0/strace-5.16/tests/sendfile.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/keyctl_move_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/xutimes.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/xettimeofday.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/kd_key_ascii_keys.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ioctl_hdio.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nfnetlink_cthelper.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/madvise_cmds.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/lock_file.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/erestartsys.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nlattr_br_port_msg.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/bpf-obj_get_info_by_fd.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/getgid.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/prctl-sve.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/uring_ops.h /usr/src/debug/strace/5.16-r0/strace-5.16/
 src/xlat/evdev_abs.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/dev-yy.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/ipc_msg.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sysctl_root.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/is_linux_mips_n64.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/netlink_audit.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/localtime.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ioctl_sock.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/ioperm.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/trie.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/nf_ipset_msg_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ioctl_mtd.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/btrfs_dev_replace_cmds.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/mq_attr_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/dup2.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/net-ic
 mp_filter.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/fchmod--secontext.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/io.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/fadvise64.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/set_mempolicy.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/perf_hw_id.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ioctl_watchdog.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/setfsugid.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/check_sigign.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/print_msgbuf.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/inet6_devconf_indices.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/semctl_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/fadvise.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/tee_ioctl_max_arg_size.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/fsmount_attr_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_mdba_router_pattr_attrs.h /u
 sr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/btrfs_dev_stats_values.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/getrusage.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/btrfs_features_compat_ro.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/netlink_selinux.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nlattr_tca_stab.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/recvfrom-MSG_TRUNC.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/bt_protocols.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sigfpe_codes.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/bsg_protocol.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/fiemap_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/prctl.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/sigaltstack.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/at_statx_sync_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/nf_nftables_msg_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/netlink_rout
 e.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/print_sigevent.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/getsock_options.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_mdb_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/mmsg.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xgetdents.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/nfc_sockaddr_protocols.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/btrfs_features_compat.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/error_msg.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/string_to_uint.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/tee_ioctl_login_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nlattr_tc_stats.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/faccessat-y--secontext.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/keyctl_commands.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/bpf_prog_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/v4l2
 _meta_fmts.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sock_tls_options.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/inotify.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/ipc_sem.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/adjtimex_modes.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/pkey_alloc.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_ifla_brport_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sock_udp_options.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/kd_key_fn_key_vals.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_tca_stats_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/chroot.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/getcwd.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/lookup_dcookie.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/process_vm_readv_writev.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/kexec_load.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ftruncate64.c /usr/src/
 debug/strace/5.16-r0/strace-5.16/tests/so_linger.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/test_printstrn.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/skip_unavailable.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ioctl.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/v4l2_tuner_rxsubchanses.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/pkey_mprotect.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/audit_arch.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/get_process_reaper.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_ip6mra_msg_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/baud_options.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/mmap_cache.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/btrfs_dev_replace_state.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/bpf_file_mode_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/sched_xetscheduler.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/btrfs_logical_
 ino_args_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/mmap_notify.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sigprocmaskcmds.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/fetch_struct_xfs_quotastat.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/stack-fcall-3.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/seccomp_ioctl.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_mdba_mdb_entry_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/netlink_xfrm.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/waitid.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/sync.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/scmvals.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/bpf_attr.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/timerfdflags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/poke-sendfile.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/memfd_secret_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sock_can_raw_options.h /u
 sr/src/debug/strace/5.16-r0/strace-5.16/tests/attach-p-cmd-p.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/getrandom.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/kexec_file_load_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/sched_xetaffinity.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/getresugid.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/sync_file_range.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/clone_parent.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ioctl_perf.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_family.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/vsock_cids.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/sysctl.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/fib_rule_actions.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/stack-fcall-0.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/btrfs_balance_state.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/adjtimex.c /usr/src/debug/strace/5.16-r0/st
 race-5.16/tests/unshare.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/osf_utimes.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/pr_tagged_addr_enable.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/memfd_create.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/v4l2_input_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/bpf.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/mmsghdr.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nlattr_ndtmsg.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/getuid32.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/btrfs_qgroup_status_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/bind.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/nt_descriptor_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/fs_f_ioctl.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/umask.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/addrfams.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/btrfs_csum_types.h /usr/src/debug/stra
 ce/5.16-r0/strace-5.16/src/rtnl_tc_action.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/inet_diag_req_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/test_nlattr.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/ptrace_setoptions_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/hexquote_strndup.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/xetitimer.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/netlink_kobject_uevent.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/kd_key_brl_keys.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/epoll_pwait.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/printpath-umovestr.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/loop.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/v4l2_memories.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/request_key.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/v4l2_buf_flags_ts_type.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/fs_0x94_ioctl.c /usr/src/debug/strace/5
 .16-r0/strace-5.16/src/xlat/mmap_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/adjtimex_status.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/resource_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/truncate.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/btrfs_scrub_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/quotactl.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/snmp_icmp6_stats.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/finit_module.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/statfs.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/getpid.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/delay.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/inotify_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/getxuid.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/prctl-dumpable.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/v4l2_sdr_fmts.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/kd_key_cur_keys.h /usr/sr
 c/debug/strace/5.16-r0/strace-5.16/src/xlat/bpf_class.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/statx.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/ifstats_xstats_bond_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/status-all.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nlattr_dcbmsg.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/utime.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/umoven-illptr.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/clone_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/tee_ioctl_impl_ids.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_ifla_port_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/netlink_ack_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/bjm.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/signalfd4.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/trie_test.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/bpf_src.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xl
 at/ifstats_attr_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/cap.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/smc_diag_mode.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/fork--pidns-translation.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/s390_guarded_storage.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/landlock_create_ruleset_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/init_module.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ppoll.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/affinity.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/check_sigblock.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/splice.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nfnetlink_queue.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/netlink_generic.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/setreugid.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nfnetlink_osf.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/evdev_prop.h /usr
 /src/debug/strace/5.16-r0/strace-5.16/src/xlat/fsmagic.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/fchmod-y--secontext.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/print_quoted_string.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/delete_module_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/btrfs_balance_ctl_cmds.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/shm_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/inet-cmsg.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/riscv_flush_icache.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/nf_cthelper_msg_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/getcpu.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/symlinkat.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_ifla_bridge_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sock_irda_options.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/nlattr.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/io_uring.c /usr/src
 /debug/strace/5.16-r0/strace-5.16/tests/nlattr_netlink_diag_msg.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/printsiginfo.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/syscall_name.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/bootflags1.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/btrfs_qgroup_inherit_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/print_time.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/umount.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/mmap_cache.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/renameat.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nfnetlink_ctnetlink_exp.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/sg_io_v3.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/msgctl_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/access_modes.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/smc_decl_codes.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/netlink_sock_diag.c /usr/src/debug/strace/5.16-r0/stra
 ce-5.16/tests/seccomp_get_action_avail.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/print_group_req.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/kd_key_pad_keys.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/mmap_notify.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/v4l2_control_query_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/schedulers.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/set_sigblock.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/acct.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/oldselect-efault.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/fflush.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/perf.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/setsock_ipv6_options.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/personality_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_tc_action_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/evdev_keycode.h /usr/src/debug/strace/5.16-r0/strace-5.1
 6/src/move_mount.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nlattr.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/rtnl_tc.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/netlink_sock_diag.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/setns_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/fadvise64_64.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/packet_diag_show.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sysctl_vm.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/pidns.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/shmxt.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sock_shutdown_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/xet_thread_area_x86.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/ebpf_class.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/times-fail.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/looping_threads.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/getcwd.c /usr/src/debug/strace/5.16-r0/strac
 e-5.16/tests/ftruncate.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ioctl_fs_f.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/newfstatat.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/rtnl_nsid.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/move_pages_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/ifstats_offload_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/stat64.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/iovec.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/bpf_filter.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/netlink_smc_diag.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/resource.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/hdio.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/semop.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/status-none-f.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/clock_nanosleep.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/prctl-tsc.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/prctl-arg2
 -intptr.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/inotify_init_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/aio.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/smc_states.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/uring_iowq_acct.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/f_seals.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/utimes.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/execveat.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/stat.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ioctl_nbd.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/kvm_cap.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/perf_hw_cache_id.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sysctl_net.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/numa_node.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_ipmra_creport_attr.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/quotactl.c /usr/src/debug/strace/5.16-r0/strace-5.16/test
 s/sockaddr_xlat.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/netlink_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/mount.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/xattr-strings.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nlattr_unix_diag_msg.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/notifyflags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/fchownat.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/pr_unalign_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/run_expect_termsig.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/open_mode_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/perf_sw_ids.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/key_reqkeys.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/phonet_protocols.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/get_mempolicy_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/kd_key_lock_keys.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat
 /uffd_copy_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/ptp_extts_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/signal2name.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/bpf_attach_type.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/ifstats_xstats_bridge_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sigact_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/fadvise.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/netlink_sk_meminfo_indices.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_neightbl_parms_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/sigreturn.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/gpio_v2_line_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/fchownat--secontext.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/lookup_dcookie.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/fill_memory.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/name_to_handle_at_flags.h /usr/src
 /debug/strace/5.16-r0/strace-5.16/tests/umovestr3.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/rtc.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/tcp_states.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/gpio_v2_line_attr_ids.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/personality.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/create_tmpfile.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/tests.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/seccomp-filter.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/at_fdcwd-pathmax.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/mem.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/watchdog_ioctl.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/evdev_mtslots.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/routing_scopes.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/mtd.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/sched_xetattr.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sock_tcp_options.h /usr/
 src/debug/strace/5.16-r0/strace-5.16/tests/sigsuspend.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/madvise.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ioctl_kvm_run_auxstr_vcpu.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/qual_fault.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/nfc_saps.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/bpf_miscop.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/close_range.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/kernel_version.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sock_rds_options.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/fs_xflags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/btrfs_compress_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/bpf_size.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/smc_protocols.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/sched_yield.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/dup.c /usr/src/debug/strace/5.16-r0/strace-5.16/s
 rc/xlat/hdio_ide_nice.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/umount2.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/nl_xfrm_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/evdev_autorepeat.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sock_iucv_options.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/tampering-notes.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/kd_keymap_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/printstrn-umoven-peekdata.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/net-yy-unix.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/at_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_ifla_vfinfo_list_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/util.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/nl_bridge_vlan_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/signal.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/access--secontext.c /usr/src/debug/strace/5.16-r0/strace-5.16
 /tests/prctl-pac-reset-keys.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/qual_inject-error-signal.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/ebpf_op_alu.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/recv-MSG_TRUNC.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/poll.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/errno2name.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sock_vsock_options.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nlattr_smc_diag_msg.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sigev_value.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/statfs_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/kd_font_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/uffd_api_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/landlock.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/v4l2_tuner_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/print_timeval.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/k
 ernel_old_timespec.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/mpers_type.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/chdir.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sock_pnp_options.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/hci_channels.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/usagewho.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/mount_setattr_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nlattr_ifstats.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/strace-x.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/print_statfs.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/ebpf_regs.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ipc_msgbuf.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/evdev_switch.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/pr_mce_kill_policy.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/net-y-unix.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/bpf_fprog.h /usr/src/debug/strace/5.
 16-r0/strace-5.16/src/ustat.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/dirfd.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/ip_cmsg_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/pkey_free.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/evdev_ev.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/mpol_modes.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/ebpf_op_jmp.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/ioprio_class.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/xattrflags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/reboot.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/prctl-spec-inject.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/tee.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/can_protocols.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nlattr_inet_diag_req_compat.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/uffd_api_features.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/fcntl.c /usr/src/debug
 /strace/5.16-r0/strace-5.16/tests/ipc_shm.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/umovestr_cached_adjacent.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/bootflags3.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ustat.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/bpf_map_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/mctp_addrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/ifstats_xstats_bond_3ad_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/netfilter_versions.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/kernel_rusage.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/status-unfinished.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/preadv-pwritev.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/kd_key_shift_keys.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/semop-indirect.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/statfs.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/kill.c /usr/src/debug/strace/5.16-r0/s
 trace-5.16/src/xlat/ifstats_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/fib_rule_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_ifla_ext_filter_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/setns.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/evdev.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/capability.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/zeroargc.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/clone-flags.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/mremap_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xstring.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/netlink_route.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/kd_modes.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/pidfd_open.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/xstatx.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/prctl-mce-kill.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/hostname.c /usr/src/debug/strace/5.16-r0/strace-5.
 16/src/xlat/nbd_ioctl_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_ifla_vf_stats_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rwf_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/numa.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/v4l2_pix_fmts.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/munlockall.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/epollevents.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/migrate_pages.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/inotify_ioctl.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/bpf_seccomp_filter.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/bpf_query_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/io_uring_register.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/printpath-umovestr-peekdata.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/kill_child.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/netlink_delete_flags.h /usr/src/debug/strace/5.16-r0/strace-
 5.16/src/xlat/unix_diag_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/error_prints.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/stack-fcall.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/sock.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/scm_rights.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/wait4.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/mtd_nandecc_options.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/print_user_desc.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/strace-n.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/rename.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/fsopen_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/semtimedop.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/loop_flags_options.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/fdatasync.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/sched_get_priority_mxx.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/sigaltstack.c /usr/src/debug/strace/5
 .16-r0/strace-5.16/src/xlat/mdb_states.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_ifla_af_spec_bridge_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/in6_addr_gen_mode.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/perf_event_open_nonverbose.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/fsopen.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/print_dev_t.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_neigh_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/fchmod.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/orphaned_process_group.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/pidfd_getfd.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/socketcalls.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/xgetrlimit.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/mlock_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/epoll_create.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/keyctl.c /usr/src/debug/strace/5.16-r0/stra
 ce-5.16/src/dyxlat.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/netlink_packet_diag.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/blkpg_ops.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/seccomp_filter_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/printstr.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/eventfd.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/membarrier_cmds.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/netlink.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/kexec_load_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/retval.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_route_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/chmod.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/msg_control.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/kvm.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_ifla_vf_port_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/set_sigign.c /usr/src/debug/strace/5.16-r0/
 strace-5.16/src/xlat/uffd_zeropage_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/process_madvise.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/prctl-no-args.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/ebpf_size.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/uname.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/ubi_volume_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/fcntl64.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sock_kcm_options.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/sockopt-timestamp.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/kd_key_tables.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/mtd_otp_options.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/swap.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/if_dqinfo_valid.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/prctl-pdeathsig.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/desc.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/epoll_pwait2
 .c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/getxpid.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/rt_sigprocmask.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/print_timespec.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ioctl_block.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ioctl_scsi.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/futexops.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/tee_ioctl_param_attr_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/recvfrom.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/perf_event_struct.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/btrfs_qgroup_ctl_cmds.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/trace_event.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_ifla_xdp_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/perf_branch_sample_type.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/seccomp_ops.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/inet6_if_flags.h 
 /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/lockfcmds.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/fsync.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/kd_key_spec_keys.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/quotactl_fd.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/print_kernel_version.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ioctl_ubi.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/pr_sud_cmds.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/iopl.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/unblock_reset_raise.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_ifla_af_spec_inet_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_nha_res_bucket_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/move_pages.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/rtnl_rule.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/retval.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/sync_file_range.c /usr/src/debug/strace/5.16
 -r0/strace-5.16/tests/netlink_protocol.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ioctl_kvm_run.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/int_0x80.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_ifla_af_spec_inet6_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ioctl_tee.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/mq.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/io_uring_enter.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/mtd_flags_options.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/uname.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/v4l2_capture_modes.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/sigaction.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/ieee802154_addr_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/socktypes.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/btrfs_balance_args.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/btrfs_fs_info_flags.h /usr/src/debug/strace/5.16-r0/st
 race-5.16/tests/memfd_secret.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/clock_adjtime-common.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_ifla_info_data_bridge_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/time.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/btrfs.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/mlock2.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/clocknames.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/inet_diag_extended_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/bootflags2.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/nf_ulog_msg_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/netlink_netlink_diag.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sigchld_codes.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nlattr_tcamsg.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/bpf_op_alu.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/delete_module.c /usr/src/debug/strace/5.16-r0/strace-5
 .16/src/xlat/prctl_options.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/tracer_ppid_pgid_sid.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/gpio_handle_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/inotify.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ioperm.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/ldt.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/evdev_ff_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/v4l2_control_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/evdev_relative_axes.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/kcmp_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/nf_nft_compat_msg_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/ptrace_syscall_info.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/setsock_ip_options.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/statx_masks.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nlattr_ifla_af_spec.c /usr/src/debug/strace/5.16-r0/
 strace-5.16/src/xlat/whence_codes.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/af_packet_versions.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/bpf.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/v4l2_control_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/pr_set_mm.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/gpio_event_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_addrlabel_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/pr_spec_get_store_bypass_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/uring_setup_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/getpeername.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_addr_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/test_ucopy.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/net-sockaddr.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/regset.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_nsid_attrs.h /usr/src/debug/strace/
 5.16-r0/strace-5.16/src/xlat/arp_hardware_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sigsegv_codes.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/kd_key_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sock_ipv6_options.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/prctl-name.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/fanotify_init.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/nl_route_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/inet_protocols.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/llseek.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/xet_robust_list.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/file_handle.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/v4l2_framesize_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/trie.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/pselect6-common.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/init_delete_module.h /usr/src/debug/strace/5.16-r0/strac
 e-5.16/src/xlat/tcp_state_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/kd_default_led_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/nf_hook_msg_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/tprintf.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nlattr_ifinfomsg.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/fchdir.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/rmdir.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/socketcall.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/rtnl_neightbl.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/getgroups.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/rtnl_link.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/redirect-fds.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/quotactl-xfs.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ioctl_nsfs.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/syscall.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/process_mrelease.c /usr/src/debug/strace/5.16-r0/s
 trace-5.16/tests/sock_filter-v.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/syslog_console_levels.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/netlink_inet_diag.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/hexdump_strdup.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/kd_led_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/btrfs_dev_replace_results.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sock_netlink_options.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/nl_selinux_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/prctl-tagged-addr.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/sg_io_v4.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/v4l2_buf_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/umode_t.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/mknodat.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/prctl-tid_address.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/netlink_new_flags.h /usr/src/debug/stra
 ce/5.16-r0/strace-5.16/src/print_sg_req_info.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/modify_ldt.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/geteuid32.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/sprintrc.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sock_ipx_options.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/skf_ad.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/open_access_modes.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/fetch_bpf_fprog.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/access.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xmalloc.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/filter_seccomp.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_tca_act_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/landlock_add_rule.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/evdev_leds.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/openat.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/v4l2_frameinterval_
 types.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/msg_name.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/access.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nsyscalls.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rename_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sock_rxrpc_options.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/unix-pair-sendto-recvfrom.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/answer.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/semtimedop-syscall.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sysctl_net_ipv6.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/kd_kbd_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/vsock_ports.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/getpid.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sysctl_net_ipv4_conf.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sigtrap_codes.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/neighbor_cache_entry_state
 s.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/pipe2.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/alarm.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/shmctl_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/iffflags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/xdp_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/time.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/filter.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nlattr_packet_diag_msg.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/mlockall_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/prctl-securebits.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/hdio_drive_cmds.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/printstrn-umoven-undumpable.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/ptrace.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/rt_sigsuspend.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/nlmsgerr_attrs.h /usr/src/debug/strace/5.16-r0/strace-5
 .16/src/xlat/irda_protocols.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/nsfs.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/getrandom_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ioctl_random.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/kernel_timespec.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/rtnl_nh.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/v4l2_sliced_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/pause.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nlattr_inet_diag_msg.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/times.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/uring_setup_features.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/inotify_init.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/qual_inject-retval.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_nha_res_group_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/qipcrtr_nodes.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/tee_io
 ctl_optee_caps.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/nbd_ioctl.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/ifstats_xstats_type_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/mq.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/clone.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ioctl_perf-success.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/mlockall.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/ucopy.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/kernel_timex.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/kexec.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/bpf_map_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/btrfs_snap_flags_v2.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/kcm_protocols.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/linkat--secontext.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/memfd_secret.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/fstatfs.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/p
 idfd_send_signal.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_rule_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/waitid_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/pr_sched_core_cmds.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_ifla_br_boolopts.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/fspick.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/seccomp_get_notif_sizes.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/readahead.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/ethernet_protocols.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_ifla_info_data_tun_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/netlink_route.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/status-successful.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/sethostname.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/mincore.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/netlink_netfilter.c /usr/src/debug/strace/5.16-r0/st
 race-5.16/src/print_ifindex.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/open.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/close_range_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/msghdr.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/membarrier.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/print_time.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ioprio.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/getpgrp.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/unlinkat.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/crypto_nl_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/fs_x_ioctl.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/setugid.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/fcntl-common.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nlattr_mdba_router_port.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/hdio_busstates.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/execve.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/
 statfs64.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/bpf_mode.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_ifla_vf_link_states.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sock_llc_options.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nfnetlink_nftables.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nlattr_ifla_brport.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/caif_protocols.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nfnetlink_ipset.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/smc_diag_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/ipc_shmctl.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/caps.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_rta_metrics_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/status-none.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/seccomp-filter-v.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/inotify_init1.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/kernel_
 dirent.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/vhangup.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sysctl_kern.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/fsconfig.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ioctl_seccomp.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/inject-nf.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nfnetlink_ulog.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/print_utils.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/rt_sigreturn.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/pr_spec_cmds.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/utimensat.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/renameat2.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/fetch_struct_msghdr.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/futexbitset.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/print_timex.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/printmode.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/getuid.c /usr
 /src/debug/strace/5.16-r0/strace-5.16/src/poll.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/strace-p1-Y-p.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/netlink_netfilter.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/uffd_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/sched_rr_get_interval.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/remap_file_pages.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/perf_event_open_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/preadv.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ioctl_gpio.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/if_dqinfo_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/truncate64.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/sockname.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/v4l2_colorspaces.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/getgid32.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/dup.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat
 /uring_enter_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/dup3.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/umovestr2.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/btrfs_qgroup_limit_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sock_dccp_options.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/ifstats_xstats_bridge_mcast_indices.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/pc.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/semop_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/secbits.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/rt_sigaction.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/pr_cap_ambient.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/fetch_indirect_syscall_args.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/netlink_get_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ioctl_uffdio.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_nexthop_grp_types.h /usr/src/debug/strace/5.16-
 r0/strace-5.16/src/print_instruction_pointer.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/fstatfs64.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/seccomp_ret_action.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/shutdown.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/fsconfig_cmds.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/pidns.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/accept.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/btrfs_space_info_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/xetpgid.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/tgkill.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/v4l2_buf_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/dcb_commands.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_netconf_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/btrfs_defrag_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/loop_crypt_type_options.h /usr/src/debug/strace/5.16-r0/strac
 e-5.16/src/xlat/routing_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/advise.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/mmap_prot.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/ioctl.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/module_init_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/xetpriority.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/keyctl.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/compat_ptrace_cmds.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/siginfo_codes.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/pr_pac_keys.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/net.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sock_xdp_options.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/open_tree.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/clock_xettime-common.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/flock.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/uring_files_update_fds.h /usr/src/debug/
 strace/5.16-r0/strace-5.16/src/xlat/ifaddrflags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/pkeys.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sock_raw_options.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/sysinfo.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/futex_waitv.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/memfd_create_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/priorities.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/set_ptracer_any.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/mount_setattr.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/timer_create.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/itimer_which.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/bdaddr_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/attach-p-cmd.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/lseek.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/uio.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/get_sigset_size.c /us
 r/src/debug/strace/5.16-r0/strace-5.16/tests/create_nl_socket.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_ifla_bridge_modes.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ioctl_evdev-success.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/key_spec.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/msghdr.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/nl_audit_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sysctl_net_ipv4_route.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nlattr_rtmsg.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/netlink_netlink_diag.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/openat2.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/readlinkat.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/tail_alloc.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/link.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nlattr_tcmsg.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/v4l2_format_description_flags.h /usr/src/debug
 /strace/5.16-r0/strace-5.16/src/xlat/btrfs_send_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/mtd_type_options.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/isdn_protocols.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nfnetlink_acct.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sysctl_net_ipv4.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/umount_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/tee.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/readlink.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nlattr_cachereport.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sg_io_dxfer_direction.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/pkey_access.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/threads-execve.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/rt_tgsigqueueinfo.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/netlink.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/membarrier.c /usr/src/debug/strace/5.16-r0/strace-
 5.16/src/print_struct_stat.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/ubi_data_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/rtnl_netconf.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/fsmount.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/smc_link_group_roles.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/shutdown.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/statx.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ioctl_ptp.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/so_error.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/ipc_private.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/uring_op_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/print_syscall_number.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nlattr_rtgenmsg.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sa_handler_values.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/sendfile.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/attach-f-p.c /usr/src/debug/strace/
 5.16-r0/strace-5.16/src/fsopen.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sock_packet_options.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/error_prints.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/sched.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/pwritev.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/bpf_test_run_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/syslog_action_type.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nfnetlink_cttimeout.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ipc_msg.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/aio.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/execve--secontext.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nlattr_ifla_protinfo.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/print_ppid_tracerpid.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/ax25_protocols.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/evdev_mpers.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/hw_br
 eakpoint_len.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/unlink.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/ptrace_cmds.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/v4l2_streaming_capabilities.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/print_maxfd.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/list.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/printrusage.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/seccomp.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_ifla_events.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/pollflags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/nl_crypto_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/setresugid.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/block_reset_run.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/string_to_uint.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/pr_pac_enabled_keys.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtc_vl_flags.h /usr/src/debug/st
 race/5.16-r0/strace-5.16/tests/nlattr_netconfmsg.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/evdev_ff_status.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/flock.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_ifla_info_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/statx_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_mdba_mdb_eattr_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/socketlayers.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sigsys_codes.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/kern_features.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/rt_sigpending.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/process_vm.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/overflowuid.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sg_scsi_reset.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/test_printpath.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/neighbor_cache_entry_flags.h /usr/src/d
 ebug/strace/5.16-r0/strace-5.16/src/xlat/inet_devconf_indices.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/pr_mce_kill.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/link.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/btrfs_tree_objectids.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_dcb_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/timerfd_xettime.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/seccomp_mode.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_tc_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/ipc_semctl.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/move_mount.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nlattr_ifla_proto_down_reason.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/netlink_unix_diag.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/s390_sthyi.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/chmod--secontext.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/fetch_struct_stat64.c /usr/src/d
 ebug/strace/5.16-r0/strace-5.16/src/netlink_selinux.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/strace.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/fcntl.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/netlink_inet_diag.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/falloc_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/packet_diag_info_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/rtnl_cachereport.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/routing_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/mbind.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/open_resolve_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/move_mount_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/sockaddr.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/btrfs_cont_reading_from_srcdev_mode.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/basic_filters.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/fcntlcmds.h /usr/src/debug/strace/5
 .16-r0/strace-5.16/src/poke.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sock_options.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/epoll.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/futimesat.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ioctl_v4l2-success.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/flockcmds.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/stat.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/mount_attr_propagation.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/pr_sched_core_pidtypes.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/ebpf_mode.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/file_handle.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/readv.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/mpol_mode_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/shm_resource_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nlattr_ifla_xdp.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_ifla_af_
 spec_bridge_vlan_tunnel_info_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nlattr_ifla_port.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/bpf_task_fd_type.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sched_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/status-none-threads.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/mctp_nets.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/perf_type_id.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/printflags.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/fallocate.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/xgetdents.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/prctl-capbset.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/netlink_crypto.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/pidns.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/clone3.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/fsconfig.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/fetch_struct_keyctl_kdf_params.c 
 /usr/src/debug/strace/5.16-r0/strace-5.16/tests/sxetmask.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/signalfd.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/unshare_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/execve.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/kd_mpers_ioctl.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/getxgid.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/stack-fcall-2.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sysctl_net_ipv6_route.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/qual_signal.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_ip6mra_creport_attr.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ksysent.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/inet_diag_bytecodes.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/key_perms.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nlattr_nlmsgerr.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/wait4_options.h /usr/src/debug/strace/5.16-r0/
 strace-5.16/tests/file_handle--secontext.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/xfs_quota_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/dirent64.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/kd_ioctl.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/epoll_create1.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/getdents64.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/ip_type_of_services.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/modem_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/pr_spec_set_store_bypass_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/tkill.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sock_caif_options.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/mmsg-silent.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sigill_codes.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sigpoll_codes.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/epoll_wait.c /usr/src/debug/strace/5.16-r0/strace-5.16
 /src/macros.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/kvm_exit_reason.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/print_fields.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ioctl_v4l2.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/v4l2_tuner_audmodes.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/membarrier_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/lwtunnel_encap_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/bpf_commands.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/fetch_struct_flock.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/getcpu.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/pr_tagged_addr_mte_tcf.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/kernel_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/sigreturn.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_ipmra_msg_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/pr_fp_mode.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/v4l
 2_control_ids.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/sysent.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/stack-fcall-1.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/net-tpacket_stats.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/net-yy-inet.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/random_ioctl.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/select.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/ipc_msg_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/fsmount_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sg_io_info.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/getsock_ipv6_options.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/btrfs_features_incompat.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/mmsg_name.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/nf_ctnetlink_msg_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nlattr_crypto_user_alg.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/libmmsg.
 c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/btrfs_balance_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/prctl_marker.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/netlink_diag_show.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/pread64-pwrite64.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/xchownx.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/dirent_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/fan_event_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/pipe.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/bluetooth_l2_psm.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ioctl_kd.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/vmsplice.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nlattr_ifaddrmsg.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/poke.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/prctl-pac-enabled-keys.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/netlink_sock_diag.h /usr/src/debug/strace/5.16
 -r0/strace-5.16/tests/semtimedop-common.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/uring_register_opcodes.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/close_range.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/epollflags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_mdba_mdb_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/xselect.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/futex_waitv.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_ifla_br_mcast_querier_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/fspick_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nfnetlink_ctnetlink.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/v4l2_control_classes.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/uring_restriction_opcodes.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/quotacmds.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/nf_queue_msg_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/add_ke
 y.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ioctl_dm.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/vfork-f.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/cap_version.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/pr_dumpable.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/readdir.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/fchmodat.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/oldselect.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nlattr_mdba_mdb_entry.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/aio_pgetevents.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/umask.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/lseek.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/bpf_rval.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/upoke.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/getsid.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/ubi_volume_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/get_mempolicy.c /usr/src/debug/st
 race/5.16-r0/strace-5.16/src/xlat/bpf_map_update_elem_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/read-write.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/nlattr.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sigprof_codes.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/faccessat.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/uid.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/fetch_struct_stat.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/landlock_create_ruleset.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/v4l2_buf_flags_ts_src.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/sigevent.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/evdev_snd.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sysctl_net_unix.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/netlink_states.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/print_mq_attr.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ioctl
 _sg_io_v4.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ipc_sem.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/netlink_kobject_uevent.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/perf_event_sample_format.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/umovestr-illptr.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/group_req.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/ioctl_sock_gifconf.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/number_set.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/fchownat.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/perf_hw_cache_op_id.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/sigpending.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/pidfd_getfd.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/fork-f.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/print_kernel_sigset.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/net-tpacket_req.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/number_set.h /usr/src/debug/strace
 /5.16-r0/strace-5.16/src/xlat/setsock_options.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/syslog.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/fanotify.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/readahead.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/rtnl_neigh.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/keyctl_caps0.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/openat--secontext.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/getegid32.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/secontext.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/mdb_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/term.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/semop-common.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/utime.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/nlattr_ifaddrlblmsg.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/quotatypes.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/reboot.c /usr/src/debug/strace/5.16-r0/strace-5.1
 6/tests/epoll_ctl.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/xdp_sockaddr_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/sock_nfcllcp_options.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/qual_inject-signal.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/mount_setattr.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/open_tree_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/personality.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/shutdown_modes.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/mknod.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/netlink_diag_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/bpf_prog_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/memfd_create.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/aio_cmds.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/kd_font_ops.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/routing_table_ids.h /usr/src/debug/strace/5.16-r0/strace-5.16/test
 s/sockopt-sol_netlink.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/ubi_volume_props.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/rtnl_ifla_vf_vlan_list_attrs.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/adjtimex_state.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/faccessat2.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/nl_netfilter_msg_types.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/execveat--secontext.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/fanotify_mark--secontext.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xgetdents.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/copy_file_range.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/prctl-cap-ambient.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/icmpfilterflags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/mmap.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/uring_sqe_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/linkat.c /usr/src/debug/strace/5.16-r0
 /strace-5.16/src/kill_save_errno.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/printsiginfo.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/ptrace_events.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/block_reset_raise_run.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/getrandom.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/quota.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/chmod.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/wait.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/smc_diag_extended_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/inode_of_sockfd.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/bpf_map_lookup_elem_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/keyctl_caps1.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/kd_key_dead_keys.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/faccessat_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/cap_mask1.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/sched
 _attr.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/s390_pci_mmio_read_write.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/fan_init_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/v4l2_device_capabilities_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/pidfd_open_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/sleep.c /usr/src/debug/strace/5.16-r0/strace-5.16/tests/getegid.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/fiemap_extent_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/unix_diag_show.h /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/gpio_line_flags.h /usr/src/debug/strace/5.16-r0/strace-5.16/tests/attach-f-p-cmd.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/pathtrace.c /usr/src/debug/strace/5.16-r0/strace-5.16/src/xlat/fan_mark_flags.h", added "/usr/src/debug/strace/5.17-r0/strace-5.17/tests/unix-pair-send-recv.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/setdomainname.c /usr/src/debug/strace/5.17-r0/stra
 ce-5.17/src/ustat.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/landlock_add_rule.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sock_netlink_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/v4l2_vbi_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/access.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/netlink_diag_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/status-failed.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/sockopt-timestamp.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/kd_default_led_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/landlock_rule_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/uname.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/mmap_notify.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/rt_sigaction.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/getrusage.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/fadvise64_64.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ioctl_evdev
 -success.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/getgid32.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/faccessat-y--secontext.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/futex_waitv.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/inet-cmsg.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/personality.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/tests.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nlattr_inet_diag_req_compat.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/sigreturn.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/stack-fcall-1.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nlattr_tcmsg.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/mq_attr_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/maybe_switch_current_tcp.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/adjtimex_modes.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/landlock_ruleset_access_fs.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/move_pages
 _flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/pkey_mprotect.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/fsconfig_cmds.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/pr_sched_core_pidtypes.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/uring_setup_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ioctl_v4l2.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/membarrier_cmds.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/kd_key_lock_keys.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ipc.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/modem_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nlattr_rtmsg.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_ifla_vfinfo_list_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/ptp_perout_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/kvm_cpuid_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/arp_hardware_types.h /usr/src/debug/strace/5.17-r0/strace
 -5.17/src/xlat/rtnl_ifla_af_spec_bridge_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/timer_xettime.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/netlink_sock_diag.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_tca_stats_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/sync_file_range.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/print_time.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/keyctl.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/run_expect_termsig.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/stack-fcall-0.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/mmsghdr.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/epollflags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_ifla_af_spec_mctp_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/basic_filters.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/lwtunnel_encap_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_ifla_xdp_attrs.h /usr/src/debug/stra
 ce/5.17-r0/strace-5.17/src/printsiginfo.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/sg_io_v3.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nfnetlink_nft_compat.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/time.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/sigevent.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/kd_font_ops.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/mtd_mode_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/smc_link_group_roles.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sg_io_dxfer_direction.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/routing_scopes.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/memfd_secret.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ioctl_random.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/btrfs_csum_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/modify_ldt.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/request_key.c /usr/src/debug/strace/5.17-r0/strace-5.17/test
 s/fchdir.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/get_page_size.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nlattr_ifla_brport.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/preadv-pwritev.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/kernel_old_timespec.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/kd_ioctl.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/madvise_cmds.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/netlink_protocols.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/netlink_get_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/utimensat.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/inet_protocols.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/init_delete_module.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/getcpu.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/vsock_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/s390_runtime_instr.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/printpath-umovest
 r-undumpable.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ioctl_gpio.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/setgroups.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/mlock_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/unix_diag_show.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/answer.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/semop_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/fib_rule_actions.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/futex_waiter_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/hdio_ide_nice.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/unlinkat.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sigprof_codes.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/perf_sw_ids.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/getsock_ip_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/scsi.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/audit_arch.h /usr/src/debug/st
 race/5.17-r0/strace-5.17/tests/prctl_marker.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/printpath-umovestr.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/mount.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/netlink_protocol.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nlattr_mdba_mdb_entry.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/geteuid.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/rtnl_netconf.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/clock_nanosleep.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ioctl_nsfs.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/tprintf.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/prctl-set_vma.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/getpeername.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/sigpending.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/umask.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/membarrier.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nfnetlink_cttimeout.c /usr/src/debu
 g/strace/5.17-r0/strace-5.17/tests/umask.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/open.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/mlock2.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/routing_table_ids.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/socketlayers.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/ldt.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/bind.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/inet6_devconf_indices.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/list_sigaction_signum.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/kexec.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/memfd_create.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/uffd_register_ioctl_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ioctl_scsi.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/lirc_ioctl.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/group_req.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/block_reset_run.c /usr/src/debug/
 strace/5.17-r0/strace-5.17/src/evdev.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/xetpgid.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sigbus_codes.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/rtnl_rule.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/nl_crypto_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/itimer_which.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/pidns.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/smc_diag_mode.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ptrace_syscall_info.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/v4l2_tuner_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/localtime.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/rtnl_neigh.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ipc_msg.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/perf_hw_id.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_ifla_br_mcast_querier_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/
 kd_key_fn_key_vals.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/getpid.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/mpol_modes.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/xet_robust_list.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/numa.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/process_vm.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/waitid.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/resource_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/mq.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/ubi_volume_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/orphaned_process_group.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/af_packet_versions.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/sched_rr_get_interval.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/mount_attr_attr.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/migrate_pages.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ioctl_kvm_run_common.c /usr/src/d
 ebug/strace/5.17-r0/strace-5.17/src/xlat/mremap_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/mtd_otp_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/netlink_sk_meminfo_indices.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/epoll_create.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/nf_hook_msg_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/fallocate.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nlattr_netconfmsg.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/syslog.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/print_timespec.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/rt_sigreturn.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/ipc_msgctl.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/newfstatat.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_ifla_af_spec_bridge_vlan_tunnel_info_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/sched.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/shmctl_flags.h /usr/src
 /debug/strace/5.17-r0/strace-5.17/src/trie.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/getsock_ipv6_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nlattr_dcbmsg.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/prlimit64.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/fsmount.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/mtd_flags_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/umount_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/resources.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/statfs_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sock_alg_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/inotify.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/perf_hw_cache_op_id.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/mmap_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/munlockall.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/fspick.
 c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/pr_spec_get_store_bypass_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/qual_fault.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/io_uring_setup.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/mlock.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/kd_key_fn_keys.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_mdba_router_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/xchownx.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/resource.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/perf_event_read_format.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/unshare.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rename_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/kd_keymap_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/getpgrp.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/net-tpacket_req.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/filter_seccomp-flag.c /usr/sr
 c/debug/strace/5.17-r0/strace-5.17/tests/swap.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/fcntl.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/evdev_switch.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/netlink_unix_diag.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/nl_sock_diag_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_netconf_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/tee.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_mdba_mdb_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/bpf_commands.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/mpol_mode_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/waitpid.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/packet_diag_show.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/smc_diag_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/unix-pair-sendto-recvfrom.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/adjtimex_status.h /usr/src/debug/str
 ace/5.17-r0/strace-5.17/src/copy_file_range.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ioctl_sg_io_v3.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/getcpu.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/rtnl_neightbl.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/so_peercred.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/ubi_volume_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/xet_thread_area_x86.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_ifla_info_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/mq.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/netlink_inet_diag.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/mmsg_name.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/futex_waitv.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/unblock_reset_raise.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/in6_addr_gen_mode.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/clone_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xl
 at/lockfcmds.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/close_range.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/getsid.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/v4l2_tuner_capabilities.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/symlinkat.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/fsconfig.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/inotify_init1.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/inet_devconf_indices.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/print_ppid_tracerpid.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/prctl-mce-kill.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/bpf_prog_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/test_printstrn.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/fallocate.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/kd_key_tables.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/nbd_ioctl.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/stat64.c /usr/src/debug/strace/5.
 17-r0/strace-5.17/tests/semop-common.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/fan_init_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/access--secontext.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/dyxlat.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/gpio_ioctl.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_tca_act_hw_stats.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/shutdown_modes.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/netlink_diag_show.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/btrfs.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/fsopen_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/netlink_generic.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/tee_ioctl_login_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nlattr_nhmsg.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/check_sigblock.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/nf_nft_compat_msg_types.h /usr/src/debug/strace/5.17-r
 0/strace-5.17/src/netlink_sock_diag.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/pidns.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/stack-fcall-2.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/shutdown.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/kd_font_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/mknodat.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/lseek.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/utimes.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/rtnl_tc.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/poll.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sock_can_raw_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/ucopy.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/ipc.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sfd_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/btrfs_dev_stats_values.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_ifla_vf_info_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17
 /tests/nlattr_ifla_port.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nlattr_netlink_diag_msg.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/nl_bridge_vlan_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/pidfd_open.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/prctl-no-args.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/nf_cthelper_msg_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/aio_cmds.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/pidns-cache.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_rta_metrics_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/bpf_filter.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/net-accept-connect.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/v4l2_sdr_fmts.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/set_sigign.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/umount.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_addrlabel_attrs.h /usr/src/debug/strace/5.17-r0/strace
 -5.17/src/xlat/ifstats_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/random_ioctl.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/printstr.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/keyctl_commands.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/btrfs_key_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/getresugid.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/seccomp_get_action_avail.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/status.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nlattr_ndmsg.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/syslog.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/netlink_kobject_uevent.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/stat.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_nsid_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/status-unfinished.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/getuid32.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/kd_key_shift_keys.h /usr
 /src/debug/strace/5.17-r0/strace-5.17/tests/fchmodat.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sigpoll_codes.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/test_ucopy.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rwf_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/fspick_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/nl_route_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/recvfrom-MSG_TRUNC.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ioctl_v4l2-success.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/membarrier_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/file_handle.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/evdev_keycode.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/fs_x_ioctl.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/file_handle.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/uffd_api_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/number_set.h /usr/src/debug/strace/5.17-r0/stra
 ce-5.17/src/xlat/kvm_cap.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/getrandom_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/macros.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/dirfd.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/xdp_sockaddr_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/signal2name.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/stat.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sock_ipv6_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/bpf_class.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/btrfs_qgroup_limit_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_ifla_vf_port_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/fill_memory.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/v4l2_colorspaces.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/addrfams.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ftruncate64.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/truncate.c
  /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sock_irda_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/f_seals.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/mtd_nandecc_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/routing_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/bpf_src.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/btrfs_dev_replace_cmds.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/printsignal.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/getegid.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/siginfo.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/shmxt.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/tee_ioctl_shm_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/ipc_msg.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ioctl_nbd.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/seccomp.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/futex.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/k
 exec_arch_values.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nlattr_fib_rule_hdr.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/sysinfo.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/inotify.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/stack-fcall.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/uffd_copy_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/faccessat_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/pidfd_open_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/poke.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/alarm.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/fsmagic.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/fan_classes.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/nlmsgerr_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/print_user_desc.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/printstrn-umoven-peekdata.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/sync_file_range2.c /usr/src/deb
 ug/strace/5.17-r0/strace-5.17/src/xlat/v4l2_meta_fmts.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/brk.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/open_tree.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/netlink_new_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/if_dqinfo_valid.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/btrfs_qgroup_status_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/mmap_cache.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/ptrace_setoptions_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sock_tcp_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nfnetlink_acct.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/upoke.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/pr_spec_cmds.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/evdev_autorepeat.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/ioprio_class.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ioctl_perf-success.c /usr/src/debug
 /strace/5.17-r0/strace-5.17/src/hostname.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/sxetmask.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/uffd_register_mode_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/link.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/block_reset_raise_run.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/tcflsh_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/util.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/gpio_event_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/netlink_netlink_diag.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/getpid.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/route_nexthop_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nlattr_tca_stab.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/umount2.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/subdir.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/fiemap_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/poll.
 c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ioperm.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nlattr_ndtmsg.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/rtnl_route.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ifindex.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/bpf_attr.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/seccomp_filter_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/prctl-pac-enabled-keys.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ioctl_dm.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/futexwakeops.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/faccessat2.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/futexbitset.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xstring.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_nha_res_bucket_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/prctl-dumpable.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/bpf_map_update_elem_flags.h /usr/src/debug/strace/5
 .17-r0/strace-5.17/tests/kexec_file_load.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/sigaltstack.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/efd_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/fadvise.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/readdir.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/evdev_mpers.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/xattrflags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/getgroups.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/sigsuspend.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/access_modes.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/test_nlattr.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/adjtimex_state.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/is_linux_mips_n64.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sigev_value.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/nl_selinux_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/sigreturn.c /usr/src/debug/
 strace/5.17-r0/strace-5.17/src/xlat/rtnl_ifla_vf_vlan_list_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/attach-f-p-cmd.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/move_mount.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sock_iucv_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/uffd_zeropage_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/stack-fcall.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/error_prints.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/ebpf_op_alu.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/lock_file.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/string_to_uint.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/if_dqinfo_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/smc_states.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/futexops.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/kill_save_errno.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/uring_iowq_acct.h /usr/src/debug/strace
 /5.17-r0/strace-5.17/tests/sched_yield.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/qual_inject-error-signal.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nlattr_ifla_xdp.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/oldselect.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/cap.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/epoll_pwait2.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/gettid.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/setns.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/dup2.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_link_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/getppid.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/prctl-sve.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/nf_nftables_msg_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/v4l2_frameinterval_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/madvise.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/attach-p-cmd-cmd.c /u
 sr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/inet_diag_req_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/copy_file_range.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/vmsplice.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sock_kcm_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/falloc_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/pipe.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/dup.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/getdents64.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/rtnl_dcb.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/phonet_protocols.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/kernel_timespec.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/ifstats_xstats_type_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/rtnl_cachereport.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/poke.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/hci_channels.h /usr/src/debug/strace/5.17-r0/strace-5.17/t
 ests/count-f.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/smc_decl_codes.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/at_statx_sync_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/perf_hw_cache_op_result_id.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/bpf.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/irda_protocols.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/ioperm.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/membarrier.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/nf_ctnetlink_msg_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/mount.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/perf_branch_sample_type.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/attach-f-p.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/net.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/sysctl.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/pr_unalign_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nlattr_ifla_protinfo.c /usr/src/
 debug/strace/5.17-r0/strace-5.17/src/xlat/sock_rxrpc_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/msg_name.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/if_dqblk_valid.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/geteuid32.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/ifstats_xstats_bridge_mcast_indices.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/memfd_secret_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/sync_file_range.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/signal.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/inet_diag_bytecodes.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/strace-p1-Y-p.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/pselect6-common.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/init_module.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/print_quoted_string.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/umount.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/pr_sve_vl_flags.h /usr
 /src/debug/strace/5.17-r0/strace-5.17/tests/renameat2.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ioctl_kvm_run_auxstr_vcpu.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/mbind_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/setugid.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/archvals.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/pidfd_getfd.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nlattr_nlmsgerr.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/xattr.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/sockaddr.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/fchmod--secontext.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ioctl_ptp.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/nt_descriptor_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ioctl_fs_x.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ioctl_perf.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/tgkill.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nlattr.c /u
 sr/src/debug/strace/5.17-r0/strace-5.17/tests/read-write.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/test_ucopy.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/tee_ioctl_optee_caps.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/net-tpacket_stats.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/sendfile.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/mtd_type_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ftruncate.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nlattr_mdba_router_port.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/btrfs_features_compat_ro.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/kernel_version.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/threads-execve.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/faccessat--secontext.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/memfd_create.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/evdev_leds.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/netlink_unix_diag.
 c /usr/src/debug/strace/5.17-r0/strace-5.17/src/retval.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/ieee802154_pan_ids.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/btrfs_qgroup_ctl_cmds.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/msg_control.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/epollctls.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/mlockall_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/bpf_attach_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_ifla_ext_filter_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/loop_flags_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ioctl.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/inject-nf.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/process_madvise.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/quota_formats.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/lookup_dcookie.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/seccomp_ioctl_r
 esp_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/seccomp-filter.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/bsg_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/socketcalls.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/alg_sockaddr_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/umovestr2.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/printstrn-umoven-undumpable.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/netlink_kobject_uevent.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/msg_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/quotactl-xfs.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sysctl_net_ipv6.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/pr_set_mm.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/nl_audit_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/pr_spec_set_store_bypass_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/bpf_map_lookup_elem_flags.h /usr/src/debug/strace/
 5.17-r0/strace-5.17/tests/fork--pidns-translation.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/bootflags3.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/term.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xgetdents.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nlattr_ifla_af_inet6.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/pr_sched_core_cmds.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/fan_event_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/perf_hw_cache_id.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/close_range_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/vfork-f.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/tee_ioctl_max_arg_size.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/netlink_audit.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/shm_resource_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/xutimes.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/ifstats_attr_flags.h /usr/src/debug/st
 race/5.17-r0/strace-5.17/src/xlat/rtnl_ifla_bridge_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/netlink_route.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/sched_attr.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/bsg_protocol.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/openat2.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/restart_syscall.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/fib_rule_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/lirc_modes.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/seccomp_ret_action.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/kd_kbd_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/setsock_ip_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nlattr_tcamsg.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/affinity.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/mdb_states.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/v4l2.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests
 /nlattr_rtgenmsg.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/tcxonc_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/inet_diag_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/kernel_v4l2_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sigprocmaskcmds.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/open_tree.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/iovec.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/keyctl_caps0.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/fstatfs.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/keyctl_move_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_ipmra_creport_attr.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/btrfs_qgroup_inherit_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_ipmra_msg_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ioctl_ubi.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/fsmount_attr_flags.h /usr/src/debug/strace/5.17-r0/strace
 -5.17/src/print_syscall_number.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/kcm_protocols.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/rmdir.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/nf_queue_msg_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/kd_kbd_modes.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/fsconfig.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/perf_event_open.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/gpio_handle_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/nf_ulog_msg_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ioctl_block.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/prctl-name.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/add_key.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/clone.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/rt_sigpending.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/notifyflags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nlattr_smc_diag_msg.c /u
 sr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/pr_mce_kill.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sa_handler_values.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/printxval.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/ptrace.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/print_utils.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/btrfs_features_compat.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/semtimedop.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/dm_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/rtnl_stats.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ioctl_fiemap.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/pipe_maxfd.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/pr_tsc.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/chroot.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sock_pnp_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/fs_xflags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sysctl
 _net.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/filter-unavailable.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/pread64-pwrite64.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/clone_ptrace.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/status-none.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nlattr_ifstats.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/s390_pci_mmio_read_write.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/bjm.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/setreugid.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/tkill.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/bpf_mode.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/mq_sendrecv.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/v4l2_control_classes.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/xetpriority.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/watchdog_ioctl.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/rt_tgsigqueueinfo.c /usr/src/debug/strace/5.17-r0/
 strace-5.17/src/desc.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/hw_breakpoint_len.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/time.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/remap_file_pages.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/unshare_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/fetch_struct_msghdr.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/fanotify_init.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/kd_key_cur_keys.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/tee.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/v4l2_buf_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ksysent.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/v4l2_device_capabilities_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/delay.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/bpf_task_fd_type.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/socketcall.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/print_mac.c /usr/src
 /debug/strace/5.17-r0/strace-5.17/src/xlat/flockcmds.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/ifaddrflags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/key_perms.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_ifla_brport_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/tee_ioctl_origins.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nlattr_packet_diag_msg.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/ipc_sem.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/preadv.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/v4l2_format_description_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/readv.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/kd_meta_vals.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/memfd_create_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/nlattr.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/priorities.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/lirc_features.h /usr/src/debug/str
 ace/5.17-r0/strace-5.17/src/netlink.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/ipc_shmctl.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/kernel_dirent.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nlattr_ifaddrmsg.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/epoll_pwait.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/smc_protocols.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/net-yy-unix.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/quota.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/iffflags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nfnetlink_ipset.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/setsock_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/unlink.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_ifla_bridge_modes.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/fcntl.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/finit_module.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/epoll.c /usr/src/debug/strace/5
 .17-r0/strace-5.17/tests/semtimedop-common.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/xfs_dqblk_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/signalfd4.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/pkey_free.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/test_printpath.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/print_sigevent.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/net-sockaddr.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nlattr_inet_diag_req_v2.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/key_reqkeys.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/btrfs_tree_objectids.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/fchownat.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/kexec_load_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/stage_output.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/at_fdcwd-pathmax.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/times.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/pe
 rf.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/getxpid.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xmalloc.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/btrfs_cont_reading_from_srcdev_mode.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/cap_mask1.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sock_llc_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/uid.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nlattr_ifla_linkinfo.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/umovestr_cached_adjacent.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/rename.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/cap_mask0.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/clone-flags.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/perf_ioctl_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/chmod.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/bpf_map_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_nexthop_grp_types.h /usr/src/
 debug/strace/5.17-r0/strace-5.17/src/xlat/ipccalls.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/skf_ad.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/clone3.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/net-y-unix.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/quotactl.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/v4l2_pix_fmts.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nlattr_ifla_proto_down_reason.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/getrandom.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nlattr_br_port_msg.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ioctl_kd.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/capability.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/filter.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nlattr_crypto_user_alg.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/fetch_struct_iovec.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/ax25_protocols.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/li
 bsocketcall.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/ip_cmsg_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_neigh_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/schedulers.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sysctl_vm.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/packet_diag_info_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/rtnl_tc_action.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/ptrace_syscall_info.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/renameat.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/mincore.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/errno2name.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/dirent.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/modetypes.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/kernel_rusage.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/ebpf_mode.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/getgid.c /usr/src/debug/strace/5.17-r0/stra
 ce-5.17/src/xlat/rtnl_ip6mra_creport_attr.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/netlink_states.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sock_shutdown_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/listen.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xmalloc.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sg_io_info.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/status-successful.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/bpf_size.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/epoll_wait.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/xattr-strings.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/v4l2_framesize_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/timer_create.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/evdev_relative_axes.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/print_time.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/filter_seccomp.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/
 signal_receive.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/fetch_struct_xfs_quotastat.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/sched_get_priority_mxx.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sock_packet_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/sigaltstack.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/unix_diag_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/splice.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/printsiginfo.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/regset.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/personality_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/truncate.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/kd_key_brl_keys.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sock_ax25_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/sigprocmask.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/open_tree_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/futimesa
 t.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/loop_crypt_type_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/bpf_sock_filter.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/sethostname.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ioctl_sg_io_v4.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/timerfdflags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/zeroargc.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/linkat.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/count.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/ptrace_cmds.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/mem.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/perf_event_open_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/segv_pkuerr.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/syscall_name.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/ipc_msg_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/filter_seccomp.h /usr/src/debug/strace/5.17-r0/strace-5.17/te
 sts/ioctl_evdev.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sync_file_range_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/erestartsys.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/netlink_xfrm.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/pr_set_vma.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sigsys_codes.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/sockname.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/v4l2_streaming_capabilities.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/can_protocols.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/print_struct_stat.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/kernel_old_timex.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/syscall.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/strace-x.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/ifstats_af_spec_mpls_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/sock_filter-v.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat
 /fan_mark_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_ifla_port_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sysctl_net_core.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/print_ifindex.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ioctl_rtc.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/uio.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/nl_netfilter_msg_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/fetch_indirect_syscall_args.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/ifstats_xstats_bond_3ad_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/open_mode_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/fetch_struct_keyctl_kdf_params.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/times-fail.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/s390_guarded_storage.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/fdflags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/hexdump_strdup.c /usr/src/debug/stra
 ce/5.17-r0/strace-5.17/tests/mknod.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/statx.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/nf_acct_msg_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/smc_diag_extended_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/print_kernel_version.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/skip_unavailable.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/recv-MSG_TRUNC.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nfnetlink_ulog.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/s390_sthyi.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/whence_codes.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/mount_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/clockflags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/ip_type_of_services.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/net-icmp_filter.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/v4l2_tuner_rxsubchanses.h /usr/src/debug/strac
 e/5.17-r0/strace-5.17/src/xlat/rtnl_tc_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/libmmsg.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/perf_event_struct.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sock_bluetooth_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/print_kernel_sigset.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/fstatfs64.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/pidfd_open.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_nha_res_group_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/flock.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/utime.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/sockaddr_xlat.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/bpf_seccomp_filter.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/io_uring_enter.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/open.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/nl_netfilter_subsys_ids.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ioc
 tl_sock_gifconf.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/prctl-pac-reset-keys.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/evdev_snd.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/setpgrp-exec.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_ifla_proto_down_reason_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/iopl.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/landlock_create_ruleset_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/semtimedop-syscall.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_route_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/aio_pgetevents.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/umovestr.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/v4l2_control_id_bases.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/kd_mpers_ioctl.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/ioctl.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ioctl_hdio.c /usr/src/debug/strace/5.17-r0/strace-5.17
 /tests/so_error.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/fetch_struct_statfs.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sigact_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/seccomp-strict.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/fetch_struct_stat64.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/futexwakecmps.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/prctl-arg2-intptr.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/keyctl.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/landlock_restrict_self.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/fsopen.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/aio_iocb_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/socketcall.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nlattr_cachereport.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/isdn_protocols.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/signal.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/move_mount.c /usr/src/debug
 /strace/5.17-r0/strace-5.17/tests/inode_of_sockfd.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sigtrap_codes.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/fchownat.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/sendfile.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/dirent64.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/netlink_packet_diag.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/mpers_type.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sock_rds_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/prctl-cap-ambient.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/net-yy-inet.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/nlattr.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/mmap_prot.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/netlink_delete_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/splice_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/create_nl_socket.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/ep
 ollevents.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/setsock_ipv6_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_tca_act_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ioprio.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nfnetlink_osf.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sock_vsock_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/ubi_data_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sigsegv_codes.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/kvm.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/setrlimit.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/dev-yy.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/caps.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sock_pppol2tp_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/perf_ioctl.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/nl_xfrm_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/strace-n.c /usr/src/debug/strace/5.17-
 r0/strace-5.17/tests/llseek.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/set_mempolicy.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_ifla_br_boolopt_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/ioprio.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/numa_node.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/evdev_mtslots.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nfnetlink_ctnetlink.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/sockopt-sol_netlink.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/fanotify.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/execveat.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/rtnl_addrlabel.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/pr_dumpable.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/module_init_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/multicast_router_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/qual_inject-signal.c /usr/src/debug/strace/5.17-r0/strace-5
 .17/tests/old_mmap.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/kd_key_slock_keys.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_ifla_info_data_tun_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ioctl_sock.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/kd_modes.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_family.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/nfc_protocols.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/umovestr3.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/hdio.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ioctl_tee.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/dup3.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ipc_msgbuf.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/btrfs_balance_state.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/move_pages.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/evdev_abs.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/v4l2_fields.h /usr/src/debug/s
 trace/5.17-r0/strace-5.17/src/xlat/uring_restriction_opcodes.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ioctl_kvm_run.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ipc_shm.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_addr_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/io_uring.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/advise.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/getsockname.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/bpf_miscop.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/scm_rights.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/chdir.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/swapon.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/bpf_query_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/bsg_subprotocol.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/bpf_map_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/timerfd_xettime.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/pr_pac_k
 eys.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/dup.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/open--secontext.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/xstatx.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/utime.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sock_type_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/pkeys.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/epoll_create1.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/set_sigblock.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/ebpf_size.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/ethernet_protocols.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/link.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nlattr_unix_diag_msg.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/statfs64.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/sock.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/delay.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/secbits.h /usr/src/debug/strace/5.
 17-r0/strace-5.17/src/xlat/f_owner_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/xettimeofday.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/uring_ops.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/keyctl_pkey_ops.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/fchmod.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/routing_protocols.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/sysinfo.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/pkey_alloc.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/pidfd_getfd.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/statfs.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/fsmount_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/prctl-seccomp-filter-v.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/semop.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/fsmount.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/kexec_load.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/trie_test.c /usr/src/debug/strace/
 5.17-r0/strace-5.17/src/xgetdents.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/mount_attr_propagation.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/ifstats_xstats_bond_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/clone3_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/pr_pac_enabled_keys.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/hw_breakpoint_type.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/statx_masks.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/fcntl-common.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_ifla_xdp_attached_mode.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/sendfile64.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/futex.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/packet_diag_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/delay.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/keyctl_caps1.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/redirect-fds.c /usr/src/debug/
 strace/5.17-r0/strace-5.17/tests/lookup_dcookie.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/prctl-tid_address.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/fetch_bpf_fprog.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/btrfs_send_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/string_to_uint.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ioctl_lirc.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/netlink_netfilter.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/kexec_file_load_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/userfaultfd.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_ip6mra_msg_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/statfs.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/v4l2_capture_modes.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_ifla_vf_link_states.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/retval.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ioctl_loop.c /usr/src/debug/strace/
 5.17-r0/strace-5.17/src/times.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/ptrace_syscall_info.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/perf_attr_size.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/inotify_init.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/reboot.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ip_mreq.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nlattr_ifla_vfinfo.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sysctl_net_ipv6_route.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/usagewho.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/secontext.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sysctl_net_ipv4_conf.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/nf_osf_msg_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/v4l2_tuner_audmodes.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/key_spec.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nlattr_inet_diag_msg.c /usr/src/debug/strace/5.17-r0/strace-5.
 17/src/list.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sysctl_net_ipv4.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/xdp_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/netlink_ack_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/netlink_route.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nlattr_ifaddrlblmsg.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/pr_sud_cmds.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/perf_type_id.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/pr_cap_ambient.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/ifstats_offload_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/quotatypes.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/chmod--secontext.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/delete_module.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/quotactl.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/pr_tagged_addr_mte_tcf.h /usr/src/debug/strace/5.17-r0/strace-5.17/sr
 c/xlat/ptp_extts_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/status-unfinished-threads.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/uring_register_opcodes.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sg_io_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/clock_xettime-common.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/sg_io_v4.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/statx.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/v4l2_buf_flags_ts_type.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/fanotify_mark--secontext.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/siginfo_codes.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/kill_child.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/umode_t.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/fs_f_ioctl.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/btrfs_compress_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sock_tipc_options.h /usr/src/debug/strace/5.17-r0/
 strace-5.17/tests/fchmod-y--secontext.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/status-all.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sigchld_codes.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/syscall.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/netlink_sock_diag.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/wait4_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/prctl-pdeathsig.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/v4l2_control_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sock_raw_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/pr_fp_mode.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/ptrace_syscall_info_op.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/mmap_cache.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/btrfs_balance_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/cap_version.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/fchownat--secontext.c /usr/src/debug/strace/5.1
 7-r0/strace-5.17/src/get_robust_list.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/nf_cttimeout_msg_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/mmsg.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/check_sigign.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/bluetooth_l2_cid.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/fsync.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/neighbor_cache_entry_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sock_tls_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/getuid.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/inotify_init_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/landlock.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/signalfd.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/printmode.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/tracer_ppid_pgid_sid.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/rtnl_addr.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/io.c /usr/sr
 c/debug/strace/5.17-r0/strace-5.17/src/xlat/uring_op_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/netlink_socket_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/vsock_ports.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/ptrace_peeksiginfo_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_mdba_mdb_entry_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/print_statfs.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/rtnl_mdb.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/kd_key_spec_keys.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/attach-p-cmd-p.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/seccomp_ioctl.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/getegid32.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/btrfs_snap_flags_v2.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/get_mempolicy.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/bpf_rval.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/status-none-f.c /u
 sr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/tcp_state_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/fflush.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/ipc_private.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/getxuid.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/rtnl_nsid.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/printstrn-umoven.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/sched_xetscheduler.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/umovestr_cached.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/vsock_cids.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/ifstats_xstats_bridge_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/loop.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/kernel_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/osf_utimes.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/set_mempolicy_home_node.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/truncate64.c /usr/src/debug/strace/5.17-r0/strac
 e-5.17/tests/clock_adjtime-common.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/blkpg_ops.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_ifla_info_data_bridge_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/ipc_semctl.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/evdev_ev.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ipc_sem.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/nf_ipset_msg_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/umoven-illptr.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/eventfd.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/prctl-spec-inject.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/pr_mce_kill_policy.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/sync.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/net-yy-netlink.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/btrfs_dev_stats_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/recvmmsg-timeout.c /usr/src/debug/strace/5.17-r0/strace-5.
 17/src/xlat/netfilter_versions.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sysctl_net_unix.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/inet_diag_extended_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/prctl_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nsyscalls.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/mount_setattr.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/printpath-umovestr-peekdata.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/ieee802154_addr_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/xgetrlimit.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/prctl-sched-core.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nlattr_ifla.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/print_group_req.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nlattr_tc_stats.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sysctl_net_ipv4_route.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/prctl-securebits.c /usr/src/debu
 g/strace/5.17-r0/strace-5.17/src/xlat/move_mount_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/error_prints.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/attach-p-cmd.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/renameat.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/crypto_nl_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/prctl-fp-mode.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ioctl_uffdio.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xattr.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/status-none-threads.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/fcntlcmds.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/gpio_v2_line_attr_ids.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/fchmodat--secontext.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/getcwd.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/mmsg-silent.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/ptp.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/pc.c /usr/sr
 c/debug/strace/5.17-r0/strace-5.17/tests/fork-f.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/btrfs_scrub_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/seccomp_get_notif_sizes.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/readahead.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/routing_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nanosleep.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/chdir.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/print_fields.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/fcntl64.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/rt_sigsuspend.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/btrfs_dev_replace_state.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/fetch_struct_mmsghdr.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/landlock_create_ruleset.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/fanotify_mark.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/waitid_types.h /usr/src/debug/strace/5.17-r
 0/strace-5.17/src/xlat/fs_ioc_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nfnetlink_ctnetlink_exp.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtc_vl_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/statx.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/select.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/semop-indirect.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/print_timex.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_nexthop_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/sched_xetparam.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/bootflags1.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/acct.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ioctl_mtd.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sock_xdp_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/gpio_line_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/nfc_saps.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/print_maxfd.c /usr
 /src/debug/strace/5.17-r0/strace-5.17/src/xlat/gpio_v2_line_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/kcmp.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/kvm_exit_reason.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/bpf-obj_get_info_by_fd.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_ifla_af_spec_inet_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/xfs_quota_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/seccomp_mode.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/sysent.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/prctl.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_neightbl_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/uring_sqe_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/qual_signal.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/btrfs_fs_info_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/get_process_reaper.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/netlink_selinux.
 c /usr/src/debug/strace/5.17-r0/strace-5.17/src/msghdr.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/open_resolve_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/readahead.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/fetch_struct_stat.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/kvm_mem_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/execve.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ppoll.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/btrfs_dev_replace_results.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/poke.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/shutdown.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/bpf_fprog.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/accept.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/eventfd.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/tee_ioctl_param_attr_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/process_vm_readv_writev.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/
 recvmsg.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/mmap.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/xgetdents.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/netlink_smc_diag.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_ifla_vf_stats_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/bpf.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sigaltstack_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/uring_files_update_fds.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/seccomp-filter-v.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/bt_protocols.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/ioctl_dirs.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/netlink_kobject_uevent.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/close_range.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/quotactl_fd.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/mctp_addrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/aio.c /usr/src/debug/strac
 e/5.17-r0/strace-5.17/tests/prctl-syscall-user-dispatch.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/netlink_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/ebpf_regs.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/socketutils.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/uring_enter_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/bpf_prog_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sock_ipx_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/pathtrace.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nlattr_ifinfomsg.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/wait4.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/ieee802154_addrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/swap_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/printflags.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/v4l2_control_query_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/tcp_states.h /usr/src/debug/strace/
 5.17-r0/strace-5.17/src/netlink_inet_diag.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/print_timeval.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/so_linger.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/mount_setattr_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/snmp_icmp6_stats.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/xstatfsx.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/int_0x80.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/uring_setup_features.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/seccomp_ioctl_addfd_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/strace.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/uffd_api_features.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ioctl_watchdog.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/getrandom.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/oldselect-efault.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_tca_stab_attrs.h /usr/src/debug/strace/5.17-r
 0/strace-5.17/src/xlat/getsock_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/fadvise64.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/getdents.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/btrfs_balance_ctl_cmds.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/v4l2_memories.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/fadvise.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/packet_mreq_type.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/printrusage.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/fs_0x94_ioctl.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/btrfs_space_info_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/xetitimer.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/openat--secontext.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/get_sigset_size.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/strace--decode-pids-comm.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/defs.h /usr/src/debug/strace/5.17-r0/strace-5.17/test
 s/xselect.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/inotify_ioctl.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ioctl_fs_f.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/mlockall.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/btrfs_features_incompat.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/filter_qualify.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/setfsugid.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/evdev_ff_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_tc_action_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/netlink_route.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/ebpf_op_jmp.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/pidfd_send_signal.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/faccessat.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/poke-sendfile.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/mmap_notify.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/compat_ptrace_cmds.h /usr/src
 /debug/strace/5.17-r0/strace-5.17/src/xlat/inet6_if_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/rt_sigqueueinfo.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/preadv2-pwritev2.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/lseek.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/readlink.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/net-packet_mreq.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/netlink_selinux.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sock_nfcllcp_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ptrace.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/evdev_ff_status.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/umovestr-illptr.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/nf_ctnetlink_exp_msg_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/snmp_ip_stats.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/print_instruction_pointer.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/msgctl_flags.h /usr/s
 rc/debug/strace/5.17-r0/strace-5.17/src/xlat/sysctl_kern.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/nfc_sockaddr_protocols.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/mctp_nets.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/kern_features.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/mbind.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/kcmp.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/sched_xetaffinity.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/pollflags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/rt_sigtimedwait.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/at_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/oldstat.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/vhangup.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/netlink_netfilter.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ustat.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/btrfs.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/uname.c /usr/src/debug/st
 race/5.17-r0/strace-5.17/src/wait.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/icmpfilterflags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/tee_ioctl_gen_caps.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/open_access_modes.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/openat.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/stack-fcall-3.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sock_sctp_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/kernel_timeval.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/number_set.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/kd_led_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/fsopen.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/secontext.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/bpf_attach_type.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/bpf_op_alu.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/rt_sigprocmask.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nfnetlin
 k_queue.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/qipcrtr_ports.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/netlink_crypto.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/mtd.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ioctl_seccomp.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/netlink_crypto.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/set_ptracer_any.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/ubi.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/v4l2_control_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/symlink.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/pkey_access.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sigill_codes.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/syslog_console_levels.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/process_mrelease.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/fetch_struct_flock.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/tun_device_types.h /usr/src/debug/str
 ace/5.17-r0/strace-5.17/src/xlat/btrfs_logical_ino_args_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/prctl-capbset.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sigfpe_codes.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/hexquote_strndup.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_neightbl_parms_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/fsync-y.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/mdb_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/pwritev.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/pipe2.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_mdb_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/mknod.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/dcb_commands.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/kd_key_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/clone_parent.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/ioprio_who.h /usr/src/debug/strace/5.17-r0/strace-5.17
 /src/xlat/bootflags2.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/nsfs.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/tail_alloc.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/filter_seccomp-perf.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/v4l2_buf_flags_ts_src.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/negated_errno.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/perf_event_open_nonverbose.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/scmvals.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/name_to_handle_at_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_ifla_af_spec_inet6_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/readlinkat.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/trie.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/shm_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sock_dccp_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/cai
 f_protocols.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_ifla_events.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nfnetlink_cthelper.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/v4l2_buf_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/tee_ioctl_impl_ids.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/v4l2_sliced_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/setresugid.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nfnetlink_nftables.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/sigaction.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/trace_event.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/nbd_ioctl_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/adjtimex.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/bpf_file_mode_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/rtc.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/netlink_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/kd_key_ascii
 _keys.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/bpf_op_jmp.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sock_ip_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/epoll_ctl.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/pidns.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/af_packet_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/neighbor_cache_entry_states.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sock_udp_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/seccomp_ops.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/ptrace_events.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/bpf_filter.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/btrfs_defrag_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/fspick.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/get_mempolicy_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/flock.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sched_flags.h /usr/s
 rc/debug/strace/5.17-r0/strace-5.17/tests/io_uring_register.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/rtnl_nh.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/getxgid.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/kd_key_pad_keys.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/fiemap_extent_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sysctl_root.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/riscv_flush_icache.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/msghdr.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/ipc_shm.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/readlink.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/mctl_sync.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sock_caif_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/kill.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/segv_accerr.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/sleep.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/pause.c /usr/src/debug
 /strace/5.17-r0/strace-5.17/tests/overflowuid.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_dcb_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/block.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/uffd_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rxrpc_services.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/v4l2_control_ids.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/nlattr_ifla_af_spec.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/pr_tagged_addr_enable.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/keyctl_kdf_params.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/evdev_misc.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/print_sg_req_info.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/execveat--secontext.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/ebpf_class.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/aio.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/ubi_volume_props.h /usr/src/debug/strace/5.17-r
 0/strace-5.17/tests/prctl-set-ptracer-success.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/mount_setattr.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/kd_key_dead_keys.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/tampering-notes.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/dm.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_rule_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/print_mq_attr.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_ifla_br_boolopts.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/file_handle--secontext.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/netlink_netlink_diag.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/bdaddr_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/memfd_secret.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/quotacmds.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/qual_inject-retval.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/personality.c /usr/src/debug/strace/5.1
 7-r0/strace-5.17/src/xlat/v4l2_input_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/ptrace.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/execve--secontext.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_mdba_router_pattr_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/create_tmpfile.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/access.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/rtnl_link.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/hdio_busstates.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/rt_sigreturn.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/reboot.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/perf_event_sample_format.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/error_msg.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/baud_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sg_scsi_reset.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/syslog_action_type.h /usr/src/debug/strace/5.17-r0/strace-5
 .17/src/xlat/statx_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/mtd_file_mode_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/delete_module_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/socktypes.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/prctl-tsc.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/hdio_drive_cmds.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/kcmp_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/personality_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/semtimedop-ipc.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/linkat--secontext.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/semctl_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/execve.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/prctl-tagged-addr.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/print_msgbuf.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/prctl-seccomp-strict.c /usr/src/debug/strace/5.17-r0/strace-5.
 17/src/xlat/qipcrtr_nodes.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/setns_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/prctl-unalign.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/userfaultfd.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/bluetooth_l2_psm.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/ioctl_inotify.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/print_dev_t.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/evdev_prop.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/bpf_test_run_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/recvfrom.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/btrfs_balance_args.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/sprintrc.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/inotify_flags.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/chmod.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/getcwd.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/netlink.c /usr/src/debug/strace/5.
 17-r0/strace-5.17/src/kernel_timex.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/sock_options.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/looping_threads.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/dirent_types.h /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/rtnl_mdba_mdb_eattr_attrs.h /usr/src/debug/strace/5.17-r0/strace-5.17/tests/sched_xetattr.c /usr/src/debug/strace/5.17-r0/strace-5.17/tests/fdatasync.c /usr/src/debug/strace/5.17-r0/strace-5.17/src/xlat/clocknames.h"
packages/core2-32-poky-linux/strace/strace-src: PV changed from "5.16" to "5.17"
packages/core2-32-poky-linux/strace/strace-staticdev: PKGV changed from 5.16 [default] to 5.17 [default]
packages/core2-32-poky-linux/strace/strace-staticdev: PV changed from "5.16" to "5.17"
packages/core2-32-poky-linux/strace/strace: PKGV changed from 5.16 [default] to 5.17 [default]
packages/core2-32-poky-linux/strace/strace: PKGSIZE changed from 1306121 to 1310217 (+0%)
packages/core2-32-poky-linux/strace/strace: PV changed from "5.16" to "5.17"

--===============0894140871958499617==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1640 targets, 69 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d31b9d9377484317439d8e4f3d5d49e2fed9f0f1"
workspace            = "master:ee5f9d9fdd7d09aa3a86a19d07e3e64851ddc686"

Initialising tasks...done.
Sstate summary: Wanted 123 Local 29 Mirrors 0 Missed 94 Current 382 (23% match, 81% complete)
Removing 3 stale sstate objects for arch qemuppc...done.
Removing 12 stale sstate objects for arch ppc7400...done.
NOTE: Executing Tasks
NOTE: Running setscene task 393 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 439 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 468 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 478 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 479 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.37.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 764 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_prepare_recipe_sysroot)
NOTE: recipe expat-2.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1064 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_configure_ptest_base)
NOTE: Running task 1108 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_compile)
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1187 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_compile)
NOTE: Running task 1188 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_compile)
NOTE: recipe coreutils-9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 498 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.0.bb:do_package_setscene)
NOTE: recipe libseccomp-2.5.3-r0: task do_configure_ptest_base: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_compile: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_compile: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_compile: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_compile: Succeeded
NOTE: recipe python3-3.10.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1191 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_compile)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3/3.10.3-r0/temp/log.do_packagedata_setscene.1060229
NOTE: recipe libpcre-8.45-r0: task do_prepare_recipe_sysroot: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 499 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_package_setscene)
NOTE: Running task 1192 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_configure)
NOTE: Running task 1193 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_install)
NOTE: recipe libseccomp-2.5.3-r0: task do_compile: Started
NOTE: recipe libpcre-8.45-r0: task do_configure: Started
NOTE: recipe util-linux-2.37.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_compile: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1199 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_install)
NOTE: Running task 1200 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_install)
NOTE: Running task 1268 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_compile)
NOTE: Running task 1269 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_install)
NOTE: Running task 1311 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_fetch)
NOTE: Running task 1313 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_fetch)
NOTE: Running task 1314 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_fetch)
NOTE: Running task 1315 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_fetch)
NOTE: Running task 1337 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_fetch)
NOTE: Running task 1341 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_write_config)
NOTE: Running task 1359 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_fetch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_install: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_install: Started
NOTE: Running task 1463 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_fetch)
NOTE: Running task 1469 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_packagedata)
NOTE: recipe libxau-1_1.0.9-r0: task do_install: Started
NOTE: Running task 1509 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_package)
NOTE: recipe kmod-29-r0: task do_compile: Started
NOTE: recipe libical-3.0.14-r0: task do_fetch: Started
NOTE: recipe vala-0.56.0-r0: task do_fetch: Started
NOTE: recipe coreutils-9.0-r0: task do_package_setscene: Started
NOTE: recipe icu-70.1-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.2-r0: task do_install: Started
NOTE: recipe libical-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.56.0-r0: task do_fetch: Succeeded
NOTE: Running task 1550 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_fetch: Started
NOTE: recipe strace-5.17-r0: task do_fetch: Started
NOTE: recipe bluez5-5.64-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_write_config: Started
NOTE: recipe icu-70.1-r0: task do_fetch: Succeeded
NOTE: Running task 1552 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_package)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.10.3-r0: task do_package_setscene: Started
NOTE: Running task 1553 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_unpack)
NOTE: recipe strace-5.17-r0: task do_fetch: Succeeded
NOTE: Running task 1554 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_unpack)
NOTE: Running task 1555 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_unpack)
NOTE: Running task 1556 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1557 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_unpack)
NOTE: Running task 1558 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_unpack)
NOTE: Running task 1559 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_unpack)
NOTE: Running task 1563 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.35.bb:do_package_write_rpm)
NOTE: recipe grep-3.7-r0: task do_fetch: Started
NOTE: Running task 1564 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm)
NOTE: recipe grep-3.7-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_write_config: Succeeded
NOTE: Running task 1565 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_unpack)
NOTE: recipe libical-3.0.14-r0: task do_unpack: Started
NOTE: recipe vala-0.56.0-r0: task do_unpack: Started
NOTE: recipe icu-70.1-r0: task do_unpack: Started
NOTE: recipe gawk-5.1.1-r0: task do_package: Started
NOTE: recipe icu-70.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_unpack: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Started
NOTE: recipe findutils-4.9.0-r0: task do_package: Started
NOTE: recipe bluez5-5.64-r0: task do_unpack: Started
NOTE: recipe strace-5.17-r0: task do_unpack: Started
NOTE: recipe grep-3.7-r0: task do_unpack: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_install: Succeeded
NOTE: recipe make-4.3-r0: task do_package_write_rpm: Started
NOTE: Running task 1566 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 1567 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package)
NOTE: recipe libical-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1568 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_patch)
NOTE: recipe glibc-locale-2.35-r0: task do_package_write_rpm: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_install: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_install: Succeeded
NOTE: Running task 1569 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot)
NOTE: recipe libical-3.0.14-r0: task do_patch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot: Started
NOTE: Running task 1570 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package)
NOTE: Running task 1571 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot)
NOTE: Running task 1572 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_unpack: Succeeded
NOTE: recipe grep-3.7-r0: task do_unpack: Succeeded
NOTE: Running task 1573 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_patch)
NOTE: Running task 1574 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_patch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_unpack: Succeeded
NOTE: Running task 1575 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_patch)
NOTE: Running task 1576 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_generate_toolchain_file)
NOTE: Running task 1577 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe icu-70.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_patch: Started
NOTE: recipe grep-3.7-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package: Started
NOTE: recipe bluez5-5.64-r0: task do_patch: Started
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package: Started
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_patch: Succeeded
NOTE: Running task 1578 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1579 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.0-r0: task do_unpack: Succeeded
NOTE: Running task 1580 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_patch)
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe grep-3.7-r0: task do_patch: Succeeded
NOTE: Running task 1581 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe strace-5.17-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1582 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_patch)
NOTE: recipe bluez5-5.64-r0: task do_patch: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.0-r0: task do_patch: Started
NOTE: Running task 1583 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_deploy_source_date_epoch)
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe grep-3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.0-r0: task do_patch: Succeeded
NOTE: recipe strace-5.17-r0: task do_patch: Started
NOTE: Running task 1584 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1585 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcb-1.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe grep-3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1586 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_configure)
NOTE: recipe bluez5-5.64-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_configure: Started
NOTE: recipe strace-5.17-r0: task do_patch: Succeeded
NOTE: Running task 1587 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_deploy_source_date_epoch)
NOTE: Running task 1588 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_populate_lic)
NOTE: recipe libxcb-1.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1589 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_configure)
NOTE: recipe kmod-29-r0: task do_compile: Succeeded
NOTE: recipe strace-5.17-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1590 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_install)
NOTE: recipe strace-5.17-r0: task do_populate_lic: Started
NOTE: recipe libxcb-1.14-r0: task do_configure: Started
NOTE: recipe icu-70.1-r0: task do_unpack: Succeeded
NOTE: Running task 1591 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_patch)
NOTE: recipe kmod-29-r0: task do_install: Started
NOTE: recipe icu-70.1-r0: task do_patch: Started
NOTE: recipe strace-5.17-r0: task do_populate_lic: Succeeded
NOTE: recipe strace-5.17-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_populate_lic unihash changed to a6b1df75dc53be8b6056177243ab303fc454edc85216acd9842c7d42cddd6bdb
NOTE: recipe icu-70.1-r0: task do_patch: Succeeded
NOTE: Running task 1592 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_make_icudata)
NOTE: Running task 1593 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_deploy_source_date_epoch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Succeeded
NOTE: Running task 1594 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata)
NOTE: recipe icu-70.1-r0: task do_make_icudata: Started
NOTE: recipe icu-70.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-70.1-r0: task do_make_icudata: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package unihash changed to 284970a9dd46cd9216d98b4dec2000dabf9454d5fa645644f5bdb6a613f45c12
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata became valid
NOTE: Running setscene task 500 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: recipe kmod-29-r0: task do_install: Succeeded
NOTE: Running task 1595 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_populate_sysroot)
NOTE: Running task 1596 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_package)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-70.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1597 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_configure)
NOTE: recipe kmod-29-r0: task do_populate_sysroot: Started
NOTE: recipe kmod-29-r0: task do_package: Started
NOTE: recipe python3-3.10.3-r0: task do_package_setscene: Succeeded
NOTE: recipe icu-70.1-r0: task do_configure: Started
NOTE: Running task 1610 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1612 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_packagedata)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package: Succeeded
NOTE: Running task 1614 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata)
NOTE: Running task 1615 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata)
NOTE: recipe libxml2-2.9.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.10.3-r0: task do_packagedata: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1616 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_configure)
NOTE: recipe make-4.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-3.10.3-r0: task do_packagedata: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_configure: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_compile: Succeeded
NOTE: Running task 1617 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_compile_ptest_base)
NOTE: recipe libseccomp-2.5.3-r0: task do_compile_ptest_base: Started
NOTE: recipe kmod-29-r0: task do_package: Succeeded
NOTE: Running task 1618 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_packagedata)
NOTE: recipe kmod-29-r0: task do_packagedata: Started
NOTE: recipe coreutils-9.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 502 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.63-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.63-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.63-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_package: Succeeded
NOTE: recipe libcap-2.63-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 505 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-29-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_package unihash changed to d36ea43c836e49ed3c7b0f25c47f46e87a67f1b588e08b10e1ce444d160f6fa7
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata became valid
NOTE: Running setscene task 505 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gawk-5.1.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_package unihash changed to df86270f8f4d918e7af35fe45247fcaa1763a6989dcee98cf3b85bdc712b4f6b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_packagedata became valid
NOTE: Running setscene task 505 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1676 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_package_write_rpm)
NOTE: Running task 1677 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm)
NOTE: Running task 1678 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.0.bb:do_package_write_rpm)
NOTE: recipe gawk-5.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm: Started
NOTE: recipe coreutils-9.0-r0: task do_package_write_rpm: Started
NOTE: recipe gawk-5.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm unihash changed to 58033a99fa7fb39a0116c60466f327d369c9d68f061bb942d98ba3682bf529b2
NOTE: recipe icu-70.1-r0: task do_configure: Succeeded
NOTE: Running task 1679 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_compile)
NOTE: recipe icu-70.1-r0: task do_compile: Started
NOTE: recipe libpcre-8.45-r0: task do_configure: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_configure: Succeeded
NOTE: Running task 1680 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_configure_ptest_base)
NOTE: Running task 1681 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_compile)
NOTE: recipe libpcre-8.45-r0: task do_configure_ptest_base: Started
NOTE: recipe libice-1_1.0.10-r0: task do_compile: Started
NOTE: recipe libpcre-8.45-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1682 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_compile)
NOTE: recipe libpcre-8.45-r0: task do_compile: Started
NOTE: recipe zstd-1.5.2-r0: task do_install: Succeeded
NOTE: Running task 1683 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_populate_sysroot)
NOTE: Running task 1684 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_package)
NOTE: recipe zstd-1.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe zstd-1.5.2-r0: task do_package: Started
NOTE: recipe zstd-1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 1685 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_install)
NOTE: recipe libice-1_1.0.10-r0: task do_install: Started
NOTE: recipe libice-1_1.0.10-r0: task do_install: Succeeded
NOTE: Running task 1686 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot)
NOTE: Running task 1687 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1688 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsm-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1689 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_configure)
NOTE: recipe libxcb-1.14-r0: task do_configure: Succeeded
NOTE: Running task 1690 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_compile)
NOTE: recipe libsm-1_1.2.3-r0: task do_configure: Started
NOTE: recipe zstd-1.5.2-r0: task do_package: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_compile: Started
NOTE: Running task 1691 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_packagedata)
NOTE: recipe zstd-1.5.2-r0: task do_packagedata: Started
NOTE: recipe zstd-1.5.2-r0: task do_packagedata: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package: Succeeded
NOTE: Running task 1692 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_compile: Succeeded
NOTE: Running task 1693 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_install)
NOTE: recipe libpcre-8.45-r0: task do_compile: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_install: Started
NOTE: Running task 1694 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_compile_ptest_base)
NOTE: recipe libseccomp-2.5.3-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_configure: Succeeded
NOTE: Running task 1695 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_install)
NOTE: Running task 1696 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_configure_ptest_base)
NOTE: recipe libpcre-8.45-r0: task do_compile_ptest_base: Started
NOTE: recipe libxml2-2.9.13-r0: task do_configure_ptest_base: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_install: Started
NOTE: recipe libpcre-8.45-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1697 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_install)
NOTE: recipe libxml2-2.9.13-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1698 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_compile)
NOTE: recipe libpcre-8.45-r0: task do_install: Started
NOTE: recipe libxml2-2.9.13-r0: task do_compile: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_install: Succeeded
NOTE: Running task 1699 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_install_ptest_base)
NOTE: recipe libpcre-8.45-r0: task do_install: Succeeded
NOTE: Running task 1700 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_install_ptest_base)
NOTE: recipe libseccomp-2.5.3-r0: task do_install_ptest_base: Started
NOTE: recipe libpcre-8.45-r0: task do_install_ptest_base: Started
NOTE: recipe libpcre-8.45-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1701 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot)
NOTE: Running task 1702 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_package)
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre-8.45-r0: task do_package: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1703 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1704 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe grep-3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe grep-3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1705 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_configure)
NOTE: recipe libseccomp-2.5.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1706 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_populate_sysroot)
NOTE: Running task 1707 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_package)
NOTE: recipe grep-3.7-r0: task do_configure: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_populate_sysroot: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1708 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_configure)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_configure: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_install: Succeeded
NOTE: Running task 1709 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot)
NOTE: Running task 1710 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package)
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot: Started
NOTE: recipe libxcb-1.14-r0: task do_package: Started
NOTE: recipe coreutils-9.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.0.bb:do_package_write_rpm unihash changed to a80f0d52ba3d8f11ad3754478aefc6ffbdd8807bed16effc7f82678fce122901
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1711 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1712 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_configure)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_configure: Started
NOTE: recipe libpcre-8.45-r0: task do_package: Succeeded
NOTE: Running task 1713 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata)
NOTE: recipe libpcre-8.45-r0: task do_packagedata: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 1714 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_compile)
NOTE: recipe libsm-1_1.2.3-r0: task do_compile: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 1715 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_install)
NOTE: recipe libsm-1_1.2.3-r0: task do_install: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 1716 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 1717 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package)
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_package: Succeeded
NOTE: Running task 1718 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_packagedata)
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_packagedata: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_packagedata: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 1719 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_compile: Succeeded
NOTE: Running task 1720 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_compile_ptest_base)
NOTE: recipe libxml2-2.9.13-r0: task do_compile_ptest_base: Started
NOTE: recipe libxcb-1.14-r0: task do_package: Succeeded
NOTE: Running task 1721 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata)
NOTE: recipe libxcb-1.14-r0: task do_packagedata: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_configure: Succeeded
NOTE: Running task 1722 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1723 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_compile)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_compile: Started
NOTE: recipe icu-70.1-r0: task do_compile: Succeeded
NOTE: Running task 1724 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_install)
NOTE: recipe icu-70.1-r0: task do_install: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_configure: Succeeded
NOTE: Running task 1725 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_compile)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_compile: Started
NOTE: recipe icu-70.1-r0: task do_install: Succeeded
NOTE: Running task 1726 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_populate_sysroot)
NOTE: Running task 1727 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_package)
NOTE: recipe icu-70.1-r0: task do_populate_sysroot: Started
NOTE: recipe icu-70.1-r0: task do_package: Started
NOTE: recipe icu-70.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_compile: Succeeded
NOTE: Running task 1728 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1729 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_install)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_install: Started
NOTE: recipe grep-3.7-r0: task do_configure: Succeeded
NOTE: Running task 1730 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_compile)
NOTE: recipe grep-3.7-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_install: Succeeded
NOTE: Running task 1731 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1732 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_populate_sysroot)
NOTE: Running task 1733 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_package)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe icu-70.1-r0: task do_package: Succeeded
NOTE: Running task 1734 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1735 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1736 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_packagedata)
NOTE: recipe vala-0.56.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe icu-70.1-r0: task do_packagedata: Started
NOTE: recipe icu-70.1-r0: task do_packagedata: Succeeded
NOTE: recipe vala-0.56.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1737 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1738 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_configure)
NOTE: recipe vala-0.56.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_configure: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_compile: Succeeded
NOTE: Running task 1739 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_install)
NOTE: recipe grep-3.7-r0: task do_compile: Succeeded
NOTE: Running task 1740 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_install)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_install: Started
NOTE: recipe grep-3.7-r0: task do_install: Started
NOTE: recipe grep-3.7-r0: task do_install: Succeeded
NOTE: Running task 1741 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_package)
NOTE: recipe grep-3.7-r0: task do_package: Started
NOTE: recipe libxml2-2.9.13-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1742 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_install)
NOTE: recipe libxml2-2.9.13-r0: task do_install: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_install: Succeeded
NOTE: Running task 1743 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_populate_sysroot)
NOTE: Running task 1744 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_package)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_package: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_configure: Succeeded
NOTE: Running task 1745 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_compile)
NOTE: recipe libxml2-2.9.13-r0: task do_install: Succeeded
NOTE: Running task 1746 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_install_ptest_base)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_compile: Started
NOTE: recipe libxml2-2.9.13-r0: task do_install_ptest_base: Started
NOTE: recipe grep-3.7-r0: task do_package: Succeeded
NOTE: Running task 1747 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_packagedata)
NOTE: recipe grep-3.7-r0: task do_packagedata: Started
NOTE: recipe grep-3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 1748 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_package_write_rpm)
NOTE: recipe grep-3.7-r0: task do_package_write_rpm: Started
NOTE: recipe libxml2-2.9.13-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1749 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_populate_sysroot)
NOTE: Running task 1750 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_package)
NOTE: recipe libxml2-2.9.13-r0: task do_populate_sysroot: Started
NOTE: recipe libxml2-2.9.13-r0: task do_package: Started
NOTE: recipe libxml2-2.9.13-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1751 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe wayland-1.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe grep-3.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libx11-1_1.7.3.1-r0: task do_package: Succeeded
NOTE: Running task 1752 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_packagedata)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_packagedata: Started
NOTE: recipe wayland-1.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1753 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_configure)
NOTE: recipe wayland-1.20.0-r0: task do_configure: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_packagedata: Succeeded
NOTE: recipe vala-0.56.0-r0: task do_configure: Succeeded
NOTE: Running task 1754 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_compile)
NOTE: recipe vala-0.56.0-r0: task do_compile: Started
NOTE: recipe wayland-1.20.0-r0: task do_configure: Succeeded
NOTE: Running task 1755 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_configure_ptest_base)
NOTE: recipe wayland-1.20.0-r0: task do_configure_ptest_base: Started
NOTE: recipe wayland-1.20.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1756 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_compile)
NOTE: recipe wayland-1.20.0-r0: task do_compile: Started
NOTE: recipe wayland-1.20.0-r0: task do_compile: Succeeded
NOTE: Running task 1757 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_compile_ptest_base)
NOTE: recipe wayland-1.20.0-r0: task do_compile_ptest_base: Started
NOTE: recipe wayland-1.20.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1758 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_install)
NOTE: recipe wayland-1.20.0-r0: task do_install: Started
NOTE: recipe wayland-1.20.0-r0: task do_install: Succeeded
NOTE: Running task 1759 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_install_ptest_base)
NOTE: recipe wayland-1.20.0-r0: task do_install_ptest_base: Started
NOTE: recipe wayland-1.20.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1760 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_populate_sysroot)
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot: Started
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1761 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1762 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_configure)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_package: Succeeded
NOTE: Running task 1763 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1764 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_compile)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1765 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_install)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 1766 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_populate_sysroot)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_compile: Succeeded
NOTE: Running task 1767 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_install)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1768 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_install: Started
NOTE: recipe systemd-1_250.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_install: Succeeded
NOTE: Running task 1769 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot)
NOTE: Running task 1770 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_package)
NOTE: recipe systemd-1_250.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1771 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_configure)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_package: Started
NOTE: recipe systemd-1_250.4-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_package: Succeeded
NOTE: Running task 1772 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_package: Succeeded
NOTE: Running task 1773 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_packagedata)
NOTE: recipe libxml2-2.9.13-r0: task do_packagedata: Started
NOTE: recipe libxml2-2.9.13-r0: task do_packagedata: Succeeded
NOTE: Running task 1774 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_package)
NOTE: recipe wayland-1.20.0-r0: task do_package: Started
NOTE: recipe wayland-1.20.0-r0: task do_package: Succeeded
NOTE: Running task 1775 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_packagedata)
NOTE: recipe wayland-1.20.0-r0: task do_packagedata: Started
NOTE: recipe wayland-1.20.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1776 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_package)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 1777 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_packagedata)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.0-r0: task do_compile: Succeeded
NOTE: Running task 1778 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_install)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe vala-0.56.0-r0: task do_install: Started
NOTE: recipe vala-0.56.0-r0: task do_install: Succeeded
NOTE: Running task 1779 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_populate_sysroot)
NOTE: Running task 1780 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_package)
NOTE: recipe vala-0.56.0-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.0-r0: task do_package: Started
NOTE: recipe vala-0.56.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1781 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibc-locale-2.35-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.35.bb:do_package_write_rpm unihash changed to 3c7ce9161d28cff6224eca5c22033e9000bd2cd85ec91a0d0f4c3d103e0cfcc6
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1782 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_configure)
NOTE: recipe libical-3.0.14-r0: task do_configure: Started
NOTE: recipe vala-0.56.0-r0: task do_package: Succeeded
NOTE: Running task 1783 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_packagedata)
NOTE: recipe vala-0.56.0-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.0-r0: task do_packagedata: Succeeded
NOTE: recipe systemd-1_250.4-r0: task do_configure: Succeeded
NOTE: Running task 1784 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_compile)
NOTE: recipe systemd-1_250.4-r0: task do_compile: Started
NOTE: recipe libical-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1785 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_compile)
NOTE: recipe libical-3.0.14-r0: task do_compile: Started
NOTE: recipe libical-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1786 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_install)
NOTE: recipe libical-3.0.14-r0: task do_install: Started
NOTE: recipe libical-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1787 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1788 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_package)
NOTE: recipe libical-3.0.14-r0: task do_package: Started
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe systemd-1_250.4-r0: task do_compile: Succeeded
NOTE: Running task 1789 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_install)
NOTE: recipe systemd-1_250.4-r0: task do_install: Started
NOTE: recipe libical-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1790 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_packagedata)
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe systemd-1_250.4-r0: task do_install: Succeeded
NOTE: Running task 1791 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_populate_sysroot)
NOTE: Running task 1792 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_package)
NOTE: recipe systemd-1_250.4-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-1_250.4-r0: task do_package: Started
NOTE: recipe systemd-1_250.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1793 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-1.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1794 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_configure)
NOTE: recipe dbus-1.14.0-r0: task do_configure: Started
NOTE: recipe systemd-1_250.4-r0: task do_package: Succeeded
NOTE: Running task 1795 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_packagedata)
NOTE: recipe systemd-1_250.4-r0: task do_packagedata: Started
NOTE: recipe systemd-1_250.4-r0: task do_packagedata: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_configure: Succeeded
NOTE: Running task 1796 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_configure_ptest_base)
NOTE: recipe dbus-1.14.0-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.14.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1797 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_compile)
NOTE: recipe dbus-1.14.0-r0: task do_compile: Started
NOTE: recipe dbus-1.14.0-r0: task do_compile: Succeeded
NOTE: Running task 1798 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_compile_ptest_base)
NOTE: recipe dbus-1.14.0-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.14.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1799 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_install)
NOTE: recipe dbus-1.14.0-r0: task do_install: Started
NOTE: recipe dbus-1.14.0-r0: task do_install: Succeeded
NOTE: Running task 1800 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_install_ptest_base)
NOTE: recipe dbus-1.14.0-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.14.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1801 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_populate_sysroot)
NOTE: Running task 1802 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_package)
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.14.0-r0: task do_package: Started
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1803 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.64-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.64-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1804 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_configure)
NOTE: recipe bluez5-5.64-r0: task do_configure: Started
NOTE: recipe dbus-1.14.0-r0: task do_package: Succeeded
NOTE: Running task 1805 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_packagedata)
NOTE: recipe dbus-1.14.0-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_configure: Succeeded
NOTE: Running task 1806 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.64-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1807 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_compile)
NOTE: recipe bluez5-5.64-r0: task do_compile: Started
NOTE: recipe bluez5-5.64-r0: task do_compile: Succeeded
NOTE: Running task 1808 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_compile_ptest_base: Started
NOTE: recipe bluez5-5.64-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1809 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_install)
NOTE: recipe bluez5-5.64-r0: task do_install: Started
NOTE: recipe bluez5-5.64-r0: task do_install: Succeeded
NOTE: Running task 1810 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.64-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1811 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_populate_sysroot)
NOTE: Running task 1812 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_package)
NOTE: recipe bluez5-5.64-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.64-r0: task do_package: Started
NOTE: recipe bluez5-5.64-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1813 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_prepare_recipe_sysroot)
NOTE: recipe strace-5.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe strace-5.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1814 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_configure)
NOTE: recipe strace-5.17-r0: task do_configure: Started
NOTE: recipe bluez5-5.64-r0: task do_package: Succeeded
NOTE: Running task 1815 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_packagedata)
NOTE: recipe bluez5-5.64-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.64-r0: task do_packagedata: Succeeded
NOTE: recipe strace-5.17-r0: task do_configure: Succeeded
NOTE: Running task 1816 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_configure_ptest_base)
NOTE: recipe strace-5.17-r0: task do_configure_ptest_base: Started
NOTE: recipe strace-5.17-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1817 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_compile)
NOTE: recipe strace-5.17-r0: task do_compile: Started
NOTE: recipe strace-5.17-r0: task do_compile: Succeeded
NOTE: Running task 1818 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_compile_ptest_base)
NOTE: recipe strace-5.17-r0: task do_compile_ptest_base: Started
NOTE: recipe strace-5.17-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1819 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_install)
NOTE: recipe strace-5.17-r0: task do_install: Started
NOTE: recipe strace-5.17-r0: task do_install: Succeeded
NOTE: Running task 1820 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_install_ptest_base)
NOTE: recipe strace-5.17-r0: task do_install_ptest_base: Started
NOTE: recipe strace-5.17-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1821 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_package)
NOTE: Running task 1822 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_populate_sysroot)
NOTE: recipe strace-5.17-r0: task do_package: Started
NOTE: recipe strace-5.17-r0: task do_populate_sysroot: Started
NOTE: recipe strace-5.17-r0: task do_populate_sysroot: Succeeded
NOTE: recipe strace-5.17-r0: task do_package: Succeeded
NOTE: Running task 1823 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_packagedata)
NOTE: recipe strace-5.17-r0: task do_packagedata: Started
NOTE: recipe strace-5.17-r0: task do_packagedata: Succeeded
NOTE: Running task 1824 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_package_write_rpm)
NOTE: Running task 1825 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_package_qa)
NOTE: recipe strace-5.17-r0: task do_package_qa: Started
NOTE: recipe strace-5.17-r0: task do_package_write_rpm: Started
NOTE: recipe strace-5.17-r0: task do_package_write_rpm: Succeeded
NOTE: recipe strace-5.17-r0: task do_package_qa: Succeeded
NOTE: Running noexec task 1826 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_build)
NOTE: Tasks Summary: Attempted 1826 tasks of which 1602 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 70 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-src went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbg went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tests went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-2to3 went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asyncio went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-audio went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-codecs went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compile went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compression went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-core went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-crypt went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ctypes went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-curses went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-datetime went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-db went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-debugger went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-difflib went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils-windows went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doctest went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-email went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-fcntl went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-gdbm went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-html went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-idle went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-image went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-io went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-json went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-logging went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mailbox went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-math went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mime went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mmap went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-modules went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-multiprocessing went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netclient went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netserver went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-numbers went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pickle went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkgutil went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-plistlib went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pprint went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-profile went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pydoc went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-resource went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-shell went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-smtpd went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-sqlite3 went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-statistics went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-stringold went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-syslog went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-terminal went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-threading went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tkinter went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unixadmin went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-venv went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xml went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xmlrpc went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3 went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3-staticdev went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ptest went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-staticdev went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dev went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doc went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-locale went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3 went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-misc went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-man went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0894140871958499617==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1640 targets, 52 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d31b9d9377484317439d8e4f3d5d49e2fed9f0f1"
workspace            = "master:ee5f9d9fdd7d09aa3a86a19d07e3e64851ddc686"

Initialising tasks...done.
Sstate summary: Wanted 123 Local 29 Mirrors 0 Missed 94 Current 382 (23% match, 81% complete)
Removing 12 stale sstate objects for arch cortexa15t2hf-neon...done.
Removing 3 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 393 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 439 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 468 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 478 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 479 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.37.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 826 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_configure_ptest_base)
NOTE: recipe python3-3.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_configure_ptest_base: Started
NOTE: Running task 1111 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_compile)
NOTE: recipe expat-2.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1141 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_compile_ptest_base)
NOTE: recipe libpcre-8.45-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1185 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_compile)
NOTE: Running task 1187 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_compile)
NOTE: Running task 1190 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_compile)
NOTE: Running task 1260 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_compile)
NOTE: Running task 1261 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_install)
NOTE: recipe xtrans-1_1.4.0-r0: task do_compile: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_compile_ptest_base: Started
NOTE: recipe libpcre-8.45-r0: task do_compile: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_compile: Started
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_compile: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_compile: Succeeded
NOTE: recipe coreutils-9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_compile: Started
NOTE: recipe python3-3.10.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 498 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.0.bb:do_package_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3/3.10.3-r0/temp/log.do_packagedata_setscene.309911
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libxau-1_1.0.9-r0: task do_compile: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_compile: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 500 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_package_setscene)
NOTE: Running task 1270 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_install)
NOTE: Running task 1271 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_install)
NOTE: Running task 1272 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_install)
NOTE: Running task 1314 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_fetch)
NOTE: Running task 1316 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_fetch)
NOTE: Running task 1317 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_fetch)
NOTE: Running task 1318 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_fetch)
NOTE: Running task 1340 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_fetch)
NOTE: Running task 1344 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_write_config)
NOTE: Running task 1362 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_fetch)
NOTE: recipe zstd-1.5.2-r0: task do_install: Started
NOTE: Running task 1466 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_fetch)
NOTE: Running task 1472 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_packagedata)
NOTE: Running task 1512 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_package)
NOTE: recipe coreutils-9.0-r0: task do_package_setscene: Started
NOTE: recipe libical-3.0.14-r0: task do_fetch: Started
NOTE: recipe icu-70.1-r0: task do_fetch: Started
NOTE: recipe vala-0.56.0-r0: task do_fetch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_install: Started
NOTE: Running task 1553 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_package)
NOTE: recipe libical-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.56.0-r0: task do_fetch: Succeeded
NOTE: recipe strace-5.17-r0: task do_fetch: Started
NOTE: recipe icu-70.1-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_fetch: Started
NOTE: Running task 1555 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_fetch: Started
NOTE: Running task 1556 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_unpack)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_install: Started
NOTE: Running task 1557 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_unpack)
NOTE: Running task 1558 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_unpack)
NOTE: recipe python3-3.10.3-r0: task do_package_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_install: Started
NOTE: Running task 1559 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1562 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm)
NOTE: recipe bluez5-5.64-r0: task do_fetch: Succeeded
NOTE: recipe strace-5.17-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_packagedata: Started
NOTE: Running task 1563 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_unpack)
NOTE: Running task 1564 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_unpack)
NOTE: Running task 1566 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.35.bb:do_package_write_rpm)
NOTE: Running task 1567 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_unpack)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_write_config: Succeeded
NOTE: recipe grep-3.7-r0: task do_fetch: Started
NOTE: recipe grep-3.7-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_unpack: Started
NOTE: recipe gawk-5.1.1-r0: task do_package: Started
NOTE: Running task 1568 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_unpack)
NOTE: recipe icu-70.1-r0: task do_unpack: Started
NOTE: recipe vala-0.56.0-r0: task do_unpack: Started
NOTE: recipe icu-70.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe findutils-4.9.0-r0: task do_package: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Started
NOTE: recipe strace-5.17-r0: task do_unpack: Started
NOTE: recipe bluez5-5.64-r0: task do_unpack: Started
NOTE: recipe libical-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_unpack: Started
NOTE: Running task 1569 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_patch)
NOTE: recipe make-4.3-r0: task do_package_write_rpm: Started
NOTE: recipe grep-3.7-r0: task do_unpack: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_install: Succeeded
NOTE: recipe glibc-locale-2.35-r0: task do_package_write_rpm: Started
NOTE: Running task 1570 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 1571 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package)
NOTE: recipe libical-3.0.14-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_install: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_install: Succeeded
NOTE: Running task 1572 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot)
NOTE: Running task 1573 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot: Started
NOTE: Running task 1574 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot)
NOTE: Running task 1575 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_unpack: Succeeded
NOTE: recipe kmod-29-r0: task do_compile: Succeeded
NOTE: Running task 1576 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_patch)
NOTE: Running task 1577 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_install)
NOTE: recipe grep-3.7-r0: task do_unpack: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_unpack: Succeeded
NOTE: Running task 1578 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_patch)
NOTE: Running task 1579 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_patch)
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Started
NOTE: Running task 1580 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_generate_toolchain_file)
NOTE: Running task 1581 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe icu-70.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_patch: Started
NOTE: recipe grep-3.7-r0: task do_patch: Started
NOTE: recipe bluez5-5.64-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package: Started
NOTE: recipe vala-0.56.0-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package: Started
NOTE: recipe kmod-29-r0: task do_install: Started
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1582 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_patch)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_packagedata: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Started
NOTE: recipe strace-5.17-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_patch: Succeeded
NOTE: Running task 1583 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_patch)
NOTE: Running task 1584 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe grep-3.7-r0: task do_patch: Succeeded
NOTE: Running task 1585 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.0-r0: task do_patch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1586 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.64-r0: task do_patch: Succeeded
NOTE: Running task 1587 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_deploy_source_date_epoch)
NOTE: recipe strace-5.17-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.0-r0: task do_patch: Succeeded
NOTE: recipe grep-3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1588 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.64-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe grep-3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1589 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libice-1_1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1590 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_configure)
NOTE: recipe vala-0.56.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kmod-29-r0: task do_install: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_configure: Started
NOTE: recipe strace-5.17-r0: task do_patch: Succeeded
NOTE: Running task 1591 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_populate_sysroot)
NOTE: Running task 1592 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_package)
NOTE: Running task 1593 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_deploy_source_date_epoch)
NOTE: Running task 1594 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_populate_lic)
NOTE: recipe strace-5.17-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot: Started
NOTE: recipe icu-70.1-r0: task do_unpack: Succeeded
NOTE: recipe strace-5.17-r0: task do_populate_lic: Started
NOTE: recipe kmod-29-r0: task do_package: Started
NOTE: Running task 1595 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_patch)
NOTE: recipe libxcb-1.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1596 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_configure)
NOTE: recipe icu-70.1-r0: task do_patch: Started
NOTE: recipe strace-5.17-r0: task do_populate_lic: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_populate_lic unihash changed to a6b1df75dc53be8b6056177243ab303fc454edc85216acd9842c7d42cddd6bdb
NOTE: recipe strace-5.17-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe icu-70.1-r0: task do_patch: Succeeded
NOTE: Running task 1597 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_make_icudata)
NOTE: Running task 1598 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_deploy_source_date_epoch)
NOTE: recipe kmod-29-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Succeeded
NOTE: Running task 1599 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata)
NOTE: recipe icu-70.1-r0: task do_make_icudata: Started
NOTE: recipe icu-70.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Succeeded
NOTE: recipe icu-70.1-r0: task do_make_icudata: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package unihash changed to 4f406fdcc03336fdabd30983eaed38a4dd5c4a8db9eb1aea14ea0e037a92e709
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata became valid
NOTE: Running setscene task 500 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-70.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-3.10.3-r0: task do_package_setscene: Succeeded
NOTE: Running task 1600 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_configure)
NOTE: Running task 1613 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1615 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_packagedata)
NOTE: recipe libxau-1_1.0.9-r0: task do_package: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1617 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package: Succeeded
NOTE: recipe icu-70.1-r0: task do_configure: Started
NOTE: recipe libxml2-2.9.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1618 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata)
NOTE: recipe python3-3.10.3-r0: task do_packagedata: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1619 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_configure)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata: Succeeded
NOTE: recipe kmod-29-r0: task do_package: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_configure: Started
NOTE: Running task 1620 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_packagedata)
NOTE: recipe python3-3.10.3-r0: task do_packagedata: Succeeded
NOTE: recipe kmod-29-r0: task do_packagedata: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe kmod-29-r0: task do_packagedata: Succeeded
NOTE: recipe coreutils-9.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 502 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.63-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.63-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.63-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.63-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 505 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_package unihash changed to 9b6756009d81a2f18ab4d68449d63a754ed316a3127511f836a7677b949f8c52
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata became valid
NOTE: Running setscene task 505 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gawk-5.1.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_package unihash changed to 6814d7823f3bd563a2b62dd822534d134a71831c27624a8599538918dcf98eb6
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_packagedata became valid
NOTE: Running setscene task 505 of 505 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1678 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_package_write_rpm)
NOTE: Running task 1679 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.0.bb:do_package_write_rpm)
NOTE: Running task 1680 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm)
NOTE: recipe gawk-5.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe coreutils-9.0-r0: task do_package_write_rpm: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm: Started
NOTE: recipe libpcre-8.45-r0: task do_compile: Succeeded
NOTE: Running task 1681 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_compile_ptest_base)
NOTE: recipe libpcre-8.45-r0: task do_compile_ptest_base: Started
NOTE: recipe libpcre-8.45-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1682 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_install)
NOTE: recipe libpcre-8.45-r0: task do_install: Started
NOTE: recipe libpcre-8.45-r0: task do_install: Succeeded
NOTE: Running task 1683 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_install_ptest_base)
NOTE: recipe libpcre-8.45-r0: task do_install_ptest_base: Started
NOTE: recipe libpcre-8.45-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1684 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot)
NOTE: Running task 1685 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_package)
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre-8.45-r0: task do_package: Started
NOTE: recipe gawk-5.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm unihash changed to 6143286e81553b3c5e51ed01180028487cb268df832fa9bb7a60d3140452e4b9
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1686 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1687 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe grep-3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe grep-3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1688 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_configure)
NOTE: recipe grep-3.7-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1689 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_configure)
NOTE: recipe zstd-1.5.2-r0: task do_install: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_configure: Started
NOTE: Running task 1690 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_populate_sysroot)
NOTE: Running task 1691 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_package)
NOTE: recipe icu-70.1-r0: task do_configure: Succeeded
NOTE: Running task 1692 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_compile)
NOTE: recipe zstd-1.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe zstd-1.5.2-r0: task do_package: Started
NOTE: recipe icu-70.1-r0: task do_compile: Started
NOTE: recipe zstd-1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_configure: Succeeded
NOTE: Running task 1693 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_compile)
NOTE: recipe libice-1_1.0.10-r0: task do_compile: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1694 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_install)
NOTE: recipe libice-1_1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 1695 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_install)
NOTE: recipe libseccomp-2.5.3-r0: task do_install: Started
NOTE: recipe libice-1_1.0.10-r0: task do_install: Started
NOTE: recipe libpcre-8.45-r0: task do_package: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_install: Succeeded
NOTE: Running task 1696 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata)
NOTE: Running task 1697 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot)
NOTE: Running task 1698 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_install: Succeeded
NOTE: Running task 1699 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_install_ptest_base)
NOTE: recipe zstd-1.5.2-r0: task do_package: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_install_ptest_base: Started
NOTE: Running task 1700 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_packagedata)
NOTE: recipe zstd-1.5.2-r0: task do_packagedata: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1701 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsm-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.2-r0: task do_packagedata: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1702 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_configure)
NOTE: recipe libsm-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libxcb-1.14-r0: task do_configure: Succeeded
NOTE: Running task 1703 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_compile)
NOTE: recipe libxcb-1.14-r0: task do_compile: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1704 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_populate_sysroot)
NOTE: Running task 1705 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_package)
NOTE: recipe libseccomp-2.5.3-r0: task do_package: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_populate_sysroot: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package: Succeeded
NOTE: Running task 1706 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_compile: Succeeded
NOTE: Running task 1707 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_install)
NOTE: recipe libxcb-1.14-r0: task do_install: Started
NOTE: recipe libxml2-2.9.13-r0: task do_configure: Succeeded
NOTE: Running task 1708 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_configure_ptest_base)
NOTE: recipe libxml2-2.9.13-r0: task do_configure_ptest_base: Started
NOTE: recipe libxml2-2.9.13-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1709 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_compile)
NOTE: recipe libxml2-2.9.13-r0: task do_compile: Started
NOTE: recipe coreutils-9.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.0.bb:do_package_write_rpm unihash changed to 2bef6978765a0ee9d2507b1f3e59f08e4707d729ea746a85353c3755f6c6244b
NOTE: Running task 1710 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_packagedata)
NOTE: recipe libxcb-1.14-r0: task do_install: Succeeded
NOTE: Running task 1711 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot)
NOTE: Running task 1712 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package)
NOTE: recipe libseccomp-2.5.3-r0: task do_packagedata: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot: Started
NOTE: recipe libxcb-1.14-r0: task do_package: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_packagedata: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1713 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1714 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_configure)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_configure: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 1715 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_compile)
NOTE: recipe libsm-1_1.2.3-r0: task do_compile: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 1716 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_install)
NOTE: recipe libsm-1_1.2.3-r0: task do_install: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 1717 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 1718 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package)
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 1719 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package: Succeeded
NOTE: Running task 1720 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata)
NOTE: recipe libxcb-1.14-r0: task do_packagedata: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_configure: Succeeded
NOTE: Running task 1721 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_configure_ptest_base)
NOTE: recipe libxml2-2.9.13-r0: task do_compile: Succeeded
NOTE: Running task 1722 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libxml2-2.9.13-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1723 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_compile)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_compile: Started
NOTE: recipe grep-3.7-r0: task do_configure: Succeeded
NOTE: Running task 1724 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_compile)
NOTE: recipe grep-3.7-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_compile: Succeeded
NOTE: Running task 1725 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1726 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_install)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_install: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_configure: Succeeded
NOTE: Running task 1727 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_compile)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_compile: Started
NOTE: recipe icu-70.1-r0: task do_compile: Succeeded
NOTE: Running task 1728 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_install)
NOTE: recipe icu-70.1-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_install: Succeeded
NOTE: Running task 1729 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1730 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_populate_sysroot)
NOTE: Running task 1731 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_package)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_package: Started
NOTE: recipe grep-3.7-r0: task do_compile: Succeeded
NOTE: Running task 1732 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_install)
NOTE: recipe grep-3.7-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1733 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1734 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1735 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1736 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_configure)
NOTE: recipe vala-0.56.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_configure: Started
NOTE: recipe grep-3.7-r0: task do_install: Succeeded
NOTE: Running task 1737 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_package)
NOTE: recipe icu-70.1-r0: task do_install: Succeeded
NOTE: recipe grep-3.7-r0: task do_package: Started
NOTE: Running task 1738 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_populate_sysroot)
NOTE: Running task 1739 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_package)
NOTE: recipe icu-70.1-r0: task do_populate_sysroot: Started
NOTE: recipe icu-70.1-r0: task do_package: Started
NOTE: recipe icu-70.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe grep-3.7-r0: task do_package: Succeeded
NOTE: Running task 1740 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_packagedata)
NOTE: recipe grep-3.7-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_configure: Succeeded
NOTE: Running task 1741 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_compile: Started
NOTE: recipe grep-3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 1742 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_package_write_rpm)
NOTE: recipe grep-3.7-r0: task do_package_write_rpm: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_compile: Succeeded
NOTE: Running task 1743 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_install)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_install: Started
NOTE: recipe grep-3.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe icu-70.1-r0: task do_package: Succeeded
NOTE: Running task 1744 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_packagedata)
NOTE: recipe icu-70.1-r0: task do_packagedata: Started
NOTE: recipe icu-70.1-r0: task do_packagedata: Succeeded
NOTE: recipe libx11-1_1.7.3.1-r0: task do_install: Succeeded
NOTE: Running task 1745 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_populate_sysroot)
NOTE: Running task 1746 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_package)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_package: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vala-0.56.0-r0: task do_configure: Succeeded
NOTE: Running task 1747 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_compile)
NOTE: recipe vala-0.56.0-r0: task do_compile: Started
NOTE: recipe libxml2-2.9.13-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1748 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_install)
NOTE: recipe libxml2-2.9.13-r0: task do_install: Started
NOTE: recipe libxml2-2.9.13-r0: task do_install: Succeeded
NOTE: Running task 1749 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_install_ptest_base)
NOTE: recipe libxml2-2.9.13-r0: task do_install_ptest_base: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_package: Succeeded
NOTE: Running task 1750 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_packagedata)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_package: Succeeded
NOTE: Running task 1751 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_packagedata)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_packagedata: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1752 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_populate_sysroot)
NOTE: Running task 1753 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_package)
NOTE: recipe libxml2-2.9.13-r0: task do_populate_sysroot: Started
NOTE: recipe libxml2-2.9.13-r0: task do_package: Started
NOTE: recipe libxml2-2.9.13-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1754 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe wayland-1.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-1.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1755 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_configure)
NOTE: recipe wayland-1.20.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_compile: Succeeded
NOTE: Running task 1756 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_install)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_install: Started
NOTE: recipe wayland-1.20.0-r0: task do_configure: Succeeded
NOTE: Running task 1757 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_configure_ptest_base)
NOTE: recipe wayland-1.20.0-r0: task do_configure_ptest_base: Started
NOTE: recipe wayland-1.20.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1758 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_install: Succeeded
NOTE: Running task 1759 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot)
NOTE: Running task 1760 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_package)
NOTE: recipe wayland-1.20.0-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_compile: Succeeded
NOTE: Running task 1761 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_compile_ptest_base)
NOTE: recipe wayland-1.20.0-r0: task do_compile_ptest_base: Started
NOTE: recipe wayland-1.20.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1762 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_install)
NOTE: recipe wayland-1.20.0-r0: task do_install: Started
NOTE: recipe wayland-1.20.0-r0: task do_install: Succeeded
NOTE: Running task 1763 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_install_ptest_base)
NOTE: recipe wayland-1.20.0-r0: task do_install_ptest_base: Started
NOTE: recipe wayland-1.20.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1764 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_populate_sysroot)
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_package: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1765 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata)
NOTE: Running task 1766 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1767 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_configure)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_configure: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1768 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_compile)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1769 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_install)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 1770 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_populate_sysroot)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1771 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-1_250.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-1_250.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1772 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_configure)
NOTE: recipe systemd-1_250.4-r0: task do_configure: Started
NOTE: recipe vala-0.56.0-r0: task do_compile: Succeeded
NOTE: Running task 1773 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_install)
NOTE: recipe vala-0.56.0-r0: task do_install: Started
NOTE: recipe vala-0.56.0-r0: task do_install: Succeeded
NOTE: Running task 1774 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_populate_sysroot)
NOTE: Running task 1775 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_package)
NOTE: recipe vala-0.56.0-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.0-r0: task do_package: Started
NOTE: recipe vala-0.56.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1776 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1777 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_configure)
NOTE: recipe libical-3.0.14-r0: task do_configure: Started
NOTE: recipe libxml2-2.9.13-r0: task do_package: Succeeded
NOTE: Running task 1778 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_packagedata)
NOTE: recipe libxml2-2.9.13-r0: task do_packagedata: Started
NOTE: recipe libxml2-2.9.13-r0: task do_packagedata: Succeeded
NOTE: Running task 1779 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_package)
NOTE: recipe wayland-1.20.0-r0: task do_package: Started
NOTE: recipe vala-0.56.0-r0: task do_package: Succeeded
NOTE: Running task 1780 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_packagedata)
NOTE: recipe vala-0.56.0-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.0-r0: task do_packagedata: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_package: Succeeded
NOTE: Running task 1781 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_packagedata)
NOTE: recipe wayland-1.20.0-r0: task do_packagedata: Started
NOTE: recipe wayland-1.20.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1782 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_package)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_package: Started
NOTE: recipe glibc-locale-2.35-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.35.bb:do_package_write_rpm unihash changed to e92a774aa154168c90679ce40760905c47e1fec06f03abbd6c7598d33686b255
NOTE: recipe libical-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1783 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_compile)
NOTE: recipe libical-3.0.14-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 1784 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_packagedata)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1785 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_install)
NOTE: recipe libical-3.0.14-r0: task do_install: Started
NOTE: recipe libical-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1786 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1787 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_package)
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.14-r0: task do_package: Started
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1788 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_packagedata)
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Started
NOTE: recipe systemd-1_250.4-r0: task do_configure: Succeeded
NOTE: Running task 1789 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_compile)
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe systemd-1_250.4-r0: task do_compile: Started
NOTE: recipe systemd-1_250.4-r0: task do_compile: Succeeded
NOTE: Running task 1790 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_install)
NOTE: recipe systemd-1_250.4-r0: task do_install: Started
NOTE: recipe systemd-1_250.4-r0: task do_install: Succeeded
NOTE: Running task 1791 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_populate_sysroot)
NOTE: Running task 1792 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_package)
NOTE: recipe systemd-1_250.4-r0: task do_package: Started
NOTE: recipe systemd-1_250.4-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-1_250.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1793 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-1.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1794 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_configure)
NOTE: recipe dbus-1.14.0-r0: task do_configure: Started
NOTE: recipe systemd-1_250.4-r0: task do_package: Succeeded
NOTE: Running task 1795 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_packagedata)
NOTE: recipe systemd-1_250.4-r0: task do_packagedata: Started
NOTE: recipe systemd-1_250.4-r0: task do_packagedata: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_configure: Succeeded
NOTE: Running task 1796 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_configure_ptest_base)
NOTE: recipe dbus-1.14.0-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.14.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1797 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_compile)
NOTE: recipe dbus-1.14.0-r0: task do_compile: Started
NOTE: recipe dbus-1.14.0-r0: task do_compile: Succeeded
NOTE: Running task 1798 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_compile_ptest_base)
NOTE: recipe dbus-1.14.0-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.14.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1799 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_install)
NOTE: recipe dbus-1.14.0-r0: task do_install: Started
NOTE: recipe dbus-1.14.0-r0: task do_install: Succeeded
NOTE: Running task 1800 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_install_ptest_base)
NOTE: recipe dbus-1.14.0-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.14.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1801 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_populate_sysroot)
NOTE: Running task 1802 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_package)
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.14.0-r0: task do_package: Started
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1803 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.64-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.64-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1804 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_configure)
NOTE: recipe bluez5-5.64-r0: task do_configure: Started
NOTE: recipe dbus-1.14.0-r0: task do_package: Succeeded
NOTE: Running task 1805 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_packagedata)
NOTE: recipe dbus-1.14.0-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_configure: Succeeded
NOTE: Running task 1806 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.64-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1807 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_compile)
NOTE: recipe bluez5-5.64-r0: task do_compile: Started
NOTE: recipe bluez5-5.64-r0: task do_compile: Succeeded
NOTE: Running task 1808 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_compile_ptest_base: Started
NOTE: recipe bluez5-5.64-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1809 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_install)
NOTE: recipe bluez5-5.64-r0: task do_install: Started
NOTE: recipe bluez5-5.64-r0: task do_install: Succeeded
NOTE: Running task 1810 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.64-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1811 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_populate_sysroot)
NOTE: Running task 1812 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_package)
NOTE: recipe bluez5-5.64-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.64-r0: task do_package: Started
NOTE: recipe bluez5-5.64-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1813 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_prepare_recipe_sysroot)
NOTE: recipe strace-5.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe strace-5.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1814 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_configure)
NOTE: recipe strace-5.17-r0: task do_configure: Started
NOTE: recipe bluez5-5.64-r0: task do_package: Succeeded
NOTE: Running task 1815 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_packagedata)
NOTE: recipe bluez5-5.64-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.64-r0: task do_packagedata: Succeeded
NOTE: recipe strace-5.17-r0: task do_configure: Succeeded
NOTE: Running task 1816 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_configure_ptest_base)
NOTE: recipe strace-5.17-r0: task do_configure_ptest_base: Started
NOTE: recipe strace-5.17-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1817 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_compile)
NOTE: recipe strace-5.17-r0: task do_compile: Started
NOTE: recipe strace-5.17-r0: task do_compile: Succeeded
NOTE: Running task 1818 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_compile_ptest_base)
NOTE: recipe strace-5.17-r0: task do_compile_ptest_base: Started
NOTE: recipe strace-5.17-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1819 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_install)
NOTE: recipe strace-5.17-r0: task do_install: Started
NOTE: recipe strace-5.17-r0: task do_install: Succeeded
NOTE: Running task 1820 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_install_ptest_base)
NOTE: recipe strace-5.17-r0: task do_install_ptest_base: Started
NOTE: recipe strace-5.17-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1821 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_package)
NOTE: Running task 1822 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_populate_sysroot)
NOTE: recipe strace-5.17-r0: task do_package: Started
NOTE: recipe strace-5.17-r0: task do_populate_sysroot: Started
NOTE: recipe strace-5.17-r0: task do_populate_sysroot: Succeeded
NOTE: recipe strace-5.17-r0: task do_package: Succeeded
NOTE: Running task 1823 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_packagedata)
NOTE: recipe strace-5.17-r0: task do_packagedata: Started
NOTE: recipe strace-5.17-r0: task do_packagedata: Succeeded
NOTE: Running task 1824 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_package_write_rpm)
NOTE: Running task 1825 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_package_qa)
NOTE: recipe strace-5.17-r0: task do_package_qa: Started
NOTE: recipe strace-5.17-r0: task do_package_write_rpm: Started
NOTE: recipe strace-5.17-r0: task do_package_write_rpm: Succeeded
NOTE: recipe strace-5.17-r0: task do_package_qa: Succeeded
NOTE: Running noexec task 1826 of 1826 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_build)
NOTE: Tasks Summary: Attempted 1826 tasks of which 1606 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 70 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-src went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbg went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tests went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-2to3 went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asyncio went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-audio went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-codecs went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compile went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compression went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-core went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-crypt went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ctypes went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-curses went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-datetime went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-db went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-debugger went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-difflib went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils-windows went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doctest went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-email went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-fcntl went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-gdbm went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-html went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-idle went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-image went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-io went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-json went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-logging went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mailbox went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-math went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mime went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mmap went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-modules went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-multiprocessing went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netclient went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netserver went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-numbers went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pickle went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkgutil went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-plistlib went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pprint went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-profile went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pydoc went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-resource went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-shell went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-smtpd went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-sqlite3 went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-statistics went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-stringold went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-syslog went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-terminal went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-threading went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tkinter went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unixadmin went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-venv went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xml went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xmlrpc went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3 went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3-staticdev went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ptest went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-staticdev went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dev went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doc went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-locale went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3 went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-misc went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-man went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0894140871958499617==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1641 targets, 50 skipped, 0 masked, 0 errors.
Removing 72 recipes from the core2-32 sysroot...done.
Removing 77 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d31b9d9377484317439d8e4f3d5d49e2fed9f0f1"
workspace            = "master:ee5f9d9fdd7d09aa3a86a19d07e3e64851ddc686"

Initialising tasks...done.
Sstate summary: Wanted 296 Local 183 Mirrors 0 Missed 113 Current 166 (61% match, 75% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 167 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 175 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 176 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 179 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 194 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 197 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 204 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 205 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 208 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 209 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 213 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 216 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_setscene)
NOTE: Running setscene task 218 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 219 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 220 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 223 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 283 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 284 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 289 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 294 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 296 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 304 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 305 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.34.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.34.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.37.4-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 561 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_fetch)
NOTE: recipe liberror-perl-0.17029-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 590 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_fetch)
NOTE: recipe python3-3.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 649 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_write_config)
NOTE: Running task 650 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_fetch)
NOTE: recipe gawk-5.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 682 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_write_config)
NOTE: Running task 687 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_fetch)
NOTE: Running task 688 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_fetch)
NOTE: Running task 689 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_fetch)
NOTE: Running task 690 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_fetch)
NOTE: Running task 691 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_fetch)
NOTE: Running task 692 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_fetch)
NOTE: Running task 694 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_fetch)
NOTE: Running task 695 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_fetch)
NOTE: Running task 696 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: Running task 698 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_fetch)
NOTE: Running task 748 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_fetch)
NOTE: Running task 750 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_fetch)
NOTE: Running task 751 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_fetch)
NOTE: Running task 752 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_fetch)
NOTE: Running task 753 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_fetch)
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 776 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.10.bb:do_fetch)
NOTE: Running task 777 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_fetch)
NOTE: Running task 780 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_write_config)
NOTE: Running task 794 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_fetch)
NOTE: Running task 795 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_fetch)
NOTE: Running task 796 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_fetch)
NOTE: Running task 797 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_fetch)
NOTE: Running task 802 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_fetch)
NOTE: recipe libxml2-2.9.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 812 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_fetch)
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: Running task 813 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 314 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 316 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 319 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 320 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 814 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_fetch)
NOTE: recipe expat-2.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_fetch: Started
NOTE: recipe xorgproto-2021.5-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_write_config: Started
NOTE: recipe xorgproto-2021.5-r0: task do_write_config: Started
NOTE: recipe libxcb-1.14-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_fetch: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_fetch: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_fetch: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_fetch: Started
NOTE: recipe libxcb-1.14-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_fetch: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe dbus-1.14.0-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_fetch: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_fetch: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 323 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_setscene)
NOTE: recipe libical-3.0.14-r0: task do_fetch: Started
NOTE: Running task 822 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_unpack)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.7.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 823 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_unpack)
NOTE: Running task 826 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_unpack)
NOTE: Running task 827 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_unpack)
NOTE: Running task 828 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_unpack)
NOTE: Running task 829 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_unpack)
NOTE: Running task 830 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_unpack)
NOTE: Running task 831 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_unpack)
NOTE: Running task 832 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_unpack)
NOTE: recipe icu-70.1-r0: task do_fetch: Started
NOTE: recipe libical-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 324 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_setscene)
NOTE: Running task 833 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_unpack)
NOTE: Running task 834 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_unpack)
NOTE: Running task 835 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: Running task 836 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_unpack)
NOTE: Running task 837 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_unpack)
NOTE: recipe kmod-29-r0: task do_fetch: Started
NOTE: recipe vala-0.56.0-r0: task do_fetch: Started
NOTE: recipe eudev-3.2.10-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe icu-70.1-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_write_config: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 326 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vala-0.56.0-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_fetch: Started
NOTE: recipe gawk-5.1.1-r0: task do_fetch: Started
NOTE: recipe strace-5.17-r0: task do_fetch: Started
NOTE: recipe libpcre-8.45-r0: task do_fetch: Started
NOTE: Running task 838 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_unpack)
NOTE: recipe libpcre-8.45-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_fetch: Started
NOTE: Running task 839 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_unpack)
NOTE: recipe libxml2-2.9.13-r0: task do_fetch: Succeeded
NOTE: recipe kmod-29-r0: task do_fetch: Succeeded
NOTE: Running task 840 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_unpack)
NOTE: recipe liberror-perl-0.17029-r0: task do_fetch: Started
NOTE: recipe grep-3.7-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_fetch: Started
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Started
NOTE: Running task 841 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_unpack)
NOTE: recipe perl-5.34.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gawk-5.1.1-r0: task do_fetch: Succeeded
NOTE: recipe strace-5.17-r0: task do_fetch: Succeeded
NOTE: Running task 842 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_unpack)
NOTE: recipe bluez5-5.64-r0: task do_fetch: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_fetch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Succeeded
NOTE: recipe grep-3.7-r0: task do_fetch: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_unpack: Started
NOTE: Running task 843 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_unpack)
NOTE: Running task 844 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_unpack)
NOTE: Running task 845 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_unpack)
NOTE: recipe libxau-1_1.0.9-r0: task do_unpack: Started
NOTE: Running task 846 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_unpack)
NOTE: Running task 847 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_unpack)
NOTE: Running task 848 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_unpack)
NOTE: recipe coreutils-9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_unpack: Started
NOTE: Running task 849 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_unpack)
NOTE: Running setscene task 327 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.0.bb:do_package_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_unpack: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Started
NOTE: recipe libice-1_1.0.10-r0: task do_unpack: Started
NOTE: recipe libxcb-1.14-r0: task do_unpack: Started
NOTE: Running task 850 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_unpack)
NOTE: Running task 851 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_patch)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_write_config: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_unpack: Started
NOTE: Running task 852 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_fetch)
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Succeeded
NOTE: recipe libx11-1_1.7.3.1-r0: task do_unpack: Started
NOTE: Running task 853 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r3: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_unpack: Started
NOTE: Running task 854 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_patch)
NOTE: recipe shadow-4.11.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 855 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_patch)
NOTE: recipe dbus-1.14.0-r0: task do_unpack: Started
NOTE: recipe libical-3.0.14-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_unpack: Succeeded
NOTE: Running task 856 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_patch)
NOTE: recipe icu-70.1-r0: task do_unpack: Started
NOTE: recipe vala-0.56.0-r0: task do_unpack: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_unpack: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_unpack: Started
NOTE: recipe libxml2-2.9.13-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_unpack: Started
NOTE: recipe libpcre-8.45-r0: task do_unpack: Started
NOTE: Running task 857 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_patch)
NOTE: recipe libsm-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe gawk-5.1.1-r0: task do_unpack: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_unpack: Started
NOTE: Running task 858 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_patch)
NOTE: recipe grep-3.7-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_unpack: Succeeded
NOTE: recipe strace-5.17-r0: task do_unpack: Started
NOTE: recipe shadow-4.11.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 863 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_patch)
NOTE: Running task 864 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_patch)
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: Running task 865 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r3: task do_patch: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_unpack: Started
NOTE: Running task 866 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_patch)
NOTE: recipe libxcb-1.14-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.10.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r155: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_unpack: Succeeded
NOTE: Running task 867 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_patch)
NOTE: recipe libical-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 868 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 869 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 870 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_patch)
NOTE: recipe libxau-1_1.0.9-r0: task do_patch: Started
NOTE: Running task 871 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_patch)
NOTE: recipe sed-4.8-r0: task do_package_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_fetch: Succeeded
NOTE: recipe make-4.3-r0: task do_package_setscene: Started
NOTE: Running task 872 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_unpack)
NOTE: Running task 873 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe psmisc-23.4-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3/3.10.3-r0/temp/log.do_packagedata_setscene.1445092
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_patch: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 332 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_package_setscene)
NOTE: recipe xorgproto-2021.5-r0: task do_unpack: Succeeded
NOTE: recipe coreutils-9.0-r0: task do_package_setscene: Started
NOTE: Running task 878 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_patch: Started
NOTE: recipe shadow-4.11.1-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_patch: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcb-1.14-r0: task do_patch: Started
NOTE: recipe libice-1_1.0.10-r0: task do_patch: Started
NOTE: Running task 879 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch)
NOTE: recipe shadow-sysroot-4.6-r3: task do_patch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: Running task 880 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe shadow-4.11.1-r0: task do_fetch: Succeeded
NOTE: Running task 881 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_patch: Started
NOTE: Running task 882 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_unpack)
NOTE: recipe libxau-1_1.0.9-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_unpack: Succeeded
NOTE: Running task 883 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe liberror-perl-0.17029-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_unpack: Succeeded
NOTE: recipe libx11-1_1.7.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 884 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_patch)
NOTE: recipe initscripts-1.0-r155: task do_prepare_recipe_sysroot: Started
NOTE: recipe initscripts-1.0-r155: task do_unpack: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_patch: Succeeded
NOTE: recipe kmod-29-r0: task do_unpack: Succeeded
NOTE: Running task 885 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_patch)
NOTE: Running task 886 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_patch)
NOTE: recipe libsm-1_1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 887 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch)
NOTE: recipe initscripts-1.0-r155: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 888 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_patch)
NOTE: Running task 889 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe xorgproto-2021.5-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_patch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe grep-3.7-r0: task do_unpack: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 890 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe gawk-5.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 891 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_patch)
NOTE: recipe libice-1_1.0.10-r0: task do_patch: Succeeded
NOTE: Running task 892 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_patch)
NOTE: Running task 893 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcb-1.14-r0: task do_patch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_patch: Succeeded
NOTE: Running task 894 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 895 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-passwd-3.5.29-r0: task do_package_setscene: Succeeded
NOTE: Running task 896 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe shadow-4.11.1-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_patch: Started
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_patch: Started
NOTE: recipe python3-3.10.3-r0: task do_package_setscene: Started
NOTE: recipe dbus-1.14.0-r0: task do_patch: Started
NOTE: recipe xorgproto-2021.5-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_unpack: Succeeded
NOTE: Running task 902 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_patch)
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kmod-29-r0: task do_patch: Started
NOTE: Running setscene task 335 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 336 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 337 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 338 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 339 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bluez5-5.64-r0: task do_unpack: Succeeded
NOTE: Running task 903 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_patch)
NOTE: Running task 904 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libical-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 905 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_patch)
NOTE: Running task 906 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_generate_toolchain_file)
NOTE: Running task 907 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe grep-3.7-r0: task do_patch: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gawk-5.1.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_patch: Started
NOTE: recipe vala-0.56.0-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.7.3.1-r0: task do_patch: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 908 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_patch)
NOTE: recipe dbus-1.14.0-r0: task do_patch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_patch: Started
NOTE: Running task 909 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Started
NOTE: Running task 910 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_deploy_source_date_epoch)
NOTE: recipe make-4.3-r0: task do_package_setscene: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 911 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_patch: Started
NOTE: Running setscene task 340 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-29-r0: task do_patch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_patch: Succeeded
NOTE: Running task 912 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_deploy_source_date_epoch)
NOTE: recipe initscripts-1.0-r155: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe grep-3.7-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running task 914 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_patch)
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 915 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 917 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe sed-4.8-r0: task do_package_setscene: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_unpack: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 918 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_fetch)
NOTE: recipe gawk-5.1.1-r0: task do_patch: Succeeded
NOTE: Running task 919 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libx11-1_1.7.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 341 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vala-0.56.0-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre-8.45-r0: task do_patch: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_patch: Started
NOTE: recipe strace-5.17-r0: task do_unpack: Succeeded
NOTE: Running task 926 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_patch)
NOTE: recipe vala-0.56.0-r0: task do_patch: Succeeded
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe grep-3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 927 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xorgproto-2021.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_unpack: Succeeded
NOTE: Running task 932 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_patch)
NOTE: recipe shadow-4.11.1-r0: task do_patch: Started
NOTE: recipe libxml2-2.9.13-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_fetch: Started
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 933 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: recipe make-4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.37.4-r0: task do_fetch: Succeeded
NOTE: Running task 935 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: Running task 939 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_unpack)
NOTE: recipe strace-5.17-r0: task do_patch: Started
NOTE: recipe bluez5-5.64-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 940 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sed-4.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_patch: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_patch: Started
NOTE: recipe dbus-1.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 946 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_configure)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe grep-3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe eudev-3.2.10-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_unpack: Started
NOTE: Running task 947 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.10.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 948 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe initscripts-1.0-r155: task do_configure: Started
NOTE: recipe vala-0.56.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe eudev-3.2.10-r0: task do_unpack: Started
NOTE: recipe shadow-4.11.1-r0: task do_patch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_configure: Succeeded
NOTE: Running task 950 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe bluez5-5.64-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_compile: Started
NOTE: recipe initscripts-1.0-r155: task do_compile: Succeeded
NOTE: recipe eudev-3.2.10-r0: task do_unpack: Succeeded
NOTE: Running task 951 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_install)
NOTE: Running task 952 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.10.bb:do_patch)
NOTE: recipe strace-5.17-r0: task do_patch: Succeeded
NOTE: Running task 953 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_deploy_source_date_epoch)
NOTE: Running task 954 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_populate_lic)
NOTE: recipe eudev-3.2.10-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r155: task do_install: Started
NOTE: recipe strace-5.17-r0: task do_populate_lic: Started
NOTE: recipe strace-5.17-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_patch: Succeeded
NOTE: recipe icu-70.1-r0: task do_unpack: Succeeded
NOTE: Running task 958 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_patch)
NOTE: recipe strace-5.17-r0: task do_populate_lic: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_patch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_populate_lic unihash changed to a6b1df75dc53be8b6056177243ab303fc454edc85216acd9842c7d42cddd6bdb
NOTE: recipe eudev-3.2.10-r0: task do_patch: Succeeded
NOTE: recipe strace-5.17-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 960 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe icu-70.1-r0: task do_patch: Started
NOTE: recipe util-linux-2.37.4-r0: task do_unpack: Succeeded
NOTE: Running task 961 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_patch)
NOTE: recipe coreutils-9.0-r0: task do_package_setscene: Succeeded
NOTE: recipe eudev-3.2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 346 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 347 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 349 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.37.4-r0: task do_patch: Started
NOTE: recipe libcap-2.63-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe eudev-3.2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe icu-70.1-r0: task do_patch: Succeeded
NOTE: recipe coreutils-9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 962 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libcap-2.63-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 354 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 355 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 361 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-70.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.37.4-r0: task do_patch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-70.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_install: Succeeded
NOTE: recipe python3-3.10.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 365 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 366 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 367 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 368 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 369 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 372 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 373 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 374 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 375 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 376 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 377 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 378 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 379 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 380 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 381 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 383 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.38.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 389 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 393 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 394 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 397 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 398 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 399 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 400 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.38.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.34.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 411 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 415 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 417 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 421 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 422 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 426 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 430 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-11.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 432 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-11.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 435 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-11.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 437 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-11.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 439 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+6d8a515796-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+6d8a515796-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 441 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 442 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe libgcc-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 444 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+6d8a515796-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+6d8a515796-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 449 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 450 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 456 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 459 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 460 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1215 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1216 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1267 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1270 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1292 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot)
NOTE: Running task 1297 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpcre-8.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-2.37.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2021.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1298 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1299 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1300 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1302 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1303 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1309 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1310 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1341 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1376 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1386 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_packagedata)
NOTE: Running task 1387 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1406 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata)
NOTE: recipe libpthread-stubs-0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxml2-2.9.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 1437 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm)
NOTE: recipe shadow-4.11.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe icu-70.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kmod-29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gawk-5.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcre-8.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata: Started
NOTE: Running task 1439 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_configure)
NOTE: recipe util-macros-1_1.19.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1440 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_configure)
NOTE: recipe util-linux-2.37.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1441 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_configure)
NOTE: recipe make-4.3-r0: task do_package_write_rpm: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1442 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_configure)
NOTE: recipe python3-3.10.3-r0: task do_packagedata: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_configure: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_configure: Started
NOTE: Running task 1443 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_configure)
NOTE: recipe xorgproto-2021.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_configure: Started
NOTE: Running task 1444 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_configure)
NOTE: recipe shadow-4.11.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_configure: Started
NOTE: Running task 1445 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_configure)
NOTE: recipe icu-70.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gawk-5.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_configure: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_configure: Succeeded
NOTE: Running task 1446 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_make_icudata)
NOTE: recipe findutils-4.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1447 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_configure)
NOTE: Running task 1448 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_configure)
NOTE: Running task 1449 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_compile)
NOTE: recipe xorgproto-2021.5-r0: task do_configure: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1450 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_configure)
NOTE: Running task 1451 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_configure: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_compile: Started
NOTE: recipe icu-70.1-r0: task do_make_icudata: Started
NOTE: recipe gawk-5.1.1-r0: task do_configure: Started
NOTE: recipe kmod-29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1452 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_configure)
NOTE: recipe shadow-sysroot-4.6-r3: task do_compile: Succeeded
NOTE: Running task 1453 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_configure)
NOTE: Running task 1454 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_install)
NOTE: recipe findutils-4.9.0-r0: task do_configure: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_configure: Started
NOTE: recipe icu-70.1-r0: task do_make_icudata: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_configure: Started
NOTE: Running task 1455 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_configure)
NOTE: recipe shadow-sysroot-4.6-r3: task do_install: Started
NOTE: recipe kmod-29-r0: task do_configure: Started
NOTE: recipe libxml2-2.9.13-r0: task do_configure: Started
NOTE: recipe icu-70.1-r0: task do_configure: Started
NOTE: recipe python3-3.10.3-r0: task do_packagedata: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_install: Succeeded
NOTE: Running task 1456 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot)
NOTE: recipe liberror-perl-0.17029-r0: task do_configure: Succeeded
NOTE: Running task 1457 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure_ptest_base)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_configure_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1458 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_compile: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_compile: Succeeded
NOTE: Running task 1459 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile_ptest_base)
NOTE: recipe liberror-perl-0.17029-r0: task do_compile_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1460 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install)
NOTE: recipe liberror-perl-0.17029-r0: task do_install: Started
NOTE: recipe xorgproto-2021.5-r0: task do_configure: Succeeded
NOTE: Running task 1461 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_compile)
NOTE: recipe liberror-perl-0.17029-r0: task do_install: Succeeded
NOTE: Running task 1462 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_base)
NOTE: recipe xorgproto-2021.5-r0: task do_compile: Started
NOTE: recipe xorgproto-2021.5-r0: task do_compile: Succeeded
NOTE: Running task 1463 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_install)
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1464 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_perl)
NOTE: recipe xorgproto-2021.5-r0: task do_install: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_perl: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_perl: Succeeded
NOTE: Running task 1465 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package)
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_configure: Succeeded
NOTE: Running task 1466 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_compile)
NOTE: recipe util-macros-1_1.19.3-r0: task do_compile: Started
NOTE: recipe xorgproto-2021.5-r0: task do_install: Succeeded
NOTE: Running task 1467 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_populate_sysroot)
NOTE: Running task 1468 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_package)
NOTE: recipe util-macros-1_1.19.3-r0: task do_compile: Succeeded
NOTE: Running task 1469 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_install)
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2021.5-r0: task do_package: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_install: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_configure: Succeeded
NOTE: Running task 1470 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_compile)
NOTE: recipe util-macros-1_1.19.3-r0: task do_install: Succeeded
NOTE: Running task 1471 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot)
NOTE: Running task 1472 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package)
NOTE: recipe xcb-proto-1.14.1-r0: task do_compile: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_compile: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot: Started
NOTE: Running task 1473 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_install)
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_package: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_install: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1474 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1475 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpthread-stubs-0.4-r0: task do_configure: Succeeded
NOTE: Running task 1476 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1477 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_compile)
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_compile: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_compile: Succeeded
NOTE: Running task 1478 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_install)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package unihash changed to 7237bf3ace53475c5a0d1572dd69bfb296cfb9ea14ac86e9ce68c9d63f626aff
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata became valid
NOTE: Running setscene task 462 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_install: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1479 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_configure)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1480 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_configure)
NOTE: Running task 1481 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_configure)
NOTE: recipe xcb-proto-1.14.1-r0: task do_install: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Started
NOTE: Running task 1482 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot)
NOTE: Running task 1483 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libpthread-stubs-0.4-r0: task do_install: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_configure: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_configure: Started
NOTE: Running task 1485 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot)
NOTE: Running task 1486 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package)
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package: Started
NOTE: recipe xorgproto-2021.5-r0: task do_package: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Started
NOTE: Running task 1487 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_packagedata)
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_package: Succeeded
NOTE: Running task 1488 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package: Succeeded
NOTE: Running task 1489 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata)
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Succeeded
NOTE: Running task 1490 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata)
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Succeeded
NOTE: recipe icu-70.1-r0: task do_configure: Succeeded
NOTE: Running task 1491 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_compile)
NOTE: recipe icu-70.1-r0: task do_compile: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1492 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_compile)
NOTE: recipe xtrans-1_1.4.0-r0: task do_compile: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1493 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_install)
NOTE: recipe xtrans-1_1.4.0-r0: task do_install: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_install: Succeeded
NOTE: Running task 1494 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 1495 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre-8.45-r0: task do_configure: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Started
NOTE: Running task 1496 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_configure_ptest_base)
NOTE: recipe libpcre-8.45-r0: task do_configure_ptest_base: Started
NOTE: recipe libpcre-8.45-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1497 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_compile)
NOTE: recipe libpcre-8.45-r0: task do_compile: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1498 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libice-1_1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libice-1_1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1499 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_configure)
NOTE: recipe libice-1_1.0.10-r0: task do_configure: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Succeeded
NOTE: Running task 1500 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_configure: Succeeded
NOTE: Running task 1501 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_configure_ptest_base)
NOTE: recipe libxml2-2.9.13-r0: task do_configure_ptest_base: Started
NOTE: recipe libxml2-2.9.13-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1502 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_compile)
NOTE: recipe libxml2-2.9.13-r0: task do_compile: Started
NOTE: recipe kmod-29-r0: task do_configure: Succeeded
NOTE: Running task 1503 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_compile)
NOTE: recipe kmod-29-r0: task do_compile: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_configure: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_configure: Succeeded
NOTE: Running task 1504 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_compile)
NOTE: Running task 1505 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_compile)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_compile: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_compile: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_compile: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_compile: Succeeded
NOTE: Running task 1506 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_install)
NOTE: Running task 1507 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_install)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_install: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_install: Started
NOTE: recipe kmod-29-r0: task do_compile: Succeeded
NOTE: Running task 1508 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_install)
NOTE: recipe libxau-1_1.0.9-r0: task do_install: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_install: Succeeded
NOTE: Running task 1509 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot)
NOTE: Running task 1510 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package)
NOTE: Running task 1511 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot)
NOTE: Running task 1512 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package)
NOTE: recipe kmod-29-r0: task do_install: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1513 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmod-29-r0: task do_install: Succeeded
NOTE: Running task 1514 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_populate_sysroot)
NOTE: Running task 1515 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_package)
NOTE: recipe libxcb-1.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot: Started
NOTE: recipe kmod-29-r0: task do_package: Started
NOTE: recipe libxcb-1.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1516 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_configure)
NOTE: recipe shadow-4.11.1-r0: task do_configure: Succeeded
NOTE: Running task 1517 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_compile)
NOTE: recipe libxcb-1.14-r0: task do_configure: Started
NOTE: recipe shadow-4.11.1-r0: task do_compile: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package: Succeeded
NOTE: Running task 1518 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata)
NOTE: recipe libxau-1_1.0.9-r0: task do_package: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata: Started
NOTE: Running task 1519 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata)
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata: Started
NOTE: recipe libpcre-8.45-r0: task do_compile: Succeeded
NOTE: recipe kmod-29-r0: task do_package: Succeeded
NOTE: Running task 1520 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_compile_ptest_base)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1521 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_packagedata)
NOTE: recipe libpcre-8.45-r0: task do_compile_ptest_base: Started
NOTE: recipe kmod-29-r0: task do_packagedata: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1522 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_install)
NOTE: recipe libpcre-8.45-r0: task do_install: Started
NOTE: recipe kmod-29-r0: task do_packagedata: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_install: Succeeded
NOTE: Running task 1523 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_install_ptest_base)
NOTE: recipe shadow-4.11.1-r0: task do_compile: Succeeded
NOTE: Running task 1524 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_install)
NOTE: recipe libpcre-8.45-r0: task do_install_ptest_base: Started
NOTE: recipe libpcre-8.45-r0: task do_install_ptest_base: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_install: Started
NOTE: Running task 1525 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot)
NOTE: Running task 1526 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_package)
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre-8.45-r0: task do_package: Started
NOTE: recipe libice-1_1.0.10-r0: task do_configure: Succeeded
NOTE: Running task 1527 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_compile)
NOTE: recipe libice-1_1.0.10-r0: task do_compile: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1528 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe grep-3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gawk-5.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1529 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_configure_ptest_base)
NOTE: recipe grep-3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1530 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_configure)
NOTE: recipe gawk-5.1.1-r0: task do_configure_ptest_base: Started
NOTE: recipe grep-3.7-r0: task do_configure: Started
NOTE: recipe gawk-5.1.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1531 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_compile)
NOTE: recipe gawk-5.1.1-r0: task do_compile: Started
NOTE: recipe shadow-4.11.1-r0: task do_install: Succeeded
NOTE: Running task 1532 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_populate_sysroot)
NOTE: recipe libice-1_1.0.10-r0: task do_compile: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot: Started
NOTE: Running task 1535 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_install)
NOTE: recipe libice-1_1.0.10-r0: task do_install: Started
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_install: Succeeded
NOTE: Running task 1536 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot)
NOTE: Running task 1537 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1538 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsm-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1539 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_configure)
NOTE: recipe libsm-1_1.2.3-r0: task do_configure: Started
NOTE: recipe util-linux-2.37.4-r0: task do_configure: Succeeded
NOTE: Running task 1540 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_configure_ptest_base)
NOTE: recipe libpcre-8.45-r0: task do_package: Succeeded
NOTE: Running task 1541 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata)
NOTE: recipe util-linux-2.37.4-r0: task do_configure_ptest_base: Started
NOTE: recipe util-linux-2.37.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1542 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_compile)
NOTE: recipe libpcre-8.45-r0: task do_packagedata: Started
NOTE: recipe util-linux-2.37.4-r0: task do_compile: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package: Succeeded
NOTE: Running task 1543 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_compile: Succeeded
NOTE: Running task 1544 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_compile_ptest_base)
NOTE: recipe libxml2-2.9.13-r0: task do_compile_ptest_base: Started
NOTE: recipe util-linux-2.37.4-r0: task do_compile: Succeeded
NOTE: Running task 1545 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_compile_ptest_base)
NOTE: recipe util-linux-2.37.4-r0: task do_compile_ptest_base: Started
NOTE: recipe gawk-5.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1546 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_compile_ptest_base)
NOTE: recipe gawk-5.1.1-r0: task do_compile_ptest_base: Started
NOTE: recipe gawk-5.1.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1547 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_install)
NOTE: recipe gawk-5.1.1-r0: task do_install: Started
NOTE: recipe libxcb-1.14-r0: task do_configure: Succeeded
NOTE: Running task 1548 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_compile)
NOTE: recipe libxcb-1.14-r0: task do_compile: Started
NOTE: recipe gawk-5.1.1-r0: task do_install: Succeeded
NOTE: Running task 1549 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_install_ptest_base)
NOTE: recipe gawk-5.1.1-r0: task do_install_ptest_base: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 1550 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_compile)
NOTE: recipe libsm-1_1.2.3-r0: task do_compile: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 1551 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_install)
NOTE: recipe libsm-1_1.2.3-r0: task do_install: Started
NOTE: recipe libxcb-1.14-r0: task do_compile: Succeeded
NOTE: Running task 1552 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_install)
NOTE: recipe libxcb-1.14-r0: task do_install: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 1553 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 1554 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package)
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gawk-5.1.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1555 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_package)
NOTE: recipe gawk-5.1.1-r0: task do_package: Started
NOTE: recipe findutils-4.9.0-r0: task do_configure: Succeeded
NOTE: Running task 1556 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_configure_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_configure_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 1557 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_compile)
NOTE: Running task 1558 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata)
NOTE: recipe findutils-4.9.0-r0: task do_compile: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_install: Succeeded
NOTE: Running task 1559 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot)
NOTE: Running task 1560 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package)
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot: Started
NOTE: recipe libxcb-1.14-r0: task do_package: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1561 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1562 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_configure)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_configure: Started
NOTE: recipe icu-70.1-r0: task do_compile: Succeeded
NOTE: Running task 1563 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_install)
NOTE: recipe icu-70.1-r0: task do_install: Started
NOTE: recipe gawk-5.1.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_package unihash changed to 962850eb44b9956a4d12aac431c2af2f9787fa3f1e44844103514fa411c6c71d
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_packagedata became valid
NOTE: Running setscene task 462 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1565 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm)
NOTE: Running task 1566 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_package_write_rpm)
NOTE: recipe sed-4.8-r0: task do_package_write_rpm: Started
NOTE: recipe gawk-5.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe findutils-4.9.0-r0: task do_compile: Succeeded
NOTE: Running task 1567 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_compile_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_compile_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1568 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_install)
NOTE: recipe findutils-4.9.0-r0: task do_install: Started
NOTE: recipe icu-70.1-r0: task do_install: Succeeded
NOTE: Running task 1569 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_populate_sysroot)
NOTE: Running task 1570 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_package)
NOTE: recipe icu-70.1-r0: task do_populate_sysroot: Started
NOTE: recipe icu-70.1-r0: task do_package: Started
NOTE: recipe gawk-5.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm unihash changed to df8b93ce41376d1923e792a8be6c43b3429f29e8e4e1abcb8e65cd78a675533e
NOTE: recipe findutils-4.9.0-r0: task do_install: Succeeded
NOTE: recipe icu-70.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1571 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_install_ptest_base)
NOTE: recipe findutils-4.9.0-r0: task do_install_ptest_base: Started
NOTE: recipe findutils-4.9.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1572 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_package)
NOTE: recipe findutils-4.9.0-r0: task do_package: Started
NOTE: recipe libxcb-1.14-r0: task do_package: Succeeded
NOTE: Running task 1573 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata)
NOTE: recipe libxcb-1.14-r0: task do_packagedata: Started
NOTE: recipe grep-3.7-r0: task do_configure: Succeeded
NOTE: Running task 1574 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_compile)
NOTE: recipe grep-3.7-r0: task do_compile: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_package unihash changed to e73e734cd66d8bfca62010d31d1f19773752adb82be6a9aafff2cdaaeaf229f8
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata became valid
NOTE: Running setscene task 462 of 462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1576 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.0.bb:do_package_write_rpm)
NOTE: recipe coreutils-9.0-r0: task do_package_write_rpm: Started
NOTE: recipe icu-70.1-r0: task do_package: Succeeded
NOTE: Running task 1577 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_packagedata)
NOTE: recipe icu-70.1-r0: task do_packagedata: Started
NOTE: recipe icu-70.1-r0: task do_packagedata: Succeeded
NOTE: recipe grep-3.7-r0: task do_compile: Succeeded
NOTE: Running task 1578 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_install)
NOTE: recipe util-linux-2.37.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1579 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_install)
NOTE: recipe grep-3.7-r0: task do_install: Started
NOTE: recipe util-linux-2.37.4-r0: task do_install: Started
NOTE: recipe libxml2-2.9.13-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe grep-3.7-r0: task do_install: Succeeded
NOTE: Running task 1580 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_install)
NOTE: Running task 1581 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_package)
NOTE: recipe grep-3.7-r0: task do_package: Started
NOTE: recipe libxml2-2.9.13-r0: task do_install: Started
NOTE: recipe util-linux-2.37.4-r0: task do_install: Succeeded
NOTE: Running task 1582 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_install_ptest_base)
NOTE: recipe util-linux-2.37.4-r0: task do_install_ptest_base: Started
NOTE: recipe libxml2-2.9.13-r0: task do_install: Succeeded
NOTE: Running task 1583 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_install_ptest_base)
NOTE: recipe libxml2-2.9.13-r0: task do_install_ptest_base: Started
NOTE: recipe util-linux-2.37.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1584 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_populate_sysroot)
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot: Started
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1587 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1588 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_configure)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_configure: Started
NOTE: recipe grep-3.7-r0: task do_package: Succeeded
NOTE: Running task 1589 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_packagedata)
NOTE: recipe grep-3.7-r0: task do_packagedata: Started
NOTE: recipe libxml2-2.9.13-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1590 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_populate_sysroot)
NOTE: Running task 1591 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_package)
NOTE: recipe libxml2-2.9.13-r0: task do_populate_sysroot: Started
NOTE: recipe libxml2-2.9.13-r0: task do_package: Started
NOTE: recipe grep-3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 1592 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_package_write_rpm)
NOTE: recipe grep-3.7-r0: task do_package_write_rpm: Started
NOTE: recipe libxml2-2.9.13-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libx11-1_1.7.3.1-r0: task do_configure: Succeeded
NOTE: Running task 1593 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_compile)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_compile: Started
NOTE: recipe grep-3.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe coreutils-9.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.0.bb:do_package_write_rpm unihash changed to 1c2ef1255aed6a92352a4e5aa59b573721a9b30c7c4ecab7c4fb1151d0265d7c
NOTE: recipe libx11-1_1.7.3.1-r0: task do_compile: Succeeded
NOTE: Running task 1594 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_install)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_install: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_install: Succeeded
NOTE: Running task 1595 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_populate_sysroot)
NOTE: Running task 1596 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_package)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_configure: Succeeded
NOTE: Running task 1597 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1598 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_compile)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_compile: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_package: Succeeded
NOTE: Running task 1599 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_packagedata)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_packagedata: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_package: Succeeded
NOTE: Running task 1600 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_packagedata)
NOTE: recipe libxml2-2.9.13-r0: task do_packagedata: Started
NOTE: recipe libxml2-2.9.13-r0: task do_packagedata: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_compile: Succeeded
NOTE: Running task 1601 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1602 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_install)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_install: Succeeded
NOTE: Running task 1603 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1604 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_populate_sysroot)
NOTE: Running task 1605 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_package)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1606 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1607 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1608 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1609 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe eudev-3.2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1610 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_configure)
NOTE: recipe eudev-3.2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1611 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.10.bb:do_configure)
NOTE: recipe dbus-1.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1612 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1613 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_configure)
NOTE: recipe vala-0.56.0-r0: task do_configure: Started
NOTE: recipe eudev-3.2.10-r0: task do_configure: Started
NOTE: recipe dbus-1.14.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_configure: Succeeded
NOTE: Running task 1614 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_compile: Started
NOTE: recipe vala-0.56.0-r0: task do_configure: Succeeded
NOTE: Running task 1615 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_compile)
NOTE: recipe vala-0.56.0-r0: task do_compile: Started
NOTE: recipe eudev-3.2.10-r0: task do_configure: Succeeded
NOTE: Running task 1616 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.10.bb:do_compile)
NOTE: recipe eudev-3.2.10-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_package: Succeeded
NOTE: Running task 1617 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_packagedata: Succeeded
NOTE: recipe eudev-3.2.10-r0: task do_compile: Succeeded
NOTE: Running task 1618 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.10.bb:do_install)
NOTE: recipe eudev-3.2.10-r0: task do_install: Started
NOTE: recipe eudev-3.2.10-r0: task do_install: Succeeded
NOTE: Running task 1619 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.10.bb:do_populate_sysroot)
NOTE: Running task 1620 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.10.bb:do_package)
NOTE: recipe eudev-3.2.10-r0: task do_populate_sysroot: Started
NOTE: recipe eudev-3.2.10-r0: task do_package: Started
NOTE: recipe eudev-3.2.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_configure: Succeeded
NOTE: Running task 1621 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_configure_ptest_base)
NOTE: recipe dbus-1.14.0-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.14.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1622 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_compile)
NOTE: recipe dbus-1.14.0-r0: task do_compile: Started
NOTE: recipe eudev-3.2.10-r0: task do_package: Succeeded
NOTE: Running task 1623 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.10.bb:do_packagedata)
NOTE: recipe eudev-3.2.10-r0: task do_packagedata: Started
NOTE: recipe eudev-3.2.10-r0: task do_packagedata: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_compile: Succeeded
NOTE: Running task 1624 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_install)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_install: Succeeded
NOTE: Running task 1625 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot)
NOTE: Running task 1626 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_package)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_package: Succeeded
NOTE: Running task 1627 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_compile: Succeeded
NOTE: Running task 1628 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_compile_ptest_base)
NOTE: recipe dbus-1.14.0-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.14.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1629 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_install)
NOTE: recipe dbus-1.14.0-r0: task do_install: Started
NOTE: recipe dbus-1.14.0-r0: task do_install: Succeeded
NOTE: Running task 1630 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_install_ptest_base)
NOTE: recipe dbus-1.14.0-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.14.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1631 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_populate_sysroot)
NOTE: Running task 1632 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_package)
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.14.0-r0: task do_package: Started
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vala-0.56.0-r0: task do_compile: Succeeded
NOTE: Running task 1633 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_install)
NOTE: recipe vala-0.56.0-r0: task do_install: Started
NOTE: recipe dbus-1.14.0-r0: task do_package: Succeeded
NOTE: Running task 1634 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_packagedata)
NOTE: recipe dbus-1.14.0-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.0-r0: task do_install: Succeeded
NOTE: Running task 1635 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_populate_sysroot)
NOTE: Running task 1636 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_package)
NOTE: recipe vala-0.56.0-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.0-r0: task do_package: Started
NOTE: recipe dbus-1.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe vala-0.56.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1637 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1638 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_configure)
NOTE: recipe libical-3.0.14-r0: task do_configure: Started
NOTE: recipe vala-0.56.0-r0: task do_package: Succeeded
NOTE: Running task 1639 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_packagedata)
NOTE: recipe vala-0.56.0-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.0-r0: task do_packagedata: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1640 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_compile)
NOTE: recipe libical-3.0.14-r0: task do_compile: Started
NOTE: recipe libical-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1641 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_install)
NOTE: recipe libical-3.0.14-r0: task do_install: Started
NOTE: recipe libical-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1642 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1643 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_package)
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.14-r0: task do_package: Started
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1644 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.64-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.64-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1645 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_configure)
NOTE: recipe bluez5-5.64-r0: task do_configure: Started
NOTE: recipe libical-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1646 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_packagedata)
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_configure: Succeeded
NOTE: Running task 1647 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.64-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1648 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_compile)
NOTE: recipe bluez5-5.64-r0: task do_compile: Started
NOTE: recipe bluez5-5.64-r0: task do_compile: Succeeded
NOTE: Running task 1649 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_compile_ptest_base: Started
NOTE: recipe bluez5-5.64-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1650 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_install)
NOTE: recipe bluez5-5.64-r0: task do_install: Started
NOTE: recipe bluez5-5.64-r0: task do_install: Succeeded
NOTE: Running task 1651 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.64-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1652 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_populate_sysroot)
NOTE: Running task 1653 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_package)
NOTE: recipe bluez5-5.64-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.64-r0: task do_package: Started
NOTE: recipe bluez5-5.64-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1654 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_prepare_recipe_sysroot)
NOTE: recipe strace-5.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe strace-5.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1655 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_configure)
NOTE: recipe strace-5.17-r0: task do_configure: Started
NOTE: recipe bluez5-5.64-r0: task do_package: Succeeded
NOTE: Running task 1656 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_packagedata)
NOTE: recipe bluez5-5.64-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.64-r0: task do_packagedata: Succeeded
NOTE: recipe strace-5.17-r0: task do_configure: Succeeded
NOTE: Running task 1657 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_configure_ptest_base)
NOTE: recipe strace-5.17-r0: task do_configure_ptest_base: Started
NOTE: recipe strace-5.17-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1658 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_compile)
NOTE: recipe strace-5.17-r0: task do_compile: Started
NOTE: recipe strace-5.17-r0: task do_compile: Succeeded
NOTE: Running task 1659 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_compile_ptest_base)
NOTE: recipe strace-5.17-r0: task do_compile_ptest_base: Started
NOTE: recipe strace-5.17-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1660 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_install)
NOTE: recipe strace-5.17-r0: task do_install: Started
NOTE: recipe strace-5.17-r0: task do_install: Succeeded
NOTE: Running task 1661 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_install_ptest_base)
NOTE: recipe strace-5.17-r0: task do_install_ptest_base: Started
NOTE: recipe strace-5.17-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1662 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_package)
NOTE: Running task 1663 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_populate_sysroot)
NOTE: recipe strace-5.17-r0: task do_package: Started
NOTE: recipe strace-5.17-r0: task do_populate_sysroot: Started
NOTE: recipe strace-5.17-r0: task do_populate_sysroot: Succeeded
NOTE: recipe strace-5.17-r0: task do_package: Succeeded
NOTE: Running task 1664 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_packagedata)
NOTE: recipe strace-5.17-r0: task do_packagedata: Started
NOTE: recipe strace-5.17-r0: task do_packagedata: Succeeded
NOTE: Running task 1665 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_package_write_rpm)
NOTE: Running task 1666 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_package_qa)
NOTE: recipe strace-5.17-r0: task do_package_write_rpm: Started
NOTE: recipe strace-5.17-r0: task do_package_qa: Started
NOTE: recipe strace-5.17-r0: task do_package_write_rpm: Succeeded
NOTE: recipe strace-5.17-r0: task do_package_qa: Succeeded
NOTE: Running noexec task 1667 of 1667 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_build)
NOTE: Tasks Summary: Attempted 1667 tasks of which 1295 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 70 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-src went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbg went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tests went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-2to3 went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asyncio went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-audio went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-codecs went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compile went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compression went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-core went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-crypt went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ctypes went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-curses went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-datetime went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-db went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-debugger went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-difflib went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils-windows went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doctest went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-email went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-fcntl went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-gdbm went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-html went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-idle went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-image went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-io went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-json went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-logging went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mailbox went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-math went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mime went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mmap went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-modules went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-multiprocessing went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netclient went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netserver went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-numbers went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pickle went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkgutil went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-plistlib went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pprint went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-profile went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pydoc went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-resource went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-shell went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-smtpd went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-sqlite3 went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-statistics went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-stringold went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-syslog went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-terminal went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-threading went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tkinter went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unixadmin went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-venv went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xml went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xmlrpc went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3 went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3-staticdev went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ptest went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-staticdev went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dev went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doc went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-locale went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3 went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-misc went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-man went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0894140871958499617==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-strace-upgrade-5.16-5.17.patch"

From 1c895bce5cb3f1c0a5e6d6ef8af1f7f069aa4771 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Apr 2022 09:32:50 +0000
Subject: [PATCH] strace: upgrade 5.16 -> 5.17

---
 meta/recipes-devtools/strace/{strace_5.16.bb => strace_5.17.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/strace/{strace_5.16.bb => strace_5.17.bb} (95%)

diff --git a/meta/recipes-devtools/strace/strace_5.16.bb b/meta/recipes-devtools/strace/strace_5.17.bb
similarity index 95%
rename from meta/recipes-devtools/strace/strace_5.16.bb
rename to meta/recipes-devtools/strace/strace_5.17.bb
index 4bde14f939..129db87af8 100644
--- a/meta/recipes-devtools/strace/strace_5.16.bb
+++ b/meta/recipes-devtools/strace/strace_5.17.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://0001-strace-fix-reproducibilty-issues.patch \
            file://skip-load.patch \
            "
-SRC_URI[sha256sum] = "dc7db230ff3e57c249830ba94acab2b862da1fcaac55417e9b85041a833ca285"
+SRC_URI[sha256sum] = "5fb298dbd1331fd1e1bc94c5c32395860d376101b87c6cd3d1ba9f9aa15c161f"
 
 inherit autotools ptest
 
-- 
2.27.0


--===============0894140871958499617==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1640 targets, 62 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d31b9d9377484317439d8e4f3d5d49e2fed9f0f1"
workspace            = "master:ee5f9d9fdd7d09aa3a86a19d07e3e64851ddc686"

Initialising tasks...done.
Sstate summary: Wanted 118 Local 29 Mirrors 0 Missed 89 Current 383 (24% match, 82% complete)
Removing 3 stale sstate objects for arch qemumips...done.
Removing 12 stale sstate objects for arch mips32r2...done.
NOTE: Executing Tasks
NOTE: Running setscene task 394 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 422 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 440 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 467 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 468 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 478 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.37.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 826 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_configure_ptest_base)
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_configure_ptest_base: Started
NOTE: Running task 1179 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_compile)
NOTE: Running task 1181 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_compile)
NOTE: Running task 1252 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_compile)
NOTE: recipe libpcre-8.45-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1253 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_install)
NOTE: Running task 1254 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_compile)
NOTE: recipe libxau-1_1.0.9-r0: task do_compile: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_compile: Started
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_compile: Started
NOTE: recipe python3-3.10.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 494 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.0.bb:do_package_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3/3.10.3-r0/temp/log.do_packagedata_setscene.689163
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libxau-1_1.0.9-r0: task do_compile: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_compile: Succeeded
NOTE: Running setscene task 495 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_package_setscene)
NOTE: recipe util-linux-2.37.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1262 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_install)
NOTE: Running task 1263 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_install)
NOTE: Running task 1288 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_configure)
NOTE: Running task 1308 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_fetch)
NOTE: Running task 1310 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_fetch)
NOTE: Running task 1311 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_fetch)
NOTE: Running task 1312 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_fetch)
NOTE: Running task 1334 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_fetch)
NOTE: Running task 1338 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_write_config)
NOTE: Running task 1356 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_fetch)
NOTE: recipe zstd-1.5.2-r0: task do_install: Started
NOTE: Running task 1440 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata)
NOTE: recipe libpcre-8.45-r0: task do_compile: Started
NOTE: Running task 1462 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_fetch)
NOTE: Running task 1468 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_packagedata)
NOTE: Running task 1508 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_package)
NOTE: recipe libice-1_1.0.10-r0: task do_configure: Started
NOTE: recipe libical-3.0.14-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_install: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_install: Started
NOTE: recipe vala-0.56.0-r0: task do_fetch: Started
NOTE: recipe coreutils-9.0-r0: task do_package_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_fetch: Started
NOTE: Running task 1549 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_package)
NOTE: recipe libical-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe icu-70.1-r0: task do_fetch: Started
NOTE: recipe strace-5.17-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_write_config: Started
NOTE: recipe vala-0.56.0-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_fetch: Started
NOTE: Running task 1550 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_fetch: Succeeded
NOTE: Running task 1551 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_unpack)
NOTE: Running task 1552 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_unpack)
NOTE: Running task 1556 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm)
NOTE: recipe icu-70.1-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_fetch: Succeeded
NOTE: recipe strace-5.17-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.10.3-r0: task do_package_setscene: Started
NOTE: Running task 1557 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_unpack)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Started
NOTE: Running task 1558 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_unpack)
NOTE: Running task 1559 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1560 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_unpack)
NOTE: Running task 1561 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_unpack)
NOTE: recipe grep-3.7-r0: task do_fetch: Started
NOTE: Running task 1563 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.35.bb:do_package_write_rpm)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_packagedata: Started
NOTE: recipe grep-3.7-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_write_config: Succeeded
NOTE: Running task 1564 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_unpack)
NOTE: recipe vala-0.56.0-r0: task do_unpack: Started
NOTE: recipe libical-3.0.14-r0: task do_unpack: Started
NOTE: recipe icu-70.1-r0: task do_unpack: Started
NOTE: recipe gawk-5.1.1-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_unpack: Started
NOTE: recipe findutils-4.9.0-r0: task do_package: Started
NOTE: recipe icu-70.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe strace-5.17-r0: task do_unpack: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Started
NOTE: recipe grep-3.7-r0: task do_unpack: Started
NOTE: recipe bluez5-5.64-r0: task do_unpack: Started
NOTE: recipe libical-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1565 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_patch)
NOTE: recipe glibc-locale-2.35-r0: task do_package_write_rpm: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_install: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_install: Succeeded
NOTE: Running task 1566 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1567 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_unpack: Succeeded
NOTE: Running task 1568 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_patch)
NOTE: recipe grep-3.7-r0: task do_unpack: Succeeded
NOTE: Running task 1569 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot)
NOTE: Running task 1570 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package)
NOTE: Running task 1571 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_patch)
NOTE: recipe kmod-29-r0: task do_compile: Succeeded
NOTE: Running task 1572 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_install)
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.64-r0: task do_unpack: Succeeded
NOTE: recipe icu-70.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1573 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_patch)
NOTE: Running task 1574 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_generate_toolchain_file)
NOTE: Running task 1575 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_patch: Started
NOTE: recipe grep-3.7-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.0-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package: Started
NOTE: Running task 1576 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package: Started
NOTE: recipe kmod-29-r0: task do_install: Started
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Started
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.64-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_patch: Succeeded
NOTE: Running task 1577 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_deploy_source_date_epoch)
NOTE: recipe grep-3.7-r0: task do_patch: Succeeded
NOTE: Running task 1578 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vala-0.56.0-r0: task do_patch: Started
NOTE: recipe strace-5.17-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1579 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_patch)
NOTE: recipe grep-3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.0-r0: task do_patch: Succeeded
NOTE: Running task 1580 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_packagedata: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_patch: Succeeded
NOTE: recipe strace-5.17-r0: task do_patch: Started
NOTE: Running task 1581 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe grep-3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1582 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kmod-29-r0: task do_install: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1583 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_populate_sysroot)
NOTE: Running task 1584 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_package)
NOTE: recipe strace-5.17-r0: task do_patch: Succeeded
NOTE: Running task 1585 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_deploy_source_date_epoch)
NOTE: Running task 1586 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_populate_lic)
NOTE: recipe kmod-29-r0: task do_populate_sysroot: Started
NOTE: recipe libxcb-1.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe kmod-29-r0: task do_package: Started
NOTE: Running task 1587 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_configure)
NOTE: recipe icu-70.1-r0: task do_unpack: Succeeded
NOTE: recipe strace-5.17-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1588 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_patch)
NOTE: recipe strace-5.17-r0: task do_populate_lic: Started
NOTE: recipe libxcb-1.14-r0: task do_configure: Started
NOTE: recipe icu-70.1-r0: task do_patch: Started
NOTE: recipe strace-5.17-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_populate_lic unihash changed to a6b1df75dc53be8b6056177243ab303fc454edc85216acd9842c7d42cddd6bdb
NOTE: recipe strace-5.17-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe kmod-29-r0: task do_populate_sysroot: Succeeded
NOTE: recipe icu-70.1-r0: task do_patch: Succeeded
NOTE: Running task 1589 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_make_icudata)
NOTE: Running task 1590 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_deploy_source_date_epoch)
NOTE: recipe icu-70.1-r0: task do_make_icudata: Started
NOTE: recipe icu-70.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-70.1-r0: task do_make_icudata: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package unihash changed to 9a2c0e5928f4682807c2a081ff7c7108a2f92fe183f19278632d2b09a0b4bc2e
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata became valid
NOTE: Running setscene task 496 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: recipe icu-70.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1591 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_configure)
NOTE: recipe python3-3.10.3-r0: task do_package_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: Running task 1604 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1606 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_packagedata)
NOTE: recipe icu-70.1-r0: task do_configure: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1607 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata)
NOTE: Running task 1608 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.10.3-r0: task do_packagedata: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata: Succeeded
NOTE: recipe kmod-29-r0: task do_package: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata: Succeeded
NOTE: Running task 1610 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_packagedata)
NOTE: recipe libxml2-2.9.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1611 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_configure)
NOTE: recipe kmod-29-r0: task do_packagedata: Started
NOTE: recipe libxml2-2.9.13-r0: task do_configure: Started
NOTE: recipe python3-3.10.3-r0: task do_packagedata: Succeeded
NOTE: recipe make-4.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe kmod-29-r0: task do_packagedata: Succeeded
NOTE: recipe coreutils-9.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 498 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_packagedata_setscene)
NOTE: Running setscene task 499 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.63-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.63-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_package unihash changed to 96cfda07504257e37fe0b4828d7d5bd1d1f5887d8904df63fea55f4830437c19
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata became valid
NOTE: Running setscene task 499 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.63-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.63-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 501 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gawk-5.1.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_package unihash changed to 5b9fa70a1f31661d178e3c32baeb716d2eb9e212689a03a9db5257e071e7b207
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_packagedata became valid
NOTE: Running setscene task 501 of 501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1669 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_package_write_rpm)
NOTE: Running task 1670 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm)
NOTE: Running task 1671 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.0.bb:do_package_write_rpm)
NOTE: recipe gawk-5.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm: Started
NOTE: recipe coreutils-9.0-r0: task do_package_write_rpm: Started
NOTE: recipe libpcre-8.45-r0: task do_compile: Succeeded
NOTE: Running task 1672 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_compile_ptest_base)
NOTE: recipe gawk-5.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_compile_ptest_base: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm unihash changed to 6c194346f1c56c19065d7595aabeda51d5e635b5452d55f334a43abfc808be29
NOTE: recipe libpcre-8.45-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1673 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_install)
NOTE: recipe libpcre-8.45-r0: task do_install: Started
NOTE: recipe libice-1_1.0.10-r0: task do_configure: Succeeded
NOTE: Running task 1674 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_compile)
NOTE: recipe libice-1_1.0.10-r0: task do_compile: Started
NOTE: recipe libpcre-8.45-r0: task do_install: Succeeded
NOTE: Running task 1675 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_install_ptest_base)
NOTE: recipe zstd-1.5.2-r0: task do_install: Succeeded
NOTE: Running task 1676 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_populate_sysroot)
NOTE: Running task 1677 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_package)
NOTE: recipe libpcre-8.45-r0: task do_install_ptest_base: Started
NOTE: recipe zstd-1.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe zstd-1.5.2-r0: task do_package: Started
NOTE: recipe libpcre-8.45-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1678 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot)
NOTE: Running task 1679 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_package)
NOTE: recipe icu-70.1-r0: task do_configure: Succeeded
NOTE: Running task 1680 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_compile)
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot: Started
NOTE: recipe icu-70.1-r0: task do_compile: Started
NOTE: recipe libpcre-8.45-r0: task do_package: Started
NOTE: recipe libice-1_1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 1681 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_install)
NOTE: recipe zstd-1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_install: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1682 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1683 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe grep-3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe grep-3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1684 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_configure)
NOTE: recipe libice-1_1.0.10-r0: task do_install: Succeeded
NOTE: Running task 1685 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot)
NOTE: Running task 1686 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package)
NOTE: recipe grep-3.7-r0: task do_configure: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1687 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_configure)
NOTE: recipe libice-1_1.0.10-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_configure: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1688 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsm-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1689 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_configure)
NOTE: recipe libsm-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package: Succeeded
NOTE: Running task 1690 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata)
NOTE: recipe zstd-1.5.2-r0: task do_package: Succeeded
NOTE: Running task 1691 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_packagedata)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata: Started
NOTE: recipe zstd-1.5.2-r0: task do_packagedata: Started
NOTE: recipe libxcb-1.14-r0: task do_configure: Succeeded
NOTE: Running task 1692 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_compile)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_compile: Started
NOTE: recipe zstd-1.5.2-r0: task do_packagedata: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_package: Succeeded
NOTE: Running task 1693 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata)
NOTE: recipe libpcre-8.45-r0: task do_packagedata: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_compile: Succeeded
NOTE: Running task 1694 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_install)
NOTE: recipe libxcb-1.14-r0: task do_install: Started
NOTE: recipe libxml2-2.9.13-r0: task do_configure: Succeeded
NOTE: Running task 1695 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_configure_ptest_base)
NOTE: recipe libxml2-2.9.13-r0: task do_configure_ptest_base: Started
NOTE: recipe libxml2-2.9.13-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1696 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_compile)
NOTE: recipe libxml2-2.9.13-r0: task do_compile: Started
NOTE: recipe coreutils-9.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.0.bb:do_package_write_rpm unihash changed to b73d16b796d2353047e60459f277096fb4c4f0e9988b922d530e9e042fc3d14b
NOTE: recipe libxcb-1.14-r0: task do_install: Succeeded
NOTE: Running task 1697 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot)
NOTE: Running task 1698 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package)
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot: Started
NOTE: recipe libxcb-1.14-r0: task do_package: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1699 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1700 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_configure)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_configure: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 1701 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_compile)
NOTE: recipe libsm-1_1.2.3-r0: task do_compile: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 1702 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_install)
NOTE: recipe libsm-1_1.2.3-r0: task do_install: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 1703 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 1704 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package)
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 1705 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package: Succeeded
NOTE: Running task 1706 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata)
NOTE: recipe libxcb-1.14-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_configure: Succeeded
NOTE: Running task 1707 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1708 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_compile)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_compile: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_compile: Succeeded
NOTE: Running task 1709 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_compile_ptest_base)
NOTE: recipe libxml2-2.9.13-r0: task do_compile_ptest_base: Started
NOTE: recipe grep-3.7-r0: task do_configure: Succeeded
NOTE: Running task 1710 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_compile)
NOTE: recipe grep-3.7-r0: task do_compile: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_configure: Succeeded
NOTE: Running task 1711 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_compile)
NOTE: recipe icu-70.1-r0: task do_compile: Succeeded
NOTE: Running task 1712 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_install)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_compile: Started
NOTE: recipe icu-70.1-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_compile: Succeeded
NOTE: Running task 1713 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1714 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_install)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_install: Started
NOTE: recipe grep-3.7-r0: task do_compile: Succeeded
NOTE: Running task 1715 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_install)
NOTE: recipe grep-3.7-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_install: Succeeded
NOTE: Running task 1716 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_install_ptest_base: Started
NOTE: recipe icu-70.1-r0: task do_install: Succeeded
NOTE: Running task 1717 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_populate_sysroot)
NOTE: Running task 1718 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_package)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1719 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_populate_sysroot)
NOTE: Running task 1720 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_package)
NOTE: recipe icu-70.1-r0: task do_populate_sysroot: Started
NOTE: recipe icu-70.1-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1721 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1722 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe grep-3.7-r0: task do_install: Succeeded
NOTE: Running task 1723 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_package)
NOTE: recipe vala-0.56.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe grep-3.7-r0: task do_package: Started
NOTE: recipe icu-70.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vala-0.56.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1724 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_configure)
NOTE: recipe vala-0.56.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1725 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_configure: Started
NOTE: recipe grep-3.7-r0: task do_package: Succeeded
NOTE: Running task 1726 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_packagedata)
NOTE: recipe grep-3.7-r0: task do_packagedata: Started
NOTE: recipe grep-3.7-r0: task do_packagedata: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_configure: Succeeded
NOTE: Running task 1727 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.7.bb:do_package_write_rpm)
NOTE: Running task 1728 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_compile)
NOTE: recipe grep-3.7-r0: task do_package_write_rpm: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_compile: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_compile: Succeeded
NOTE: Running task 1729 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_install)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_install: Started
NOTE: recipe icu-70.1-r0: task do_package: Succeeded
NOTE: Running task 1730 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_packagedata)
NOTE: recipe icu-70.1-r0: task do_packagedata: Started
NOTE: recipe icu-70.1-r0: task do_packagedata: Succeeded
NOTE: recipe grep-3.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libx11-1_1.7.3.1-r0: task do_install: Succeeded
NOTE: Running task 1731 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_populate_sysroot)
NOTE: Running task 1732 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_package)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_package: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vala-0.56.0-r0: task do_configure: Succeeded
NOTE: Running task 1733 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_compile)
NOTE: recipe vala-0.56.0-r0: task do_compile: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_package: Succeeded
NOTE: Running task 1734 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_packagedata)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_packagedata: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_packagedata: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_package: Succeeded
NOTE: Running task 1735 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_packagedata: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_compile: Succeeded
NOTE: Running task 1736 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_install)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_install: Started
NOTE: recipe libxml2-2.9.13-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1737 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_install)
NOTE: recipe libxml2-2.9.13-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_install: Succeeded
NOTE: Running task 1738 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot)
NOTE: Running task 1739 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_package)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_package: Started
NOTE: recipe libxml2-2.9.13-r0: task do_install: Succeeded
NOTE: Running task 1740 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_install_ptest_base)
NOTE: recipe libxml2-2.9.13-r0: task do_install_ptest_base: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_package: Succeeded
NOTE: Running task 1741 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1742 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_populate_sysroot)
NOTE: Running task 1743 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_package)
NOTE: recipe libxml2-2.9.13-r0: task do_populate_sysroot: Started
NOTE: recipe libxml2-2.9.13-r0: task do_package: Started
NOTE: recipe libxml2-2.9.13-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1744 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe wayland-1.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-1.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1745 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_configure)
NOTE: recipe wayland-1.20.0-r0: task do_configure: Started
NOTE: recipe wayland-1.20.0-r0: task do_configure: Succeeded
NOTE: Running task 1746 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_configure_ptest_base)
NOTE: recipe wayland-1.20.0-r0: task do_configure_ptest_base: Started
NOTE: recipe wayland-1.20.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1747 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_compile)
NOTE: recipe wayland-1.20.0-r0: task do_compile: Started
NOTE: recipe wayland-1.20.0-r0: task do_compile: Succeeded
NOTE: Running task 1748 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_compile_ptest_base)
NOTE: recipe wayland-1.20.0-r0: task do_compile_ptest_base: Started
NOTE: recipe wayland-1.20.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1749 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_install)
NOTE: recipe wayland-1.20.0-r0: task do_install: Started
NOTE: recipe wayland-1.20.0-r0: task do_install: Succeeded
NOTE: Running task 1750 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_install_ptest_base)
NOTE: recipe wayland-1.20.0-r0: task do_install_ptest_base: Started
NOTE: recipe wayland-1.20.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1751 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_populate_sysroot)
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot: Started
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1752 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1753 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_configure)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_configure: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1754 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_compile)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_compile: Started
NOTE: recipe vala-0.56.0-r0: task do_compile: Succeeded
NOTE: Running task 1755 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_install)
NOTE: recipe vala-0.56.0-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1756 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_install)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_install: Started
NOTE: recipe vala-0.56.0-r0: task do_install: Succeeded
NOTE: Running task 1757 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_populate_sysroot)
NOTE: Running task 1758 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_package)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 1759 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_populate_sysroot)
NOTE: recipe vala-0.56.0-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.0-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1760 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-1_250.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1761 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1762 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_configure)
NOTE: recipe systemd-1_250.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1763 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_configure)
NOTE: recipe libical-3.0.14-r0: task do_configure: Started
NOTE: recipe systemd-1_250.4-r0: task do_configure: Started
NOTE: recipe vala-0.56.0-r0: task do_package: Succeeded
NOTE: Running task 1764 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.0.bb:do_packagedata)
NOTE: recipe vala-0.56.0-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.0-r0: task do_packagedata: Succeeded
NOTE: recipe glibc-locale-2.35-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.35.bb:do_package_write_rpm unihash changed to 6a2f3698189133ff28e706b1e8695dd96100fa1a51ebf4e813145a6c7c87311f
NOTE: recipe libxml2-2.9.13-r0: task do_package: Succeeded
NOTE: Running task 1765 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_packagedata)
NOTE: recipe libxml2-2.9.13-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1766 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_compile)
NOTE: recipe libical-3.0.14-r0: task do_compile: Started
NOTE: recipe libxml2-2.9.13-r0: task do_packagedata: Succeeded
NOTE: Running task 1767 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_package)
NOTE: recipe wayland-1.20.0-r0: task do_package: Started
NOTE: recipe wayland-1.20.0-r0: task do_package: Succeeded
NOTE: Running task 1768 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_packagedata)
NOTE: recipe wayland-1.20.0-r0: task do_packagedata: Started
NOTE: recipe wayland-1.20.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1769 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_package)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 1770 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_packagedata)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1771 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_install)
NOTE: recipe libical-3.0.14-r0: task do_install: Started
NOTE: recipe libical-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1772 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1773 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_package)
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.14-r0: task do_package: Started
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1774 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_packagedata)
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe systemd-1_250.4-r0: task do_configure: Succeeded
NOTE: Running task 1775 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_compile)
NOTE: recipe systemd-1_250.4-r0: task do_compile: Started
NOTE: recipe systemd-1_250.4-r0: task do_compile: Succeeded
NOTE: Running task 1776 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_install)
NOTE: recipe systemd-1_250.4-r0: task do_install: Started
NOTE: recipe systemd-1_250.4-r0: task do_install: Succeeded
NOTE: Running task 1777 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_populate_sysroot)
NOTE: Running task 1778 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_package)
NOTE: recipe systemd-1_250.4-r0: task do_package: Started
NOTE: recipe systemd-1_250.4-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-1_250.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1779 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-1.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1780 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_configure)
NOTE: recipe dbus-1.14.0-r0: task do_configure: Started
NOTE: recipe systemd-1_250.4-r0: task do_package: Succeeded
NOTE: Running task 1781 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_packagedata)
NOTE: recipe systemd-1_250.4-r0: task do_packagedata: Started
NOTE: recipe systemd-1_250.4-r0: task do_packagedata: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_configure: Succeeded
NOTE: Running task 1782 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_configure_ptest_base)
NOTE: recipe dbus-1.14.0-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.14.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1783 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_compile)
NOTE: recipe dbus-1.14.0-r0: task do_compile: Started
NOTE: recipe dbus-1.14.0-r0: task do_compile: Succeeded
NOTE: Running task 1784 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_compile_ptest_base)
NOTE: recipe dbus-1.14.0-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.14.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1785 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_install)
NOTE: recipe dbus-1.14.0-r0: task do_install: Started
NOTE: recipe dbus-1.14.0-r0: task do_install: Succeeded
NOTE: Running task 1786 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_install_ptest_base)
NOTE: recipe dbus-1.14.0-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.14.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1787 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_populate_sysroot)
NOTE: Running task 1788 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_package)
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.14.0-r0: task do_package: Started
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1789 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.64-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.64-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1790 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_configure)
NOTE: recipe bluez5-5.64-r0: task do_configure: Started
NOTE: recipe dbus-1.14.0-r0: task do_package: Succeeded
NOTE: Running task 1791 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_packagedata)
NOTE: recipe dbus-1.14.0-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_configure: Succeeded
NOTE: Running task 1792 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.64-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1793 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_compile)
NOTE: recipe bluez5-5.64-r0: task do_compile: Started
NOTE: recipe bluez5-5.64-r0: task do_compile: Succeeded
NOTE: Running task 1794 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_compile_ptest_base: Started
NOTE: recipe bluez5-5.64-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1795 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_install)
NOTE: recipe bluez5-5.64-r0: task do_install: Started
NOTE: recipe bluez5-5.64-r0: task do_install: Succeeded
NOTE: Running task 1796 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.64-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1797 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_populate_sysroot)
NOTE: Running task 1798 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_package)
NOTE: recipe bluez5-5.64-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.64-r0: task do_package: Started
NOTE: recipe bluez5-5.64-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1799 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_prepare_recipe_sysroot)
NOTE: recipe strace-5.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe strace-5.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1800 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_configure)
NOTE: recipe strace-5.17-r0: task do_configure: Started
NOTE: recipe bluez5-5.64-r0: task do_package: Succeeded
NOTE: Running task 1801 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_packagedata)
NOTE: recipe bluez5-5.64-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.64-r0: task do_packagedata: Succeeded
NOTE: recipe strace-5.17-r0: task do_configure: Succeeded
NOTE: Running task 1802 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_configure_ptest_base)
NOTE: recipe strace-5.17-r0: task do_configure_ptest_base: Started
NOTE: recipe strace-5.17-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1803 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_compile)
NOTE: recipe strace-5.17-r0: task do_compile: Started
NOTE: recipe strace-5.17-r0: task do_compile: Succeeded
NOTE: Running task 1804 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_compile_ptest_base)
NOTE: recipe strace-5.17-r0: task do_compile_ptest_base: Started
NOTE: recipe strace-5.17-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1805 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_install)
NOTE: recipe strace-5.17-r0: task do_install: Started
NOTE: recipe strace-5.17-r0: task do_install: Succeeded
NOTE: Running task 1806 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_install_ptest_base)
NOTE: recipe strace-5.17-r0: task do_install_ptest_base: Started
NOTE: recipe strace-5.17-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1807 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_package)
NOTE: Running task 1808 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_populate_sysroot)
NOTE: recipe strace-5.17-r0: task do_package: Started
NOTE: recipe strace-5.17-r0: task do_populate_sysroot: Started
NOTE: recipe strace-5.17-r0: task do_populate_sysroot: Succeeded
NOTE: recipe strace-5.17-r0: task do_package: Succeeded
NOTE: Running task 1809 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_packagedata)
NOTE: recipe strace-5.17-r0: task do_packagedata: Started
NOTE: recipe strace-5.17-r0: task do_packagedata: Succeeded
NOTE: Running task 1810 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_package_write_rpm)
NOTE: Running task 1811 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_package_qa)
NOTE: recipe strace-5.17-r0: task do_package_write_rpm: Started
NOTE: recipe strace-5.17-r0: task do_package_qa: Started
NOTE: recipe strace-5.17-r0: task do_package_write_rpm: Succeeded
NOTE: recipe strace-5.17-r0: task do_package_qa: Succeeded
NOTE: Running noexec task 1812 of 1812 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.17.bb:do_build)
NOTE: Tasks Summary: Attempted 1812 tasks of which 1603 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 70 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-src went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbg went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tests went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-2to3 went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asyncio went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-audio went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-codecs went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compile went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compression went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-core went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-crypt went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ctypes went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-curses went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-datetime went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-db went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-debugger went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-difflib went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils-windows went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doctest went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-email went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-fcntl went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-gdbm went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-html went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-idle went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-image went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-io went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-json went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-logging went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mailbox went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-math went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mime went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mmap went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-modules went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-multiprocessing went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netclient went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netserver went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-numbers went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pickle went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkgutil went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-plistlib went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pprint went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-profile went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pydoc went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-resource went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-shell went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-smtpd went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-sqlite3 went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-statistics went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-stringold went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-syslog went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-terminal went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-threading went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tkinter went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unixadmin went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-venv went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xml went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xmlrpc went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3 went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3-staticdev went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ptest went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-staticdev went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dev went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doc went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-locale went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3 went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-misc went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-man went backwards which would break package feeds (from 0:3.10.4-r0 to 0:3.10.3-r0) [version-going-backwards]
ERROR: python3-3.10.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0894140871958499617==--

