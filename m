Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.1289.1618510599557339342
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id B753738C1336
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:38 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 5.11.1 SUCCEEDED
Message-ID: <MADEUP.16761AD0CA53179D.4047@lists.openembedded.org>
X-Groupsio-MsgNum: 150498
Content-Type: multipart/mixed; boundary="===============6714965246924207130=="

--===============6714965246924207130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *btrfs-tools* to *5.11.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-btrfs-tools-upgrade-5.10.1-5.11.1.patch
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

--===============6714965246924207130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: RRECOMMENDS: removed "util-linux-libmount-dbg"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: RRECOMMENDS: removed "util-linux-libmount-dev"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: RDEPENDS: removed "util-linux-libmount (['>= 2.36.2'])"
Changes to packages/core2-32-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.9/site-packages/btrfsutil-5.10.1-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/btrfsutil-5.11.1-py3.9.egg-info

--===============6714965246924207130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1440 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (813 cached, 1 parsed). 1438 targets, 31 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.50.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:60a48af8a14153f29719874c7c6ae94ea521def5"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 33 Local 25 Network 0 Missed 8 Current 631 (75% match, 98% complete)
Removing 1 stale sstate objects for arch qemux86_64...done.
Removing 6 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 632 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 634 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf-archive/autoconf-archive_2019.01.06.bb:do_packagedata_setscene)
NOTE: Running setscene task 635 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 644 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 645 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 646 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe autoconf-archive-2019.01.06-r0: task do_packagedata_setscene: Started
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glibc-2.33-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe autoconf-archive-2019.01.06-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 650 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_packagedata_setscene)
NOTE: Running task 1017 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_fetch)
NOTE: recipe glibc-2.33-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bison-3.7.5-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_fetch: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_fetch: Succeeded
NOTE: Running task 1266 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_unpack)
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-src went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-dbg went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-staticdev went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-dev went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-doc went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
NOTE: recipe btrfs-tools-5.11.1-r0: task do_unpack: Started
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-af went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ast went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-be went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-bg went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ca went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-cs went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-da went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-de went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-el went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-eo went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-es went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-et went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-eu went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-fi went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-fr went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ga went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-gl went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-hr went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-hu went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ia went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-id went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-it went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ja went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ko went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ky went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-lt went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-lv went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ms went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-nb went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-nl went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-pl went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-pt went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-pt-br went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ro went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ru went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-rw went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sk went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sl went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sq went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
NOTE: recipe btrfs-tools-5.11.1-r0: task do_unpack: Succeeded
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sr went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
NOTE: Running task 1267 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_patch)
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sv went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ta went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-th went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-tr went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-uk went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-vi went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-zh-cn went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-zh-tw went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
NOTE: recipe bison-3.7.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 653 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-5.11.1-r0: task do_patch: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_patch: Succeeded
NOTE: Running task 1272 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1273 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_populate_lic)
NOTE: recipe btrfs-tools-5.11.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_populate_lic: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_populate_lic unihash changed to 27f8a5184766adcfaab6be1712cee3001d07f5cd1de5b2e129576e1b0d35c20b
NOTE: recipe btrfs-tools-5.11.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 655 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 657 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_packagedata_setscene)
NOTE: Running setscene task 658 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-2.33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.33-r0: task do_packagedata_setscene: Started
NOTE: recipe glibc-2.33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glibc-2.33-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 661 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 662 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 663 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1880 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-5.11.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2114 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_configure)
NOTE: recipe btrfs-tools-5.11.1-r0: task do_configure: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_configure: Succeeded
NOTE: Running task 2115 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_compile)
NOTE: recipe btrfs-tools-5.11.1-r0: task do_compile: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_compile: Succeeded
NOTE: Running task 2116 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_install)
NOTE: recipe btrfs-tools-5.11.1-r0: task do_install: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_install: Succeeded
NOTE: Running task 2117 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_package)
NOTE: Running task 2118 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_populate_sysroot)
NOTE: recipe btrfs-tools-5.11.1-r0: task do_package: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_populate_sysroot: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe btrfs-tools-5.11.1-r0: task do_package: Succeeded
NOTE: Running task 2119 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_packagedata)
NOTE: recipe btrfs-tools-5.11.1-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2120 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm)
NOTE: Running task 2121 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_package_write_rpm)
NOTE: Running task 2122 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_package_qa)
NOTE: recipe btrfs-tools-5.11.1-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_package_qa: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_package_qa: Succeeded
NOTE: recipe btrfs-tools-5.11.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm unihash changed to 4fac66e7e407dc3d51eb0af75fa2dc0721310b688c728b6022a050ab7efbec98
NOTE: Running noexec task 2123 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2123 tasks of which 2107 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 54 ERROR messages shown, returning a non-zero exit code.

