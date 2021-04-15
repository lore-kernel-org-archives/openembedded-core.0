Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.1348.1618510600151102655
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 9CC0238C1411
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:39 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libsolv: upgrading to 0.7.19 SUCCEEDED
Message-ID: <MADEUP.16761AD11D8DFA11.12681@lists.openembedded.org>
X-Groupsio-MsgNum: 150539
Content-Type: multipart/mixed; boundary="===============0474150348849617270=="

--===============0474150348849617270==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libsolv* to *0.7.19* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libsolv-upgrade-0.7.17-0.7.19.patch
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

--===============0474150348849617270==
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
meta-yocto-bsp       = "tmp-auh-upgrades:cbe25989b95703c8b34e6725e6f8ecdc68a2c19e"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 126 Local 119 Network 0 Missed 7 Current 567 (94% match, 98% complete)
Removing 8 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 603 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 613 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 631 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 675 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 676 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 679 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm_setscene)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe file-5.39-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 683 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_packagedata_setscene)
NOTE: recipe file-5.39-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1529 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_fetch)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsolv-0.7.19-r0: task do_fetch: Started
NOTE: recipe libsolv-0.7.19-r0: task do_fetch: Succeeded
NOTE: Running task 1984 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_unpack)
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-src went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-dbg went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-staticdev went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-dev went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-doc went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-build went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-sign went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-archive went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-rpm went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-ar went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-br went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-ca went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-cmn went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
NOTE: recipe libsolv-0.7.19-r0: task do_unpack: Started
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-cs went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-da went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-de went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-el went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-eo went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-es went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-fi went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-fr went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-id went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-is went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-it went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-ja went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-ko went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-ms went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-nb went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
NOTE: recipe libsolv-0.7.19-r0: task do_unpack: Succeeded
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-nl went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
NOTE: Running task 2122 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_patch)
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-pl went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-pt went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-pt-br went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-ru went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-sk went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-sl went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-sr went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-sr+latin went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-sv went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-te went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-tr went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-uk went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-vi went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-zh-cn went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-zh-tw went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
NOTE: recipe libsolv-0.7.19-r0: task do_patch: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 685 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_packagedata_setscene)
NOTE: Running setscene task 686 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 687 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 688 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata_setscene)
NOTE: recipe libsolv-0.7.19-r0: task do_patch: Succeeded
NOTE: Running task 2123 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_generate_toolchain_file)
NOTE: Running task 2124 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_deploy_source_date_epoch)
NOTE: Running task 2125 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_populate_lic)
NOTE: recipe popt-1.18-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.39-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata_setscene: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsolv-0.7.19-r0: task do_populate_lic: Started
NOTE: recipe libsolv-0.7.19-r0: task do_generate_toolchain_file: Started
NOTE: recipe libsolv-0.7.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsolv-0.7.19-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libsolv-0.7.19-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_populate_lic unihash changed to 61bb4c6c621a75428345e302668b2559bc1f1e79ebd70369a0d963db07496c17
NOTE: recipe libsolv-0.7.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 691 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2182 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsolv-0.7.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsolv-0.7.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2187 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_configure)
NOTE: recipe libsolv-0.7.19-r0: task do_configure: Started
NOTE: recipe libsolv-0.7.19-r0: task do_configure: Succeeded
NOTE: Running task 2188 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_compile)
NOTE: recipe libsolv-0.7.19-r0: task do_compile: Started
NOTE: recipe libsolv-0.7.19-r0: task do_compile: Succeeded
NOTE: Running task 2189 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_install)
NOTE: recipe libsolv-0.7.19-r0: task do_install: Started
NOTE: recipe libsolv-0.7.19-r0: task do_install: Succeeded
NOTE: Running task 2190 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_package)
NOTE: Running task 2191 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_populate_sysroot)
NOTE: recipe libsolv-0.7.19-r0: task do_package: Started
NOTE: recipe libsolv-0.7.19-r0: task do_populate_sysroot: Started
NOTE: recipe libsolv-0.7.19-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsolv-0.7.19-r0: task do_package: Succeeded
NOTE: Running task 2192 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_packagedata)
NOTE: recipe libsolv-0.7.19-r0: task do_packagedata: Started
NOTE: recipe libsolv-0.7.19-r0: task do_packagedata: Succeeded
NOTE: Running task 2193 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_package_write_rpm)
NOTE: Running task 2194 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_package_qa)
NOTE: recipe libsolv-0.7.19-r0: task do_package_write_rpm: Started
NOTE: recipe libsolv-0.7.19-r0: task do_package_qa: Started
NOTE: recipe libsolv-0.7.19-r0: task do_package_qa: Succeeded
NOTE: recipe libsolv-0.7.19-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2195 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_build)
NOTE: Tasks Summary: Attempted 2195 tasks of which 2179 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 45 ERROR messages shown, returning a non-zero exit code.

