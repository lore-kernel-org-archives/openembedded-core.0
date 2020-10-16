Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.12527.1602843683710868102
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 4516338C17C7
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:23 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libdazzle: upgrading to 3.38.0 SUCCEEDED
Message-ID: <MADEUP.163E71D70BF6F3CD.19966@lists.openembedded.org>
X-Groupsio-MsgNum: 143470
Content-Type: multipart/mixed; boundary="===============8850113182725516523=="

--===============8850113182725516523==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libdazzle* to *3.38.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libdazzle-upgrade-3.36.0-3.38.0.patch
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

--===============8850113182725516523==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1497 entries from dependency cache.
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
meta-yocto-bsp       = "tmp-auh-upgrades:04bb28f3e0c6626911053f6b89480ed660f60760"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 52 Found 44 Missed 8 Current 858 (84% match, 99% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 886 of 910 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 893 of 910 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk+3-3.24.22-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 908 of 910 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_packagedata_setscene)
NOTE: recipe gtk+3-3.24.22-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk+3-3.24.22-r0: task do_packagedata_setscene: Started
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-src went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dbg went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-demo went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-staticdev went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dev went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-doc went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3 went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-af went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-am went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-an went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ang went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ar went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-as went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ast went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az-ir went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be+latin went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bg went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn-in went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-br went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bs went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca+valencia went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ckb went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-crh went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cs went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cy went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-da went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-de went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-dz went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-el went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en+shaw went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-ca went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-gb went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eo went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-es went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-et went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eu went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fa went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fi went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fr went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fur went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ga went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gd went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gl went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gu went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-he went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hi went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hr went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hu went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hy went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ia went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-id went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-io went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-is went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-it went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ja went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ka went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kg went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kk went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-km went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kn went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ko went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ku went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ky went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lg went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-li went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lt went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lv went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mai went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mi went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mk went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ml went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mn went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mr went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ms went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-my went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nb went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nds went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ne went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nl went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nn went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nso went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-oc went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-or went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pa went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pl went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ps went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt-br went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ro went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ru went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-rw went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-si went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sk went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sl went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sq went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+ije went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+latin went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sv went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ta went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-te went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tg went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-th went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tk went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tr went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tt went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ug went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uk went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ur went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz+cyrillic went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-vi went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-wa went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-xh went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-yi went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-cn went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-hk went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-tw went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-am-et went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cedilla went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cyrillic-translit went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-inuktitut went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ipa went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-multipress went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-thai went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: Running task 2121 of 2909 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_fetch)
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-er went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-et went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-viqr went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-wayland went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-waylandgtk went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-xim went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-file went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-lpr went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: recipe gtk+3-3.24.22-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 910 of 910 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libdazzle-3.38.0-r0: task do_fetch: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_fetch: Succeeded
NOTE: Running task 2321 of 2909 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_unpack)
NOTE: Running task 2450 of 2909 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_write_config)
NOTE: recipe gtk+3-3.24.22-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libdazzle-3.38.0-r0: task do_write_config: Started
NOTE: Running task 2626 of 2909 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdazzle-3.38.0-r0: task do_write_config: Succeeded
NOTE: recipe libdazzle-3.38.0-r0: task do_unpack: Succeeded
NOTE: Running task 2751 of 2909 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_patch)
NOTE: recipe libdazzle-3.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_patch: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_patch: Succeeded
NOTE: Running task 2899 of 2909 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2900 of 2909 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_populate_lic)
NOTE: recipe libdazzle-3.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_populate_lic: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_populate_lic unihash changed to ecde5821200791c638c15dc21e24438522c0a71c627cb72c3991f571c525e020
NOTE: recipe libdazzle-3.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdazzle-3.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2901 of 2909 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_configure)
NOTE: recipe libdazzle-3.38.0-r0: task do_configure: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_configure: Succeeded
NOTE: Running task 2902 of 2909 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_compile)
NOTE: recipe libdazzle-3.38.0-r0: task do_compile: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_compile: Succeeded
NOTE: Running task 2903 of 2909 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_install)
NOTE: recipe libdazzle-3.38.0-r0: task do_install: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_install: Succeeded
NOTE: Running task 2904 of 2909 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_package)
NOTE: Running task 2905 of 2909 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_populate_sysroot)
NOTE: recipe libdazzle-3.38.0-r0: task do_package: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdazzle-3.38.0-r0: task do_package: Succeeded
NOTE: Running task 2906 of 2909 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_packagedata)
NOTE: recipe libdazzle-3.38.0-r0: task do_packagedata: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2907 of 2909 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_package_write_rpm)
NOTE: Running task 2908 of 2909 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_package_qa)
NOTE: recipe libdazzle-3.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_package_qa: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_package_qa: Succeeded
NOTE: recipe libdazzle-3.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2909 of 2909 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2909 tasks of which 2893 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 138 ERROR messages shown, returning a non-zero exit code.

