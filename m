Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.12222.1602843683341884250
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 50E1338C1754
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:22 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] createrepo-c: upgrading to 0.16.1 SUCCEEDED
Message-ID: <MADEUP.163E71D685161B67.13247@lists.openembedded.org>
X-Groupsio-MsgNum: 143428
Content-Type: multipart/mixed; boundary="===============4106626212456116026=="

--===============4106626212456116026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *createrepo-c* to *0.16.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-createrepo-c-upgrade-0.16.0-0.16.1.patch
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

--===============4106626212456116026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so.0 changed symlink target from libcreaterepo_c.so.0.16.0 to libcreaterepo_c.so.0.16.1
  /usr/lib/libcreaterepo_c.so.0.16.0 moved to /usr/lib/libcreaterepo_c.so.0.16.1
  /usr/lib/python3.8/site-packages/createrepo_c-0.16.0-py3.8.egg-info moved to /usr/lib/python3.8/site-packages/createrepo_c-0.16.1-py3.8.egg-info

--===============4106626212456116026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1403 entries from dependency cache.
Parsing recipes...done.
Parsing of 785 .bb files complete (784 cached, 1 parsed). 1356 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20201016"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:40aa2047ab2558ce45a882c473389ca9d6af58e0"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 62 Found 34 Missed 28 Current 695 (54% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 706 of 757 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.2.bb:do_package_write_rpm_setscene)
NOTE: recipe bison-3.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 755 of 757 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.2.bb:do_packagedata_setscene)
NOTE: recipe bison-3.7.2-r0: task do_packagedata_setscene: Started
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-src went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-dbg went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-staticdev went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-dev went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-doc went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-af went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ast went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-be went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-bg went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ca went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-cs went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-da went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-de went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-el went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-eo went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-es went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-et went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-eu went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-fi went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-fr went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ga went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-gl went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-hr went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-hu went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ia went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-id went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-it went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ja went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ko went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ky went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-lt went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-lv went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ms went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-nb went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-nl went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-pl went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-pt went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-pt-br went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ro went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ru went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-rw went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sk went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sl went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sq went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sr went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
NOTE: Running task 1298 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_fetch)
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sv went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ta went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-th went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-tr went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-uk went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-vi went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-zh-cn went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-zh-tw went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
NOTE: Running task 1386 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: recipe bison-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1491 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_fetch)
NOTE: Running task 1492 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_fetch)
NOTE: Setscene tasks completed
NOTE: recipe file-5.39-r0: task do_fetch: Started
NOTE: recipe file-5.39-r0: task do_fetch: Succeeded
NOTE: Running task 1561 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_unpack)
NOTE: Running task 1562 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: Running task 1604 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_fetch)
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: Running task 1617 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 1637 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.15.1-r0: task do_fetch: Started
NOTE: recipe curl-7.72.0-r0: task do_fetch: Started
NOTE: recipe file-5.39-r0: task do_unpack: Started
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.72.0-r0: task do_fetch: Succeeded
NOTE: Running task 1880 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_unpack)
NOTE: Running task 1881 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-0.16.1-r0: task do_fetch: Succeeded
NOTE: Running task 1947 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_unpack)
NOTE: recipe rpm-1_4.15.1-r0: task do_fetch: Succeeded
NOTE: Running task 1962 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_unpack)
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: Running task 2006 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe curl-7.72.0-r0: task do_unpack: Started
NOTE: recipe curl-7.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_unpack: Started
NOTE: recipe file-5.39-r0: task do_unpack: Succeeded
NOTE: Running task 2183 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe file-5.39-r0: task do_patch: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_unpack: Succeeded
NOTE: Running task 2299 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_patch)
NOTE: recipe createrepo-c-0.16.1-r0: task do_patch: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_unpack: Succeeded
NOTE: recipe file-5.39-r0: task do_patch: Succeeded
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2300 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_deploy_source_date_epoch)
NOTE: Running task 2301 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2302 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_patch: Succeeded
NOTE: Running task 2303 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_generate_toolchain_file)
NOTE: Running task 2304 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2305 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_populate_lic)
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2306 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_configure)
NOTE: recipe createrepo-c-0.16.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_populate_lic: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2307 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe createrepo-c-0.16.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe curl-7.72.0-r0: task do_unpack: Succeeded
NOTE: recipe file-5.39-r0: task do_configure: Started
NOTE: Running task 2308 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_populate_lic unihash changed to 0d807259f9432d4e24f72a574eb38d856fe80525740cbfedc25d256aa7dcfa33
NOTE: recipe createrepo-c-0.16.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.72.0-r0: task do_patch: Started
NOTE: recipe curl-7.72.0-r0: task do_patch: Succeeded
NOTE: Running task 2309 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2310 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_configure)
NOTE: recipe curl-7.72.0-r0: task do_configure: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_patch: Succeeded
NOTE: Running task 2311 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 2312 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 2313 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe file-5.39-r0: task do_configure: Succeeded
NOTE: Running task 2314 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_compile)
NOTE: recipe file-5.39-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 2315 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 2316 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.39-r0: task do_compile: Succeeded
NOTE: Running task 2317 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_install)
NOTE: recipe file-5.39-r0: task do_install: Started
NOTE: recipe file-5.39-r0: task do_install: Succeeded
NOTE: Running task 2318 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_populate_sysroot)
NOTE: Running task 2319 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package)
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.39-r0: task do_package: Started
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2320 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 2321 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 2322 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm)
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Started
NOTE: recipe file-5.39-r0: task do_package: Succeeded
NOTE: Running task 2323 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_packagedata)
NOTE: recipe file-5.39-r0: task do_packagedata: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe file-5.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2324 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package_write_rpm)
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2325 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_configure)
NOTE: recipe rpm-1_4.15.1-r0: task do_configure: Started
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.15.1-r0: task do_configure: Succeeded
NOTE: Running task 2326 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_compile)
NOTE: recipe curl-7.72.0-r0: task do_configure: Succeeded
NOTE: Running task 2327 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_compile)
NOTE: recipe rpm-1_4.15.1-r0: task do_compile: Started
NOTE: recipe curl-7.72.0-r0: task do_compile: Started
NOTE: recipe curl-7.72.0-r0: task do_compile: Succeeded
NOTE: Running task 2328 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_install)
NOTE: recipe curl-7.72.0-r0: task do_install: Started
NOTE: recipe curl-7.72.0-r0: task do_install: Succeeded
NOTE: Running task 2329 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_package)
NOTE: Running task 2330 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_populate_sysroot)
NOTE: recipe curl-7.72.0-r0: task do_package: Started
NOTE: recipe curl-7.72.0-r0: task do_populate_sysroot: Started
NOTE: recipe curl-7.72.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.15.1-r0: task do_compile: Succeeded
NOTE: Running task 2331 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_install)
NOTE: recipe rpm-1_4.15.1-r0: task do_install: Started
NOTE: recipe curl-7.72.0-r0: task do_package: Succeeded
NOTE: Running task 2332 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_packagedata)
NOTE: recipe curl-7.72.0-r0: task do_packagedata: Started
NOTE: recipe curl-7.72.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2333 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.15.1-r0: task do_install: Succeeded
NOTE: Running task 2334 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_package)
NOTE: Running task 2335 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_populate_sysroot)
NOTE: recipe curl-7.72.0-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_package: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2336 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-0.16.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.72.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe createrepo-c-0.16.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2337 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_configure)
NOTE: recipe createrepo-c-0.16.1-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_configure: Succeeded
NOTE: Running task 2338 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_compile)
NOTE: recipe createrepo-c-0.16.1-r0: task do_compile: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_compile: Succeeded
NOTE: Running task 2339 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_install)
NOTE: recipe rpm-1_4.15.1-r0: task do_package: Succeeded
NOTE: Running task 2340 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_packagedata)
NOTE: recipe createrepo-c-0.16.1-r0: task do_install: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_install: Succeeded
NOTE: Running task 2341 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_populate_sysroot)
NOTE: recipe createrepo-c-0.16.1-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2342 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_package)
NOTE: Running task 2343 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_package_write_rpm)
NOTE: recipe createrepo-c-0.16.1-r0: task do_package: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.15.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe createrepo-c-0.16.1-r0: task do_package: Succeeded
NOTE: Running task 2344 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_packagedata)
NOTE: recipe createrepo-c-0.16.1-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2345 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_package_write_rpm)
NOTE: Running task 2346 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_package_qa)
NOTE: recipe createrepo-c-0.16.1-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_package_qa: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_package_qa: Succeeded
NOTE: recipe createrepo-c-0.16.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2347 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2347 tasks of which 2283 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 54 ERROR messages shown, returning a non-zero exit code.

