Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.39171.1605551303697347953
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 10:28:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-2.yocto.io (unknown [172.29.10.56])
	by mail.yoctoproject.org (Postfix) with ESMTP id 0EECB38C0914
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 18:28:23 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] createrepo-c: upgrading to 0.16.2 SUCCEEDED
Message-ID: <MADEUP.16481067818D8475.17549@lists.openembedded.org>
X-Groupsio-MsgNum: 144637
Content-Type: multipart/mixed; boundary="===============4446556219809499899=="

--===============4446556219809499899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *createrepo-c* to *0.16.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-createrepo-c-upgrade-0.16.1-0.16.2.patch
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

--===============4446556219809499899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 1377 entries from dependency cache.
Parsing recipes...done.
Parsing of 791 .bb files complete (788 cached, 3 parsed). 1372 targets, 61 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-20201116"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:037ee1e29b7c3a434697f0b57c758a079ad34250"
workspace            = "master:aaf6aa3e530deb4a8d818a55a37b9029980b0b0d"

Initialising tasks...done.
Sstate summary: Wanted 81 Found 24 Missed 57 Current 692 (29% match, 92% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 693 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 694 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 704 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 705 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 716 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_package_write_rpm_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glibc-2.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bison-3.7.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 756 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.3.bb:do_packagedata_setscene)
NOTE: Running task 783 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_fetch)
NOTE: recipe glibc-2.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 831 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_fetch)
NOTE: Running task 863 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_fetch)
NOTE: recipe bison-3.7.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 917 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_fetch)
NOTE: Running task 918 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_fetch)
NOTE: Running task 960 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 961 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_fetch)
NOTE: Running task 962 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_fetch)
NOTE: Running task 1002 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_fetch)
NOTE: Running task 1003 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_fetch)
NOTE: Running task 1061 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_fetch)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe nettle-3.6-r0: task do_fetch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_fetch: Started
NOTE: recipe nettle-3.6-r0: task do_fetch: Succeeded
NOTE: Running task 1187 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_unpack)
NOTE: recipe libidn2-2.3.0-r0: task do_fetch: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-src went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe libunistring-0.9.10-r0: task do_fetch: Succeeded
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-dbg went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: Running task 1230 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_unpack)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-staticdev went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe libidn2-2.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 1258 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_unpack)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-dev went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-doc went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe file-5.39-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.39-r0: task do_fetch: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe libgcrypt-1.8.7-r0: task do_fetch: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-af went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe popt-1.18-r0: task do_fetch: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ast went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe libgpg-error-1.39-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.6.15-r0: task do_fetch: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-be went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: Running task 1326 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_unpack)
NOTE: recipe rpm-1_4.16.0-r0: task do_fetch: Started
NOTE: recipe file-5.39-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-bg went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: Running task 1327 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_unpack)
NOTE: Running task 1328 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: recipe createrepo-c-0.16.2-r0: task do_fetch: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ca went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe libgcrypt-1.8.7-r0: task do_fetch: Succeeded
NOTE: recipe curl-7.73.0-r0: task do_fetch: Started
NOTE: recipe gnutls-3.6.15-r0: task do_fetch: Succeeded
NOTE: Running task 1329 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_unpack)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-cs went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: Running task 1330 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_unpack)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-da went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe curl-7.73.0-r0: task do_fetch: Succeeded
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-de went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: Running task 1331 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_unpack)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-el went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe createrepo-c-0.16.2-r0: task do_fetch: Succeeded
NOTE: Running task 1332 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_unpack)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-eo went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-es went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe rpm-1_4.16.0-r0: task do_fetch: Succeeded
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-et went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: Running task 1333 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_unpack)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-eu went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-fi went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-fr went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe libunistring-0.9.10-r0: task do_unpack: Started
NOTE: recipe nettle-3.6-r0: task do_unpack: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ga went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-gl went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-hr went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe libidn2-2.3.0-r0: task do_unpack: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-hu went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ia went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-id went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-it went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ja went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ko went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe libgpg-error-1.39-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_unpack: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ky went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe file-5.39-r0: task do_unpack: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-lt went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-lv went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ms went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe gnutls-3.6.15-r0: task do_unpack: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_unpack: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-nb went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe curl-7.73.0-r0: task do_unpack: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-nl went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-pl went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-pt went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: Running task 1334 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe rpm-1_4.16.0-r0: task do_unpack: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-pt-br went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe nettle-3.6-r0: task do_unpack: Succeeded
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ro went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: Running task 1335 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_patch)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ru went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-rw went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sk went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sl went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sq went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sr went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe libidn2-2.3.0-r0: task do_unpack: Succeeded
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sv went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ta went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: Running task 1336 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_patch)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-th went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe libunistring-0.9.10-r0: task do_unpack: Succeeded
NOTE: Running task 1337 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_patch)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-tr went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-uk went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe file-5.39-r0: task do_unpack: Succeeded
NOTE: Running task 1338 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_patch)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-vi went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-zh-cn went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-zh-tw went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe createrepo-c-0.16.2-r0: task do_unpack: Succeeded
NOTE: Running task 1339 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe bison-3.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 759 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 760 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.39-r0: task do_unpack: Succeeded
NOTE: recipe nettle-3.6-r0: task do_patch: Started
NOTE: Running task 1342 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_patch)
NOTE: recipe libunistring-0.9.10-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.0-r0: task do_patch: Started
NOTE: recipe file-5.39-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: Running task 1345 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe createrepo-c-0.16.2-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.0-r0: task do_patch: Succeeded
NOTE: Running task 1346 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.39-r0: task do_patch: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1347 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_patch: Succeeded
NOTE: Running task 1348 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_generate_toolchain_file)
NOTE: recipe file-5.39-r0: task do_patch: Succeeded
NOTE: Running task 1349 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1350 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_populate_lic)
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1351 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_deploy_source_date_epoch)
NOTE: recipe libunistring-0.9.10-r0: task do_patch: Succeeded
NOTE: Running task 1352 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 761 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.8.7-r0: task do_unpack: Succeeded
NOTE: recipe rpm-1_4.16.0-r0: task do_patch: Started
NOTE: Running task 1357 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_patch)
NOTE: recipe nettle-3.6-r0: task do_patch: Succeeded
NOTE: Running task 1358 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe createrepo-c-0.16.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_populate_lic: Started
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_patch: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1359 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_deploy_source_date_epoch)
NOTE: recipe createrepo-c-0.16.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gnutls-3.6.15-r0: task do_unpack: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_patch: Started
NOTE: Running task 1360 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_patch)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.73.0-r0: task do_unpack: Succeeded
NOTE: Running task 1361 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_patch)
NOTE: recipe createrepo-c-0.16.2-r0: task do_populate_lic: Succeeded
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_populate_lic unihash changed to 4f1aac6bf1822c9d0dcbfcdf8e173062e7ae6d04c71bbce53297c8f51a88e950
NOTE: recipe createrepo-c-0.16.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.6.15-r0: task do_patch: Started
NOTE: recipe nettle-3.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.73.0-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 763 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.6.15-r0: task do_patch: Succeeded
NOTE: Running task 1362 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.73.0-r0: task do_patch: Succeeded
NOTE: Running task 1363 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.6.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.73.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.6.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 764 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 766 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.32.bb:do_packagedata_setscene)
NOTE: recipe curl-7.73.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.32-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_patch: Succeeded
NOTE: Running task 1365 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.8.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 767 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.32.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.8.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glibc-2.32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_patch: Succeeded
NOTE: Running task 1371 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glibc-2.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 769 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_packagedata_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Started
NOTE: recipe glibc-2.32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 771 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 773 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-mips-2.35-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-mips-2.35-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1697 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1753 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1888 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1889 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1928 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-3.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-0.9.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-0.9.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nettle-3.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2311 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_configure)
NOTE: Running task 2312 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_configure)
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2313 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_configure)
NOTE: recipe libgpg-error-1.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2314 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_configure)
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2315 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe nettle-3.6-r0: task do_configure: Started
NOTE: recipe libunistring-0.9.10-r0: task do_configure: Started
NOTE: recipe file-5.39-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.39-r0: task do_configure: Started
NOTE: recipe nettle-3.6-r0: task do_configure: Succeeded
NOTE: Running task 2316 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.6-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2317 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_compile)
NOTE: recipe nettle-3.6-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 2318 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 2319 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe nettle-3.6-r0: task do_compile: Succeeded
NOTE: Running task 2320 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_compile_ptest_base)
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 2321 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 2322 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe nettle-3.6-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.39-r0: task do_configure: Succeeded
NOTE: Running task 2323 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_compile)
NOTE: recipe file-5.39-r0: task do_compile: Started
NOTE: recipe file-5.39-r0: task do_compile: Succeeded
NOTE: Running task 2324 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 2325 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe file-5.39-r0: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_install: Succeeded
NOTE: Running task 2326 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_populate_sysroot)
NOTE: Running task 2327 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package)
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.39-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 2328 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm)
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Started
NOTE: recipe libgpg-error-1.39-r0: task do_configure: Succeeded
NOTE: Running task 2329 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_compile)
NOTE: recipe libgpg-error-1.39-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe file-5.39-r0: task do_package: Succeeded
NOTE: Running task 2330 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_packagedata)
NOTE: recipe file-5.39-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2331 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package_write_rpm)
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Started
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_compile: Succeeded
NOTE: Running task 2332 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_install)
NOTE: recipe libgpg-error-1.39-r0: task do_install: Started
NOTE: recipe libgpg-error-1.39-r0: task do_install: Succeeded
NOTE: Running task 2333 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_populate_sysroot)
NOTE: Running task 2334 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_package)
NOTE: recipe libgpg-error-1.39-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.39-r0: task do_package: Started
NOTE: recipe libgpg-error-1.39-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2335 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.8.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2336 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_configure)
NOTE: recipe libgcrypt-1.8.7-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.39-r0: task do_package: Succeeded
NOTE: Running task 2337 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_packagedata)
NOTE: recipe libgpg-error-1.39-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2338 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_package_write_rpm)
NOTE: recipe libgpg-error-1.39-r0: task do_package_write_rpm: Started
NOTE: recipe libgpg-error-1.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe nettle-3.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2339 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_install)
NOTE: recipe nettle-3.6-r0: task do_install: Started
NOTE: recipe nettle-3.6-r0: task do_install: Succeeded
NOTE: Running task 2340 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_install_ptest_base)
NOTE: recipe nettle-3.6-r0: task do_install_ptest_base: Started
NOTE: recipe nettle-3.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2341 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_populate_sysroot)
NOTE: Running task 2342 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_package)
NOTE: recipe nettle-3.6-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.6-r0: task do_package: Started
NOTE: recipe nettle-3.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.6-r0: task do_package: Succeeded
NOTE: Running task 2343 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_packagedata)
NOTE: recipe nettle-3.6-r0: task do_packagedata: Started
NOTE: recipe nettle-3.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2344 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_package_write_rpm)
NOTE: recipe nettle-3.6-r0: task do_package_write_rpm: Started
NOTE: recipe libunistring-0.9.10-r0: task do_configure: Succeeded
NOTE: Running task 2345 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_compile)
NOTE: recipe libunistring-0.9.10-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_configure: Succeeded
NOTE: Running task 2346 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_compile)
NOTE: recipe libgcrypt-1.8.7-r0: task do_compile: Started
NOTE: recipe nettle-3.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_compile: Succeeded
NOTE: Running task 2347 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_install)
NOTE: recipe libgcrypt-1.8.7-r0: task do_install: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_install: Succeeded
NOTE: Running task 2348 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_populate_sysroot)
NOTE: Running task 2349 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_package)
NOTE: recipe libgcrypt-1.8.7-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2350 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2351 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_configure)
NOTE: recipe rpm-1_4.16.0-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package: Succeeded
NOTE: Running task 2352 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_packagedata)
NOTE: recipe libgcrypt-1.8.7-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2353 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_package_write_rpm)
NOTE: recipe libgcrypt-1.8.7-r0: task do_package_write_rpm: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.0-r0: task do_configure: Succeeded
NOTE: Running task 2354 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_compile)
NOTE: recipe rpm-1_4.16.0-r0: task do_compile: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_compile: Succeeded
NOTE: Running task 2355 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_install)
NOTE: recipe rpm-1_4.16.0-r0: task do_install: Started
NOTE: recipe libunistring-0.9.10-r0: task do_compile: Succeeded
NOTE: Running task 2356 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_install)
NOTE: recipe libunistring-0.9.10-r0: task do_install: Started
NOTE: recipe libunistring-0.9.10-r0: task do_install: Succeeded
NOTE: Running task 2357 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_populate_sysroot)
NOTE: Running task 2358 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package)
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_install: Succeeded
NOTE: Running task 2359 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_package)
NOTE: Running task 2360 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.16.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2361 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2362 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_configure)
NOTE: recipe libidn2-2.3.0-r0: task do_configure: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package: Succeeded
NOTE: Running task 2363 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata)
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata: Started
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2364 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm)
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_package: Succeeded
NOTE: Running task 2365 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.0-r0: task do_packagedata: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2366 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2367 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_compile)
NOTE: recipe libidn2-2.3.0-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2368 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_install)
NOTE: recipe libidn2-2.3.0-r0: task do_install: Started
NOTE: recipe libidn2-2.3.0-r0: task do_install: Succeeded
NOTE: Running task 2369 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_populate_sysroot)
NOTE: Running task 2370 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package)
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package: Started
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2371 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.6.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.6.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2372 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_configure)
NOTE: recipe gnutls-3.6.15-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package: Succeeded
NOTE: Running task 2373 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_packagedata)
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2374 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package_write_rpm)
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnutls-3.6.15-r0: task do_configure: Succeeded
NOTE: Running task 2375 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_compile)
NOTE: recipe gnutls-3.6.15-r0: task do_compile: Started
NOTE: recipe gnutls-3.6.15-r0: task do_compile: Succeeded
NOTE: Running task 2376 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_install)
NOTE: recipe gnutls-3.6.15-r0: task do_install: Started
NOTE: recipe gnutls-3.6.15-r0: task do_install: Succeeded
NOTE: Running task 2377 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_populate_sysroot)
NOTE: Running task 2378 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_package)
NOTE: recipe gnutls-3.6.15-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.6.15-r0: task do_package: Started
NOTE: recipe gnutls-3.6.15-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2379 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.73.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.73.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2380 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_configure)
NOTE: recipe curl-7.73.0-r0: task do_configure: Started
NOTE: recipe gnutls-3.6.15-r0: task do_package: Succeeded
NOTE: Running task 2381 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_packagedata)
NOTE: recipe gnutls-3.6.15-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.6.15-r0: task do_packagedata: Succeeded
NOTE: Running task 2382 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_package_write_rpm)
NOTE: recipe gnutls-3.6.15-r0: task do_package_write_rpm: Started
NOTE: recipe gnutls-3.6.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe curl-7.73.0-r0: task do_configure: Succeeded
NOTE: Running task 2383 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_compile)
NOTE: recipe curl-7.73.0-r0: task do_compile: Started
NOTE: recipe curl-7.73.0-r0: task do_compile: Succeeded
NOTE: Running task 2384 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_install)
NOTE: recipe curl-7.73.0-r0: task do_install: Started
NOTE: recipe curl-7.73.0-r0: task do_install: Succeeded
NOTE: Running task 2385 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_package)
NOTE: Running task 2386 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_populate_sysroot)
NOTE: recipe curl-7.73.0-r0: task do_package: Started
NOTE: recipe curl-7.73.0-r0: task do_populate_sysroot: Started
NOTE: recipe curl-7.73.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2387 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-0.16.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2388 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_configure)
NOTE: recipe createrepo-c-0.16.2-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_configure: Succeeded
NOTE: Running task 2389 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_compile)
NOTE: recipe createrepo-c-0.16.2-r0: task do_compile: Started
NOTE: recipe curl-7.73.0-r0: task do_package: Succeeded
NOTE: Running task 2390 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_packagedata)
NOTE: recipe curl-7.73.0-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_compile: Succeeded
NOTE: Running task 2391 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_install)
NOTE: recipe curl-7.73.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2392 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_package_write_rpm)
NOTE: recipe createrepo-c-0.16.2-r0: task do_install: Started
NOTE: recipe curl-7.73.0-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_install: Succeeded
NOTE: Running task 2393 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_package)
NOTE: Running task 2394 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_populate_sysroot)
NOTE: recipe createrepo-c-0.16.2-r0: task do_package: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_populate_sysroot: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe curl-7.73.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe createrepo-c-0.16.2-r0: task do_package: Succeeded
NOTE: Running task 2395 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_packagedata)
NOTE: recipe createrepo-c-0.16.2-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2396 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_package_write_rpm)
NOTE: Running task 2397 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_package_qa)
NOTE: recipe createrepo-c-0.16.2-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_package_qa: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_package_qa: Succeeded
NOTE: recipe createrepo-c-0.16.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2398 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_build)
NOTE: Tasks Summary: Attempted 2398 tasks of which 2259 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 54 ERROR messages shown, returning a non-zero exit code.

