Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web08.303.1615826521351636603
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 09:42:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 3B7D738C1286
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 16:42:02 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 169 SUCCEEDED
Message-ID: <MADEUP.166C91A952F7518A.2480@lists.openembedded.org>
X-Groupsio-MsgNum: 149525
Content-Type: multipart/mixed; boundary="===============2713398356560908986=="

--===============2713398356560908986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *169* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-168-169.patch
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

--===============2713398356560908986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 41 skipped, 0 masked, 0 errors.
Removing 139 recipes from the core2-32 sysroot...done.
Removing 143 recipes from the qemux86 sysroot...done.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============2713398356560908986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 168 [default] to 169 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PV changed from "168" to "169"
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 168 [default] to 169 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PV changed from "168" to "169"
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 168 [default] to 169 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PV changed from "168" to "169"
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 168 [default] to 169 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PV changed from "168" to "169"
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PKGV changed from 168 [default] to 169 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PV changed from "168" to "169"
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 168 [default] to 169 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "168" to "169"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 941079 to 941514 (+0%)
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGV changed from 168 [default] to 169 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope: PV changed from "168" to "169"
packages/core2-32-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-168.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-169.tar.gz"
packages/core2-32-poky-linux/diffoscope: PKGV changed from 168 [default] to 169 [default]
packages/core2-32-poky-linux/diffoscope: PV changed from "168" to "169"
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.9/site-packages/diffoscope-168-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/diffoscope-169-py3.9.egg-info

--===============2713398356560908986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 49 skipped, 0 masked, 0 errors.
Removing 1 recipes from the armv7vet2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-382355db0b322e8aef7d64ee3d5bf198db6fa2f0"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:382355db0b322e8aef7d64ee3d5bf198db6fa2f0"
workspace            = "master:eec64066073428e38d5b0b6947ff302943188f65"