--===============4106626212456116026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 1384 entries from dependency cache.
Parsing recipes...done.
Parsing of 785 .bb files complete (781 cached, 4 parsed). 1356 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20201016"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:40aa2047ab2558ce45a882c473389ca9d6af58e0"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 63 Found 35 Missed 28 Current 694 (55% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 705 of 757 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.2.bb:do_package_write_rpm_setscene)
NOTE: recipe bison-3.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 755 of 757 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.2.bb:do_packagedata_setscene)
NOTE: recipe bison-3.7.2-r0: task do_packagedata_setscene: Started
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-src went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-dbg went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-staticdev went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-dev went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-doc went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-af went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ast went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-be went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-bg went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ca went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-cs went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-da went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-de went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-el went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-eo went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-es went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-et went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-eu went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-fi went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-fr went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ga went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-gl went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-hr went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-hu went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ia went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-id went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-it went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ja went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ko went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ky went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-lt went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-lv went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ms went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-nb went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-nl went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-pl went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-pt went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-pt-br went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ro went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ru went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-rw went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sk went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sl went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sq went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sr went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sv went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ta went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-th went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-tr went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-uk went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-vi went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-zh-cn went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-zh-tw went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
NOTE: recipe bison-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1298 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_fetch)
NOTE: Running task 1385 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 1491 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_fetch)
NOTE: Running task 1492 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_fetch)
NOTE: recipe file-5.39-r0: task do_fetch: Started
NOTE: Running task 1602 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_fetch)
NOTE: recipe file-5.39-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: Running task 1620 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_unpack)
NOTE: Running task 1621 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: Running task 1647 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 1648 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.15.1-r0: task do_fetch: Started
NOTE: recipe curl-7.72.0-r0: task do_fetch: Started
NOTE: recipe curl-7.72.0-r0: task do_fetch: Succeeded
NOTE: Running task 1760 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_unpack)
NOTE: Running task 1761 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-0.16.1-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_fetch: Succeeded
NOTE: Running task 1798 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_unpack)
NOTE: recipe file-5.39-r0: task do_unpack: Started
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1847 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_unpack)
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: Running task 1921 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe curl-7.72.0-r0: task do_unpack: Started
NOTE: recipe curl-7.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_unpack: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_unpack: Started
NOTE: recipe file-5.39-r0: task do_unpack: Succeeded
NOTE: Running task 2041 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe file-5.39-r0: task do_patch: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_unpack: Succeeded
NOTE: Running task 2299 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_patch)
NOTE: recipe file-5.39-r0: task do_patch: Succeeded
NOTE: Running task 2300 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: Running task 2301 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe createrepo-c-0.16.1-r0: task do_patch: Started
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe rpm-1_4.15.1-r0: task do_unpack: Succeeded
NOTE: Running task 2302 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_patch)
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe rpm-1_4.15.1-r0: task do_patch: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_patch: Succeeded
NOTE: Running task 2303 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_generate_toolchain_file)
NOTE: Running task 2304 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2305 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_populate_lic)
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2306 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_configure)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2307 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe createrepo-c-0.16.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_populate_lic: Started
NOTE: recipe file-5.39-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe curl-7.72.0-r0: task do_unpack: Succeeded
NOTE: Running task 2308 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_patch)
NOTE: recipe createrepo-c-0.16.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_populate_lic unihash changed to 0d807259f9432d4e24f72a574eb38d856fe80525740cbfedc25d256aa7dcfa33
NOTE: recipe curl-7.72.0-r0: task do_patch: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.72.0-r0: task do_patch: Succeeded
NOTE: Running task 2309 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2310 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_configure)
NOTE: recipe curl-7.72.0-r0: task do_configure: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_patch: Succeeded
NOTE: Running task 2311 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 2312 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 2313 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe file-5.39-r0: task do_configure: Succeeded
NOTE: Running task 2314 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_compile)
NOTE: recipe file-5.39-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 2315 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 2316 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.39-r0: task do_compile: Succeeded
NOTE: Running task 2317 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_install)
NOTE: recipe file-5.39-r0: task do_install: Started
NOTE: recipe file-5.39-r0: task do_install: Succeeded
NOTE: Running task 2318 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_populate_sysroot)
NOTE: Running task 2319 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package)
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.39-r0: task do_package: Started
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2320 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 2321 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 2322 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm)
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2323 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_configure)
NOTE: recipe rpm-1_4.15.1-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe file-5.39-r0: task do_package: Succeeded
NOTE: Running task 2324 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_packagedata)
NOTE: recipe file-5.39-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2325 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package_write_rpm)
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Started
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe curl-7.72.0-r0: task do_configure: Succeeded
NOTE: Running task 2326 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_compile)
NOTE: recipe curl-7.72.0-r0: task do_compile: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_configure: Succeeded
NOTE: Running task 2327 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_compile)
NOTE: recipe rpm-1_4.15.1-r0: task do_compile: Started
NOTE: recipe curl-7.72.0-r0: task do_compile: Succeeded
NOTE: Running task 2328 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_install)
NOTE: recipe curl-7.72.0-r0: task do_install: Started
NOTE: recipe curl-7.72.0-r0: task do_install: Succeeded
NOTE: Running task 2329 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_package)
NOTE: Running task 2330 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_populate_sysroot)
NOTE: recipe curl-7.72.0-r0: task do_package: Started
NOTE: recipe curl-7.72.0-r0: task do_populate_sysroot: Started
NOTE: recipe curl-7.72.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe curl-7.72.0-r0: task do_package: Succeeded
NOTE: Running task 2331 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_packagedata)
NOTE: recipe curl-7.72.0-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_compile: Succeeded
NOTE: Running task 2332 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_install)
NOTE: recipe rpm-1_4.15.1-r0: task do_install: Started
NOTE: recipe curl-7.72.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2333 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_package_write_rpm)
NOTE: recipe curl-7.72.0-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_install: Succeeded
NOTE: Running task 2334 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_package)
NOTE: Running task 2335 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.15.1-r0: task do_package: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2336 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.72.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe createrepo-c-0.16.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2337 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_configure)
NOTE: recipe createrepo-c-0.16.1-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_configure: Succeeded
NOTE: Running task 2338 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_compile)
NOTE: recipe createrepo-c-0.16.1-r0: task do_compile: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_compile: Succeeded
NOTE: Running task 2339 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_install)
NOTE: recipe createrepo-c-0.16.1-r0: task do_install: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_package: Succeeded
NOTE: Running task 2340 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_packagedata)
NOTE: recipe rpm-1_4.15.1-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_install: Succeeded
NOTE: Running task 2341 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_populate_sysroot)
NOTE: recipe createrepo-c-0.16.1-r0: task do_populate_sysroot: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.15.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2342 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_package)
NOTE: Running task 2343 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_package_write_rpm)
NOTE: recipe createrepo-c-0.16.1-r0: task do_package: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_package: Succeeded
NOTE: Running task 2344 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_packagedata)
NOTE: recipe createrepo-c-0.16.1-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2345 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_package_write_rpm)
NOTE: Running task 2346 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_package_qa)
NOTE: recipe createrepo-c-0.16.1-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_package_qa: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe createrepo-c-0.16.1-r0: task do_package_qa: Succeeded
NOTE: recipe createrepo-c-0.16.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2347 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2347 tasks of which 2283 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 54 ERROR messages shown, returning a non-zero exit code.

