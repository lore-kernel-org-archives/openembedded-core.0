Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.325.1615826520797362708
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 09:42:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 7579F38C125F
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 16:42:02 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vte: upgrading to 0.62.3 SUCCEEDED
Message-ID: <MADEUP.166C91A970C6C734.2480@lists.openembedded.org>
X-Groupsio-MsgNum: 149531
Content-Type: multipart/mixed; boundary="===============5630361657040904191=="

--===============5630361657040904191==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vte* to *0.62.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vte-upgrade-0.62.2-0.62.3.patch
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

--===============5630361657040904191==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 41 skipped, 0 masked, 0 errors.
Removing 131 recipes from the core2-32 sysroot...done.
Removing 135 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-4b19b559ce5589bd913ac023306bbff2dfe25d67"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4b19b559ce5589bd913ac023306bbff2dfe25d67"
workspace            = "master:eec64066073428e38d5b0b6947ff302943188f65"

Initialising tasks...done.
Sstate summary: Wanted 675 Local 658 Network 0 Missed 17 Current 306 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 307 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 308 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 309 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 311 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 312 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 313 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 314 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 315 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 316 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 317 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 318 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 319 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 320 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 321 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 322 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 323 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 324 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 325 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 326 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 327 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 328 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 329 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 330 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 331 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 332 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 333 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 334 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 335 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 337 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 338 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 339 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 340 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 341 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 342 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 343 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 344 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 345 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 346 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 347 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 348 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 349 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 350 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 351 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 352 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 353 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 354 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 355 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 356 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe openssl-1.1.1j-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 357 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 358 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 359 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 360 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 361 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 362 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-247.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 363 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 364 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 365 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 366 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: recipe util-linux-uuid-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1j-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 367 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 368 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 369 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 371 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 372 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-247.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-1_247.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 373 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 374 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 375 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 376 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-uuid-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 377 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 378 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 380 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 381 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.25.bb:do_package_write_rpm_setscene)
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 382 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm_setscene)
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 383 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 384 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.104.bb:do_package_write_rpm_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 385 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm_setscene)
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 386 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 387 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.4.bb:do_package_write_rpm_setscene)
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 388 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 389 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 390 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 391 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 392 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.5.bb:do_package_write_rpm_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_247.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 393 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 394 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 396 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 397 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 398 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 399 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 400 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 401 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 402 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 403 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 404 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 405 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gtk+3-3.24.25-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 406 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libdrm-2.4.104-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 407 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package_write_rpm_setscene)
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe harfbuzz-2.7.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 408 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 410 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 411 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 412 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 413 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 414 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 415 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 416 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 417 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-3.9.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 418 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 419 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 420 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 422 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.104-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe systemd-conf-247.3-r0: task do_packagedata_setscene: Started
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 423 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.48.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 424 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_package_write_rpm_setscene)
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 429 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 430 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 431 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 432 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package_write_rpm_setscene)
NOTE: recipe mesa-2_20.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 433 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 434 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 435 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: Running setscene task 440 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 441 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 443 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-conf-247.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 447 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package_write_rpm_setscene)
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 454 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 455 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 456 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 457 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 458 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 459 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 460 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 463 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_packagedata_setscene)
NOTE: Running setscene task 465 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 467 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 472 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 473 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: Running setscene task 474 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 479 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm_setscene)
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 480 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 481 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 482 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 483 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 484 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.48.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 487 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 488 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 489 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 490 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 495 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 498 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 499 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 500 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.0.bb:do_package_write_rpm_setscene)
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe harfbuzz-2.7.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 503 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_package_write_rpm_setscene)
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 504 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 505 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_package_write_rpm_setscene)
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 506 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 508 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 509 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 510 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 512 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_package_write_rpm_setscene)
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 513 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 514 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 515 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_package_write_rpm_setscene)
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_deploy_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 528 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.25.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 529 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe at-spi2-core-2.38.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnutls-3.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-2.48-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 533 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe icu-68.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 534 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 535 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 536 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.34.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 541 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.7.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gtk+3-3.24.25-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 544 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 545 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnutls-3.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_deploy_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 546 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 549 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 552 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 557 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.34.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 560 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 561 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 562 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata_setscene)
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bison-3.7.5-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk+3-3.24.25-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 565 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.25.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.7.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 568 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 573 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.0.bb:do_packagedata_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 576 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk+3-3.24.25-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1041 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_fetch)
NOTE: Running task 1099 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_fetch)
NOTE: recipe gnutls-3.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bison-3.7.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1285 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_write_config)
NOTE: recipe gnutls-3.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.36-r0: task do_fetch: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.36-r0: task do_fetch: Succeeded
NOTE: Running task 1371 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_unpack)
NOTE: recipe vte-0.62.3-r0: task do_fetch: Started
NOTE: recipe vte-0.62.3-r0: task do_fetch: Succeeded
NOTE: Running task 1472 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_unpack)
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vte-0.62.3-r0: task do_write_config: Started
NOTE: recipe libpcre2-10.36-r0: task do_unpack: Started
NOTE: recipe vte-0.62.3-r0: task do_write_config: Succeeded
NOTE: recipe vte-0.62.3-r0: task do_unpack: Started
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-src went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-dbg went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-openssl went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
NOTE: recipe icu-68.2-r0: task do_package_write_rpm_setscene: Succeeded
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
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-xx went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-staticdev went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-dev went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-doc went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-bin went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-cs went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
NOTE: recipe vte-0.62.3-r0: task do_unpack: Succeeded
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-de went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
NOTE: Running task 1486 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_patch)
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-eo went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
NOTE: recipe libpcre2-10.36-r0: task do_unpack: Succeeded
NOTE: Running task 1487 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_patch)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-as went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe gtk+3-3.24.25-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ast went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az-ir went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be+latin went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bg went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn-in went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-br went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bs went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe vte-0.62.3-r0: task do_patch: Started
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-es went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
NOTE: recipe libpcre2-10.36-r0: task do_patch: Started
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-fi went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-fr went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-it went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-ms went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-nl went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-pl went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-pt-br went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-sr went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-sv went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-uk went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-vi went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca+valencia went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ckb went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-zh-cn went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-crh went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cs went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cy went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-da went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-de went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe vte-0.62.3-r0: task do_patch: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-dz went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 1488 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_deploy_source_date_epoch)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-el went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 1489 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_populate_lic)
NOTE: recipe mesa-2_20.3.4-r0: task do_package_write_rpm_setscene: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en+shaw went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-ca went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-gb went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eo went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-es went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe gnutls-3.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.36-r0: task do_patch: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-et went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running task 1490 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_deploy_source_date_epoch)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eu went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running setscene task 594 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 595 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 596 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 597 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 598 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 599 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 600 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_populate_sysroot_setscene)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fa went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fi went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fr went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fur went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ga went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gd went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gl went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gu went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-he went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hi went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hr went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hu went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hy went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ia went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-id went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-io went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-is went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-it went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe vte-0.62.3-r0: task do_deploy_source_date_epoch: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ja went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ka went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe vte-0.62.3-r0: task do_populate_lic: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kg went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kk went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-km went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kn went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ko went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe libpcre2-10.36-r0: task do_deploy_source_date_epoch: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ku went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ky went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lg went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata_setscene: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-li went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lt went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lv went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot_setscene: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mai went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot_setscene: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mi went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mk went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ml went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mn went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mr went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe gnutls-3.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ms went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-my went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe nettle-3.7.1-r0: task do_packagedata_setscene: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nb went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nds went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ne went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nl went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe nettle-3.7.1-r0: task do_populate_sysroot_setscene: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nn went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nso went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-oc went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-or went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pa went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pl went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ps went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt-br went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ro went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ru went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-rw went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe vte-0.62.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_populate_lic unihash changed to bb49a42cde6da22bbd29264e20b3d733e3a12f77cef1030fc549759b1830ae59
NOTE: recipe vte-0.62.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.36-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 602 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-si went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sk went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sl went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sq went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+ije went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe argp-standalone-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+latin went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sv went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ta went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe nettle-3.7.1-r0: task do_packagedata_setscene: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-te went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running setscene task 604 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tg went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-th went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tk went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe argp-standalone-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tr went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tt went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ug went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uk went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ur went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz+cyrillic went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-vi went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe nettle-3.7.1-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-wa went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: Running setscene task 605 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 606 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_deploy_source_date_epoch_setscene)
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-xh went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-yi went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-cn went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-hk went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-tw went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-am-et went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cedilla went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cyrillic-translit went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-inuktitut went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ipa went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-multipress went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-thai went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-er went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-et went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-viqr went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-wayland went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-waylandgtk went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-xim went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-file went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
ERROR: gtk+3-3.24.25-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-lpr went backwards which would break package feeds (from 0:3.24.27-r0 to 0:3.24.25-r0) [version-going-backwards]
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 609 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 610 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 611 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gtk+3-3.24.25-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 613 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 614 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 615 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.25.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 616 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 617 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 618 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 619 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 620 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 621 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 622 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 623 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 624 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 625 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 626 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.25-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.48.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.48.2-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.25-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 628 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pango-1.48.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
ERROR: pango-1.48.2-r0 do_packagedata_setscene: QA Issue: Package version for package pango-src went backwards which would break package feeds (from 0:1.48.3-r0 to 0:1.48.2-r0) [version-going-backwards]
ERROR: pango-1.48.2-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dbg went backwards which would break package feeds (from 0:1.48.3-r0 to 0:1.48.2-r0) [version-going-backwards]
ERROR: pango-1.48.2-r0 do_packagedata_setscene: QA Issue: Package version for package pango-ptest went backwards which would break package feeds (from 0:1.48.3-r0 to 0:1.48.2-r0) [version-going-backwards]
ERROR: pango-1.48.2-r0 do_packagedata_setscene: QA Issue: Package version for package pango-staticdev went backwards which would break package feeds (from 0:1.48.3-r0 to 0:1.48.2-r0) [version-going-backwards]
ERROR: pango-1.48.2-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dev went backwards which would break package feeds (from 0:1.48.3-r0 to 0:1.48.2-r0) [version-going-backwards]
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: pango-1.48.2-r0 do_packagedata_setscene: QA Issue: Package version for package pango-doc went backwards which would break package feeds (from 0:1.48.3-r0 to 0:1.48.2-r0) [version-going-backwards]
ERROR: pango-1.48.2-r0 do_packagedata_setscene: QA Issue: Package version for package pango-locale went backwards which would break package feeds (from 0:1.48.3-r0 to 0:1.48.2-r0) [version-going-backwards]
ERROR: pango-1.48.2-r0 do_packagedata_setscene: QA Issue: Package version for package pango went backwards which would break package feeds (from 0:1.48.3-r0 to 0:1.48.2-r0) [version-going-backwards]
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.48.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 630 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 631 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 632 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 633 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 634 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 635 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 636 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 638 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libepoxy-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-2.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-2.7.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 640 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.48.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 642 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 644 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 645 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 647 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 648 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libepoxy-1.5.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libepoxy-1.5.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pango-1.48.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe at-spi2-core-2.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 650 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 652 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe harfbuzz-2.7.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-2.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 654 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 655 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 656 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 657 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 658 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 661 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: Running setscene task 665 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-2.7.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-68.2-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-68.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-yocto-5.10.21+gitAUTOINC+8c8f6a791b_8c516ced69-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe harfbuzz-2.7.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-68.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 670 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 671 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 672 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 673 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 674 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 675 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 676 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_20.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_20.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe at-spi2-core-2.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 678 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 679 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 680 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 683 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 684 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 685 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.38.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 686 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe icu-68.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 687 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mesa-2_20.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 689 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.104.bb:do_packagedata_setscene)
NOTE: Running setscene task 690 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 691 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 692 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 693 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe icu-68.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-68.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 695 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 697 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 698 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 699 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libdrm-2.4.104-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_20.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 700 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.104.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 701 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 702 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 703 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 704 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 705 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 707 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.104-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_20.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 712 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 714 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 715 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 717 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 718 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 719 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 720 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 721 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 722 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 723 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 724 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 725 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_20.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libdrm-2.4.104-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 727 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 728 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 729 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.104-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 730 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.104.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 731 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 732 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 733 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 734 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 735 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 737 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 738 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.104-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libdrm-2.4.104-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 740 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 741 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 742 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 743 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 746 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 749 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 751 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 753 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 755 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 756 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 757 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 758 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 759 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 761 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 762 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 763 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 764 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 765 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 767 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 768 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 769 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 770 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 771 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 772 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 773 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 775 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_247.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_247.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 777 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 778 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 779 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 781 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_247.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_247.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 786 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 787 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 788 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 789 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 790 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 791 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 792 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 793 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 794 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 795 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 796 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 797 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 798 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 799 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 800 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 802 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: Running setscene task 803 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 804 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_247.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
NOTE: Running task 1706 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libcap-2.48-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-28-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_247.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 806 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 808 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: Running task 1715 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1716 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 811 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 812 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 813 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 814 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 815 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 816 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 817 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-28-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 818 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 822 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 823 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: Running setscene task 824 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 826 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 827 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 828 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-28-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1740 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 830 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 831 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 832 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 833 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 834 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 836 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 837 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 838 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 839 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 840 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 841 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 842 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 843 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 844 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 846 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 848 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1763 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 850 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 852 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 853 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 854 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 857 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 859 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 860 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running setscene task 862 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 863 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 864 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 865 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 866 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1775 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 1794 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 868 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 870 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.9.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 872 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb:do_packagedata_setscene)
NOTE: Running setscene task 873 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 874 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 875 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 876 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 877 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 878 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 879 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 880 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1j-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.34.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
ERROR: sqlite3-3_3.34.1-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3-src went backwards which would break package feeds (from 3:3.35.0-r0 to 3:3.34.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.34.1-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3-dbg went backwards which would break package feeds (from 3:3.35.0-r0 to 3:3.34.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.34.1-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3 went backwards which would break package feeds (from 3:3.35.0-r0 to 3:3.34.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.34.1-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-dev went backwards which would break package feeds (from 3:3.35.0-r0 to 3:3.34.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.34.1-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-doc went backwards which would break package feeds (from 3:3.35.0-r0 to 3:3.34.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.34.1-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-staticdev went backwards which would break package feeds (from 3:3.35.0-r0 to 3:3.34.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.34.1-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3 went backwards which would break package feeds (from 3:3.35.0-r0 to 3:3.34.1-r0) [version-going-backwards]
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 883 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe openssl-1.1.1j-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.34.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 890 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 891 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 892 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 893 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 894 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 895 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 896 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 897 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 898 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 899 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1j-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.34.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 901 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 902 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 903 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 904 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 905 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-1.1.1j-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 906 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 908 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.9.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 909 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 910 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 911 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 912 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 913 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-1.1.1j-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.34.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 914 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 915 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-uuid-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 916 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 917 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 918 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 919 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 920 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 921 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-1.1.1j-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.34.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 922 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-uuid-2.36.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.34.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-uuid-2.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1848 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running setscene task 926 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-uuid-2.36.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 927 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 929 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 930 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 931 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 932 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-uuid-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-uuid-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 934 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 936 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 937 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 938 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 939 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 940 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 942 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 944 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 945 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 946 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 947 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1889 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 948 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 950 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 951 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 952 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to d074322eb6b0a530bfcaca3bc13e483b2af168e438f712a15c767a7794ad3794
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 955 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: Running task 1898 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 956 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 957 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 959 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 960 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 961 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 963 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 964 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 965 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 966 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 967 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 968 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 974 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 975 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 976 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 978 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 979 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 980 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 981 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 982 of 981 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2218 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2643 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpcre2-10.36-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcre2-10.36-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2946 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to a2ea2736a2cca7af6c85d7b4ffb0889ec54698101bbb59e0910b5b918c8a457e
NOTE: recipe libpcre2-10.36-r0: task do_configure: Started
NOTE: recipe libpcre2-10.36-r0: task do_configure: Succeeded
NOTE: Running task 3101 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_compile)
NOTE: recipe libpcre2-10.36-r0: task do_compile: Started
NOTE: recipe libpcre2-10.36-r0: task do_compile: Succeeded
NOTE: Running task 3102 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_install)
NOTE: recipe libpcre2-10.36-r0: task do_install: Started
NOTE: recipe libpcre2-10.36-r0: task do_install: Succeeded
NOTE: Running task 3103 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_package)
NOTE: Running task 3104 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_populate_sysroot)
NOTE: recipe libpcre2-10.36-r0: task do_package: Started
NOTE: recipe libpcre2-10.36-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre2-10.36-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3105 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe vte-0.62.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vte-0.62.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3106 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_configure)
NOTE: recipe vte-0.62.3-r0: task do_configure: Started
NOTE: recipe libpcre2-10.36-r0: task do_package: Succeeded
NOTE: Running task 3107 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_packagedata)
NOTE: recipe libpcre2-10.36-r0: task do_packagedata: Started
NOTE: recipe libpcre2-10.36-r0: task do_packagedata: Succeeded
NOTE: Running task 3108 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_package_write_rpm)
NOTE: recipe libpcre2-10.36-r0: task do_package_write_rpm: Started
NOTE: recipe libpcre2-10.36-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vte-0.62.3-r0: task do_configure: Succeeded
NOTE: Running task 3109 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_compile)
NOTE: recipe vte-0.62.3-r0: task do_compile: Started
NOTE: recipe vte-0.62.3-r0: task do_compile: Succeeded
NOTE: Running task 3110 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_install)
NOTE: recipe vte-0.62.3-r0: task do_install: Started
NOTE: recipe vte-0.62.3-r0: task do_install: Succeeded
NOTE: Running task 3111 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_package)
NOTE: Running task 3112 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_populate_sysroot)
NOTE: recipe vte-0.62.3-r0: task do_package: Started
NOTE: recipe vte-0.62.3-r0: task do_populate_sysroot: Started
NOTE: recipe vte-0.62.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vte-0.62.3-r0: task do_package: Succeeded
NOTE: Running task 3113 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_packagedata)
NOTE: recipe vte-0.62.3-r0: task do_packagedata: Started
NOTE: recipe vte-0.62.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3114 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_package_write_rpm)
NOTE: Running task 3115 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_package_qa)
NOTE: recipe vte-0.62.3-r0: task do_package_write_rpm: Started
NOTE: recipe vte-0.62.3-r0: task do_package_qa: Started
NOTE: recipe vte-0.62.3-r0: task do_package_qa: Succeeded
NOTE: recipe vte-0.62.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3116 of 3116 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_build)
NOTE: Tasks Summary: Attempted 3116 tasks of which 3077 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 178 ERROR messages shown, returning a non-zero exit code.