--===============8850113182725516523==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 1442 entries from dependency cache.
Parsing recipes...done.
Parsing of 785 .bb files complete (782 cached, 3 parsed). 1356 targets, 70 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:04bb28f3e0c6626911053f6b89480ed660f60760"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 50 Found 42 Missed 8 Current 856 (84% match, 99% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 882 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 889 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk+3-3.24.22-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 904 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_packagedata_setscene)
NOTE: recipe gtk+3-3.24.22-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk+3-3.24.22-r0: task do_packagedata_setscene: Started
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-src went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dbg went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-demo went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-staticdev went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dev went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-doc went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3 went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-af went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-am went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-an went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ang went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ar went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-as went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ast went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az-ir went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be+latin went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bg went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn-in went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-br went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bs went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca+valencia went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ckb went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-crh went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cs went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cy went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-da went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-de went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-dz went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-el went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en+shaw went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-ca went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-gb went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eo went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-es went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-et went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eu went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fa went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fi went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fr went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fur went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ga went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gd went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gl went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gu went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-he went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hi went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hr went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hu went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hy went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ia went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-id went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-io went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-is went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-it went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ja went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ka went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kg went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kk went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-km went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kn went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ko went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ku went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ky went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lg went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-li went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lt went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lv went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mai went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mi went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mk went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ml went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mn went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mr went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ms went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-my went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nb went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nds went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ne went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nl went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nn went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nso went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-oc went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-or went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pa went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pl went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ps went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt-br went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ro went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ru went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-rw went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-si went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sk went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sl went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sq went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+ije went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+latin went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sv went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ta went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-te went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tg went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-th went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tk went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tr went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tt went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ug went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uk went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ur went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz+cyrillic went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-vi went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-wa went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-xh went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-yi went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-cn went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-hk went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-tw went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-am-et went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cedilla went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cyrillic-translit went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-inuktitut went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ipa went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-multipress went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-thai went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-er went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-et went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-viqr went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-wayland went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-waylandgtk went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-xim went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-file went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-lpr went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: recipe gtk+3-3.24.22-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 906 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 2103 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_fetch)
NOTE: recipe gtk+3-3.24.22-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_fetch: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_fetch: Succeeded
NOTE: Running task 2309 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_unpack)
NOTE: recipe gtk+3-3.24.22-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2443 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_write_config)
NOTE: Running task 2444 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdazzle-3.38.0-r0: task do_unpack: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_write_config: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_write_config: Succeeded
NOTE: recipe libdazzle-3.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_unpack: Succeeded
NOTE: Running task 2801 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_patch)
NOTE: recipe libdazzle-3.38.0-r0: task do_patch: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_patch: Succeeded
NOTE: Running task 2881 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2882 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_populate_lic)
NOTE: recipe libdazzle-3.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_populate_lic: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdazzle-3.38.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_populate_lic unihash changed to ecde5821200791c638c15dc21e24438522c0a71c627cb72c3991f571c525e020
NOTE: recipe libdazzle-3.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2883 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_configure)
NOTE: recipe libdazzle-3.38.0-r0: task do_configure: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_configure: Succeeded
NOTE: Running task 2884 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_compile)
NOTE: recipe libdazzle-3.38.0-r0: task do_compile: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_compile: Succeeded
NOTE: Running task 2885 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_install)
NOTE: recipe libdazzle-3.38.0-r0: task do_install: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_install: Succeeded
NOTE: Running task 2886 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_package)
NOTE: Running task 2887 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_populate_sysroot)
NOTE: recipe libdazzle-3.38.0-r0: task do_package: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdazzle-3.38.0-r0: task do_package: Succeeded
NOTE: Running task 2888 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_packagedata)
NOTE: recipe libdazzle-3.38.0-r0: task do_packagedata: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2889 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_package_write_rpm)
NOTE: Running task 2890 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_package_qa)
NOTE: recipe libdazzle-3.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_package_qa: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_package_qa: Succeeded
NOTE: recipe libdazzle-3.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2891 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2891 tasks of which 2875 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 138 ERROR messages shown, returning a non-zero exit code.