--===============4446556219809499899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1382 entries from dependency cache.
Parsing recipes...done.
Parsing of 791 .bb files complete (790 cached, 1 parsed). 1372 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-20201116"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:037ee1e29b7c3a434697f0b57c758a079ad34250"
workspace            = "master:aaf6aa3e530deb4a8d818a55a37b9029980b0b0d"

Initialising tasks...done.
Sstate summary: Wanted 81 Found 24 Missed 57 Current 692 (29% match, 92% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 693 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 694 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 704 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 705 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 716 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_package_write_rpm_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glibc-2.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bison-3.7.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 756 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.3.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bison-3.7.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 783 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_fetch)
NOTE: Running task 831 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_fetch)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 863 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_fetch)
NOTE: Running task 917 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_fetch)
NOTE: Running task 918 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_fetch)
NOTE: recipe glibc-2.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 960 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_fetch)
NOTE: Running task 961 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 962 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_fetch)
NOTE: Running task 1002 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_fetch)
NOTE: Running task 1003 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_fetch)
NOTE: Running task 1061 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_fetch)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-src went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-dbg went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe nettle-3.6-r0: task do_fetch: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-staticdev went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-dev went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-doc went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe libunistring-0.9.10-r0: task do_fetch: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-af went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe nettle-3.6-r0: task do_fetch: Succeeded
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ast went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: Running task 1154 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_unpack)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-be went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe libunistring-0.9.10-r0: task do_fetch: Succeeded
NOTE: Running task 1171 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_unpack)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-bg went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe libidn2-2.3.0-r0: task do_fetch: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ca went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-cs went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-da went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-de went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe libidn2-2.3.0-r0: task do_fetch: Succeeded
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-el went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: Running task 1229 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_unpack)
NOTE: recipe libgpg-error-1.39-r0: task do_fetch: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-eo went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe file-5.39-r0: task do_fetch: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-es went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-et went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-eu went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe libgpg-error-1.39-r0: task do_fetch: Succeeded
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-fi went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: Running task 1285 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_unpack)
NOTE: recipe libgcrypt-1.8.7-r0: task do_fetch: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-fr went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ga went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe rpm-1_4.16.0-r0: task do_fetch: Started
NOTE: recipe file-5.39-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.6.15-r0: task do_fetch: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-gl went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: Running task 1319 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_unpack)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-hr went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: Running task 1328 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-hu went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ia went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe curl-7.73.0-r0: task do_fetch: Started
NOTE: recipe gnutls-3.6.15-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_fetch: Succeeded
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-id went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: Running task 1329 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_unpack)
NOTE: Running task 1330 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_unpack)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-it went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ja went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe createrepo-c-0.16.2-r0: task do_fetch: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ko went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe curl-7.73.0-r0: task do_fetch: Succeeded
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ky went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: Running task 1331 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_unpack)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-lt went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe rpm-1_4.16.0-r0: task do_fetch: Succeeded
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-lv went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: Running task 1332 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_unpack)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ms went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-nb went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe createrepo-c-0.16.2-r0: task do_fetch: Succeeded
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-nl went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: Running task 1333 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_unpack)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-pl went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-pt went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe nettle-3.6-r0: task do_unpack: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-pt-br went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ro went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe libunistring-0.9.10-r0: task do_unpack: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ru went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-rw went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sk went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sl went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sq went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sr went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sv went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe libidn2-2.3.0-r0: task do_unpack: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ta went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-th went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-tr went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-uk went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe libgpg-error-1.39-r0: task do_unpack: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-vi went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-zh-cn went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe file-5.39-r0: task do_unpack: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-zh-tw went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_unpack: Started
NOTE: recipe gnutls-3.6.15-r0: task do_unpack: Started
NOTE: recipe curl-7.73.0-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_unpack: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_unpack: Started
NOTE: recipe bison-3.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: Running setscene task 759 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.6-r0: task do_unpack: Succeeded
NOTE: Running setscene task 760 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running task 1338 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_patch)
NOTE: Running task 1339 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe libidn2-2.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 1340 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_patch)
NOTE: recipe libunistring-0.9.10-r0: task do_unpack: Succeeded
NOTE: Running task 1341 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_patch)
NOTE: recipe file-5.39-r0: task do_unpack: Succeeded
NOTE: Running task 1342 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_patch)
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: Running task 1343 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_patch)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.39-r0: task do_unpack: Succeeded
NOTE: Running task 1344 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_patch)
NOTE: recipe nettle-3.6-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.0-r0: task do_patch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_patch: Started
NOTE: recipe file-5.39-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: Running task 1345 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe createrepo-c-0.16.2-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.0-r0: task do_patch: Succeeded
NOTE: Running task 1346 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_patch: Started
NOTE: Running setscene task 761 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe rpm-1_4.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1351 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.39-r0: task do_patch: Succeeded
NOTE: Running task 1352 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_patch: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_patch: Succeeded
NOTE: Running task 1353 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_generate_toolchain_file)
NOTE: Running task 1354 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1355 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_populate_lic)
NOTE: recipe libgcrypt-1.8.7-r0: task do_unpack: Succeeded
NOTE: Running task 1356 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_patch)
NOTE: recipe libunistring-0.9.10-r0: task do_patch: Succeeded
NOTE: Running task 1357 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgpg-error-1.39-r0: task do_patch: Succeeded
NOTE: recipe nettle-3.6-r0: task do_patch: Succeeded
NOTE: Running task 1358 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_deploy_source_date_epoch)
NOTE: Running task 1359 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_deploy_source_date_epoch)
NOTE: recipe createrepo-c-0.16.2-r0: task do_populate_lic: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_patch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe curl-7.73.0-r0: task do_unpack: Succeeded
NOTE: Running task 1360 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_patch)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 763 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.6.15-r0: task do_unpack: Succeeded
NOTE: Running task 1361 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_patch)
NOTE: recipe libgpg-error-1.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nettle-3.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_populate_lic: Succeeded
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_populate_lic unihash changed to 4f1aac6bf1822c9d0dcbfcdf8e173062e7ae6d04c71bbce53297c8f51a88e950
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe createrepo-c-0.16.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.73.0-r0: task do_patch: Started
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.6.15-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nettle-3.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.6.15-r0: task do_patch: Succeeded
NOTE: Running task 1362 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.73.0-r0: task do_patch: Succeeded
NOTE: Running task 1363 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 765 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.32.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 766 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.6.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.73.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glibc-2.32-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.6.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.73.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 767 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.32.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.8.7-r0: task do_patch: Succeeded
NOTE: Running task 1370 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_deploy_source_date_epoch)
NOTE: recipe glibc-2.32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glibc-2.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe rpm-1_4.16.0-r0: task do_patch: Succeeded
NOTE: Running task 1371 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 769 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_packagedata_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glibc-2.32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 771 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_populate_sysroot_setscene)
NOTE: recipe rpm-1_4.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 773 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-x86_64-2.35-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.35-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1697 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1753 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1888 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1889 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1928 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe libunistring-0.9.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nettle-3.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-0.9.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2311 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_configure)
NOTE: recipe nettle-3.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2312 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_configure)
NOTE: recipe libgpg-error-1.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2313 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_configure)
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2314 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2315 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_configure)
NOTE: recipe libunistring-0.9.10-r0: task do_configure: Started
NOTE: recipe nettle-3.6-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.39-r0: task do_configure: Started
NOTE: recipe file-5.39-r0: task do_configure: Started
NOTE: recipe nettle-3.6-r0: task do_configure: Succeeded
NOTE: Running task 2316 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.6-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2317 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_compile)
NOTE: recipe nettle-3.6-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 2318 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 2319 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe nettle-3.6-r0: task do_compile: Succeeded
NOTE: Running task 2320 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_compile_ptest_base)
NOTE: recipe nettle-3.6-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 2321 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 2322 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.39-r0: task do_configure: Succeeded
NOTE: Running task 2323 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_compile)
NOTE: recipe file-5.39-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.39-r0: task do_configure: Succeeded
NOTE: Running task 2324 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_compile)
NOTE: recipe libgpg-error-1.39-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: recipe file-5.39-r0: task do_compile: Succeeded
NOTE: Running task 2325 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_install)
NOTE: Running task 2326 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_install: Started
NOTE: recipe file-5.39-r0: task do_install: Succeeded
NOTE: Running task 2327 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_populate_sysroot)
NOTE: Running task 2328 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package)
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.39-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 2329 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm)
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Started
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe file-5.39-r0: task do_package: Succeeded
NOTE: Running task 2330 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_packagedata)
NOTE: recipe libgpg-error-1.39-r0: task do_compile: Succeeded
NOTE: Running task 2331 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_install)
NOTE: recipe file-5.39-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.39-r0: task do_install: Started
NOTE: recipe file-5.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2332 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package_write_rpm)
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Started
NOTE: recipe libgpg-error-1.39-r0: task do_install: Succeeded
NOTE: Running task 2333 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_populate_sysroot)
NOTE: Running task 2334 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_package)
NOTE: recipe libgpg-error-1.39-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.39-r0: task do_package: Started
NOTE: recipe libgpg-error-1.39-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2335 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.8.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2336 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_configure)
NOTE: recipe libgcrypt-1.8.7-r0: task do_configure: Started
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_package: Succeeded
NOTE: Running task 2337 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_packagedata)
NOTE: recipe libgpg-error-1.39-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2338 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_package_write_rpm)
NOTE: recipe libgpg-error-1.39-r0: task do_package_write_rpm: Started
NOTE: recipe libgpg-error-1.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe nettle-3.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2339 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_install)
NOTE: recipe nettle-3.6-r0: task do_install: Started
NOTE: recipe nettle-3.6-r0: task do_install: Succeeded
NOTE: Running task 2340 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_install_ptest_base)
NOTE: recipe nettle-3.6-r0: task do_install_ptest_base: Started
NOTE: recipe nettle-3.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2341 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_populate_sysroot)
NOTE: Running task 2342 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_package)
NOTE: recipe nettle-3.6-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.6-r0: task do_package: Started
NOTE: recipe nettle-3.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.6-r0: task do_package: Succeeded
NOTE: Running task 2343 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_packagedata)
NOTE: recipe nettle-3.6-r0: task do_packagedata: Started
NOTE: recipe nettle-3.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2344 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_package_write_rpm)
NOTE: recipe nettle-3.6-r0: task do_package_write_rpm: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_configure: Succeeded
NOTE: Running task 2345 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_compile)
NOTE: recipe libgcrypt-1.8.7-r0: task do_compile: Started
NOTE: recipe libunistring-0.9.10-r0: task do_configure: Succeeded
NOTE: Running task 2346 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_compile)
NOTE: recipe libunistring-0.9.10-r0: task do_compile: Started
NOTE: recipe nettle-3.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_compile: Succeeded
NOTE: Running task 2347 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_install)
NOTE: recipe libgcrypt-1.8.7-r0: task do_install: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_install: Succeeded
NOTE: Running task 2348 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_populate_sysroot)
NOTE: Running task 2349 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_package)
NOTE: recipe libgcrypt-1.8.7-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2350 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2351 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_configure)
NOTE: recipe rpm-1_4.16.0-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package: Succeeded
NOTE: Running task 2352 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_packagedata)
NOTE: recipe libgcrypt-1.8.7-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2353 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_package_write_rpm)
NOTE: recipe libgcrypt-1.8.7-r0: task do_package_write_rpm: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.0-r0: task do_configure: Succeeded
NOTE: Running task 2354 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_compile)
NOTE: recipe rpm-1_4.16.0-r0: task do_compile: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_compile: Succeeded
NOTE: Running task 2355 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_install)
NOTE: recipe rpm-1_4.16.0-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_install: Succeeded
NOTE: Running task 2356 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_package)
NOTE: Running task 2357 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.16.0-r0: task do_package: Succeeded
NOTE: Running task 2358 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.0-r0: task do_packagedata: Started
NOTE: recipe libunistring-0.9.10-r0: task do_compile: Succeeded
NOTE: Running task 2359 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_install)
NOTE: recipe libunistring-0.9.10-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2360 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe libunistring-0.9.10-r0: task do_install: Succeeded
NOTE: Running task 2361 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_populate_sysroot)
NOTE: Running task 2362 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package)
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package: Started
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2363 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2364 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_configure)
NOTE: recipe libidn2-2.3.0-r0: task do_configure: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package: Succeeded
NOTE: Running task 2365 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata)
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata: Started
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2366 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2367 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_compile)
NOTE: recipe libidn2-2.3.0-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2368 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_install)
NOTE: recipe libidn2-2.3.0-r0: task do_install: Started
NOTE: recipe libidn2-2.3.0-r0: task do_install: Succeeded
NOTE: Running task 2369 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_populate_sysroot)
NOTE: Running task 2370 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package)
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package: Started
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2371 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.6.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.6.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2372 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_configure)
NOTE: recipe gnutls-3.6.15-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package: Succeeded
NOTE: Running task 2373 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_packagedata)
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2374 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package_write_rpm)
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnutls-3.6.15-r0: task do_configure: Succeeded
NOTE: Running task 2375 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_compile)
NOTE: recipe gnutls-3.6.15-r0: task do_compile: Started
NOTE: recipe gnutls-3.6.15-r0: task do_compile: Succeeded
NOTE: Running task 2376 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_install)
NOTE: recipe gnutls-3.6.15-r0: task do_install: Started
NOTE: recipe gnutls-3.6.15-r0: task do_install: Succeeded
NOTE: Running task 2377 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_populate_sysroot)
NOTE: Running task 2378 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_package)
NOTE: recipe gnutls-3.6.15-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.6.15-r0: task do_package: Started
NOTE: recipe gnutls-3.6.15-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2379 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.73.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.73.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2380 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_configure)
NOTE: recipe curl-7.73.0-r0: task do_configure: Started
NOTE: recipe gnutls-3.6.15-r0: task do_package: Succeeded
NOTE: Running task 2381 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_packagedata)
NOTE: recipe gnutls-3.6.15-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.6.15-r0: task do_packagedata: Succeeded
NOTE: Running task 2382 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_package_write_rpm)
NOTE: recipe gnutls-3.6.15-r0: task do_package_write_rpm: Started
NOTE: recipe gnutls-3.6.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe curl-7.73.0-r0: task do_configure: Succeeded
NOTE: Running task 2383 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_compile)
NOTE: recipe curl-7.73.0-r0: task do_compile: Started
NOTE: recipe curl-7.73.0-r0: task do_compile: Succeeded
NOTE: Running task 2384 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_install)
NOTE: recipe curl-7.73.0-r0: task do_install: Started
NOTE: recipe curl-7.73.0-r0: task do_install: Succeeded
NOTE: Running task 2385 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_package)
NOTE: Running task 2386 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_populate_sysroot)
NOTE: recipe curl-7.73.0-r0: task do_package: Started
NOTE: recipe curl-7.73.0-r0: task do_populate_sysroot: Started
NOTE: recipe curl-7.73.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2387 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-0.16.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2388 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_configure)
NOTE: recipe createrepo-c-0.16.2-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_configure: Succeeded
NOTE: Running task 2389 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_compile)
NOTE: recipe createrepo-c-0.16.2-r0: task do_compile: Started
NOTE: recipe curl-7.73.0-r0: task do_package: Succeeded
NOTE: Running task 2390 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_packagedata)
NOTE: recipe curl-7.73.0-r0: task do_packagedata: Started
NOTE: recipe curl-7.73.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2391 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_package_write_rpm)
NOTE: recipe curl-7.73.0-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_compile: Succeeded
NOTE: Running task 2392 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_install)
NOTE: recipe createrepo-c-0.16.2-r0: task do_install: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_install: Succeeded
NOTE: Running task 2393 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_package)
NOTE: Running task 2394 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_populate_sysroot)
NOTE: recipe createrepo-c-0.16.2-r0: task do_package: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_populate_sysroot: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe curl-7.73.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe createrepo-c-0.16.2-r0: task do_package: Succeeded
NOTE: Running task 2395 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_packagedata)
NOTE: recipe createrepo-c-0.16.2-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2396 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_package_write_rpm)
NOTE: Running task 2397 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_package_qa)
NOTE: recipe createrepo-c-0.16.2-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_package_qa: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_package_qa: Succeeded
NOTE: recipe createrepo-c-0.16.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2398 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_build)
NOTE: Tasks Summary: Attempted 2398 tasks of which 2259 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 54 ERROR messages shown, returning a non-zero exit code.