--===============6714965246924207130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 66 skipped, 0 masked, 0 errors.
Removing 2 recipes from the ppc7400 sysroot...done.
Removing 2 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.50.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:60a48af8a14153f29719874c7c6ae94ea521def5"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 33 Local 25 Network 0 Missed 8 Current 631 (75% match, 98% complete)
Removing 1 stale sstate objects for arch qemuppc...done.
Removing 6 stale sstate objects for arch ppc7400...done.
NOTE: Executing Tasks
NOTE: Running setscene task 632 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 634 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf-archive/autoconf-archive_2019.01.06.bb:do_packagedata_setscene)
NOTE: Running setscene task 635 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 644 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 645 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 646 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe autoconf-archive-2019.01.06-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glibc-2.33-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe autoconf-archive-2019.01.06-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1017 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_fetch)
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 650 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.11.1-r0: task do_fetch: Started
NOTE: recipe glibc-2.33-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bison-3.7.5-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_fetch: Succeeded
NOTE: Running task 1266 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_unpack)
NOTE: recipe btrfs-tools-5.11.1-r0: task do_unpack: Started
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-src went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-dbg went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-staticdev went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-dev went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-doc went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-af went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ast went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-be went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-bg went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ca went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-cs went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-da went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-de went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-el went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-eo went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-es went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-et went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-eu went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-fi went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-fr went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ga went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-gl went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-hr went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-hu went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ia went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-id went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-it went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ja went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ko went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ky went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-lt went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-lv went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ms went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-nb went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-nl went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-pl went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-pt went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-pt-br went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ro went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ru went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-rw went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sk went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sl went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sq went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sr went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sv went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
NOTE: recipe btrfs-tools-5.11.1-r0: task do_unpack: Succeeded
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ta went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
NOTE: Running task 1267 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_patch)
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-th went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-tr went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-uk went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-vi went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-zh-cn went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-zh-tw went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
NOTE: recipe bison-3.7.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 653 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-5.11.1-r0: task do_patch: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_patch: Succeeded
NOTE: Running task 1272 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1273 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_populate_lic)
NOTE: recipe btrfs-tools-5.11.1-r0: task do_populate_lic: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_populate_lic unihash changed to 27f8a5184766adcfaab6be1712cee3001d07f5cd1de5b2e129576e1b0d35c20b
NOTE: recipe btrfs-tools-5.11.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 655 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 657 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_packagedata_setscene)
NOTE: Running setscene task 658 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-2.33-r0: task do_packagedata_setscene: Started
NOTE: recipe glibc-2.33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glibc-2.33-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 661 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 662 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 664 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-powerpc-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-powerpc-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1880 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-5.11.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2114 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_configure)
NOTE: recipe btrfs-tools-5.11.1-r0: task do_configure: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_configure: Succeeded
NOTE: Running task 2115 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_compile)
NOTE: recipe btrfs-tools-5.11.1-r0: task do_compile: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_compile: Succeeded
NOTE: Running task 2116 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_install)
NOTE: recipe btrfs-tools-5.11.1-r0: task do_install: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_install: Succeeded
NOTE: Running task 2117 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_package)
NOTE: Running task 2118 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_populate_sysroot)
NOTE: recipe btrfs-tools-5.11.1-r0: task do_package: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_populate_sysroot: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe btrfs-tools-5.11.1-r0: task do_package: Succeeded
NOTE: Running task 2119 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_packagedata)
NOTE: recipe btrfs-tools-5.11.1-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2120 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm)
NOTE: Running task 2121 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_package_write_rpm)
NOTE: Running task 2122 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_package_qa)
NOTE: recipe btrfs-tools-5.11.1-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_package_qa: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_package_qa: Succeeded
NOTE: recipe btrfs-tools-5.11.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm unihash changed to 8998420148f3f365e24d7aec1c34a9bf4f4c1edad797424f1767318fa08e2ccd
NOTE: Running noexec task 2123 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2123 tasks of which 2107 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 54 ERROR messages shown, returning a non-zero exit code.