--===============8850113182725516523==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 1441 entries from dependency cache.
Parsing recipes...done.
Parsing of 785 .bb files complete (782 cached, 3 parsed). 1356 targets, 46 skipped, 0 masked, 0 errors.
Removing 124 recipes from the core2-32 sysroot...done.
Removing 127 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:04bb28f3e0c6626911053f6b89480ed660f60760"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 636 Found 628 Missed 8 Current 285 (98% match, 99% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 286 of 921 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 287 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 288 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 289 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 290 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 291 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 292 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 293 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 294 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 295 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 296 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 297 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 298 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 299 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 300 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 301 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 302 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 303 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 304 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 305 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 306 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 307 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 308 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 309 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 310 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 311 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 312 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 313 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 314 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.180.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 315 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 316 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 317 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 318 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 319 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 320 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 321 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 322 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 323 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 324 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 325 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.19.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 326 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 327 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.8.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 328 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 329 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 330 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 331 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 332 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 333 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 334 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 335 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 336 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 337 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 338 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 339 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 340 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 341 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1g-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe eudev-3.2.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.35-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.180-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbusmock-0.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pycairo-1.19.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe expat-2.2.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygobject-3.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 342 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 343 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe vala-0.48.9-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 344 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 345 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 346 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_packagedata_setscene)
NOTE: Running setscene task 347 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 348 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 349 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 350 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 351 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_package_write_rpm_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 353 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb:do_package_write_rpm_setscene)
NOTE: recipe eudev-3.2.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 354 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_package_write_rpm_setscene)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 361 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 362 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.8.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 363 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 365 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 366 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.102.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 367 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe readline-8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 368 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 369 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 370 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 371 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 372 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.1.8.bb:do_package_write_rpm_setscene)
NOTE: recipe bison-3.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-dbusmock-0.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pycairo-1.19.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 373 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_packagedata_setscene)
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pygobject-3.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 374 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 375 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 376 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 377 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 378 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 379 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package_write_rpm_setscene)
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 380 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.19.bb:do_packagedata_setscene)
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 381 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 382 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 383 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 384 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 385 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 386 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 387 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 388 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 389 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 390 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package_write_rpm_setscene)
NOTE: recipe vala-0.48.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 391 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package_write_rpm_setscene)
NOTE: recipe grep-3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gobject-introspection-1.64.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe vala-0.48.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.180-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 392 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.8.0.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 393 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 394 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 396 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 397 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 398 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 399 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 400 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 401 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gtk+3-3.24.22-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 402 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_package_write_rpm_setscene)
NOTE: recipe gtk+3-3.24.22-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.102-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe freetype-2.10.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1g-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 403 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package_write_rpm_setscene)
NOTE: recipe harfbuzz-2.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 404 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 405 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygobject-3.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe pango-1.46.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 406 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package_write_rpm_setscene)
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbusmock-0.19-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 407 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mesa-2_20.1.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 408 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gobject-introspection-1.64.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 409 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 410 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 411 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe iproute2-5.8.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 412 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: recipe binutils-2.35-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe vala-0.48.9-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.102-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 413 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package_write_rpm_setscene)
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.8.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe freetype-2.10.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 414 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 415 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 417 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 418 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.bb:do_package_write_rpm_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 419 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 420 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_package_write_rpm_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 423 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 424 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_package_write_rpm_setscene)
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 425 of 921 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 426 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_setscene)
NOTE: Running setscene task 427 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_package_write_rpm_setscene)
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe pango-1.46.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: Running setscene task 428 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 429 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 430 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 431 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_package_write_rpm_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: Running setscene task 432 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 433 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 434 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 435 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 436 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 437 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe vala-0.48.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 438 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 439 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 440 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 441 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.30-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 444 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_packagedata_setscene)
NOTE: Running setscene task 445 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_67.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 446 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.7.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 447 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.43.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 448 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-dbusmock-0.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygobject-3.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-0.10.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 454 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.19.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 457 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 458 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 459 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 460 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 461 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_package_write_rpm_setscene)
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.35-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe at-spi2-core-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe vala-0.48.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk+3-3.24.22-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_deploy_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.30-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-ng-0.7.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-2.43-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pycairo-1.19.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe icu-67.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mesa-2_20.1.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gtk+3-3.24.22-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 470 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 474 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.180.bb:do_packagedata_setscene)
NOTE: Running setscene task 479 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 482 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 484 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 492 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 499 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 500 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 501 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_packagedata_setscene)
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 502 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 504 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.7.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 505 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-2.43-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 506 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe eudev-3.2.9-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_deploy_setscene: Succeeded
NOTE: recipe vala-0.48.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 509 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.180-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 510 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 511 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-67.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe vala-0.48.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 514 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 515 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_packagedata_setscene)
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-src went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pycairo-1.19.1-r0: task do_packagedata_setscene: Succeeded
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dbg went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-demo went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-staticdev went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dev went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: recipe binutils-2.35-r0: task do_packagedata_setscene: Succeeded
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-doc went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: Running setscene task 520 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.2.bb:do_packagedata_setscene)
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3 went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: Running setscene task 522 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-af went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-am went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-an went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ang went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ar went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-as went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ast went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az-ir went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be+latin went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bg went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn-in went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.9-r0: task do_packagedata_setscene: Succeeded
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-br went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: Running setscene task 532 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bs went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca+valencia went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ckb went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-crh went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cs went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cy went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: recipe bison-3.7.2-r0: task do_packagedata_setscene: Started
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-da went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-de went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-dz went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-el went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: recipe elfutils-0.180-r0: task do_packagedata_setscene: Succeeded
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: Running setscene task 539 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 541 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 544 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en+shaw went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-ca went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-gb went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eo went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-es went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-et went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Succeeded
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eu went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fa went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fi went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fr went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fur went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ga went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 550 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gd went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gl went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gu went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-he went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Started
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hi went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hr went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hu went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hy went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ia went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-id went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-io went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-is went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-it went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ja went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Succeeded
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ka went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kg went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kk went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-km went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kn went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ko went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ku went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ky went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lg went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-li went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lt went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lv went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mai went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mi went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mk went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ml went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mn went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mr went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ms went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-my went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nb went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nds went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: Running setscene task 561 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ne went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: Running setscene task 563 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.43.bb:do_packagedata_setscene)
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nl went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nn went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nso went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-oc went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-or went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pa went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pl went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ps went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt-br went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ro went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ru went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-rw went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-si went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sk went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sl went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sq went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+ije went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+latin went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: recipe libcap-2.43-r0: task do_packagedata_setscene: Started
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sv went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ta went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: recipe gmp-6.2.0-r0: task do_packagedata_setscene: Started
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-te went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tg went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-th went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tk went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tr went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: recipe iptables-1.8.5-r0: task do_packagedata_setscene: Succeeded
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tt went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ug went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: Running task 1055 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_fetch)
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uk went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ur went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz+cyrillic went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-vi went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-wa went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: recipe bison-3.7.2-r0: task do_packagedata_setscene: Succeeded
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-xh went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-yi went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-cn went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-hk went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-tw went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-am-et went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cedilla went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cyrillic-translit went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-inuktitut went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ipa went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-multipress went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-thai went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-er went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: Running task 1238 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_write_config)
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-et went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-viqr went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-wayland went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: recipe libdazzle-3.38.0-r0: task do_fetch: Started
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-waylandgtk went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-xim went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-file went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-lpr went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: recipe libdazzle-3.38.0-r0: task do_fetch: Succeeded
NOTE: Running task 1315 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_unpack)
NOTE: recipe libcap-2.43-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk+3-3.24.22-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdazzle-3.38.0-r0: task do_write_config: Started
NOTE: Running setscene task 588 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 590 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 591 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 592 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 593 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 595 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 596 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 597 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 598 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 599 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 600 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 601 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 602 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libdazzle-3.38.0-r0: task do_unpack: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.46.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pango-1.46.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libdazzle-3.38.0-r0: task do_unpack: Succeeded
NOTE: Running task 1417 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-0.10.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.46.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 604 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 606 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 608 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.46.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 610 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 611 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 612 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 613 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 614 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 616 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 617 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_packagedata_setscene)
NOTE: Running setscene task 618 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 619 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 620 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libdazzle-3.38.0-r0: task do_patch: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 622 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 623 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 624 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 625 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 626 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libdazzle-3.38.0-r0: task do_patch: Succeeded
NOTE: Running task 1422 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1423 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_populate_lic)
NOTE: recipe libepoxy-1.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.46.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe atk-2.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-0.10.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pango-1.46.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libdazzle-3.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libdazzle-3.38.0-r0: task do_populate_lic: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 628 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 630 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 631 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 632 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 633 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_67.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 634 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_67.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 636 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libdazzle-3.38.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_populate_lic unihash changed to ecde5821200791c638c15dc21e24438522c0a71c627cb72c3991f571c525e020
NOTE: recipe libdazzle-3.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe icu-67.1-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-67.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 638 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 640 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 641 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 642 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 643 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 644 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.30-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 646 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 647 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 648 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 649 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.1.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 650 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.1.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 651 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 652 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 654 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 655 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 656 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe icu-67.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_20.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_20.1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 659 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 660 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 661 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe icu-67.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 662 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_67.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 664 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.64.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.64.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 666 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 667 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 668 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 670 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 671 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 672 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 674 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe icu-67.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe freetype-2.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mesa-2_20.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 676 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.102.bb:do_packagedata_setscene)
NOTE: Running setscene task 677 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 678 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 679 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 680 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 681 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe icu-67.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.64.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.64.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 683 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_20.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 684 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.102.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 685 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.1.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 686 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 687 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 688 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 689 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 690 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.102-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 693 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 695 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 696 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 697 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 699 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 700 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 701 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gobject-introspection-1.64.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdrm-2.4.102-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.10.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 703 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_20.1.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.64.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 706 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.10.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mesa-2_20.1.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.102-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 709 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 711 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 712 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 713 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.102-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 714 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 715 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 716 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.102.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 717 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 718 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 719 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 720 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 721 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 723 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.102-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 725 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 726 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libdrm-2.4.102-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 727 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 729 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 730 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 731 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 733 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 735 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 736 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 737 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 740 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 741 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 743 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 744 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 745 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 746 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 747 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 750 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 752 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb:do_packagedata_setscene)
NOTE: Running setscene task 753 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 754 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 755 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 756 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 757 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 758 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_packagedata_setscene)
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 761 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: Running setscene task 763 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1g-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 765 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 766 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 768 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 769 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 770 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 771 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 772 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 773 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 774 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 775 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 776 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 777 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 778 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 779 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 780 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 781 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.2.9-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-1.1.1g-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.2.9-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 790 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 793 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 795 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 798 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.2.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.2.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 800 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 802 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 803 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 804 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 806 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 807 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 808 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.2.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 811 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 812 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 813 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.2.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 815 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 816 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 817 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 819 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: recipe python3-3.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 820 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 821 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 822 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 823 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 824 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 825 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 826 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 827 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 828 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 829 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 830 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.8.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 831 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 832 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 833 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 834 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 835 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 836 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 837 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 839 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 840 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 841 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 842 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.7.11.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 844 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1g-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.7.11-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 846 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.8.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.8.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 847 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 848 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 850 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 851 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 852 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 854 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 855 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 856 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 857 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 858 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 859 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 861 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 862 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 863 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 864 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 865 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 866 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 867 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.7.11.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.7.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 870 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.33.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 871 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 873 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1g-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 875 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.7.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 877 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 878 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-1.1.1g-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 880 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 882 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 883 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-1.1.1g-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.7.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 884 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 885 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.7.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 887 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.7.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 888 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 891 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.7.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 892 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 893 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 895 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 897 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 898 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 899 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 901 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 902 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 903 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 904 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 905 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 909 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 910 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 911 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 914 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 915 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 916 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 917 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 918 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 919 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 920 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.35-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 921 of 921 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.35-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2647 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdazzle-3.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2922 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_configure)
NOTE: recipe libdazzle-3.38.0-r0: task do_configure: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_configure: Succeeded
NOTE: Running task 2923 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_compile)
NOTE: recipe libdazzle-3.38.0-r0: task do_compile: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_compile: Succeeded
NOTE: Running task 2924 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_install)
NOTE: recipe libdazzle-3.38.0-r0: task do_install: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_install: Succeeded
NOTE: Running task 2925 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_package)
NOTE: Running task 2926 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_populate_sysroot)
NOTE: recipe libdazzle-3.38.0-r0: task do_package: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdazzle-3.38.0-r0: task do_package: Succeeded
NOTE: Running task 2927 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_packagedata)
NOTE: recipe libdazzle-3.38.0-r0: task do_packagedata: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2928 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_package_write_rpm)
NOTE: Running task 2929 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_package_qa)
NOTE: recipe libdazzle-3.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_package_qa: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_package_qa: Succeeded
NOTE: recipe libdazzle-3.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2930 of 2930 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2930 tasks of which 2914 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 138 ERROR messages shown, returning a non-zero exit code.