Initialising tasks...done.
Sstate summary: Wanted 99 Local 63 Network 0 Missed 36 Current 905 (63% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 907 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 908 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 909 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 910 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 913 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 918 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 928 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 929 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 931 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.25.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 932 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 936 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 953 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 959 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 963 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.25.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gtk+3-3.24.25-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe pango-1.48.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_247.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 968 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 969 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: recipe gtk+3-3.24.25-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.48.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 970 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe systemd-1_247.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 971 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata_setscene)
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk+3-3.24.25-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 975 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.25.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 976 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 977 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 978 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe gtk+3-3.24.25-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk+3-3.24.25-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-src went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dbg went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-demo went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-staticdev went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dev went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-doc went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3 went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-af went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-am went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-an went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2014 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_fetch)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ang went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ar went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-as went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ast went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az-ir went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be+latin went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2110 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_fetch)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bg went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn-in went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-br went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bs went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2182 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_fetch)
NOTE: Running task 2183 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2184 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_fetch)
NOTE: Running task 2185 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_fetch)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca+valencia went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ckb went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-crh went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cs went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cy went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe lz4-1_1.9.3-r0: task do_fetch: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-da went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-de went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-dz went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-el went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2288 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_fetch)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en+shaw went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-ca went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe lz4-1_1.9.3-r0: task do_fetch: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-gb went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2332 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_unpack)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eo went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2333 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_prepare_recipe_sysroot)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-es went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-et went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe diffoscope-169-r0: task do_fetch: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eu went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fa went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fi went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe diffoscope-169-r0: task do_fetch: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fr went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fur went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2393 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_unpack)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ga went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe python3-magic-0.4.22-r0: task do_fetch: Started
NOTE: recipe vim-8.2-r0: task do_fetch: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gd went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gl went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe python3-libarchive-c-2.9-r0: task do_fetch: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gu went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2440 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.22-r0: task do_fetch: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-he went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hi went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2441 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_unpack)
NOTE: Running task 2454 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hr went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hu went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe python3-libarchive-c-2.9-r0: task do_fetch: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hy went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe vim-8.2-r0: task do_fetch: Succeeded
NOTE: Running task 2475 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_unpack)
NOTE: Running task 2485 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_unpack)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ia went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe libarchive-3.5.1-r0: task do_fetch: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-id went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe lz4-1_1.9.3-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_prepare_recipe_sysroot: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-io went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe libarchive-3.5.1-r0: task do_fetch: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-is went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-it went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2533 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_unpack)
NOTE: Running task 2539 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_prepare_recipe_sysroot)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ja went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ka went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kg went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2540 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_prepare_recipe_sysroot)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kk went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe diffoscope-169-r0: task do_unpack: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-km went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kn went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ko went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ku went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ky went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lg went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-li went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lt went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_unpack: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lv went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mai went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe diffoscope-169-r0: task do_prepare_recipe_sysroot: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mi went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe python3-libarchive-c-2.9-r0: task do_unpack: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mk went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe diffoscope-169-r0: task do_unpack: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ml went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2697 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_patch)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mn went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe vim-8.2-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_unpack: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mr went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2724 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_patch)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ms went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe python3-libarchive-c-2.9-r0: task do_unpack: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-my went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2750 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_patch)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nb went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nds went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe python3-magic-0.4.22-r0: task do_prepare_recipe_sysroot: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ne went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe libarchive-3.5.1-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_prepare_recipe_sysroot: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nl went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nn went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe lz4-1_1.9.3-r0: task do_unpack: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nso went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2837 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_patch)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-oc went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-or went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pa went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pl went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ps went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe lz4-1_1.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt-br went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ro went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe diffoscope-169-r0: task do_patch: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ru went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-rw went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-si went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sk went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2869 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sl went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sq went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe python3-libarchive-c-2.9-r0: task do_patch: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+ije went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+latin went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sv went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe python3-magic-0.4.22-r0: task do_patch: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ta went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-te went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tg went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-th went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tk went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tr went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tt went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe libarchive-3.5.1-r0: task do_unpack: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ug went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe lz4-1_1.9.3-r0: task do_patch: Started
NOTE: Running task 2870 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_patch)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uk went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ur went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz+cyrillic went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-vi went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-wa went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe lz4-1_1.9.3-r0: task do_patch: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-xh went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-yi went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2871 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_deploy_source_date_epoch)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-cn went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-hk went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-tw went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-am-et went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cedilla went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cyrillic-translit went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-inuktitut went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ipa went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-multipress went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-thai went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-er went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-et went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe libarchive-3.5.1-r0: task do_patch: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-viqr went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-wayland went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-waylandgtk went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-xim went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-file went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe lz4-1_1.9.3-r0: task do_deploy_source_date_epoch: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-lpr went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk+3-3.24.25-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 983 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.25.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 984 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 985 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.2.bb:do_populate_sysroot_setscene)
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Succeeded
NOTE: Running task 2876 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.5.1-r0: task do_patch: Succeeded
NOTE: Running task 2877 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2883 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_configure)
NOTE: recipe diffoscope-169-r0: task do_patch: Succeeded
NOTE: Running task 2884 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_deploy_source_date_epoch)
NOTE: Running task 2885 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_populate_lic)
NOTE: recipe diffoscope-169-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.25-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.48.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.48.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_patch: Succeeded
NOTE: Running task 2886 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.22-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2887 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.25-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-magic-0.4.22-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-169-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-169-r0: task do_populate_lic: Started
ERROR: pango-1.48.2-r0 do_packagedata_setscene: QA Issue: Package version for package pango-src went backwards which would break package feeds (from 0:1.48.3-r0 to 0:1.48.2-r0) [version-going-backwards]
ERROR: pango-1.48.2-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dbg went backwards which would break package feeds (from 0:1.48.3-r0 to 0:1.48.2-r0) [version-going-backwards]
ERROR: pango-1.48.2-r0 do_packagedata_setscene: QA Issue: Package version for package pango-ptest went backwards which would break package feeds (from 0:1.48.3-r0 to 0:1.48.2-r0) [version-going-backwards]
ERROR: pango-1.48.2-r0 do_packagedata_setscene: QA Issue: Package version for package pango-staticdev went backwards which would break package feeds (from 0:1.48.3-r0 to 0:1.48.2-r0) [version-going-backwards]
ERROR: pango-1.48.2-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dev went backwards which would break package feeds (from 0:1.48.3-r0 to 0:1.48.2-r0) [version-going-backwards]
NOTE: recipe python3-libarchive-c-2.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_configure: Succeeded
ERROR: pango-1.48.2-r0 do_packagedata_setscene: QA Issue: Package version for package pango-doc went backwards which would break package feeds (from 0:1.48.3-r0 to 0:1.48.2-r0) [version-going-backwards]
NOTE: recipe python3-magic-0.4.22-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2892 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_compile)
ERROR: pango-1.48.2-r0 do_packagedata_setscene: QA Issue: Package version for package pango-locale went backwards which would break package feeds (from 0:1.48.3-r0 to 0:1.48.2-r0) [version-going-backwards]
ERROR: pango-1.48.2-r0 do_packagedata_setscene: QA Issue: Package version for package pango went backwards which would break package feeds (from 0:1.48.3-r0 to 0:1.48.2-r0) [version-going-backwards]
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vim-8.2-r0: task do_unpack: Succeeded
NOTE: Running task 2893 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch)
NOTE: recipe pango-1.48.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.48.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 988 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 989 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 990 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe lz4-1_1.9.3-r0: task do_compile: Started
NOTE: recipe diffoscope-169-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_populate_lic unihash changed to 64eb19f6588bae1eef9dfbb14e3d442d96fb969c8b4a16b693d338061548f214
NOTE: recipe diffoscope-169-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2895 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_configure)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vim-8.2-r0: task do_patch: Started
NOTE: Running task 2896 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_configure)
NOTE: recipe python3-magic-0.4.22-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2897 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_configure)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.48.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_configure: Started
NOTE: recipe pango-1.48.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe diffoscope-169-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_configure: Started
NOTE: recipe diffoscope-169-r0: task do_configure: Succeeded
NOTE: Running task 2902 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_compile)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.22-r0: task do_configure: Succeeded
NOTE: Running task 2903 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_compile)
NOTE: Running task 2904 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_compile)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe diffoscope-169-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_compile: Started
NOTE: recipe vim-8.2-r0: task do_patch: Succeeded
NOTE: Running task 2905 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_compile: Succeeded
NOTE: Running task 2906 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_install)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_compile: Succeeded
NOTE: recipe diffoscope-169-r0: task do_compile: Succeeded
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 992 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 993 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: Running task 2912 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_install)
NOTE: Running task 2913 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_install)
NOTE: recipe python3-magic-0.4.22-r0: task do_install: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe diffoscope-169-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_install: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 995 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 996 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_247.3-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_247.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_install: Succeeded
NOTE: Running task 2918 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_package)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_install: Succeeded
NOTE: Running task 2919 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_package)
NOTE: recipe python3-magic-0.4.22-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package: Started
NOTE: recipe systemd-1_247.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe diffoscope-169-r0: task do_install: Succeeded
NOTE: Running task 2920 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_package)
NOTE: Running task 2921 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_populate_sysroot)
NOTE: recipe diffoscope-169-r0: task do_package: Started
NOTE: recipe diffoscope-169-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-1_247.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1001 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 1002 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_populate_sysroot_setscene)
NOTE: Running task 2930 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_package: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 2936 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package: Succeeded
NOTE: Running task 2937 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_packagedata)
NOTE: recipe diffoscope-169-r0: task do_populate_sysroot: Succeeded
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-src went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-dbg went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package libacl went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-ptest went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
NOTE: recipe python3-magic-0.4.22-r0: task do_packagedata: Started
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-staticdev went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-dev went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-doc went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-de went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-en+boldquot went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-en+quot went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-es went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-fr went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-gl went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-pl went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
NOTE: recipe python3-libarchive-c-2.9-r0: task do_packagedata: Started
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-sv went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running setscene task 1004 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 2938 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2939 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2964 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.22-r0: task do_packagedata: Succeeded
NOTE: Running task 2979 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_packagedata: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 81a8fc4714d5e3078725ea52621d5cb3338ee3fac13e562738f12dc54f636770
NOTE: Running task 3071 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-169-r0: task do_package: Succeeded
NOTE: Running task 3087 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 3088 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libarchive-3.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3089 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_configure)
NOTE: recipe diffoscope-169-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libarchive-3.5.1-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_package_write_rpm: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 0035619123a81c38302d981de40f05297df401876f3fad665b331ce08c59cb24
NOTE: Setscene tasks completed
NOTE: recipe diffoscope-169-r0: task do_packagedata: Succeeded
NOTE: Running task 3148 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3155 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_configure)
NOTE: recipe vim-8.2-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_compile: Succeeded
NOTE: Running task 3156 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_install)
NOTE: recipe lz4-1_1.9.3-r0: task do_install: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_install: Succeeded
NOTE: Running task 3157 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_package)
NOTE: Running task 3158 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_populate_sysroot)
NOTE: recipe lz4-1_1.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_package: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3159 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3160 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Succeeded
NOTE: Running task 3161 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_package: Succeeded
NOTE: Running task 3162 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_packagedata)
NOTE: recipe lz4-1_1.9.3-r0: task do_packagedata: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3163 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_package_write_rpm)
NOTE: recipe lz4-1_1.9.3-r0: task do_package_write_rpm: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Succeeded
NOTE: Running task 3164 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Succeeded
NOTE: Running task 3165 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Succeeded
NOTE: Running task 3166 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3167 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_configure: Succeeded
NOTE: Running task 3168 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_compile)
NOTE: recipe vim-8.2-r0: task do_compile: Started
NOTE: recipe vim-8.2-r0: task do_compile: Succeeded
NOTE: Running task 3169 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_install)
NOTE: recipe vim-8.2-r0: task do_install: Started
NOTE: recipe vim-8.2-r0: task do_install: Succeeded
NOTE: Running task 3170 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package)
NOTE: recipe vim-8.2-r0: task do_package: Started
NOTE: recipe libarchive-3.5.1-r0: task do_configure: Succeeded
NOTE: Running task 3171 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_compile)
NOTE: recipe libarchive-3.5.1-r0: task do_compile: Started
NOTE: recipe libarchive-3.5.1-r0: task do_compile: Succeeded
NOTE: Running task 3172 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_install)
NOTE: recipe libarchive-3.5.1-r0: task do_install: Started
NOTE: recipe libarchive-3.5.1-r0: task do_install: Succeeded
NOTE: Running task 3173 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_package)
NOTE: recipe libarchive-3.5.1-r0: task do_package: Started
NOTE: recipe vim-8.2-r0: task do_package: Succeeded
NOTE: Running task 3174 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_packagedata)
NOTE: recipe vim-8.2-r0: task do_packagedata: Started
NOTE: recipe vim-8.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3175 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package_write_rpm)
NOTE: Running task 3176 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_package_write_rpm)
NOTE: Running task 3177 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_package_qa)
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-169-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-169-r0: task do_package_qa: Started
NOTE: recipe libarchive-3.5.1-r0: task do_package: Succeeded
NOTE: Running task 3178 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_packagedata)
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata: Started
NOTE: recipe diffoscope-169-r0: task do_package_qa: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3179 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_package_write_rpm)
NOTE: Running task 3180 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_package_write_rpm)
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-169-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3181 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_build)
NOTE: Tasks Summary: Attempted 3181 tasks of which 3094 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 162 ERROR messages shown, returning a non-zero exit code.