--===============4106626212456116026==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-createrepo-c-upgrade-0.16.0-0.16.1.patch"

From 74ba3b20486bf1b3588b085a059292ccc9a64a2d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 02:25:31 +0000
Subject: [PATCH] createrepo-c: upgrade 0.16.0 -> 0.16.1

---
 .../{createrepo-c_0.16.0.bb => createrepo-c_0.16.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_0.16.0.bb => createrepo-c_0.16.1.bb} (95%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.0.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb
similarity index 95%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_0.16.0.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb
index c6d8963072..942741023f 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.0.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "bac48ace91c51abe37792415e75452bbabd44d93"
+SRCREV = "634141eaefe0cc87466dfb91b07b64facce4384b"
 
 S = "${WORKDIR}/git"
 
-- 
2.18.4


--===============4106626212456116026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 1383 entries from dependency cache.
Parsing recipes...done.
Parsing of 785 .bb files complete (781 cached, 4 parsed). 1356 targets, 46 skipped, 0 masked, 0 errors.
Removing 115 recipes from the core2-32 sysroot...done.
Removing 117 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20201016"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:40aa2047ab2558ce45a882c473389ca9d6af58e0"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 579 Found 551 Missed 28 Current 189 (95% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 190 of 768 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 191 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 192 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 193 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 194 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 195 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 196 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 197 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 198 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 199 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 200 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 201 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 202 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 203 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 204 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 205 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 206 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 207 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 208 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 209 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 210 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 211 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 212 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 213 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 214 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 215 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 216 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 224 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 225 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.180.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 227 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 228 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 229 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 230 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 231 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 232 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 233 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 234 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 235 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 236 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 237 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.19.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 238 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 239 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.8.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 249 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 250 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 251 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 252 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 253 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 254 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 255 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 256 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 257 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 258 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 259 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 260 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 261 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 262 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1g-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.35-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe eudev-3.2.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.180-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbusmock-0.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pycairo-1.19.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 263 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pygobject-3.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 264 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 265 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 266 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 267 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 268 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 269 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: recipe iptables-1.8.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe expat-2.2.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 270 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 271 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 272 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 273 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 274 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 275 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.102.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 276 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe readline-8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 277 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.2.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-3.8.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 278 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.1.8.bb:do_package_write_rpm_setscene)
NOTE: recipe eudev-3.2.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bison-3.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 279 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_package_write_rpm_setscene)
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 280 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 281 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 282 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 283 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pycairo-1.19.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 284 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 285 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 286 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 287 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 288 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 289 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package_write_rpm_setscene)
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-dbusmock-0.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 290 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 291 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package_write_rpm_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pygobject-3.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 292 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.8.0.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 293 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 294 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 295 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 296 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 297 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 298 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 299 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 300 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 301 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package_write_rpm_setscene)
NOTE: recipe iptables-1.8.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 302 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 303 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 304 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 305 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 306 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 307 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 308 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 309 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 310 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 311 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.102-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gobject-introspection-1.64.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe freetype-2.10.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 312 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.180-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 313 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_package_write_rpm_setscene)
NOTE: recipe openssl-1.1.1g-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 314 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 315 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mesa-2_20.1.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 316 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 317 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 318 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 319 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 320 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.35-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pygobject-3.36.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 321 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 322 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 323 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 324 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_package_write_rpm_setscene)
NOTE: recipe libdrm-2.4.102-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbusmock-0.19-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 325 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 331 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: recipe gobject-introspection-1.64.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe freetype-2.10.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 332 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 333 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 334 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 335 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 336 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 339 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.7.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 340 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.43.bb:do_package_write_rpm_setscene)
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 341 of 768 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.8.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 342 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 343 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 344 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 345 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 346 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 347 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 348 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_package_write_rpm_setscene)
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 354 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 355 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 356 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_deploy_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gmp-6.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-2.43-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.7.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnutls-3.6.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnutls-3.6.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.35-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygobject-3.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 363 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 372 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.19.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 376 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iproute2-5.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 384 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.180.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.180.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 386 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 388 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-dbusmock-0.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 394 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_packagedata_setscene)
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 397 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 398 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mesa-2_20.1.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 399 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 400 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 401 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-2.43-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gmp-6.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 402 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnutls-3.6.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-ng-0.7.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 405 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 408 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_deploy_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: Running setscene task 409 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe nettle-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe eudev-3.2.9-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 410 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.64.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pycairo-1.19.1-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe iptables-1.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe elfutils-0.180-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 412 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 414 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.6.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 419 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe elfutils-0.180-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 420 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_packagedata_setscene)
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.6.14-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe grep-3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 427 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.35-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pycairo-1.19.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 431 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 433 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.64.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 437 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.180-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 607 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_fetch)
NOTE: Running setscene task 451 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 634 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 654 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_fetch)
NOTE: Running task 655 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_fetch)
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 700 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_fetch)
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bison-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.6.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 455 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 456 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 457 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 458 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 459 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.39-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe elfutils-0.180-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 463 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 464 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 465 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 466 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 467 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.180.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 468 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.39-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: recipe rpm-1_4.15.1-r0: task do_fetch: Started
NOTE: Running task 836 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: recipe createrepo-c-0.16.1-r0: task do_fetch: Started
NOTE: Running task 845 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_unpack)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-7.72.0-r0: task do_fetch: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe createrepo-c-0.16.1-r0: task do_fetch: Succeeded
NOTE: Running task 900 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_unpack)
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.6.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nettle-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 476 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 478 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.43.bb:do_packagedata_setscene)
NOTE: recipe curl-7.72.0-r0: task do_fetch: Succeeded
NOTE: recipe rpm-1_4.15.1-r0: task do_fetch: Succeeded
NOTE: Running task 938 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_unpack)
NOTE: Running task 945 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_unpack)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-src went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
NOTE: recipe musl-obstack-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-dbg went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-staticdev went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-dev went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-doc went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Succeeded
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.180-r0: task do_deploy_source_date_epoch_setscene: Started
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-af went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ast went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-be went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot_setscene: Started
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-bg went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.6.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ca went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
NOTE: recipe file-5.39-r0: task do_unpack: Started
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-cs went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
NOTE: recipe createrepo-c-0.16.1-r0: task do_unpack: Started
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-da went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-de went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-el went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
NOTE: recipe libcap-2.43-r0: task do_packagedata_setscene: Started
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-eo went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-es went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-et went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-eu went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-fi went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-fr went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
NOTE: recipe popt-1.18-r0: task do_unpack: Started
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ga went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-gl went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
NOTE: recipe curl-7.72.0-r0: task do_unpack: Started
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-hr went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-hu went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
NOTE: recipe iptables-1.8.5-r0: task do_packagedata_setscene: Succeeded
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ia went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.6-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-id went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
NOTE: recipe elfutils-0.180-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 488 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata_setscene)
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-it went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
NOTE: Running setscene task 490 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.1.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 492 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ja went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ko went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ky went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
NOTE: Running task 990 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe rpm-1_4.15.1-r0: task do_unpack: Started
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-lt went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-lv went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
NOTE: recipe nettle-3.6-r0: task do_packagedata_setscene: Succeeded
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ms went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
NOTE: Running setscene task 497 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.0.bb:do_packagedata_setscene)
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-nb went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
NOTE: Running setscene task 498 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 499 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_deploy_source_date_epoch_setscene)
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-nl went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-pl went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-pt went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-pt-br went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ro went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
NOTE: recipe musl-obstack-1.1-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ru went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
NOTE: recipe file-5.39-r0: task do_unpack: Succeeded
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-rw went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 995 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_patch)
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sk went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sl went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sq went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
NOTE: recipe createrepo-c-0.16.1-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 996 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_patch)
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sr went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
NOTE: Running setscene task 501 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 502 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb:do_populate_sysroot_setscene)
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sv went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ta went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-th went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-tr went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-uk went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Started
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-vi went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-zh-cn went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-zh-tw went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe mesa-2_20.1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bison-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.39-r0: task do_patch: Started
NOTE: Running setscene task 507 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 509 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.43-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_patch: Started
NOTE: recipe nettle-3.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 513 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 516 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 517 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 519 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe argp-standalone-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe rpm-1_4.15.1-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1023 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_patch)
NOTE: Running setscene task 524 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.2.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1028 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe gmp-6.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 527 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe file-5.39-r0: task do_patch: Succeeded
NOTE: Running task 1033 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_deploy_source_date_epoch)
NOTE: recipe freetype-2.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe rpm-1_4.15.1-r0: task do_patch: Started
NOTE: recipe mesa-2_20.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe createrepo-c-0.16.1-r0: task do_patch: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 529 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.102.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 534 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 536 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 538 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 540 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1047 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_generate_toolchain_file)
NOTE: Running task 1048 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1049 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_populate_lic)
NOTE: recipe musl-obstack-1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.102-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 543 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe createrepo-c-0.16.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_populate_lic: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe createrepo-c-0.16.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe freetype-2.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 546 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: recipe curl-7.72.0-r0: task do_unpack: Succeeded
NOTE: Running task 1062 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_patch)
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 549 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe createrepo-c-0.16.1-r0: task do_populate_lic: Succeeded
NOTE: Running setscene task 555 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_packagedata_setscene)
NOTE: recipe curl-7.72.0-r0: task do_patch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_populate_lic unihash changed to 0d807259f9432d4e24f72a574eb38d856fe80525740cbfedc25d256aa7dcfa33
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 563 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.102-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 567 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 572 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 573 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 574 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 575 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 576 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-7.72.0-r0: task do_patch: Succeeded
NOTE: Running task 1108 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 580 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 583 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 586 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.8.5.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 587 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 588 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-7.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 592 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 593 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 594 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 595 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 596 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 597 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 598 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 599 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 600 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 602 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 603 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-7.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 605 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 609 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 610 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_patch: Succeeded
NOTE: Running task 1137 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.2.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.2.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 613 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe rpm-1_4.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 615 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 617 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 618 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 619 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 621 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.2.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 623 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 625 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 626 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 627 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 629 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb:do_packagedata_setscene)
NOTE: Running setscene task 630 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 631 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 632 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 633 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 634 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 635 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 636 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_packagedata_setscene)
NOTE: recipe rpm-1_4.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.2.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 638 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 639 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-1.1.1g-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 642 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 643 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 644 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 646 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe readline-8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1g-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 653 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 654 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 655 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 656 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 657 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 658 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 659 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 660 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 661 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 664 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 666 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 670 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 671 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 673 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 674 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 675 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 676 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 677 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 679 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 681 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 682 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 683 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.7.11.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 686 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 687 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 688 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 689 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 690 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 691 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.8.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 692 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 693 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 694 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 695 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 696 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.7.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1g-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.8.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.7.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 699 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.8.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 700 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 701 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 702 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 703 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 704 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.33.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 705 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 706 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 707 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 708 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.7.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 709 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 711 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 712 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 714 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: Running setscene task 715 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 716 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 717 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 720 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 722 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.7.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1g-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 723 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 724 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-1.1.1g-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.7.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 725 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.7.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 727 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 729 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-1.1.1g-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.7.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 732 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 733 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 734 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.7.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 735 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 736 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 737 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 738 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 739 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 740 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 742 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 744 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 745 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 746 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 748 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 749 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 750 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 751 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 752 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 756 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 757 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 758 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 761 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 762 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 763 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 764 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 765 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 766 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 767 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.35-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 768 of 768 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.35-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1887 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1928 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1990 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2330 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_configure)
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2331 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe curl-7.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2332 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_configure)
NOTE: recipe file-5.39-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe curl-7.72.0-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 2333 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe file-5.39-r0: task do_configure: Succeeded
NOTE: Running task 2334 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_compile)
NOTE: recipe file-5.39-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 2335 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe file-5.39-r0: task do_compile: Succeeded
NOTE: Running task 2336 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 2337 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 2338 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe file-5.39-r0: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.39-r0: task do_install: Succeeded
NOTE: Running task 2339 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_populate_sysroot)
NOTE: Running task 2340 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package)
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.39-r0: task do_package: Started
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2341 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2342 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_configure)
NOTE: recipe rpm-1_4.15.1-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 2343 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_package: Succeeded
NOTE: Running task 2344 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_packagedata)
NOTE: recipe file-5.39-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2345 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package_write_rpm)
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 2346 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm)
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.15.1-r0: task do_configure: Succeeded
NOTE: Running task 2347 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_compile)
NOTE: recipe curl-7.72.0-r0: task do_configure: Succeeded
NOTE: Running task 2348 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_compile)
NOTE: recipe rpm-1_4.15.1-r0: task do_compile: Started
NOTE: recipe curl-7.72.0-r0: task do_compile: Started
NOTE: recipe curl-7.72.0-r0: task do_compile: Succeeded
NOTE: Running task 2349 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_install)
NOTE: recipe curl-7.72.0-r0: task do_install: Started
NOTE: recipe curl-7.72.0-r0: task do_install: Succeeded
NOTE: Running task 2350 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_package)
NOTE: Running task 2351 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_populate_sysroot)
NOTE: recipe curl-7.72.0-r0: task do_package: Started
NOTE: recipe curl-7.72.0-r0: task do_populate_sysroot: Started
NOTE: recipe curl-7.72.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.15.1-r0: task do_compile: Succeeded
NOTE: Running task 2352 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_install)
NOTE: recipe rpm-1_4.15.1-r0: task do_install: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_install: Succeeded
NOTE: Running task 2353 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_package)
NOTE: Running task 2354 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.15.1-r0: task do_package: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2355 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.72.0-r0: task do_package: Succeeded
NOTE: Running task 2356 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_packagedata)
NOTE: recipe createrepo-c-0.16.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.72.0-r0: task do_packagedata: Started
NOTE: recipe curl-7.72.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2357 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_package_write_rpm)
NOTE: recipe curl-7.72.0-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2358 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_configure)
NOTE: recipe createrepo-c-0.16.1-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_configure: Succeeded
NOTE: Running task 2359 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_compile)
NOTE: recipe createrepo-c-0.16.1-r0: task do_compile: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_package: Succeeded
NOTE: Running task 2360 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_packagedata)
NOTE: recipe rpm-1_4.15.1-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_packagedata: Succeeded
NOTE: recipe createrepo-c-0.16.1-r0: task do_compile: Succeeded
NOTE: Running task 2361 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_package_write_rpm)
NOTE: Running task 2362 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_install)
NOTE: recipe rpm-1_4.15.1-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_install: Started
NOTE: recipe curl-7.72.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe createrepo-c-0.16.1-r0: task do_install: Succeeded
NOTE: Running task 2363 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_package)
NOTE: Running task 2364 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_populate_sysroot)
NOTE: recipe createrepo-c-0.16.1-r0: task do_package: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_populate_sysroot: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.15.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe createrepo-c-0.16.1-r0: task do_package: Succeeded
NOTE: Running task 2365 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_packagedata)
NOTE: recipe createrepo-c-0.16.1-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2366 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_package_write_rpm)
NOTE: Running task 2367 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_package_qa)
NOTE: recipe createrepo-c-0.16.1-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_package_qa: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_package_qa: Succeeded
NOTE: recipe createrepo-c-0.16.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2368 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2368 tasks of which 2304 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 54 ERROR messages shown, returning a non-zero exit code.