--===============5630361657040904191==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/vte: SRC_URI changed from "https://ftp.gnome.org/pub/GNOME/sources/vte/0.62/vte-0.62.2.tar.xz;name=archive file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch" to "https://ftp.gnome.org/pub/GNOME/sources/vte/0.62/vte-0.62.3.tar.xz;name=archive file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
packages/core2-32-poky-linux/vte: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/libvte: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/libvte: PV changed from "0.62.2" to "0.62.3"
Changes to packages/core2-32-poky-linux/vte (sysroot):
  /usr/lib/libvte-2.91.so.0 changed symlink target from libvte-2.91.so.0.6200.2 to libvte-2.91.so.0.6200.3
  /usr/lib/libvte-2.91.so.0.6200.2 moved to /usr/lib/libvte-2.91.so.0.6200.3
packages/core2-32-poky-linux/vte/vte-dbg: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-dbg: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-dbg: PKGSIZE changed from 5508456 to 5508084 (-0%)
packages/core2-32-poky-linux/vte/vte-dev: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-dev: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-doc: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-doc: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-am: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-am: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-an: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-an: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-ang: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-ang: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-ar: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-ar: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-as: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-as: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-ast: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-ast: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-az: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-az: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-be+latin: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-be+latin: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-be: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-be: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-bg: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-bg: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-bn-in: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-bn-in: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-bn: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-bn: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-bs: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-bs: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-ca+valencia: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-ca+valencia: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-ca: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-ca: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-ckb: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-ckb: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-cs: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-cs: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-cy: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-cy: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-da: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-da: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-de: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-de: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-dz: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-dz: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-el: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-el: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-en+shaw: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-en+shaw: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-en-ca: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-en-ca: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-en-gb: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-en-gb: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-eo: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-eo: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-es: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-es: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-et: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-et: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-eu: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-eu: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-fa: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-fa: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-fi: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-fi: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-fr: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-fr: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-fur: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-fur: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-ga: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-ga: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-gd: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-gd: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-gl: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-gl: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-gu: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-gu: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-he: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-he: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-hi: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-hi: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-hr: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-hr: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-hu: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-hu: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-id: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-id: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-is: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-is: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-it: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-it: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-ja: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-ja: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-ka: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-ka: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-kk: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-kk: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-kn: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-kn: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-ko: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-ko: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-ku: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-ku: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-ky: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-ky: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-li: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-li: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-lt: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-lt: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-lv: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-lv: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-mai: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-mai: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-mi: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-mi: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-mjw: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-mjw: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-mk: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-mk: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-ml: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-ml: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-mn: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-mn: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-mr: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-mr: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-ms: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-ms: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-nb: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-nb: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-nb: PKGSIZE changed from 900 to 1211 (+35%)
packages/core2-32-poky-linux/vte/vte-locale-nds: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-nds: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-ne: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-ne: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-nl: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-nl: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-nn: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-nn: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-oc: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-oc: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-or: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-or: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-pa: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-pa: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-pl: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-pl: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-pt-br: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-pt-br: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-pt: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-pt: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-ro: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-ro: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-ru: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-ru: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-rw: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-rw: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-si: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-si: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-sk: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-sk: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-sl: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-sl: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-sq: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-sq: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-sr+latin: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-sr+latin: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-sr: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-sr: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-sv: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-sv: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-ta: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-ta: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-te: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-te: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-tg: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-tg: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-th: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-th: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-tr: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-tr: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-ug: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-ug: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-uk: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-uk: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-uz+cyrillic: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-uz+cyrillic: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-vi: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-vi: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-wa: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-wa: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-xh: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-xh: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-zh-cn: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-zh-cn: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-zh-hk: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-zh-hk: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-locale-zh-tw: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-zh-tw: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-prompt: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-prompt: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-src: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-src: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte-src: PKGSIZE changed from 2033851 to 2033463 (-0%)
packages/core2-32-poky-linux/vte/vte-staticdev: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte-staticdev: PV changed from "0.62.2" to "0.62.3"
packages/core2-32-poky-linux/vte/vte: PKGV changed from 0.62.2 [default] to 0.62.3 [default]
packages/core2-32-poky-linux/vte/vte: PV changed from "0.62.2" to "0.62.3"

