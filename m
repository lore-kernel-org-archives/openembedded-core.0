Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.932.1608060223088820543
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 11:23:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id C321F38C0921
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Dec 2020 19:23:42 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dhcpcd: upgrading to 9.3.4 FAILED
Message-ID: <MADEUP.1650FA40D3616A08.29031@lists.openembedded.org>
X-Groupsio-MsgNum: 145659
Content-Type: multipart/mixed; boundary="===============7597053022573867117=="

--===============7597053022573867117==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dhcpcd* to *9.3.4* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-dhcpcd-upgrade-9.3.2-9.3.4.patch
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

--===============7597053022573867117==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/dhcpcd/dhcpcd-dbg: PKGSIZE changed from 1123144 to 1127672 (+0%)
packages/core2-32-poky-linux/dhcpcd/dhcpcd-dbg: PKGV changed from 9.3.2 [default] to 9.3.4 [default]
packages/core2-32-poky-linux/dhcpcd/dhcpcd-dbg: PV changed from "9.3.2" to "9.3.4"
packages/core2-32-poky-linux/dhcpcd/dhcpcd-dev: PKGV changed from 9.3.2 [default] to 9.3.4 [default]
packages/core2-32-poky-linux/dhcpcd/dhcpcd-dev: PV changed from "9.3.2" to "9.3.4"
packages/core2-32-poky-linux/dhcpcd/dhcpcd-doc: PKGSIZE changed from 62270 to 63147 (+1%)
packages/core2-32-poky-linux/dhcpcd/dhcpcd-doc: PKGV changed from 9.3.2 [default] to 9.3.4 [default]
packages/core2-32-poky-linux/dhcpcd/dhcpcd-doc: PV changed from "9.3.2" to "9.3.4"
packages/core2-32-poky-linux/dhcpcd/dhcpcd-locale: PKGV changed from 9.3.2 [default] to 9.3.4 [default]
packages/core2-32-poky-linux/dhcpcd/dhcpcd-locale: PV changed from "9.3.2" to "9.3.4"
packages/core2-32-poky-linux/dhcpcd/dhcpcd-src: PKGSIZE changed from 1075482 to 1079705 (+0%)
packages/core2-32-poky-linux/dhcpcd/dhcpcd-src: PKGV changed from 9.3.2 [default] to 9.3.4 [default]
packages/core2-32-poky-linux/dhcpcd/dhcpcd-src: PV changed from "9.3.2" to "9.3.4"
packages/core2-32-poky-linux/dhcpcd/dhcpcd-staticdev: PKGV changed from 9.3.2 [default] to 9.3.4 [default]
packages/core2-32-poky-linux/dhcpcd/dhcpcd-staticdev: PV changed from "9.3.2" to "9.3.4"
packages/core2-32-poky-linux/dhcpcd/dhcpcd: PKGSIZE changed from 466825 to 466957 (+0%)
packages/core2-32-poky-linux/dhcpcd/dhcpcd: PKGV changed from 9.3.2 [default] to 9.3.4 [default]
packages/core2-32-poky-linux/dhcpcd/dhcpcd: PV changed from "9.3.2" to "9.3.4"
packages/core2-32-poky-linux/dhcpcd: SRC_URI changed from "https://roy.marples.name/downloads/dhcpcd/dhcpcd-9.3.2.tar.xz file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch file://dhcpcd.service file://dhcpcd@.service" to "https://roy.marples.name/downloads/dhcpcd/dhcpcd-9.3.4.tar.xz file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch file://dhcpcd.service file://dhcpcd@.service"
packages/core2-32-poky-linux/dhcpcd: PKGV changed from 9.3.2 [default] to 9.3.4 [default]
packages/core2-32-poky-linux/dhcpcd: PV changed from "9.3.2" to "9.3.4"

--===============7597053022573867117==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 806 .bb files complete (0 cached, 806 parsed). 1410 targets, 66 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-796be0593a607938aef3941372a9238b7e895446"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:796be0593a607938aef3941372a9238b7e895446"
workspace            = "master:796be0593a607938aef3941372a9238b7e895446"