--===============4446556219809499899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 1377 entries from dependency cache.
Parsing recipes...done.
Parsing of 791 .bb files complete (788 cached, 3 parsed). 1372 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the armv7vet2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-20201116"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:037ee1e29b7c3a434697f0b57c758a079ad34250"
workspace            = "master:aaf6aa3e530deb4a8d818a55a37b9029980b0b0d"

Initialising tasks...done.
Sstate summary: Wanted 81 Found 24 Missed 57 Current 692 (29% match, 92% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 693 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 694 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 704 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 705 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 716 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_package_write_rpm_setscene)
NOTE: recipe bison-3.7.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glibc-2.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 756 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.3.bb:do_packagedata_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bison-3.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glibc-2.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 783 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_fetch)
NOTE: Running task 831 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_fetch)
NOTE: Running task 863 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_fetch)
NOTE: Running task 917 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_fetch)
NOTE: Running task 918 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_fetch)
NOTE: Running task 960 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_fetch)
NOTE: Running task 961 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 962 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_fetch)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-src went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-dbg went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: Running task 1002 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_fetch)
NOTE: Running task 1003 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_fetch)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-staticdev went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-dev went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-doc went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-af went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: Running task 1061 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_fetch)
NOTE: recipe nettle-3.6-r0: task do_fetch: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ast went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe libunistring-0.9.10-r0: task do_fetch: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-be went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-bg went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ca went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe nettle-3.6-r0: task do_fetch: Succeeded
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-cs went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: Running task 1133 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_unpack)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-da went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe libidn2-2.3.0-r0: task do_fetch: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-de went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe libunistring-0.9.10-r0: task do_fetch: Succeeded
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-el went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: Running task 1177 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_unpack)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-eo went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe file-5.39-r0: task do_fetch: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-es went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe libgpg-error-1.39-r0: task do_fetch: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-et went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-eu went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe libidn2-2.3.0-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_fetch: Started
NOTE: Running task 1241 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_unpack)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-fi went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe popt-1.18-r0: task do_fetch: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-fr went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe gnutls-3.6.15-r0: task do_fetch: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ga went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe rpm-1_4.16.0-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.39-r0: task do_fetch: Succeeded
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-gl went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: Running task 1293 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_unpack)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-hr went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-hu went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe curl-7.73.0-r0: task do_fetch: Started
NOTE: Running task 1319 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: recipe libgcrypt-1.8.7-r0: task do_fetch: Succeeded
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ia went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe gnutls-3.6.15-r0: task do_fetch: Succeeded
NOTE: recipe createrepo-c-0.16.2-r0: task do_fetch: Started
NOTE: Running task 1328 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_unpack)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-id went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: Running task 1329 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_unpack)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-it went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe curl-7.73.0-r0: task do_fetch: Succeeded
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ja went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: Running task 1330 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_unpack)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ko went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ky went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe file-5.39-r0: task do_fetch: Succeeded
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-lt went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe rpm-1_4.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 1331 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_unpack)
NOTE: recipe nettle-3.6-r0: task do_unpack: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-lv went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: Running task 1332 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_unpack)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ms went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe libunistring-0.9.10-r0: task do_unpack: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-nb went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-nl went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-pl went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-pt went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-pt-br went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ro went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe createrepo-c-0.16.2-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_unpack: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ru went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: Running task 1333 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_unpack)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-rw went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sk went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sl went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe libgpg-error-1.39-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sq went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sr went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe libgcrypt-1.8.7-r0: task do_unpack: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sv went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ta went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-th went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe gnutls-3.6.15-r0: task do_unpack: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-tr went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-uk went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe file-5.39-r0: task do_unpack: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-vi went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe nettle-3.6-r0: task do_unpack: Succeeded
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-zh-cn went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe curl-7.73.0-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_unpack: Started
NOTE: Running task 1334 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_patch)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-zh-tw went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: Running task 1335 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe createrepo-c-0.16.2-r0: task do_unpack: Started
NOTE: recipe bison-3.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 759 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 760 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 1340 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_patch)
NOTE: recipe libunistring-0.9.10-r0: task do_unpack: Succeeded
NOTE: Running task 1341 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_patch)
NOTE: recipe nettle-3.6-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.39-r0: task do_unpack: Succeeded
NOTE: Running task 1342 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_patch)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_patch: Started
NOTE: Running task 1343 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe libunistring-0.9.10-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.0-r0: task do_patch: Succeeded
NOTE: Running task 1344 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.39-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 761 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_patch: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_unpack: Succeeded
NOTE: recipe nettle-3.6-r0: task do_patch: Succeeded
NOTE: Running task 1349 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1350 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_patch)
NOTE: Running task 1351 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1352 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.39-r0: task do_unpack: Succeeded
NOTE: Running task 1353 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_patch)
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_patch: Succeeded
NOTE: Running task 1354 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_deploy_source_date_epoch)
NOTE: recipe createrepo-c-0.16.2-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1355 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_patch)
NOTE: recipe libgcrypt-1.8.7-r0: task do_patch: Started
NOTE: recipe nettle-3.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_patch: Started
NOTE: recipe file-5.39-r0: task do_patch: Started
NOTE: recipe curl-7.73.0-r0: task do_unpack: Succeeded
NOTE: Running task 1356 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_patch)
NOTE: recipe gnutls-3.6.15-r0: task do_unpack: Succeeded
NOTE: Running task 1357 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_patch)
NOTE: recipe libgpg-error-1.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 763 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe createrepo-c-0.16.2-r0: task do_patch: Started
NOTE: recipe curl-7.73.0-r0: task do_patch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nettle-3.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.39-r0: task do_patch: Succeeded
NOTE: recipe gnutls-3.6.15-r0: task do_patch: Started
NOTE: Running task 1358 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe createrepo-c-0.16.2-r0: task do_patch: Succeeded
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1359 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_generate_toolchain_file)
NOTE: Running task 1360 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1361 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_populate_lic)
NOTE: recipe curl-7.73.0-r0: task do_patch: Succeeded
NOTE: Running task 1362 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gnutls-3.6.15-r0: task do_patch: Succeeded
NOTE: Running task 1363 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_deploy_source_date_epoch)
NOTE: recipe createrepo-c-0.16.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_populate_lic: Started
NOTE: recipe curl-7.73.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.6.15-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 765 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.32.bb:do_packagedata_setscene)
NOTE: recipe createrepo-c-0.16.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 766 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe createrepo-c-0.16.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_populate_lic unihash changed to 4f1aac6bf1822c9d0dcbfcdf8e173062e7ae6d04c71bbce53297c8f51a88e950
NOTE: recipe createrepo-c-0.16.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.32-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.73.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.6.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 767 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.32.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.8.7-r0: task do_patch: Succeeded
NOTE: Running task 1370 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_deploy_source_date_epoch)
NOTE: recipe glibc-2.32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glibc-2.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 769 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_packagedata_setscene)
NOTE: recipe glibc-2.32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 771 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_populate_sysroot_setscene)
NOTE: recipe rpm-1_4.16.0-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Started
NOTE: Running task 1375 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 773 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-arm-2.35-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-arm-2.35-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1697 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1753 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1888 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1889 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1928 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-3.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-0.9.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-0.9.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nettle-3.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2311 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_configure)
NOTE: Running task 2312 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_configure)
NOTE: recipe libgpg-error-1.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2313 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_configure)
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2314 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_configure)
NOTE: Running task 2315 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe libunistring-0.9.10-r0: task do_configure: Started
NOTE: recipe nettle-3.6-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.39-r0: task do_configure: Started
NOTE: recipe file-5.39-r0: task do_configure: Started
NOTE: recipe nettle-3.6-r0: task do_configure: Succeeded
NOTE: Running task 2316 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.6-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2317 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_compile)
NOTE: recipe nettle-3.6-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 2318 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 2319 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe nettle-3.6-r0: task do_compile: Succeeded
NOTE: Running task 2320 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_compile_ptest_base)
NOTE: recipe nettle-3.6-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 2321 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 2322 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.39-r0: task do_configure: Succeeded
NOTE: Running task 2323 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_compile)
NOTE: recipe file-5.39-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.39-r0: task do_configure: Succeeded
NOTE: Running task 2324 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_compile)
NOTE: recipe libgpg-error-1.39-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 2325 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe file-5.39-r0: task do_compile: Succeeded
NOTE: Running task 2326 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_install: Started
NOTE: recipe file-5.39-r0: task do_install: Succeeded
NOTE: Running task 2327 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_populate_sysroot)
NOTE: Running task 2328 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package)
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.39-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 2329 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm)
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Started
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_compile: Succeeded
NOTE: Running task 2330 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_install)
NOTE: recipe file-5.39-r0: task do_package: Succeeded
NOTE: Running task 2331 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_packagedata)
NOTE: recipe libgpg-error-1.39-r0: task do_install: Started
NOTE: recipe file-5.39-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2332 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package_write_rpm)
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Started
NOTE: recipe libgpg-error-1.39-r0: task do_install: Succeeded
NOTE: Running task 2333 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_populate_sysroot)
NOTE: Running task 2334 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_package)
NOTE: recipe libgpg-error-1.39-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.39-r0: task do_package: Started
NOTE: recipe libgpg-error-1.39-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2335 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.8.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2336 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_configure)
NOTE: recipe libgcrypt-1.8.7-r0: task do_configure: Started
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_package: Succeeded
NOTE: Running task 2337 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_packagedata)
NOTE: recipe libgpg-error-1.39-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2338 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_package_write_rpm)
NOTE: recipe libgpg-error-1.39-r0: task do_package_write_rpm: Started
NOTE: recipe libgpg-error-1.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe nettle-3.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2339 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_install)
NOTE: recipe nettle-3.6-r0: task do_install: Started
NOTE: recipe nettle-3.6-r0: task do_install: Succeeded
NOTE: Running task 2340 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_install_ptest_base)
NOTE: recipe nettle-3.6-r0: task do_install_ptest_base: Started
NOTE: recipe nettle-3.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2341 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_populate_sysroot)
NOTE: Running task 2342 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_package)
NOTE: recipe nettle-3.6-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.6-r0: task do_package: Started
NOTE: recipe nettle-3.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.6-r0: task do_package: Succeeded
NOTE: Running task 2343 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_packagedata)
NOTE: recipe nettle-3.6-r0: task do_packagedata: Started
NOTE: recipe nettle-3.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2344 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_package_write_rpm)
NOTE: recipe nettle-3.6-r0: task do_package_write_rpm: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_configure: Succeeded
NOTE: Running task 2345 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_compile)
NOTE: recipe libgcrypt-1.8.7-r0: task do_compile: Started
NOTE: recipe libunistring-0.9.10-r0: task do_configure: Succeeded
NOTE: Running task 2346 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_compile)
NOTE: recipe libunistring-0.9.10-r0: task do_compile: Started
NOTE: recipe nettle-3.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_compile: Succeeded
NOTE: Running task 2347 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_install)
NOTE: recipe libgcrypt-1.8.7-r0: task do_install: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_install: Succeeded
NOTE: Running task 2348 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_populate_sysroot)
NOTE: Running task 2349 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_package)
NOTE: recipe libgcrypt-1.8.7-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2350 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2351 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_configure)
NOTE: recipe rpm-1_4.16.0-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package: Succeeded
NOTE: Running task 2352 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_packagedata)
NOTE: recipe libgcrypt-1.8.7-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2353 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_package_write_rpm)
NOTE: recipe libgcrypt-1.8.7-r0: task do_package_write_rpm: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.0-r0: task do_configure: Succeeded
NOTE: Running task 2354 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_compile)
NOTE: recipe rpm-1_4.16.0-r0: task do_compile: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_compile: Succeeded
NOTE: Running task 2355 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_install)
NOTE: recipe rpm-1_4.16.0-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_install: Succeeded
NOTE: Running task 2356 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_package)
NOTE: Running task 2357 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.16.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.16.0-r0: task do_package: Succeeded
NOTE: Running task 2358 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.0-r0: task do_packagedata: Started
NOTE: recipe libunistring-0.9.10-r0: task do_compile: Succeeded
NOTE: Running task 2359 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_install)
NOTE: recipe libunistring-0.9.10-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2360 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe libunistring-0.9.10-r0: task do_install: Succeeded
NOTE: Running task 2361 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_populate_sysroot)
NOTE: Running task 2362 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package)
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package: Started
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2363 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2364 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_configure)
NOTE: recipe libidn2-2.3.0-r0: task do_configure: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_package: Succeeded
NOTE: Running task 2365 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata)
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata: Started
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2366 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm)
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2367 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_compile)
NOTE: recipe libidn2-2.3.0-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2368 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_install)
NOTE: recipe libidn2-2.3.0-r0: task do_install: Started
NOTE: recipe libidn2-2.3.0-r0: task do_install: Succeeded
NOTE: Running task 2369 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_populate_sysroot)
NOTE: Running task 2370 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package)
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package: Started
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2371 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.6.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.6.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2372 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_configure)
NOTE: recipe gnutls-3.6.15-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package: Succeeded
NOTE: Running task 2373 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_packagedata)
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2374 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package_write_rpm)
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnutls-3.6.15-r0: task do_configure: Succeeded
NOTE: Running task 2375 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_compile)
NOTE: recipe gnutls-3.6.15-r0: task do_compile: Started
NOTE: recipe gnutls-3.6.15-r0: task do_compile: Succeeded
NOTE: Running task 2376 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_install)
NOTE: recipe gnutls-3.6.15-r0: task do_install: Started
NOTE: recipe gnutls-3.6.15-r0: task do_install: Succeeded
NOTE: Running task 2377 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_populate_sysroot)
NOTE: Running task 2378 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_package)
NOTE: recipe gnutls-3.6.15-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.6.15-r0: task do_package: Started
NOTE: recipe gnutls-3.6.15-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2379 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.73.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.73.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2380 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_configure)
NOTE: recipe curl-7.73.0-r0: task do_configure: Started
NOTE: recipe gnutls-3.6.15-r0: task do_package: Succeeded
NOTE: Running task 2381 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_packagedata)
NOTE: recipe gnutls-3.6.15-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.6.15-r0: task do_packagedata: Succeeded
NOTE: Running task 2382 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_package_write_rpm)
NOTE: recipe gnutls-3.6.15-r0: task do_package_write_rpm: Started
NOTE: recipe gnutls-3.6.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe curl-7.73.0-r0: task do_configure: Succeeded
NOTE: Running task 2383 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_compile)
NOTE: recipe curl-7.73.0-r0: task do_compile: Started
NOTE: recipe curl-7.73.0-r0: task do_compile: Succeeded
NOTE: Running task 2384 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_install)
NOTE: recipe curl-7.73.0-r0: task do_install: Started
NOTE: recipe curl-7.73.0-r0: task do_install: Succeeded
NOTE: Running task 2385 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_package)
NOTE: Running task 2386 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_populate_sysroot)
NOTE: recipe curl-7.73.0-r0: task do_populate_sysroot: Started
NOTE: recipe curl-7.73.0-r0: task do_package: Started
NOTE: recipe curl-7.73.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2387 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-0.16.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2388 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_configure)
NOTE: recipe createrepo-c-0.16.2-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_configure: Succeeded
NOTE: Running task 2389 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_compile)
NOTE: recipe createrepo-c-0.16.2-r0: task do_compile: Started
NOTE: recipe curl-7.73.0-r0: task do_package: Succeeded
NOTE: Running task 2390 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_packagedata)
NOTE: recipe curl-7.73.0-r0: task do_packagedata: Started
NOTE: recipe curl-7.73.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2391 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_package_write_rpm)
NOTE: recipe createrepo-c-0.16.2-r0: task do_compile: Succeeded
NOTE: Running task 2392 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_install)
NOTE: recipe curl-7.73.0-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_install: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_install: Succeeded
NOTE: Running task 2393 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_package)
NOTE: Running task 2394 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_populate_sysroot)
NOTE: recipe createrepo-c-0.16.2-r0: task do_package: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_populate_sysroot: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe curl-7.73.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe createrepo-c-0.16.2-r0: task do_package: Succeeded
NOTE: Running task 2395 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_packagedata)
NOTE: recipe createrepo-c-0.16.2-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2396 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_package_write_rpm)
NOTE: Running task 2397 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_package_qa)
NOTE: recipe createrepo-c-0.16.2-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_package_qa: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_package_qa: Succeeded
NOTE: recipe createrepo-c-0.16.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2398 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_build)
NOTE: Tasks Summary: Attempted 2398 tasks of which 2259 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 54 ERROR messages shown, returning a non-zero exit code.

