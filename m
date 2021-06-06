Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web09.25897.1623000257644803401
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jun 2021 10:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 4F84438C12B7
	for <openembedded-core@lists.openembedded.org>; Sun,  6 Jun 2021 17:24:18 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 177 SUCCEEDED
Message-ID: <MADEUP.16860E22DF927B1B.23614@lists.openembedded.org>
X-Groupsio-MsgNum: 152731
Content-Type: multipart/mixed; boundary="===============6049646108977493468=="

--===============6049646108977493468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *177* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-175-177.patch
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

--===============6049646108977493468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 816 .bb files complete (0 cached, 816 parsed). 1452 targets, 41 skipped, 0 masked, 0 errors.
Removing 149 recipes from the core2-32 sysroot...done.
Removing 153 recipes from the qemux86 sysroot...done.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============6049646108977493468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.9/site-packages/diffoscope-175-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/diffoscope-177-py3.9.egg-info

--===============6049646108977493468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 816 .bb files complete (0 cached, 816 parsed). 1452 targets, 49 skipped, 0 masked, 0 errors.
Removing 1 recipes from the armv7vet2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-5d0ba1efdf81e21c9521d52f7efaef39a3af5516"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:5d0ba1efdf81e21c9521d52f7efaef39a3af5516"
workspace            = "master:ae7595a603f3fea1750f3f170e0e7c8098a352c7"