--===============0474150348849617270==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libsolv-upgrade-0.7.17-0.7.19.patch"

From 84a56838f85b2e6d630af15fba1ca857d0af23db Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 09:12:00 +0000
Subject: [PATCH] libsolv: upgrade 0.7.17 -> 0.7.19

---
 .../libsolv/{libsolv_0.7.17.bb => libsolv_0.7.19.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.17.bb => libsolv_0.7.19.bb} (95%)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.17.bb b/meta/recipes-extended/libsolv/libsolv_0.7.19.bb
similarity index 95%
rename from meta/recipes-extended/libsolv/libsolv_0.7.17.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.19.bb
index fa6e8a3c4d..98e106f6f8 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.17.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.19.bb
@@ -11,7 +11,7 @@ DEPENDS = "expat zlib"
 SRC_URI = "git://github.com/openSUSE/libsolv.git \
 "
 
-SRCREV = "4bc791c0d235eb14bfe4c5da607206bfdfa6983d"
+SRCREV = "c773294be6b0a2425f344a8999f173fb00cfd16f"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.27.0


--===============0474150348849617270==
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
meta-yocto-bsp       = "tmp-auh-upgrades:cbe25989b95703c8b34e6725e6f8ecdc68a2c19e"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 126 Local 119 Network 0 Missed 7 Current 567 (94% match, 98% complete)
Removing 8 stale sstate objects for arch ppc7400...done.
NOTE: Executing Tasks
NOTE: Running setscene task 603 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 613 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 631 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 675 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 676 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 679 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm_setscene)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe file-5.39-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 683 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_packagedata_setscene)
NOTE: recipe file-5.39-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1529 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_fetch)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsolv-0.7.19-r0: task do_fetch: Started
NOTE: recipe libsolv-0.7.19-r0: task do_fetch: Succeeded
NOTE: Running task 1974 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_unpack)
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-src went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-dbg went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-staticdev went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-dev went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-doc went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-build went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-sign went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-archive went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-rpm went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-ar went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-br went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-ca went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-cmn went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-cs went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-da went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-de went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-el went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-eo went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-es went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-fi went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-fr went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-id went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-is went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-it went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-ja went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-ko went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-ms went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-nb went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-nl went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-pl went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-pt went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-pt-br went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-ru went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-sk went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-sl went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-sr went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-sr+latin went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-sv went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
NOTE: recipe libsolv-0.7.19-r0: task do_unpack: Started
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-te went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-tr went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-uk went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-vi went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-zh-cn went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-zh-tw went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
NOTE: recipe rpm-1_4.16.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 685 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_packagedata_setscene)
NOTE: Running setscene task 686 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 687 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 688 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata_setscene)
NOTE: recipe libsolv-0.7.19-r0: task do_unpack: Succeeded
NOTE: Running task 2122 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.39-r0: task do_packagedata_setscene: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsolv-0.7.19-r0: task do_patch: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsolv-0.7.19-r0: task do_patch: Succeeded
NOTE: Running task 2127 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_generate_toolchain_file)
NOTE: Running task 2128 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_deploy_source_date_epoch)
NOTE: Running task 2129 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_populate_lic)
NOTE: recipe libsolv-0.7.19-r0: task do_populate_lic: Started
NOTE: recipe libsolv-0.7.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsolv-0.7.19-r0: task do_generate_toolchain_file: Started
NOTE: recipe libsolv-0.7.19-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libsolv-0.7.19-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_populate_lic unihash changed to 61bb4c6c621a75428345e302668b2559bc1f1e79ebd70369a0d963db07496c17
NOTE: recipe libsolv-0.7.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 691 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2182 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsolv-0.7.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsolv-0.7.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2187 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_configure)
NOTE: recipe libsolv-0.7.19-r0: task do_configure: Started
NOTE: recipe libsolv-0.7.19-r0: task do_configure: Succeeded
NOTE: Running task 2188 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_compile)
NOTE: recipe libsolv-0.7.19-r0: task do_compile: Started
NOTE: recipe libsolv-0.7.19-r0: task do_compile: Succeeded
NOTE: Running task 2189 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_install)
NOTE: recipe libsolv-0.7.19-r0: task do_install: Started
NOTE: recipe libsolv-0.7.19-r0: task do_install: Succeeded
NOTE: Running task 2190 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_package)
NOTE: Running task 2191 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_populate_sysroot)
NOTE: recipe libsolv-0.7.19-r0: task do_package: Started
NOTE: recipe libsolv-0.7.19-r0: task do_populate_sysroot: Started
NOTE: recipe libsolv-0.7.19-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsolv-0.7.19-r0: task do_package: Succeeded
NOTE: Running task 2192 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_packagedata)
NOTE: recipe libsolv-0.7.19-r0: task do_packagedata: Started
NOTE: recipe libsolv-0.7.19-r0: task do_packagedata: Succeeded
NOTE: Running task 2193 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_package_write_rpm)
NOTE: Running task 2194 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_package_qa)
NOTE: recipe libsolv-0.7.19-r0: task do_package_write_rpm: Started
NOTE: recipe libsolv-0.7.19-r0: task do_package_qa: Started
NOTE: recipe libsolv-0.7.19-r0: task do_package_qa: Succeeded
NOTE: recipe libsolv-0.7.19-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2195 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_build)
NOTE: Tasks Summary: Attempted 2195 tasks of which 2179 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 45 ERROR messages shown, returning a non-zero exit code.