--===============5630361657040904191==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-vte-upgrade-0.62.2-0.62.3.patch"

From b016fc23ef2f936b9dd53574e2de385b288c77f7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Mar 2021 16:41:59 +0000
Subject: [PATCH] vte: upgrade 0.62.2 -> 0.62.3

---
 meta/recipes-support/vte/{vte_0.62.2.bb => vte_0.62.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/vte/{vte_0.62.2.bb => vte_0.62.3.bb} (95%)

diff --git a/meta/recipes-support/vte/vte_0.62.2.bb b/meta/recipes-support/vte/vte_0.62.3.bb
similarity index 95%
rename from meta/recipes-support/vte/vte_0.62.2.bb
rename to meta/recipes-support/vte/vte_0.62.3.bb
index a2164f43d3..8d2470cad8 100644
--- a/meta/recipes-support/vte/vte_0.62.2.bb
+++ b/meta/recipes-support/vte/vte_0.62.3.bb
@@ -20,7 +20,7 @@ inherit gnomebase gtk-doc features_check upstream-version-is-even gobject-intros
 
 # vapigen.m4 is required when vala is not present (but the one from vala should be used normally)
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
-SRC_URI[archive.sha256sum] = "b0300bbcf0c02df5812a10a3cb8e4fff723bab92c08c97a0a90c167cf543aff0"
+SRC_URI[archive.sha256sum] = "f5770285a52cc23a3c0428a43d492b7c0ba458ce7b8a73768a7d4f1e8a7db3b4"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.17.1


--===============5630361657040904191==
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
DISTRO_VERSION       = "3.2+snapshot-4b19b559ce5589bd913ac023306bbff2dfe25d67"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4b19b559ce5589bd913ac023306bbff2dfe25d67"
workspace            = "master:eec64066073428e38d5b0b6947ff302943188f65"

Initialising tasks...done.
Sstate summary: Wanted 57 Local 41 Network 0 Missed 16 Current 909 (71% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 937 of 966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 941 of 966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 942 of 966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 951 of 966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 952 of 966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.34.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sqlite3-3_3.34.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnutls-3.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.34.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 956 of 966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.34.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 957 of 966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.0.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.34.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 958 of 966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.7.0-r0: task do_packagedata_setscene: Started
ERROR: sqlite3-3_3.34.1-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3-src went backwards which would break package feeds (from 3:3.35.0-r0 to 3:3.34.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.34.1-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3-dbg went backwards which would break package feeds (from 3:3.35.0-r0 to 3:3.34.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.34.1-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3 went backwards which would break package feeds (from 3:3.35.0-r0 to 3:3.34.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.34.1-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-dev went backwards which would break package feeds (from 3:3.35.0-r0 to 3:3.34.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.34.1-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-doc went backwards which would break package feeds (from 3:3.35.0-r0 to 3:3.34.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.34.1-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-staticdev went backwards which would break package feeds (from 3:3.35.0-r0 to 3:3.34.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.34.1-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3 went backwards which would break package feeds (from 3:3.35.0-r0 to 3:3.34.1-r0) [version-going-backwards]
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-src went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
NOTE: recipe sqlite3-3_3.34.1-r0: task do_packagedata_setscene: Succeeded
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-dbg went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
NOTE: Running setscene task 960 of 966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_deploy_source_date_epoch_setscene)
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-openssl went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-xx went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-staticdev went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-dev went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-doc went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-bin went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-cs went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-de went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-eo went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-es went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-fi went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
NOTE: Running task 1955 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_fetch)
NOTE: recipe sqlite3-3_3.34.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 2084 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_fetch)
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-fr went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
NOTE: recipe libpcre2-10.36-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.36-r0: task do_fetch: Succeeded
NOTE: Running task 2261 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_unpack)
NOTE: Running task 2262 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_prepare_recipe_sysroot)
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-it went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-ms went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-nl went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-pl went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-pt-br went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-sr went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
NOTE: recipe vte-0.62.3-r0: task do_fetch: Started
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-sv went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-uk went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
NOTE: Running task 2373 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_write_config)
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-vi went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-zh-cn went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
NOTE: recipe vte-0.62.3-r0: task do_fetch: Succeeded
NOTE: Running task 2414 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_unpack)
NOTE: recipe sqlite3-3_3.34.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre2-10.36-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.36-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 962 of 966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vte-0.62.3-r0: task do_write_config: Started
NOTE: recipe vte-0.62.3-r0: task do_unpack: Started
NOTE: recipe vte-0.62.3-r0: task do_write_config: Succeeded
NOTE: recipe gnutls-3.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-10.36-r0: task do_unpack: Succeeded
NOTE: Running task 2831 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_patch)
NOTE: recipe vte-0.62.3-r0: task do_unpack: Succeeded
NOTE: Running task 2832 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_patch)
NOTE: recipe libpcre2-10.36-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpcre2-10.36-r0: task do_patch: Started
NOTE: recipe vte-0.62.3-r0: task do_patch: Started
NOTE: recipe libpcre2-10.36-r0: task do_patch: Succeeded
NOTE: recipe gnutls-3.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 2833 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_deploy_source_date_epoch)
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vte-0.62.3-r0: task do_patch: Succeeded
NOTE: recipe libpcre2-10.36-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 963 of 966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 2850 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2851 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_populate_lic)
NOTE: recipe vte-0.62.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vte-0.62.3-r0: task do_populate_lic: Started
NOTE: recipe systemd-1_247.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.36-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2852 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_configure)
NOTE: recipe libpcre2-10.36-r0: task do_configure: Started
NOTE: recipe vte-0.62.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_populate_lic unihash changed to bb49a42cde6da22bbd29264e20b3d733e3a12f77cef1030fc549759b1830ae59
NOTE: recipe vte-0.62.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe systemd-1_247.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 965 of 966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_populate_sysroot_setscene)
NOTE: Running task 2861 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libcap-2.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 966 of 966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2903 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2904 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 81a8fc4714d5e3078725ea52621d5cb3338ee3fac13e562738f12dc54f636770
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 3002 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 0035619123a81c38302d981de40f05297df401876f3fad665b331ce08c59cb24
NOTE: Setscene tasks completed
NOTE: Running task 3047 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libpcre2-10.36-r0: task do_configure: Succeeded
NOTE: Running task 3062 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_compile)
NOTE: recipe libpcre2-10.36-r0: task do_compile: Started
NOTE: recipe libpcre2-10.36-r0: task do_compile: Succeeded
NOTE: Running task 3063 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_install)
NOTE: recipe libpcre2-10.36-r0: task do_install: Started
NOTE: recipe libpcre2-10.36-r0: task do_install: Succeeded
NOTE: Running task 3064 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_package)
NOTE: Running task 3065 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_populate_sysroot)
NOTE: recipe libpcre2-10.36-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre2-10.36-r0: task do_package: Started
NOTE: recipe libpcre2-10.36-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3066 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe vte-0.62.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcre2-10.36-r0: task do_package: Succeeded
NOTE: Running task 3067 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_packagedata)
NOTE: recipe libpcre2-10.36-r0: task do_packagedata: Started
NOTE: recipe libpcre2-10.36-r0: task do_packagedata: Succeeded
NOTE: Running task 3068 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_package_write_rpm)
NOTE: recipe libpcre2-10.36-r0: task do_package_write_rpm: Started
NOTE: recipe vte-0.62.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3069 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_configure)
NOTE: recipe vte-0.62.3-r0: task do_configure: Started
NOTE: recipe libpcre2-10.36-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vte-0.62.3-r0: task do_configure: Succeeded
NOTE: Running task 3070 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_compile)
NOTE: recipe vte-0.62.3-r0: task do_compile: Started
NOTE: recipe vte-0.62.3-r0: task do_compile: Succeeded
NOTE: Running task 3071 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_install)
NOTE: recipe vte-0.62.3-r0: task do_install: Started
NOTE: recipe vte-0.62.3-r0: task do_install: Succeeded
NOTE: Running task 3072 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_package)
NOTE: Running task 3073 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_populate_sysroot)
NOTE: recipe vte-0.62.3-r0: task do_package: Started
NOTE: recipe vte-0.62.3-r0: task do_populate_sysroot: Started
NOTE: recipe vte-0.62.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vte-0.62.3-r0: task do_package: Succeeded
NOTE: Running task 3074 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_packagedata)
NOTE: recipe vte-0.62.3-r0: task do_packagedata: Started
NOTE: recipe vte-0.62.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3075 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_package_write_rpm)
NOTE: Running task 3076 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_package_qa)
NOTE: recipe vte-0.62.3-r0: task do_package_write_rpm: Started
NOTE: recipe vte-0.62.3-r0: task do_package_qa: Started
NOTE: recipe vte-0.62.3-r0: task do_package_qa: Succeeded
NOTE: recipe vte-0.62.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3077 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_build)
NOTE: Tasks Summary: Attempted 3077 tasks of which 3044 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 32 ERROR messages shown, returning a non-zero exit code.