Initialising tasks...done.
Sstate summary: Wanted 437 Found 7 Missed 430 Current 222 (1% match, 34% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 273 of 659 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/os-release/os-release.bb:do_packagedata_setscene)
NOTE: Running setscene task 283 of 659 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 291 of 659 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/volatile-binds/volatile-binds.bb:do_packagedata_setscene)
NOTE: Running setscene task 293 of 659 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf-archive/autoconf-archive_2019.01.06.bb:do_packagedata_setscene)
NOTE: Running setscene task 388 of 659 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 431 of 659 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 526 of 659 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20200601.bb:do_packagedata_setscene)
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe volatile-binds-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe os-release-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2020d-r0: task do_packagedata_setscene: Started
NOTE: recipe autoconf-archive-2019.01.06-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.20-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20200601-r0: task do_packagedata_setscene: Started
NOTE: Running task 318 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_fetch)
NOTE: Running task 319 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_fetch)
NOTE: Running task 323 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_fetch)
NOTE: Running task 327 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_fetch)
NOTE: Running task 344 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.17.bb:do_fetch)
NOTE: Running task 380 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_fetch)
NOTE: Running task 381 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 384 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_fetch)
NOTE: Running task 385 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_fetch)
NOTE: Running task 386 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_fetch)
NOTE: Running task 387 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_fetch)
NOTE: Running task 388 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_fetch)
NOTE: Running task 389 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_fetch)
NOTE: Running task 390 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb:do_fetch)
NOTE: Running task 485 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_fetch)
NOTE: Running task 486 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_fetch)
NOTE: Running task 487 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_fetch)
NOTE: Running task 488 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_fetch)
NOTE: Running task 489 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: Running task 490 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_fetch)
NOTE: Running task 491 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_fetch)
NOTE: Running task 504 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_fetch)
NOTE: Running task 509 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.6-r0: task do_fetch: Started
NOTE: recipe wayland-protocols-1.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_fetch: Started
NOTE: Running task 532 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_fetch)
NOTE: recipe libxcrypt-4.4.17-r0: task do_fetch: Started
NOTE: recipe volatile-binds-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_fetch: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 537 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_unpack)
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Started
NOTE: recipe libxcrypt-4.4.17-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: Running task 538 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_unpack)
NOTE: Running task 539 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe os-release-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.1-r0: task do_fetch: Started
NOTE: recipe cracklib-2.9.5-r0: task do_fetch: Started
NOTE: Running task 540 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe flex-2.6.4-r0: task do_fetch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Succeeded
NOTE: recipe autoconf-archive-2019.01.06-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1h-r0: task do_fetch: Started
NOTE: recipe ncurses-6.2-r0: task do_fetch: Started
NOTE: Running task 541 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_unpack)
NOTE: recipe libpam-1.3.1-r0: task do_fetch: Started
NOTE: Running task 542 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_unpack)
NOTE: Running task 543 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-ng-0.8.1-r0: task do_fetch: Succeeded
NOTE: Running task 544 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.17.bb:do_unpack)
NOTE: Running task 545 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_unpack)
NOTE: Running task 546 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_fetch: Succeeded
NOTE: recipe openssl-1.1.1h-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_fetch: Started
NOTE: Running task 570 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe libffi-3.3-r0: task do_fetch: Started
NOTE: Running task 571 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_unpack)
NOTE: Running task 572 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb:do_unpack)
NOTE: recipe ncurses-6.2-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_fetch: Started
NOTE: Running task 590 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_unpack)
NOTE: recipe libpam-1.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 614 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_unpack)
NOTE: recipe gdbm-1.18.1-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.3-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_fetch: Started
NOTE: Running task 626 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_unpack)
NOTE: recipe libtirpc-1.2.6-r0: task do_fetch: Started
NOTE: Running task 627 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_unpack)
NOTE: Running task 628 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_unpack)
NOTE: Running task 629 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-cross-2.4.6-r0: task do_unpack: Started
NOTE: Running task 639 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_fetch)
NOTE: recipe xz-5.2.5-r0: task do_fetch: Started
NOTE: recipe readline-8.0-r0: task do_fetch: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_fetch: Started
NOTE: Running task 648 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_fetch)
NOTE: Running task 650 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_fetch)
NOTE: Running task 651 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_fetch)
NOTE: Running task 654 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_fetch)
NOTE: recipe sqlite3-3_3.33.0-r0: task do_fetch: Started
NOTE: recipe zlib-1.2.11-r0: task do_unpack: Started
NOTE: Running task 666 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_fetch)
NOTE: recipe libtirpc-1.2.6-r0: task do_fetch: Succeeded
NOTE: Running task 674 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_write_config)
NOTE: Running task 675 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_unpack)
NOTE: Running task 676 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_write_config)
NOTE: Running task 677 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_fetch)
NOTE: Running task 679 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_fetch)
NOTE: Running task 680 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_fetch)
NOTE: recipe util-linux-2.36-r0: task do_fetch: Succeeded
NOTE: Running task 681 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_fetch)
NOTE: recipe xz-5.2.5-r0: task do_fetch: Succeeded
NOTE: Running task 682 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_fetch)
NOTE: recipe readline-8.0-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_fetch: Succeeded
NOTE: Running task 683 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_fetch)
NOTE: Running task 685 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_fetch)
NOTE: Running task 686 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 689 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_fetch)
NOTE: Running task 691 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: recipe libnsl2-1.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 692 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_unpack)
NOTE: Running task 693 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_unpack)
NOTE: Running task 694 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_unpack)
NOTE: recipe attr-2.4.48-r0: task do_fetch: Started
NOTE: Running task 695 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: recipe libxml2-2.9.10-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_unpack: Started
NOTE: Running task 696 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_unpack)
NOTE: recipe ca-certificates-20200601-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.2.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-1.1.1h-r0: task do_unpack: Started
NOTE: recipe attr-2.4.48-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_unpack: Succeeded
NOTE: Running task 698 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_patch)
NOTE: recipe opkg-utils-0.4.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flex-2.6.4-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Started
NOTE: recipe ncurses-6.2-r0: task do_unpack: Started
NOTE: recipe libxcrypt-4.4.17-r0: task do_unpack: Started
NOTE: recipe libxml2-2.9.10-r0: task do_fetch: Succeeded
NOTE: Running task 699 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_unpack)
NOTE: recipe libpam-1.3.1-r0: task do_unpack: Started
NOTE: Running task 702 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_fetch)
NOTE: Running task 703 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_unpack)
NOTE: recipe libcap-ng-0.8.1-r0: task do_unpack: Started
NOTE: recipe cracklib-2.9.5-r0: task do_unpack: Started
NOTE: recipe libffi-3.3-r0: task do_unpack: Started
NOTE: recipe python3-3.9.0-r0: task do_fetch: Started
NOTE: recipe expat-2.2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe expat-2.2.10-r0: task do_unpack: Started
NOTE: recipe tzdata-2020d-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_fetch: Started
NOTE: Setscene tasks completed
NOTE: recipe libcap-ng-0.8.1-r0: task do_unpack: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_fetch: Started
NOTE: Running task 705 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_patch)
NOTE: Running task 714 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_fetch)
NOTE: recipe libtirpc-1.2.6-r0: task do_unpack: Started
NOTE: recipe xorgproto-2020.1-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: Running task 715 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe python3-3.9.0-r0: task do_fetch: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_unpack: Started
NOTE: recipe xz-5.2.5-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_patch: Started
NOTE: recipe readline-8.0-r0: task do_unpack: Started
NOTE: recipe attr-2.4.48-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_patch: Started
NOTE: recipe xorgproto-2020.1-r0: task do_fetch: Started
NOTE: recipe libpcre-8.44-r0: task do_fetch: Started
NOTE: recipe wayland-1.18.0-r0: task do_write_config: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_fetch: Started
NOTE: recipe util-linux-2.36-r0: task do_unpack: Started
NOTE: recipe libxml2-2.9.10-r0: task do_unpack: Started
NOTE: recipe wayland-1.18.0-r0: task do_fetch: Started
NOTE: Running task 716 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_unpack)
NOTE: recipe xcb-proto-1.14.1-r0: task do_fetch: Started
NOTE: Running task 717 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_unpack)
NOTE: recipe libxcb-1.14-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_fetch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_fetch: Started
NOTE: recipe shadow-4.8.1-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r155: task do_fetch: Started
NOTE: recipe libcap-2.45-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_fetch: Started
NOTE: recipe libxcb-1.14-r0: task do_fetch: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_fetch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 718 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_unpack)
NOTE: recipe libxau-1_1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.45-r0: task do_fetch: Succeeded
NOTE: Running task 719 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_unpack)
NOTE: Running task 720 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_unpack)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 721 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_unpack)
NOTE: Running task 723 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_fetch)
NOTE: Running task 726 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_fetch)
NOTE: Running task 727 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_unpack)
NOTE: recipe base-passwd-3.5.29-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_fetch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_fetch: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_unpack: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_fetch: Succeeded
NOTE: Running task 728 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_unpack)
NOTE: recipe xorgproto-2020.1-r0: task do_fetch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_fetch: Succeeded
NOTE: Running task 729 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_patch)
NOTE: recipe acl-2.2.53-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_write_config: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_write_config: Succeeded
NOTE: Running task 730 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_unpack)
NOTE: Running task 731 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_unpack)
NOTE: Running task 732 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_unpack)
NOTE: Running task 733 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 734 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_unpack)
NOTE: Running task 735 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_unpack)
NOTE: Running task 736 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_unpack)
NOTE: Running task 737 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 738 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_unpack)
NOTE: Running task 739 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: Running task 740 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.6-r0: task do_unpack: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_unpack: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_unpack: Succeeded
NOTE: Running task 741 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_patch)
NOTE: Running task 742 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_patch)
NOTE: Running task 743 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_patch)
NOTE: recipe xcb-proto-1.14.1-r0: task do_unpack: Started
NOTE: recipe libxcb-1.14-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_unpack: Started
NOTE: recipe kmod-27-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_unpack: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_unpack: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r155: task do_unpack: Started
NOTE: recipe xorgproto-2020.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cracklib-2.9.5-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_patch: Started
NOTE: recipe xorgproto-2020.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe libpcre-8.44-r0: task do_unpack: Started
NOTE: recipe acl-2.2.53-r0: task do_unpack: Started
NOTE: recipe wayland-1.18.0-r0: task do_unpack: Started
NOTE: recipe gdbm-1.18.1-r0: task do_patch: Started
NOTE: recipe shadow-4.8.1-r0: task do_unpack: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_fetch: Started
NOTE: recipe python3-3.9.0-r0: task do_unpack: Started
NOTE: recipe flex-2.6.4-r0: task do_patch: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_fetch: Succeeded
NOTE: Running task 744 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_unpack)
NOTE: recipe shadow-sysroot-4.6-r3: task do_unpack: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_unpack: Succeeded
NOTE: Running task 745 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_patch)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_fetch: Started
NOTE: recipe libffi-3.3-r0: task do_unpack: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_unpack: Succeeded
NOTE: Running task 746 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_patch)
NOTE: recipe kmod-27-r0: task do_fetch: Succeeded
NOTE: Running task 747 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_patch)
NOTE: Running task 748 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_patch)
NOTE: Running task 750 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r3: task do_patch: Started
NOTE: recipe attr-2.4.48-r0: task do_unpack: Succeeded
NOTE: recipe readline-8.0-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_unpack: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 751 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_patch)
NOTE: Running task 752 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_patch)
NOTE: Running task 753 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_patch)
NOTE: Running task 754 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_patch)
NOTE: Running task 755 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_patch)
NOTE: recipe libxcrypt-4.4.17-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 756 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.17.bb:do_patch)
NOTE: recipe base-passwd-3.5.29-r0: task do_patch: Started
NOTE: Running task 757 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_patch)
NOTE: Running task 758 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_patch)
NOTE: Running task 759 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe libffi-3.3-r0: task do_patch: Started
NOTE: Running task 761 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_fetch)
NOTE: recipe util-macros-1_1.19.2-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r155: task do_unpack: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_unpack: Succeeded
NOTE: Running task 762 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_patch)
NOTE: Running task 763 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_patch)
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe readline-8.0-r0: task do_patch: Started
NOTE: Running task 764 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_patch)
NOTE: recipe libtirpc-1.2.6-r0: task do_unpack: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Started
NOTE: recipe systemd-1_246.6-r0: task do_fetch: Started
NOTE: Running task 765 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_patch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r155: task do_patch: Started
NOTE: recipe zlib-1.2.11-r0: task do_patch: Started
NOTE: recipe attr-2.4.48-r0: task do_patch: Started
NOTE: recipe expat-2.2.10-r0: task do_patch: Started
NOTE: recipe libxcrypt-4.4.17-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_patch: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_patch: Succeeded
NOTE: Running task 766 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_deploy_source_date_epoch)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_fetch: Started
NOTE: Running task 767 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe libice-1_1.0.10-r0: task do_fetch: Started
NOTE: recipe systemd-1_246.6-r0: task do_fetch: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_unpack: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 768 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_fetch)
NOTE: recipe libice-1_1.0.10-r0: task do_fetch: Succeeded
NOTE: Running task 769 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_patch)
NOTE: recipe libtool-cross-2.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 770 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_patch)
NOTE: recipe libcap-ng-0.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 777 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_fetch)
NOTE: Running task 778 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_unpack)
NOTE: recipe util-macros-1_1.19.2-r0: task do_patch: Succeeded
NOTE: Running task 779 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_deploy_source_date_epoch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_fetch: Succeeded
NOTE: Running task 781 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 782 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_fetch)
NOTE: recipe libxau-1_1.0.9-r0: task do_patch: Succeeded
NOTE: Running task 783 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_fetch)
NOTE: recipe xcb-proto-1.14.1-r0: task do_patch: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_patch: Started
NOTE: recipe zlib-1.2.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcap-2.45-r0: task do_unpack: Started
NOTE: Running task 786 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_unpack)
NOTE: recipe acl-2.2.53-r0: task do_unpack: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_fetch: Started
NOTE: Running task 787 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_patch)
NOTE: recipe xz-5.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 788 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_patch)
NOTE: recipe gdbm-1.18.1-r0: task do_patch: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_patch: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_fetch: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 789 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 792 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe shadow-sysroot-4.6-r3: task do_patch: Succeeded
NOTE: Running task 793 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch)
NOTE: recipe xkeyboard-config-2.31-r0: task do_unpack: Started
NOTE: recipe acl-2.2.53-r0: task do_patch: Started
NOTE: recipe xorgproto-2020.1-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_unpack: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_patch: Started
NOTE: Running task 794 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_patch)
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 795 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_patch)
NOTE: recipe gdbm-1.18.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 796 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_patch)
NOTE: recipe db-1_5.3.28-r1: task do_fetch: Succeeded
NOTE: Running task 797 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_patch)
NOTE: recipe perl-5.32.0-r0: task do_fetch: Started
NOTE: Running task 800 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_unpack)
NOTE: Running task 801 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_fetch)
NOTE: Running task 802 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_unpack)
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe zlib-1.2.11-r0: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 803 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_patch: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_patch: Succeeded
NOTE: Running task 804 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 805 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_deploy_source_date_epoch)
NOTE: Running task 806 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Succeeded
NOTE: recipe libxcrypt-4.4.17-r0: task do_patch: Succeeded
NOTE: Running task 807 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.17.bb:do_deploy_source_date_epoch)
NOTE: Running task 808 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe opkg-utils-0.4.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_patch: Succeeded
NOTE: Running task 816 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 818 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_patch: Started
NOTE: Running task 819 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcb-1.14-r0: task do_patch: Started
NOTE: recipe wayland-1.18.0-r0: task do_patch: Started
NOTE: recipe libpcre-8.44-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_unpack: Started
NOTE: recipe kmod-27-r0: task do_unpack: Started
NOTE: recipe dbus-1.12.20-r0: task do_fetch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_patch: Started
NOTE: Running task 820 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_patch)
NOTE: Running task 821 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe flex-2.6.4-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_fetch: Started
NOTE: recipe cracklib-2.9.5-r0: task do_patch: Succeeded
NOTE: Running task 822 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch)
NOTE: recipe perl-5.32.0-r0: task do_fetch: Succeeded
NOTE: Running task 823 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 824 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe initscripts-1.0-r155: task do_patch: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-completion-2.11-r0: task do_patch: Succeeded
NOTE: Running task 825 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_unpack)
NOTE: Running task 826 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch)
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcrypt-4.4.17-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcap-2.45-r0: task do_unpack: Succeeded
NOTE: Running task 827 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre-8.44-r0: task do_patch: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe systemd-1_246.6-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.18.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_fetch: Succeeded
NOTE: Running task 839 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe opkg-utils-0.4.3-r0: task do_patch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_patch: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_patch: Succeeded
NOTE: Running task 840 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libice-1_1.0.10-r0: task do_unpack: Started
NOTE: Running task 841 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 842 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 843 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 844 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 847 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_unpack)
NOTE: recipe libpam-1.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 848 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_unpack)
NOTE: Running task 855 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libcap-2.45-r0: task do_patch: Started
NOTE: Running task 856 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_patch)
NOTE: recipe shadow-4.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 857 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_patch)
NOTE: recipe ncurses-6.2-r0: task do_unpack: Succeeded
NOTE: Running task 858 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_patch)
NOTE: recipe initscripts-1.0-r155: task do_prepare_recipe_sysroot: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch: Started
NOTE: Running task 860 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_unpack)
NOTE: Running task 863 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_unpack)
NOTE: recipe readline-8.0-r0: task do_patch: Succeeded
NOTE: Running task 864 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_unpack: Started
NOTE: recipe libpam-1.3.1-r0: task do_patch: Started
NOTE: recipe shadow-4.8.1-r0: task do_patch: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 871 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_unpack)
NOTE: recipe initscripts-1.0-r155: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 876 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_unpack)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_unpack: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_patch: Started
NOTE: Running task 878 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_patch)
NOTE: recipe libxcrypt-4.4.17-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 890 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_write_config)
NOTE: Running task 897 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_warn_musl)
NOTE: Running task 898 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_write_config)
NOTE: Running task 907 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_fetch)
NOTE: Running task 927 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_fetch)
NOTE: recipe db-1_5.3.28-r1: task do_unpack: Started
NOTE: recipe perl-5.32.0-r0: task do_unpack: Started
NOTE: recipe readline-8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe openssl-1.1.1h-r0: task do_unpack: Succeeded
NOTE: Running task 928 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb:do_patch)
NOTE: recipe sqlite3-3_3.33.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 929 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_write_config)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 930 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_patch)
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 931 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_configure)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_patch: Succeeded
NOTE: Running task 932 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_configure)
NOTE: recipe base-passwd-3.5.29-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.3-r0: task do_patch: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_patch: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_patch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 933 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 934 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_deploy_source_date_epoch)
NOTE: Running task 935 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 936 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch)
NOTE: Running task 937 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch)
NOTE: Running task 938 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running task 939 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_configure)
NOTE: Running task 940 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_fetch)
NOTE: Running task 941 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_fetch)
NOTE: recipe dbus-1.12.20-r0: task do_unpack: Started
NOTE: Running task 945 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_fetch)
NOTE: recipe libice-1_1.0.10-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_write_config: Started
NOTE: recipe expat-2.2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 946 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_fetch)
NOTE: recipe libsm-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe openssl-1.1.1h-r0: task do_patch: Started
NOTE: Running task 947 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_patch)
NOTE: recipe systemd-1_246.6-r0: task do_write_config: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_write_config: Started
NOTE: Running task 948 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_fetch)
NOTE: recipe zlib-1.2.11-r0: task do_configure: Started
NOTE: recipe systemd-1_246.6-r0: task do_warn_musl: Started
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_configure: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe systemd-1_246.6-r0: task do_warn_musl: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 949 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_fetch)
NOTE: recipe kmod-27-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe readline-8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 958 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_fetch)
NOTE: Running task 959 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_fetch)
NOTE: Running task 960 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_fetch)
NOTE: recipe bash-5.0-r0: task do_fetch: Started
NOTE: Running task 965 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_patch)
NOTE: Running task 969 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_fetch)
NOTE: recipe systemd-1_246.6-r0: task do_write_config: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_patch: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: Running task 970 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 971 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_fetch)
NOTE: Running task 972 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_fetch)
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 973 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_unpack)
NOTE: recipe initscripts-1.0-r155: task do_configure: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_write_config: Succeeded
NOTE: Running task 974 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-5.0-r0: task do_fetch: Succeeded
NOTE: Running task 975 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running task 976 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libsm-1_1.2.3-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r155: task do_configure: Succeeded
NOTE: Running task 977 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_compile)
NOTE: recipe kmod-27-r0: task do_patch: Started
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Started
NOTE: recipe libice-1_1.0.10-r0: task do_patch: Succeeded
NOTE: Running task 978 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-5.0-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_configure: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_fetch: Started
NOTE: Running task 979 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe initscripts-1.0-r155: task do_compile: Started
NOTE: recipe expat-2.2.10-r0: task do_patch: Succeeded
NOTE: recipe libcap-2.45-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.3.1-r0: task do_patch: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_fetch: Started
NOTE: recipe sed-4.8-r0: task do_fetch: Started
NOTE: recipe elfutils-0.182-r0: task do_fetch: Started
NOTE: recipe lzo-2.10-r0: task do_fetch: Started
NOTE: recipe gawk-5.1.0-r0: task do_fetch: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_fetch: Started
NOTE: recipe m4-1.4.18-r0: task do_fetch: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_fetch: Started
NOTE: recipe mdadm-4.1-r0: task do_fetch: Started
NOTE: recipe diffutils-3.7-r0: task do_fetch: Started
NOTE: Running task 980 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_generate_toolchain_file)
NOTE: Running task 981 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 982 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 983 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe initscripts-1.0-r155: task do_compile: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-2.36-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_compile: Started
NOTE: Running task 984 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_patch)
NOTE: recipe expat-2.2.10-r0: task do_generate_toolchain_file: Started
NOTE: recipe libpam-1.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_unpack: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_fetch: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_unpack: Succeeded
NOTE: Running task 985 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_patch)
NOTE: Running task 986 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_install)
NOTE: recipe expat-2.2.10-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_fetch: Succeeded
NOTE: Running task 987 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_deploy_source_date_epoch)
NOTE: recipe sed-4.8-r0: task do_fetch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_fetch: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 988 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_patch)
NOTE: Running task 989 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_unpack)
NOTE: Running task 990 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_unpack)
NOTE: recipe diffutils-3.7-r0: task do_fetch: Succeeded
NOTE: Running task 991 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_unpack)
NOTE: Running task 992 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_unpack)
NOTE: Running task 993 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_unpack)
NOTE: Running task 994 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_unpack)
NOTE: recipe ncurses-6.2-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_compile: Succeeded
NOTE: Running task 995 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_install)
NOTE: recipe elfutils-0.182-r0: task do_fetch: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_fetch: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_fetch: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_fetch: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 996 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_patch: Started
NOTE: recipe util-linux-2.36-r0: task do_patch: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 997 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_configure)
NOTE: recipe libtool-cross-2.4.6-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe openssl-1.1.1h-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 998 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe xkeyboard-config-2.31-r0: task do_patch: Succeeded
NOTE: Running task 999 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb:do_deploy_source_date_epoch)
NOTE: Running task 1000 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1001 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_deploy_source_date_epoch)
NOTE: recipe libcap-2.45-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_unpack: Started
NOTE: recipe dbus-1.12.20-r0: task do_patch: Started
NOTE: recipe lzo-2.10-r0: task do_unpack: Started
NOTE: recipe sed-4.8-r0: task do_unpack: Started
NOTE: Running task 1002 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe gawk-5.1.0-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_unpack: Started
NOTE: recipe diffutils-3.7-r0: task do_unpack: Started
NOTE: Running task 1003 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_unpack)
NOTE: recipe xorgproto-2020.1-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe kmod-27-r0: task do_patch: Succeeded
NOTE: Running task 1004 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1005 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1006 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_unpack)
NOTE: Running task 1009 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_unpack)
NOTE: Running task 1012 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_unpack)
NOTE: Running task 1013 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_unpack)
NOTE: Running task 1014 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_unpack)
NOTE: Running task 1015 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_fetch)
NOTE: Running task 1018 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1019 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_fetch)
NOTE: Running task 1020 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_fetch)
NOTE: Running task 1021 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_fetch)
NOTE: Running task 1022 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_fetch)
NOTE: Running task 1036 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/dhcpcd/dhcpcd_9.3.4.bb:do_fetch)
NOTE: Running task 1050 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_fetch)
NOTE: Running task 1052 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expat-2.2.10-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_unpack: Started
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_unpack: Succeeded
NOTE: recipe openssl-1.1.1h-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1053 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_patch)
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe coreutils-8.32-r0: task do_unpack: Started
NOTE: recipe elfutils-0.182-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r155: task do_install: Started
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_unpack: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Started
NOTE: recipe m4-1.4.18-r0: task do_unpack: Started
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mdadm-4.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_install: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_patch: Started
NOTE: recipe libxml2-2.9.10-r0: task do_unpack: Succeeded
NOTE: recipe lzo-2.10-r0: task do_unpack: Succeeded
NOTE: Running task 1054 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_patch)
NOTE: recipe bison-3.7.4-r0: task do_fetch: Started
NOTE: Running task 1055 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_patch)
NOTE: recipe libcap-2.45-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1056 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: recipe util-linux-2.36-r0: task do_patch: Succeeded
NOTE: Running task 1057 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_deploy_source_date_epoch)
NOTE: recipe libmnl-1.0.4-r0: task do_fetch: Started
NOTE: recipe make-4.3-r0: task do_fetch: Started
NOTE: recipe bison-3.7.4-r0: task do_fetch: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_fetch: Started
NOTE: recipe procps-3.3.16-r0: task do_fetch: Started
NOTE: recipe dhcpcd-9.3.4-r0: task do_fetch: Started
NOTE: recipe iptables-1.8.6-r0: task do_fetch: Started
NOTE: Running task 1058 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_unpack)
NOTE: recipe libmnl-1.0.4-r0: task do_fetch: Succeeded
NOTE: Running task 1059 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_unpack)
NOTE: recipe make-4.3-r0: task do_fetch: Succeeded
NOTE: Running task 1060 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_unpack)
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Succeeded
NOTE: Running task 1061 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_unpack)
NOTE: recipe lzo-2.10-r0: task do_patch: Started
NOTE: recipe bison-3.7.4-r0: task do_unpack: Started
NOTE: recipe libxml2-2.9.10-r0: task do_patch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Started
NOTE: recipe libmnl-1.0.4-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_fetch: Started
NOTE: recipe zlib-1.2.11-r0: task do_configure: Succeeded
NOTE: recipe dhcpcd-9.3.4-r0: task do_fetch: Succeeded
NOTE: Running task 1062 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_configure_ptest_base)
NOTE: Running task 1063 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/dhcpcd/dhcpcd_9.3.4.bb:do_unpack)
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iptables-1.8.6-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe openssl-1.1.1h-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1064 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_configure)
NOTE: recipe make-4.3-r0: task do_unpack: Started
NOTE: Running task 1065 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_unpack)
NOTE: Running task 1066 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.35.bb:do_fetch)
NOTE: Running task 1068 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: Running task 1069 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_fetch)
NOTE: Running task 1070 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_fetch)
NOTE: Running task 1071 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_fetch)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_fetch: Succeeded
NOTE: Running task 1072 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_fetch)
NOTE: recipe zlib-1.2.11-r0: task do_configure_ptest_base: Started
NOTE: recipe procps-3.3.16-r0: task do_fetch: Succeeded
NOTE: Running task 1073 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_fetch)
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Started
NOTE: recipe dhcpcd-9.3.4-r0: task do_unpack: Started
NOTE: Running task 1074 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_fetch)
NOTE: Running task 1075 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_configure)
NOTE: recipe zlib-1.2.11-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1076 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_compile)
NOTE: recipe libtool-cross-2.4.6-r0: task do_configure: Started
NOTE: recipe bash-5.0-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_unpack: Succeeded
NOTE: Running task 1077 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_patch)
NOTE: recipe iptables-1.8.6-r0: task do_unpack: Started
NOTE: recipe socat-1.7.3.4-r0: task do_fetch: Started
NOTE: recipe findutils-4.7.0-r0: task do_fetch: Started
NOTE: recipe binutils-2.35-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1078 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_patch)
NOTE: recipe util-linux-2.36-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1079 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_fetch)
NOTE: Running task 1080 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_fetch)
NOTE: recipe init-system-helpers-1.58-r0: task do_fetch: Started
NOTE: recipe findutils-4.7.0-r0: task do_fetch: Succeeded
NOTE: recipe socat-1.7.3.4-r0: task do_fetch: Succeeded
NOTE: recipe which-2.21-r3: task do_fetch: Started
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_install: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_patch: Started
NOTE: recipe zlib-1.2.11-r0: task do_compile: Started
NOTE: recipe bash-5.0-r0: task do_patch: Started
NOTE: Running task 1081 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot)
NOTE: Running task 1082 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package)
NOTE: Running task 1083 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_deploy_source_date_epoch)
NOTE: Running task 1084 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_fetch)
NOTE: Running task 1085 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_fetch)
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe binutils-2.35-r0: task do_fetch: Succeeded
NOTE: recipe init-system-helpers-1.58-r0: task do_fetch: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_unpack: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Succeeded
NOTE: recipe which-2.21-r3: task do_fetch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_fetch: Started
NOTE: recipe iproute2-5.9.0-r0: task do_fetch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_fetch: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_fetch: Started
NOTE: Running task 1086 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_patch)
NOTE: Running task 1087 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_patch)
NOTE: Running task 1089 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.3.0.bb:do_fetch)
NOTE: Running task 1090 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_fetch)
NOTE: Running task 1091 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_246.1.bb:do_fetch)
NOTE: recipe libmnl-1.0.4-r0: task do_unpack: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_fetch: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_fetch: Succeeded
NOTE: Running task 1098 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_unpack)
NOTE: Running task 1099 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_patch)
NOTE: recipe dbus-1.12.20-r0: task do_patch: Succeeded
NOTE: Running task 1125 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch)
NOTE: recipe iproute2-5.9.0-r0: task do_fetch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_fetch: Succeeded
NOTE: recipe btrfs-tools-5.9-r0: task do_fetch: Started
NOTE: recipe grep-3.6-r0: task do_fetch: Started
NOTE: Running task 1132 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.32.bb:do_deploy_source_date_epoch)
NOTE: Running task 1133 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.32.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1136 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: recipe dbus-test-1.12.20-r0: task do_unpack: Succeeded
NOTE: Running task 1137 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_patch)
NOTE: recipe grep-3.6-r0: task do_fetch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Started
NOTE: Running task 1139 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_unpack)
NOTE: recipe systemd-compat-units-1.0-r29: task do_fetch: Started
NOTE: recipe systemd-conf-246.1-r0: task do_fetch: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_fetch: Succeeded
NOTE: recipe btrfs-tools-5.9-r0: task do_fetch: Succeeded
NOTE: recipe kbd-2.3.0-r0: task do_fetch: Started
NOTE: recipe systemd-conf-246.1-r0: task do_fetch: Succeeded
NOTE: Running task 1140 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: Running task 1141 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.35.bb:do_unpack)
NOTE: recipe libmnl-1.0.4-r0: task do_patch: Started
NOTE: recipe procps-3.3.16-r0: task do_unpack: Started
NOTE: Running task 1143 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: recipe m4-1.4.18-r0: task do_patch: Started
NOTE: recipe make-4.3-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1144 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_patch)
NOTE: recipe glibc-locale-2.32-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: recipe glibc-locale-2.32-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1145 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_unpack)
NOTE: recipe kbd-2.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 1146 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_unpack)
NOTE: recipe dbus-test-1.12.20-r0: task do_patch: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_unpack: Started
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Started
NOTE: recipe mdadm-4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1147 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_patch)
NOTE: recipe binutils-2.35-r0: task do_unpack: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe make-4.3-r0: task do_patch: Started
NOTE: recipe findutils-4.7.0-r0: task do_unpack: Started
NOTE: Running task 1148 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_unpack)
NOTE: recipe init-system-helpers-1.58-r0: task do_unpack: Started
NOTE: recipe dhcpcd-9.3.4-r0: task do_unpack: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_unpack: Succeeded
NOTE: Running task 1149 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_patch)
NOTE: Running task 1150 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/dhcpcd/dhcpcd_9.3.4.bb:do_patch)
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_patch: Succeeded
NOTE: Running task 1151 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_unpack)
NOTE: Running task 1152 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gawk-5.1.0-r0: task do_unpack: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_patch: Started
NOTE: recipe lzo-2.10-r0: task do_patch: Succeeded
NOTE: Running task 1153 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_patch)
NOTE: Running task 1154 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe sed-4.8-r0: task do_unpack: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_unpack: Succeeded
NOTE: Running task 1155 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_patch)
NOTE: Running task 1156 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_patch)
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1157 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_unpack)
NOTE: recipe libx11-1_1.6.12-r0: task do_patch: Started
NOTE: recipe socat-1.7.3.4-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_unpack: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_patch: Succeeded
NOTE: Running task 1158 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1159 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_patch)
NOTE: recipe glibc-locale-2.32-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dhcpcd-9.3.4-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1160 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_unpack)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_unpack: Succeeded
NOTE: Running task 1161 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb:do_prepare_recipe_sysroot)
NOTE: recipe gawk-5.1.0-r0: task do_patch: Started
NOTE: Running task 1162 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_unpack)
NOTE: recipe which-2.21-r3: task do_unpack: Started
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bc-1.07.1-r0: task do_unpack: Started
NOTE: recipe diffutils-3.7-r0: task do_patch: Started
NOTE: recipe sed-4.8-r0: task do_patch: Started
NOTE: recipe libmnl-1.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iproute2-5.9.0-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_patch: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_unpack: Started
NOTE: recipe openssl-1.1.1h-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sed-4.8-r0: task do_patch: Succeeded
NOTE: recipe which-2.21-r3: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1163 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_unpack)
NOTE: Running task 1164 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1165 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe bison-3.7.4-r0: task do_unpack: Succeeded
NOTE: recipe iptables-1.8.6-r0: task do_unpack: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_unpack: Succeeded
NOTE: Running task 1166 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1167 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_patch)
NOTE: Running task 1168 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_patch)
NOTE: Running task 1169 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_unpack)
NOTE: recipe dhcpcd-9.3.4-r0: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1170 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_configure)
NOTE: Running task 1171 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_unpack)
NOTE: recipe glibc-locale-2.32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running noexec task 1172 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.32.bb:do_configure)
NOTE: Running noexec task 1173 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.32.bb:do_compile)
NOTE: Running task 1174 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.32.bb:do_install)
NOTE: recipe socat-1.7.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 1176 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.3.0.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe procps-3.3.16-r0: task do_unpack: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Succeeded
NOTE: recipe grep-3.6-r0: task do_unpack: Started
NOTE: Running task 1177 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_patch)
NOTE: Running task 1178 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_unpack)
NOTE: recipe initscripts-1.0-r155: task do_install: Succeeded
NOTE: Running task 1179 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot)
NOTE: recipe diffutils-3.7-r0: task do_patch: Succeeded
NOTE: Running task 1180 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package)
NOTE: recipe sed-4.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_patch: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iptables-1.8.6-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_configure: Started
NOTE: Running task 1181 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1182 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.0-r0: task do_unpack: Succeeded
NOTE: recipe bison-3.7.4-r0: task do_patch: Started
NOTE: Running task 1183 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_246.1.bb:do_unpack)
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1185 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_patch)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot: Started
NOTE: recipe procps-3.3.16-r0: task do_patch: Started
NOTE: recipe kbd-2.3.0-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r155: task do_package: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_unpack: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_unpack: Started
NOTE: recipe glibc-locale-2.32-r0: task do_install: Started
NOTE: recipe gawk-5.1.0-r0: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_configure: Succeeded
NOTE: Running task 1186 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_compile)
NOTE: Running task 1187 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe diffutils-3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe systemd-conf-246.1-r0: task do_unpack: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_unpack: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_compile: Started
NOTE: Running task 1188 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: Running task 1189 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_patch)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_patch: Started
NOTE: recipe gawk-5.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_unpack: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_unpack: Succeeded
NOTE: recipe systemd-conf-246.1-r0: task do_unpack: Succeeded
NOTE: Running task 1191 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: Running task 1192 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_patch)
NOTE: Running task 1193 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_patch)
NOTE: recipe m4-1.4.18-r0: task do_patch: Succeeded
NOTE: Running task 1194 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_deploy_source_date_epoch)
NOTE: recipe openssl-1.1.1h-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1195 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb:do_configure)
NOTE: recipe bison-3.7.4-r0: task do_patch: Succeeded
NOTE: recipe make-4.3-r0: task do_patch: Succeeded
NOTE: Running task 1196 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxml2-2.9.10-r0: task do_patch: Succeeded
NOTE: Running task 1197 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_deploy_source_date_epoch)
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1198 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_patch)
NOTE: Running task 1199 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_deploy_source_date_epoch)
NOTE: recipe init-system-helpers-1.58-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_patch: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_patch: Succeeded
NOTE: recipe sed-4.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1200 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_patch)
NOTE: Running task 1201 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_deploy_source_date_epoch)
NOTE: recipe zlib-1.2.11-r0: task do_compile: Succeeded
NOTE: Running task 1202 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_patch)
NOTE: Running task 1203 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_compile_ptest_base)
NOTE: recipe e2fsprogs-1.45.6-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r5: task do_patch: Started
NOTE: recipe socat-1.7.3.4-r0: task do_patch: Started
NOTE: recipe which-2.21-r3: task do_patch: Started
NOTE: recipe m4-1.4.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe systemd-1_246.6-r0: task do_unpack: Succeeded
NOTE: Running task 1204 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_patch)
NOTE: recipe openssl-1.1.1h-r0: task do_configure: Started
NOTE: recipe diffutils-3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1205 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_patch)
NOTE: Running task 1206 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_patch)
NOTE: recipe gmp-6.2.1-r0: task do_patch: Started
NOTE: recipe make-4.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bison-3.7.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_patch: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bc-1.07.1-r0: task do_patch: Started
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe zlib-1.2.11-r0: task do_compile_ptest_base: Started
NOTE: recipe gawk-5.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_compile: Succeeded
NOTE: Running task 1208 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_install)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot: Succeeded
NOTE: Running task 1209 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_patch)
NOTE: Running task 1210 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_246.1.bb:do_patch)
NOTE: recipe iproute2-5.9.0-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1211 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_install)
NOTE: recipe shadow-securetty-4.6-r3: task do_patch: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_patch: Started
NOTE: Running task 1212 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_patch)
NOTE: recipe systemd-1_246.6-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_patch: Succeeded
NOTE: Running task 1214 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/dhcpcd/dhcpcd_9.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe btrfs-tools-5.9-r0: task do_unpack: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_patch: Succeeded
NOTE: Running task 1216 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_patch)
NOTE: recipe systemd-compat-units-1.0-r29: task do_patch: Started
NOTE: recipe systemd-conf-246.1-r0: task do_patch: Started
NOTE: Running task 1221 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: recipe m4-1.4.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1235 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_deploy_source_date_epoch)
NOTE: Running task 1247 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_deploy_source_date_epoch)
NOTE: recipe findutils-4.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1248 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_patch)
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_install: Started
NOTE: recipe iproute2-5.9.0-r0: task do_patch: Started
NOTE: recipe coreutils-8.32-r0: task do_unpack: Succeeded
NOTE: recipe elfutils-0.182-r0: task do_unpack: Succeeded
NOTE: recipe make-4.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1249 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_patch)
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_install: Started
NOTE: Running task 1250 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_patch)
NOTE: recipe bison-3.7.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: Running task 1251 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: Running task 1254 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe socat-1.7.3.4-r0: task do_patch: Succeeded
NOTE: recipe btrfs-tools-5.9-r0: task do_patch: Started
NOTE: Running task 1255 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_prepare_recipe_sysroot)
NOTE: recipe procps-3.3.16-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1256 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1257 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe dhcpcd-9.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mdadm-4.1-r0: task do_patch: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1258 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1259 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: recipe shared-mime-info-2.0-r0: task do_patch: Succeeded
NOTE: recipe findutils-4.7.0-r0: task do_patch: Started
NOTE: Running task 1260 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe init-system-helpers-1.58-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_patch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_install: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_write_config: Started
NOTE: Running task 1261 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe systemd-serialgetty-1.0-r5: task do_patch: Succeeded
NOTE: Running task 1262 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_package)
NOTE: recipe socat-1.7.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_patch: Succeeded
NOTE: Running task 1263 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_deploy_source_date_epoch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: Running task 1264 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_deploy_source_date_epoch)
NOTE: recipe shadow-securetty-4.6-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.182-r0: task do_patch: Started
NOTE: recipe coreutils-8.32-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_write_config: Succeeded
NOTE: Running task 1265 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_prepare_recipe_sysroot)
NOTE: recipe mdadm-4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_configure: Succeeded
NOTE: Running task 1268 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_prepare_recipe_sysroot)
NOTE: recipe findutils-4.7.0-r0: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package: Started
NOTE: Running task 1269 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_compile)
NOTE: recipe iptables-1.8.6-r0: task do_patch: Succeeded
NOTE: Running task 1270 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1271 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_deploy_source_date_epoch)
NOTE: recipe init-system-helpers-1.58-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2020.1-r0: task do_compile: Started
NOTE: recipe findutils-4.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iptables-1.8.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_patch: Succeeded
NOTE: recipe systemd-conf-246.1-r0: task do_patch: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1272 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_deploy_source_date_epoch)
NOTE: Running task 1273 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_246.1.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_patch: Succeeded
NOTE: recipe which-2.21-r3: task do_patch: Succeeded
NOTE: Running task 1274 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_246.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe iproute2-5.9.0-r0: task do_patch: Succeeded
NOTE: Running task 1275 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1276 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_deploy_source_date_epoch)
NOTE: Running task 1277 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe systemd-compat-units-1.0-r29: task do_deploy_source_date_epoch: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dhcpcd-9.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe systemd-conf-246.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1297 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-conf-246.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe procps-3.3.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1329 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/dhcpcd/dhcpcd_9.3.4.bb:do_populate_lic)
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe iproute2-5.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe perl-5.32.0-r0: task do_unpack: Succeeded
NOTE: recipe socat-1.7.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe init-system-helpers-1.58-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iptables-1.8.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1330 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_patch)
NOTE: Running task 1331 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_configure)
NOTE: recipe bc-1.07.1-r0: task do_patch: Succeeded
NOTE: recipe dhcpcd-9.3.4-r0: task do_populate_lic: Started
NOTE: Running task 1332 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_deploy_source_date_epoch)
NOTE: recipe grep-3.6-r0: task do_unpack: Succeeded
NOTE: Running task 1333 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_patch)
NOTE: recipe xorgproto-2020.1-r0: task do_compile: Succeeded
NOTE: Running task 1334 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_install)
NOTE: recipe kbd-2.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 1335 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.3.0.bb:do_patch)
NOTE: recipe findutils-4.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1336 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe shadow-securetty-4.6-r3: task do_configure: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1337 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1338 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_configure)
NOTE: recipe perl-5.32.0-r0: task do_patch: Started
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe grep-3.6-r0: task do_patch: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe systemd-conf-246.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1339 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_configure)
NOTE: recipe systemd-1_246.6-r0: task do_patch: Succeeded
NOTE: Running task 1340 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_deploy_source_date_epoch)
NOTE: recipe init-system-helpers-1.58-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running noexec task 1341 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_configure)
NOTE: Running noexec task 1342 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_compile)
NOTE: Running task 1343 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_install)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kbd-2.3.0-r0: task do_patch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_configure: Succeeded
NOTE: recipe iproute2-5.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dhcpcd-9.3.4-r0: task do_populate_lic: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1344 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_compile)
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xorgproto-2020.1-r0: task do_install: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/dhcpcd/dhcpcd_9.3.4.bb:do_populate_lic unihash changed to 269f4f97aa49df68f17a569596e2fb7cb40ff3a01c9c7c2b40301d94c0406017
NOTE: recipe grep-3.6-r0: task do_patch: Succeeded
NOTE: Running task 1345 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_deploy_source_date_epoch)
NOTE: recipe kbd-2.3.0-r0: task do_patch: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_configure: Started
NOTE: Running task 1346 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe zlib-1.2.11-r0: task do_install: Succeeded
NOTE: Running task 1347 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_install_ptest_base)
NOTE: recipe db-1_5.3.28-r1: task do_unpack: Succeeded
NOTE: recipe systemd-conf-246.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1348 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_patch)
NOTE: Running task 1349 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_246.1.bb:do_configure)
NOTE: recipe e2fsprogs-1.45.6-r0: task do_patch: Succeeded
NOTE: Running task 1350 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_deploy_source_date_epoch)
NOTE: recipe systemd-compat-units-1.0-r29: task do_configure: Started
NOTE: recipe python3-3.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 1351 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_patch)
NOTE: recipe init-system-helpers-1.58-r0: task do_install: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_compile: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_configure: Succeeded
NOTE: Running task 1352 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_compile)
NOTE: recipe btrfs-tools-5.9-r0: task do_patch: Succeeded
NOTE: Running task 1353 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_deploy_source_date_epoch)
NOTE: recipe grep-3.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kbd-2.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_compile: Succeeded
NOTE: Running task 1354 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_install)
NOTE: recipe systemd-compat-units-1.0-r29: task do_configure: Succeeded
NOTE: Running task 1355 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_compile)
NOTE: recipe systemd-conf-246.1-r0: task do_configure: Started
NOTE: recipe db-1_5.3.28-r1: task do_patch: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe zlib-1.2.11-r0: task do_install_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_patch: Succeeded
NOTE: Running task 1356 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_deploy_source_date_epoch)
NOTE: recipe systemd-1_246.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_compile: Started
NOTE: recipe systemd-conf-246.1-r0: task do_configure: Succeeded
NOTE: Running task 1357 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_246.1.bb:do_compile)
NOTE: recipe systemd-serialgetty-1.0-r5: task do_compile: Succeeded
NOTE: Running task 1358 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_install)
NOTE: recipe btrfs-tools-5.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_compile: Started
NOTE: recipe bash-5.0-r0: task do_patch: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1359 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe init-system-helpers-1.58-r0: task do_install: Succeeded
NOTE: Running task 1360 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package)
NOTE: recipe grep-3.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_install: Started
NOTE: Running task 1361 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1362 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_package)
NOTE: recipe systemd-compat-units-1.0-r29: task do_compile: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_patch: Started
NOTE: Running task 1363 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_install)
NOTE: recipe coreutils-8.32-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kbd-2.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe systemd-conf-246.1-r0: task do_compile: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_install: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_package: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe systemd-1_246.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe systemd-conf-246.1-r0: task do_compile: Succeeded
NOTE: Running task 1364 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_246.1.bb:do_install)
NOTE: recipe bash-5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_install: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_install: Started
NOTE: Running task 1365 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package)
NOTE: recipe btrfs-tools-5.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_install: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package: Started
NOTE: Running task 1366 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package)
NOTE: recipe systemd-conf-246.1-r0: task do_install: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package: Started
NOTE: recipe bash-5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_install: Succeeded
NOTE: Running task 1367 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1368 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: recipe systemd-conf-246.1-r0: task do_install: Succeeded
NOTE: Running task 1369 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_246.1.bb:do_package)
NOTE: recipe db-1_5.3.28-r1: task do_patch: Succeeded
NOTE: recipe elfutils-0.182-r0: task do_patch: Succeeded
NOTE: Running task 1370 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_deploy_source_date_epoch)
NOTE: Running task 1371 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_deploy_source_date_epoch)
NOTE: recipe perl-5.32.0-r0: task do_patch: Succeeded
NOTE: Running task 1372 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_deploy_source_date_epoch)
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: recipe systemd-conf-246.1-r0: task do_package: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: Running task 1373 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Succeeded
NOTE: Running task 1374 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch)
NOTE: recipe elfutils-0.182-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe db-1_5.3.28-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe perl-5.32.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1375 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe perl-5.32.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: recipe unzip-1_6.0-r5: task do_patch: Succeeded
NOTE: Running task 1376 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe elfutils-0.182-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: Running task 1377 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe expat-2.2.10-r0: task do_configure: Succeeded
NOTE: Running task 1378 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_configure_ptest_base)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe expat-2.2.10-r0: task do_configure_ptest_base: Started
NOTE: recipe expat-2.2.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1379 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_compile)
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1380 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_configure)
NOTE: recipe xorgproto-2020.1-r0: task do_install: Succeeded
NOTE: Running task 1381 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot)
NOTE: Running task 1382 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package)
NOTE: recipe expat-2.2.10-r0: task do_compile: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_configure: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package: Started
NOTE: recipe unzip-1_6.0-r5: task do_configure: Succeeded
NOTE: Running task 1383 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_compile)
NOTE: recipe python3-3.9.0-r0: task do_patch: Succeeded
NOTE: Running task 1384 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe unzip-1_6.0-r5: task do_compile: Started
NOTE: recipe openssl-1.1.1h-r0: task do_configure: Succeeded
NOTE: Running task 1385 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb:do_configure_ptest_base)
NOTE: recipe openssl-1.1.1h-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-3.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe openssl-1.1.1h-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_package: Succeeded
NOTE: Running task 1386 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb:do_compile)
NOTE: Running task 1387 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata)
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata: Started
NOTE: recipe openssl-1.1.1h-r0: task do_compile: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1388 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package: Succeeded
NOTE: Running task 1389 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata)
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package: Succeeded
NOTE: Running task 1390 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_packagedata)
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package: Succeeded
NOTE: Running task 1391 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Running task 1392 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe shadow-securetty-4.6-r3: task do_package: Succeeded
NOTE: Running task 1393 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata)
NOTE: recipe init-system-helpers-1.58-r0: task do_package: Succeeded
NOTE: Running task 1394 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_packagedata)
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package: Succeeded
NOTE: Running task 1395 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata)
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata: Started
NOTE: recipe systemd-conf-246.1-r0: task do_package: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_package: Succeeded
NOTE: Running task 1396 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata)
NOTE: Running task 1397 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_246.1.bb:do_packagedata)
NOTE: recipe initscripts-1.0-r155: task do_packagedata: Started
NOTE: recipe systemd-conf-246.1-r0: task do_packagedata: Started
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1398 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm)
NOTE: recipe zlib-1.2.11-r0: task do_package: Succeeded
NOTE: Running task 1399 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata)
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata: Succeeded
NOTE: Running task 1400 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_package_write_rpm)
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata: Succeeded
NOTE: Running task 1401 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm)
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata: Succeeded
NOTE: Running task 1402 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_package_write_rpm)
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm: Started
NOTE: recipe binutils-2.35-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: Running task 1403 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.35.bb:do_patch)
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata: Succeeded
NOTE: Running task 1404 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm)
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm: Started
NOTE: recipe systemd-conf-246.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1405 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_246.1.bb:do_package_write_rpm)
NOTE: recipe binutils-2.35-r0: task do_patch: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata: Succeeded
NOTE: Running task 1406 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm)
NOTE: recipe systemd-conf-246.1-r0: task do_package_write_rpm: Started
NOTE: recipe expat-2.2.10-r0: task do_compile: Succeeded
NOTE: Running task 1407 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_compile_ptest_base)
NOTE: recipe glibc-locale-2.32-r0: task do_install: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm: Started
NOTE: Running task 1408 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.32.bb:do_package)
NOTE: recipe zlib-1.2.11-r0: task do_packagedata: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_compile_ptest_base: Started
NOTE: recipe glibc-locale-2.32-r0: task do_package: Started
NOTE: recipe expat-2.2.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1409 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_install)
NOTE: recipe expat-2.2.10-r0: task do_install: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm: Succeeded
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_install: Succeeded
NOTE: Running task 1410 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_install_ptest_base)
NOTE: recipe systemd-conf-246.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_install_ptest_base: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1411 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_populate_sysroot)
NOTE: Running task 1412 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package)
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot: Started
NOTE: recipe expat-2.2.10-r0: task do_package: Started
NOTE: recipe binutils-2.35-r0: task do_patch: Succeeded
NOTE: Running task 1413 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.35.bb:do_deploy_source_date_epoch)
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe binutils-2.35-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe binutils-2.35-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe openssl-1.1.1h-r0: task do_compile: Succeeded
NOTE: Running task 1414 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb:do_compile_ptest_base)
NOTE: recipe openssl-1.1.1h-r0: task do_compile_ptest_base: Started
NOTE: recipe openssl-1.1.1h-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1415 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb:do_install)
NOTE: recipe expat-2.2.10-r0: task do_package: Succeeded
NOTE: Running task 1416 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata)
NOTE: recipe openssl-1.1.1h-r0: task do_install: Started
NOTE: recipe expat-2.2.10-r0: task do_packagedata: Started
NOTE: recipe expat-2.2.10-r0: task do_packagedata: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_unpack: Succeeded
NOTE: Running task 1417 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_symlink_kernsrc)
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_symlink_kernsrc: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_symlink_kernsrc: Succeeded
NOTE: Running task 1418 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_kernel_checkout)
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_kernel_checkout: Started
NOTE: recipe openssl-1.1.1h-r0: task do_install: Succeeded
NOTE: Running task 1419 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb:do_install_ptest_base)
NOTE: recipe libtool-cross-2.4.6-r0: task do_configure: Succeeded
NOTE: Running task 1420 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_compile)
NOTE: recipe openssl-1.1.1h-r0: task do_install_ptest_base: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_compile: Started
NOTE: recipe openssl-1.1.1h-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1421 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb:do_populate_sysroot)
NOTE: Running task 1422 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb:do_package)
NOTE: recipe openssl-1.1.1h-r0: task do_populate_sysroot: Started
NOTE: recipe openssl-1.1.1h-r0: task do_package: Started
NOTE: recipe unzip-1_6.0-r5: task do_compile: Succeeded
NOTE: Running task 1423 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_install)
NOTE: recipe unzip-1_6.0-r5: task do_install: Started
NOTE: recipe unzip-1_6.0-r5: task do_install: Succeeded
NOTE: Running task 1424 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package)
NOTE: recipe unzip-1_6.0-r5: task do_package: Started
NOTE: recipe openssl-1.1.1h-r0: task do_populate_sysroot: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package: Succeeded
NOTE: Running task 1425 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata: Succeeded
NOTE: Running task 1426 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm)
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_kernel_checkout: Succeeded
NOTE: Running task 1427 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_validate_branches)
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_validate_branches: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_validate_branches: Succeeded
NOTE: Running task 1428 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_kernel_metadata)
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_kernel_metadata: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_compile: Succeeded
NOTE: Running task 1429 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_install)
NOTE: recipe libtool-cross-2.4.6-r0: task do_install: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_install: Succeeded
NOTE: Running task 1430 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot)
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1431 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1432 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.17.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1433 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1434 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1435 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1436 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1437 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1438 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1439 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1440 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1441 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1442 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1443 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1444 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1445 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1446 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1447 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1448 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1449 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1450 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1451 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_prepare_recipe_sysroot)
NOTE: recipe flex-2.6.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcrypt-4.4.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1452 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe cracklib-2.9.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1453 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1454 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1455 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe ncurses-6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-completion-2.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1456 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1457 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1458 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-macros-1_1.19.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1459 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtirpc-1.2.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libffi-3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1460 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdbm-1.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1461 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe xcb-proto-1.14.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe attr-2.4.48-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe db-1_5.3.28-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.182-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe m4-1.4.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sed-4.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffutils-3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gmp-6.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bison-3.7.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-4.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mdadm-4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe findutils-4.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmnl-1.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iptables-1.8.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe flex-2.6.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1462 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_configure)
NOTE: recipe flex-2.6.4-r0: task do_configure: Started
NOTE: recipe libxcrypt-4.4.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1463 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.17.bb:do_configure)
NOTE: recipe libmnl-1.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bison-3.7.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe elfutils-0.182-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1464 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_configure)
NOTE: recipe m4-1.4.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1465 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_configure)
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1466 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_configure)
NOTE: Running task 1467 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure)
NOTE: recipe make-4.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iptables-1.8.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1468 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_configure)
NOTE: Running task 1469 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_configure)
NOTE: Running task 1470 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_configure)
NOTE: recipe sed-4.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1471 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_configure)
NOTE: recipe diffutils-3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1472 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_configure)
NOTE: Running task 1473 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_configure)
NOTE: Running task 1474 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_configure)
NOTE: recipe libxcrypt-4.4.17-r0: task do_configure: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_kernel_metadata: Succeeded
NOTE: Running task 1475 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_patch)
NOTE: Running task 1476 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_kernel_version_sanity_check)
NOTE: recipe bison-3.7.4-r0: task do_configure: Started
NOTE: recipe db-1_5.3.28-r1: task do_configure: Started
NOTE: recipe lzo-2.10-r0: task do_configure: Started
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1477 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure)
NOTE: recipe mdadm-4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_configure: Started
NOTE: recipe bash-completion-2.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1478 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_configure)
NOTE: recipe libpthread-stubs-0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcap-ng-0.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe findutils-4.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1479 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_configure)
NOTE: recipe cracklib-2.9.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe elfutils-0.182-r0: task do_configure: Started
NOTE: recipe sed-4.8-r0: task do_configure: Started
NOTE: recipe xz-5.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe make-4.3-r0: task do_configure: Started
NOTE: recipe gmp-6.2.1-r0: task do_configure: Started
NOTE: Running task 1480 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_configure)
NOTE: recipe libmnl-1.0.4-r0: task do_configure: Started
NOTE: Running task 1481 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_configure)
NOTE: recipe iptables-1.8.6-r0: task do_configure: Started
NOTE: recipe diffutils-3.7-r0: task do_configure: Started
NOTE: Running task 1482 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_configure)
NOTE: recipe libffi-3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1483 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_configure)
NOTE: recipe base-passwd-3.5.29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1484 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_configure)
NOTE: recipe gdbm-1.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1485 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_configure)
NOTE: Running task 1486 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_configure)
NOTE: Running task 1487 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_configure)
NOTE: Running task 1488 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_configure)
NOTE: Running task 1489 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_configure)
NOTE: Running task 1490 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_configure)
NOTE: Running task 1491 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_configure)
NOTE: recipe bash-completion-2.11-r0: task do_configure: Started
NOTE: Running task 1492 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_configure)
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_kernel_version_sanity_check: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Started
NOTE: Running task 1493 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_configure)
NOTE: recipe mdadm-4.1-r0: task do_configure: Started
NOTE: recipe ncurses-6.2-r0: task do_configure: Started
NOTE: recipe cracklib-2.9.5-r0: task do_configure: Started
NOTE: recipe libffi-3.3-r0: task do_configure: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_kernel_version_sanity_check: Succeeded
NOTE: Running task 1494 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_configure)
NOTE: recipe libcap-ng-0.8.1-r0: task do_configure: Started
NOTE: recipe xz-5.2.5-r0: task do_configure: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_patch: Started
NOTE: recipe attr-2.4.48-r0: task do_configure: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_configure: Started
NOTE: recipe gdbm-1.18.1-r0: task do_configure: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_configure: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_configure: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_configure: Started
NOTE: recipe findutils-4.7.0-r0: task do_configure: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_configure: Started
NOTE: recipe which-2.21-r3: task do_configure: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_patch: Succeeded
NOTE: Running task 1495 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_kernel_configme)
NOTE: Running task 1496 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-proto-1.14.1-r0: task do_configure: Started
NOTE: recipe mdadm-4.1-r0: task do_configure: Succeeded
NOTE: Running task 1497 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_configure_ptest_base)
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_kernel_configme: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mdadm-4.1-r0: task do_configure_ptest_base: Started
NOTE: recipe mdadm-4.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1498 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_compile)
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_compile: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_configure: Succeeded
NOTE: Running task 1499 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_compile)
NOTE: recipe bash-completion-2.11-r0: task do_configure: Succeeded
NOTE: Running task 1500 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_compile)
NOTE: recipe xcb-proto-1.14.1-r0: task do_configure: Succeeded
NOTE: Running task 1501 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_compile)
NOTE: recipe base-passwd-3.5.29-r0: task do_configure: Succeeded
NOTE: Running task 1502 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_compile)
NOTE: recipe util-macros-1_1.19.2-r0: task do_compile: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_compile: Started
NOTE: recipe bash-completion-2.11-r0: task do_compile: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_compile: Succeeded
NOTE: Running task 1503 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_install)
NOTE: recipe base-passwd-3.5.29-r0: task do_compile: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_compile: Succeeded
NOTE: Running task 1504 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_install)
NOTE: recipe util-macros-1_1.19.2-r0: task do_install: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_install: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_install: Succeeded
NOTE: Running task 1505 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_populate_sysroot)
NOTE: Running task 1506 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_package)
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_package: Started
NOTE: recipe bash-completion-2.11-r0: task do_compile: Succeeded
NOTE: Running task 1507 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_install)
NOTE: recipe xcb-proto-1.14.1-r0: task do_install: Succeeded
NOTE: Running task 1508 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot)
NOTE: recipe base-passwd-3.5.29-r0: task do_compile: Succeeded
NOTE: Running task 1509 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_install)
NOTE: Running task 1510 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package)
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1511 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1512 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1513 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1514 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_prepare_recipe_sysroot)
NOTE: recipe bash-completion-2.11-r0: task do_install: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_install: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1515 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_configure)
NOTE: recipe base-passwd-3.5.29-r0: task do_install: Succeeded
NOTE: Running task 1516 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot)
NOTE: recipe libxau-1_1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1517 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_configure)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1518 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_configure)
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_configure: Succeeded
NOTE: Running task 1519 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_compile)
NOTE: recipe libxau-1_1.0.9-r0: task do_configure: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_configure: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_compile: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_compile: Succeeded
NOTE: Running task 1520 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_install)
NOTE: recipe libpthread-stubs-0.4-r0: task do_install: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1521 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1522 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package)
NOTE: recipe xkeyboard-config-2.31-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1523 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_configure)
NOTE: recipe libpthread-stubs-0.4-r0: task do_install: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_package: Started
NOTE: Running task 1524 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot)
NOTE: Running task 1525 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package)
NOTE: recipe xkeyboard-config-2.31-r0: task do_configure: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1526 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_configure)
NOTE: recipe shadow-sysroot-4.6-r3: task do_configure: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_configure: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package: Succeeded
NOTE: Running task 1527 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_compile)
NOTE: Running task 1528 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_compile: Started
NOTE: recipe mdadm-4.1-r0: task do_compile: Succeeded
NOTE: Running task 1529 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_compile_ptest_base)
NOTE: recipe shadow-sysroot-4.6-r3: task do_compile: Succeeded
NOTE: Running task 1530 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_install)
NOTE: recipe mdadm-4.1-r0: task do_compile_ptest_base: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_install: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_install: Succeeded
NOTE: Running task 1531 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot)
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1532 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_package: Succeeded
NOTE: Running task 1533 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_packagedata)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot: Succeeded
NOTE: recipe which-2.21-r3: task do_configure: Succeeded
NOTE: Running task 1534 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_compile)
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata: Started
NOTE: recipe which-2.21-r3: task do_compile: Started
NOTE: recipe mdadm-4.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1535 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_install)
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1536 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_package_write_rpm)
NOTE: recipe mdadm-4.1-r0: task do_install: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm: Started
NOTE: recipe which-2.21-r3: task do_compile: Succeeded
NOTE: Running task 1537 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_install)
NOTE: recipe which-2.21-r3: task do_install: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Succeeded
NOTE: Running task 1538 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure_ptest_base)
NOTE: recipe mdadm-4.1-r0: task do_install: Succeeded
NOTE: Running task 1539 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_install_ptest_base)
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Succeeded
NOTE: Running task 1540 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata)
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Started
NOTE: recipe mdadm-4.1-r0: task do_install_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1541 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Started
NOTE: recipe which-2.21-r3: task do_install: Succeeded
NOTE: Running task 1542 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package)
NOTE: recipe bash-completion-2.11-r0: task do_install: Succeeded
NOTE: Running task 1543 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot)
NOTE: Running task 1544 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package)
NOTE: recipe base-passwd-3.5.29-r0: task do_package: Succeeded
NOTE: Running task 1545 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata)
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Started
NOTE: recipe which-2.21-r3: task do_package: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot: Started
NOTE: recipe bash-completion-2.11-r0: task do_package: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1546 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1547 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm)
NOTE: recipe mdadm-4.1-r0: task do_package: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata: Succeeded
NOTE: Running task 1548 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm)
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_configure: Succeeded
NOTE: Running task 1549 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_compile)
NOTE: recipe sqlite3-3_3.33.0-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Succeeded
NOTE: Running task 1550 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile_ptest_base)
NOTE: recipe libmnl-1.0.4-r0: task do_configure: Succeeded
NOTE: Running task 1551 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1552 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install)
NOTE: recipe libmnl-1.0.4-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1553 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmod-27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmnl-1.0.4-r0: task do_compile: Succeeded
NOTE: Running task 1554 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_install)
NOTE: recipe which-2.21-r3: task do_package: Succeeded
NOTE: Running task 1555 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata)
NOTE: recipe bzip2-1.0.8-r0: task do_install: Succeeded
NOTE: Running task 1556 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base)
NOTE: recipe libmnl-1.0.4-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_configure: Succeeded
NOTE: Running task 1557 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_packagedata: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1558 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot)
NOTE: recipe which-2.21-r3: task do_packagedata: Succeeded
NOTE: Running task 1559 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: recipe xkeyboard-config-2.31-r0: task do_compile: Succeeded
NOTE: Running task 1560 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_install)
NOTE: Running task 1561 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm)
NOTE: recipe kmod-27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1562 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_configure)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Started
NOTE: recipe libmnl-1.0.4-r0: task do_install: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: Running task 1563 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package)
NOTE: Running task 1564 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_populate_sysroot)
NOTE: recipe which-2.21-r3: task do_package_write_rpm: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_install: Started
NOTE: recipe kmod-27-r0: task do_configure: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package: Started
NOTE: recipe libmnl-1.0.4-r0: task do_populate_sysroot: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_configure: Succeeded
NOTE: Running task 1565 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_compile)
NOTE: recipe elfutils-0.182-r0: task do_configure: Succeeded
NOTE: Running task 1566 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_configure_ptest_base)
NOTE: recipe which-2.21-r3: task do_package_write_rpm: Succeeded
NOTE: recipe libcap-ng-0.8.1-r0: task do_compile: Started
NOTE: recipe attr-2.4.48-r0: task do_configure: Succeeded
NOTE: Running task 1567 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_configure_ptest_base)
NOTE: recipe mdadm-4.1-r0: task do_package: Succeeded
NOTE: Running task 1568 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata)
NOTE: recipe elfutils-0.182-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.182-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1569 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_compile)
NOTE: recipe iptables-1.8.6-r0: task do_configure: Succeeded
NOTE: Running task 1570 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_compile)
NOTE: recipe attr-2.4.48-r0: task do_configure_ptest_base: Started
NOTE: recipe attr-2.4.48-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1571 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_compile)
NOTE: recipe cracklib-2.9.5-r0: task do_configure: Succeeded
NOTE: Running task 1572 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_compile)
NOTE: recipe mdadm-4.1-r0: task do_packagedata: Started
NOTE: recipe iptables-1.8.6-r0: task do_compile: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1573 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_compile)
NOTE: recipe attr-2.4.48-r0: task do_compile: Started
NOTE: recipe elfutils-0.182-r0: task do_compile: Started
NOTE: recipe cracklib-2.9.5-r0: task do_compile: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_install: Succeeded
NOTE: Running task 1574 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_populate_sysroot)
NOTE: recipe bash-completion-2.11-r0: task do_package: Succeeded
NOTE: Running task 1575 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_package)
NOTE: Running task 1576 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata)
NOTE: recipe xtrans-1_1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1577 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_install)
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_package: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_install: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_install: Succeeded
NOTE: Running task 1578 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 1579 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_compile: Succeeded
NOTE: Running task 1580 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_install)
NOTE: recipe attr-2.4.48-r0: task do_compile: Succeeded
NOTE: Running task 1581 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_compile_ptest_base)
NOTE: recipe libtirpc-1.2.6-r0: task do_configure: Succeeded
NOTE: Running task 1582 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_compile)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_compile: Succeeded
NOTE: Running task 1583 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_install)
NOTE: recipe libcap-ng-0.8.1-r0: task do_install: Started
NOTE: recipe libffi-3.3-r0: task do_configure: Succeeded
NOTE: Running task 1584 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_compile)
NOTE: recipe libtirpc-1.2.6-r0: task do_compile: Started
NOTE: recipe attr-2.4.48-r0: task do_compile_ptest_base: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_install: Started
NOTE: recipe attr-2.4.48-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1585 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_install)
NOTE: recipe libffi-3.3-r0: task do_compile: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1586 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe attr-2.4.48-r0: task do_install: Started
NOTE: recipe libice-1_1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmnl-1.0.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1587 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_prepare_recipe_sysroot)
NOTE: recipe libice-1_1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1588 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_configure)
NOTE: recipe libpcre-8.44-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_install: Succeeded
NOTE: Running task 1589 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_populate_sysroot)
NOTE: Running task 1590 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_package)
NOTE: recipe libice-1_1.0.10-r0: task do_configure: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_compile: Succeeded
NOTE: Running task 1591 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_install)
NOTE: recipe libmnl-1.0.4-r0: task do_package: Succeeded
NOTE: Running task 1592 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata)
NOTE: recipe libcap-ng-0.8.1-r0: task do_package: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre-8.44-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1593 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_configure)
NOTE: recipe libtirpc-1.2.6-r0: task do_install: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata: Started
NOTE: recipe libpcre-8.44-r0: task do_configure: Started
NOTE: recipe attr-2.4.48-r0: task do_install: Succeeded
NOTE: Running task 1594 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_install_ptest_base)
NOTE: recipe attr-2.4.48-r0: task do_install_ptest_base: Started
NOTE: recipe libffi-3.3-r0: task do_compile: Succeeded
NOTE: Running task 1595 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_install)
NOTE: recipe attr-2.4.48-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1596 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_populate_sysroot)
NOTE: recipe libffi-3.3-r0: task do_install: Started
NOTE: Running task 1597 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_package)
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_install: Succeeded
NOTE: Running task 1598 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_populate_sysroot)
NOTE: recipe attr-2.4.48-r0: task do_package: Started
NOTE: Running task 1599 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_package)
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1600 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm)
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_package: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm: Started
NOTE: recipe cracklib-2.9.5-r0: task do_install: Succeeded
NOTE: Running task 1601 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot)
NOTE: Running task 1602 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package)
NOTE: recipe cracklib-2.9.5-r0: task do_package: Started
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxcrypt-4.4.17-r0: task do_configure: Succeeded
NOTE: Running task 1603 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.17.bb:do_compile)
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1604 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_prepare_recipe_sysroot)
NOTE: recipe libffi-3.3-r0: task do_install: Succeeded
NOTE: Running task 1605 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot)
NOTE: Running task 1606 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package)
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: Running task 1607 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata)
NOTE: Running task 1608 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata)
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcrypt-4.4.17-r0: task do_compile: Started
NOTE: Running task 1609 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe acl-2.2.53-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_package: Succeeded
NOTE: Running task 1610 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_packagedata)
NOTE: recipe iptables-1.8.6-r0: task do_compile: Succeeded
NOTE: Running task 1611 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_install)
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libffi-3.3-r0: task do_package: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata: Started
NOTE: recipe iptables-1.8.6-r0: task do_install: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1612 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_configure)
NOTE: recipe libnsl2-1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1613 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_configure)
NOTE: recipe acl-2.2.53-r0: task do_configure: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_configure: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_kernel_configme: Succeeded
NOTE: Running task 1614 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_configure)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1615 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm)
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_configure: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_configure: Succeeded
NOTE: Running task 1616 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_configure_ptest_base)
NOTE: recipe gdbm-1.18.1-r0: task do_configure_ptest_base: Started
NOTE: recipe gdbm-1.18.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1617 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_compile)
NOTE: recipe libcap-ng-0.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_compile: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe iptables-1.8.6-r0: task do_install: Succeeded
NOTE: Running task 1618 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_package)
NOTE: Running task 1619 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_populate_sysroot)
NOTE: recipe iptables-1.8.6-r0: task do_populate_sysroot: Started
NOTE: recipe iptables-1.8.6-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata: Succeeded
NOTE: Running task 1620 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_package_write_rpm)
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm: Started
NOTE: recipe libxcrypt-4.4.17-r0: task do_compile: Succeeded
NOTE: Running task 1621 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.17.bb:do_install)
NOTE: recipe libcap-ng-0.8.1-r0: task do_package: Succeeded
NOTE: Running task 1622 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_packagedata)
NOTE: recipe libxcrypt-4.4.17-r0: task do_install: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_packagedata: Started
NOTE: recipe gdbm-1.18.1-r0: task do_compile: Succeeded
NOTE: Running task 1623 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_compile_ptest_base)
NOTE: recipe libxcrypt-4.4.17-r0: task do_install: Succeeded
NOTE: Running task 1624 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.17.bb:do_populate_sysroot)
NOTE: Running task 1625 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.17.bb:do_package)
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libxcrypt-4.4.17-r0: task do_populate_sysroot: Started
NOTE: recipe libxcrypt-4.4.17-r0: task do_package: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1626 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_package_write_rpm)
NOTE: recipe libxau-1_1.0.9-r0: task do_configure: Succeeded
NOTE: Running task 1627 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_compile)
NOTE: recipe libcap-ng-0.8.1-r0: task do_package_write_rpm: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_compile: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_configure: Succeeded
NOTE: Running task 1628 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_compile)
NOTE: recipe attr-2.4.48-r0: task do_package: Succeeded
NOTE: recipe iptables-1.8.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1629 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_packagedata)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_compile: Started
NOTE: recipe libxcrypt-4.4.17-r0: task do_populate_sysroot: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_packagedata: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1630 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_install)
NOTE: recipe libtirpc-1.2.6-r0: task do_package: Succeeded
NOTE: Running task 1631 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_packagedata)
NOTE: recipe libxau-1_1.0.9-r0: task do_install: Started
NOTE: recipe make-4.3-r0: task do_configure: Succeeded
NOTE: Running task 1632 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_compile)
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata: Started
NOTE: recipe libffi-3.3-r0: task do_package: Succeeded
NOTE: Running task 1633 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata)
NOTE: recipe make-4.3-r0: task do_compile: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_compile: Succeeded
NOTE: Running task 1634 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_install)
NOTE: recipe flex-2.6.4-r0: task do_configure: Succeeded
NOTE: Running task 1635 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_configure_ptest_base)
NOTE: recipe libcap-ng-0.8.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_install: Succeeded
NOTE: Running task 1636 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot)
NOTE: Running task 1637 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package)
NOTE: recipe attr-2.4.48-r0: task do_packagedata: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata: Succeeded
NOTE: Running task 1638 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_package_write_rpm)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_install: Started
NOTE: recipe flex-2.6.4-r0: task do_configure_ptest_base: Started
NOTE: recipe flex-2.6.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1639 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_compile)
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm: Started
NOTE: Running task 1640 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata)
NOTE: recipe flex-2.6.4-r0: task do_compile: Started
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1641 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_install: Succeeded
NOTE: Running task 1642 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot)
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm: Started
NOTE: Running task 1643 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe make-4.3-r0: task do_compile: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1644 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_install)
NOTE: Running task 1645 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcb-1.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.2.5-r0: task do_configure: Succeeded
NOTE: Running task 1646 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_compile)
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe make-4.3-r0: task do_install: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1647 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm)
NOTE: recipe xz-5.2.5-r0: task do_compile: Started
NOTE: recipe libxcb-1.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1648 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_configure)
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm: Started
NOTE: recipe libxcb-1.14-r0: task do_configure: Started
NOTE: recipe libxcrypt-4.4.17-r0: task do_package: Succeeded
NOTE: Running task 1649 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.17.bb:do_packagedata)
NOTE: recipe libxcrypt-4.4.17-r0: task do_packagedata: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_configure: Succeeded
NOTE: Running task 1650 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_kernel_configcheck)
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_kernel_configcheck: Started
NOTE: recipe libxcrypt-4.4.17-r0: task do_packagedata: Succeeded
NOTE: Running task 1651 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.17.bb:do_package_write_rpm)
NOTE: recipe libxcrypt-4.4.17-r0: task do_package_write_rpm: Started
NOTE: recipe make-4.3-r0: task do_install: Succeeded
NOTE: Running task 1652 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package)
NOTE: recipe make-4.3-r0: task do_package: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package: Succeeded
NOTE: Running task 1653 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata)
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata: Started
NOTE: recipe lzo-2.10-r0: task do_configure: Succeeded
NOTE: Running task 1654 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure_ptest_base)
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package: Succeeded
NOTE: Running task 1655 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm)
NOTE: Running task 1656 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata)
NOTE: recipe lzo-2.10-r0: task do_configure_ptest_base: Started
NOTE: recipe lzo-2.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1657 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_compile)
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata: Started
NOTE: recipe libxcrypt-4.4.17-r0: task do_package_write_rpm: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_compile: Succeeded
NOTE: Running task 1658 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_compile_ptest_base)
NOTE: recipe lzo-2.10-r0: task do_compile: Started
NOTE: recipe flex-2.6.4-r0: task do_compile_ptest_base: Started
NOTE: recipe gdbm-1.18.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1659 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_install)
NOTE: recipe gdbm-1.18.1-r0: task do_install: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1660 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_compile: Succeeded
NOTE: Running task 1661 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_install)
NOTE: recipe xz-5.2.5-r0: task do_install: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_install: Succeeded
NOTE: Running task 1662 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_install_ptest_base)
NOTE: recipe lzo-2.10-r0: task do_compile: Succeeded
NOTE: Running task 1663 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_compile_ptest_base)
NOTE: recipe gdbm-1.18.1-r0: task do_install_ptest_base: Started
NOTE: recipe lzo-2.10-r0: task do_compile_ptest_base: Started
NOTE: recipe lzo-2.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1664 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_install)
NOTE: recipe lzo-2.10-r0: task do_install: Started
NOTE: recipe make-4.3-r0: task do_package: Succeeded
NOTE: Running task 1665 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata)
NOTE: recipe lzo-2.10-r0: task do_install: Succeeded
NOTE: Running task 1666 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_install_ptest_base)
NOTE: recipe make-4.3-r0: task do_packagedata: Started
NOTE: recipe gdbm-1.18.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1667 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_populate_sysroot)
NOTE: Running task 1668 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_package)
NOTE: recipe lzo-2.10-r0: task do_install_ptest_base: Started
NOTE: recipe gdbm-1.18.1-r0: task do_package: Started
NOTE: recipe gdbm-1.18.1-r0: task do_populate_sysroot: Started
NOTE: recipe xz-5.2.5-r0: task do_install: Succeeded
NOTE: Running task 1669 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot)
NOTE: Running task 1670 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package)
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot: Started
NOTE: recipe xz-5.2.5-r0: task do_package: Started
NOTE: recipe lzo-2.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1671 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package)
NOTE: Running task 1672 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_populate_sysroot)
NOTE: recipe lzo-2.10-r0: task do_package: Started
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot: Started
NOTE: recipe db-1_5.3.28-r1: task do_configure: Succeeded
NOTE: Running task 1673 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_compile)
NOTE: recipe gdbm-1.18.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_compile: Started
NOTE: recipe make-4.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1674 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm)
NOTE: Running task 1675 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm)
NOTE: recipe make-4.3-r0: task do_package_write_rpm: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm: Started
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe iptables-1.8.6-r0: task do_package: Succeeded
NOTE: Running task 1676 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_packagedata)
NOTE: recipe iptables-1.8.6-r0: task do_packagedata: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_configure: Succeeded
NOTE: Running task 1677 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_compile)
NOTE: recipe libnsl2-1.3.0-r0: task do_compile: Started
NOTE: recipe elfutils-0.182-r0: task do_compile: Succeeded
NOTE: Running task 1678 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.182-r0: task do_compile_ptest_base: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 1679 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_install)
NOTE: recipe libnsl2-1.3.0-r0: task do_install: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_install: Succeeded
NOTE: Running task 1680 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot)
NOTE: Running task 1681 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package)
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package: Started
NOTE: recipe lzo-2.10-r0: task do_package: Succeeded
NOTE: recipe make-4.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1682 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata)
NOTE: recipe libice-1_1.0.10-r0: task do_configure: Succeeded
NOTE: Running task 1683 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_compile)
NOTE: recipe libice-1_1.0.10-r0: task do_compile: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata: Started
NOTE: recipe kmod-27-r0: task do_configure: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_configure: Succeeded
NOTE: Running task 1684 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_compile)
NOTE: Running task 1685 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_configure_ptest_base)
NOTE: recipe iptables-1.8.6-r0: task do_packagedata: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1686 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmod-27-r0: task do_compile: Started
NOTE: recipe xz-5.2.5-r0: task do_package: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_configure_ptest_base: Started
NOTE: Running task 1687 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata)
NOTE: recipe gdbm-1.18.1-r0: task do_package: Succeeded
NOTE: Running task 1688 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_packagedata)
NOTE: recipe acl-2.2.53-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1689 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata: Started
NOTE: recipe acl-2.2.53-r0: task do_compile: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata: Succeeded
NOTE: Running task 1690 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm)
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm: Started
NOTE: Running task 1691 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_configure)
NOTE: recipe libpcre-8.44-r0: task do_configure: Succeeded
NOTE: Running task 1692 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_configure_ptest_base)
NOTE: recipe ncurses-6.2-r0: task do_configure: Succeeded
NOTE: Running task 1693 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Started
NOTE: recipe libpcre-8.44-r0: task do_configure_ptest_base: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_compile: Started
NOTE: Running task 1694 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_compile)
NOTE: Running task 1695 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_compile)
NOTE: recipe libpcre-8.44-r0: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Started
NOTE: recipe libice-1_1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 1696 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_install)
NOTE: recipe xz-5.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1697 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm)
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_install: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe db-1_5.3.28-r1: task do_compile: Succeeded
NOTE: Running task 1698 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_install)
NOTE: recipe db-1_5.3.28-r1: task do_install: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Succeeded
NOTE: Running task 1699 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_install)
NOTE: recipe openssl-1.1.1h-r0: task do_package: Succeeded
NOTE: Running task 1700 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb:do_packagedata)
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Started
NOTE: recipe libice-1_1.0.10-r0: task do_install: Succeeded
NOTE: Running task 1701 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot)
NOTE: Running task 1702 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package)
NOTE: recipe openssl-1.1.1h-r0: task do_packagedata: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package: Started
NOTE: recipe acl-2.2.53-r0: task do_compile: Succeeded
NOTE: Running task 1703 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_compile_ptest_base)
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_compile_ptest_base: Started
NOTE: recipe kmod-27-r0: task do_compile: Succeeded
NOTE: Running task 1704 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_install)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1705 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Succeeded
NOTE: Running task 1706 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot)
NOTE: recipe kmod-27-r0: task do_install: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1707 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_configure)
NOTE: recipe acl-2.2.53-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1708 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_install)
NOTE: recipe libsm-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package: Succeeded
NOTE: Running task 1709 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata)
NOTE: recipe m4-1.4.18-r0: task do_configure: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_install: Started
NOTE: Running task 1710 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_configure_ptest_base)
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata: Started
NOTE: recipe m4-1.4.18-r0: task do_configure_ptest_base: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1711 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_compile)
NOTE: recipe kmod-27-r0: task do_install: Succeeded
NOTE: Running task 1712 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot)
NOTE: Running task 1713 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package)
NOTE: recipe m4-1.4.18-r0: task do_compile: Started
NOTE: recipe kmod-27-r0: task do_package: Started
NOTE: recipe kmod-27-r0: task do_populate_sysroot: Started
NOTE: recipe gmp-6.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1714 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_compile)
NOTE: recipe gmp-6.2.1-r0: task do_compile: Started
NOTE: recipe openssl-1.1.1h-r0: task do_packagedata: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_install: Succeeded
NOTE: Running task 1716 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_install_ptest_base)
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1717 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package)
NOTE: recipe kmod-27-r0: task do_populate_sysroot: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_install_ptest_base: Started
NOTE: Running task 1718 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe db-1_5.3.28-r1: task do_install: Succeeded
NOTE: Running task 1719 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_populate_sysroot)
NOTE: Running task 1720 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package)
NOTE: recipe db-1_5.3.28-r1: task do_package: Started
NOTE: recipe db-1_5.3.28-r1: task do_populate_sysroot: Started
NOTE: recipe acl-2.2.53-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1721 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_populate_sysroot)
NOTE: Running task 1722 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package)
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot: Started
NOTE: recipe acl-2.2.53-r0: task do_package: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot: Succeeded
NOTE: recipe kmod-27-r0: task do_package: Succeeded
NOTE: Running task 1723 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata)
NOTE: recipe db-1_5.3.28-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 1724 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe perl-5.32.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kmod-27-r0: task do_packagedata: Started
NOTE: recipe perl-5.32.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1725 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_configure)
NOTE: recipe perl-5.32.0-r0: task do_configure: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package: Succeeded
NOTE: Running task 1726 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata)
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_kernel_configcheck: Succeeded
NOTE: Running task 1727 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_compile)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_compile: Started
NOTE: recipe kmod-27-r0: task do_packagedata: Succeeded
NOTE: Running task 1728 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm)
NOTE: recipe kmod-27-r0: task do_package_write_rpm: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata: Succeeded
NOTE: Running task 1729 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm)
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe kmod-27-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_configure: Succeeded
NOTE: Running task 1730 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_configure_ptest_base)
NOTE: recipe diffutils-3.7-r0: task do_configure_ptest_base: Started
NOTE: recipe diffutils-3.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1731 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_compile)
NOTE: recipe sed-4.8-r0: task do_configure: Succeeded
NOTE: Running task 1732 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_configure_ptest_base)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Succeeded
NOTE: Running task 1733 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata)
NOTE: recipe sed-4.8-r0: task do_configure_ptest_base: Started
NOTE: recipe m4-1.4.18-r0: task do_compile: Succeeded
NOTE: Running task 1734 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_compile_ptest_base)
NOTE: recipe diffutils-3.7-r0: task do_compile: Started
NOTE: recipe sed-4.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1735 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Started
NOTE: recipe m4-1.4.18-r0: task do_compile_ptest_base: Started
NOTE: recipe sed-4.8-r0: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Succeeded
NOTE: Running task 1736 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm: Started
NOTE: recipe acl-2.2.53-r0: task do_package: Succeeded
NOTE: Running task 1737 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata)
NOTE: recipe acl-2.2.53-r0: task do_packagedata: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_configure: Succeeded
NOTE: Running task 1738 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_compile)
NOTE: recipe acl-2.2.53-r0: task do_packagedata: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_compile: Succeeded
NOTE: Running task 1739 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_compile_ptest_base)
NOTE: recipe libxcb-1.14-r0: task do_compile: Started
NOTE: recipe libpcre-8.44-r0: task do_compile_ptest_base: Started
NOTE: recipe libpcre-8.44-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1740 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_install)
NOTE: recipe libpcre-8.44-r0: task do_install: Started
NOTE: recipe libpcre-8.44-r0: task do_install: Succeeded
NOTE: Running task 1741 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_install_ptest_base)
NOTE: recipe libpcre-8.44-r0: task do_install_ptest_base: Started
NOTE: recipe gmp-6.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1742 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_install)
NOTE: recipe gmp-6.2.1-r0: task do_install: Started
NOTE: recipe libpcre-8.44-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1743 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot)
NOTE: Running task 1744 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package)
NOTE: recipe libpcre-8.44-r0: task do_package: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot: Started
NOTE: recipe sed-4.8-r0: task do_compile: Succeeded
NOTE: Running task 1745 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_compile_ptest_base)
NOTE: recipe sed-4.8-r0: task do_compile_ptest_base: Started
NOTE: recipe gmp-6.2.1-r0: task do_install: Succeeded
NOTE: Running task 1746 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot)
NOTE: Running task 1747 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package)
NOTE: recipe sed-4.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1748 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_install)
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe gmp-6.2.1-r0: task do_package: Started
NOTE: recipe diffutils-3.7-r0: task do_compile: Succeeded
NOTE: Running task 1749 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_compile_ptest_base)
NOTE: recipe sed-4.8-r0: task do_install: Started
NOTE: recipe diffutils-3.7-r0: task do_compile_ptest_base: Started
NOTE: recipe diffutils-3.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1750 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_install)
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_install: Started
NOTE: recipe sed-4.8-r0: task do_install: Succeeded
NOTE: Running task 1751 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_install_ptest_base)
NOTE: recipe ncurses-6.2-r0: task do_compile: Succeeded
NOTE: Running task 1752 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_install)
NOTE: recipe sed-4.8-r0: task do_install_ptest_base: Started
NOTE: recipe ncurses-6.2-r0: task do_install: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1753 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe sed-4.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1754 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package)
NOTE: recipe diffutils-3.7-r0: task do_install: Succeeded
NOTE: Running task 1755 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_install_ptest_base)
NOTE: recipe grep-3.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sed-4.8-r0: task do_package: Started
NOTE: recipe diffutils-3.7-r0: task do_install_ptest_base: Started
NOTE: recipe diffutils-3.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1756 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package)
NOTE: recipe grep-3.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1757 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_configure)
NOTE: recipe diffutils-3.7-r0: task do_package: Started
NOTE: recipe grep-3.6-r0: task do_configure: Started
NOTE: recipe libpcre-8.44-r0: task do_package: Succeeded
NOTE: Running task 1758 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata)
NOTE: recipe libpcre-8.44-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.182-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1759 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_install)
NOTE: recipe libxcb-1.14-r0: task do_compile: Succeeded
NOTE: Running task 1760 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_install)
NOTE: recipe elfutils-0.182-r0: task do_install: Started
NOTE: recipe libxcb-1.14-r0: task do_install: Started
NOTE: recipe gmp-6.2.1-r0: task do_package: Succeeded
NOTE: Running task 1761 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 1762 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_compile)
NOTE: recipe libpcre-8.44-r0: task do_packagedata: Succeeded
NOTE: Running task 1763 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm)
NOTE: recipe libsm-1_1.2.3-r0: task do_compile: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1764 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm)
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe elfutils-0.182-r0: task do_install: Succeeded
NOTE: Running task 1765 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.182-r0: task do_install_ptest_base: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 1766 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_install)
NOTE: recipe libsm-1_1.2.3-r0: task do_install: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 1767 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 1768 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package)
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package: Started
NOTE: recipe elfutils-0.182-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1769 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_package)
NOTE: Running task 1770 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_populate_sysroot)
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe elfutils-0.182-r0: task do_package: Started
NOTE: recipe elfutils-0.182-r0: task do_populate_sysroot: Started
NOTE: recipe libxcb-1.14-r0: task do_install: Succeeded
NOTE: Running task 1771 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot)
NOTE: Running task 1772 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package)
NOTE: recipe diffutils-3.7-r0: task do_package: Succeeded
NOTE: Running task 1773 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata)
NOTE: recipe libxcb-1.14-r0: task do_package: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot: Started
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm: Succeeded
NOTE: recipe elfutils-0.182-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sed-4.8-r0: task do_package: Succeeded
NOTE: Running task 1774 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata)
NOTE: recipe sed-4.8-r0: task do_packagedata: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 1775 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_package_write_rpm)
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm: Started
NOTE: recipe sed-4.8-r0: task do_packagedata: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package: Succeeded
NOTE: Running task 1776 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata)
NOTE: recipe db-1_5.3.28-r1: task do_packagedata: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 1777 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata)
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1778 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1779 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm)
NOTE: recipe libx11-1_1.6.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata: Succeeded
NOTE: Running task 1780 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_configure)
NOTE: Running task 1781 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm)
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_configure: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe findutils-4.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1782 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_compile)
NOTE: recipe findutils-4.7.0-r0: task do_compile: Started
NOTE: recipe bison-3.7.4-r0: task do_configure: Succeeded
NOTE: Running task 1783 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_compile)
NOTE: recipe bison-3.7.4-r0: task do_compile: Started
NOTE: recipe bison-3.7.4-r0: task do_compile: Succeeded
NOTE: Running task 1784 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_install)
NOTE: recipe sqlite3-3_3.33.0-r0: task do_compile: Succeeded
NOTE: Running task 1785 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_install)
NOTE: recipe libxcb-1.14-r0: task do_package: Succeeded
NOTE: Running task 1786 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata)
NOTE: recipe bison-3.7.4-r0: task do_install: Started
NOTE: recipe findutils-4.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1787 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_install)
NOTE: recipe sqlite3-3_3.33.0-r0: task do_install: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata: Started
NOTE: recipe findutils-4.7.0-r0: task do_install: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_install: Succeeded
NOTE: Running task 1788 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_populate_sysroot)
NOTE: Running task 1789 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_package)
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata: Succeeded
NOTE: Running task 1790 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm)
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm: Started
NOTE: recipe bison-3.7.4-r0: task do_install: Succeeded
NOTE: Running task 1791 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_package)
NOTE: Running task 1792 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_populate_sysroot)
NOTE: recipe findutils-4.7.0-r0: task do_install: Succeeded
NOTE: Running task 1793 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_package)
NOTE: recipe bison-3.7.4-r0: task do_package: Started
NOTE: recipe bison-3.7.4-r0: task do_populate_sysroot: Started
NOTE: recipe findutils-4.7.0-r0: task do_package: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package: Succeeded
NOTE: Running task 1794 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_packagedata)
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata: Started
NOTE: recipe m4-1.4.18-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1795 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_install)
NOTE: recipe m4-1.4.18-r0: task do_install: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1796 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_package_write_rpm)
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm: Started
NOTE: recipe elfutils-0.182-r0: task do_package: Succeeded
NOTE: Running task 1797 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_packagedata)
NOTE: recipe elfutils-0.182-r0: task do_packagedata: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bison-3.7.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_install: Succeeded
NOTE: Running task 1798 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_install_ptest_base)
NOTE: recipe m4-1.4.18-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.182-r0: task do_packagedata: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1799 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package)
NOTE: recipe findutils-4.7.0-r0: task do_package: Succeeded
NOTE: Running task 1800 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_packagedata)
NOTE: recipe m4-1.4.18-r0: task do_package: Started
NOTE: recipe findutils-4.7.0-r0: task do_packagedata: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm: Succeeded
NOTE: recipe bison-3.7.4-r0: task do_package: Succeeded
NOTE: Running task 1801 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_packagedata)
NOTE: recipe bison-3.7.4-r0: task do_packagedata: Started
NOTE: recipe findutils-4.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1802 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_package_write_rpm)
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe bison-3.7.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1803 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_package_write_rpm)
NOTE: recipe bison-3.7.4-r0: task do_package_write_rpm: Started
NOTE: recipe ncurses-6.2-r0: task do_install: Succeeded
NOTE: Running task 1804 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot)
NOTE: Running task 1805 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package)
NOTE: recipe ncurses-6.2-r0: task do_package: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bison-3.7.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_configure: Succeeded
NOTE: Running task 1806 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_compile)
NOTE: recipe libx11-1_1.6.12-r0: task do_compile: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1807 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1808 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe readline-8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe readline-8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1809 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_configure)
NOTE: recipe bash-5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1810 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_configure)
NOTE: recipe readline-8.0-r0: task do_configure: Started
NOTE: recipe bash-5.0-r0: task do_configure: Started
NOTE: recipe m4-1.4.18-r0: task do_package: Succeeded
NOTE: Running task 1811 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata)
NOTE: recipe m4-1.4.18-r0: task do_packagedata: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_package: Succeeded
NOTE: Running task 1812 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata)
NOTE: recipe ncurses-6.2-r0: task do_packagedata: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1813 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm)
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_compile: Succeeded
NOTE: Running task 1814 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_install)
NOTE: recipe libx11-1_1.6.12-r0: task do_install: Started
NOTE: recipe flex-2.6.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1815 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_install)
NOTE: recipe flex-2.6.4-r0: task do_install: Started
NOTE: recipe grep-3.6-r0: task do_configure: Succeeded
NOTE: Running task 1816 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_compile)
NOTE: recipe grep-3.6-r0: task do_compile: Started
NOTE: recipe flex-2.6.4-r0: task do_install: Succeeded
NOTE: Running task 1817 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_install_ptest_base)
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_install_ptest_base: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_install: Succeeded
NOTE: Running task 1818 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_populate_sysroot)
NOTE: Running task 1819 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_package)
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_package: Started
NOTE: recipe flex-2.6.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1820 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot)
NOTE: Running task 1821 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package)
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot: Started
NOTE: recipe flex-2.6.4-r0: task do_package: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1822 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1823 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.35.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpam-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.35-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe readline-8.0-r0: task do_configure: Succeeded
NOTE: Running task 1824 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_compile)
NOTE: recipe readline-8.0-r0: task do_compile: Started
NOTE: recipe binutils-2.35-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1825 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.35.bb:do_configure)
NOTE: recipe binutils-2.35-r0: task do_configure: Started
NOTE: recipe libpam-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1826 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_configure)
NOTE: recipe libpam-1.3.1-r0: task do_configure: Started
NOTE: recipe readline-8.0-r0: task do_compile: Succeeded
NOTE: Running task 1827 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_install)
NOTE: recipe readline-8.0-r0: task do_install: Started
NOTE: recipe grep-3.6-r0: task do_compile: Succeeded
NOTE: Running task 1828 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_install)
NOTE: recipe grep-3.6-r0: task do_install: Started
NOTE: recipe readline-8.0-r0: task do_install: Succeeded
NOTE: Running task 1829 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_populate_sysroot)
NOTE: Running task 1830 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_package)
NOTE: recipe readline-8.0-r0: task do_populate_sysroot: Started
NOTE: recipe readline-8.0-r0: task do_package: Started
NOTE: recipe readline-8.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1831 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1832 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1833 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gawk-5.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe socat-1.7.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gawk-5.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1834 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_configure)
NOTE: recipe grep-3.6-r0: task do_install: Succeeded
NOTE: Running task 1835 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package)
NOTE: recipe socat-1.7.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1836 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_configure)
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1837 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure)
NOTE: recipe gawk-5.1.0-r0: task do_configure: Started
NOTE: recipe grep-3.6-r0: task do_package: Started
NOTE: recipe bc-1.07.1-r0: task do_configure: Started
NOTE: recipe socat-1.7.3.4-r0: task do_configure: Started
NOTE: recipe binutils-2.35-r0: task do_configure: Succeeded
NOTE: Running task 1838 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.35.bb:do_compile)
NOTE: recipe binutils-2.35-r0: task do_compile: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_package: Succeeded
NOTE: Running task 1839 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_packagedata)
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata: Started
NOTE: recipe readline-8.0-r0: task do_package: Succeeded
NOTE: Running task 1840 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_packagedata)
NOTE: recipe readline-8.0-r0: task do_packagedata: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata: Succeeded
NOTE: Running task 1841 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_package_write_rpm)
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm: Started
NOTE: recipe readline-8.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1842 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_package_write_rpm)
NOTE: recipe readline-8.0-r0: task do_package_write_rpm: Started
NOTE: recipe grep-3.6-r0: task do_package: Succeeded
NOTE: Running task 1843 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata)
NOTE: recipe grep-3.6-r0: task do_packagedata: Started
NOTE: recipe readline-8.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_package: Succeeded
NOTE: Running task 1844 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata)
NOTE: recipe flex-2.6.4-r0: task do_packagedata: Started
NOTE: recipe grep-3.6-r0: task do_packagedata: Succeeded
NOTE: Running task 1845 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm)
NOTE: recipe grep-3.6-r0: task do_package_write_rpm: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata: Succeeded
NOTE: recipe glibc-locale-2.32-r0: task do_package: Succeeded
NOTE: Running task 1846 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.32.bb:do_packagedata)
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glibc-locale-2.32-r0: task do_packagedata: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_compile: Succeeded
NOTE: Running task 1847 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_shared_workdir)
NOTE: Running task 1848 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_kernel_link_images)
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_shared_workdir: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_kernel_link_images: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_kernel_link_images: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_shared_workdir: Succeeded
NOTE: Running task 1849 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_compile_kernelmodules)
NOTE: recipe bc-1.07.1-r0: task do_configure: Succeeded
NOTE: Running task 1850 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile)
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_compile_kernelmodules: Started
NOTE: recipe bc-1.07.1-r0: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_compile: Succeeded
NOTE: Running task 1851 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_install: Succeeded
NOTE: Running task 1852 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package)
NOTE: recipe bc-1.07.1-r0: task do_package: Started
NOTE: recipe bc-1.07.1-r0: task do_package: Succeeded
NOTE: Running task 1853 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1854 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Started
NOTE: recipe bash-5.0-r0: task do_configure: Succeeded
NOTE: Running task 1855 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_configure_ptest_base)
NOTE: recipe bash-5.0-r0: task do_configure_ptest_base: Started
NOTE: recipe bash-5.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1856 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_compile)
NOTE: recipe bash-5.0-r0: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bash-5.0-r0: task do_compile: Succeeded
NOTE: Running task 1857 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_compile_ptest_base)
NOTE: recipe bash-5.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libpam-1.3.1-r0: task do_configure: Succeeded
NOTE: Running task 1858 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_compile)
NOTE: recipe libpam-1.3.1-r0: task do_compile: Started
NOTE: recipe bash-5.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1859 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_install)
NOTE: recipe bash-5.0-r0: task do_install: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_compile_kernelmodules: Succeeded
NOTE: Running task 1860 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_strip)
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_strip: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_strip: Succeeded
NOTE: Running task 1861 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_sizecheck)
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_sizecheck: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_sizecheck: Succeeded
NOTE: Running task 1862 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_install)
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_install: Started
NOTE: recipe perl-5.32.0-r0: task do_configure: Succeeded
NOTE: Running task 1863 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_configure_ptest_base)
NOTE: recipe perl-5.32.0-r0: task do_configure_ptest_base: Started
NOTE: recipe perl-5.32.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1864 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_compile)
NOTE: recipe perl-5.32.0-r0: task do_compile: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_install: Succeeded
NOTE: Running task 1865 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_package)
NOTE: Running task 1866 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_bundle_initramfs)
NOTE: Running task 1867 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_populate_sysroot)
NOTE: recipe bash-5.0-r0: task do_install: Succeeded
NOTE: Running task 1868 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_install_ptest_base)
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_package: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_bundle_initramfs: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_populate_sysroot: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_bundle_initramfs: Succeeded
NOTE: recipe bash-5.0-r0: task do_install_ptest_base: Started
NOTE: recipe gawk-5.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1869 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_configure_ptest_base)
NOTE: recipe gawk-5.1.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gawk-5.1.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1870 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_compile)
NOTE: recipe gawk-5.1.0-r0: task do_compile: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_populate_sysroot: Succeeded
NOTE: recipe socat-1.7.3.4-r0: task do_configure: Succeeded
NOTE: Running task 1871 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_compile)
NOTE: recipe socat-1.7.3.4-r0: task do_compile: Started
NOTE: recipe glibc-locale-2.32-r0: task do_packagedata: Succeeded
NOTE: Running task 1872 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.32.bb:do_package_write_rpm)
NOTE: recipe glibc-locale-2.32-r0: task do_package_write_rpm: Started
NOTE: recipe socat-1.7.3.4-r0: task do_compile: Succeeded
NOTE: Running task 1873 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_install)
NOTE: recipe socat-1.7.3.4-r0: task do_install: Started
NOTE: recipe socat-1.7.3.4-r0: task do_install: Succeeded
NOTE: Running task 1874 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_package)
NOTE: recipe socat-1.7.3.4-r0: task do_package: Started
NOTE: recipe bash-5.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1875 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_package)
NOTE: recipe bash-5.0-r0: task do_package: Started
NOTE: recipe socat-1.7.3.4-r0: task do_package: Succeeded
NOTE: Running task 1876 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_packagedata)
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata: Started
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1877 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_package_write_rpm)
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm: Started
NOTE: recipe gawk-5.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1878 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_compile_ptest_base)
NOTE: recipe gawk-5.1.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gawk-5.1.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1879 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_install)
NOTE: recipe gawk-5.1.0-r0: task do_install: Started
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpam-1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 1880 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_install)
NOTE: recipe libpam-1.3.1-r0: task do_install: Started
NOTE: recipe gawk-5.1.0-r0: task do_install: Succeeded
NOTE: Running task 1881 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_install_ptest_base)
NOTE: recipe gawk-5.1.0-r0: task do_install_ptest_base: Started
NOTE: recipe bash-5.0-r0: task do_package: Succeeded
NOTE: Running task 1882 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_packagedata)
NOTE: recipe bash-5.0-r0: task do_packagedata: Started
NOTE: recipe bash-5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1883 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm)
NOTE: Running task 1884 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm)
NOTE: Running task 1885 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm)
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Started
NOTE: recipe gawk-5.1.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1886 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package)
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpam-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 1887 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_populate_sysroot)
NOTE: Running task 1888 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_package)
NOTE: recipe libpam-1.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libpam-1.3.1-r0: task do_package: Started
NOTE: recipe libpam-1.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1889 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1890 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1891 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1892 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-2.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kbd-2.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-2.36-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1893 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_configure)
NOTE: recipe kbd-2.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1894 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.3.0.bb:do_configure)
NOTE: recipe shadow-4.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1895 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_configure)
NOTE: recipe libcap-2.45-r0: task do_configure: Started
NOTE: recipe shadow-4.8.1-r0: task do_configure: Started
NOTE: recipe kbd-2.3.0-r0: task do_configure: Started
NOTE: recipe libcap-2.45-r0: task do_configure: Succeeded
NOTE: Running task 1896 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_compile)
NOTE: recipe util-linux-2.36-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1897 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_configure)
NOTE: recipe libcap-2.45-r0: task do_compile: Started
NOTE: recipe util-linux-2.36-r0: task do_configure: Started
NOTE: recipe gawk-5.1.0-r0: task do_package: Succeeded
NOTE: Running task 1898 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata)
NOTE: recipe gawk-5.1.0-r0: task do_packagedata: Started
NOTE: recipe gawk-5.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1899 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm)
NOTE: Running task 1900 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm)
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_package: Succeeded
NOTE: Running task 1901 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_packagedata)
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_packagedata: Started
NOTE: recipe libcap-2.45-r0: task do_compile: Succeeded
NOTE: Running task 1902 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_install)
NOTE: recipe libcap-2.45-r0: task do_install: Started
NOTE: recipe libcap-2.45-r0: task do_install: Succeeded
NOTE: Running task 1903 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_populate_sysroot)
NOTE: recipe libcap-2.45-r0: task do_populate_sysroot: Started
NOTE: recipe libcap-2.45-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1904 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1905 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe iproute2-5.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-8.32-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iproute2-5.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1906 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_configure)
NOTE: recipe coreutils-8.32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1907 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_configure)
NOTE: recipe iproute2-5.9.0-r0: task do_configure: Started
NOTE: recipe coreutils-8.32-r0: task do_configure: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe iproute2-5.9.0-r0: task do_configure: Succeeded
NOTE: Running task 1908 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_compile)
NOTE: recipe iproute2-5.9.0-r0: task do_compile: Started
NOTE: recipe libpam-1.3.1-r0: task do_package: Succeeded
NOTE: Running task 1909 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_packagedata)
NOTE: recipe libpam-1.3.1-r0: task do_packagedata: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_packagedata: Succeeded
NOTE: Running task 1910 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_package_write_rpm)
NOTE: Running task 1911 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy)
NOTE: Running task 1912 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_package_write_rpm)
NOTE: recipe iptables-1.8.6-r0: task do_package_write_rpm: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_package_write_rpm: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpam-1.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1913 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_package)
NOTE: recipe libcap-2.45-r0: task do_package: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy: Succeeded
NOTE: recipe iptables-1.8.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libcap-2.45-r0: task do_package: Succeeded
NOTE: Running task 1914 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_packagedata)
NOTE: recipe libcap-2.45-r0: task do_packagedata: Started
NOTE: recipe libcap-2.45-r0: task do_packagedata: Succeeded
NOTE: Running task 1915 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_package_write_rpm)
NOTE: recipe libcap-2.45-r0: task do_package_write_rpm: Started
NOTE: recipe libcap-2.45-r0: task do_package_write_rpm: Succeeded
NOTE: recipe iproute2-5.9.0-r0: task do_compile: Succeeded
NOTE: Running task 1916 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_install)
NOTE: recipe iproute2-5.9.0-r0: task do_install: Started
NOTE: recipe iproute2-5.9.0-r0: task do_install: Succeeded
NOTE: Running task 1917 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_package)
NOTE: recipe iproute2-5.9.0-r0: task do_package: Started
NOTE: recipe kbd-2.3.0-r0: task do_configure: Succeeded
NOTE: Running task 1918 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.3.0.bb:do_compile)
NOTE: recipe kbd-2.3.0-r0: task do_compile: Started
NOTE: recipe iproute2-5.9.0-r0: task do_package: Succeeded
NOTE: Running task 1919 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_packagedata)
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata: Started
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1920 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_package_write_rpm)
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm: Started
NOTE: recipe kbd-2.3.0-r0: task do_compile: Succeeded
NOTE: Running task 1921 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.3.0.bb:do_install)
NOTE: recipe kbd-2.3.0-r0: task do_install: Started
NOTE: recipe shadow-4.8.1-r0: task do_configure: Succeeded
NOTE: Running task 1922 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_compile)
NOTE: recipe shadow-4.8.1-r0: task do_compile: Started
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_compile: Succeeded
NOTE: Running task 1923 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_install)
NOTE: recipe shadow-4.8.1-r0: task do_install: Started
NOTE: recipe kbd-2.3.0-r0: task do_install: Succeeded
NOTE: Running task 1924 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.3.0.bb:do_package)
NOTE: recipe kbd-2.3.0-r0: task do_package: Started
NOTE: recipe shadow-4.8.1-r0: task do_install: Succeeded
NOTE: Running task 1925 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot)
NOTE: Running task 1926 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package)
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe shadow-4.8.1-r0: task do_package: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_package_write_rpm: Succeeded
NOTE: recipe kbd-2.3.0-r0: task do_package: Succeeded
NOTE: Running task 1927 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.3.0.bb:do_packagedata)
NOTE: recipe kbd-2.3.0-r0: task do_packagedata: Started
NOTE: recipe kbd-2.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1928 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.3.0.bb:do_package_write_rpm)
NOTE: recipe kbd-2.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.36-r0: task do_configure: Succeeded
NOTE: Running task 1929 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_configure_ptest_base)
NOTE: recipe shadow-4.8.1-r0: task do_package: Succeeded
NOTE: Running task 1930 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata)
NOTE: recipe util-linux-2.36-r0: task do_configure_ptest_base: Started
NOTE: recipe util-linux-2.36-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1931 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_compile)
NOTE: recipe shadow-4.8.1-r0: task do_packagedata: Started
NOTE: recipe util-linux-2.36-r0: task do_compile: Started
NOTE: recipe binutils-2.35-r0: task do_compile: Succeeded
NOTE: Running task 1932 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.35.bb:do_install)
NOTE: recipe binutils-2.35-r0: task do_install: Started
NOTE: recipe kbd-2.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_packagedata: Succeeded
NOTE: recipe binutils-2.35-r0: task do_install: Succeeded
NOTE: Running task 1933 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.35.bb:do_package)
NOTE: recipe binutils-2.35-r0: task do_package: Started
NOTE: recipe util-linux-2.36-r0: task do_compile: Succeeded
NOTE: Running task 1934 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_compile_ptest_base)
NOTE: recipe util-linux-2.36-r0: task do_compile_ptest_base: Started
NOTE: recipe binutils-2.35-r0: task do_package: Succeeded
NOTE: Running task 1935 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.35.bb:do_packagedata)
NOTE: recipe binutils-2.35-r0: task do_packagedata: Started
NOTE: recipe glibc-locale-2.32-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.35-r0: task do_packagedata: Succeeded
NOTE: Running task 1936 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.35.bb:do_package_write_rpm)
NOTE: recipe binutils-2.35-r0: task do_package_write_rpm: Started
NOTE: recipe perl-5.32.0-r0: task do_compile: Succeeded
NOTE: Running task 1937 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_compile_ptest_base)
NOTE: recipe perl-5.32.0-r0: task do_compile_ptest_base: Started
NOTE: recipe perl-5.32.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1938 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_install)
NOTE: recipe perl-5.32.0-r0: task do_install: Started
NOTE: recipe util-linux-2.36-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1939 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_install)
NOTE: recipe util-linux-2.36-r0: task do_install: Started
NOTE: recipe util-linux-2.36-r0: task do_install: Succeeded
NOTE: Running task 1940 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_install_ptest_base)
NOTE: recipe util-linux-2.36-r0: task do_install_ptest_base: Started
NOTE: recipe binutils-2.35-r0: task do_package_write_rpm: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1941 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_populate_sysroot)
NOTE: Running task 1942 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_package)
NOTE: recipe util-linux-2.36-r0: task do_populate_sysroot: Started
NOTE: recipe util-linux-2.36-r0: task do_package: Started
NOTE: recipe util-linux-2.36-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1943 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1944 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe e2fsprogs-1.45.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1945 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_configure)
NOTE: recipe e2fsprogs-1.45.6-r0: task do_configure: Started
NOTE: recipe python3-3.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1946 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_configure)
NOTE: recipe python3-3.9.0-r0: task do_configure: Started
NOTE: recipe coreutils-8.32-r0: task do_configure: Succeeded
NOTE: Running task 1947 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_configure_ptest_base)
NOTE: recipe coreutils-8.32-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-8.32-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1948 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_compile)
NOTE: recipe coreutils-8.32-r0: task do_compile: Started
NOTE: recipe util-linux-2.36-r0: task do_package: Succeeded
NOTE: Running task 1949 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_packagedata)
NOTE: recipe util-linux-2.36-r0: task do_packagedata: Started
NOTE: recipe util-linux-2.36-r0: task do_packagedata: Succeeded
NOTE: Running task 1950 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_configure: Succeeded
NOTE: Running task 1951 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.45.6-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1952 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_compile)
NOTE: recipe e2fsprogs-1.45.6-r0: task do_compile: Started
NOTE: recipe coreutils-8.32-r0: task do_compile: Succeeded
NOTE: Running task 1953 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_compile_ptest_base)
NOTE: recipe coreutils-8.32-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-8.32-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1954 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_install)
NOTE: recipe coreutils-8.32-r0: task do_install: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_install: Succeeded
NOTE: Running task 1955 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_install_ptest_base)
NOTE: recipe coreutils-8.32-r0: task do_install_ptest_base: Started
NOTE: recipe coreutils-8.32-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1956 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package)
NOTE: recipe coreutils-8.32-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_compile: Succeeded
NOTE: Running task 1957 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_compile_ptest_base)
NOTE: recipe e2fsprogs-1.45.6-r0: task do_compile_ptest_base: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1958 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_install)
NOTE: recipe e2fsprogs-1.45.6-r0: task do_install: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_install: Succeeded
NOTE: Running task 1959 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_install_ptest_base)
NOTE: recipe e2fsprogs-1.45.6-r0: task do_install_ptest_base: Started
NOTE: recipe perl-5.32.0-r0: task do_install: Succeeded
NOTE: Running task 1960 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_install_ptest_base)
NOTE: recipe perl-5.32.0-r0: task do_install_ptest_base: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1961 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_package)
NOTE: Running task 1962 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_populate_sysroot)
NOTE: recipe e2fsprogs-1.45.6-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_package: Succeeded
NOTE: Running task 1963 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata)
NOTE: recipe coreutils-8.32-r0: task do_packagedata: Started
NOTE: recipe perl-5.32.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1964 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_populate_sysroot)
NOTE: Running task 1965 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_package)
NOTE: recipe perl-5.32.0-r0: task do_populate_sysroot: Started
NOTE: recipe perl-5.32.0-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package: Succeeded
NOTE: Running task 1966 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata: Succeeded
NOTE: Running task 1967 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_package_write_rpm)
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata: Succeeded
NOTE: Running task 1968 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm)
NOTE: Running task 1969 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm)
NOTE: Running task 1970 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_package_write_rpm)
NOTE: recipe elfutils-0.182-r0: task do_package_write_rpm: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm: Started
NOTE: recipe libpam-1.3.1-r0: task do_package_write_rpm: Started
NOTE: recipe perl-5.32.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1971 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_prepare_recipe_sysroot)
NOTE: recipe liberror-perl-0.17029-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1972 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure)
NOTE: recipe liberror-perl-0.17029-r0: task do_configure: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_configure: Succeeded
NOTE: Running task 1973 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure_ptest_base)
NOTE: recipe liberror-perl-0.17029-r0: task do_configure_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1974 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile)
NOTE: recipe liberror-perl-0.17029-r0: task do_compile: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_compile: Succeeded
NOTE: Running task 1975 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile_ptest_base)
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_compile_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1976 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install)
NOTE: recipe liberror-perl-0.17029-r0: task do_install: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_install: Succeeded
NOTE: Running task 1977 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_base)
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1978 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_perl)
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_perl: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_install_ptest_perl: Succeeded
NOTE: recipe libpam-1.3.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_configure: Succeeded
NOTE: Running task 1979 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_configure_ptest_base)
NOTE: recipe python3-3.9.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-3.9.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1980 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_compile)
NOTE: recipe python3-3.9.0-r0: task do_compile: Started
NOTE: recipe elfutils-0.182-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_compile: Succeeded
NOTE: Running task 1981 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_compile_ptest_base)
NOTE: recipe python3-3.9.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-3.9.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1982 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_install)
NOTE: recipe python3-3.9.0-r0: task do_install: Started
NOTE: recipe perl-5.32.0-r0: task do_package: Succeeded
NOTE: Running task 1983 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_packagedata)
NOTE: recipe perl-5.32.0-r0: task do_packagedata: Started
NOTE: recipe python3-3.9.0-r0: task do_install: Succeeded
NOTE: Running task 1984 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_install_ptest_base)
NOTE: recipe python3-3.9.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-3.9.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1985 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_populate_sysroot)
NOTE: Running task 1986 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_package)
NOTE: recipe python3-3.9.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-3.9.0-r0: task do_package: Started
NOTE: recipe python3-3.9.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1987 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe perl-5.32.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1988 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package)
NOTE: Running task 1989 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb:do_package_write_rpm)
NOTE: Running task 1990 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_package_write_rpm)
NOTE: Running task 1991 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm)
NOTE: Running task 1992 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm)
NOTE: Running task 1993 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_package_write_rpm)
NOTE: Running task 1994 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm)
NOTE: recipe libxml2-2.9.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1995 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_package_write_rpm)
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Started
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm: Started
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm: Started
NOTE: recipe openssl-1.1.1h-r0: task do_package_write_rpm: Started
NOTE: recipe bash-5.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxml2-2.9.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1996 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_configure)
NOTE: recipe libxml2-2.9.10-r0: task do_configure: Started
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Succeeded
NOTE: Running task 1997 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata)
NOTE: recipe sed-4.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata: Succeeded
NOTE: Running task 1998 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm)
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm: Started
NOTE: recipe bash-5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_configure: Succeeded
NOTE: Running task 1999 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_configure_ptest_base)
NOTE: recipe libxml2-2.9.10-r0: task do_configure_ptest_base: Started
NOTE: recipe libxml2-2.9.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2000 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_compile)
NOTE: recipe libxml2-2.9.10-r0: task do_compile: Started
NOTE: recipe openssl-1.1.1h-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_package: Succeeded
NOTE: Running task 2001 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_packagedata)
NOTE: recipe python3-3.9.0-r0: task do_packagedata: Started
NOTE: recipe python3-3.9.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2002 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_package_write_rpm)
NOTE: Running task 2003 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm)
NOTE: Running task 2004 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm)
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm: Started
NOTE: recipe python3-3.9.0-r0: task do_package_write_rpm: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_compile: Succeeded
NOTE: Running task 2005 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_compile_ptest_base)
NOTE: recipe libxml2-2.9.10-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm: Succeeded
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2006 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_install)
NOTE: recipe libxml2-2.9.10-r0: task do_install: Started
NOTE: recipe libxml2-2.9.10-r0: task do_install: Succeeded
NOTE: Running task 2007 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_install_ptest_base)
NOTE: recipe libxml2-2.9.10-r0: task do_install_ptest_base: Started
NOTE: recipe libxml2-2.9.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2008 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot)
NOTE: Running task 2009 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package)
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package: Started
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2010 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe wayland-1.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-1.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2011 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_configure)
NOTE: recipe wayland-1.18.0-r0: task do_configure: Started
NOTE: recipe wayland-1.18.0-r0: task do_configure: Succeeded
NOTE: Running task 2012 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_configure_ptest_base)
NOTE: recipe wayland-1.18.0-r0: task do_configure_ptest_base: Started
NOTE: recipe wayland-1.18.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2013 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_compile)
NOTE: recipe wayland-1.18.0-r0: task do_compile: Started
NOTE: recipe wayland-1.18.0-r0: task do_compile: Succeeded
NOTE: Running task 2014 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_compile_ptest_base)
NOTE: recipe wayland-1.18.0-r0: task do_compile_ptest_base: Started
NOTE: recipe wayland-1.18.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2015 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_install)
NOTE: recipe wayland-1.18.0-r0: task do_install: Started
NOTE: recipe wayland-1.18.0-r0: task do_install: Succeeded
NOTE: Running task 2016 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_install_ptest_base)
NOTE: recipe wayland-1.18.0-r0: task do_install_ptest_base: Started
NOTE: recipe wayland-1.18.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2017 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_populate_sysroot)
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot: Started
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2018 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2019 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_configure)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_configure: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_configure: Succeeded
NOTE: Running task 2020 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_compile)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_compile: Succeeded
NOTE: Running task 2021 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_install)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_install: Succeeded
NOTE: Running task 2022 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_populate_sysroot)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2023 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-1_246.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-1_246.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2024 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_configure)
NOTE: recipe systemd-1_246.6-r0: task do_configure: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package: Succeeded
NOTE: Running task 2025 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata)
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2026 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_package)
NOTE: Running task 2027 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm)
NOTE: recipe wayland-1.18.0-r0: task do_package: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm: Started
NOTE: recipe wayland-1.18.0-r0: task do_package: Succeeded
NOTE: Running task 2028 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_packagedata)
NOTE: recipe wayland-1.18.0-r0: task do_packagedata: Started
NOTE: recipe wayland-1.18.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2029 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package)
NOTE: Running task 2030 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_package_write_rpm)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package: Started
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm: Started
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package: Succeeded
NOTE: Running task 2031 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2032 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package_write_rpm)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe systemd-1_246.6-r0: task do_configure: Succeeded
NOTE: Running task 2033 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_compile)
NOTE: recipe systemd-1_246.6-r0: task do_compile: Started
NOTE: recipe systemd-1_246.6-r0: task do_compile: Succeeded
NOTE: Running task 2034 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_install)
NOTE: recipe systemd-1_246.6-r0: task do_install: Started
NOTE: recipe systemd-1_246.6-r0: task do_install: Succeeded
NOTE: Running task 2035 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_populate_sysroot)
NOTE: Running task 2036 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_package)
NOTE: recipe systemd-1_246.6-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-1_246.6-r0: task do_package: Started
NOTE: recipe systemd-1_246.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2037 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2038 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/dhcpcd/dhcpcd_9.3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2039 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2040 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-1.12.20-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dhcpcd-9.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe procps-3.3.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe procps-3.3.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2041 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_configure)
NOTE: recipe dhcpcd-9.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2042 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/dhcpcd/dhcpcd_9.3.4.bb:do_configure)
NOTE: Running task 2043 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_configure)
NOTE: recipe procps-3.3.16-r0: task do_configure: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2044 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_configure)
NOTE: recipe dhcpcd-9.3.4-r0: task do_configure: Started
NOTE: recipe dbus-1.12.20-r0: task do_configure: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_configure: Started
NOTE: recipe dhcpcd-9.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2045 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/dhcpcd/dhcpcd_9.3.4.bb:do_compile)
NOTE: recipe dhcpcd-9.3.4-r0: task do_compile: Started
ERROR: dhcpcd-9.3.4-r0 do_compile: oe_runmake failed
ERROR: dhcpcd-9.3.4-r0 do_compile: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/temp/run.do_compile.4403' failed with exit code 1:
for x in src hooks; do cd $x; make all || exit $?; cd ..; done
make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/dhcpcd-9.3.4/src'
powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D_G
 NU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c common.c -o common.o
powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D_G
 NU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c control.c -o control.o
powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D_G
 NU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c dhcpcd.c -o dhcpcd.o
powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D_G
 NU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c duid.c -o duid.o
powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D_G
 NU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c eloop.c -o eloop.o
powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D_G
 NU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c logerr.c -o logerr.o
powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D_G
 NU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c if.c -o if.o
/bin/sh  genembedh dhcpcd-definitions.conf dhcpcd-definitions-small.conf dhcpcd-embedded.h.in > dhcpcd-embedded.h
powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D_G
 NU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c sa.c -o sa.o
powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D_G
 NU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c route.c -o route.o
powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D_G
 NU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c dhcp-common.c -o dhcp-common.o
powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D_G
 NU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c script.c -o script.o
powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D_G
 NU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c auth.c -o auth.o
powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D_G
 NU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c if-linux.c -o if-linux.o
powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D_G
 NU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c dhcp.c -o dhcp.o
powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D_G
 NU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c ipv4.c -o ipv4.o
powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D_G
 NU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c bpf.c -o bpf.o
powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D_G
 NU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c arp.c -o arp.o
powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D_G
 NU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c ipv4ll.c -o ipv4ll.o
powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D_G
 NU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c ipv6.c -o ipv6.o
powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D_G
 NU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c ipv6nd.c -o ipv6nd.o
powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D_G
 NU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c dhcp6.c -o dhcp6.o
/bin/sh  genembedc dhcpcd-definitions.conf dhcpcd-definitions-small.conf dhcpcd-embedded.c.in > dhcpcd-embedded.c
powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D_G
 NU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c dev.c -o dev.o
powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D_G
 NU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c privsep.c -o privsep.o
powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D_G
 NU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c privsep-root.c -o privsep-root.o
powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D_G
 NU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c privsep-control.c -o privsep-control.o
powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D_G
 NU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c privsep-inet.c -o privsep-inet.o
powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D_G
 NU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c privsep-bpf.c -o privsep-bpf.o
powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D_G
 NU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c privsep-linux.c -o privsep-linux.o
powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D_G
 NU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c ../compat/crypt/hmac.c -o ../compat/crypt/hmac.o
powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D_G
 NU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c ../compat/crypt/md5.c -o ../compat/crypt/md5.o
powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D_G
 NU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c ../compat/crypt/sha256.c -o ../compat/crypt/sha256.o
powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D_G
 NU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c ../compat/arc4random.c -o ../compat/arc4random.o
powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D_G
 NU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c ../compat/arc4random_uniform.c -o ../compat/arc4random_uniform.o
powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D_G
 NU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c ../compat/pidfile.c -o ../compat/pidfile.o
powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D_G
 NU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c ../compat/setproctitle.c -o ../compat/setproctitle.o
powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D_G
 NU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c ../compat/strlcpy.c -o ../compat/strlcpy.o
powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D_G
 NU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c ../compat/strtoi.c -o ../compat/strtoi.o
powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D_G
 NU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c ../compat/strtou.c -o ../compat/strtou.o
powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D_G
 NU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c ../compat/rb.c -o ../compat/rb.o
sed -e 's:@RUNDIR@:/run/dhcpcd:g' -e 's:@DBDIR@:/var/lib/dhcpcd:g' -e 's:@LIBDIR@:/usr/lib:g' -e 's:@HOOKDIR@:/usr/libexec/dhcpcd-hooks:g' \
	-e 's:@SYSCONFDIR@:/etc:g' -e 's:@SCRIPT@:/usr/libexec/dhcpcd-run-hooks:g' -e 's:@DATADIR@:/usr/share:g' \
	-e 's:@SERVICEEXISTS@::g' -e 's:@SERVICECMD@::g' -e 's:@SERVICESTATUS@::g' \
	-e 's:@STATUSARG@::g' \
	dhcpcd.conf.5.in > dhcpcd.conf.5