--===============4106626212456116026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 1384 entries from dependency cache.
Parsing recipes...done.
Parsing of 785 .bb files complete (781 cached, 4 parsed). 1356 targets, 61 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20201016"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:40aa2047ab2558ce45a882c473389ca9d6af58e0"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 66 Found 38 Missed 28 Current 691 (57% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 702 of 757 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.2.bb:do_package_write_rpm_setscene)
NOTE: recipe bison-3.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 755 of 757 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.2.bb:do_packagedata_setscene)
NOTE: recipe bison-3.7.2-r0: task do_packagedata_setscene: Started
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-src went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-dbg went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-staticdev went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-dev went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-doc went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-af went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ast went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-be went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-bg went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ca went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-cs went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-da went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-de went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-el went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-eo went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-es went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-et went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-eu went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-fi went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-fr went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ga went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-gl went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-hr went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-hu went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ia went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-id went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-it went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ja went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ko went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ky went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-lt went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
NOTE: Running task 1298 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_fetch)
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-lv went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ms went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-nb went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-nl went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-pl went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-pt went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-pt-br went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
NOTE: Running task 1386 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ro went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ru went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-rw went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sk went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sl went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sq went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sr went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sv went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ta went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-th went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
NOTE: Running task 1491 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_fetch)
NOTE: Running task 1492 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_fetch)
NOTE: recipe file-5.39-r0: task do_fetch: Started
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-tr went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-uk went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-vi went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-zh-cn went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-zh-tw went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
NOTE: recipe file-5.39-r0: task do_fetch: Succeeded
NOTE: Running task 1559 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_unpack)
NOTE: Running task 1560 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: Running task 1603 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_fetch)
NOTE: Running task 1605 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 1636 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe bison-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe rpm-1_4.15.1-r0: task do_fetch: Started
NOTE: recipe curl-7.72.0-r0: task do_fetch: Started
NOTE: recipe curl-7.72.0-r0: task do_fetch: Succeeded
NOTE: Running task 1736 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_unpack)
NOTE: Running task 1738 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.39-r0: task do_unpack: Started
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_fetch: Succeeded
NOTE: Running task 1806 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_unpack)
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_fetch: Succeeded
NOTE: Running task 1863 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_unpack)
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: Running task 1873 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe curl-7.72.0-r0: task do_unpack: Started
NOTE: recipe file-5.39-r0: task do_unpack: Succeeded
NOTE: recipe curl-7.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1998 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_patch)
NOTE: recipe rpm-1_4.15.1-r0: task do_unpack: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe file-5.39-r0: task do_patch: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_unpack: Succeeded
NOTE: Running task 2299 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_patch)
NOTE: recipe file-5.39-r0: task do_patch: Succeeded
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2300 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: Running task 2301 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe createrepo-c-0.16.1-r0: task do_patch: Started
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_unpack: Succeeded
NOTE: Running task 2302 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_patch)
NOTE: recipe curl-7.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_patch: Started
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2303 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_configure)
NOTE: recipe createrepo-c-0.16.1-r0: task do_patch: Succeeded
NOTE: Running task 2304 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_generate_toolchain_file)
NOTE: Running task 2305 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2306 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_populate_lic)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2307 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe file-5.39-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_populate_lic: Started
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe curl-7.72.0-r0: task do_unpack: Succeeded
NOTE: Running task 2308 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_patch)
NOTE: recipe createrepo-c-0.16.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_populate_lic unihash changed to 0d807259f9432d4e24f72a574eb38d856fe80525740cbfedc25d256aa7dcfa33
NOTE: recipe createrepo-c-0.16.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.72.0-r0: task do_patch: Started
NOTE: recipe curl-7.72.0-r0: task do_patch: Succeeded
NOTE: Running task 2309 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2310 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_configure)
NOTE: recipe curl-7.72.0-r0: task do_configure: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_patch: Succeeded
NOTE: Running task 2311 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 2312 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 2313 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe file-5.39-r0: task do_configure: Succeeded
NOTE: Running task 2314 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_compile)
NOTE: recipe file-5.39-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 2315 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 2316 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.39-r0: task do_compile: Succeeded
NOTE: Running task 2317 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_install)
NOTE: recipe file-5.39-r0: task do_install: Started
NOTE: recipe file-5.39-r0: task do_install: Succeeded
NOTE: Running task 2318 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_populate_sysroot)
NOTE: Running task 2319 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package)
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.39-r0: task do_package: Started
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2320 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 2321 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 2322 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm)
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Started
NOTE: recipe file-5.39-r0: task do_package: Succeeded
NOTE: Running task 2323 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_packagedata)
NOTE: recipe rpm-1_4.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2324 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_configure)
NOTE: recipe file-5.39-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_configure: Started
NOTE: recipe file-5.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2325 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package_write_rpm)
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Started
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe curl-7.72.0-r0: task do_configure: Succeeded
NOTE: Running task 2326 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_compile)
NOTE: recipe curl-7.72.0-r0: task do_compile: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_configure: Succeeded
NOTE: Running task 2327 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_compile)
NOTE: recipe rpm-1_4.15.1-r0: task do_compile: Started
NOTE: recipe curl-7.72.0-r0: task do_compile: Succeeded
NOTE: Running task 2328 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_install)
NOTE: recipe curl-7.72.0-r0: task do_install: Started
NOTE: recipe curl-7.72.0-r0: task do_install: Succeeded
NOTE: Running task 2329 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_package)
NOTE: Running task 2330 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_populate_sysroot)
NOTE: recipe curl-7.72.0-r0: task do_package: Started
NOTE: recipe curl-7.72.0-r0: task do_populate_sysroot: Started
NOTE: recipe curl-7.72.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe curl-7.72.0-r0: task do_package: Succeeded
NOTE: Running task 2331 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_packagedata)
NOTE: recipe curl-7.72.0-r0: task do_packagedata: Started
NOTE: recipe curl-7.72.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2332 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_package_write_rpm)
NOTE: recipe curl-7.72.0-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_compile: Succeeded
NOTE: Running task 2333 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_install)
NOTE: recipe rpm-1_4.15.1-r0: task do_install: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_install: Succeeded
NOTE: Running task 2334 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_package)
NOTE: Running task 2335 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_populate_sysroot)
NOTE: recipe curl-7.72.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.15.1-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_package: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2336 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-0.16.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2337 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_configure)
NOTE: recipe createrepo-c-0.16.1-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_configure: Succeeded
NOTE: Running task 2338 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_compile)
NOTE: recipe createrepo-c-0.16.1-r0: task do_compile: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_compile: Succeeded
NOTE: Running task 2339 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_install)
NOTE: recipe createrepo-c-0.16.1-r0: task do_install: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_package: Succeeded
NOTE: Running task 2340 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_packagedata)
NOTE: recipe rpm-1_4.15.1-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_install: Succeeded
NOTE: Running task 2341 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_populate_sysroot)
NOTE: recipe createrepo-c-0.16.1-r0: task do_populate_sysroot: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.15.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2342 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_package)
NOTE: Running task 2343 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_package_write_rpm)
NOTE: recipe createrepo-c-0.16.1-r0: task do_package: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_package: Succeeded
NOTE: Running task 2344 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_packagedata)
NOTE: recipe createrepo-c-0.16.1-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2345 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_package_write_rpm)
NOTE: Running task 2346 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_package_qa)
NOTE: recipe createrepo-c-0.16.1-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_package_qa: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe createrepo-c-0.16.1-r0: task do_package_qa: Succeeded
NOTE: recipe createrepo-c-0.16.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2347 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2347 tasks of which 2283 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 54 ERROR messages shown, returning a non-zero exit code.