--===============0474150348849617270==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 41 skipped, 0 masked, 0 errors.
Removing 97 recipes from the core2-32 sysroot...done.
Removing 102 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:cbe25989b95703c8b34e6725e6f8ecdc68a2c19e"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 514 Local 506 Network 0 Missed 8 Current 190 (98% match, 98% complete)
Removing 4 stale sstate objects for arch x86_64_i686...done.
NOTE: Executing Tasks
NOTE: Running setscene task 191 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 192 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 193 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 194 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 195 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 196 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 197 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 198 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 199 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 200 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 201 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 202 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 203 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 204 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 205 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 206 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 207 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 208 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 209 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 210 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 211 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 213 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 214 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 215 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 216 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 217 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 219 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 220 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 222 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 224 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 225 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 226 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 227 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 228 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 229 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 230 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 231 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 232 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 233 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 234 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 235 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 236 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 237 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 238 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 239 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 241 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 242 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 243 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 244 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 245 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 246 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 247 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 248 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 249 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 250 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 257 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-247.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe file-5.39-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 258 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 260 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 261 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 262 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 263 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 264 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 265 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-1_247.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 266 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 267 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 268 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 269 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 270 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 272 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-247.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 273 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 274 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 276 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 277 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 278 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 279 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 280 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package_write_rpm_setscene)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 281 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 282 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 283 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 284 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 285 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 286 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe file-5.39-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 287 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 288 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 289 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.9.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 290 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 291 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 292 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 293 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 294 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 295 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 296 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 297 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 298 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 299 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 300 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 301 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_247.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 302 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 303 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_packagedata_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 306 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: Running setscene task 307 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 308 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 309 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 311 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 312 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 313 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 314 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 315 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm_setscene)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 316 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 317 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata_setscene)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 318 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 319 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 320 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 321 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 322 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_package_write_rpm_setscene)
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 323 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 324 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata_setscene)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 325 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 326 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 327 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata_setscene)
NOTE: Running setscene task 328 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 329 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 330 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 331 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 332 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe systemd-conf-247.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 335 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_package_write_rpm_setscene)
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_deploy_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 336 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 339 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-2.48-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 340 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 343 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe popt-1.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 347 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_packagedata_setscene)
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 352 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 356 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 358 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 361 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 363 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 364 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-247.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sqlite3-3_3.35.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 369 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_deploy_setscene: Succeeded
NOTE: Running setscene task 370 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-src went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-dbg went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-staticdev went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm_setscene: Succeeded
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-dev went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-doc went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm_setscene: Succeeded
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-build went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-sign went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-archive went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
NOTE: recipe popt-1.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 377 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-rpm went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 378 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 379 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_packagedata_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.35.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 380 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 381 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 382 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata_setscene)
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 386 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_packagedata_setscene)
NOTE: Running setscene task 387 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 388 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_packagedata_setscene)
NOTE: Running setscene task 389 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 390 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 391 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 392 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 393 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 716 of 2216 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_fetch)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 413 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_packagedata_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.18-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.39-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 421 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsolv-0.7.19-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bison-3.7.5-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsolv-0.7.19-r0: task do_fetch: Succeeded
NOTE: Running task 974 of 2216 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_unpack)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 435 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 437 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 438 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 439 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 441 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 442 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 445 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 446 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 447 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_populate_sysroot_setscene)
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 452 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsolv-0.7.19-r0: task do_unpack: Started
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe popt-1.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 455 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-obstack-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bison-3.7.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsolv-0.7.19-r0: task do_unpack: Succeeded
NOTE: Running task 1016 of 2216 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_patch)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 461 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 465 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 467 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 469 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsolv-0.7.19-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 473 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsolv-0.7.19-r0: task do_patch: Succeeded
NOTE: Running task 1042 of 2216 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_generate_toolchain_file)
NOTE: Running task 1043 of 2216 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_deploy_source_date_epoch)
NOTE: Running task 1044 of 2216 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_populate_lic)
NOTE: recipe libgpg-error-1.41-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsolv-0.7.19-r0: task do_populate_lic: Started
NOTE: recipe libsolv-0.7.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsolv-0.7.19-r0: task do_generate_toolchain_file: Started
NOTE: recipe libgpg-error-1.41-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsolv-0.7.19-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libsolv-0.7.19-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_populate_lic unihash changed to 61bb4c6c621a75428345e302668b2559bc1f1e79ebd70369a0d963db07496c17
NOTE: recipe libsolv-0.7.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 475 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 476 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 478 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 481 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 482 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 483 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 484 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 485 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 486 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 487 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_247.4-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_247.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 491 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 492 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 493 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 495 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_247.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 497 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 498 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 499 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 500 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 501 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 502 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 504 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_packagedata_setscene)
NOTE: recipe systemd-1_247.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 505 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 506 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 507 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 508 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 509 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 510 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 511 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 512 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 514 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 515 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 516 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-28-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_247.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-1_247.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 518 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 522 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 524 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 525 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 526 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 527 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 528 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 530 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 531 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 532 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 533 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 534 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 536 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 540 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 542 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 543 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 544 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 545 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 548 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: Running setscene task 549 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: Running setscene task 551 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 552 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 553 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 555 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 557 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 558 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 559 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 560 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 561 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 562 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 563 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 564 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 567 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 569 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 571 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 573 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 575 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 576 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 577 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 579 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 581 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 583 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 585 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 586 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 587 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 588 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 591 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 593 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 595 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_packagedata_setscene)
NOTE: Running setscene task 596 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 597 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 598 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 599 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 600 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 602 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 603 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.35.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 608 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 611 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 612 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 613 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 614 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 615 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 616 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 617 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 618 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 619 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 620 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.35.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 624 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 625 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 626 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 627 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 628 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.36.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 629 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 630 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 631 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 632 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.35.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 634 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 635 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 636 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 637 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 638 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 639 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 641 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 642 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 643 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 644 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 645 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 647 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 649 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 651 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 653 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 654 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 655 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 657 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 659 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 660 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 661 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 662 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 663 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 665 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 667 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 668 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 671 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 673 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 674 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 675 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 677 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 678 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 679 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 681 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 682 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 683 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 685 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 686 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 687 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 688 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 689 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 690 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 696 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 697 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 698 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 700 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 701 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 702 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 703 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 704 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1968 of 2216 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsolv-0.7.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsolv-0.7.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2208 of 2216 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_configure)
NOTE: recipe libsolv-0.7.19-r0: task do_configure: Started
NOTE: recipe libsolv-0.7.19-r0: task do_configure: Succeeded
NOTE: Running task 2209 of 2216 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_compile)
NOTE: recipe libsolv-0.7.19-r0: task do_compile: Started
NOTE: recipe libsolv-0.7.19-r0: task do_compile: Succeeded
NOTE: Running task 2210 of 2216 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_install)
NOTE: recipe libsolv-0.7.19-r0: task do_install: Started
NOTE: recipe libsolv-0.7.19-r0: task do_install: Succeeded
NOTE: Running task 2211 of 2216 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_package)
NOTE: Running task 2212 of 2216 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_populate_sysroot)
NOTE: recipe libsolv-0.7.19-r0: task do_package: Started
NOTE: recipe libsolv-0.7.19-r0: task do_populate_sysroot: Started
NOTE: recipe libsolv-0.7.19-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsolv-0.7.19-r0: task do_package: Succeeded
NOTE: Running task 2213 of 2216 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_packagedata)
NOTE: recipe libsolv-0.7.19-r0: task do_packagedata: Started
NOTE: recipe libsolv-0.7.19-r0: task do_packagedata: Succeeded
NOTE: Running task 2214 of 2216 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_package_write_rpm)
NOTE: Running task 2215 of 2216 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_package_qa)
NOTE: recipe libsolv-0.7.19-r0: task do_package_write_rpm: Started
NOTE: recipe libsolv-0.7.19-r0: task do_package_qa: Started
NOTE: recipe libsolv-0.7.19-r0: task do_package_qa: Succeeded
NOTE: recipe libsolv-0.7.19-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2216 of 2216 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_build)
NOTE: Tasks Summary: Attempted 2216 tasks of which 2200 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 11 ERROR messages shown, returning a non-zero exit code.