sed -e 's:@RUNDIR@:/run/dhcpcd:g' -e 's:@DBDIR@:/var/lib/dhcpcd:g' -e 's:@LIBDIR@:/usr/lib:g' -e 's:@HOOKDIR@:/usr/libexec/dhcpcd-hooks:g' \
	-e 's:@SYSCONFDIR@:/etc:g' -e 's:@SCRIPT@:/usr/libexec/dhcpcd-run-hooks:g' -e 's:@DATADIR@:/usr/share:g' \
	-e 's:@SERVICEEXISTS@::g' -e 's:@SERVICECMD@::g' -e 's:@SERVICESTATUS@::g' \
	-e 's:@STATUSARG@::g' \
	dhcpcd.8.in > dhcpcd.8
powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D_G
 NU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c dhcpcd-embedded.c -o dhcpcd-embedded.o
powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D_G
 NU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c if-options.c -o if-options.o
bpf.c: In function 'bpf_bootp':
bpf.c:708:2: warning: #warning A compromised PF_PACKET socket can be used as a raw socket [-Wcpp]
  708 | #warning A compromised PF_PACKET socket can be used as a raw socket
      |  ^~~~~~~
In file included from privsep-linux.c:34:
privsep-linux.c:261:35: error: invalid application of 'sizeof' to incomplete type 'struct termios'
  261 |  SECCOMP_ALLOW_ARG(__NR_ioctl, 1, TCGETS),
      |                                   ^~~~~~