--===============5630361657040904191==
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
DISTRO_VERSION       = "3.2+snapshot-4b19b559ce5589bd913ac023306bbff2dfe25d67"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4b19b559ce5589bd913ac023306bbff2dfe25d67"
workspace            = "master:eec64066073428e38d5b0b6947ff302943188f65"

Initialising tasks...done.
Sstate summary: Wanted 57 Local 41 Network 0 Missed 16 Current 909 (71% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 937 of 966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 941 of 966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 942 of 966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 951 of 966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 952 of 966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.34.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnutls-3.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sqlite3-3_3.34.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.34.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 956 of 966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 957 of 966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.0.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.34.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.34.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.7.0-r0: task do_packagedata_setscene: Started
ERROR: sqlite3-3_3.34.1-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3-src went backwards which would break package feeds (from 3:3.35.0-r0 to 3:3.34.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.34.1-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3-dbg went backwards which would break package feeds (from 3:3.35.0-r0 to 3:3.34.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.34.1-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3 went backwards which would break package feeds (from 3:3.35.0-r0 to 3:3.34.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.34.1-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-dev went backwards which would break package feeds (from 3:3.35.0-r0 to 3:3.34.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.34.1-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-doc went backwards which would break package feeds (from 3:3.35.0-r0 to 3:3.34.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.34.1-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-staticdev went backwards which would break package feeds (from 3:3.35.0-r0 to 3:3.34.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.34.1-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3 went backwards which would break package feeds (from 3:3.35.0-r0 to 3:3.34.1-r0) [version-going-backwards]
NOTE: recipe sqlite3-3_3.34.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 959 of 966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_deploy_source_date_epoch_setscene)
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-src went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-dbg went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 960 of 966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-openssl went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-xx went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-staticdev went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-dev went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-doc went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-bin went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-cs went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-de went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-eo went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-es went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
NOTE: recipe sqlite3-3_3.34.1-r0: task do_deploy_source_date_epoch_setscene: Started
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-fi went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-fr went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-it went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-ms went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-nl went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-pl went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-pt-br went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-sr went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-sv went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
NOTE: recipe sqlite3-3_3.34.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 2010 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_fetch)
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-uk went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-vi went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-zh-cn went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
NOTE: Running task 2144 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_fetch)
NOTE: recipe gnutls-3.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.36-r0: task do_fetch: Started
NOTE: Running setscene task 962 of 966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpcre2-10.36-r0: task do_fetch: Succeeded
NOTE: Running task 2323 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_unpack)
NOTE: Running task 2324 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_prepare_recipe_sysroot)
NOTE: recipe vte-0.62.3-r0: task do_fetch: Started
NOTE: recipe vte-0.62.3-r0: task do_fetch: Succeeded
NOTE: Running task 2435 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_write_config)
NOTE: Running task 2448 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_unpack)
NOTE: recipe gnutls-3.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-10.36-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.36-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vte-0.62.3-r0: task do_write_config: Started
NOTE: recipe vte-0.62.3-r0: task do_unpack: Started
NOTE: recipe vte-0.62.3-r0: task do_write_config: Succeeded
NOTE: recipe gnutls-3.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vte-0.62.3-r0: task do_unpack: Succeeded
NOTE: Running task 2843 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_patch)
NOTE: recipe libpcre2-10.36-r0: task do_unpack: Succeeded
NOTE: Running task 2844 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_patch)
NOTE: recipe vte-0.62.3-r0: task do_patch: Started
NOTE: recipe libpcre2-10.36-r0: task do_patch: Started
NOTE: recipe libpcre2-10.36-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpcre2-10.36-r0: task do_patch: Succeeded
NOTE: Running task 2845 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_deploy_source_date_epoch)
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 963 of 966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_populate_sysroot_setscene)
NOTE: recipe vte-0.62.3-r0: task do_patch: Succeeded
NOTE: Running task 2850 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2851 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_populate_lic)
NOTE: recipe libpcre2-10.36-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vte-0.62.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vte-0.62.3-r0: task do_populate_lic: Started
NOTE: recipe systemd-1_247.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.36-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2852 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_configure)
NOTE: recipe vte-0.62.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpcre2-10.36-r0: task do_configure: Started
NOTE: recipe vte-0.62.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_populate_lic unihash changed to bb49a42cde6da22bbd29264e20b3d733e3a12f77cef1030fc549759b1830ae59
NOTE: recipe systemd-1_247.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 965 of 966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_populate_sysroot_setscene)
NOTE: Running task 2861 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libcap-2.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 966 of 966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2903 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2904 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2905 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 66af55b123d9f9dcf0b8b6ec352551d2c5d1af62fbd17812dafc6110128e1f05
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to df6a43dc8818d0947bc0f54fdff6095a9b2ee1e477bf529fb2ae6b3ac56371fe
NOTE: Setscene tasks completed
NOTE: Running task 3047 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libpcre2-10.36-r0: task do_configure: Succeeded
NOTE: Running task 3062 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_compile)
NOTE: recipe libpcre2-10.36-r0: task do_compile: Started
NOTE: recipe libpcre2-10.36-r0: task do_compile: Succeeded
NOTE: Running task 3063 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_install)
NOTE: recipe libpcre2-10.36-r0: task do_install: Started
NOTE: recipe libpcre2-10.36-r0: task do_install: Succeeded
NOTE: Running task 3064 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_package)
NOTE: Running task 3065 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_populate_sysroot)
NOTE: recipe libpcre2-10.36-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre2-10.36-r0: task do_package: Started
NOTE: recipe libpcre2-10.36-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3066 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe vte-0.62.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcre2-10.36-r0: task do_package: Succeeded
NOTE: Running task 3067 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_packagedata)
NOTE: recipe libpcre2-10.36-r0: task do_packagedata: Started
NOTE: recipe libpcre2-10.36-r0: task do_packagedata: Succeeded
NOTE: Running task 3068 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_package_write_rpm)
NOTE: recipe libpcre2-10.36-r0: task do_package_write_rpm: Started
NOTE: recipe libpcre2-10.36-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vte-0.62.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3069 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_configure)
NOTE: recipe vte-0.62.3-r0: task do_configure: Started
NOTE: recipe vte-0.62.3-r0: task do_configure: Succeeded
NOTE: Running task 3070 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_compile)
NOTE: recipe vte-0.62.3-r0: task do_compile: Started
NOTE: recipe vte-0.62.3-r0: task do_compile: Succeeded
NOTE: Running task 3071 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_install)
NOTE: recipe vte-0.62.3-r0: task do_install: Started
NOTE: recipe vte-0.62.3-r0: task do_install: Succeeded
NOTE: Running task 3072 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_package)
NOTE: Running task 3073 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_populate_sysroot)
NOTE: recipe vte-0.62.3-r0: task do_package: Started
NOTE: recipe vte-0.62.3-r0: task do_populate_sysroot: Started
NOTE: recipe vte-0.62.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vte-0.62.3-r0: task do_package: Succeeded
NOTE: Running task 3074 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_packagedata)
NOTE: recipe vte-0.62.3-r0: task do_packagedata: Started
NOTE: recipe vte-0.62.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3075 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_package_write_rpm)
NOTE: Running task 3076 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_package_qa)
NOTE: recipe vte-0.62.3-r0: task do_package_write_rpm: Started
NOTE: recipe vte-0.62.3-r0: task do_package_qa: Started
NOTE: recipe vte-0.62.3-r0: task do_package_qa: Succeeded
NOTE: recipe vte-0.62.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3077 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_build)
NOTE: Tasks Summary: Attempted 3077 tasks of which 3044 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 32 ERROR messages shown, returning a non-zero exit code.