--===============6714965246924207130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 41 skipped, 0 masked, 0 errors.
Removing 92 recipes from the core2-32 sysroot...done.
Removing 96 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.50.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:60a48af8a14153f29719874c7c6ae94ea521def5"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 481 Local 472 Network 0 Missed 9 Current 194 (98% match, 98% complete)
Removing 4 stale sstate objects for arch x86_64_i686...done.
NOTE: Executing Tasks
NOTE: Running setscene task 195 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 196 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 197 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 198 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 199 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 200 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 201 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 202 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 203 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 204 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 205 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 206 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 207 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 208 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 209 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 210 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 211 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 212 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 213 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 214 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 215 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 216 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 217 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 218 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 219 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 220 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 221 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 223 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 225 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 226 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 234 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 235 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 236 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 237 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 238 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 239 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 241 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 242 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 243 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 244 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 245 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 246 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 247 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 248 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 249 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 250 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 251 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 252 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 253 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 254 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 255 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 256 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 257 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 258 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 259 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-247.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 260 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 261 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_packagedata_setscene)
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 262 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 263 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 264 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 265 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata_setscene)
NOTE: recipe systemd-1_247.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 266 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 267 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 268 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 269 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 270 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 271 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 272 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 273 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 274 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-247.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 275 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 276 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 277 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 278 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package_write_rpm_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 279 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 280 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 281 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 282 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 283 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_package_write_rpm_setscene)
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 284 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 285 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 286 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 287 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 288 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 289 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 290 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 291 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 292 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 293 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 294 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 295 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 296 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata_setscene)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 297 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 298 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 299 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 300 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 301 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 302 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 303 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 304 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 305 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_package_write_rpm_setscene)
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 306 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 307 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 308 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 309 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 310 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_populate_sysroot_setscene)
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 311 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 312 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 313 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 314 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_package_write_rpm_setscene)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 317 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata_setscene)
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_deploy_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 318 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_247.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 319 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 320 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: Running setscene task 321 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 322 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: Running setscene task 323 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 324 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 325 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-2.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 330 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 331 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_packagedata_setscene)
NOTE: Running setscene task 333 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 335 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 337 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 338 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_packagedata_setscene)
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 339 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 340 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: recipe systemd-conf-247.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 341 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: recipe python3-3.9.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 342 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 343 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 344 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 345 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 346 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 347 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_packagedata_setscene)
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_deploy_setscene: Succeeded
NOTE: Running setscene task 348 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.35.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 351 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 356 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 711 of 2144 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_fetch)
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 370 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_packagedata_setscene)
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: Running setscene task 378 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 379 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata_setscene)
NOTE: recipe systemd-conf-247.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe btrfs-tools-5.11.1-r0: task do_fetch: Started
NOTE: Running setscene task 389 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe btrfs-tools-5.11.1-r0: task do_fetch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 930 of 2144 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_unpack)
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 396 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 398 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 404 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_packagedata_setscene: Started
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 411 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 414 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-5.11.1-r0: task do_unpack: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 418 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 425 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bison-3.7.5-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe btrfs-tools-5.11.1-r0: task do_unpack: Succeeded
NOTE: Running task 1000 of 2144 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_patch)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-src went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-dbg went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-staticdev went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-dev went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-doc went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-af went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ast went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-be went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-bg went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ca went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-cs went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-da went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-de went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-el went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-eo went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-es went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-et went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
NOTE: recipe btrfs-tools-5.11.1-r0: task do_patch: Started
NOTE: Running setscene task 436 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_packagedata_setscene)
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-eu went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-fi went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-fr went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ga went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-gl went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-hr went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-hu went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ia went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Succeeded
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-id went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-it went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ja went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ko went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ky went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-lt went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-lv went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ms went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-nb went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-nl went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-pl went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-pt went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-pt-br went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ro went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ru went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-rw went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sk went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sl went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sq went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_packagedata_setscene: Started
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sr went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sv went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ta went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-th went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-tr went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-uk went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-vi went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-zh-cn went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-zh-tw went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
NOTE: recipe btrfs-tools-5.11.1-r0: task do_patch: Succeeded
NOTE: Running task 1018 of 2144 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1019 of 2144 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_populate_lic)
NOTE: recipe bison-3.7.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe btrfs-tools-5.11.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_populate_lic: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_populate_lic unihash changed to 27f8a5184766adcfaab6be1712cee3001d07f5cd1de5b2e129576e1b0d35c20b
NOTE: recipe btrfs-tools-5.11.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 446 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 449 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 453 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 454 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 455 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 457 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_247.4-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_247.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 462 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_247.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_247.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 468 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 470 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 471 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 472 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 473 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 474 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 475 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 476 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 478 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 479 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 480 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 481 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 482 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 483 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 486 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-28-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_247.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_247.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 489 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 490 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 491 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 492 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 493 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 494 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 495 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 497 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 499 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 501 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 503 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 505 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 507 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 511 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 512 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 513 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 515 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 516 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 517 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 518 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 519 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 521 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 522 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 523 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 524 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 525 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 526 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 527 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 528 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 529 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 531 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 533 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 535 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 536 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 537 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 539 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 541 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 543 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 545 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 546 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 547 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 548 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 549 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 552 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 554 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 556 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 559 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 562 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 564 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 566 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 568 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 569 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 572 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 573 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 574 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.35.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 577 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.9.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 580 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 581 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 582 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 583 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 584 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 585 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 586 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 587 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 588 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 589 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.35.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 594 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 595 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 597 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 598 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 599 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 600 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 601 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.36.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 602 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 603 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.35.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 604 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 605 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_setscene)
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_package_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 606 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 607 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 608 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 609 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 610 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 611 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 612 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 613 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 614 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 615 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 618 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 620 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 622 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 624 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 625 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 626 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 628 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 630 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 631 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 632 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 633 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 634 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 636 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 638 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 639 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 640 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 641 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 642 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 644 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 645 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 648 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 649 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 650 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 652 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 653 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 654 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 656 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 657 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 658 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 659 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 660 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 661 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 667 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 668 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 669 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 671 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 672 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 673 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 674 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 675 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1896 of 2144 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-5.11.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2135 of 2144 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_configure)
NOTE: recipe btrfs-tools-5.11.1-r0: task do_configure: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_configure: Succeeded
NOTE: Running task 2136 of 2144 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_compile)
NOTE: recipe btrfs-tools-5.11.1-r0: task do_compile: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_compile: Succeeded
NOTE: Running task 2137 of 2144 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_install)
NOTE: recipe btrfs-tools-5.11.1-r0: task do_install: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_install: Succeeded
NOTE: Running task 2138 of 2144 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_package)
NOTE: Running task 2139 of 2144 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_populate_sysroot)
NOTE: recipe btrfs-tools-5.11.1-r0: task do_package: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_populate_sysroot: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe btrfs-tools-5.11.1-r0: task do_package: Succeeded
NOTE: Running task 2140 of 2144 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_packagedata)
NOTE: recipe btrfs-tools-5.11.1-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2141 of 2144 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm)
NOTE: Running task 2142 of 2144 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_package_write_rpm)
NOTE: Running task 2143 of 2144 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_package_qa)
NOTE: recipe btrfs-tools-5.11.1-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_package_qa: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_package_qa: Succeeded
NOTE: recipe btrfs-tools-5.11.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm unihash changed to 14ab3a4d6474b9dee96b801ad32f6580d1f3151e7718f499c2577dff9d8712e5
NOTE: Running noexec task 2144 of 2144 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2144 tasks of which 2128 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 54 ERROR messages shown, returning a non-zero exit code.