--===============2713398356560908986==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-168-169.patch"

From 06c688a5ddd6c9c313befc4ae17fd7d313721d20 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Mar 2021 15:07:07 +0000
Subject: [PATCH] diffoscope: upgrade 168 -> 169

---
 .../diffoscope/{diffoscope_168.bb => diffoscope_169.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_168.bb => diffoscope_169.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_168.bb b/meta/recipes-support/diffoscope/diffoscope_169.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_168.bb
rename to meta/recipes-support/diffoscope/diffoscope_169.bb
index a7cfdf9ffb..5372547af5 100644
--- a/meta/recipes-support/diffoscope/diffoscope_168.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_169.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "c6f1dc3e75b7e2e5ceac4f857fbd2ee0ddb3f0169c2b39ea9187af34208e98de"
+SRC_URI[sha256sum] = "c24b7b6d90d9783403f23a63ac1b1a94bcf92f4dc8b26a82fba4151cd9f79c77"
 
 RDEPENDS_${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.17.1


--===============2713398356560908986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 58 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-382355db0b322e8aef7d64ee3d5bf198db6fa2f0"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:382355db0b322e8aef7d64ee3d5bf198db6fa2f0"
workspace            = "master:eec64066073428e38d5b0b6947ff302943188f65"

Initialising tasks...done.
Sstate summary: Wanted 96 Local 60 Network 0 Missed 36 Current 908 (62% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 910 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 911 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 912 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 913 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 916 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 921 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 931 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 932 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 934 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.25.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 935 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 939 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 956 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 966 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.25.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe pango-1.48.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gtk+3-3.24.25-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gtk+3-3.24.25-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_247.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 971 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 972 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_packagedata_setscene)
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 973 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe pango-1.48.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 974 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_247.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 975 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata_setscene)
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 976 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk+3-3.24.25-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk+3-3.24.25-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 979 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.25.bb:do_packagedata_setscene)
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk+3-3.24.25-r0: task do_packagedata_setscene: Started
NOTE: Running task 2015 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_fetch)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-src went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dbg went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-demo went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-staticdev went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dev went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2115 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_fetch)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-doc went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3 went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-af went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-am went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-an went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2186 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2187 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_fetch)
NOTE: Running task 2188 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_fetch)
NOTE: Running task 2190 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_fetch)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ang went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ar went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-as went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ast went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe lz4-1_1.9.3-r0: task do_fetch: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az-ir went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2293 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_fetch)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be+latin went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bg went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe lz4-1_1.9.3-r0: task do_fetch: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2335 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_unpack)
NOTE: Running task 2336 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_prepare_recipe_sysroot)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn-in went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-br went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe diffoscope-169-r0: task do_fetch: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bs went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe diffoscope-169-r0: task do_fetch: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca+valencia went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ckb went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2401 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_unpack)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-crh went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe python3-magic-0.4.22-r0: task do_fetch: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cs went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe python3-libarchive-c-2.9-r0: task do_fetch: Started
NOTE: Running task 2442 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_prepare_recipe_sysroot)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cy went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe vim-8.2-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-da went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe python3-magic-0.4.22-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_fetch: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-de went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2443 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_unpack)
NOTE: Running task 2457 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2458 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_unpack)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-dz went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-el went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en+shaw went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe libarchive-3.5.1-r0: task do_fetch: Started
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vim-8.2-r0: task do_fetch: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_unpack: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-ca went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe lz4-1_1.9.3-r0: task do_prepare_recipe_sysroot: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-gb went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2500 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_unpack)
NOTE: recipe libarchive-3.5.1-r0: task do_fetch: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eo went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2518 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_unpack)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-es went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-et went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2543 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_prepare_recipe_sysroot)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eu went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fa went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe diffoscope-169-r0: task do_unpack: Started
NOTE: Running task 2545 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_prepare_recipe_sysroot)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fi went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fr went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fur went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ga went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gd went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe diffoscope-169-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gl went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe python3-magic-0.4.22-r0: task do_unpack: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gu went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe python3-libarchive-c-2.9-r0: task do_unpack: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-he went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hi went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hr went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe diffoscope-169-r0: task do_unpack: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hu went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2678 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_patch)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hy went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe python3-magic-0.4.22-r0: task do_unpack: Succeeded
NOTE: recipe vim-8.2-r0: task do_unpack: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ia went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe libarchive-3.5.1-r0: task do_unpack: Started
NOTE: Running task 2707 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_patch)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_unpack: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-id went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2725 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_patch)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-io went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-is went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe python3-magic-0.4.22-r0: task do_prepare_recipe_sysroot: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-it went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ja went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ka went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe python3-libarchive-c-2.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_unpack: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kg went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2807 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_patch)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kk went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-km went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kn went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ko went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ku went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ky went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lg went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe diffoscope-169-r0: task do_patch: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-li went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe lz4-1_1.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lt went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lv went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mai went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe python3-libarchive-c-2.9-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_patch: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mi went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mk went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ml went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2874 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mn went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe lz4-1_1.9.3-r0: task do_patch: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mr went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ms went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-my went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nb went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe libarchive-3.5.1-r0: task do_unpack: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nds went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2875 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_patch)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ne went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nl went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe lz4-1_1.9.3-r0: task do_patch: Succeeded
NOTE: Running task 2876 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_deploy_source_date_epoch)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nn went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nso went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-oc went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-or went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pa went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pl went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ps went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt-br went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ro went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ru went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-rw went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-si went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sk went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sl went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe lz4-1_1.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.5.1-r0: task do_patch: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sq went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+ije went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+latin went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sv went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ta went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-te went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tg went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-th went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tk went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tr went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tt went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ug went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uk went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ur went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz+cyrillic went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-vi went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-wa went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-xh went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-yi went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-cn went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-hk went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-tw went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe lz4-1_1.9.3-r0: task do_deploy_source_date_epoch: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-am-et went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2881 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_configure)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cedilla went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cyrillic-translit went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2882 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-inuktitut went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ipa went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe libarchive-3.5.1-r0: task do_patch: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-multipress went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2883 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_deploy_source_date_epoch)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-thai went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-er went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe diffoscope-169-r0: task do_patch: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-et went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2884 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_deploy_source_date_epoch)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-viqr went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2885 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_populate_lic)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-wayland went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe diffoscope-169-r0: task do_prepare_recipe_sysroot: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-waylandgtk went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-xim went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-file went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-lpr went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe lz4-1_1.9.3-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2886 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.22-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2887 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk+3-3.24.25-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe diffoscope-169-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_configure: Succeeded
NOTE: Running setscene task 985 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.25.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe diffoscope-169-r0: task do_populate_lic: Started
NOTE: Running setscene task 986 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 987 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 2888 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_compile)
NOTE: recipe python3-magic-0.4.22-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk+3-3.24.25-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_compile: Started
NOTE: recipe pango-1.48.2-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.48.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-169-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2889 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_configure)
NOTE: recipe diffoscope-169-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_populate_lic unihash changed to 64eb19f6588bae1eef9dfbb14e3d442d96fb969c8b4a16b693d338061548f214
NOTE: recipe gtk+3-3.24.25-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vim-8.2-r0: task do_unpack: Succeeded
NOTE: Running task 2894 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch)
ERROR: pango-1.48.2-r0 do_packagedata_setscene: QA Issue: Package version for package pango-src went backwards which would break package feeds (from 0:1.48.3-r0 to 0:1.48.2-r0) [version-going-backwards]
NOTE: recipe python3-magic-0.4.22-r0: task do_deploy_source_date_epoch: Succeeded
ERROR: pango-1.48.2-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dbg went backwards which would break package feeds (from 0:1.48.3-r0 to 0:1.48.2-r0) [version-going-backwards]
NOTE: Running task 2895 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_configure)
ERROR: pango-1.48.2-r0 do_packagedata_setscene: QA Issue: Package version for package pango-ptest went backwards which would break package feeds (from 0:1.48.3-r0 to 0:1.48.2-r0) [version-going-backwards]
NOTE: recipe python3-libarchive-c-2.9-r0: task do_deploy_source_date_epoch: Succeeded
ERROR: pango-1.48.2-r0 do_packagedata_setscene: QA Issue: Package version for package pango-staticdev went backwards which would break package feeds (from 0:1.48.3-r0 to 0:1.48.2-r0) [version-going-backwards]
ERROR: pango-1.48.2-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dev went backwards which would break package feeds (from 0:1.48.3-r0 to 0:1.48.2-r0) [version-going-backwards]
NOTE: Running task 2896 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_configure)
ERROR: pango-1.48.2-r0 do_packagedata_setscene: QA Issue: Package version for package pango-doc went backwards which would break package feeds (from 0:1.48.3-r0 to 0:1.48.2-r0) [version-going-backwards]
ERROR: pango-1.48.2-r0 do_packagedata_setscene: QA Issue: Package version for package pango-locale went backwards which would break package feeds (from 0:1.48.3-r0 to 0:1.48.2-r0) [version-going-backwards]
ERROR: pango-1.48.2-r0 do_packagedata_setscene: QA Issue: Package version for package pango went backwards which would break package feeds (from 0:1.48.3-r0 to 0:1.48.2-r0) [version-going-backwards]
NOTE: recipe diffoscope-169-r0: task do_configure: Started
NOTE: recipe pango-1.48.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vim-8.2-r0: task do_patch: Started
NOTE: recipe pango-1.48.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 989 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 990 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe diffoscope-169-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.22-r0: task do_configure: Started
NOTE: Running task 2898 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_compile)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_configure: Succeeded
NOTE: Running task 2899 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_compile)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_configure: Succeeded
NOTE: Running task 2900 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_compile)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.48.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe diffoscope-169-r0: task do_compile: Started
NOTE: recipe pango-1.48.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-magic-0.4.22-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_compile: Started
NOTE: recipe vim-8.2-r0: task do_patch: Succeeded
NOTE: Running task 2905 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-169-r0: task do_compile: Succeeded
NOTE: Running task 2906 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_install)
NOTE: recipe python3-magic-0.4.22-r0: task do_compile: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_compile: Succeeded
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2907 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_install)
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2908 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_install)
NOTE: recipe diffoscope-169-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 992 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 993 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_install: Succeeded
NOTE: Running task 2914 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_package)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_install: Succeeded
NOTE: Running task 2915 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_package)
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-magic-0.4.22-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 995 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 996 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_247.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_247.3-r0: task do_packagedata_setscene: Started
NOTE: recipe diffoscope-169-r0: task do_install: Succeeded
NOTE: Running task 2920 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_package)
NOTE: Running task 2921 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_populate_sysroot)
NOTE: recipe diffoscope-169-r0: task do_package: Started
NOTE: recipe diffoscope-169-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-1_247.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-magic-0.4.22-r0: task do_package: Succeeded
NOTE: Running task 2922 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_packagedata)
NOTE: recipe diffoscope-169-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package: Succeeded
NOTE: Running task 2923 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.22-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_packagedata: Started
NOTE: recipe systemd-1_247.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1001 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 1002 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_populate_sysroot_setscene)
NOTE: Running task 2932 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-magic-0.4.22-r0: task do_packagedata: Succeeded
NOTE: Running task 2938 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_package_write_rpm)
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_package_write_rpm: Started
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-src went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-dbg went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package libacl went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-ptest went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-staticdev went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-dev went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-doc went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-de went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-en+boldquot went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-en+quot went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-es went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-fr went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-gl went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-pl went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-sv went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1004 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2939 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2940 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe diffoscope-169-r0: task do_package: Succeeded
NOTE: Running task 2941 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_packagedata)
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2966 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-169-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 66af55b123d9f9dcf0b8b6ec352551d2c5d1af62fbd17812dafc6110128e1f05
NOTE: Running task 3071 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-169-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 3088 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libarchive-3.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3089 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libarchive-3.5.1-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to df6a43dc8818d0947bc0f54fdff6095a9b2ee1e477bf529fb2ae6b3ac56371fe
NOTE: Setscene tasks completed
NOTE: Running task 3148 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3155 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_compile: Succeeded
NOTE: Running task 3156 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_install)
NOTE: recipe lz4-1_1.9.3-r0: task do_install: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_install: Succeeded
NOTE: Running task 3157 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_package)
NOTE: Running task 3158 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_populate_sysroot)
NOTE: recipe lz4-1_1.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_package: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3159 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3160 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Succeeded
NOTE: Running task 3161 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_package: Succeeded
NOTE: Running task 3162 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_packagedata)
NOTE: recipe lz4-1_1.9.3-r0: task do_packagedata: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3163 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_package_write_rpm)
NOTE: recipe lz4-1_1.9.3-r0: task do_package_write_rpm: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Succeeded
NOTE: Running task 3164 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Succeeded
NOTE: Running task 3165 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Succeeded
NOTE: Running task 3166 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3167 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_configure: Succeeded
NOTE: Running task 3168 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_compile)
NOTE: recipe vim-8.2-r0: task do_compile: Started
NOTE: recipe vim-8.2-r0: task do_compile: Succeeded
NOTE: Running task 3169 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_install)
NOTE: recipe vim-8.2-r0: task do_install: Started
NOTE: recipe vim-8.2-r0: task do_install: Succeeded
NOTE: Running task 3170 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package)
NOTE: recipe vim-8.2-r0: task do_package: Started
NOTE: recipe libarchive-3.5.1-r0: task do_configure: Succeeded
NOTE: Running task 3171 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_compile)
NOTE: recipe libarchive-3.5.1-r0: task do_compile: Started
NOTE: recipe libarchive-3.5.1-r0: task do_compile: Succeeded
NOTE: Running task 3172 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_install)
NOTE: recipe libarchive-3.5.1-r0: task do_install: Started
NOTE: recipe libarchive-3.5.1-r0: task do_install: Succeeded
NOTE: Running task 3173 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_package)
NOTE: recipe libarchive-3.5.1-r0: task do_package: Started
NOTE: recipe vim-8.2-r0: task do_package: Succeeded
NOTE: Running task 3174 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_packagedata)
NOTE: recipe vim-8.2-r0: task do_packagedata: Started
NOTE: recipe vim-8.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3175 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package_write_rpm)
NOTE: Running task 3176 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_package_write_rpm)
NOTE: Running task 3177 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_package_qa)
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-169-r0: task do_package_qa: Started
NOTE: recipe diffoscope-169-r0: task do_package_write_rpm: Started
NOTE: recipe libarchive-3.5.1-r0: task do_package: Succeeded
NOTE: Running task 3178 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_packagedata)
NOTE: recipe diffoscope-169-r0: task do_package_qa: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata: Started
NOTE: recipe diffoscope-169-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3179 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_package_write_rpm)
NOTE: Running task 3180 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_package_write_rpm)
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3181 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_build)
NOTE: Tasks Summary: Attempted 3181 tasks of which 3094 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 162 ERROR messages shown, returning a non-zero exit code.