--===============0474150348849617270==
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
meta-yocto-bsp       = "tmp-auh-upgrades:cbe25989b95703c8b34e6725e6f8ecdc68a2c19e"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 126 Local 119 Network 0 Missed 7 Current 567 (94% match, 98% complete)
Removing 8 stale sstate objects for arch mips32r2...done.
NOTE: Executing Tasks
NOTE: Running setscene task 603 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 613 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 631 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 675 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 676 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 679 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm_setscene)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe file-5.39-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 1529 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_fetch)
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe file-5.39-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 683 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_packagedata_setscene)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsolv-0.7.19-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsolv-0.7.19-r0: task do_fetch: Succeeded
NOTE: Running task 1978 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_unpack)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsolv-0.7.19-r0: task do_unpack: Started
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-src went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-dbg went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-staticdev went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-dev went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
NOTE: recipe libsolv-0.7.19-r0: task do_unpack: Succeeded
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-doc went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
NOTE: Running task 2122 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_patch)
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-build went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-sign went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-archive went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-rpm went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-ar went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-br went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-ca went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-cmn went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-cs went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-da went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-de went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
NOTE: recipe libsolv-0.7.19-r0: task do_patch: Started
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-el went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-eo went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-es went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-fi went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-fr went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-id went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-is went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-it went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-ja went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-ko went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-ms went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-nb went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-nl went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-pl went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-pt went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-pt-br went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-ru went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-sk went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-sl went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-sr went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-sr+latin went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-sv went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
NOTE: recipe libsolv-0.7.19-r0: task do_patch: Succeeded
NOTE: Running task 2123 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_generate_toolchain_file)
NOTE: Running task 2124 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_deploy_source_date_epoch)
NOTE: Running task 2125 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_populate_lic)
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-te went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-tr went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-uk went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-vi went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-zh-cn went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-zh-tw went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
NOTE: recipe rpm-1_4.16.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 685 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_packagedata_setscene)
NOTE: Running setscene task 686 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 687 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 688 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata_setscene)
NOTE: recipe libsolv-0.7.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsolv-0.7.19-r0: task do_populate_lic: Started
NOTE: recipe libsolv-0.7.19-r0: task do_generate_toolchain_file: Started
NOTE: recipe libsolv-0.7.19-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe file-5.39-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata_setscene: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsolv-0.7.19-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_populate_lic unihash changed to 61bb4c6c621a75428345e302668b2559bc1f1e79ebd70369a0d963db07496c17
NOTE: recipe libsolv-0.7.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe file-5.39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 691 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2182 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsolv-0.7.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsolv-0.7.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2187 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_configure)
NOTE: recipe libsolv-0.7.19-r0: task do_configure: Started
NOTE: recipe libsolv-0.7.19-r0: task do_configure: Succeeded
NOTE: Running task 2188 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_compile)
NOTE: recipe libsolv-0.7.19-r0: task do_compile: Started
NOTE: recipe libsolv-0.7.19-r0: task do_compile: Succeeded
NOTE: Running task 2189 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_install)
NOTE: recipe libsolv-0.7.19-r0: task do_install: Started
NOTE: recipe libsolv-0.7.19-r0: task do_install: Succeeded
NOTE: Running task 2190 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_package)
NOTE: Running task 2191 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_populate_sysroot)
NOTE: recipe libsolv-0.7.19-r0: task do_package: Started
NOTE: recipe libsolv-0.7.19-r0: task do_populate_sysroot: Started
NOTE: recipe libsolv-0.7.19-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsolv-0.7.19-r0: task do_package: Succeeded
NOTE: Running task 2192 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_packagedata)
NOTE: recipe libsolv-0.7.19-r0: task do_packagedata: Started
NOTE: recipe libsolv-0.7.19-r0: task do_packagedata: Succeeded
NOTE: Running task 2193 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_package_write_rpm)
NOTE: Running task 2194 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_package_qa)
NOTE: recipe libsolv-0.7.19-r0: task do_package_write_rpm: Started
NOTE: recipe libsolv-0.7.19-r0: task do_package_qa: Started
NOTE: recipe libsolv-0.7.19-r0: task do_package_qa: Succeeded
NOTE: recipe libsolv-0.7.19-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2195 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_build)
NOTE: Tasks Summary: Attempted 2195 tasks of which 2179 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 45 ERROR messages shown, returning a non-zero exit code.