--===============4106626212456116026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 1384 entries from dependency cache.
Parsing recipes...done.
Parsing of 785 .bb files complete (781 cached, 4 parsed). 1356 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the armv7vet2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20201016"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:40aa2047ab2558ce45a882c473389ca9d6af58e0"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 65 Found 37 Missed 28 Current 692 (56% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 703 of 757 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.2.bb:do_package_write_rpm_setscene)
NOTE: recipe bison-3.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 755 of 757 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.2.bb:do_packagedata_setscene)
NOTE: recipe bison-3.7.2-r0: task do_packagedata_setscene: Started
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-src went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-dbg went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-staticdev went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-dev went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-doc went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-af went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ast went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-be went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-bg went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ca went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-cs went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-da went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-de went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-el went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-eo went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-es went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-et went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-eu went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-fi went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-fr went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ga went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-gl went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-hr went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-hu went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ia went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-id went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-it went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ja went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ko went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ky went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-lt went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-lv went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ms went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-nb went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-nl went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-pl went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-pt went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
NOTE: Running task 1298 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_fetch)
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-pt-br went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ro went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ru went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-rw went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sk went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sl went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sq went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
NOTE: Running task 1386 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sr went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sv went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ta went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-th went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-tr went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-uk went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-vi went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-zh-cn went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
ERROR: bison-3.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-zh-tw went backwards which would break package feeds (from 0:3.7.3-r0 to 0:3.7.2-r0) [version-going-backwards]
NOTE: Running task 1491 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_fetch)
NOTE: Running task 1492 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_fetch)
NOTE: recipe file-5.39-r0: task do_fetch: Started
NOTE: recipe file-5.39-r0: task do_fetch: Succeeded
NOTE: Running task 1599 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_unpack)
NOTE: Running task 1600 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe bison-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1603 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_fetch)
NOTE: Setscene tasks completed
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: Running task 1634 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 1637 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.15.1-r0: task do_fetch: Started
NOTE: recipe curl-7.72.0-r0: task do_fetch: Started
NOTE: recipe curl-7.72.0-r0: task do_fetch: Succeeded
NOTE: Running task 1811 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_unpack)
NOTE: Running task 1812 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.39-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_fetch: Succeeded
NOTE: recipe createrepo-c-0.16.1-r0: task do_fetch: Started
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1822 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_unpack)
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_fetch: Succeeded
NOTE: Running task 1896 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_unpack)
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: Running task 1994 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe curl-7.72.0-r0: task do_unpack: Started
NOTE: recipe file-5.39-r0: task do_unpack: Succeeded
NOTE: recipe rpm-1_4.15.1-r0: task do_unpack: Started
NOTE: Running task 2058 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_patch)
NOTE: recipe curl-7.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe file-5.39-r0: task do_patch: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_unpack: Succeeded
NOTE: Running task 2299 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_patch)
NOTE: recipe file-5.39-r0: task do_patch: Succeeded
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2300 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.15.1-r0: task do_unpack: Succeeded
NOTE: Running task 2301 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_patch)
NOTE: recipe createrepo-c-0.16.1-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2302 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_patch: Succeeded
NOTE: Running task 2303 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_generate_toolchain_file)
NOTE: Running task 2304 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2305 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_populate_lic)
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2306 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_configure)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2307 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe createrepo-c-0.16.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_populate_lic: Started
NOTE: recipe curl-7.72.0-r0: task do_unpack: Succeeded
NOTE: recipe file-5.39-r0: task do_configure: Started
NOTE: Running task 2308 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_patch)
NOTE: recipe createrepo-c-0.16.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_populate_lic unihash changed to 0d807259f9432d4e24f72a574eb38d856fe80525740cbfedc25d256aa7dcfa33
NOTE: recipe createrepo-c-0.16.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.72.0-r0: task do_patch: Started
NOTE: recipe curl-7.72.0-r0: task do_patch: Succeeded
NOTE: Running task 2309 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2310 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_configure)
NOTE: recipe rpm-1_4.15.1-r0: task do_patch: Succeeded
NOTE: Running task 2311 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.72.0-r0: task do_configure: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 2312 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 2313 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe file-5.39-r0: task do_configure: Succeeded
NOTE: Running task 2314 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_compile)
NOTE: recipe file-5.39-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 2315 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 2316 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.39-r0: task do_compile: Succeeded
NOTE: Running task 2317 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_install)
NOTE: recipe file-5.39-r0: task do_install: Started
NOTE: recipe file-5.39-r0: task do_install: Succeeded
NOTE: Running task 2318 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_populate_sysroot)
NOTE: Running task 2319 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package)
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.39-r0: task do_package: Started
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2320 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 2321 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 2322 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2323 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_configure)
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_configure: Started
NOTE: recipe file-5.39-r0: task do_package: Succeeded
NOTE: Running task 2324 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_packagedata)
NOTE: recipe file-5.39-r0: task do_packagedata: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe file-5.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2325 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package_write_rpm)
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Started
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe curl-7.72.0-r0: task do_configure: Succeeded
NOTE: Running task 2326 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_compile)
NOTE: recipe curl-7.72.0-r0: task do_compile: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_configure: Succeeded
NOTE: Running task 2327 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_compile)
NOTE: recipe rpm-1_4.15.1-r0: task do_compile: Started
NOTE: recipe curl-7.72.0-r0: task do_compile: Succeeded
NOTE: Running task 2328 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_install)
NOTE: recipe curl-7.72.0-r0: task do_install: Started
NOTE: recipe curl-7.72.0-r0: task do_install: Succeeded
NOTE: Running task 2329 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_package)
NOTE: Running task 2330 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_populate_sysroot)
NOTE: recipe curl-7.72.0-r0: task do_package: Started
NOTE: recipe curl-7.72.0-r0: task do_populate_sysroot: Started
NOTE: recipe curl-7.72.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.15.1-r0: task do_compile: Succeeded
NOTE: Running task 2331 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_install)
NOTE: recipe rpm-1_4.15.1-r0: task do_install: Started
NOTE: recipe curl-7.72.0-r0: task do_package: Succeeded
NOTE: Running task 2332 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_packagedata)
NOTE: recipe curl-7.72.0-r0: task do_packagedata: Started
NOTE: recipe curl-7.72.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2333 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_package_write_rpm)
NOTE: recipe curl-7.72.0-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_install: Succeeded
NOTE: Running task 2334 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_package)
NOTE: Running task 2335 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.15.1-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_package: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2336 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-0.16.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.72.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe createrepo-c-0.16.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2337 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_configure)
NOTE: recipe createrepo-c-0.16.1-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_configure: Succeeded
NOTE: Running task 2338 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_compile)
NOTE: recipe createrepo-c-0.16.1-r0: task do_compile: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_compile: Succeeded
NOTE: Running task 2339 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_install)
NOTE: recipe createrepo-c-0.16.1-r0: task do_install: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_package: Succeeded
NOTE: Running task 2340 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_packagedata)
NOTE: recipe rpm-1_4.15.1-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_install: Succeeded
NOTE: Running task 2341 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_populate_sysroot)
NOTE: recipe createrepo-c-0.16.1-r0: task do_populate_sysroot: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.15.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2342 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_package)
NOTE: Running task 2343 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.15.1.bb:do_package_write_rpm)
NOTE: recipe createrepo-c-0.16.1-r0: task do_package: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_package: Succeeded
NOTE: Running task 2344 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_packagedata)
NOTE: recipe createrepo-c-0.16.1-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2345 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_package_write_rpm)
NOTE: Running task 2346 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_package_qa)
NOTE: recipe createrepo-c-0.16.1-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.16.1-r0: task do_package_qa: Started
NOTE: recipe rpm-1_4.15.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe createrepo-c-0.16.1-r0: task do_package_qa: Succeeded
NOTE: recipe createrepo-c-0.16.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2347 of 2347 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2347 tasks of which 2283 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 54 ERROR messages shown, returning a non-zero exit code.