Initialising tasks...done.
Sstate summary: Wanted 39 Local 8 Network 0 Missed 31 Current 1018 (20% match, 97% complete)
Removing 4 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 1030 of 1057 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1031 of 1057 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1055 of 1057 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_packagedata_setscene)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.40.1-r0: task do_packagedata_setscene: Started
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-src went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dbg went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-staticdev went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dev went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
NOTE: Running task 1110 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-doc went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-an went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-as went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ast went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-be went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bg went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bn-in went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bs went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca+valencia went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-cs went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-da went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-de went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-el went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-ca went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-gb went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eo went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-es went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-et went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eu went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fa went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fi went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fr went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fur went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ga went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gd went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gl went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gu went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-he went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hi went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hr went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hu went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-id went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-it went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ja went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kk went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-km went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kn went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ko went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lt went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lv went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ml went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mr went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ms went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nb went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ne went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nl went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-oc went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-or went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pa went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pl went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt-br went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ro went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ru went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sk went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sl went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sq went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr+latin went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sv went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ta went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-te went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tg went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tr went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ug went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uk went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uz+cyrillic went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-vi went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-cn went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-hk went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-tw went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
NOTE: recipe at-spi2-core-2.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1057 of 1057 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2334 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_fetch)
NOTE: Running task 2404 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_fetch)
NOTE: Running task 2405 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_fetch)
NOTE: Running task 2406 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_fetch)
NOTE: Running task 2407 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_fetch)
NOTE: Running task 2408 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: recipe diffoscope-177-r0: task do_fetch: Started
NOTE: recipe diffoscope-177-r0: task do_fetch: Succeeded
NOTE: recipe python3-magic-0.4.22-r0: task do_fetch: Started
NOTE: Running task 2735 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_unpack)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_fetch: Started
NOTE: Running task 2736 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Started
NOTE: recipe vim-8.2-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-magic-0.4.22-r0: task do_fetch: Succeeded
NOTE: Running task 2762 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_unpack)
NOTE: Running task 2763 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Succeeded
NOTE: Running task 2764 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_unpack)
NOTE: Running task 2765 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-8.2-r0: task do_fetch: Succeeded
NOTE: Running task 2766 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 2767 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 2768 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_unpack)
NOTE: Running task 2769 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_unpack)
NOTE: recipe diffoscope-177-r0: task do_unpack: Started
NOTE: recipe diffoscope-177-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-177-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.22-r0: task do_unpack: Succeeded
NOTE: Running task 3065 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_patch)
NOTE: Running task 3066 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_patch)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_unpack: Succeeded
NOTE: Running task 3067 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_patch)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Started
NOTE: recipe vim-8.2-r0: task do_unpack: Started
NOTE: recipe diffoscope-177-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 3068 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 3069 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Succeeded
NOTE: Running task 3070 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 3071 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_patch)
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Succeeded
NOTE: Running task 3072 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Started
NOTE: recipe diffoscope-177-r0: task do_patch: Succeeded
NOTE: Running task 3073 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_deploy_source_date_epoch)
NOTE: Running task 3074 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_populate_lic)
NOTE: recipe python3-magic-0.4.22-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-177-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3075 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_patch: Succeeded
NOTE: Running task 3076 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.22-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-177-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-177-r0: task do_populate_lic: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to a8696e704c99cc59615f43f4ade37486103a54ed0fa00837ab731a5a39076f1c
NOTE: recipe python3-libarchive-c-3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3189 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3190 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3192 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe diffoscope-177-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-177-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_populate_lic unihash changed to f5f491dfaf4a6d53b200a3fa07047f39cef5a9681c4409026ae526d292fcb651
NOTE: recipe vim-8.2-r0: task do_unpack: Succeeded
NOTE: Running task 3204 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch)
NOTE: Running task 3205 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 3206 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.22-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3207 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_configure)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3208 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_configure)
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Started
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe vim-8.2-r0: task do_patch: Started
NOTE: recipe diffoscope-177-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Succeeded
NOTE: Running task 3209 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe python3-magic-0.4.22-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_configure: Started
NOTE: recipe diffoscope-177-r0: task do_configure: Succeeded
NOTE: Running task 3210 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_compile)
NOTE: recipe python3-magic-0.4.22-r0: task do_configure: Succeeded
NOTE: Running task 3211 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_compile)
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_configure: Succeeded
NOTE: Running task 3212 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_compile)
NOTE: recipe diffoscope-177-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to f375887b6676e4b3e599da54f7d8296740821993a123d53f1b0a0f328db6805f
NOTE: Setscene tasks completed
NOTE: recipe python3-libarchive-c-3.0-r0: task do_compile: Started
NOTE: Running task 3279 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Succeeded
NOTE: Running task 3288 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-8.2-r0: task do_patch: Succeeded
NOTE: Running task 3289 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_compile: Succeeded
NOTE: Running task 3290 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_install)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-177-r0: task do_compile: Succeeded
NOTE: Running task 3291 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_install)
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_compile: Succeeded
NOTE: Running task 3292 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_install)
NOTE: recipe python3-magic-0.4.22-r0: task do_install: Started
NOTE: recipe diffoscope-177-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_install: Started
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe python3-magic-0.4.22-r0: task do_install: Succeeded
NOTE: Running task 3293 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_package)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_install: Succeeded
NOTE: Running task 3294 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_package)
NOTE: recipe python3-magic-0.4.22-r0: task do_package: Started
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3295 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_configure)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_package: Started
NOTE: recipe vim-8.2-r0: task do_configure: Started
NOTE: recipe diffoscope-177-r0: task do_install: Succeeded
NOTE: Running task 3296 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_package)
NOTE: Running task 3297 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_populate_sysroot)
NOTE: recipe diffoscope-177-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-177-r0: task do_package: Started
NOTE: Running task 3298 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_configure)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_package: Succeeded
NOTE: Running task 3299 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_packagedata)
NOTE: recipe diffoscope-177-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.22-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_package: Succeeded
NOTE: Running task 3300 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_packagedata: Started
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-src went backwards which would break package feeds (from 0:0.4.24-r0 to 0:0.4.22-r0) [version-going-backwards]
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-dbg went backwards which would break package feeds (from 0:0.4.24-r0 to 0:0.4.22-r0) [version-going-backwards]
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-staticdev went backwards which would break package feeds (from 0:0.4.24-r0 to 0:0.4.22-r0) [version-going-backwards]
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-dev went backwards which would break package feeds (from 0:0.4.24-r0 to 0:0.4.22-r0) [version-going-backwards]
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-doc went backwards which would break package feeds (from 0:0.4.24-r0 to 0:0.4.22-r0) [version-going-backwards]
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-locale went backwards which would break package feeds (from 0:0.4.24-r0 to 0:0.4.22-r0) [version-going-backwards]
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic went backwards which would break package feeds (from 0:0.4.24-r0 to 0:0.4.22-r0) [version-going-backwards]
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-src went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-dbg went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-staticdev went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-dev went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-doc went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-locale went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
NOTE: recipe python3-magic-0.4.22-r0: task do_packagedata: Succeeded
NOTE: Running task 3301 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Succeeded
NOTE: Running task 3302 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3303 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Succeeded
NOTE: Running task 3304 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Started
NOTE: recipe diffoscope-177-r0: task do_package: Succeeded
NOTE: Running task 3305 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.22-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-177-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-177-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Succeeded
NOTE: Running task 3306 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3307 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_configure: Succeeded
NOTE: Running task 3308 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_compile)
NOTE: recipe vim-8.2-r0: task do_compile: Started
NOTE: recipe vim-8.2-r0: task do_compile: Succeeded
NOTE: Running task 3309 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_install)
NOTE: recipe vim-8.2-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Succeeded
NOTE: Running task 3310 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_compile)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Started
NOTE: recipe vim-8.2-r0: task do_install: Succeeded
NOTE: Running task 3311 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package)
NOTE: recipe vim-8.2-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Succeeded
NOTE: Running task 3312 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_install)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Started
NOTE: recipe vim-8.2-r0: task do_package: Succeeded
NOTE: Running task 3313 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_packagedata)
NOTE: recipe vim-8.2-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Succeeded
NOTE: Running task 3314 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Started
NOTE: recipe vim-8.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3315 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package_write_rpm)
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Succeeded
NOTE: Running task 3316 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Started
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3317 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package_write_rpm)
NOTE: Running task 3318 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_package_write_rpm)
NOTE: Running task 3319 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_package_qa)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-177-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-177-r0: task do_package_qa: Started
NOTE: recipe diffoscope-177-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-177-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3320 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_build)
NOTE: Tasks Summary: Attempted 3320 tasks of which 3245 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 91 ERROR messages shown, returning a non-zero exit code.