--===============2713398356560908986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.9/site-packages/diffoscope-168-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/diffoscope-169-py3.9.egg-info

--===============2713398356560908986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 67 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-382355db0b322e8aef7d64ee3d5bf198db6fa2f0"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:382355db0b322e8aef7d64ee3d5bf198db6fa2f0"
workspace            = "master:eec64066073428e38d5b0b6947ff302943188f65"

Initialising tasks...done.
Sstate summary: Wanted 96 Local 60 Network 0 Missed 36 Current 908 (62% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 910 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 911 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 912 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 913 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 916 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 921 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 931 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 932 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 934 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.25.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 935 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 939 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 956 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 965 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.25.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe pango-1.48.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gtk+3-3.24.25-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_247.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gtk+3-3.24.25-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 970 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_packagedata_setscene)
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 971 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 972 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe pango-1.48.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 973 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_247.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 974 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 976 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk+3-3.24.25-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 979 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.25.bb:do_packagedata_setscene)
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.25-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk+3-3.24.25-r0: task do_packagedata_setscene: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-src went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dbg went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-demo went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-staticdev went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dev went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-doc went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3 went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-af went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-am went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-an went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ang went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ar went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-as went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ast went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2017 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_fetch)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az-ir went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be+latin went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bg went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn-in went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-br went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bs went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca+valencia went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ckb went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-crh went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cs went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2115 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_fetch)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cy went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-da went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-de went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-dz went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-el went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en+shaw went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-ca went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-gb went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2186 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_fetch)
NOTE: Running task 2187 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_fetch)
NOTE: Running task 2188 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_fetch)
NOTE: Running task 2189 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eo went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-es went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-et went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eu went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fa went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fi went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fr went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe lz4-1_1.9.3-r0: task do_fetch: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fur went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ga went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gd went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gl went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gu went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-he went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hi went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hr went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2293 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_fetch)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hu went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hy went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ia went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe lz4-1_1.9.3-r0: task do_fetch: Succeeded
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe diffoscope-169-r0: task do_fetch: Started
NOTE: Running task 2317 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_unpack)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-id went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2318 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_prepare_recipe_sysroot)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-io went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-is went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-it went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ja went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe diffoscope-169-r0: task do_fetch: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ka went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2335 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_unpack)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kg went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kk went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-km went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe python3-libarchive-c-2.9-r0: task do_fetch: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kn went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ko went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe python3-magic-0.4.22-r0: task do_fetch: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ku went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ky went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe python3-libarchive-c-2.9-r0: task do_fetch: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lg went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-li went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe vim-8.2-r0: task do_fetch: Started
NOTE: Running task 2396 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_unpack)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lt went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lv went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mai went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe python3-magic-0.4.22-r0: task do_fetch: Succeeded
NOTE: Running task 2415 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_unpack)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mi went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mk went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ml went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mn went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mr went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2447 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_prepare_recipe_sysroot)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ms went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe lz4-1_1.9.3-r0: task do_unpack: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-my went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nb went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nds went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2448 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: recipe vim-8.2-r0: task do_fetch: Succeeded
NOTE: Running task 2469 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_unpack)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ne went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nl went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nn went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nso went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-oc went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe libarchive-3.5.1-r0: task do_fetch: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_prepare_recipe_sysroot: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-or went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pa went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pl went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe libarchive-3.5.1-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-169-r0: task do_unpack: Started
NOTE: Running task 2501 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_unpack)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ps went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt-br went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ro went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ru went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-rw went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2543 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_prepare_recipe_sysroot)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-si went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe python3-libarchive-c-2.9-r0: task do_unpack: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sk went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sl went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2544 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_prepare_recipe_sysroot)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sq went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+ije went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+latin went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe python3-magic-0.4.22-r0: task do_unpack: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sv went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ta went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-te went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tg went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-th went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tk went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tr went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tt went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe diffoscope-169-r0: task do_prepare_recipe_sysroot: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ug went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe python3-magic-0.4.22-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_unpack: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uk went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe diffoscope-169-r0: task do_unpack: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ur went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2626 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_patch)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2627 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_patch)
NOTE: Running task 2634 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_patch)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz+cyrillic went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-vi went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-wa went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-xh went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-yi went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe vim-8.2-r0: task do_unpack: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-cn went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe libarchive-3.5.1-r0: task do_unpack: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-hk went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-tw went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-am-et went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cedilla went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cyrillic-translit went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-inuktitut went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ipa went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe python3-libarchive-c-2.9-r0: task do_prepare_recipe_sysroot: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-multipress went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe python3-magic-0.4.22-r0: task do_prepare_recipe_sysroot: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-thai went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-er went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-et went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-viqr went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-wayland went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-waylandgtk went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe lz4-1_1.9.3-r0: task do_unpack: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-xim went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-file went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2798 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_patch)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-lpr went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe python3-libarchive-c-2.9-r0: task do_patch: Started
NOTE: recipe diffoscope-169-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.25-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 983 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.25.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 984 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 985 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.2.bb:do_populate_sysroot_setscene)
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Succeeded
NOTE: Running task 2874 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe lz4-1_1.9.3-r0: task do_patch: Started
NOTE: recipe libarchive-3.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 2875 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_patch)
NOTE: recipe lz4-1_1.9.3-r0: task do_patch: Succeeded
NOTE: Running task 2876 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk+3-3.24.25-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pango-1.48.2-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.48.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.5.1-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk+3-3.24.25-r0: task do_deploy_source_date_epoch_setscene: Succeeded
ERROR: pango-1.48.2-r0 do_packagedata_setscene: QA Issue: Package version for package pango-src went backwards which would break package feeds (from 0:1.48.3-r0 to 0:1.48.2-r0) [version-going-backwards]
ERROR: pango-1.48.2-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dbg went backwards which would break package feeds (from 0:1.48.3-r0 to 0:1.48.2-r0) [version-going-backwards]
ERROR: pango-1.48.2-r0 do_packagedata_setscene: QA Issue: Package version for package pango-ptest went backwards which would break package feeds (from 0:1.48.3-r0 to 0:1.48.2-r0) [version-going-backwards]
ERROR: pango-1.48.2-r0 do_packagedata_setscene: QA Issue: Package version for package pango-staticdev went backwards which would break package feeds (from 0:1.48.3-r0 to 0:1.48.2-r0) [version-going-backwards]
ERROR: pango-1.48.2-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dev went backwards which would break package feeds (from 0:1.48.3-r0 to 0:1.48.2-r0) [version-going-backwards]
ERROR: pango-1.48.2-r0 do_packagedata_setscene: QA Issue: Package version for package pango-doc went backwards which would break package feeds (from 0:1.48.3-r0 to 0:1.48.2-r0) [version-going-backwards]
ERROR: pango-1.48.2-r0 do_packagedata_setscene: QA Issue: Package version for package pango-locale went backwards which would break package feeds (from 0:1.48.3-r0 to 0:1.48.2-r0) [version-going-backwards]
ERROR: pango-1.48.2-r0 do_packagedata_setscene: QA Issue: Package version for package pango went backwards which would break package feeds (from 0:1.48.3-r0 to 0:1.48.2-r0) [version-going-backwards]
NOTE: recipe lz4-1_1.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2885 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_configure)
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Succeeded
NOTE: Running task 2886 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.5.1-r0: task do_patch: Succeeded
NOTE: recipe pango-1.48.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2887 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.48.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 988 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 989 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 990 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe diffoscope-169-r0: task do_patch: Succeeded
NOTE: Running task 2889 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_deploy_source_date_epoch)
NOTE: Running task 2890 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_populate_lic)
NOTE: recipe diffoscope-169-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.22-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2891 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_patch: Succeeded
NOTE: Running task 2892 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pango-1.48.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_packagedata_setscene: Started
NOTE: recipe diffoscope-169-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_configure: Succeeded
NOTE: recipe diffoscope-169-r0: task do_populate_lic: Started
NOTE: Running task 2893 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_compile)
NOTE: recipe python3-magic-0.4.22-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.48.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-169-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2898 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_configure)
NOTE: recipe vim-8.2-r0: task do_unpack: Succeeded
NOTE: Running task 2899 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch)
NOTE: recipe diffoscope-169-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_populate_lic unihash changed to 64eb19f6588bae1eef9dfbb14e3d442d96fb969c8b4a16b693d338061548f214
NOTE: recipe python3-magic-0.4.22-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2900 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_configure)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2901 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_configure)
NOTE: recipe diffoscope-169-r0: task do_configure: Started
NOTE: recipe vim-8.2-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_configure: Started
NOTE: recipe diffoscope-169-r0: task do_configure: Succeeded
NOTE: Running task 2902 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_compile)
NOTE: recipe python3-magic-0.4.22-r0: task do_configure: Succeeded
NOTE: Running task 2903 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_compile)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_configure: Succeeded
NOTE: Running task 2904 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_compile)
NOTE: recipe diffoscope-169-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_compile: Started
NOTE: recipe vim-8.2-r0: task do_patch: Succeeded
NOTE: Running task 2905 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.22-r0: task do_compile: Succeeded
NOTE: Running task 2906 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_install)
NOTE: recipe diffoscope-169-r0: task do_compile: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_compile: Succeeded
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 992 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 993 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: Running task 2912 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_install)
NOTE: Running task 2913 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_install)
NOTE: recipe python3-magic-0.4.22-r0: task do_install: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe diffoscope-169-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_install: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 995 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 996 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_247.3-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_247.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_install: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_install: Succeeded
NOTE: Running task 2918 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_package)
NOTE: Running task 2919 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_package)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_package: Started
NOTE: recipe systemd-1_247.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe diffoscope-169-r0: task do_install: Succeeded
NOTE: Running task 2920 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_package)
NOTE: Running task 2921 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_populate_sysroot)
NOTE: recipe diffoscope-169-r0: task do_package: Started
NOTE: recipe diffoscope-169-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-1_247.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1001 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 1002 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_populate_sysroot_setscene)
NOTE: Running task 2930 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package: Succeeded
NOTE: Running task 2936 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_packagedata)
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-src went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-dbg went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package libacl went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
NOTE: recipe python3-magic-0.4.22-r0: task do_package: Succeeded
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-ptest went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-staticdev went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-dev went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
NOTE: Running task 2937 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_packagedata)
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-doc went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-de went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-en+boldquot went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-en+quot went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-es went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-fr went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-gl went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
NOTE: recipe diffoscope-169-r0: task do_populate_sysroot: Succeeded
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-pl went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-sv went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
NOTE: recipe python3-libarchive-c-2.9-r0: task do_packagedata: Started
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1004 of 1004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-magic-0.4.22-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2938 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2939 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2964 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_packagedata: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_packagedata: Succeeded
NOTE: Running task 2979 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 3cd33b3b118bcd2d611f0ef1df7e5da16aaba995e145f3e72f84ba5240ca287f
NOTE: recipe python3-magic-0.4.22-r0: task do_package_write_rpm: Started
NOTE: Running task 3070 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 3087 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libarchive-3.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3088 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libarchive-3.5.1-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-169-r0: task do_package: Succeeded
NOTE: Running task 3089 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_packagedata)
NOTE: recipe diffoscope-169-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e214d8e722684895ce7d2e4e2646ce6ff189091d0349f92be4eca70546780a46
NOTE: Setscene tasks completed
NOTE: Running task 3148 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe diffoscope-169-r0: task do_packagedata: Succeeded
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3155 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_configure)
NOTE: recipe vim-8.2-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_compile: Succeeded
NOTE: Running task 3156 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_install)
NOTE: recipe lz4-1_1.9.3-r0: task do_install: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_install: Succeeded
NOTE: Running task 3157 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_package)
NOTE: Running task 3158 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_populate_sysroot)
NOTE: recipe lz4-1_1.9.3-r0: task do_package: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3159 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3160 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Succeeded
NOTE: Running task 3161 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_package: Succeeded
NOTE: Running task 3162 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_packagedata)
NOTE: recipe lz4-1_1.9.3-r0: task do_packagedata: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3163 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_package_write_rpm)
NOTE: recipe lz4-1_1.9.3-r0: task do_package_write_rpm: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Succeeded
NOTE: Running task 3164 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Started
NOTE: recipe vim-8.2-r0: task do_configure: Succeeded
NOTE: Running task 3165 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_compile)
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Succeeded
NOTE: Running task 3166 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe vim-8.2-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Succeeded
NOTE: Running task 3167 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3168 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_compile: Succeeded
NOTE: Running task 3169 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_install)
NOTE: recipe vim-8.2-r0: task do_install: Started
NOTE: recipe vim-8.2-r0: task do_install: Succeeded
NOTE: Running task 3170 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package)
NOTE: recipe vim-8.2-r0: task do_package: Started
NOTE: recipe libarchive-3.5.1-r0: task do_configure: Succeeded
NOTE: Running task 3171 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_compile)
NOTE: recipe libarchive-3.5.1-r0: task do_compile: Started
NOTE: recipe libarchive-3.5.1-r0: task do_compile: Succeeded
NOTE: Running task 3172 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_install)
NOTE: recipe libarchive-3.5.1-r0: task do_install: Started
NOTE: recipe libarchive-3.5.1-r0: task do_install: Succeeded
NOTE: Running task 3173 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_package)
NOTE: recipe libarchive-3.5.1-r0: task do_package: Started
NOTE: recipe vim-8.2-r0: task do_package: Succeeded
NOTE: Running task 3174 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_packagedata)
NOTE: recipe vim-8.2-r0: task do_packagedata: Started
NOTE: recipe vim-8.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3175 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package_write_rpm)
NOTE: Running task 3176 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_package_write_rpm)
NOTE: Running task 3177 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_package_qa)
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-169-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-169-r0: task do_package_qa: Started
NOTE: recipe diffoscope-169-r0: task do_package_qa: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_package: Succeeded
NOTE: Running task 3178 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_packagedata)
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata: Started
NOTE: recipe diffoscope-169-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3179 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_package_write_rpm)
NOTE: Running task 3180 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_package_write_rpm)
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3181 of 3181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_build)
NOTE: Tasks Summary: Attempted 3181 tasks of which 3094 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 162 ERROR messages shown, returning a non-zero exit code.