--===============0474150348849617270==
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
meta-yocto-bsp       = "tmp-auh-upgrades:cbe25989b95703c8b34e6725e6f8ecdc68a2c19e"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 126 Local 119 Network 0 Missed 7 Current 567 (94% match, 98% complete)
Removing 8 stale sstate objects for arch armv7vet2hf-neon...done.
NOTE: Executing Tasks
NOTE: Running setscene task 603 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 613 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 631 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 675 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 676 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 679 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm_setscene)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe file-5.39-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 1529 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_fetch)
NOTE: recipe popt-1.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 683 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe file-5.39-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsolv-0.7.19-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsolv-0.7.19-r0: task do_fetch: Succeeded
NOTE: Running task 1887 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_unpack)
NOTE: recipe libsolv-0.7.19-r0: task do_unpack: Started
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-src went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-dbg went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-staticdev went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-dev went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-doc went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-build went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-sign went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-archive went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-rpm went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-ar went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-br went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-ca went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-cmn went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-cs went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-da went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-de went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-el went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-eo went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-es went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-fi went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-fr went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-id went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
NOTE: recipe libsolv-0.7.19-r0: task do_unpack: Succeeded
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-is went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
NOTE: Running task 2122 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_patch)
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-it went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-ja went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-ko went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-ms went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-nb went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-nl went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-pl went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-pt went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-pt-br went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-ru went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-sk went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-sl went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-sr went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
NOTE: recipe libsolv-0.7.19-r0: task do_patch: Started
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-sr+latin went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-sv went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-te went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-tr went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-uk went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-vi went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-zh-cn went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
ERROR: rpm-1_4.16.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package rpm-locale-zh-tw went backwards which would break package feeds (from 1:4.16.1.3-r0 to 1:4.16.1.2-r0) [version-going-backwards]
NOTE: recipe libsolv-0.7.19-r0: task do_patch: Succeeded
NOTE: Running task 2123 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_generate_toolchain_file)
NOTE: Running task 2124 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_deploy_source_date_epoch)
NOTE: Running task 2125 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_populate_lic)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 685 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_packagedata_setscene)
NOTE: Running setscene task 686 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 687 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 688 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata_setscene)
NOTE: recipe libsolv-0.7.19-r0: task do_populate_lic: Started
NOTE: recipe libsolv-0.7.19-r0: task do_generate_toolchain_file: Started
NOTE: recipe libsolv-0.7.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.39-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata_setscene: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsolv-0.7.19-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsolv-0.7.19-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_populate_lic unihash changed to 61bb4c6c621a75428345e302668b2559bc1f1e79ebd70369a0d963db07496c17
NOTE: recipe libsolv-0.7.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 691 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2182 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsolv-0.7.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsolv-0.7.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2187 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_configure)
NOTE: recipe libsolv-0.7.19-r0: task do_configure: Started
NOTE: recipe libsolv-0.7.19-r0: task do_configure: Succeeded
NOTE: Running task 2188 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_compile)
NOTE: recipe libsolv-0.7.19-r0: task do_compile: Started
NOTE: recipe libsolv-0.7.19-r0: task do_compile: Succeeded
NOTE: Running task 2189 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_install)
NOTE: recipe libsolv-0.7.19-r0: task do_install: Started
NOTE: recipe libsolv-0.7.19-r0: task do_install: Succeeded
NOTE: Running task 2190 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_package)
NOTE: Running task 2191 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_populate_sysroot)
NOTE: recipe libsolv-0.7.19-r0: task do_package: Started
NOTE: recipe libsolv-0.7.19-r0: task do_populate_sysroot: Started
NOTE: recipe libsolv-0.7.19-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsolv-0.7.19-r0: task do_package: Succeeded
NOTE: Running task 2192 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_packagedata)
NOTE: recipe libsolv-0.7.19-r0: task do_packagedata: Started
NOTE: recipe libsolv-0.7.19-r0: task do_packagedata: Succeeded
NOTE: Running task 2193 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_package_write_rpm)
NOTE: Running task 2194 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_package_qa)
NOTE: recipe libsolv-0.7.19-r0: task do_package_write_rpm: Started
NOTE: recipe libsolv-0.7.19-r0: task do_package_qa: Started
NOTE: recipe libsolv-0.7.19-r0: task do_package_qa: Succeeded
NOTE: recipe libsolv-0.7.19-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2195 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.19.bb:do_build)
NOTE: Tasks Summary: Attempted 2195 tasks of which 2179 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 45 ERROR messages shown, returning a non-zero exit code.