--===============6714965246924207130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 58 skipped, 0 masked, 0 errors.
Removing 2 recipes from the mips32r2 sysroot...done.
Removing 2 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.50.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:60a48af8a14153f29719874c7c6ae94ea521def5"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 33 Local 25 Network 0 Missed 8 Current 631 (75% match, 98% complete)
Removing 6 stale sstate objects for arch mips32r2...done.
Removing 1 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 632 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 634 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf-archive/autoconf-archive_2019.01.06.bb:do_packagedata_setscene)
NOTE: Running setscene task 635 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 644 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 645 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 646 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe autoconf-archive-2019.01.06-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glibc-2.33-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe autoconf-archive-2019.01.06-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1017 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_fetch)
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 650 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glibc-2.33-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.11.1-r0: task do_fetch: Started
NOTE: recipe bison-3.7.5-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_fetch: Succeeded
NOTE: Running task 1266 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_unpack)
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-src went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
NOTE: recipe btrfs-tools-5.11.1-r0: task do_unpack: Started
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-dbg went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-staticdev went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-dev went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-doc went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-af went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ast went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-be went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-bg went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ca went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-cs went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-da went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-de went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-el went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-eo went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-es went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-et went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-eu went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-fi went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-fr went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ga went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-gl went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-hr went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-hu went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ia went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-id went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-it went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ja went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
NOTE: recipe btrfs-tools-5.11.1-r0: task do_unpack: Succeeded
NOTE: Running task 1267 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_patch)
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ko went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ky went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-lt went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-lv went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ms went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-nb went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-nl went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-pl went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-pt went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-pt-br went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ro went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ru went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-rw went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sk went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sl went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sq went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sr went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sv went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
NOTE: recipe btrfs-tools-5.11.1-r0: task do_patch: Started
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ta went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-th went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-tr went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-uk went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-vi went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-zh-cn went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-zh-tw went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
NOTE: recipe bison-3.7.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 653 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-5.11.1-r0: task do_patch: Succeeded
NOTE: Running task 1272 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1273 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_populate_lic)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_populate_lic: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_populate_lic unihash changed to 27f8a5184766adcfaab6be1712cee3001d07f5cd1de5b2e129576e1b0d35c20b
NOTE: recipe btrfs-tools-5.11.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 655 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 657 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_packagedata_setscene)
NOTE: Running setscene task 658 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-2.33-r0: task do_packagedata_setscene: Started
NOTE: recipe glibc-2.33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glibc-2.33-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 661 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 662 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 663 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-cross-mips-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-mips-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1880 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-5.11.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2114 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_configure)
NOTE: recipe btrfs-tools-5.11.1-r0: task do_configure: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_configure: Succeeded
NOTE: Running task 2115 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_compile)
NOTE: recipe btrfs-tools-5.11.1-r0: task do_compile: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_compile: Succeeded
NOTE: Running task 2116 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_install)
NOTE: recipe btrfs-tools-5.11.1-r0: task do_install: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_install: Succeeded
NOTE: Running task 2117 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_package)
NOTE: Running task 2118 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_populate_sysroot)
NOTE: recipe btrfs-tools-5.11.1-r0: task do_package: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_populate_sysroot: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe btrfs-tools-5.11.1-r0: task do_package: Succeeded
NOTE: Running task 2119 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_packagedata)
NOTE: recipe btrfs-tools-5.11.1-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2120 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm)
NOTE: Running task 2121 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_package_write_rpm)
NOTE: Running task 2122 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_package_qa)
NOTE: recipe btrfs-tools-5.11.1-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_package_qa: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_package_qa: Succeeded
NOTE: recipe btrfs-tools-5.11.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm unihash changed to 8e58298305046615dfdcfb2c0d3133b533a72af0a6cac711bd07146ec216a497
NOTE: Running noexec task 2123 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2123 tasks of which 2107 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 54 ERROR messages shown, returning a non-zero exit code.