--===============6049646108977493468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 816 .bb files complete (0 cached, 816 parsed). 1452 targets, 66 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-5d0ba1efdf81e21c9521d52f7efaef39a3af5516"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:5d0ba1efdf81e21c9521d52f7efaef39a3af5516"
workspace            = "master:ae7595a603f3fea1750f3f170e0e7c8098a352c7"

Initialising tasks...done.
Sstate summary: Wanted 39 Local 8 Network 0 Missed 31 Current 1018 (20% match, 97% complete)
Removing 4 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 1030 of 1057 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1031 of 1057 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1055 of 1057 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_packagedata_setscene)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.40.1-r0: task do_packagedata_setscene: Started
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-src went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dbg went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-staticdev went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dev went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-doc went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-an went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-as went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ast went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-be went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bg went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bn-in went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bs went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca+valencia went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-cs went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-da went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
NOTE: Running task 1110 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-de went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-el went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-ca went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-gb went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eo went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-es went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-et went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eu went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fa went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fi went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fr went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fur went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ga went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gd went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gl went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gu went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-he went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hi went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hr went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hu went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-id went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-it went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ja went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kk went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-km went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kn went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ko went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lt went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lv went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ml went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mr went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ms went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nb went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ne went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nl went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-oc went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-or went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pa went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pl went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt-br went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ro went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ru went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sk went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sl went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sq went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr+latin went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sv went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ta went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-te went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tg went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tr went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ug went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uk went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uz+cyrillic went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-vi went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-cn went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-hk went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-tw went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
NOTE: recipe at-spi2-core-2.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1057 of 1057 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2334 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_fetch)
NOTE: Running task 2404 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_fetch)
NOTE: Running task 2405 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_fetch)
NOTE: Running task 2406 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_fetch)
NOTE: Running task 2407 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2408 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_fetch)
NOTE: recipe diffoscope-177-r0: task do_fetch: Started
NOTE: recipe diffoscope-177-r0: task do_fetch: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_fetch: Started
NOTE: Running task 2662 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_unpack)
NOTE: Running task 2663 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_fetch: Started
NOTE: recipe vim-8.2-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_fetch: Succeeded
NOTE: Running task 2708 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_unpack)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_fetch: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Succeeded
NOTE: Running task 2709 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_unpack)
NOTE: Running task 2714 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2729 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-8.2-r0: task do_fetch: Succeeded
NOTE: Running task 2730 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 2731 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_unpack)
NOTE: Running task 2732 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2733 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe diffoscope-177-r0: task do_unpack: Started
NOTE: recipe diffoscope-177-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_unpack: Succeeded
NOTE: Running task 2933 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_patch)
NOTE: recipe diffoscope-177-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.22-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2961 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_patch)
NOTE: recipe python3-magic-0.4.22-r0: task do_unpack: Succeeded
NOTE: recipe vim-8.2-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2994 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_patch)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Succeeded
NOTE: Running task 3068 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe diffoscope-177-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 3069 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 3070 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Succeeded
NOTE: Running task 3071 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 3072 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_patch)
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe diffoscope-177-r0: task do_patch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to af8664518cbc6402031640163c4390c955100a45cde311e8b3b1c7b30b30ef23
NOTE: recipe python3-magic-0.4.22-r0: task do_patch: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Started
NOTE: recipe diffoscope-177-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3174 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_deploy_source_date_epoch)
NOTE: Running task 3186 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.22-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-3.0-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-177-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3187 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_deploy_source_date_epoch)
NOTE: Running task 3188 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3189 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3191 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: Running task 3203 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_populate_lic)
NOTE: recipe python3-magic-0.4.22-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 3204 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe diffoscope-177-r0: task do_populate_lic: Started
NOTE: recipe diffoscope-177-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3205 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Succeeded
NOTE: Running task 3206 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe vim-8.2-r0: task do_unpack: Succeeded
NOTE: Running task 3207 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch)
NOTE: recipe python3-magic-0.4.22-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-177-r0: task do_configure: Started
NOTE: Running task 3208 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_configure)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3209 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_configure)
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Started
NOTE: recipe diffoscope-177-r0: task do_populate_lic: Succeeded
NOTE: recipe diffoscope-177-r0: task do_configure: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_populate_lic unihash changed to f5f491dfaf4a6d53b200a3fa07047f39cef5a9681c4409026ae526d292fcb651
NOTE: recipe vim-8.2-r0: task do_patch: Started
NOTE: Running task 3210 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_compile)
NOTE: recipe python3-magic-0.4.22-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_configure: Succeeded
NOTE: Running task 3211 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_compile)
NOTE: recipe diffoscope-177-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_configure: Succeeded
NOTE: Running task 3212 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 93756c671474c35a2671dda5ef84a5d04884ce64292016de139a9612b8f1bfeb
NOTE: Setscene tasks completed
NOTE: recipe python3-magic-0.4.22-r0: task do_compile: Started
NOTE: Running task 3279 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Succeeded
NOTE: Running task 3288 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.22-r0: task do_compile: Succeeded
NOTE: Running task 3289 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_install)
NOTE: recipe diffoscope-177-r0: task do_compile: Succeeded
NOTE: Running task 3290 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_install)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_compile: Succeeded
NOTE: Running task 3291 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_install)
NOTE: recipe python3-magic-0.4.22-r0: task do_install: Started
NOTE: recipe diffoscope-177-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-3.0-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe python3-magic-0.4.22-r0: task do_install: Succeeded
NOTE: Running task 3292 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_package)
NOTE: recipe python3-magic-0.4.22-r0: task do_package: Started
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-3.0-r0: task do_install: Succeeded
NOTE: Running task 3293 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_package)
NOTE: recipe vim-8.2-r0: task do_patch: Succeeded
NOTE: Running task 3294 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3295 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_configure)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_package: Started
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Started
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3296 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_configure)
NOTE: recipe diffoscope-177-r0: task do_install: Succeeded
NOTE: Running task 3297 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_package)
NOTE: Running task 3298 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_populate_sysroot)
NOTE: recipe vim-8.2-r0: task do_configure: Started
NOTE: recipe diffoscope-177-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-177-r0: task do_package: Started
NOTE: recipe diffoscope-177-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.22-r0: task do_package: Succeeded
NOTE: Running task 3299 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.22-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_package: Succeeded
NOTE: Running task 3300 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_packagedata)
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-src went backwards which would break package feeds (from 0:0.4.24-r0 to 0:0.4.22-r0) [version-going-backwards]
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-dbg went backwards which would break package feeds (from 0:0.4.24-r0 to 0:0.4.22-r0) [version-going-backwards]
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-staticdev went backwards which would break package feeds (from 0:0.4.24-r0 to 0:0.4.22-r0) [version-going-backwards]
NOTE: recipe python3-libarchive-c-3.0-r0: task do_packagedata: Started
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-dev went backwards which would break package feeds (from 0:0.4.24-r0 to 0:0.4.22-r0) [version-going-backwards]
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-doc went backwards which would break package feeds (from 0:0.4.24-r0 to 0:0.4.22-r0) [version-going-backwards]
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-locale went backwards which would break package feeds (from 0:0.4.24-r0 to 0:0.4.22-r0) [version-going-backwards]
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic went backwards which would break package feeds (from 0:0.4.24-r0 to 0:0.4.22-r0) [version-going-backwards]
NOTE: recipe python3-magic-0.4.22-r0: task do_packagedata: Succeeded
NOTE: Running task 3301 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Succeeded
NOTE: Running task 3302 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-src went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-dbg went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-staticdev went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
NOTE: recipe python3-magic-0.4.22-r0: task do_package_write_rpm: Started
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-dev went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-doc went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-locale went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3303 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Succeeded
NOTE: Running task 3304 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-177-r0: task do_package: Succeeded
NOTE: Running task 3305 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_packagedata)
NOTE: recipe diffoscope-177-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-177-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Succeeded
NOTE: Running task 3306 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3307 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_configure: Succeeded
NOTE: Running task 3308 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_compile)
NOTE: recipe vim-8.2-r0: task do_compile: Started
NOTE: recipe vim-8.2-r0: task do_compile: Succeeded
NOTE: Running task 3309 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_install)
NOTE: recipe vim-8.2-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Succeeded
NOTE: Running task 3310 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_compile)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Started
NOTE: recipe vim-8.2-r0: task do_install: Succeeded
NOTE: Running task 3311 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package)
NOTE: recipe vim-8.2-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Succeeded
NOTE: Running task 3312 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_install)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Succeeded
NOTE: Running task 3313 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Started
NOTE: recipe vim-8.2-r0: task do_package: Succeeded
NOTE: Running task 3314 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_packagedata)
NOTE: recipe vim-8.2-r0: task do_packagedata: Started
NOTE: recipe vim-8.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3315 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package_write_rpm)
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Succeeded
NOTE: Running task 3316 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3317 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package_write_rpm)
NOTE: Running task 3318 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_package_write_rpm)
NOTE: Running task 3319 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_package_qa)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-177-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-177-r0: task do_package_qa: Started
NOTE: recipe diffoscope-177-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-177-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3320 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_build)
NOTE: Tasks Summary: Attempted 3320 tasks of which 3245 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 91 ERROR messages shown, returning a non-zero exit code.