--===============5630361657040904191==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/vte (sysroot):
  /usr/lib/libvte-2.91.so.0 changed symlink target from libvte-2.91.so.0.6200.2 to libvte-2.91.so.0.6200.3
  /usr/lib/libvte-2.91.so.0.6200.2 moved to /usr/lib/libvte-2.91.so.0.6200.3
packages/core2-32-poky-linux/vte/vte-locale-nb: PKGSIZE changed from 900 to 1211 (+35%)

--===============5630361657040904191==
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
DISTRO_VERSION       = "3.2+snapshot-4b19b559ce5589bd913ac023306bbff2dfe25d67"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4b19b559ce5589bd913ac023306bbff2dfe25d67"
workspace            = "master:eec64066073428e38d5b0b6947ff302943188f65"

Initialising tasks...done.
Sstate summary: Wanted 56 Local 40 Network 0 Missed 16 Current 910 (71% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 938 of 966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 941 of 966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 942 of 966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 951 of 966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 952 of 966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.34.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sqlite3-3_3.34.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnutls-3.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.34.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 956 of 966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.34.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.34.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 957 of 966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.0.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.7.0-r0: task do_packagedata_setscene: Started
ERROR: sqlite3-3_3.34.1-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3-src went backwards which would break package feeds (from 3:3.35.0-r0 to 3:3.34.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.34.1-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3-dbg went backwards which would break package feeds (from 3:3.35.0-r0 to 3:3.34.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.34.1-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3 went backwards which would break package feeds (from 3:3.35.0-r0 to 3:3.34.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.34.1-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-dev went backwards which would break package feeds (from 3:3.35.0-r0 to 3:3.34.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.34.1-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-doc went backwards which would break package feeds (from 3:3.35.0-r0 to 3:3.34.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.34.1-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-staticdev went backwards which would break package feeds (from 3:3.35.0-r0 to 3:3.34.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.34.1-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3 went backwards which would break package feeds (from 3:3.35.0-r0 to 3:3.34.1-r0) [version-going-backwards]
NOTE: recipe sqlite3-3_3.34.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 959 of 966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnutls-3.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.34.1-r0: task do_deploy_source_date_epoch_setscene: Started
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-src went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-dbg went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-openssl went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-xx went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
NOTE: Running task 1950 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_fetch)
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-staticdev went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-dev went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-doc went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-bin went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-cs went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-de went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-eo went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-es went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-fi went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-fr went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-it went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
NOTE: Running task 2079 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_fetch)
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-ms went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-nl went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-pl went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
NOTE: Running setscene task 960 of 966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-pt-br went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-sr went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
NOTE: recipe sqlite3-3_3.34.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-sv went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-uk went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-vi went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-zh-cn went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
NOTE: recipe libpcre2-10.36-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.36-r0: task do_fetch: Succeeded
NOTE: Running task 2186 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_unpack)
NOTE: Running task 2211 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 962 of 966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vte-0.62.3-r0: task do_fetch: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.36-r0: task do_unpack: Started
NOTE: recipe vte-0.62.3-r0: task do_fetch: Succeeded
NOTE: Running task 2397 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_unpack)
NOTE: recipe libpcre2-10.36-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2436 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_write_config)
NOTE: recipe gnutls-3.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vte-0.62.3-r0: task do_unpack: Started
NOTE: recipe gnutls-3.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vte-0.62.3-r0: task do_write_config: Started
NOTE: recipe libpcre2-10.36-r0: task do_unpack: Succeeded
NOTE: Running task 2843 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_patch)
NOTE: recipe vte-0.62.3-r0: task do_write_config: Succeeded
NOTE: recipe libpcre2-10.36-r0: task do_patch: Started
NOTE: recipe vte-0.62.3-r0: task do_unpack: Succeeded
NOTE: Running task 2844 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_patch)
NOTE: recipe vte-0.62.3-r0: task do_patch: Started
NOTE: recipe vte-0.62.3-r0: task do_patch: Succeeded
NOTE: Running task 2845 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2846 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_populate_lic)
NOTE: recipe vte-0.62.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vte-0.62.3-r0: task do_populate_lic: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 963 of 966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.36-r0: task do_patch: Succeeded
NOTE: recipe libpcre2-10.36-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2851 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_deploy_source_date_epoch)
NOTE: recipe systemd-1_247.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.36-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vte-0.62.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vte-0.62.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_populate_lic unihash changed to bb49a42cde6da22bbd29264e20b3d733e3a12f77cef1030fc549759b1830ae59
NOTE: recipe libpcre2-10.36-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2852 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_configure)
NOTE: recipe libpcre2-10.36-r0: task do_configure: Started
NOTE: recipe systemd-1_247.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 965 of 966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_populate_sysroot_setscene)
NOTE: Running task 2861 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libcap-2.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 966 of 966 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2903 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2904 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 3cd33b3b118bcd2d611f0ef1df7e5da16aaba995e145f3e72f84ba5240ca287f
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 3002 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e214d8e722684895ce7d2e4e2646ce6ff189091d0349f92be4eca70546780a46
NOTE: Setscene tasks completed
NOTE: Running task 3047 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libpcre2-10.36-r0: task do_configure: Succeeded
NOTE: Running task 3062 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_compile)
NOTE: recipe libpcre2-10.36-r0: task do_compile: Started
NOTE: recipe libpcre2-10.36-r0: task do_compile: Succeeded
NOTE: Running task 3063 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_install)
NOTE: recipe libpcre2-10.36-r0: task do_install: Started
NOTE: recipe libpcre2-10.36-r0: task do_install: Succeeded
NOTE: Running task 3064 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_package)
NOTE: Running task 3065 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_populate_sysroot)
NOTE: recipe libpcre2-10.36-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre2-10.36-r0: task do_package: Started
NOTE: recipe libpcre2-10.36-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3066 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe vte-0.62.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcre2-10.36-r0: task do_package: Succeeded
NOTE: Running task 3067 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_packagedata)
NOTE: recipe libpcre2-10.36-r0: task do_packagedata: Started
NOTE: recipe libpcre2-10.36-r0: task do_packagedata: Succeeded
NOTE: Running task 3068 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_package_write_rpm)
NOTE: recipe libpcre2-10.36-r0: task do_package_write_rpm: Started
NOTE: recipe libpcre2-10.36-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vte-0.62.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3069 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_configure)
NOTE: recipe vte-0.62.3-r0: task do_configure: Started
NOTE: recipe vte-0.62.3-r0: task do_configure: Succeeded
NOTE: Running task 3070 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_compile)
NOTE: recipe vte-0.62.3-r0: task do_compile: Started
NOTE: recipe vte-0.62.3-r0: task do_compile: Succeeded
NOTE: Running task 3071 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_install)
NOTE: recipe vte-0.62.3-r0: task do_install: Started
NOTE: recipe vte-0.62.3-r0: task do_install: Succeeded
NOTE: Running task 3072 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_package)
NOTE: Running task 3073 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_populate_sysroot)
NOTE: recipe vte-0.62.3-r0: task do_package: Started
NOTE: recipe vte-0.62.3-r0: task do_populate_sysroot: Started
NOTE: recipe vte-0.62.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vte-0.62.3-r0: task do_package: Succeeded
NOTE: Running task 3074 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_packagedata)
NOTE: recipe vte-0.62.3-r0: task do_packagedata: Started
NOTE: recipe vte-0.62.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3075 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_package_write_rpm)
NOTE: Running task 3076 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_package_qa)
NOTE: recipe vte-0.62.3-r0: task do_package_write_rpm: Started
NOTE: recipe vte-0.62.3-r0: task do_package_qa: Started
NOTE: recipe vte-0.62.3-r0: task do_package_qa: Succeeded
NOTE: recipe vte-0.62.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3077 of 3077 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_build)
NOTE: Tasks Summary: Attempted 3077 tasks of which 3044 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 32 ERROR messages shown, returning a non-zero exit code.

