Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.23888.1608473714923542002
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 06:15:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id CA20938C14D2
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 14:15:15 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libcap-ng-python: upgrading to 0.8.2 FAILED
Message-ID: <MADEUP.16527253169CF83D.27420@lists.openembedded.org>
X-Groupsio-MsgNum: 145993
Content-Type: multipart/mixed; boundary="===============2085164508874577188=="

--===============2085164508874577188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libcap-ng-python* to *0.8.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libcap-ng-python-upgrade-0.8.1-0.8.2.patch
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

--===============2085164508874577188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1416 entries from dependency cache.
Parsing recipes...done.
Parsing of 807 .bb files complete (805 cached, 2 parsed). 1416 targets, 31 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-54b2397d8726aeea305f18dc43da5e8f3d1ca350"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:54b2397d8726aeea305f18dc43da5e8f3d1ca350"
workspace            = "master-next:afec39415be67b6985f0a0c3de041b4f302ffff3"

Initialising tasks...done.
Sstate summary: Wanted 438 Found 82 Missed 356 Current 223 (18% match, 46% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 235 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 244 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 257 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 262 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 265 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_246.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 268 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 273 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 276 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 286 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 292 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 299 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 305 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 307 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 314 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 321 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 326 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 330 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 334 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 340 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 345 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 349 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.32.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 354 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 358 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 365 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 369 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 375 of 661 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 378 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 381 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 408 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 412 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 417 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 421 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 431 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 438 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 452 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 456 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 460 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 470 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 471 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 482 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 490 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 497 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 498 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 502 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 539 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 541 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 544 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 546 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe init-system-helpers-1.58-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kbd-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kbd-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 548 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-conf-246.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-conf-246.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe iproute2-5.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 549 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe iproute2-5.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe socat-1.7.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 551 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 552 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 556 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe btrfs-tools-5.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 559 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe btrfs-tools-5.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 563 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 567 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 573 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe m4-1.4.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe findutils-4.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 576 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_populate_sysroot_setscene)
NOTE: recipe findutils-4.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe grep-3.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe elfutils-0.182-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iptables-1.8.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-locale-2.32-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-2.35-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bison-3.7.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 609 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 610 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 620 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.32.bb:do_stash_locale_setscene)
NOTE: recipe e2fsprogs-1.45.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-locale-2.32-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-2.35-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 641 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 642 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe diffutils-3.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe iptables-1.8.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 643 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bison-3.7.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 644 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 645 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 646 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 647 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 158 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_fetch)
NOTE: Running setscene task 648 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glibc-2.32-r0: task do_stash_locale_setscene: Started
NOTE: Running setscene task 649 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe iptables-1.8.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bison-3.7.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running noexec task 265 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_fetch)
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running noexec task 267 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_fetch)
NOTE: Running task 270 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_fetch)
NOTE: recipe linux-libc-headers-5.8-r0: task do_fetch: Started
NOTE: Running task 276 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_fetch)
NOTE: Running task 281 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_fetch)
NOTE: Running setscene task 650 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 651 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 298 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.17.bb:do_fetch)
NOTE: Running task 322 of 2117 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_fetch)
NOTE: Running task 324 of 2117 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_fetch)
NOTE: Running task 334 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_fetch)
NOTE: Running task 335 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 338 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_fetch)
NOTE: Running task 339 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_fetch)
NOTE: Running task 340 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_fetch)
NOTE: Running task 341 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_fetch)
NOTE: Running task 342 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_fetch)
NOTE: Running task 343 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_fetch)
NOTE: Running task 344 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_fetch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 652 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 653 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 654 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 413 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_fetch)
NOTE: Running task 414 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_fetch)
NOTE: Running task 415 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_fetch)
NOTE: Running task 416 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_fetch)
NOTE: Running task 417 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: Running task 418 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_fetch)
NOTE: Running task 419 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_fetch)
NOTE: Running task 458 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_fetch)
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 536 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_fetch)
NOTE: Running task 537 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_fetch)
NOTE: Running task 547 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_fetch)
NOTE: Running task 550 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_write_config)
NOTE: Running task 551 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_write_config)
NOTE: Running task 553 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_fetch)
NOTE: Running task 554 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_fetch)
NOTE: Running task 555 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_fetch)
NOTE: Running task 556 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_fetch)
NOTE: Running task 558 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_fetch)
NOTE: Running task 562 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_fetch)
NOTE: recipe iptables-1.8.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.182-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bison-3.7.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 564 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_unpack)
NOTE: Running task 565 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_fetch: Started
NOTE: recipe flex-2.6.4-r0: task do_fetch: Started
NOTE: Running task 570 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_fetch)
NOTE: Running task 575 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_fetch)
NOTE: recipe elfutils-0.182-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perl-5.32.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe cracklib-2.9.5-r0: task do_fetch: Started
NOTE: Running task 578 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_fetch)
NOTE: Running task 585 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_fetch)
NOTE: recipe cracklib-2.9.5-r0: task do_fetch: Succeeded
NOTE: Running task 587 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_fetch)
NOTE: recipe libpam-1.3.1-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Succeeded
NOTE: recipe libcap-ng-0.8.1-r0: task do_fetch: Started
WARNING: libcap-ng-0.8.1-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/libcap-ng-0.8.1.tar.gz
Cleaning and trying again.
WARNING: libcap-ng-0.8.1-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/libcap-ng-0.8.1.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/libcap-ng-0.8.1.tar.gz_bad-checksum_f06b17aaca029e245c9a26c698c6cc8a1cf42b58483d93e94ee02b478bdc1055
NOTE: recipe gdbm-1.18.1-r0: task do_fetch: Started
NOTE: recipe openssl-1.1.1i-r0: task do_fetch: Started
NOTE: recipe zlib-1.2.11-r0: task do_fetch: Succeeded
NOTE: Running setscene task 655 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flex-2.6.4-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcrypt-4.4.17-r0: task do_fetch: Started
NOTE: recipe libxcrypt-4.4.17-r0: task do_fetch: Succeeded
NOTE: recipe libcap-ng-native-0.8.1-r0: task do_fetch: Started
NOTE: recipe util-linux-native-2.36-r0: task do_fetch: Started
NOTE: recipe ncurses-6.2-r0: task do_fetch: Started
NOTE: Running setscene task 656 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_populate_sysroot_setscene)
NOTE: Running task 588 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_unpack)
NOTE: Running task 589 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_unpack)
NOTE: Running task 590 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_unpack)
NOTE: Running task 591 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_unpack)
NOTE: Running task 592 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_unpack)
NOTE: recipe openssl-1.1.1i-r0: task do_fetch: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_fetch: Started
NOTE: recipe libffi-3.3-r0: task do_fetch: Started
NOTE: recipe readline-8.1-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_fetch: Started
NOTE: recipe libpam-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_fetch: Succeeded
NOTE: Running task 593 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.17.bb:do_unpack)
NOTE: recipe util-linux-2.36-r0: task do_fetch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 594 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_unpack)
NOTE: recipe libtirpc-1.2.6-r0: task do_fetch: Succeeded
NOTE: Running task 595 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_unpack)
NOTE: recipe libffi-3.3-r0: task do_fetch: Succeeded
NOTE: recipe readline-8.1-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 657 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.2.5-r0: task do_fetch: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_fetch: Started
NOTE: recipe libxml2-2.9.10-r0: task do_fetch: Started
NOTE: recipe xorgproto-2020.1-r0: task do_fetch: Started
NOTE: recipe wayland-1.18.0-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_fetch: Started
NOTE: recipe xorgproto-2020.1-r0: task do_write_config: Started
NOTE: recipe util-linux-2.36-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_fetch: Succeeded
NOTE: Running task 596 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_unpack)
NOTE: recipe wayland-1.18.0-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_fetch: Started
NOTE: recipe util-linux-native-2.36-r0: task do_fetch: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 597 of 2117 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_unpack)
NOTE: Running task 598 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_unpack)
NOTE: recipe base-passwd-3.5.29-r0: task do_fetch: Succeeded
NOTE: Running task 599 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_unpack)
NOTE: Running task 600 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_unpack)
NOTE: Running task 601 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_unpack)
NOTE: Running task 602 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_unpack)
NOTE: Running task 603 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_fetch)
NOTE: Running task 604 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_fetch)
NOTE: recipe wayland-1.18.0-r0: task do_write_config: Started
NOTE: Running task 605 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_unpack)
NOTE: Running task 606 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_fetch)
NOTE: recipe xorgproto-2020.1-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r155: task do_fetch: Started
NOTE: recipe xz-5.2.5-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_write_config: Succeeded
NOTE: Running task 607 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_unpack)
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_write_config: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_fetch: Started
NOTE: recipe shadow-4.8.1-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_fetch: Started
NOTE: Running setscene task 658 of 661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcb-1.14-r0: task do_fetch: Started
NOTE: Running task 608 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: Running task 609 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_unpack)
NOTE: Running task 610 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_unpack)
NOTE: Running task 611 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_unpack)
NOTE: Running task 612 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_unpack)
NOTE: Running task 616 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_fetch)
NOTE: recipe libcap-2.45-r0: task do_fetch: Started
NOTE: recipe expat-2.2.10-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Started
NOTE: recipe libcap-2.45-r0: task do_fetch: Succeeded
WARNING: libcap-ng-0.8.1-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/libcap-ng-0.8.1.tar.gz
Cleaning and trying again.
WARNING: libcap-ng-0.8.1-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/libcap-ng-0.8.1.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/libcap-ng-0.8.1.tar.gz_bad-checksum_f06b17aaca029e245c9a26c698c6cc8a1cf42b58483d93e94ee02b478bdc1055
WARNING: libcap-ng-0.8.1-r0 do_fetch: Checksum failure encountered with download of http://people.redhat.com/sgrubb/libcap-ng/libcap-ng-0.8.1.tar.gz - will attempt other sources if available
NOTE: Running task 617 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_fetch)
NOTE: recipe expat-2.2.10-r0: task do_fetch: Succeeded
NOTE: Running task 618 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.31-r0: task do_fetch: Started
NOTE: recipe db-1_5.3.28-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_fetch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_fetch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_fetch: Started
NOTE: Running task 619 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_unpack)
NOTE: recipe perl-5.32.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_unpack: Started
NOTE: recipe flex-2.6.4-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_unpack: Started
NOTE: recipe cracklib-2.9.5-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Started
NOTE: recipe libxcrypt-4.4.17-r0: task do_unpack: Started
NOTE: Running task 620 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_unpack)
NOTE: Running task 621 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_unpack)
NOTE: Running task 622 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_unpack)
NOTE: Running task 623 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_unpack)
NOTE: recipe libxau-1_1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.3.1-r0: task do_unpack: Started
NOTE: Running task 624 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_patch)
WARNING: libcap-ng-0.8.1-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/libcap-ng-0.8.1.tar.gz
Cleaning and trying again.
WARNING: libcap-ng-0.8.1-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/libcap-ng-0.8.1.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/libcap-ng-0.8.1.tar.gz_bad-checksum_f06b17aaca029e245c9a26c698c6cc8a1cf42b58483d93e94ee02b478bdc1055
ERROR: libcap-ng-0.8.1-r0 do_fetch: Checksum failure fetching http://people.redhat.com/sgrubb/libcap-ng/libcap-ng-0.8.1.tar.gz
ERROR: libcap-ng-0.8.1-r0 do_fetch: Fetcher failure for URL: 'http://people.redhat.com/sgrubb/libcap-ng/libcap-ng-0.8.1.tar.gz'. Checksum mismatch!
File: '/home/pokybuild/yocto-worker/auh/build/build/build/downloads/libcap-ng-0.8.1.tar.gz' has sha256 checksum f06b17aaca029e245c9a26c698c6cc8a1cf42b58483d93e94ee02b478bdc1055 when 52c083b77c2b0d8449dee141f9c3eba76e6d4c5ad44ef05df25891126cb85ae9 was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[sha256sum] = "f06b17aaca029e245c9a26c698c6cc8a1cf42b58483d93e94ee02b478bdc1055"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libcap-ng/0.8.1-r0/temp/log.do_fetch.47973
NOTE: recipe libcap-ng-0.8.1-r0: task do_fetch: Failed
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_unpack: Started
NOTE: recipe libffi-3.3-r0: task do_unpack: Started
NOTE: Running task 625 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_unpack)
NOTE: Running task 626 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_unpack)
NOTE: Running task 627 of 2117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_fetch)
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_fetch) failed with exit code '1'
NOTE: recipe perl-5.32.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_unpack: Started
NOTE: recipe readline-8.1-r0: task do_unpack: Started
NOTE: recipe acl-2.2.53-r0: task do_fetch: Started
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_fetch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Started
NOTE: recipe acl-2.2.53-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_unpack: Started
NOTE: recipe wayland-1.18.0-r0: task do_unpack: Started
NOTE: recipe util-linux-native-2.36-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe libxml2-2.9.10-r0: task do_unpack: Started
NOTE: recipe kmod-27-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_fetch: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_fetch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_fetch: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_unpack: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r155: task do_unpack: Started
NOTE: recipe libxcb-1.14-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_fetch: Started
WARNING: libcap-ng-native-0.8.1-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/libcap-ng-0.8.1.tar.gz
Cleaning and trying again.
WARNING: libcap-ng-native-0.8.1-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/libcap-ng-0.8.1.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/libcap-ng-0.8.1.tar.gz_bad-checksum_f06b17aaca029e245c9a26c698c6cc8a1cf42b58483d93e94ee02b478bdc1055
WARNING: libcap-ng-native-0.8.1-r0 do_fetch: Checksum failure encountered with download of http://people.redhat.com/sgrubb/libcap-ng/libcap-ng-0.8.1.tar.gz - will attempt other sources if available
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_fetch: Succeeded
NOTE: recipe kmod-27-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_unpack: Started
WARNING: libcap-ng-native-0.8.1-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/libcap-ng-0.8.1.tar.gz
Cleaning and trying again.
WARNING: libcap-ng-native-0.8.1-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/libcap-ng-0.8.1.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/libcap-ng-0.8.1.tar.gz_bad-checksum_f06b17aaca029e245c9a26c698c6cc8a1cf42b58483d93e94ee02b478bdc1055
ERROR: libcap-ng-native-0.8.1-r0 do_fetch: Checksum failure fetching http://people.redhat.com/sgrubb/libcap-ng/libcap-ng-0.8.1.tar.gz
ERROR: libcap-ng-native-0.8.1-r0 do_fetch: Fetcher failure for URL: 'http://people.redhat.com/sgrubb/libcap-ng/libcap-ng-0.8.1.tar.gz'. Checksum mismatch!
File: '/home/pokybuild/yocto-worker/auh/build/build/build/downloads/libcap-ng-0.8.1.tar.gz' has sha256 checksum f06b17aaca029e245c9a26c698c6cc8a1cf42b58483d93e94ee02b478bdc1055 when 52c083b77c2b0d8449dee141f9c3eba76e6d4c5ad44ef05df25891126cb85ae9 was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[sha256sum] = "f06b17aaca029e245c9a26c698c6cc8a1cf42b58483d93e94ee02b478bdc1055"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/libcap-ng-native/0.8.1-r0/temp/log.do_fetch.47948
NOTE: recipe libcap-ng-native-0.8.1-r0: task do_fetch: Failed
NOTE: recipe expat-2.2.10-r0: task do_unpack: Succeeded
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_fetch) failed with exit code '1'
NOTE: recipe xcb-proto-1.14.1-r0: task do_unpack: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.32-r0: task do_stash_locale_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_unpack: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.3-r0: task do_unpack: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_unpack: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_fetch: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_fetch: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe readline-8.1-r0: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_unpack: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_unpack: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_unpack: Succeeded
NOTE: recipe libxcrypt-4.4.17-r0: task do_unpack: Succeeded
NOTE: recipe openssl-1.1.1i-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-native-2.36-r0: task do_unpack: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 628 tasks of which 547 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 2 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_fetch
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_fetch
Summary: There were 12 WARNING messages shown.
Summary: There were 4 ERROR messages shown, returning a non-zero exit code.