--===============6049646108977493468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 816 .bb files complete (0 cached, 816 parsed). 1452 targets, 58 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-5d0ba1efdf81e21c9521d52f7efaef39a3af5516"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:5d0ba1efdf81e21c9521d52f7efaef39a3af5516"
workspace            = "master:ae7595a603f3fea1750f3f170e0e7c8098a352c7"

Initialising tasks...done.
Sstate summary: Wanted 39 Local 8 Network 0 Missed 31 Current 1018 (20% match, 97% complete)
Removing 4 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 1030 of 1057 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1031 of 1057 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1055 of 1057 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_packagedata_setscene)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.40.1-r0: task do_packagedata_setscene: Started
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-src went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dbg went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-staticdev went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dev went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-doc went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
NOTE: Running task 1110 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-an went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-as went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ast went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-be went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bg went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bn-in went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bs went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca+valencia went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-cs went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-da went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-de went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-el went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-ca went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-gb went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eo went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-es went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-et went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eu went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fa went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fi went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fr went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fur went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ga went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gd went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gl went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gu went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-he went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hi went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hr went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hu went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-id went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-it went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ja went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kk went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-km went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kn went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ko went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lt went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lv went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ml went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mr went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ms went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nb went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ne went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nl went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-oc went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-or went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pa went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pl went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt-br went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ro went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ru went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sk went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sl went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sq went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr+latin went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sv went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ta went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-te went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tg went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tr went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ug went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uk went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uz+cyrillic went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-vi went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-cn went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-hk went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-tw went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
NOTE: recipe at-spi2-core-2.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1057 of 1057 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2334 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_fetch)
NOTE: Running task 2404 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2405 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_fetch)
NOTE: Running task 2406 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_fetch)
NOTE: Running task 2407 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_fetch)
NOTE: Running task 2408 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_fetch)
NOTE: recipe diffoscope-177-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_fetch: Started
NOTE: recipe diffoscope-177-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-3.0-r0: task do_fetch: Started
NOTE: Running task 2746 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_unpack)
NOTE: Running task 2747 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-3.0-r0: task do_fetch: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 2775 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: recipe vim-8.2-r0: task do_fetch: Started
NOTE: Running task 2776 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_unpack)
NOTE: Running task 2777 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_unpack)
NOTE: Running task 2778 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2779 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2780 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-8.2-r0: task do_fetch: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 2781 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_unpack)
NOTE: Running task 2782 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_unpack)
NOTE: recipe diffoscope-177-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Started
NOTE: recipe diffoscope-177-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-3.0-r0: task do_unpack: Succeeded
NOTE: Running task 2881 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_patch)
NOTE: Running task 2882 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_patch)
NOTE: recipe diffoscope-177-r0: task do_unpack: Succeeded
NOTE: Running task 2937 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_patch)
NOTE: recipe python3-magic-0.4.22-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-8.2-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_patch: Started
NOTE: recipe diffoscope-177-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 3068 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 3069 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Succeeded
NOTE: Running task 3070 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-177-r0: task do_patch: Succeeded
NOTE: Running task 3071 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_deploy_source_date_epoch)
NOTE: Running task 3072 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_populate_lic)
NOTE: recipe diffoscope-177-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 3073 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 3074 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_patch)
NOTE: recipe diffoscope-177-r0: task do_populate_lic: Started
NOTE: recipe diffoscope-177-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_patch: Succeeded
NOTE: Running task 3075 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.22-r0: task do_patch: Succeeded
NOTE: Running task 3076 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.22-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 18ff1335989c10daf887d231d18248f4253445e601e18dc205b8b6a777f9bd7f
NOTE: recipe diffoscope-177-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_populate_lic unihash changed to f5f491dfaf4a6d53b200a3fa07047f39cef5a9681c4409026ae526d292fcb651
NOTE: recipe diffoscope-177-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3178 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_configure)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3190 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.22-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3191 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3204 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 3205 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe diffoscope-177-r0: task do_configure: Started
NOTE: recipe vim-8.2-r0: task do_unpack: Succeeded
NOTE: Running task 3206 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3207 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_configure)
NOTE: recipe python3-magic-0.4.22-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3208 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_configure)
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Started
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe diffoscope-177-r0: task do_configure: Succeeded
NOTE: Running task 3209 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_compile)
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Succeeded
NOTE: Running task 3210 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe vim-8.2-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_configure: Succeeded
NOTE: Running task 3211 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_compile)
NOTE: recipe python3-magic-0.4.22-r0: task do_configure: Succeeded
NOTE: Running task 3212 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_compile)
NOTE: recipe diffoscope-177-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to b9e21ab3b31a31ce3eb7b137c75c027a08c8977bb36ec7d973653c0701679a8f
NOTE: recipe python3-magic-0.4.22-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_compile: Started
NOTE: Setscene tasks completed
NOTE: Running task 3279 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe diffoscope-177-r0: task do_compile: Succeeded
NOTE: recipe vim-8.2-r0: task do_patch: Succeeded
NOTE: Running task 3288 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_install)
NOTE: Running task 3289 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_compile: Succeeded
NOTE: Running task 3290 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_install)
NOTE: recipe python3-magic-0.4.22-r0: task do_compile: Succeeded
NOTE: Running task 3291 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_install)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Succeeded
NOTE: Running task 3292 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-177-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_install: Started
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-3.0-r0: task do_install: Succeeded
NOTE: Running task 3293 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_package)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe python3-magic-0.4.22-r0: task do_install: Succeeded
NOTE: Running task 3294 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_package)
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3295 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_configure)
NOTE: recipe python3-magic-0.4.22-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3296 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_configure)
NOTE: recipe vim-8.2-r0: task do_configure: Started
NOTE: recipe diffoscope-177-r0: task do_install: Succeeded
NOTE: Running task 3297 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_package)
NOTE: Running task 3298 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Started
NOTE: recipe diffoscope-177-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-177-r0: task do_package: Started
NOTE: recipe diffoscope-177-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-3.0-r0: task do_package: Succeeded
NOTE: Running task 3299 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_package: Succeeded
NOTE: Running task 3300 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.22-r0: task do_packagedata: Started
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-src went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-dbg went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-staticdev went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-dev went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-doc went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-locale went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-src went backwards which would break package feeds (from 0:0.4.24-r0 to 0:0.4.22-r0) [version-going-backwards]
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-dbg went backwards which would break package feeds (from 0:0.4.24-r0 to 0:0.4.22-r0) [version-going-backwards]
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-staticdev went backwards which would break package feeds (from 0:0.4.24-r0 to 0:0.4.22-r0) [version-going-backwards]
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-dev went backwards which would break package feeds (from 0:0.4.24-r0 to 0:0.4.22-r0) [version-going-backwards]
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-doc went backwards which would break package feeds (from 0:0.4.24-r0 to 0:0.4.22-r0) [version-going-backwards]
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-locale went backwards which would break package feeds (from 0:0.4.24-r0 to 0:0.4.22-r0) [version-going-backwards]
NOTE: recipe python3-libarchive-c-3.0-r0: task do_packagedata: Succeeded
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic went backwards which would break package feeds (from 0:0.4.24-r0 to 0:0.4.22-r0) [version-going-backwards]
NOTE: Running task 3301 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_package_write_rpm)
NOTE: recipe python3-magic-0.4.22-r0: task do_packagedata: Succeeded
NOTE: Running task 3302 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-177-r0: task do_package: Succeeded
NOTE: Running task 3303 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.22-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-177-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Succeeded
NOTE: Running task 3304 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Succeeded
NOTE: Running task 3305 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-177-r0: task do_packagedata: Succeeded
NOTE: recipe python3-magic-0.4.22-r0: task do_package_write_rpm: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Succeeded
NOTE: Running task 3306 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3307 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_configure: Succeeded
NOTE: Running task 3308 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_compile)
NOTE: recipe vim-8.2-r0: task do_compile: Started
NOTE: recipe vim-8.2-r0: task do_compile: Succeeded
NOTE: Running task 3309 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_install)
NOTE: recipe vim-8.2-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Succeeded
NOTE: Running task 3310 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_compile)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Started
NOTE: recipe vim-8.2-r0: task do_install: Succeeded
NOTE: Running task 3311 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package)
NOTE: recipe vim-8.2-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Succeeded
NOTE: Running task 3312 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_install)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Succeeded
NOTE: Running task 3313 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Started
NOTE: recipe vim-8.2-r0: task do_package: Succeeded
NOTE: Running task 3314 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_packagedata)
NOTE: recipe vim-8.2-r0: task do_packagedata: Started
NOTE: recipe vim-8.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3315 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package_write_rpm)
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Succeeded
NOTE: Running task 3316 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3317 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package_write_rpm)
NOTE: Running task 3318 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_package_write_rpm)
NOTE: Running task 3319 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_package_qa)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-177-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-177-r0: task do_package_qa: Started
NOTE: recipe diffoscope-177-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-177-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3320 of 3320 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_build)
NOTE: Tasks Summary: Attempted 3320 tasks of which 3245 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 91 ERROR messages shown, returning a non-zero exit code.