privsep-linux.c:261:2: note: in expansion of macro 'SECCOMP_ALLOW_ARG'
  261 |  SECCOMP_ALLOW_ARG(__NR_ioctl, 1, TCGETS),
      |  ^~~~~~~~~~~~~~~~~
privsep-linux.c:261:35: error: invalid application of 'sizeof' to incomplete type 'struct termios'
  261 |  SECCOMP_ALLOW_ARG(__NR_ioctl, 1, TCGETS),
      |                                   ^~~~~~
privsep-linux.c:261:2: note: in expansion of macro 'SECCOMP_ALLOW_ARG'
  261 |  SECCOMP_ALLOW_ARG(__NR_ioctl, 1, TCGETS),
      |  ^~~~~~~~~~~~~~~~~
Makefile:55: recipe for target 'privsep-linux.o' failed
make[1]: *** [privsep-linux.o] Error 1
make[1]: *** Waiting for unfinished jobs....
make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/dhcpcd-9.3.4/src'
Makefile:24: recipe for target 'all' failed
make: *** [all] Error 2
WARNING: exit code 1 from a shell command.

ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/temp/log.do_compile.4403
Log data follows:
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-big', 'bit-32', 'powerpc-common', 'common-linux', 'common-glibc', 'powerpc32-linux', 'powerpc-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_compile
| NOTE: make -j 48
| for x in src hooks; do cd $x; make all || exit $?; cd ..; done
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/dhcpcd-9.3.4/src'
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c common.c -o common.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c control.c -o control.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c dhcpcd.c -o dhcpcd.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c duid.c -o duid.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c eloop.c -o eloop.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c logerr.c -o logerr.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c if.c -o if.o
| /bin/sh  genembedh dhcpcd-definitions.conf dhcpcd-definitions-small.conf dhcpcd-embedded.h.in > dhcpcd-embedded.h
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c sa.c -o sa.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c route.c -o route.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c dhcp-common.c -o dhcp-common.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c script.c -o script.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c auth.c -o auth.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c if-linux.c -o if-linux.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c dhcp.c -o dhcp.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c ipv4.c -o ipv4.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c bpf.c -o bpf.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c arp.c -o arp.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c ipv4ll.c -o ipv4ll.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c ipv6.c -o ipv6.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c ipv6nd.c -o ipv6nd.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c dhcp6.c -o dhcp6.o
| /bin/sh  genembedc dhcpcd-definitions.conf dhcpcd-definitions-small.conf dhcpcd-embedded.c.in > dhcpcd-embedded.c
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c dev.c -o dev.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c privsep.c -o privsep.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c privsep-root.c -o privsep-root.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c privsep-control.c -o privsep-control.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c privsep-inet.c -o privsep-inet.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c privsep-bpf.c -o privsep-bpf.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c privsep-linux.c -o privsep-linux.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c ../compat/crypt/hmac.c -o ../compat/crypt/hmac.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c ../compat/crypt/md5.c -o ../compat/crypt/md5.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c ../compat/crypt/sha256.c -o ../compat/crypt/sha256.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c ../compat/arc4random.c -o ../compat/arc4random.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c ../compat/arc4random_uniform.c -o ../compat/arc4random_uniform.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c ../compat/pidfile.c -o ../compat/pidfile.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c ../compat/setproctitle.c -o ../compat/setproctitle.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c ../compat/strlcpy.c -o ../compat/strlcpy.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c ../compat/strtoi.c -o ../compat/strtoi.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c ../compat/strtou.c -o ../compat/strtou.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c ../compat/rb.c -o ../compat/rb.o
| sed -e 's:@RUNDIR@:/run/dhcpcd:g' -e 's:@DBDIR@:/var/lib/dhcpcd:g' -e 's:@LIBDIR@:/usr/lib:g' -e 's:@HOOKDIR@:/usr/libexec/dhcpcd-hooks:g' \
| 	-e 's:@SYSCONFDIR@:/etc:g' -e 's:@SCRIPT@:/usr/libexec/dhcpcd-run-hooks:g' -e 's:@DATADIR@:/usr/share:g' \
| 	-e 's:@SERVICEEXISTS@::g' -e 's:@SERVICECMD@::g' -e 's:@SERVICESTATUS@::g' \
| 	-e 's:@STATUSARG@::g' \
| 	dhcpcd.conf.5.in > dhcpcd.conf.5
| sed -e 's:@RUNDIR@:/run/dhcpcd:g' -e 's:@DBDIR@:/var/lib/dhcpcd:g' -e 's:@LIBDIR@:/usr/lib:g' -e 's:@HOOKDIR@:/usr/libexec/dhcpcd-hooks:g' \
| 	-e 's:@SYSCONFDIR@:/etc:g' -e 's:@SCRIPT@:/usr/libexec/dhcpcd-run-hooks:g' -e 's:@DATADIR@:/usr/share:g' \
| 	-e 's:@SERVICEEXISTS@::g' -e 's:@SERVICECMD@::g' -e 's:@SERVICESTATUS@::g' \
| 	-e 's:@STATUSARG@::g' \
| 	dhcpcd.8.in > dhcpcd.8
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c dhcpcd-embedded.c -o dhcpcd-embedded.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c if-options.c -o if-options.o
| bpf.c: In function 'bpf_bootp':
| bpf.c:708:2: warning: #warning A compromised PF_PACKET socket can be used as a raw socket [-Wcpp]
|   708 | #warning A compromised PF_PACKET socket can be used as a raw socket
|       |  ^~~~~~~
| In file included from privsep-linux.c:34:
| privsep-linux.c:261:35: error: invalid application of 'sizeof' to incomplete type 'struct termios'
|   261 |  SECCOMP_ALLOW_ARG(__NR_ioctl, 1, TCGETS),
|       |                                   ^~~~~~
| privsep-linux.c:261:2: note: in expansion of macro 'SECCOMP_ALLOW_ARG'
|   261 |  SECCOMP_ALLOW_ARG(__NR_ioctl, 1, TCGETS),
|       |  ^~~~~~~~~~~~~~~~~
| privsep-linux.c:261:35: error: invalid application of 'sizeof' to incomplete type 'struct termios'
|   261 |  SECCOMP_ALLOW_ARG(__NR_ioctl, 1, TCGETS),
|       |                                   ^~~~~~
| privsep-linux.c:261:2: note: in expansion of macro 'SECCOMP_ALLOW_ARG'
|   261 |  SECCOMP_ALLOW_ARG(__NR_ioctl, 1, TCGETS),
|       |  ^~~~~~~~~~~~~~~~~
| Makefile:55: recipe for target 'privsep-linux.o' failed
| make[1]: *** [privsep-linux.o] Error 1
| make[1]: *** Waiting for unfinished jobs....
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/dhcpcd-9.3.4/src'
| Makefile:24: recipe for target 'all' failed
| make: *** [all] Error 2
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/temp/run.do_compile.4403' failed with exit code 1:
| for x in src hooks; do cd $x; make all || exit $?; cd ..; done
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/dhcpcd-9.3.4/src'
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c common.c -o common.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c control.c -o control.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c dhcpcd.c -o dhcpcd.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c duid.c -o duid.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c eloop.c -o eloop.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c logerr.c -o logerr.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c if.c -o if.o
| /bin/sh  genembedh dhcpcd-definitions.conf dhcpcd-definitions-small.conf dhcpcd-embedded.h.in > dhcpcd-embedded.h
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c sa.c -o sa.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c route.c -o route.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c dhcp-common.c -o dhcp-common.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c script.c -o script.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c auth.c -o auth.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c if-linux.c -o if-linux.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c dhcp.c -o dhcp.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c ipv4.c -o ipv4.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c bpf.c -o bpf.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c arp.c -o arp.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c ipv4ll.c -o ipv4ll.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c ipv6.c -o ipv6.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c ipv6nd.c -o ipv6nd.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c dhcp6.c -o dhcp6.o
| /bin/sh  genembedc dhcpcd-definitions.conf dhcpcd-definitions-small.conf dhcpcd-embedded.c.in > dhcpcd-embedded.c
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c dev.c -o dev.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c privsep.c -o privsep.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c privsep-root.c -o privsep-root.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c privsep-control.c -o privsep-control.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c privsep-inet.c -o privsep-inet.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c privsep-bpf.c -o privsep-bpf.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c privsep-linux.c -o privsep-linux.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c ../compat/crypt/hmac.c -o ../compat/crypt/hmac.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c ../compat/crypt/md5.c -o ../compat/crypt/md5.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c ../compat/crypt/sha256.c -o ../compat/crypt/sha256.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c ../compat/arc4random.c -o ../compat/arc4random.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c ../compat/arc4random_uniform.c -o ../compat/arc4random_uniform.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c ../compat/pidfile.c -o ../compat/pidfile.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c ../compat/setproctitle.c -o ../compat/setproctitle.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c ../compat/strlcpy.c -o ../compat/strlcpy.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c ../compat/strtoi.c -o ../compat/strtoi.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c ../compat/strtou.c -o ../compat/strtou.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c ../compat/rb.c -o ../compat/rb.o
| sed -e 's:@RUNDIR@:/run/dhcpcd:g' -e 's:@DBDIR@:/var/lib/dhcpcd:g' -e 's:@LIBDIR@:/usr/lib:g' -e 's:@HOOKDIR@:/usr/libexec/dhcpcd-hooks:g' \
| 	-e 's:@SYSCONFDIR@:/etc:g' -e 's:@SCRIPT@:/usr/libexec/dhcpcd-run-hooks:g' -e 's:@DATADIR@:/usr/share:g' \
| 	-e 's:@SERVICEEXISTS@::g' -e 's:@SERVICECMD@::g' -e 's:@SERVICESTATUS@::g' \
| 	-e 's:@STATUSARG@::g' \
| 	dhcpcd.conf.5.in > dhcpcd.conf.5
| sed -e 's:@RUNDIR@:/run/dhcpcd:g' -e 's:@DBDIR@:/var/lib/dhcpcd:g' -e 's:@LIBDIR@:/usr/lib:g' -e 's:@HOOKDIR@:/usr/libexec/dhcpcd-hooks:g' \
| 	-e 's:@SYSCONFDIR@:/etc:g' -e 's:@SCRIPT@:/usr/libexec/dhcpcd-run-hooks:g' -e 's:@DATADIR@:/usr/share:g' \
| 	-e 's:@SERVICEEXISTS@::g' -e 's:@SERVICECMD@::g' -e 's:@SERVICESTATUS@::g' \
| 	-e 's:@STATUSARG@::g' \
| 	dhcpcd.8.in > dhcpcd.8
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c dhcpcd-embedded.c -o dhcpcd-embedded.o
| powerpc-poky-linux-gcc  -mbig-endian -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong   -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0=/usr/src/debug/dhcpcd/9.3.4-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/recipe-sysroot-native=  -std=c99  -DHAVE_CONFIG_H -DNDEBUG -D
 _GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DINET -DARP -DARPING -DIPV4LL -DINET6 -DDHCP6 -DAUTH -DPRIVSEP -DPLUGIN_DEV -I.. -I../src -I./crypt -c if-options.c -o if-options.o