--===============6714965246924207130==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-btrfs-tools-upgrade-5.10.1-5.11.1.patch"

From f36018bf16a593f57f4d1e48003f013fc854e8ac Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 03:46:10 +0000
Subject: [PATCH] btrfs-tools: upgrade 5.10.1 -> 5.11.1

---
 .../{btrfs-tools_5.10.1.bb => btrfs-tools_5.11.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_5.10.1.bb => btrfs-tools_5.11.1.bb} (97%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb
similarity index 97%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb
index fca010d4ae..9b152aeabf 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb
@@ -14,7 +14,7 @@ DEPENDS = "util-linux attr e2fsprogs lzo acl"
 DEPENDS_append_class-target = " udev"
 RDEPENDS_${PN} = "libgcc"
 
-SRCREV = "f2ffce38b9c1477a7350bfe165f0e34b9bde40f5"
+SRCREV = "8d5051f279f7994fb80536ef8f846f06d121d898"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-- 
2.27.0


--===============6714965246924207130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 49 skipped, 0 masked, 0 errors.
Removing 2 recipes from the armv7vet2hf-neon sysroot...done.
Removing 2 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.50.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:60a48af8a14153f29719874c7c6ae94ea521def5"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 33 Local 25 Network 0 Missed 8 Current 631 (75% match, 98% complete)
Removing 1 stale sstate objects for arch qemuarm...done.
Removing 6 stale sstate objects for arch armv7vet2hf-neon...done.
NOTE: Executing Tasks
NOTE: Running setscene task 632 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 634 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf-archive/autoconf-archive_2019.01.06.bb:do_packagedata_setscene)
NOTE: Running setscene task 635 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 644 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 645 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 646 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe autoconf-archive-2019.01.06-r0: task do_packagedata_setscene: Started
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glibc-2.33-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe autoconf-archive-2019.01.06-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 650 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glibc-2.33-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bison-3.7.5-r0: task do_packagedata_setscene: Started
NOTE: Running task 1017 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_fetch)
NOTE: recipe btrfs-tools-5.11.1-r0: task do_fetch: Started
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-src went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-dbg went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-staticdev went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-dev went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-doc went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
NOTE: recipe btrfs-tools-5.11.1-r0: task do_fetch: Succeeded
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
NOTE: Running task 1266 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_unpack)
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-af went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ast went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-be went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-bg went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ca went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-cs went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-da went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-de went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-el went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-eo went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-es went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-et went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-eu went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-fi went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-fr went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ga went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-gl went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-hr went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-hu went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ia went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
NOTE: recipe btrfs-tools-5.11.1-r0: task do_unpack: Started
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-id went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-it went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ja went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ko went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ky went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-lt went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-lv went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ms went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-nb went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-nl went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-pl went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-pt went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-pt-br went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ro went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ru went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-rw went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sk went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sl went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sq went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sr went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sv went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ta went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-th went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-tr went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-uk went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-vi went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-zh-cn went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
ERROR: bison-3.7.5-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-zh-tw went backwards which would break package feeds (from 0:3.7.6-r0 to 0:3.7.5-r0) [version-going-backwards]
NOTE: recipe btrfs-tools-5.11.1-r0: task do_unpack: Succeeded
NOTE: Running task 1267 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_patch)
NOTE: recipe bison-3.7.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 653 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-5.11.1-r0: task do_patch: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_patch: Succeeded
NOTE: Running task 1272 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1273 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_populate_lic)
NOTE: recipe btrfs-tools-5.11.1-r0: task do_populate_lic: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_populate_lic unihash changed to 27f8a5184766adcfaab6be1712cee3001d07f5cd1de5b2e129576e1b0d35c20b
NOTE: recipe btrfs-tools-5.11.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 655 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 657 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_packagedata_setscene)
NOTE: Running setscene task 658 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-2.33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.33-r0: task do_packagedata_setscene: Started
NOTE: recipe glibc-2.33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glibc-2.33-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 661 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 662 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 663 of 664 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-cross-arm-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-arm-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1880 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-5.11.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2114 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_configure)
NOTE: recipe btrfs-tools-5.11.1-r0: task do_configure: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_configure: Succeeded
NOTE: Running task 2115 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_compile)
NOTE: recipe btrfs-tools-5.11.1-r0: task do_compile: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_compile: Succeeded
NOTE: Running task 2116 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_install)
NOTE: recipe btrfs-tools-5.11.1-r0: task do_install: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_install: Succeeded
NOTE: Running task 2117 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_package)
NOTE: Running task 2118 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_populate_sysroot)
NOTE: recipe btrfs-tools-5.11.1-r0: task do_package: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_populate_sysroot: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe btrfs-tools-5.11.1-r0: task do_package: Succeeded
NOTE: Running task 2119 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_packagedata)
NOTE: recipe btrfs-tools-5.11.1-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2120 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm)
NOTE: Running task 2121 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_package_write_rpm)
NOTE: Running task 2122 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_package_qa)
NOTE: recipe btrfs-tools-5.11.1-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_package_qa: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm: Started
NOTE: recipe btrfs-tools-5.11.1-r0: task do_package_qa: Succeeded
NOTE: recipe btrfs-tools-5.11.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm unihash changed to ebc417704a7c2bd96d9d7e8afbef081fa55024661a9dc7efd22c146ab3496914
NOTE: Running noexec task 2123 of 2123 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2123 tasks of which 2107 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 54 ERROR messages shown, returning a non-zero exit code.