--===============6049646108977493468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1453 entries from dependency cache.
Parsing recipes...done.
Parsing of 816 .bb files complete (815 cached, 1 parsed). 1452 targets, 31 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-5d0ba1efdf81e21c9521d52f7efaef39a3af5516"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:5d0ba1efdf81e21c9521d52f7efaef39a3af5516"
workspace            = "master:ae7595a603f3fea1750f3f170e0e7c8098a352c7"

Initialising tasks...done.
Sstate summary: Wanted 39 Local 8 Network 0 Missed 31 Current 1022 (20% match, 97% complete)
Removing 4 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 1034 of 1061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1035 of 1061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe at-spi2-core-2.40.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1059 of 1061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_packagedata_setscene)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.40.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1110 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-src went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dbg went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-staticdev went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dev went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-doc went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-an went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-as went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ast went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-be went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bg went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bn-in went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bs went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca+valencia went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-cs went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-da went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-de went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-el went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-ca went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-gb went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eo went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-es went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-et went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eu went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fa went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fi went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fr went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fur went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ga went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gd went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gl went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gu went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-he went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hi went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hr went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hu went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-id went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-it went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ja went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kk went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-km went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kn went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ko went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lt went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lv went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ml went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mr went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ms went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nb went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ne went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nl went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-oc went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-or went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pa went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pl went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt-br went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ro went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ru went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sk went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sl went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sq went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr+latin went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sv went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ta went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-te went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tg went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tr went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ug went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uk went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uz+cyrillic went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-vi went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-cn went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-hk went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
ERROR: at-spi2-core-2.40.1-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-tw went backwards which would break package feeds (from 0:2.40.2-r0 to 0:2.40.1-r0) [version-going-backwards]
NOTE: recipe at-spi2-core-2.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1061 of 1061 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.40.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 2348 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_fetch)
NOTE: Running task 2418 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_fetch)
NOTE: Running task 2419 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_fetch)
NOTE: Running task 2420 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_fetch)
NOTE: Running task 2421 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2422 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_fetch)
NOTE: recipe at-spi2-core-2.40.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe diffoscope-177-r0: task do_fetch: Started
NOTE: recipe diffoscope-177-r0: task do_fetch: Succeeded
NOTE: Running task 2621 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_unpack)
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_fetch: Started
NOTE: Running task 2652 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.22-r0: task do_fetch: Started
NOTE: recipe vim-8.2-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 2690 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: recipe python3-magic-0.4.22-r0: task do_fetch: Succeeded
NOTE: Running task 2731 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_unpack)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_fetch: Succeeded
NOTE: recipe vim-8.2-r0: task do_fetch: Succeeded
NOTE: Running task 2746 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2747 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_unpack)
NOTE: Running task 2748 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_unpack)
NOTE: Running task 2749 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 2750 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_unpack)
NOTE: Running task 2751 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-177-r0: task do_unpack: Started
NOTE: recipe diffoscope-177-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Started
NOTE: recipe diffoscope-177-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.22-r0: task do_unpack: Started
NOTE: Running task 2946 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_patch)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-8.2-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_unpack: Succeeded
NOTE: Running task 3084 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_patch)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_unpack: Succeeded
NOTE: recipe diffoscope-177-r0: task do_patch: Started
NOTE: Running task 3085 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_patch)
NOTE: recipe python3-magic-0.4.22-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 3086 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Succeeded
NOTE: Running task 3087 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 3088 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_unpack: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3089 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_patch)
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Succeeded
NOTE: Running task 3090 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-177-r0: task do_patch: Succeeded
NOTE: Running task 3091 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-177-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3092 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_populate_lic)
NOTE: recipe python3-magic-0.4.22-r0: task do_patch: Succeeded
NOTE: Running task 3093 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.22-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-3.0-r0: task do_patch: Succeeded
NOTE: Running task 3094 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3095 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe diffoscope-177-r0: task do_populate_lic: Started
NOTE: recipe diffoscope-177-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 8e80df8e3c154258d07017b0fffc2fdf741c69e23789e2227ad5fca7b03eec1a
NOTE: recipe python3-magic-0.4.22-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3208 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Started
NOTE: Running task 3209 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-177-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_populate_lic unihash changed to f5f491dfaf4a6d53b200a3fa07047f39cef5a9681c4409026ae526d292fcb651
NOTE: recipe diffoscope-177-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3222 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_configure)
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Succeeded
NOTE: Running task 3223 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe vim-8.2-r0: task do_unpack: Succeeded
NOTE: Running task 3224 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 3225 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3226 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_configure)
NOTE: Running task 3227 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_configure)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-177-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe vim-8.2-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_configure: Started
NOTE: recipe diffoscope-177-r0: task do_configure: Succeeded
NOTE: recipe python3-libarchive-c-3.0-r0: task do_configure: Started
NOTE: Running task 3228 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_compile)
NOTE: recipe python3-magic-0.4.22-r0: task do_configure: Succeeded
NOTE: Running task 3229 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_compile)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_configure: Succeeded
NOTE: Running task 3230 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_compile)
NOTE: recipe diffoscope-177-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 70976806914b80e0b2d21ca75441b1fe883e77187b4c6b289081eb49492d3b04
NOTE: Setscene tasks completed
NOTE: Running task 3297 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_patch: Succeeded
NOTE: Running task 3306 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-8.2-r0: task do_patch: Succeeded
NOTE: Running task 3307 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe diffoscope-177-r0: task do_compile: Succeeded
NOTE: Running task 3308 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_install)
NOTE: recipe python3-magic-0.4.22-r0: task do_compile: Succeeded
NOTE: Running task 3309 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_install)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_compile: Succeeded
NOTE: Running task 3310 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_install)
NOTE: recipe diffoscope-177-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-3.0-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_install: Succeeded
NOTE: Running task 3311 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_package)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_install: Succeeded
NOTE: Running task 3312 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_package)
NOTE: recipe python3-magic-0.4.22-r0: task do_package: Started
NOTE: recipe diffoscope-177-r0: task do_install: Succeeded
NOTE: Running task 3313 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_package)
NOTE: Running task 3314 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_populate_sysroot)
NOTE: recipe diffoscope-177-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-177-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-177-r0: task do_populate_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Succeeded
NOTE: Running task 3315 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_package: Succeeded
NOTE: Running task 3316 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Succeeded
NOTE: Running task 3317 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_configure)
NOTE: Running task 3318 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-src went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_package: Succeeded
NOTE: Running task 3319 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_packagedata)
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-dbg went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-staticdev went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-dev went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-doc went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-locale went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-3.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c went backwards which would break package feeds (from 0:3.1-r0 to 0:3.0-r0) [version-going-backwards]
NOTE: recipe python3-magic-0.4.22-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3320 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_package_write_rpm: Started
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-src went backwards which would break package feeds (from 0:0.4.24-r0 to 0:0.4.22-r0) [version-going-backwards]
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-dbg went backwards which would break package feeds (from 0:0.4.24-r0 to 0:0.4.22-r0) [version-going-backwards]
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-staticdev went backwards which would break package feeds (from 0:0.4.24-r0 to 0:0.4.22-r0) [version-going-backwards]
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-dev went backwards which would break package feeds (from 0:0.4.24-r0 to 0:0.4.22-r0) [version-going-backwards]
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-doc went backwards which would break package feeds (from 0:0.4.24-r0 to 0:0.4.22-r0) [version-going-backwards]
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic-locale went backwards which would break package feeds (from 0:0.4.24-r0 to 0:0.4.22-r0) [version-going-backwards]
ERROR: python3-magic-0.4.22-r0 do_packagedata: QA Issue: Package version for package python3-magic went backwards which would break package feeds (from 0:0.4.24-r0 to 0:0.4.22-r0) [version-going-backwards]
NOTE: recipe python3-magic-0.4.22-r0: task do_packagedata: Succeeded
NOTE: Running task 3321 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_package_write_rpm)
NOTE: recipe python3-magic-0.4.22-r0: task do_package_write_rpm: Started
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3322 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_configure)
NOTE: recipe python3-libarchive-c-3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_configure: Started
NOTE: recipe diffoscope-177-r0: task do_package: Succeeded
NOTE: Running task 3323 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_packagedata)
NOTE: recipe diffoscope-177-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_package_write_rpm: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Succeeded
NOTE: Running task 3324 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Started
NOTE: recipe diffoscope-177-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3325 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_configure: Succeeded
NOTE: Running task 3326 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_compile)
NOTE: recipe vim-8.2-r0: task do_compile: Started
NOTE: recipe vim-8.2-r0: task do_compile: Succeeded
NOTE: Running task 3327 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_install)
NOTE: recipe vim-8.2-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_configure: Succeeded
NOTE: Running task 3328 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_compile)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Started
NOTE: recipe vim-8.2-r0: task do_install: Succeeded
NOTE: Running task 3329 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package)
NOTE: recipe vim-8.2-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_compile: Succeeded
NOTE: Running task 3330 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_install)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_install: Succeeded
NOTE: Running task 3331 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Started
NOTE: recipe vim-8.2-r0: task do_package: Succeeded
NOTE: Running task 3332 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_packagedata)
NOTE: recipe vim-8.2-r0: task do_packagedata: Started
NOTE: recipe vim-8.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3333 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package_write_rpm)
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package: Succeeded
NOTE: Running task 3334 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.16.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3335 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb:do_package_write_rpm)
NOTE: Running task 3336 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_package_write_rpm)
NOTE: Running task 3337 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_package_qa)
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-177-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-177-r0: task do_package_qa: Started
NOTE: recipe diffoscope-177-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-177-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3338 of 3338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_177.bb:do_build)
NOTE: Tasks Summary: Attempted 3338 tasks of which 3263 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 91 ERROR messages shown, returning a non-zero exit code.