--===============8850113182725516523==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libdazzle-upgrade-3.36.0-3.38.0.patch"

From 9f89241fe22488e7dfb6ff301d82c46fc3ca46a9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 07:31:27 +0000
Subject: [PATCH] libdazzle: upgrade 3.36.0 -> 3.38.0

---
 .../libdazzle/{libdazzle_3.36.0.bb => libdazzle_3.38.0.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-gnome/libdazzle/{libdazzle_3.36.0.bb => libdazzle_3.38.0.bb} (82%)

diff --git a/meta/recipes-gnome/libdazzle/libdazzle_3.36.0.bb b/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb
similarity index 82%
rename from meta/recipes-gnome/libdazzle/libdazzle_3.36.0.bb
rename to meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb
index 25ccee2e29..a2a1aed7bc 100644
--- a/meta/recipes-gnome/libdazzle/libdazzle_3.36.0.bb
+++ b/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb
@@ -12,8 +12,7 @@ inherit gnomebase upstream-version-is-even vala features_check gobject-introspec
 
 DEPENDS = "glib-2.0-native glib-2.0 gtk+3"
 
-SRC_URI[archive.md5sum] = "154be45a6aac020e7d59f477bd7cafcf"
-SRC_URI[archive.sha256sum] = "82b31bbf550fc62970c78bf7f9d55e5fae5b8ea13b24fe2d13c8c6039409d958"
+SRC_URI[archive.sha256sum] = "e18af28217943bcec106585298a91ec3da48aa3ad62fd0992f23f0c70cd1678f"
 
 GIR_MESON_OPTION = 'with_introspection'
 
-- 
2.18.4


--===============8850113182725516523==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 1442 entries from dependency cache.
Parsing recipes...done.
Parsing of 785 .bb files complete (782 cached, 3 parsed). 1356 targets, 61 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:04bb28f3e0c6626911053f6b89480ed660f60760"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 53 Found 45 Missed 8 Current 853 (84% match, 99% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 882 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 889 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk+3-3.24.22-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 904 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_packagedata_setscene)
NOTE: recipe gtk+3-3.24.22-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk+3-3.24.22-r0: task do_packagedata_setscene: Started
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-src went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dbg went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-demo went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-staticdev went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dev went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-doc went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3 went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-af went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-am went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-an went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ang went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ar went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-as went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ast went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az-ir went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be+latin went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bg went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn-in went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-br went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bs went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca+valencia went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ckb went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-crh went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cs went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cy went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-da went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-de went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-dz went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-el went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en+shaw went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-ca went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-gb went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eo went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-es went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-et went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eu went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fa went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fi went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fr went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fur went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ga went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gd went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gl went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gu went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-he went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hi went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hr went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hu went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hy went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ia went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-id went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-io went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-is went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-it went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ja went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ka went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kg went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kk went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-km went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kn went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ko went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ku went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ky went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lg went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-li went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lt went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lv went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mai went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mi went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mk went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ml went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mn went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mr went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ms went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-my went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nb went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nds went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ne went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nl went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nn went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nso went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-oc went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: Running task 2103 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_fetch)
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-or went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pa went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pl went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ps went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt-br went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ro went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ru went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-rw went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-si went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sk went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sl went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sq went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+ije went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+latin went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sv went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: recipe libdazzle-3.38.0-r0: task do_fetch: Started
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ta went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-te went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tg went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: recipe libdazzle-3.38.0-r0: task do_fetch: Succeeded
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-th went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: Running task 2333 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_unpack)
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tk went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tr went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tt went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ug went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uk went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ur went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz+cyrillic went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-vi went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: Running task 2432 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_write_config)
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-wa went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-xh went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-yi went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-cn went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-hk went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-tw went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-am-et went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cedilla went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: recipe libdazzle-3.38.0-r0: task do_unpack: Started
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cyrillic-translit went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-inuktitut went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ipa went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-multipress went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-thai went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-er went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-et went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-viqr went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-wayland went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: recipe libdazzle-3.38.0-r0: task do_write_config: Started
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-waylandgtk went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-xim went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-file went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-lpr went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: recipe libdazzle-3.38.0-r0: task do_write_config: Succeeded
NOTE: recipe gtk+3-3.24.22-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 906 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libdazzle-3.38.0-r0: task do_unpack: Succeeded
NOTE: Running task 2824 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_patch)
NOTE: recipe gtk+3-3.24.22-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_patch: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_patch: Succeeded
NOTE: Running task 2861 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2862 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_populate_lic)
NOTE: recipe gtk+3-3.24.22-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2874 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdazzle-3.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_populate_lic: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_populate_lic unihash changed to ecde5821200791c638c15dc21e24438522c0a71c627cb72c3991f571c525e020
NOTE: recipe libdazzle-3.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdazzle-3.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2883 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_configure)
NOTE: recipe libdazzle-3.38.0-r0: task do_configure: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_configure: Succeeded
NOTE: Running task 2884 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_compile)
NOTE: recipe libdazzle-3.38.0-r0: task do_compile: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_compile: Succeeded
NOTE: Running task 2885 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_install)
NOTE: recipe libdazzle-3.38.0-r0: task do_install: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_install: Succeeded
NOTE: Running task 2886 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_package)
NOTE: Running task 2887 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_populate_sysroot)
NOTE: recipe libdazzle-3.38.0-r0: task do_package: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdazzle-3.38.0-r0: task do_package: Succeeded
NOTE: Running task 2888 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_packagedata)
NOTE: recipe libdazzle-3.38.0-r0: task do_packagedata: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2889 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_package_write_rpm)
NOTE: Running task 2890 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_package_qa)
NOTE: recipe libdazzle-3.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_package_qa: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_package_qa: Succeeded
NOTE: recipe libdazzle-3.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2891 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2891 tasks of which 2875 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 138 ERROR messages shown, returning a non-zero exit code.