--===============2713398356560908986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1439 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (813 cached, 1 parsed). 1438 targets, 31 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-382355db0b322e8aef7d64ee3d5bf198db6fa2f0"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:382355db0b322e8aef7d64ee3d5bf198db6fa2f0"
workspace            = "master:eec64066073428e38d5b0b6947ff302943188f65"

Initialising tasks...done.
Sstate summary: Wanted 101 Local 65 Network 0 Missed 36 Current 907 (64% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 909 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 910 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 911 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 912 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 915 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 920 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 930 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 931 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 933 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.25.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 934 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 938 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 955 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 961 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 965 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.25.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 967 of 1008 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe pango-1.48.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gtk+3-3.24.25-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_247.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gtk+3-3.24.25-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 971 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 972 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-native-1.46.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.48.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 973 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 974 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_247.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 976 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata_setscene)
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 978 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.25-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 981 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.25.bb:do_packagedata_setscene)
NOTE: Running setscene task 982 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe gtk+3-3.24.25-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.25-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-native-1.46.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 983 of 1008 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 2030 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_fetch)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-src went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dbg went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-demo went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-staticdev went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dev went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-doc went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3 went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-af went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-am went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2128 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_fetch)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-an went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ang went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ar went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-as went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ast went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az-ir went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2199 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_fetch)
NOTE: recipe e2fsprogs-native-1.46.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 2200 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_fetch)
NOTE: Running task 2201 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2203 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_fetch)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be+latin went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bg went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn-in went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe lz4-1_1.9.3-r0: task do_fetch: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-br went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bs went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca+valencia went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ckb went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-crh went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cs went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2305 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_fetch)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cy went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-da went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-de went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-dz went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe diffoscope-169-r0: task do_fetch: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-el went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en+shaw went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-ca went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe diffoscope-169-r0: task do_fetch: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-gb went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eo went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2382 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_unpack)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-es went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe e2fsprogs-native-1.46.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vim-8.2-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-et went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe python3-libarchive-c-2.9-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_fetch: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eu went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fa went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fi went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe python3-libarchive-c-2.9-r0: task do_fetch: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fr went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe lz4-1_1.9.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-magic-0.4.22-r0: task do_fetch: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fur went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ga went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2453 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_prepare_recipe_sysroot)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gd went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe vim-8.2-r0: task do_fetch: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gl went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gu went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-he went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2454 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_unpack)
NOTE: Running task 2455 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2456 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_unpack)
NOTE: Running task 2457 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_unpack)
NOTE: Running task 2458 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2459 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_unpack)
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hi went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hr went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hu went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hy went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe libarchive-3.5.1-r0: task do_fetch: Started
NOTE: recipe libarchive-3.5.1-r0: task do_fetch: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ia went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-id went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-io went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-is went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2533 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_unpack)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-it went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ja went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe diffoscope-169-r0: task do_unpack: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ka went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kg went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2556 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_prepare_recipe_sysroot)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kk went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-km went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2558 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_prepare_recipe_sysroot)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kn went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ko went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ku went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ky went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe lz4-1_1.9.3-r0: task do_prepare_recipe_sysroot: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lg went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-li went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe diffoscope-169-r0: task do_unpack: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lt went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lv went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2638 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_patch)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mai went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mi went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe lz4-1_1.9.3-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Started
NOTE: recipe diffoscope-169-r0: task do_prepare_recipe_sysroot: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mk went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ml went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mn went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe python3-libarchive-c-2.9-r0: task do_unpack: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mr went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ms went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-my went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe python3-libarchive-c-2.9-r0: task do_prepare_recipe_sysroot: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nb went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe vim-8.2-r0: task do_unpack: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nds went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe python3-magic-0.4.22-r0: task do_unpack: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ne went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nl went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nn went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe libarchive-3.5.1-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_unpack: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nso went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-oc went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 2784 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_patch)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-or went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pa went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pl went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ps went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt-br went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe python3-magic-0.4.22-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.22-r0: task do_prepare_recipe_sysroot: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ro went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe diffoscope-169-r0: task do_patch: Started
NOTE: Running task 2869 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_patch)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ru went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-rw went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-si went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sk went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sl went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sq went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+ije went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+latin went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sv went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ta went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-te went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tg went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-th went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe python3-libarchive-c-2.9-r0: task do_patch: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tk went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tr went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tt went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ug went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uk went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ur went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe python3-magic-0.4.22-r0: task do_patch: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz+cyrillic went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-vi went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-wa went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-xh went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-yi went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-cn went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-hk went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-tw went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe lz4-1_1.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-am-et went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cedilla went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cyrillic-translit went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-inuktitut went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ipa went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-multipress went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-thai went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-er went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-et went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-viqr went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-wayland went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-waylandgtk went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-xim went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-file went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-lpr went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe libarchive-3.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 2890 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_patch)
NOTE: recipe gtk+3-3.24.25-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 987 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.25.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 988 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 989 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.2.bb:do_populate_sysroot_setscene)
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Succeeded
NOTE: Running task 2891 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe libarchive-3.5.1-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.25-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pango-1.48.2-r0: task do_packagedata_setscene: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.48.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2892 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_patch)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_patch: Succeeded
NOTE: Running task 2893 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe diffoscope-169-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.25-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 2899 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-169-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2904 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_populate_lic)
ERROR: pango-1.48.2-r0 do_packagedata_setscene: QA Issue: Package version for package pango-src went backwards which would break package feeds (from 0:1.48.3-r0 to 0:1.48.2-r0) [version-going-backwards]
ERROR: pango-1.48.2-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dbg went backwards which would break package feeds (from 0:1.48.3-r0 to 0:1.48.2-r0) [version-going-backwards]
ERROR: pango-1.48.2-r0 do_packagedata_setscene: QA Issue: Package version for package pango-ptest went backwards which would break package feeds (from 0:1.48.3-r0 to 0:1.48.2-r0) [version-going-backwards]
NOTE: recipe lz4-1_1.9.3-r0: task do_patch: Started
ERROR: pango-1.48.2-r0 do_packagedata_setscene: QA Issue: Package version for package pango-staticdev went backwards which would break package feeds (from 0:1.48.3-r0 to 0:1.48.2-r0) [version-going-backwards]
NOTE: recipe python3-magic-0.4.22-r0: task do_patch: Succeeded
ERROR: pango-1.48.2-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dev went backwards which would break package feeds (from 0:1.48.3-r0 to 0:1.48.2-r0) [version-going-backwards]
NOTE: Running task 2905 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_deploy_source_date_epoch)
ERROR: pango-1.48.2-r0 do_packagedata_setscene: QA Issue: Package version for package pango-doc went backwards which would break package feeds (from 0:1.48.3-r0 to 0:1.48.2-r0) [version-going-backwards]
NOTE: recipe python3-magic-0.4.22-r0: task do_prepare_recipe_sysroot: Succeeded
ERROR: pango-1.48.2-r0 do_packagedata_setscene: QA Issue: Package version for package pango-locale went backwards which would break package feeds (from 0:1.48.3-r0 to 0:1.48.2-r0) [version-going-backwards]
ERROR: pango-1.48.2-r0 do_packagedata_setscene: QA Issue: Package version for package pango went backwards which would break package feeds (from 0:1.48.3-r0 to 0:1.48.2-r0) [version-going-backwards]
NOTE: recipe libarchive-3.5.1-r0: task do_patch: Succeeded
NOTE: Running task 2906 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe lz4-1_1.9.3-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2907 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-169-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.48.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe diffoscope-169-r0: task do_populate_lic: Started
NOTE: Running setscene task 992 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_packagedata_setscene)
NOTE: recipe pango-1.48.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 993 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 994 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-magic-0.4.22-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2909 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe lz4-1_1.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2910 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_configure)
NOTE: recipe pango-1.48.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe diffoscope-169-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-169-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_populate_lic unihash changed to 64eb19f6588bae1eef9dfbb14e3d442d96fb969c8b4a16b693d338061548f214
NOTE: Running task 2911 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_configure)
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2912 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_configure)
NOTE: recipe pango-1.48.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2917 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_configure)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-169-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.22-r0: task do_configure: Started
NOTE: Running task 2918 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_compile)
NOTE: recipe lz4-1_1.9.3-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vim-8.2-r0: task do_unpack: Succeeded
NOTE: Running task 2919 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch)
NOTE: recipe diffoscope-169-r0: task do_configure: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_configure: Succeeded
NOTE: Running task 2920 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_compile)
NOTE: recipe python3-magic-0.4.22-r0: task do_configure: Succeeded
NOTE: Running task 2921 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_compile)
NOTE: Running task 2922 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_compile)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_compile: Started
NOTE: recipe vim-8.2-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_compile: Started
NOTE: recipe diffoscope-169-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_compile: Succeeded
NOTE: Running task 2923 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_install)
NOTE: recipe python3-magic-0.4.22-r0: task do_compile: Succeeded
NOTE: recipe diffoscope-169-r0: task do_compile: Succeeded
NOTE: recipe vim-8.2-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 996 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 997 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: Running task 2929 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_install)
NOTE: Running task 2930 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2931 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_install)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_install: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-169-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_install: Started
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 999 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1000 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_247.3-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_247.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_install: Succeeded
NOTE: Running task 2936 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_package)
NOTE: recipe python3-magic-0.4.22-r0: task do_install: Succeeded
NOTE: Running task 2937 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_package)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_package: Started
NOTE: recipe systemd-1_247.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe diffoscope-169-r0: task do_install: Succeeded
NOTE: Running task 2938 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_package)
NOTE: Running task 2939 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_populate_sysroot)
NOTE: recipe diffoscope-169-r0: task do_package: Started
NOTE: recipe diffoscope-169-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-1_247.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1005 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 1006 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_populate_sysroot_setscene)
NOTE: Running task 2948 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe diffoscope-169-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.22-r0: task do_package: Succeeded
NOTE: Running task 2954 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package: Succeeded
NOTE: Running task 2955 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_packagedata)
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-src went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-dbg went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package libacl went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-ptest went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-staticdev went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-dev went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-doc went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-de went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-en+boldquot went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-en+quot went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-es went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-fr went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-gl went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
NOTE: recipe python3-magic-0.4.22-r0: task do_packagedata: Started
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-pl went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
ERROR: acl-2.2.53-r0 do_packagedata_setscene: QA Issue: Package version for package acl-locale-sv went backwards which would break package feeds (from 0:2.3.0-r0 to 0:2.2.53-r0) [version-going-backwards]
NOTE: recipe python3-libarchive-c-2.9-r0: task do_packagedata: Started
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1008 of 1008 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2956 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2957 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2982 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.22-r0: task do_packagedata: Succeeded
NOTE: Running task 2997 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.22.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_packagedata: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to e8780c5889ba218f01b6e7f1a683b93d66d11d7ae1a19eb56e4c075f0c14297a
NOTE: Running task 3088 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 3105 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libarchive-3.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3106 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe diffoscope-169-r0: task do_package: Succeeded
NOTE: Running task 3107 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_packagedata)
NOTE: recipe libarchive-3.5.1-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.22-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-169-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to dccf08ffa08447c2c6f24a0c783d4967a30a6c9e85ab4a1f5c27fef61560210e
NOTE: Setscene tasks completed
NOTE: Running task 3166 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe diffoscope-169-r0: task do_packagedata: Succeeded
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3173 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_configure)
NOTE: recipe vim-8.2-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe lz4-1_1.9.3-r0: task do_compile: Succeeded
NOTE: Running task 3174 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_install)
NOTE: recipe lz4-1_1.9.3-r0: task do_install: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_install: Succeeded
NOTE: Running task 3175 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_package)
NOTE: Running task 3176 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_populate_sysroot)
NOTE: recipe lz4-1_1.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_package: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3177 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3178 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Succeeded
NOTE: Running task 3179 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_package: Succeeded
NOTE: Running task 3180 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_packagedata)
NOTE: recipe lz4-1_1.9.3-r0: task do_packagedata: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3181 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.3.bb:do_package_write_rpm)
NOTE: recipe lz4-1_1.9.3-r0: task do_package_write_rpm: Started
NOTE: recipe lz4-1_1.9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Succeeded
NOTE: Running task 3182 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Succeeded
NOTE: Running task 3183 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Started
NOTE: recipe vim-8.2-r0: task do_configure: Succeeded
NOTE: Running task 3184 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_compile)
NOTE: recipe vim-8.2-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Succeeded
NOTE: Running task 3185 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3186 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_compile: Succeeded
NOTE: Running task 3187 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_install)
NOTE: recipe vim-8.2-r0: task do_install: Started
NOTE: recipe vim-8.2-r0: task do_install: Succeeded
NOTE: Running task 3188 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package)
NOTE: recipe vim-8.2-r0: task do_package: Started
NOTE: recipe libarchive-3.5.1-r0: task do_configure: Succeeded
NOTE: Running task 3189 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_compile)
NOTE: recipe libarchive-3.5.1-r0: task do_compile: Started
NOTE: recipe libarchive-3.5.1-r0: task do_compile: Succeeded
NOTE: Running task 3190 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_install)
NOTE: recipe libarchive-3.5.1-r0: task do_install: Started
NOTE: recipe libarchive-3.5.1-r0: task do_install: Succeeded
NOTE: Running task 3191 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_package)
NOTE: recipe libarchive-3.5.1-r0: task do_package: Started
NOTE: recipe vim-8.2-r0: task do_package: Succeeded
NOTE: Running task 3192 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_packagedata)
NOTE: recipe vim-8.2-r0: task do_packagedata: Started
NOTE: recipe vim-8.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3193 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package_write_rpm)
NOTE: Running task 3194 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_package_write_rpm)
NOTE: Running task 3195 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_package_qa)
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-169-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-169-r0: task do_package_qa: Started
NOTE: recipe libarchive-3.5.1-r0: task do_package: Succeeded
NOTE: Running task 3196 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_packagedata)
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata: Started
NOTE: recipe diffoscope-169-r0: task do_package_qa: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3197 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_package_write_rpm)
NOTE: Running task 3198 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_package_write_rpm)
NOTE: recipe diffoscope-169-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3199 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_169.bb:do_build)
NOTE: Tasks Summary: Attempted 3199 tasks of which 3112 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 162 ERROR messages shown, returning a non-zero exit code.

--===============2713398356560908986==--