| bpf.c: In function 'bpf_bootp':
| bpf.c:708:2: warning: #warning A compromised PF_PACKET socket can be used as a raw socket [-Wcpp]
|   708 | #warning A compromised PF_PACKET socket can be used as a raw socket
|       |  ^~~~~~~
| In file included from privsep-linux.c:34:
| privsep-linux.c:261:35: error: invalid application of 'sizeof' to incomplete type 'struct termios'
|   261 |  SECCOMP_ALLOW_ARG(__NR_ioctl, 1, TCGETS),
|       |                                   ^~~~~~
| privsep-linux.c:261:2: note: in expansion of macro 'SECCOMP_ALLOW_ARG'
|   261 |  SECCOMP_ALLOW_ARG(__NR_ioctl, 1, TCGETS),
|       |  ^~~~~~~~~~~~~~~~~
| privsep-linux.c:261:35: error: invalid application of 'sizeof' to incomplete type 'struct termios'
|   261 |  SECCOMP_ALLOW_ARG(__NR_ioctl, 1, TCGETS),
|       |                                   ^~~~~~
| privsep-linux.c:261:2: note: in expansion of macro 'SECCOMP_ALLOW_ARG'
|   261 |  SECCOMP_ALLOW_ARG(__NR_ioctl, 1, TCGETS),
|       |  ^~~~~~~~~~~~~~~~~
| Makefile:55: recipe for target 'privsep-linux.o' failed
| make[1]: *** [privsep-linux.o] Error 1
| make[1]: *** Waiting for unfinished jobs....
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/dhcpcd/9.3.4-r0/dhcpcd-9.3.4/src'
| Makefile:24: recipe for target 'all' failed
| make: *** [all] Error 2
| WARNING: exit code 1 from a shell command.
| 
NOTE: recipe dhcpcd-9.3.4-r0: task do_compile: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/dhcpcd/dhcpcd_9.3.4.bb:do_compile) failed with exit code '1'
NOTE: recipe btrfs-tools-5.9-r0: task do_configure: Succeeded
NOTE: recipe systemd-1_246.6-r0: task do_package: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_configure: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2045 tasks of which 927 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/dhcpcd/dhcpcd_9.3.4.bb:do_compile
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--===============7597053022573867117==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-dhcpcd-upgrade-9.3.2-9.3.4.patch"

From 09a2d05ed6cea4a9f0e7d0adb9fcd621c7bec2a6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Tue, 15 Dec 2020 03:21:54 +0000
Subject: [PATCH] dhcpcd: upgrade 9.3.2 -> 9.3.4

---
 .../dhcpcd/{dhcpcd_9.3.2.bb => dhcpcd_9.3.4.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_9.3.2.bb => dhcpcd_9.3.4.bb} (95%)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.3.2.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.3.4.bb
similarity index 95%
rename from meta/recipes-connectivity/dhcpcd/dhcpcd_9.3.2.bb
rename to meta/recipes-connectivity/dhcpcd/dhcpcd_9.3.4.bb
index cca60ddae2..8bc0a95ed8 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.3.2.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.3.4.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz \
            file://dhcpcd@.service \
            "
 
-SRC_URI[sha256sum] = "6d49af5e766a2515e6366e4f669663df04ecdf90a1a60ddb1d7a2feb4b5d2566"
+SRC_URI[sha256sum] = "5c823a0b981b52e7e0fd3183ae220422d6fcc3aa511af31dcb1a7ee6cb0f1c39"
 
 inherit pkgconfig autotools-brokensep systemd useradd
 
-- 
2.17.1


--===============7597053022573867117==--