--===============4106626212456116026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/createrepo-c/createrepo-c-bash-completion: PKGV changed from 0.16.0 [default] to 0.16.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-bash-completion: PV changed from "0.16.0" to "0.16.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PKGV changed from 0.16.0 [default] to 0.16.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PKGSIZE changed from 1201668 to 1202172 (+0%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PV changed from "0.16.0" to "0.16.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PKGV changed from 0.16.0 [default] to 0.16.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PV changed from "0.16.0" to "0.16.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-doc: PKGV changed from 0.16.0 [default] to 0.16.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-doc: PKGSIZE changed from 15856 to 15860 (+0%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-doc: PV changed from "0.16.0" to "0.16.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-locale: PKGV changed from 0.16.0 [default] to 0.16.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-locale: PV changed from "0.16.0" to "0.16.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PKGV changed from 0.16.0 [default] to 0.16.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PKGSIZE changed from 1177383 to 1177986 (+0%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PV changed from "0.16.0" to "0.16.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-staticdev: PKGV changed from 0.16.0 [default] to 0.16.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-staticdev: PV changed from "0.16.0" to "0.16.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PKGV changed from 0.16.0 [default] to 0.16.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PV changed from "0.16.0" to "0.16.1"
packages/core2-32-poky-linux/createrepo-c: PKGV changed from 0.16.0 [default] to 0.16.1 [default]
packages/core2-32-poky-linux/createrepo-c: PV changed from "0.16.0" to "0.16.1"
Changes to packages/core2-32-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so.0 changed symlink target from libcreaterepo_c.so.0.16.0 to libcreaterepo_c.so.0.16.1
  /usr/lib/libcreaterepo_c.so.0.16.0 moved to /usr/lib/libcreaterepo_c.so.0.16.1
  /usr/lib/python3.8/site-packages/createrepo_c-0.16.0-py3.8.egg-info moved to /usr/lib/python3.8/site-packages/createrepo_c-0.16.1-py3.8.egg-info

--===============4106626212456116026==--