--===============2085164508874577188==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-libcap-ng-python-upgrade-0.8.1-0.8.2.patch"

From f461e2d6b8991127d40c5f7685c4435405e04301 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 20 Dec 2020 13:28:33 +0000
Subject: [PATCH] libcap-ng-python: upgrade 0.8.1 -> 0.8.2

---
 .../{libcap-ng-python_0.8.1.bb => libcap-ng-python_0.8.2.bb}    | 0
 meta/recipes-support/libcap-ng/libcap-ng.inc                    | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libcap-ng/{libcap-ng-python_0.8.1.bb => libcap-ng-python_0.8.2.bb} (100%)

diff --git a/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.1.bb b/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.2.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng-python_0.8.1.bb
rename to meta/recipes-support/libcap-ng/libcap-ng-python_0.8.2.bb
diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/recipes-support/libcap-ng/libcap-ng.inc
index a312b602ff..842f77dfa4 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng.inc
+++ b/meta/recipes-support/libcap-ng/libcap-ng.inc
@@ -11,6 +11,6 @@ SRC_URI = "http://people.redhat.com/sgrubb/libcap-ng/libcap-ng-${PV}.tar.gz \
            file://python.patch \
 "
 
-SRC_URI[sha256sum] = "f06b17aaca029e245c9a26c698c6cc8a1cf42b58483d93e94ee02b478bdc1055"
+SRC_URI[sha256sum] = "52c083b77c2b0d8449dee141f9c3eba76e6d4c5ad44ef05df25891126cb85ae9"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


--===============2085164508874577188==--