--===============4446556219809499899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so.0 changed symlink target from libcreaterepo_c.so.0.16.1 to libcreaterepo_c.so.0.16.2
  /usr/lib/libcreaterepo_c.so.0.16.1 moved to /usr/lib/libcreaterepo_c.so.0.16.2
  /usr/lib/python3.9/site-packages/createrepo_c-0.16.1-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/createrepo_c-0.16.2-py3.9.egg-info

--===============4446556219809499899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 1377 entries from dependency cache.
Parsing recipes...done.
Parsing of 791 .bb files complete (788 cached, 3 parsed). 1372 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-20201116"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:037ee1e29b7c3a434697f0b57c758a079ad34250"
workspace            = "master:aaf6aa3e530deb4a8d818a55a37b9029980b0b0d"

Initialising tasks...done.
Sstate summary: Wanted 81 Found 24 Missed 57 Current 692 (29% match, 92% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 693 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 694 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 704 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 705 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 716 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_package_write_rpm_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glibc-2.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 756 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.3.bb:do_packagedata_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bison-3.7.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 783 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_fetch)
NOTE: Running task 831 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_fetch)
NOTE: Running task 863 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_fetch)
NOTE: Running task 917 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_fetch)
NOTE: Running task 918 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_fetch)
NOTE: Running task 960 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_fetch)
NOTE: Running task 961 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 962 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_fetch)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1002 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_fetch)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-src went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: Running task 1003 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_fetch)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-dbg went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-staticdev went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-dev went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe glibc-2.32-r0: task do_package_write_rpm_setscene: Succeeded
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-doc went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-af went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ast went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: Running task 1061 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_fetch)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-be went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-bg went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe nettle-3.6-r0: task do_fetch: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ca went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-cs went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-da went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-de went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe libunistring-0.9.10-r0: task do_fetch: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-el went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-eo went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe nettle-3.6-r0: task do_fetch: Succeeded
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-es went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: Running task 1139 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_unpack)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-et went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-eu went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-fi went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe libunistring-0.9.10-r0: task do_fetch: Succeeded
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-fr went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe libidn2-2.3.0-r0: task do_fetch: Started
NOTE: Running task 1172 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_unpack)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ga went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-gl went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-hr went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-hu went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ia went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe libidn2-2.3.0-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_fetch: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-id went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: Running task 1220 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_unpack)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-it went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe file-5.39-r0: task do_fetch: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ja went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ko went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe libgcrypt-1.8.7-r0: task do_fetch: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ky went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe libgpg-error-1.39-r0: task do_fetch: Succeeded
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-lt went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: Running task 1263 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_unpack)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-lv went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ms went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe gnutls-3.6.15-r0: task do_fetch: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-nb went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-nl went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe file-5.39-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-pl went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe libgcrypt-1.8.7-r0: task do_fetch: Succeeded
NOTE: Running task 1308 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_unpack)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-pt went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: Running task 1309 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 1318 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_unpack)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-pt-br went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe gnutls-3.6.15-r0: task do_fetch: Succeeded
NOTE: recipe rpm-1_4.16.0-r0: task do_fetch: Started
NOTE: recipe curl-7.73.0-r0: task do_fetch: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ro went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ru went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: Running task 1330 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_unpack)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-rw went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sk went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe curl-7.73.0-r0: task do_fetch: Succeeded
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sl went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe createrepo-c-0.16.2-r0: task do_fetch: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sq went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: Running task 1331 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_unpack)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sr went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sv went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ta went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-th went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-tr went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-uk went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-vi went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe createrepo-c-0.16.2-r0: task do_fetch: Succeeded
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-zh-cn went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: Running task 1332 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_unpack)
NOTE: recipe rpm-1_4.16.0-r0: task do_fetch: Succeeded
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-zh-tw went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe nettle-3.6-r0: task do_unpack: Started
NOTE: recipe libunistring-0.9.10-r0: task do_unpack: Started
NOTE: Running task 1333 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_unpack)
NOTE: recipe libidn2-2.3.0-r0: task do_unpack: Started
NOTE: recipe bison-3.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_unpack: Started
NOTE: Running setscene task 759 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 760 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe file-5.39-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_unpack: Started
NOTE: recipe gnutls-3.6.15-r0: task do_unpack: Started
NOTE: recipe curl-7.73.0-r0: task do_unpack: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: Running task 1338 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe nettle-3.6-r0: task do_unpack: Succeeded
NOTE: Running task 1339 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_patch)
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 1340 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_patch)
NOTE: recipe libunistring-0.9.10-r0: task do_unpack: Succeeded
NOTE: Running task 1341 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_patch)
NOTE: recipe file-5.39-r0: task do_unpack: Succeeded
NOTE: Running task 1342 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.39-r0: task do_unpack: Succeeded
NOTE: Running task 1343 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_patch)
NOTE: recipe nettle-3.6-r0: task do_patch: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_unpack: Succeeded
NOTE: Running task 1344 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_patch)
NOTE: recipe libidn2-2.3.0-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_patch: Started
NOTE: Running task 1345 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 761 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.39-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.39-r0: task do_patch: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.0-r0: task do_patch: Succeeded
NOTE: Running task 1350 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1351 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.39-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1352 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.8.7-r0: task do_unpack: Succeeded
NOTE: Running task 1353 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_patch)
NOTE: recipe createrepo-c-0.16.2-r0: task do_patch: Succeeded
NOTE: recipe rpm-1_4.16.0-r0: task do_patch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_patch: Succeeded
NOTE: Running task 1354 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_generate_toolchain_file)
NOTE: Running task 1355 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 1356 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1357 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_populate_lic)
NOTE: recipe nettle-3.6-r0: task do_patch: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1358 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.39-r0: task do_patch: Succeeded
NOTE: Running task 1359 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_patch: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 763 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe createrepo-c-0.16.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_populate_lic: Started
NOTE: recipe gnutls-3.6.15-r0: task do_unpack: Succeeded
NOTE: recipe createrepo-c-0.16.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1360 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_patch)
NOTE: recipe nettle-3.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgpg-error-1.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.73.0-r0: task do_unpack: Succeeded
NOTE: Running task 1361 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_patch)
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.6.15-r0: task do_patch: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_populate_lic unihash changed to 4f1aac6bf1822c9d0dcbfcdf8e173062e7ae6d04c71bbce53297c8f51a88e950
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe createrepo-c-0.16.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nettle-3.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.73.0-r0: task do_patch: Started
NOTE: recipe gnutls-3.6.15-r0: task do_patch: Succeeded
NOTE: Running task 1362 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 765 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.32.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.6.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.73.0-r0: task do_patch: Succeeded
NOTE: Running task 1363 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 766 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-2.32-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.73.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.6.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-7.73.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 767 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.32.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.8.7-r0: task do_patch: Succeeded
NOTE: Running task 1370 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_deploy_source_date_epoch)
NOTE: recipe glibc-2.32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glibc-2.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 769 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_packagedata_setscene)
NOTE: recipe rpm-1_4.16.0-r0: task do_patch: Succeeded
NOTE: Running task 1371 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glibc-2.32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 771 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_populate_sysroot_setscene)
NOTE: recipe rpm-1_4.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 773 of 773 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-powerpc-2.35-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-powerpc-2.35-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1697 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1753 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1888 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1889 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-3.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1928 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe libunistring-0.9.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nettle-3.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2289 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_configure)
NOTE: recipe libunistring-0.9.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2311 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_configure)
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2313 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_configure)
NOTE: recipe libgpg-error-1.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2314 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_configure)
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2315 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe nettle-3.6-r0: task do_configure: Started
NOTE: recipe libunistring-0.9.10-r0: task do_configure: Started
NOTE: recipe file-5.39-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.39-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe nettle-3.6-r0: task do_configure: Succeeded
NOTE: Running task 2316 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.6-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2317 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_compile)
NOTE: recipe nettle-3.6-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 2318 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 2319 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe nettle-3.6-r0: task do_compile: Succeeded
NOTE: Running task 2320 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_compile_ptest_base)
NOTE: recipe nettle-3.6-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 2321 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 2322 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.39-r0: task do_configure: Succeeded
NOTE: Running task 2323 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_compile)
NOTE: recipe file-5.39-r0: task do_compile: Started
NOTE: recipe file-5.39-r0: task do_compile: Succeeded
NOTE: Running task 2324 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_install)
NOTE: recipe libgpg-error-1.39-r0: task do_configure: Succeeded
NOTE: Running task 2325 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_compile)
NOTE: recipe libgpg-error-1.39-r0: task do_compile: Started
NOTE: recipe file-5.39-r0: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 2326 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_install: Succeeded
NOTE: Running task 2327 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_populate_sysroot)
NOTE: Running task 2328 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package)
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.39-r0: task do_package: Started
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 2329 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm)
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe file-5.39-r0: task do_package: Succeeded
NOTE: Running task 2330 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_packagedata)
NOTE: recipe file-5.39-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2331 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package_write_rpm)
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Started
NOTE: recipe libgpg-error-1.39-r0: task do_compile: Succeeded
NOTE: Running task 2332 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_install)
NOTE: recipe libgpg-error-1.39-r0: task do_install: Started
NOTE: recipe libgpg-error-1.39-r0: task do_install: Succeeded
NOTE: Running task 2333 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_populate_sysroot)
NOTE: Running task 2334 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_package)
NOTE: recipe libgpg-error-1.39-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.39-r0: task do_package: Started
NOTE: recipe libgpg-error-1.39-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2335 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2336 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_configure)
NOTE: recipe libgcrypt-1.8.7-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.39-r0: task do_package: Succeeded
NOTE: Running task 2337 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_packagedata)
NOTE: recipe libgpg-error-1.39-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2338 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_package_write_rpm)
NOTE: recipe libgpg-error-1.39-r0: task do_package_write_rpm: Started
NOTE: recipe libgpg-error-1.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe nettle-3.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2339 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_install)
NOTE: recipe nettle-3.6-r0: task do_install: Started
NOTE: recipe nettle-3.6-r0: task do_install: Succeeded
NOTE: Running task 2340 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_install_ptest_base)
NOTE: recipe nettle-3.6-r0: task do_install_ptest_base: Started
NOTE: recipe nettle-3.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2341 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_populate_sysroot)
NOTE: Running task 2342 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_package)
NOTE: recipe nettle-3.6-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.6-r0: task do_package: Started
NOTE: recipe nettle-3.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.6-r0: task do_package: Succeeded
NOTE: Running task 2343 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_packagedata)
NOTE: recipe nettle-3.6-r0: task do_packagedata: Started
NOTE: recipe nettle-3.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2344 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_package_write_rpm)
NOTE: recipe nettle-3.6-r0: task do_package_write_rpm: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_configure: Succeeded
NOTE: Running task 2345 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_compile)
NOTE: recipe libgcrypt-1.8.7-r0: task do_compile: Started
NOTE: recipe libunistring-0.9.10-r0: task do_configure: Succeeded
NOTE: Running task 2346 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_compile)
NOTE: recipe libunistring-0.9.10-r0: task do_compile: Started
NOTE: recipe nettle-3.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_compile: Succeeded
NOTE: Running task 2347 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_install)
NOTE: recipe libgcrypt-1.8.7-r0: task do_install: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_install: Succeeded
NOTE: Running task 2348 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_populate_sysroot)
NOTE: Running task 2349 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_package)
NOTE: recipe libgcrypt-1.8.7-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2350 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2351 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_configure)
NOTE: recipe rpm-1_4.16.0-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package: Succeeded
NOTE: Running task 2352 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_packagedata)
NOTE: recipe libgcrypt-1.8.7-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2353 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_package_write_rpm)
NOTE: recipe libgcrypt-1.8.7-r0: task do_package_write_rpm: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.0-r0: task do_configure: Succeeded
NOTE: Running task 2354 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_compile)
NOTE: recipe rpm-1_4.16.0-r0: task do_compile: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_compile: Succeeded
NOTE: Running task 2355 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_install)
NOTE: recipe rpm-1_4.16.0-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_install: Succeeded
NOTE: Running task 2356 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_package)
NOTE: Running task 2357 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.16.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.16.0-r0: task do_package: Succeeded
NOTE: Running task 2358 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.0-r0: task do_packagedata: Started
NOTE: recipe libunistring-0.9.10-r0: task do_compile: Succeeded
NOTE: Running task 2359 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_install)
NOTE: recipe libunistring-0.9.10-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2360 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe libunistring-0.9.10-r0: task do_install: Succeeded
NOTE: Running task 2361 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_populate_sysroot)
NOTE: Running task 2362 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package)
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package: Started
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2363 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2364 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_configure)
NOTE: recipe libidn2-2.3.0-r0: task do_configure: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_package: Succeeded
NOTE: Running task 2365 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata)
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata: Started
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2366 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm)
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2367 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_compile)
NOTE: recipe libidn2-2.3.0-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2368 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_install)
NOTE: recipe libidn2-2.3.0-r0: task do_install: Started
NOTE: recipe libidn2-2.3.0-r0: task do_install: Succeeded
NOTE: Running task 2369 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_populate_sysroot)
NOTE: Running task 2370 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package)
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package: Started
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2371 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.6.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.6.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2372 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_configure)
NOTE: recipe gnutls-3.6.15-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package: Succeeded
NOTE: Running task 2373 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_packagedata)
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2374 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package_write_rpm)
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnutls-3.6.15-r0: task do_configure: Succeeded
NOTE: Running task 2375 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_compile)
NOTE: recipe gnutls-3.6.15-r0: task do_compile: Started
NOTE: recipe gnutls-3.6.15-r0: task do_compile: Succeeded
NOTE: Running task 2376 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_install)
NOTE: recipe gnutls-3.6.15-r0: task do_install: Started
NOTE: recipe gnutls-3.6.15-r0: task do_install: Succeeded
NOTE: Running task 2377 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_populate_sysroot)
NOTE: Running task 2378 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_package)
NOTE: recipe gnutls-3.6.15-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.6.15-r0: task do_package: Started
NOTE: recipe gnutls-3.6.15-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2379 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.73.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.73.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2380 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_configure)
NOTE: recipe curl-7.73.0-r0: task do_configure: Started
NOTE: recipe gnutls-3.6.15-r0: task do_package: Succeeded
NOTE: Running task 2381 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_packagedata)
NOTE: recipe gnutls-3.6.15-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.6.15-r0: task do_packagedata: Succeeded
NOTE: Running task 2382 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_package_write_rpm)
NOTE: recipe gnutls-3.6.15-r0: task do_package_write_rpm: Started
NOTE: recipe gnutls-3.6.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe curl-7.73.0-r0: task do_configure: Succeeded
NOTE: Running task 2383 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_compile)
NOTE: recipe curl-7.73.0-r0: task do_compile: Started
NOTE: recipe curl-7.73.0-r0: task do_compile: Succeeded
NOTE: Running task 2384 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_install)
NOTE: recipe curl-7.73.0-r0: task do_install: Started
NOTE: recipe curl-7.73.0-r0: task do_install: Succeeded
NOTE: Running task 2385 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_package)
NOTE: Running task 2386 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_populate_sysroot)
NOTE: recipe curl-7.73.0-r0: task do_package: Started
NOTE: recipe curl-7.73.0-r0: task do_populate_sysroot: Started
NOTE: recipe curl-7.73.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2387 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-0.16.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2388 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_configure)
NOTE: recipe createrepo-c-0.16.2-r0: task do_configure: Started
NOTE: recipe curl-7.73.0-r0: task do_package: Succeeded
NOTE: Running task 2389 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_packagedata)
NOTE: recipe curl-7.73.0-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_configure: Succeeded
NOTE: Running task 2390 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_compile)
NOTE: recipe createrepo-c-0.16.2-r0: task do_compile: Started
NOTE: recipe curl-7.73.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2391 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_package_write_rpm)
NOTE: recipe curl-7.73.0-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_compile: Succeeded
NOTE: Running task 2392 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_install)
NOTE: recipe createrepo-c-0.16.2-r0: task do_install: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_install: Succeeded
NOTE: Running task 2393 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_package)
NOTE: Running task 2394 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_populate_sysroot)
NOTE: recipe createrepo-c-0.16.2-r0: task do_package: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_populate_sysroot: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe curl-7.73.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe createrepo-c-0.16.2-r0: task do_package: Succeeded
NOTE: Running task 2395 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_packagedata)
NOTE: recipe createrepo-c-0.16.2-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2396 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_package_write_rpm)
NOTE: Running task 2397 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_package_qa)
NOTE: recipe createrepo-c-0.16.2-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_package_qa: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_package_qa: Succeeded
NOTE: recipe createrepo-c-0.16.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2398 of 2398 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_build)
NOTE: Tasks Summary: Attempted 2398 tasks of which 2259 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 54 ERROR messages shown, returning a non-zero exit code.