--===============8850113182725516523==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 1442 entries from dependency cache.
Parsing recipes...done.
Parsing of 785 .bb files complete (782 cached, 3 parsed). 1356 targets, 53 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:04bb28f3e0c6626911053f6b89480ed660f60760"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 50 Found 42 Missed 8 Current 856 (84% match, 99% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 882 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 889 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk+3-3.24.22-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 904 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_packagedata_setscene)
NOTE: recipe gtk+3-3.24.22-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk+3-3.24.22-r0: task do_packagedata_setscene: Started
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-src went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dbg went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-demo went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-staticdev went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dev went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-doc went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3 went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-af went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-am went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-an went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ang went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ar went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-as went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ast went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az-ir went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be+latin went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bg went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn-in went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-br went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bs went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca+valencia went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ckb went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-crh went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cs went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cy went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-da went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-de went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-dz went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-el went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en+shaw went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-ca went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-gb went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eo went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-es went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-et went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eu went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fa went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fi went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fr went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fur went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ga went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gd went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gl went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gu went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-he went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hi went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hr went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hu went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hy went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ia went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-id went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-io went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-is went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-it went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ja went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ka went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kg went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kk went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-km went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kn went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ko went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ku went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ky went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lg went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-li went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lt went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lv went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mai went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mi went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mk went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ml went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mn went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mr went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ms went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-my went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nb went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nds went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ne went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nl went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nn went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nso went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-oc went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-or went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: Running task 2103 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_fetch)
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pa went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pl went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ps went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt-br went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ro went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ru went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-rw went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-si went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sk went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sl went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sq went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+ije went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+latin went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sv went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ta went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-te went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tg went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: recipe libdazzle-3.38.0-r0: task do_fetch: Started
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-th went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tk went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tr went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: recipe libdazzle-3.38.0-r0: task do_fetch: Succeeded
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tt went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: Running task 2348 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_unpack)
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ug went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uk went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ur went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz+cyrillic went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-vi went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-wa went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-xh went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: Running task 2432 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_write_config)
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-yi went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-cn went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-hk went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-tw went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-am-et went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cedilla went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: recipe libdazzle-3.38.0-r0: task do_unpack: Started
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cyrillic-translit went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-inuktitut went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ipa went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-multipress went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-thai went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-er went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-et went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-viqr went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: recipe libdazzle-3.38.0-r0: task do_write_config: Started
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-wayland went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-waylandgtk went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-xim went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-file went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
ERROR: gtk+3-3.24.22-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-lpr went backwards which would break package feeds (from 0:3.24.23-r0 to 0:3.24.22-r0) [version-going-backwards]
NOTE: recipe libdazzle-3.38.0-r0: task do_write_config: Succeeded
NOTE: recipe gtk+3-3.24.22-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 906 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libdazzle-3.38.0-r0: task do_unpack: Succeeded
NOTE: Running task 2860 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_patch)
NOTE: recipe gtk+3-3.24.22-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_patch: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_patch: Succeeded
NOTE: Running task 2861 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2862 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_populate_lic)
NOTE: recipe gtk+3-3.24.22-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2874 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdazzle-3.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_populate_lic: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_populate_lic unihash changed to ecde5821200791c638c15dc21e24438522c0a71c627cb72c3991f571c525e020
NOTE: recipe libdazzle-3.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdazzle-3.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2883 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_configure)
NOTE: recipe libdazzle-3.38.0-r0: task do_configure: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_configure: Succeeded
NOTE: Running task 2884 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_compile)
NOTE: recipe libdazzle-3.38.0-r0: task do_compile: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_compile: Succeeded
NOTE: Running task 2885 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_install)
NOTE: recipe libdazzle-3.38.0-r0: task do_install: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_install: Succeeded
NOTE: Running task 2886 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_package)
NOTE: Running task 2887 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_populate_sysroot)
NOTE: recipe libdazzle-3.38.0-r0: task do_package: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdazzle-3.38.0-r0: task do_package: Succeeded
NOTE: Running task 2888 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_packagedata)
NOTE: recipe libdazzle-3.38.0-r0: task do_packagedata: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2889 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_package_write_rpm)
NOTE: Running task 2890 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_package_qa)
NOTE: recipe libdazzle-3.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_package_qa: Started
NOTE: recipe libdazzle-3.38.0-r0: task do_package_qa: Succeeded
NOTE: recipe libdazzle-3.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2891 of 2891 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2891 tasks of which 2875 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 138 ERROR messages shown, returning a non-zero exit code.

--===============8850113182725516523==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libdazzle: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/libdazzle: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/libdazzle/libdazzle-dbg: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/libdazzle/libdazzle-dbg: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/libdazzle/libdazzle-dbg: PKGSIZE changed from 3930076 to 3936632 (+0%)
packages/core2-32-poky-linux/libdazzle/libdazzle-dev: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/libdazzle/libdazzle-dev: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/libdazzle/libdazzle-dev: PKGSIZE changed from 1603243 to 1606221 (+0%)
packages/core2-32-poky-linux/libdazzle/libdazzle-doc: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/libdazzle/libdazzle-doc: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/libdazzle/libdazzle-locale: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/libdazzle/libdazzle-locale: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/libdazzle/libdazzle-src: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/libdazzle/libdazzle-src: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/libdazzle/libdazzle-src: PKGSIZE changed from 2875794 to 2882455 (+0%)
packages/core2-32-poky-linux/libdazzle/libdazzle-staticdev: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/libdazzle/libdazzle-staticdev: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/libdazzle/libdazzle: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/libdazzle/libdazzle: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/libdazzle/libdazzle: PKGSIZE changed from 1248740 to 1253348 (+0%)

--===============8850113182725516523==--