--===============6714965246924207130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGV changed from 5.10.1 [default] to 5.11.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 20518128 to 20588988 (+0%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: RRECOMMENDS: removed "util-linux-libmount-dbg"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PV changed from "5.10.1" to "5.11.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PKGV changed from 5.10.1 [default] to 5.11.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: RRECOMMENDS: removed "util-linux-libmount-dev"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PV changed from "5.10.1" to "5.11.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-doc: PKGV changed from 5.10.1 [default] to 5.11.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-doc: PV changed from "5.10.1" to "5.11.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-locale: PKGV changed from 5.10.1 [default] to 5.11.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-locale: PV changed from "5.10.1" to "5.11.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PKGV changed from 5.10.1 [default] to 5.11.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PKGSIZE changed from 3293887 to 3302756 (+0%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PV changed from "5.10.1" to "5.11.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-staticdev: PKGV changed from 5.10.1 [default] to 5.11.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-staticdev: PV changed from "5.10.1" to "5.11.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: RDEPENDS: removed "util-linux-libmount (['>= 2.36.2'])"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PKGV changed from 5.10.1 [default] to 5.11.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 6257090 to 6281666 (+0%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PV changed from "5.10.1" to "5.11.1"
packages/core2-32-poky-linux/btrfs-tools: PKGV changed from 5.10.1 [default] to 5.11.1 [default]
packages/core2-32-poky-linux/btrfs-tools: PV changed from "5.10.1" to "5.11.1"
Changes to packages/core2-32-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.9/site-packages/btrfsutil-5.10.1-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/btrfsutil-5.11.1-py3.9.egg-info

--===============6714965246924207130==--