--===============4446556219809499899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 1377 entries from dependency cache.
Parsing recipes...done.
Parsing of 791 .bb files complete (788 cached, 3 parsed). 1372 targets, 46 skipped, 0 masked, 0 errors.
Removing 116 recipes from the core2-32 sysroot...done.
Removing 118 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-20201116"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:037ee1e29b7c3a434697f0b57c758a079ad34250"
workspace            = "master:aaf6aa3e530deb4a8d818a55a37b9029980b0b0d"

Initialising tasks...done.
Sstate summary: Wanted 588 Found 530 Missed 58 Current 196 (90% match, 92% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 197 of 784 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 198 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 199 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 200 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 201 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 202 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 203 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 204 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 205 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 206 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 207 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 208 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 209 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 210 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 211 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 212 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 213 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 214 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 215 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 216 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 217 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 218 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 219 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 220 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 221 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 222 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 223 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 231 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 232 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.181.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 234 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 235 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 236 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 237 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 238 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 239 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 241 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 242 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 243 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 244 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 245 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 246 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 256 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 257 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 258 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 259 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 260 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 261 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 262 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 263 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 265 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 266 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 267 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 268 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 269 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 270 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe eudev-3.2.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.35-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1h-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.181-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 271 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 272 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 273 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 274 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbusmock-0.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 275 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 276 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 277 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 278 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe eudev-3.2.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.6-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 279 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_package_write_rpm_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe grep-3.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 280 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm_setscene)
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 281 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.102.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 282 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 283 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 284 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 285 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_package_write_rpm_setscene)
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe readline-8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 286 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 287 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 288 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 289 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 290 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe bison-3.7.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 291 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 292 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 293 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 294 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-dbusmock-0.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 295 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 296 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 297 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_packagedata_setscene)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 298 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.19.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 299 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_packagedata_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 300 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 301 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_package_write_rpm_setscene)
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 302 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package_write_rpm_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 303 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 304 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 305 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 306 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 307 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 308 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 309 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 310 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 311 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 312 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 313 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 314 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_packagedata_setscene)
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 315 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libdrm-2.4.102-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 316 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 317 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 318 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 319 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mesa-2_20.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 320 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_package_write_rpm_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 321 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 322 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_package_write_rpm_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbusmock-0.19-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 323 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 324 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 325 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_package_write_rpm_setscene)
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 326 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 327 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe elfutils-0.181-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 328 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm_setscene)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe binutils-2.35-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 329 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 330 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 331 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_package_write_rpm_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 332 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe openssl-1.1.1h-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 338 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 339 of 784 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 340 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 341 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 342 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 352 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 353 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.44.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 354 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 365 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-3.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 366 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 367 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 373 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 386 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 387 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 388 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.102-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.35-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe python3-dbusmock-0.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_deploy_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 398 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 401 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_packagedata_setscene)
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-ng-0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 405 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 407 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.9.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 415 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.181.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.181.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 417 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 426 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 427 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 429 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 439 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-ng-0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 441 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 442 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 443 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mesa-2_20.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pycairo-1.20.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 444 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.9-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.181-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_deploy_setscene: Succeeded
NOTE: recipe iptables-1.8.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 449 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_populate_sysroot_setscene)
NOTE: recipe elfutils-0.181-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 452 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 453 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 458 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 464 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 586 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_fetch)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.35-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.181-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 470 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 472 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 479 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 480 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 481 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: Running task 614 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_fetch)
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 622 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_fetch)
NOTE: recipe elfutils-0.181-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 484 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 485 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 486 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.181.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 487 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_packagedata_setscene: Started
NOTE: Running task 643 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_fetch)
NOTE: Running task 644 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_fetch)
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 672 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_fetch)
NOTE: Running task 673 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 674 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_fetch)
NOTE: Running task 696 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_fetch)
NOTE: Running task 697 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_fetch)
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.6-r0: task do_fetch: Started
NOTE: Running task 751 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_fetch)
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe bison-3.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.6-r0: task do_fetch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 778 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_unpack)
NOTE: Running setscene task 494 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_fetch: Started
NOTE: recipe musl-obstack-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_fetch: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 840 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_unpack)
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.181-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.39-r0: task do_fetch: Started
NOTE: recipe file-5.39-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.39-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.6.15-r0: task do_fetch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_fetch: Succeeded
NOTE: recipe curl-7.73.0-r0: task do_fetch: Started
NOTE: Running task 983 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_unpack)
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: Running task 994 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_unpack)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.39-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.6.15-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-7.73.0-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: Running setscene task 503 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 505 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 507 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: Running task 1000 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_unpack)
NOTE: Running task 1003 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_unpack)
NOTE: Running task 1004 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 1005 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_unpack)
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-src went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-dbg went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe libgcrypt-1.8.7-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.181-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe nettle-3.6-r0: task do_unpack: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-staticdev went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe musl-obstack-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 511 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 513 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 514 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 515 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 516 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.44.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Succeeded
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-dev went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe rpm-1_4.16.0-r0: task do_fetch: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_fetch: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-doc went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-af went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ast went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_unpack: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-be went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-bg went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ca went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-cs went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-da went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 520 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_deploy_source_date_epoch_setscene)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-de went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: Running task 1016 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_unpack)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-el went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe createrepo-c-0.16.2-r0: task do_fetch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 522 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_deploy_source_date_epoch_setscene)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-eo went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-es went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-et went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe rpm-1_4.16.0-r0: task do_fetch: Succeeded
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-eu went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe iptables-1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1019 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_unpack)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-fi went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1020 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_unpack)
NOTE: Running setscene task 524 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_deploy_source_date_epoch_setscene)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-fr went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ga went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe libunistring-0.9.10-r0: task do_unpack: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-gl went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe libgpg-error-1.39-r0: task do_unpack: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-hr went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-hu went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe nettle-3.6-r0: task do_unpack: Succeeded
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ia went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-id went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: Running task 1035 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_patch)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-it went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe file-5.39-r0: task do_unpack: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ja went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ko went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_20.2.1-r0: task do_packagedata_setscene: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ky went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe libcap-2.44-r0: task do_packagedata_setscene: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-lt went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe libcap-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe curl-7.73.0-r0: task do_unpack: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-lv went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ms went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe gmp-6.2.0-r0: task do_populate_sysroot_setscene: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-nb went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-nl went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe gmp-6.2.0-r0: task do_packagedata_setscene: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-pl went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe gnutls-3.6.15-r0: task do_unpack: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-pt went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-pt-br went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ro went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ru went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe libidn2-2.3.0-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Succeeded
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-rw went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe argp-standalone-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1040 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sk went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: Running setscene task 530 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 531 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_populate_sysroot_setscene)
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sl went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe libgcrypt-1.8.7-r0: task do_unpack: Started
NOTE: Running task 1042 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe musl-obstack-1.1-r0: task do_deploy_source_date_epoch_setscene: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sq went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sr went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe createrepo-c-0.16.2-r0: task do_unpack: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-sv went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-ta went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Started
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-th went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-tr went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-uk went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-vi went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-zh-cn went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
ERROR: bison-3.7.3-r0 do_packagedata_setscene: QA Issue: Package version for package bison-locale-zh-tw went backwards which would break package feeds (from 0:3.7.4-r0 to 0:3.7.3-r0) [version-going-backwards]
NOTE: recipe argp-standalone-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe file-5.39-r0: task do_unpack: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_unpack: Succeeded
NOTE: Running task 1051 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_patch)
NOTE: Running task 1056 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_patch)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.6-r0: task do_patch: Started
NOTE: Running setscene task 535 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_packagedata_setscene)
NOTE: recipe rpm-1_4.16.0-r0: task do_unpack: Started
NOTE: recipe libcap-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bison-3.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 542 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.0-r0: task do_patch: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.39-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1074 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_patch)
NOTE: Running task 1075 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_patch)
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 546 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: recipe file-5.39-r0: task do_patch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_patch: Started
NOTE: Running task 1080 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_20.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 548 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.102.bb:do_packagedata_setscene)
NOTE: Running setscene task 551 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 555 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 557 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 559 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1084 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.39-r0: task do_patch: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_patch: Started
NOTE: recipe gmp-6.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.102-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 563 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.39-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1099 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_deploy_source_date_epoch)
NOTE: recipe nettle-3.6-r0: task do_patch: Succeeded
NOTE: Running task 1100 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1101 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_patch)
NOTE: recipe libunistring-0.9.10-r0: task do_patch: Succeeded
NOTE: Running task 1102 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_deploy_source_date_epoch)
NOTE: recipe createrepo-c-0.16.2-r0: task do_patch: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1103 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_generate_toolchain_file)
NOTE: Running task 1104 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1105 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_populate_lic)
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 567 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.39-r0: task do_patch: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_unpack: Succeeded
NOTE: recipe nettle-3.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1114 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_deploy_source_date_epoch)
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 573 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 575 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 576 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot_setscene)
NOTE: Running task 1128 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_patch)
NOTE: recipe rpm-1_4.16.0-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.102-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 583 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.73.0-r0: task do_unpack: Succeeded
NOTE: Running task 1134 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_patch)
NOTE: recipe createrepo-c-0.16.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_populate_lic: Started
NOTE: recipe gnutls-3.6.15-r0: task do_unpack: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 1135 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_patch)
NOTE: recipe createrepo-c-0.16.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nettle-3.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.73.0-r0: task do_patch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe createrepo-c-0.16.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_populate_lic unihash changed to 4f1aac6bf1822c9d0dcbfcdf8e173062e7ae6d04c71bbce53297c8f51a88e950
NOTE: recipe gnutls-3.6.15-r0: task do_patch: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe createrepo-c-0.16.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 590 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 593 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 596 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 597 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 598 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 599 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 600 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 603 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 604 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 605 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.6.15-r0: task do_patch: Succeeded
NOTE: Running task 1153 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.73.0-r0: task do_patch: Succeeded
NOTE: Running task 1154 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.6.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-3.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.73.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 612 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 613 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 614 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 615 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 616 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 617 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 618 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 619 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 620 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 621 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 622 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 623 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 624 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 625 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 627 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnutls-3.6.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.73.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_patch: Succeeded
NOTE: Running task 1171 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-3.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 629 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb:do_packagedata_setscene)
NOTE: Running setscene task 630 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 631 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 632 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 633 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 634 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 635 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 636 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 638 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1h-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 641 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 643 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 644 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 645 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 648 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 650 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 651 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 652 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1h-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 660 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 662 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 663 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 664 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe rpm-1_4.16.0-r0: task do_patch: Succeeded
NOTE: Running task 1205 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 666 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 667 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 668 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 669 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 670 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 671 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 672 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 673 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 674 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 676 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 677 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 678 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe rpm-1_4.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 681 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 683 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 685 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 687 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 688 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 689 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 692 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 693 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 695 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 696 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 697 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 698 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 699 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 700 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 701 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 702 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 703 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 704 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 705 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 706 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 707 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 708 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 711 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 713 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 715 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: Running setscene task 716 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 717 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 718 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-1.1.1h-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 721 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 722 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 723 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 724 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 725 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 726 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 728 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 730 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.33.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 731 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 733 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 734 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 735 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 736 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 737 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 738 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 741 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-1.1.1h-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 742 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 744 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 745 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-1.1.1h-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-1.1.1h-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 747 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 748 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 749 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.18.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 750 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 751 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 752 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 753 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 755 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 756 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 757 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 758 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 760 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 762 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 763 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 764 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 765 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 766 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 770 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 771 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 772 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 773 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 774 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 777 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 778 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 779 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 780 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 781 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 782 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 783 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.35-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 784 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.35-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1705 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1772 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1907 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1908 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1948 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe libunistring-0.9.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nettle-3.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-0.9.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nettle-3.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2332 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_configure)
NOTE: Running task 2333 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_configure)
NOTE: recipe libgpg-error-1.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2334 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_configure)
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2335 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_configure)
NOTE: Running task 2336 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe libunistring-0.9.10-r0: task do_configure: Started
NOTE: recipe nettle-3.6-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.39-r0: task do_configure: Started
NOTE: recipe file-5.39-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe nettle-3.6-r0: task do_configure: Succeeded
NOTE: Running task 2337 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.6-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2338 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_compile)
NOTE: recipe nettle-3.6-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 2339 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 2340 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe nettle-3.6-r0: task do_compile: Succeeded
NOTE: Running task 2341 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_compile_ptest_base)
NOTE: recipe nettle-3.6-r0: task do_compile_ptest_base: Started
NOTE: recipe file-5.39-r0: task do_configure: Succeeded
NOTE: Running task 2342 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_compile)
NOTE: recipe file-5.39-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 2343 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 2344 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_configure: Succeeded
NOTE: Running task 2345 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_compile)
NOTE: recipe libgpg-error-1.39-r0: task do_compile: Started
NOTE: recipe file-5.39-r0: task do_compile: Succeeded
NOTE: Running task 2346 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_install)
NOTE: recipe file-5.39-r0: task do_install: Started
NOTE: recipe file-5.39-r0: task do_install: Succeeded
NOTE: Running task 2347 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_populate_sysroot)
NOTE: Running task 2348 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package)
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.39-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 2349 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 2350 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm)
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Started
NOTE: recipe file-5.39-r0: task do_package: Succeeded
NOTE: Running task 2351 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_packagedata)
NOTE: recipe file-5.39-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2352 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package_write_rpm)
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Started
NOTE: recipe libgpg-error-1.39-r0: task do_compile: Succeeded
NOTE: Running task 2353 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_install)
NOTE: recipe libgpg-error-1.39-r0: task do_install: Started
NOTE: recipe libgpg-error-1.39-r0: task do_install: Succeeded
NOTE: Running task 2354 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_populate_sysroot)
NOTE: Running task 2355 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_package)
NOTE: recipe libgpg-error-1.39-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.39-r0: task do_package: Started
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2356 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.8.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2357 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_configure)
NOTE: recipe libgcrypt-1.8.7-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.39-r0: task do_package: Succeeded
NOTE: Running task 2358 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_packagedata)
NOTE: recipe libgpg-error-1.39-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2359 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_package_write_rpm)
NOTE: recipe libgpg-error-1.39-r0: task do_package_write_rpm: Started
NOTE: recipe libgpg-error-1.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe nettle-3.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2360 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_install)
NOTE: recipe nettle-3.6-r0: task do_install: Started
NOTE: recipe nettle-3.6-r0: task do_install: Succeeded
NOTE: Running task 2361 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_install_ptest_base)
NOTE: recipe nettle-3.6-r0: task do_install_ptest_base: Started
NOTE: recipe nettle-3.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2362 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_populate_sysroot)
NOTE: Running task 2363 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_package)
NOTE: recipe nettle-3.6-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.6-r0: task do_package: Started
NOTE: recipe nettle-3.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.6-r0: task do_package: Succeeded
NOTE: Running task 2364 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_packagedata)
NOTE: recipe nettle-3.6-r0: task do_packagedata: Started
NOTE: recipe nettle-3.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2365 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_package_write_rpm)
NOTE: recipe nettle-3.6-r0: task do_package_write_rpm: Started
NOTE: recipe libunistring-0.9.10-r0: task do_configure: Succeeded
NOTE: Running task 2366 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_compile)
NOTE: recipe libunistring-0.9.10-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_configure: Succeeded
NOTE: Running task 2367 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_compile)
NOTE: recipe libgcrypt-1.8.7-r0: task do_compile: Started
NOTE: recipe nettle-3.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_compile: Succeeded
NOTE: Running task 2368 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_install)
NOTE: recipe libgcrypt-1.8.7-r0: task do_install: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_install: Succeeded
NOTE: Running task 2369 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_populate_sysroot)
NOTE: Running task 2370 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_package)
NOTE: recipe libgcrypt-1.8.7-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2371 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2372 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_configure)
NOTE: recipe rpm-1_4.16.0-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package: Succeeded
NOTE: Running task 2373 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_packagedata)
NOTE: recipe libgcrypt-1.8.7-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2374 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_package_write_rpm)
NOTE: recipe libgcrypt-1.8.7-r0: task do_package_write_rpm: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.0-r0: task do_configure: Succeeded
NOTE: Running task 2375 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_compile)
NOTE: recipe rpm-1_4.16.0-r0: task do_compile: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_compile: Succeeded
NOTE: Running task 2376 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_install)
NOTE: recipe rpm-1_4.16.0-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_install: Succeeded
NOTE: Running task 2377 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_package)
NOTE: Running task 2378 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.16.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.16.0-r0: task do_package: Succeeded
NOTE: Running task 2379 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.0-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2380 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_compile: Succeeded
NOTE: Running task 2381 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_install)
NOTE: recipe libunistring-0.9.10-r0: task do_install: Started
NOTE: recipe libunistring-0.9.10-r0: task do_install: Succeeded
NOTE: Running task 2382 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_populate_sysroot)
NOTE: Running task 2383 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package)
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package: Started
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2384 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2385 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_configure)
NOTE: recipe libidn2-2.3.0-r0: task do_configure: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package: Succeeded
NOTE: Running task 2386 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata)
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata: Started
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2387 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm)
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2388 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_compile)
NOTE: recipe libidn2-2.3.0-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2389 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_install)
NOTE: recipe libidn2-2.3.0-r0: task do_install: Started
NOTE: recipe libidn2-2.3.0-r0: task do_install: Succeeded
NOTE: Running task 2390 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_populate_sysroot)
NOTE: Running task 2391 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package)
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package: Started
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2392 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.6.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.6.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2393 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_configure)
NOTE: recipe gnutls-3.6.15-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package: Succeeded
NOTE: Running task 2394 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_packagedata)
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2395 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package_write_rpm)
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnutls-3.6.15-r0: task do_configure: Succeeded
NOTE: Running task 2396 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_compile)
NOTE: recipe gnutls-3.6.15-r0: task do_compile: Started
NOTE: recipe gnutls-3.6.15-r0: task do_compile: Succeeded
NOTE: Running task 2397 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_install)
NOTE: recipe gnutls-3.6.15-r0: task do_install: Started
NOTE: recipe gnutls-3.6.15-r0: task do_install: Succeeded
NOTE: Running task 2398 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_populate_sysroot)
NOTE: Running task 2399 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_package)
NOTE: recipe gnutls-3.6.15-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.6.15-r0: task do_package: Started
NOTE: recipe gnutls-3.6.15-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2400 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.73.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.73.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2401 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_configure)
NOTE: recipe curl-7.73.0-r0: task do_configure: Started
NOTE: recipe gnutls-3.6.15-r0: task do_package: Succeeded
NOTE: Running task 2402 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_packagedata)
NOTE: recipe gnutls-3.6.15-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.6.15-r0: task do_packagedata: Succeeded
NOTE: Running task 2403 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.6.15.bb:do_package_write_rpm)
NOTE: recipe gnutls-3.6.15-r0: task do_package_write_rpm: Started
NOTE: recipe gnutls-3.6.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe curl-7.73.0-r0: task do_configure: Succeeded
NOTE: Running task 2404 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_compile)
NOTE: recipe curl-7.73.0-r0: task do_compile: Started
NOTE: recipe curl-7.73.0-r0: task do_compile: Succeeded
NOTE: Running task 2405 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_install)
NOTE: recipe curl-7.73.0-r0: task do_install: Started
NOTE: recipe curl-7.73.0-r0: task do_install: Succeeded
NOTE: Running task 2406 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_package)
NOTE: Running task 2407 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_populate_sysroot)
NOTE: recipe curl-7.73.0-r0: task do_package: Started
NOTE: recipe curl-7.73.0-r0: task do_populate_sysroot: Started
NOTE: recipe curl-7.73.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2408 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-0.16.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2409 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_configure)
NOTE: recipe createrepo-c-0.16.2-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_configure: Succeeded
NOTE: Running task 2410 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_compile)
NOTE: recipe createrepo-c-0.16.2-r0: task do_compile: Started
NOTE: recipe curl-7.73.0-r0: task do_package: Succeeded
NOTE: Running task 2411 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_packagedata)
NOTE: recipe curl-7.73.0-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_compile: Succeeded
NOTE: Running task 2412 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_install)
NOTE: recipe createrepo-c-0.16.2-r0: task do_install: Started
NOTE: recipe curl-7.73.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2413 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.73.0.bb:do_package_write_rpm)
NOTE: recipe curl-7.73.0-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_install: Succeeded
NOTE: Running task 2414 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_package)
NOTE: Running task 2415 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_populate_sysroot)
NOTE: recipe createrepo-c-0.16.2-r0: task do_package: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_populate_sysroot: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe curl-7.73.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe createrepo-c-0.16.2-r0: task do_package: Succeeded
NOTE: Running task 2416 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_packagedata)
NOTE: recipe createrepo-c-0.16.2-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2417 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_package_write_rpm)
NOTE: Running task 2418 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_package_qa)
NOTE: recipe createrepo-c-0.16.2-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_package_qa: Started
NOTE: recipe createrepo-c-0.16.2-r0: task do_package_qa: Succeeded
NOTE: recipe createrepo-c-0.16.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2419 of 2419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb:do_build)
NOTE: Tasks Summary: Attempted 2419 tasks of which 2280 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 54 ERROR messages shown, returning a non-zero exit code.