--===============6049646108977493468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 175 [default] to 177 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PV changed from "175" to "177"
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 175 [default] to 177 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PV changed from "175" to "177"
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 175 [default] to 177 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PV changed from "175" to "177"
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 175 [default] to 177 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PV changed from "175" to "177"
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PKGV changed from 175 [default] to 177 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PV changed from "175" to "177"
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 175 [default] to 177 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "175" to "177"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGV changed from 175 [default] to 177 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 944790 to 945397 (+0%)
packages/core2-32-poky-linux/diffoscope/diffoscope: PV changed from "175" to "177"
packages/core2-32-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-175.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-177.tar.gz"
packages/core2-32-poky-linux/diffoscope: PKGV changed from 175 [default] to 177 [default]
packages/core2-32-poky-linux/diffoscope: PV changed from "175" to "177"
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.9/site-packages/diffoscope-175-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/diffoscope-177-py3.9.egg-info

--===============6049646108977493468==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-175-177.patch"

From c1f2b759b40eff1b725e6dcc1396e10550100826 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 6 Jun 2021 16:26:48 +0000
Subject: [PATCH] diffoscope: upgrade 175 -> 177

---
 .../diffoscope/{diffoscope_175.bb => diffoscope_177.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_175.bb => diffoscope_177.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_175.bb b/meta/recipes-support/diffoscope/diffoscope_177.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_175.bb
rename to meta/recipes-support/diffoscope/diffoscope_177.bb
index 853f8dd3a0..0d9061dda0 100644
--- a/meta/recipes-support/diffoscope/diffoscope_175.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_177.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "b87481752815140e35088647ccdea13297e41a2d72772e842590360b662f7533"
+SRC_URI[sha256sum] = "8ac0cad150914bab2a53caa3f21876a78b092f3d2a36b9134874cd5c04a26b2e"
 
 RDEPENDS_${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.17.1


--===============6049646108977493468==--