--===============0474150348849617270==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libsolv: PKGV changed from 0.7.17 [default] to 0.7.19 [default]
packages/core2-32-poky-linux/libsolv: PV changed from "0.7.17" to "0.7.19"
packages/core2-32-poky-linux/libsolv/libsolv-dbg: PV changed from "0.7.17" to "0.7.19"
packages/core2-32-poky-linux/libsolv/libsolv-dbg: PKGSIZE changed from 2646576 to 2646152 (-0%)
packages/core2-32-poky-linux/libsolv/libsolv-dbg: PKGV changed from 0.7.17 [default] to 0.7.19 [default]
packages/core2-32-poky-linux/libsolv/libsolv-dev: PV changed from "0.7.17" to "0.7.19"
packages/core2-32-poky-linux/libsolv/libsolv-dev: PKGV changed from 0.7.17 [default] to 0.7.19 [default]
packages/core2-32-poky-linux/libsolv/libsolv-doc: PV changed from "0.7.17" to "0.7.19"
packages/core2-32-poky-linux/libsolv/libsolv-doc: PKGV changed from 0.7.17 [default] to 0.7.19 [default]
packages/core2-32-poky-linux/libsolv/libsolv-locale: PV changed from "0.7.17" to "0.7.19"
packages/core2-32-poky-linux/libsolv/libsolv-locale: PKGV changed from 0.7.17 [default] to 0.7.19 [default]
packages/core2-32-poky-linux/libsolv/libsolv-src: PV changed from "0.7.17" to "0.7.19"
packages/core2-32-poky-linux/libsolv/libsolv-src: PKGSIZE changed from 1565297 to 1565954 (+0%)
packages/core2-32-poky-linux/libsolv/libsolv-src: PKGV changed from 0.7.17 [default] to 0.7.19 [default]
packages/core2-32-poky-linux/libsolv/libsolv-staticdev: PV changed from "0.7.17" to "0.7.19"
packages/core2-32-poky-linux/libsolv/libsolv-staticdev: PKGV changed from 0.7.17 [default] to 0.7.19 [default]
packages/core2-32-poky-linux/libsolv/libsolv-tools: PV changed from "0.7.17" to "0.7.19"
packages/core2-32-poky-linux/libsolv/libsolv-tools: PKGV changed from 0.7.17 [default] to 0.7.19 [default]
packages/core2-32-poky-linux/libsolv/libsolv: PKGV changed from 0.7.17 [default] to 0.7.19 [default]
packages/core2-32-poky-linux/libsolv/libsolv: PV changed from "0.7.17" to "0.7.19"
packages/core2-32-poky-linux/libsolv/libsolvext: PKGV changed from 0.7.17 [default] to 0.7.19 [default]
packages/core2-32-poky-linux/libsolv/libsolvext: PV changed from "0.7.17" to "0.7.19"

--===============0474150348849617270==--