--===============4446556219809499899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/createrepo-c/createrepo-c-bash-completion: PV changed from "0.16.1" to "0.16.2"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-bash-completion: PKGV changed from 0.16.1 [default] to 0.16.2 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PV changed from "0.16.1" to "0.16.2"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PKGV changed from 0.16.1 [default] to 0.16.2 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PKGSIZE changed from 1189796 to 1188324 (-0%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PV changed from "0.16.1" to "0.16.2"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PKGV changed from 0.16.1 [default] to 0.16.2 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-doc: PV changed from "0.16.1" to "0.16.2"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-doc: PKGV changed from 0.16.1 [default] to 0.16.2 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-locale: PV changed from "0.16.1" to "0.16.2"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-locale: PKGV changed from 0.16.1 [default] to 0.16.2 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PV changed from "0.16.1" to "0.16.2"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PKGV changed from 0.16.1 [default] to 0.16.2 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PKGSIZE changed from 1177986 to 1177899 (-0%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-staticdev: PV changed from "0.16.1" to "0.16.2"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-staticdev: PKGV changed from 0.16.1 [default] to 0.16.2 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PV changed from "0.16.1" to "0.16.2"
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PKGV changed from 0.16.1 [default] to 0.16.2 [default]
packages/core2-32-poky-linux/createrepo-c: PV changed from "0.16.1" to "0.16.2"
packages/core2-32-poky-linux/createrepo-c: PKGV changed from 0.16.1 [default] to 0.16.2 [default]
Changes to packages/core2-32-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so.0 changed symlink target from libcreaterepo_c.so.0.16.1 to libcreaterepo_c.so.0.16.2
  /usr/lib/libcreaterepo_c.so.0.16.1 moved to /usr/lib/libcreaterepo_c.so.0.16.2
  /usr/lib/python3.9/site-packages/createrepo_c-0.16.1-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/createrepo_c-0.16.2-py3.9.egg-info

--===============4446556219809499899==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-createrepo-c-upgrade-0.16.1-0.16.2.patch"

From eaca70f76a7c439a5538881ee0245e027c35dcc0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 16 Nov 2020 13:28:05 +0000
Subject: [PATCH] createrepo-c: upgrade 0.16.1 -> 0.16.2

---
 .../{createrepo-c_0.16.1.bb => createrepo-c_0.16.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_0.16.1.bb => createrepo-c_0.16.2.bb} (95%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb
similarity index 95%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb
index 942741023f..2b552a4cdf 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.1.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.16.2.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "634141eaefe0cc87466dfb91b07b64facce4384b"
+SRCREV = "031f0524905c2a64a2faae555ca9d91281448d1b"
 
 S = "${WORKDIR}/git"
 
-- 
2.20.1


--===============4446556219809499899==--