--===============5630361657040904191==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1440 entries from dependency cache.
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
DISTRO_VERSION       = "3.2+snapshot-4b19b559ce5589bd913ac023306bbff2dfe25d67"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4b19b559ce5589bd913ac023306bbff2dfe25d67"
workspace            = "master:eec64066073428e38d5b0b6947ff302943188f65"

Initialising tasks...done.
Sstate summary: Wanted 57 Local 41 Network 0 Missed 16 Current 913 (71% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 941 of 970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 945 of 970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 946 of 970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 955 of 970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 956 of 970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.34.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.34.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnutls-3.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnutls-3.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.34.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 960 of 970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.0.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.34.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 961 of 970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.34.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 962 of 970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-src went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.34.1-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3-src went backwards which would break package feeds (from 3:3.35.0-r0 to 3:3.34.1-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-dbg went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.34.1-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3-dbg went backwards which would break package feeds (from 3:3.35.0-r0 to 3:3.34.1-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-openssl went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.34.1-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3 went backwards which would break package feeds (from 3:3.35.0-r0 to 3:3.34.1-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-xx went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.34.1-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-dev went backwards which would break package feeds (from 3:3.35.0-r0 to 3:3.34.1-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-staticdev went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.34.1-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-doc went backwards which would break package feeds (from 3:3.35.0-r0 to 3:3.34.1-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-dev went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.34.1-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-staticdev went backwards which would break package feeds (from 3:3.35.0-r0 to 3:3.34.1-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-doc went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.34.1-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3 went backwards which would break package feeds (from 3:3.35.0-r0 to 3:3.34.1-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-bin went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-cs went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-de went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-eo went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-es went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-fi went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-fr went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-it went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-ms went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-nl went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-pl went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-pt-br went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
NOTE: recipe sqlite3-3_3.34.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 964 of 970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.1.bb:do_deploy_source_date_epoch_setscene)
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-sr went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-sv went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-uk went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-vi went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
ERROR: gnutls-3.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package gnutls-locale-zh-cn went backwards which would break package feeds (from 0:3.7.1-r0 to 0:3.7.0-r0) [version-going-backwards]
NOTE: Running task 1973 of 3095 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_fetch)
NOTE: recipe gnutls-3.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 966 of 970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.34.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 2102 of 3095 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_fetch)
NOTE: recipe libpcre2-10.36-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.36-r0: task do_fetch: Succeeded
NOTE: Running task 2233 of 3095 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_unpack)
NOTE: Running task 2234 of 3095 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_prepare_recipe_sysroot)
NOTE: recipe sqlite3-3_3.34.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnutls-3.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vte-0.62.3-r0: task do_fetch: Started
NOTE: recipe vte-0.62.3-r0: task do_fetch: Succeeded
NOTE: Running task 2324 of 3095 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_unpack)
NOTE: recipe libpcre2-10.36-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.36-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2454 of 3095 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_write_config)
NOTE: recipe gnutls-3.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vte-0.62.3-r0: task do_unpack: Started
NOTE: recipe vte-0.62.3-r0: task do_write_config: Started
NOTE: recipe vte-0.62.3-r0: task do_write_config: Succeeded
NOTE: recipe vte-0.62.3-r0: task do_unpack: Succeeded
NOTE: recipe libpcre2-10.36-r0: task do_unpack: Succeeded
NOTE: Running task 2861 of 3095 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_patch)
NOTE: Running task 2862 of 3095 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_patch)
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 967 of 970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.36-r0: task do_patch: Started
NOTE: recipe vte-0.62.3-r0: task do_patch: Started
NOTE: recipe libpcre2-10.36-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpcre2-10.36-r0: task do_patch: Succeeded
NOTE: Running task 2867 of 3095 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_deploy_source_date_epoch)
NOTE: recipe systemd-1_247.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vte-0.62.3-r0: task do_patch: Succeeded
NOTE: Running task 2868 of 3095 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2869 of 3095 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_populate_lic)
NOTE: recipe libpcre2-10.36-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vte-0.62.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vte-0.62.3-r0: task do_populate_lic: Started
NOTE: recipe libpcre2-10.36-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2870 of 3095 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_configure)
NOTE: recipe vte-0.62.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_populate_lic unihash changed to bb49a42cde6da22bbd29264e20b3d733e3a12f77cef1030fc549759b1830ae59
NOTE: recipe vte-0.62.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpcre2-10.36-r0: task do_configure: Started
NOTE: recipe systemd-1_247.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 969 of 970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_populate_sysroot_setscene)
NOTE: Running task 2879 of 3095 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libcap-2.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 970 of 970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2921 of 3095 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2922 of 3095 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to e8780c5889ba218f01b6e7f1a683b93d66d11d7ae1a19eb56e4c075f0c14297a
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 3000 of 3095 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to dccf08ffa08447c2c6f24a0c783d4967a30a6c9e85ab4a1f5c27fef61560210e
NOTE: Setscene tasks completed
NOTE: Running task 3065 of 3095 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libpcre2-10.36-r0: task do_configure: Succeeded
NOTE: Running task 3080 of 3095 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_compile)
NOTE: recipe libpcre2-10.36-r0: task do_compile: Started
NOTE: recipe libpcre2-10.36-r0: task do_compile: Succeeded
NOTE: Running task 3081 of 3095 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_install)
NOTE: recipe libpcre2-10.36-r0: task do_install: Started
NOTE: recipe libpcre2-10.36-r0: task do_install: Succeeded
NOTE: Running task 3082 of 3095 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_package)
NOTE: Running task 3083 of 3095 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_populate_sysroot)
NOTE: recipe libpcre2-10.36-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre2-10.36-r0: task do_package: Started
NOTE: recipe libpcre2-10.36-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3084 of 3095 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe vte-0.62.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcre2-10.36-r0: task do_package: Succeeded
NOTE: Running task 3085 of 3095 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_packagedata)
NOTE: recipe libpcre2-10.36-r0: task do_packagedata: Started
NOTE: recipe libpcre2-10.36-r0: task do_packagedata: Succeeded
NOTE: Running task 3086 of 3095 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.36.bb:do_package_write_rpm)
NOTE: recipe libpcre2-10.36-r0: task do_package_write_rpm: Started
NOTE: recipe libpcre2-10.36-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vte-0.62.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3087 of 3095 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_configure)
NOTE: recipe vte-0.62.3-r0: task do_configure: Started
NOTE: recipe vte-0.62.3-r0: task do_configure: Succeeded
NOTE: Running task 3088 of 3095 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_compile)
NOTE: recipe vte-0.62.3-r0: task do_compile: Started
NOTE: recipe vte-0.62.3-r0: task do_compile: Succeeded
NOTE: Running task 3089 of 3095 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_install)
NOTE: recipe vte-0.62.3-r0: task do_install: Started
NOTE: recipe vte-0.62.3-r0: task do_install: Succeeded
NOTE: Running task 3090 of 3095 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_package)
NOTE: Running task 3091 of 3095 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_populate_sysroot)
NOTE: recipe vte-0.62.3-r0: task do_package: Started
NOTE: recipe vte-0.62.3-r0: task do_populate_sysroot: Started
NOTE: recipe vte-0.62.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vte-0.62.3-r0: task do_package: Succeeded
NOTE: Running task 3092 of 3095 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_packagedata)
NOTE: recipe vte-0.62.3-r0: task do_packagedata: Started
NOTE: recipe vte-0.62.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3093 of 3095 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_package_write_rpm)
NOTE: Running task 3094 of 3095 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_package_qa)
NOTE: recipe vte-0.62.3-r0: task do_package_write_rpm: Started
NOTE: recipe vte-0.62.3-r0: task do_package_qa: Started
NOTE: recipe vte-0.62.3-r0: task do_package_qa: Succeeded
NOTE: recipe vte-0.62.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3095 of 3095 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.62.3.bb:do_build)
NOTE: Tasks Summary: Attempted 3095 tasks of which 3062 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 32 ERROR messages shown, returning a non-zero exit code.

--===============5630361657040904191==--
